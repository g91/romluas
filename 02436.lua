--==============企劃設定變數==============--

function Lua_Zone21_Boss5_GlobalSet()--企劃變數設定
	Zone21_Boss5_Global = {}
	local Global = Zone21_Boss5_Global
	Global["FlagID"] = 780985;--物件產生旗標
	
	Global["SkillID"] = {}--法術集合
	Global["SkillID"][1] = 498067--神聖制裁
	Global["SkillID"][2] = 498068--大迴旋
	Global["SkillID"][3] = 498072--崩裂重擊
	Global["SkillID"][4] = 498069--人王禁令
	Global["SkillID"][5] = 498081--大戰斧「颶風」
	Global["SkillID"][6] = 498073--王的懲戒
	Global["SkillID"][7] = 498074--震怒
	Global["SkillID"][8] = 498079--小怪衝鋒
	Global["SkillID"][9] = 498075--崩裂重擊(debuff觸發)
	
	Lua_Zone21_Boss5_GlobalLevel()--難度設定
end

function Lua_Zone21_Boss5_GlobalLevel( )--難度設定
	local level = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	local Global = Zone21_Boss5_Global
	
	if level == 1 then  --============ 困難 ============--
		Global["BossID"] = 105520--王
		Global["MstID"] = 105522--小怪
		Global["SpellNum"] = 3 -- 裁罰數量
		
		Global["Lv"] = {}--技能施放等級
		Global["Lv"][1] = 40--神聖制裁
		Global["Lv"][2] = 35--大迴旋
		Global["Lv"][3] = 90--崩裂重擊
		Global["Lv"][4] = 39--人王禁令
		Global["Lv"][5] = 20--大戰斧「颶風」
		Global["Lv"][6] = 9--王的懲戒
		Global["Lv"][7] = 5--震怒
		Global["Lv"][8] = 300--小怪衝鋒
		Global["Lv"][9] = 7--崩裂重擊(debuff觸發)
		
	elseif level == 2 then  --============ 普通 ============--
		Global["BossID"] = 106048--王
		Global["MstID"] = 106051--小怪
		Global["SpellNum"] = 2 -- 裁罰數量
		
		Global["Lv"] = {}--技能施放等級
		Global["Lv"][1] = 35--神聖制裁
		Global["Lv"][2] = 25--大迴旋
		Global["Lv"][3] = 15--崩裂重擊
		Global["Lv"][4] = 39--人王禁令
		Global["Lv"][5] = 10--大戰斧「颶風」
		Global["Lv"][6] = 9--王的懲戒
		Global["Lv"][7] = 5--震怒
		Global["Lv"][8] = 300--小怪衝鋒
		Global["Lv"][9] = 7--崩裂重擊(debuff觸發)
		
	else--============ 簡單 ============--
		Global["BossID"] = 106049--王
		Global["SpellNum"] = 1 -- 裁罰數量
		
		Global["Lv"] = {}--技能施放等級
		Global["Lv"][1] = 36--神聖制裁
		Global["Lv"][2] = 20--大迴旋
		Global["Lv"][3] = 3--崩裂重擊
		Global["Lv"][4] = 20--人王禁令
		Global["Lv"][5] = 10--大戰斧「颶風」
		Global["Lv"][6] = 0--王的懲戒
		Global["Lv"][7] = 0--震怒
		Global["Lv"][9] = 7--崩裂重擊(debuff觸發)
	end
end

--==============以下AI處理 別改它==============--

function Lua_Zone21_Boss5_Fight()--開始戰鬥
	CallPlot( OwnerID(), "Lua_Zone21_Boss5_AI" )
end

function Lua_Zone21_Boss5_Ctrl()--中控
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	
	if Zone21_Boss5_Global == nil then
		Lua_Zone21_Boss5_GlobalSet()
	end
	if Zone21_Boss5_Global[RoomID] == nil then
		Zone21_Boss5_Global[RoomID] = {}
	end
	
	local Global = Zone21_Boss5_Global[RoomID]
	local FlagID =  Zone21_Boss5_Global["FlagID"]
	Global["Ctrl"] = OwnerID();
	
	if 	Global["Boss"] == nil or 
		CheckID( Global["Boss"] ) ~= true or 
		ReadRoleValue( Global["Boss"], EM_RoleValue_OrgID ) ~= Zone21_Boss5_Global["BossID"] then
		
		Global["Boss"] = kg_GetPosRX( {FlagID, 0}, Zone21_Boss5_Global["BossID"] );
		WriteRoleValue( Global["Boss"], EM_RoleValue_PID, ReadRoleValue( Global["Ctrl"], EM_RoleValue_PID ) )
		AddToPartition( Global["Boss"], RoomID );		
	else
		ks_resetObj( Global["Boss"], 0 );
	end
	
	SetPlot( Global["Boss"], "dead", "Lua_Zone21_Boss5_Dead", 0 );--死亡判斷

	if Global["Door"] == nil then
		Global["Door"] = {};
	end
	for i=1, 2 do
		if Global["Door"][i] == nil or CheckID(Global["Door"][i]) ~= true or
		ReadRoleValue( Global["Door"][i], EM_RoleValue_OrgID ) ~= 106012 then
			Global["Door"][i] = kg_GetPosRX( {FlagID, i}, 106012 );		--阻擋門
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

