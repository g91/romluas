--=======================================--
--搶劫表演

function LuaS_Z21_Robbery_Talk()--村民對話
	local Villager1 = OwnerID()
	local OrgID = ReadRoleValue( Villager1, EM_RoleValue_OrgID )	
	local Villager2 = kg_GetPosRX( Villager1, OrgID, 20, 0, -90 );
	WriteRoleValue( Villager1, EM_RoleValue_IsWalk, 1 )
	WriteRoleValue( Villager2, EM_RoleValue_IsWalk, 1 )
	AddToPartition( Villager2, 0 )
	
	WriteRoleValue( Villager2, EM_RoleValue_PID, Villager1 )
	WriteRoleValue( Villager1, EM_RoleValue_PID, Villager2 )
	
	CallPlot( Villager2, "LuaS_Z21_Robbery_Move", 0 )
	local times = ReadRoleValue( Villager1, EM_RoleValue_Register1 )
	while true do
		Sleep(20)
		if GetModeEX( Villager1, EM_SetModeType_Move ) == true then--走路中
		--對話
			if ReadRoleValue( Villager1, EM_RoleValue_Register1 ) > times then--戰鬥過
				times = ReadRoleValue( Villager1, EM_RoleValue_Register1 )
				
			else

			end
		end
	end
end

function LuaS_Z21_Robbery_End()--結束
	SetModeEX( OwnerID(), EM_SetModeType_Show, false )
end

