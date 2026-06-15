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

    -- Eindeutiges Kennzeichen setzen + bei raze_carstatus als "geliehen" registrieren,
    -- damit nur dieser Spieler das Fahrzeug ab-/aufschließen kann.
    local plate = ('JOB%05d'):format(math.random(0, 99999))
    SetVehicleNumberPlateText(veh, plate)
    pcall(function() exports.raze_carstatus:Register(plate, xPlayer.identifier) end)

    local netId = NetworkGetNetworkIdFromEntity(veh)
    jobVehicles[netId] = { deposit = deposit, owner = xPlayer.identifier, plate = plate }
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
    if info.plate then pcall(function() exports.raze_carstatus:Unregister(info.plate) end) end
    if info.deposit and info.deposit > 0 and ESX then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer then xPlayer.addMoney(info.deposit) end
    end
    jobVehicles[netId] = nil
    notifyEsx(src, info.deposit and info.deposit > 0 and ('Fahrzeug eingeparkt, Pfand (%s$) erstattet.'):format(info.deposit) or 'Fahrzeug eingeparkt.')
end)

-- ===================== F5-AKTIONSMENÜ (Phase 3) =====================
-- Welche F5-Funktionen erlaubt der Job des Spielers? (aus raze_job_data -> extra.f5)
local cuffed = {} -- [targetSrc] = true

local function jobF5(src)
    if not ESX then return {} end
    local xP = ESX.GetPlayerFromId(src)
    if not xP or not xP.job then return {} end
    local extra = jobsData[xP.job.name]
    return (extra and extra.f5) or {}
end

local function allowsF5(src, func)
    return jobF5(src)[func] == true
end

local function playersNear(a, b, dist)
    local pa, pb = GetPlayerPed(a), GetPlayerPed(b)
    if not pa or pa == 0 or not pb or pb == 0 then return false end
    return #(GetEntityCoords(pa) - GetEntityCoords(pb)) <= (dist or 5.0)
end

RegisterNetEvent('raze_jobscreator:f5:cuff', function(targetSrc)
    local src = source
    targetSrc = tonumber(targetSrc)
    if not targetSrc or targetSrc == src then return end
    if not allowsF5(src, 'cuff') then return end
    if not playersNear(src, targetSrc, 4.0) then return end
    cuffed[targetSrc] = true
    TriggerClientEvent('raze_jobscreator:f5:setCuffed', targetSrc, true)
    notifyEsx(src, 'Person gefesselt.')
end)

RegisterNetEvent('raze_jobscreator:f5:uncuff', function(targetSrc)
    local src = source
    targetSrc = tonumber(targetSrc)
    if not targetSrc then return end
    -- Entfesseln darf JEDER, dessen Job die Funktion erlaubt (jobunabhängig vom Fessler)
    if not allowsF5(src, 'uncuff') then return end
    if not cuffed[targetSrc] then notifyEsx(src, 'Diese Person ist nicht gefesselt.') return end
    if not playersNear(src, targetSrc, 4.0) then return end
    cuffed[targetSrc] = nil
    TriggerClientEvent('raze_jobscreator:f5:setCuffed', targetSrc, false)
    notifyEsx(src, 'Person entfesselt.')
end)

RegisterNetEvent('raze_jobscreator:f5:vehicle', function(targetSrc)
    local src = source
    targetSrc = tonumber(targetSrc)
    if not targetSrc then return end
    if not allowsF5(src, 'vehicle') then return end
    if not cuffed[targetSrc] then notifyEsx(src, 'Nur gefesselte Personen.') return end
    if not playersNear(src, targetSrc, 6.0) then return end
    TriggerClientEvent('raze_jobscreator:f5:toggleVehicle', targetSrc)
end)

RegisterNetEvent('raze_jobscreator:f5:search', function(targetSrc)
    local src = source
    targetSrc = tonumber(targetSrc)
    if not targetSrc then return end
    if not allowsF5(src, 'search') then return end
    if not playersNear(src, targetSrc, 4.0) then return end
    pcall(function() exports.ox_inventory:forceOpenInventory(src, 'player', targetSrc) end)
end)

ESX.RegisterServerCallback('raze_jobscreator:f5:getLicenses', function(src, cb, targetSrc)
    targetSrc = tonumber(targetSrc)
    if not targetSrc or not allowsF5(src, 'licenses') then cb({}) return end
    local xT = ESX.GetPlayerFromId(targetSrc)
    if not xT or GetResourceState('oxmysql') ~= 'started' then cb({}) return end
    exports.oxmysql:query('SELECT type FROM user_licenses WHERE owner = ?', { xT.identifier }, function(rows)
        local list = {}
        if rows then for _, r in ipairs(rows) do list[#list + 1] = r.type end end
        cb(list)
    end)
end)

-- Ausweis ansehen: zeigt dem anfragenden Spieler (src) den Ausweis des Ziels
-- über jsfour-idcard. Event-Signatur: jsfour-idcard:open(ID, targetID, type)
--   ID       = Spieler, dessen Ausweis angezeigt wird (das Ziel)
--   targetID = Spieler, der den Ausweis SEHEN soll (der Anfragende)
--   type     = nil -> kompletter Ausweis
RegisterNetEvent('raze_jobscreator:f5:idcard', function(targetSrc)
    local src = source
    targetSrc = tonumber(targetSrc)
    if not targetSrc or not allowsF5(src, 'idcard') then return end
    if not playersNear(src, targetSrc, 4.0) then return end
    if GetResourceState('jsfour-idcard') == 'started' then
        TriggerEvent('jsfour-idcard:open', targetSrc, src, nil)
    else
        notifyEsx(src, 'jsfour-idcard ist nicht gestartet.')
    end
end)

AddEventHandler('playerDropped', function()
    cuffed[source] = nil
end)
