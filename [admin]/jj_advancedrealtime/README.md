# jj_advancedrealtime

**jj_advancedrealtime** synchronizes in-game time with real-world time based on configurable time zones.  
No forced weather, no framework dependency, very lightweight and production-ready.

Author: **JayJay**


## Features

- Server-side realtime calculation based on UTC
- Configurable time zones (e.g. Europe/Berlin, Europe/London, UTC, custom offsets)
- Optional automatic EU daylight saving time (last Sunday in March / October)
- Very performant:
  - Server: one time broadcast every X seconds
  - Client: one `NetworkOverrideClockTime` per second
- No forced weather, this resource only controls time
- Event-based sync (on join + periodic resync)
- Client console credit print: `Advanced realtime by JayJay`


## Installation

1. Place the resource in your `resources` folder, e.g.:

   ```text
   resources/[time]/jj_advancedrealtime
   ```

2. Make sure these files exist:

   ```text
   fxmanifest.lua
   config.lua
   server/server.lua
   client/client.lua
   ```

3. In your `server.cfg`:

   ```cfg
   ensure jj_advancedrealtime
   ```

4. Start the server.  
   In the client console you should see once:

   ```text
   [jj_advancedrealtime] Advanced realtime by JayJay
   ```


## Basic Configuration (config.lua)

```lua
Config = {}

Config.UpdateIntervalSeconds = 20
Config.Debug = true

Config.ActiveTimeZone = "Europe/Berlin"

Config.TimeZones = {
    ["Europe/Berlin"] = { offset = 1, useEUDST = true },
    ["Europe/London"] = { offset = 0, useEUDST = true },
    ["Europe/Paris"]  = { offset = 1, useEUDST = true },
    ["UTC"]           = { offset = 0, useEUDST = false },
    ["CustomUTC+2"]   = { offset = 2, useEUDST = false }
}
```


### Config Parameters

```lua
Config.UpdateIntervalSeconds = 20
```

How often the server broadcasts time to all clients (in seconds).  
15–30 is a good sweet spot (very low network traffic, stable sync).

```lua
Config.Debug = true
```

- `true`: prints debug logs to the server console (e.g. sync timestamps).
- `false`: silent.

```lua
Config.ActiveTimeZone = "Europe/Berlin"
```

Name of the currently active time zone.  
Must match one of the keys inside `Config.TimeZones`.

```lua
Config.TimeZones = {
    ["Europe/Berlin"] = { offset = 1, useEUDST = true },
    ["UTC"]           = { offset = 0, useEUDST = false }
}
```

Each entry:

```lua
["ZoneName"] = {
    offset   = <base UTC offset in hours>,
    useEUDST = <true/false for EU daylight saving rule>
}
```

- `offset`  
  Base offset in hours relative to UTC (winter time, without DST).

  Examples:
  - Central Europe (CET): `offset = 1`
  - London (GMT): `offset = 0`
  - UTC: `offset = 0`
  - Custom fixed UTC+2: `offset = 2`

- `useEUDST`  
  When `true`, EU DST rule is applied on top of `offset`:
  - Start: last Sunday in March, 01:00 UTC
  - End: last Sunday in October, 01:00 UTC
  During this period, effective offset is `offset + 1`.

  Typical usage:
  - For European countries: `useEUDST = true`
  - For strict UTC or non-EU zones: `useEUDST = false`


## Creating Multiple Time Zones

You can define as many time zones as you want in `Config.TimeZones`.  
The server always uses `Config.ActiveTimeZone` to decide which one is active.

### Example: Multiple European Zones

```lua
Config.ActiveTimeZone = "Europe/Berlin"

Config.TimeZones = {
    ["Europe/Berlin"] = { offset = 1, useEUDST = true },
    ["Europe/London"] = { offset = 0, useEUDST = true },
    ["Europe/Paris"]  = { offset = 1, useEUDST = true },
    ["UTC"]           = { offset = 0, useEUDST = false }
}
```

To switch the zone, just change `Config.ActiveTimeZone` and restart the resource:

```lua
Config.ActiveTimeZone = "Europe/London"
```

### Example: Fixed RP Zone (no DST)

```lua
Config.ActiveTimeZone = "RP_City"

Config.TimeZones = {
    ["RP_City"] = { offset = 2, useEUDST = false },
    ["UTC"]     = { offset = 0, useEUDST = false }
}
```

- Always UTC+2, no DST, useful for a fictional RP city.

### Example: Strict UTC Only

```lua
Config.ActiveTimeZone = "UTC"

Config.TimeZones = {
    ["UTC"] = { offset = 0, useEUDST = false }
}
```

- In-game time is always exactly UTC.


## How It Works (Short)

- Server:
  - Reads current UTC via `os.date("!*t")`.
  - Applies the chosen time zone:
    - Base `offset` hours
    - Optional extra hour if `useEUDST` is enabled and EU DST is active.
  - Broadcasts `hour, minute, second` to all clients every `Config.UpdateIntervalSeconds`.
  - Sends a single sync when a client requests it on join or resource restart.

- Client:
  - Requests a sync once on start.
  - Stores `hour, minute, second` and the current `GetGameTimer()`.
  - Every second, simulates the clock forward based on elapsed seconds and calls:
    ```lua
    NetworkOverrideClockTime(hour, minute, second)
    ```
  - Periodic server broadcasts keep the clock locked to real time, minimizing drift.


## Events (for other scripts)

Server-side:

```lua
TriggerClientEvent("jj_advancedrealtime:sync", target, hour, minute, second)
RegisterNetEvent("jj_advancedrealtime:requestSync")
```

Client-side:

```lua
RegisterNetEvent("jj_advancedrealtime:sync", function(hour, minute, second) ... end)
TriggerServerEvent("jj_advancedrealtime:requestSync")
```


## Credits

- Script: JayJay  
- Resource: `jj_advancedrealtime`

If you use or modify this resource, keeping the name and credits is highly appreciated.
