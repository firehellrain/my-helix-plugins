local PLUGIN = PLUGIN

PLUGIN.name = "Handcuffs"
PLUGIN.author = "firehellrain"
PLUGIN.description = "Adds handcuffs to tie up players."
PLUGIN.license = [[
© Copyright 2021 by firehellrain

This plugin is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/

]]

--[[ Variable declaration ]]--

ix.char.RegisterVar("tying", {
	field = "tying",
	fieldType = ix.type.bool,
	default = false,
	isLocal = true,
	bNoDisplay = true
})

ix.util.Include("cl_hooks.lua")
ix.util.Include("sv_hooks.lua")

--[[ Commands ]]--

do
	local COMMAND = {}
	COMMAND.description = "Search up a player in front of you"
	function COMMAND:OnRun(client, arguments)
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client
		local target = util.TraceLine(data).Entity

		if (IsValid(target) and target:IsPlayer() and target:IsRestricted()) then
			if (!client:IsRestricted()) then
				Schema:SearchPlayer(client, target)
			else
				return "@notNow"
			end
		end
	end

	ix.command.Add("CharSearch", COMMAND)
end