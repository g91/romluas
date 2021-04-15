function LuaI_100566()
	SetPlot( OwnerID() , "touch" , "LuaI_100566_Touch" , 50 )
end

function LuaI_100566_Touch()
	BeginPlot( TargetID() , "LuaI_100566_Open" , 0 )
end

function LuaI_100566_Open()

	local ObjID =  TargetID() 
	local result = false;
	if( ReadRoleValue( OwnerID() ,EM_RoleValue_IsDead) == 1 ) then
		return;
	end

	if( CountBodyItem( ObjID , 201622 ) <= 0  or  CountBodyItem( ObjID , 201621 ) <= 0 ) then
		ScriptMessage( ObjID,ObjID,0,GetString("EM_100566_0"), 0 );	
		return;	
	end

	if BeginCastBar( ObjID , GetString("EM_100566_1") , 50 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
		ScriptMessage( ObjID,ObjID,0,"[SAY_NPC_BUSY]" , 0 );
		return
	end
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( ObjID  );
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- 成功
				result = true
				EndCastBar( ObjID  , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- 失敗
				result = false
				EndCastBar( ObjID  , CastBarStatus )
				return;
			end
		end
	end

	if ( result == true and CountBodyItem(ObjID , 201621) > 0 and CountBodyItem(ObjID , 201622) > 0 ) then
		SetPlot( OwnerID() , "touch" , "" , 0 )
		if( KillID( ObjID  , OwnerID() ) == true and DelBodyItem( ObjID , 201621 , 1) == true and DelBodyItem( ObjID , 201622 , 1) ) == true then 
			ScriptMessage( ObjID,ObjID,0,GetString("EM_100566_3"), 0 );
			local Player = LuaFunc_PartyData(ObjID)
			for i = 1 , Player[0] , 1 do
				if CheckAcceptQuest( Player[i] , 420555 ) == true and CountBodyItem( Player[i] , 200681) == 0 then
					GiveBodyItem( Player[i] , 200681 , 1 )
					if Checkflag( Player[i] , 541883 ) == true and Checkflag( Player[i] , 541884 ) == true  and CountBodyItem( Player[i] , 530359 ) <1 then
						GiveBodyItem ( Player[i] , 530359 , 1 )	-- 頭銜：「瑪卡斯宿敵」
					end
				end 
			end

		end
	end

--	DelObj( OwnerID() )

end

function LuaI_dead_100261()
	GiveBodyItem( TargetID() ,201621, 1 )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100261,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	local Player = LuaFunc_PartyData(TargetID())
	for i = 1 , Player[0] , 1 do
		if CheckBuff( Player[i], 502040 ) == true then
			SetFlag( OwnerID() , 541883, 1)
		end	
	end
	return true
end

function LuaI_dead_100262()
	GiveBodyItem(TargetID() , 201622 , 1 )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100262,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	local Player = LuaFunc_PartyData(TargetID())
	for i = 1 , Player[0] , 1 do
		if CheckBuff( Player[i], 502041 ) == true then
			SetFlag( OwnerID() , 541884, 1)
		end	
	end
	return true
end