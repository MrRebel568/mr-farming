local QBCore = exports['qb-core']:GetCoreObject()
local spawnedcoffePlants = 0
local spawnedpotatoPlants = 0
local spawnedstrawberriePlants = 0
local strawberriePlants = {}
local coffePlants = {}
local potatoPlants = {}

--Event

RegisterNetEvent('mr-farming:client:gethoe', function()
    TriggerServerEvent('mr-farming:server:buyhoe')
end)

RegisterNetEvent('mr-farming:client:Getvehicle', function()
    local vehicle = Config.VehicleName
    local coords = vector4(2309.24, 4888.49, 41.81, 345.41)
    local MR = PlayerPedId()
    RequestModel(vehicle)
    while not HasModelLoaded(vehicle) do
        Wait(0)
    end
    if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
        local FarmVehicle = CreateVehicle(vehicle, coords, 45.0, true, false)
        SetVehicleHasBeenOwnedByPlayer(FarmVehicle,  true)
        SetEntityAsMissionEntity(FarmVehicle,  true,  true)
        exports[Config.Fuel]:SetFuel(FarmVehicle, 100.0)
        local id = NetworkGetNetworkIdFromEntity(FarmVehicle)
        DoScreenFadeOut(1000)
        Wait(1000)
        SetNetworkIdCanMigrate(id, true)
        TaskWarpPedIntoVehicle(MR, FarmVehicle, -1)
        TriggerEvent(Config.VehicleKeysTrigger, QBCore.Functions.GetPlate(FarmVehicle))
        DoScreenFadeIn(1000)
    end
end)

RegisterNetEvent('mr-farming:client:orangejuice', function()
    TriggerServerEvent('mr-farming:server:orangejuicesv')
end)

RegisterNetEvent('mr-farming:client:strawberryjuice', function()
    TriggerServerEvent('mr-farming:server:strawberryjuicesv')
end)

RegisterNetEvent('mr-farming:client:Putvehicle', function()
    local MR = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(MR,true)
    DeleteVehicle(vehicle)
    QBCore.Functions.Notify(Config.Alerts["Vehiclestored"])
end)

RegisterNetEvent('mr-farming:client:cowmilk', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar('ordenhar_vaca', 'MILKING COW...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent('mr-farming:server:cowmilk')
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('You have milked an Cow!', 'success', 7500)
    end)
end)

RegisterNetEvent('mr-farming:client:Coffefarm', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID
        for i=1, #coffePlants, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(coffePlants[i]), false) < 1.2 then
                nearbyObject, nearbyID = coffePlants[i], i
            end
        end
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
			isPickingUp = true
			TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
			QBCore.Functions.Progressbar('name_here', Config.Alerts["ProgressCoffe"], 4000, false, true, {
		    disableMovement = true,
		    disableCarMovement = true,
		    disableMouse = false,
		    disableCombat = true,
			}, {}, {}, {}, function()
				ClearPedTasks(playerPed)
				Wait(1000)
				DeleteObject(nearbyObject) 
				table.remove(coffePlants, nearbyID)
				spawnedcoffePlants = spawnedcoffePlants - 1
				TriggerServerEvent('mr-farming:server:coffe')
			end)
        else
            local requiredItems = {
				[1] = {name = QBCore.Shared.Items['farming_hoe']["name"], image = QBCore.Shared.Items['farming_hoe']["image"]},
			}  
			QBCore.Functions.Notify(Config.Alerts["NoHoe"], 'error', 2500)
			TriggerEvent('inventory:client:requiredItems', requiredItems, true)
			Wait(3000)
			TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        end
    end, 'farming_hoe')
end)

