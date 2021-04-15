----------------------------------------------------------------------------
--↓BOSS重生與環境的相關劇情
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_Ctrl()
	--物件編號
	local FlagID = 781201 --旗標編號
	local BossID = 106640 --BOSS編號
	local DoorID = 106249 --阻擋門物件編號
	local DrugID = 120735 --藥劑物件編號
	
	--旗標
	local BossFlag = 1 --BOSS重生點旗標號
	local BeforeDoorFlagID = 0 --前門旗標號
	local AfterDoorFlagID = 2 --後門旗標號
	local DrugFlagTable = { 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 } --藥劑旗標號
	local CombatBegin = 0 --開戰旗標
	
	local CtrlCentral = OwnerID() --中央控制器
	local Sktalk = { "[SC_106640_01]" , "[SC_106640_02]" , "[SC_106640_04]" } --喊話字串
	
	local RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag(BossID , FlagID , BossFlag , 1 ) --生成Boss
	AddToPartition( Boss , RoomID )
	WriteRoleValue( CtrlCentral , EM_RoleValue_PID , Boss )
	WriteRoleValue( Boss , EM_RoleValue_PID , CtrlCentral )
	local BeforeDoor --前門，BOSS開戰會關
	local AfterDoor --後門，BOSS死亡才會開
	local DrugList = {} --藥劑物件清單
	local DrugRebirthTime = 30 --藥劑重生時間

	--生成後門
	AfterDoor = CreateObjByFlag( DoorID , FlagID , AfterDoorFlagID , 1 )
	SetModeEx( AfterDoor , EM_SetModeType_Mark , false ) --不可點選
	SetModeEx( AfterDoor , EM_SetModeType_HideName , false ) --不顯示名稱
	SetModeEx( AfterDoor , EM_SetModeType_NotShowHPMP , false ) --不顯示血條
	SetModeEx( AfterDoor , EM_SetModeType_Strikback , false ) --不會反擊
	SetModeEx( AfterDoor , EM_SetModeType_Move , false ) --不會移動
	SetModeEx( AfterDoor , EM_SetModeType_Fight , false ) --不可攻擊
	SetModeEx( AfterDoor , EM_SetModeType_Searchenemy , false ) --不會索敵
	SetModeEx( AfterDoor , EM_SetModeType_Obstruct , true ) --有阻擋效果
	AddToPartition( AfterDoor , RoomID)
	
	--生成藥劑物件
	for Count = 1 , #DrugFlagTable do
		DrugList[Count] = CreateObjByFlag( DrugID , FlagID , DrugFlagTable[Count] , 1 )
		SetModeEx( DrugList[Count] , EM_SetModeType_Mark , true ) --不可點選
		SetModeEx( DrugList[Count] , EM_SetModeType_HideName , false ) --不顯示名稱
		SetModeEx( DrugList[Count] , EM_SetModeType_NotShowHPMP , false ) --不顯示血條
		SetModeEx( DrugList[Count] , EM_SetModeType_Strikback , false ) --不會反擊
		SetModeEx( DrugList[Count] , EM_SetModeType_Move , false ) --不會移動
		SetModeEx( DrugList[Count] , EM_SetModeType_Fight , false ) --不可攻擊
		SetModeEx( DrugList[Count] , EM_SetModeType_Searchenemy , false ) --不會索敵
		SetModeEx( DrugList[Count] , EM_SetModeType_Obstruct , false ) --無阻擋效果
		SetModeEx( DrugList[Count] , EM_SetModeType_Gravity , false ) --無重力
		AddToPartition( DrugList[Count] , RoomID)
	end
	
	while true do
		sleep( 10 )
		if HateListCount( Boss ) ~= 0 then --仇恨表有人
			if CombatBegin == 0 then --開戰旗標未開
				CombatBegin = 1 --將開戰旗標設為打開
				BeginPlot( Boss , "LUA_YOYO_Zone25D_Boss6_Fight" , 0 )
				ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 ) --BOSS開戰嗆聲
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 1 ) --Register1為Boss跨function用的戰鬥旗標，1  = 開始戰鬥
				
				--生成前門
				BeforeDoor = CreateObjByFlag( DoorID , FlagID , BeforeDoorFlagID , 1 )
				SetModeEx( BeforeDoor , EM_SetModeType_Mark , false ) --不可點選
				SetModeEx( BeforeDoor , EM_SetModeType_HideName , false ) --不顯示名稱
				SetModeEx( BeforeDoor , EM_SetModeType_NotShowHPMP , false ) --不顯示血條
				SetModeEx( BeforeDoor , EM_SetModeType_Strikback , false ) --不會反擊
				SetModeEx( BeforeDoor , EM_SetModeType_Move , false ) --不會移動
				SetModeEx( BeforeDoor , EM_SetModeType_Fight , false ) --不可攻擊
				SetModeEx( BeforeDoor , EM_SetModeType_Searchenemy , false ) --不會索敵
				SetModeEx( BeforeDoor , EM_SetModeType_Obstruct , true ) --有阻擋效果
				AddToPartition( BeforeDoor , RoomID )
			end
		end
	
		if HateListCount( Boss ) == 0 and CombatBegin == 1 then	--仇恨表沒人，開戰旗標已開
			if ReadRoleValue( boss , EM_RoleValue_IsDead ) == 0 then --BOSS還存活
				CombatBegin = 0 --將開戰旗標設為關閉
				DelObj( Boss ) --刪除BOSS
				Delobj( BeforeDoor ) --刪除前門
				ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 ) --廣播BOSS勝利宣言
				WriteRoleValue( Boss , EM_RoleValue_Register1 , 0 ) --Register1為BOSS跨function用的戰鬥旗標，0  = 脫離戰鬥
				BeginPlot( CtrlCentral , "LUA_YOYO_Zone25D_Boss6_Clearance" , 0 )
				sleep( 50 )
				
				RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )
				Boss = CreateObjByFlag( BossID , FlagID , BossFlag , 1 ) --重置BOSS
				AddToPartition( Boss , RoomID )
				WriteRoleValue( CtrlCentral , EM_RoleValue_PID , Boss )
				WriteRoleValue( Boss , EM_RoleValue_PID , CtrlCentral )
			end
		end			
		
		if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 then --BOSS已死亡
			CombatBegin = 0 --將開戰旗標設為關閉
			Delobj( BeforeDoor ) --刪除前門
			Delobj( AfterDoor ) --刪除後門
			ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 ) --廣播BOSS死亡對話
			WriteRoleValue( Boss , EM_RoleValue_Register1 , 0 ) --Register1為Boss跨function用的戰鬥旗標，0  = 脫離戰鬥
			local DrugObjList = LUA_YOYO_GetSpecificNPC( RoomID , DrugID ) --取出場上所有的解凍藥劑物件	
			for Count = 1 , #DrugObjList do
				DelObj( DrugObjList[Count] ) --清除解凍藥劑
			end
			BeginPlot( CtrlCentral , "LUA_YOYO_Zone25D_Boss6_Clearance" , 0 )
			sleep( 50 )
			break --結束此中控判斷迴圈
		end

	end
