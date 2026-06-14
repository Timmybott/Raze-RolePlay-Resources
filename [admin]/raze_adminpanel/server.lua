
local SERVER_URL = "http://de13.spaceify.eu:25015" -- Change to your Bot/Web URL
local API_KEY = "b7e76ebc329a28f63274b61e0ff5bdd036205f8e421f86d4" -- Muss mit FIVEM_API_KEY im Panel (fivem_config.json) übereinstimmen!
local UPDATE_SEC = 5

local function apiHeaders()
    return {
        ['Content-Type'] = 'application/json',
        ['X-Api-Key'] = API_KEY
    }
end

-- ESX optional laden: Ohne ESX laufen Status/Konsole/Commands trotzdem weiter,
-- nur Job/Geld/Inventar der Spieler fehlen dann.
local ESX = nil
do
    local ok, obj = pcall(function()
        return exports['es_extended']:getSharedObject()
    end)
    if ok and obj then
        ESX = obj
    else
        TriggerEvent('esx:getSharedObject', function(o) ESX = o end)
    end
end

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    if not ESX then
        print("^3[RazeAdmin] ESX nicht gefunden - Spieler-Details (Job/Geld/Inventar) deaktiviert.^7")
    end
end)

-- LIVE STATUS --
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(UPDATE_SEC * 1000)

        local players = {}
        local playerHandles = GetPlayers()

        for _, playerId in ipairs(playerHandles) do
            local xPlayer = ESX and ESX.GetPlayerFromId(playerId) or nil
            local pData = {
                id = tonumber(playerId),
                name = GetPlayerName(playerId),
                ping = GetPlayerPing(playerId),
                identifiers = {},
                rp_name = "Unbekannt",
                job = "Unemployed",
                money = { cash = 0, bank = 0 },
                inventory = {}
            }

            -- IDENTIFIERS
            for i = 0, GetNumPlayerIdentifiers(playerId) - 1 do
                local id = GetPlayerIdentifier(playerId, i)
                if id then
                    table.insert(pData.identifiers, id)
                end
            end

            -- POSITION (für die Live-Karte)
            local ped = GetPlayerPed(playerId)
            if ped and ped > 0 then
                local pc = GetEntityCoords(ped)
                pData.coords = {
                    x = math.floor(pc.x * 10 + 0.5) / 10,
                    y = math.floor(pc.y * 10 + 0.5) / 10,
                    z = math.floor(pc.z * 10 + 0.5) / 10
                }
            end

            if xPlayer then
                -- RP NAME
                pData.rp_name = xPlayer.getName()

                -- JOB
                if xPlayer.job then
                    pData.job = xPlayer.job.label .. " - " .. (xPlayer.job.grade_label or "")
                end

                -- BANK (Standard xPlayer.getAccount('bank'))
                local bankAcc = xPlayer.getAccount('bank')
                if bankAcc then pData.money.bank = bankAcc.money end

                -- CASH (ox_inventory: Item 'money', sonst xPlayer.getMoney())
                local moneyItem = xPlayer.getInventoryItem('money')
                if moneyItem and moneyItem.count then
                    pData.money.cash = moneyItem.count
                else
                    pData.money.cash = xPlayer.getMoney() -- Fallback
                end

                -- INVENTORY (Filter out 'money')
                if xPlayer.inventory then
                    for _, item in pairs(xPlayer.inventory) do
                        if item.count and item.count > 0 and item.name ~= 'money' then
                           table.insert(pData.inventory, {
                               label = item.label,
                               count = item.count,
                               name = item.name
                           })
                        end
                    end
                end
            end

            table.insert(players, pData)
        end

        local payload = {
            playerCount = #playerHandles,
            maxPlayers = GetConvarInt("sv_maxclients", 48),
            players = players,
            timestamp = os.time()
        }

        PerformHttpRequest(SERVER_URL .. "/api/fivem/status", function(err, text, headers) end, 'POST', json.encode(payload), apiHeaders())
    end
end)

