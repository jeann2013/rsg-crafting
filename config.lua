Config = {}

Config.Debug = false
Config.Keybind = 'J'

-- crafting locations
Config.CraftingLocations = {
    {name = 'Crafting', location = 'crafting-valentine',  coords = vector3(-369.44, 796.08, 116.2),          showblip = true},
    {name = 'Crafting', location = 'crafting-macfarlane', coords = vector3(-2396.77, -2378.013, 61.259555),  showblip = true},
    {name = 'Crafting', location = 'crafting-tumbleweed', coords = vector3(-5515.188, -3039.042, -2.387692), showblip = true},
    {name = 'Crafting', location = 'crafting-stdenis',    coords = vector3(2515.6494, -1456.475, 46.312046), showblip = true},
    {name = 'Crafting', location = 'crafting-rhodes',     coords = vector3(1310.8607, -1354.886, 78.023361), showblip = true},
    {name = 'Crafting', location = 'crafting-blackwater', coords = vector3(-878.9779, -1368.06, 43.526493),  showblip = true},
    {name = 'Crafting', location = 'crafting-annesburg',  coords = vector3(2982.2646, 1433.3532, 44.759983), showblip = true},
}

Config.Crafting = {

    {
        title =  'Shovel',
        description = '3 x Steel & 1 x Wood',
        category = 'tools',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = "steel",     amount = 3 },
            [2] = { item = "wood",      amount = 1 },
        },
        receive = "shovel",
        giveamount = 1
    },
    {
        title =  'Axe',
        description = '3 x Steel & 1 x Wood',
        category = 'tools',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = "steel",     amount = 3 },
            [2] = { item = "wood",      amount = 1 },
        },
        receive = "axe",
        giveamount = 1
    },
    {
        title =  'Pickaxe',
        description = '3 x Steel & 1 x Wood',
        category = 'tools',
        crafttime = 30000,
        ingredients = { 
            [1] = { item = "steel",     amount = 3 },
            [2] = { item = "wood",      amount = 1 },
        },
        receive = "pickaxe",
        giveamount = 1
    },
    
}