end
----------------------------------------------------------------------------
--↓Boss脫離戰鬥後清場
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_Clearance()
	local CtrlCentral = OwnerID() --中央控制器
	local RoomID = ReadRoleValue( CtrlCentral , EM_RoleValue_RoomID )
		
	local ColdBuff = 622449 --凍僵
	local DeepColdBuff = 622458 --深寒
	local FreezeBuff = 622450 --冰封身形
	local DrugBuff = 622445 --藥劑沾染
	local IceObj = 106639 --寒流冰刺物件
	
	local PlayerList = LUA_YOYO_GetAllPlayer( RoomID ) --列出場上的所有玩家編號
	for Count = 1 , #PlayerList do
		CancelBuff( PlayerList[Count] , ColdBuff ) --清除凍僵
		CancelBuff( PlayerList[Count] , DeepColdBuff ) --清除深寒
		CancelBuff( PlayerList[Count] , FreezeBuff ) --清除冰封身形
		CancelBuff( PlayerList[Count] , DrugBuff ) --清除藥劑沾染
	end
	
	local IceObjList = LUA_YOYO_GetSpecificNPC( RoomID , IceObj ) --取出場上所有的寒流冰刺物件
	for Count = 1 , #IceObjList do
		DelObj( IceObjList[Count] ) --清除寒流冰刺
	end

