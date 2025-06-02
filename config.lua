local Config = {}

Config.Locations = {
    vec3(2409.79, 3114.93, 48.59),
    vec3(2412.15, 3119.22, 49.64),
    vec3(2410.26, 3122.26, 49.67),
    vec3(2415.88, 3125.3, 49.4),
    vec3(2416.49, 3122.74, 49.14),
    vec3(2416.0, 3120.25, 48.68),
    vec3(2416.68, 3118.02, 48.51),
    vec3(2415.02, 3115.0, 49.73),
    vec3(2398.94, 3138.77, 49.54),
    vec3(2397.84, 3142.89, 49.27),
    vec3(2402.64, 3144.56, 49.6),
    vec3(2406.98, 3149.29, 48.88),
    vec3(2409.13, 3146.3, 49.58),
    vec3(2411.0, 3148.7, 49.47),
    vec3(2414.54, 3150.67, 49.34),
    vec3(2406.23, 3152.58, 49.62),
    vec3(2402.92, 3153.75, 49.67),
    vec3(2380.35, 3085.74, 49.32),
    vec3(2372.11, 3089.83, 49.21),
    vec3(2370.39, 3087.92, 49.27),
    vec3(2368.8, 3085.52, 49.11),
    vec3(2366.79, 3084.52, 48.62),
    vec3(2370.25, 3081.47, 49.13),
    vec3(2372.19, 3067.29, 48.9),
    vec3(2368.28, 3066.83, 48.75),
    vec3(2368.34, 3068.81, 48.83),
    vec3(2364.47, 3067.66, 49.37),
    vec3(2361.77, 3067.9, 49.22),
    vec3(2359.2, 3067.74, 49.35),
    vec3(2356.48, 3066.35, 48.42),
    vec3(2346.18, 3064.12, 48.38),
    vec3(2345.88, 3066.86, 48.38),
    vec3(2345.31, 3069.86, 49.36),
    vec3(2340.56, 3065.81, 49.96)
}

Config.ScrapItems = {
    'metalscrap',
    'iron',
    'steel',
    'glass',
    'rubber',
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