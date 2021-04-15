--==============企劃設定變數==============--

function Lua_Zone21_Boss1_GlobalSet()--企劃變數設定
	Zone21_Boss1_Global = {}
	local Global = Zone21_Boss1_Global
	Global["FlagID"] = 780983;--物件產生旗標
	
	Global["SkillID"] = {}--法術集合
	Global["SkillID"][1] = 497862--疾風箭
	Global["SkillID"][2] = 497863--穿透射擊
	Global["SkillID"][3] = 497864--爆裂射擊
	Global["SkillID"][4] = 497865--千羽箭
	Global["SkillID"][5] = 497866--碎星殞
	Global["SkillID"][6] = 498004--普攻射擊	
	
	Lua_Zone21_Boss1_GlobalLevel()--難度設定
end

function Lua_Zone21_Boss1_GlobalLevel( )--難度設定
	local level = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	local Global = Zone21_Boss1_Global
	
	if level == 1 then  --============ 困難 ============--
		Global["BossID"] = 105807
		Global["FakeBoss"] = 118789--假人
		
		Global["Lv"] = {}--技能施放等級
		Global["Lv"][1] = 130--疾風箭
		Global["Lv"][2] = 25--穿透射擊
		Global["Lv"][3] = 25--爆裂射擊
		Global["Lv"][4] = 3--千羽箭
		Global["Lv"][5] = 3--碎星殞
		Global["Lv"][6] = 40--普攻射擊
		Global["Lv"][7] = 30--雙手燒傷

		--第一個值為現身時 第二個值為隱藏時
		Global["SkillTarget"] = {}--技能的目標數量
		Global["SkillTarget"][1] = {	1,	3	};--疾風箭
		Global["SkillTarget"][2] = {	1,	3	};--穿透射擊
		Global["SkillTarget"][3] = {	6,	0	};--爆裂射擊
		Global["SkillTarget"][4] = {	2,	0	};--千羽箭
		Global["SkillTarget"][5] = {	0,	4	};--碎星殞
		Global["SkillTarget"][6] = {	1,	0	};--普攻射擊
			
	elseif level == 2 then  --============ 普通 ============--
		Global["BossID"] = 106043--普通版
		Global["FakeBoss"] = 119011--假人
		Global["Lv"]= {}--技能施放等級(普通)
		Global["Lv"][1] = 100--疾風箭
		Global["Lv"][2] = 25--穿透射擊
		Global["Lv"][3] = 25--爆裂射擊
		Global["Lv"][4] = 6--千羽箭
		Global["Lv"][5] = 6--碎星殞
		Global["Lv"][6] = 60--普攻射擊
		Global["Lv"][7] = 20--雙手燒傷

		--第一個值為現身時 第二個值為隱藏時
		Global["SkillTarget"] = {}--技能的目標數量(普通)
		Global["SkillTarget"][1] = {	1,	2	};--疾風箭
		Global["SkillTarget"][2] = {	1,	2	};--穿透射擊
		Global["SkillTarget"][3] = {	3,	0	};--爆裂射擊
		Global["SkillTarget"][4] = {	1,	0	};--千羽箭
		Global["SkillTarget"][5] = {	0,	1	};--碎星殞
		Global["SkillTarget"][6] = {	1,	0	};--普攻射擊
		
	else--============ 簡單 ============--
		Global["BossID"] = 106044
		Global["FakeBoss"] = 119012--假人	
		Global["Lv"] = {}--技能施放等級
		Global["Lv"][1] = 25--疾風箭
		Global["Lv"][2] = 10--穿透射擊
		Global["Lv"][3] = 20--爆裂射擊
		Global["Lv"][4] = 4--千羽箭
		Global["Lv"][5] = 4--碎星殞
		Global["Lv"][6] = 10--普攻射擊
		Global["Lv"][7] = 10--雙手燒傷
		
		--第一個值為現身時 第二個值為隱藏時
		Global["SkillTarget"] = {}--技能的目標數量(
		Global["SkillTarget"][1] = {	1,	2	};--疾風箭
		Global["SkillTarget"][2] = {	1,	1	};--穿透射擊
		Global["SkillTarget"][3] = {	3,	0	};--爆裂射擊
		Global["SkillTarget"][4] = {	1,	0	};--千羽箭
		Global["SkillTarget"][5] = {	0,	1	};--碎星殞
		Global["SkillTarget"][6] = {	1,	0	};--普攻射擊
	end
end

function Lua_Zone21_Boss1_SetLightColor()--設定變黑顏色光源
	local LightColor = 0x00000000;--設定顏色(請直接改色碼)
	return LightColor;
end

function Lua_Zone21_Boss1_ErrorTime( Time )--設定點火失敗時間
	Zone21_Boss1_Global["FireTime"] = Time;
end

--==============以下AI處理 別改它==============--

function Lua_Zone21_Boss1_Fight()--開始戰鬥
	CallPlot( OwnerID(), "Lua_Zone21_Boss1_AI" )
end

function Lua_Zone21_Boss1_Ctrl()--中控
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	
	if Zone21_Boss1_Global == nil then
		Lua_Zone21_Boss1_GlobalSet();
	end
	
	if Zone21_Boss1_Global[RoomID] == nil then
		Zone21_Boss1_Global[RoomID] = {}
	end
	
	local Global = Zone21_Boss1_Global[RoomID]
	local FlagID = Zone21_Boss1_Global["FlagID"];
	Global["Ctrl"] = OwnerID();
	
	if	Global["Boss"] == nil or 
		CheckID( Global["Boss"] ) ~= true or
		ReadRoleValue( Global["Boss"], EM_RoleValue_OrgID ) ~= Zone21_Boss1_Global["BossID"] then
		
		Global["Boss"] = kg_GetPosRX( { FlagID, 0}, Zone21_Boss1_Global["BossID"] );
		WriteRoleValue( Global["Boss"], EM_RoleValue_PID, ReadRoleValue( Global["Ctrl"], EM_RoleValue_PID ) )
		AddToPartition( Global["Boss"], RoomID );
	else
		ks_resetObj( Global["Boss"], 0 );
	end		
	
	Lua_Zone21_Boss1_CreateObj();--產生燭台
	SetDefIdleMotion( Global["Door"][1], ruFUSION_MIME_ACTIVATE_LOOP )--保持開啟
	SetDefIdleMotion( Global["Door"][2], ruFUSION_MIME_IDLE_STAND )--保持關閉
	
	SetPlot( Global["Boss"], "dead", "Lua_Zone21_Boss1_Dead", 0 );--死亡判斷
end

function Lua_Zone21_Boss1_AI()--Boss 戰鬥AI
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local FlagID = Zone21_Boss1_Global["FlagID"];
	local Global = Zone21_Boss1_Global[RoomID];
	local FlagX = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_X );
	local FlagZ = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Z );
	local time = 0;
	local TransTime = 0;
	local SpellMagicID = 0;
	local ATID = 0;	
	Global["Show"] = 1;--Boss狀態
	Global["Interval"] = 0;--進入黑暗周期
	Global["DarkTime"] = 0;--黑暗期
	Global["AddNum"] = 0;--黑暗週期追加的目標人數
	Global["Phase"] = 1
	local X;
	local Z;
	local Dis;
	
	SetDefIdleMotion( Boss, ruFUSION_MIME_ATTACK_BOW_LOOP )
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS1_START]", 2 );--開始
	CallPlot( Global["Door"][1], "Lua_Zone21_CloseDoor", true, Boss )--關門
	AddBuff( Boss, 502707, 0, -1 );--非戰鬥不回血
	LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.8 , "Lua_Zone21_Boss1_InDark" );--隱身條件
	CallPlot( Global["Ctrl"], "Lua_Zone21_Boss1_TimeCheck", Boss )--黑暗計時器
	
	while true do
		sleep(10)
		
		X = ReadRoleValue( Boss , EM_RoleValue_X );
	 	Z = ReadRoleValue( Boss , EM_RoleValue_Z );
		Dis = math.floor( ( ( X - FlagX )^2 +( Z - FlagZ )^2 )^0.5);
		
		if KS_InCombat( Boss ) ~= true or Dis > 500 then
			SetDefIdleMotion( Boss, ruFUSION_MIME_IDLE_STAND )
			ScriptMessage( Global["Door"][1], -1 , 2 , "[SC_ZONE21_BOSS1_EXIT]", 2 );--脫離戰鬥
			ks_TransTo( FlagID, 0, nil, 0, 0 )--傳送到特定位置( Rnd = 隨機距離 min=最小距離 )
			Lua_Zone21_Boss1_Reset();--重置
			return
		end
		
		
		ATID = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );		
		if ATID ~= 0 and CheckID( ATID ) == true and GetDistance( Boss, ATID ) <= 60 then
			if TransTime >= 6 then
				TransTime = 0;
				ks_TransTo( FlagID, rand(9)+12, nil, 30, 0 )--傳送到特定位置( Rnd = 隨機距離 min=最小距離 )
			else
				TransTime = TransTime+1;
			end
		else
			TransTime = 0;
		end	
		
		if ReadRoleValue( Boss, EM_RoleValue_SpellMagicID ) == 0 then
			time = time+1;--時間遞增
			--DebugMsg(0,0,"Battle Time = "..time.."; Hide Time = "..Global["Interval"]);
			if Global["Show"] == 1 then--白天
				if time%13 == 0 then
					local sTime = Lua_Zone21_Boss1_SpecialSkill()--千羽箭
					sleep(sTime*10)
				elseif time%9 == 0 then
					Lua_Zone21_Boss1_SpellSkill( 3 )--爆裂射擊
				elseif time%7 == 0 then
					Lua_Zone21_Boss1_SpellSkill( rand(2)+1 )--疾風箭/穿透射擊
				else
					Lua_Zone21_Boss1_SpellSkill( 6 )--普攻射擊
				end
			elseif time%7 == 0 then--黑暗
				if rand(2) == 0 then
					local sTime = Lua_Zone21_Boss1_SpellSkill( 2 )--穿透射擊
					time = time + sTime
				else
					Lua_Zone21_Boss1_SpellSkill( 5 )--碎星殞
				end
			end

		end
	end
