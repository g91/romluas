--==============企劃設定變數==============--

function Lua_Zone21_Boss2_GlobalSet()--企劃變數設定
	Zone21_Boss2_Global = {}
	local Global = Zone21_Boss2_Global
	Global["FlagID"] = 780984;--物件產生旗標
	
	Global["SkillID"] = {}--法術集合
	Global["SkillID"][1] = 498005--大地震撼
	Global["SkillID"][2] = 498006--破地
	Global["SkillID"][3] = 498012--衝擊
	Global["SkillID"][4] = 498007--巨石崩塌
	Global["SkillID"][5] = 498008--零碎落擊
	Global["SkillID"][6] = 498010--尊王戰嚎
	
	Lua_Zone21_Boss2_GlobalLevel()--難度設定
end

function Lua_Zone21_Boss2_GlobalLevel( )--難度設定
	local level = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	local Global = Zone21_Boss2_Global
	
	if level == 1 then  --============ 困難 ============--
		Global["BossID"] = 105517--王
		Global["MstID"] = 105516--小怪
		Global["StoneNum"] = 12--小落石數量
		Global["MstCreateNum"] = 3--小怪每次產生數量
		
		Global["Lv"] = {}--技能施放等級
		Global["Lv"][1] = 19--大地震撼--24000
		Global["Lv"][2] = 14--破地--18750
		Global["Lv"][3] = 10--衝擊--8550
		Global["Lv"][4] = 11--巨石崩塌--120%
		Global["Lv"][5] = 1--零碎落擊--20%
		Global["Lv"][6] = 14--尊王戰嚎--150%
		
	elseif level == 2 then  --============ 普通 ============--
		Global["BossID"] = 106052--王
		Global["MstID"] = 106053--小怪
		Global["StoneNum"] = 12--小落石數量
		Global["MstCreateNum"] = 2--小怪每次產生數量
		
		Global["Lv"] = {}--技能施放等級
		Global["Lv"][1] = 14--大地震撼--18000
		Global["Lv"][2] = 11--破地--15000
		Global["Lv"][3] = 10--衝擊--8550
		Global["Lv"][4] = 11--巨石崩塌--120%
		Global["Lv"][5] = 1--零碎落擊--20%
		Global["Lv"][6] = 14--尊王戰嚎--150%
		
	else--============ 簡單 ============--
		Global["BossID"] = 106054--王
		Global["MstID"] = 106055--小怪
		Global["StoneNum"] = 10--小落石數量
		Global["MstCreateNum"] = 2--小怪每次產生數量
		
		Global["Lv"] = {}--技能施放等級
		Global["Lv"][1] = 5--大地震撼--7200
		Global["Lv"][2] = 3--破地--5000
		Global["Lv"][3] = 6--衝擊--6650
		Global["Lv"][4] = 8--巨石崩塌--90%
		Global["Lv"][5] = 1--零碎落擊--20%
		Global["Lv"][6] = 8--尊王戰嚎--90%
	end
end

--==============以下AI處理 別改它==============--

function Lua_Zone21_Boss2_Fight()--開始戰鬥
	CallPlot( OwnerID(), "Lua_Zone21_Boss2_AI" )
end

