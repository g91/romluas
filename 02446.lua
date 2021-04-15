--==============企劃設定變數==============--

function Lua_Zone22_Boss2_Global()--技能施放等級
	local Global = Zone22_Boss2_Global
	
	Global["Level"] = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	Global["SkillID"] = {}
	Global["SkillID"]["Fire"] = { 498165,498136,498138 };--火焰
	Global["SkillID"]["Ice"] = { 498166,498135,498137 };--寒冰
	
	if Global["Level"] == 1 then  --============ 普通 ============--
		Global["BossID"] = {	105933, 105934	}
		Global["GiftID"]  = 106100	--寶箱

		Global["Lv"] = {}--技能施放等級
		Global["Lv"][1] = 30;--單體傷害
		Global["Lv"][2] = 35;--前方扇形
		Global["Lv"][3] = 40;--範圍AE 
	else --============ 簡單 ============--
		Global["BossID"] = {	106706, 106707	}
		Global["GiftID"]  = 106708	--寶箱
		
		Global["Lv"] = {}--技能施放等級
		Global["Lv"][1] = 4;--單體傷害
		Global["Lv"][2] = 6;--前方扇形
		Global["Lv"][3] = 8;--範圍AE 
	end	
end

--==============以下AI處理 別改它==============--

function Lua_Zone22_Boss2_Ctrl()--中控
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	
	if Zone22_Boss2_Global == nil then
		Zone22_Boss2_Global = {}
		Lua_Zone22_Boss2_Global()
	end
	if Zone22_Boss2_Global[RoomID] == nil then		
		Zone22_Boss2_Global[RoomID] = {}
	end
	
	local Global = Zone22_Boss2_Global[RoomID]
	Global["FlagID"] = 780984;--信_副本用_02
	
	if Global["Ctrl"] == nil then
		Global["Boss"] = {};
		Global["Door"] = {};
		for i=1, 2 do
			--if Global["Door"][i] == nil or CheckID(Global["Door"][i]) ~= true then
				Global["Door"][i] = kg_GetPosRX( {Global["FlagID"], i+2}, 106012 );		--阻擋門
				SetModeEx( Global["Door"][i], EM_SetModeType_Fight, false );		--無法砍殺
				SetModeEx( Global["Door"][i], EM_SetModeType_Searchenemy, false );	-- 索敵
				SetModeEx( Global["Door"][i] , EM_SetModeType_Strikback , false );	-- 反擊
				SetModeEx( Global["Door"][i] , EM_SetModeType_Mark , false )		-- 標記
				SetRoleCamp( Global["Door"][i], "Visitor" )
				AddToPartition( Global["Door"][i], RoomID );--預設後門開啟
			--end
		end
		SetModeEx( Global["Door"][1], EM_SetModeType_Show , false )
		SetModeEx( Global["Door"][2], EM_SetModeType_Obstruct , true )	-- 阻擋
	end
	Global["Ctrl"] = OwnerID();
	
	local CreateNum = 0;
	DebugMsg(0,0,"CreateCheck")
	for i=1, 2 do
		--if	Global["Boss"][i] == nil or 
		--	CheckID(Global["Boss"][i]) ~= true then
			
			Global["Boss"][i] = kg_GetPosRX( {Global["FlagID"], i}, Zone22_Boss2_Global["BossID"][i] );
			AddToPartition( Global["Boss"][i], RoomID );
			AddBuff( Global["Boss"][i], 620595, 0, -1 );--減傷99%
			SetPlot( Global["Boss"][i], "dead", "Lua_Zone22_Boss2_Dead", 0 );--死亡判斷
			CreateNum = CreateNum+1;
		--[[else
			if ReadRoleValue( Global["Boss"][i], EM_RoleValue_IsDead ) == 1 then
				WriteRoleValue( Global["Boss"][i], EM_RoleValue_IsDead, 0 )
				AddToPartition( Global["Boss"][i], RoomID )
			else
				CallPlot( Global["Boss"][i], "ks_resetObj", Global["Boss"][i], 5 );
			end
			DebugMsg(0,0,"Reset Boss "..i )
		end--]]
	end
	
	Global["Fight"] = false;

end

function Lua_Zone22_Boss2_Fight()--開始戰鬥
	local boss = OwnerID()
	local OrgID = ReadRoleValue( boss, EM_RoleValue_OrgID )
	if OrgID  == 105933 or OrgID == 106706 then
		CallPlot( boss , "Lua_Zone22_Boss2_AI", "Fire", 1 );
	else
		CallPlot( boss , "Lua_Zone22_Boss2_AI", "Ice", 2 );
	end
end

