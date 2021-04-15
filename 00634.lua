function LuaI_201654_Check()
	local TAR1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110884 , 50 )
	local TAR2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110885 , 50)
	local TAR3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110886 , 50 )
	if CheckAcceptQuest( OwnerID() , 420739 ) == false then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SAY_420739_2"), C_SYSTEM  ) --/*這裡已經擺過祭品了。		
		return false
	end
	if CheckID( TAR1 )== true or CheckID( TAR2) ==  true or CheckID( TAR3 ) ==  true then
		if CheckID( TAR1 ) ==  true and CheckFlag( OwnerID() , 540862) == true then
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SAY_420739_0"), C_SYSTEM  ) --/*這裡已經擺過祭品了。
			return false
		elseif CheckID( TAR2 ) == true and CheckFlag( OwnerID() , 540863) == true then
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SAY_420739_0"), C_SYSTEM  ) --/*這裡已經擺過祭品了。
			return false
		elseif CheckID( TAR3 ) == true and CheckFlag( OwnerID() , 540864) == true then
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SAY_420739_0"), C_SYSTEM  ) --/*這裡已經擺過祭品了。
			return false
		else
			return true
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SAY_420739_1"), C_SYSTEM  ) --/*你還沒到達祭祀圖騰柱的地點。
		return false
	end
end

function LuaI_201654_USE()
	local TAR1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110884 , 50 )
	local TAR2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110885 , 50 )
	local TAR3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110886 , 50 )
	if CheckID( TAR1 ) == true then
		SetFlag( OwnerID() , 540862 , 1)
	elseif CheckID( TAR2 ) == true then
		SetFlag( OwnerID() , 540863 , 1)
	elseif CheckID( TAR3 ) == true then
		SetFlag( OwnerID() , 540864 , 1)
	else
		ScriptMessage( OwnerID(), OwnerID(), 0 , "ERROR!!", 0 ) 
		return
	end
	local Good = CreateObjByObj( 110924 , OwnerID() )
	BeginPlot( Good , "LuaI_110924_0" , 0 )
end

function LuaI_110924_0()

	local Ret = {}
	local Obj;
	local Count = SetSearchRangeInfo( OwnerID(),150 )
	local NPCCount = 0

	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsNPC() == True then
			if Obj:OrgID() == 100447 or Obj:OrgID() == 100448 or Obj:OrgID() == 100449 then 
				Ret[NPCCount] = ID
				NPCCount = NPCCount + 1;
			end
		end
	end	
	Ret[ NPCCount ] = -1;
	
	for i = 1 , table.getn(Ret) , 1 do
		if Ret[i] ~= -1 then
			BeginPlot( Ret[i] , "LuaI_110924_1" , 0 )
		end
	end
	sleep( 150 )
	DelObj( OwnerID() )
end

function LuaI_110924_1()
	MoveToFlagEnabled( OwnerID() , false )
	SetStopAttack(OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )
	Hide( OwnerID() )
	Show( OwnerID() , 0 )
	FaceObj( OwnerID() , TargetID() )
	sleep( 75 )
	MoveToFlagEnabled( OwnerID() , true )
	SetRoleCamp( OwnerID() , "Monster" )
	Hide( OwnerID() )
	Show( OwnerID() , 0 )
end