function Lua_Zone21_Boss5_AI()--Boss 戰鬥AI
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local PID = ReadRoleValue( Boss, EM_RoleValue_PID );
	local Global = Zone21_Boss5_Global[RoomID];
	local FlagID = Zone21_Boss5_Global["FlagID"]
	local FlagX = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_X );
	local FlagZ = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Z );	
	local SkillID = Zone21_Boss5_Global["SkillID"]--{ 498067, 498068, 498072, 498069 };
	local Lv = Zone21_Boss5_Global["Lv"];
	local time = 0;
	local SpellMagicID = 0;
	local ID = 0;
	local PhaseTime = 0;
	local WaitingTime = 30;
	local CreateTimes = 1;
	local ObjType;
	local PhaseTimeLock = false;
	local TimeLock = false
	local TID;
	local X;
	local Z;
	local Dis;
	
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS6_START]", 2 );--開始
	CallPlot( Global["Door"][1], "Lua_Zone21_CloseDoor", true, Boss )--關門
	CallPlot( Boss, "Lua_Zone21_Boss5_TimeCheck", Boss )
	--AddToPartition( Global["Door"][1], RoomID );--前門開啟
	AddBuff( Boss, 502707, 0, -1 );--非戰鬥不回血
	LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.4 , "Lua_Zone21_Boss5_ChangePhase" );--階段切換
	
	Global["Phase"] = 1;
	CastSpell( Boss, Boss, 498070 );--開場靈氣
	
	while true do
		sleep(10);
		SpellMagicID = ReadRoleValue( Boss, EM_RoleValue_SpellMagicID );
		
		if KS_CheckBuffLV( Boss, 620481 ) >= 5 and SpellMagicID == 0 and TimeLock == false then--增益已滿
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS6_AE]", 2 );--致死AE
			CallPlot( Boss, "Lua_Zone21_Boss5_SetLock", 2, true )
			CastSpellLv( Boss, Boss, SkillID[6], Lv[6] );--全場致死
			CancelBuff( Boss, 620481 )
			Sleep(30)
		end
		
		X = ReadRoleValue( Boss , EM_RoleValue_X );
	 	Z = ReadRoleValue( Boss , EM_RoleValue_Z );
		Dis = math.floor( ( ( X - FlagX )^2 +( Z - FlagZ )^2 )^0.5);
		
		if KS_InCombat( Boss ) ~= true or Dis > 500 then
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS6_EXIT]", 2 );--脫離戰鬥
			ks_TransTo( FlagID, 0, nil, 0, 0 )--傳送到特定位置( Rnd = 隨機距離 min=最小距離 )
			Lua_Zone21_Boss5_Reset();--重置
			return
		end
		
		if Global["Phase"] == 2 and SpellMagicID == 0 then
			Global["Phase"] = 3;
			CallPlot( Boss, "Lua_Zone21_Boss5_SetLock", 1, true )
			CastSpellLv( Boss, Boss, SkillID[7], Lv[7] )--全場暈
			ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS6_CHANGE]", 2 );--階段改變
			Sleep(20)
		elseif Global["Phase"] == 3 then
			if 	PhaseTime%WaitingTime == 0 then
				if SpellMagicID == 0 and TimeLock == false then
					local ChangeObj = false;
					DebugMsg(0,0,"AxeNum = "..Global["AxeNum"].."; ShieldNum = "..Global["ShieldNum"] )
					if Global["AxeNum"] < 2 and CreateTimes == 1 then				
						ObjType = "Axe";
						ChangeObj = true;
						if Global["ShieldNum"] < 2 then
							CreateTimes = 2;
							WaitingTime = PhaseTime+5;
						else
							WaitingTime = 30;
						end
					elseif Global["ShieldNum"] < 2 then
						ObjType = "Shield";
						ChangeObj = true;
						WaitingTime = 30;
					else
						WaitingTime = 30;
					end
					
					if ChangeObj == true then
						CallPlot( Boss, "Lua_Zone21_Boss5_SetLock", 4 )
						TID = nil;
						local Hate = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)				
						while table.getn(Hate) > 0 do
							local Rnd = rand( table.getn(Hate) )+1;
							if	CheckID( Hate[Rnd] ) == true and 
								ReadRoleValue( Hate[Rnd], EM_RoleValue_IsDead ) == 0 and
								CheckBuff( Hate[Rnd], 620486 ) ~= true and--被追逐者
								CheckBuff( Hate[Rnd], 620479 ) ~= true then--君王敕令
								TID = Hate[Rnd];
								break
							end
							table.remove( Hate, Rnd );
						end
						TID = TID or ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );
						Global["ObjTarget"] = TID;

						if ObjType == "Axe" then
							ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS6_AXE][$SETVAR1="..GetName(TID).."]", 2 );--丟出斧
						else
							ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS6_SHIELD][$SETVAR1="..GetName(TID).."]", 2 );--丟出盾
						end
						AddBuff( TID, 620486, 0, -1 );--緊追不捨
						Sleep(15)						
						local Ty = ReadRoleValue( TID, EM_RoleValue_Y )+7;
						local Tx = ReadRoleValue( TID, EM_RoleValue_X );
						local Tz = ReadRoleValue( TID, EM_RoleValue_Z );
						
						if ObjType == "Axe" then
							CastSpellPos( Boss, Tx, Ty, Tz, 498103, 0 )--丟出斧
							CallPlot( Boss, "Lua_Zone21_Boss5_CreateFire", Boss, TID )--產生黑火
						else
							CastSpellPos( Boss, Tx, Ty, Tz, 498104, 0 )--丟出盾
						end
						TID = nil;
						Global[ObjType.."Num"] = Global[ObjType.."Num"] +1;
						DebugMsg(0,0,"Create "..ObjType )
					end
					if WaitingTime == 30 then
						CreateTimes = 1;
						if PID < 3 then 
							CallPlot( Boss, "Lua_Zone21_Boss5_CreateMstCheck", 0 )--產生小怪檢查
						end
					end
					PhaseTimeLock = false;
				else
					PhaseTimeLock = true;
				end
			end
			if PhaseTimeLock == false then
				PhaseTime = PhaseTime+1;
			end
		end		
		
		if TimeLock == false then
			time = time+1;--時間遞增
		end
		--DebugMsg(0,0,"Battle Time = "..time.."; Phase2Time = "..PhaseTime.."; WaitingTime = "..WaitingTime );
		if ( time%13 == 0 or time%10 == 0 or time%7 == 0 ) and SpellMagicID == 0 then
			TimeLock = false;
			if time%10 == 0 then--吸收
				local TargetArray = {};
				local Hate = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
				
				while table.getn(Hate) > 0 and table.getn(TargetArray) < Zone21_Boss5_Global["SpellNum"] do
					local Rnd = rand( table.getn(Hate) )+1;
					if CheckID( Hate[Rnd] ) == true and 
					ReadRoleValue( Hate[Rnd], EM_RoleValue_IsDead ) == 0 and
					CheckBuff( Hate[Rnd], 620486 ) ~= true then--被追逐者
						table.insert( TargetArray, Hate[Rnd] )
					end
					table.remove( Hate, Rnd );
				end
				ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS6_SKILL_00]", 2 )--吸收
				Sleep(20)
				for i=1, table.getn(TargetArray) do
					SysCastSpellLv( Boss, TargetArray[i], 498086, 0 )--施放吸收
				end
				if Global["Phase"] ~= 3 or ( Global["Phase"] == 3 and PID < 3 ) then
					Lua_Zone21_Boss5_SpellShare( SkillID[3], Lv[3] )--施放分攤
				end
			elseif time%13 == 0 then--禁制物品
				ID = 4;
			elseif time%7 == 0 then--單體傷害/前方扇形
				ID = RandRange( 1 , 2)
			end
			
			if ID ~= 0 then
				TID = TID or ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );
				--ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS6_SKILL_0"..ID.."]", 2 )--訊息
				if ID == 2 or ID == 4 then
					CallPlot( Boss, "Lua_Zone21_Boss5_SetLock", (6-ID) )
					TID = Boss;
				end
				CastSpellLv( Boss, TID, SkillID[ID], Lv[ID] );--施放技能
				if ID > 1 then
					sleep(10)
				end
				Sleep(10)
				TID = nil;
				ID = 0;
			end
		elseif ( time%13 == 0 or time%10 == 0 or time%7 == 0 ) then
			TimeLock = true;
		end
	end