function Lua_Zone21_Boss2_Ctrl()--中控
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	
	if Zone21_Boss2_Global == nil then
		Lua_Zone21_Boss2_GlobalSet();
	else
		Lua_Zone21_Boss2_GlobalSet();
	end
	
	if Zone21_Boss2_Global[RoomID] == nil then
		Zone21_Boss2_Global[RoomID] = {}
	else 
		Zone21_Boss2_Global[RoomID] = {}
	end
	
	local Global = Zone21_Boss2_Global[RoomID];
	local FlagID = Zone21_Boss2_Global["FlagID"];
	Global["Ctrl"] = OwnerID();
	local PID = ReadRoleValue( Global["Ctrl"], EM_RoleValue_PID )		
	Global["Phase"] = 1;
	
	if	Global["Boss"] == nil or 
		CheckID( Global["Boss"] ) ~= true or
		ReadRoleValue( Global["Boss"], EM_RoleValue_OrgID ) ~= Zone21_Boss2_Global["BossID"] then
		
		Global["Boss"] = kg_GetPosRX( {FlagID, 0}, Zone21_Boss2_Global["BossID"] );
		WriteRoleValue( Global["Boss"], EM_RoleValue_PID, PID )
		AddToPartition( Global["Boss"], RoomID );
	else
		ks_resetObj( Global["Boss"], 0 );
	end
	
	SetPlot( Global["Boss"], "dead", "Lua_Zone21_Boss2_Dead", 0 );--死亡判斷
	
	if Global["Door"] == nil then
		Global["Door"] = {};
	end

	local DoorID = 106012;
	if PID == 1 then
		DoorID = 105811
	end
	for i=1, 2 do
		if Global["Door"][i] == nil or CheckID(Global["Door"][i]) ~= true or 
		ReadRoleValue( Global["Door"][i], EM_RoleValue_OrgID ) ~= DoorID then	
			Global["Door"][i] = kg_GetPosRX( {FlagID, i}, DoorID );		--阻擋門
			SetModeEx( Global["Door"][i], EM_SetModeType_Fight, false );		--無法砍殺
			SetModeEx( Global["Door"][i], EM_SetModeType_Searchenemy, false );	-- 索敵
			SetModeEx( Global["Door"][i] , EM_SetModeType_Strikback , false );	-- 反擊
			SetModeEx( Global["Door"][i] , EM_SetModeType_Mark , false )		-- 標記
			SetModeEx( Global["Door"][i], EM_SetModeType_Obstruct , true )	-- 阻擋
			SetRoleCamp( Global["Door"][i], "Visitor" )
			AddToPartition( Global["Door"][i], RoomID );--預設後門開啟
		end
	end
	SetDefIdleMotion( Global["Door"][1], ruFUSION_MIME_ACTIVATE_LOOP )--保持開啟
	SetDefIdleMotion( Global["Door"][2], ruFUSION_MIME_IDLE_STAND )--保持關閉
end

function Lua_Zone21_Boss2_Crazy()
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	local FlagID = Zone21_Boss2_Global["FlagID"];
	local level = ReadRoleValue( Boss, EM_RoleValue_PID )
	local FlagX = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_X );
	local FlagZ = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Z );
	local time = 0
	local X;
	local Z;
	local Dis;
	local CrazyTime = { 480, 360 }
	
	while true do
		Sleep(10)
		X = ReadRoleValue( Boss , EM_RoleValue_X );
	 	Z = ReadRoleValue( Boss , EM_RoleValue_Z );
		Dis = math.floor( ( ( X - FlagX )^2 +( Z - FlagZ )^2 )^0.5);
		
		if KS_InCombat( Boss ) ~= true or Dis > 500 then
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_EXIT]", 2 );--脫離戰鬥
			ks_TransTo( FlagID, 0, nil, 0, 0 )--傳送到特定位置( Rnd = 隨機距離 min=最小距離 )
			Lua_Zone21_Boss2_Reset();--重置
			return
		end
		
		if level < 3 and time >= CrazyTime[level] and CheckBuff( Boss, 620276 ) ~= true then--8/6分鐘狂暴
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_CRAZY]", 2 )
			AddBuff( Boss, 620276, 0, -1 )
		end
		time = time+1
	end
end

