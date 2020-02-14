--------------------------------------------
--------------------------------------------
----    File : client.lua      			----
----    Author : gassastsina		 	----
----    Side : client        	  		----
----    Description : Flash Badge 		----
--------------------------------------------
--------------------------------------------


AddEventHandler('frbadge:FlashBadge', function()
	RequestAnimDict('paper_1_rcm_alt1-9')
	RequestModel('prop_lspd_badge')
	while not HasAnimDictLoaded('paper_1_rcm_alt1-9') and not HasModelLoaded('prop_lspd_badge') do
		Wait(100)
	end
	TaskPlayAnim(GetPlayerPed(-1), 'paper_1_rcm_alt1-9', 'player_one_dual-9', 8.0, 1.0, 3200, 49, 0.0, 0, 0, 0)
	local badge = CreateObject(GetHashKey('prop_lspd_badge'), 0.0, 0.0, 0.0, true, false, false)
	SetEntityAsMissionEntity(badge)
	AttachEntityToEntity(badge, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.117, -0.005, -0.035, -90.0, 171.0, -40.0, false, true, true, false, 0, true)
	Wait(3100)
	DeleteEntity(badge)
	SetEntityAsNoLongerNeeded(badge)
end)