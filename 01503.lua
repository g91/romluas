function Lua_Hao_GuildwarriorNPC() -- 傳送後靠近NPC觸發劇情

	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	SetPlot( OwnerID() , "range" , "Lua_Hao_GuildwarriorNPC_2" , 100 )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildwarriorNPC_2() -- 在遠方就打招呼


--	say(OwnerID() , "3" ) --玩家
--	say(TargetID() , "4" ) --NPC

------------------------------------------------------------------------------2011.06.13 修正遊戲進行中關掉重登及卡點回報時，若使用公會校場重置卷，進入後會看到兩隻NPC的問題
	CallPlot( TargetID() , "Lua_Hao_GuildwarriorNPC_5" , OwnerID() , 500 )
------------------------------------------------------------------------------
--	BeginPlot( TargetID() , "Lua_Hao_GuildwarriorNPC_5" , 0 )

	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		return
	end

	WriteRoleValue( TargetID() , EM_RoleValue_PID ,  1 )
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	Sleep(20)
	ScriptMessage( TargetID() , OwnerID() , 2 , "|cFFFFD700 ".."[SC_GUILD_WARRIOR_11]".. "|r" , 0 ) -- 你好，我是負責『神鬼戰士』試煉的[114332]。
	ScriptMessage( TargetID() , OwnerID() , 0 , "|cFFFFD700 ".."[SC_GUILD_WARRIOR_11]".. "|r" , 0 ) -- 你好，我是負責『神鬼戰士』試煉的[114332]。

	PlayMotion( TargetID() , 116 ) --揮手
	Sleep(20)
	PlayMotion( TargetID() , 111 ) --敬禮 

end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildwarriorNPC_3() -- 與NPC對話後，觸發的劇情。

--	say(OwnerID() , "1" ) --玩家
--	say(TargetID() , "2" ) --NPC
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- 職業
	local Bonus = ReadRoleValue( TargetID() , EM_RoleValue_Register  ) --Reg值
	local Highest = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6 ) -- 積分的最高記錄
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

--	Say( TargetID() , "Bonus ="..Bonus )

	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	PlayMotion( TargetID() , 111 ) --敬禮
	BeginPlot( TargetID() , "Lua_Hao_GuildwarriorNPC_4" , 0 )

	if CheckBuff (OwnerID(), 503783) == true then
			SetSpeakDetail( OwnerID(), "[GUILD_TC_HITPLATYPUS_27]"   ) --你身上擁有命運指環的效果，無法進行遊戲。
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --回上一頁
	else
		if Bonus == 0 or PlayerVoc == 0 then

			if Highest ~= 0 then
				SetSpeakDetail(  OwnerID(), "[SC_GUILD_WARRIOR_18][$SETVAR1="..Highest.."]" ) --[$PLAYERNAME]，你曾經獲得的榮譽點數最高記錄為<CY>[$VAR1]</CY>，準備好接受挑戰了嗎？
			else
				SetSpeakDetail(  OwnerID(), "[SC_GUILD_WARRIOR_16]"  ) --[$PLAYERNAME]，準備好接受挑戰了嗎？
			end
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILD_WARRIOR_13]"  , "Lua_Hao_Guildwarriorteaching", 0 )--試鍊規則說明
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILD_WARRIOR_14]"  , "Lua_Hao_Guildwarrior02 ", 0 )--進行 <CB>神鬼戰士</CB>
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "Lua_Hao_Guildwarrior_Leave", 0 )--離開校場

		elseif Bonus == 101 then
				SetSpeakDetail(  OwnerID(), "[SC_GUILD_WARRIOR_12]"  ) -- 這次的試煉到此為止，期待你下次的表現。
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "Lua_Hao_Guildwarrior_Leave", 0 )--離開校場
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildwarriorNPC_4()

--	say(OwnerID() , "3" ) --NPC
--	say(TargetID() , "4" ) --玩家
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			break
		end
		sleep(5)
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Guildwarrior_Leave()--離開訓練場

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Buff = { 505763 , 505588 , 505582 , 505563 , 505585 , 505560 , 506509 } -- 戰鬥手冊、鬥士心得、萬夫莫敵、零下領域、自然本源、霜之障壁、試煉者的証明

	for i = 1 , 7 , 1 do
		CancelBuff( OwnerID() , Buff[i] )
	end

	CloseSpeak( OwnerID() ) 	
	ChangeZone( OwnerID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )	--ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
	delObj( TargetID() )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Guildwarriorteaching() -- 神鬼戰士教學
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(  OwnerID(), " [SC_GUILD_WARRIOR_4] " ) 
--	『神鬼戰士』課程注意事項：	
--	　1. 試煉時間為<CM>15</CM>分鐘，只要在時間內擊倒敵對目標，試煉結束時，就能獲得<CM>榮譽點數</CM>。	
--	　2. 試煉開始，會賦予<CM>劍、盾、杖</CM>三種姿態，每種姿態都有專屬的技能，姿態之間無法共存，可視需求做自由轉換。	
--	　3. 只要擊倒敵對目標，就能夠獲得<CM>強化法術</CM>或是對應各種姿態下的<CM>新增技能</CM>。

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_Hao_GuildwarriorNPC_3", 0 )--回上一頁
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Guildwarrior02()--準備開始遊戲　將NPC 取消標記

--	say(OwnerID() , "5" ) --玩家
--	say(TargetID() , "6" ) --NPC
	CloseSpeak( OwnerID() ) 
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

	BeginPlot( OwnerID() , "Lua_Hao_GuildwarriorGetReady" , 0 )

	SetModeEx( TargetID() , EM_SetModeType_Mark , false )--標記

	Hide(TargetID())
	Show(TargetID() , RoomID )
	WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+4 ,  TargetID() )  -- 讓玩家記得NPC為 Reg4 
end
------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorGetReady() -- 開始遊戲

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV  ) 
	local Time = 5

	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj( 113105, BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, false )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, false )--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6 , NPC ) --讓玩家記住隱藏物件
	WriteRoleValue( NPC , EM_RoleValue_Register , OwnerID() ) --讓隱藏物件記住玩家
	ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_7]" , C_SYSTEM ) -- 試鍊將在5秒後開始。
	sleep(10)

	AddBuff( OwnerID() , 506509 , 0 , -1 ) -- 試煉者的証明
	AddBuff( OwnerID() , 506580 , 0 , -1 ) -- 定身，讓玩家不能直接前往打王

	LuaDan_HitShrew_CheckOK(5,5,0)--倒數五秒進行

	BeginPlot( TargetID() , "Lua_Hao_GuildwarriorMenu" , 0 )

		for i = 1 , 5 , 1 do