end

function Lua_Zone21_CloseDoor( close, Boss )--開門
	local door = OwnerID()
	if close == true then
		for i=1, 2 do
			Sleep(10)
			if Boss ~= nil and CheckID(Boss) == true and 
			KS_InCombat( Boss ) == not close then
				return
			end
		end
	else
		Sleep(20)
	end
	
	if close == true then		
		PlayMotion( door, ruFUSION_ACTORSTATE_ACTIVATE_END )		
		SetDefIdleMotion( door, ruFUSION_MIME_IDLE_STAND )
		--SetDefIdleMotion( door, ruFUSION_MIME_ACTIVATE_END )
	else
		PlayMotion( door, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
		SetDefIdleMotion( door, ruFUSION_MIME_ACTIVATE_LOOP )
	end
end

function Lua_Zone21_Boss1_ClearItem( RoomID )--清除玩家物品
	local Player = SetSearchAllPlayer( RoomID );
	local ID;
	for i=1, Player do
		ID = GetSearchResult();
		DelBodyItem( ID, 240095, CountBodyItem( ID, 240095 ) )--刪除火把
		DelBodyItem( ID, 240284, CountBodyItem( ID, 240284 ) )--刪除打火石
		DelBodyItem( ID, 240285, CountBodyItem( ID, 240285 ) )--刪除點燃的火把
		CancelBuff( ID, 620268 )--緩速
	end
end

function Lua_Zone21_Boss1_Reset()--重置
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	
	Lua_Zone21_Boss1_ClearItem( RoomID )--清除玩家物品

	local BuffTable = {};
	for i = 1 , BuffCount(Global["Boss"] ) do
		table.insert( BuffTable, BuffInfo( Global["Boss"] , i-1, EM_BuffInfoType_BuffID) );
	end

	for i=1, table.getn(BuffTable) do
		CancelBuff( Global["Boss"]  , BuffTable[i] )
	end
	
	SetStopAttack( Global["Boss"] );
	ClearHateList( Global["Boss"], -1 );
	CallPlot( Global["Door"][1], "Lua_Zone21_CloseDoor", false, Global["Boss"] )--關門
	
	Lua_Zone21_Boss1_CreateObj();--產生物件	
	WriteRoleValue( Global["Boss"], EM_RoleValue_HP, ReadRoleValue( Global["Boss"], EM_RoleValue_MaxHP ) );--滿血
	if Global["Show"] == 0 then
		Lua_Zone21_Boss1_ExitDark( false, RoomID )--離開黑暗
	end	
	ks_resetObj( Global["Boss"], 5 );
end

function Lua_Zone21_Boss1_InDark()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	local LightColor = Lua_Zone21_Boss1_SetLightColor() or 0x00000000;
	if KS_InCombat( Global["Boss"] ) ~= true then
		LockHP( Global["Boss"], 0, "" )
		KillID( Global["Boss"], Global["Boss"] )
		return
	end

	Global["Show"] = 0;
	Global["Interval"] = 0;
	Global["AddNum"] = 0;
	Global["DarkTime"] = 0;
	Global["Phase"] = Global["Phase"]+1
	ScriptMessage( Global["Boss"], -1 , 2 , "[SC_ZONE21_BOSS1_HIDE]", 2 );

	ResetRoomValue( RoomID );--重設場景光源
	SetRoomValue( RoomID , 2 , LightColor );--設定場景光源色碼
	
	magicinterrupt( Global["Boss"] );
	DebugMsg(0,0,"SetHide");
	SetModeEx( Global["Boss"] , EM_SetModeType_Mark, false )--無標記
	SetModeEx( Global["Boss"] , EM_SetModeType_Show, false );--看不到
	SetModeEx( Global["Boss"] , EM_SetModeType_Move, false );--看不到
	SetModeEx( Global["Boss"] , EM_SetModeType_Fight, false );--無法砍殺

	Sleep(10)
	StopMove( Global["Boss"], false );
	local FlagID = Zone21_Boss1_Global["FlagID"];
	local X = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_X );
	local Y = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Y );
	local Z = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Z );
	AddBuff( Global["Boss"], 507899, 0, -1 );--無法普攻
	CallPlot( Global["Boss"], "ks_TransTo", X, Y, Z, 0, 0 )--傳送到特定位置( Rnd = 隨機距離 min=最小距離 )
	
	for i=1, table.getn(Global["Candlestick"]) do
		if CheckBuff( Global["Candlestick"][i], 620325 ) == true then
			SysCastSpellLv( Global["Boss"], Global["Candlestick"][i], 497868,0 )--清除燭台火
			sleep(5);
		end
	end
	Global["FireCheck"] = false;
	LockHP( Global["Boss"], ReadRoleValue( Global["Boss"], EM_RoleValue_MaxHP )*0.2*(5-Global["Phase"]), "Lua_Zone21_Boss1_InDark" );--隱身條件