end

function Lua_Zone21_Boss5_TimeCheck( Boss )--計時器
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss5_Global[RoomID];
	local level = ReadRoleValue( Boss, EM_RoleValue_PID )
	local Time = 0;
	local CrazyTime = { 480, 360 }
	Lua_Zone21_Boss5_Debuff( Boss )--每秒給震攝
	
	while true do
		sleep(10)
		Time = Time+1;
		if KS_InCombat(Boss) == true then
			if level < 3 and time >= CrazyTime[level] and CheckBuff( Boss, 620276 ) ~= true then--8分鐘狂暴
				ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS1_CRAZY]", 2 )
				AddBuff( Boss, 620276, 0, -1 )
				return;
			elseif time%30 == 0 then--每30秒檢查
				Lua_Zone21_Boss5_Debuff( Boss )--每秒給震攝
			end
		else
			return;
		end
	end
end

function Lua_Zone21_Boss5_SpellShare( SkillID, Lv )--施放分攤
	Sleep(30)
	local Boss = OwnerID();
	local TID;

	local Hate = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)				
	while table.getn(Hate) > 0 do
		local Rnd = rand( table.getn(Hate) )+1;
		if	CheckID( Hate[Rnd] ) == true and 
			ReadRoleValue( Hate[Rnd], EM_RoleValue_IsDead ) == 0 and
			CheckBuff( Hate[Rnd], 620486 ) ~= true and--被追逐者
			CheckBuff( Hate[Rnd], 620479 ) ~= true then--隨機目標
		
			TID = Hate[Rnd];
			break
		end
		table.remove( Hate, Rnd );
	end
	
	CallPlot( Boss, "Lua_Zone21_Boss5_SetLock", 3 )
	TID = TID or ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS6_SKILL_03]", 2 )--訊息
	CastSpellLv( Boss, TID, SkillID, Lv );--施放技能
