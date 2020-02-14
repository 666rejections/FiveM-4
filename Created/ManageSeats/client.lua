----------------------------------------
----------------------------------------
----    File : client.lua    		----
----    Author : gassastsina 		----
----    Side : client     			----
----    Description : Manage seats  ----
----------------------------------------
----------------------------------------

local function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(false, true)
end

CreateThread(function()
	while true do
		Wait(5)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
			if GetPedInVehicleSeat(vehicle, 0) == GetPlayerPed(-1) and IsVehicleSeatFree(vehicle, -1) and
			GetIsTaskActive(GetPlayerPed(-1), 165) and not IsControlPressed(1, 23) then
				SetPedIntoVehicle(GetPlayerPed(-1), vehicle, 0)
			end

			if IsControlPressed(0, 314) then --NumPad +
				if IsControlJustReleased(0, 117) then --NumPad 7
					if IsVehicleSeatFree(vehicle, -1) then
						SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
					else
						SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -2)
					end
					Wait(2000)
				
				elseif IsControlJustReleased(0, 118) then --NumPad 9
					if IsVehicleSeatFree(vehicle, 0) then
						SetPedIntoVehicle(GetPlayerPed(-1), vehicle, 0)
					else
						SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -2)
					end
					Wait(2000)
				
				elseif IsControlJustReleased(0, 108) then --NumPad 4
					if IsVehicleSeatFree(vehicle, 1) then
						SetPedIntoVehicle(GetPlayerPed(-1), vehicle, 1)
					else
						SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -2)
					end
					Wait(2000)
				
				elseif IsControlJustReleased(0, 109) then --NumPad 6
					if IsVehicleSeatFree(vehicle, 2) then
						SetPedIntoVehicle(GetPlayerPed(-1), vehicle, 2)
					else
						SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -2)
					end
					Wait(2000)
				
				elseif IsControlJustReleased(0, 111) then --NumPad 8
					if GetEntitySpeed(vehicle)*3.6 <= 20.0 then
						if IsVehicleSeatFree(vehicle, 5) then
							SetPedIntoVehicle(GetPlayerPed(-1), vehicle, 5)
						elseif IsVehicleSeatFree(vehicle, 3) then
							SetPedIntoVehicle(GetPlayerPed(-1), vehicle, 3)
						else
							SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -2)
						end
						Wait(2000)
					else
						ShowNotification("~r~Vous roulez trop vite pour aller à cette place")
					end
				
				elseif IsControlJustReleased(0, 128) then --NumPad 5
					if GetEntitySpeed(vehicle)*3.6 <= 20.0 then
						if IsVehicleSeatFree(vehicle, 6) then
							SetPedIntoVehicle(GetPlayerPed(-1), vehicle, 6)
						elseif IsVehicleSeatFree(vehicle, 4) then
							SetPedIntoVehicle(GetPlayerPed(-1), vehicle, 4)
						else
							SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -2)
						end
						Wait(2000)
					else
						ShowNotification("~r~Vous roulez trop vite pour aller à cette place")
					end
				end
			end
		end
	end
end)