end
----------------------------------------------------------------------------
--↓Boss的戰鬥AI
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_Fight()
	--一些設定
	local Boss = OwnerID()
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID)
	local PetTable = {}
	local Sktalk = { "[SC_106640_03]" , "[SC_106640_05]" , "[SC_106640_06]" } --戰鬥AI相關的對話
	WriteRoleValue(Boss , EM_RoleValue_Register2 , 0 )	--控制Boss狂暴的開關
	
	--招式
	local SkillA1 = 499325	-- 裂傷爪擊
	local SkillA2 = 499327	--凶蠻掃擊
	local SkillB = 499328	-- 深寒冰槍
	local SkillC = 499329	-- 冰河震盪
	local ViolentSkill = 850126 --寒冰狂暴
	
	--Buff
	local EnvironmentBuff = 622448	--零度領域
	local P2Buff = 622457	--霜怒
	
	--招式時間
	local SkillAtime = 7		--施法間隔：裂傷爪擊／凶蠻掃擊(7秒)
	local SkillBtime = 22		--施法間隔：深寒冰槍(22秒)
	local SkillCtime = 20		--施法間隔：冰河震盪(20秒)
	local SkillDtime = 5		--施法間隔：寒流冰刺(5秒)
	local SkillP2Time = 10	--施法間隔：霜怒(10秒)
	
	--其它變數
	local IntoP2HP = 40	--進入第二階段的血量
	local BossTime = 0	--Boss戰鬥計數器
	local ViolentTime = 480	--Boss狂暴的時間(8分鐘)
	
	AddBuff( Boss , EnvironmentBuff , 0 , -1 ) --開戰後立即為自己施加零度領域狀態

	while true do
		Sleep(10)
		BossTime = BossTime + 1
		--Say( Boss , "-Time " .. BossTime .. " -" ) --計數器

		--A 裂傷爪擊／凶蠻掃擊
		if BossTime % SkillAtime == 0 then
			if RandRange( 1 , 2 ) == 1 then	--隨機2選1
				--Say( Boss , "----------SkillA 1----------" )
				local NowTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
				CastSpell( Boss , NowTarget , SkillA1 )
			else
				--Say( Boss , "----------SkillA 2----------" )
				CastSpell( Boss , Boss , SkillA2 )
			end
		end 

		--B 深寒冰槍
		if BossTime % SkillBtime == 0 then
			--Say( Boss , "----------SkillB----------" )
			local PlayerTable =  LUA_YOYO_RandPlayerNotGM( Boss , 3 , false )
			if table.getn( PlayerTable ) ~= 0 then
				for Count = 1 , table.getn( PlayerTable ) do
					SysCastSpellLv( Boss , PlayerTable[Count] , SkillB , 0 )
					--Say(PlayerTable[Count] , "spell skillB at me!")
				end
			else
				Say( Boss , "Skill B No Target" )
			end
		end

		--C 冰河震盪
		if BossTime % SkillCtime == 0 then
			--Say( Boss , "----------SkillC----------" )
			CastSpell( Boss , Boss , SkillC ) --這個只有純表演
		end

		-- D 寒流冰刺
		if BossTime % SkillDtime == 0 then
			-- Say( Boss , "----------SkillD----------" )
			local PlayerTable =  LUA_YOYO_RandPlayerNotGM( Boss , 1 , true )
			if table.getn( PlayerTable ) ~= 0 then
				local IcePet = LUA_YOYO_Zone25D_Boss6_IcePet( RoomID , PlayerTable[1] , Boss )
				table.insert( PetTable , IcePet )
			else
				--Say( Boss , "Skill D No Target" )
			end
		end

		-- 霜怒
		if BossTime % SkillP2Time == 0 and Lua_PercentHP( Boss ) <= IntoP2HP then
			AddBuff( Boss , P2Buff , 0 , -1 )
			ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 ) --技能發話
		end

		--寒冰狂暴
		if BossTime > ViolentTime and ReadRoleValue( Boss , EM_RoleValue_Register2 ) == 0 then
			SysCastSpellLv( Boss , Boss , ViolentSkill , 0 )
			ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 ) --技能發話
			WriteRoleValue(Boss , EM_RoleValue_Register2 , 1 )	--控制Boss狂暴的開關
		end

	end
