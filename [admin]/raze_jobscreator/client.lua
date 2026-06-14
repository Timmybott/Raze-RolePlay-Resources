-- Raze Job Creator – Client
-- Job-Locations (Lager, Waffenlager, Garage, Umkleide) als 3D-Marker mit
-- ESX-TextUI (nur im Marker sichtbar) sowie Karten-Blips.

local ESX = nil
do
    local ok, obj = pcall(function() return exports['es_extended']:getSharedObject() end)
    if ok and obj then ESX = obj end
end

local jobsData = {}
local playerJob = { name = 'unemployed', grade = 0 }
local blipHandles = {}

local function notify(msg, t)
    if ESX and ESX.ShowNotification then ESX.ShowNotification(msg)
    elseif lib then lib.notify({ description = msg, type = t or 'inform' }) end
end

-- Hilfetext-Banner (oben links) über ESX, wird je Frame im Marker gezeichnet
local function drawHelp(msg)
    if ESX and ESX.ShowHelpNotification then
        ESX.ShowHelpNotification(msg, true, false)
    else
        AddTextEntry('rjc_help', msg)
        DisplayHelpTextThisFrame('rjc_help', false)
    end
end

local function hexToRgb(hex)
    if type(hex) ~= 'string' then return 255, 78, 0 end
    hex = hex:gsub('#', '')
    if #hex < 6 then return 255, 78, 0 end
    return tonumber(hex:sub(1, 2), 16) or 255, tonumber(hex:sub(3, 4), 16) or 78, tonumber(hex:sub(5, 6), 16) or 0
end

-- Angepasste Marker-Farbe via ZSX_UIV2 (falls im Job aktiviert)
local function getZsxColor()
    if GetResourceState('ZSX_UIV2') ~= 'started' then return nil end
    local ok, a, b, c = pcall(function() return exports['ZSX_UIV2']:GetColor(true) end)
    if not ok then return nil end
    if type(a) == 'number' and type(b) == 'number' and type(c) == 'number' then return a, b, c end
    if type(a) == 'table' then return a.r or a[1] or 255, a.g or a[2] or 78, a.b or a[3] or 0 end
    if type(a) == 'string' then return hexToRgb(a) end
    return nil
end

local TYPE_TEXT = { storage = 'Lager öffnen', armory = 'Waffenlager öffnen', garage = 'Garage', cloakroom = 'Umkleide' }

-- Job-Status spiegeln
RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    if xPlayer and xPlayer.job then playerJob = { name = xPlayer.job.name, grade = xPlayer.job.grade or 0 } end
    buildBlips()
end)
RegisterNetEvent('esx:setJob', function(job)
    if job then playerJob = { name = job.name, grade = job.grade or 0 } end
    buildBlips()
end)

local function hasAccess(jobName, loc)
    if loc.job_only == false then return true end
    return playerJob.name == jobName
end

-- --- Interaktionen ---
local function openStorage(loc)
    if not loc._stash then notify('Lager nicht verfügbar.', 'error') return end
    exports.ox_inventory:openInventory('stash', loc._stash)
end

local function openGarage(jobName, loc)
    if not ESX then return end
    local elements = { { label = '~r~Aktuelles Fahrzeug einparken', value = '__park__' } }
    for _, v in ipairs(loc.vehicles or {}) do
        local price = tonumber(v.price) or 0
        elements[#elements + 1] = {
            label = (v.label or v.model) .. (price > 0 and (' (' .. price .. '$)') or ''),
            value = v.model, price = price
        }
    end
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'rjc_garage', {
        title = loc.label or 'Garage', align = 'top-left', elements = elements
    }, function(data, menu)
        if data.current.value == '__park__' then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if veh ~= 0 then
                TriggerServerEvent('raze_jobscreator:parkVehicle', NetworkGetNetworkIdFromEntity(veh))
            else
                notify('Du sitzt in keinem Fahrzeug.', 'error')
            end
            menu.close()
        else
            TriggerServerEvent('raze_jobscreator:takeVehicle', jobName, loc.type, loc.label or '', data.current.value)
            menu.close()
        end
    end, function(data, menu) menu.close() end)
end

local function openCloakroom(_)
    if GetResourceState('esx_skin') == 'started' then
        TriggerEvent('esx_skin:openSaveableMenu', function() end, function() end)
    elseif GetResourceState('skinchanger') == 'started' then
        TriggerEvent('skinchanger:loadDefaultModel')
        notify('Umkleide: Kleidungsmenü geöffnet.')
    else
        notify('Kein Kleidungs-Script (esx_skin/skinchanger) gefunden.', 'error')
    end
