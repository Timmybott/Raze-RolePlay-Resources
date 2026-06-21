-- Simple memory-only storage to replace oxmysql
-- "Apply as default" additionally writes a real handling.meta carpack to the
-- resource folder (carpack/handling.meta) and persists the defaults to disk so
-- they survive restarts.
local Storage = {}

-- Initialize empty data structures
Storage.profilesData = {}
Storage.vehicleData = {}

local RESOURCE = GetCurrentResourceName()
local CARPACK_DIR = "carpack"
local META_FILE = CARPACK_DIR .. "/handling.meta"
local DATA_FILE = CARPACK_DIR .. "/defaults.json"

-- Generate unique ID for profiles
local function generateId()
    return tostring(os.time()) .. "_" .. tostring(math.random(1000, 9999))
end

-- Make sure handling blobs are stored as JSON strings (the client lookup in
-- cl-vehicle.lua expects strings and json.decode's them).
local function asJsonString(v)
    if type(v) == "table" then return json.encode(v) end
    return v
end

local function asTable(v)
    if type(v) == "string" then
        local ok, decoded = pcall(json.decode, v)
        if ok and type(decoded) == "table" then return decoded end
        return {}
    end
    return v or {}
end

-- PROFILES OPERATIONS
function Storage.createProfile(name, vehicle, editedBy, handlingData)
    local newProfile = {
        id = generateId(),
        name = name,
        vehicle = vehicle,
        edited_at = os.date("%Y-%m-%d %H:%M:%S"),
        edited_by = editedBy or "Admin",
        handling_data = handlingData
    }

    table.insert(Storage.profilesData, newProfile)
    return newProfile.id
end

function Storage.deleteProfile(id)
    for i = #Storage.profilesData, 1, -1 do
        if Storage.profilesData[i].id == id then
            table.remove(Storage.profilesData, i)
            break
        end
    end
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

-- ============================================================================
-- CARPACK / handling.meta GENERATION
-- ============================================================================

local STR_FLAG_FIELDS = {
    strModelFlags = true,
    strHandlingFlags = true,
    strDamageFlags = true,
    strAdvancedFlags = true,
}

local TEXT_FIELDS = {
    handlingName = true,
    AIHandling = true,
    handlingType = true,
}

local SKIP_FIELDS = {
    audioNameHash = true,
}

-- A nice, stable order for the sub-handling items.
local SUBCLASS_ORDER = {
    "CCarHandlingData",
    "CBikeHandlingData",
    "CFlyingHandlingData",
    "CBoatHandlingData",
}

local function fmtFloat(v)
    return string.format("%.6f", (tonumber(v) or 0) + 0.0)
end

local function fmtInt(v)
    return string.format("%d", math.floor(tonumber(v) or 0))
end

local function fmtHex(v)
    local n = tonumber(v) or 0
    return string.format("%X", math.floor(n))
end

-- Build the XML for a single handling field. Returns a string or nil (skip).
local function fieldToXml(indent, key, value)
    if SKIP_FIELDS[key] then return nil end
    if value == nil then return nil end

    if key:sub(1, 3) == "vec" then
        local x, y, z = 0, 0, 0
        if type(value) == "table" then
            x = value.x or value[1] or 0
            y = value.y or value[2] or 0
            z = value.z or value[3] or 0
        end
        return string.format('%s<%s x="%s" y="%s" z="%s" />', indent, key, fmtFloat(x), fmtFloat(y), fmtFloat(z))
    elseif STR_FLAG_FIELDS[key] then
        return string.format('%s<%s>%s</%s>', indent, key, fmtHex(value), key)
    elseif TEXT_FIELDS[key] then
        return string.format('%s<%s>%s</%s>', indent, key, tostring(value), key)
    elseif key:sub(1, 1) == "f" then
        return string.format('%s<%s value="%s" />', indent, key, fmtFloat(value))
    else
        -- nInitialDriveGears, nMonetaryValue, ... and any other numeric field
        return string.format('%s<%s value="%s" />', indent, key, fmtInt(value))
    end
end

-- Build one <Item type="CHandlingData"> ... </Item> from a decoded handling table.
local function handlingItemXml(handling)
    if type(handling) ~= "table" then return nil end
    local classMap = HANDLING_KEY_CLASS_MAP or {}

    local handlingName = handling.handlingName
    if not handlingName or handlingName == "" then
        return nil
    end

    local lines = {}
    table.insert(lines, '    <Item type="CHandlingData">')
    table.insert(lines, string.format('      <handlingName>%s</handlingName>', tostring(handlingName)))

    -- Root (CHandlingData) fields
    for key, value in pairs(handling) do
        if key ~= "handlingName" and (classMap[key] == "CHandlingData") then
            local xml = fieldToXml("      ", key, value)
            if xml then table.insert(lines, xml) end
        end
    end

    -- Sub-handling fields, grouped by class
    local subLines = {}
    for _, subClass in ipairs(SUBCLASS_ORDER) do
        local itemLines = {}
        for key, value in pairs(handling) do
            if classMap[key] == subClass then
                local xml = fieldToXml("          ", key, value)
                if xml then table.insert(itemLines, xml) end
            end
        end
        if #itemLines > 0 then
            table.insert(subLines, string.format('        <Item type="%s">', subClass))
            for _, l in ipairs(itemLines) do table.insert(subLines, l) end
            table.insert(subLines, '        </Item>')
        end
    end

    if #subLines > 0 then
        table.insert(lines, '      <SubHandlingData>')
        for _, l in ipairs(subLines) do table.insert(lines, l) end
        table.insert(lines, '      </SubHandlingData>')
    end

    table.insert(lines, '    </Item>')
    return table.concat(lines, "\n")
end

-- Regenerate carpack/handling.meta from every "default" (plate == "*") entry.
function Storage.writeCarpackMeta()
    local items = {}
    for _, data in ipairs(Storage.vehicleData) do
        if data.plate == "*" then
            local item = handlingItemXml(asTable(data.handling_data))
            if item then table.insert(items, item) end
        end
    end

    local xml = {
        '<?xml version="1.0" encoding="UTF-8"?>',
        '',
        '<CHandlingDataMgr>',
        '  <HandlingData>',
    }
    for _, item in ipairs(items) do
        table.insert(xml, item)
    end
    table.insert(xml, '  </HandlingData>')
    table.insert(xml, '</CHandlingDataMgr>')

    SaveResourceFile(RESOURCE, META_FILE, table.concat(xml, "\n"), -1)
end

-- Persist the runtime store so defaults survive a resource/server restart.
function Storage.persist()
    SaveResourceFile(RESOURCE, DATA_FILE, json.encode(Storage.vehicleData), -1)
end

function Storage.load()
    local raw = LoadResourceFile(RESOURCE, DATA_FILE)
    if raw and raw ~= "" then
        local ok, decoded = pcall(json.decode, raw)
        if ok and type(decoded) == "table" then
            Storage.vehicleData = decoded
        end
    end
end

-- VEHICLE DATA OPERATIONS
function Storage.lookupVehicleHandling(plate, vehicleHash)
    -- First try to find exact plate match
    for _, data in ipairs(Storage.vehicleData) do
        if data.plate == plate and data.vehicle_hash == vehicleHash then
            return data
        end
    end

    -- Then try to find wildcard (*) / default match
    for _, data in ipairs(Storage.vehicleData) do
        if data.plate == "*" and data.vehicle_hash == vehicleHash then
            return data
        end
    end

    return nil
end

function Storage.saveVehicleHandling(applyType, plate, vehicleHash, baseHandlingData, handlingData)
    -- "applyAsDefault" (and legacy "applyToModel") = model-wide default for every
    -- vehicle of this model. "applyToPlate" = single plate only.
    local isDefault = applyType == "applyAsDefault" or applyType == "applyToModel"

    -- Remove existing data based on apply type
    if applyType == "applyToPlate" then
        for i = #Storage.vehicleData, 1, -1 do
            if Storage.vehicleData[i].plate == plate and Storage.vehicleData[i].vehicle_hash == vehicleHash then
                table.remove(Storage.vehicleData, i)
            end
        end
    elseif isDefault then
        for i = #Storage.vehicleData, 1, -1 do
            if (Storage.vehicleData[i].plate == plate and Storage.vehicleData[i].vehicle_hash == vehicleHash) or
               (Storage.vehicleData[i].plate == "*" and Storage.vehicleData[i].vehicle_hash == vehicleHash) then
                table.remove(Storage.vehicleData, i)
            end
        end
    end

    -- Add new data (handling blobs stored as JSON strings)
    local newData = {
        plate = isDefault and "*" or plate,
        vehicle_hash = vehicleHash,
        base_handling_data = asJsonString(baseHandlingData),
        handling_data = asJsonString(handlingData)
    }

    table.insert(Storage.vehicleData, newData)

    -- Persist + (re)generate the carpack so the change survives restarts.
    Storage.persist()
    Storage.writeCarpackMeta()
    return true
end

function Storage.deleteVehicleHandling(plate, vehicleHash)
    for i = #Storage.vehicleData, 1, -1 do
        if (Storage.vehicleData[i].plate == plate and Storage.vehicleData[i].vehicle_hash == vehicleHash) or
           (Storage.vehicleData[i].plate == "*" and Storage.vehicleData[i].vehicle_hash == vehicleHash) then
            table.remove(Storage.vehicleData, i)
            break
        end
    end

    Storage.persist()
    Storage.writeCarpackMeta()
    return true
end

-- Load any previously saved defaults from disk on startup.
Storage.load()

-- Export the storage functions
_G.Storage = Storage

print("^2[JG Handling] File-based storage initialized (carpack defaults enabled)^0")
