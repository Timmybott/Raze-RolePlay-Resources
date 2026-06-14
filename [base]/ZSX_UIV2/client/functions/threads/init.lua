Threads = Threads or {}

Citizen.CreateThread(function()
    Wait(1000)
    debugPrint("[^6THREADS^7] Awaiting storage to load")

    Threads.Components.Init()
    Threads.Players.Init()
    Threads.GameplayCam.Init()

    while true do
        if Storage.Data.createdUI then
            break
        end
        Wait(0)
    end

    Threads.Point.Init()
    Threads.Chat.Init()
    Threads.Vehicles.Init()
    Threads.Weapon.Init()
    Threads.Hud.Init()
    Threads.DUI.Init()

    debugPrint("[^6THREADS^7] Loaded")
end)
