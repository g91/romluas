function SearchRangeNPC(GItemID,Range)
	local Ret = {}
	local Obj;
	local Count = SetSearchRangeInfo( GItemID,Range )
	local NPCCount = 0
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsNPC() then
			Ret[NPCCount] = ID
			NPCCount = NPCCount + 1;
		end
	end	
	Ret[ NPCCount ] = -1;
	return Ret;
end