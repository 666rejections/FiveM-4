mpbiker

# WeaponModifier

Modification des armes et munitions, (armes à pied, armes monté sur vehicle, munitions de véhicule)

Par stream du `weapons.meta`.

Info sur le weapon.meta (ici)[https://forums.gta5-mods.com/topic/11337/reference-weapons-meta-flags-and-hashes/6] et (ici)[https://gtamods.com/wiki/Weapons.meta]


**Ce fichier de config ne contient pas les armes MK2 ni les armes ajoutés après mise à jour**.
Les armes MK2 sont géré dans un fichier de config par arme: `weapons_x.meta` ou x = le modèle d'arme.

Une autre partie des modification sont opérés par le fichier `client.lua` ou une native `0x4757f00bc6323cfe` est référencé mais non documenté sert de multiplier général au lancement du script et s'initialise qu'une fois.

### Problèmes

Certaines dégâts d'armes comme `WEAPON_UNARMED` (poing) ne sont peuvent pas être modifiés mais seulement désactivés à partir du weapon.meta pour une raison inconnu. Du coup, c'est le fichier client qui reprend le relais avec le modifier qui semble être l'équivalent au `NetworkPlayerDamageModifier` du meta.

*Les armes commentés dans le client sont des armes sont le modifier est géré par le meta.*

### Modification

Certaines armes ont été totalement désactivées par le meta pour éviter que les joueurs et/ou des PNJ même popé par un moddeur ne puissent tirer avec. (ex: RPG, hydra).

Il y a 3 grenades "à main" de dispo:
- Explosive
- Tear Gas (lacrymo)
- BZ

Le BZ est de base plus puissant que le Tear gas sauf IG, ou le TearGas peu tuer et non le BZ. Tout deux on la même apparence (grenade cylindrique) et le même "nuage".

Le **grenade launcher** tire des munitions explosive de 40mm équivalente à la pipe bomb cependant il peu tiré également:
- Explosive
- Smoke (fumigène)
- BZ

Il a été modifié pour tirer du BZ qui à l'effet d'une Tear Gas.

Certains dégats des grenades du launcher se règle à partir sur `WEAPON_GRENADELAUNCHER` et non de la munition (chelou).

autres :
- Suppression de la priorité des armes pour le MINIGUN, RPG, PASSENGER_ROCKET et STINGER (l. 115 ⇒ 415)

## Weapons

#### WEAPON_UNARMED
- Modification des dégats (l. 2794 ⇒ 2796)

#### WEAPON_BALL
- Modification des dégats de la balle (l. 14748 ⇒ 14750)

#### WEAPON_KNIFE
- Modification des dégats (l. 3369 ⇒ 3370)

#### WEAPON_NIGHTSTICK
- Modification des dégats (l. 3599 ⇒ 3601)

#### WEAPON_HAMMER
- Modification des dégats (l. 3823 ⇒ 3825)

#### WEAPON_BAT
- Modification des dégats (l. 4042 ⇒ 4043)

#### WEAPON_GOLFCLUB
- Modification des dégats (l. 4251 ⇒ 4252)

#### WEAPON_CROWBAR
- Modification des dégats (l. 4475 ⇒ 4477)

#### WEAPON_PISTOL
- Modification en arme bleu (arme factice)
- Modification des dégats (l. 4595, 4715 ⇒ 4717)
- Ajout du Flag Silenced, elle est donc maintenant silencieuse (l. 4850)
- Modification des dégâts vuent sur l'HUD dans la roue des armes (l. 4865)

#### WEAPON_COMBATPISTOL
- **Modification de *FirstPersonScopeOffset* pour s'adapter au Glock moddé (l. 5052)**
- **Modification de l'attachment *WAPFlshLasr* en *WAPFlshLasr_2* pour s'adapter au glock moddé (l. 5123)**
- **Modification de l'attachment *WAPSupp* en *WAPSupp_2* pour s'adapter au glock moddé (l. 5132)**

#### WEAPON_STUNGUN
- Temps de taze augmenté de 4s à 15s (DamageTime) (l. 9479)
- Temps de recharge augmenté de 2.8s à 3.5s (TimeBetweenShots) (l. 9507)
- Ajout du Flag Silenced, le tazer est maintenant une arme considérée comme silencieuse (l. 9648)

#### WEAPON_FALL
- Ajout du Flag ArmourPenetrating, les dégats de chutes sont maintenant prit sur la vie et non plus sur le gilet par balle (l. 	18591)

#### WEAPON_MINIGUN
- Suppression du SLOT_MINIGUN (l. 11775)
- Modification des types de dommages (l. 11776)
- Modification des types de tirs (l. 11785)
- Modification de la munition (l. 11788)
- Modification du nombre de munitions dans le chargeur (l. 11790)
- Modification des dégâts (l. 11922 ⇒ 11924)
- Modification des flags (l. 12017)

#### WEAPON_RPG
- Suppression du SLOT_RPG
- Modification du type de dégats de l'arme
- Suppression de la munition utilisée
- Modification de la taille du chargeur à 0
- Modification des dégats à 0
- Suppression des Flags CarriedInHand & Gun & CanFreeAim & TwoHanded & UsableOnFoot & Rpg & DriveByMPOnly
- Ajout des Flags HiddenFromWeaponWheel & NoAmmoDisplay

#### WEAPON_STINGER
- Suppression du SLOT_STINGER
- Modification du type de tirs
- Modification de la munition utilisée
- Modification de la taille du chargeur
- Modification des dégats
- Modification des Flags

#### WEAPON_PASSENGER\_ROCKET
- Suppression du SLOT_PASSENGER_ROCKET
- Modification du type de dommages
- Modification du type de tirs
- Modification de la munition utilisée
- Modification de la taille du chargeur
- Suppression des Flags CarriedInHand & Gun & CanFreeAim & TwoHanded & UsableOnFoot
- Ajout des Flags HiddenFromWeaponWheel & NoAmmoDisplay

#### WEAPON_AIRSTRIKE\_ROCKET
- Modification des types de dommages
- Modification du type de tirs
- Modification de la munition utilisée
- Modification de la taille du chargeur
- Modification des dégats
- Modification des Flags

#### WEAPON_GRENADELAUNCHER
- Modification du type de dommages
- Modification de la taille du chargeur
- Modification des dégats
- Ajout des Flags Silenced & ArmourPenetrating
- Modification de l'énergie du joueur dans il tire et vise
- Modification des informations de l'arme sur l'HUD

#### WEAPON_STICKYBOMB
- Modification du type de dommages (l. 12258)
- Modification du type de tirs (l. 12267)
- Modification de la munition (l. 12270)
- Modification des dégâts (l. 12366 ⇒ 12368)

#### WEAPON_SMOKEGRENADE
- Modification des dégats

#### WEAPON_VEHICLE\_ROCKET
- Modification du type de dommages
- Suppression de la munition utilisée
- Modification de la taille du chargeur
- Modification des Flags

#### WEAPON_COMPACTLAUNCHER
- Modification du type de dommages (l. 45)
- Modification du type de tir (l. 54)
- Modification des dégâts (l. 75)
- Ajout du Flag Silenced (l. 275)

## Ammo

#### AMMO_MINIGUN
- Modification du nombre de munitions à 0 pour AMMO_MINIGUN
- Modification du type de dommages
- Modification du type de tir
- Modification de la munition utilisée
- Modification de la taille du chargeur
- Modification des dégats
- Modification des Flags

#### AMMO_RPG
- Modification du nombre de munitions à 0 pour AMMO_RPG
- Suppression du flag AddSmokeOnExplosion pour AMMO_RPG
- Modification du LifeTime à 0 pour AMMO_RPG
- Modification du LaunchSpeed à 0 pour AMMO_RPG
- Modification du TimeToReachTarget à 0 pour AMMO_RPG
- Modification du GravityFactor à 0 pour AMMO_RPG
- Modification des types d'explosions à DONTCARE pour AMMO_RPG
- Suppresion des effets visuels pour AMMO_RPG
- Suppression des ProjectileFlags : DestroyOnImpact & ProcessImpacts & DoGroundDisturbanceFx
- Ajout du ProjectileFlags : TrailFxInactiveOnceWet
- Modification du MaxRollAngleSin à 0 pour AMMO_RPG

#### AMMO_TANK
- Modification du nombre de munitions
- Modification du type d'explosion
- Suppression des ProjectileFlags DestroyOnImpact & ProcessImpacts
- Ajout des ProjectileFlags HiddenFromWeaponWheel & NoAmmoDisplay

#### AMMO_SPACE\_ROCKET
- Modification des types d'explosion
- Suppression des ProjectileFlags DestroyOnImpact & ProcessImpacts & DoGroundDisturbanceFx

#### AMMO_PLANE\_ROCKET
- Modification des munitions à 0
- Suppression du Flag AddSmokeOnExplosion
- Modification des types d'explosion
- Modification des effets visuels
- Suppression des ProjectileFlags DestroyOnImpact & ProcessImpacts & DoGroundDisturbanceFx
- Ajout des ProjectileFlags HiddenFromWeaponWheel NoAmmoDisplay

#### AMMO_PLAYER\_LASER
- Modification du nombre de munitions à 0
- Suppression du Flag InfiniteAmmo
- Suppression du ProjectileFlags DestroyOnImpact

#### AMMO_ENEMY\_LASER
- Modification du nombre de munitions à 0
- Suppression du Flag InfiniteAmmo
- Suppression du ProjectileFlags DestroyOnImpact

#### AMMO_STINGER
- Modification du nombre de munitions à 0 pour AMMO_STINGER
- Suppression du flag AddSmokeOnExplosion pour AMMO_STINGER
- Modification du LaunchSpeed à 0 pour AMMO_STINGER
- Modification du TimeToReachTarget à 0 pour AMMO_STINGER
- Modification des types d'explosions à DONTCARE pour AMMO_STINGER
- Suppresion des effets visuels pour AMMO_STINGER
- Suppression des ProjectileFlags : DestroyOnImpact & ProcessImpacts & DoGroundDisturbanceFx
- Ajout du ProjectileFlags : TrailFxInactiveOnceWet

#### AMMO_SMOKEGRENADE
- Modification du ExplosionTime
- Modification du LaunchSpeed

#### AMMO_BZGAS
- Modification du type d'explosion en smoke
- Modification des effets visuels pour AMMO_BZGAS

#### AMMO_GRENADELAUNCHER
- Modification du nombre de munitions à 10 et 15 pour AMMO_GRENADELAUNCHER
- Ajout des flags FUSE & FixedAfterExplosion pour AMMO_GRENADELAUNCHER
- Modification du LifeTime pour AMMO_GRENADELAUNCHER
- Modification du damping pour AMMO_GRENADELAUNCHER
- Modification des ricochets pour AMMO_GRENADELAUNCHER
- Modification du type d'explosion pour AMMO_GRENADELAUNCHER

## Vehicle

#### VEHICLE_WEAPON\_ENEMY\_LASER
- Modification du type de dommages
- Modification du type de tir
- Modification de la taille du chargeur
- Suppression de la munition utilisée
- Modification des dégats
- Suppression des Flags Gun & UsableOnFoo

#### VEHICLE_WEAPON\_PLAYER\_LAZER
- Modification du type de dommages
- Suppression du type d'explosion
- Modification du type de tirs
- Suppression de la munition utilisée
- Modification de la taille du chargeur
- Suppression des Flags Gun & UsableOnFoot

#### VEHICLE_WEAPON\_PLAYER\_BUZZARD
- Modification du type de dommages
- Modification du type de tir
- Suppression de la munition utilisée
- Modification de la taille du chargeur
- Modification des dégats

#### VEHICLE_WEAPON\_PLAYER\_BULLET
- Modification du type de dommages
- Modification du type de tirs
- Suppression de la munition utilisée
- Modification de la taille du chargeur
- Modification des dégats
- Suppression des Flags Gun & UsableOnFoot
- Ajout des Flags HiddenFromWeaponWheel & NoAmmoDisplay

#### VEHICLE_WEAPON\_PLAYER\_LASER
- Suppression de la munition utilisée
- Modification de la taille du chargeur
- Modification des dégats
- Suppression des Flags Gun & UsableOnFoot

#### VEHICLE_WEAPON\_PLANE\_ROCKET
- Modification du type de dommages
- Modification du type de tir
- Suppression de la munition utilisée
- Modification de la taille du chargeur
- Modification des dégats
- Modification des Flags

#### VEHICLE_WEAPON\_SPACE\_ROCKET
- Modification du type de dommages
- Modification du type de tir
- Suppression de la munition utilisée
- Modification de la taille du chargeur
- Modification des dégats
- Suppression des Flags Gun & CanLockonInVehicle & Homing & Vehicle & HomingToggle

#### VEHICLE_WEAPON\_TANK
- Modification des types de dommages
- Modification du type de tir
- Suppression de la munition utilisée
- Modification du nombre de munitions dans le chargeur
- Modification des dégats
- Ajout des Flags HiddenFromWeaponWheel & NoAmmoDisplay