function Lua_Zone21_Boss2_AI()--Boss 戰鬥AI
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	local SkillID = Zone21_Boss2_Global["SkillID"]
	local Lv = Zone21_Boss2_Global["Lv"];
	local time = 0;
	local ID = 0;
	local TID = 0;
	local SpellMagicID = 0;
	Global["Phase"] = 1;
	Global["SetLockHP"] = 9
	Global["PhaseTime"] = 0;
	
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_START]", 2 );--開始
	CallPlot( Global["Door"][1], "Lua_Zone21_CloseDoor", true, Boss )--關門
	AddBuff( Boss, 502707, 0, -1 );--非戰鬥不回血
	LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.9 , "Lua_Zone21_Boss2_ChangePhase" );--階段切換
	
	CallPlot( Boss, "Lua_Zone21_Boss2_PhaseDo", 0 )
	CallPlot( Boss, "Lua_Zone21_Boss2_Crazy", 0 )
	while true do
		sleep(10)
		
		time = time+1;--時間遞增
		--DebugMsg(0,0,"Battle Time = "..time.."; Phase = "..Global["Phase"].."; PhaseTime = "..Global["PhaseTime"] );
		SpellMagicID = ReadRoleValue( Boss, EM_RoleValue_SpellMagicID );
		if SpellMagicID == 0 then
			if time%7 == 0 then
				ID = rand(2)+1;
			elseif time%4 == 0 then
				ID = 3;
				local Hate = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
				
				while table.getn(Hate) > 0 do
					local Rnd = rand( table.getn(Hate) )+1;
					if CheckID( Hate[Rnd] ) ==true and ReadRoleValue( Hate[Rnd], EM_RoleValue_IsDead ) == 0 then--隨機目標
						TID = Hate[Rnd];
						table.remove( Hate, Rnd );
						break
					end
					table.remove( Hate, Rnd );
				end
			end
			if ID ~= 0 and GetModeEx( Boss, EM_SetModeType_Move ) then
				TID = TID or ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );
				StopMove( Boss, false );
				ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_SKILL_0"..ID.."]", 2 )--訊息
				CastSpellLv( Boss, TID, SkillID[ID], Lv[ID] );--施放技能
				ID = 0;
				TID = nil;
				Sleep(10)
			end
		end
	end
end

function Lua_Zone21_Boss2_ChangePhase()--階段切換
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	Global["SetLockHP"] = Global["SetLockHP"]-1
	
	if Global["SetLockHP"] == 1 then
		Global["Phase"] = 3;
		LockHP( Boss, 0, "" );
	else
		Global["Phase"] = 3 - Global["Phase"];
		LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.1*Global["SetLockHP"], "Lua_Zone21_Boss2_ChangePhase" );
	end
	if Global["SetLockHP"]%2 == 1 then
		Global["ChangePhase"] = true
	end
	
	Global["PhaseTime"] = 0;
	
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_PHASE"..Global["Phase"].."]", 2 );--切換階段	
end

