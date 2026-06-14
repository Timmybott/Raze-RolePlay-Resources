fx_version 'cerulean'
game 'gta5'

author 'Raze RolePlay'
description 'Raze Job Creator - Job-Locations (Lager, Garage, Fahrzeug-Shop, Umkleide) aus raze_job_data'
version '1.0.0'

shared_script '@ox_lib/init.lua'

server_script 'server.lua'
client_script 'client.lua'

-- Liest raze_job_data (vom raze_adminpanel/Web-Panel gepflegt) und setzt die
-- Job-Locations im Spiel um. Schreibt NICHTS in fremde Scripte; Stashes laufen
-- über die offizielle ox_inventory-API (RegisterStash).
