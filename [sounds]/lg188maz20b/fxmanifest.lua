fx_version 'cerulean'
games {'gta5'}

author 'GOM'
description 'Declasse Yosemite DRT'
version '3.0.0'

data_file "AUDIO_SYNTHDATA" "audioconfig/lg188maz20b_amp.dat"
data_file "AUDIO_GAMEDATA" "audioconfig/lg188maz20b_game.dat"
data_file "AUDIO_SOUNDDATA" "audioconfig/lg188maz20b_sounds.dat"
data_file "AUDIO_WAVEPACK" "sfx/dlc_lg188maz20b"

files {
  "audioconfig/*.dat151.rel",
  "audioconfig/*.dat54.rel",
  "audioconfig/*.dat10.rel",
  "sfx/**/*.awc"
}


lua54 'yes'