function Lua_Zone21_Boss2_PhaseDo()--第二階段
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	local CreateNum = 0
	local PhaseLoop = false
	local MstArray = {}
	
	CallPlot( Global["Boss"], "Lua_Zone21_Boss2_SetLock", 14 )
	sleep(10)
	while true do
			sleep(10)
			if Global["Phase"] > 1 then
				--DebugMsg(0,0,"PhaseTime = "..Global["PhaseTime"] )
				if Global["ChangePhase"] or Global["PhaseTime"]%30 == 0 then--產小怪
					Global["MstNum"] = Global["MstNum"] or 0;
					if Global["MstNum"] < 15 then
						local ObjNum = 15-Global["MstNum"];
						if ObjNum > Zone21_Boss2_Global["MstCreateNum"] then 
							ObjNum = Zone21_Boss2_Global["MstCreateNum"];
						end
						if ObjNum > 0 then
							for Key,GUID in pairs(MstArray) do
								if CheckID(GUID) == true and ReadRoleValue(GUID, EM_RoleValue_IsDead ) == 0 then
									AddBuff( GUID, 620423, 0, -1 )--小怪強化
								else
									table.remove( MstArray, key )
								end
							end
							
							Global["MstNum"] = Global["MstNum"]+ObjNum;
							DebugMsg(0,0,"MstNum = "..Global["MstNum"] )
							local Mst = KS_CreateObjMode( Zone21_Boss2_Global["MstID"], Global["Boss"], nil,  100, ObjNum, false, 80 )
							if Type( Mst ) == "number" then
								LockHP( Mst, ReadRoleValue( Mst, EM_RoleValue_MaxHP )*0.1 , "Lua_Zone21_Boss2_MstSetLock" )
								SetPlot( Mst, "dead", "Lua_Zone21_Boss2_MstDead", 0 )
								AddToPartition( Mst, RoomID );
								AddBuff( Mst, 620418, 0, -1 );--岩石防護
								AddBuff( Mst, 502707, 0, -1 );--非戰鬥不回血
								BeginPlot( Mst, "Lua_Zone21_Boss2_MstCheck", 0 );--戰鬥檢查
								table.insert( MstArray, Mst )
							else
								for i=1, table.getn(Mst) do
									LockHP( Mst[i], ReadRoleValue( Mst[i], EM_RoleValue_MaxHP )*0.1 , "Lua_Zone21_Boss2_MstSetLock" )
									SetPlot( Mst[i], "dead", "Lua_Zone21_Boss2_MstDead", 0 )
									AddToPartition( Mst[i], RoomID );
									AddBuff( Mst[i], 620418, 0, -1 );--岩石防護
									AddBuff( Mst[i], 502707, 0, -1 );--非戰鬥不回血
									BeginPlot( Mst[i], "Lua_Zone21_Boss2_MstCheck", 0 );--戰鬥檢查
									table.insert( MstArray, Mst[i] )
								end
							end						
						end
					end
					Global["ChangePhase"] = false
				end
				
				if Global["PhaseTime"]%3 == 0 then--小落石
					CallPlot( Global["Ctrl"], "Lua_Zone21_Boss2_CreateStone", 2 )--產生落石
				end
			end
		
			if Global["Phase"] ~= 2 and Global["PhaseTime"]%25 == 0 then--大落石				
				while ReadRoleValue( Global["Boss"], EM_RoleValue_SpellMagicID ) ~= 0 do
					sleep(5)
				end				
				StopMove( Global["Boss"], false );				
				if PhaseLoop == true then
					CallPlot( Global["Boss"], "Lua_Zone21_Boss2_SetLock", 11 )
				else
					PhaseLoop = true
				end
				
				Lua_Zone21_Boss2_CreateStone( 1 )--產生落石			
				CallPlot( Global["Boss"], "Lua_Zone21_Boss2_BoomMsg", Global["Boss"] )--字串
				Sleep(15)
				CastSpellLv( Global["Boss"], Global["Boss"], 498010,  Zone21_Boss2_Global["Lv"][6] );--全場AE
			end
			Global["PhaseTime"] = Global["PhaseTime"]+1;
	end
end

function Lua_Zone21_Boss2_BoomMsg( Boss )
	Sleep(50)
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_BOOMS]", 2 );--全場AE	
end

function Lua_Zone21_Boss2_SetLock( time )
	time = time or 12
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	local lockTime = math.floor(time/3)-1
	SetModeEx( Global["Boss"], EM_SetModeType_Move, false )
	sleep( lockTime*10 )
	SetModeEx( Global["Boss"], EM_SetModeType_Fight, false )
	Sleep( 50 )
	SetModeEx( Global["Boss"], EM_SetModeType_Fight, true )
	Sleep( (time-5-lockTime)*10 )
	SetModeEx( Global["Boss"], EM_SetModeType_Move, true )	
end

