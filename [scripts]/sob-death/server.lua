local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('sob-death:server:respawn', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end

    -- Remove all items EXCEPT money
    local inventory = xPlayer.getInventory()
    for k, v in pairs(inventory) do
        -- Skip money and black_money (common for ox_inventory/ESX)
        if v.name ~= "money" and v.name ~= "black_money" and v.count > 0 then
            xPlayer.removeInventoryItem(v.name, v.count)
        end
    end

    -- Remove all weapons
    for k, v in pairs(xPlayer.getLoadout()) do
        xPlayer.removeWeapon(v.name)
    end

    TriggerClientEvent('sob-death:client:resurrect', source)
end)