end

function Lua_Zone21_Boss5_CreateObj()--產生斧/盾
	DebugMsg(0,0,"ObjCreate")
	local Obj = OwnerID();
	local RoomID = ReadRoleValue( Obj, EM_RoleValue_RoomID );
	local Global = Zone21_Boss5_Global[RoomID];
	Global["ObjTarget"] = Global["ObjTarget"] or ReadRoleValue( Global["Boss"], EM_RoleValue_AttackTargetID );
	Hide(Obj);
	SetModeEx( Obj, EM_SetModeType_Fight, false );
	SetModeEx( Obj, EM_SetModeType_Move, true );
	SetModeEx( Obj, EM_SetModeType_HideName, true );
	SetModeEx( Obj, EM_SetModeType_ShowRoleHead, false );
	SetModeEx( Obj, EM_SetModeType_NotShowHPMP, true );
	SetModeEx( Obj, EM_SetModeType_Strikback , true )		-- 反擊
	Sleep(2)
	Show(Obj, RoomID );
	WriteRoleValue( Obj, EM_RoleValue_IsWalk, 0 )
	WriteRoleValue( Obj, EM_RoleValue_Register1, Global["ObjTarget"] );
	MoveToFlagEnabled( obj, false );
	SetPlot( Obj, "dead", "Lua_Zone21_Boss5_ObjDead", 0 )
	CallPlot( Obj, "Lua_Zone21_Boss5_ObjMove", Global["ObjTarget"] );
	Global["ObjTarget"] = nil;
	DebugMsg(0,0,"ObjCreate End")
end


function Lua_Zone21_Boss5_CreateMstCheck()--產生小怪檢查
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss5_Global[RoomID];
	if Global["MstNum"] < 2 then
		local X = ReadRoleValue( Boss, EM_RoleValue_X );
		local Y = ReadRoleValue( Boss, EM_RoleValue_Y );
		local Z = ReadRoleValue( Boss, EM_RoleValue_Z );
		local Rnd = { 50, -50 }
		local Obj = CreateObj( Zone21_Boss5_Global["MstID"], X+Rnd[rand(2)+1], Y, Z+Rnd[rand(2)+1], 0, 1 )--小怪
		MoveToFlagEnabled( obj, false );
		WriteRoleValue( Obj, EM_RoleValue_IsWalk, 0 )
		AddToPartition( Obj, RoomID );
		SetPlot( Obj, "dead", "Lua_Zone21_Boss5_ObjDead", 0 )
		CallPlot( Obj, "Lua_Zone21_Boss5_ObjMove", nil, "Mst" );
		Global["MstNum"] = Global["MstNum"] +1;
	end
end