function Lua_Zone21_Boss2_Reset()--重置
	DebugMsg(0,0,"Zone21_Boss2_Reset")
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	
	--DelFromPartition( Global["Door"][1] );--前門關閉
	CallPlot( Global["Door"][1], "Lua_Zone21_CloseDoor", false, Global["Boss"] )--關門
	magicinterrupt( Global["Boss"] );
	if Global["Stone"] ~= nil then
		for i=1, table.getn(Global["Stone"]) do
			if Global["Stone"][i] ~= nil then
				DelObj(ReadRoleValue( Global["Stone"][i], EM_RoleValue_PID ))
				DelObj(Global["Stone"][i])
			end
		end
	end

	local BuffTable = {};
	for i = 1 , BuffCount(Global["Boss"] ) do
		table.insert( BuffTable, BuffInfo( Global["Boss"] , i-1, EM_BuffInfoType_BuffID) );
	end

	for i=1, table.getn(BuffTable) do
		CancelBuff( Global["Boss"]  , BuffTable[i] )
		DebugMsg( 0,0,"BuffID = "..BuffTable[i] )
	end	
	
	SetStopAttack( Global["Boss"] );
	ClearHateList( Global["Boss"], -1 );
	WriteRoleValue( Global["Boss"], EM_RoleValue_HP, ReadRoleValue( Global["Boss"], EM_RoleValue_MaxHP ) );--滿血
	ks_resetObj( Global["Boss"], 5 );
end

function Lua_Zone21_Boss2_Dead()--死亡
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS2_DEAD]", 2 );
	for i=1, 2 do
		CallPlot( Zone21_Boss2_Global[RoomID]["Door"][i], "Lua_Zone21_CloseDoor", false, Boss )--關門
		--DelFromPartition( Zone21_Boss2_Global[RoomID]["Door"][i] );
	end

	Zone21_Boss2_Global[RoomID] = {};
	return true;
end

function Lua_Zone21_Boss2_CreateStone( mode )--產生落石
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];	
	local ShadowID = { 118837, 118887 };--大/小
	local StoneID = { 105518, 105519 };--大/小
	local min = 30;
	local Num
	
	if mode == 1 then
		--PlayMotion( Global["Boss"], ruFUSION_ACTORSTATE_CAST_BEGIN )
		ScriptMessage( Global["Boss"], -1 , 2 , "[SC_ZONE21_BOSS2_EARTH]", 2 );--震地
		--CastSpellLv( Global["Boss"], Global["Boss"], 498011, 0 );--震地
		Global["Stone"] = {};
		Num = 8
	else
		Num = Zone21_Boss2_Global["StoneNum"];
	end
	
	local Shadow = ks_RandBornByMultilateral( ShadowID[mode], Global["Ctrl"], nil, Num , 230, 0, 0, 0, -1, false, true )--指定位置亂數產生
	--ObjID = 物件ID; var1+var2 = 旗標位置; only var1=物件位置; Num = 產生數量; 
	--radius = 半徑範圍; height = 產生高度; min=最小距離; time=產生間格; LiveTime = 存在時間
	
	local Stone;
	for i=1, Num do
		if GetDistance( Shadow[i], Global["Boss"] ) > 50 or mode == 2 then
			Lua_Zone21_Boss2_ObjMode( Shadow[i] );--物件設定
			AddToPartition( Shadow[i], RoomID );
			local x = ReadRoleValue( Shadow[i], EM_RoleValue_X )
			local y = ReadRoleValue( Shadow[i], EM_RoleValue_Y )
			local z = ReadRoleValue( Shadow[i], EM_RoleValue_Z )
			
			Y = GetHeight( X, Y, Z )
			Stone = CreateObj( StoneID[mode], x, y+250, z, 0, 1 );
			Lua_Zone21_Boss2_ObjMode( Stone )--物件設定
			WriteRoleValue( Stone, EM_RoleValue_IsWalk, 0 );
			MoveToFlagEnabled( Stone, false )			
			AddToPartition( Stone, RoomID );
			CallPlot( Stone, "Lua_Zone21_Boss2_StoneDown", x,y,z, Shadow[i], mode )--石頭落下			
			if mode == 1 then
				Global["Stone"][i] = Stone;
			end
		else
			DelObj(Shadow[i])
		end
		Sleep(mode)
	end
	--PlayMotion( Global["Boss"], ruFUSION_ACTORSTATE_CAST_LOOP )
