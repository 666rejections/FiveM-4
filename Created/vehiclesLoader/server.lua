-----------------------------------------
-----------------------------------------
----    File : server.lua       	 ----
----    Author: gassastsina     	 ----
----	Side : server 		 		 ----
----    Description : Vehicle loader ----
-----------------------------------------
-----------------------------------------

RegisterServerEvent('vehiclesLoader:getVehicles')
AddEventHandler('vehiclesLoader:getVehicles', function()
	local _source = source
	local vehicles = {}
	MySQL.Async.fetchAll("SELECT * FROM `owned_vehicles` WHERE `owner`=@owner", {['@owner'] = GetPlayerIdentifiers(_source)[1]}, function(result)
		for i=1, result, 1 do
			table.insert(vehicles, result[i].vehicle.model)
		end
	end)
	TriggerClientEvent('vehiclesLoader:loadVehicles', _source, vehicles)
end)