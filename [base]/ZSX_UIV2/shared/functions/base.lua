-- Funktion f�r Debug-Ausgaben
local function localDebugPrint(message)
    -- Pr�fen, ob Config.Debug aktiv ist
    if not Config.Debug then
        return
    end
    
    -- Nachricht formatieren und ausgeben
    -- ^5 und ^7 sind Farbcodes (typisch f�r FiveM/GTA)
    print("^5[INTERFACE] ^7" .. message)
end

-- Zuweisung zur globalen Variable
debugPrint = localDebugPrint

-- Initialisierung der Library-Tabelle
_Lib = {}

-- Funktion: Generiert einen zuf�lligen alphanumerischen String
function _Lib.GenerateRandomString(length)
    local charTable = {}
    
    for i = 1, length do
        local randomChar
        
        -- Zufallsentscheidung: 1 = Buchstabe, 2 = Zahl
        if math.random(1, 2) == 1 then
            -- Gro�buchstabe A-Z (ASCII 65-90)
            randomChar = string.char(math.random(65, 90))
        else
            -- Zahl 0-9
            randomChar = tostring(math.random(0, 9))
        end
        
        table.insert(charTable, randomChar)
    end
    
    return table.concat(charTable)
end

-- Funktion: Konvertiert eine Tabelle (Argumente) in einen String
function _Lib.ConvertArgumentsToString(arguments)
    local resultString = ""
    
    for _, value in ipairs(arguments) do
        -- F�gt vor jedem Wert ein Leerzeichen ein
        resultString = resultString .. " " .. value
    end
    
    return resultString
end
