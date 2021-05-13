--[[

	This is an item example which you can use as a template for your items.
	Name, description, model and class are information variables for your items.
	Width and Height are the space that the item will take in your inventory.
	Price will be the cost at the salesman.
	
	functions.Eat is an example function which, when clicked, consumes the item, reproduces a sound and sets the hunger and thirst of the character to a value.
	To modify the amount of hunger/thirst restored, you have to edit the value added to the GetHunger() or GetThirst() functions, in this case, 50.

]]--

ITEM.name = "Item Example"
ITEM.description = "An example item."
ITEM.model = Model("models/props_junk/PopCan01a.mdl")
ITEM.class = "Example"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 5

ITEM.functions.Eat = {
	sound = "items/battery_pickup.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		
		client:GetCharacter():SetHunger(math.Clamp(client:GetCharacter():GetHunger() + 50, 0, 100))
		client:GetCharacter():SetThirst(math.Clamp(client:GetCharacter():GetThirst() + 50, 0, 100))
	end
}