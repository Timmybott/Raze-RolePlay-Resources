
-- Resource Metadata
fx_version 'bodacious'

games { 'gta5' }

author 'Timmy'
description 'CarryPeople'
version '1.0.0'

client_script "cl_carry.lua"
server_script "sv_carry.lua"

server_scripts { '@mysql-async/lib/MySQL.lua' }