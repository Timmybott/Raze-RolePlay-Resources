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

-- ===================== F5-AKTIONSMENÜ (Phase 3) =====================
local isCuffed = false
local cuffProp = nil

local function getClosestPlayer(radius)
    local ped = PlayerPedId()
    local pc = GetEntityCoords(ped)
    local closest, best = nil, (radius or 8.0)
    for _, pid in ipairs(GetActivePlayers()) do
        local tp = GetPlayerPed(pid)
        if tp ~= ped and tp ~= 0 then
            local d = #(pc - GetEntityCoords(tp))
            if d <= best then closest, best = pid, d end
        end
    end
    return closest and GetPlayerServerId(closest) or nil
end

local function f5Funcs()
    local extra = jobsData[playerJob.name]
    return (extra and extra.f5) or {}
end

local function needTarget()
    local t = getClosestPlayer(8.0)
    if not t then notify('Kein Spieler in der Nähe.', 'error') end
    return t
end

local function showLicenses(targetSrc)
    ESX.TriggerServerCallback('raze_jobscreator:f5:getLicenses', function(list)
        local content = (list and #list > 0) and ('- ' .. table.concat(list, '  \n- ')) or 'Keine Lizenzen.'
        lib.alertDialog({ header = 'Lizenzen', content = content, centered = true })
    end, targetSrc)
end

local function openF5()
    local f = f5Funcs()
    local options = {}
    if f.cuff then options[#options + 1] = { title = 'Fesseln', icon = 'handcuffs', onSelect = function() local t = needTarget(); if t then TriggerServerEvent('raze_jobscreator:f5:cuff', t) end end } end
    if f.uncuff then options[#options + 1] = { title = 'Entfesseln', icon = 'unlock', onSelect = function() local t = needTarget(); if t then TriggerServerEvent('raze_jobscreator:f5:uncuff', t) end end } end
    if f.drag then options[#options + 1] = { title = 'Draggen / Tragen', icon = 'person-walking', description = 'Nächste Person tragen (umschalten)', onSelect = function() ExecuteCommand('carry') end } end
    if f.vehicle then options[#options + 1] = { title = 'In/aus Fahrzeug setzen', icon = 'car-side', description = 'Nur gefesselte Personen', onSelect = function() local t = needTarget(); if t then TriggerServerEvent('raze_jobscreator:f5:vehicle', t) end end } end
    if f.search then options[#options + 1] = { title = 'Durchsuchen', icon = 'magnifying-glass', onSelect = function() local t = needTarget(); if t then TriggerServerEvent('raze_jobscreator:f5:search', t) end end } end
    if f.idcard then options[#options + 1] = { title = 'Ausweis ansehen', icon = 'id-card', onSelect = function() local t = needTarget(); if t then TriggerServerEvent('raze_jobscreator:f5:idcard', t) end end } end
    if f.licenses then options[#options + 1] = { title = 'Lizenzen ansehen', icon = 'file-contract', onSelect = function() local t = needTarget(); if t then showLicenses(t) end end } end

    if #options == 0 then
        notify('Dein Job hat keinen Zugriff auf das F5-Menü.', 'error')
        return
    end
    lib.registerContext({ id = 'rjc_f5', title = 'Job-Aktionen', options = options })
    lib.showContext('rjc_f5')
end

RegisterCommand('razejobf5', function() openF5() end, false)
RegisterKeyMapping('razejobf5', 'Job-Aktionsmenü', 'keyboard', 'F5')

-- --- Gefesselt-Status (auf dem Ziel-Client) ---
local function applyCuff()
    local ped = PlayerPedId()
    RequestAnimDict('mp_arresting')
    local t = 0
    while not HasAnimDictLoaded('mp_arresting') and t < 50 do Wait(20); t = t + 1 end
    TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, -8.0, -1, 49, 0, false, false, false)
    SetEnableHandcuffs(ped, true)
    local model = joaat('prop_cs_cuffs')
    RequestModel(model)
    local t2 = 0
    while not HasModelLoaded(model) and t2 < 50 do Wait(20); t2 = t2 + 1 end
    if HasModelLoaded(model) then
        cuffProp = CreateObject(model, 0.0, 0.0, 0.0, true, true, false)
        AttachEntityToEntity(cuffProp, ped, GetPedBoneIndex(ped, 28422), 0.05, 0.0, -0.02, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        SetModelAsNoLongerNeeded(model)
    end
    notify('Du wurdest gefesselt.', 'error')
end

local function removeCuff()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
    SetEnableHandcuffs(ped, false)
    if cuffProp then DeleteObject(cuffProp); cuffProp = nil end
    notify('Du wurdest entfesselt.', 'success')
end

RegisterNetEvent('raze_jobscreator:f5:setCuffed', function(state)
    local newState = state and true or false
    if newState == isCuffed then return end
    isCuffed = newState
    if isCuffed then applyCuff() else removeCuff() end
end)

-- Gefesselte vom Fessler ins nächste Fahrzeug setzen / herausholen
RegisterNetEvent('raze_jobscreator:f5:toggleVehicle', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        TaskLeaveVehicle(ped, GetVehiclePedIsIn(ped, false), 0)
        return
    end
    local pc = GetEntityCoords(ped)
    local target, best = nil, 6.0
    for _, v in ipairs(GetGamePool('CVehicle')) do
        local d = #(pc - GetEntityCoords(v))
        if d < best then target, best = v, d end
    end
    if not target then return end
    local seat = nil
    for s = 0, GetVehicleMaxNumberOfPassengers(target) - 1 do
        if IsVehicleSeatFree(target, s) then seat = s; break end
    end
    if seat then TaskWarpPedIntoVehicle(ped, target, seat) end
end)

-- Durchsetzung des Gefesselt-Zustands
CreateThread(function()
    while true do
        local sleep = 500
        if isCuffed then
            sleep = 0
            local ped = PlayerPedId()
            DisableControlAction(0, 24, true)  -- Angriff
            DisableControlAction(0, 25, true)  -- Zielen
            DisableControlAction(0, 47, true)  -- Waffe
            DisableControlAction(0, 23, true)  -- Fahrzeug betreten
            DisableControlAction(0, 21, true)  -- Sprinten
            DisableControlAction(0, 22, true)  -- Springen
            DisableControlAction(0, 263, true) -- Nahkampf
            if not IsPedInAnyVehicle(ped, false) then
                if HasAnimDictLoaded('mp_arresting') and not IsEntityPlayingAnim(ped, 'mp_arresting', 'idle', 3) then
                    TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, -8.0, -1, 49, 0, false, false, false)
                end
            end
        end
        Wait(sleep)
    end
end)
