--Temp local vars that you can use while using events.

local tempVars = {}
tempVars['hunger'] = 0
tempVars['thirst'] = 0
tempVars['stress'] = 0
tempVars['voice'] = 50

-- Performance optimization variables
local cachedPlayerData = {}
local lastPlayerDataUpdate = 0
local cachedMaxHealth = 200
local lastMaxHealthCheck = 0

-- Cache player data to avoid expensive calls
local function GetCachedPlayerData()
    local currentTime = GetGameTimer()
    if currentTime - lastPlayerDataUpdate > 1000 then -- Cache for 1 second
        if FrameworkSelected == 'QBCore' then
            cachedPlayerData = QBCore.Functions.GetPlayerData()
        end
        lastPlayerDataUpdate = currentTime
    end
    return cachedPlayerData
end

--[[
    Here you can add your function to gather statuses
]]

AddStateBagChangeHandler('proximity', nil, function(bag, key, val)
    if bag ~= ('player:%s'):format(GetPlayerServerId(PlayerId())) then return end
    tempVars['voice'] = Config.Voice.NameToProgress[val.mode]
end)

Citizen.CreateThread(function()
    while not NUI.Loaded or not Storage.HasBeenSent do
        Wait(1000)
    end
    Wait(1000)

    -- Set up health function (framework-independent with caching)
    Config.Hud.Status['health'].get = function()
        local currentTime = GetGameTimer()
        if currentTime - lastMaxHealthCheck > 5000 then -- Check max health every 5 seconds
            cachedMaxHealth = GetEntityMaxHealth(Threads.Players.Data['ped'])
            lastMaxHealthCheck = currentTime
        end
        return (GetEntityHealth(Threads.Players.Data['ped']) - 100) / (cachedMaxHealth - 100) * 100
    end

    -- Set up armour function (framework-independent)
    Config.Hud.Status['armour'].get = function()
        local armour = GetPedArmour(Threads.Players.Data['ped'])
        --NUI.SetMinicomponentVisibility('hud', 'armour', armour > 0)
        return armour
    end

    -- Set up functions based on framework once (no repeated framework checks)
    if FrameworkSelected == 'ESX' then
        -- ESX uses tempVars updated by events
        Config.Hud.Status['hunger'].get = function()
            return tempVars['hunger']
        end

        Config.Hud.Status['thirst'].get = function()
            return tempVars['thirst']
        end

        if Config.Hud.Status['stress'] then
            Config.Hud.Status['stress'].get = function()
                return tempVars['stress']
            end
        end

        -- ESX event handler
        AddEventHandler('esx_status:onTick', function(data)
            for i = 1, #data, 1 do
                if data[i].name == 'hunger' then
                    tempVars['hunger'] = data[i].percent
                end
                if data[i].name == 'thirst' then
                    tempVars['thirst'] = data[i].percent
                end
                if data[i].name == 'stress' then
                    tempVars['stress'] = data[i].percent
                end
            end
        end)
    elseif FrameworkSelected == 'QBOX' then
        -- QBOX uses tempVars updated by state bag handlers
        Config.Hud.Status['hunger'].get = function()
            return tempVars['hunger']
        end

        Config.Hud.Status['thirst'].get = function()
            return tempVars['thirst']
        end

        if Config.Hud.Status['stress'] then
            Config.Hud.Status['stress'].get = function()
                return tempVars['stress']
            end
        end

        -- QBOX state bag handlers
        Wait(1000)

        AddStateBagChangeHandler('hunger', nil, function(bag, key, value)
            if bag ~= ('player:%s'):format(GetPlayerServerId(PlayerId())) then return end
            tempVars['hunger'] = value
        end)

        AddStateBagChangeHandler('thirst', nil, function(bag, key, value)
            if bag ~= ('player:%s'):format(GetPlayerServerId(PlayerId())) then return end
            tempVars['thirst'] = value
        end)

        AddStateBagChangeHandler('stress', nil, function(bag, key, value)
            if bag ~= ('player:%s'):format(GetPlayerServerId(PlayerId())) then return end
            tempVars['stress'] = value
        end)
    elseif FrameworkSelected == 'QBCore' then
        -- QBCore uses cached player data to avoid expensive calls
        Config.Hud.Status['hunger'].get = function()
            local playerData = GetCachedPlayerData()
            return playerData.metadata and playerData.metadata.hunger or 0
        end

        Config.Hud.Status['thirst'].get = function()
            local playerData = GetCachedPlayerData()
            return playerData.metadata and playerData.metadata.thirst or 0
        end

        if Config.Hud.Status['stress'] then
            Config.Hud.Status['stress'].get = function()
                local playerData = GetCachedPlayerData()
                return playerData.metadata and playerData.metadata.stress or 0
            end
        end
    end
end)
