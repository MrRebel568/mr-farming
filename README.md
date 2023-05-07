
# Mr-farming
Farming script for QBCore

# Farmings
- Optimized
- 7 Farms
- Easy to use config
- The ability to change notification language
- Toggle Blips Option (Config)

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-target](https://github.com/BerkieBb/qb-target)
- [qb-menu](https://github.com/qbcore-framework/qb-menu)
- [qb-smallresources](https://github.com/qbcore-framework/qb-smallresources)
- [PolyZone](https://github.com/mkafrin/PolyZone)

## Items (qb-core/shared/item.lua)
```
	["farm_coffee"]     			= {["name"] = "farm_coffee", 				    ["label"] = "Coffee", 						["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_coffee.png", 		    		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
    ["farm_potato"]    		= {["name"] = "farm_potato", 				    ["label"] = "Potato", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_potato.png", 		    	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
    ["farm_milk"]     		= {["name"] = "farm_milk", 				    ["label"] = "Milk", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_milk.png", 		    		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
    --Juice
    ["farm_juice_orange"]  		= {["name"] = "farm_juice_orange", 				["label"] = "Orange Juice", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_juice_orange.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["farm_juice_strawberries"]  		= {["name"] = "farm_juice_strawberries", 				["label"] = "Strawberries Juice", 						["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_juice_strawberries.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["farm_juice_apple"]  		= {["name"] = "farm_juice_apple", 				["label"] = "Apple Juice", 						["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_juice_apple.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
    ["farm_apples"]     		= {["name"] = "farm_apples", 				    ["label"] = "Apples", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_apples.png", 		    		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
    ["farm_oranges"]     			= {["name"] = "farm_oranges", 				    	["label"] = "Oranges", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_oranges.png", 		    		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["farm_coffee_seeds"]     			= {["name"] = "farm_coffee_seeds", 				    ["label"] = "Coffee Seeds", 						["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_coffee_seeds.png", 		    		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["farm_potato_seeds"]    		= {["name"] = "farm_potato_seeds", 				    ["label"] = "Potato Seeds", 					["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_potato_seeds.png", 		    	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["farm_strawberries"]     		= {["name"] = "farm_strawberries", 				    ["label"] = "Strawberries", 						["weight"] = 100, 		["type"] = "item", 			["image"] = "farm_strawberries.png", 		    		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["farming_hoe"]     		= {["name"] = "farming_hoe", 				    ["label"] = "Hoe.", 						["weight"] = 100, 		["type"] = "item", 			["image"] = "farming_hoe.png", 		    		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```

- For images move the images from the img folder to your inventory image folder **qb-inventory/html/images**

- If you are using lj-fuel or a different fuel system

- Change LegacyFuel to whatever fuel system in **mr-farming/Config,lua**

## qb-smallresources/config.lua
- ConsumeablesDrink
```
    ["farm_juice_orange"] = math.random(35, 54),
    ["farm_juice_strawberries"] = math.random(35, 54),
```

## Preview
https://youtu.be/qZ1eQfoshZY

## Discord
- [Join Discord](https://discord.gg/T2xX5WwmEX)