end

function Lua_Zone21_Boss1_TimeCheck( Boss )--計時器
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	local level = ReadRoleValue( Boss, EM_RoleValue_PID )
	local Time = 0;
	local CheckTime = 30
	local CrazyTime = { 480, 360 }
	
	while true do
		sleep(10)
		if KS_InCombat(Boss) == true then
			Time = Time+1;
			if level < 3 and time >= CrazyTime[level] and CheckBuff( Boss, 620276 ) ~= true then--8分鐘狂暴
				ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS1_CRAZY]", 2 )
				AddBuff( Boss, 620276, 0, -1 )
			end
			
			if Global["Show"] == 1 then
				if Global["Interval"] > 60 then--隱身間隔
					CheckTime = 30
					magicinterrupt(Boss);
					Lua_Zone21_Boss1_InDark();
				else
					Global["Interval"] = Global["Interval"] +1;
				end
			elseif Global["AddNum"] < 12 then
				Global["DarkTime"] = Global["DarkTime"]+1;
				if Global["DarkTime"] >= CheckTime then
					CheckTime = CheckTime+10
					Global["AddNum"] = Global["AddNum"] + 2
				end
			end
		else
			return;
		end
		--DebugMsg(0,0,"Interval = "..Global["Interval"] )
	end
end


function Lua_Zone21_Boss1_ExitDark( ShowMsg, RoomID )--離開黑暗
	RoomID = RoomID or ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	Global["Show"] = 1;
	if ShowMsg == true then
		ScriptMessage( Global["Boss"], -1 , 2 , "[SC_ZONE21_BOSS1_SHOW]", 2 );
	end
	
	DebugMsg(0,0,"SetShow");
	SetModeEx( Global["Boss"] , EM_SetModeType_Mark, true )--有標記
	SetModeEx( Global["Boss"] , EM_SetModeType_Show, true );--可見
	SetModeEx( Global["Boss"] , EM_SetModeType_Fight, true );--可砍殺	
	SetModeEx( Global["Boss"] , EM_SetModeType_Move, true );--看不到
	CancelBuff( Global["Boss"], 507899 );--無法普攻
	
	local FlagID = Zone21_Boss1_Global["FlagID"];
	local X = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_X );
	local Y = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Y );
	local Z = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Z );	
	CallPlot( Global["Boss"], "ks_TransTo", X, Y, Z, 50, 0 )
	ClsRoomValue( RoomID , 2 )--場景光源預設值
