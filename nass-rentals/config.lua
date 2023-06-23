Config = {}

Config.BikeBlips = true -- Choose weather or not to show the bike rental blips on the map
Config.BoatBlips = true -- Choose weather or not to show the boat rental blips on the map


Config.EnableBikeRental = true  -- Ability to change weather you want to have bike rental peds or not 
Config.EnableBoatRental = true -- Ability to change weather you want to have boat rental peds or not

Config.FuelScript = 'cdn-fuel' -- cdn-fuel , ps-fuel, LegacyFuel - Not necessarily  needed for bikes but is needed for boats to register if you have keys or not

Config.PlateName = "RENTAL" -- You can change to anything of your liking - The bikes / Scooter / Boats does not show a plate this is just for when you return the bike/scooter it can identify if its a rental or not

Config.BikePed = `ig_maryann`  -- Decide what ped you want to use the bike rental ped 
Config.BoatPed = `ig_old_man2`  -- Decide what ped you want to use the boat rental ped 


Config.BikeBlipName = "Bike Rentals"
Config.BoatBlipName = "Boat Rentals"



Config.bikeList = {
    { name = "BMX", model = "bmx", price = 100 },
    { name = "Scorcher", model = "scorcher", price = 100 },
    { name = "Cruiser", model = "cruiser", price = 100 },
    { name = "Fixter", model = "fixter", price = 100 },
    { name = "Whippet Race Bike", model = "tribike", price = 100 },
    { name = "Endurex Race Bike", model = "tribike2", price = 100 },
    { name = "Tri-Cycles Race Bike", model = "tribike3", price = 100 },
    { name = "Eletric Scooter", model = "scooter", price = 200 },
	{ name = "havok", model = "havok", price = 200 },
}

--Where the bike / scooter will spawn / Need to make sure its near where the ped is
Config.bikeSpawn = {
	[1] = { 
		workSpawn = {
			coords = vector3(-248.76, -968.94, 31.22), --Alta
			heading = 348.522308,
		},
	},
    [2] = { 
		workSpawn = {
			coords = vector3(-1105.68, -1692.8, 4.36), --Beach
			heading = 323.94,
		},
	},
    [3] = { 
		workSpawn = {
			coords = vector3(150.37, -990.62, 29.36), -- Legion
			heading = 33.5,
		},
	},
	[4] = { 
		workSpawn = {
			coords = vector3(1126.26, -655.67, 56.75), -- Mirror Park
			heading = 189.9,
		},
	},
	[5] = { 
		workSpawn = {
			coords = vector3(1979.88, 3747.9, 32.18), -- Sandy
			heading = 286.38,
		},
	},
	[6] = { 
		workSpawn = {
			coords = vector3(143.9, 6642.77, 31.55), -- Paleto
			heading = 172.94,
		},
	},
}


--Coords for multiple Peds / Blips follow where the ped is
Config.BikePedCoords = {
    vector4(-250.85, -969.48, 31.22, 259.68), -- Alta
	vector4(-1106.47, -1694.93, 4.37, 343.9), -- Beach
	vector4(151.22, -986.17, 30.09, 252.28), --Legion
	vector4(1124.02, -654.24, 56.74, 279.9), --Mirror Park
	vector4(1976.7, 3746.31, 32.18, 295.23), -- Sandy 
	vector4(140.12, 6645.67, 31.67, 208.3), -- Paleto
    
}


-------------------BOATS------------------

Config.boatList = {
    { name = "Nakasaki Dinghy", model = "dinghy", price = 1000 },
	{ name = "Nakasaki Dinghy 2", model = "dinghy2", price = 1000 },
	{ name = "Nakasaki Dinghy 3", model = "dinghy3", price = 1000 },
	{ name = "Nakasaki Dinghy 4", model = "dinghy4", price = 1000 },

}


--Where the boat will spawn / Need to make sure its near where the ped is
Config.boatSpawn = {
	[1] = { 
		boatSpawn = {
			coords = vector3(-799.97, -1507.67, 3.71), --Shark Street   
			heading = 117.75,
		},
	},
}


--Coords for multiple Peds / Blips follow where the ped is
Config.BoatPedCoords = {
    vector4(-800.75, -1513.54, 1.6, 110.92), -- Shark Street

    
}