local QBCore = exports['qb-core']:GetCoreObject()

----- Pulls Job Data -----

local PlayerData = {}

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
	PlayerData = QBCore.Functions.GetPlayerData()
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
end)

----- Opens Menu ----

RegisterNetEvent('ccvehmenu:client:openMenu')
AddEventHandler('ccvehmenu:client:openMenu', function()
    if IsPedInAnyVehicle(PlayerPedId(), true) then
        createCarControlMenu()
        exports['qb-menu']:openMenu(ccMenu)
    else
        QBCore.Functions.Notify("You Are Not In A Vehicle", "error", 3500)
    end
end)

------ Window Control ---- 

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

------ Seat Control ------

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

RegisterNetEvent('qb-vehiclemenu:2seatcontrol', function(args)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local IsSeatFree = IsVehicleSeatFree(veh, -1)
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

------ Engine Control ------

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

------ Door Control ------

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

------ Neon Control ------

local VehiclesWithNeons = {}

local function HasNeon(vehicle)
    if VehiclesWithNeons[vehicle] ~= nil then
        return true
    end

    if IsVehicleNeonLightEnabled(vehicle) then
        VehiclesWithNeons[vehicle] = true
        return true
    end

end

RegisterNetEvent('qb-vehiclemenu:neoncontrol', function()
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if not vehicle or not IsPedInAnyVehicle(playerPed, false) or GetPedInVehicleSeat(vehicle, -1) ~= playerPed then return end -- ignore if not in car or driver seat

    local hasNeons = HasNeon(vehicle)

    if not hasNeons then 
        QBCore.Functions.Notify('Vehicles Neons Lights Not Installed', 'error')
        return
    end

        local neonsOn = (VehiclesWithNeons[vehicle] ~= nil and VehiclesWithNeons[vehicle] or false)

    SetVehicleNeonLightEnabled(vehicle, 0, not neonsOn)
    SetVehicleNeonLightEnabled(vehicle, 1, not neonsOn)
    SetVehicleNeonLightEnabled(vehicle, 2, not neonsOn)
    SetVehicleNeonLightEnabled(vehicle, 3, not neonsOn)
        VehiclesWithNeons[vehicle] = not neonsOn

end)
------ Livery Events ------

RegisterNetEvent('qb-vehiclemenu:liverycontrol', function(args)
local playerPed = GetPlayerPed(-1)
local veh = GetVehiclePedIsIn(playerPed, false)
local livery = IsVehicleSeatFree(veh, -2)
        if veh == GetVehiclePedIsIn(PlayerPedId(), true) then
            if livery then
                local args = tonumber(args)
                if args == 1 then 
                    SetVehicleLivery(veh, 1)
                    elseif args == 2 then 
                    SetVehicleLivery(veh, 2)
                    elseif args == 3 then 
                    SetVehicleLivery(veh, 3)
                    elseif args == 4 then 
                    SetVehicleLivery(veh, 4)
                    elseif args == 5 then 
                    SetVehicleLivery(veh, 5)
                    end
                end
            else
                QBCore.Functions.Notify('No Liveries Available')
            end
        if veh == false then
            QBCore.Functions.Notify('Not In A Vehicle..')
        end
end)

------ Open Menu Events ------

RegisterNetEvent('ccvehmenu:client:ccMenu', function()
    local ped = PlayerPedId()
    local veh = IsPedSittingInVehicle(ped)
    local isnotVeh = IsPedInVehicle(ped, veh, false)
        if isnotVeh == true then
            QBCore.Functions.Notify('Cant Open This Outside of A Vehicle..', 'error')
        else
            createCarControlMenu()
            exports['qb-menu']:openMenu(ccMenu)
        end
end)

RegisterNetEvent('ccvehmenu:client:seatsMenu', function()
    local veh = GetVehiclePedIsIn(PlayerPedId())

    if veh ~= nil or veh ~= 0 then
        local seatCount = GetVehicleModelNumberOfSeats(GetEntityModel(veh))
        if seatCount == 2 then
            create2SeatMenu()
            exports['qb-menu']:openMenu(seat2Menu)
        elseif seatCount == 4 then
            createSeatMenu()
            exports['qb-menu']:openMenu(seatMenu)
        end
    end
end)

RegisterNetEvent('ccvehmenu:client:windowsMenu', function()
    local veh = GetVehiclePedIsIn(PlayerPedId())

    if veh ~= nil or veh ~= 0 then
        local seatCount = GetVehicleModelNumberOfSeats(GetEntityModel(veh))
        if seatCount == 2 then
            create2WindowsMenu()
            exports['qb-menu']:openMenu(windows2Menu)
        elseif seatCount == 4 then
            createWindowsMenu()
            exports['qb-menu']:openMenu(windowsMenu)
        end
    end
end)

RegisterNetEvent('ccvehmenu:client:engineMenu', function()
    createEngineMenu()
    exports['qb-menu']:openMenu(engineMenu)
end)

RegisterNetEvent('ccvehmenu:client:doorMenu', function()
    local veh = GetVehiclePedIsIn(PlayerPedId())

    if veh ~= nil or veh ~= 0 then
        local seatCount = GetVehicleModelNumberOfSeats(GetEntityModel(veh))
        if seatCount == 2 then
            create2DoorMenu()
            exports['qb-menu']:openMenu(door2Menu)
        elseif seatCount == 4 then
            createDoorMenu()
            exports['qb-menu']:openMenu(doorMenu)
        end
    end
end)

RegisterNetEvent('ccvehmenu:client:neonMenu', function()
    createNeonMenu()
    exports['qb-menu']:openMenu(neonMenu)
end)

RegisterNetEvent('ccvehmenu:client:liveryMenu', function()
    if PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" or PlayerData.job.name == "mechanic" then
        createLiveryMenu()
        exports['qb-menu']:openMenu(liveryMenu)
    else
        QBCore.Functions.Notify('Wrong Job Credentials..', 'error')
    end
end)

------ Menu Structures ------

function createCarControlMenu()
    ccMenu = {
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
        {
            header = "Neon Menu",
			txt = "Switch Neon On/Off",
			params = {
                isServer = false,
                event = "ccvehmenu:client:neonMenu",
            }
        },
        {
            header = "Livery ",
			txt = "Swap Liveries (PD, EMS, Mech Only)",
			params = {
                isServer = false,
                event = "ccvehmenu:client:liveryMenu",
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
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(windowsMenu)
end

function create2WindowsMenu()
    windows2Menu = {
        {
            isHeader = true,
            header = ' 🚓 | Window Controls'
        },
        {
            header = "Roll Down Driver Window",
			txt = "Choose Driver Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 1,
            }
        },
        {
            header = "Roll Down Passenger Window",
			txt = " Choose Passenger Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 2,
            }
        },
        {
            header = "Roll Up Driver Window",
			txt = "Choose Driver Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 5,
            }
        },
        {
            header = "Roll Up Passenger",
			txt = "Choose Passenger Window",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:windowscontrol",
                args = 6,
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(windows2Menu)
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
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(seatMenu)
end

function create2SeatMenu()
    seat2Menu = {
        {
            isHeader = true,
            header = ' 🚓 | Seat Controls'
        },
        {
            header = "Swap To Driver",
			txt = "Choose Driver Seat",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:2seatcontrol",
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
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(seat2Menu)
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
                event = 'ccvehmenu:client:openMenu',
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
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(doorMenu)
end

function create2DoorMenu()
    door2Menu = {
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
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(door2Menu)
end

function createNeonMenu()
    neonMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Neon Controls'
        },
        {
            header = "Turn Neons On",
			txt = "Switch Neon Lights On",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:neoncontrol",
                args = 1
            }
        },
        {
            header = "Turn Neon Off",
			txt = "Switch Neon Lights Off",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:neoncontrol",
                args = 2
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(neonMenu)
end

function createLiveryMenu()
    liveryMenu = {
        {
            isHeader = true,
            header = ' 🚓 | Livery Controls'
        },
        {
            header = "Change Livery 1",
			txt = "Put Livery 1 on Vehicle",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:liverycontrol",
                args = 1
            }
        },
        {
            header = "Change Livery 2",
			txt = "Put Livery 2 on Vehicle",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:liverycontrol",
                args = 2
            }
        },
        {
            header = "Change Livery 3",
			txt = "Put Livery 3 on Vehicle",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:liverycontrol",
                args = 3
            }
        },
        {
            header = "Change Livery 4",
			txt = "Put Livery 4 on Vehicle",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:liverycontrol",
                args = 4
            }
        },
        {
            header = "Change Livery 5",
			txt = "Put Livery 5 on Vehicle",
			params = {
                isServer = false,
                event = "qb-vehiclemenu:liverycontrol",
                args = 5
            }
        },
        {
            header = '🔙 | Back',
            txt = 'Go Back to Car Control Menu',
            params = {
                isServer = false,
                event = 'ccvehmenu:client:openMenu',
            }
        },
    }
    exports['qb-menu']:openMenu(liveryMenu)
end