--			ScriptMessage( OwnerID(),  -1 , 1 , "[SC_GUILD_WARRIOR_3][$SETVAR1="..Time.."]" , C_SYSTEM ) --[$VAR1]
			CancelBuff( OwnerID() , 500675 ) -- 拔掉目標潛行
			CancelBuff( OwnerID() , 500745 ) -- 拔掉目標躲藏
			CancelBuff( OwnerID() , 501909 ) -- 拔掉目標隨風而逝
			CancelBuff( OwnerID() , 500535 ) -- 拔掉聖靈契約

			if Time == 5 then
				ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_5]" , C_SYSTEM )	--	請善用試鍊賦予的專屬姿態
			elseif Time ==3 then
				ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_20]" , C_SYSTEM )	--	請注意，在競技場的公正試煉下，無法使用原有職業技能。
				ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_20]" , C_SYSTEM )	--	請注意，在競技場的公正試煉下，無法使用原有職業技能。
			elseif Time == 2 then
				ScriptMessage( OwnerID() , -1  , 1 , "[SC_LOSTTREASURE_10]" , C_SYSTEM )	--	祝你好運
			elseif Time == 1 then
				ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_10]" , C_SYSTEM )	--	試鍊開始 !
				ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_10]" , C_SYSTEM )	--	試鍊開始 !
			end
		sleep(10)
		Time = Time - 1
		end

	CancelBuff( OwnerID() , 506580 )

	if DeadCount == nil then
		DeadCount = {}
	end
	if ScoreCount == nil then
		ScoreCount = {}
	end
	if BuffLv == nil then
		BuffLv = {}
	end 
	if NPCObj1 == nil then
		NPCObj1 = {}
	end
	
	ClockOpen( OwnerID() ,EM_ClockCheckValue_11,900,900,0,"Lua_Hao_Guildwarrior_mission" , "Lua_Hao_Guildwarrior_mission") --倒數計時器  ( 函式： "換區消失"，"時間到時呼叫函式" )
	DeadCount[RoomID] = 0
	ScoreCount[RoomID] = 0
	BuffLv[RoomID] = 0
	NPCObj1[RoomID] ={}

	BeginPlot ( NPC , "Lua_Hao_GuildWarriorDead" , 0 ) -- 在箱子上執行程式

	local NPCObj
	local MonsterObj
	local MonsterObj1
	local BuffID = { 504191 , 505958 , 505959 , 505960 } -- 生命激發、能量抵抗、衝擊抵抗、狂暴刺激
	SetSmallGameMenuType( OwnerID() , 7 , 1 ) --開啟介面 
	SetSmallGameMenuStr( OwnerID() , 7 , 1 , "[SC_GUILD_WARRIOR_1][$SETVAR1="..DeadCount[RoomID].."]" ) -- 擊殺數
	SetSmallGameMenuStr( OwnerID() , 7 , 2 , "[SC_GUILD_WARRIOR_2][$SETVAR1="..ScoreCount[RoomID].."]"  ) -- 分數

--	say(OwnerID() , "1" ) --玩家
--	say(TargetID() , "2" ) --NPC
	if PlayerLV <= 10 then -- 1 ~ 10
		NPCObj = 102487 -- 怪物等級 5
		NPCObj1[RoomID] = { 102487 , 103288 , 103289 } -- 怪物等級 5 , 5(精英) , 7(精英)
	elseif PlayerLV <= 20 then -- 11 ~ 20
		NPCObj = 102488 -- 怪物等級 15
		NPCObj1[RoomID] = { 102488 , 101270 , 103290 } -- 怪物等級 15 , 15(精英) , 17(精英)
	elseif PlayerLV <= 30 then -- 21 ~ 30
		NPCObj = 102489 -- 怪物等級 25
		NPCObj1[RoomID] = { 102489 , 102059 , 102062 } -- 怪物等級 25 , 27(精英) , 27(王級精英 )
	elseif PlayerLV <= 40 then -- 31 ~ 40
		NPCObj = 102490 -- 怪物等級 35
		NPCObj1[RoomID] = { 102490 , 102080 , 102081 } -- 怪物等級 35 , 37(精英) , 37(王級精英)
	elseif PlayerLV <= 50 then -- 41 ~ 50
		NPCObj = 102491 -- 怪物等級 45
		NPCObj1[RoomID] = { 102491 , 102089 , 102061 } -- 怪物等級 45 , 47(精英) , 47(王級精英)
	elseif PlayerLV <= 100 then -- 51 ~ 55
		NPCObj = 102492 -- 怪物等級 50
		NPCObj1[RoomID] = { 102492 , 102098 , 102102 } -- 怪物等級 50 , 50(精英) , 50(王級精英)
	end
--ACT1
	MonsterObj = CreateObjByFlag( NPCObj , 780371 , 1 , 1 ) 	-- 建立怪物在旗標上
	AddToPartition( MonsterObj , RoomID)	--使消失的物件出現
	AddBuff( MonsterObj , 505586 , 0 ,-1)
	SetModeEx( MonsterObj , EM_SetModeType_Searchenemy , false )--索敵
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	WriteRoleValue( MonsterObj , EM_RoleValue_Register+1 , 1 ) -- 判定ACT1怪物的掉落光球是什麼
	SetPlot( MonsterObj , "dead" , "Lua_Hao_GuildwarriorACT1" , 0 )
--ACT2
--ACT2 中軍
	local norbox = Lua_MadeRectangleByXYZ_noyell(NPCObj1[RoomID][1] , 4110.2  , 16.3 , 3602.1 , 88.5 , 35 , 35 , 3  , 3 ) -- npcid , x, y ,z , dir , 位置, 位置,  行數, 列數 (OrgID , OldX , OldY , OldZ , OldDir , Wdis , Ldis , Wnm , Lnm)
													--在XYZ之後用OrgID物件建立一個實心矩型Wnm需為1.3.5....Lnm需為正整數,Wdis為橫向間距,Ldis為前後間距
	for x=1 , table.getn(norbox) do
		local Random = Rand(100)+1
		if Random <= 25 then
			AddBuff( norbox[x] , BuffID[1] , 0 , -1 )
		elseif Random > 25 and Random <= 50 then
			AddBuff( norbox[x] , BuffID[2] , 0 , -1 )
		elseif Random > 50 and Random <= 75 then
			AddBuff( norbox[x] , BuffID[3] , 0 , -1 )
		elseif Random > 75 then
			AddBuff( norbox[x] , BuffID[4] , 0 , -1 )
		end
		AddToPartition( norbox[x] , RoomID )	--讓物件產生
		WriteRoleValue( norbox[x] , EM_RoleValue_PID , 1 )
		WriteRoleValue( norbox[x] , EM_RoleValue_Register+2 , 1 ) -- 判定ACT2怪物的掉落光球是什麼
		SetPlot( norbox[x] , "dead" , "Lua_Hao_GuildwarriorACT2" , 0 )
	end
