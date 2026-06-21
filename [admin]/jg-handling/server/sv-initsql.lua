-- Automatically create the database tables JG Handling needs (oxmysql).
-- Called from sv-main.lua via initSQL(callback).

local CREATE_PROFILES = [[
  CREATE TABLE IF NOT EXISTS handling_profiles (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    vehicle VARCHAR(100) NOT NULL,
    edited_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    edited_by VARCHAR(255),
    handling_data TEXT NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
]]

local CREATE_VEHICLE_DATA = [[
  CREATE TABLE IF NOT EXISTS handling_vehicle_data (
    plate VARCHAR(100) NOT NULL,
    vehicle_hash VARCHAR(100) NOT NULL,
    base_handling_data TEXT NOT NULL,
    handling_data TEXT NOT NULL,
    PRIMARY KEY (plate, vehicle_hash)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
]]

function initSQL(cb)
  if Config.AutoRunSQL == false then
    if cb then cb() end
    return
  end

  CreateThread(function()
    local ok, err = pcall(function()
      MySQL.query.await(CREATE_PROFILES)
      MySQL.query.await(CREATE_VEHICLE_DATA)
    end)

    if not ok then
      print("^1[JG Handling] Could not create database tables. Make sure oxmysql is installed and your MySQL connection is configured. Error: " .. tostring(err) .. "^0")
      return
    end

    if cb then cb() end
  end)
end
