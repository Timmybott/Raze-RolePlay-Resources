-- Raze Job Creator – Client
-- Setzt die Job-Locations im Spiel um: Marker + ox_lib-Interaktion für
-- Lager, Waffenlager, Garage, Fahrzeug-Shop und Umkleide.

local ESX = nil
do
    local ok, obj = pcall(function() return exports['es_extended']:getSharedObject() end)
    if ok and obj then ESX = obj end
end

local jobsData = {}
local points = {}        -- aktive ox_lib points
local playerJob = { name = 'unemployed', grade = 0 }

-- Job-Status aus ESX spiegeln
RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    if xPlayer and xPlayer.job then playerJob = { name = xPlayer.job.name, grade = xPlayer.job.grade or 0 } end
end)
RegisterNetEvent('esx:setJob', function(job)
    if job then playerJob = { name = job.name, grade = job.grade or 0 } end
end)

local function hasAccess(jobName, loc)
    if loc.job_only == false then return true end
    return playerJob.name == jobName
end

local TYPE_ICON = {
    storage = 'box-archive', armory = 'gun', garage = 'warehouse',
    vehicleshop = 'car', cloakroom = 'shirt'
}
local TYPE_TEXT = {
    storage = 'Lager öffnen', armory = 'Waffenlager öffnen', garage = 'Garage',
    vehicleshop = 'Fahrzeug-Shop', cloakroom = 'Umkleide'
}

-- --- Interaktionen je Location-Typ ---
local function openStorage(loc)
    if not loc._stash then return end
    exports.ox_inventory:openInventory('stash', loc._stash)
end

local function openVehicleMenu(jobName, loc)
    local options = {}
    for _, v in ipairs(loc.vehicles or {}) do
        options[#options + 1] = {
            title = v.label or v.model,
            description = (tonumber(v.price) or 0) > 0 and ('Preis: ' .. v.price .. '$') or 'Kostenlos',
            icon = 'car',
            onSelect = function()
                TriggerServerEvent('raze_jobscreator:takeVehicle', jobName, loc.type, loc.label or '', v.model, v.price)
            end
        }
    end
    if #options == 0 then
        lib.notify({ type = 'error', description = 'Keine Fahrzeuge konfiguriert.' })
        return
    end
    lib.registerContext({ id = 'rjc_vehicles', title = (loc.label or TYPE_TEXT[loc.type]), options = options })
    lib.showContext('rjc_vehicles')
end

local function openCloakroom(loc)
    -- v1: öffnet das vorhandene Kleidungs-/Skin-Menü (esx_skin/skinchanger).
    -- Jobspezifische Outfits können später über raze_job_data ergänzt werden.
    if GetResourceState('esx_skin') == 'started' then
        TriggerEvent('esx_skin:openSaveableMenu', function() end, function() end)
    elseif GetResourceState('skinchanger') == 'started' then
        TriggerEvent('skinchanger:loadDefaultModel')
        lib.notify({ description = 'Umkleide: Kleidungsmenü geöffnet.' })
    else
        lib.notify({ type = 'error', description = 'Kein Kleidungs-Script (esx_skin/skinchanger) gefunden.' })
    end
end

local function interact(jobName, loc)
    if not hasAccess(jobName, loc) then
        lib.notify({ type = 'error', description = 'Du gehörst nicht zu diesem Job.' })
        return
    end
    if loc.type == 'storage' or loc.type == 'armory' then
        openStorage(loc)
    elseif loc.type == 'garage' or loc.type == 'vehicleshop' then
        openVehicleMenu(jobName, loc)
    elseif loc.type == 'cloakroom' then
        openCloakroom(loc)
    end
end

-- --- Points (Marker + Näherungs-Interaktion) ---
local function clearPoints()
    for _, p in ipairs(points) do if p.remove then p:remove() end end
    points = {}
end

local function buildPoints()
    clearPoints()
    if not lib or not lib.points then return end
    for jobName, extra in pairs(jobsData) do
        for _, loc in ipairs(extra.locations or {}) do
            local c = loc.coords or {}
            if c.x and c.y and c.z then
                local point = lib.points.new({ coords = vec3(c.x + 0.0, c.y + 0.0, c.z + 0.0), distance = 12.0, jobName = jobName, loc = loc })
                function point:onEnter()
                    lib.showTextUI(('[E] %s'):format(loc.label and (loc.label) or TYPE_TEXT[loc.type] or 'Interagieren'),
                        { icon = TYPE_ICON[loc.type] or 'circle' })
                    self.inside = true
                end
                function point:onExit()
                    lib.hideTextUI()
                    self.inside = false
                end
                function point:nearby()
                    DrawMarker(2, self.coords.x, self.coords.y, self.coords.z + 0.5, 0,0,0, 0,0,0, 0.25,0.25,0.25,
                        255, 78, 0, 150, false, true, 2, false, nil, nil, false)
                    if self.currentDistance < 1.6 and IsControlJustReleased(0, 38) then -- E
                        interact(self.jobName, self.loc)
                    end
                end
                points[#points + 1] = point
            end
        end
    end
end

RegisterNetEvent('raze_jobscreator:sync', function(data)
    jobsData = data or {}
    buildPoints()
end)

-- Beim Start aktuelle Daten holen
CreateThread(function()
    Wait(2000)
    if ESX then
        local p = ESX.GetPlayerData and ESX.GetPlayerData() or nil
        if p and p.job then playerJob = { name = p.job.name, grade = p.job.grade or 0 } end
    end
    if lib and lib.callback then
        local data = lib.callback.await('raze_jobscreator:getData', false)
        if data then jobsData = data; buildPoints() end
    end
end)

-- Job-Fahrzeug spawnen (vom Server bestätigt)
RegisterNetEvent('raze_jobscreator:spawnVehicle', function(model, coords)
    local hash = joaat(model)
    RequestModel(hash)
    local t = 0
    while not HasModelLoaded(hash) and t < 100 do Wait(50); t = t + 1 end
    if not HasModelLoaded(hash) then
        lib.notify({ type = 'error', description = 'Fahrzeugmodell konnte nicht geladen werden.' })
        return
    end
    local c = coords or {}
    local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))
    local veh = CreateVehicle(hash, c.x or px, c.y or py, c.z or pz, c.w or 0.0, true, false)
    SetModelAsNoLongerNeeded(hash)
    SetVehicleNumberPlateText(veh, 'JOB ' .. math.random(100, 999))
    SetPedIntoVehicle(PlayerPedId(), veh, -1)
    lib.notify({ type = 'success', description = 'Fahrzeug ausgegeben.' })
end)
