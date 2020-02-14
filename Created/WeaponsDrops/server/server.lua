---------------------------------------------
---------------------------------------------
----    File : server.lua    		 	 ----
----    Author : gassastsina 			 ----
----    Side : server        			 ----
----    Description : Gunpowder on hands ----
---------------------------------------------
---------------------------------------------

RegisterServerEvent('WeaponsDrops:Connected')
AddEventHandler('WeaponsDrops:Connected', function()
	local _source = source
	MySQL.Async.fetchAll("SELECT * FROM `gunpowder` WHERE `identifier`=@identifier", {
		['@identifier'] = GetPlayerIdentifiers(_source)[1]
	}, function(result)
		if result[1].identifier == nil then
			MySQL.Async.execute('INSERT INTO gunpowder (identifier, gunpowder) VALUES (@identifier, @gunpowder)', {
			  ['@identifier']  	= GetPlayerIdentifiers(_source)[1],
			  ['@gunpowder'] 	= 0
			},
			function(rowsChanged)
				if cb ~= nil then cb() end
			end)
		end
	end)
end)

RegisterServerEvent('WeaponsDrops:GetGunpowder')
AddEventHandler('WeaponsDrops:GetGunpowder', function()
	local _source = source
	MySQL.Async.fetchAll("SELECT * FROM `gunpowder` WHERE `identifier`=@identifier", {
		['@identifier'] = GetPlayerIdentifiers(_source)[1]
	}, function(result)
		if result[1] == nil then
			MySQL.Async.execute('INSERT INTO gunpowder (identifier, gunpowder) VALUES (@identifier, @gunpowder)', {
			  ['@identifier']  	= GetPlayerIdentifiers(_source)[1],
			  ['@gunpowder'] 	= 0
			},
			function(rowsChanged)
				if cb ~= nil then cb() end
				TriggerClientEvent('WeaponsDrops:GetGunpowder', _source, 0)
			end)
		else
			TriggerClientEvent('WeaponsDrops:GetGunpowder', _source, result[1].gunpowder)
		end
	end)
end)

RegisterServerEvent('WeaponsDrops:IsShooting')
AddEventHandler('WeaponsDrops:IsShooting', function(x, y, z)
	TriggerClientEvent('WeaponsDrops:Transmit', -1, x, y, z)
end)

RegisterServerEvent('WeaponsDrops:UpdateGunpowder')
AddEventHandler('WeaponsDrops:UpdateGunpowder', function(gunpowder)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Sync.execute("UPDATE gunpowder SET gunpowder=@gunpowder WHERE identifier=@identifier", {
		['@identifier'] = identifier,
		['@gunpowder'] = gunpowder
    })
end)

RegisterServerEvent('WeaponsDrops:GetPlayerGunpowder')
AddEventHandler('WeaponsDrops:GetPlayerGunpowder', function(target)
	TriggerClientEvent('WeaponsDrops:SendBackPlayerGunpowder', target, source)
end)

RegisterServerEvent('WeaponsDrops:SendBackPlayerGunpowder')
AddEventHandler('WeaponsDrops:SendBackPlayerGunpowder', function(_source, gunpowder)
	TriggerClientEvent('WeaponsDrops:RemoveGunpowderTest', _source, gunpowder)
end)



--[[RegisterServerEvent('WeaponsDrops:UpdateItem')
AddEventHandler('WeaponsDrops:UpdateItem', function(item, qty, msg, player)
	player = player or source
	local identifier = GetPlayerIdentifiers(player)[1]
	MySQL.Async.fetchAll("SELECT * FROM `inventory` WHERE `identifier`=@identifier AND `item`=@item", {
		['@identifier'] = identifier,
		['@item'] = item
	}, function(result)
		if (qty > 0) or (result[1].quantity > 0 and qty < 0) then
			MySQL.Sync.execute("UPDATE inventory SET quantity=@quantity WHERE identifier=@identifier AND item=@item", {
				['@identifier'] = identifier,
				['@item'] = item,
				['@quantity'] = result[1].quantity + qty
		    }, function()
				if msg ~= nil then
					TriggerClientEvent('WeaponsDrops:showNotification', player, msg)
				end
		    end)
		else
			TriggerClientEvent('WeaponsDrops:showNotification', player, "~r~Tu n'as pas assez de tests de poudre à canon sur toi")
		end
	end)
end)]]