fx_version 'cerulean'
game 'gta5'

author 'Raze RolePlay'
description 'raze_carstatus - Fahrzeuge ab-/aufschließen (G, 20m) & Motor an/aus (M) - nur eigene/gekaufte/geliehene/gemietete Fahrzeuge'
version '1.0.0'

client_script 'client.lua'
server_script 'server.lua'

-- Nutzt es_extended (getSharedObject) und oxmysql (owned_vehicles). Andere Resources
-- (raze_jobscreator, ry_rent) registrieren geliehene/gemietete Fahrzeuge über die
-- Exports Register/Unregister bzw. die Events raze_carstatus:register/unregister.
