fx_version 'cerulean'
game 'gta5'

name 'nj_scrap'
description 'Enhanced junk car scrapping system with delivery missions for QBX servers'
author 'njtank'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client/cl_main.lua',
    'client/cl_target.lua',
    'client/cl_delivery.lua'
}

server_scripts {
    'server/sv_main.lua',
    'server/sv_delivery.lua'
}

dependencies {
    'qbx_core',
    'ox_inventory',
    'ox_lib',
    'ox_target'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'