function Lua_Zone21_Boss5_Debuff( Boss )--每秒給震攝	
	local Player = SearchRangePlayer( Boss, 500 );
	local Num = table.getn(Player);
	for i=0, Num-1 do
		if CheckBuff( Player[i], 620478 ) ~= true and GetDistance( Player[i], Boss ) < 500  then
			SysCastSpellLv( Player[i], Boss, 496946, 0 );--仇恨
			SysCastSpellLv( Boss, Player[i], 496946, 0 );--仇恨
			AddBuff( Player[i], 620478, 0, -1 );--每秒給震攝
		end
	end
end

function Lua_Zone21_Boss5_SetLock( time, LockFight )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss5_Global[RoomID];
	StopMove( Global["Boss"], false )
	Sleep(5)
	SetModeEx( Global["Boss"], EM_SetModeType_Move, false )
	if LockFight then
		SetModeEx( Global["Boss"], EM_SetModeType_Fight, false )
	end
	Sleep(time*10)
	SetModeEx( Global["Boss"], EM_SetModeType_Move, true )
	SetModeEx( Global["Boss"], EM_SetModeType_Fight, true )
end

function Lua_Zone21_Boss5_Dead()--死亡
	local Boss= OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE21_BOSS6_DEAD]", 2 );
	if ReadRoleValue( Boss, EM_RoleValue_PID ) == 1 then
		local Actor = kg_GetPosRX( Boss, 118926 );
		Zone21_Boss5_Global[RoomID]["Actor"] = Actor;
		AddToPartition( Actor, RoomID )
	end
	
	for i=1, 2 do
		CallPlot( Zone21_Boss5_Global[RoomID]["Door"][i], "Lua_Zone21_CloseDoor", false, Boss )--關門
		--DelFromPartition( Zone21_Boss5_Global[RoomID]["Door"][i] );
	end
	
	local Player = SetSearchAllPlayer( RoomID );
	local ID;
	for i=1, Player do
		ID = GetSearchResult();
		CancelBuff( ID, 620478 );--清除每秒給震攝
		CancelBuff( ID, 620486 );--清除被追逐者
		CancelBuff( ID, 620482 );--小怪緩速
	end
	
	--Zone21_Boss5_Global[RoomID] = {};
	return true;
end

function Lua_Zone21_Boss5_Reset()--重置
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone21_Boss5_Global[RoomID];
	CallPlot( Global["Door"][1], "Lua_Zone21_CloseDoor", false, Global["Boss"] )--關門
	--DelFromPartition( Global["Door"][1] );--前門關閉

	local Player = SetSearchAllPlayer( RoomID );
	local ID;
	for i=1, Player do
		ID = GetSearchResult();
		CancelBuff( ID, 620479 );--君王敕令
		CancelBuff( ID, 620478 );--清除每秒給震攝
		CancelBuff( ID, 620486 );--清除被追逐者
		CancelBuff( ID, 620482 );--小怪緩速
	end
	
	local BuffTable = {};
	for i = 1 , BuffCount(Global["Boss"] ) do
		table.insert( BuffTable, BuffInfo( Global["Boss"] , i-1, EM_BuffInfoType_BuffID) );
	end

	for i=1, table.getn(BuffTable) do
		CancelBuff( Global["Boss"]  , BuffTable[i] )
		--DebugMsg( 0,0,"BuffID = "..BuffTable[i] )
	end
	
	SetStopAttack( Global["Boss"] );
	ClearHateList( Global["Boss"], -1 );
	WriteRoleValue( Global["Boss"], EM_RoleValue_HP, ReadRoleValue( Global["Boss"], EM_RoleValue_MaxHP ) );--滿血
	SetModeEx( Global["Boss"], EM_SetModeType_Move, true )
	SetModeEx( Global["Boss"], EM_SetModeType_Fight, true )
	
	if ReadRoleValue( Global["Boss"], EM_RoleValue_IsDead ) == 1 then
		WriteRoleValue( Global["Boss"], EM_RoleValue_IsDead, 0 )
		AddToPartition( Global["Boss"], RoomID )		
	else
		ks_resetObj( Global["Boss"], 5 );
	end
end

function Lua_Zone21_Boss5_ChangePhase()--切換階段	
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = Zone21_Boss5_Global[RoomID];
	LockHP( Boss, 0, "" );
	Global["Phase"] = 2;
	Global["AxeNum"] = 0;
	Global["ShieldNum"] = 0;
	Global["MstNum"] = 0;
end

function Lua_Zone21_Boss5_ObjDead()--死亡
	local OID = OwnerID();
	local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID );
	local Global = Zone21_Boss5_Global[ReadRoleValue( OID, EM_RoleValue_RoomID)];
	local Hate = ReadRoleValue( OID, EM_RoleValue_Register1 );
	local ObjType = { };
	ObjType[105808] = "Axe"; --斧
	ObjType[105809] = "Shield"; --盾
	ObjType[105522] = "Mst";--小怪
	
	CancelBuff( Hate, 620486 )
	Global[ObjType[OrgID].."Num"] = Global[ObjType[OrgID].."Num"]-1;
	DelObj( OID );
	return false
