------------------------------------
------------------------------------
----    File : cartridge.lua    ----
----    Author : gassastsina 	----
----    Side : client        	----
----    Description : Cartridge ----
------------------------------------
------------------------------------


-----------------------------------------------main------------------------------------------------------
local function SpawnObject(model, heading)
	model = GetHashKey(model)
 	RequestModel(model)
    while not HasModelLoaded(model) do
      Wait(100)
    end

	local coords = GetEntityCoords(GetPlayerPed(-1), true)
    FreezeEntityPosition(SetEntityRotation(CreateObject(model, coords.x+math.random(-1.0, 1.0), coords.y+math.random(-1.0, 1.0), coords.z-1.08, true, false, false), 0.0, 100.0, 0.0, 2, true), Config.Cartridge.FreezeObjects)
end

local function GetWeaponMag(weapon)
	for i=1, #Config.Cartridge.MagsModels, 1 do
		if Config.Cartridge.MagsModels[i].hash == weapon then
			return Config.Cartridge.MagsModels[i].mag
		end
	end
	return ''
end

CreateThread(function()
	Wait(5000)
	local weapon = GetSelectedPedWeapon(GetPlayerPed(-1))
	local lastammo = GetAmmoInPedWeapon(GetPlayerPed(-1), weapon)
	while true do
		Wait(800)
		local ped = GetPlayerPed(-1)
		
		--Drop des douilles
		if GetSelectedPedWeapon(ped) == weapon and GetAmmoInPedWeapon(ped, weapon) < lastammo then
			local diffammo = lastammo - GetAmmoInPedWeapon(ped, weapon)
			for x=1, diffammo, 1 do
				SpawnObject(Config.Cartridge.BulletModel)
				Wait(100)
			end
		end
		weapon = GetSelectedPedWeapon(ped)
		lastammo = GetAmmoInPedWeapon(ped, weapon)
	end
end)


CreateThread(function()
	Wait(6000)
	local CanGet = true
	local objectstab = {{label = "Douille", hash = GetHashKey(Config.Cartridge.BulletModel), maxitemqty = Config.Cartridge.MaxBulletsQty}}
	for i=2, #Config.Cartridge.MagsModels, 1 do
		table.insert(objectstab, {label = Config.Cartridge.MagsModels[i].label, hash = GetHashKey(Config.Cartridge.MagsModels[i].mag)})
	end

	while true do
		Wait(5)
		local ped = GetPlayerPed(-1)
		if GetPedStealthMovement(ped) and CanGet and not IsAimCamActive() then


			for i=1, #objectstab, 1 do
				local coords = GetEntityCoords(ped, true)
				local obj = GetClosestObjectOfType(coords.x, coords.y, coords.z-1.0, Config.Cartridge.MaxDistance, objectstab[i].hash, false, true, true)
				if not IsEntityAttachedToAnyObject(obj) and Vdist(coords.x, coords.y, coords.z, GetEntityCoords(obj, true)) <= Config.Cartridge.MaxDistance then
					SetTextComponentFormat('STRING')
					if i == 1 then
						AddTextComponentString('Appuyez sur ~INPUT_CONTEXT~ pour ramasser la douille')
					else
						AddTextComponentString('Appuyez sur ~INPUT_CONTEXT~ pour ramasser le chargeur')
					end
					DisplayHelpTextFromStringLabel(0, 0, 1, -1)
					if IsControlJustPressed(0, 38) then
						RequestAnimDict("amb@prop_human_bum_bin@idle_b")
						while not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b") do Wait(100) end
						TaskPlayAnim(ped,"amb@prop_human_bum_bin@idle_b","idle_d", 100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
						Wait(750)
						StopAnimTask(ped, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)

						SetEntityAsMissionEntity(obj, false, true)
						DeleteObject(obj)
						SetObjectAsNoLongerNeeded(obj)
						if exports["vdk_inventory"]:getQuantity(objectstab[i].itemmag) < objectstab[i].maxitemqty then
							TriggerEvent('player:receiveItem', objectstab[i].itemmag, 1)
							ShowNotification("~g~Vous avez récupéré : ~b~"..objectstab[i].label)
						else
							ShowNotification("~r~Vous avez trop de ~b~"..objectstab[i].label.."~r~ sur vous")
						end
					end
				end
			end
		end


		--Drop des chargeurs
		local weapon = GetSelectedPedWeapon(ped)
		local IsRealoading, ammo = GetAmmoInClip(ped, weapon)
		if IsRealoading and (IsControlJustPressed(0, 45) or ammo == 0) and weapon ~= -1569615261 and weapon ~= 0 then
			Wait(1000)
			if ammo < GetMaxAmmoInClip(ped, weapon, 1) then
				SpawnObject(GetWeaponMag(weapon))
			
				CreateThread(function()
					local timeout = 0
					while timeout < Config.Cartridge.TimeToGetAfterShoot do
						CanGet = false
						Wait(100)
						timeout = timeout + 5000
					end
					CanGet = true
				end)

				IsRealoading, ammo = GetAmmoInClip(ped, weapon)
				while ammo == 0 and GetSelectedPedWeapon(ped) == weapon do
					Wait(300)
					IsRealoading, ammo = GetAmmoInClip(ped, weapon)
				end
			end
		end
	end
end)