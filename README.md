# A Car Control Menu for QBCore Framework

## Preview 
https://cdn.discordapp.com/attachments/730702655294275685/919412694736580668/FiveM_-_N1GHTM4R3_Dev_12_11_2021_5_56_02_PM.png
https://cdn.discordapp.com/attachments/730702655294275685/919412695529291816/FiveM_-_N1GHTM4R3_Dev_12_11_2021_5_56_23_PM.png
https://cdn.discordapp.com/attachments/730702655294275685/919413194823462952/FiveM_-_N1GHTM4R3_Dev_12_11_2021_12_25_49_PM.png
https://cdn.discordapp.com/attachments/730702655294275685/919412736843190303/FiveM_-_N1GHTM4R3_Dev_12_11_2021_6_17_31_PM.png
https://cdn.discordapp.com/attachments/730702655294275685/919412697622249572/FiveM_-_N1GHTM4R3_Dev_12_11_2021_10_05_16_AM.png
https://cdn.discordapp.com/attachments/730702655294275685/919412696196198430/FiveM_-_N1GHTM4R3_Dev_12_11_2021_10_26_37_AM.png
https://cdn.discordapp.com/attachments/730702655294275685/919412698394005594/FiveM_-_N1GHTM4R3_Dev_12_11_2021_6_16_46_PM.png


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

## if you want to combine it in to an already made resource like qb-smallresources just rename "main.lua" to "cl_carcontrol.lua" and add make sure to add it in--> @qb-smallresources --> client / update as well as update the fxmanifest of qb-smallresources, if you do this.

`To add qb-carcontrol in to your Radial Menu, open qb-radialmenu/config.lua file and (Add+) this snippet below into the config file under the vehicle section. It will open the qb-carcontrol menu while you are in a vehicle. `
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
`Place the above snippet inside this radialmenu section titled "vehicle"`

```[3] = {
        id = 'vehicle',
        title = 'Vehicle',
        icon = 'car',
        items = {
            {``` 
            
`should line up in the config section right above selection #4 inside the qb-radialmenu/config, this will add it to the correct vehicle section #3`    
            
```[4] = {
        id = 'jobinteractions',
        title = 'Work',
        icon = 'briefcase',
        items = {}
    }```
