fx_version 'cerulean'
game 'gta5'

description 'Simple Job Creator ingame with Command and qb-input for Admins.'
authour 'Kmack710#0710'
version '1.0.0'

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'data/server.lua'
}

client_scripts {
	'data/client.lua'
}

shared_scripts {
	'config.lua'
}

lua54 'yes'