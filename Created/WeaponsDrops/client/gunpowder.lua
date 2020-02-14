---------------------------------------------
---------------------------------------------
----    File : gunpowder.lua    		 ----
----    Author : gassastsina 			 ----
----    Side : client        			 ----
----    Description : Gunpowder on hands ----
---------------------------------------------
---------------------------------------------

local gunpowder = 0
---------------------------------------------functions---------------------------------------------------
function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(false, true)
end

local function GetPlayers()
	local players    = {}
	for i=1, Config.MaxPlayers, 1 do
		if DoesEntityExist(GetPlayerPed(i)) then
			table.insert(players, i)
		end
	end
	return players
end

local function GetClosestPlayer(coords)

	local players         = GetPlayers()
	local closestPlayer   = -1
	local usePlayerPed    = false

	if coords == nil then
		usePlayerPed = true
		coords       = GetEntityCoords(GetPlayerPed(-1))
	end

	for i=1, #players, 1 do
		if not usePlayerPed or (usePlayerPed and players[i] ~= PlayerId()) then

			local targetCoords = GetEntityCoords(GetPlayerPed(players[i]))
			local distance     = GetDistanceBetweenCoords(targetCoords.x, targetCoords.y, targetCoords.z, coords.x, coords.y, coords.z, true)
			local closestDistance = -1

			if closestDistance == -1 or closestDistance > distance then
				closestPlayer   = players[i]
				closestDistance = distance
			end
		end
	end
	return closestPlayer, closestDistance
end

local function IsProtected()
	local PedGloves = GetPedDrawableVariation(GetPlayerPed(-1), 3)
	for i=1, #Config.Gunpowder.GlovesVariations, 1 do
		Wait(0)
		if Config.Gunpowder.GlovesVariations[i].From <= PedGloves and Config.Gunpowder.GlovesVariations[i].To >= PedGloves then
			return true
		end
	end
	return false
end

local function Gauss(x, ymax, coef)
	return ymax*math.exp(-(x/coef)^2/2)
end

-----------------------------------------------main------------------------------------------------------
RegisterNetEvent('WeaponsDrops:showNotification')
AddEventHandler('WeaponsDrops:showNotification', function(msg)
	ShowNotification(msg)
end)


CreateThread(function()
	TriggerServerEvent('WeaponsDrops:GetGunpowder')
end)

RegisterNetEvent('WeaponsDrops:GetGunpowder')
AddEventHandler('WeaponsDrops:GetGunpowder', function(gunpowder_update)
	gunpowder = gunpowder_update
	
	--gunpowder update
	CreateThread(function()
		local lastgunpowder = gunpowder
		while true do
			Wait(30000)
			if gunpowder ~= lastgunpowder then
				TriggerServerEvent('WeaponsDrops:UpdateGunpowder', gunpowder)
			end
			lastgunpowder = gunpowder
		end
	end)
	
	--gunpowder decrease
	CreateThread(function()
		while true do
			Wait(1000)
			if gunpowder > 0 then
				gunpowder = gunpowder - Gauss(gunpowder-100, 100/Config.Gunpowder.Decrease.MaxTime, Config.Gunpowder.Decrease.Coef)
			end
		end
	end)

	--gunpowder increase
	while true do
		Wait(25)
  		if IsPedShooting(GetPlayerPed(-1)) then
  			if not IsProtected() then
  				if Config.Gunpowder.Transmit.Toggle then
  					TriggerServerEvent('WeaponsDrops:IsShooting', table.unpack(GetEntityCoords(GetPlayerPed(-1), false)))
  				else
  					gunpowder = gunpowder + Gauss(gunpowder, Config.Gunpowder.AlreadyOn.MaxIncrease, Config.Gunpowder.AlreadyOn.Coef)
  				end
  			end
  		end
  	end
end)

RegisterNetEvent('WeaponsDrops:Transmit')
AddEventHandler('WeaponsDrops:Transmit', function(coordsX, coordsY, coordsZ)
	local playerCoords = GetEntityCoords(GetPlayerPed(-1), false)
	gunpowder = gunpowder + Gauss(gunpowder + Gauss(Vdist(playerCoords.x, playerCoords.y, playerCoords.z, coordsX, coordsY, coordsZ), Config.Gunpowder.Transmit.MaxIncrease, Config.Gunpowder.Transmit.MaxIncrease/3), Config.Gunpowder.AlreadyOn.MaxIncrease, Config.Gunpowder.AlreadyOn.Coef)
end)





--Pour test le taux de gunpowder sur une personne
RegisterNetEvent('WeaponsDrops:GetPlayerGunpowder')
AddEventHandler('WeaponsDrops:GetPlayerGunpowder', function()
	if exports["vdk_inventory"]:getQuantity('gunpowder_test') > 0 then
		local player, distance = GetClosestPlayer()
		if distance ~= nil and distance <= Config.MaxDistance then
			TriggerServerEvent('WeaponsDrops:GetPlayerGunpowder', player)
		else
			if not IsProtected() then
                TriggerEvent('player:looseItem', 'gunpowder_test', 1)
				ShowNotification("Vous avez ~b~"..math.ceil(gunpowder).."% ~s~de poudre à canon sur vos mains")
			else
				ShowNotification("~r~Veuillez enlever vos gants avant de faire le test de poudre à canon")
			end
		end
	else
		ShowNotification("~r~Vous n'avez pas assez de tests de poudre à canon sur vous")
	end
end)

RegisterNetEvent('WeaponsDrops:SendBackPlayerGunpowder')
AddEventHandler('WeaponsDrops:SendBackPlayerGunpowder', function(_source)
	if not IsProtected() then
		TriggerServerEvent('WeaponsDrops:SendBackPlayerGunpowder', _source, gunpowder)
	else
		ShowNotification("~r~Veuillez enlever vos gants avant de faire le test de poudre à canon")
	end
end)

RegisterNetEvent('WeaponsDrops:RemoveGunpowderTest')
AddEventHandler('WeaponsDrops:RemoveGunpowderTest', function(gunpowder)
    TriggerEvent('player:looseItem', 'gunpowder_test', 1)
    ShowNotification("Résultat du test de poudre à canon sur la personne: ~b~"..math.ceil(gunpowder).."%")
end)