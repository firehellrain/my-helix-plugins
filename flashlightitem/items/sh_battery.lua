
ITEM.name = "Flashlight Battery"
ITEM.model = Model("models/mosi/fallout4/props/junk/fuse.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A battery which allows you to reload your flashlight."
ITEM.category = "Misc"

ITEM.functions.Recargar = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local character = client:GetCharacter()
		local inventory = character:GetInventory()
		local item = inventory:HasItem("flashlight")
		
		if(item and item:GetData("battery", 100)<100) then
			item:SetData("battery", (math.Clamp(item:GetData("battery", 100) + 50, 0, 100)))
			client:EmitSound("items/battery_pickup.wav")
		else
			client:Notify("You don't have a flashlight to charge up.")
			return false
		end
	end
}