local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ccvehmenu:client:openMenu')
AddEventHandler('ccvehmenu:client:openMenu', function()
    if IsPedInAnyVehicle(PlayerPedId(), true) then
        createCarControlMenu()
        exports['qb-menu']:openMenu(carcontrolMenu)
    else
        QBCore.Functions.Notify("You Are Not In A Vehicle", "error", 3500)
    end
end)

RegisterNetEvent('qb-vehiclemenu:windowscontrol', function(args)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local args = tonumber(args)
        if IsPedInAnyVehicle(PlayerPedId(), true) then
            if args == 1 then 
                IsVehicleWindowIntact(veh, 0)
                RollDownWindow(veh, 0)
                QBCore.Functions.Notify("Rolled Down Driver Window", "success", 3500)
                elseif args == 2 then 
                IsVehicleWindowIntact(veh, 1)
                RollDownWindow(veh, 1)
                QBCore.Functions.Notify("Rolled Down Driver Window", "success", 3500)
                elseif args == 3 then 
                IsVehicleWindowIntact(veh, 2)
                RollDownWindow(veh, 2)
                QBCore.Functions.Notify("Rolled Down Driver Window", "success", 3500)
                elseif args == 4 then 
                IsVehicleWindowIntact(veh, 3)
                RollDownWindow(veh, 3)
                QBCore.Functions.Notify("Rolled Down Driver Window", "success", 3500)
                elseif args == 5 then
                IsVehicleWindowIntact(veh, 0)
                RollUpWindow(veh, 0)
                QBCore.Functions.Notify("Rolled Up Driver Window", "success", 3500)
                elseif args == 6 then 
                IsVehicleWindowIntact(veh, 1)
                RollUpWindow(veh, 1)
                QBCore.Functions.Notify("Rolled Up Driver Window", "success", 3500)
                elseif args == 7 then 
                IsVehicleWindowIntact(veh, 2)
                RollUpWindow(veh, 2)
                QBCore.Functions.Notify("Rolled Up Driver Window", "success", 3500)
                elseif args == 8 then 
                IsVehicleWindowIntact(veh, 3)
                RollUpWindow(veh, 3)
                QBCore.Functions.Notify("Rolled Up Driver Window", "success", 3500)
                end
        end
end)

RegisterNetEvent('qb-vehiclemenu:seatcontrol', function(args)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local IsSeatFree = IsVehicleSeatFree(veh, -2)
        if veh == GetVehiclePedIsIn(PlayerPedId(), true) then
            if IsSeatFree then
                local args = tonumber(args)
                if args == 1 then 
                    IsVehicleSeatFree(veh, -1)
                    SetPedIntoVehicle(PlayerPedId(), veh, -1)
                    QBCore.Functions.Notify("Driver Seat", "success", 3500)
                    elseif args == 2 then 
                    IsVehicleSeatFree(veh, 0)
                    SetPedIntoVehicle(PlayerPedId(), veh, 0)
                    QBCore.Functions.Notify("Passenger Seat", "success", 3500)
                    elseif args == 3 then 
                    IsVehicleSeatFree(veh, 1)
                    SetPedIntoVehicle(PlayerPedId(), veh, 1)

                    QBCore.Functions.Notify("Rear Left Seat", "success", 3500)
                    elseif args == 4 then 
                    IsVehicleSeatFree(veh, 2)
                    SetPedIntoVehicle(PlayerPedId(), veh, 2)
                    QBCore.Functions.Notify("Rear Right Seat", "success", 3500)
                    elseif args == 0 or nil then
                    QBCore.Functions.Notify("Select a Proper Seat", "error", 3500)
                    end
                end
            elseif IsSeatFree == false then
                QBCore.Functions.Notify('This seat is occupied..')
            end
        if veh == false then
            QBCore.Functions.Notify('Not In A Vehicle..')
        end
end)

RegisterNetEvent('qb-vehiclemenu:enginecontrol:on', function(args)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local args = tonumber(args)
    local IsSeatFree = IsVehicleSeatFree(veh, -1)
    if IsSeatFree == false then
        if GetPedInVehicleSeat(veh, -1) then
            if args == 1 then 
                SetVehicleEngineOn(veh, true, false, true)
                QBCore.Functions.Notify("Engine On", "success", 3500)
                elseif args == 2 then 
                SetVehicleEngineOn(veh, false, false, true)
                QBCore.Functions.Notify("Engine Off", "success", 3500)
                end
            end
    else
        QBCore.Functions.Notify("Can\'t Engage Engine From This Seat", "error", 3500)
    end
end)

RegisterNetEvent('qb-vehiclemenu:doorcontrol', function(args)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local IsSeatFree = IsVehicleSeatFree(veh, -2)
        if veh == GetVehiclePedIsIn(PlayerPedId(), true) then
            if IsSeatFree then
                local args = tonumber(args)
                if args == 1 then 
                    SetVehicleDoorOpen(veh, 0, false, false)
                    elseif args == 2 then 
                    SetVehicleDoorOpen(veh, 1, false, false)
                    elseif args == 3 then 
                    SetVehicleDoorOpen(veh, 2, false, false)
                    elseif args == 4 then 
                    SetVehicleDoorOpen(veh, 3, false, false)
                    elseif args == 5 then 
                    SetVehicleDoorOpen(veh, 4, false, false)
                    elseif args == 6 then 
                    SetVehicleDoorOpen(veh, 5, false, false)
                    elseif args == 7 then 
                    SetVehicleDoorsShut(veh, true)
                    elseif args == 8 then 
                    SetVehicleDoorOpen(veh, 0, false, false)
                    SetVehicleDoorOpen(veh, 1, false, false)
                    SetVehicleDoorOpen(veh, 2, false, false)
                    SetVehicleDoorOpen(veh, 3, false, false)
                    SetVehicleDoorOpen(veh, 4, false, false)
                    SetVehicleDoorOpen(veh, 5, false, false)
                    end
                end
            else
                QBCore.Functions.Notify('Doors are Closed')
            end
        if veh == false then
            QBCore.Functions.Notify('Not In A Vehicle..')
        end
end)