end

function Lua_Zone21_Boss2_StoneDown( x, y, z, Shadow, mode )--石頭落下
	local Stone = OwnerID();
	local Global = Zone21_Boss2_Global
	WriteRoleValue( Stone, EM_RoleValue_PID, Shadow )
	if mode == 1 then
		Sleep(10)
		Hide(Stone)
		SetModeEx( Stone, EM_SetModeType_Obstruct , true )		-- 阻擋
		Show( Stone, ReadRoleValue( Shadow, EM_RoleValue_RoomID ) )
		MoveDirect( Stone, x, y, z )
		Sleep(14)
		WriteRoleValue( Shadow, EM_RoleValue_LiveTime, 1 );
		SysCastSpellLv( Stone, Shadow, 498007, Global["Lv"][4] )--造成傷害
		WriteRoleValue( Stone, EM_RoleValue_LiveTime, 8 );
		Sleep(3)
		StopMove( Stone, true )
		SetPos( Stone, x, y, z, 0 )
		
	else
		Sleep(12)
		MoveDirect( Stone, x, y, z )
		sleep(7)
		WriteRoleValue( Shadow, EM_RoleValue_LiveTime, 1 );
		sleep(10)
		SysCastSpellLv( Stone, Shadow, 498008, Global["Lv"][5] )--造成傷害
		WriteRoleValue( Stone, EM_RoleValue_LiveTime, 1 );
		sleep(3)
		PlayMotion( Stone, ruFUSION_ACTORSTATE_DEAD )
	end
end

function Lua_Zone21_Boss2_StoneCheck()--石頭對象檢查
	local TID = TargetID();
	local OID = OwnerID();
	local Global = Zone21_Boss2_Global[ReadRoleValue( OID, EM_RoleValue_RoomID )];
	
	if	TID == OID or 
		TID == Global["Boss"] or
		(ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( TID, EM_RoleValue_VOC ) == 0 ) or
		CheckBuff( TID, 620418 ) == true or --岩石防護
		ReadRoleValue( TID, EM_RoleValue_CampID ) == 6 then
		return false;
	elseif CheckBuff( TID, 620422 ) == true and ReadRoleValue( OID, EM_RoleValue_OrgID ) == 105519 then
		Global["MstNum"] = Global["MstNum"]-1;
		DebugMsg(0,0,"MstNum = "..Global["MstNum"] )
		DelObj(TID);
	end
	return true;
end

function Lua_Zone21_Boss2_StoneObstruct()--石頭阻擋
	local OID = OwnerID();
	local TID = TargetID();
	local Num = 15;
	if ReadRoleValue( OID, EM_RoleValue_OrgID ) == 105518 then
		Num = 25;
	end
	
	if ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 and GetDistance( TID, OID ) < Num then
		local Ox = ReadRoleValue( OID, EM_RoleValue_X );			
		local Oz = ReadRoleValue( OID, EM_RoleValue_Z );
		local Tx = ReadRoleValue( TID, EM_RoleValue_X );
		local Y = ReadRoleValue( TID, EM_RoleValue_Y );
		local Tz = ReadRoleValue( TID, EM_RoleValue_Z );
		local Dir = CalDir( Tx-Ox, Tz-Oz )
		
		local radian = (math.pi/180)*Dir;--徑度
		Num = Num+10;
		Ox = Ox  +(Num*math.cos(radian))
		Oz = Oz - (Num*math.sin(radian))
		SetPos( TID, Ox, Y, Oz, Dir );
		PlayMotion( TID, ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN )
	end
end

