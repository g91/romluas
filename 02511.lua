--==============企劃設定變數==============--

function Lua_Zone23_Boss6_GlobalSet()--企劃變數設定
	Zone23_Boss6_Global = {}
	local Global = Zone23_Boss6_Global
	Global["FlagID"] = 780983;--物件產生旗標
	Global["HideTime"] = 70 --每X秒進入隱形
	
	Global["SkillID"] = {}--法術集合
	Global["SkillID"][1] = 498407--單體攻擊
	Global["SkillID"][2] = 498408--前方扇形
	Global["SkillID"][3] = 498409--範圍AE
	Global["SkillID"][4] = 498411--能源彈
	Global["SkillID"][6] = 498416--單體攻擊隱形版
	
	Lua_Zone23_Boss6_GlobalLevel()--難度設定
end

function Lua_Zone23_Boss6_GlobalLevel( )--難度設定
	local level = ReadRoleValue( OwnerID(), EM_RoleValue_PID )
	local Global = Zone23_Boss6_Global
	
	--============ 困難 ============--
	Global["BossID"] = 106297--王
	Global["PupaeNum"] = 6--蟲蛹數量
	Global["TargetNum"] = 3--單體攻擊隱形版數量
		
	Global["Lv"] = {}--技能施放等級
	Global["Lv"][1] = 2--單體攻擊
	Global["Lv"][2] = 4--前方扇形
	Global["Lv"][3] = 50--範圍AE
	Global["Lv"][4] = 8--能源彈
	Global["Lv"][5] = 9--毀滅符文光束
	Global["Lv"][6] = 5--AT護盾
	Global["Lv"][7] = 0--酸液傷害
	Global["Lv"][8] = 20--單體攻擊隱形版
	Global["Lv"][9] = 3--AT護盾(弱化版)
end

--==============以下AI處理 別改它==============--

function Lua_Zone23_Boss6_Set( RoomID )
	if Zone23_Boss6_Global == nil then
		Lua_Zone23_Boss6_GlobalSet()
	end
	if Zone23_Boss6_Global[RoomID] == nil then
		Zone23_Boss6_Global[RoomID] = {}
	end
end

function Lua_Zone23_Boss6_Begin()--5王死亡觸發
	local Queen = OwnerID()
	local RoomID = ReadRoleValue( Queen, EM_RoleValue_RoomID );
	Lua_Zone23_Boss6_Set(RoomID)
	
	local FlagID =  Zone23_Boss6_Global["FlagID"]
	local Global = Zone23_Boss6_Global[RoomID]
	Global["Ctrl"] = LuaFunc_CreateObjByObj( 119601, Queen )
	ks_ActorMode( Global["Ctrl"] , true, 0 )--設定演戲用NPC
	
	Global["FakeBoss"] = kg_GetPosRX( {FlagID, 0}, 119596 );
	SetModeEx( Global["FakeBoss"] , EM_SetModeType_Move, false );
	SetModeEx( Global["FakeBoss"] , EM_SetModeType_Fight, false );
	SetModeEx( Global["FakeBoss"] , EM_SetModeType_Mark, false );
	SetModeEx( Global["FakeBoss"] , EM_SetModeType_ShowRoleHead, false );
	SetModeEx( Global["FakeBoss"] , EM_SetModeType_NotShowHPMP, true );

	SysCastSpellLv( Global["Ctrl"], Global["FakeBoss"], 498404, 0 )--表演用噴毒
	AddToPartition( Global["FakeBoss"], RoomID );
	
	Lua_Zone23_Boss6_CreatePupae()--產生蟲蛹
	Lua_Zone23_Boss6_CreateDeathLaser()--產生雷射參考點
	Lua_Zone23_Boss6_CreatePowerBomb()--產生能源彈參考點
	CallPlot( Global["Ctrl"], "Lua_Zone23_Boss6_Ctrl", 0 )
end

