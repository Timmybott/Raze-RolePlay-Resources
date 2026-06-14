
-- Made by Dabbzz

if not Config.UseSeatbelt then
    return debugPrint('[^2ADDON^7] Disabling initialization of seatbelt [/]')
end


---@type vector3 Previous frame's vehicle velocity for acceleration calculations
local lastVelocity = vector3(0, 0, 0)

---@type boolean Flag to prevent multiple seatbelt threads from running simultaneously
local seatbeltThreadActive = false

Citizen.CreateThread(function()
    Wait(1000)
    LocalPlayer.state:set('seatbeltActive', false)
    -- QBOX Variable
    LocalPlayer.state:set('seatbelt', false)
end)


---@class Seatbelt
---@field CanSwap boolean Whether seatbelt state can be toggled
---@field UnfastenTime number Time elapsed since seatbelt was unfastened (milliseconds)
---@field UnfastenThreadStarted boolean Whether the unfasten indicator thread is active
---@field UnfastenThreadBreak boolean Flag to break the unfasten indicator thread
Seatbelt = {}
Seatbelt.CanSwap = true
Seatbelt.UnfastenTime = 0
Seatbelt.UnfastenThreadStarted = false
Seatbelt.UnfastenThreadBreak = false

---@section Physics-Based Ejection System

