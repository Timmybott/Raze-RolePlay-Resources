-- Base data

-- exports('GetConfig', function()
--     return Config
-- end)

exports('GetPlayerPed', function()
    return Threads.Players.Data['ped']
end)

exports('GetPlayerID', function()
    return Threads.Players.Data['player']
end)

exports('GetPlayerVehicle', function()
    return Threads.Vehicles.Data['vehicle']
end)

exports('IsPedAiming', function()
    return Threads.Weapon.Data['isPedAiming']
end)

exports('GetPedCurrentWeapon', function()
    return Threads.Weapon.Data['weapon']
end)

exports('GetPedAmmo', function()
    return Threads.Weapon.Data['ammo']
end)

-- UI

exports('GetColor', Storage.GetHudColor)

exports('GetStorage', function()
    return Storage.Data
end)

exports('GetHudType', function()
    return Storage.Data['hud'].selected
end)

exports('GetHudSettings', function()
    return Storage.Data['hud'].options
end)

exports('GetCarHudType', function()
    return Storage.Data['carhud'].selected
end)

exports('GetCarHudSettings', function()
    return Storage.Data['carhud'].options
end)

exports('GetNotificationType', function()
    return Storage.Data['notify'].selected
end)

exports('GetNotificationSettings', function()
    return Storage.Data['notify'].options
end)

exports('GetHelpNotificationType', function()
    return Storage.Data['helpnotify'].selected
end)

exports('GetHelpNotificationSettings', function()
    return Storage.Data['helpnotify'].options
end)

exports('GetProgressBarType', function()
    return Storage.Data['progressbar'].selected
end)

exports('GetProgressBarSettings', function()
    return Storage.Data['progressbar'].options
end)

exports('ConfigurationDone', function()
    return Storage.Data['createdUI'] == true
end)

exports('DisplayRadar', DisplayRadar)

-- Screens

exports('OpenConfiguration', NUI.WelcomePreload)
exports('OpenMainMenu', MainMenu.Handler)
exports('OpenSettings', GameMenu.Init)

-- Interface

exports('IsPauseMenuActive', function()
    return Storage.CurrentScreen == 'pausemenu'
end)

exports('IsChatInputVisible', function()
    return Threads.Chat.IsInputVisible
end)

exports('IsUIBusy', function()
    return Storage.CurrentScreen ~= 'game'
end)

exports('GetCurrentScreen', function()
    return Storage.CurrentScreen
end)

exports('HideInterface', function(state)
    NUI.SetUIVisible(not state)
end)

exports('SetInterfaceDisabled', function(state)
    if state then
        NUI.SetRoutePath('/blank')
    else
        NUI.SetRoutePath('/')
    end
end)

exports('ApplyEffect', NUI.ApplyEffectOnInterfaceElement)

exports('HandleMusic', MusicPlayer.HandleVolume)

exports('Cinematic', Cinematic.Init)

-- Overriding UI

-- Misc
-- HelpNotify values for stages

exports('IsStageDone', function(stage)
    return
end)

exports('IsStageActive', function(stage)
    return
end)

exports('IsStageActive', function(stage)
    return
end)

-- Threads

exports('InterruptCarHud', function()
    
end)

-- ProgressBar
exports('ProgressBar', ProgressBar.Create)
exports('CancelProgressBar', ProgressBar.Cancel)
exports('FinishProgressBar', ProgressBar.Finish)
exports('IsProgressBarActive', ProgressBar.IsCurrentlyActive)

-- Notifications
exports('Notification', Notify.Add)
exports('Notification_Remove', Notify.Remove)

exports('DefaultNotification', DefaultNotifies.Add)
exports('DefaultNotification_Remove', DefaultNotifies.Remove)

-- Help Notification
exports('HelpNotification', HelpNotify.Add)
exports('HelpNotification_OnTick', HelpNotify.OnTick)
exports('HelpNotification_UpdateStage', HelpNotify.UpdateStage)
exports('HelpNotification_SetStageAsActive', HelpNotify.SetStageAsActive)
exports('HelpNotification_SetStageAsComplete', HelpNotify.SetStageAsCompleted)
exports('HelpNotification_Remove', HelpNotify.Remove)
exports('HelpNotification_UpdateText', HelpNotify.UpdateText)
exports('HelpNotification_UpdateTextTask', HelpNotify.UpdateTextTask)

-- TextUI
exports('TextUI', TextUI.Add)
exports('TextUI_Remove', TextUI.Remove)
exports('TextUI_Persistent', TextUI.CreatePersistent)
exports('TextUI_RemovePersistent', TextUI.RemovePersistent)
exports('TextUI_UpdateText', TextUI.UpdateText)
exports('TextUI_UpdateTextPersistent', TextUI.UpdatePersistentText)
exports('TextUI_UpdateKey', TextUI.UpdateKey)
exports('TextUI_UpdateKeyPersistent', TextUI.UpdatePersistentKey)

-- Points
exports('AddPoint', Point.Create)
exports('RemovePoint', Point.Remove)

--Interaction
exports('AddInteraction', Interaction.Create)

exports('AddMessage', Chat.CreateMessage)
exports('AddUserMessage', Chat.AddMessageToPlayer)

-- 3D DUI Handle
exports('Create3DDUI', Create3DDUIHandle)

-- EVENTS

RegisterNetEvent('ZSX_UIV2:Notification:Add')
AddEventHandler('ZSX_UIV2:Notification:Add', Notify.Add)

RegisterNetEvent('ZSX_UIV2:Notification:Remove')
AddEventHandler('ZSX_UIV2:Notification:Remove', Notify.Remove)

RegisterNetEvent('ZSX_UIV2:DefaultNotification:Add')
AddEventHandler('ZSX_UIV2:DefaultNotification:Add', DefaultNotifies.Add)

RegisterNetEvent('ZSX_UIV2:DefaultNotification:Remove')
AddEventHandler('ZSX_UIV2:DefaultNotification:Remove', DefaultNotifies.Remove)

RegisterNetEvent('ZSX_UIV2:ProgressBar:Create')
AddEventHandler('ZSX_UIV2:ProgressBar:Create', ProgressBar.Create)

RegisterNetEvent('ZSX_UIV2:ProgressBar:Cancel')
AddEventHandler('ZSX_UIV2:ProgressBar:Cancel', ProgressBar.Cancel)

RegisterNetEvent('ZSX_UIV2:DefaultNotification:Finish')
AddEventHandler('ZSX_UIV2:DefaultNotification:Finish', ProgressBar.Finish)

RegisterNetEvent('ZSX_UIV2:Chat:AddMessage')
AddEventHandler('ZSX_UIV2:Chat:AddMessage', Chat.CreateMessage)

RegisterNetEvent('ZSX_UIV2:Chat:AddUserMessage')
AddEventHandler('ZSX_UIV2:Chat:AddUserMessage', Chat.AddMessageToPlayer)

RegisterNetEvent('ZSX_UIV2:DUI:Create3DDUI')
AddEventHandler('ZSX_UIV2:DUI:Create3DDUI', Create3DDUIHandle)
