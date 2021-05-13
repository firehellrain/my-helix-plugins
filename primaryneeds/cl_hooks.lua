local PLUGIN = PLUGIN;

function PLUGIN:GetHungerText(amount)
	if ( amount > 80 ) then
		return L("hungerHealthy")
	elseif( amount > 70 ) then
		return L("hungerSnack")
	elseif( amount > 50 ) then
		return L("hungerHungry")
	elseif( amount > 30 ) then
		return L("hungerStarving")
	elseif( amount > 0 ) then
		return L("hungerDeath")
	end
end
	
function PLUGIN:GetThirstText(amount)
	if ( amount > 80 ) then
		return L("thirstHealthy")
	elseif( amount > 70 ) then
		return L("thirstBit")
	elseif( amount > 50 ) then
		return L("thirstThirsty")
	elseif( amount > 30 ) then
		return L("thirstDehydrated")
	elseif( amount > 0 ) then
		return L("thirstDeath")
	end
end

function PLUGIN:HungerEnabled()
	ix.bar.Add(function()
		local hunger = LocalPlayer():GetCharacter():GetHunger()
		return hunger / 100,
		self:GetHungerText(hunger)
	end, Color(241, 117, 15), nil, "hunger")
	
	ix.bar.Add(function()
		local thirst = LocalPlayer():GetCharacter():GetThirst()
		return thirst / 100, 
		self:GetThirstText(thirst)
	end, Color(15, 169, 241), nil, "thirst")
end

function PLUGIN:HungerDisabled()
	ix.bar.Remove("hunger")
	ix.bar.Remove("thirst")
end