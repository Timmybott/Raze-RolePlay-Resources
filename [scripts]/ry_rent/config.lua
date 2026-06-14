Config = {}

Config.Options = {
    showTimer = false,
    timeRent = 1800, -- seconds the player get when rent a vehicle. Default 120 seconds | 2 minutes.
    deleteVehicleWhenFinished = false, -- delete vehicle when rent time is finished and not delivered? Default true
    deleteTime = 25000, -- time in MS that vehicle will be deleted if 'deleteVehicleWhenFinished' is active and after rent time is finished. Default 25000MS | 25Seconds. 

    refundMoneyWhenDelivered = true,

    donthaveMoney = "Du hast nicht genug Geld um ein Fahrzeug zu mieten!", -- message when don't have money.
    spawnPointBlocked = "Der Ausparkpunkt ist blockiert!",  -- message when spawnPoint is blocked by other vehicle.
    rentFinished = 'Die Miete des Fahrzeugs ist abgelaufen',
    returnSuccess = 'Erfolgreich zurück gebracht, danke!', -- message when return the vehicle is Successfully.
    returnError = 'Du musst in einem Fahrzeug sitzen.', -- message when the player its not in the rented vehicle.
    cantRent = 'Du hast bereits ein Fahrzeug gemietet', -- message when the player already have a rented vehicle.
}

Config.Locations = {
    ['rent1'] = {
        coords = vector3(-1039.5634, -2731.0000, 20.2144),
        spawn_coords = {x =-1024.80, y =-2734.81, z=20.09, h=243.77}, -- coord where vehicle will spawn.
        return_coords = vector3(-1032.65,-2732.00,20.16), -- coord for return the vehicle.
        markers = {
            spawn = {
                key = 38, -- key to open the menu. Default E
                type = 2, -- type of marker.
                size  = {x = 0.3, y = 0.3, z = 0.3},  -- size of marker.
                color = {r = 255, g = 255, b = 255},  -- color of marker.
                text = '[ E ] Fahrzeug mieten', -- text of marker.
            },
            return_spot = {
                key = 38, -- key to open the menu. Default E
                type = 2, -- type of marker.
                size  = {x = 0.3, y = 0.3, z = 0.3},  -- size of marker.
                color = {r = 255, g = 0, b = 0},  -- color of marker.
                text = '[ E ] Fahrzeug zurück bringen', -- text of marker.
            }
        },
        blips = {
            spawn = {
                name = 'Fahrzeugmiete', -- name of the blip in map.
                sprite = 523, -- sprite of the blip.
                scale = 0.8, -- scale of the.
                color = 1 -- color of the. 
            },
            return_spot = {
                name = 'Fahrzeug abgabe', -- name of the return blip in map.
                sprite = 523, -- sprite of the return blip.
                scale = 0.8, -- scale of the return blip.
                color = 1 -- color of the return blip. 
            }
        },
        vehicles = {
            [1] = {
                model = 'sl63amg22', -- vehicle spawn model name.
                label = 'Mercedes AMG', -- name of vehicle in menu.
                description = '', -- description of vehicle in menu.
                image_name = 'amg.png', -- image name in html/assets folder.
                -- IMAGE RESOLUTION --
                -- 310x250 Pixels --
                -- IMAGE RESOLUTION --
                price = 150, -- price of the vehicle.
                type = 'Auto' -- type of the vehicle.
            },
            [2] = {
                model = 'shinobi', -- vehicle spawn model name.
                label = 'Motorrad', -- name of vehicle in menu.
                description = '', -- description of vehicle in menu.
                image_name = 'bmw.png', -- image name in html/assets folder.
                -- IMAGE RESOLUTION --
                -- 310x250 Pixels --
                -- IMAGE RESOLUTION --
                price = 100, -- price of the vehicle.
                type = 'Motorrad' -- type of the vehicle.
            },
            [3] = {
                model = 'gtr', -- vehicle spawn model name.
                label = 'Nissan GTR', -- name of vehicle in menu.
                description = '', -- description of vehicle in menu.
                image_name = 'gtr.png', -- image name in html/assets folder.
                -- IMAGE RESOLUTION --
                -- 310x250 Pixels --
                -- IMAGE RESOLUTION --
                price = 120, -- price of the vehicle.
                type = 'Auto' -- type of the vehicle.
            },
            [4] = {
                model = 'bmx', -- vehicle spawn model name.
                label = 'BMX', -- name of vehicle in menu.
                description = '', -- description of vehicle in menu.
                image_name = 'bike.png', -- image name in html/assets folder.
                -- IMAGE RESOLUTION --
                -- 310x250 Pixels --
                -- IMAGE RESOLUTION --
                price = 20, -- price of the vehicle.
                type = 'Fahrrad' -- type of the vehicle.
            },
        }
    },
}