function Lua_Zone23_Boss6_Ctrl()--中控
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue( Ctrl, EM_RoleValue_RoomID );
	local Global = Zone23_Boss6_Global[RoomID]
	local FlagID =  Zone23_Boss6_Global["FlagID"]

	local BaseX = ReadRoleValue( Global["Ctrl"], EM_RoleValue_X )
	local BaseY = ReadRoleValue( Global["Ctrl"], EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( Global["Ctrl"], EM_RoleValue_Z )

	local actNum = rand(6)+15
	local splite = actNum%36
	local itor = 360/splite
	local radiusNum = math.floor( actNum/splite )
	local count = 1
	local act = {}
	for theta=0, 359, itor do
		for i=1, radiusNum do
			local site = math.random( 30, 200 )
			local X = BaseX + site*math.cos(math.pi*2*( (theta+site%20)/360) )
			local Z = BaseZ + site*math.sin(math.pi*2*( (theta+site%20)/360) )
			local Y = GetHeight( X  , BaseY , Z  )
			act[count] = CreateObj( 119601, X, Y, Z, 0, 1 )
			ks_ActorMode( act[count] , true, 0 )--設定演戲用NPC
			WriteRoleValue( act[count], EM_RoleValue_LiveTime, 2 )
			SysCastSpellLv( Global["Ctrl"], act[count], 498404, 0 )--表演用噴毒
			count = count+1
			sleep(rand(3))
		end
	end
	
	SysCastSpellLv( Global["FakeBoss"],Global["FakeBoss"], 850069, 0 )--表演用噴毒
	CallPlot( Ctrl, "ks_TransTo", FlagID, 1 )--傳送到特定位置
	ScriptMessage( Ctrl, -1 , 2 , "[SC_ZONE23_BOSS6_HI]", 2 );--被5王毒噴到現身
	Global["Boss"] = kg_GetPosRX( {FlagID, 0}, Zone23_Boss6_Global["BossID"] );
	SetModeEx( Global["Boss"] , EM_SetModeType_Fight, false );
	SetModeEx( Global["Boss"] , EM_SetModeType_Searchenemy, false );
	AddToPartition( Global["Boss"], RoomID );
	SetPlot( Global["Boss"], "dead", "Lua_Zone23_Boss6_Dead", 0 );--死亡判斷
	
	CastSpell( Global["Boss"], Global["Boss"], 498410 )--採集資料
	Sleep(20)
	SetModeEx( Global["Boss"], EM_SetModeType_Fight, true );
	ScriptMessage( Ctrl, -1 , 0 , "[SC_ZONE23_BOSS6_NOTHING]", "0xffffff80" );--(左下角訊息框)幸好...似乎它尚未察覺行蹤已經曝露
end


function Lua_Zone23_Boss6_ResetBoss()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone23_Boss6_Global[RoomID]
	if CheckID( Global["Boss"] ) and 
	ReadRoleValue( Global["Boss"], EM_RoleValue_OrgID ) == Zone23_Boss6_Global["BossID"] then
		ks_resetObj( Global["Boss"], 0 );
	else
		Global["Boss"] = kg_GetPosRX( {Zone23_Boss6_Global["FlagID"], 0}, Zone23_Boss6_Global["BossID"] );
		AddToPartition( Global["Boss"], RoomID );
		SetPlot( Global["Boss"], "dead", "Lua_Zone23_Boss6_Dead", 0 );--死亡判斷
	end
end

function Lua_Zone23_Boss6_Fight()--開始戰鬥
	local Boss = OwnerID()
	if ReadRoleValue( Boss, EM_RoleValue_PID ) == 0 then
		CallPlot( Boss, "Lua_Zone23_Boss6_AI_Act", 0 )
	else
		CallPlot( Boss, "Lua_Zone23_Boss6_AI", true )
	end
end

function Lua_Zone23_Boss6_AI_Act()--AI
	local Boss = OwnerID()
	WriteRoleValue( Boss, EM_RoleValue_PID, 1 )
	LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_HP ) , "" );--索血
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE23_BOSS6_FIGHT]", 2 );--本體受到攻擊...一級匿蹤系統失靈...切換為戰鬥模式
	Sleep(10)
	SetModeEx( Boss, EM_SetModeType_Searchenemy, true );
	Lua_Zone23_Boss6_AI()--AI
end

