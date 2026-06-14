fx_version 'cerulean'
game 'gta5'

name 'raze_revive'
description 'ESX revive/heal Kompatibilität ohne esx_ambulance'
author 'Raze Revive'
version '1.0.0'

lua54 'yes'

shared_scripts {
    '@es_extended/imports.lua'
}

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

dependencies {
    'es_extended'
}