-- VALIDATION API --
local VALIDATE_API_URL = SERVER_URL .. "/api/fivem/validate"

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local player = source
    local identifiers = GetPlayerIdentifiers(player)

    deferrals.defer()

    Citizen.Wait(0)

    deferrals.update("Prüfe Berechtigungen...")

    -- Prepare Payload
    local payload = {
        name = name,
        identifiers = identifiers
    }

    -- Send to Bot API
    PerformHttpRequest(VALIDATE_API_URL, function(err, text, headers)
        if err == 200 then
            local data = json.decode(text)
            if data then
                if data.allowed then
                    deferrals.done()
                else
                    deferrals.done(data.reason or "Verbindung abgelehnt.")
                end
            else
                print("^1[RazeAdmin] Ungültige Antwort vom Bot API.^7")
                deferrals.done("Fehler bei der Überprüfung (Ungültige Antwort).")
            end
        else
            print("^1[RazeAdmin] API Fehler: " .. tostring(err) .. "^7")
            deferrals.done("Verbindungsfehler zum Admin-System. Bitte versuche es später noch einmal.")
        end
    end, 'POST', json.encode(payload), apiHeaders())
end)

-- LAST SEEN STORAGE --
local lastSeenFile = "last_seen.json"
local lastSeenData = {}

function LoadLastSeen()
    local content = LoadResourceFile(GetCurrentResourceName(), lastSeenFile)
    if content then
        lastSeenData = json.decode(content) or {}
    end
end

function SaveLastSeen()
    SaveResourceFile(GetCurrentResourceName(), lastSeenFile, json.encode(lastSeenData), -1)
end

LoadLastSeen()

AddEventHandler('playerDropping', function(reason)
    local src = source
    local identifiers = GetPlayerIdentifiers(src)
    for _, id in ipairs(identifiers) do
        if string.find(id, "license:") or string.find(id, "steam:") then
            lastSeenData[id] = os.time()
        end
    end
    SaveLastSeen()
end)

