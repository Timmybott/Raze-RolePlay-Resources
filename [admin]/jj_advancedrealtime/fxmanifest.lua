fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'jj_realtime'
description 'Clean realtime clock sync (server-authoritative) with timezone + EU DST'
author 'JayJay'

shared_scripts {
    'config.lua'
}

server_scripts {
    'server/server.lua'
}

client_scripts {
    'client/client.lua'
}
