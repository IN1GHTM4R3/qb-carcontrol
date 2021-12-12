# qb-carcontrol
This is a Car Control menu built on qb-menu triggered from the Radial Menu. Will Control Seats, Windows, Doors, and Engine.


Vers.1.0.0----

To add this in to your Radial Menu config file under the vehicle section it will trigger the qb-menu while in a vehicle.

       	   {
                id = 'vehiclemenu',
                title = 'Car Control',
                icon = 'bars',
                type = 'client',
                event = 'ccvehmenu:client:openMenu',
                shouldClose = true
            }

Use the Radial Menu click Vehicles > Car Control > Car Control Menu Pops Up

Dependencies

qb-menu
qb-radialmenu


To Do's
Next release 1.1.0 - 

Will be looking for a way to figure out how to keep the qb-menu Menu up after selection for doors, windows, and seats
Will Add Job Check for PD/EMS/Mechanic for Car Livery Selection and Extras Built In.

Release 1.2.0
Will Add Vehicle Examination For Mechanics
Will Add Neon Lights if Owned Turn On & Off

Add Resource "cl_carcontrol.lua" to either "qb-core/smallresources/client/" or leave it in the folder it was downloaded in.
if leaving it in folder just "ensure qb-vehiclemenu" in your server.cfg file and should be good to go

if you have an edits to the file just pr them and ill update the script with them, as well as stay with a release schedule as I finish the QoL updates to it.

