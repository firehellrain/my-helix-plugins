local PLUGIN = PLUGIN
PLUGIN.name = "Ranged Actions"
PLUGIN.author = "firehellrain"
PLUGIN.description = "Plugin which adds long and short distance interactions."
PLUGIN.license = [[
© Copyright 2021 by firehellrain

This plugin is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/

]]

-- [[ Commands ]] --

ix.chat.Register("mel", {
	format = "*** %s %s",
	GetColor = function(self, speaker, text)
		local color = ix.chat.classes.ic:GetColor(speaker, text)

		-- Make the whisper chat slightly darker than IC chat.
		return Color(255, 116, 0)
	end,
	CanHear = ix.config.Get("chatRange", 280) * 3,
	prefix = {"/Mel"},
	description = "@cmdMe",
	indicator = "chatPerforming",
	deadCanChat = true
})

ix.chat.Register("mec", {
	format = "* %s %s",
	GetColor = function(self, speaker, text)
		local color = ix.chat.classes.ic:GetColor(speaker, text)

		-- Make the whisper chat slightly darker than IC chat.
		return Color(255, 116, 0)
	end,
	CanHear = ix.config.Get("chatRange", 280) * 0.5,
	prefix = {"/Mec"},
	description = "@cmdMe",
	indicator = "chatPerforming",
	deadCanChat = true
})
		
ix.chat.Register("itl", {
	OnChatAdd = function(self, speaker, text)
		chat.AddText(Color(0, 185, 255), "*** "..text)
	end,
	CanHear = ix.config.Get("chatRange", 280) * 3,
	prefix = {"/Itl"},
	description = "@cmdIt",
	indicator = "chatPerforming",
	deadCanChat = true	
})

ix.chat.Register("itc", {
	OnChatAdd = function(self, speaker, text)
		chat.AddText(Color(0, 185, 255), "* "..text)
	end,
	CanHear = ix.config.Get("chatRange", 280) * 0.5,
	prefix = {"/Itc"},
	description = "@cmdIt",
	indicator = "chatPerforming",
	deadCanChat = true	
})
