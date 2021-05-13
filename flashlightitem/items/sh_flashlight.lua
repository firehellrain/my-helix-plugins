
ITEM.name = "Flashlight"
ITEM.model = Model("models/mosi/fallout4/props/junk/earexaminer.mdl")
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A basic flashlight which allows you to brighten dark places. It has %s of battery."
ITEM.category = "Misc"

function ITEM:GetDescription()
	return string.format(self.description, self:GetData("battery", 100))
end

ITEM:Hook("drop", function(item)
	item.player:Flashlight(false)
	item:SetData("battery", item:GetData("battery"))
end)
