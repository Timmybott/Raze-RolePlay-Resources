InMenu = false

sleep = true



Options = {

    vehicle = {hash = 0},

    last_location = '',

    have_rented = false,

    blips = {},

    pricePaid = 0,

}



-- 1. Hilfsfunktion: Wandelt Hex-Code (#FF0000) in r, g, b um

local function HexToRGB(hex)

    hex = hex:gsub("#", "")

    return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))

end



Citizen.CreateThread(function()

-- WICHTIG: Kurze Pause beim Serverstart, damit ZSX bereit ist

    Citizen.Wait(2000)

    

    -- Standardwerte festlegen

    local r, g, b = 255, 255, 255

    while true do 

        Citizen.Wait(1)

        sleep = true

        local playerPed = PlayerPedId()

        local coords = GetEntityCoords(playerPed)



        -- Farbe einmal pro Frame abrufen und umwandeln

        -- Hinweis: Stelle sicher, dass die Variable 'rgb' definiert ist, falls der Export sie braucht.

        local hexColor = exports['ZSX_UIV2']:GetColor(rgb) 

        local r, g, b = HexToRGB(hexColor)



        for k,v in pairs(Config.Locations) do

            if not InMenu then

                local distance = #(coords - v.coords)

                local return_distance = #(coords - v.return_coords) 



                if distance < 1 then

                    sleep = false

                    if Options.have_rented then

                        TriggerEvent('esx:showHelpNotification', Config.Options.cantRent)

                    else

                        TriggerEvent('esx:showHelpNotification', v.markers.spawn.text)

                        if IsControlJustReleased(0, v.markers.spawn.key) then

                            Options.last_location = k

                            open_ui(k)

                        end

                    end

                end



                if distance <= 15 then

                    sleep = false

                    -- Hier nutzen wir jetzt r, g, b vom Export

                    DrawMarker(v.markers.spawn.type, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.markers.spawn.size.x, v.markers.spawn.size.y, v.markers.spawn.size.z, r, g, b, 50, false, true, 2, false, nil, nil, false)

                end



                if Options.have_rented then

                    if return_distance < 3 then

                        sleep = false

                        TriggerEvent('esx:showHelpNotification', v.markers.return_spot.text)

                        if IsControlJustReleased(0, v.markers.return_spot.key) then

                            returnVehicle(playerPed)

                        end

                    end

    

                    if return_distance <= 15 then

                        sleep = false

                        -- Ich habe die Farbe hier auch angepasst, falls der Return-Marker auch die Serverfarbe haben soll:

                        DrawMarker(v.markers.return_spot.type, v.return_coords.x, v.return_coords.y, v.return_coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.markers.return_spot.size.x, v.markers.return_spot.size.y, v.markers.return_spot.size.z, 255, 0, 0, 50, false, true, 2, false, nil, nil, false)

                    end

                end

            end

        end

        if sleep then

            Citizen.Wait(150)

        end

    end

end)

for k, v in pairs(Config.Locations) do

rent = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)

SetBlipSprite (rent, v.blips.spawn.sprite)

SetBlipDisplay(rent, 4)

SetBlipScale  (rent, 0.65)

SetBlipAsShortRange(rent, true)

SetBlipColour(rent, v.blips.spawn.color)

BeginTextCommandSetBlipName("STRING")

AddTextComponentSubstringPlayerName(v.blips.spawn.name)

EndTextCommandSetBlipName(rent)

end