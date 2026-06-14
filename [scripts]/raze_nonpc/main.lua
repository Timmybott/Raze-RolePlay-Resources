Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Prevent crashing.

		-- Stop Spawn
		SetCreateRandomCops(false)
		SetCreateRandomCopsNotOnScenarios(false)
		SetCreateRandomCopsOnScenarios(false)
		SetGarbageTrucks(false)
		SetRandomBoats(false)
       		SetVehicleDensityMultiplierThisFrame(0.0) -- (0.1) Auf Null zum reset (Wie immer)
       		SetPedDensityMultiplierThisFrame(0.0) -- (0.1) Auf Null zum reset (Wie immer)
		SetRandomVehicleDensityMultiplierThisFrame(0.0) -- (0.3) Auf Null zum reset (Wie immer)
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
		SetParkedVehicleDensityMultiplierThisFrame(0.0) -- (0.0) Auf Null zum reset (Wie immer)

		-- Clear NPC
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
    end
end)
