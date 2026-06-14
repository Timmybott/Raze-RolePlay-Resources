fx_version 'cerulean'
game 'gta5'

author 'Dein Name'
description 'Deine Ressource'
version '1.0.0'


-- Client-Skripte
client_scripts {
    'client.lua'
}

-- Dateien, die in die Ressource geladen werden sollen
files {
    'timecycle_raze_shader.xml'
}

-- Lade die Timecycle-Datei
data_file 'TIMECYCLEMOD_FILE' 'timecycle_raze_shader.xml'