end

function Lua_Zone21_Boss1_SpellSkill( ID )--施放技能
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	local SkillID = Zone21_Boss1_Global["SkillID"]
	local Lv = Zone21_Boss1_Global["Lv"];--技能施放等級
	local Num = Zone21_Boss1_Global["SkillTarget"][ID][2-Global["Show"]];
	local HatePlayer = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
	local TID;
	local times = 0
	
	if ID ~= 6 then
		ScriptMessage( Global["Door"][1], -1 , 2 , "[SC_ZONE21_BOSS1_SKILL_0"..ID.."]", 2 )--訊息
	end
	if Global["Show"] == 0 then
		Num = Num+Global["AddNum"]
	end
	--DebugMsg(0,0, "ID = "..ID.."; Attack Num = "..Num.."; HateNum = "..table.getn(HatePlayer) )
	
	for i=1, Num do
		if Global["Show"] == 0 and i == 1 then
			local Firer = {}--持有火把者
			for j=1, table.getn(HatePlayer) do
				if CheckBuff( HatePlayer[j], 620332 ) == true then
					table.insert( Firer, HatePlayer[j] )
				end
			end

			if table.getn(Firer) > 0 then
				local Rnd = rand( table.getn(Firer) )+1;
				TID = Firer[Rnd];--持火者把
				for k=1, table.getn(HatePlayer) do
					if HatePlayer[k] ==  TID then
						table.remove( HatePlayer, k );
						break;
					end
				end
			end
		end
		if Num > 1 and TID == nil then
			if table.getn(HatePlayer) > 0 then
				local Rnd = rand( table.getn(HatePlayer) )+1;
				TID = HatePlayer[Rnd];
				table.remove( HatePlayer, Rnd );
			end
		end
		
		TID = TID or ReadRoleValue( Global["Boss"], EM_RoleValue_AttackTargetID );--當前目標
		if Global["Show"] == 0 and Global["Boss"] == Boss then--創造假象
			Boss = kg_GetPosRX( TID, Zone21_Boss1_Global["FakeBoss"], 50, 0, math.random(90,270), 0, nil );--最終決定版
			MoveToFlagEnabled( Boss, false );
			SetModeEx( Boss , EM_SetModeType_Fight, false )--無法砍殺
			SetModeEx( Boss , EM_SetModeType_Mark, false )--無標記
			SetModeEx( Boss , EM_SetModeType_ShowRoleHead, false )--無頭像
			SetModeEx( Boss , EM_SetModeType_HideName, true )--無名稱
			SetModeEx( Boss , EM_SetModeType_NotShowHPMP, true )--無血
			SetDefIdleMotion( Boss, ruFUSION_MIME_ATTACK_BOW_LOOP )
			AddToPartition( Boss, RoomID );
			AdjustFaceDir( Boss, TID, 0 )
			Sleep(5)
		end
		
		if ID == 2 then
			local Bx = ReadRoleValue( Boss, EM_RoleValue_X )
			local By = ReadRoleValue( Boss, EM_RoleValue_Y )
			local Bz = ReadRoleValue( Boss, EM_RoleValue_Z )
			local Tx = ReadRoleValue( TID, EM_RoleValue_X )
			local Tz = ReadRoleValue( TID, EM_RoleValue_Z )
			local radian = (math.pi/180)*CalDir( (Tx-Bx), (Tz-Bz) )--徑度
			local Final = CreateObj( 114264, Bx  +(250*math.cos(radian)), By, Bz - (250*math.sin(radian)), 0, 1 )--114264
			AddToPartition( Final, RoomID )
			WriteRoleValue( Final, EM_RoleValue_LiveTime, 1 )
			if Global["Show"] == 0 then--黑暗中
				SysCastSpellLv( Boss, Final, SkillID[ID], Lv[ID] );--施放技能
			else
				CastSpellLv( Boss, Final, SkillID[ID], Lv[ID] );--施放技能
			end
		else
			if Global["Show"] == 0 or ( ID == 3 and i ~= 1 ) then--黑暗中
				SysCastSpellLv( Boss, TID, SkillID[ID], Lv[ID] );--施放技能
			elseif ( ID == 3 and i == 1 ) or ID ~= 3 then
				CastSpellLv( Boss, TID, SkillID[ID], Lv[ID] );--施放技能
			end
		end
		TID = nil;
		if table.getn(HatePlayer ) == 0 then
			break
		elseif ID == 2 or ID == 3 then
			Sleep(2)
			times = times+1
		end
	end
	if Global["Boss"] ~= Boss then
		WriteRoleValue( Boss, EM_RoleValue_LiveTime, 1 )
	end
	Sleep(5)
	return math.floor(times*0.2)
