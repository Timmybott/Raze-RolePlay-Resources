Players = {}
Players.GlobalData = {}
Players.ActiveSources = {}
Players.SetData = function(src)
    local xPlayer = FrameworkSelected == 'ESX' and ESX.GetPlayerFromId(src) or FrameworkSelected == 'QBCore' and QBCore.Functions.GetPlayer(src) or FrameworkSelected == 'QBOX' and exports['qbox_core']:GetPlayer(source) or false
    local data = {}
    if not xPlayer then return --[[not possible]] end
    if FrameworkSelected == 'ESX' then
        data.firstname = xPlayer.variables.firstName
        data.lastname = xPlayer.variables.lastName
    elseif FrameworkSelected == 'QBOX' or FrameworkSelected == 'QBCore' then
        data.firstname = xPlayer.PlayerData.charinfo.firstname
        data.lastname = xPlayer.PlayerData.charinfo.lastname
    end
    data.base = GetBaseRows(src)
    data.id = src
    data.wallets = GetUserWallets(src)
    data.addon = {}
    Players.GlobalData[tostring(src)] = data
    TriggerClientEvent('ZSX_UIV2:Client:PlayerInitialized', src)
    debugPrint('[^2PLAYER^7] Succesfully set player data for ['..src..'] ('..GetPlayerName(src)..')')
    Player(src).state:set('UI_UserData', data, true)
end

Citizen.CreateThread(function()
    Wait(5000)
    local isSeatbeltSet = GetConvar('game_enableFlyThroughWindscreen', true) == 'true'
    print('\n\n')
    debugPrint('[^2SEATBELT^7] '..(isSeatbeltSet and 'Seatbelt convar is ^2properly set^7.' or 'Seatbelt convar is ^1missing^7. Make sure to add in server.cfg: \n ^setr game_enableFlyThroughWindscreen true^7'))
    print('\n\n')
end)

Players.Listener = function(src, variable, newData)
    if Players.GlobalData[tostring(src)][variable] then
        Players.GlobalData[tostring(src)][variable] = newData
        Player(src).state:set('UI_UserData', data, true)
        debugPrint('[^2PLAYER^7] Succesfully updated data for player ['..src..'] ('..GetPlayerName(src)..')')
    end
end

Players.UnloadPlayer = function(src)
    TriggerClientEvent('ZSX_UIV2:Client:UnloadPlayer', src)
end

RegisterNetEvent('ZSX_UIV2:Player:Prepare')
AddEventHandler('ZSX_UIV2:Player:Prepare', function()
    local xPlayer = FrameworkSelected == 'ESX' and ESX.GetPlayerFromId(source) 
                    or FrameworkSelected == 'QBOX' and exports['qbx_core']:GetPlayer(source)
                    or FrameworkSelected == 'QBCore' and QBCore.Functions.GetPlayer(source) or false
    if not xPlayer then return end
    Players.SetData(source)
end)

while not FrameworkSelected do
    Wait(0)
end

if FrameworkSelected == 'ESX' then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(src, _, _)
        for keySrc,active in pairs(Players.ActiveSources) do
            if active then
                Players.SetData(tonumber(keySrc))
            end
        end
        Players.SetData(src)
        Players.SetData(src)
        Players.ActiveSources[tostring(src)] = true
    end)

    RegisterNetEvent('esx:playerLogout')
    AddEventHandler('esx:playerLogout', function(source)
        Players.UnloadPlayer(source)
    end)
elseif FrameworkSelected == 'QBCore' or FrameworkSelected == 'QBOX' then
    RegisterNetEvent('QBCore:Server:PlayerLoaded')
    AddEventHandler('QBCore:Server:PlayerLoaded', function(player)
        print('Properly connected player loaded event. Preparing [/]')
        Players.ActiveSources[player.PlayerData.source] = true
        for keySrc,active in pairs(Players.ActiveSources) do
            if active then
                Players.SetData(tonumber(keySrc))
            end
        end
    end)

    RegisterNetEvent('QBCore:Server:OnPlayerUnload')
    AddEventHandler('QBCore:Server:OnPlayerUnload', function(src)
        Players.UnloadPlayer(src)
    end)
end

RegisterNetEvent('ZSX_UIV2:Quit', function()
    DropPlayer(source, 'You have disconnected from the server.')
end)