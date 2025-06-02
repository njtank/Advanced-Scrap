local Config = {}

Config.Locations = {
    vec3(2404.92, 3128.02, 48.15),
    vec3(2409.32, 3098.67, 48.15),
    vec3(2418.13, 3078.44, 48.15)
}

Config.ScrapItems = {
    'scrap_metal',
    'iron',
    'steel',
    'glass',
    'copper',
    'electronic_parts'
}

Config.MinItems = 1
Config.MaxItems = 7

Config.ScrapCooldown = 10

Config.ScrapsBeforeDelivery = 10

Config.DeliveryReward = 500

Config.DeliveryNPC = vec4(2415.0, 3085.0, 48.15, 180.0)

Config.DeliveryLocations = {
    vec3(2350.0, 3130.0, 48.15),
    vec3(2450.0, 3130.0, 48.15),
    vec3(2350.0, 3070.0, 48.15),
    vec3(2450.0, 3070.0, 48.15),
    vec3(2400.0, 3150.0, 48.15),
    vec3(2400.0, 3050.0, 48.15),
    vec3(2300.0, 3100.0, 48.15),
    vec3(2500.0, 3100.0, 48.15)
}

Config.TargetOptions = {
    scrapLabel = 'Scrap Vehicle',
    scrapIcon = 'fas fa-car-crash',
    deliveryLabel = 'Collect Delivery Package',
    deliveryIcon = 'fas fa-box',
    dropoffLabel = 'Deliver Package',
    dropoffIcon = 'fas fa-truck-ramp-box',
    distance = 2.5
}

Config.NPCModel = 's_m_y_construct_01'

Config.ScrapProgress = {
    duration = 12000, -- in milliseconds
    label = 'Scrapping vehicle...',
    animation = {
        dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        clip = 'machinic_loop_mechandplayer'
    }
}

return Config