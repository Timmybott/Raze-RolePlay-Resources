local function setStatusesFull()
    TriggerEvent('esx_status:set', 'hunger', 1000000)
    TriggerEvent('esx_status:set', 'thirst', 1000000)
end

-- Schutz gegen Doppel-Revive: Der Server feuert pro Revive ZWEI Events
-- (esx_ambulancejob:revive UND esx_ambulance:revive). Beide landen hier in
-- doRevive(). Ohne Sperre würde der Resurrect doppelt laufen und einen Klon-Ped
-- des Spielers hinterlassen. Wir ignorieren daher alle weiteren Aufrufe innerhalb
-- eines kurzen Zeitfensters.
local lastRevive = 0

local function doRevive()
    local now = GetGameTimer()
    if now - lastRevive < 2000 then return end
    lastRevive = now

    local playerPed = PlayerPedId()
    -- Sterbeposition/-richtung merken, BEVOR der Resurrect etwas verschiebt,
    -- damit der Spieler exakt dort aufwacht, wo er gestorben ist (keine "Zeitreise").
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)

    DoScreenFadeOut(800)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end

    -- 6. Parameter MUSS false sein: Mit true springt der Resurrect auf eine
    -- frühere Netzwerk-Position zurück (= der "Zeitreise"-Bug).
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
    -- Position zusätzlich hart setzen, damit der Spieler garantiert an der
    -- Sterbestelle aufwacht (gleicher Ansatz wie sob-death).
    SetEntityCoords(playerPed, coords.x, coords.y, coords.z, false, false, false, false)
    SetEntityHeading(playerPed, heading)

    ClearPedTasksImmediately(playerPed)
    ClearPedBloodDamage(playerPed)
    SetEntityHealth(playerPed, 200)
    SetPedArmour(playerPed, 0)
    setStatusesFull()
    DoScreenFadeIn(800)
    TriggerEvent('playerSpawned')
end

local function doHeal(kind)
    local playerPed = PlayerPedId()
    local health = GetEntityHealth(playerPed)
    local targetHealth = 200
    if kind == 'small' then
        targetHealth = math.min(health + 25, 200)
    end
    SetEntityHealth(playerPed, targetHealth)
end

RegisterNetEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function()
    doRevive()
end)

RegisterNetEvent('esx_ambulance:revive')
AddEventHandler('esx_ambulance:revive', function()
    doRevive()
end)

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(kind)
    doHeal(kind)
end)

RegisterNetEvent('esx_ambulance:heal')
AddEventHandler('esx_ambulance:heal', function(kind)
    doHeal(kind)
end)
