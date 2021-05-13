local PLUGIN = PLUGIN

PLUGIN.name = "Drugs"
PLUGIN.author = "firehellrain"
PLUGIN.description = "Adds drugs to the game."
PLUGIN.license = [[
© Copyright 2021 by firehellrain

This plugin is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License.
To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/4.0/

]]

ix.char.RegisterVar("drugTimer", {
	field = "drugTimer",
	fieldType = ix.type.number,
	default = 600,
	isLocal = true,
	bNoDisplay = true
})

ix.util.Include("sv_hooks.lua")