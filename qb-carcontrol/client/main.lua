local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ccvehmenu:client:openMenu')
AddEventHandler('ccvehmenu:client:openMenu', function()
    if IsPedInAnyVehicle(PlayerPedId(), true) then
        createCarControlMenu()
        exports['qb-menunew']:openMenu(carcontrolMenu)
        ---print('You are in a vehicle dummy')
    else
        QBCore.Functions.Notify("You Are Not In A Vehicle", "error", 3500)
    end
end)

RegisterNetEvent('qb-vehiclemenu:windowscontrol', function(args)
    --local playerPed	= PlayerPedId()
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
    --local playerPed	= PlayerPedId()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local IsSeatFree = IsVehicleSeatFree(veh, -2)
        if veh == GetVehiclePedIsIn(PlayerPedId(), true) then
            if IsSeatFree then
                print('Seat is Free')
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
    ---local playerPed	= PlayerPedId()
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
    --local playerPed	= PlayerPedId()
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

--[[RegisterNetEvent('qb-vehiclemenu:doorcontrol', function(args)
    local closestVehicle = nil
    local door = tonumber(replace)
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        closestVehicle = GetVehiclePedIsIn(ped)
    else
        closestVehicle = getNearestVeh()
    end

    if closestVehicle ~= 0 then
        if closestVehicle ~= GetVehiclePedIsIn(ped) then
            local args = tonumber(args)
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    if args == 1 then
                        SetVehicleDoorOpen(closestVehicle, 0, false, true)
                    elseif args == 2 then
                        SetVehicleDoorOpen(closestVehicle, 1, false, true)
                    elseif args == 3 then
                        SetVehicleDoorOpen(closestVehicle, 2, false, true)
                    elseif args == 4 then
                        SetVehicleDoorOpen(closestVehicle, 3, false, true)
                    elseif args == 5 then
                        SetVehicleDoorOpen(closestVehicle, 4, false, true) -- Hood
                    elseif args == 6 then
                        SetVehicleDoorOpen(closestVehicle, 5, false, true) -- Trunk
                    end
                else
                    if not IsVehicleSeatFree(closestVehicle, -1) then
                        TriggerServerEvent('qb-radialmenu:trunk:server:Door', true, plate, door)
                    else
                        SetVehicleDoorOpen(closestVehicle, door, false, false)
                    end
                end
            end
        end

    else
        QBCore.Functions.Notify('There is no vehicle in sight...', 'error', 2500)
    end
end)]]--

function getNearestVeh()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

RegisterNetEvent('ccvehmenu:client:ccMenu', function()
    createCarControlMenu()
    exports['qb-menunew']:openMenu(carcontrolMenu)
end)

RegisterNetEvent('ccvehmenu:client:seatsMenu', function()
    createSeatMenu()
    exports['qb-menunew']:openMenu(seatMenu)
end)

RegisterNetEvent('ccvehmenu:client:windowsMenu', function()
    createWindowsMenu()
    exports['qb-menunew']:openMenu(windowsMenu)
end)

RegisterNetEvent('ccvehmenu:client:engineMenu', function()
    createEngineMenu()
    exports['qb-menunew']:openMenu(engineMenu)
end)

RegisterNetEvent('ccvehmenu:client:doorMenu', function()
    createDoorMenu()
    exports['qb-menunew']:openMenu(doorMenu)
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
    exports['qb-menunew']:openMenu(ccMenu)
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
                shouldClose = false
            }
        },
        {
            header = "Roll Down Window R/F",
			txt = " Choose Passenger Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 2,
                shouldClose = false
            }
        },
        {
            header = "Roll Down Window L/R",
			txt = "Choose Rear Driver Side Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 3,
                shouldClose = false
            }
        },
        {
            header = "Roll Down Window R/R",
			txt = "Choose Rear Passenger Side Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 4,
                shouldClose = false
            }
        },
        {
            header = "Roll Up Window L/F",
			txt = "Choose Driver Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 5,
                shouldClose = false
            }
        },
        {
            header = "Roll Up Window R/F",
			txt = "Choose Passenger Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 6,
                shouldClose = false
            }
        },
        {
            header = "Roll Up Window L/R",
			txt = "Choose Rear Driver Side Windwo",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 7,
                shouldClose = false
            }
        },
        {
            header = "Roll Up Window R/R",
			txt = "Choose Rear Passenger Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 8,
                shouldClose = false
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
    exports['qb-menunew']:openMenu(windowsMenu)
end

function createSeatMenu()
    seatMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Window Controls'
        },
        {
            header = "Swap To Driver",
			txt = "Choose Driver Seat",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:seatcontrol",
                args = 1,
                shouldClose = false

            }
        },
        {
            header = "Swap To Passenger",
			txt = "Choose Passenger Seat",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:seatcontrol",
                args = 2,
                shouldClose = false
            }
        },
        {
            header = "Swap To Driver Rear",
			txt = "Choose Driver Rear Seat",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:seatcontrol",
                args = 3,
                shouldClose = false
            }
        },
        {
            header = "Swap To Passenger Rear",
			txt = "Choose Passenger Rear Seat",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:seatcontrol",
                args = 4,
                shouldClose = false
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
    exports['qb-menunew']:openMenu(seatMenu)
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
    exports['qb-menunew']:openMenu(seatMenu)
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
    exports['qb-menunew']:openMenu(doorMenu)
end