-- ALL PLAYERS SYNC --
Citizen.CreateThread(function()
    Citizen.Wait(10000) -- 10s delay on startup
    while true do
        -- Fetch all users from DB
        local query = 'SELECT identifier, firstname, lastname, job, job_grade FROM users'
        if exports.oxmysql then
            print("^3[RazeAdmin] Starte Datenbank-Abfrage für alle Spieler...^7")
            exports.oxmysql:query(query, {}, function(result)
                if result then
                    print("^2[RazeAdmin] " .. #result .. " Spieler aus Datenbank geladen.^7")

                    -- Get Online Players for comparison
                    local onlinePlayers = {}
                    for _, pId in ipairs(GetPlayers()) do
                        local ids = GetPlayerIdentifiers(pId)
                        for _, id in ipairs(ids) do
                            onlinePlayers[id] = true
                        end
                    end

                    local allPlayers = {}
                    for _, row in ipairs(result) do
                        local lastSeenParams = "N/A"
                        -- Check valid identifier
                        if row.identifier then
                            if onlinePlayers[row.identifier] then
                                lastSeenParams = "Online"
                            elseif lastSeenData[row.identifier] then
                                lastSeenParams = os.date('%d.%m.%Y %H:%M', lastSeenData[row.identifier])
                            end
                        end

                        table.insert(allPlayers, {
                            identifier = row.identifier,
                            name = (row.firstname or "Unbekannt") .. " " .. (row.lastname or ""),
                            job = (row.job or "unemployed") .. " - " .. (row.job_grade or "0"),
                            rp_name = (row.firstname or "") .. " " .. (row.lastname or ""), -- Add explicit RP name field
                            last_seen = lastSeenParams
                        })
                    end

                    -- Send to Bot
                    PerformHttpRequest(SERVER_URL .. "/api/fivem/allplayers", function(err, text, headers)
                        if err ~= 200 then
                            print("^1[RazeAdmin] Fehler beim Senden der All-Players Liste: " .. tostring(err) .. "^7")
                        end
                    end, 'POST', json.encode(allPlayers), apiHeaders())
                else
                    print("^1[RazeAdmin] Datenbank-Abfrage gab kein Ergebnis.^7")
                end
            end)
        else
            print("^1[RazeAdmin] MySQL Objekt nicht gefunden. Stelle sicher, dass oxmysql läuft.^7")
        end

        Citizen.Wait(300000) -- Every 5 minutes
    end
end)

-- JOBS SYNC --
-- Sendet alle Jobs (inkl. Ränge) ans Panel, damit der Spieler-Editor Dropdowns füllen kann.
local function collectJobsFromEsx()
    local jobs = {}
    if ESX and ESX.GetJobs then
        local ok, jobList = pcall(function() return ESX.GetJobs() end)
        if ok and jobList then
            for name, job in pairs(jobList) do
                local grades = {}
                if job.grades then
                    for gradeKey, grade in pairs(job.grades) do
                        grades[#grades + 1] = {
                            grade = tonumber(grade.grade) or tonumber(gradeKey) or 0,
                            name = grade.name or tostring(gradeKey),
                            label = grade.label or tostring(gradeKey),
                            salary = tonumber(grade.salary) or 0
                        }
                    end
                end
                table.sort(grades, function(a, b) return a.grade < b.grade end)
                jobs[#jobs + 1] = { name = name, label = job.label or name, grades = grades }
            end
        end
    end
    table.sort(jobs, function(a, b) return string.lower(a.label or '') < string.lower(b.label or '') end)
    return jobs
end

local function collectJobsFromDb(cb)
    if not exports.oxmysql then cb({}) return end
    exports.oxmysql:query('SELECT name, label FROM jobs', {}, function(jobRows)
        if not jobRows then cb({}) return end
        exports.oxmysql:query('SELECT job_name, grade, name, label, salary FROM job_grades', {}, function(gradeRows)
            local byName = {}
            local jobs = {}
            for _, row in ipairs(jobRows) do
                local entry = { name = row.name, label = row.label or row.name, grades = {} }
                byName[row.name] = entry
                jobs[#jobs + 1] = entry
            end
            if gradeRows then
                for _, g in ipairs(gradeRows) do
                    local entry = byName[g.job_name]
                    if entry then
                        entry.grades[#entry.grades + 1] = {
                            grade = tonumber(g.grade) or 0,
                            name = g.name or tostring(g.grade),
                            label = g.label or tostring(g.grade),
                            salary = tonumber(g.salary) or 0
                        }
                    end
                end
            end
            for _, entry in ipairs(jobs) do
                table.sort(entry.grades, function(a, b) return a.grade < b.grade end)
            end
            table.sort(jobs, function(a, b) return string.lower(a.label or '') < string.lower(b.label or '') end)
            cb(jobs)
        end)
    end)
end

local function sendJobsToPanel()
    local function post(jobs)
        if #jobs == 0 then
            print("^3[RazeAdmin] Keine Jobs gefunden (ESX/DB) - Job-Editor im Panel bleibt leer.^7")
            return
        end
        PerformHttpRequest(SERVER_URL .. "/api/fivem/jobs", function(err, text, headers)
            if err ~= 200 then
                print("^1[RazeAdmin] Fehler beim Senden der Job-Liste: " .. tostring(err) .. "^7")
            end
        end, 'POST', json.encode(jobs), apiHeaders())
    end

    local jobs = collectJobsFromEsx()
    if #jobs > 0 then
        post(jobs)
    else
        collectJobsFromDb(post)
    end
end

Citizen.CreateThread(function()
    Citizen.Wait(8000) -- ESX/DB Zeit zum Laden geben
    while true do
        sendJobsToPanel()
        Citizen.Wait(300000) -- Alle 5 Minuten aktualisieren
    end
end)

-- PLAYER ACTIONS (Spieler-Editor im Panel) --
-- ESX speichert den Identifier in der DB meist ohne "license:"-Präfix -> beide Formen abgleichen
local function normalizeIdentifier(id)
    if not id then return nil end
    id = tostring(id)
    id = id:gsub('^char%d+:', '')
    id = id:gsub('^license:', '')
    return id
end

local function findPlayerForAction(serverId, identifier)
    local target = normalizeIdentifier(identifier)
    local sid = serverId and tostring(serverId) or nil
    if sid and sid ~= '' and sid ~= 'nil' and GetPlayerName(sid) then
        if not target then return sid end
        for _, id in ipairs(GetPlayerIdentifiers(sid)) do
            if normalizeIdentifier(id) == target then return sid end
        end
    end
    -- Fallback: Spieler über Identifier suchen (Server-ID könnte sich geändert haben)
    if target then
        for _, pid in ipairs(GetPlayers()) do
            for _, id in ipairs(GetPlayerIdentifiers(pid)) do
                if normalizeIdentifier(id) == target then return pid end
            end
        end
    end
    return nil
end

local function itemExists(name)
    if ESX and ESX.Items and ESX.Items[name] then return true end
    local ok, result = pcall(function() return exports.ox_inventory:Items(name) end)
    return ok and result ~= nil
end

local function getItemLabel(name)
    if ESX and ESX.Items and ESX.Items[name] and ESX.Items[name].label then
        return ESX.Items[name].label
    end
    local ok, item = pcall(function() return exports.ox_inventory:Items(name) end)
    if ok and item and item.label then return item.label end
    return name
end

local function usesOxInventory()
    return GetResourceState ~= nil and GetResourceState('ox_inventory') == 'started'
end

-- users.inventory kann zwei Formate haben:
--   ox_inventory:  [ {slot=1, name="bread", count=2, metadata={}}, ... ]
--   Standard ESX:  { ["bread"] = 2, ... }
local function decodeInventoryColumn(raw)
    if not raw or raw == '' then return nil end
    local ok, decoded = pcall(json.decode, raw)
    if not ok or type(decoded) ~= 'table' then return nil end
    return decoded
end

local function inventoryColumnToList(decoded)
    local items = {}
    local cash = 0
    if type(decoded) ~= 'table' then return items, cash end

    if decoded[1] ~= nil then
        -- ox_inventory Slot-Array
        for _, slot in ipairs(decoded) do
            if type(slot) == 'table' and slot.name then
                local count = tonumber(slot.count) or 0
                if count > 0 then
                    if slot.name == 'money' then
                        cash = cash + count
                    else
                        items[#items + 1] = { name = slot.name, count = count, label = getItemLabel(slot.name) }
                    end
                end
            end
        end
    else
        -- Standard ESX Objekt-Map
        for name, value in pairs(decoded) do
            local count = (type(value) == 'number') and value
                or (type(value) == 'table' and tonumber(value.count)) or 0
            if count > 0 then
                if name == 'money' then
                    cash = cash + count
                else
                    items[#items + 1] = { name = name, count = count, label = getItemLabel(name) }
                end
            end
        end
    end
    return items, cash
end

-- OFFLINE-DETAILS: Panel fragt Daten eines Offline-Spielers aus der DB an --
local function handleDetailRequest(req)
    local function post(data)
        PerformHttpRequest(SERVER_URL .. "/api/fivem/player_details", function() end, 'POST',
            json.encode({ request_id = req.request_id, data = data }), apiHeaders())
    end

    if not exports.oxmysql then
        post({ found = false, error = 'oxmysql nicht verfügbar' })
        return
    end

    exports.oxmysql:query(
        'SELECT identifier, firstname, lastname, job, job_grade, accounts, inventory FROM users WHERE identifier = ? LIMIT 1',
        { req.identifier },
        function(rows)
            if not rows or not rows[1] then
                post({ found = false })
                return
            end
            local row = rows[1]

            local accounts = {}
            local okA, accDec = pcall(json.decode, row.accounts or '{}')
            if okA and type(accDec) == 'table' then accounts = accDec end

            local invDecoded = decodeInventoryColumn(row.inventory)
            local items, invCash = inventoryColumnToList(invDecoded or {})
            local cash = invCash
            if cash == 0 then cash = tonumber(accounts.money) or 0 end

            -- Job-Label auflösen
            local jobLabel = row.job or 'unemployed'
            local gradeLabel = tostring(row.job_grade or 0)
            if ESX and ESX.GetJobs then
                local okJ, jobs = pcall(function() return ESX.GetJobs() end)
                if okJ and jobs and jobs[row.job] then
                    jobLabel = jobs[row.job].label or jobLabel
                    local g = jobs[row.job].grades and jobs[row.job].grades[tostring(row.job_grade or 0)]
                    if g and g.label then gradeLabel = g.label end
                end
            end

            post({
                found = true,
                identifier = row.identifier,
                name = (row.firstname or 'Unbekannt') .. ' ' .. (row.lastname or ''),
                rp_name = (row.firstname or '') .. ' ' .. (row.lastname or ''),
                job = jobLabel .. ' - ' .. gradeLabel,
                job_name = row.job,
                job_grade = tonumber(row.job_grade) or 0,
                money = { cash = cash, bank = tonumber(accounts.bank) or 0 },
                inventory = items
            })
        end
    )
end

-- OFFLINE-AKTIONEN: Änderungen direkt in der Datenbank (Spieler nicht online) --
local function executeOfflineAction(action)
    local kind = tostring(action.action or '?')
    local params = action.params or {}
    local identifier = action.identifier

    local function done(ok, msg)
        if ok then
            print("^2[RazeAdmin] Offline-Aktion ausgeführt (DB): " .. kind .. " für " .. tostring(identifier) .. "^7")
        else
            print("^1[RazeAdmin] Offline-Aktion '" .. kind .. "' fehlgeschlagen: " .. tostring(msg) .. "^7")
        end
    end

    if not identifier then return done(false, 'Kein Identifier') end
    if not exports.oxmysql then return done(false, 'oxmysql nicht verfügbar') end

    if kind == 'set_name' then
        local newName = tostring(params.name or ''):sub(1, 50)
        if newName == '' then return done(false, 'Kein Name angegeben') end
        local firstname, lastname = newName:match('^(%S+)%s+(.+)$')
        if not firstname then firstname, lastname = newName, '' end
        exports.oxmysql:update('UPDATE users SET firstname = ?, lastname = ? WHERE identifier = ?',
            { firstname, lastname, identifier }, function() done(true) end)

    elseif kind == 'set_job' then
        local job = tostring(params.job or '')
        local grade = math.floor(tonumber(params.grade) or 0)
        if job == '' then return done(false, 'Kein Job angegeben') end
        exports.oxmysql:update('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?',
            { job, grade, identifier }, function() done(true) end)

    elseif kind == 'set_cash' or kind == 'set_bank' then
        local amount = math.max(0, math.floor(tonumber(params.amount) or 0))
        exports.oxmysql:query('SELECT accounts, inventory FROM users WHERE identifier = ? LIMIT 1', { identifier }, function(rows)
            if not rows or not rows[1] then return done(false, 'Spieler nicht in der DB gefunden') end

            local okA, accounts = pcall(json.decode, rows[1].accounts or '{}')
            if not okA or type(accounts) ~= 'table' then accounts = {} end

            local inventoryJson = nil
            if kind == 'set_bank' then
                accounts.bank = amount
            else
                accounts.money = amount
                -- Bei ox_inventory liegt Bargeld als Item 'money' im Inventar -> mitpflegen
                local decoded = decodeInventoryColumn(rows[1].inventory)
                if decoded and decoded[1] ~= nil then
                    local found = false
                    local newInv = {}
                    for _, slot in ipairs(decoded) do
                        if type(slot) == 'table' and slot.name == 'money' then
                            if not found and amount > 0 then
                                slot.count = amount
                                found = true
                                newInv[#newInv + 1] = slot
                            end
                        else
                            newInv[#newInv + 1] = slot
                        end
                    end
                    if not found and amount > 0 then
                        local maxSlot = 0
                        for _, slot in ipairs(newInv) do
                            local s = (type(slot) == 'table' and tonumber(slot.slot)) or 0
                            if s > maxSlot then maxSlot = s end
                        end
                        newInv[#newInv + 1] = { slot = maxSlot + 1, name = 'money', count = amount, metadata = {} }
                    end
                    inventoryJson = json.encode(newInv)
                end
            end

            if inventoryJson then
                exports.oxmysql:update('UPDATE users SET accounts = ?, inventory = ? WHERE identifier = ?',
                    { json.encode(accounts), inventoryJson, identifier }, function() done(true) end)
            else
                exports.oxmysql:update('UPDATE users SET accounts = ? WHERE identifier = ?',
                    { json.encode(accounts), identifier }, function() done(true) end)
            end
        end)

    elseif kind == 'add_item' or kind == 'remove_item' or kind == 'set_item' then
        local item = tostring(params.item or '')
        if item == '' then return done(false, 'Kein Item angegeben') end
        if kind == 'add_item' and not itemExists(item) then
            return done(false, "Item '" .. item .. "' existiert nicht (Spawnname prüfen)")
        end

        exports.oxmysql:query('SELECT inventory FROM users WHERE identifier = ? LIMIT 1', { identifier }, function(rows)
            if not rows or not rows[1] then return done(false, 'Spieler nicht in der DB gefunden') end

            local decoded = decodeInventoryColumn(rows[1].inventory) or {}
            local isArray = (decoded[1] ~= nil) or (next(decoded) == nil and usesOxInventory())

            -- Aktuelle Anzahl ermitteln
            local current = 0
            if isArray then
                for _, slot in ipairs(decoded) do
                    if type(slot) == 'table' and slot.name == item then
                        current = current + (tonumber(slot.count) or 0)
                    end
                end
            else
                local v = decoded[item]
                current = (type(v) == 'number') and v or (type(v) == 'table' and tonumber(v.count)) or 0
            end

            -- Zielanzahl berechnen
            local target
            if kind == 'add_item' then
                target = current + math.max(1, math.floor(tonumber(params.count) or 1))
            elseif kind == 'remove_item' then
                local removeCount = tonumber(params.count)
                target = removeCount and math.max(0, current - math.floor(removeCount)) or 0
            else
                target = math.max(0, math.floor(tonumber(params.count) or 0))
            end

            if isArray then
                local newInv = {}
                local applied = false
                for _, slot in ipairs(decoded) do
                    if type(slot) == 'table' and slot.name == item then
                        -- Mehrfach-Slots desselben Items werden zusammengeführt
                        if not applied and target > 0 then
                            slot.count = target
                            applied = true
                            newInv[#newInv + 1] = slot
                        end
                    else
                        newInv[#newInv + 1] = slot
                    end
                end
                if not applied and target > 0 then
                    local maxSlot = 0
                    for _, slot in ipairs(newInv) do
                        local s = (type(slot) == 'table' and tonumber(slot.slot)) or 0
                        if s > maxSlot then maxSlot = s end
                    end
                    newInv[#newInv + 1] = { slot = maxSlot + 1, name = item, count = target, metadata = {} }
                end
                decoded = newInv
            else
                if target > 0 then decoded[item] = target else decoded[item] = nil end
            end

            local encoded = json.encode(decoded)
            -- Leere Lua-Tabelle wird zu '[]' kodiert; Standard-ESX erwartet aber '{}'
            if not isArray and encoded == '[]' then encoded = '{}' end
            exports.oxmysql:update('UPDATE users SET inventory = ? WHERE identifier = ?',
                { encoded, identifier }, function() done(true) end)
        end)
    else
        done(false, 'Unbekannte Aktion: ' .. kind)
    end
end

local function executePlayerAction(action)
    local kind = tostring(action.action or "?")
    local params = action.params or {}

    local sid = findPlayerForAction(action.id, action.identifier)

    -- KICK: Spieler vom Server werfen (braucht kein ESX). Bei Bans schickt das Panel
    -- ebenfalls eine 'kick'-Aktion mit der Ban-Nachricht; die Reconnect-Sperre läuft
    -- über die Validierung (Banlist) im Bot.
    if kind == "kick" then
        if sid then
            DropPlayer(sid, params.message or "Du wurdest vom Server entfernt.")
            print("^2[RazeAdmin] Spieler " .. tostring(sid) .. " wurde gekickt/gebannt.^7")
        else
            print("^3[RazeAdmin] Kick/Ban: Spieler " .. tostring(action.id) .. " ist nicht mehr online.^7")
        end
        return
    end

    if not sid then
        -- Spieler offline -> Änderung direkt in der Datenbank durchführen
        if action.identifier then
            executeOfflineAction(action)
        else
            print("^1[RazeAdmin] Aktion '" .. kind .. "': Spieler " .. tostring(action.id) .. " ist nicht (mehr) online.^7")
        end
        return
    end
    if not ESX then
        print("^1[RazeAdmin] Aktion '" .. kind .. "': ESX nicht verfügbar.^7")
        return
    end
    local xPlayer = ESX.GetPlayerFromId(sid)
    if not xPlayer then
        print("^1[RazeAdmin] Aktion '" .. kind .. "': ESX-Spieler " .. tostring(sid) .. " nicht gefunden.^7")
        return
    end

    local playerName = GetPlayerName(sid) or sid
    local ok, err = pcall(function()
        if kind == "set_job" then
            local job = tostring(params.job or "")
            local grade = math.floor(tonumber(params.grade) or 0)
            if job == "" then error("Kein Job angegeben") end
            xPlayer.setJob(job, grade)

        elseif kind == "set_cash" then
            local amount = math.max(0, math.floor(tonumber(params.amount) or 0))
            -- Bargeld kann je nach Setup Item 'money' (ox_inventory) oder Account sein
            local moneyItem = xPlayer.getInventoryItem('money')
            if moneyItem and moneyItem.count ~= nil then
                local diff = amount - (moneyItem.count or 0)
                if diff > 0 then
                    xPlayer.addInventoryItem('money', diff)
                elseif diff < 0 then
                    xPlayer.removeInventoryItem('money', -diff)
                end
            else
                xPlayer.setMoney(amount)
            end

        elseif kind == "set_bank" then
            local amount = math.max(0, math.floor(tonumber(params.amount) or 0))
            xPlayer.setAccountMoney('bank', amount)

        elseif kind == "set_name" then
            local newName = tostring(params.name or ""):sub(1, 50)
            if newName == "" then error("Kein Name angegeben") end
            -- Live setzen, falls die ESX-Version es unterstützt
            if xPlayer.setName then pcall(function() xPlayer.setName(newName) end) end
            -- Dauerhaft in der DB speichern (firstname/lastname)
            local firstname, lastname = newName:match("^(%S+)%s+(.+)$")
            if not firstname then firstname, lastname = newName, "" end
            if exports.oxmysql then
                exports.oxmysql:update('UPDATE users SET firstname = ?, lastname = ? WHERE identifier = ?',
                    { firstname, lastname, xPlayer.identifier })
            end

        elseif kind == "add_item" then
            local item = tostring(params.item or "")
            local count = math.max(1, math.floor(tonumber(params.count) or 1))
            if item == "" then error("Kein Item angegeben") end
            if not itemExists(item) then
                error("Item '" .. item .. "' existiert nicht (Spawnname prüfen)")
            end
            if xPlayer.canCarryItem and not xPlayer.canCarryItem(item, count) then
                error(playerName .. " kann " .. count .. "x " .. item .. " nicht tragen")
            end
            xPlayer.addInventoryItem(item, count)

        elseif kind == "remove_item" then
            local item = tostring(params.item or "")
            if item == "" then error("Kein Item angegeben") end
            local current = xPlayer.getInventoryItem(item)
            local have = (current and current.count) or 0
            if have > 0 then
                local removeCount = math.floor(tonumber(params.count) or have)
                xPlayer.removeInventoryItem(item, math.min(removeCount, have))
            end

        elseif kind == "set_item" then
            local item = tostring(params.item or "")
            local target = math.max(0, math.floor(tonumber(params.count) or 0))
            if item == "" then error("Kein Item angegeben") end
            local current = xPlayer.getInventoryItem(item)
            local have = (current and current.count) or 0
            local diff = target - have
            if diff > 0 then
                if not itemExists(item) then
                    error("Item '" .. item .. "' existiert nicht")
                end
                if xPlayer.canCarryItem and not xPlayer.canCarryItem(item, diff) then
                    error(playerName .. " kann " .. diff .. "x " .. item .. " nicht zusätzlich tragen")
                end
                xPlayer.addInventoryItem(item, diff)
            elseif diff < 0 then
                xPlayer.removeInventoryItem(item, -diff)
            end

        else
            error("Unbekannte Aktion: " .. kind)
        end
    end)

    if ok then
        print("^2[RazeAdmin] Panel-Aktion ausgeführt: " .. kind .. " für " .. playerName .. " (ID " .. tostring(sid) .. ")^7")
    else
        print("^1[RazeAdmin] Panel-Aktion '" .. kind .. "' fehlgeschlagen: " .. tostring(err) .. "^7")
    end
end

-- CONSOLE OUTPUT CAPTURE --
-- Fängt die komplette Server-Konsole ab und sendet sie gebündelt ans Panel (Live-Konsole).
local consoleBuffer = {}
local MAX_CONSOLE_BUFFER = 500

if type(RegisterConsoleListener) == 'function' then
    RegisterConsoleListener(function(channel, message)
        if message and message ~= '' then
            consoleBuffer[#consoleBuffer + 1] = {
                channel = tostring(channel or ''),
                message = tostring(message)
            }
            -- Buffer begrenzen, falls das Panel nicht erreichbar ist
            if #consoleBuffer > MAX_CONSOLE_BUFFER then
                table.remove(consoleBuffer, 1)
            end
        end
    end)
else
    Citizen.CreateThread(function()
        Citizen.Wait(3000)
        print("^3[RazeAdmin] RegisterConsoleListener nicht verfügbar - Server-Logs werden nicht ans Panel übertragen (FXServer-Update empfohlen).^7")
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000)
        if #consoleBuffer > 0 then
            local batch = consoleBuffer
            consoleBuffer = {}
            PerformHttpRequest(SERVER_URL .. "/api/fivem/console", function(err, text, headers)
                -- Bei Fehler werden die Zeilen verworfen, um einen Endlos-Stau zu vermeiden
            end, 'POST', json.encode({ lines = batch }), apiHeaders())
        end
    end
end)

-- JOB-MITARBEITER: Panel fragt alle Mitarbeiter eines Jobs an --
local function handleJobEmployeesRequest(req)
    local jobName = req.job
    local function post(data)
        PerformHttpRequest(SERVER_URL .. "/api/fivem/job_employees", function() end, 'POST',
            json.encode({ request_id = req.request_id, data = data }), apiHeaders())
    end
    if not jobName or not exports.oxmysql then
        post({ job = jobName, employees = {} })
        return
    end
    -- Online-Spieler nach (normalisiertem) Identifier indexieren
    local online = {}
    for _, pid in ipairs(GetPlayers()) do
        for _, id in ipairs(GetPlayerIdentifiers(pid)) do
            online[normalizeIdentifier(id)] = pid
        end
    end
    exports.oxmysql:query(
        'SELECT identifier, firstname, lastname, job_grade FROM users WHERE job = ?',
        { jobName },
        function(rows)
            local employees = {}
            if rows then
                for _, row in ipairs(rows) do
                    local sid = online[normalizeIdentifier(row.identifier)]
                    employees[#employees + 1] = {
                        identifier = row.identifier,
                        name = (row.firstname or 'Unbekannt') .. ' ' .. (row.lastname or ''),
                        grade = tonumber(row.job_grade) or 0,
                        online = sid ~= nil,
                        server_id = sid and tonumber(sid) or nil
                    }
                end
            end
            post({ job = jobName, employees = employees })
        end
    )
end

-- COMMAND POLLING --
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2000) -- Check every 2 seconds to reduce load
        PerformHttpRequest(SERVER_URL .. "/api/fivem/commands", function(err, text, headers)
            if err == 200 and text then
                local data = json.decode(text)
                if data and data.commands then
                    for _, cmd in ipairs(data.commands) do
                        print("^3[RazeAdmin] Führe Remote-Befehl aus: " .. cmd .. "^7")
                        ExecuteCommand(cmd)
                    end
                end
                if data and data.actions then
                    for _, action in ipairs(data.actions) do
                        executePlayerAction(action)
                    end
                end
                if data and data.detail_requests then
                    for _, req in ipairs(data.detail_requests) do
                        handleDetailRequest(req)
                    end
                end
                if data and data.job_employee_requests then
                    for _, req in ipairs(data.job_employee_requests) do
                        handleJobEmployeesRequest(req)
                    end
                end
            end
        end, 'GET', '', { ['X-Api-Key'] = API_KEY })
    end
end)
