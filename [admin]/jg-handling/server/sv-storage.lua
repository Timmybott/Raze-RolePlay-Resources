-- Simple memory-only storage to replace oxmysql
local Storage = {}

-- Initialize empty data structures
Storage.profilesData = {}
Storage.vehicleData = {}

-- Generate unique ID for profiles
local function generateId()
    return tostring(os.time()) .. "_" .. tostring(math.random(1000, 9999))
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

-- VEHICLE DATA OPERATIONS
function Storage.lookupVehicleHandling(plate, vehicleHash)
    -- First try to find exact plate match
    for _, data in ipairs(Storage.vehicleData) do
        if data.plate == plate and data.vehicle_hash == vehicleHash then
            return data
        end
    end
    
    -- Then try to find wildcard (*) match
    for _, data in ipairs(Storage.vehicleData) do
        if data.plate == "*" and data.vehicle_hash == vehicleHash then
            return data
        end
    end
    
    return nil
end

function Storage.saveVehicleHandling(applyType, plate, vehicleHash, baseHandlingData, handlingData)
    -- Remove existing data based on apply type
    if applyType == "applyToPlate" then
        for i = #Storage.vehicleData, 1, -1 do
            if Storage.vehicleData[i].plate == plate and Storage.vehicleData[i].vehicle_hash == vehicleHash then
                table.remove(Storage.vehicleData, i)
            end
        end
    elseif applyType == "applyToModel" then
        for i = #Storage.vehicleData, 1, -1 do
            if (Storage.vehicleData[i].plate == plate and Storage.vehicleData[i].vehicle_hash == vehicleHash) or
               (Storage.vehicleData[i].plate == "*" and Storage.vehicleData[i].vehicle_hash == vehicleHash) then
                table.remove(Storage.vehicleData, i)
            end
        end
    end
    
    -- Add new data
    local newData = {
        plate = applyType == "applyToModel" and "*" or plate,
        vehicle_hash = vehicleHash,
        base_handling_data = baseHandlingData,
        handling_data = handlingData
    }
    
    table.insert(Storage.vehicleData, newData)
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
    return true
end

-- Export the storage functions
_G.Storage = Storage

print("^2[JG Handling] Memory-only storage initialized (no oxmysql required)^0")