function Lua_Zone22_Boss2_AI( mode, Site )--Boss 戰鬥AI
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	local FlagX = GetMoveFlagValue( Global["FlagID"] , Site, EM_RoleValue_X );
	local FlagZ = GetMoveFlagValue( Global["FlagID"] , Site, EM_RoleValue_Z );
	local SkillID = Zone22_Boss2_Global["SkillID"];
	local Lv = Zone22_Boss2_Global["Lv"];
	local time = 0;
	local X;
	local Z;
	local Dis;
	
	if Global["Fight"] == false then
		Global["Fight"] = true;
		Global["Stop"] = false;
		Global["Special"] = false
		ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_START]", 2 );--開始
		CallPlot( Global["Door"][1], "Lua_CloseTranDoor", true, Boss )--關門
		Callplot( Global["Ctrl"], "Lua_Zone22_Boss2_CheckDis", 0 );--檢查距離
	end
	Lua_Zone22_Boss2_GetHate( Boss )--給予仇恨
	AddBuff( Boss, 502707, 0, -1 );--非戰鬥不回血
	
	if Zone22_Boss2_Global["Level"] == 1 then
		CallPlot( Boss, "Lua_Zone22_Boss2_BattleCheck" )--戰鬥時間檢查
	end	
	
	while true do
		sleep(10);
		X = ReadRoleValue( Boss , EM_RoleValue_X );
	 	Z = ReadRoleValue( Boss , EM_RoleValue_Z );
		Dis = math.floor( ( ( X - FlagX )^2 +( Z - FlagZ )^2 )^0.5);
		
		if ( KS_InCombat( Boss ) ~= true or Dis > 500 or CheckBuff( Boss, 502707 ) ~= true ) and Global["Fight"] == true then
			Global["Fight"] = false;			
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_EXIT]", 2 );--脫離戰鬥
			Callplot( Global["Ctrl"], "Lua_Zone22_Boss2_Reset", 0 );--重置
			return
		end
		
		time = time+1;
		if Global["Stop"] == false then
			if time%7 == 0 then
				local TID;
				local Rnd = rand(3)+1;
				if Rnd > 1 then
					TID = Boss;
				end
				TID = TID or ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );
				CastSpellLv( Boss, TID, SkillID[mode][Rnd], Lv[Rnd] );
			end
		end
	end	
end

function Lua_Zone22_Boss2_BattleCheck()--戰鬥時間檢查
	local Boss = OwnerID()
	local time = 0
	while true do
		sleep(10)
		time = time +1
		if not KS_InCombat( Boss ) then
			break
		elseif time >= 360 and not CheckBuff( Boss, 620561 ) then--6分鐘狂暴
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_CRAZY]", 2 )--狂暴
			AddBuff( Boss, 620561, 0, -1 )
			break
		end
	end
end

function Lua_Zone22_Boss2_Reset()--重置
	DebugMsg(0,0,"Reset Start")
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	CallPlot( Global["Door"][1], "Lua_CloseTranDoor", false, Global["Boss"] )--關門
	
	for i= 1, 2 do
		local Num = BuffCount(Global["Boss"][i] );
		for j = 1 , Num do
			CancelBuff( Global["Boss"][i], BuffInfo( Global["Boss"][i] , Num-j, EM_BuffInfoType_BuffID) )
		end
		
		magicinterrupt( Global["Boss"][i] );
		SetStopAttack( Global["Boss"][i] );
		ClearHateList( Global["Boss"][i], -1 );
		CallPlot( Global["Boss"][i], "ks_TransTo", Global["FlagID"], i, nil, 0, 0 )--傳送到特定位置( Rnd = 隨機距離 min=最小距離 )
		Sleep(5)

		if not CheckID(Global["Boss"][i]) or ReadRoleValue( Global["Boss"][i], EM_RoleValue_IsDead ) == 1 then
			Global["Boss"][i] = kg_GetPosRX( {Global["FlagID"], i}, Zone22_Boss2_Global["BossID"][i] );
			WriteRoleValue( Global["Boss"][i], EM_RoleValue_IsDead, 0 )
			AddToPartition( Global["Boss"][i], RoomID )
			WriteRoleValue( Global["Boss"][i], EM_RoleValue_HP, ReadRoleValue( Global["Boss"][i], EM_RoleValue_MaxHP ) );--滿血
			SetPlot( Global["Boss"][i], "dead", "Lua_Zone22_Boss2_Dead", 0 );--死亡判斷
			AddBuff( Global["Boss"][i], 620595, 0, -1 );--減傷99%
		else
			CallPlot( Global["Boss"][i], "ks_resetObj", Global["Boss"][i], 5, 620595 );
		end
		DebugMsg(0,0,"Reset Boss "..i )
	end
	
	local Player = SetSearchAllPlayer( RoomID );
	local ID;
	for i=1, Player do
		ID = GetSearchResult();
		CancelBuff( ID, 620569 );
		CancelBuff( ID, 620570 );
		CancelBuff( ID, 620587 );
	end
	DebugMsg(0,0,"Reset End")
end

