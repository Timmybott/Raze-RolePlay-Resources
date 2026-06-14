--[[
    https://github.com/overextended/ox_lib
    Modified for ZSX_UIV2 Integration
]]

local progress = nil
local playerState = LocalPlayer.state

---@param data ProgressProps
---@return boolean?
function lib.progressBar(data)
    -- Verhindern, dass mehrere Bars gleichzeitig laufen
    while progress ~= nil do Wait(0) end

    local p = promise.new()
    local icon = "clock" -- Standard Icon für ZSX
    
    -- Mapping von ox_lib auf ZSX
    local text = data.label or "Wird bearbeitet..."
    local duration = data.duration or 5000
    local canCancel = data.canCancel ~= nil and data.canCancel or true
    
    -- Steuerung deaktivieren (Mapping ox_lib zu ZSX-Format)
    local disableControls = data.disable or {}
    
    -- Animation Mapping
    local anim = data.anim or {}
    
    -- Props Mapping (ZSX unterstützt oft zwei Props direkt im Export)
    local prop1 = nil
    local prop2 = nil
    if data.prop then
        if data.prop[1] then 
            prop1 = data.prop[1]
            prop2 = data.prop[2]
        else
            prop1 = data.prop
        end
    end

    progress = true
    playerState.invBusy = true


local icon = "fas fa-info-circle" -- Dein gewünschtes FontAwesome Icon

    -- Falls das Skript doch mal ein spezifisches Icon mitschickt, 
    -- kannst du es hier überschreiben lassen:
    if data.icon and type(data.icon) == "string" then
        icon = data.icon
    end


    -- ZSX_UIV2 AUFRUF
    exports['ZSX_UIV2']:ProgressBar(
        icon, 
        text, 
        duration, 
        function() -- onComplete
            p:resolve(true)
        end, 
        function() -- onCancel
            p:resolve(false)
        end, 
        canCancel, 
        disableControls, 
        anim, 
        prop1, 
        prop2
    )

    -- Auf Ergebnis warten (damit lib.progressBar blockiert, wie vom Skript erwartet)
    local result = Citizen.Await(p)
    
    progress = nil
    playerState.invBusy = false
    
    return result
end

-- Wir leiten CircleProgress ebenfalls auf die normale Bar um, da ZSX meist ein Design nutzt
function lib.progressCircle(data)
    return lib.progressBar(data)
end

function lib.cancelProgress()
    -- Hier müsste ein Export von ZSX existieren, um die Bar abzubrechen
    -- Falls ZSX keinen Cancel-Export hat, setzen wir nur die Variable
    progress = nil
end

function lib.progressActive()
    return progress ~= nil
end

-- Command zum Abbrechen (X-Taste Support)
RegisterCommand('cancelprogress', function()
    if progress then 
        -- Hier optional ZSX Trigger zum Abbrechen einfügen
        progress = nil 
    end
end)

if cache.game == 'fivem' then
    RegisterKeyMapping('cancelprogress', 'Progress abbrechen', 'keyboard', 'x')
end