--ACT2 右軍
	local norbox1 = Lua_MadeRectangleByXYZ_noyell(NPCObj1[RoomID][1] , 3940.7  , 16.3 , 3602.1 , 88.5 , 50 , 50 , 3  , 2 ) -- npcid , x, y ,z , dir , 位置, 位置,  行數, 列數 (OrgID , OldX , OldY , OldZ , OldDir , Wdis , Ldis , Wnm , Lnm)
	for x=1 , table.getn(norbox1) do
		local Random = Rand(100)+1
		if Random <= 25 then
			AddBuff( norbox1[x] , BuffID[1] , 0 , -1 )
		elseif Random > 25 and Random <= 50 then
			AddBuff( norbox1[x] , BuffID[2] , 0 , -1 )
		elseif Random > 50 and Random <= 75 then
			AddBuff( norbox1[x] , BuffID[3] , 0 , -1 )
		elseif Random > 75 then
			AddBuff( norbox1[x] , BuffID[4] , 0 , -1 )
		end
		AddToPartition( norbox1[x] , RoomID )	--讓物件產生
		WriteRoleValue( norbox1[x] , EM_RoleValue_PID , 2 )
		WriteRoleValue( norbox1[x] , EM_RoleValue_Register+2 , 1 ) -- 判定ACT2怪物的掉落光球是什麼
		SetPlot( norbox1[x] , "dead" , "Lua_Hao_GuildwarriorACT2" , 0 )
	end
--ACT2 左軍
	local norbox2 = Lua_MadeRectangleByXYZ_noyell(NPCObj1[RoomID][1] , 4277.8  , 16.3 , 3602.1 , 88.5 , 50 , 50 , 3  , 2 ) -- npcid , x, y ,z , dir , 位置, 位置,  行數, 列數 (OrgID , OldX , OldY , OldZ , OldDir , Wdis , Ldis , Wnm , Lnm)
	for x=1 , table.getn(norbox2) do
		local Random = Rand(100)+1
		if Random <= 25 then
			AddBuff( norbox2[x] , BuffID[1] , 0 , -1 )
		elseif Random > 25 and Random <= 50 then
			AddBuff( norbox2[x] , BuffID[2] , 0 , -1 )
		elseif Random > 50 and Random <= 75 then
			AddBuff( norbox2[x] , BuffID[3] , 0 , -1 )
		elseif Random > 75 then
			AddBuff( norbox2[x] , BuffID[4] , 0 , -1 )
		end
		AddToPartition( norbox2[x] , RoomID )	--讓物件產生
		WriteRoleValue( norbox2[x] , EM_RoleValue_PID , 3 )
		WriteRoleValue( norbox2[x] , EM_RoleValue_Register+2 , 1 ) -- 判定ACT2怪物的掉落光球是什麼
		SetPlot( norbox2[x] , "dead" , "Lua_Hao_GuildwarriorACT2" , 0 )
	end
-- ACT2 小王
	MonsterObj1 = CreateObjByFlag( NPCObj1[RoomID][2] , 780371 , 2 , 1 )
	AddToPartition( MonsterObj1 , RoomID )
	AddBuff( MonsterObj1 , 505764 , 0 , -1 )
	SetPlot( MonsterObj1 , "dead" , "Lua_Hao_GuildwarriorACT2_leader" , 0 )
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorACT1() -- 產生小怪100隻。

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local MonsterID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) --該怪在資料庫的統一ID
	local Countdead = ReadRoleValue( OwnerID(),EM_RoleValue_PID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 1 ) -- 判定ACT1怪物的掉落光球是什麼

	Lua_Hao_GuildWarriorCount() -- 執行完此 function 後才往下跑其他Script

--	say(OwnerID() , "5" ) --NPC
--	say(TargetID() , "6" ) --玩家
		if Countdead == 18 or Countdead == 38 or Countdead == 58 or Countdead == 78 then 
			BuffLv[RoomID] = BuffLv[RoomID]+1
			local MonsterObj = CreateObjByFlag( MonsterID , 780371 , 1 , 1 ) -- 建立怪物在旗標上
			local NewCountdead = Countdead+1
			AddToPartition ( MonsterObj , RoomID)	--使消失的物件出現
			WriteRoleValue ( MonsterObj , EM_RoleValue_PID ,  Countdead+1 )
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 2 ) -- 記分
			SetModeEx( MonsterObj , EM_SetModeType_Searchenemy, false )--索敵
			AddBuff( MonsterObj , 505587 , BuffLv[RoomID]-1 ,-1)
			Say( MonsterObj , "[SC_111368_3]" )
			SetPlot( MonsterObj , "dead" , "Lua_Hao_GuildwarriorACT1" , 0 )
		elseif Countdead <= 97 then
			local MonsterObj = CreateObjByFlag( MonsterID , 780371 , 1 , 1 ) -- 建立怪物在旗標上
			local NewCountdead = Countdead+1
			AddToPartition ( MonsterObj , RoomID)	--使消失的物件出現
			WriteRoleValue ( MonsterObj , EM_RoleValue_PID ,  Countdead+1 )
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
			AddBuff( MonsterObj, 505586 , NewCountdead ,-1)
			SetAttack( MonsterObj , TargetID() )
			SetPlot( MonsterObj , "dead" , "Lua_Hao_GuildwarriorACT1" , 0 )
		elseif Countdead == 98 then
			BuffLv[RoomID] = BuffLv[RoomID]+1
			local MonsterObj = CreateObjByFlag( MonsterID , 780371 , 1 , 1 ) -- 建立怪物在旗標上
			local NewCountdead = Countdead+1
			AddToPartition ( MonsterObj , RoomID)	--使消失的物件出現
			WriteRoleValue ( MonsterObj , EM_RoleValue_PID ,  Countdead+1 )
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 4 ) -- 記分
			SetModeEx( MonsterObj , EM_SetModeType_Searchenemy, false )--索敵
			AddBuff( MonsterObj , 505587 , BuffLv[RoomID]-1 ,-1)
			Say( MonsterObj , "[SC_111368_4]" )
			SetPlot( MonsterObj , "dead" , "Lua_Hao_GuildwarriorACT1" , 0 )
		else
			return true
		end	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) ==1 then-- 判定ACT1怪物的掉落光球是什麼
	local NPC = CreateObjbyObj( 205030 , OwnerID() , 1 )
	AddToPartition ( NPC , RoomID )	--使消失的物件出現
--	Say( NPC , "ID = "..ReadRoleValue(OwnerID(),EM_RoleValue_OrgID).." ACT1 CreateObj 205030")
	Beginplot( NPC , "Lua_Hao_GuildWarriorACTDelobj" , 0 ) -- 怪物死亡後瞬間砍掉物件，無法拾取掉落物。
	end
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorACT2()