---Vehicle ejection system based on realistic deceleration physics
---Only ejects during actual crashes (deceleration events)
---@async
---@since 1.0.0
Citizen.CreateThread(function()
    local lastEjectionTime = 0

    local metricsMultiplier = Config.Metrics == 'kmh' and 3.6 or 2.236936
    local accelerationThreshold = Config.Seatbelts.MinimalAcceleration / 100
    local minSpeedThreshold = Config.Seatbelts.MinSpeed * 0.7
    local maxBaseDamage = Config.Seatbelts.MinimumDamage * 5

    -- Cache vehicle class to avoid repeated calls
    local cachedVehicle = 0
    local cachedVehicleClass = -1
    local frameCounter = 0

    while true do
        local vehicle = Threads.Vehicles.Data['vehicle']
        local isInVehicle = vehicle ~= 0

        if isInVehicle then
            if vehicle ~= cachedVehicle then
                cachedVehicle = vehicle
                cachedVehicleClass = GetVehicleClass(vehicle)
            end

            if cachedVehicleClass ~= 8 and cachedVehicleClass ~= 13 then
                frameCounter = frameCounter + 1

                if frameCounter >= 5 then
                    frameCounter = 0

                    if LocalPlayer.state['seatbeltActive'] then
                        lastVelocity = vector3(0, 0, 0)
                        goto continue
                    end

                    local velocity = GetEntityVelocity(vehicle)
                    local acceleration = #(velocity - lastVelocity)

                    -- Calculate forward deceleration (negative acceleration in forward direction)
                    local forwardVector = GetEntityForwardVector(vehicle)
                    local velocityChange = velocity - lastVelocity
                    local forwardDeceleration = -(velocityChange.x * forwardVector.x + velocityChange.y * forwardVector.y)

                    -- Only trigger ejection during significant DECELERATION (crashes)
                    if acceleration <= accelerationThreshold or forwardDeceleration <= 0 then
                        lastVelocity = velocity
                        goto continue
                    end

                    local currentTime = GetGameTimer()

                    if (currentTime - lastEjectionTime) <= 3000 then
                        lastVelocity = velocity
                        goto continue
                    end

                    local speed = Threads.Vehicles.Data['speed'] or (GetEntitySpeed(vehicle) * metricsMultiplier)

                    -- Additional check: ensure this is actually a crash scenario
                    -- Check if the vehicle hit something or is damaged
                    local vehicleHealth = GetVehicleEngineHealth(vehicle)
                    local hasCollisionDamage = HasEntityCollidedWithAnything(vehicle)

                    -- Only eject if there's actual collision damage or significant deceleration
                    if speed > minSpeedThreshold and (hasCollisionDamage or forwardDeceleration > accelerationThreshold * 2) then
                        lastEjectionTime = currentTime

                        debugPrint('[SEATBELT DEBUG] Crash detected - Speed:', speed, 'Deceleration:', forwardDeceleration, 'Collision:', hasCollisionDamage)

                        -- Get ped only when ejection is actually happening
                        local ped = PlayerPedId()

                        -- Cache expensive calculations
                        local vehicleVelocity = velocity
                        local forwardVector = GetEntityForwardVector(vehicle)
                        local coords = GetEntityCoords(ped)
                        local vehicleSpeed = GetEntitySpeed(vehicle)

                        -- Pre-calculate speed categories
                        local isHighSpeed = vehicleSpeed > 15.0
                        local isMediumSpeed = vehicleSpeed > 8.0

                        -- Calculate momentum retention once
                        local momentumRetention = isHighSpeed and
                            math.min(1.2, 0.8 + (vehicleSpeed * 0.02)) or
                            math.min(0.9, 0.6 + (vehicleSpeed * 0.08))

                        -- Calculate ejection position once
                        local ejectionDistance, ejectionHeight
                        if isHighSpeed then
                            ejectionDistance = math.max(3.0, vehicleSpeed * 0.4)
                            ejectionHeight = math.max(0.5, vehicleSpeed * 0.08)
                        else
                            ejectionDistance = math.max(1.0, vehicleSpeed * 0.25)
                            ejectionHeight = math.max(0.05, vehicleSpeed * 0.03)
                        end

                        local ejectionCoords = vector3(
                            coords.x + (forwardVector.x * ejectionDistance),
                            coords.y + (forwardVector.y * ejectionDistance),
                            coords.z + ejectionHeight
                        )

                        -- Immediate ejection and ragdoll
                        ClearPedTasksImmediately(ped)
                        SetEntityCoords(ped, ejectionCoords.x, ejectionCoords.y, ejectionCoords.z, false, false, false, true)
                        SetPedToRagdoll(ped, 100, 100, 0, true, true, false)

                        -- Optimized physics application thread
                        Citizen.CreateThread(function()
                            Wait(5)

                            -- Pre-calculate all momentum values
                            local forwardMomentum = vehicleVelocity.x * momentumRetention
                            local sideMomentum = vehicleVelocity.y * momentumRetention
                            local verticalMomentum = vehicleVelocity.z

                            if isHighSpeed then
                                local velocityMultiplier = math.min(2.5, 1.0 + (vehicleSpeed * 0.05))
                                local additionalForce = vehicleSpeed * 0.3

                                verticalMomentum = math.max(vehicleVelocity.z + (vehicleSpeed * 0.25), 2.0)
                                forwardMomentum = (forwardMomentum + (forwardVector.x * additionalForce)) * velocityMultiplier
                                sideMomentum = (sideMomentum + (forwardVector.y * additionalForce)) * velocityMultiplier

                                -- Simplified randomness calculation
                                local randomFactor = vehicleSpeed * 0.1
                                forwardMomentum = forwardMomentum + (math.random(-100, 100) * 0.01 * randomFactor)
                                sideMomentum = sideMomentum + (math.random(-100, 100) * 0.01 * randomFactor)
                            elseif isMediumSpeed then
                                local velocityMultiplier = 1.0 + (vehicleSpeed * 0.03)
                                local additionalForce = vehicleSpeed * 0.15

                                verticalMomentum = math.max(vehicleVelocity.z + (vehicleSpeed * 0.15), 1.0)
                                forwardMomentum = (forwardMomentum + (forwardVector.x * additionalForce)) * velocityMultiplier
                                sideMomentum = (sideMomentum + (forwardVector.y * additionalForce)) * velocityMultiplier
                            else
                                verticalMomentum = math.max(0.2, vehicleVelocity.z + 0.3)
                                forwardMomentum = forwardMomentum + (forwardVector.x * 1.5)
                                sideMomentum = sideMomentum + (forwardVector.y * 1.5)
                            end

                            SetEntityVelocity(ped, forwardMomentum, sideMomentum, verticalMomentum)
                            Wait(50)

                            -- Pre-calculate ragdoll duration
                            local ragdollDuration = isHighSpeed and
                                math.max(4000, vehicleSpeed * 200) or
                                math.max(2000, vehicleSpeed * 150)
                            SetPedToRagdoll(ped, ragdollDuration, ragdollDuration, 0, true, true, false)

                            -- Optimized damage calculation
                            local impactSeverity = math.max(acceleration * 0.125, 0.5)
                            local speedDamageMultiplier = isHighSpeed and (1.5 + (vehicleSpeed * 0.02)) or 1.0
                            local baseDamage = math.min(speed * 2.0 * speedDamageMultiplier, maxBaseDamage)
                            local impactDamage = baseDamage * impactSeverity
                            local currentHealth = GetEntityHealth(ped)
                            local newHealth = math.max(currentHealth - impactDamage, 1)
                            SetEntityHealth(ped, newHealth)

                            -- Pre-calculate shake intensity
                            local shakeIntensity = isHighSpeed and
                                math.min(0.8, math.max(0.3, vehicleSpeed * 0.05)) or
                                math.min(0.4, math.max(0.1, vehicleSpeed * 0.03))
                            ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', shakeIntensity)

                            if vehicleSpeed > 10.0 then
                                SmashVehicleWindow(vehicle, 6)
                            end
                        end)
                    end

                    lastVelocity = velocity
                end

                ::continue::
                Wait(0) -- Minimal wait when in valid vehicle
            else
                Wait(100) -- Longer wait for excluded vehicle types
            end
        else
            -- Reset cached data when not in vehicle
            cachedVehicle = 0
            cachedVehicleClass = -1
            lastVelocity = vector3(0, 0, 0)
            Wait(500) -- Much longer wait when not in vehicle
        end
    end
end)