function Lua_Zone23_Boss6_AI( ShowMsg )--AI
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local Global = ZONE23_BOSS6_Global[RoomID];
	local FlagID =  Zone23_Boss6_Global["FlagID"]
	local SkillID = ZONE23_BOSS6_Global["SkillID"]
	local Lv = ZONE23_BOSS6_Global["Lv"];
	local Time = 0
	local HideTime = 0
	local CastTimeRecord=5
	Global["Phase"] = 1
	Global["BossShow"] = true
	Global["ChangeType"] = false
	
	AddBuff( Boss, 502707, 0, -1 )--戰鬥不回血
	LockHP( Boss, ReadRoleValue( Boss, EM_RoleValue_MaxHP )*0.6 , "Lua_Zone23_Boss6_Phase" );--階段改變
	if ShowMsg then
		ScriptMessage( Global["FakeBoss"], -1 , 2 , "[SC_ZONE23_BOSS6_START]", 2 );--開始
	end
	Lua_Zone23_Boss6_SetPupaePos()--設定蟲蛹位置
	
	CallPlot( Global["Ctrl"], "Lua_Zone23_Boss6_SetTimer", 0 )--設定計時器
	
	while true do
		sleep(10)
		if Global["BossShow"] then--現身
			if CastTimeRecord<4 then
				WriteRoleValue(Global["Boss"],EM_RoleValue_Register3,1)--是否削弱
			end
			CastTimeRecord=5
			HideTime = 0
			Time = Time+1;--時間遞增
			--DebugMsg(0,RoomID,"Time = "..Time )

			if Global["Phase"] > 1 and Time%20 == 0 then--毀滅光束
				Global["Point"] = 0
				sleep(5)
				ScriptMessage( Global["FakeBoss"], -1 , 2 , "[SC_ZONE23_BOSS6_DEATH]", 2 );--死亡光束
				CastSpell( Global["Boss"], Global["Boss"], 498413 )--純特效
				Ks_ObjSetLock( 7, true  )--設定鎖定時間, 是否可砍殺
				sleep(5)
			elseif Global["Phase"] == 3 and Time%15 == 0 then--能源彈
				Global["Point"] = 0
				sleep(5)
				ScriptMessage( Global["FakeBoss"], -1 , 2 , "[SC_ZONE23_BOSS6_POWER]", 2 );--能源彈
				CastSpellLv( Global["Boss"], Global["Boss"], SkillID[4], Lv[4] )--能源彈純動作
				Ks_ObjSetLock( 10  )--設定鎖定時間, 是否可砍殺				
			elseif (Time%5 == 0 and Time>10) or (Time==7) then
				CastSpellLv( Boss, Boss, SkillID[3], Lv[3] )--範圍AE
				Ks_ObjSetLock( 3 )--設定鎖定時間, 是否可砍殺
			elseif Time%7 == 0 then
				if Rand(2) == 0 then
					CastSpellLv( Boss, ReadRoleValue( Boss, EM_RoleValue_AttackTargetID ), SkillID[1], Lv[1] )
					Ks_ObjSetLock( 1 )--設定鎖定時間, 是否可砍殺
				else
					CastSpellLv( Boss, Boss, SkillID[2], Lv[2] )
					Ks_ObjSetLock( 2 )--設定鎖定時間, 是否可砍殺
				end
			end
		else
			Time = 0
			if Global["ChangeType"] then
				Global["ChangeType"] = false
				Lua_Zone23_Boss6_Stealth( true )--現身
			elseif HideTime%5 == 0 then
				SetModeEx(Boss,EM_SetModeType_Move,false);
				CallPlot( Boss, "ks_TransTo", FlagID, 1, nil, 120 )--傳送到特定位置( Rnd = 隨機距離 min=最小距離 )
				Sleep(5)
				CastSpell(Boss,Boss,850303);--持續施法替代攻擊
				local x,y,z,dir=DW_Location(Boss);--要讓假的王追上去
				SetPos(Global["FakeBoss"],x,y,z,dir);
				Sleep(5)
				CastSpellLv( Global["FakeBoss"], Global["FakeBoss"], SkillID[6], Lv[8] )
				CastTimeRecord=0;
				if HideTime==5 then
					WriteRoleValue(Boss,EM_RoleValue_Register2,0); --Boss酸液免疫時段已過
				end
			elseif HideTime%9 == 0 then
				SysCastSpellLv( Global["FakeBoss"], Global["FakeBoss"], SkillID[3], Lv[3] )
			end
			if HideTime>5 then
				CastTimeRecord=CastTimeRecord+1
			end
			HideTime = HideTime+1
		end
	end
