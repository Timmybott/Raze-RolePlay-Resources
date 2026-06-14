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
local currentLoc = nil   -- aktuell angezeigte Location (für TextUI)

-- ESX-TextUI (Standard-Anzeige) statt ox_lib
local function showText(msg)
    if ESX and ESX.TextUI then ESX.TextUI(msg)
    elseif GetResourceState('esx_textui') == 'started' then exports['esx_textui']:TextUI(msg) end
end
local function hideText()
    if ESX and ESX.HideUI then ESX.HideUI()
    elseif GetResourceState('esx_textui') == 'started' then exports['esx_textui']:HideUI() end
end
local function notify(msg, t)
    if ESX and ESX.ShowNotification then ESX.ShowNotification(msg)
    elseif lib then lib.notify({ description = msg, type = t or 'inform' }) end
end

local function hexToRgb(hex)
    if type(hex) ~= 'string' then return 255, 78, 0 end
    hex = hex:gsub('#', '')
    if #hex < 6 then return 255, 78, 0 end
    return tonumber(hex:sub(1, 2), 16) or 255, tonumber(hex:sub(3, 4), 16) or 78, tonumber(hex:sub(5, 6), 16) or 0
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
                ESX.Game.DeleteVehicle(veh)
                notify('Fahrzeug eingeparkt.')
            else
                notify('Du sitzt in keinem Fahrzeug.', 'error')
            end
            menu.close()
        else
            TriggerServerEvent('raze_jobscreator:takeVehicle', jobName, loc.type, loc.label or '', data.current.value, data.current.price)
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

-- --- Marker + Näherungs-TextUI (ein Loop, ESX-Style) ---
CreateThread(function()
    while true do
        local sleep = 1000
        local pc = GetEntityCoords(PlayerPedId())
        local nearest, nearestDist = nil, 999.0
        for jobName, extra in pairs(jobsData) do
            local r, g, b = hexToRgb(extra.color)
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
            if currentLoc ~= nearest.loc then
                showText('[E] ' .. (nearest.loc.label and nearest.loc.label or (TYPE_TEXT[nearest.loc.type] or 'Interagieren')))
                currentLoc = nearest.loc
            end
            if IsControlJustReleased(0, 38) then -- E
                interact(nearest.job, nearest.loc)
            end
        elseif currentLoc then
            hideText()
            currentLoc = nil
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

-- Job-Fahrzeug spawnen (vom Server bestätigt)
RegisterNetEvent('raze_jobscreator:spawnVehicle', function(model, coords)
    local hash = joaat(model)
    RequestModel(hash)
    local t = 0
    while not HasModelLoaded(hash) and t < 100 do Wait(50); t = t + 1 end
    if not HasModelLoaded(hash) then notify('Fahrzeugmodell konnte nicht geladen werden.', 'error') return end
    local c = coords or {}
    local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
    local veh = CreateVehicle(hash, c.x or px, c.y or py, c.z or pz, c.w or 0.0, true, false)
    SetModelAsNoLongerNeeded(hash)
    SetVehicleNumberPlateText(veh, 'JOB ' .. math.random(100, 999))
    SetPedIntoVehicle(PlayerPedId(), veh, -1)
    notify('Fahrzeug ausgegeben.', 'success')
end)