function Lua_Zone22_Boss2_Dead()--死亡
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	
	ic_ha_de_22_02()--防駭客
	
	for i=1, 2 do
		if Global["Boss"][i] ~= Boss and CheckID( Global["Boss"][i] ) == true and ReadRoleValue( Global["Boss"][i], EM_RoleValue_IsDead ) ~= 1 then
			return true;
		end
	end
	
	local gift = kg_GetPosRX( {Global["FlagID"], rand(2)+1}, Zone22_Boss2_Global["GiftID"]   );
	AddToPartition( gift, RoomID );--預設後門開啟	
	ScriptMessage( gift, -1 , 2 , "[SC_ZONE22_BOSS2_DEAD]", 2 );
	
	for i=1, 2 do
		DelFromPartition( Zone22_Boss2_Global[RoomID]["Door"][i] );
	end
	
	Zone22_Boss2_Global[RoomID] = {};
	local Player = SetSearchAllPlayer( RoomID );
	local ID;
	for i=1, Player do
		ID = GetSearchResult();
		CancelBuff( ID, 620569 )--灼熱熔漿
		CancelBuff( ID, 620570 )--霜寒凍體
	end
	return true;
end

function Lua_Zone22_Boss2_GetHate( Boss )--給予仇恨	
	local Player = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID )
	for i=1, GetPartyID( Player, -1 ) do
		local GUID = GetPartyID( Player, i );
		if GetDistance( GUID, Boss ) < 500  then
			SysCastSpellLv( GUID, Boss, 496946, 0 );--仇恨
			SysCastSpellLv( Boss, GUID, 496946, 0 );--仇恨
		end
	end
end

function Lua_Zone22_Boss2_CheckDis()--檢查距離
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	local Dis;
	
	while Global["Fight"] do
		Sleep(10)
		for i=1, 2 do
			if ReadRoleValue( Global["Boss"][i], EM_RoleValue_IsDead ) == 1 then
				return;
			end
		end
		
		Dis = GetDistance( Global["Boss"][1], Global["Boss"][2] );
		if Dis <= 100 and Global["Special"] == true then			
			for i=1, 2 do
				ScriptMessage( Global["Boss"][i], -1 , 2 , "[SC_ZONE22_BOSS2_CHAOS]", 2 );
				SysCastSpellLv( Global["Boss"][i], Global["Boss"][i], 498145, 0 );--元素渾沌
			end
		elseif Dis <= 35 and Global["Special"] == false and Global["Stop"] == false then
			Global["Stop"] = true;
			Callplot( Global["Boss"][1], "Lua_Zone22_Boss2_AreaEffect", 1 );
			Callplot( Global["Boss"][2], "Lua_Zone22_Boss2_AreaEffect", 2 );
		end
		
		DebugMsg(0,0,"BossDis = "..Dis)
	end
end

function Lua_Zone22_Boss2_AreaEffect( mode )--靈氣
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_NOBUFF]", 2 );
	CancelBuff( Boss, 620595 );--減傷99%
	SysCastSpellLv( Boss, Boss, 498134, 0 );--爆炸
	
	for i=1, 5 do
		Sleep(10)
		if KS_InCombat( Boss ) ~= true then
			return
		end
	end
	
	Global["Stop"] = false;
	Global["Special"] = true;
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_AE]", 2 );
	for j=1, 30 do
		if KS_InCombat( Boss ) ~= true then
			return
		end
		SysCastSpellLv( Boss, Boss, 498138+( 3-mode), 0 );--施放靈氣
		Sleep(10)
	end
	
	AddBuff( Boss, 620595, 0, -1 )--減傷99%
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE22_BOSS2_BUFF]", 2 );
	Global["Special"] = false;
end

function Lua_Zone22_Boss2_FireDebuff()--虛耗
	local OID = OwnerID();
	local LV = KS_CheckBuffLV( OID, 620587 );
	if Lv < 10 then
		AddBuff( OID, 620587, 0, 10-LV );
	end
end

function Lua_Zone22_Boss2_PlayerSkill( mode )--玩家技能檢查
	local OID = OwnerID();
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID );
	local Global = Zone22_Boss2_Global[RoomID];
	if Global["Boss"] == nil then
		ScriptMessage( OID, OID, 0 , "[SC_204638_0]", 0 );--不需使用
		ScriptMessage( OID, OID, 1 , "[SC_204638_0]", 0 );--不需使用
		return false;
	end
	
	if TargetID() == Global["Boss"][mode] then
		return true;
	end
	
	ScriptMessage( OID, OID, 0 , "[EM_200928_2]", 0 );--目標錯誤
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]", 0 );--目標錯誤
	return false;
end

function Lua_Zone22_Boss2_DebuffCheck( mode )--靈氣BUFF判斷
	local TID = TargetID()	
	if Zone22_Boss2_Global["Level"] == 1 then
		if mode >2 then
			return false
		elseif not CheckBuff( TID, 620568+(3-mode) ) then--火1/冰2  620569/620570
			return true
		end
		CancelBuff( TID, 620569 );
		CancelBuff( TID, 620570 );
	else
		if mode <3 then
			return false
		elseif not CheckBuff( TID, 622280+(mode-2) ) then--火/冰 622281/622282
			return true
		end
		CancelBuff( TID, 622281 );
		CancelBuff( TID, 622282 );
	end
	
	if not CheckBuff( TID, 620584 ) and not CheckBuff( TID, 620585 ) then
		if mode< 3 then
			AddBuff( TID, 620583+(3-mode), 0, -1 );--凍結/虛耗
		else
			AddBuff( TID, 620583+(mode-2), 0, -1 );--凍結/虛耗
		end
	end
	return false;
end