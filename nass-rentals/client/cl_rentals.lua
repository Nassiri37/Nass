
local QBCore = exports['qb-core']:GetCoreObject()
local rentalPlate = Config.PlateName
local pedModel = Config.BikePed
local pedModel2 = Config.BoatPed
local bikecoords = Config.BikePedCoords
local boatcoords = Config.BoatPedCoords


--------------------BIKE RENTAL--------------------


--qb-menu
RegisterNetEvent("nass-rental:bikelist", function()
  for i = 1, #Config.bikeList do
  
        	local MenuOptions = {
        		{
        			header = "Bike Rental",
        			isMenuHeader = true
        		},
        	}
        	for k, v in pairs(Config.bikeList) do
          		MenuOptions[#MenuOptions+1] = {
        			header = "<h8>"..v.name.."</h>",
              txt = "$"..v.price..".00",
        			params = {
                event = "nass-rental:attemptbikespawn",
                args = {
                  id = v.model,
                  price = v.price
                }
        			}
        		}
        	end
        	exports['qb-menu']:openMenu(MenuOptions)
      end
end)




RegisterNetEvent("nass-rental:attemptbikespawn", function(vehicle)
    TriggerServerEvent("nass-rental:attemptBikePurchase",vehicle.id, vehicle.price)
end)

RegisterNetEvent("nass-rental:attemptbikespawnfail", function()
  QBCore.Functions.Notify("Not enough money.", "error")
end)




--Delete The Vehicle
RegisterNetEvent("nass-rental:returnbike")
AddEventHandler("nass-rental:returnbike", function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if vehicle ~= 0 then
        local plate = GetVehicleNumberPlateText(vehicle)
        if string.find(tostring(plate), rentalPlate) ~= nil then
            TriggerServerEvent('nass-rental:server:bikepayreturn', vehName)
            QBCore.Functions.DeleteVehicle(vehicle)
        else
            QBCore.Functions.Notify("This is not a rented vehicle.", "error")
        end
    else
        QBCore.Functions.Notify("You are not inside a vehicle.", "error")
    end
end)







--Spawn the vehicle
RegisterNetEvent("nass-rental:bikespawn", function(data, cb)
  local model = data

  local closestDist = 10000
  local closestSpawn = nil
  local pcoords = GetEntityCoords(PlayerPedId())
  
  for i, v in ipairs(Config.bikeSpawn) do
      local dist = #(v.workSpawn.coords - pcoords)
  
      if dist < closestDist then
          closestDist = dist
          closestSpawn = v.workSpawn
      end
  end

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  QBCore.Functions.SpawnVehicle(model, function(veh)
    SetVehicleNumberPlateText(veh, rentalPlate)
    SetEntityHeading(veh, closestSpawn.heading)
    exports[Config.FuelScript]:SetFuel(veh, 100.0)
    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    SetEntityAsMissionEntity(veh, true, true)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
    SetVehicleEngineOn(veh, true, true)
    CurrentPlate = QBCore.Functions.GetPlate(veh)
  end, closestSpawn.coords, true)

  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(veh) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end
end)


CreateThread(function()
    if Config.EnableBikeRental then
        QBCore.Functions.LoadModel(pedModel)

        for _, coords in ipairs(bikecoords) do
            while not HasModelLoaded(pedModel) do
                Wait(100)
            end

            local ped = CreatePed(0, pedModel, coords.x, coords.y, coords.z - 1.0, coords.w, true, true)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)

            exports['qb-target']:AddTargetEntity(ped, {
                options = {
                    {
                        icon = 'fas fa-circle',
                        label = 'Rent Bike',
                        type = 'client',
                        event = 'nass-rental:bikelist',
                    },
                    {
                        icon = 'fas fa-circle',
                        label = 'Return Bike',
                        type = 'client',
                        event = 'nass-rental:returnbike',
                    },
                },
                distance = 2.0
            })
        end

        if Config.BikeBlips then
            for _, coords in ipairs(Config.BikePedCoords) do
                local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                SetBlipSprite(blip, 815)
                SetBlipAsShortRange(blip, true)
                SetBlipScale(blip, 0.5)
                SetBlipColour(blip, 5)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(Config.BikeBlipName)
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end)



--------------------END OF BIKE RENTAL--------------------






--------------------BOATS--------------------