RegisterNetEvent('ccvehmenu:client:ccMenu', function()
    createCarControlMenu()
    exports['qb-menu']:openMenu(carcontrolMenu)
end)

RegisterNetEvent('ccvehmenu:client:seatsMenu', function()
    createSeatMenu()
    exports['qb-menu']:openMenu(seatMenu)
end)

RegisterNetEvent('ccvehmenu:client:windowsMenu', function()
    createWindowsMenu()
    exports['qb-menu']:openMenu(windowsMenu)
end)

RegisterNetEvent('ccvehmenu:client:engineMenu', function()
    createEngineMenu()
    exports['qb-menu']:openMenu(engineMenu)
end)

RegisterNetEvent('ccvehmenu:client:doorMenu', function()
    createDoorMenu()
    exports['qb-menu']:openMenu(doorMenu)
end)

function createCarControlMenu()
    carcontrolMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Car Control'
        },
        {
            header = "Swap Seat",
			txt = "Choose a Seat",
			params = {
                isServer = false,
                event = "ccvehmenu:client:seatsMenu",
            }
        },
        {
            header = "Windows",
			txt = "Roll Down Windows",
			params = {
                isServer = false,
                event = "ccvehmenu:client:windowsMenu",
            }
        },
        {
            header = "Engine",
			txt = "Turn Car On/Off",
			params = {
                isServer = false,
                event = "ccvehmenu:client:engineMenu",
            }
        },
        {
            header = "Door Menu",
			txt = "Open Doors",
			params = {
                isServer = false,
                event = "ccvehmenu:client:doorMenu",
            }
        },
    }
    exports['qb-menu']:openMenu(ccMenu)
end


function createWindowsMenu()
    windowsMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Window Controls'
        },
        {
            header = "Roll Down Window L/F",
			txt = "Choose Driver Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 1,
            }
        },
        {
            header = "Roll Down Window R/F",
			txt = " Choose Passenger Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 2,
            }
        },
        {
            header = "Roll Down Window L/R",
			txt = "Choose Rear Driver Side Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 3,
            }
        },
        {
            header = "Roll Down Window R/R",
			txt = "Choose Rear Passenger Side Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 4,
            }
        },
        {
            header = "Roll Up Window L/F",
			txt = "Choose Driver Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 5,
            }
        },
        {
            header = "Roll Up Window R/F",
			txt = "Choose Passenger Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 6,
            }
        },
        {
            header = "Roll Up Window L/R",
			txt = "Choose Rear Driver Side Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 7,
            }
        },
        {
            header = "Roll Up Window R/R",
			txt = "Choose Rear Passenger Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 8,
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:ccMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(windowsMenu)
end

function createSeatMenu()
    seatMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Seat Controls'
        },
        {
            header = "Swap To Driver",
			txt = "Choose Driver Seat",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:seatcontrol",
                args = 1,
            }
        },
        {
            header = "Swap To Passenger",
			txt = "Choose Passenger Seat",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:seatcontrol",
                args = 2,
            }
        },
        {
            header = "Swap To Driver Rear",
			txt = "Choose Driver Rear Seat",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:seatcontrol",
                args = 3,
            }
        },
        {
            header = "Swap To Passenger Rear",
			txt = "Choose Passenger Rear Seat",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:seatcontrol",
                args = 4,
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'qb-vehiclemenu:seatcontrol',
            }
        },
    }
    exports['qb-menu']:openMenu(seatMenu)
end

function createEngineMenu()
    engineMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Engine Controls'
        },
        {
            header = "Engine On",
			txt = "Turn Engine On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:enginecontrol:on",
                args = 1
            }
        },
        {
            header = "Engine Off",
			txt = "Turn Engine On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:enginecontrol:on",
                args = 2
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:ccMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(seatMenu)
end

function createDoorMenu()
    doorMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Door Controls'
        },
        {
            header = "Open Doors",
			txt = "Open All Doors",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:doorcontrol",
                args = 8
            }
        },
        {
            header = "Driver",
			txt = "Open Driver Door",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:doorcontrol",
                args = 1
            }
        },
        {
            header = "Passenger",
			txt = "Open Passenger Door",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:doorcontrol",
                args = 2
            }
        },
        {
            header = "Left Rear",
			txt = "Open Left Rear Door",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:doorcontrol",
                args = 3
            }
        },
        {
            header = "Right Rear",
			txt = "Open Right Rear Door",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:doorcontrol",
                args = 4
            }
        },
        {
            header = "Hood",
			txt = "Open Hood",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:doorcontrol",
                args = 5
            }
        },
        {
            header = "Trunk",
			txt = "Open Trunk",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:doorcontrol",
                args = 6
            }
        },
        {
            header = "Shut Doors",
			txt = "Shut All Doors",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:doorcontrol",
                args = 7
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:ccMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(doorMenu)
end