end

function Lua_Zone23_Boss6_HideAttackCheck()--隱藏攻擊
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ZONE23_BOSS6_Global[RoomID];
	local HatePlayer = KS_GetHateList( Global["Boss"], 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
	local T_Array = Ks_GetHateNum( HatePlayer, ZONE23_BOSS6_Global["TargetNum"] )--仇恨表中取特定數量
	--DebugMsg(0,0,"TArray = "..table.getn(T_Array) )
	for i=1, table.getn(T_Array) do
		pushMagicShootTarget( T_Array[i] )
	end
end

function Lua_Zone23_Boss6_CreatePowerBomb()--產生能源彈參考點
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ZONE23_BOSS6_Global[RoomID];
	Global["Power"] = {}
	for i=1, 60 do--10波 * 6個目標
		Global["Power"][i] = CreateObj( 119599, 0, 0, 0, 0, 1 )
		ks_ActorMode( Global["Power"][i], true, 0 )--設定演戲用NPC
	end
end

function Lua_Zone23_Boss6_PowerBombCheck()--能源彈
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ZONE23_BOSS6_Global[RoomID];
	local point = Global["Point"]

	local HatePlayer = KS_GetHateList( Global["Boss"], 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
	local T_Array = Ks_GetHateNum( HatePlayer, 6 )--仇恨表中取特定數量
	for i=1, table.getn(T_Array) do
		local TID = Role:new( T_Array[i] )
		point = point+1
		AddToPartition( Global["Power"][point], RoomID )
		SetPos( Global["Power"][point], TID:X(), TID:Y(), TID:Z(), 0 )
		CallPlot( Global["Power"][point], "Lua_Zone23_Boss6_PowerBombDo", Global["Boss"] )
		pushMagicShootTarget( Global["Power"][point] )
	end
	Global["Point"] = point
end

function Lua_Zone23_Boss6_PowerBombDo( Boss )
	local Bomb = OwnerID()
	local dis = GetDistance( Bomb, Boss )
	Sleep(math.floor(dis/50)*4+2)
	SysCastSpellLv( Boss, Bomb, 498417, ZONE23_BOSS6_Global["Lv"][4] )--爆炸特效與傷害
	Sleep(30)
	DelFromPartition( Bomb )
end

function Lua_Zone23_Boss6_CreateDeathLaser()--產生雷射參考點
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ZONE23_BOSS6_Global[RoomID];
	Global["Laser"] = {}
	for i=1, 12 do --3波 *4個目標
		Global["Laser"][i] = CreateObj( 119602, 0, 0, 0, 0, 1 )
		ks_ActorMode( Global["Laser"][i] , true, 0 )--設定演戲用NPC
	end
end

function Lua_Zone23_Boss6_DeathLaserCheck()--死亡光束
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = ZONE23_BOSS6_Global[RoomID];
	local _Boss = Role:new( Global["Boss"] )
	local point = Global["Point"]
	local Y = GetHeight( _Boss:X(), _Boss:Y(), _Boss:Z() )
	local HatePlayer = KS_GetHateList( Global["Boss"], 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
	local T_Array = Ks_GetHateNum( HatePlayer, 4 )--仇恨表中取特定數量
	
	local X = _Boss:X()
	local Z = _Boss:Z()	
	for i=1, table.getn(T_Array) do
		point = point+1
		local Tx = ReadRoleValue( T_Array[i], EM_RoleValue_X )
		local Tz = ReadRoleValue( T_Array[i], EM_RoleValue_Z )
		local radian = Ks_flaot( (math.pi/180)*CalDir( ( Tx-X ), ( Tz- Z ) ), 2 )--徑度
		local Cos = Ks_flaot( math.cos(radian), 2 )
		local Sin = Ks_flaot( math.sin(radian), 2 )
		AddToPartition( Global["Laser"][point], RoomID )
		SetPos( Global["Laser"][point], X+5*Cos, Y, Z - 5*Sin, 0 )--參考點位置
		CallPlot( Global["Laser"][point], "Lua_Zone23_Boss6_DeathLaserDo", Global["Boss"], Ks_ToString( Cos), Ks_ToString( Sin ) )
		pushmagicShootTarget( Global["Laser"][point] )
	end
	Global["Point"] = point
end

function Lua_Zone23_Boss6_DeathLaserDo( Obj, Cos, Sin )
	local OID = OwnerID()
	local _OID = Role:new( OID )

	SysCastSpellLv( Obj, OID, 498415,  0 )	--光束特效
	for i=1, 10 do
		if not KS_InCombat( Obj ) then
			DelFromPartition( OID )
			return
		end
		
		SysCastSpellLv( Obj, OID, 850064, ZONE23_BOSS6_Global["Lv"][5] )--爆炸特效與傷害
		Sleep(1)
		local X = _OID:X()+30*Cos
		local Z = _OID:Z()-30*Sin
		SetPos( OID, X, _OID:Y(), Z, 0 )
	end
	DelFromPartition( OID )
end

function Lua_Zone23_Boss6_Dead()--死亡
	local Boss = OwnerID()
	ScriptMessage( Boss, -1 , 2 , "[SC_ZONE23_BOSS6_DEAD]", 2 );--死亡
	
	SetModeEx( Boss, EM_SetModeType_Fight, false );		--無法砍殺
	SetModeEx( Boss, EM_SetModeType_NotShowHPMP, true )--不顯示HPMP
	SetModeEx( Boss, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Boss, EM_SetModeType_Searchenemy , false )	-- 索敵
	SetStopAttack( Boss );
	ClearHateList( Boss, -1 );
	WriteRoleValue( Boss, EM_RoleValue_PID, 2 )

	CallPlot( Boss , "Cl_Z23_Boss6_QuestFlag", 0 )
	if ReadRoleValue( Boss, EM_RoleValue_Register1 ) ~= 1 then
		WriteRoleValue( Boss , EM_RoleValue_Register1 , 1 )
		local Item = LuaFunc_CreateObjByObj( 106299, Boss )
		CallPlot( Item, "Lua_Zone23_Boss6_EndAct", Boss, TargetID() )
	end

	return false
end

function Lua_Zone23_Boss6_EndAct( Boss, Killer )--結束表演
	local Item = OwnerID()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone23_Boss6_Global[RoomID];
	local Player = SearchRangePlayer( Boss, 500 );
	for i=0, #Player-1 do
		if ReadRoleValue( Player[i], EM_RoleValue_IsDead ) == 0 then
			AddBuff( Player[i], 621002, 0, -1 );--逃離定身
		end
	end

	for i=1, Zone23_Boss6_Global["PupaeNum"] do
		if CheckID(Global["Pupae"][i]) then
			DelFromPartition( Global["Pupae"][i] )
		end
	end
	SysCastSpellLV( Item, Item, 498412 , 0  )
	Cl_Zone23_Boss7_Begin()
	Sleep(10)
	DelObj(Boss)
	KillID( Killer, OwnerID() )
end

function Lua_Zone23_Boss6_Phase()--階段改變
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	DebugMsg(0,RoomID,"Change Phase")
	local Global = ZONE23_BOSS6_Global[RoomID];
	
	Global["Phase"] = Global["Phase"]+1
	if Global["Phase"] < 3 then
		LockHP( Global["Boss"], ReadRoleValue( Global["Boss"], EM_RoleValue_MaxHP )*0.4 , "Lua_Zone23_Boss6_Phase" );--階段改變
	else
		LockHP( Global["Boss"], 0, "" )
	end
end

function Lua_Zone23_Boss6_Stealth( OnShow )--隱身
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone23_Boss6_Global[RoomID];
	local FlagID =  Zone23_Boss6_Global["FlagID"]
	OnShow = OnShow or false

	magicinterrupt( Global["Boss"] );
	SetModeEx( Global["Boss"] , EM_SetModeType_Show, OnShow );
	SetModeEx( Global["Boss"] , EM_SetModeType_Move, OnShow );
	SetModeEx( Global["Boss"] , EM_SetModeType_Fight, OnShow );
	SetModeEx( Global["Boss"] , EM_SetModeType_Mark, OnShow );

	if not OnShow then--隱形
		CastSpell(Global["Boss"],Global["Boss"],850303);--持續施法替代攻擊
		local Rate=math.floor(ReadRoleValue(Global["Boss"],EM_RoleValue_HP)/ReadRoleValue(Global["Boss"],EM_RoleValue_MaxHP))
		local x,y,z,dir=DW_Location(Global["Boss"]);
		WriteRoleValue(Global["Boss"],EM_RoleValue_Register2,1)	--EM_RoleValue_Register2=>作為剛進入隱身的記號
		DebugMsg(0,RoomID,"Hide")
		local count = BuffCount(Global["Boss"] )
		for i = 1 , count do
			CancelBuff( Global["Boss"]  , BuffInfo( Global["Boss"] , count-i, EM_BuffInfoType_BuffID) )
		end
		AddBuff( Global["Boss"], 502707, 0, -1 )--戰鬥不回血
		Global["BossShow"] = false
		ScriptMessage( Global["FakeBoss"], -1 , 2 , "[SC_ZONE23_BOSS6_HIDE]", 2 );--隱身
		--CallPlot( Global["Boss"], "ks_TransTo", FlagID, 0, nil, 300 )--傳送到特定位置( Rnd = 隨機距離 min=最小距離 )
	else
		WriteRoleValue(Global["Boss"],EM_RoleValue_Register2,0);	--重置剛隱身免疫酸的記號
		DebugMsg(0,RoomID,"Show")
		Global["BossShow"] = true
		ScriptMessage( Global["FakeBoss"], -1 , 2 , "[SC_ZONE23_BOSS6_SHOW]", 2 );--現身
		if ReadRoleValue(Global["Boss"],EM_RoleValue_Register3)==1 then--剛放完制裁
			AddBuff( Global["Boss"], 621021, Zone23_Boss6_Global["Lv"][9], -1 )--AT護盾(弱化)
			WriteRoleValue(Global["Boss"],EM_RoleValue_Register3,0);--重置剛放完聚能制裁的記號
		else
			AddBuff( Global["Boss"], 621021, Zone23_Boss6_Global["Lv"][6], -1 )--AT護盾
		end
		CallPlot( Global["Boss"], "Lua_Zone23_Boss6_ShieldCheck", 0 )--護盾檢查
	end
	

	if not OnShow then--隱形
		local HateTotal=HateListCount(Global["Boss"]);
		for Pos=0,HateTotal-1 do
			local Hater=HateListInfo(Global["Boss"],Pos , EM_HateListInfoType_GItemID);
			SetStopAttack(Hater);
		end
	end
end

function Lua_Zone23_Boss6_ShieldCheck()--護盾檢查
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone23_Boss6_Global[RoomID];
	for i=1, 10 do
		Sleep(10)
		if not CheckBuff( Global["Boss"], 621021 ) then--AT護盾
			ScriptMessage( Global["FakeBoss"], -1 , 2 , "[SC_ZONE23_BOSS6_SHIELD]", 2 );--盾爆了
			return
		end
	end
end

function Lua_Zone23_Boss6_SetTimer()--設定計時器
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone23_Boss6_Global[RoomID];
	local FlagID =  Zone23_Boss6_Global["FlagID"]
	local FlagX = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_X );
	local FlagZ = GetMoveFlagValue( FlagID , 0 , EM_RoleValue_Z );
	local Time = 0
	local HideTime = 0--現身60秒隱身
	
	while true do
		Sleep(10)
		Time = Time +1;
		--DeBugMSG(0,RoomID,"HateListCount="..HateListCount(Global["Boss"]));
		if ReadRoleValue( Global["Boss"], EM_RoleValue_PID ) == 2 then--BOSS死亡
			break
		end
		
		if	not KS_InCombat( Global["Boss"] )  or --是否戰鬥中
			KS_GetFlagDistance( Global["Boss"], FlagID, 0 ) > 500 then--與旗標距離(物件, 旗標ID, 旗標位置)
			ScriptMessage( Global["FakeBoss"], -1 , 2 , "[SC_Zone23_Boss6_EXIT]", 2 );--脫離戰鬥
			CallPlot( Global["Boss"], "ks_TransTo", FlagID, 0 )--傳送到特定位置
			CallPlot( Global["Boss"], "Lua_Zone23_Boss6_Reset", 0 );--重置
			return
		end
		
		if time >= 480 and CheckBuff( Global["Boss"], 623370 ) ~= true then--8分鐘狂暴
			ScriptMessage( Global["FakeBoss"], -1 , 2 , "[SC_Zone23_Boss6_CRAZY]", 2 )
			AddBuff( Global["Boss"], 623370, 0, -1 )
		end
		
		if not Global["BossShow"] then--隱身中
			HideTime = 0
			if	Lua_FlashHateList(Global["Boss"])==0  or --目標死光
				KS_GetFlagDistance( Global["Boss"], FlagID, 0 ) > 500 then--與旗標距離(物件, 旗標ID, 旗標位置)
				ScriptMessage( Global["FakeBoss"], -1 , 2 , "[SC_Zone23_Boss6_EXIT]", 2 );--脫離戰鬥
				CallPlot( Global["Boss"], "ks_TransTo", FlagID, 0 )--傳送到特定位置
				CallPlot( Global["Boss"], "Lua_Zone23_Boss6_Reset", 0 );--重置
				return
			end
			if ReadRoleValue(Global["Boss"],EM_RoleValue_Register2)==0 then--剛進入隱身
				local Hater
				for i=1, HateListCount( Global["Boss"] ) do
					Hater = HateListInfo( Global["Boss"] ,i-1 , EM_HateListInfoType_GItemID )
					if CheckBuff( Hater, 500933 ) and GetDistance( Global["Boss"], Hater ) <= 75 then--遊俠傾聽
						DebugMsg(0,RoomID,"Ranger to Show")
						Lua_Zone23_Boss6_Stealth( true )--現身
						break
					end
				end
			end
		elseif not CheckBuff( Global["Boss"], 621021 ) then--AT護盾
			HideTime = HideTime+1
		end
		
		if ( time == 5 or HideTime >= Zone23_Boss6_Global["HideTime"] ) and GetModeEx( Global["Boss"] , EM_SetModeType_Move ) then
			HideTime = 0
			DebugMsg(0,RoomID,"LongTime to Hide")
			Lua_Zone23_Boss6_Stealth()--隱身
			CallPlot(Global["Boss"],"ks_TransTo",FlagID, 1, nil, 120); 
		end
	end

end

function Lua_Zone23_Boss6_Reset()--重置
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone23_Boss6_Global[RoomID];
	local ResetPocisionFlag=780983;
	ScriptMessage( Global["FakeBoss"], -1 , 2 , "[SC_ZONE23_BOSS6_EXIT]", 2 );--隱身
	--CallPlot( Global["Door"][1], "Lua_CloseDoor", false, Global["Boss"] )--關門
	for i=1, Zone23_Boss6_Global["PupaeNum"] do
		if CheckID(Global["Pupae"][i]) then
			DelFromPartition( Global["Pupae"][i] )
		end
	end
	local Player = SetSearchAllPlayer( RoomID );
	local ID;
	for i=1, Player do
		ID = GetSearchResult();
		CancelBuff( ID, 620992 );--蟲蛹
	end
	
	SetModeEx( Global["Boss"] , EM_SetModeType_Mark, true );--無標記
	SetModeEx( Global["Boss"] , EM_SetModeType_Show, true );--看不到
	SetModeEx( Global["Boss"] , EM_SetModeType_Move, true );--看不到
	SetModeEx( Global["Boss"] , EM_SetModeType_Fight, true );--無法砍殺
	ks_resetObj( Global["Boss"], 5 );
	CastSpell( Global["Boss"], Global["Boss"], 498410 )--採集資料
	WriteRoleValue(Global["Boss"],EM_RoleValue_Register2,0);	--重置剛隱身免疫酸的記號
	WriteRoleValue(Global["Boss"],EM_RoleValue_Register3,0);	--重置剛放完聚能制裁的記號
	local x,y,z,dir=DW_Location(ResetPocisionFlag,0);
	SetPos(Global["Boss"],x,y,z,dir);
end

function Lua_Zone23_Boss6_CreatePupae()--產生蟲蛹
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone23_Boss6_Global[RoomID];
	
	Global["Pupae"] = {}
	for i=1, Zone23_Boss6_Global["PupaeNum"] do
		Global["Pupae"][i] = CreateObj( 119595, 0, 0, 0, 0, 1 )
		SetPlot( Global["Pupae"][i], "touch", "Lua_Zone23_Boss6_SetPupae", 30 )
		SetModeEx( Global["Pupae"][i] , EM_SetModeType_Move, false );
	end
end

function Lua_Zone23_Boss6_SetPupaePos()--設定蟲蛹位置
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	local Global = Zone23_Boss6_Global[RoomID];
	local BaseX = ReadRoleValue( Global["Ctrl"], EM_RoleValue_X )
	local BaseY = ReadRoleValue( Global["Ctrl"], EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( Global["Ctrl"], EM_RoleValue_Z )

	local splite = Zone23_Boss6_Global["PupaeNum"]%36
	local itor = 360/splite
	local radiusNum = math.floor( Zone23_Boss6_Global["PupaeNum"]/splite )
	local i = 1
	for theta=0, 359, itor do
		for j=1, radiusNum do
			local site = math.random( 30, 150 )
			local X = BaseX + site*math.cos(math.pi*2*( (theta+site%20)/360) )
			local Z = BaseZ + site*math.sin(math.pi*2*( (theta+site%20)/360) )
			local Y = GetHeight( X  , BaseY , Z  )
			AddToPartition( Global["Pupae"][i], RoomID )
			SetPos( Global["Pupae"][i], X, Y, Z, 0 )
			i = i+1
		end
	end
end

function Lua_Zone23_Boss6_SetPupae()--觸碰
	local OID = OwnerID() 	-- 玩家
	local TID = TargetID()  	-- 物件
	local RoomID = ReadRoleValue( TID, EM_RoleValue_RoomID )
	local Boss = Zone23_Boss6_Global[RoomID]["Boss"]
	
	if Boss ~= nil and CheckID(Boss) == true and not CheckBuff(OID, 620992 ) then--蟲蛹狀態
		if BeginCastBarEvent( OID, TID,"[SC_USING]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_Zone23_Boss6_TouchPupae" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_204638_0]", 0 )--不需使用
		ScriptMessage( OID, OID, 0,"[SC_204638_0]", 0 )--不需使用
	end
end

function Lua_Zone23_Boss6_TouchPupae( OID, CheckStatus )--執行劇情
	local TID = TargetID();
	local FlagID =  Zone23_Boss6_Global["FlagID"]
	
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- 成功
			AddBuff( OID, 620992, 0, -1 )--蟲蛹
			Hide(TID)
			CallPlot( TID, "ks_TransTo", TID, nil, nil, 50 )
			CallPlot( TID, "ks_resetObj", TID, 5 )--重置物件
		end
		EndCastBar( OID, CheckStatus );
	end	
end

function Lua_Zone23_Boss6_Acid()--酸液	
	CancelBuff( TargetID(), 620992 )--取消蟲蛹
	CallPlot( OwnerID(), "Lua_Zone23_Boss6_AcidLoop", 0 )
end

function Lua_Zone23_Boss6_AcidLoop()
	local Acid = OwnerID()
	local RoomID = ReadRoleValue( Acid, EM_RoleValue_RoomID)
	local Global = ZONE23_BOSS6_Global[RoomID];
	Hide(Acid);
	Sleep(10)
	Show(Acid, RoomID );
	AddBuff( Acid, 621012, 0, -1 )--特效
	
	for i=1, 40 do
		if not KS_InCombat( Global["Boss"] ) then
			DelObj(Acid)
			return
		end
		
		local Count = SetSearchRangeInfo( Acid, 50 )
		for j=1, Count do
			local GUID = GetSearchResult()
			if ReadRoleValue( GUID, EM_RoleValue_IsPlayer ) == 1 then
				AddBuff( GUID, 620994, 0, -1 )--酸液效果
			elseif GUID == Global["Boss"] and not Global["ChangeType"] and not CheckBuff( GUID, 621021 ) and ReadRoleValue(GUID,EM_RoleValue_Register2)==0 then
				DebugMsg(0,RoomID,"Acid to Show")
				Global["ChangeType"] = true --現身
			end
		end
		Sleep(10)
	end
end

function Lua_Zone23_Boss6_AcidCheck( mode )--酸液對象檢查
	mode = mode or false
	if OwnerID() == TargetID() or CheckBuff(TargetID(), 620994 ) then
		return mode
	end
	--DebugMsg(0,0,"GetBuff")
	return not mode
end