function Lua_Zone21_Boss2_BoomsCheck( )--全場AE
	local OID = OwnerID();--Boss
	local TID = TargetID();--Player
	if ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( TID, EM_RoleValue_VOC ) ~= 0  then
		local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID );
		local Global = Zone21_Boss2_Global[RoomID];

		for i=1, table.getn(Global["Stone"]) do
			if Global["Stone"][i] ~= nil then
				local Ox = ReadRoleValue( OID, EM_RoleValue_X );
				local Oz = ReadRoleValue( OID, EM_RoleValue_Z );
				local Tx = ReadRoleValue( TID, EM_RoleValue_X );
				local Tz = ReadRoleValue( TID, EM_RoleValue_Z );
				local Sx = ReadRoleValue( Global["Stone"][i], EM_RoleValue_X );
				local Sz = ReadRoleValue( Global["Stone"][i], EM_RoleValue_Z );
				local m = math.floor( ((Tz-Oz)/(Tx-Ox))*100 ) /100
				local b = Oz-m*Ox;
				local d = math.abs(m*Sx-Sz+b ) / (m^2+1)^0.5;--計算 點到直線距離
							
				if d < 20 and GetDistance( Global["Stone"][i], OID ) < GetDistance( TID, OID ) then
					--Callplot( TID, "ks_TransTo", Global["Stone"][i] )--傳送到特定位置
					--Say( Global["Stone"][i], "d = "..d.."; Boss Dis = "..GetDistance( OID, Global["Stone"][i] ).."; Player Dis = "..GetDistance( TID, OID ) )				
					return false;
				end
			end
		end
		return true;
	end
	--Say( TID, "not OK")
	return false;
end

function Lua_Zone21_Boss2_MstDead()--小怪死亡
	local OID = OwnerID();
	local TID = TargetID();
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	Global["MstNum"] = Global["MstNum"]-1;
	DebugMsg(0,0,"MstNum = "..Global["MstNum"] )
	
	SetStopAttack( OID )
	SetModeEx( OID, EM_SetModeType_Fight , false )	-- 可砍殺攻擊
	SetModeEx( OID, EM_SetModeType_Move, false )	--不可移動
	CastSpell( OID, OID, 498009 ) --自爆
	WriteRoleValue( OID, EM_RoleValue_LiveTime, 1 );
	return false;
end

function Lua_Zone21_Boss2_ObjMode( Obj )--物件設定
	SetModeEx( Obj, EM_SetModeType_Gravity, false )
	SetModeEx( Obj, EM_SetModeType_Mark , false )		-- 標記
	SetModeEx( Obj, EM_SetModeType_Fight , false )		-- 可砍殺攻擊
	SetModeEx( Obj, EM_SetModeType_HideName , false )		-- 名稱
	SetModeEx( Obj, EM_SetModeType_NotShowHPMP , false )	-- 不顯示血條
end

function Lua_Zone21_Boss2_MstCheck()--小怪 戰鬥檢查
	local OID = OwnerID();
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID );
	local Global = Zone21_Boss2_Global[RoomID];
	local MaxHP = ReadRoleValue( OID, EM_RoleValue_MaxHP );
	
	while true do		
		if ReadRoleValue( Global["Boss"], EM_RoleValue_AttackTargetID ) == 0 and HateListCount( Global["Boss"] ) == 0 then
			if Global["MstNum"] ~= nil then
				Global["MstNum"] = Global["MstNum"]-1;
			end
			DelObj( OID );
			return;
		elseif ReadRoleValue( OID, EM_RoleValue_AttackTargetID ) == 0 then
			local Hate = KS_GetHateList( Global["Boss"], 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
			local Rnd = rand( table.getn(Hate) )+1;
			local TID = Hate[Rnd] or ReadRoleValue( Global["Boss"], EM_RoleValue_AttackTargetID );
			SetAttack( OID, TID );
		end
		Sleep(10)
	end
end

function Lua_Zone21_Boss2_MstSetLock()--小怪鎖血
	local OID = OwnerID()
	CancelBuff( OID, 620418 )--岩石防護
	AddBuff( OID, 620422, 0, -1 )--玩家傷害減免
end