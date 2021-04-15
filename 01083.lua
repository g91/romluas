function Lua_ZONE252_ENTERDOOR()
	SetPlot( OwnerID() , "collision" , "Lua_ZONE252_ENTERDOOR_2" , 100 )
end

function Lua_ZONE252_ENTERDOOR_2()
	if CheckFlag( OwnerID() , 542230 ) == true then
		if ChangeZone( OwnerID() , 252 , -1 , 1923  , 48 , 1081 , 350 ) then
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- 取得玩家等級
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- 取得玩家副職等級
			DesignLog(OwnerID() , 252 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- 紀錄進入人次	-- 獨眼巢城
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ZONE252_DOOR_0]" , 1 )
	end
end

function Lua_ZONE252_EXITDOOR()
	SetPlot( OwnerID() , "collision" , "Lua_ZONE252_EXITDOOR_2" , 65 )
end

function Lua_ZONE252_EXITDOOR_2()
	ChangeZone( OwnerID() , 11 , 0 ,-38122 , 1062 , -9369 , 60 ) 
end

function LuaS_202430_0() --莉妲的項鍊

	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[Sys421272_szquest_accept_detail]");

	ShowBorder( OwnerID(), 421272, "[202430]", "ScriptBorder_Texture_Paper" );	

end

function LuaS_111216_0() --哥里茲
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest(OwnerID() , 421209 ) == true then
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_111216_0]", "LuaS_111216_1",0 );		
	end	
end

function LuaS_111216_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_111216_2" , 0 )
end

function LuaS_111216_2()
	CastSpell(OwnerID() , TargetID() ,  491922 )
	sleep( 5 )
	ChangeZone( TargetID() ,  11 , 0 ,-38122 , 1062 , -9369 , 60 ) 
end

function LuaI_112093_Check()
	local Point = 0
	Point = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112093 , 100 , 0)
	if  ReadRoleValue(OwnerID() , EM_RoleValue_IsAttackMode) > 0 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112093_0]", 0 );
		return false
	elseif CheckID( Point ) == false then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112093_1]", 0 );
		return false
	else
		return true
	end
end

function LuaI_112093_USE()
	AddBuff( OwnerID() ,502662 , 1 , 10 )
	BeginPlot( OwnerID() , "LuaI_112093_CastingBar" , 0 )
end

function LuaI_112093_CastingBar()
	local result = false;
	if( ReadRoleValue( OwnerID() ,EM_RoleValue_IsDead) == 1 ) then
		return;
	end

	if BeginCastBar( OwnerID() , "[SC_112093_2]", 100 , ruFUSION_ACTORSTATE_CHANNEL_BEGIN,ruFUSION_ACTORSTATE_CHANNEL_END, 0 ) ~= 1 then
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SAY_NPC_BUSY]", 0 )
		return
	end

	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( OwnerID() );
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- 成功
				result = true
				EndCastBar( OwnerID() , CastBarStatus )				
				CancelBuff( OwnerID() , 502662 )
				break;
			elseif ( CastBarStatus < 0 ) or ReadRoleValue(OwnerID() , EM_RoleValue_IsAttackMode) > 0 or CountBodyItem( OwnerID() , 203589) < 1 then -- 失敗
				result = false
				EndCastBar(OwnerID() , CastBarStatus )
				CancelBuff( OwnerID() , 502662 )
				return;
			end
		end
	end

	if ( result == true ) then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112093_3]", 1 );
		SetFlag( OwnerID() , 542230 , 1 )
		DelBodyItem( OwnerID() , 203589 , 1 )
	end

end

function Lua_Call_101530(Room)
	local CheckMark = false
	for i = 0 , HateListCount( OwnerID() )-1 , 1 do --檢查仇恨表內是否有人有接任務
		local CheckPPL = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if CheckID( CheckPPL ) == true and CheckAcceptQuest( CheckPPL , 421659 ) == true then
			CheckMark = true
		end
	end
	if CheckMark == true then --檢查有任務的話，就產生歌莉雅幫打
		ScriptMessage( OwnerID(), -1, 1 , "[SC_421659_5]", 0 )
		sleep(50)
		local Gerria = CreateObjByFlag( 101530 , 780212 , 5 , 1 )
		AddToPartition( Gerria , Room )
		MoveToFlagEnabled( Gerria , false )
		SetModeEx( Gerria , EM_SetModeType_IgnoreNpcKill , true )
		BeginPlot( Gerria , "LuaI_101530" , 0 )
		return Gerria
	end
	return 0