end
----------------------------------------------------------------------------
--↓Boss副AI：凍僵狀態若疊至5層，則觸發冰封身形狀態，若冰封身形後則不再疊加
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_ColdBuff()
	local Target = TargetID()
	local ColdBuff = 622449 --凍僵
	local FreezeBuff = 622450 --冰封身形
	local Count = FN_CountBuffLevel( Target , ColdBuff ) --取得Buff的層數
	
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 0 then --排除寵物
		return false
	end
	
	if CheckBuff( Target , FreezeBuff ) == true then
		CancelBuff( Target , ColdBuff )
		return false
	else
		if Count == 4 then
			CancelBuff( Target , ColdBuff )
			AddBuff( Target , FreezeBuff , 0 , -1 )
		end
	end
end
----------------------------------------------------------------------------
--↓Boss副AI：裂傷爪擊的額外目標處理
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_SkillA1()
	local Boss = OwnerID()
	local Target = TargetID()
	local SkillA1plus = 499326 --額外附有「護甲碎裂」效果的 裂傷爪擊
	local RangePlayerTable = SearchRangePlayer( Target , 50 ) --抓取目標周圍距離50的所有玩家
	local LuckyPlayer = 0 --準備接受「護甲碎裂」的玩家
	
	local PlayerTable = {} --由於SearchRangePlayer抓出來的會從位置0開始，所以創另一個Table從1開始裝
	for Count = 0 , table.getn( RangePlayerTable ) - 1 do
		PlayerTable[Count + 1] = RangePlayerTable[Count]
	end
	
	--Say( Target , "Before PlayerTable = " .. table.getn( PlayerTable ) )	
	for PlayerN = table.getn( PlayerTable ) , 1 , -1 do --抓出全部表格資料
		--Say( Boss , "Search No." .. PlayerN .. " , is " .. PlayerTable[PlayerN] )
		if PlayerTable[PlayerN] == Target then --假如抓取到的玩家是當前的目標，則將之從表格中移除，重新抓取
			--Say( PlayerTable[PlayerN] , "I'm Target , Remove" )
			table.remove( PlayerTable , PlayerN )
		end
	end
	--Say( Target , "After PlayerTable = " .. table.getn( PlayerTable ) )

	for PlayerN = table.getn( PlayerTable ) , 1 , -1 do
		if ReadRoleValue( PlayerTable[PlayerN] , EM_RoleValue_Voc ) == 0 then --假如抓取到的玩家是GM，則將之從表格中移除，重新抓取
			--Say( PlayerTable[PlayerN] , "I'm GM , got remove" )
			table.remove( PlayerTable , PlayerN )
		end
	end

	if table.getn( PlayerTable ) > 0 then
		LuckyPlayer = PlayerTable[ RandRange( 1 , table.getn(PlayerTable) ) ] --從玩家中隨機抽出一位
		--Say( LuckyPlayer , "I'm LuckyPlayer!" )
	else
		LuckyPlayer = Target --如果附近沒其他玩家，就由原目標自己吃下
		--Say( LuckyPlayer , "PlayerTable = 0 , So I'm LuckyPlayer!!" )
	end
	SysCastSpellLv( Boss, LuckyPlayer, SkillA1plus, 0 )
