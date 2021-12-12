# A Car Control Menu for QBCore Framework

Preview Coming Soon!


## Please note

- I have added an option for people use a qb-menu styled car control menu, Wanted to try and implement new items in the qb-menu section of things out there..

- Please make sure you use the latest qb-core & qb-menu in order for this to work.

- This Script was tested on the latest build as of 12/11/2021.


## Dependencies :

QBCore Framework - https://github.com/qbcore-framework/qb-core

qb-menu - https://github.com/qbcore-framework/qb-menu 

qb-radialmenu - https://github.com/qbcore-framework/qb-radialmenu


## Credits : 

- Kakarot for qb-menu.

## Soon To Come | Planned Updates

- Next Version Release - 

Plans to be added in next few updates - 
`Will be looking for a way to figure out how to keep the qb-menu Menu up after selection for doors, windows, and seats`
`Will Add Job Check for PD/EMS/Mechanic for Car Livery Selection and Extras Built In`
`Will Add Vehicle Examination For Mechanics`
`Will Add Neon Lights if Owned Turn On & Off`
`Will Look into Adding Examination for PD as well to see if vehicle is modified for racing - i.e, Nos, Turbo`

## Rename client/main.lua to cl_carcontrol.lua --> @qb-smallresources --> client /

`To add qb-vehiclemenu in to your Radial Menu, Add this into the config file under the vehicle section it will trigger the qb-menu while in a vehicle. `
```
       	   {
                id = 'vehiclemenu',
                title = 'Car Control',
                icon = 'bars',
                type = 'client',
                event = 'ccvehmenu:client:openMenu',
                shouldClose = true
            }
```

