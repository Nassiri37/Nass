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