RegisterNetEvent('mr-farming:client:Potatofarm', function()
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed)
                local nearbyObject, nearbyID
                for i=1, #coffePlants, 1 do
                    if GetDistanceBetweenCoords(coords, GetEntityCoords(coffePlants[i]), false) < 1.2 then
                        nearbyObject, nearbyID = coffePlants[i], i
                    end
                end
                QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                    if HasItem then
                isPickingUp = true
                TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
                QBCore.Functions.Progressbar('name_here', Config.Alerts["ProgressPotato"], 4000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
                }, {}, {}, {}, function()
                    ClearPedTasks(playerPed)
                    Wait(1000)
                    DeleteObject(nearbyObject) 
                    table.remove(coffePlants, nearbyID)
                    spawnedpotatoPlants = spawnedpotatoPlants - 1
                TriggerServerEvent('mr-farming:server:potato')
            end)
        else
            local requiredItems = {
				[1] = {name = QBCore.Shared.Items['farming_hoe']["name"], image = QBCore.Shared.Items['farming_hoe']["image"]},
			}  
            QBCore.Functions.Notify(Config.Alerts["NoHoe"], 'error', 2500)
            TriggerEvent('inventory:client:requiredItems', requiredItems, true)
			Wait(3000)
			TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        end
    end, 'farming_hoe')
end)


RegisterNetEvent('mr-farming:client:Strawberriefarm', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local nearbyObject, nearbyID
        for i=1, #strawberriePlants, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(strawberriePlants[i]), false) < 1.2 then
                nearbyObject, nearbyID = strawberriePlants[i], i
            end
        end
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
			isPickingUp = true
			TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
			QBCore.Functions.Progressbar('name_here', Config.Alerts["ProgressStrawberries"], 4000, false, true, {
		    disableMovement = true,
		    disableCarMovement = true,
		    disableMouse = false,
		    disableCombat = true,
			}, {}, {}, {}, function()
				ClearPedTasks(playerPed)
				Wait(1000)
				DeleteObject(nearbyObject) 
				table.remove(strawberriePlants, nearbyID)
				spawnedstrawberriePlants = spawnedstrawberriePlants - 1
				TriggerServerEvent('mr-farming:server:strawberries')
			end)
        else
            local requiredItems = {
				[1] = {name = QBCore.Shared.Items['farming_hoe']["name"], image = QBCore.Shared.Items['farming_hoe']["image"]},
			}  
			QBCore.Functions.Notify(Config.Alerts["NoHoe"], 'error', 2500)
			TriggerEvent('inventory:client:requiredItems', requiredItems, true)
			Wait(3000)
			TriggerEvent('inventory:client:requiredItems', requiredItems, false)
        end
    end, 'farming_hoe')
end)

RegisterNetEvent('mr-farming:client:appletree', function(data)
    local ped = PlayerPedId()
QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
    if HasItem then
    QBCore.Functions.Progressbar('pick-fiel', Config.Alerts["PickOrange"], 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'hotwire',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(ped)
        TriggerServerEvent('mr-farming:server:Appletrees')
    end)
else
    QBCore.Functions.Notify(Config.Alerts["NoHoe"], 'error', 2500)
end
end, 'farming_hoe')
end)

RegisterNetEvent('mr-farming:client:orangestree', function(data)
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
    QBCore.Functions.Progressbar('pick-fiel', Config.Alerts["PickApple"], 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@',
        anim = 'hotwire',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(ped)
        TriggerServerEvent('mr-farming:server:orangestrees')
    end)
else
    QBCore.Functions.Notify(Config.Alerts["NoHoe"], 'error', 2500)
end
end, 'farming_hoe')
end)

RegisterNetEvent('mr-farming:client:processcoffee', function()
    QBCore.Functions.Progressbar("farm_process", "Processing coffee seeds...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 16,
    }, {}, {}, function() 
        local playerPed = PlayerPedId()
        exports[Config.QBLock]:Circle(function(success)
            if success then
                StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
                TriggerServerEvent("mr-farming:server:processcoffee")
                ClearPedTasks(playerPed)
            else
                QBCore.Functions.Notify(Config.Alerts["Failed"], "error")
                ClearPedTasks(playerPed)
            end
        end, 3,10) -- NumberOfCircles, MS
    end)
