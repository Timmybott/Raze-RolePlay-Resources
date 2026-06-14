Config = {}

-- Debug prints (client+server)
Config.Debug = false

-- Server-authoritative timezone
Config.ActiveTimeZone = "Europe/Berlin"

-- How often the client requests a resync (seconds).
-- Opinionated default: 60s is the sweet spot (stable + low traffic).
Config.UpdateIntervalSeconds = 60

-- Server-side rate limit for requestSync (seconds)
Config.RequestCooldownSeconds = 5

-- Real-time clock speed:
-- 60000 ms = 1 real minute per 1 in-game minute (prevents dusk flicker)
Config.ClockMsPerGameMinute = 60000

-- Optional: server broadcast to all players (usually not needed).
-- Set > 0 to enable (e.g., 300 = every 5 minutes). Keep 0 for client-driven sync.
Config.ServerBroadcastSeconds = 0

-- Timezones
Config.TimeZones = {
    ["Europe/Berlin"] = { offset = 1, useEUDST = true },
    ["Europe/London"] = { offset = 0, useEUDST = true },
    ["Europe/Paris"]  = { offset = 1, useEUDST = true },
    ["UTC"]           = { offset = 0, useEUDST = false },
    ["CustomUTC+2"]   = { offset = 2, useEUDST = false }
}
