-- jg-handling - Server storage (oxmysql / database backed)
--
-- Replaces the previous file-based "carpack" storage. Handling data now lives
-- in the FiveM database (oxmysql):
--   * tables are created automatically on resource start,
--   * any existing carpack data (carpack/defaults.json) is migrated ONCE,
--   * all future changes are written straight to the database.
--
-- Design note: an in-memory cache mirrors the database so that lookups stay
-- SYNCHRONOUS - the lib.callback handlers in sv-vehicle.lua / sv-profiles.lua
-- return the value directly and cannot wait for an async query. Writes update
-- the cache immediately and persist to the database in the background.

local Storage = {}

-- In-memory mirror of the database (synchronous read source).
Storage.profilesData = {}
Storage.vehicleData = {}

local RESOURCE = GetCurrentResourceName()

local PROFILES_TABLE = "handling_profiles"
local VEHICLE_TABLE  = "handling_vehicle_data"

local CREATE_PROFILES_SQL = [[
CREATE TABLE IF NOT EXISTS handling_profiles (
  id VARCHAR(64) NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  vehicle VARCHAR(100) NOT NULL,
  edited_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  edited_by VARCHAR(255),
  handling_data LONGTEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
]]

local CREATE_VEHICLE_SQL = [[
CREATE TABLE IF NOT EXISTS handling_vehicle_data (
  plate VARCHAR(100) NOT NULL,
  vehicle_hash VARCHAR(100) NOT NULL,
  base_handling_data LONGTEXT NOT NULL,
  handling_data LONGTEXT NOT NULL,
  PRIMARY KEY (plate, vehicle_hash)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci
]]

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------
local function generateId()
    return tostring(os.time()) .. "_" .. tostring(math.random(1000, 9999))
end

-- Handling blobs are stored as JSON strings (cl-vehicle.lua json.decode's them).
local function asJsonString(v)
    if type(v) == "table" then return json.encode(v) end
    return v
end

-- Canonical string form for a vehicle model hash so values coming from the
-- client (number), the database (string) and the JSON migration all compare
-- equal, regardless of int/float representation.
local function hashKey(v)
    if type(v) == "number" then return string.format("%.0f", v) end
    return tostring(v)
end

local function dbReady()
    return GetResourceState('oxmysql') == 'started'
end

-- Fire-and-forget DB write. The cache is the synchronous source of truth, so a
-- write that lands a few ms later is fine; oxmysql logs query errors itself.
local function dbExec(query, params)
    if not dbReady() then
        print("^1[JG Handling] oxmysql not started - DB write skipped^0")
        return
    end
    exports.oxmysql:query(query, params or {}, function(_) end)
end

-- ===========================================================================
-- PROFILES
-- ===========================================================================
function Storage.createProfile(name, vehicle, editedBy, handlingData)
    local profile = {
        id = generateId(),
        name = name,
        vehicle = vehicle,
        edited_at = os.date("%Y-%m-%d %H:%M:%S"),
        edited_by = editedBy or "Admin",
        handling_data = asJsonString(handlingData),
    }

    table.insert(Storage.profilesData, profile)

    dbExec(
        ("INSERT INTO %s (id, name, vehicle, edited_at, edited_by, handling_data) VALUES (?, ?, ?, ?, ?, ?)"):format(PROFILES_TABLE),
        { profile.id, profile.name, profile.vehicle, profile.edited_at, profile.edited_by, profile.handling_data }
    )
    return profile.id
end

function Storage.deleteProfile(id)
    for i = #Storage.profilesData, 1, -1 do
        if Storage.profilesData[i].id == id then
            table.remove(Storage.profilesData, i)
            break
        end
    end

    dbExec(("DELETE FROM %s WHERE id = ?"):format(PROFILES_TABLE), { id })
    return true
end

function Storage.getProfiles(searchTerm, limit, offset)
    local filteredProfiles = {}

    if searchTerm and searchTerm ~= "" then
        local searchLower = string.lower(searchTerm)
        for _, profile in ipairs(Storage.profilesData) do
            if string.find(string.lower(profile.name), searchLower) or
               string.find(string.lower(profile.edited_by), searchLower) or
               string.find(string.lower(profile.vehicle), searchLower) then
                table.insert(filteredProfiles, profile)
            end
        end
    else
        filteredProfiles = Storage.profilesData
    end

    -- Sort by edited_at descending
    table.sort(filteredProfiles, function(a, b)
        return a.edited_at > b.edited_at
    end)

    local totalCount = #filteredProfiles
    local startIndex = (offset or 0) + 1
    local endIndex = startIndex + (limit or 50) - 1

    local result = {}
    for i = startIndex, endIndex do
        if filteredProfiles[i] then
            table.insert(result, filteredProfiles[i])
        end
    end

    return result, totalCount
end

-- ===========================================================================
-- VEHICLE HANDLING
-- ===========================================================================
function Storage.lookupVehicleHandling(plate, vehicleHash)
    local hk = hashKey(vehicleHash)

    -- Exact plate match first
    for _, data in ipairs(Storage.vehicleData) do
        if data.plate == plate and data.vehicle_hash == hk then
            return data
        end
    end

    -- Then the model-wide default (plate == "*")
    for _, data in ipairs(Storage.vehicleData) do
        if data.plate == "*" and data.vehicle_hash == hk then
            return data
        end
    end

    return nil
end

function Storage.saveVehicleHandling(applyType, plate, vehicleHash, baseHandlingData, handlingData)
    -- "applyAsDefault" (and legacy "applyToModel") = model-wide default for every
    -- vehicle of this model. "applyToPlate" = single plate only.
    local isDefault = applyType == "applyAsDefault" or applyType == "applyToModel"
    local hk = hashKey(vehicleHash)
    local targetPlate = isDefault and "*" or plate
    local base = asJsonString(baseHandlingData)
    local handling = asJsonString(handlingData)

    -- ---- update cache (mirror old removal semantics) ----
    if applyType == "applyToPlate" then
        for i = #Storage.vehicleData, 1, -1 do
            local d = Storage.vehicleData[i]
            if d.plate == plate and d.vehicle_hash == hk then
                table.remove(Storage.vehicleData, i)
            end
        end
    elseif isDefault then
        for i = #Storage.vehicleData, 1, -1 do
            local d = Storage.vehicleData[i]
            if d.vehicle_hash == hk and (d.plate == plate or d.plate == "*") then
                table.remove(Storage.vehicleData, i)
            end
        end
    end

    table.insert(Storage.vehicleData, {
        plate = targetPlate,
        vehicle_hash = hk,
        base_handling_data = base,
        handling_data = handling,
    })

    -- ---- persist to DB ----
    -- DELETE and the upsert below always target DIFFERENT primary keys, so they
    -- are safe even though oxmysql may run them out of order.
    if isDefault and plate and plate ~= "*" then
        -- a previous plate-specific entry for this exact plate becomes redundant
        dbExec(("DELETE FROM %s WHERE plate = ? AND vehicle_hash = ?"):format(VEHICLE_TABLE), { plate, hk })
    end
    dbExec(
        ("INSERT INTO %s (plate, vehicle_hash, base_handling_data, handling_data) VALUES (?, ?, ?, ?) " ..
         "ON DUPLICATE KEY UPDATE base_handling_data = VALUES(base_handling_data), handling_data = VALUES(handling_data)"):format(VEHICLE_TABLE),
        { targetPlate, hk, base, handling }
    )
    return true
end

function Storage.deleteVehicleHandling(plate, vehicleHash)
    local hk = hashKey(vehicleHash)

    -- Remove the first matching row from the cache and capture its plate so the
    -- DB delete hits exactly the same row.
    local removedPlate = nil
    for i = #Storage.vehicleData, 1, -1 do
        local d = Storage.vehicleData[i]
        if d.vehicle_hash == hk and (d.plate == plate or d.plate == "*") then
            removedPlate = d.plate
            table.remove(Storage.vehicleData, i)
            break
        end
    end

    if removedPlate then
        dbExec(("DELETE FROM %s WHERE plate = ? AND vehicle_hash = ?"):format(VEHICLE_TABLE), { removedPlate, hk })
    end
    return true
end

-- ===========================================================================
-- STARTUP: create tables, load cache, migrate legacy carpack
-- ===========================================================================
local function loadFromDb(cb)
    exports.oxmysql:query(("SELECT plate, vehicle_hash, base_handling_data, handling_data FROM %s"):format(VEHICLE_TABLE), {}, function(vrows)
        Storage.vehicleData = {}
        if vrows then
            for _, r in ipairs(vrows) do
                Storage.vehicleData[#Storage.vehicleData + 1] = {
                    plate = r.plate,
                    vehicle_hash = hashKey(r.vehicle_hash),
                    base_handling_data = r.base_handling_data,
                    handling_data = r.handling_data,
                }
            end
        end

        exports.oxmysql:query(("SELECT id, name, vehicle, edited_at, edited_by, handling_data FROM %s"):format(PROFILES_TABLE), {}, function(prows)
            Storage.profilesData = {}
            if prows then
                for _, r in ipairs(prows) do
                    Storage.profilesData[#Storage.profilesData + 1] = {
                        id = tostring(r.id),
                        name = r.name,
                        vehicle = r.vehicle,
                        edited_at = tostring(r.edited_at),
                        edited_by = r.edited_by,
                        handling_data = r.handling_data,
                    }
                end
            end
            if cb then cb() end
        end)
    end)
end

-- One-time import of the old file-based store (carpack/defaults.json) into the
-- database. Only runs while the DB table is still empty; afterwards the file is
-- emptied so it can never be re-imported (the carpack folder may then be
-- deleted on the server).
local function migrateCarpack()
    if #Storage.vehicleData > 0 then return end

    local raw = LoadResourceFile(RESOURCE, "carpack/defaults.json")
    if not raw or raw == "" then return end -- nothing to migrate / fresh install

    local ok, decoded = pcall(json.decode, raw)
    if not ok or type(decoded) ~= "table" then
        SaveResourceFile(RESOURCE, "carpack/defaults.json", "[]", -1)
        return
    end

    local count = 0
    for _, d in ipairs(decoded) do
        if d.plate and d.vehicle_hash ~= nil then
            local hk = hashKey(d.vehicle_hash)
            local base = asJsonString(d.base_handling_data or "{}")
            local handling = asJsonString(d.handling_data or "{}")

            Storage.vehicleData[#Storage.vehicleData + 1] = {
                plate = d.plate,
                vehicle_hash = hk,
                base_handling_data = base,
                handling_data = handling,
            }

            dbExec(
                ("INSERT INTO %s (plate, vehicle_hash, base_handling_data, handling_data) VALUES (?, ?, ?, ?) " ..
                 "ON DUPLICATE KEY UPDATE base_handling_data = VALUES(base_handling_data), handling_data = VALUES(handling_data)"):format(VEHICLE_TABLE),
                { d.plate, hk, base, handling }
            )
            count = count + 1
        end
    end

    -- One-shot guard: clear the legacy store so it is never imported again.
    SaveResourceFile(RESOURCE, "carpack/defaults.json", "[]", -1)
    print(("^2[JG Handling] Migrated %d handling entr%s from carpack -> database^0"):format(count, count == 1 and "y" or "ies"))
end

CreateThread(function()
    -- Wait for oxmysql to be up (queries before the connection is ready could
    -- otherwise race the table creation).
    local waited = 0
    while not dbReady() and waited < 150 do
        Wait(100)
        waited = waited + 1
    end
    if not dbReady() then
        print("^1[JG Handling] oxmysql is not started - database storage unavailable^0")
        return
    end

    -- Chain create -> create -> load so the SELECTs never run before the tables
    -- exist (oxmysql does not guarantee submission order across queries).
    exports.oxmysql:query(CREATE_PROFILES_SQL, {}, function()
        exports.oxmysql:query(CREATE_VEHICLE_SQL, {}, function()
            loadFromDb(function()
                migrateCarpack()
                print(("^2[JG Handling] Database storage ready (%d vehicle handlings, %d profiles)^0")
                    :format(#Storage.vehicleData, #Storage.profilesData))
            end)
        end)
    end)
end)

-- Export the storage functions for the (escrow) handlers in sv-vehicle.lua /
-- sv-profiles.lua, which reference the global `Storage`.
_G.Storage = Storage

print("^2[JG Handling] Database-backed storage initialized^0")