end

function Lua_Zone21_Boss1_SpecialSkill()--千羽箭
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	local SkillID = Zone21_Boss1_Global["SkillID"]
	local Lv = Zone21_Boss1_Global["Lv"];--技能施放等級
	local Num = Zone21_Boss1_Global["SkillTarget"][4][1]
	local HatePlayer = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
	local TID = {}
	
	for i=1, Num do
		if table.getn(HatePlayer) < 1 then break end
		
		local Rnd = rand( table.getn(HatePlayer) )+1;
		--DebugMsg(0,0,"Rnd ="..Rnd.."; HateNum = "..table.getn(HatePlayer) )
		if CheckID( HatePlayer[Rnd] ) ==true and 
		ReadRoleValue( HatePlayer[Rnd], EM_RoleValue_IsDead ) == 0 then--隨機目標
			table.insert( TID, HatePlayer[Rnd] );
		end
		table.remove( HatePlayer, Rnd );
	end
	
	if table.getn(TID) > 0 then
		ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS1_SKILL_04]", 2 )--訊息
	else
		return 0
	end
	
	SetModeEx( Boss, EM_SetModeType_DisableRotate , true );
	for i=1, table.getn(TID) do
		TID[i] = LuaFunc_CreateObjByObj( 118858, TID[i] );
		WriteRoleValue( TID[i], EM_RoleValue_LiveTime, 4 );
		AdjustFaceDir( Boss, TID[i], 0 )
		if i > 1 then
			CallPlot( Boss, "Lua_Zone21_Boss1_SpecialSkillLoop", Boss, TID[i], SkillID[4], Lv[4] )
			--SysCastSpellLv( Boss, TID[i], SkillID[4], Lv[4] )
		else
			CastSpellLv( Boss, TID[i], SkillID[4], Lv[4] )
		end
	end
	SetModeEx( Boss, EM_SetModeType_DisableRotate , false );
	return 4
