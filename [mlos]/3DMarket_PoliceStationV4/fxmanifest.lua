fx_version 'cerulean'
game 'gta5'
author 'Escobar-Styler-3DMarket'
description 'Scenarios'
version '1.0.1'
lua54 'yes'
this_is_a_map 'yes'

replace_level_meta 'gta5'

dependencies { 
    '/server:4960',
    '/gameBuild:2545',
}

files {
    'gta5.meta',
    'doortuning.ymt',
    'mission_row.ymt',
    '3dmarket_timecycle_mrpd.xml',
    'audio/mrpd_door_sound_game.dat151.rel',
    'audio/B7820164_game.dat151.rel',
    'audio/95BA89A9_game.dat151.rel',
    'audio/D2000800_game.dat151.rel',
}

data_file 'TIMECYCLEMOD_FILE' '3dmarket_timecycle_mrpd.xml'
data_file 'SCENARIO_POINTS_OVERRIDE_PSO_FILE' 'mission_row.ymt'
data_file 'AUDIO_GAMEDATA' 'audio/mrpd_door_sound_game.dat'
data_file 'AUDIO_GAMEDATA' 'audio/B7820164_game.dat'
data_file 'AUDIO_GAMEDATA' 'audio/95BA89A9_game.dat'
data_file 'AUDIO_GAMEDATA' 'audio/D2000800_game.dat'
dependency '/assetpacks'