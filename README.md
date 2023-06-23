# nass-rentals
Multi-Rental script with multiple location configuration

This is my first ever script so if the code is a bit wonky go easy on me!

I was looking for something similar to this but just couldnt find anything 

This is a free basic and open source bike / scooter / boat / dirt bike / vehicle rental script that allows for multiple locations and to return the bike/scooter/boats!  

I couldnt find the scooter model creator if any knows please add a PR so I can credit them!

### Dependencies
[qb-menu] https://github.com/qbcore-framework/qb-menu

[qb-target] https://github.com/qbcore-framework/qb-target

[qb-inventory] https://github.com/qbcore-framework/qb-inventory 



## Installation

Download ZIP

# Add this to your qb-core/shared/items.lua
```lua
["rentalpapers"]				 = {["name"] = "rentalpapers", 					["label"] = "Rental Papers", 			["weight"] = 50, 		["type"] = "item", 		["image"] = "rentalpapers.png", 		["unique"] = true, 		["useable"] = false, 	["shouldClose"] = false, 	["combinable"] = nil, 	["description"] = "Rental Papers."},```
```

```lua
 } else if (itemData.name == "rentalpapers") {
            $(".item-info-title").html('<p>' + itemData.label + '</p>')
            $(".item-info-description").html('<p><strong>Plate: </strong><span>'+ itemData.info.label + '</span></p>');
```
Put the script in your resource directory 

ensure it in server.cfg

Restart your server! 



## Information
idle 0.0 in use 0.0
vehicle rental gives you rental papers


## Future plans with this script
Make ox_lib and ox_target compatible 
