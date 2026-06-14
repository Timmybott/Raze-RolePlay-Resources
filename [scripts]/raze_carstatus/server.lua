-- raze_carstatus – Server
-- Verwaltet, welche Fahrzeuge (per Kennzeichen) einem Spieler "gehören":
--   * gekaufte Fahrzeuge  -> owned_vehicles (DB)
--   * geliehene Job-Fahrzeuge / gemietete Fahrzeuge -> per Export/Event registriert
-- Nur diese dürfen vom jeweiligen Spieler ab-/aufgeschlossen werden.

local ESX = exports['es_extended']:getSharedObject()

-- Kennzeichen (getrimmt) -> Besitzer-Identifier  (temporäre Fahrzeuge: Job/Miete)
local registered = {}

local function trimPlate(p)
    if not p then return '' end
    return (tostring(p):gsub('^%s*(.-)%s*$', '%1'))
end

-- Exports für serverseitige Resources (z.B. raze_jobscreator)
exports('Register', function(plate, identifier)
    if plate and identifier then registered[trimPlate(plate)] = identifier end
end)

exports('Unregister', function(plate)
    if plate then registered[trimPlate(plate)] = nil end
end)

-- Events für clientseitige Resources (z.B. ry_rent), Besitzer = aufrufender Spieler
RegisterNetEvent('raze_carstatus:register', function(plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and plate then registered[trimPlate(plate)] = xPlayer.identifier end
end)

RegisterNetEvent('raze_carstatus:unregister', function(plate)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer and plate then
        local p = trimPlate(plate)
        if registered[p] == xPlayer.identifier then registered[p] = nil end
    end
end)

-- Liefert alle Kennzeichen, die dem Spieler gehören (Temp + gekauft)
ESX.RegisterServerCallback('raze_carstatus:getMyPlates', function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then cb({}) return end
    local id = xPlayer.identifier

    local plates = {}
    for plate, owner in pairs(registered) do
        if owner == id then plates[#plates + 1] = plate end
    end

    if GetResourceState('oxmysql') == 'started' then
        exports.oxmysql:query('SELECT plate FROM owned_vehicles WHERE owner = ?', { id }, function(rows)
            if rows then
                for _, r in ipairs(rows) do plates[#plates + 1] = trimPlate(r.plate) end
            end
            cb(plates)
        end)
    else
        cb(plates)
    end
end)

-- Aufräumen, wenn ein Spieler geht (zurückgelassene Temp-Fahrzeuge)
AddEventHandler('esx:playerDropped', function(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer then return end
    local id = xPlayer.identifier
    for plate, owner in pairs(registered) do
        if owner == id then registered[plate] = nil end
    end
end)
