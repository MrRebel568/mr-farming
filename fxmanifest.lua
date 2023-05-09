fx_version 'cerulean'
game 'gta5'

author 'MrRebel'
description 'Farming For QB-Core (mr-script)'
version '1.2.0'

client_scripts {
    'client/client.lua',
    'client/trees.lua',
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua'
}

shared_scripts {'Config.lua'}

server_scripts {'server/server.lua'}

dependencies {
    'PolyZone',
    'qb-menu',
    'qb-target'
}

lua54 'yes'