end
----------------------------------------------------------------------------
--↓Boss副AI：冰河震盪選擇的傷害位置
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_SkillC()
	local Boss = OwnerID()
	local Target = TargetID()
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )
	local SkillCobjID = 107557 --冰河震盪的透明球物件
	local SkillCplus = 499330 --冰河震盪傷害效果
	local Sktalk = { "[SC_106640_03]" } --此技能的喊話字串
	local TargetPlayerTable = KS_GetHateList( Boss , 4 ) --取得仇恨列表所有玩家
	local TargetPlayerDisTable = {}
	local SkillCobj = {}
	local TargetCount = 3 --最近的三名目標會受到傷害
	
	if table.getn( TargetPlayerTable ) ~= 0 then
		for Count = 1 , table.getn(TargetPlayerTable) do
			TargetPlayerDisTable[Count] = GetDistance( Boss , TargetPlayerTable[Count] ) --取得仇恨列表所有玩家的距離
			--Say( Boss , "TargetPlayer ".. Count .. " :" .. TargetPlayerTable[Count] .. " , Distance : " .. TargetPlayerDisTable[Count] )
		end

		local SortPlayerTable , SortDisTable = LUA_YOYO_Sequence( TargetPlayerTable , TargetPlayerDisTable , 0 ) --依距離遞增排序
		for Count = 1 ,  TargetCount do
			if SortPlayerTable[Count] ~= nil then --如果有抓到人就放
				local Target_X , Target_Y , Target_Z , Target_Dir = DW_Location(SortPlayerTable[Count]) --取出目標的座標與面向
				SkillCobj[Count] = CreateObj( SkillCobjID , Target_X , Target_Y , Target_Z , Target_Dir , 1 ) --從BOSS所在位置產生一枚隱藏的物件
				SetModeEx( SkillCobj[Count] , EM_SetModeType_Fight , false ) --不可攻擊
				SetModeEx( SkillCobj[Count] , EM_SetModeType_Searchenemy, false ) --不會索敵
				SetModeEx( SkillCobj[Count] , EM_SetModeType_Strikback , false ) --不會反擊
				SetModeEx( SkillCobj[Count] , EM_SetModeType_Mark , false ) --不可點選
				SetModeEx( SkillCobj[Count] , EM_SetModeType_NotShowHPMP , false ) --不顯示血條
				SetModeEx( SkillCobj[Count] , EM_SetModeType_HideName , false ) --不顯示名稱
				AddToPartition( SkillCobj[Count] , RoomID )
				CastSpell( SkillCobj[Count] , SkillCobj[Count] , SkillCplus ) --請隱藏物件自己施展一次表演用的冰河震盪特效
				CallPlot( SkillCobj[Count] , "YOYO_Zone25D_Boss6_SkillC_End" )
			end
		end
		ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 ) --技能發話
	else
		Say( Boss , "Skill C No Target" )
	end
end
----------------------------------------------------------------------------
--↓Boss副AI：冰河震盪傷害不打透明球的判斷
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_SkillCJudge()
	local SkillObj = OwnerID()
	local Target = TargetID()
	if SkillObj == Target --若目標與自己相同
	or ReadRoleValue( Target , EM_RoleValue_OrgID ) == 120735 --若目標為解凍藥劑
	or ReadRoleValue( Target , EM_RoleValue_OrgID ) == 121699 then --若目標為藥劑桌
		return false --不觸發傷害
	end
end
----------------------------------------------------------------------------
--↓Boss副AI：冰河震盪物件消失
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_SkillC_End()
	Sleep(20)
	local ShowObj = OwnerID()
	DelObj( ShowObj ) --2秒後移除隱藏物件