end

function Lua_Zone21_Boss5_ObjMove( TID, ObjType )--物件移動
	local OID = OwnerID();
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID );
	local Global = Zone21_Boss5_Global[RoomID];
	local SkillID = Zone21_Boss5_Global["SkillID"]
	local Lv = Zone21_Boss5_Global["Lv"];
	local SetHate = false
	
	if ObjType == "Mst" then --小怪
		TID = Lua_Zone21_Boss5_MstAttack( Global["Boss"] );--小怪衝鋒
	else
		SysCastSpellLv( TID, OID, 495767, 0 );--最高級挑釁
		if ReadRoleValue( OID, EM_RoleValue_OrgID ) == 105808 then
			ObjType = "Axe";
			AddBuff( OID, 620495, 0, -1 )
		else
			ObjType = "Shield";
			AddBuff( OID, 620496, 0, -1 )
		end
	end
	
	while true do
		if KS_InCombat( Global["Boss"] ) ~= true or GetModeEx( OID, EM_SetModeType_Move ) == false then
			ks_WaitToDie( 1 );--Time時間  X秒後自己殺自己
			return
		end
		
		if ObjType ~= "Mst" and GetDistance( OID, Global["Boss"] ) <= 35 and KS_CheckBuffLV( OID, 508176) < 2 then
			AddBuff( OID, 508176, 0, -1 )--離王太近加速15%
		end
		
		if CheckID( TID ) == true and GetDistance( OID, TID ) < 25 and CheckBuff( TID, 501546 ) == true then--無敵BUFF
			CastSpell( OID, OID, 498102 )--特效
			CancelBuff( TID, 620486 )--緊追不捨
			CancelBuff( OID, 620495 )--斧特效
			CancelBuff( OID, 620496 )--盾特效
			SetModeEx( OID, EM_SetModeType_Move, false );
			ks_WaitToDie( 1 );--Time時間  X秒後自己殺自己
			break;
		end
		
		if 	TID == 0 or 
			CheckID( TID ) ~= true or
			ReadRoleValue( TID, EM_RoleValue_IsDead ) == 1 then
			
			DebugMsg(0,0,"SelectHate")
			CancelBuff( TID, 620486 )
			TID = nil
			local Hate = KS_GetHateList( Global["Boss"], 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)				
			while table.getn(Hate) > 0 do
				local Rnd = rand( table.getn(Hate) )+1;
				if	CheckID( Hate[Rnd] ) == true and 
					ReadRoleValue( Hate[Rnd], EM_RoleValue_IsDead ) == 0 and
					CheckBuff( Hate[Rnd], 620486 ) ~= true and--被追逐者
					CheckBuff( Hate[Rnd], 620479 ) ~= true then--君王敕令
					TID = Hate[Rnd];
					break
				end
				table.remove( Hate, Rnd );
			end
			
			TID = TID or ReadRoleValue( Global["Boss"], EM_RoleValue_AttackTargetID );
			WriteRoleValue( OID, EM_RoleValue_Register1, TID );
			SetHate = true
			Sleep(1)
		end
		
		if SetHate == true or ReadRoleValue( OID, EM_RoleValue_AttackTargetID ) ~= TID then
			DebugMsg(0,0,"SetHate")			
			if ObjType ~= "Mst" then
				CancelBuff( OID, 507181 )
				ClearHateList( OID, -1 )
				Sleep(1)
				AddBuff( TID, 620486, 0, -1 );--緊追不捨
				SysCastSpellLv( TID, OID, 495767, 0 );--最高級挑釁
			else
				SysCastSpellLv( TID, OID, 496946, 0 );--仇恨
			end
			Sleep(1)
			SetHate = false
		end
				
		if ObjType == "Axe" then
			SysCastSpellLv( OID, OID, SkillID[5], Lv[5] );--斧攻擊
			CallPlot( OID, "Lua_Zone21_Boss5_CreateFire", OID )--產生黑火
			Sleep(6 - KS_CheckBuffLV( OID, 508176) );
		elseif ObjType == "Shield" then
			SysCastSpellLv( OID, OID, 498083, 0 );--盾攻擊
			Sleep(6 - KS_CheckBuffLV( OID, 508176) );
		else
			SysCastSpellLv( OID, OID, 498076, 0 );--小怪緩速
			Sleep(10);
		end
	end
end

