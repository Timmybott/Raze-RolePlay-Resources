--[[
    https://github.com/overextended/ox_lib
    Modified for ZSX_UIV2 DefaultNotification
]]

local settings = require 'resource.settings'

---`client`
---@param data NotifyProps
function lib.notify(data)
    -- Grundstruktur für ZSX vorbereiten
    local zsxData = {
        text = data.description or data.title or "Keine Nachricht"
    }

    -- Wir holen die vom User eingestellte Farbe direkt aus dem ZSX Export
    local hudColor = exports['ZSX_UIV2']:GetColor()

    -- Standard-Icon festlegen
    local currentIcon = "fas fa-info-circle"

    -- Falls ox_lib einen speziellen Typ mitschickt, passen wir das Icon an
    -- (Die Farbe bleibt aber die HUD-Farbe vom Export)
    if data.type == 'error' then 
        currentIcon = "fas fa-exclamation-circle"
    elseif data.type == 'success' then 
        currentIcon = "fas fa-check-circle"
    elseif data.type == 'warning' then 
        currentIcon = "fas fa-exclamation-triangle"
    end

    -- Falls im Code explizit ein anderes Icon steht, nutzen wir das
    local finalIcon = data.icon or currentIcon

    -- Header-Logik: Das Icon bekommt die HUD-Farbe vom Export
    if data.title and data.description then
        zsxData.header = {
            text = data.title,
            icon = finalIcon,
            color = hudColor -- Hier wird die Farbe vom Export angewendet
        }
    else
        -- Fallback wenn nur Text da ist (Titel wird zum Header-Text)
        zsxData.header = {
            text = data.title or "Info",
            icon = finalIcon,
            color = hudColor
        }
    end

    -- DER AUFRUF AN ZSX_UIV2
    exports['ZSX_UIV2']:DefaultNotification(zsxData)

    -- Sound-Logik (Standard ox_lib)
    local sound = settings.notification_audio and data.sound
    if sound then
        if sound.bank then lib.requestAudioBank(sound.bank) end
        local soundId = GetSoundId()
        PlaySoundFrontend(soundId, sound.name, sound.set, true)
        ReleaseSoundId(soundId)
        if sound.bank then ReleaseNamedScriptAudioBank(sound.bank) end
    end
end

---@param data DefaultNotifyProps
function lib.defaultNotify(data)
    data.type = data.status
    if data.type == 'inform' then data.type = 'info' end
    return lib.notify(data --[[@as NotifyProps]])
end

RegisterNetEvent('ox_lib:notify', lib.notify)
RegisterNetEvent('ox_lib:defaultNotify', lib.defaultNotify)