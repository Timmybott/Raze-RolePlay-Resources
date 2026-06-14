Config.AutoStartMainMenu = true                                 -- [BOOL] Either to use welcome screen at the start automatically or manually create an instance

Config.UI = {}      
Config.UI.UseMusic = true                                       -- [BOOL] Use music handler (YouTube API)
Config.UI.UseMugShotBase64 = true                               -- [BOOL] Use player mugshot in pause menu or not

Config.UI.UseConfiguration = true                               -- [BOOL] Use configuration screen or not
Config.UI.UseInGameSettings = true                              -- [BOOL] Use in-game settings or not
Config.UI.UseWelcomeScreen = true                               -- [BOOL] Use the welcome screen or not
Config.UI.UsePauseMenu = true                                   -- [BOOL] Use pause menu built in UI or not
Config.UI.UseWeaponIndicator = true     
Config.UI.WeaponIndicatorMode = '3d'                            -- [STRING] [DEF. 'non-3d'] Either to use weapon indicator in 3D mode or outside of 3D mode | Available options: '3d' or 'non-3d'
Config.UI.StaticPerspective = false                             -- [BOOL] Make perspective 3d or not 
Config.UI.UseAIOMenu = false                                    -- [BOOL] Use built-in AIO menu
Config.UI.UseListenerForMumble = false                          -- [BOOL] Check when player talks to show active indicator or not
Config.UI.Use3DVoiceIndicator = true                            -- [BOOL] Use 3D voice indicator or use 2D one on top of the screen
Config.UI.DisableVoiceIndicator = false                         -- [BOOL] Disable voice indicator
Config.UI.DUI3D_CheckForIntersectWorld = true                   -- [BOOL] Whether to show points in-game behind the walls or not
Config.UI.UseStreetLabel = true                                 -- [BOOL] Use built-in streetlabel

Config.UI.UseLogoOnMinimapAnimation = true                      -- [BOOL] Apply the logo on the minimap
Config.UI.UseCinematicModeOnKeybind = true                      -- [BOOL] Whether to use cinematic mode on keybind or not
Config.UI.Use3DContent = true                                   -- [BOOL] Use built-in 3D Perspective or not

Config.UI.RemoveDecimalsFromWallets = true                      -- [BOOL] Remove decimals from wallet

Config.UI.Color = {}
Config.UI.Color.AllowPrimaryColorChange = true                  -- [BOOL] Allow players to change primary color
Config.UI.Color.AllowPrimaryBackgroundColorChange = true        -- [BOOL] Allow players to change primary background color
Config.UI.Color.AllowBackgroundColorChange = true               -- [BOOL] Allow players to change secondary background color
Config.UI.Color.AllowInterfaceBackgroundColorChange = true      -- [BOOL] Allow players to change interface background color
Config.UI.Color.AllowHudColorsChange = true                     -- [BOOL] Allow players to change statuses color

Config.UI.DefaultColor = '#ff4e00'                              -- [HEX] Primary color
Config.UI.DefaultPrimaryBackground = '#000000'                  -- [HEX] Primary background color
Config.UI.DefaultPrimaryBackgroundOpacity = .3                  -- [FLOAT] Primary background color opacity
Config.UI.DefaultBackgroundColor = '#242424'                    -- [HEX] Secondary background color
Config.UI.DefaultBackgroundColorOpacity = .25                   -- [FLOAT] Secondary background color opacity

--[[
    This content is primarly for the presets content.
]]

Config.UI.Preset = {}
Config.UI.Preset['hud'] = {
    selected = 'skew',
    options = {
        ['3d-mode'] = false,
        ['shadows'] = false,
        ['iconShadow'] = false,
        ['smoothEdges'] = true,
        ['under50'] = false,
        ['vertical'] = false,
    },
    refreshInterval = {
        max = 1000,
        min = 10,
        current = 500,
    },
    position = {
        minimap_on = {
            x = false,
            y = false
        },
        minimap_off = {
            x = false, 
            y = false,
        },
    }
}
Config.UI.Preset['carhud'] = {
    options = {
        animation = "from_bottom",
        shadows = false,
        strokeWidth = 29.688643641354,
    },
    position = {
        x = false,
        y = false,
    },
    refreshInterval = {
        current = 125,
        max = 250,
        min = 0,
    },
    selected = "default",
}
Config.UI.Preset['notify'] = {
    selected = 'basic',
    options = {
        ['shadows'] = false,
        ['3d-mode'] = false,
        ['list'] = false,
        ['animation'] = 'from_right'
    },
    position = {
        x = false, -- do not change those values since those are set in pixels.
        y = false, -- do not change those values since those are set in pixels.
    }
}
Config.UI.Preset['helpNotify'] = {
    selected = 'basic',
    options = {
        ['shadows'] = false,
        ['smoothEdges'] = false,
        ['background'] = false,
        ['animation'] = 'fade'
    }
}

Config.UI.Preset['progressBar'] = {
    selected = 'modern',
    position = {
        x = false,
        y = false,
    },
    options = {
        ['shadows'] = false,
        ['animation'] = 'fade',
    }
}

Config.UI.Preset['music'] = {
    url = 'https://www.youtube.com/watch?v=9RriQbnddsw',
    volume = 30,
}

Config.UI.Preset['misc'] = {
    options = {
        ['use_minimap_overlay'] = true,
        ['minimap_outline'] = true,
        ['minimap_innershadow'] = false
    }
}

--[[
    This part is main handler for your interface.
    You can either choose which one to enable or disable using [use] variable.
    You can also change icons by changing [icon] variable, you can find the list here: https://fontawesome.com/v5/search
    And to change label you can change [label] variable
]]

Config.UI.Interfaces = {}
Config.UI.Interfaces['color'] = {
    name = 'color',
    label = 'Color',
    icon = 'fas fa-fill',
    use = true,
}
Config.UI.Interfaces['hud'] = {
    name = 'hud',
    label = 'Hud',
    icon = 'fas fa-heart',
    use = true,
}
Config.UI.Interfaces['carhud'] = {
    name = 'carhud',
    label = 'CarHud',
    icon = 'fas fa-car',
    use = true,
}
Config.UI.Interfaces['notifications'] = {
    name = 'notifications',
    label = 'Notifications',
    icon = 'fas fa-envelope-open',
    use = true,
}

Config.UI.Interfaces['helpNotify'] = {
    name = 'helpNotify',
    label = 'Help Notify',
    icon = 'fas fa-question',
    use = true,
}

Config.UI.Interfaces['progressBar'] = {
    name = 'progressBar',
    label = 'Progress Bar',
    icon = 'fas fa-circle-notch',
    use = true,
}

Config.UI.Interfaces['misc'] = {
    name = 'misc',
    label = 'Misc',
    icon = 'fas fa-cogs',
    use = true,
}
Config.UI.Interfaces['positioning'] = {
    name = 'positioning',
    label = 'Position',
    icon = 'fas fa-arrows-alt',
    use = true,
}
