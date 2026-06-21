-- Database-backed storage (oxmysql).
-- Profiles and "Apply as default" vehicle handling are stored directly in the
-- FiveM server database. The required tables are created automatically on
-- startup (see sv-initsql.lua / initSQL).
local Storage = {}

-- Handling blobs are kept as JSON strings: the client (cl-vehicle.lua) and the
-- NUI (profile loading) both json.decode / JSON.parse them.
local function asJsonString(v)
    if type(v) == "table" then return json.encode(v) end
    return v
end

-- ============================================================================
-- PROFILES
-- ============================================================================
function Storage.createProfile(name, vehicle, editedBy, handlingData)
    local id = MySQL.insert.await(
        "INSERT INTO handling_profiles (name, vehicle, edited_by, handling_data) VALUES (?, ?, ?, ?)",
        { name, vehicle, editedBy or "Admin", asJsonString(handlingData) }
    )
    return id
end

function Storage.deleteProfile(id)
    MySQL.query.await("DELETE FROM handling_profiles WHERE id = ?", { id })
    return true
end

function Storage.getProfiles(searchTerm, limit, offset)
    limit = limit or 50
    offset = offset or 0

    local rows, totalCount

    if searchTerm and searchTerm ~= "" then
        local like = "%" .. searchTerm .. "%"
        rows = MySQL.query.await(
            "SELECT * FROM handling_profiles WHERE name LIKE ? OR edited_by LIKE ? OR vehicle LIKE ? ORDER BY edited_at DESC LIMIT ? OFFSET ?",
            { like, like, like, limit, offset }
        )
        totalCount = MySQL.scalar.await(
            "SELECT COUNT(*) FROM handling_profiles WHERE name LIKE ? OR edited_by LIKE ? OR vehicle LIKE ?",
            { like, like, like }
        )
    else
        rows = MySQL.query.await(
            "SELECT * FROM handling_profiles ORDER BY edited_at DESC LIMIT ? OFFSET ?",
            { limit, offset }
        )
        totalCount = MySQL.scalar.await("SELECT COUNT(*) FROM handling_profiles")
    end

    return rows or {}, totalCount or 0
end

-- ============================================================================
-- VEHICLE HANDLING DATA
-- ============================================================================

-- Look up the stored handling for a vehicle: exact plate first, then the
-- model-wide default (plate = '*').
function Storage.lookupVehicleHandling(plate, vehicleHash)
    vehicleHash = tostring(vehicleHash)

    local row = MySQL.single.await(
        "SELECT plate, vehicle_hash, base_handling_data, handling_data FROM handling_vehicle_data WHERE plate = ? AND vehicle_hash = ?",
        { plate, vehicleHash }
    )
    if row then return row end

    return MySQL.single.await(
        "SELECT plate, vehicle_hash, base_handling_data, handling_data FROM handling_vehicle_data WHERE plate = '*' AND vehicle_hash = ?",
        { vehicleHash }
    )
end

function Storage.saveVehicleHandling(applyType, plate, vehicleHash, baseHandlingData, handlingData)
    vehicleHash = tostring(vehicleHash)

    -- "applyAsDefault" (and legacy "applyToModel") = model-wide default for every
    -- vehicle of this model. Anything else = single plate only.
    local isDefault = applyType == "applyAsDefault" or applyType == "applyToModel"
    local targetPlate = isDefault and "*" or plate

    if isDefault then
        -- replace any plate-specific entry for this model and the existing default
        MySQL.query.await(
            "DELETE FROM handling_vehicle_data WHERE vehicle_hash = ? AND (plate = ? OR plate = '*')",
            { vehicleHash, plate }
        )
    else
        MySQL.query.await(
            "DELETE FROM handling_vehicle_data WHERE plate = ? AND vehicle_hash = ?",
            { plate, vehicleHash }
        )
    end

    MySQL.query.await(
        "INSERT INTO handling_vehicle_data (plate, vehicle_hash, base_handling_data, handling_data) VALUES (?, ?, ?, ?)",
        { targetPlate, vehicleHash, asJsonString(baseHandlingData), asJsonString(handlingData) }
    )

    return true
end

function Storage.deleteVehicleHandling(plate, vehicleHash)
    vehicleHash = tostring(vehicleHash)
    MySQL.query.await(
        "DELETE FROM handling_vehicle_data WHERE vehicle_hash = ? AND (plate = ? OR plate = '*')",
        { vehicleHash, plate }
    )
    return true
end

-- Export the storage functions
_G.Storage = Storage

print("^2[JG Handling] Database storage initialized (oxmysql)^0")
