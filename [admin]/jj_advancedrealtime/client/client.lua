local printedCredits = false
local lastTzName = "UTC"

local previousMsPerMinute = nil
local desiredMsPerMinute = tonumber(Config.ClockMsPerGameMinute) or 60000

local function dbg(msg)
    if Config.Debug then
        print(("[jj_realtime] %s"):format(msg))
    end
end

local function clampInt(n, minV, maxV, fallback)
    n = tonumber(n)
    if not n then return fallback end
    n = math.floor(n)
    if n < minV then return minV end
    if n > maxV then return maxV end
    return n
end

local function safeGetMsPerMinute()
    local ok, val = pcall(function()
        return GetMillisecondsPerGameMinute()
    end)
    if ok then return val end
    return nil
end

local function safeSetMsPerMinute(v)
    pcall(function()
        SetMillisecondsPerGameMinute(v)
    end)
end

local function applyRealtimeClockSpeed()
    if previousMsPerMinute == nil then
        previousMsPerMinute = safeGetMsPerMinute()
    end
    safeSetMsPerMinute(desiredMsPerMinute)
    PauseClock(false)
end

local function requestSync()
    TriggerServerEvent("jj_realtime:requestSync")
end

RegisterNetEvent("jj_realtime:sync", function(h, m, s, tzName)
    h = clampInt(h, 0, 23, 12)
    m = clampInt(m, 0, 59, 0)
    s = clampInt(s, 0, 59, 0)
    lastTzName = tostring(tzName or "UTC")

    applyRealtimeClockSpeed()
    NetworkOverrideClockTime(h, m, s)

    dbg(("Synced -> %02d:%02d:%02d (%s)"):format(h, m, s, lastTzName))
end)

AddEventHandler("onClientResourceStart", function(resName)
    if resName ~= GetCurrentResourceName() then return end

    CreateThread(function()
        Wait(500)

        if not printedCredits then
            printedCredits = true
            print("[jj_realtime] Realtime time sync started (server-authoritative).")
        end

        NetworkClearClockTimeOverride()
        applyRealtimeClockSpeed()

        requestSync()

        local interval = tonumber(Config.UpdateIntervalSeconds) or 60
        if interval < 10 then interval = 10 end

        while true do
            Wait(interval * 1000)
            requestSync()
        end
    end)
end)

AddEventHandler("onClientResourceStop", function(resName)
    if resName ~= GetCurrentResourceName() then return end
    NetworkClearClockTimeOverride()
    if previousMsPerMinute ~= nil then
        safeSetMsPerMinute(previousMsPerMinute)
    end
    PauseClock(false)
end)
