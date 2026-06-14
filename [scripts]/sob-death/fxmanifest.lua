fx_version 'adamant'
games { 'gta5' }
author 'steaxscripts.com'

shared_script '@es_extended/imports.lua'
shared_script '@ox_lib/init.lua'

client_script('client.lua')
server_script('server.lua')

ui_page('html/index.html')


files {'html/index.html', 'html/style.css', 'html/script.js'}

lua54 'yes'