--	say( OwnerID() , "1") --NPC
--	say( TargetID() , "2") --玩家

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local NPCPID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
--	Say( OwnerID() , NPCPID )

	Lua_Hao_GuildwarriorACT2_Until()

	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) == 1 then -- 判定ACT2怪物的掉落光球是什麼
	local NPC = CreateObjbyObj( 205031 , OwnerID() , 1 )
	Beginplot( NPC , "Lua_Hao_GuildWarriorACTDelobj" , 0 ) -- 怪物死亡後瞬間砍掉物件，無法拾取掉落物。
	AddToPartition ( NPC , RoomID )	--使效果光球出現
--	Say( NPC , "ID = "..ReadRoleValue(OwnerID(),EM_RoleValue_OrgID).."ACT2 CreateObj 205031")
	end
end
------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorACT2_Until() -- 小怪死亡後，亂數重生 

-- 旗標 780371
-- 0 校場教官 、 1 ACT1 、 2 ACT2 小Boss 、 3 ACT2 大Boss 、 4.5 ACT2 左側出怪點 、 6.7 ACT2 右側出怪點 、 8.9.10 ACT2 中間出怪點

--	say( OwnerID() , "1") --NPC
--	say( TargetID() , "2") --玩家

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local NPCPID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Random2
	local MonsterObj1
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 1 then -- 中軍
			Random2 = 8+Rand(3)
--			Say( OwnerID() , NPCPID )
		elseif  ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 2 then -- 左軍
			Random2 = 6+Rand(2)
		elseif  ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 3 then -- 右軍
			Random2 = 4+Rand(2)
		end

	local Count = Rand(5)+1
	local BuffID = { 504191 , 505958 , 505959 , 505960 } -- 生命激發、能量抵抗 、 衝擊抵抗 、 狂暴刺激
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 ) -- 記分
	Lua_Hao_GuildWarriorCount()

	for i = 1 , Count , 1 do
		MonsterObj1 = CreateObjByFlag( NPCObj1[RoomID][1] , 780371 , Random2 , Count ) -- NPC編號 , 旗子ID . 旗子位置 . 數量
		AddToPartition( MonsterObj1 , RoomID)
		local Random = Rand(100)+1
			if Random <= 25 then
				AddBuff( MonsterObj1 , BuffID[1] , 0 , -1 )
			elseif Random > 25 and Random <= 50 then
				AddBuff( MonsterObj1 , BuffID[2] , 0 , -1 )
			elseif Random > 50 and Random <= 75 then
				AddBuff( MonsterObj1 , BuffID[3] , 0 , -1 )
			elseif Random > 75 then
				AddBuff( MonsterObj1 , BuffID[4] , 0 , -1 )
			end
		SetAttack( MonsterObj1 , TargetID() )
		WriteRoleValue( MonsterObj1 , EM_RoleValue_Register+2 , 1 ) -- 判定ACT2怪物的掉落光球是什麼
		SetPlot( MonsterObj1 , "dead" , "Lua_Hao_GuildwarriorACT2_Until2" , 0 )
	end
	if Count == 5 then
		ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_17]" , C_SYSTEM )--	敵方大軍來襲！
		ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_17]" , C_SYSTEM )--	敵方大軍來襲！
	
	end
end
------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorACT2_Until2()

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

--	say( OwnerID() , "1") --NPC
--	say( TargetID() , "2") --玩家
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 ) -- 記分
	Lua_Hao_GuildWarriorCount()

	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) == 1 then -- 判定ACT2怪物的掉落光球是什麼
	local NPC = CreateObjbyObj( 205031, OwnerID(), 1 )
	AddToPartition ( NPC , RoomID )	--使消失的物件出現
--	Say( NPC , "ID = "..ReadRoleValue(OwnerID(),EM_RoleValue_OrgID).."ACT2 UN CreateObj 205031")
	Beginplot( NPC , "Lua_Hao_GuildWarriorACTDelobj" , 0 ) -- 怪物死亡後瞬間砍掉物件，無法拾取掉落物。
	end
--	delobj( OwnerID() )
end
------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorACT2_leader() -- 殺死小王後，產生Boss。

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV  ) 
	local MonsterObj

--	Say( TargetID() ,"I am TargetID" ) --  玩家
--	Say( OwnerID() ,"I am OwnerID" ) --  NPC
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 2 ) -- 記分
	Lua_Hao_GuildWarriorCount()

	MonsterObj = CreateObjByFlag( NPCObj1[RoomID][3] , 780371 , 3 , 1 )

	if PlayerLV > 20 then
		AddBuff( MonsterObj , 505963 , 1 , -1 )
		AddToPartition( MonsterObj , RoomID )
		SetPlot( MonsterObj , "dead" , "Lua_Hao_Guildwarrior_The_End" , 0 )
	else
		AddToPartition( MonsterObj , RoomID )
		SetPlot( MonsterObj , "dead" , "Lua_Hao_Guildwarrior_The_End" , 0 )
	end

	local NPC = CreateObjbyObj( 205031, OwnerID(), 1 )
	AddToPartition ( NPC , RoomID )	--使效果光球出現
--	Say( NPC , "ID = "..ReadRoleValue(OwnerID(),EM_RoleValue_OrgID).."ACT2 LEA CreateObj 205031")
	Beginplot( NPC , "Lua_Hao_GuildWarriorACT2Delobj" , 0 ) -- 怪物死亡後瞬間砍掉物件，無法拾取掉落物。
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildWarriorACTDelobj() -- 怪物死亡後瞬間砍掉物件，無法拾取掉落物。

--	say( OwnerID() , "1") --NPC
--	say( TargetID() , "2") --玩家

	delobj( TargetID() )
	sleep(50) -- 5秒後刪除Buff球
	delobj( OwnerID() )
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildWarriorACT2Delobj() -- 殺死小王後，刪除小怪。

--	Say( TargetID() ,"I am TargetID2" ) --  NPC
--	Say( OwnerID() ,"I am OwnerID2" ) --  Buff球

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	delobj( TargetID() )

	local TempObj = { 102487 , 102488 , 102489 , 102490 , 102491 , 102492 }

	local T1Obj
	local T1Count = SetSearchRangeInfo( OwnerID() , 5000 )
	for i = 1 , T1Count , 1 do
		local T1ID = GetSearchResult()
		T1Obj = Role:New( T1ID )	
		if T1Obj:RoomID() == RoomID and T1ID ~= OwnerID() then
			local FlagOrgID = T1Obj:OrgID()
			for i = 1 , table.getn(TempObj) do
				if (FlagOrgID == TempObj[i]) then
					DelObj(T1ID)
				end
			end
		end
	end
	sleep(100)
	delobj( OwnerID() )
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Guildwarrior_The_End() -- 殺死王後執行，結束

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	WriteRoleValue( TargetID() , EM_RoleValue_Register , 3 ) -- 記分
	Lua_Hao_GuildWarriorCount()
	delobj( OwnerID() )
	BeginPlot( TargetID() , "Lua_Hao_Guildwarrior_The_End02" , 0 ) -- 
