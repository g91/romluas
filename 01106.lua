function Discowood_OnlyOne_Check()
	Hide(OwnerID())
	Local ThisMonster = ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)
	local Count = SetSearchAllNPC(0)
	local NPC = {}
	local HowMany = 0
	for i = 1 , Count do
		NPC[i] = GetSearchResult()
	end
	for i = 1, Count do
		if ReadRoleValue(NPC[i] ,EM_RoleValue_OrgID) == ThisMonster then
			HowMany = HowMany + 1
		end
	end
	if HowMany < 2 then
		Show(OwnerID(),0)
	else
		ReSetNPCInfo(OwnerID())
		Show(OwnerID(),0)
	end
	
end