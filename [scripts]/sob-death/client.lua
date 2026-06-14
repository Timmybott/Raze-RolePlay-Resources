local ESX = exports['es_extended']:getSharedObject()

isDead = false
local deathTimer = 0
local canRespawn = false
local hasDispatched = false

-- Respawn Coordinates
local respawnCoords = vector4(-345.4378, -609.1199, 37.3385, 303.9270)

local function secondsToClock(seconds)
    local mins = math.floor(seconds / 60)
    local secs = seconds % 60
    return string.format("%02d:%02d", mins, secs)
end

local function StartDeathTimer()
    if deathTimer > 0 then return end
    
    deathTimer = 600
    canRespawn = false
    hasDispatched = false
    
    local hexColor = "#6600cc"
    local success, result = pcall(function()
        -- Manche Exports geben den Hex-String direkt zurück, manche ein Table
        local color = exports['ZSX_UIV2']:GetColor("rgb")
        if type(color) == "table" then
            return string.format("#%02x%02x%02x", color.r or color[1], color.g or color[2], color.b or color[3])
        end
        return color
    end)
    if success and result then hexColor = result end
    
    SendNUIMessage({
        type = 'show',
        respawnTime = secondsToClock(deathTimer),
        color = hexColor
    })

    CreateThread(function()
        while isDead and deathTimer > 0 do
            Wait(1000)
            deathTimer = deathTimer - 1
            SendNUIMessage({
                type = 'updateTimer',
                respawnTime = secondsToClock(deathTimer),
                isFinished = false
            })
        end
        
        if isDead then
            canRespawn = true
            SendNUIMessage({
                type = 'updateTimer',
                respawnTime = 'BEREIT ZUM RESPAWN (E)',
                isFinished = true
            })
        end
    end)
end

-- Death Cam
local cam = nil
local angleY = 0.0
local angleZ = 0.0

local function StartDeathCam()
    if cam then return end
    ClearFocus()
    local playerPed = PlayerPedId()
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(playerPed), 0, 0, 0, GetGameplayCamFov())
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, false)
end

local function EndDeathCam()
    ClearFocus()
    RenderScriptCams(false, false, 0, true, false)
    if cam then
        DestroyCam(cam, false)
        cam = nil
    end
end

local function ProcessCamControls()
    if not cam then return end
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    DisableFirstPersonCamThisFrame()
    
    local mouseX = GetDisabledControlNormal(1, 1) * 8.0
    local mouseY = GetDisabledControlNormal(1, 2) * 8.0
    
    angleZ = angleZ - mouseX 
    angleY = angleY + mouseY 
    if (angleY > 89.0) then angleY = 89.0 elseif (angleY < -89.0) then angleY = -89.0 end
    
    local pCoords = GetEntityCoords(PlayerPedId())
    local maxRadius = 6.0
    
    local offset = {
        x = ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * maxRadius,
        y = ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * maxRadius,
        z = ((Sin(angleY))) * maxRadius
    }
    
    local pos = {
        x = pCoords.x + offset.x,
        y = pCoords.y + offset.y,
        z = pCoords.z + offset.z
    }
    
    SetFocusArea(pos.x, pos.y, pos.z, 0.0, 0.0, 0.0)
    SetCamCoord(cam, pos.x, pos.y, pos.z)
    PointCamAtCoord(cam, playerCoords.x, playerCoords.y, playerCoords.z + 0.5)
end

-- Toggle HUD Visibility for ZSX
local function toggleZSXHud(visible)
    pcall(function()
        if exports['zsx_hud'] then
            exports['zsx_hud']:SetHudVisible(visible)
        end
        -- Fallback für andere ZSX Versionen
        TriggerEvent('zsx_hud:toggleHud', visible)
    end)
end

-- Main Loop
CreateThread(function()
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        
        if IsPedFatallyInjured(ped) and not isDead then
            isDead = true
            StartDeathTimer()
            StartDeathCam()
        elseif not IsPedFatallyInjured(ped) and isDead then
            isDead = false
            deathTimer = 0
            EndDeathCam()
            SendNUIMessage({type = 'hide'})
        end

        if isDead then
            sleep = 0
            
            -- Aggressives HUD Hiding
            for i = 0, 22 do
                if i ~= 3 then -- 3 is Cash (sometimes needed)
                    HideHudComponentThisFrame(i)
                end
            end
            
            ProcessCamControls()
            
            -- Respawn key (E)
            if canRespawn and IsControlJustReleased(0, 38) then
                TriggerServerEvent('sob-death:server:respawn')
            end
            
            -- Dispatch key (G)
            if not hasDispatched and IsControlJustReleased(0, 47) then
                hasDispatched = true
                ESX.ShowNotification("Ein Dispatch wurde abgesetzt.")
            end
        end
        Wait(sleep)
    end
end)

-- Events
AddEventHandler('esx:onPlayerDeath', function(data)
    if not isDead then
        isDead = true
        StartDeathTimer()
        StartDeathCam()
    end
end)

RegisterNetEvent('esx:onPlayerSpawn', function()
    if isDead then
        isDead = false
        deathTimer = 0
        EndDeathCam()
        SendNUIMessage({type = 'hide'})
    end
end)

RegisterNetEvent('sob-death:client:resurrect', function()
    local ped = PlayerPedId()
    
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(10) end
    
    NetworkResurrectLocalPlayer(respawnCoords.x, respawnCoords.y, respawnCoords.z, respawnCoords.w, true, false)
    SetEntityCoords(ped, respawnCoords.x, respawnCoords.y, respawnCoords.z)
    SetEntityHeading(ped, respawnCoords.w)
    
    ClearPedBloodDamage(ped)
    isDead = false
    deathTimer = 0
    canRespawn = false
    EndDeathCam()
    
    SendNUIMessage({type = 'hide'})
    
    Wait(500)
    DoScreenFadeIn(1000)
end)