--qb-menu
RegisterNetEvent("nass-rental:boatlist", function()
    for i = 1, #Config.bikeList do
    
              local MenuOptions = {
                  {
                      header = "Boat Rental",
                      isMenuHeader = true
                  },
              }
              for k, v in pairs(Config.boatList) do
                    MenuOptions[#MenuOptions+1] = {
                      header = "<h8>"..v.name.."</h>",
                txt = "$"..v.price..".00",
                      params = {
                  event = "nass-rental:attemptboatspawn",
                  args = {
                    id = v.model,
                    price = v.price
                  }
                      }
                  }
              end
              exports['qb-menu']:openMenu(MenuOptions)
        end
  end)
  
  
  
  
  RegisterNetEvent("nass-rental:attemptboatspawn", function(vehicle)
      TriggerServerEvent("nass-rental:attemptBoatPurchase",vehicle.id, vehicle.price)
  end)
  
  RegisterNetEvent("nass-rental:attemptboatspawnfail", function()
    QBCore.Functions.Notify("Not enough money.", "error")
  end)
  
  
  
  
  --Delete The Vehicle
  RegisterNetEvent("nass-rental:returnboat")
  AddEventHandler("nass-rental:returnboat", function()
      local playerPed = PlayerPedId()
      local vehicle = GetVehiclePedIsIn(playerPed, false)
      if vehicle ~= 0 then
          local plate = GetVehicleNumberPlateText(vehicle)
          if string.find(tostring(plate), rentalPlate) ~= nil then
              TriggerServerEvent('nass-rental:server:boatpayreturn', vehName)
              QBCore.Functions.DeleteVehicle(vehicle)
          else
              QBCore.Functions.Notify("This is not a rented Boat.", "error")
          end
      else
          QBCore.Functions.Notify("You are not inside a Boat.", "error")
      end
  end)
  
  
  
  
  
  
  
  --Spawn the vehicle
  RegisterNetEvent("nass-rental:boatspawn", function(data, cb)
    local model = data
  
    local closestDist = 10000
    local closestSpawn = nil
    local pcoords = GetEntityCoords(PlayerPedId())
    
    for i, v in ipairs(Config.boatSpawn) do
        local dist = #(v.boatSpawn.coords - pcoords)
    
        if dist < closestDist then
            closestDist = dist
            closestSpawn = v.boatSpawn
        end
    end
  
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
    SetModelAsNoLongerNeeded(model)
  
    QBCore.Functions.SpawnVehicle(model, function(veh)
      SetVehicleNumberPlateText(veh, rentalPlate)
      SetEntityHeading(veh, closestSpawn.heading)
      exports[Config.FuelScript]:SetFuel(veh, 100.0)
      TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
      SetEntityAsMissionEntity(veh, true, true)
      TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
      SetVehicleEngineOn(veh, true, true)
      CurrentPlate = QBCore.Functions.GetPlate(veh)
    end, closestSpawn.coords, true)
  
    local timeout = 10
    while not NetworkDoesEntityExistWithNetworkId(veh) and timeout > 0 do
        timeout = timeout - 1
        Wait(1000)
    end
  end)
  
  
  
  CreateThread(function()
    if Config.EnableBoatRental then
        QBCore.Functions.LoadModel(pedModel2)

        for _, coords in ipairs(boatcoords) do
            while not HasModelLoaded(pedModel2) do
                Wait(100)
            end

            local ped2 = CreatePed(0, pedModel2, coords.x, coords.y, coords.z - 1.0, coords.w, true, true)
            FreezeEntityPosition(ped2, true)
            SetEntityInvincible(ped2, true)
            SetBlockingOfNonTemporaryEvents(ped2, true)

            exports['qb-target']:AddTargetEntity(ped2, {
                options = {
                    {
                        icon = 'fas fa-circle',
                        label = 'Rent Boat',
                        type = 'client',
                        event = 'nass-rental:boatlist',
                    },
                    {
                        icon = 'fas fa-circle',
                        label = 'Return Boat',
                        type = 'client',
                        event = 'nass-rental:returnboat',
                    },
                },
                distance = 5.0
            })
        end

        if Config.BoatBlips then
            for _, coords in ipairs(Config.BoatPedCoords) do
                local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
                SetBlipSprite(blip, 815)
                SetBlipAsShortRange(blip, true)
                SetBlipScale(blip, 0.5)
                SetBlipColour(blip, 5)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(Config.BoatBlipName)
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end)

  

--------------------END OF BOATS--------------------