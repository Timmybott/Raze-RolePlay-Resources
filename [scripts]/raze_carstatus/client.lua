-- raze_carstatus – Client
-- G  : nächstes EIGENES Fahrzeug im Umkreis von 20m ab-/aufschließen
-- M  : als Fahrer Motor an/aus (schaltet auch die Lichter aus)
-- Nur eigene/gekaufte/geliehene/gemietete Fahrzeuge lassen sich schließen.

local ESX = exports['es_extended']:getSharedObject()

local LOCK_RANGE = 20.0
local engineOff = {} -- [vehicleHandle] = true  (manuell ausgeschaltet)

local function trimPlate(p)
    if not p then return '' end
    return (tostring(p):gsub('^%s*(.-)%s*$', '%1'))
end

local function help(msg)
    if ESX and ESX.ShowHelpNotification then ESX.ShowHelpNotification(msg) end
end

local function requestControl(veh)
    if not NetworkGetEntityIsNetworked(veh) then return end
    local t = 0
    while not NetworkHasControlOfEntity(veh) and t < 30 do
        NetworkRequestControlOfEntity(veh)
        Wait(10)
        t = t + 1
    end
end

-- Kurz hupen + Lichter einmal blinken (Motorstatus bleibt unangetastet).
-- Scheinwerfer/Fernlicht werden kurz erzwungen, damit der Blitz AUCH bei
-- ausgeschaltetem Motor sichtbar ist.
local function lockEffects(veh)
    StartVehicleHorn(veh, 150, GetHashKey('HELDDOWN'), false)
    SetVehicleLights(veh, 2)                 -- Scheinwerfer erzwingen
    SetVehicleFullbeam(veh, true)            -- Fernlicht-Blitz
    SetVehicleIndicatorLights(veh, 0, true)  -- Blinker rechts
    SetVehicleIndicatorLights(veh, 1, true)  -- Blinker links
    CreateThread(function()
        Wait(400)
        if DoesEntityExist(veh) then
            SetVehicleFullbeam(veh, false)
            SetVehicleLights(veh, 0)         -- zurück auf automatisch (aus, wenn Motor aus)
            SetVehicleIndicatorLights(veh, 0, false)
            SetVehicleIndicatorLights(veh, 1, false)
        end
    end)
end

local function toggleLock(veh)
    requestControl(veh)
    local locked = GetVehicleDoorLockStatus(veh) == 2
    if locked then
        SetVehicleDoorsLocked(veh, 1)
        help('Fahrzeug ~g~aufgeschlossen')
    else
        SetVehicleDoorsLocked(veh, 2)
        help('Fahrzeug ~r~abgeschlossen')
    end
    lockEffects(veh)
end

local function nearbyVehiclesSorted(coords)
    local list = {}
    for _, veh in ipairs(GetGamePool('CVehicle')) do
        local d = #(coords - GetEntityCoords(veh))
        if d <= LOCK_RANGE then
            list[#list + 1] = { veh = veh, d = d, plate = trimPlate(GetVehicleNumberPlateText(veh)) }
        end
    end
    table.sort(list, function(a, b) return a.d < b.d end)
    return list
end

-- G: nächstes eigenes Fahrzeug (un)abschließen
RegisterCommand('razecarlock', function()
    ESX.TriggerServerCallback('raze_carstatus:getMyPlates', function(plates)
        local owned = {}
        for _, p in ipairs(plates) do owned[p] = true end
        local nearby = nearbyVehiclesSorted(GetEntityCoords(PlayerPedId()))
        for _, e in ipairs(nearby) do
            if e.plate ~= '' and owned[e.plate] then
                toggleLock(e.veh)
                return
            end
        end
        help('Kein eigenes Fahrzeug in der Nähe')
    end)
end, false)
RegisterKeyMapping('razecarlock', 'Fahrzeug ab-/aufschließen (eigene)', 'keyboard', 'G')

-- M: Motor an/aus (nur Fahrer); aus = auch Lichter aus
RegisterCommand('razecarengine', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh == 0 then return end
    if GetPedInVehicleSeat(veh, -1) ~= ped then
        help('Nur der Fahrer kann den Motor schalten')
        return
    end
    requestControl(veh)
    if GetIsVehicleEngineRunning(veh) then
        engineOff[veh] = true
        SetVehicleEngineOn(veh, false, true, true)
        SetVehicleLights(veh, 1) -- Lichter aus
        help('Motor ~r~aus')
    else
        engineOff[veh] = nil
        SetVehicleEngineOn(veh, true, false, true)
        SetVehicleLights(veh, 0) -- zurück auf automatisch
        help('Motor ~g~an')
    end
end, false)
RegisterKeyMapping('razecarengine', 'Motor an-/ausschalten', 'keyboard', 'M')

-- Motor bleibt beim Aussteigen an (statt automatisch auszugehen).
-- Wird regelmäßig neu gesetzt (Respawn/Ped-Wechsel).
CreateThread(function()
    while true do
        SetPedConfigFlag(PlayerPedId(), 429, true)
        Wait(4000)
    end
end)

-- Verhindert, dass der Motor beim Gasgeben wieder anspringt
CreateThread(function()
    while true do
        local sleep = 500
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 and engineOff[veh] and GetPedInVehicleSeat(veh, -1) == ped then
            sleep = 0
            if GetIsVehicleEngineRunning(veh) then
                SetVehicleEngineOn(veh, false, true, true)
            end
        end
        Wait(sleep)
    end
end)

-- Speicher leicht halten: Flags entfernen, wenn das Fahrzeug nicht mehr existiert
CreateThread(function()
    while true do
        Wait(30000)
        for veh in pairs(engineOff) do
            if not DoesEntityExist(veh) then engineOff[veh] = nil end
        end
    end
end)