--	Say( OwnerID() ,"NPC" ) -- NPC
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Guildwarrior_The_End02() --殺死王後執行，清除玩家身上的Reg值&校場技能&場上所有怪物

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local QNPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4  )   --讓玩家知道 Register+4 為任務NPC

------------------------------------------------------------------------------------------------------------------
			SetModeEx( QNPC   , EM_SetModeType_Mark, true )--標記
			Hide( QNPC )
			Show( QNPC , RoomID )
			WriteRoleValue(  QNPC  , EM_RoleValue_Register ,  101 ) 
------------------------------------------------------------------------------------------------------------------
--	local Time = 5
	local A = DeadCount[RoomID]
	local Score = ScoreCount[RoomID]
--	Say( OwnerID() ,"THE END" ) -- 玩家
--	Say( TargetID() ,"THE END" ) -- NPC

	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_1][$SETVAR1="..A.."]" , C_SYSTEM ) 	--對話視窗
	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_2][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--對話視窗

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 1 )  -- 榮譽點數的給允Key 
	BeginPlot( OwnerID() , "Lua_Hao_Guildwarrior_Cancel" , 0 ) -- 清除玩家身上的Reg值&校場技能&場上所有怪物。　擊殺數＆分數？
	Setflag( OwnerID() , 542177 , 1 )
--------------------------------------------------
	SetSmallGameMenuType( OwnerID() , 7 , 2 ) --關閉介面
--------------------------------------------------
	ClockClose( OwnerID() ) 
	Lua_Hao_GuildwarriorMenu_reset() -- 清除招示CD
--	ChangeZone( OwnerID() , 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )--傳回小房間
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Guildwarrior_mission()	--	任務失敗後執行，清除Reg值、技能、所有怪物  換區 . 離線消失

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local QNPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4  )   --讓玩家知道 Register+4 為任務NPC
------------------------------------------------------------------------------------------------------------------
		SetModeEx( QNPC   , EM_SetModeType_Mark, true )--標記
		Hide( QNPC )
		Show( QNPC , RoomID )
		WriteRoleValue(  QNPC  , EM_RoleValue_Register ,  101 ) 
------------------------------------------------------------------------------------------------------------------
--	Say( TargetID() ,"I am TargetID" ) -- 玩家
--	Say( OwnerID() ,"I am OwnerID" ) -- 玩家
	ScriptMessage( OwnerID(),  -1, 2, "[SC_GUILD_WARRIOR_8]" , C_SYSTEM ) 	--試鍊結束

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 1 )  -- 榮譽點數的給允Key 
	Setflag( OwnerID() , 542177 , 1 )
	BeginPlot( OwnerID() , "Lua_Hao_Guildwarrior_Cancel" , 0 ) -- 清除玩家身上的Reg值&校場技能&場上所有怪物&擊殺數&分數
-------------------------------------------------------------------------------------------------------------------
	SetSmallGameMenuType( OwnerID() , 7 , 2 ) --關閉介面
-------------------------------------------------------------------------------------------------------------------
	ClockClose( OwnerID() ) 
	Lua_Hao_GuildwarriorMenu_reset() -- 清除招示CD

--	ChangeZone( AttackID, 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )--傳回小房間
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Guildwarrior_Cancel() -- 清除玩家身上的Reg值&校場技能&場上所有怪物。

--	Say( TargetID() ,"I am TargetID" ) --  玩家
--	Say( OwnerID() ,"I am OwnerID" ) --  玩家
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )
--	local Score = ScoreCount[RoomID]
	local Okay = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 )
-------------------------------------------------------------------------------------------------------------------
	if Okay == 1 then
	FN_GuildGame_Honor( OwnerID(), Score )
--	AddRoleValue( OwnerID() , EM_RoleValue_Honor , Score )--給予榮譽值
--	ScriptMessage( OwnerID(),  -1, 1, "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--你獲得了 [$VAR1] 點榮譽點數
--	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--你獲得了 [$VAR1] 點榮譽點數
	end
-------------------------------------------------------------------------------------------------------------------
	local OldScore = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6 ) -- 記錄最高分數
		if OldScore == 0 then
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6  , Score )	
		elseif OldScore >= Score then
		--	return false
		elseif OldScore < Score then
			ScriptMessage( OwnerID(),  -1, 2, "[SC_GUILD_WARRIOR_19][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_19][$SETVAR1="..Score.."]" , C_SYSTEM )
			--恭喜你打破了之前保持的榮譽點數記錄，現在的記錄為<CY>[$VAR1]</CY>，這次的試煉到此為止，期待你下次的表現。
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6  , Score )
		end
-------------------------------------------------------------------------------------------------------------------
	Lua_Hao_Guildwarrior_Clear()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) -- 記錄分數
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, 0 ) -- 記錄攻擊姿態
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2, 0 ) -- 記錄防禦姿態
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+3, 0 ) -- 記錄魔法姿態
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+4, 0 ) -- 記錄起始NPC&過關與否
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5, 0 ) -- 記錄分數多寡並給允玩家榮譽點數
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6, 0 ) -- 隱藏物件，每秒搜尋玩家，判斷死亡執行劇情
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 ) -- 跨Zone記錄校場分數用
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+8, 0 ) -- 尚無使用
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9, 0 ) -- 尚無使用
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+10, 0 ) -- 尚無使用

	local Buff = {	505540 , 505541 , 505542 ,
			504192 , 504193 , 504194 ,
			505544 , 505545 , 505546 , 505547 , 505548 ,
			505554 , 505555 , 505556 , 505557 , 505558 ,
			505564 , 505565 , 505566 , 505567 , 505568 , 506509 }

	for i = 1 , 22 , 1 do
		CancelBuff( OwnerID() ,Buff[i] )
	end

end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildWarriorCount() -- 小怪1分，小王10分，大王25分，隱藏王50分

	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )

	DeadCount[RoomID] = DeadCount[RoomID] + 1

	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		ScoreCount[RoomID] = ScoreCount[RoomID] + 1
	elseif ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 1 then
		ScoreCount[RoomID] = ScoreCount[RoomID] + 1
	elseif ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 2 then
		ScoreCount[RoomID] = ScoreCount[RoomID] + 10
	elseif ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 3 then
		ScoreCount[RoomID] = ScoreCount[RoomID] + 25
	elseif ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 4 then
		ScoreCount[RoomID] = ScoreCount[RoomID] + 50
	end
	local A = DeadCount[RoomID]
	local Score = ScoreCount[RoomID]

--	DebugMsg( TargetID() , RoomID , "Npc_Dead  = "..A )
--	DebugMsg( TargetID() , RoomID , "Npc_Score = "..Score )

	WriteRoleValue( TargetID() , EM_RoleValue_Register+7 , Score ) -- ChangeZone
