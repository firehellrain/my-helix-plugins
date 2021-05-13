
PLUGIN.name = "Flashlight item + Battery System"
PLUGIN.author = "SleepyMode and firehellrain"
PLUGIN.description = "Adds an item allowing players to toggle their flashlight."

ix.config.Add("batteryTickTime", 20, "How much time it takes for the flashlight to run out of battery.", nil, {
	data = {min = 0.1, max = 1440, decimals = 1},
	category = "Flashlight"
})

function PLUGIN:PlayerSwitchFlashlight(client, bEnabled)
	local character = client:GetCharacter()
	local inventory = character and character:GetInventory()
	if (character) then
	local item = character:GetInventory():HasItem("flashlight")
	
	if (inventory and inventory:HasItem("flashlight") and item:GetData("battery", 100)>0) then
		return true
	end
	end
end

function PLUGIN:InitializedConfig()
	hook.Run("BatteryInit")
end

function PLUGIN:OnReloaded()
	hook.Run("BatteryInit")
end
ix.util.Include("sv_hooks.lua")