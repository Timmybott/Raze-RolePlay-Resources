local function dbg(msg)
    if Config.Debug then
        print(("[jj_realtime] %s"):format(msg))
    end
end

local function clampNumber(n, fallback)
    n = tonumber(n)
    if n == nil then return fallback end
    return n
end

local function dayOfWeek(y, m, d)
    if m < 3 then
        m = m + 12
        y = y - 1
    end
    local K = y % 100
    local J = math.floor(y / 100)
    local h = (d + math.floor(13 * (m + 1) / 5) + K + math.floor(K / 4) + math.floor(J / 4) + 5 * J) % 7
    return (h + 6) % 7
end

local function lastSunday(year, month)
    local lastDay
    if month == 1 or month == 3 or month == 5 or month == 7 or month == 8 or month == 10 or month == 12 then
        lastDay = 31
    elseif month == 4 or month == 6 or month == 9 or month == 11 then
        lastDay = 30
    else
        local isLeap = (year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0)
        lastDay = isLeap and 29 or 28
    end

    local dow = dayOfWeek(year, month, lastDay)
    return lastDay - dow
end

local function isDST_EU(year, month, day, hourUTC)
    local dstStartDay = lastSunday(year, 3)
    local dstEndDay   = lastSunday(year, 10)

    if month < 3 or month > 10 then return false end
    if month > 3 and month < 10 then return true end

    if month == 3 then
        if day > dstStartDay then return true end
        if day < dstStartDay then return false end
        return hourUTC >= 1
    end

    if month == 10 then
        if day < dstEndDay then return true end
        if day > dstEndDay then return false end
        return hourUTC < 1
    end

    return false
end

local function getZoneCfg()
    local zones = Config.TimeZones or {}
    local z = zones[Config.ActiveTimeZone]
    if not z then
        z = zones["UTC"] or { offset = 0, useEUDST = false }
    end
    z.offset = clampNumber(z.offset, 0)
    z.useEUDST = (z.useEUDST == true)
    return z
end

local function getZoneTime()
    local utc = os.date("!*t")
    if not utc then
        return 12, 0, 0
    end

    local zoneCfg = getZoneCfg()
    local offset = zoneCfg.offset

    if zoneCfg.useEUDST and isDST_EU(utc.year, utc.month, utc.day, utc.hour) then
        offset = offset + 1
    end

    local hour = (utc.hour + offset) % 24
    return hour, utc.min, utc.sec
end

local function sendSync(target)
    local h, m, s = getZoneTime()
    TriggerClientEvent("jj_realtime:sync", target, h, m, s, Config.ActiveTimeZone or "UTC")
    if target == -1 then
        dbg(("Broadcast sync: %02d:%02d:%02d (%s)"):format(h, m, s, Config.ActiveTimeZone or ""))
    else
        dbg(("Sync -> %s: %02d:%02d:%02d (%s)"):format(target, h, m, s, Config.ActiveTimeZone or ""))
    end
end

local lastRequestAt = {}
AddEventHandler("playerDropped", function()
    local src = source
    lastRequestAt[src] = nil
end)

RegisterNetEvent("jj_realtime:requestSync", function()
    local src = source
    if not src or src <= 0 then return end

    local cd = clampNumber(Config.RequestCooldownSeconds, 5)
    if cd > 0 then
        local now = os.time()
        local last = lastRequestAt[src] or 0
        if (now - last) < cd then
            return
        end
        lastRequestAt[src] = now
    end

    sendSync(src)
end)

CreateThread(function()
    local interval = clampNumber(Config.ServerBroadcastSeconds, 0)
    if interval <= 0 then
        dbg("Server broadcast disabled (client-driven sync).")
        return
    end

    Wait(5000)
    while true do
        sendSync(-1)
        Wait(interval * 1000)
    end
end)