end

function Lua_Zone21_Boss1_SpecialSkillLoop( Boss, TID, SkillID, Lv )--千羽箭
	for i=1, 4 do
		SysCastSpellLv( Boss, TID, SkillID, Lv )
		Sleep(10)
	end
end

function Lua_Zone21_Boss1_Dead()--死亡
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS1_DEAD]", 2 );
	
	if Zone21_Boss1_Global[RoomID]["Show"] == 0 then
		Lua_Zone21_Boss1_ExitDark( false, RoomID )--離開黑暗
	end
	
	Lua_Zone21_Boss1_ClearItem( RoomID )--清除玩家物品
	
	for i=1, 2 do
		CallPlot( Zone21_Boss1_Global[RoomID]["Door"][i], "Lua_Zone21_CloseDoor", false, Boss )--關門
		--DelFromPartition( Zone21_Boss1_Global[RoomID]["Door"][i] );
	end	
	Zone21_Boss1_Global[RoomID] = {};
	return true;
end

function Lua_Zone21_Boss1_BombShotCheck()
	if ReadRoleValue( OwnerID(), EM_RoleValue_PID ) == 3 then
		return false;
	end
	return true;
end

--==============特殊物件相關==============--

function Lua_Zone21_Boss1_CreateObj()--產生物件
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID];
	local FlagID = Zone21_Boss1_Global["FlagID"];

	if Global["Candlestick"] == nil then
		Global["Candlestick"] = {};
		Global["barrels"] = {};
		Global["Torch"] = {};
		Global["Door"] = {};
	end
	
	for i=1, 4 do
		if Global["Candlestick"][i] == nil or CheckID(Global["Candlestick"][i]) ~= true then
			Global["Candlestick"][i] = kg_GetPosRX( { FlagID, i}, 118787 );--燭台
			SetPlot( Global["Candlestick"][i], "touch" , "Lua_Zone21_Boss1_CTouch1" , 30 )--觸碰劇情
			AddToPartition( Global["Candlestick"][i], RoomID )
		end
		AddBuff( Global["Candlestick"][i], 620325, 0, -1 )--點火
		if Global["barrels"][i] == nil or CheckID(Global["barrels"][i]) ~= true then
			local Ox = ReadRoleValue( Global["Candlestick"][i], EM_RoleValue_X );			
			local Oz = ReadRoleValue( Global["Candlestick"][i], EM_RoleValue_Z );
			local Tx = ReadRoleValue( Global["Boss"], EM_RoleValue_X );
			local Y = ReadRoleValue( Global["Boss"], EM_RoleValue_Y );
			local Tz = ReadRoleValue( Global["Boss"], EM_RoleValue_Z );
			local radian = (math.pi/180)*CalDir( Tx-Ox, Tz-Oz );--徑度
			Ox = Ox  +(25*math.cos(radian))
			Oz = Oz - (25*math.sin(radian))
			--Global["barrels"][i] = KS_CreateObjMode( 118788, Global["Candlestick"][i], nil,  15, 1, false, 20 );--油桶
			Global["barrels"][i] = CreateObj( 118788, Ox, y, Oz, 0, 1 );--油桶
			SetPlot( Global["barrels"][i], "touch" , "Lua_Zone21_Boss1_barrelsTouch1", 30 )--觸碰劇情
			AddToPartition( Global["barrels"][i], RoomID )
		end
	end

	for i=1, 2 do
		if	Global["Door"][i] == nil or 
			CheckID(Global["Door"][i]) ~= true or 
			ReadRoleValue( Global["Door"][i], EM_RoleValue_OrgID ) ~= 106012 then
			Global["Door"][i] = kg_GetPosRX( { FlagID, i+4}, 106012 );		--阻擋門
			SetModeEx( Global["Door"][i], EM_SetModeType_Fight, false );		--無法砍殺
			SetModeEx( Global["Door"][i], EM_SetModeType_Searchenemy, false );	-- 索敵
			SetModeEx( Global["Door"][i] , EM_SetModeType_Strikback , false );	-- 反擊
			SetModeEx( Global["Door"][i] , EM_SetModeType_Mark , false )		-- 標記
			SetModeEx( Global["Door"][i], EM_SetModeType_Obstruct , true )	-- 阻擋
			AddToPartition( Global["Door"][i], RoomID );--預設後門開啟
			SetRoleCamp( Global["Door"][i], "Visitor" )			
		end
	end

	
	if Global["Stone"] == nil or CheckID(Global["Stone"]) ~= true then
		Global["Stone"] = kg_GetPosRX( { FlagID, 7 }, 118697 );--取得打火石
		SetPlot( Global["Stone"], "touch" , "Lua_Zone21_Boss1_StoneTouch1" , 30 );--觸碰劇情
	end
	AddToPartition( Global["Stone"], RoomID );

	for i=1, 4 do
		if Global["Torch"][i] == nil or CheckID(Global["Torch"][i]) ~= true then
			Global["Torch"][i] = kg_GetPosRX( { FlagID, i+7 }, 118880 );--取得火把
			SetPlot( Global["Torch"][i], "touch" , "Lua_Zone21_Boss1_GetTorch1" , 30 )--觸碰劇情			
		end
		AddToPartition( Global["Torch"][i], RoomID );
	end
