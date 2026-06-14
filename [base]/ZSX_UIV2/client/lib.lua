Lib = {}
Lib.RegisteredListeners = {}
Lib.Cache = {}

Lib.GetPed = function()
    return Threads.Players.Data['ped']
end

Lib.GetPlayerID = function()
    return Threads.Players.Data['player']
end

Lib.GetPlayerVehicle = function()
    return Threads.Vehicles.Data['vehicle']
end

Lib.GetVehicleData = function()
    return {
        speed = Threads.Vehicles.Data['speed']
    }
end

Lib.IsPedAiming = function()
    return Threads.Weapon.Data['isPedAiming']
end

Lib.GetCurrentPedWeapon = function()
    return Threads.Weapon.Data['weapon']
end

Lib.GetPedAmmo = function()
    return Threads.Weapon.Data['ammo']
end

Lib.OnEventTick = function(eventType, callback)
    if not Lib.RegisteredListeners[eventType] then
        Lib.RegisteredListeners[eventType] = {}
    end
    table.insert(Lib.RegisteredListeners[eventType], {
        callback = callback,
        invoker = GetCurrentResourceName()
    })
end

Lib.EventCall = function(eventType, ...)
    local listeners = Lib.RegisteredListeners[eventType]
    if not listeners then 
        return
    end

    for _, cbData in ipairs(listeners) do
        if GetCurrentResourceName() == cbData.invoker then
            cbData.callback(...)
        end
    end
end