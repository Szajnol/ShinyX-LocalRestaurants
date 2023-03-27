fx_version 'adamant'

game 'gta5'

description 'ShinyX-Deliveries'

version '1.0.0'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/main.js',
}

client_scripts {
	'config.lua',
}



server_scripts {
	'config.lua',
	'server/main.lua'
}

client_script '@sun_loader/c_loader.lua'
server_script '@sun_loader/s_loader.lua'
my_data 'client_files' { "config.lua", "client/main.lua" }

