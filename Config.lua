print("^2MR^7-^2Farming v^42^7.^48^7.^45 ^7- ^2mr-farming Script by ^1MrRebel^7")

Config = {}

Config.Core = 'qb-core'
Config.InventoryTrigger = 'inventory:client:ItemBox'
Config.Phone = 'qb-phone:server:sendNewMail'
Config.QBTarget = "qb-target"
Config.QBMenu = "qb-menu"
Config.QBLock = "ps-ui"

Config.Payment = "bank" --cash/bank

--Blips
Config.Blips = {
    -- Job ped
    {title = 'Farming', colour = 5, id = 1, coords = vector3(2309.68, 4885.79, 41.81), scale = 0.6, useblip = true},
    -- Blips Farmer Coffee
    {title = 'Farm Coffee', colour = 5, id = 1, coords = vector3(2298.27, 5140.95, 52.49), scale = 0.6, useblip = true},
    -- Blips Pick Up Seeds Potatoes
    {title = 'Farm Potatoes', colour = 5, id = 1, coords = vector3(2138.98, 5143.56, 50.07), scale = 0.6, useblip = true},
    -- Blips Pick Up Seeds Strawberry
    {title = 'Farm Strawberry', colour = 5, id = 1, coords = vector3(262.12, 6652.21, 29.92), scale = 0.6, useblip = true},
    -- Processing
    {title = 'Process Seeds', colour = 5, id = 1, coords = vector3(2406.68, 5019.28, 46.15), scale = 0.6, useblip = true},
    -- Blips Process Apple Seeds
    {title = 'Farm Apples / Oranges', colour = 5, id = 1, coords = vector3(352.43, 6520.76, 28.48), scale = 0.6, useblip = true},
    -- Blips Make Juices
    {title = 'Make Juices', colour = 5, id = 1, coords = vector3(2016.89, 4986.67, 42.1), scale = 0.6, useblip = true},
}

-- Ped settings
Config.Peds = {
    -- Start
    {coords = vector4(2310.05, 4884.79, 41.81, 50.81), model = 's_m_y_garbage', scenario = 'WORLD_HUMAN_SMOKING'},
    -- Make Juices
    {coords = vector4(2016.59, 4987.79, 42.1, 174.61), model = 's_m_y_garbage', scenario = 'WORLD_HUMAN_SMOKING'},
}


-- Car
Config.Fuel = "LegacyFuel"                                          -- Name of your fuel script
Config.VehicleKeysTrigger = "vehiclekeys:client:SetOwner"           -- Trigger to give vehiclekeys
Config.VehicleName = "tractor2"


Config.Alerts = {
    -- Notifications
    ["Vehiclestored"]             = "Farming Vehicle Stored",
    ["NoHoe"]                     = "you dont have hoe!",
    ["Already"]                     = "you have already hoe",
    ["Failed"]                    = "You failed!",
    ["PocketFull"]                    = "Pockets Full..",
    ["AllDone"]             = "All Done!",
    ["WrongItems"]          = "Wrong items.",
    ["MissingSomething"]    = "Missing Something...",
    ["NothingToSell"]       = "You dont have anything to sell",
    ["NoItem"]       = "You do not have the rigth items...",
    -- Progressbars
    ["ProgressCoffe"]         = "Picking up coffee seeds...",
    ["ProgressPotato"]      = "Picking up potato seeds...",
    ["ProgressStrawberries"]     = "Picking strawberries...",
    ["PickOrange"]     = "Picking oranges..",
    ["PickApple"]        = "Picking apples..",
    ["Processarcoffee"]       = "Processing coffee seeds...",
    ["Processarpotato"]    = "Processing potato seeds...",

    --Targets
    ["HarvestCoffee"]         = "Harvest Coffee Seeds",
    ["HarvestStrawberry"]     = "Harvest Strawberry Seeds",
    ["HarvestPotatoes"]      = "Harvest Potatoes Seeds",
    ["Processar"]           = "Process",
    ["IconProcessar"]       = "fas fa-seedling",
    ["FarmerBoss"]        = "Talk with employee",
    ["IconFarmerBoss"]    = "fas fa-seedling",
    ["IconMilk"]            = "Take Milk",
    ["TakeMilk"]            = "fa-solid fa-blender",
    ["TakeApples"]          = "Pick Apples",
    ["IconApples"]          = "fab fa-apple",
    ["TakeOranges"]         = "Pick Oranges",
    ["IconOranges"]         = "fab fa-apple",
    ["MakeJuices"]          = "Make Juices",
    ["IconJuices"]          = "fa-solid fa-wine-glass",
    --Menu
    ["Processar"] = "[➿] Process",
    ["SubHeaderProcessar"] = "",
    ["ProcessarCoffee"] = "[🌰] Process Coffee Seeds",
    ["ReceivedCoffee"] = "You receive: 1x Coffee",
    ["ProcessarPotato"] = "[🥭] Process Potato Seeds",
    ["ReceivedPotato"] = "You receive: 1x Potatos",
    ["EmbalarLeite"] = "[🥛] Pack Milk",
    ["ReceivedMilk"] = "You receive: 1x Packaged Milk",
    ["EmbalarMacas"] = "[🍎] Pack apples",
    ["ReceivedMacas"] = "You receive: 1x Packaged Apples",
    ["Close"] = "[❌] Close",
    -- Selling
    ["HeaderSellItems"] = "[💵] Sell Items",
    ["VenderCoffee"] = "[🌰] Sell Coffee",
    ["TxtVenderCoffee"] = "Price: $",
    ["VenderPotatos"] = "[🥭] Sell Potatoes",
    ["TxtVenderPotatos"] = "Price: $",
    ["VenderApple"] = "[🍎] Sell Apples",
    ["TxtVenderApple"] = "Price: $",
    ["VenderStrawberries"] = "[🍓] Sell Strawberries",
    ["TxtVenderStrawberries"] = "Price: $",
    ["VenderOranges"] = "[🍊] Sell Oranges",
    ["TxtVenderOranges"] = "Price: $",
    ["VenderTomates"] = "[🍅] Sell Tomatoes",
    ["TxtVenderTomates"] = "Price: $",
    ["VenderMilk"] = "[🥛] Sell Milk",
    ["TxtVenderMilk"] = "Price: $",
    -- General
    ["Employee"] = "[🌾] Farm Employee",
    ["NeedHoe"] = "[🪒] I need a hoe!",
    ["NeedTrator"] = "[🚜] I need a tractor!",
    ["DevolverTrator"] = "[🚜] Deliver tractor",
    ["ItemSell"] = "[🌽] I want to sell crops!",
    ["OpenShop"] = "[📦] Open Shop",
        -- Juices
    ["JuicesMake"] = "[🍸] Make Juices",
    ["VariosJuices"] = "You will need some ingredients",
    ["SumoMaca"] = "[🍎] Apple Juice",
    ["NecessarioSumoMaca"] = "Requires: 1x Apple",
    ["JuiceStrawberry"] = "[🍓] Strawberry Juice",
    ["NecessarioJuiceStrawberry"] = "Requires: 1x Strawberry",
    ["JuiceOrange"] = "[🍊] Orange Juice",
    ["NecessarioJuiceOrange"] = "Requires: 1x Orange",
}

-- Farms

Config.PlantasCoffee = vector3(2302.26, 5132.57, 51.1) -- Farm Coffee Seeds

Config.PlantasPotato = vector3(2141.96, 5143.38, 50.13) -- Farm Potatoes Seeds

Config.PlantasStrawberry = vector3(264.37, 6650.13, 28.04) -- Farm Strawberry