function Lua_Zone21_Boss5_CreateFire( ObjSite1, ObjSite2 )--產生黑火
	local RoomID = ReadRoleValue( ObjSite1, EM_RoleValue_RoomID );
	local Ox = ReadRoleValue( ObjSite1, EM_RoleValue_X );
	local Oy = ReadRoleValue( ObjSite1, EM_RoleValue_Y );
	local Oz = ReadRoleValue( ObjSite1, EM_RoleValue_Z );
	local Num = 1;
	local radian
	if ObjSite2 ~= nil then
		local Tx = ReadRoleValue( ObjSite2, EM_RoleValue_X );
		local Tz = ReadRoleValue( ObjSite2, EM_RoleValue_Z );
		local Dir = CalDir( Tx-Ox, Tz-Oz );
		local Dis = GetDistance( ObjSite1, ObjSite2 );
		Num = math.floor(Dis/35);
		radian = (math.pi/180)*Dir;--徑度
		local time = math.floor(Dis/100)*3
		DebugMsg(0,0,"wait time = "..(30+time))
		Sleep(30+time )
	end
	
	local Obj;
	for i=1, Num do
		if ObjSite2 ~= nil then
			if i == Num then
				break;
			end
			Obj = CreateObj( 105521, Ox+(40*i*math.cos(radian)), Oy, OZ - (40*i*math.sin(radian)), 0, 1 );--黑火
		else
			Obj = CreateObj( 105521, Ox, Oy, OZ, 0, 1 );--黑火
		end
		
		SetModeEx( Obj, EM_SetModeType_Fight, false );
		SetModeEx( Obj, EM_SetModeType_Mark, false );
		SetModeEx( Obj, EM_SetModeType_HideName, true );
		SetModeEx( Obj, EM_SetModeType_ShowRoleHead, false );
		SetModeEx( Obj, EM_SetModeType_NotShowHPMP, true );
		WriteRoleValue( Obj, EM_RoleValue_LiveTime, 10 );
		AddToPartition( Obj, RoomID );
		AddBuff( obj, 620485, 0, -1 );--特效
		BeginPlot( obj, "Lua_Zone21_Boss5_Fire", 0 )
		if Num > 1 then
			Sleep(3)
		end
	end
end

function Lua_Zone21_Boss5_MstAttack( Boss )--小怪衝鋒
	Sleep(30)
	local OID = OwnerID();
	local TID = ReadRoleValue( OID, EM_RoleValue_AttackTargetID );
	local SkillID = Zone21_Boss5_Global["SkillID"];
	local Lv = Zone21_Boss5_Global["Lv"];
	
	if TID == 0 and CheckID( Boss ) == true then		
		local Hate = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)				
		while table.getn(Hate) > 0 do
			local Rnd = rand( table.getn(Hate) )+1;
			if	CheckID( Hate[Rnd] ) == true and 
				ReadRoleValue( Hate[Rnd], EM_RoleValue_IsDead ) == 0 and
				CheckBuff( Hate[Rnd], 620486 ) == true then--隨機目標
					
				TID = Hate[Rnd];
				break
			else
				table.remove( Hate, Rnd );
			end
		end
		if TID == 0 then
			TID = ReadRoleValue( Boss, EM_RoleValue_AttackTargetID );
		end
		SetAttack( OID, TID );
		CastSpellLv( OID, TID, SkillID[8], Lv[8] );--小怪衝鋒
	end
	return TID;
end

function Lua_Zone21_Boss5_Fire()--黑火攻擊
	local OID = OwnerID();
	while true do
		SysCastSpellLv( OID, OID, 498080, 0 )
		sleep(7)
	end
end

function Lua_Zone21_Boss5_ShareDmg()--分攤傷害
	local Boss = OwnerID();
	local TID = TargetID();
	local Player = SearchRangePlayer( TID, 50 );
	local Num = table.getn(Player);
	for i=0, Num-1 do
		if CheckBuff( Player[i], 620479 ) == true then--是否有吸收
			Num = Num-1;
		end
	end
	if Num < 1 then Num = 1; end
	local Skill = Zone21_Boss5_Global["Lv"];
	local Lv = math.floor(Skill[3]/Num);
	DebugMsg(0,0,"ShareNum = "..Num..";  Lv = "..Lv )
	for i=0, table.getn(Player)-1 do
		SysCastSpellLv( Boss, Player[i], 498071, Lv );--施放技能
	end
end

function Lua_Zone21_Boss5_ShareDmgCheck()--分攤傷害檢查
	local TID = TargetID();
	if ks_NoGM( TID ) == false then--防GM
		return false;
	end
	if CheckBuff( TID, 620479 ) == true then
		local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID );
		local Global = Zone21_Boss5_Global;
		SysCastSpellLv( Zone21_Boss5_Global[RoomID]["Boss"], TID, Global["SkillID"][9], Global["Lv"][9] )--Debuff 範圍傷害
	end
	return true;