end)

RegisterNetEvent('mr-farming:client:processpatato', function()
    QBCore.Functions.Progressbar("farm_process", Config.Alerts["Processarpotato"], 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 16,
    }, {}, {}, function() 
        local playerPed = PlayerPedId()
        exports[Config.QBLock]:Circle(function(success)
            if success then
                StopAnimTask(ped, dict, "machinic_loop_mechandplayer", 1.0)
                TriggerServerEvent("mr-farming:server:processpatato")
                ClearPedTasks(playerPed)
            else
                QBCore.Functions.Notify(Config.Alerts["Failed"], "error")
                ClearPedTasks(playerPed)
            end
        end, 3,10) -- NumberOfCircles, MS
    end)
end)

--Blips/Peds

CreateThread(function()
    RequestModel("s_m_y_garbage")
      while not HasModelLoaded("s_m_y_garbage") do
      Wait(1)
    end
      MRboss = CreatePed(2, "s_m_y_garbage", 2310.05, 4884.79, 40.81, 46.66, false, false) 
      SetPedFleeAttributes(MRboss, 0, 0)
      SetPedDiesWhenInjured(MRboss, false)
      TaskStartScenarioInPlace(MRboss, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
      SetPedKeepTask(MRboss, true)
      SetBlockingOfNonTemporaryEvents(MRboss, true)
      SetEntityInvincible(MRboss, true)
      FreezeEntityPosition(MRboss, true)

      MRboss = CreatePed(2, "s_m_y_garbage", 2016.59, 4987.79, 41.1, 183.4, false, false) 
      SetPedFleeAttributes(MRboss, 0, 0)
      SetPedDiesWhenInjured(MRboss, false)
      TaskStartScenarioInPlace(MRboss, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
      SetPedKeepTask(MRboss, true)
      SetBlockingOfNonTemporaryEvents(MRboss, true)
      SetEntityInvincible(MRboss, true)
      FreezeEntityPosition(MRboss, true)
end)

CreateThread(function()
    MRBlip = AddBlipForCoord(Config.BlipFarmBoss)
    SetBlipSprite (MRblip, 78)
    SetBlipDisplay(MRblip, 2)
    SetBlipScale  (MRblip, 0.7)
    SetBlipAsShortRange(MRBlip, true)
    SetBlipColour(MRblip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.BlipFarmBossName)
    EndTextCommandSetBlipName(MRBlip)

    MRBlip = AddBlipForCoord(Config.BlipPlantasCoffee)
    SetBlipSprite (MRblip, 78)
    SetBlipDisplay(MRblip, 2)
    SetBlipScale  (MRblip, 0.7)
    SetBlipAsShortRange(MRBlip, true)
    SetBlipColour(MRblip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.BlipCoffeeName)
    EndTextCommandSetBlipName(MRBlip)

    MRBlip = AddBlipForCoord(Config.BlipPlantasPotatoe)
    SetBlipSprite (MRblip, 78)
    SetBlipDisplay(MRblip, 2)
    SetBlipScale  (MRblip, 0.7)
    SetBlipAsShortRange(MRBlip, true)
    SetBlipColour(MRblip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.BlipPotatoeName)
    EndTextCommandSetBlipName(MRBlip)

    MRBlip = AddBlipForCoord(Config.BlipPlantasstrawberrie)
    SetBlipSprite (MRblip, 78)
    SetBlipDisplay(MRblip, 2)
    SetBlipScale  (MRblip, 0.7)
    SetBlipAsShortRange(MRBlip, true)
    SetBlipColour(MRblip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.BlipstrawberrieName)
    EndTextCommandSetBlipName(MRBlip)

    MRBlip = AddBlipForCoord(Config.BlipJuices)
    SetBlipSprite (MRblip, 78)
    SetBlipDisplay(MRblip, 2)
    SetBlipScale  (MRblip, 0.7)
    SetBlipAsShortRange(MRBlip, true)
    SetBlipColour(MRblip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.BlipMakeJuices)
    EndTextCommandSetBlipName(MRBlip)

    MRBlip = AddBlipForCoord(Config.BlipPlantasFarm)
    SetBlipSprite (MRblip, 78)
    SetBlipDisplay(MRblip, 2)
    SetBlipScale  (MRblip, 0.7)
    SetBlipAsShortRange(MRBlip, true)
    SetBlipColour(MRblip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.BlipFarmName)
    EndTextCommandSetBlipName(MRBlip)

    MRBlip = AddBlipForCoord(2406.68, 5019.28, 46.15)
    SetBlipSprite (MRblip, 78)
    SetBlipDisplay(MRblip, 2)
    SetBlipScale  (MRblip, 0.7)
    SetBlipAsShortRange(MRBlip, true)
    SetBlipColour(MRblip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.BlipProcessName)
    EndTextCommandSetBlipName(MRBlip)
end)



--coffee-farming--
CreateThread(function ()
    while true do
        Wait(30)
        local coords = GetEntityCoords(PlayerPedId())
        if GetDistanceBetweenCoords(coords, Config.PlantasCoffee, true) < 50 then
            SpawncoffePlants()
            Wait(500)
        else
            Wait(500)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(coffePlants) do
            DeleteObject(v)
        end
    end
end)
    
function SpawnCoffeeObject(model, coords, cd)
    local model = (type(model) == 'number' and model or GetHashKey(model))
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    local obj = CreateObject(model, coords.x, coords.y, coords.z, false, false, true)
    SetModelAsNoLongerNeeded(model)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    if cd then
        cd(obj)
    end
end

function SpawncoffePlants()
    while spawnedcoffePlants < 15 do
        Wait(1)
        local plantCoords = GenerateCoffeePlantsCoords()
        SpawnCoffeeObject('prop_bush_dead_02', plantCoords, function (obj)
            table.insert(coffePlants, obj)
            spawnedcoffePlants = spawnedcoffePlants + 1
        end)
    end
end
    
function ValidateCoffeePlantsCoord(plantCoord)
    if spawnedcoffePlants > 0 then
        local validate = true
        for k, v in pairs(coffePlants) do
            if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
                validate = false
            end
        end
        if GetDistanceBetweenCoords(plantCoord, Config.PlantasCoffee, false) > 50 then
            validate = false
        end
        return validate
    else
        return true
    end
end
    
function GenerateCoffeePlantsCoords()
    while true do
        Wait(1)
        local MrRebelX, MrCoordY
        math.randomseed(GetGameTimer())
        local MR = math.random(-15, 15)
        Wait(100)
        math.randomseed(GetGameTimer())
        local modY = math.random(-15, 15)
        MrRebelX = Config.PlantasCoffee.x + MR
        MrCoordY = Config.PlantasCoffee.y + modY
        local coordZ = GetCoffeeFarmCoordZPlants(MrRebelX, MrCoordY)
        local coord = vector3(MrRebelX, MrCoordY, coordZ)
        if ValidateCoffeePlantsCoord(coord) then
            return coord
        end
    end
end
    
function GetCoffeeFarmCoordZPlants(x, y)
    local groundCheckHeights = { 35, 36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0 }
    for i, height in ipairs(groundCheckHeights) do
        local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
        if foundGround then
            return z
        end
    end
    return 53.85
end
--end-coffee-farming--

--potato farming--
CreateThread(function ()
    while true do
        Wait(30)
        local coords = GetEntityCoords(PlayerPedId())
        if GetDistanceBetweenCoords(coords, Config.PlantasPotato, true) < 50 then
            SpawnpotatoPlants()
            Wait(500)
        else
            Wait(500)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(potatoPlants) do
            DeleteObject(v)
        end
    end
end)

function SpawnPotatoObject(model, coords, cd)
    local model = (type(model) == 'number' and model or GetHashKey(model))
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    local obj = CreateObject(model, coords.x, coords.y, coords.z, false, false, true)
    SetModelAsNoLongerNeeded(model)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    if cd then
        cd(obj)
    end
end

function SpawnpotatoPlants()
    while spawnedpotatoPlants < 15 do
        Wait(1)
        local plantCoords = GeneratePotatoPlantsCoords()
        SpawnPotatoObject('prop_plant_fern_02a', plantCoords, function (obj)
            table.insert(potatoPlants, obj)
            spawnedpotatoPlants = spawnedpotatoPlants + 1
        end)
    end
end

function ValidatePotatoPlantsCoord(plantCoord)
    if spawnedpotatoPlants > 0 then
        local validate = true
        for k, v in pairs(potatoPlants) do
            if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
                validate = false
            end
        end
        if GetDistanceBetweenCoords(plantCoord, Config.PlantasPotato, false) > 50 then
            validate = false
        end
        return validate
    else
        return true
    end
end

function GeneratePotatoPlantsCoords()
    while true do
        Wait(1)
        local MrRebelX, MrCoordY
        math.randomseed(GetGameTimer())
        local Mr = math.random(-15, 15)
        Wait(100)
        math.randomseed(GetGameTimer())
        local Mry = math.random(-15, 15)
        MrRebelX = Config.PlantasPotato.x + Mr
        MrCoordY = Config.PlantasPotato.y + Mry
        local coordZ = GetPotatoFarmCoordZPlants(MrRebelX, MrCoordY)
        local coord = vector3(MrRebelX, MrCoordY, coordZ)
        if ValidatePotatoPlantsCoord(coord) then
            return coord
        end
    end
end

-- Verificar Altura das Coordenadas
function GetPotatoFarmCoordZPlants(x, y)
    local groundCheckHeights = { 35, 36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0 }
    for i, height in ipairs(groundCheckHeights) do
        local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
        if foundGround then
            return z
        end
    end
    return 53.85
end
--end potato farming--

--Strawberries farming--
CreateThread(function ()
    while true do
        Wait(30)
        local coords = GetEntityCoords(PlayerPedId())
        if GetDistanceBetweenCoords(coords, Config.PlantasStrawberry, true) < 50 then
            SpawnStrawberriesPlants()
            Wait(500)
        else
            Wait(500)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(strawberriePlants) do
            DeleteObject(v)
        end
    end
end)

function SpawnStrawberriesObject(model, coords, cd)
    local model = (type(model) == 'number' and model or GetHashKey(model))
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    local obj = CreateObject(model, coords.x, coords.y, coords.z, false, false, true)
    SetModelAsNoLongerNeeded(model)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    if cd then
        cd(obj)
    end
end

function SpawnStrawberriesPlants()
    while spawnedstrawberriePlants < 15 do
        Wait(1)
        local plantCoords = GenerateStrawberriesPlantsCoords()
        SpawnStrawberriesObject('prop_plant_fern_01b', plantCoords, function (obj)
            table.insert(strawberriePlants, obj)
            spawnedstrawberriePlants = spawnedstrawberriePlants + 1
        end)
    end
end

function ValidateStrawberriesPlantsCoord(plantCoord)
    if spawnedstrawberriePlants > 0 then
        local validate = true
        for k, v in pairs(strawberriePlants) do
            if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
                validate = false
            end
        end
        if GetDistanceBetweenCoords(plantCoord, Config.PlantasStrawberry, false) > 50 then
            validate = false
        end
        return validate
    else
        return true
    end
end

function GenerateStrawberriesPlantsCoords()
    while true do
        Wait(1)
        local MrRebelX, MrCoordY
        math.randomseed(GetGameTimer())
        local MRx = math.random(-15, 15)
        Wait(100)
        math.randomseed(GetGameTimer())
        local MRy = math.random(-15, 15)
        MrRebelX = Config.PlantasStrawberry.x + MRx
        MrCoordY = Config.PlantasStrawberry.y + MRy
        local coordZ = GetStrawberriesFarmCoordZPlants(MrRebelX, MrCoordY)
        local coord = vector3(MrRebelX, MrCoordY, coordZ)
        if ValidateStrawberriesPlantsCoord(coord) then
            return coord
        end
    end
end

-- Verificar Altura das Coordenadas
function GetStrawberriesFarmCoordZPlants(x, y)
    local groundCheckHeights = { 35, 36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0 }
    for i, height in ipairs(groundCheckHeights) do
        local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
        if foundGround then
            return z
        end
    end
    return 53.85
end
--end Strawberries farming--

--Menu

RegisterNetEvent('mr-farming:bossmenu', function()
    exports[Config.QBMenu]:openMenu({
      {
        header = Config.Alerts["Employee"],
        isMenuHeader = true,
      },
        {
          header = Config.Alerts["NeedHoe"],
          txt = '',
          params = {
              event = 'mr-farming:client:gethoe',
            }
        },
        {
            header = Config.Alerts["NeedTrator"],
            txt = "",
            params = {
              event = 'mr-farming:client:vehicle',
            }
        },
        {
            header = Config.Alerts["DevolverTrator"],
            txt = "",
            params = {
                event = 'mr-farming:client:Putvehicle',
            }
        },
        {
            header = Config.Alerts["ItemSell"],
            txt = "",
            params = {
                event = 'mr-farming:client:sellmenu',
            }
        },
        {
            header = Config.Alerts["OpenShop"],
            txt = "",
            params = {
                event = '',
            }
        },
        {
            header = Config.Alerts["Close"],
            params = {
                event = "qb-menu:close",
            }
        },
    })
end)

RegisterNetEvent('mr-farming:client:vehicle', function()
    exports[Config.QBMenu]:openMenu({
        {
            header = Config.Alerts["Employee"],
            isMenuHeader = true,
        },
        {
            header = "Mr Shores",
            params = {
                event = "mr-farming:client:Getvehicle",
            }
        },
        {
            header = Config.Alerts["Close"],
            params = {
                event = "qb-menu:close",
            }
        },
    })
end)

RegisterNetEvent('mr-farming:client:juicesmenu', function()
    exports[Config.QBMenu]:openMenu({
        {
        header = Config.Alerts["JuicesMake"],
        txt = Config.Alerts["VariosJuices"],
        isMenuHeader = true,
        },
        {
            header = Config.Alerts["JuiceStrawberry"],
            txt = Config.Alerts["NecessarioJuiceStrawberry"],
            params = {
              event = 'mr-farming:client:strawberryjuice',
            }
        },
        {
            header = Config.Alerts["JuiceOrange"],
            txt = Config.Alerts["NecessarioJuiceOrange"],
            params = {
                event = 'mr-farming:client:orangejuice',
            }
        },
        {
            header = Config.Alerts["Close"],
            params = {
                event = "qb-menu:close",
            }
        },
    })
end)

RegisterNetEvent('mr-farming:client:processmenu', function()
    exports[Config.QBMenu]:openMenu({
        {
            header = Config.Alerts["Processar"],
            isMenuHeader = true,
        },
        {
            header = Config.Alerts["ProcessarCoffee"],
            txt = Config.Alerts["ReceivedCoffee"],
            params = {
                event = "mr-farming:client:processcoffee",
            }
        },
        {
            header = Config.Alerts["ProcessarPotato"],
            txt = Config.Alerts["ReceivedPotato"],
            params = {
                event = "mr-farming:client:processpatato",
            }
        },
        {
            id = 3,
            header = Config.Alerts["Close"],
            txt = "",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
    })
end)

RegisterNetEvent('mr-farming:client:sellmenu', function()
    exports[Config.QBMenu]:openMenu({
		{
            header = Config.Alerts["HeaderSellItems"],
            isMenuHeader = true
        },
        {
            header = Config.Alerts["VenderCoffee"],
            txt = Config.Alerts["TxtVenderCoffee"],
            params = {
				isServer = true,
                event = "mr-farming:server:mrseller",
				args = 1
            }
        },
        {
            header = Config.Alerts["VenderPotatos"],
            txt = Config.Alerts["TxtVenderPotatos"],
            params = {
				isServer = true,
                event = "mr-farming:server:mrseller",
				args = 2
            }
        },	
        {
            header =  Config.Alerts["VenderStrawberries"],
            txt = Config.Alerts["TxtVenderStrawberries"],
            params = {
				isServer = true,
                event = "mr-farming:server:mrseller",
				args = 3 
            }
        },
        {
            header = Config.Alerts["VenderApple"],
            txt = Config.Alerts["TxtVenderApple"],
            params = {
				isServer = true,
                event = "mr-farming:server:mrseller",
				args = 5
            }
        },
        {
            header = Config.Alerts["VenderOranges"],
            txt = Config.Alerts["TxtVenderOranges"],
            params = {
				isServer = true,
                event = "mr-farming:server:mrseller",
				args = 4
            }
        },
--[[         {
            header = Config.Alerts["VenderMilk"],
            txt = Config.Alerts["TxtVenderMilk"],
            params = {
				isServer = true,
                event = "mr-farming:server:mrseller",
				args = 6
            }
        },	 ]]				
        {
            header =Config.Alerts["Close"],
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

--Target

Citizen.CreateThread(function()
    exports[Config.QBTarget]:AddBoxZone("farmboss", vector3(2310.01, 4884.8, 41.81), 0.85, 0.5, {
        name="farmboss",
        heading = 315,
        debugPoly = false,
        minZ = 38.61,
        maxZ = 42.61,
      },{
        options ={
            {
                type = "client",
                event = "mr-farming:bossmenu",
                icon = Config.Alerts["IconFarmerBoss"],
                label = Config.Alerts["FarmerBoss"],
            },
        },
        distance = 2.0
    })

    exports[Config.QBTarget]:AddBoxZone("farjuice", vector3(2016.57, 4987.79, 42.1), 0.8, 0.6, {
        name="farjuice",
        heading = 90,
        debugPoly = false,
        minZ=38.9,
        maxZ=42.9,
      },{
        options ={
            {
                type = "client",
                event = "mr-farming:client:juicesmenu",
                icon = Config.Alerts["IconJuices"],
                label = Config.Alerts["MakeJuices"],
            },
        },
        distance = 2.0
    })

    exports[Config.QBTarget]:AddBoxZone("farm", vector3(2407.35, 5018.57, 45.96), 2, 2, {
        name = "farm",
        heading = 0,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "mr-farming:client:processmenu",
                icon = Config.Alerts["IconHarvest"],
                label = Config.Alerts["Processar"],
            },
        },
        distance = 2.5
    })

    exports[Config.QBTarget]:AddTargetModel('prop_plant_fern_01b', {
        options = {
            {
                event = "mr-farming:client:Strawberriefarm",
                icon = Config.Alerts["IconHarvest"],
                label = Config.Alerts["HarvestStrawberry"],
            },
        },
        distance = 2.0
    })

    exports[Config.QBTarget]:AddTargetModel('prop_plant_fern_02a', {
        options = {
            {
                event = "mr-farming:client:Potatofarm",
                icon = Config.Alerts["IconHarvest"],
                label = Config.Alerts["HarvestPotatoes"],
            },
        },
        distance = 2.0
    })

    exports[Config.QBTarget]:AddTargetModel('prop_bush_dead_02', {
        options = {
            {
                event = "mr-farming:client:Coffefarm",
                icon = Config.Alerts["IconHarvest"],
                label = Config.Alerts["HarvestCoffee"],
            },
        },
        distance = 2.0
    })

    exports[Config.QBTarget]:AddTargetModel('a_c_cow', {
        options = {
            {
                type = "client",
                event = "mr-farming:client:cowmilk",
                icon = "fas fa-cow", 
                label = "Milk Cow",
            },
        },
        distance = 2.0
    })
end)
