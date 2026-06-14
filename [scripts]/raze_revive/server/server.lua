local ESX
if GetResourceState('es_extended') == 'started' then
    if exports and exports['es_extended'] and exports['es_extended'].getSharedObject then
        ESX = exports['es_extended']:getSharedObject()
    end
end
if not ESX then
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

local function reviveTarget(target)
    if target and tonumber(target) and GetPlayerName(target) then
        TriggerClientEvent('esx_ambulancejob:revive', target)
        TriggerClientEvent('esx_ambulance:revive', target)
    end
end

local function healTarget(target, kind)
    if target and tonumber(target) and GetPlayerName(target) then
        TriggerClientEvent('esx_ambulancejob:heal', target, kind or 'big')
        TriggerClientEvent('esx_ambulance:heal', target, kind or 'big')
    end
end

RegisterCommand('revive', function(source, args)
    local src = source
    if src ~= 0 and not IsPlayerAceAllowed(src, 'command.revive') then
        return
    end
    local target = tonumber(args[1]) or src
    reviveTarget(target)
end, true)

RegisterCommand('heal', function(source, args)
    local src = source
    if src ~= 0 and not IsPlayerAceAllowed(src, 'command.revive') then
        return
    end
    local target = tonumber(args[1]) or src
    local kind = args[2] or 'big'
    healTarget(target, kind)
end, true)

RegisterServerEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function(target)
    local src = source
    if src ~= 0 and target ~= src and not IsPlayerAceAllowed(src, 'command.revive') then
        return
    end
    reviveTarget(target or src)
end)

RegisterServerEvent('esx_ambulance:revive')
AddEventHandler('esx_ambulance:revive', function(target)
    local src = source
    if src ~= 0 and target ~= src and not IsPlayerAceAllowed(src, 'command.revive') then
        return
    end
    reviveTarget(target or src)
end)

RegisterServerEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(target, kind)
    local src = source
    if src ~= 0 and target ~= src and not IsPlayerAceAllowed(src, 'command.revive') then
        return
    end
    healTarget(target or src, kind or 'big')
end)

RegisterServerEvent('esx_ambulance:heal')
AddEventHandler('esx_ambulance:heal', function(target, kind)
    local src = source
    if src ~= 0 and target ~= src and not IsPlayerAceAllowed(src, 'command.revive') then
        return
    end
    healTarget(target or src, kind or 'big')
end)
