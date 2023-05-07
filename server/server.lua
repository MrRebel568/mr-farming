local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mr-farming:server:buyhoe', function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(tonumber(source))
    local HoeRebelPrice = 100
    local hoe = Player.Functions.GetItemByName('farming_hoe')
    if not hoe then
        Player.Functions.AddItem('farming_hoe', 1)
        TriggerClientEvent(Config.InventoryItemBox, source, QBCore.Shared.Items['farming_hoe'], "add")
        Player.Functions.RemoveMoney("cash", HoeRebelPrice)
    elseif hoe then
        TriggerClientEvent('QBCore:Notify', source, Config.Alerts["Already"])
    end
end)

RegisterServerEvent('mr-farming:server:coffe', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local Rebel = 1
        if Player.Functions.AddItem("farm_coffee_seeds", Rebel) then   
        TriggerClientEvent(Config.InventoryItemBox, src, QBCore.Shared.Items["farm_coffee_seeds"], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Config.Alerts["PocketFull"], 'error')
    end		
end)

RegisterNetEvent('mr-farming:server:cowmilk', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Item = 'farm_milk'
    local Mr = math.random(2, 3)

    Player.Functions.AddItem(Item, Mr)
end)

RegisterServerEvent('mr-farming:server:potato', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local Rebel = 1
        if Player.Functions.AddItem("farm_potato_seeds", Rebel) then   
        TriggerClientEvent(Config.InventoryItemBox, src, QBCore.Shared.Items["farm_potato_seeds"], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Config.Alerts["PocketFull"], 'error')
    end		
end)

RegisterServerEvent('mr-farming:server:strawberries', function() 
    local src = source
    local Player  = QBCore.Functions.GetPlayer(src)
    local Rebel = 1
        if Player.Functions.AddItem("farm_strawberries", Rebel) then   
        TriggerClientEvent(Config.InventoryItemBox, src, QBCore.Shared.Items["farm_strawberries_seeds"], 'add')
    else
        TriggerClientEvent('QBCore:Notify', src, Config.Alerts["PocketFull"], 'error')
    end		
end)

RegisterServerEvent("mr-farming:server:processcoffee", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Rebel = 1
    local coffee = Player.Functions.GetItemByName("farm_coffee_seeds")
    if coffee ~= nil then

        if coffee.amount >= 1 then
            Player.Functions.RemoveItem("farm_coffee_seeds", 1)
            Player.Functions.AddItem("farm_coffee", Rebel)
            TriggerClientEvent(Config.InventoryTrigger, source, QBCore.Shared.Items["farm_coffee"], "add")
            TriggerClientEvent('QBCore:Notify', src, Config.Alerts["AllDone"])
        else
            TriggerClientEvent('QBCore:Notify', src, Config.Alerts["WrongItems"], 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, Config.Alerts["MissingSomething"], "error")
    end
end)

RegisterServerEvent("mr-farming:server:processpatato", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Rebel = 1
    local potato = Player.Functions.GetItemByName("farm_potato_seeds")
    if potato ~= nil then

        if potato.amount >= 1 then
            Player.Functions.RemoveItem("farm_potato_seeds", 1)
            Player.Functions.AddItem("farm_potato", Rebel)
            TriggerClientEvent(Config.InventoryTrigger, source, QBCore.Shared.Items["farm_potato"], "add")
            TriggerClientEvent('QBCore:Notify', src, Config.Alerts["AllDone"])
        else
            TriggerClientEvent('QBCore:Notify', src, Config.Alerts["WrongItems"], 'error')
        end
    else
        TriggerClientEvent("QBCore:Notify", src, Config.Alerts["MissingSomething"], "error")
    end
end)