function LuaS_Z21_Robbery_Move()--村民移動
	local Villager2 = OwnerID();
	local Villager1 = ReadRoleValue( Villager2, EM_RoleValue_PID )
	local OrgID = ReadRoleValue( Villager1, EM_RoleValue_OrgID )
	local BaseX = ReadRoleValue( Villager1, EM_RoleValue_X )
	local BaseY = ReadRoleValue( Villager1, EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( Villager1, EM_RoleValue_Z )
	local BaseDir = ReadRoleValue( Villager1, EM_RoleValue_Dir )
	
	local X = ReadRoleValue( Villager1, EM_RoleValue_X )
	local Y = ReadRoleValue( Villager1, EM_RoleValue_Y )
	local Z = ReadRoleValue( Villager1, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Villager1, EM_RoleValue_Dir )-180--徑度
	if Dir > 360 then Dir = Dir -360
	elseif Dir < 0 then Dir = Dir +360 end
	local radian = (math.pi/180)*Dir;
	local X = X  +30*math.cos(radian);
	local Z = Z - 30*math.sin(radian);

	local Horse = CreateObj( 105401, X, Y, Z, 0, 1 )
	WriteRoleValue( Horse, EM_RoleValue_IsWalk, 1 )
	SetModeEx( Horse, EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Horse, EM_SetModeType_Fight , false )		-- 可砍殺攻擊
	SetModeEx( Horse, EM_SetModeType_Strikback , false )		-- 反擊
	SetModeEx( Horse, EM_SetModeType_ShowRoleHead , true )	-- 頭像框
	etModeEx( Horse, EM_SetModeType_Mark , false )		-- 標記
	SetModeEx( Horse, EM_SetModeType_HideName , true )	-- 名稱
	SetModeEx( Horse, EM_SetModeType_Move , true )		-- 移動
	SetModeEx( Horse, EM_SetModeType_NotShowHPMP, true )	-- HP
	MoveToFlagEnabled( Horse, false )
	AddToPartition( Horse, 0 )

	local Car = LuaFunc_CreateObjByObj( 105329, Horse )
	WriteRoleValue( Car, EM_RoleValue_IsWalk, 1 )
	SetModeEx( Car, EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Car, EM_SetModeType_Strikback , false )		-- 反擊
	SetModeEx( Car, EM_SetModeType_ShowRoleHead , true )	-- 頭像框
	SetModeEx( Car, EM_SetModeType_Fight , true )		-- 可砍殺攻擊
	SetModeEx( Car, EM_SetModeType_Mark , false )		-- 標記
	SetModeEx( Car, EM_SetModeType_HideName , true )		-- 名稱
	SetModeEx( Car, EM_SetModeType_Move , true )		-- 移動
	SetModeEx( Car, EM_SetModeType_NotShowHPMP, true )	-- HP
	MoveToFlagEnabled( Car, false )
	AttachObj( Car , Horse , 0 ,"p_hit_point02","p_hit_point01" )
	
	local vDis = GetDistance(Villager1, Villager2 )+15
	local hDis = GetDistance(Villager1, Horse )+20
	
	while true do
		Sleep(10)
		if GetModeEX( Villager1, EM_SetModeType_Show ) == false then --刪除
			WriteRoleValue( Villager1, EM_RoleValue_Register1, 0 )
			SetPos( Villager1, BaseX, BaseY, BaseZ, BaseDir )
			SetModeEX( Villager1, EM_SetModeType_Show, true )
			DelFromPartition( Villager1)
			AddToPartition(Villager1,0)
			DelObj(Horse)
			DelObj(Car)
			DelObj(Villager2)
			return
		end
		
		if GetModeEX( Villager1, EM_SetModeType_Move ) == true then
			if GetDistance(Villager1, Villager2 ) > vDis then
				WriteRoleValue( Villager2, EM_RoleValue_IsWalk, 0 )
			else
				WriteRoleValue( Villager2, EM_RoleValue_IsWalk, 1 )
			end
			
			if GetDistance(Villager1, Horse ) > hDis then
				WriteRoleValue( Horse, EM_RoleValue_IsWalk, 0 )
			else
				WriteRoleValue( Horse, EM_RoleValue_IsWalk, 1 )
			end
			
			X = ReadRoleValue( Villager1, EM_RoleValue_X )
			Y = ReadRoleValue( Villager1, EM_RoleValue_Y )
			Z = ReadRoleValue( Villager1, EM_RoleValue_Z )
			Dir = ReadRoleValue( Villager1, EM_RoleValue_Dir )-90--徑度
			
			if Dir > 360 then Dir = Dir -360
			elseif Dir < 0 then Dir = Dir +360 end
						
			radian = (math.pi/180)*Dir;
			local Vx = X  +20*math.cos(radian);
			local Vz = Z - 20*math.sin(radian);			
			MoveDirect( Villager2, Vx, Y, Vz )
			
			Dir = Dir -90
			if Dir > 360 then Dir = Dir -360
			elseif Dir < 0 then Dir = Dir +360 end
			
			radian = (math.pi/180)*Dir;
			local Hx = X  +30*math.cos(radian);
			local Hz = Z - 30*math.sin(radian);
			MoveDirect( Horse, Hx, Y, Hz )

		else
			StopMove( Villager2, true )
			StopMove( Horse, true )
			if GetDistance( Horse, Car ) < 20 then
				X = ReadRoleValue( Horse, EM_RoleValue_X )
				Y = ReadRoleValue( Horse, EM_RoleValue_Y )
				Z = ReadRoleValue( Horse, EM_RoleValue_Z )
				Dir = ReadRoleValue( Horse, EM_RoleValue_Dir )--徑度
				
				local cDir = Dir - -180
				if cDir > 360 then cDir = cDir -360
				elseif cDir < 0 then cDir = cDir +360 end
			
				radian = (math.pi/180)*cDir;
				X = X  +25*math.cos(radian);
				Z = Z - 25*math.sin(radian);
				SetPos( Car, X, Y, Z, Dir )
			end
		end
	end
end

function LuaS_Z21_Robbery_Event()
	local OID = OwnerID()
	stopMove( OID, true )
	SetModeEx( OID, EM_SetModeType_Move, false )
	AdjustDir( ReadRoleValue( OID, EM_RoleValue_PID ), ReadRoleValue( OID, EM_RoleValue_Dir ) )
	
	local X = ReadRoleValue( OID, EM_RoleValue_X )
	local Y = ReadRoleValue( OID, EM_RoleValue_Y )
	local Z = ReadRoleValue( OID, EM_RoleValue_Z )
	local Dir = ReadRoleValue( OID, EM_RoleValue_Dir )--徑度
	local radian = (math.pi/180)*Dir;
	local Bx = X  +35*math.cos(radian);
	local Bz = Z - 35*math.sin(radian);
	local Gx = X  +100*math.cos(radian);
	local Gz = Z - 100*math.sin(radian);
	
	Dir = Dir -180;
	if Dir > 360 then Dir = Dir -360
	elseif Dir < 0 then Dir = Dir +360 end
	
	local bader = {}
	local Good = {}
	for i=1, 2 do
		bader[i] = kg_GetPosRX( {Bx,Y,Bz,Dir}, 105989, 10, 0, ((i-1)*180)-90 );
		MoveToFlagEnabled( bader[i], false )
		SetModeEx( bader[i], EM_SetModeType_Move, false )
		SetModeEx( bader[i], EM_SetModeType_Fight, false );	--無法砍殺
		SetModeEx( bader[i], EM_SetModeType_Searchenemy, false );	-- 索敵
		SetDefIdleMotion( bader[i], ruFUSION_MIME_IDLE_COMBAT_1H )
		AddToPartition( bader[i], 0 );
		AdjustfaceDir( bader[i], OID, 0 ) --使自己面向目標
	end
	Sleep(10)
	SetDefIdleMotion( OID, ruFUSION_MIME_EMOTE_SPEAK )
	Sleep(90)
	
	SetDefIdleMotion( OID, ruFUSION_MIME_IDLE_STAND )
	for i=1, 2 do
		Good[i] = kg_GetPosRX( {Gx,Y,Gz,Dir}, 105990, 20, 0, ((i-1)*180)-90 );
		MoveToFlagEnabled( Good[i], false )
		SetDefIdleMotion( Good[i], ruFUSION_MIME_IDLE_COMBAT_1H)
		AddToPartition( Good[i], 0 );
		AdjustfaceDir( Good[i], OID, 0 ) --使自己面向目標
		Hide(bader[i])
		SetModeEx( bader[i], EM_SetModeType_Fight, true );	--無法砍殺
		SetModeEx( bader[i], EM_SetModeType_Searchenemy, true );	-- 索敵
		Show(bader[i], 0 );
	end	
		
	while true do
		Sleep(10)
		local num = 0;
		for i=1, 2 do
			if CheckID(bader[i]) ~= true or 
			ReadRoleValue(bader[i], EM_RoleValue_IsDead ) == 1 then
				num = num+1
			end
		end
		if num == 2 then
			for i=1, 2 do
				WriteRoleValue( Good[i], EM_RoleValue_LiveTime, 1 )
			end
			break;
		else
			for i=1, 2 do
				SysCastSpellLv( bader[i], Good[1], 496946, 0 );--仇恨
				SysCastSpellLv( bader[i], Good[2], 496946, 0 );--仇恨
			end
		end
	end
	PlayMotion( OID, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep(15)
	Hide(OID)
	SetModeEx( OID, EM_SetModeType_Move, true )
	Show(OID, 0 )
	AddRoleValue( OID, EM_RoleValue_Register1, 1 )
end

--=======================================--
--勞勃爆炸導致刺客死亡事件

function LuaS_Z21_Assassin_lobo_Set()--掛在勞勃身上
	local lobo = OwnerID()
	SetDefIdleMotion( lobo, ruFUSION_MIME_CROUCH_LOOP )
	local X = ReadRoleValue( lobo, EM_RoleValue_X )
	local Y = ReadRoleValue( lobo, EM_RoleValue_Y )
	local Z = ReadRoleValue( lobo, EM_RoleValue_Z )
	local Dir = ReadRoleValue( lobo, EM_RoleValue_Dir )--徑度
	local radian = (math.pi/180)*Dir;
	X = X  +120*math.cos(radian);
	Z = Z - 120*math.sin(radian);
		
	local grass = CreateObj( 119106, X, Y, Z, 0, 1 )
	AddToPartition( grass, 0 )
	WriteRoleValue( lobo, EM_RoleValue_PID, grass )
	WriteRoleValue( grass, EM_RoleValue_PID, lobo )
	SetPlot( grass, "range", "LuaS_Z21_Assassin_Grass", 60 )
end

function LuaS_Z21_Assassin_AcceptQuest()--接任務後
	local lobo = OwnerID();
	local grass = ReadRoleValue( lobo, EM_RoleValue_PID )
	if CheckBuff( grass, 620400 ) == false then
		AddBuff( grass, 620400, 0, 15 )
	end
end

function LuaS_Z21_Assassin_QuestFailure( obj )--任務失敗提示
	local QuestID = 424469;
	local FlagID = 545487;
	obj = obj or OwnerID()
	local Player = SearchRangePlayer( obj, 500 )
	for i=0, table.getn(Player)-1 do
		if CheckAcceptQuest( Player[i], QuestID ) == true and
		CheckCompleteQuest( Player[i], QuestID )==false and
		Checkflag( Player[i], FlagID ) == false then
		
			ScriptMessage( Player[i], Player[i], 2,"[SC_424469_01]", 0 )--失敗
			ScriptMessage( Player[i], Player[i], 0,"[SC_424469_01]", 0 )
		end
	end
end

function LuaS_Z21_Assassin_Grass()
	local Player = OwnerID();
	local grass = TargetID();
	local QuestID = 424469;
	local FlagID = 545487;

	if	CheckBuff(grass, 620400 ) == true and
		CheckAcceptQuest( Player, QuestID ) == true and
		CheckCompleteQuest( Player, QuestID )==false and
		Checkflag( Player, FlagID ) == false then
		
		SetPlot( grass, "range", "", 0 )
		CancelBuff( grass, 620400 )
		DisableQuest( ReadRoleValue( grass, EM_RoleValue_PID ), true )
		CallPlot( grass, "LuaS_Z21_Assassin_Quest", 0 )
	end
end

function LuaS_Z21_Assassin_Quest()
	BeginPlot( OwnerID(), "LuaS_Z21_Assassin_QuestStart", 0 )
end
function LuaS_Z21_Assassin_QuestStart()
	local grass = OwnerID()
	local lobo = ReadRoleValue( grass, EM_RoleValue_PID )
	local QuestID = 424469;
	local FlagID = 545487;
	
	local Player = SearchRangePlayer( grass, 250 )
	for i=0, table.getn(Player)-1 do
		if CheckAcceptQuest( Player[i], QuestID ) == true and
		CheckCompleteQuest( Player[i], QuestID )==false and
		Checkflag( Player[i], FlagID ) == false then
		
			ScriptMessage( Player[i], Player[i], 2,"[SC_424469_02]", 0 )--出現
			ScriptMessage( Player[i], Player[i], 0,"[SC_424469_02]", 0 )
		end
	end
	Hide(grass)
	
	local Assassin = LuaFunc_CreateObjByObj( 105985, grass );
	MoveToFlagEnabled( Assassin, false )
	AdjustfaceDir( Assassin, ReadRoleValue( grass, EM_RoleValue_PID ), 0 )
	WriteRoleValue( Assassin, EM_RoleValue_PID, grass )
	SetPlot( Assassin, "dead", "LuaS_Z21_Assassin_dead", 0 )
	AddBuff( Assassin, 502707, 0, -1 );--非戰鬥不回血	
	
	local times = 0;
	while true do
		sleep(10)
		if CheckID(Assassin) == false or 
		ReadRoleValue(Assassin, EM_RoleValue_IsDead ) == 1 then
			return
		end
		
		if HateListCount( Assassin ) == 0 then
			times = times+1
		else
			times = 0;
		end
		
		if times == 8 or GetDistance( Assassin, lobo ) > 250 then
			LuaS_Z21_Assassin_QuestFailure( lobo )--任務失敗提示
			DebugMsg(0,0,"Phase2 Error")
			DelObj(Assassin);
			SetPlot( grass, "range", "LuaS_Z21_Assassin_Grass", 60 );
			Show( grass, 0 )
			DisableQuest( lobo, false )
			return
		end
	end
end

function LuaS_Z21_Assassin_dead()--刺客a死亡
	local Assassin = OwnerID()
	local QuestID = 424469;
	local FlagID = 545487;
	local num = 1;
	
	local Player = SearchRangePlayer( Assassin, 250 )
	for i=0, table.getn(Player)-1 do
		if 	CheckID( Player[i] ) == true and
		 	CheckAcceptQuest( Player[i], QuestID ) == true and
			CheckCompleteQuest( Player[i], QuestID )==false and
			Checkflag( Player[i], FlagID ) ==false then
			
			AddBuff( Player[i], 620672, 0, 21 )--ClientBuff
			num = num +1;
		end
	end
		
	if num > 0 then
		local grass = ReadRoleValue( Assassin, EM_RoleValue_PID )
		local lobo = ReadRoleValue( grass, EM_RoleValue_PID )
		local X = ReadRoleValue( lobo, EM_RoleValue_X );
		local Y = ReadRoleValue( lobo, EM_RoleValue_Y );
		local Z = ReadRoleValue( lobo, EM_RoleValue_Z );
		local Dir = ReadRoleValue( lobo, EM_RoleValue_Dir );--徑度
		local ActorLobo = CreateObj( 119121, X, Y, Z, Dir, 1 )
		SetModeEx( ActorLobo , EM_SetModeType_Fight , true )		-- 砍殺
		SetModeEx( ActorLobo , EM_SetModeType_Strikback , false )	-- 反擊
		SetModeEx( ActorLobo , EM_SetModeType_Searchenemy , false ) -- 索敵
		AddToPartition( ActorLobo, 0 )
		SetDefIdleMotion( ActorLobo, ruFUSION_MIME_CROUCH_LOOP )
			
		Dir = Dir -180;
		if Dir > 360 then Dir = Dir -360 
		elseif Dir < 0 then Dir = Dir +360 end
		
		local radian = (math.pi/180)*Dir;
		X = X  +15*math.cos(radian);
		Z = Z - 15*math.sin(radian);
			
		NPCSay( ActorLobo, "[SC_424469_03]" );--勞勃：哇！有壞人要打我！
		local Assassin = CreateObj( 119169, X, Y, Z, 0, 1 )
		SetModeEx( Assassin , EM_SetModeType_Searchenemy , false ) -- 索敵
		SetModeEx( Assassin , EM_SetModeType_Fight , false )	-- 砍殺
		AddToPartition( Assassin, 0 )
			
		AddBuff( Assassin, 502707, 0, -1 );--非戰鬥不回血
		SetAttack( Assassin, ActorLobo )
		--SysCastSpellLv( ActorLobo, Assassin, 495767, 0 )--仇恨MAX		
		SetPlot( ActorLobo, "range", "LuaS_Z21_Assassin_BuffCheck", 60 )
		CallPlot( ActorLobo, "LuaS_Z21_Assassin_QuestCheck", Assassin, grass )
	end
	return true
end

function LuaS_Z21_Assassin_BuffCheck()
	local Player = OwnerID();
	local ActorLobo = TargetID();
	if CheckBuff( Player, 620672 ) == true then
		SetPlot( ActorLobo, "range", "", 0 )
		AddBuff( ActorLobo, 620672, 0, 5 )--ClientBuff
	end
end

function LuaS_Z21_Assassin_QuestCheck( Assassin, grass )
	local ActorLobo = OwnerID()
	local times = 0;
	while true do
		Sleep(10)
		if CheckBuff( ActorLobo, 620672 ) == true then
			CancelBuff( ActorLobo, 620672 )
			NPCSay( ActorLobo, "[SC_424469_04]")----勞勃：不要打我……嗚嗚……不舒服……
			Sleep(25)
			NPCSay( ActorLobo, "[SC_424469_05]")--勞勃：嗚嗚……
			SLEEP(15)
			SysCastSpellLv( ActorLobo, ActorLobo, 498194, 0 )--勞勃的身下出現爆炸特效
			DelObj(Assassin)--刺客b消失
			Sleep(10)
			local Player = SearchRangePlayer( ActorLobo, 250 )
			for i=0, table.getn(Player)-1 do
				if CheckBuff( Player[i], 620672 ) == true then
					ScriptMessage( Player[i], Player[i], 2,"[SC_424469_06]", 0 )
					ScriptMessage( Player[i], Player[i], 0,"[SC_424469_06]", 0 )					
					CancelBuff( Player[i], 620672 )
					SetFlag( Player[i], 545487, 1 )
				end
			end
			break;
		end
		
		times = times+1
		if times == 14 then
			LuaS_Z21_Assassin_QuestFailure( ActorLobo )--任務失敗提示
			DebugMsg(0,0,"Phase3 Error")
			break;
		end
	end
	if CheckID(Assassin) == true then
		DelObj(Assassin);
	end
	DelObj(ActorLobo);
	SetPlot( grass, "range", "LuaS_Z21_Assassin_Grass", 60 );
	Show( grass, 0 )
	DisableQuest( ReadRoleValue( grass, EM_RoleValue_PID ), false )
end