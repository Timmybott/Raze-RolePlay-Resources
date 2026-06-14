local function setStatusesFull()
    TriggerEvent('esx_status:set', 'hunger', 1000000)
    TriggerEvent('esx_status:set', 'thirst', 1000000)
end

local function doRevive()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    DoScreenFadeOut(800)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, GetEntityHeading(playerPed), true, true)
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