end

local function interact(jobName, loc)
    if not hasAccess(jobName, loc) then
        notify('Du gehörst nicht zu diesem Job.', 'error')
        return
    end
    if loc.type == 'storage' or loc.type == 'armory' then openStorage(loc)
    elseif loc.type == 'garage' then openGarage(jobName, loc)
    elseif loc.type == 'cloakroom' then openCloakroom(loc) end
end

-- --- Marker + Näherungs-Hilfetext (GTA-nativ) ---
CreateThread(function()
    while true do
        local sleep = 1000
        local pc = GetEntityCoords(PlayerPedId())
        local nearest, nearestDist = nil, 999.0
        for jobName, extra in pairs(jobsData) do
            local r, g, b
            if extra.use_zsx_color then r, g, b = getZsxColor() end
            if not r then r, g, b = hexToRgb(extra.color) end
            for _, loc in ipairs(extra.locations or {}) do
                local c = loc.coords
                if c and c.x then
                    local d = #(pc - vector3(c.x + 0.0, c.y + 0.0, c.z + 0.0))
                    if d < 15.0 then
                        sleep = 0
                        DrawMarker(2, c.x + 0.0, c.y + 0.0, c.z + 0.5, 0, 0, 0, 0, 0, 0,
                            0.3, 0.3, 0.3, r, g, b, 160, false, true, 2, false, nil, nil, false)
                        if d < 1.6 and d < nearestDist then
                            nearest, nearestDist = { job = jobName, loc = loc }, d
                        end
                    end
                end
            end
        end

        if nearest then
            local label = nearest.loc.label and nearest.loc.label or (TYPE_TEXT[nearest.loc.type] or 'Interagieren')
            drawHelp('~INPUT_CONTEXT~  ' .. label)
            if IsControlJustReleased(0, 38) then -- E
                interact(nearest.job, nearest.loc)
            end
        end

        Wait(sleep)
    end
end)

-- --- Karten-Blips ---
function buildBlips()
    for _, h in ipairs(blipHandles) do if DoesBlipExist(h) then RemoveBlip(h) end end
    blipHandles = {}
    for jobName, extra in pairs(jobsData) do
        for _, b in ipairs(extra.blips or {}) do
            local visible = (b.visibility == 'all') or (playerJob.name == jobName)
            local c = b.coords
            if visible and c and c.x then
                local blip = AddBlipForCoord(c.x + 0.0, c.y + 0.0, c.z + 0.0)
                SetBlipSprite(blip, tonumber(b.sprite) or 1)
                SetBlipColour(blip, tonumber(b.color) or 0)
                SetBlipScale(blip, (tonumber(b.scale) or 0.8) + 0.0)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName(b.name or jobName)
                EndTextCommandSetBlipName(blip)
                blipHandles[#blipHandles + 1] = blip
            end
        end
    end
end

RegisterNetEvent('raze_jobscreator:sync', function(data)
    jobsData = data or {}
    buildBlips()
end)

-- Beim Start aktuelle Daten holen
CreateThread(function()
    Wait(2000)
    if ESX and ESX.GetPlayerData then
        local p = ESX.GetPlayerData()
        if p and p.job then playerJob = { name = p.job.name, grade = p.job.grade or 0 } end
    end
    if lib and lib.callback then
        local data = lib.callback.await('raze_jobscreator:getData', false)
        if data then jobsData = data end
    end
    buildBlips()
end)

-- Job-Fahrzeug (serverseitig gespawnt) betreten – Auto gehört dem Spieler NICHT,
-- es ist nur temporär (Pfand wurde hinterlegt).
RegisterNetEvent('raze_jobscreator:enterVehicle', function(netId, deposit)
    local veh = NetworkGetEntityFromNetworkId(netId)
    local tries = 0
    while (not veh or veh == 0 or not DoesEntityExist(veh)) and tries < 100 do
        Wait(20)
        veh = NetworkGetEntityFromNetworkId(netId)
        tries = tries + 1
    end
    if veh and veh ~= 0 and DoesEntityExist(veh) then
        -- Kennzeichen wird serverseitig gesetzt (für raze_carstatus); hier nur einsteigen
        SetPedIntoVehicle(PlayerPedId(), veh, -1)
        local msg = (deposit and deposit > 0) and ('Fahrzeug ausgegeben (Pfand ' .. deposit .. '$ hinterlegt).') or 'Fahrzeug ausgegeben.'
        notify(msg, 'success')
    end
end)