---Event-driven seatbelt exit prevention system
---Only updates when vehicle or seatbelt state changes
---@since 2.0.0

-- Cache values
local minSpeedBase = Config.Seatbelts.MinSpeed / (Config.Metrics == 'kmh' and 3.6 or 2.236936)
local minDamage = Config.Seatbelts.MinimumDamage
local controlsDisabled = false

-- Function to update windscreen parameters with speed safety check
local function UpdateWindscreenParams(seatbeltActive, vehicleClass, vehicle)
    -- Only apply to cars (exclude motorcycles and bicycles)
    if vehicleClass == 8 or vehicleClass == 13 then
        return
    end

    if seatbeltActive then
        -- Seatbelt ON: Set extremely high values to prevent ejection and exit
        SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0)
    else
        -- Seatbelt OFF: Check vehicle speed before allowing ejection parameters
        local vehicleSpeed = GetEntitySpeed(vehicle)
        local speedInUnits = vehicleSpeed * (Config.Metrics == 'kmh' and 3.6 or 2.236936)

        -- If going too fast, delay the parameter change to prevent instant ejection
        if speedInUnits > 30 then -- Above 30 mph/kmh
            debugPrint('[SEATBELT DEBUG] Speed too high for immediate ejection params:', speedInUnits)

            -- Keep high ejection threshold temporarily
            SetFlyThroughWindscreenParams(1000.0, 1000.0, 17.0, 500.0)

            -- Gradually reduce ejection threshold as speed decreases
            Citizen.CreateThread(function()
                while not LocalPlayer.state['seatbeltActive'] and DoesEntityExist(vehicle) do
                    local currentSpeed = GetEntitySpeed(vehicle) * (Config.Metrics == 'kmh' and 3.6 or 2.236936)

                    if currentSpeed <= 30 then
                        -- Safe to enable normal ejection parameters
                        SetFlyThroughWindscreenParams(
                            minSpeedBase,
                            minSpeedBase + 5.0,
                            17.0,
                            minDamage
                        )
                        debugPrint('[SEATBELT DEBUG] Speed safe, enabling normal ejection params:', currentSpeed)
                        break
                    end

                    Wait(500) -- Check every 500ms
                end
            end)
        else
            -- Speed is safe, apply normal ejection parameters
            SetFlyThroughWindscreenParams(
                minSpeedBase,
                minSpeedBase + 5.0,
                17.0,
                minDamage
            )
        end
    end
