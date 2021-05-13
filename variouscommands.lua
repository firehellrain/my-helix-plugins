local PLUGIN = PLUGIN
PLUGIN.name = "Various Commands"
PLUGIN.author = "firehellrain"
PLUGIN.description = "Plugin which adds some new commands to the game."
PLUGIN.license = [[
© Copyright 2021 by firehellrain

This plugin is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/

]]

ix.command.Add("DropItem", {
	description = "Spawn an item in front of you",
	superAdminOnly = true,
	arguments = {
		ix.type.string,
	},
	OnRun = function(self, client, item)
		local uniqueID = item:lower()

		if (!ix.item.list[uniqueID]) then
			for k, v in SortedPairs(ix.item.list) do
				if (ix.util.StringMatches(v.name, uniqueID)) then
					uniqueID = k

					break
				end
			end
		end

		local spawnpoint = client:GetEyeTraceNoCursor().HitPos
		
		ix.item.Spawn(uniqueID, spawnpoint)
	
		client:Notify("The item has been spawned correctly")

	end
})

ix.command.Add("GiveFlags", {
	description = "Gives every single flag to the user",
	privilege = "Manage Character Flags",
	superAdminOnly = true,
	arguments = {
		ix.type.character,
	},
	OnRun = function(self, client, target)

		for k, _ in SortedPairs(ix.flag.list) do
			target:GiveFlags(k)
		end
	
		for _, v in ipairs(player.GetAll()) do
			if (self:OnCheckAccess(v) or v == ply) then
				v:NotifyLocalized("giveFlags", client:GetName(), target:GetName())
			end
		end
	end
})


ix.command.Add("GiveAdminFlags", {
	description = "Gives all the admin flags to a user",
	privilege = "Manage Character Flags",
	superAdminOnly = true,
	arguments = {
		ix.type.character,
	},
	OnRun = function(self, client, target)
		
		target:GiveFlags("CVcEenptv")
	
		for _, v in ipairs(player.GetAll()) do
			if (self:OnCheckAccess(v) or v == ply) then
				v:NotifyLocalized("giveFlags", client:GetName(), target:GetName())
			end
		end
	end

})

ix.command.Add("CharSetHealth", {
	description = "Adjust a character's health",
	privilege = "Manage Character Attributes",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.number
	},
	OnRun = function(self, client, target, health)
		
		local ply = target:GetPlayer()
		local amount = math.Clamp(math.Round(health), 1, ply:GetMaxHealth())
		ply:SetHealth(amount)
		
		for _, v in ipairs(player.GetAll()) do
			if (self:OnCheckAccess(v) or v == ply) then
				v:NotifyLocalized("setHealth", client:GetName(), target:GetName(), health)
			end
		end
	end
})

ix.command.Add("CharSetArmor", {
	description = "Adjust a character's armor",
	privilege = "Manage Character Attributes",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.number
	},
	OnRun = function(self, client, target, armor)
		
		local ply = target:GetPlayer()
		local amount = math.Clamp(math.Round(armor), 1, 255)
		ply:SetArmor(amount)
		
		for _, v in ipairs(player.GetAll()) do
			if (self:OnCheckAccess(v) or v == ply) then
				v:NotifyLocalized("setArmor", client:GetName(), target:GetName(), armor)
			end
		end
	end
})


-- [[ Notifications ]] --

ix.lang.AddTable("english", {
    setHealth = "%s has set the health of %s to %s",
	setArmor = "%s has set the armor of %s to %s",
	giveFlags = "%s has given %s all the flags",
	setGroup = "%s has set %s 's group to %s"
})

ix.lang.AddTable("spanish", {
    setHealth = "%s ha ajustado la vida de %s a %s",
	setArmor = "%s ha ajustado la armadura de %s a %s",
	giveFlags = "%s le ha dado a %s todas las flags",
	setGroup = "%s ha asignado a %s el grupo %s"
})