end

function LuaI_101530()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = TargetID()
	SetAttack( OwnerID() , TargetID() )
	SetPlot( OwnerID() ,"dead" , "LuaI_101530_dead" , 0 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID ,TargetID())
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	local Count
	Yell( OwnerID() , "[SC_101530_0]" , 5 ) --別怕他！我們一起上！
	while 1 do
		Count = SetSearchAllPlayer(RoomID)
		if Count == 0 then
			DelObj( OwnerID() )
			return
		end
		if HateListCount( OwnerID() ) > 0 and ReadRoleValue( OwnerID() ,EM_RoleValue_Register ) == 0 then
			AddBuff( OwnerID() , 502658 , 1 , 600 )
			if count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsPlayer() == True and CheckBuff(ID,502658)==false then
						AddBuff( ID , 502658 , 1 , 600 )
					end
				end	
			end
			if ReadRoleValue( Boss , EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( Boss ,EM_RoleValue_IsNPC ) == 1 and ReadRoleValue(Boss,EM_RoleValue_HP) < 50000 then
				Say( OwnerID() , "[SC_101530_1]" ) --可惡......
				Addbuff( OwnerID() , 501081 , 1 , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
				SetStopAttack( OwnerID() )
				SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
				PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_LOOP )
			end
		end
		if CheckID(Boss) == false or ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( Boss ,EM_RoleValue_IsNPC ) ~= 1 then
			break
		end
		if CheckID(Boss) == true and ReadRoleValue( Boss , EM_RoleValue_IsDead ) ~= 1 and CheckID(ReadRoleValue( Boss ,EM_RoleValue_AttackTargetID ) )== false then
			ScriptMessage( OwnerID(), -1, 2 , "[SC_101530_2]", 0 )
			Delobj( OwnerID() )
			return
		end
		sleep(30)	
	end
	local Type = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register , 2+Type ) 
	BeginPlot( OwnerID() , "LuaI_101530_Quest" , 0 )
end

function LuaI_101530_dead()
	ScriptMessage( OwnerID(), -1, 2 , "[SC_101530_2]", 0 )
	SetStopAttack(OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )
	return false
end

function LuaI_101530_Quest()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 2 then
--		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_END )
--	end
	sleep( 15 )
	Hide( OwnerID() )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local QuestNPC = CreateObjByOBj( 112094 , OwnerID() )
	DelFromPartition( QuestNPC)
	AddToPartition( QuestNPC , RoomID )
end

function LuaI_421659_Alert()
	SetPlot( OwnerID() , "range" , "LuaI_421659_Alert_2" , 150 )
end
function LuaI_421659_Alert_2()
	if CheckAcceptQuest( OwnerID() , 421659 ) == true then
		SetPlot( TargetID() , "range" , "" , 0 )
		BeginPlot(TargetID() , "LuaI_421659_Alert_3",0)
	end
end
function LuaI_421659_Alert_3()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		if Ver_Zone252_Cyclops[Room]["BossDead"] > 3 then
			break
		end 
		ScriptMessage( OwnerID(), -1, 1 , "[SC_421659_0]", 0 )
		sleep(200)
		ScriptMessage( OwnerID(), -1, 1 , "[SC_421659_1]", 0 )
		ScriptMessage( OwnerID(), -1, 1 , "[SC_421659_0]", 0 )
		sleep(200)
		ScriptMessage( OwnerID(), -1, 1 , "[SC_421659_2]", 0 )
		ScriptMessage( OwnerID(), -1, 1 , "[SC_421659_0]", 0 )
		sleep(200)
		ScriptMessage( OwnerID(), -1, 1 , "[SC_421659_3]", 0 )
		ScriptMessage( OwnerID(), -1, 1 , "[SC_421659_0]", 0 )
		sleep(200)
		ScriptMessage( OwnerID(), -1, 1 , "[SC_421659_4]", 0 )
	end
end