--	Say(OwnerID(), "OwnerID")-- NPC
--	Say(TargetID(), "TargetID")-- Player
------------------------------------ 記分板
	SetSmallGameMenuStr( TargetID() , 7 , 1 , "[SC_GUILD_WARRIOR_1][$SETVAR1="..A.."]" ) -- 擊殺數
	SetSmallGameMenuStr( TargetID() , 7 , 2 , "[SC_GUILD_WARRIOR_2][$SETVAR1="..Score.."]"  ) -- 分數
-----------------------------------
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 0 )
	local Tell = { 10 , 20 , 30 , 40 , 50 , 100 , 150 , 200 , 250 , 300 , 350 , 400  , 450 , 500 }
	for i = 1 , table.getn(Tell) , 1 do
		if A == Tell[i] then
			ScriptMessage( TargetID(),  -1, 1, "[SC_GUILD_WARRIOR_1][$SETVAR1="..A.."!]" , C_SYSTEM ) 
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorMenu()

--	Say(OwnerID(), "OwnerID")-- NPC
--	Say(TargetID(), "TargetID")-- Player	

	AddBuff( TargetID() , 505540 , 0 , -1 ) -- 劍
	AddBuff( TargetID() , 505541 , 0 , -1 ) -- 盾
	AddBuff( TargetID() , 505542 , 0 , -1 ) -- 杖

end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorSword() -- 攻擊姿態

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) -- 取得玩家等級
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1)

	if CheckBuff( OwnerID() , 504192 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_DUEL_ERROR_1]" , 0 )
		return
	else
	CancelBuff( OwnerID() ,504193 ) -- 鋼鐵壁壘 被動技能
	CancelBuff( OwnerID() ,504194 ) -- 心靈衝擊 被動技能
-------------------------------------------------------------------盾
	CancelBuff( OwnerID() ,505554 ) -- 冰霜擊
	CancelBuff( OwnerID() ,505555 ) -- 霜之障壁
	CancelBuff( OwnerID() ,505556 ) -- 無盡懺悔
	CancelBuff( OwnerID() ,505557 ) -- 霜願守護
	CancelBuff( OwnerID() ,505558 ) -- 零度空間
-------------------------------------------------------------------杖
	CancelBuff( OwnerID() ,505564 ) -- 千風綻放
	CancelBuff( OwnerID() ,505565 ) -- 逐空之歌
	CancelBuff( OwnerID() ,505566 ) -- 神聖審判
	CancelBuff( OwnerID() ,505567 ) -- 希望之光
	CancelBuff( OwnerID() ,505568 ) -- 自然本源

	AddBuff( OwnerID() ,504192 , 0 , -1 ) -- 橫掃千軍被動技能

	AddBuff( OwnerID() ,505544 , PlayerLV , -1 ) -- 聚炎擊
	AddBuff( OwnerID() ,505545 , PlayerLV , -1 ) -- 血腥纏繞
		if X == 3 then
		AddBuff( OwnerID() ,505546 , PlayerLV , -1 ) -- 驚懼戰吼
		AddBuff( OwnerID() ,505547 , PlayerLV , -1 ) -- 最終衝擊
		AddBuff( OwnerID() ,505548 , PlayerLV , -1 ) -- 萬夫莫敵
		elseif X==2 then
		AddBuff( OwnerID() ,505546 , PlayerLV , -1 ) -- 驚懼戰吼
		AddBuff( OwnerID() ,505547 , PlayerLV , -1 ) -- 最終衝擊
		elseif X == 1 then
		AddBuff( OwnerID() ,505546 , PlayerLV , -1 ) -- 驚懼戰吼
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorShield() -- 防禦姿態

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) -- 取得玩家等級
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2)

	if CheckBuff( OwnerID() , 504193 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_DUEL_ERROR_1]" , 0 )
		return
	else
	CancelBuff( OwnerID() ,504192 ) -- 橫掃千軍 被動技能
	CancelBuff( OwnerID() ,504194 ) -- 心靈衝擊 被動技能

-------------------------------------------------------------------劍
	CancelBuff( OwnerID() ,505544 ) -- 聚炎擊
	CancelBuff( OwnerID() ,505545 ) -- 血腥纏繞
	CancelBuff( OwnerID() ,505546 ) -- 驚懼戰吼
	CancelBuff( OwnerID() ,505547 ) -- 最終衝擊
	CancelBuff( OwnerID() ,505548 ) -- 萬夫莫敵
-------------------------------------------------------------------杖
	CancelBuff( OwnerID() ,505564 ) -- 千風綻放
	CancelBuff( OwnerID() ,505565 ) -- 逐空之歌
	CancelBuff( OwnerID() ,505566 ) -- 神聖審判
	CancelBuff( OwnerID() ,505567 ) -- 希望之光
	CancelBuff( OwnerID() ,505568 ) -- 自然本源

	AddBuff( OwnerID() ,504193 , 0, -1) -- 鋼鐵壁壘 被動技能

	AddBuff( OwnerID() ,505554  , PlayerLV , -1) -- 冰霜擊
	AddBuff( OwnerID() , 505555 , PlayerLV , -1 )

		if X == 3 then
			AddBuff( OwnerID() , 505556 , PlayerLV , -1 ) -- 無盡懺悔
			AddBuff( OwnerID() , 505557 , PlayerLV , -1 ) -- 霜願守護
			AddBuff( OwnerID() , 505558 , PlayerLV , -1 ) -- 零度空間
		elseif X==2 then
			AddBuff( OwnerID() , 505556 , PlayerLV , -1 ) -- 無盡懺悔
			AddBuff( OwnerID() , 505557 , PlayerLV , -1 ) -- 霜願守護
		elseif X == 1 then
			AddBuff( OwnerID() , 505556 , PlayerLV , -1 ) -- 無盡懺悔
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorMenuStaff() -- 法術姿態

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) -- 取得玩家等級
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3)

	if CheckBuff( OwnerID() , 504194 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_DUEL_ERROR_1]" , 0 )
		return
	else
	CancelBuff( OwnerID() ,504192 ) -- 橫掃千軍 被動技能
	CancelBuff( OwnerID() ,504193 ) -- 鋼鐵壁壘 被動技能

-------------------------------------------------------------------劍
	CancelBuff( OwnerID() ,505544 ) -- 聚炎擊
	CancelBuff( OwnerID() ,505545 ) -- 血腥纏繞
	CancelBuff( OwnerID() ,505546 ) -- 驚懼戰吼
	CancelBuff( OwnerID() ,505547 ) -- 最終衝擊
	CancelBuff( OwnerID() ,505548 ) -- 萬夫莫敵
