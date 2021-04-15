function LuaI_204638_0()
	if CheckAcceptQuest( OwnerID() , 422334 ) == false or CountBodyItem( OwnerID() , 204652 ) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_0]" , 0 ) --目前不需要使用這個物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 101927 or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_1]" , 0 ) --目標不正確
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_1]" , 0 )
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_2]" , 0 ) --目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_2]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_3]" , 0 ) --目標正在戰鬥中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_3]" , 0 )
		return false
	end
	return true
end

function LuaI_204638_1()
	CallPlot( OwnerID() , "LuaI_204638_2" , TargetID() )
	BeginPlot( TargetID() , "LuaI_204638_3" , 0 )
end

function LuaI_204638_2(Target)
	local result = ""
	if BeginCastBar( OwnerID(), "[SC_204638_4]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END, 0 ) ~= 1 then --捕捉[101927]
		ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
		return
	end	
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( OwnerID() );
		if GetDistance( OwnerID() , Target ) > 50 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_5]" , 0 ) --可惜，牠逃走了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_5]" , 0 )
			result = "FAIL"
			EndCastBar( OwnerID() , CastBarStatus )
			break;
		end
		if ReadRoleValue( Target , EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_6]" , 0 ) --牠已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_6]" , 0 )
			result = "FAIL"
			EndCastBar( OwnerID() , CastBarStatus )
			break;
		end
		if CheckAcceptQuest( OwnerID() , 422334 ) == false or CountBodyItem( OwnerID() , 204652 ) >= 5 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_0]" , 0 ) --目前不需要使用這個物品
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_0]" , 0 )
			result = "FAIL"
			EndCastBar( OwnerID() , CastBarStatus )
			break;
		end
		if CountBodyItem( OwnerID() , 204638 ) == 0 then
			result = "FAIL"
			EndCastBar( OwnerID() , CastBarStatus )
			break;
		end
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- 成功
				result = "OK"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- 失敗
				result = "FAIL"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			end
		end
	end
	if result == "OK" then
		if GiveBodyItem( OwnerID() , 204652 , 1 ) then
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_204638_7]" , 0 ) --你成功捕捉到了[101927]
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_7]" , 0 )
			BeginPlot( Target , "LuaI_204638_4" ,0 )
		end
		if CountBodyItem( OwnerID() , 204652 ) >= 5 and CountBodyItem( OwnerID() , 204638 ) >= 1 then
			DelBodyItem( OwnerID() , 204638 , 1 )
		end
	end
end

function LuaI_204638_3()
	FaceObj( OwnerID() , TargetID() )
end

function LuaI_204638_4()
	LuaFunc_ResetObj( OwnerID() )
end
------------------------------------------------------------------------------------------------------------------
function LuaI_204637_0()
	if CheckAcceptQuest( OwnerID() , 422336 ) == false or CountbodyItem( OwnerID() , 204684 ) >= 10 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_0]" , 0 ) --目前不需要使用這個物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 101935 or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) --目標不正確
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 )
		return false
	end
	if CheckBuff( TargetID() , 503376 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_4]" , 0 ) --目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_4]" , 0 )
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_2]" , 0 ) --目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_2]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_3]" , 0 ) --目標正在戰鬥中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_3]" , 0 )
		return false
	end
	return true
end

function LuaI_204637_1()
	BeginPlot( TargetID() , "LuaI_204637_2" , 0 )
end

function LuaI_204637_2()
	Hide( OwnerID() )
	local Obj = Role:new( OwnerID() )
	local Room = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local Forg = CreateObj( 102008 , Obj:X() , Obj:Y() , Obj:Z() ,Obj:Dir() , 1 )
	WriteRoleValue( Forg , EM_RoleValue_LiveTime , 30 )
	SetModeEx( Forg , EM_SetModeType_Strikback , false )
	SetModeEx( Forg , EM_SetModeType_Move , false )
	SetModeEx( Forg , EM_SetModeType_Searchenemy , false )
	SetModeEx( Forg , EM_SetModeType_Fight , false )
	WriteRoleValue( Forg , EM_RoleValue_PID , OwnerID() )
	AddToPartition( Forg , Room )
	PlayMotionEX( Forg, ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	for i = 0 , 60 , 1 do
		if CheckID( Forg ) == false then
			break
		end
		sleep( 10 )
	end
	sleep( 10 )
	Show( OwnerID() , Room )
end

function LuaI_204639_0()
	if CheckAcceptQuest( OwnerID() , 422336) == false or CountbodyItem( OwnerID() , 204684 ) >= 10 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204639_0]" , 0 ) --目前不需要使用這個物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204639_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID == 101935 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204639_3]" , 0 ) --必須先麻醉目標
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204639_3]" , 0 )
		return false
	end
	if OrgID ~= 102008  or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204639_1]" , 0 ) --目標不正確
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204639_1]" , 0 )
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204639_2]" , 0 ) --目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204639_2]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_4]" , 0 ) --目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_4]" , 0 )
		return false
	end
	return true