end

function Lua_Zone21_Boss1_CandlestickFireCheck()--檢查所有燭台是否點燃
	local ErrorTime = Zone21_Boss1_Global["FireTime"] or 5;
	Sleep(ErrorTime*10)	
	local Global = Zone21_Boss1_Global[ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )];
	if Global["Show"] == 0 then
		Global["FireCheck"] = false;
		for i=1, table.getn(Global["Candlestick"]) do
			if CheckBuff( Global["Candlestick"][i], 620325 ) == true then
				SysCastSpellLv( Global["Boss"], Global["Candlestick"][i], 497868, 0 )--清除燭台火
				sleep(5);
			end
		end
	end
end

function Lua_Zone21_Boss1_CandlestickFireCancel()--清除燭台火
	CancelBuff( TargetID(), 620325 );
end

function Lua_Zone21_Boss1_Flint()--打火石效果
	local TID = TargetID();
	local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID );
	local Global = Zone21_Boss1_Global[RoomID]
	if Global == nil then
		return false
	end
		
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 118788 then--燃油桶
		ScriptMessage( TID, -1 , 2 , "[SC_ZONE21_BOSS1_BOMB]", 2 )--訊息
		SysCastSpellLv( TID, TID, 498003, 0 )--燃油桶爆炸
		WriteRoleValue( TID, EM_RoleValue_LiveTime, 1 );
	elseif CountBodyItem( TID, 240095 ) > 0 and CheckBuff( TID, 620275 ) == true then--有火把與燃油雙手
		DelBodyItem( TID, 240095, 1 )--刪除火把
		CancelBuff( TID, 620275 )--清除燃油狀態
		AddBuff( TID, 620324, Zone21_Boss1_Global["Lv"][7], -1 )--雙手燒傷
		AddBuff( TID, 620332, 0, -1 )--點燃火把時間檢查
		GiveBodyItem( TID, 240285, 1 )--點燃的火把
	end
end

function Lua_Zone21_Boss1_CTouch1()--燭台點火
	local OID = OwnerID() 	-- 玩家
	local TID = TargetID()  	-- 物件
	
	if CheckBuff( TID, 620325 ) ~= true then--燭台有火
		local item = 240285;
		if CountBodyItem( OID, item ) > 0 then --有點燃的火把
			if BeginCastBarEvent( OID, TID,"[SC_USING]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_Zone21_Boss1_CTouch2" ) ~= 1 then 
				ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
				return
			end
		else		
			ScriptMessage( OID, OID, 1 , "[NO_ITEM][$SETVAR1=["..item.."]]" , 0 )--你沒有[點燃的火把]
			ScriptMessage( OID, OID, 0 , "[NO_ITEM][$SETVAR1=["..item.."]]" , 0 )--你沒有[點燃的火把]
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_ZONE21_BOSS1_NONEED_TOUCH]", 0 )--目前不需使用燃燒的火把
		ScriptMessage( OID, OID, 0,"[SC_ZONE21_BOSS1_NONEED_TOUCH]", 0 )--目前不需使用燃燒的火把
	end
end

function Lua_Zone21_Boss1_CTouch2( OID, CheckStatus )
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- 成功
			local TID = TargetID();--燭火
			ScriptMessage( OID, -1 , 2 , "[SC_ZONE21_BOSS1_LIGHT]", 2 )--訊息
			CancelBuff( OID, 620332 );--點燃火把檢查
			AddBuff( TID, 620325, 0, -1 )--點火
			local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID );
			if Zone21_Boss1_Global[RoomID]["Show"] == 0 then--黑暗中
				local Global = Zone21_Boss1_Global[RoomID];
				for i=1, table.getn(Global["Candlestick"]) do
					if CheckBuff( Global["Candlestick"][i], 620325 ) ~= true and Global["Candlestick"][i] ~= TID then
						if Global["FireCheck"] == false then
							Global["FireCheck"] = true;
							BeginPlot( Global["Ctrl"], "Lua_Zone21_Boss1_CandlestickFireCheck", 0 )--檢查所有燭台是否點燃
						end
						EndCastBar( OID, CheckStatus );
						return;
					end
				end
				Lua_Zone21_Boss1_ExitDark( true, RoomID )--Boss離開黑暗
			end
		end
		EndCastBar( OID, CheckStatus );
	end
