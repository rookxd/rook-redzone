



 
fx_version 'cerulean'
lua54 'yes'
game 'gta5'
client_scripts {
    'client.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}
shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/tr.lua',
    'config.lua',
    '@ox_lib/init.lua',
}
