Config = {}
Config.Debug = false
Config.DumpChangelog = false
Config.Server = {
    ['Logo'] = 'https://razerp.spcfy.eu/assets/RazeRoleplayPBTransparent.png',
    ['Name'] = 'Raze Roleplay'
}

Config.DefaultMusic = 'https://www.youtube.com/watch?v=lh4JdZTJe7k&ab_channel=SoothingRelaxation'
Config.Currency = 'USD'                                     -- For more information look at the documentation: https://zsx-development.gitbook.io/docs/user-interface-v2/configurating/handling-ui/changing-currency
Config.Metrics = 'kmh'                                      -- Available are 'kmh' | 'mph'
Config.UseSeatbelt = true                                   -- [BOOL] Use seatbelt logic or not
Config.PersistentMinimap = false                            -- If value is set to false, then map will be only visible while inside vehicle.
Config.AwaitShutdownLoadingScreen = false                   -- If true, UI will wait for manual close of loading screen. Make sure that you close it by yourself, since it can be looped in loading screen!
Config.UseAutomaticOptimizationCheck = true                 -- If true, UI will automatically check users PC performance to disable cosmetic features, such as 3D ME/DO.
Config.UseTotalAmmoOnWeaponIndicator = true                 -- If true, we will get the total ammo of players ammo.
Config.DisablePauseMenuInterval = 2                         -- [DEF. 0] [INT] Interval for pause menu thread to disable default one.
Config.DisableMinimapHandler = false                        -- [DEF. false] [BOOL] By setting that to true, minimap handler including GFX won't be loaded.
Config.DisableMinimapAnimation = false                      -- [DEF. false] [BOOL] By setting that to true, minimap animation won't be visible.
Config.UseMusicInMulticharacter = true                      -- [DEF. true] [BOOL] Use music handler from UIV2 in ZSX_Multicharacter
--Config.UseWelcomeScreenV2 = true                          -- [DEF. true] [BOOL] Use new logic for welcome screen
Config.BringPlayerAfterWelcomeScreenToInitialCoords = false -- [DEF. false] [BOOL] Bring player to initial coords after welcome screen & configuration ends. Useful for people that doesnt use any multicharacters at all.

Config.HideComponents = {
    [1] = true,         --  WANTED_STARS
    [2] = true,         --  WEAPON_ICON
    [3] = true,         --  CASH
    [4] = true,         --  MP_CASH
    [5] = true,         --  MP_MESSAGE
    [6] = true,         --  VEHICLE_NAME
    [7] = true,         --  AREA_NAME
    [8] = true,         --  VEHICLE_CLASS
    [9] = true,         --  STREET_NAME
    [10] = true,        --  HELP_TEXT
    [11] = true,        --  FLOATING_HELP_TEXT_1
    [12] = true,        --  FLOATING_HELP_TEXT_2
    [13] = true,        --  CASH_CHANGE
    [14] = false,        --  RETICLE
    [15] = true,        --  SUBTITLE_TEXT
    [16] = true,        --  RADIO_STATIONS
    [17] = true,        --  SAVING_GAME
    [18] = true,        --  GAME_STREAM
    [19] = true,        --  WEAPON_WHEEL
    [20] = true,        --  WEAPON_WHEEL_STATS
    [21] = true,        --  HUD_COMPONENTS
    [22] = true,        --  HUD_WEAPONS
}

Config.RemoveFeedsAndDefaultNotifications = true -- Makes feed and default notifications invisible (for better user experience)
Config.HandleUIVisibilityOnBaseEvents = true -- That means it will show up the whole hud at the specific time when player is loaded / unloaded.

Config.KeyBinds = {
    ['menu'] = {
        description = 'UI Menu',
        key = 'F10',
        use = false,
    }, ['cancel_progressbar'] = {
        description = 'Cancel Progressbar',
        key = 'X',
        use = true,
    }, ['aio_menu'] = {
        description = 'AIO Menu',
        key = 'F1',
        use = false,
    }, ['seatbelt'] = {
        description = 'Seatbelt',
        key = 'B',
        use = true,
    }, ['cinematic_mode'] = {
        description = 'Open Cinematic Mode',
        key = 'F6',
        use = false,
    }, ['cinematic_focus'] = {
        description = 'Click to focus on Cinematic Mode',
        key = 'LSHIFT',
        use = false,
    }, ['3d_perspective'] = {
        description = 'Show 3D Perspective',
        key = 'TAB',
        use = true,
    }
}

Config.Commands = {
    ['menu'] = 'menu',
    ['cancel_progress'] = 'cancel_progressbar',
    ['aio_menu'] = 'aio_menu',
    ['seatbelt'] = 'seatbelt',
    ['cinematic_mode'] = 'cinematic_mode',
    ['cinematic_focus'] = 'cinematic_focus',
    ['3d_perspective'] = 'hidden_content',
}

Config.UsePerspective = true

Config.WeaponBlacklist = {}

Config.BlacklistedVehicles = {}

Config.CommandGroupAllowed = 'pl' -- [STRING/OBJECT] What permission group should player have to use permission-related commands.