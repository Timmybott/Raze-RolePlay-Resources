fx_version 'cerulean'
game 'gta5'
author '.zeusx#2743'
version '2.7'
description 'User Interface for FiveM'
lua54 'yes'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/assets/*.js',
    'html/assets/*.css',
    'html/assets/*.mp3',
    'html/assets/*.ogg',
    'stream/map_timecycle_stream.xml',
    'sprites/interaction.html',
    'sprites/point.html',
    'sprites/ply_dui.html',
    'client/overrides/theme/style.css',
}

shared_scripts {
    'shared/functions/*.lua',
    'shared/*.lua',
    'shared/translations/*.lua',
    'shared/ui_cfg/*.lua',
}

client_scripts {
    'client/config/*.lua',
    'client/functions/effects/*.lua',
    'client/commands/*.lua',
    'client/functions/data/*.lua',
    'client/functions/handlers/*.lua',
    'client/functions/handlers/duis/*.lua',
    'client/functions/components/*.lua',
    'client/overrides/natives/*.lua',
    'client/functions/threads/init.lua',
    'client/functions/threads/*.lua',
    'client/overrides/*.lua',
    'client/*.lua',
    'client/addon/*.lua',
}

server_scripts {
    'server/config/*.lua',
    'server/handlers/*.lua',
    'server/components/*.lua',
    'server/*.lua',
    'server/autoinstall/install_handler.lua',
}

escrow_ignore {
    'shared/*.lua',
    'shared/ui_cfg/*.lua',
    'shared/translations/*.lua',
    'client/functions/components/chat.lua',
    'client/addon/*.lua',
    'client/config/*.lua',
    'client/cl_baseevents.lua',
    'client/exports.lua',
    'client/keymapping.lua',
    'client/lib.lua',
    'client/workers.lua',
    'client/commands/*.lua',
    
    'server/handlers/versionchecker.lua',
    'server/*.lua',
    'server/config/*.lua',
    'server/components/*.lua',
    'server/autoinstall/*.lua',
    'server/autoinstall/code_variables/*.lua'
}


data_file "TIMECYCLEMOD_FILE" "stream/map_timecycle_stream.xml"
dependency '/assetpacks'



















































