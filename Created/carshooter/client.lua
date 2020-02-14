------------------------------------------------------------------------
------------------------------------------------------------------------
----    File : client.lua    								   		----
----    Author : gassastsina 								   		----
----    Side : client        								   		----
----    Description : Disable shooting in a car for specific seat	----
------------------------------------------------------------------------
------------------------------------------------------------------------

local function GetVehicleClass(ped)
	if IsPedOnAnyBike(ped) then
		return 'bike'
	elseif IsPedInAnyHeli(ped) then
		return 'heli'
	elseif IsPedInAnyBoat(ped) then
		return 'boat'
	end
	return 'car'
end

local function GetLimitForVehicleSeat(ped)
	local vehicle = GetVehiclePedIsIn(ped, false)
	for x=-1, 6, 1 do
		if GetPedInVehicleSeat(vehicle, x) == ped then
			return Config.Speed[GetVehicleClass(ped)][x+2], vehicle, x
		end
	end
end

CreateThread(function()
	while true do
		Wait(500)
	    if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
			local ped = GetPlayerPed(-1)
	    	local SpeedLimit, vehicle, seat = GetLimitForVehicleSeat(ped)
	    	while IsPedSittingInVehicle(ped, vehicle) and GetPedInVehicleSeat(GetVehiclePedIsIn(ped, false), seat) == ped do
	    		Wait(5)
		    	if GetEntitySpeed(GetVehiclePedIsIn(ped, false)) * 3.6 > SpeedLimit then
		    		DisablePlayerFiring(ped, true)
		    		if seat ~= -1 then
		    			DisableControlAction(0, 92, true)
		    		end
		    	end
		    end
	    end
  	end
end)