local disabledFromClient

mainThread = function()
	while disabledFromClient do
            InvalidateIdleCam()
            InvalidateVehicleIdleCam()
	    Wait(5000)
	end
end

Citizen.CreateThread(function() 
    disabledFromClient = DisabledByDefault
    mainThread()
end)


function NotificationText(text)
    SetNotificationTextEntry('STRING')
	AddTextComponentSubstringPlayerName(text)
	DrawNotification(false, true)
end

