------------------------------------------------------
------------------------------------------------------
----    File : config.lua    		 			  ----
----    Author : gassastsina 			 		  ----
----    Side : client        			 		  ----
----    Description : Gunpowder on hands's config ----
------------------------------------------------------
------------------------------------------------------

Config = {}
Config.MaxPlayers 	= 128
Config.MaxDistance 	= 3.0 	--Distance to interact with an other player
Config.Gunpowder = {
	AlreadyOn = {	--Augmentation en fonction de la quantité quelle possède déjà
		Coef 		= 30,
		MaxIncrease = 10.0
	},
	Transmit = {	--Augmentation en fonction de la distance de la personne
		Toggle 		= true,
		MaxDistance = 10.0, --Valeur approximative, elle est ensuite convertie dans une formule exponentielle
		MaxIncrease = 15.0
	},
	Decrease = {
		MaxTime 	= 2*60*60, --Valeur qui défini un temps avant que la valeur de la gunpowder retourne à 0 (temps variable par la fonction Gauss), elle ne possède donc pas d'unité précise
		Coef 		= 32
	},
	GlovesVariations = {
		{From = 16, To = 111},
		{From = 115, To = 167}
	}
}

Config.Cartridge = {
	TimeToGetAfterShoot = 12000,	--ms (temps que prend le chargeur par défaut à despawn)
	BulletModel = 'gr_prop_gr_single_bullet',	--'gr_prop_gr_single_bullet', 'w_lr_40mm'
	MaxBulletsQty = 30,		--Nombre de munitions max qu'on peut avoir sur soit
	MaxDistance = 2.0,		--Distance max pour les récupérer par terre
	FreezeObjects = true,
	MagsModels 	= {		--Préférable de mettre en commentaire les armes non utilisées pour éviter des tours de boucle inutiles
		{label = "Chargeur de Pistolet 9mm MK2", 				mag = 'W_PI_PISTOL_MAG1',			hash = 453432689, 	itemmag = 'mag_pistol_mk2', 		maxitemqty = 30},
		{label = "Chargeur de Pistolet 9mm", 					mag = 'W_PI_PISTOL_MAG1',			hash = 3219281620, 	itemmag = 'mag_pistol', 			maxitemqty = 30},
		{label = "Chargeur de Pistolet de combat", 				mag = 'W_PI_COMBATPISTOL_MAG1', 	hash = 1593441988, 	itemmag = 'mag_combatpistol', 		maxitemqty = 30},
		{label = "Chargeur de Pistolet calibre 50", 			mag = 'W_PI_PISTOL50_MAG1', 		hash = -1716589765, itemmag = 'mag_pistol50', 			maxitemqty = 30},
		{label = "Chargeur de Pistolet lourd", 					mag = 'W_PI_HEAVYPISTOL_MAG1', 		hash = -771403250, 	itemmag = 'mag_heavypistol', 		maxitemqty = 30},
		{label = "Chargeur de Pistolet perforant", 				mag = 'W_PI_APPISTOL_MAG1', 		hash = 584646201, 	itemmag = 'mag_appistol', 			maxitemqty = 30},
		{label = "Chargeur de Pétoire", 						mag = 'W_PI_SNS_PISTOL_MAG1', 		hash = -1076751822, itemmag = 'mag_snspistol', 			maxitemqty = 30},
		{label = "Chargeur de Pistolet vintage", 				mag = 'W_PI_VINTAGE_PISTOL_MAG1', 	hash = 137902532, 	itemmag = 'mag_vintagepistol', 		maxitemqty = 30},
		
		{label = "Chargeur de la Micro SMG", 					mag = 'W_SB_MICROSMG_MAG1', 		hash = 324215364, 	itemmag = 'mag_microsmg', 			maxitemqty = 30},
		{label = "Chargeur de l'SMG d'assaut", 					mag = 'W_SB_ASSAULTSMG_MAG1', 		hash = -270015777, 	itemmag = 'mag_assaultsmg', 		maxitemqty = 30},
		{label = "Chargeur de l'SMG d'assaut MK2", 				mag = 'W_SB_ASSAULTSMG_MAG1', 		hash = 961495388, 	itemmag = 'mag_assaultsmg_mk2', 	maxitemqty = 30},
		{label = "Chargeur de la SMG", 							mag = 'W_SB_SMG_MAG1', 				hash = 736523883, 	itemmag = 'mag_smg', 				maxitemqty = 30},
		{label = "Chargeur de la SMG MK2", 						mag = 'W_SB_SMG_MAG1', 				hash = 2024373456, 	itemmag = 'mag_smg_mk2', 			maxitemqty = 30},
		{label = "Chargeur de la PDW", 							mag = 'W_SB_PDW_MAG1', 				hash = 171789620, 	itemmag = 'mag_pdw', 				maxitemqty = 30},
		{label = "Chargeur de la Gusenberg", 					mag = 'W_SB_GUSENBERG_MAG1', 		hash = 1627465347, 	itemmag = 'mag_gunsenberg', 		maxitemqty = 30},
		
		{label = "Chargeur de la Mitrailleuse", 				mag = 'W_MG_MG_MAG1', 				hash = -1660422300, itemmag = 'mag_mg', 				maxitemqty = 30},
		{label = "Chargeur de la Mitrailleuse de combat", 		mag = 'W_MG_COMBATMG_MAG1', 		hash = 2144741730, 	itemmag = 'mag_combatmg', 			maxitemqty = 30},
		{label = "Chargeur de la Mitrailleuse de combat MK2", 	mag = 'W_MG_COMBATMG_MAG1', 		hash = 3686625920, 	itemmag = 'mag_combatmg_mk2', 		maxitemqty = 30},

		{label = "Chargeur de la Carabine d'assaut", 			mag = 'W_AR_ASSAULTRIFLE_MAG1', 	hash = -1074790547, itemmag = 'mag_assaultrifle', 		maxitemqty = 30},
		{label = "Chargeur de la Carabine", 					mag = 'W_AR_CARBINERIFLE_MAG1', 	hash = -2084633992, itemmag = 'mag_carbinerifle', 		maxitemqty = 30},
		{label = "Chargeur de la Carabine MK2", 				mag = 'W_AR_CARBINERIFLE_MAG1', 	hash = 4208062921, 	itemmag = 'mag_carbinerifle_mk2', 	maxitemqty = 30},
		{label = "Chargeur de la Carabine avancée", 			mag = 'W_AR_ADVANCEDRIFLE_MAG1',	hash = -1357824103, itemmag = 'mag_advancedrifle', 		maxitemqty = 30},
		{label = "Chargeur de la Carabine spéciale", 			mag = 'W_AR_SPECIALCARBINE_MAG1',	hash = -1063057011, itemmag = 'mag_specialrifle', 		maxitemqty = 30},
		{label = "Chargeur de la Carabine BullPup", 			mag = 'W_AR_BULLPUPRIFLE_MAG1',		hash = 2132975508, 	itemmag = 'mag_bullpup', 			maxitemqty = 30},

		{label = "Chargeur du Sniper Marksman", 				mag = 'W_SR_MARKSMANRIFLE_MAG1', 	hash = -952879014, 	itemmag = 'mag_marksman', 			maxitemqty = 30},
		{label = "Chargeur du Sniper léger", 					mag = 'W_SR_SNIPERRIFLE_MAG1', 		hash = 100416529, 	itemmag = 'mag_sniper', 			maxitemqty = 30},
		{label = "Chargeur du Sniper lourd", 					mag = 'W_SR_HEAVYSNIPER_MAG1', 		hash = 205991906, 	itemmag = 'mag_heavysniper', 		maxitemqty = 30},

		{label = "Chargeur du Fusil à pompe d'assaut", 			mag = 'W_SG_ASSAULTSHOTGUN_MAG1', 	hash = -494615257, 	itemmag = 'mag_assaultshotgun', 	maxitemqty = 30},
		{label = "Chargeur du Fusil à pompe lourd", 			mag = 'W_SG_HEAVYSHOTGUN_MAG1', 	hash = 984333226, 	itemmag = 'mag_heavyshotgun', 		maxitemqty = 30},
	}
}