end

function Lua_Zone21_Boss5_AddDeBuff()--震攝效果
	local OID = OwnerID();
	local BuffID = 620477;
	AddBuff( OID, BuffID, 0, -1 );--震攝
	local Lv = KS_CheckBuffLV( OID, BuffID );
	if Lv > 0 then
		AddRoleValue( OID, EM_RoleValue_MP, ReadRoleValue( OID, EM_RoleValue_MaxMP )*(-0.01)*Lv );
		AddRoleValue( OID, EM_RoleValue_SP, (-5)*LV );
	end
end

function Lua_Zone21_Boss5_AxeCheck( mode )--物件攻擊檢查
	local OID = OwnerID();
	local TID = TargetID();
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	local Hate = ReadRoleValue( OID, EM_RoleValue_Register1 );
	if 	OID == TID or 
		ks_NoGM( TID ) == false or 
		ReadRoleValue( TID, EM_RoleValue_IsDead ) == 1 then
		return false end
	
	if mode == 1 then--非致死傷害
		if OrgID == 105809 and Hate ~= 0 and GetModeEx( OID, EM_SetModeType_Move ) == true then--目標為盾
			CancelBuff( Hate, 620486 )--緊追不捨
			CancelBuff( ReadRoleValue( TID, EM_RoleValue_Register1 ), 620486 )--緊追不捨
			WriteRoleValue( OID, EM_RoleValue_Register1, 0 );
			WriteRoleValue( TID, EM_RoleValue_Register1, 0 );
			CancelBuff( TID, 620496 )--盾特效
			CancelBuff( OID, 620495 )--斧特效
			SetModeEx( TID, EM_SetModeType_Move, false );
			SetModeEx( OID, EM_SetModeType_Move, false );
			CallPlot( OID, "Lua_Zone21_Boss5_AxeBoom", 0 );
			return false;
		elseif TID ~= Hate and ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 then--非鎖定的玩家
			return true;
		end
		return false;
	elseif mode == 2 and TID == Hate then--致死傷害判斷
		CancelBuff( Hate, 620486 )--緊追不捨
		CancelBuff( OID, 620495 )--斧特效
		SetModeEx( OID, EM_SetModeType_Move, false );
	end
	return false;
end

function Lua_Zone21_Boss5_AxeBoom()--斧盾相撞
	local OID = OwnerID()
	ScriptMessage( OID, -1 , 2 , "[SC_ZONE21_BOSS6_BOOM]", 2 );--斧盾相撞
	SysCastSpellLv( OID, OID, 498082, Zone21_Boss5_Global["Lv"][6] );--斧盾碰撞
end

function Lua_Zone21_Boss5_ShieldCheck()--物件攻擊檢查
	local OID = OwnerID();
	local TID = TargetID();
	local Hate = ReadRoleValue( OID, EM_RoleValue_Register1 );
	if 	OID == TID or 
		ks_NoGM( TID ) == false or 
		ReadRoleValue( TID, EM_RoleValue_IsDead ) == 1 then
		return false end
	
	if Hate ~= 0 and TID == Hate then
		AddBuff( TID, 620494, 1, -1 )--非GM給他暈眩
		CancelBuff( Hate, 620486 )--緊追不捨
		WriteRoleValue( OID, EM_RoleValue_Register1, 0 );
		SetModeEx( OID, EM_SetModeType_Move, false );
		CancelBuff( OID, 620496 )--盾特效
		return false;
	end
	return true;
end


function Lua_Zone21_Boss5_AbsorbCheck()--吸收檢查
	local OID = OwnerID();
	if CheckBuff( OID, 620479 ) == true then
		AddBuff( OID, 620480, 0, -1 )
	end
end

function Lua_Zone21_Boss5_AbsorbOver()--吸收消失
	if Zone21_Boss5_Global == nil then return end
	local OID = OwnerID();
	local BuffID = 620480;--吸收檢查用
	local Lv = KS_CheckBuffLV( OID, BuffID );
	if Lv < 9 then--取得指定物件身上BUFF等級
		local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID );
		local Global = Zone21_Boss5_Global[RoomID];
		if Global["Boss"] ~= nil and CheckID( Global["Boss"] ) == true then
			AddBuff( Global["Boss"], 620481, 0, -1 )--給予增益
			SysCastSpellLv( Global["Boss"], OID, 498085, 0 )--清除正面Buff
		end
	end
	CancelBuff( OID, BuffID )
end