end

-- Handle vehicle state changes
Lib.OnEventTick('onVehicleStateChange', function(isInVehicle, vehicle)
    if isInVehicle then
        local vehicleClass = GetVehicleClass(vehicle)
        local seatbeltActive = LocalPlayer.state['seatbeltActive']
        UpdateWindscreenParams(seatbeltActive, vehicleClass, vehicle)
    else
        -- Reset windscreen parameters when exiting vehicle
        ResetFlyThroughWindscreenParams()
        controlsDisabled = false
    end
end)

-- Handle seatbelt state changes
AddStateBagChangeHandler('seatbeltActive', nil, function(bag, key, value)
    if bag ~= ('player:%s'):format(GetPlayerServerId(PlayerId())) then return end

    -- Only update if in a vehicle
    local vehicle = Threads.Vehicles.Data['vehicle']
    if vehicle ~= 0 then
        local vehicleClass = GetVehicleClass(vehicle)
        UpdateWindscreenParams(value, vehicleClass, vehicle)
    end
end)

-- Minimal thread only for control disabling (must run every frame)
Citizen.CreateThread(function()
    while true do
        local vehicle = Threads.Vehicles.Data['vehicle']

        if vehicle ~= 0 then
            local vehicleClass = GetVehicleClass(vehicle)

            -- Only disable controls for cars with active seatbelt
            if vehicleClass ~= 8 and vehicleClass ~= 13 and LocalPlayer.state['seatbeltActive'] then
                DisableControlAction(0, 75, true) -- F key (exit vehicle)
                DisableControlAction(0, 23, true) -- Enter/Exit vehicle
                controlsDisabled = true
            else
                controlsDisabled = false
            end
        else
            controlsDisabled = false
        end

        -- Only wait 0 when controls need to be disabled, otherwise longer wait
        Wait(controlsDisabled and 0 or 100)
    end
end)

Seatbelt.Thread = function()
    if seatbeltThreadActive then return end
    seatbeltThreadActive = true

    Seatbelt.CanSwap = false
    Wait(250)
    if Threads.Vehicles.Data['vehicle'] == 0 then
        seatbeltThreadActive = false
        Seatbelt.CanSwap = true
        return
    end

    local class = GetVehicleClass(Threads.Vehicles.Data['vehicle'])
    if class == 8 or class == 13 then
        seatbeltThreadActive = false
        Seatbelt.CanSwap = true
        return
    end

    if not LocalPlayer.state['seatbeltActive'] then
        Seatbelt.CanSwap = true
        Seatbelt.UnfastenTime = 0
        Seatbelt.UnfastenThreadStarted = false
        Seatbelt.UnfastenThreadBreak = false

        Citizen.CreateThread(function()
            Seatbelt.UnfastenThreadStarted = true
            ---@type boolean Flag to prevent indicator spam
            local indicatorShown = false

            while not Seatbelt.UnfastenThreadBreak and
                Seatbelt.UnfastenThreadStarted and
                not LocalPlayer.state['seatbeltActive'] do
                local vehicle = Threads.Vehicles.Data['vehicle']
                if vehicle and vehicle ~= 0 then
                    local speed = GetEntitySpeed(vehicle) * (Config.Metrics == 'kmh' and 3.6 or 2.236936)

                    if speed > 10 and not indicatorShown then
                        indicatorShown = true
                        NUI.SendMessage('INDICATE_UNFASTEN_SEATBELT', {
                            state = true
                        })
                    elseif speed <= 10 and indicatorShown then
                        NUI.SendMessage('INDICATE_UNFASTEN_SEATBELT', {
                            state = false
                        })
                        indicatorShown = false
                    end
                end

                Wait(500)
            end
        end)
    end

    Seatbelt.CanSwap = true
    seatbeltThreadActive = false
end


