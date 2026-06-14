-- Initialisierung der Tabellenstruktur
Threads = Threads or {}
Threads.Vehicles = Threads.Vehicles or {}
Threads.Vehicles.Use = false
Threads.Vehicles.StreetLabelUse = false
Threads.Vehicles.BlacklistedHashModels = {}
Threads.Vehicles.IsRadarVisible = false

Threads.Vehicles.Data = {
    vehicle = 0,
    rpm = 0,
    speed = 0,
    gear = 0,
    fuel = 0,
    engine = 0
}

-- Setze das Intervall aus der Config
if Config and Config.UI and Config.UI.Preset and Config.UI.Preset.carhud then
    Threads.Vehicles.RefreshInterval = Config.UI.Preset.carhud.refreshInterval
end

Threads.Vehicles.DirectionList = {}

-- Generierung der Himmelsrichtungen
Citizen.CreateThread(function()
    for i = 0, 360 do
        local dir = "N"
        if i >= 0 and i < 45 then dir = "N"
        elseif i >= 45 and i < 90 then dir = "NW"
        elseif i >= 90 and i < 135 then dir = "W"
        elseif i >= 135 and i < 180 then dir = "SW"
        elseif i >= 180 and i < 225 then dir = "S"
        elseif i >= 225 and i < 270 then dir = "SE"
        elseif i >= 270 and i < 315 then dir = "E"
        elseif i >= 315 and i <= 360 then dir = "NE"
        end
        Threads.Vehicles.DirectionList[i] = dir
    end

    if Config.BlacklistedVehicles then
        for modelName, _ in pairs(Config.BlacklistedVehicles) do
            Threads.Vehicles.BlacklistedHashModels[tostring(GetHashKey(modelName))] = true
        end
    end
end)

-- FUNKTION: Stra�en-Anzeige (StreetLabel)
Threads.Vehicles.StreetLabel = function()
    if not Config.UI.UseStreetLabel then return end
    Threads.Vehicles.StreetLabelUse = true
    
    Citizen.CreateThread(function()
        local distMult = (Config.Metrics == "mph") and 0.62 or 1.0
        while Threads.Vehicles.StreetLabelUse do
            local ped = Threads.Players.Data.ped
            local coords = GetEntityCoords(ped)
            local heading = math.floor(GetEntityHeading(ped))
            
            local data = {
                direction = Threads.Vehicles.DirectionList[heading] or "N",
                time = string.format("%02d:%02d", GetClockHours(), GetClockMinutes()),
                streets = GetStreetLabel(coords), -- Nutzt die im Script vorhandene Hilfsfunktion
                distance = 0
            }

            if IsWaypointActive() then
                local wp = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
                local dist = CalculateTravelDistanceBetweenPoints(coords.x, coords.y, coords.z, wp.x, wp.y, wp.z)
                data.distance = (dist / 1000) * distMult
            end

            StreetLabel.SetStreetLabelData(data)
            Wait(550)
        end
    end)
end

-- HAUPTFUNKTION: CarHud Loop
Threads.Vehicles.Init = function()
    Threads.Vehicles.Use = true
    Threads.Vehicles.IdleTime = 1000

    Citizen.CreateThread(function()
        local multiplier = (Config.Metrics == "kmh") and 3.6 or 2.236936
        
        while Threads.Vehicles.Use do
            local sleep = Threads.Vehicles.IdleTime
            local ped = (Threads.Players and Threads.Players.Data) and Threads.Players.Data.ped or PlayerPedId()
            local isInVeh = IsPedInAnyVehicle(ped, false)
            
            if isInVeh then
                sleep = 100 -- Standard-Intervall falls Config fehlt
                if Threads.Vehicles.RefreshInterval and Threads.Vehicles.RefreshInterval.current then
                    sleep = math.floor(Threads.Vehicles.RefreshInterval.current)
                end
                
                local veh = GetVehiclePedIsIn(ped, false)
                if DoesEntityExist(veh) then
                    local speed = math.floor(GetEntitySpeed(veh) * multiplier)
                    local rpm = math.floor(GetVehicleCurrentRpm(veh) * 100)
                    local gear = GetVehicleCurrentGear(veh)
                    if gear == 0 then gear = "R" end
                    local fuel = GetFuel(veh)
                    local engine = GetVehicleEngineHealth(veh) / 10

                    local data = Threads.Vehicles.Data
                    if speed ~= data.speed or rpm ~= data.rpm or gear ~= data.gear or fuel ~= data.fuel then
                        data.speed, data.rpm, data.gear, data.fuel, data.engine = speed, rpm, gear, fuel, engine

                        SendNUIMessage({
                            type = "SET_CARHUD_VALUES",
                            data = { speed = speed, rpm = rpm, gear = gear, fuel = fuel, engine = engine }
                        })
                    end
                end
            end

            -- Update StateBag
            local currentVeh = isInVeh and GetVehiclePedIsIn(ped, false) or 0
            if Threads.Vehicles.Data.vehicle ~= currentVeh then
                Threads.Vehicles.Data.vehicle = currentVeh
                LocalPlayer.state:set("isInsideVehicle", {inVeh = isInVeh, wasInterrupted = false}, true)
            end

            Wait(sleep)
        end
    end)
end

-- Handler f�r das automatische Ein/Ausblenden
AddStateBagChangeHandler("isInsideVehicle", nil, function(bagName, key, value)
    local plyId = GetPlayerServerId(PlayerId())
    if bagName ~= ("player:%s"):format(plyId) then return end
    
    local inVeh = value.inVeh
    
    -- Blacklist Check
    local model = tostring(GetEntityModel(Threads.Vehicles.Data.vehicle))
    if Threads.Vehicles.BlacklistedHashModels[model] then inVeh = false end

    -- StreetLabel Handling
    if Config.UI.UseStreetLabel then
        if inVeh then Threads.Vehicles.StreetLabel() else Threads.Vehicles.StreetLabelUse = false end
        StreetLabel.SetVisible(inVeh)
    end

    -- Radar/Minimap
    if not Config.PersistentMinimap then
        DisplayRadar(inVeh)
    end

    -- NUI Sichtbarkeit
    NUI.SetComponentVisibility("carhud", inVeh)
end)

-- Start-Bedingung
Citizen.CreateThread(function()
    while Threads.Players == nil or Threads.Players.Data == nil do Wait(100) end
    Threads.Vehicles.Init()
end)