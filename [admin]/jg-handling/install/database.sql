-- jg-handling database schema.
-- These tables are created automatically on resource start by server/sv-storage.lua
-- (oxmysql). This file is kept for reference / manual setup only.

CREATE TABLE IF NOT EXISTS handling_profiles (
  id VARCHAR(64) NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  vehicle VARCHAR(100) NOT NULL,
  edited_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  edited_by VARCHAR(255),
  handling_data LONGTEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS handling_vehicle_data (
  plate VARCHAR(100) NOT NULL,
  vehicle_hash VARCHAR(100) NOT NULL,
  base_handling_data LONGTEXT NOT NULL,
  handling_data LONGTEXT NOT NULL,
  PRIMARY KEY (plate, vehicle_hash)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
