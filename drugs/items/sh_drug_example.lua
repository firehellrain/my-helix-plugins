--[[

	This is an item example which you can use as a template for your drug items.
	Name, description, model and class are information variables for your items.
	Width and Height are the space that the item will take in your inventory.
	Price will be the cost at the salesman.
	
	functions.Take is an example function which, when clicked, consumes the item, produces a sound and modifies the character's strength and dexterity
	It is compatible with PrimaryNeeds plugin, allowing you to remove Thirst and Hunger from the player if the commands are added.

]]--

ITEM.name = "Drug Example"
ITEM.description = "This is a drug example."
ITEM.model = Model("models/mosi/fallout4/props/alcohol/beer.mdl")
ITEM.class = "Drug"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 100

ITEM.functions.Take = {
	sound = "npc/barnacle/barnacle_gulp1.wav",
	OnRun = function(itemTable)
		local client = itemTable.player
		
		client:GetCharacter():AddBoost("testStr", "str", 20)
		client:GetCharacter():AddBoost("testDex", "dex", -20)
		hook.Run("SetupDrugTimer", client, client:GetCharacter(), 60)
	end
}