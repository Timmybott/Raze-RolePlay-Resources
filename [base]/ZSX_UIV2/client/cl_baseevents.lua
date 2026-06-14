RegisterNetEvent('ZSX_UI:Storage:Updated')
AddEventHandler('ZSX_UI:Storage:Updated', function(component, componentData)

end)

RegisterNetEvent('ZSX_UIV2:Storage:OnColorUpdate')
AddEventHandler('ZSX_UIV2:Storage:OnColorUpdate', function(rgb, hex)
    
end)

RegisterNetEvent('ZSX_UI:Storage:Set')
AddEventHandler('ZSX_UI:Storage:Set', function(data)
    
end)

RegisterNetEvent('ZSX_UI:Storage:OnPositionUpdate')
AddEventHandler('ZSX_UI:Storage:OnPositionUpdate', function(component, position, width, height)
    --@param component STRING {
    --    hud
    --    progressBar
    --    carhud
    --    notifies
    --}

    --@param position OBJECT {
    --    x: x
    --    y: y
    --}

    --@param width NUMBER (PX)
    --@param height NUMBER (PX)
    
end)

RegisterNetEvent('ZSX_UIV2:Storage:OnScreenSwitched')
AddEventHandler('ZSX_UIV2:Storage:OnScreenSwitched', function(prevScreen, currentScreen)
    -- Example code to check if current screen is the one that shows the game screen
    --[[
        if currentScreen == 'game' then
            ShowHud()
        else
            HideHud()
        end
    ]]
end)

-- Interface

RegisterNetEvent('ZSX_UIV2:Interfaces:DefaultNotifications:OnAdd')
AddEventHandler('ZSX_UIV2:Interfaces:DefaultNotifications:OnAdd', function(serial)
    
end)

RegisterNetEvent('ZSX_UIV2:Interfaces:DefaultNotifications:OnRemove')
AddEventHandler('ZSX_UIV2:Interfaces:DefaultNotifications:OnRemove', function(serial)
    
end)

RegisterNetEvent('ZSX_UIV2:Interfaces:HelpNotification:OnAdd')
AddEventHandler('ZSX_UIV2:Interfaces:HelpNotification:OnAdd', function()
    
end)

RegisterNetEvent('ZSX_UIV2:Interfaces:HelpNotification:OnRemove')
AddEventHandler('ZSX_UIV2:Interfaces:HelpNotification:OnRemove', function()
    
end)