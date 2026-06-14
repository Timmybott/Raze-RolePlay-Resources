Config.PauseMenu = {}
Config.PauseMenu.Style = 'default' -- WIP!
Config.PauseMenu.NavbarElements = {
    ['store'] = {
        label = 'Store',
        icon = 'fas fa-globe',
        url = 'https://razerp.spcfy.eu/',
        use = true,
    },

    ['discord'] = {
        label = 'Discord',
        icon = 'fab fa-discord',
        url = 'https://dc.gg/razerp',
        use = true,
    },
    ['youtube'] = {
        label = 'Instagram',
        icon = 'fas fa-hashtag',
        url = 'https://instagram.com/razerp_',
        use = true,
    },

}

Config.PauseMenu.UserData = {
    ['mugshot'] = true,
    ['user_firstname_and_lastname'] = true,
    ['job_list'] = true,
    ['wallets_list'] = true
}

Config.PauseMenu.UseCustomOrder = false
Config.PauseMenu.Order = {
    'ui', 'settings', 'map'
}

Config.PauseMenu.Buttons = {
    ['ui'] = {
        name = 'ui',
        label = 'UI Settings',
        path = {
            type = 'UISettings',
        },
        icon = 'UI',
    },
    ['settings'] = {
        name = 'settings',
        label = 'Game Settings',
        path = {
            type = 'game',
            value = 'settings',
        },
        icon = 'fas fa-cog',
    },
    ['map'] = {
        name = 'map',
        label = 'Map',
        path = {
            type = 'game',
            value = 'map',
        },
        icon = 'fas fa-map',
    },
    ['logout'] = {
        name = 'logout',
        path = {
            type = 'custom_payload',
            export = {
                resource = 'ZSX_Multicharacter',
                exportFunction = 'Logout',
                params = {}
            },
        },
        icon = 'fas fa-times',
    },
}