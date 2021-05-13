
function PLUGIN:SetupDrugTimer(client, character, drugtimer)
	local steamID = client:SteamID64()
	character:SetDrugTimer(drugtimer)
	timer.Create("ixDrug" .. steamID, 1, 0, function()
		if (IsValid(client) and character) then
			self:DrugTick(client, character, 1)
		else
			timer.Remove("ixDrug" .. steamID)
		end
	end)
end

function PLUGIN:PlayerDeath(client)
	local character = client:GetCharacter()
	character:SetDrugTimer(0)
end

function PLUGIN:DrugTick(client, character, delta)
	if (!client:Alive() or client:GetMoveType() == MOVETYPE_NOCLIP) then
		return
	end

	local scale = 1

	-- update character drug timer
	local drugtimer = character:GetDrugTimer()
	local newTimer = math.Clamp(drugtimer - scale * (delta / 1), 0, 100)

	character:SetDrugTimer(newTimer)

	if (character:GetDrugTimer() < 1) then
		local boosts = character:GetBoosts()

		for attribID, v in pairs(boosts) do
			for boostID, _ in pairs(v) do
				character:RemoveBoost(boostID, attribID)
			end
		end
		character:SetDrugTimer(600)
		timer.Remove("ixDrug" .. client:SteamID64())
	end
end
