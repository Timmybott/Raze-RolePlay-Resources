-- Raze Job Creator – Server
-- Liest die Zusatz-Job-Daten aus raze_job_data, registriert ox_inventory-Stashes
-- (Lager/Waffenlager) und verteilt die Locations an die Clients.
-- Greift NUR über offizielle Exports auf ox_inventory zu und verändert keine
-- Daten anderer Scripte.

local ESX = nil
do
    local ok, obj = pcall(function() return exports['es_extended']:getSharedObject() end)
    if ok and obj then ESX = obj end
end

local jobsData = {} -- jobName -> { locations = {...}, f5 = {...}, civ_access = bool }

-- ox_inventory-Stashes für Lager/Waffenlager registrieren
local function registerStashes()
    if GetResourceState('ox_inventory') ~= 'started' then return end
    for jobName, extra in pairs(jobsData) do
        local idx = 0
        for _, loc in ipairs(extra.locations or {}) do
            if loc.type == 'storage' or loc.type == 'armory' then
                idx = idx + 1
                local stashId = ('rjc_%s_%s_%d'):format(jobName, loc.type, idx)
                -- job_only -> nur Mitglieder dieses Jobs (Grade >= 0); sonst für alle offen.
                -- WICHTIG: kein `x and nil or y`-Idiom (liefert bei nil immer y)!
                local groups
                if loc.job_only == false then
                    groups = nil
                else
                    groups = { [jobName] = 0 }
                end
                pcall(function()
                    exports.ox_inventory:RegisterStash(
                        stashId,
                        loc.label or (jobName .. ' ' .. loc.type),
                        tonumber(loc.slots) or 50,
                        (tonumber(loc.weight) or 100) * 1000,
                        false,   -- nicht spielergebunden
                        groups
                    )
                end)
                loc._stash = stashId -- für den Client zum Öffnen
            end
        end
    end
end

local function loadJobData(cb)
    if GetResourceState('oxmysql') ~= 'started' then if cb then cb() end return end
    exports.oxmysql:query('SELECT job_name, data FROM raze_job_data', {}, function(rows)
        jobsData = {}
        if rows then
            for _, row in ipairs(rows) do
                local ok, decoded = pcall(json.decode, row.data or '{}')
                jobsData[row.job_name] = (ok and decoded) or {}
            end
        end
        registerStashes()
        TriggerClientEvent('raze_jobscreator:sync', -1, jobsData)
        print('^2[raze_jobscreator] Job-Daten geladen (' .. tostring(#(rows or {})) .. ' Jobs).^7')
        if cb then cb() end
    end)
end

AddEventHandler('onResourceStart', function(res)
    if res == GetCurrentResourceName() then
        Citizen.SetTimeout(3000, function() loadJobData() end)
    end
end)

-- Wird vom raze_adminpanel nach einem Job-Save/Delete getriggert (Server-Event)
AddEventHandler('raze_jobscreator:reload', function()
    loadJobData()
end)

-- Client holt die aktuellen Daten (z.B. nach (Re)spawn)
if lib and lib.callback then
    lib.callback.register('raze_jobscreator:getData', function(_)
        return jobsData
    end)
end

-- Hilfsfunktion: hat der Spieler Zugriff auf eine Location?
local function playerHasAccess(src, jobName, loc)
    if loc.job_only == false then return true end
    if not ESX then return false end
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer or not xPlayer.job then return false end
    return xPlayer.job.name == jobName
end

local function findLocation(jobName, locType, label)
    local extra = jobsData[jobName]
    if not extra then return nil end
    for _, loc in ipairs(extra.locations or {}) do
        if loc.type == locType and (loc.label or '') == (label or '') then return loc end
    end
    return nil
end

-- Garage: Pfand abbuchen, Fahrzeug SERVERSEITIG (temporär) spawnen und tracken.
-- Das Fahrzeug gehört dem Spieler NICHT dauerhaft – es wird nicht in der DB
-- gespeichert. Beim Einparken wird das Pfand erstattet und das Auto gelöscht.
local jobVehicles = {} -- netId -> { deposit = number, owner = identifier }

local function notifyEsx(src, msg)
    TriggerClientEvent('esx:showNotification', src, msg)
end

RegisterNetEvent('raze_jobscreator:takeVehicle', function(jobName, locType, locLabel, model)
    local src = source
    local loc = findLocation(jobName, locType, locLabel)
    if not loc then return end
    if not playerHasAccess(src, jobName, loc) then
        notifyEsx(src, 'Kein Zugriff auf diese Garage.')
        return
    end
    -- Modell + Preis NUR aus der gespeicherten Liste (kein Client-Trust beim Preis)
    local allowed, deposit = false, 0
    for _, v in ipairs(loc.vehicles or {}) do
        if v.model == model then allowed = true; deposit = tonumber(v.price) or 0; break end
    end
    if not allowed then return end
    if not ESX then return end

    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end

    -- Pfand abbuchen
    if deposit > 0 then
        local cash = xPlayer.getMoney()
        local bank = (xPlayer.getAccount('bank') and xPlayer.getAccount('bank').money) or 0
        if cash >= deposit then
            xPlayer.removeMoney(deposit)
        elseif bank >= deposit then
            xPlayer.removeAccountMoney('bank', deposit)
        else
            notifyEsx(src, ('Nicht genug Geld für das Pfand (%s$).'):format(deposit))
            return
        end
    end

    -- Serverseitig spawnen (temporär)
    local c = loc.coords or {}
    local veh = CreateVehicleServerSetter(joaat(model), 'automobile', c.x or 0.0, c.y or 0.0, c.z or 0.0, (c.w or 0.0) + 0.0)
    local tries = 0
    while not DoesEntityExist(veh) and tries < 60 do Wait(10); tries = tries + 1 end
    if not DoesEntityExist(veh) then
        if deposit > 0 then xPlayer.addMoney(deposit) end -- Pfand zurück bei Fehlschlag
        notifyEsx(src, 'Fahrzeug konnte nicht erstellt werden.')
        return
    end

    local netId = NetworkGetNetworkIdFromEntity(veh)
    jobVehicles[netId] = { deposit = deposit, owner = xPlayer.identifier }
    TriggerClientEvent('raze_jobscreator:enterVehicle', src, netId, deposit)
end)

-- Einparken: getracktes Job-Fahrzeug löschen und Pfand erstatten
RegisterNetEvent('raze_jobscreator:parkVehicle', function(netId)
    local src = source
    local info = jobVehicles[netId]
    if not info then
        notifyEsx(src, 'Das ist kein ausgeparktes Job-Fahrzeug.')
        return
    end
    local veh = NetworkGetEntityFromNetworkId(netId)
    if veh and veh ~= 0 and DoesEntityExist(veh) then DeleteEntity(veh) end
    if info.deposit and info.deposit > 0 and ESX then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then xPlayer.addMoney(info.deposit) end
    end
    jobVehicles[netId] = nil
    notifyEsx(src, info.deposit and info.deposit > 0 and ('Fahrzeug eingeparkt, Pfand (%s$) erstattet.'):format(info.deposit) or 'Fahrzeug eingeparkt.')
end)