RegisterNetEvent('mr-farming:server:mrseller', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then 
		local coffee = Player.Functions.GetItemByName("farm_coffee")
		if coffee ~= nil then
			local payment = math.random(2, 5)
			Player.Functions.RemoveItem("farm_coffee", 1, k)
			Player.Functions.AddMoney(Config.Payment, payment , "coffee_sell")
			TriggerClientEvent(Config.InventoryTrigger, source, QBCore.Shared.Items['farm_coffee'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 "..source.." sell for $"..payment, "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Alerts["NothingToSell"], "error")
        end
	elseif args == 2 then
		local potato = Player.Functions.GetItemByName("farm_potato")
		if potato ~= nil then
			local payment = math.random(2, 5)
			Player.Functions.RemoveItem("farm_potato", 1, k)
			Player.Functions.AddMoney(Config.Payment, payment , "potato_sell")
			TriggerClientEvent(Config.InventoryTrigger, source, QBCore.Shared.Items['farm_potato'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 "..source.."  sell for $"..payment, "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Alerts["NothingToSell"], "error")
        end
	elseif args == 3 then
		local strawberries = Player.Functions.GetItemByName("farm_strawberries")
		if strawberries ~= nil then
			local payment = math.random(2, 5)
			Player.Functions.RemoveItem("farm_strawberries", 1, k)
			Player.Functions.AddMoney(Config.Payment, payment , "strawberries_sell")
			TriggerClientEvent(Config.InventoryTrigger, source, QBCore.Shared.Items['farm_strawberries'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 "..source.."  sell for $"..payment, "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Alerts["NothingToSell"], "error")
        end
    elseif args == 4 then
		local oranges = Player.Functions.GetItemByName("farm_oranges")
		if oranges ~= nil then
			local payment = math.random(2, 5)
			Player.Functions.RemoveItem("farm_oranges", 1, k)
			Player.Functions.AddMoney(Config.Payment, payment , "oranges_sell")
			TriggerClientEvent(Config.InventoryTrigger, source, QBCore.Shared.Items['farm_oranges'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 "..source.." sell for $"..payment, "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Alerts["NothingToSell"], "error")
		end
    elseif args == 5 then
		local apples = Player.Functions.GetItemByName("farm_apples")
		if apples ~= nil then
			local payment = math.random(2, 5)
			Player.Functions.RemoveItem("farm_apples", 1, k)
			Player.Functions.AddMoney(Config.Payment, payment , "apples_sell")
			TriggerClientEvent(Config.InventoryTrigger, source, QBCore.Shared.Items['farm_apples'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 "..source.." sell for $"..payment, "success")
		else
		    TriggerClientEvent('QBCore:Notify', src, Config.Alerts["NothingToSell"], "error")
		end
    elseif args == 6 then
		local milk = Player.Functions.GetItemByName("farm_milk") 
		if milk ~= nil then
			local payment = math.random(2, 5)
			Player.Functions.RemoveItem("farm_milk", 1, k)
			Player.Functions.AddMoney(Config.Payment, payment , "milk_sell")
			TriggerClientEvent(Config.InventoryTrigger, source, QBCore.Shared.Items['farm_milk'], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 "..source.." sell for $"..payment, "success")
		else
			TriggerClientEvent('QBCore:Notify', src, Config.Alerts["NothingToSell"], "error")
		end
    end
end)

RegisterNetEvent('mr-farming:server:orangejuicesv', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'farm_oranges'
    local item2 = 'farm_juice_orange'
    local Rebel = 1
    local GetItem = Player.Functions.GetItemByName(item)
    if GetItem ~= nil then

        if GetItem.amount >= 1 then
            Player.Functions.RemoveItem(item, Rebel)
            Player.Functions.AddItem(item2, Rebel)
        else
            TriggerClientEvent("QBCore:Notify", src, Config.Alerts["NoItem"], "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", src, Config.Alerts["NoItem"], "error")
    end
end)

RegisterNetEvent('mr-farming:server:strawberryjuicesv', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'farm_strawberries'
    local item2 = 'farm_juice_strawberries'
    local Rebel = 1
    local GetItem = Player.Functions.GetItemByName(item)
    if GetItem ~= nil then

        if GetItem.amount >= 1 then
            Player.Functions.RemoveItem(item, Rebel)
            Player.Functions.AddItem(item2, Rebel)
        else
            TriggerClientEvent("QBCore:Notify", src, Config.Alerts["NoItem"], "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", src, Config.Alerts["NoItem"], "error")
    end
end)

RegisterNetEvent('mr-farming:server:Appletrees', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rebel = math.random(1, 2)
    local item = 'farm_apples'

    Player.Functions.AddItem(item, rebel)
end)

RegisterNetEvent('mr-farming:server:orangestrees', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rebel = math.random(1, 2)
    local item = 'farm_oranges'

    Player.Functions.AddItem(item, rebel)
end)
