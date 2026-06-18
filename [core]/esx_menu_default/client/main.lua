local GUI, MenuType, OpenedMenus, CurrentNameSpace = {}, "default", 0, nil
GUI.Time = 0

-- Raze: Akzentfarbe des Menüs = die pro Spieler in ZSX_UIV2 eingestellte Farbe
-- (Fallback Orange #ff4e00). Wird beim Öffnen an die NUI mitgeschickt.
local function getRazeAccent()
    if GetResourceState('ZSX_UIV2') == 'started' then
        local ok, a, b, c = pcall(function() return exports['ZSX_UIV2']:GetColor(true) end)
        if ok then
            if type(a) == 'string' and a ~= '' then
                return (a:sub(1, 1) == '#') and a or ('#' .. a)
            end
            local r, g, bl
            if type(a) == 'number' and type(b) == 'number' and type(c) == 'number' then
                r, g, bl = a, b, c
            elseif type(a) == 'table' then
                r, g, bl = a.r or a[1], a.g or a[2], a.b or a[3]
            end
            if r and g and bl then
                return string.format('#%02x%02x%02x',
                    math.floor(tonumber(r) or 255) % 256,
                    math.floor(tonumber(g) or 78) % 256,
                    math.floor(tonumber(bl) or 0) % 256)
            end
        end
    end
    return '#ff4e00'
end

local function openMenu(namespace, name, data)
    CurrentNameSpace = namespace
    OpenedMenus = OpenedMenus + 1

    data.namespace = namespace
    data.name = name
    data.razeAccent = getRazeAccent()

    SendNUIMessage({
        action = "openMenu",
        data = data
    })
end

local function closeMenu(namespace, name)
    CurrentNameSpace = namespace
    OpenedMenus = OpenedMenus - 1
    if OpenedMenus < 0 then
        OpenedMenus = 0
    end

    SendNUIMessage({
        action = "closeMenu",
        data = {
            namespace = namespace,
            name = name,
        }
    })
end

AddEventHandler("onResourceStop", function(resource)
    if GetCurrentResourceName() == resource and OpenedMenus > 0 then
        ESX.UI.Menu.CloseAll()
    elseif CurrentNameSpace ~= nil and CurrentNameSpace == resource and OpenedMenus > 0 then
        ESX.UI.Menu.CloseAll()
    end
end)

ESX.UI.Menu.RegisterType(MenuType, openMenu, closeMenu)

RegisterNUICallback("menu_submit", function(data, cb)
    local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)

    if not menu then
        return
    end

    if menu.submit ~= nil then
        menu.submit(data, menu)
    end

    cb("OK")
end)

RegisterNUICallback("menu_cancel", function(data, cb)
    local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)

    if not menu then
        return
    end

    if menu.cancel ~= nil then
        menu.cancel(data, menu)
    end

    cb("OK")
end)

RegisterNUICallback("menu_change", function(data, cb)
    local menu = ESX.UI.Menu.GetOpened(MenuType, data._namespace, data._name)

    if not menu then
        return
    end

    for i = 1, #data.elements, 1 do
        menu.setElement(i, "value", data.elements[i].value)

        if data.elements[i].selected then
            menu.setElement(i, "selected", true)
        else
            menu.setElement(i, "selected", false)
        end
    end

    if menu.change ~= nil then
        menu.change(data, menu)
    end
    cb("OK")
end)

ESX.RegisterInput("menu_default_enter", "Submit menu item", "KEYBOARD", "RETURN", function()
    if OpenedMenus > 0 and (GetGameTimer() - GUI.Time) > 200 then
        SendNUIMessage({
            action = "controlPressed",
            control = "ENTER",
        })
        GUI.Time = GetGameTimer()
    end
end)

ESX.RegisterInput("menu_default_backspace", "Close menu", "KEYBOARD", "BACK", function()
    if OpenedMenus > 0 then
        SendNUIMessage({
            action = "controlPressed",
            control = "BACKSPACE",
        })
        GUI.Time = GetGameTimer()
    end
end)

ESX.RegisterInput("menu_default_top", "Change menu focus to top item", "KEYBOARD", "UP", function()
    if OpenedMenus > 0 then
        SendNUIMessage({
            action = "controlPressed",
            control = "TOP",
        })
        GUI.Time = GetGameTimer()
    end
end)

ESX.RegisterInput("menu_default_down", "Change menu focus to down item", "KEYBOARD", "DOWN", function()
    if OpenedMenus > 0 then
        SendNUIMessage({
            action = "controlPressed",
            control = "DOWN",
        })
        GUI.Time = GetGameTimer()
    end
end)

ESX.RegisterInput("menu_default_left", "Change menu slider to left", "KEYBOARD", "LEFT", function()
    if OpenedMenus > 0 then
        SendNUIMessage({
            action = "controlPressed",
            control = "LEFT",
        })
        GUI.Time = GetGameTimer()
    end
end)

ESX.RegisterInput("menu_default_right", "Change menu slider to right", "KEYBOARD", "RIGHT", function()
    if OpenedMenus > 0 then
        SendNUIMessage({
            action = "controlPressed",
            control = "RIGHT",
        })
        GUI.Time = GetGameTimer()
    end
end)
