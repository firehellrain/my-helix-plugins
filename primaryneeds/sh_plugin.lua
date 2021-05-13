local PLUGIN = PLUGIN

PLUGIN.name = "Primary Needs"
PLUGIN.author = "firehellrain"
PLUGIN.description = "Plugin which adds primary needs to the characters."
PLUGIN.license = [[
© Copyright 2021 by firehellrain

This plugin is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/

]]

--[[ Player Variables ]]--

ix.char.RegisterVar("hunger", {
	field = "hunger",
	fieldType = ix.type.number,
	default = 100,
	isLocal = true,
	bNoDisplay = true
})

ix.char.RegisterVar("thirst", {
	field = "thirst",
	fieldType = ix.type.number,
	default = 100,
	isLocal = true,
	bNoDisplay = true
})

--[[ Config ]]--

ix.config.Add("hungerEnabled", false, "Activate or deactivate the primary needs plugin.", function(oldValue, newValue)
	if (newValue) then
		hook.Run("HungerEnabled")
	else
		hook.Run("HungerDisabled")
	end
end, {category = "Primary Needs"})

ix.config.Add("hungerDamage", 2, "Damage recieved by each hunger tick when starving.", nil, {
	data = {min = 0, max = 100},
	category = "Primary Needs"
})

ix.config.Add("hungerLossTime", 5, "Time in minutes before a character starts starving to death.", nil, {
	data = {min = 0.1, max = 1440, decimals = 1},
	category = "Primary Needs"
})

ix.config.Add("hungerTickTime", 5, "Time between each hunger tick. MODIFY WITH CAUTION.", function(oldValue, newValue)
	if (SERVER) then
		PLUGIN:SetupAllTimers()
	end
end, {data = {min = 1, max = 60}, category = "Primary Needs"})

ix.config.Add("thirstDamage", 2, "Damage recieved by each thirst tick when dehydrated.", nil, {
	data = {min = 0, max = 100},
	category = "Primary Needs"
})

ix.config.Add("thirstLossTime", 5, "Time in minutes before a character starts dehydrating.", nil, {
	data = {min = 0.1, max = 1440, decimals = 1},
	category = "Primary Needs"
})

ix.config.Add("thirstTickTime", 5, "Time between each thirst tick. MODIFY WITH CAUTION.", function(oldValue, newValue)
	if (SERVER) then
		PLUGIN:SetupAllTimers()
	end
end, {data = {min = 1, max = 60}, category = "Primary Needs"})

function PLUGIN:InitializedConfig()
	if (ix.config.Get("hungerEnabled")) then
		hook.Run("HungerEnabled")
	else
		hook.Run("HungerDisabled")
	end
end

function PLUGIN:OnReloaded()
	if (ix.config.Get("hungerEnabled")) then
		hook.Run("HungerEnabled")
	else
		hook.Run("HungerDisabled")
	end
end


ix.util.Include("cl_hooks.lua")
ix.util.Include("sv_hooks.lua")

--[[ Commands ]]--

ix.command.Add("CharSetHunger", {
	description = "Command to set the hunger value of a character",
	privilege = "Manage Character Attributes",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.number
	},
	OnRun = function(self, client, target, hunger)
		local amount = math.Clamp(math.Round(hunger), 1, 100)
		target:SetHunger(amount)
		
		for _, v in ipairs(player.GetAll()) do
			if (self:OnCheckAccess(v) or v == ply) then
				v:NotifyLocalized("setHunger", client:GetName(), target:GetName(), hunger)
			end
		end
	end
})

ix.command.Add("CharSetThirst", {
	description = "Command to set the thirst value of a character",
	privilege = "Manage Character Attributes",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.number
	},
	OnRun = function(self, client, target, thirst)
		local amount = math.Clamp(math.Round(thirst), 1, 100)
		target:SetThirst(amount)
		
		for _, v in ipairs(player.GetAll()) do
			if (self:OnCheckAccess(v) or v == ply) then
				v:NotifyLocalized("setThirst", client:GetName(), target:GetName(), thirst)
			end
		end
	end
})