end


function Lua_Zone21_Boss1_barrelsTouch1()
	local OID = OwnerID() 	-- 玩家
	local TID = TargetID()  	-- 物件
	local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID )
	local Boss = Zone21_Boss1_Global[RoomID]["Boss"]
	
	if Boss == nil or CheckID(Boss) ~= true or ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 1 then
		ScriptMessage( OID, OID, 1,"[SC_204638_0]", 0 )--不需使用
		ScriptMessage( OID, OID, 0,"[SC_204638_0]", 0 )--不需使用
		return
	end
	
	if CheckBuff( OID, 620275 ) == true then--手沾滿油
		ScriptMessage( OID, OID, 1,"[SC_ZONE21_BOSS1_NONEED_BARREL]", 0 )--你已經沾滿燃油
		ScriptMessage( OID, OID, 0,"[SC_ZONE21_BOSS1_NONEED_BARREL]", 0 )--你已經沾滿燃油
		return
	end
	
	if CheckBuff( OID, 620324 ) == true then--雙手燃燒
		ScriptMessage( OID, OID, 1,"[SC_ZONE21_BOSS1_CANT_BARREL]", 0 )--你現在無法使用燃油桶
		ScriptMessage( OID, OID, 0,"[SC_ZONE21_BOSS1_CANT_BARREL]", 0 )--你現在無法使用燃油桶
		return		
	end
	
	if BeginCastBarEvent( OID, TID,"[SC_USING]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_Zone21_Boss1_barrelsTouch2" ) ~= 1 then 
		ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
		return
	end
end

function Lua_Zone21_Boss1_barrelsTouch2( OID, CheckStatus )
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- 成功
			AddBuff( OID, 620275, 0, -1 )--手沾油
		end
		EndCastBar( OID, CheckStatus );
	end
end

function Lua_Zone21_Boss1_StoneTouch1()--取得打火石
	local OID = OwnerID() 	-- 玩家
	local TID = TargetID()  	-- 物件
	local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID )
	local Boss = Zone21_Boss1_Global[RoomID]["Boss"]
	
	if Boss ~= nil and CheckID(Boss) == true and ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 0 then
		if BeginCastBarEvent( OID, TID,"[SC_USING]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_Zone21_Boss1_StoneTouch2" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_204638_0]", 0 )--不需使用
		ScriptMessage( OID, OID, 0,"[SC_204638_0]", 0 )--不需使用
	end
end

function Lua_Zone21_Boss1_StoneTouch2( OID, CheckStatus )
	local TID = TargetID();
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- 成功
			GiveBodyItem( OID, 240284, 6 )--打火石
			DelFromPartition( TID );
		end
		EndCastBar( OID, CheckStatus );
	end
end

function Lua_Zone21_Boss1_GetTorch1()--取得火把
	local OID = OwnerID() 	-- 玩家
	local TID = TargetID()  	-- 物件
	local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID )
	local Boss = Zone21_Boss1_Global[RoomID]["Boss"]
	
	if Boss ~= nil and CheckID(Boss) == true and ReadRoleValue( Boss, EM_RoleValue_IsDead ) == 0 and 
	CountBodyItem( OID, 240095 ) == 0 and CountBodyItem( OID, 240285 ) == 0 then --沒有火把
		
		if BeginCastBarEvent( OID, TID,"[SC_USING]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_Zone21_Boss1_GetTorch2" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_204638_0]", 0 )--不需使用
		ScriptMessage( OID, OID, 0,"[SC_204638_0]", 0 )--不需使用
	end
end

function Lua_Zone21_Boss1_GetTorch2( OID, CheckStatus )
	local TID = TargetID();
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- 成功
			GiveBodyItem( OID, 240095, 1 )--火把
			local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID )
			local Boss = Zone21_Boss1_Global[RoomID]["Boss"]
			if ReadRoleValue( Boss, EM_RoleValue_PID ) == 1 then
				DelFromPartition( TID );
			end
		end
		EndCastBar( OID, CheckStatus );
	end
end

function Lua_Zone21_Boss1_ClearTorch()--清除燃燒的火把
	local OID = OwnerID()
	DebugMsg(0,0,"ClearTorch")
	DelBodyItem( OID, 240285, CountBodyItem( OID, 240285 ) );--刪除點燃的火把
	GiveBodyItem( OID, 240095, 1 )--給與火把
end