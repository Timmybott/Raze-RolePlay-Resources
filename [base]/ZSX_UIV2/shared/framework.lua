Citizen.CreateThread(function()
    FrameworkSelected = GetResourceState('es_extended') == 'started' and 'ESX' or GetResourceState('qb-core') == 'started' and 'QBCore' or GetResourceState('qbx_core') and 'QBOX' or false
    if not FrameworkSelected then
        debugPrint('[^2FRAMEWORK^7] Awaiting Framework [/]')
    end
    while not FrameworkSelected do
        Wait(100)
        FrameworkSelected = GetResourceState('es_extended') == 'started' and 'ESX' or GetResourceState('qb-core') == 'started' and 'QBCore' or GetResourceState('qbx_core') and 'QBOX' or false
    end
    debugPrint('[^2FRAMEWORK^7] Framework ' .. FrameworkSelected .. ' loaded!')
    ESX = FrameworkSelected == 'ESX' and exports['es_extended']:getSharedObject() or false
    QBCore = FrameworkSelected == 'QBCore' and exports['qb-core']:GetCoreObject() or false
    QBOX = FrameworkSelected == 'QBOX' and exports['qbx_core'] or false
    ZSX_Multicharacter = 'ZSX_Multicharacter'
    ZSX_Loading = 'ZSX_LoadingScreen'
end)
