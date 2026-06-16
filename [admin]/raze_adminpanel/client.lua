-- Raze Admin Panel – Client
-- Befehl zum Erfassen einer Position für den Job-Creator im Web-Panel.
-- Nutzung im Spiel:  /setjobloc            -> erfasst aktuelle Position
--                    /setjobloc Garage A   -> mit optionalem Label
RegisterCommand('setjobloc', function(_, args)
    local ped = PlayerPedId()
    local c = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local label = (args and #args > 0) and table.concat(args, ' ') or nil
    local coords = {
        x = math.floor(c.x * 100 + 0.5) / 100,
        y = math.floor(c.y * 100 + 0.5) / 100,
        -- Z bewusst um 0.5 nach oben versetzen (eine halbe Stelle über der
        -- erfassten Position).
        z = math.floor((c.z + 0.0) * 100 + 0.5) / 100,
        w = math.floor(heading * 100 + 0.5) / 100
    }
    TriggerServerEvent('raze_adminpanel:captureLocation', coords, label)
    if lib and lib.notify then
        lib.notify({ title = 'Job-Creator', description = ('Position erfasst (%.1f, %.1f, %.1f). Im Panel übernehmen.'):format(coords.x, coords.y, coords.z), type = 'success' })
    else
        print(('[RazeAdmin] Position erfasst: %.2f, %.2f, %.2f, %.2f'):format(coords.x, coords.y, coords.z, coords.w))
    end
end, false)
