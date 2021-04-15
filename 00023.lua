function SearchRangePlayer(GItemID,Range)
	local Ret = {}
	local Obj;
	local Count = SetSearchRangeInfo( GItemID,Range )
	local PlayerCount = 0
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsPlayer() then
			Ret[PlayerCount] = ID
			PlayerCount = PlayerCount + 1;
		end
	end	
	Ret[ PlayerCount ] = -1;
	return Ret;
end