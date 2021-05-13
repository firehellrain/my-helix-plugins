function Schema:PlayerUse(client, entity)
	if (!client:IsRestricted() and entity:IsPlayer() and entity:IsRestricted() and !entity:GetNetVar("untying")) then
		if(client:GetChar():GetInventory():HasItem("keys")) then
			entity:SetAction("@beingUntied", 5)
			entity:SetNetVar("untying", true)

			client:SetAction("@unTying", 5)

			client:DoStaredAction(entity, function()
				entity:SetRestricted(false)
				entity:SetNetVar("untying")
				client:GetCharacter():GetInventory():Add("esposas", 1)
			end, 5, function()
				if (IsValid(entity)) then
					entity:SetNetVar("untying")
					entity:SetAction()
				end

				if (IsValid(client)) then
					client:SetAction()
				end
			end)
		--else
			--client:Notify("You don't have a key to open up the handcuffs.")
		end
	end
end


