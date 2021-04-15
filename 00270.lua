function Suez_TestSpell_Check()
	local race = ReadRoleValue( TargetID() , EM_RoleValue_Race ) 
	Say( OwnerID() , race )
	if Race < 5 or Race == 6 then
		if CheckBuff(TargetID(),502167) == true then
			Say( OwnerID() , "You Can't Do It." )
			return false
		else
			return true
		end
	else
		return false
	end
end

function Suez_TestSpell_USE()
	Say(OwnerID() ,"CHECK")
	local Obj;
	local Count = SetSearchRangeInfo( OwnerID(),500 )
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff(ID,502166) == true and ID ~= TargetID() then

			local BuffPos = Lua_BuffPosSearch( ID, 502166 )
			Say(OwnerID() ,BuffPos )
			Say( OwnerID() , BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID))
			Say( OwnerID() , OwnerID() )
			if BuffPos >= 0 and BuffInfo(ID , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() then
				CancelBuff(ID,502166)
				AddBuff(ID ,502167 , 1 ,30 );
			end
		end
	end
	
	if CheckBuff(TargetID() , 502167 ) ~= true then	
		return True
	else
		return false
	end
end

function Suez_TestSpell_Touch()
	SetPlot( OwnerID() , "Touch" , "Suez_TestSpell_Touch2" , 50 )
end

function Suez_TestSpell_Touch2()
	Say( OwnerID() , "DO" )
	AddBuff( OwnerID() , 502848 , 100 , -1 )
end