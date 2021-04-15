function SearchHelp(NPCOrgID)
	local List = SearchRangeNPC( OwnerID() , 100 );
	local Owner = Role:new( OwnerID() );
	local Obj
	for i = 0 , 100 , 1 do
		if List[i] == -1 then 
			break;
		end		
		Obj = Role:New( List [i] )
		if Obj:OrgID() == NPCOrgID then
			Obj:SetAttack( Owner:AttackTargetID() )
		end
	end
end