end

function LuaI_204639_1()
	if ReadRoleValue(  TargetID() , EM_RoleValue_Register ) == 0 then
		Hide( TargetID() )
		BeginPlot( TargetID() , "LuaI_204639_2" , 0)
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 100 )
	end
end
function LuaI_204639_2()
	if GiveBodyItem( TargetID() , 204684 , 1 ) then
		local Forg = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		if ReadRoleValue( Forg , EM_RoleValue_OrgID ) == 101935 then
			AddBuff(  Forg  , 503376 , 1 , 30 )
		end
	end
	sleep( 1 )
	Delobj( OwnerID() )
end
------------------------------------------------------------------------------------------------------

function LuaI_204648_0()
	if CheckAcceptQuest( OwnerID() , 422337 ) == false or CountBodyItem( OwnerID() , 204649) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204648_0]" , 0 ) --目前不需要使用這個物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204648_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 101936 or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204648_1]" , 0 ) --目標不正確
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204648_1]" , 0 )
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204648_2]" , 0 ) --目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204648_2]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID) ~= OwnerID() and ReadRoleValue( TargetID() , EM_RoleValue_IsAttackMode) ~= 0  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204648_3]" , 0 ) --目標正在戰鬥中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204648_3]" , 0 )
		return false
	end
	return true
end

function LuaI_204648_1()
	BeginPlot( TargetID() , "LuaI_204648_2" , 0 )
	local Num = DW_Rand(500)
	GiveBodyItem( OwnerID() , 204649 , 1 )
	UseItemDestroy()
end

function LuaI_204648_2()
	Hide( OwnerID() )
	sleep( 30 )
	LuaFunc_ResetObj( OwnerID() )
end

function LuaI_204649_0()
	if CheckAcceptQuest( OwnerID() , 422337 ) == false or CheckFlag( OwnerID() , 542646) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204649_0]" , 0 ) --目前不需要使用這個物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204649_0]" , 0 )
		return false
	end
	local Me = Role:new( OwnerID() )
	if Me:X()>29200 or Me:X()< 27300 or Me:Z() > 8100 or Me:Z() < 6400 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204649_2]" , 0 ) --你還不夠深入賽賓恩地穴
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204649_2]" , 0 )
		return false
	end
	local Obj = 0
	local Amp = -1
	local Count = SetSearchRangeInfo( OwnerID() , 120 )
	for i = 1 , Count , 1 do
		Amp = GetSearchResult()
		Obj = Role:New( Amp )
		if Obj:OrgID() > 101939 and Obj:OrgID() < 101943 and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and ReadRoleValue( Amp , EM_RoleValue_IsDead) == 0 then
			if CheckLine( OwnerID() , Obj:X() , Obj:Y() , Obj:Z() ) == true then
				break
			end
		end
		Amp = -1
	end	
	if Amp == -1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204649_1]" , 0 ) --這附近並沒有任何活著的賽賓恩猿人  
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204649_1]" , 0 )
		return false
	end
	return true
end

function LuaI_204649_1()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Crab = Lua_CreateObjByDir( TargetID() , 101936 , 20 , 180 )
	SetRoleCamp( Crab , "SNPC" )
	WriteRoleValue( Crab , EM_RoleValue_LiveTime , 15 )
	WriteRoleValue( Crab , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Crab , Room )
	MoveToFlagEnabled( Crab , false )
	BeginPlot( Crab , "LuaI_204649_2" , 0 )
	UseItemDestroy()
end

function LuaI_204649_2()
	AddBuff( OwnerID() , 503371 , 10 , -1 )
	if CheckID(TargetID()) == true and CheckAcceptQuest( TargetID() , 422337 ) == true then
		SetFlag( TargetID() , 542646 , 1 )
	end
end

function LuaSpell_503370_Check()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID < 101940 or OrgID > 101942 or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		return false
	end
	return true
end