-------------------------------------------------------------------盾
	CancelBuff( OwnerID() ,505554 ) -- 冰霜擊
	CancelBuff( OwnerID() ,505555 ) -- 霜之障壁
	CancelBuff( OwnerID() ,505556 ) -- 無盡懺悔
	CancelBuff( OwnerID() ,505557 ) -- 霜願守護
	CancelBuff( OwnerID() ,505558 ) -- 零度空間

	AddBuff( OwnerID() ,504194 , 0, -1) -- 心靈衝擊 被動技能

	AddBuff( OwnerID() , 505564 , PlayerLV , -1 ) -- 千風綻放
	AddBuff( OwnerID() , 505565 , PlayerLV , -1 ) -- 逐空之歌
		if X == 3 then
			AddBuff( OwnerID() , 505566 , PlayerLV , -1 ) -- 神聖審判
			AddBuff( OwnerID() , 505567 , PlayerLV , -1 ) -- 希望之光
			AddBuff( OwnerID() , 505568 , PlayerLV , -1 ) -- 自然本源
		elseif X== 2 then
			AddBuff( OwnerID() , 505566 , PlayerLV , -1 ) -- 神聖審判
			AddBuff( OwnerID() , 505567 , PlayerLV , -1 ) -- 希望之光
		elseif X == 1 then
			AddBuff( OwnerID() ,505566 , PlayerLV , -1 ) -- 神聖審判
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Guildwarrior_Buff()

	local Buff = { 505546 , 505547 , 505548 , 505556 , 505557 ,  505558 , 505566 , 505567 , 505568 }
	local Buff2 = { 505763 } -- 戰鬥手冊
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) -- 取得玩家等級
--	say( OwnerID() , "1") --玩家
--	say( TargetID() , "2") --玩家

	if  CheckBuff( OwnerID() , 504192 ) == false and CheckBuff( OwnerID() , 504193 ) == false and CheckBuff( OwnerID() , 504194 ) == false then
			AddBuff( OwnerID() , Buff2[1] , 0 , -1 )	
	elseif CheckBuff( OwnerID() , 504192 ) == true then
			if CheckBuff( OwnerID() , Buff[1] ) == false then
				AddBuff( OwnerID() , Buff[1] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 1 ) 
--				say( OwnerID() , "Step 1")
			elseif CheckBuff( OwnerID() , Buff[1] ) == true and  CheckBuff( OwnerID() , Buff[2] ) == false then
				AddBuff( OwnerID() , Buff[2] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 2 ) 
--				say( OwnerID() , "Step 2")
			elseif CheckBuff( OwnerID() , Buff[2] ) == true and  CheckBuff( OwnerID() , Buff[3] ) == false then
				AddBuff( OwnerID() , Buff[3] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 3 ) 
--				say( OwnerID() , "Step 3")
			elseif CheckBuff( OwnerID() , Buff[2] ) == true and  CheckBuff( OwnerID() , Buff[3] ) == true then
				AddBuff( OwnerID() , Buff2[1] , 0 , -1 )
--				say( OwnerID() , "Step 4")
			end
	elseif CheckBuff( OwnerID() , 504193 ) == true then
			if CheckBuff( OwnerID() , Buff[4] ) == false then
				AddBuff( OwnerID() , Buff[4] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 1 ) 
			elseif CheckBuff( OwnerID() , Buff[4] ) == true and  CheckBuff( OwnerID() , Buff[5] ) == false then
				AddBuff( OwnerID() , Buff[5] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 2 ) 
			elseif CheckBuff( OwnerID() , Buff[5] ) == true and  CheckBuff( OwnerID() , Buff[6] ) == false then
				AddBuff( OwnerID() , Buff[6] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 3 ) 
			elseif CheckBuff( OwnerID() , Buff[5] ) == true and  CheckBuff( OwnerID() , Buff[6] ) == true then
				AddBuff( OwnerID() , Buff2[1] , 0 , -1 )
			end
	elseif CheckBuff( OwnerID() , 504194 ) == true then
			if CheckBuff( OwnerID() , Buff[7] ) == false then
				AddBuff( OwnerID() , Buff[7] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 1 ) 
			elseif CheckBuff( OwnerID() , Buff[7] ) == true and  CheckBuff( OwnerID() , Buff[8] ) == false then
				AddBuff( OwnerID() , Buff[8] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 2 ) 
			elseif CheckBuff( OwnerID() , Buff[8] ) == true and  CheckBuff( OwnerID() , Buff[9] ) == false then
				AddBuff( OwnerID() , Buff[9] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 3 ) 
			elseif CheckBuff( OwnerID() , Buff[8] ) == true and  CheckBuff( OwnerID() , Buff[9] ) == true then
				AddBuff( OwnerID() , Buff2[1] , 0 , -1 )
			end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildWarriorDead() -- 在隱藏物件上執行，判斷玩家是否死亡

	BeginPlot( OwnerID() , "Lua_Hao_GuildWarriorDelNPC" , 0 )

	while true do	--判斷玩家有無死亡
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
		local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register ) -- 讀取Reg值，讓NPC記起玩家
		local QNPC = ReadRoleValue( PlayerID , EM_RoleValue_Register+4  )   -- 讀取Reg值，讓玩家記起 Register+4 為任務NPC
		local Count = SetSearchAllPlayer(RoomID)
		local A = DeadCount[RoomID]
		local Score = ScoreCount[RoomID]
	--	DebugMsg( 0 , RoomID , "DeadCount = "..A )
	--	DebugMsg( 0 , RoomID , "DeadCount = "..Score )

	--	Say( QNPC , "Hello")
		if count ~= 0 then -- 如果room還有玩家則執行
			if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ==1 then -- 如果隱藏NPC的PID值為1 則 break
				break				
			end
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()  -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件
				Obj = Role:New( ID ) -- 等同於 ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = 資料庫內的ID
				if Obj:IsPlayer() == True then
					if ReadRoleValue( PlayerID , EM_RoleValue_IsDead ) == 1 then --是不是Player死亡
