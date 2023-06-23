local QBCore = exports['qb-core']:GetCoreObject()



-------------------BIKES------------------

RegisterServerEvent('nass-rental:attemptBikePurchase', function(car,price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money.cash
    if cash >= price then
        Player.Functions.RemoveMoney("cash",price,"rentals")
        TriggerClientEvent('nass-rental:bikespawn', source, car)
        TriggerClientEvent('QBCore:Notify', src, car .. " has been rented for $" .. price .. ", ", "success")
    else
        TriggerClientEvent('nass-rental:attemptbikespawnfail', source)
    end
end)



RegisterServerEvent('nass-rental:server:bikepayreturn', function(model)
    local src = source
    for k, v in pairs(Config.bikeList) do 
        if string.lower(v.model) == model then
            TriggerClientEvent('QBCore:Notify', src, "You have returned your rented vehicle.", "success")
        end
    end
    
end)



-------------------BOATS------------------


RegisterServerEvent('nass-rental:attemptBoatPurchase', function(car, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money.cash
    if cash >= price then
        Player.Functions.RemoveMoney("cash", price, "rentals")
        TriggerClientEvent('nass-rental:boatspawn', source, car)
        TriggerClientEvent('QBCore:Notify', src, car .. " has been rented for $" .. price .. ", ", "success")
    else
        TriggerClientEvent('nass-rental:attemptboatspawnfail', source)
    end
end)


RegisterServerEvent('nass-rental:server:boatpayreturn', function(model)
    local src = source
    for k, v in pairs(Config.boatList) do 
        if string.lower(v.model) == model then
            TriggerClientEvent('QBCore:Notify', src, "You have returned your rented vehicle.", "success")
        end
    end
end)



-------------------DIRT BIKE------------------



RegisterServerEvent('nass-rental:attemptdBikePurchase', function(car, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money.cash
    if cash >= price then
        Player.Functions.RemoveMoney("cash", price, "rentals")
        TriggerClientEvent('nass-rental:dbikespawn', source, car)
        TriggerClientEvent('QBCore:Notify', src, car .. " has been rented for $" .. price .. ", ", "success")
    else
        TriggerClientEvent('nass-rental:attemptdbikespawnfail', source)
    end
end)


RegisterServerEvent('nass-rental:server:dbikepayreturn', function(model)
    local src = source
    for k, v in pairs(Config.dBikeList) do 
        if string.lower(v.model) == model then
            TriggerClientEvent('QBCore:Notify', src, "You have returned your rented vehicle.", "success")
        end
    end
end)


-------------------CAR------------------



RegisterServerEvent('nass-rental:giverentalpaperServer', function(model, plateText)
    local src = source
    local PlayerData = QBCore.Functions.GetPlayer(src)
    local info = {
        label = plateText
    }
    PlayerData.Functions.AddItem('rentalpapers', 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['rentalpapers'], "add")
end)

QBCore.Functions.CreateCallback('nass-rentals:server:hasrentalpapers', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("rentalpapers")
    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('nass-rentals:server:removerentalpapers', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem("rentalpapers", 1)
end)


RegisterServerEvent('nass-rental:attemptCarPurchase', function(car, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cash = Player.PlayerData.money.cash
    if cash >= price then
        Player.Functions.RemoveMoney("cash", price, "rentals")
        TriggerClientEvent('nass-rental:carspawn', source, car)
        TriggerClientEvent('QBCore:Notify', src, car .. " has been rented for $" .. price .. ", return it in order to recieve 50% of the total costs", 'success')
    else
        TriggerClientEvent('nass-rental:attemptcarspawnfail', source)
    end
end)



RegisterServerEvent('nass-rental:server:carpayreturn', function(model)
    local src = source
    for k, v in pairs(Config.CarList) do 
        if string.lower(v.model) == model then
            TriggerClientEvent('QBCore:Notify', src, "You have returned your rented vehicle.", "success")
        end
    end
end)



