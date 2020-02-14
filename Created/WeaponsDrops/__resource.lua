--Get the latest manifest : https://docs.fivem.net/scripting-reference/resource-manifest/resource-manifest/
resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

client_scripts {
	'client/gunpowder.lua',
	'client/cartridge.lua',
	'config.lua'
}
server_scripts {
	'server/server.lua',
	'@mysql-async/lib/MySQL.lua'
}