Seatbelt.SwitchState = function()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then return end

    if not Seatbelt.CanSwap then return end

    if Threads.Vehicles.Data['vehicle'] == 0 then return end

    local class = GetVehicleClass(Threads.Vehicles.Data['vehicle'])
    if class == 8 or class == 13 then return end

    local lastState = LocalPlayer.state['seatbeltActive']
    LocalPlayer.state:set('seatbeltActive', not lastState)
    
    -- QBOX Variable
    LocalPlayer.state:set('seatbelt', not lastState)

    NUI.SendMessage('SET_CARHUD_SEATBELT', {
        state = not lastState,
        sfx = true
    })

    debugPrint('[SEATBELT] State changed to: ' .. tostring(not lastState))
end


RegisterCommand(Config.Commands['seatbelt'], Seatbelt.SwitchState)
RegisterKeyMapping(Config.Commands['seatbelt'], Config.KeyBinds['seatbelt'].description, 'KEYBOARD', Config.KeyBinds['seatbelt'].key)

local hasSeatbeltOn = false

Lib.OnEventTick('onVehicleStateChange', function(isInVehicle, entity)
    Seatbelt.Thread()

    if isInVehicle then
        SetUserRadioControlEnabled(false)
        SetVehRadioStation(Threads.Vehicles.Data['vehicle'], 'OFF')
        lastVelocity = vector3(0, 0, 0)
    elseif not isInVehicle then
        LocalPlayer.state:set('seatbeltActive', false)

        -- QBOX Variable
        LocalPlayer.state:set('seatbelt', false)

        NUI.SendMessage('SET_CARHUD_SEATBELT', {
            state = false
        })
        NUI.SendMessage('INDICATE_UNFASTEN_SEATBELT', {
            state = false
        })

        ResetFlyThroughWindscreenParams()

        Seatbelt.UnfastenTime = 0
        Seatbelt.UnfastenThreadStarted = false
        Seatbelt.UnfastenThreadBreak = false
        Seatbelt.UnfastenIndicatorState = false
        seatbeltThreadActive = false
    end
end)

AddStateBagChangeHandler('seatbeltActive', nil, function(bag, key, value)
    if bag ~= ('player:%s'):format(GetPlayerServerId(PlayerId())) then return end

    hasSeatbeltOn = value

    NUI.SendMessage('SET_CARHUD_SEATBELT', {
        state = hasSeatbeltOn,
        sfx = false
    })

    NUI.SendMessage('INDICATE_UNFASTEN_SEATBELT', {
        state = false,
    })

    if not value and IsPedInAnyVehicle(PlayerPedId(), false) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        local class = GetVehicleClass(vehicle)

        if class ~= 8 and class ~= 13 then
            Seatbelt.UnfastenTime = 0
            Seatbelt.UnfastenThreadStarted = false
            Seatbelt.UnfastenThreadBreak = false

            Citizen.CreateThread(function()
                Seatbelt.UnfastenThreadStarted = true
                local indicatorShown = false

                while not Seatbelt.UnfastenThreadBreak and
                    Seatbelt.UnfastenThreadStarted and
                    not LocalPlayer.state['seatbeltActive'] do
                    local currentVehicle = Threads.Vehicles.Data['vehicle']
                    if currentVehicle and currentVehicle ~= 0 then
                        local speed = GetEntitySpeed(currentVehicle) * (Config.Metrics == 'kmh' and 3.6 or 2.236936)

                        if speed > 10 and not indicatorShown then
                            NUI.SendMessage('INDICATE_UNFASTEN_SEATBELT', {
                                state = true
                            })
                            indicatorShown = true
                        elseif speed <= 10 and indicatorShown then
                            NUI.SendMessage('INDICATE_UNFASTEN_SEATBELT', {
                                state = false
                            })
                            indicatorShown = false
                        end
                    end

                    Wait(500) 
                end
            end)
        end
    end

    -- Debug logging if enabled
    debugPrint('[SEATBELT] StateBag changed to: ' .. tostring(value))
end)

exports('ToggleSeatbelt', function(state)
    NUI.SendMessage('SET_CARHUD_SEATBELT', {
        state = state
    })
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        ResetFlyThroughWindscreenParams()
    end
end)
