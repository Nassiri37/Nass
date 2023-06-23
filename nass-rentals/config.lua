Config = {}


--Blips
Config.BikeBlips = true -- Choose weather or not to show the bike rental blips on the map
Config.BoatBlips = true -- Choose weather or not to show the boat rental blips on the map
Config.dBikeBlips = true -- Choose weather or not to show the dirt bike rental blips on the map
Config.CarBlips = true -- Choose weather or not to show the dirt Bike rental blips on the map

--Ped Rental / Ped Spawn
Config.EnableBikeRental = true  -- Ability to change weather you want to have bike rental peds or not 
Config.EnableBoatRental = true -- Ability to change weather you want to have boat rental peds or not
Config.EnabledBikeRental = true -- Ability to change weather you want to have dirt bike rental peds or not
Config.EnableCarRental = true -- Ability to change weather you want to have vehicle rental peds or not


Config.FuelScript = 'cdn-fuel' -- cdn-fuel, ps-fuel, LegacyFuel 

Config.PlateName = "RENT" -- You can change to anything of your liking - make sure to keep 6 letters and under so the script can set a random number so no plates are the same 4 is recommended 

Config.BikePed = `ig_maryann`  -- Decide what ped you want to use the bike rental ped 
Config.BoatPed = `ig_old_man2`  -- Decide what ped you want to use the boat rental ped 
Config.dBikePed = `u_m_y_sbike`  -- Decide what ped you want to use the dirt bike rental ped 
Config.CarPed = `ig_fbisuit_01`  -- Decide what ped you want to use the vehicle rental ped 

Config.BikeBlipName = "Bike Rentals"
Config.BoatBlipName = "Boat Rentals"
Config.dBikeBlipName = "Dirt Bike Rentals"
Config.CarBlipName = "Vehicle Rentals"



Config.bikeList = {
    { name = "BMX", model = "bmx", price = 100 },
    { name = "Scorcher", model = "scorcher", price = 100 },
    { name = "Cruiser", model = "cruiser", price = 100 },
    { name = "Fixter", model = "fixter", price = 100 },
    { name = "Whippet Race Bike", model = "tribike", price = 100 },
    { name = "Endurex Race Bike", model = "tribike2", price = 100 },
    { name = "Tri-Cycles Race Bike", model = "tribike3", price = 100 },
    { name = "Eletric Scooter", model = "scooter", price = 200 },
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
--	vector4(0, 0, 0, 0), 
}



-------------------DIRT BIKE------------------


Config.dBikeList = {
    { name = "Sanchez", model = "sanchez", price = 1000 },

}


--Where the Dirt Bike will spawn / Need to make sure its near where the ped is
Config.dBikeSpawn = {
	[1] = { 
		dBikeSpawn = {
			coords = vector3(825.38, 2404.6, 54.53), --   
			heading = 274.42,
		},
	},
}


--Coords for multiple Peds / Blips follow where the ped is
Config.dBikePedCoords = {
    vector4(822.52, 2404.48, 54.66, 256.07),     
}



-------------------CAR------------------


Config.CarList = {
    { name = "Bison", model = "bison", price = 300 },
    { name = "Futo", model = "Futo", price = 250 },
    { name = "Coach", model = "coach", price = 400 },
    { name = "Tour bus", model = "tourbus", price = 600 },
    { name = "Taco", model = "taco", price = 420 },
    { name = "Limo", model = "stretch", price = 1250 },
    { name = "Hearse", model = "romero", price = 1300 },
    { name = "Clown Car", model = "speedo2", price = 2850 },
    { name = "Festival Bus", model = "pbus2", price = 4500 },

}


--Where the Dirt Bike will spawn / Need to make sure its near where the ped is
Config.CarSpawn = {
	[1] = { 
		CarSpawn = {
			coords = vector3(660.05, 196.5, 95.02), --   
			heading = 71.2,
		},
	},
}


--Coords for multiple Peds / Blips follow where the ped is
Config.CarPedCoords = {
    vector4(657.63, 200.7, 95.3, 115.29),     
}
