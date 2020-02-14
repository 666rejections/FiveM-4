# frbadge - LSPD Police Badge
**Animation "Montrer insigne" pour la police**

- Badge provenant de LSPDFR (https://www.lcpdfr.com/files/file/23386-lspd-police-badge/)
- Dépend du script de la police
- *'frbadges.oiv'* contient le dlc du badge avec tout ses fichiers

## DEV

- Badge attaché à `GetPedBoneIndex(GetPlayerPed(-1), 28422)`
- **Position** du badge en fonction du bone : `Pos = {x = 0.117, y = -0.005, z = -0.035}`
- **Rotation** du badge en fonction du bone : `Rot = {x = -90.0, y = 171.0, z = -40.0}`
- Delete du badge au bout de **3100 ms** (moment où la main du joueur est au niveau de la ceinture)