end
----------------------------------------------------------------------------
--↓Boss副AI：召喚寒流冰刺
----------------------------------------------------------------------------
function  LUA_YOYO_Zone25D_Boss6_IcePet( RoomID, Player, Boss )
	local IceObjID = 106639  --寒流冰刺物件編號
	local PetBuff = 622459 --寒流冰刺Buff
	
	local Player_X , Player_Y , Player_Z , Player_Dir = DW_Location(Player) --取出目標的座標與面向
	local Boss_X , Boss_Y , Boss_Z , Boss_Dir = DW_Location(Boss) --取出自己的座標與面向

	local IcePet = CreateObj( IceObjID, Player_X , Player_Y , Player_Z , Player_Dir , 1 ) --從被選重的玩家所在位置產生一枚隱藏的冰刺物件
	SetModeEx( IcePet, EM_SetModeType_Fight, false ) --不可攻擊
	SetModeEx( IcePet, EM_SetModeType_Searchenemy, false ) --不會索敵
	SetModeEx( IcePet, EM_SetModeType_Strikback , false ) --不會反擊
	SetModeEx( IcePet, EM_SetModeType_Mark , false ) --不可點選
	SetModeEx( IcePet, EM_SetModeType_NotShowHPMP, false ) --不顯示血條
	SetModeEx( IcePet , EM_SetModeType_HideName , false ) --不顯示名稱
	AddToPartition( IcePet, RoomID )
	AddBuff( IcePet, PetBuff, 0, -1 ) --將寒流冰刺的狀態施放在冰刺物件上
	
	MoveDirect( IcePet, Boss_X, Boss_Y, Boss_Z ) --往BOSS移動
	CallPlot( IcePet , "LUA_YOYO_Zone25D_Boss6_IcePetDie" , 0 )
	return IcePet
end
----------------------------------------------------------------------------
--↓寒流冰刺存在的時間
----------------------------------------------------------------------------
function LUA_YOYO_Zone25D_Boss6_IcePetDie()
	Sleep(50) --冰刺存在的時間
	local Pet = OwnerID()
	DelObj(Pet)
end
----------------------------------------------------------------------------
--↓掛在任務物品的初始劇情之下：解凍藥劑
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_TouchSet()
	local Obj = OwnerID()
	SetPlot( Obj , "touch" , "YOYO_Zone25D_Boss6_TouchEvent" , 30 ) --觸碰劇情
end
----------------------------------------------------------------------------
--↓解凍藥劑：觸碰劇情
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_TouchEvent()
	local Player = OwnerID()
	local Obj = TargetID()
	local PickDrugs = 850550 --拾取藥劑
	local Sktalk = { "[SC_106640_07]" }
	CastSpell( Player , Player , PickDrugs ) --施展拾取藥劑
	ScriptMessage( Obj , Player , 2 , Sktalk[1] , 2 ) --顯示藥劑拾取中的提示訊息
	CallPlot( Obj , "YoYo_Zone25D_Boss6_ResetObj", Obj ) --設定解凍藥劑重生劇情
end
----------------------------------------------------------------------------
--↓解凍藥劑：重生劇情
----------------------------------------------------------------------------
function YoYo_Zone25D_Boss6_ResetObj( ObjID )
	local WaitTime = 20 --藥劑重生時間
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID ) --目前的副本層數
	DelFromPartition( ObjID) --設定消失
	Sleep( WaitTime * 10 )
	AddToPartition( ObjID, RoomID ) --重新出現在場上
end
----------------------------------------------------------------------------
--↓投擲不穩定藥劑：藥劑使用技能
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_CancelFreezeBuff()
	local Player = TargetID()
	local FreezeBuff = 622450 --冰封身形
	CancelBuff( Player , FreezeBuff )
end
----------------------------------------------------------------------------
--↓解凍：測試用技能
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_TestCancelBuff()
	local Player = OwnerID()
	local FreezeBuff = 622450 --冰封身形
	CancelBuff( Player , FreezeBuff )
end
----------------------------------------------------------------------------
--↓深寒：若冰封身形則不觸發此效果
----------------------------------------------------------------------------
function YOYO_Zone25D_Boss6_DeepColdBuff()
	local Target = TargetID()
	local DeepColdBuff = 622458 --深寒
	local FreezeBuff = 622450 --冰封身形	
	if CheckBuff( Target , FreezeBuff ) == true then
		CancelBuff( Target , DeepColdBuff )
		return false
	end
end