--					ScriptMessage( OwnerID() , -1 , 0,"Dead", C_SYSTEM ) 
--					Say( PlayerID , "Dead")-- Player	
						ScriptMessage( PlayerID ,  -1, 2, "[SC_GUILD_WARRIOR_8]" , C_SYSTEM ) 	--試鍊結束
						Setflag( PlayerID , 542177 , 1 ) -- 給予挑戰旗標
						SetSmallGameMenuType( PlayerID , 7 , 2 )		--關閉介面
						ClockClose( PlayerID )	-- 關閉計數器
						Delobj(QNPC)
						WriteRoleValue( PlayerID , EM_RoleValue_Register , 0 ) -- 記錄分數
						WriteRoleValue( PlayerID , EM_RoleValue_Register+1 , 0 ) -- 記錄攻擊姿態
						WriteRoleValue( PlayerID , EM_RoleValue_Register+2 , 0 ) -- 記錄防禦姿態
						WriteRoleValue( PlayerID , EM_RoleValue_Register+3 , 0 ) -- 記錄魔法姿態
						WriteRoleValue( PlayerID , EM_RoleValue_Register+4 , 0 ) -- 記錄起始NPC&過關與否
						WriteRoleValue( PlayerID , EM_RoleValue_Register+5 , 0 ) -- 記錄分數多寡並給允玩家榮譽點數
						WriteRoleValue( PlayerID , EM_RoleValue_Register+6 , 0 ) -- 讓玩家忘記隱藏物件
						WriteRoleValue( PlayerID , EM_RoleValue_Register+7, 0 ) -- 跨Zone記錄校場分數用
						AddRoleValue( PlayerID , EM_RoleValue_Honor , Score )--給予榮譽值
						WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 ) -- 寫入PID值，進隱藏NPC
						ScriptMessage( PlayerID , -1 , 0 , "[SC_GUILD_WARRIOR_1][$SETVAR1="..A.."]" , C_SYSTEM ) 		--對話視窗
						ScriptMessage( PlayerID , -1 , 0 , "[SC_GUILD_WARRIOR_2][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--對話視窗
						ScriptMessage( PlayerID , -1 , 1 , "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--你獲得了 [$VAR1] 點榮譽點數
						ScriptMessage( PlayerID , -1 , 0 , "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--你獲得了 [$VAR1] 點榮譽點數

						local OldScore = ReadRoleValue( PlayerID , EM_LuaValueFlag_UseItem6 ) -- 記錄最高分數
							if OldScore == 0 then
								WriteRoleValue( PlayerID , EM_LuaValueFlag_UseItem6  , Score )	
							elseif OldScore >= Score then
							--	return false
							elseif OldScore < Score then
								ScriptMessage( PlayerID ,  -1, 2, "[SC_GUILD_WARRIOR_19][$SETVAR1="..Score.."]" , C_SYSTEM )
								--恭喜你打破了之前保持的榮譽點數記錄，現在的記錄為<CY>[$VAR1]</CY>，這次的試煉到此為止，期待你下次的表現。
								ScriptMessage( PlayerID ,  -1, 0, "[SC_GUILD_WARRIOR_19][$SETVAR1="..Score.."]" , C_SYSTEM )
								--恭喜你打破了之前保持的榮譽點數記錄，現在的記錄為<CY>[$VAR1]</CY>，這次的試煉到此為止，期待你下次的表現。
								WriteRoleValue( PlayerID , EM_LuaValueFlag_UseItem6  , Score )
							end

						Lua_Hao_Guildwarrior_Clear() -- 清除場面上所有怪物
						BeginPlot( PlayerID , "Lua_Hao_GuildwarriorMenu_reset" , 0 )
--						Lua_Hao_GuildwarriorMenu_reset() -- 清除法術的CD時間
					else
--					ScriptMessage( OwnerID() , -1 , 0,"Live", C_SYSTEM ) 
--					Say( PlayerID , "Live")-- Player	
					end
				end
			end
	--	elseif count == 0 then		-- 2010/11/02 修正遊戲進行中關掉重登，若使用公會校場重置卷，進入後會看到兩隻NPC的問題
	--		DelObj(QNPC)
		end
	sleep(10)
	end
end

function Lua_Hao_GuildwarriorNPC_5( Player , Range )	-- 2011.06.13 修正遊戲進行中關掉重登及卡點回報時，若使用公會校場重置卷，進入後會看到兩隻NPC的問題

	while true do
		if CheckID(Player) == false then	-- 如果玩家不在此區域
			DelObj( OwnerID() )
			break
		elseif CheckDistance( OwnerID() , Player , Range ) == false then	-- 如果玩家不在此校場範圍內
			BeginPlot( Player , "Lua_Hao_Guildwarrior_mission" , 0 )
			DelObj( OwnerID() )
			break
		end
		sleep(10)
	end
--	while true do	--由 NPC 自己判斷是否要刪除自己
--	--	Say( OwnerID() , "ok" )
--		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--		local Count = SetSearchAllPlayer( RoomID )
--	--	Say( OwnerID() , "Count ="..Count )
--		if Count == 0 then	-- 2010/11/02 修正遊戲進行中關掉重登，若使用公會校場重置卷，進入後會看到兩隻NPC的問題
--			DelObj( OwnerID() )
--			break
--		end
--	sleep(10)
--	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildWarriorDelNPC()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	Sleep(9600)	-- 16分鐘後，刪除神鬼戰士場上所有怪物及自己。
	Lua_Hao_Guildwarrior_Clear()
--	BeginPlot( OwnerID() , "Lua_Hao_Guildwarrior_Clear" , 0 )	
--	DelObj( OwnerID() )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_ResetUseItem6() -- 清空 Useitem 6 的值
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6 , 0 )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SayUseItem6() -- 說出 UseItem 6 的值
	local UseItem = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6 )
	say( OwnerID() , UseItem )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Guild_War_Key()
	Setflag( OwnerID() , 542177 , 0 )
end
------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Guildwarrior_Clear() -- 清除場面上所有怪物

--	say( OwnerID() , "1") --玩家
--	say( TargetID() , "2") --玩家
	local Box = 113105
	local BoxReady = 0
	local TempObj = {	102487 , 103288 , 103289 ,
				102488 , 101270 , 103290 ,
				102489 , 102059 , 102062 ,
				102490 , 102080 , 102081 ,
				102491 , 102089 , 102061 ,
				102492 , 102098 , 102102 	}

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local T1Obj
	local T1Count = SetSearchRangeInfo( OwnerID() , 5000 )
	for i = 1 , T1Count , 1 do
--		Say( OwnerID() , "OrgID="..TempObj[i] )
		local T1ID = GetSearchResult()
		T1Obj = Role:New( T1ID )	
		if T1Obj:RoomID() == RoomID and T1Obj:IsPlayer() == false then
			local FlagOrgID = T1Obj:OrgID()
			for i = 1 , table.getn(TempObj) do
				if (FlagOrgID == TempObj[i]) then
					DelObj(T1ID)
				end
				if (FlagOrgID == Box ) then
					BoxReady = T1ID
				end
			end
		end
	end
	if BoxReady ~= 0 then
		DelObj(BoxReady)
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildwarriorMenu_reset() -- 清除法術的CD時間

	Lua_Hao_ResetColdown( OwnerID() , 494846 , 0) --驚懼戰吼
	Lua_Hao_ResetColdown( OwnerID() , 494848 , 0) --萬夫莫敵
	Lua_Hao_ResetColdown( OwnerID() , 494850 , 0) --霜之障壁
	Lua_Hao_ResetColdown( OwnerID() , 494851 , 0) --無盡懺悔
	Lua_Hao_ResetColdown( OwnerID() , 494852 , 0) --霜願守護
	Lua_Hao_ResetColdown( OwnerID() , 494853 , 0) --零下領域
	Lua_Hao_ResetColdown( OwnerID() , 494856 , 0) --神聖審判
	Lua_Hao_ResetColdown( OwnerID() , 494857 , 0) --希望之光
	Lua_Hao_ResetColdown( OwnerID() , 494858 , 0) --自然本源
end
-------------------------------------------------------------------------------------------------------------------