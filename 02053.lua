
function lua_mika_wolfcome_npc_00()	-- 與NPC對話 初始劇情
--	say(OwnerID() , "3" ) --玩家
--	say(TargetID() , "4" ) --NPC

	local PlayerJob = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  )	-- 職業
	local todayplay = CheckFlag( OwnerID() , 542249 )				-- 今天玩過

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向

	if CheckBuff( OwnerID() , 503783 ) == true then
			SetSpeakDetail( OwnerID() , "[GUILD_TC_HITPLATYPUS_27]"   ) --你身上擁有命運指環的效果，無法進行遊戲。  
	else
		if todayplay == false or PlayerJob == 0 then
			SetSpeakDetail( OwnerID() , "[SC_TRAIN10_NPC_SPEAK01]"  ) --你聽，這不是狼群的嚎叫聲嗎？ (當天還沒解過, 初始對話 )
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_TRAIN10_NPC_SPEAK02]" , "lua_mika_wolfcome_npc_01", 0 )--我該怎麼幫助你？ ( 遊戲說明)
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_TRAIN10_NPC_SPEAK04]" , "lua_mika_wolfcome_npc_02" , 0 )--開始遊戲 
		elseif todayplay == true then
			SetSpeakDetail(  OwnerID(), "[SC_TRAIN10_NPC_SPEAK08]"  ) -- (當天解過)
		end
	end
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TRAIN10_NPC_SPEAK09]"  , "lua_mika_wolfcome_leave", 0 )--離開此遊戲
end

function lua_mika_wolfcome_npc_01() --  我該怎麼幫助你? (副本遊戲規則)
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向

	SetSpeakDetail( OwnerID() , "[SC_TRAIN10_NPC_SPEAK05]" )   --規則內容
	AddSpeakOption( OwnerID() , TargetID( ) , "[SC_111352_2]" , "lua_mika_wolfcome_npc_00" , 0 )--回上一頁 (返回 主頁)
end

function lua_mika_wolfcome_npc_02() --  開始遊戲 (副本遊戲規則)

	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )

	CloseSpeak(OwnerID())

--	say(OwnerID() , "OwnerID" ) --玩家
--	say(TargetID() , "TargetID" ) --NPC
--	Say(OwnerID(), "Start the game" ) 

-- 將活動NPC隱藏

	SetModeEx( TargetID() , EM_SetModeType_Show , false )--顯示
	SetModeEx( TargetID() , EM_SetModeType_Mark , false )--標記


	if GuildWolfcomeScore  == nil then	-- 宣告全域變數
		GuildWolfcomeScore  = {}
	end

	GuildWolfcomeScore[RoomID] = 0   -- 將這ROOM的變數 (分數) 歸零

	ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_01]" , C_SYSTEM )  --請在時間內，帶領羊鴕到前方草地上吃草，並帶回對面的農場。
	ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_01]" , C_SYSTEM )  

	Setflag(OwnerID(), 542249 , 1 )  -- 給 今天已參加過教場10 重要物品
	ClockOpen( OwnerID() , EM_ClockCheckValue_24 , 300, 300 , 0 , "lua_mika_wolfcome_close2" , "lua_mika_wolfcome_close1" ) --倒數計時器  ( 函式： "換區消失"，"時間到時呼叫函式" )
	AddBuff(OwnerID(), 506289, 0 , 300 )  -- 給專用技能 

	SetSmallGameMenuType( OwnerID() , 14 , 1 ) ---- 開啟介面  (記分板，填1為創造，填2為關閉)
	SetSmallGameMenuStr( OwnerID() , 14 , 1 , "[SC_TRAIN10_INTERFACE_01]" ) -- 狼來了
	SetSmallGameMenuStr( OwnerID() , 14 , 2 , "[SC_TRAIN10_INTERFACE_02][$SETVAR1="..GuildWolfcomeScore[RoomID].."]" ) -- <CY>分數：</CY>[$VAR1]

	Beginplot(TargetID(), "lua_mika_welcome_playercheck", 0 )  --讓任務npc 開始執行檢查周圍玩家是否存在
	Beginplot(TargetID(), "lua_mika_wolfcome_objborn" , 0 )  -- 產生中控物件 (場面上其它物件由中控器產出)
	Beginplot(TargetID(), "lua_mika_wolfcome_checkborn" , 0 )  -- 產生距離驅趕物件 
end

function lua_mika_wolfcome_checkborn()
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )

--	Say(OwnerID(), "checkobj born")

	local checkobj ={}
	for i = 0,8 do  --9個
		checkobj[i] = CreateObjByFlag(117053,780821, i ,1)
		SetModeEx( checkobj[i], EM_SetModeType_Show, false )--顯示 (false)
		SetModeEx( checkobj[i], EM_SetModeType_Mark, false )--標記 (false)
		AddToPartition( checkobj[i] , RoomID )
	end

	Beginplot(checkobj[0], "lua_mika_wolfcome_control_R2" , 0 )  --250
	Beginplot(checkobj[1], "lua_mika_wolfcome_control_R1" , 0 )   -- 160
	Beginplot(checkobj[2], "lua_mika_wolfcome_control_R1" , 0 )   -- 160
	Beginplot(checkobj[3], "lua_mika_wolfcome_control_R1" , 0 )   -- 160
	Beginplot(checkobj[4], "lua_mika_wolfcome_control_R3" , 0 )   -- 200
	Beginplot(checkobj[5], "lua_mika_wolfcome_control_R1" , 0 )  -- 160

	Beginplot(checkobj[6], "lua_mika_wolfcome_control_RR" , 0 )  -- 羊專用掃山坡 200
	Beginplot(checkobj[7], "lua_mika_wolfcome_control_RR" , 0 )  -- 羊專用掃山坡 200

	Beginplot(checkobj[8], "lua_mika_wolfcome_control_04" , 0 )   -- 中央偵測物件 350

--	Say(OwnerID(), "checkobj born end")
end

--活動開始 生出各物件
function lua_mika_wolfcome_objborn()
--	say(OwnerID() , "OwnerID 1" ) ---NPC

	-- 生出各中控物件
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )

	local com1 = CreateObjByFlag(117053 , 780823, 0 ,1) 
	SetModeEx( com1, EM_SetModeType_Show, false )--顯示 (false)
	SetModeEx( com1, EM_SetModeType_Mark, false )--標記 (false)
	AddToPartition( com1 , RoomID )
	
	local com2 = CreateObjByFlag(117053 , 780823, 1 ,1) 
	SetModeEx( com2, EM_SetModeType_Show, false )--顯示 (false)
	SetModeEx( com2, EM_SetModeType_Mark, false )--標記 (false)
	AddToPartition( com2 , RoomID )

	local com3 = CreateObjByFlag(117053 , 780823, 2 ,1) 
	SetModeEx( com3, EM_SetModeType_Show, false )--顯示 (false)
	SetModeEx( com3, EM_SetModeType_Mark, false )--標記 (false)
	AddToPartition( com3 , RoomID )


	local com4 = CreateObjByFlag(117053 , 780823, 3 ,1) 
	SetModeEx( com4, EM_SetModeType_Show, false )--顯示 (false)
	SetModeEx( com4, EM_SetModeType_Mark, false )--標記 (false)
	AddToPartition( com4, RoomID )

	BeginPlot (com1, "lua_mika_wolfcome_control_01" , 0 )  -- 狼  控制器
	BeginPlot (com2, "lua_mika_wolfcome_control_02" , 0 )  -- 羊  控制器 ok
	BeginPlot (com3, "lua_mika_wolfcome_control_03" , 0 )  -- 草 控制器
	BeginPlot (com4, "lua_mika_wolfcome_control_05" , 0 )  --  牧場偵測點

--	DebugMsg( 0 , 0 , "obj born ok" )

end
--------------------------------------------
-- 離開此遊戲
function lua_mika_wolfcome_leave()
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )

--	say(OwnerID() , "OwnerID" )  -- player 
--	say(TargetID() , "TargetID" )  -- NPC

	CloseSpeak(OwnerID())
	CancelBuff(OwnerID(), 506289 )  -- 清除專用技能 
	SetSmallGameMenuType( OwnerID() , 14 , 2 )	-- 關閉介面  (記分板，填1為創造，填2為關閉)
	ClockClose( OwnerID() ) 			-- 關閉計數器

	SetModeEx( TargetID() , EM_SetModeType_Show , True )--顯示
	SetModeEx( TargetID() , EM_SetModeType_Mark ,  True )--標記

	-- 傳回教場教官位置
	ChangeZone( OwnerID(), 354 , RoomID , 5122 , 13, 2527, 270 )	--ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  

end

--------------------------------------------
--計時器執行劇情 (執行在玩家身上)
--------------------------------------------
-- 告知玩家分數. 加榮譽值,  清除計時器,計分板,   將玩家傳送回教官位置

function lua_mika_wolfcome_close1() 	--結束遊戲 (時間到)
--	DebugMsg( 0 , 0 , "time out start" )

	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
--	say(OwnerID() , "OwnerID" )  -- Player

	local score = GuildWolfcomeScore[RoomID]
	local reward = score*10

	DebugMsg( 0 , 0 , "score = "..score )
	DebugMsg( 0 , 0 , "reward = "..reward )

	--宣布得分 轉換榮譽點數
	local NPC = Lua_Hao_NPC_Closest_Search( OwnerID() , 117051  , 1600 )-- 以Owner為中心做范圍搜尋，回傳最接近的物件  (2011.11.22 修改範圍數值為1600)
--	Say(NPC, "SHOW")
	SetModeEx( NPC , EM_SetModeType_Show , True )--顯示
	SetModeEx( NPC , EM_SetModeType_Mark , True)--標記

	ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_05][$SETVAR1="..score.."]" , C_SYSTEM )  -- 遊戲結束，你這次的得分為：[$VAR1]
	ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_05][$SETVAR1="..score.."]" , C_SYSTEM )  -- 遊戲結束，你這次的得分為：[$VAR1]
	ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_06]" , C_SYSTEM )-- 本次的試煉結束了，依照獲得的積分將轉為增加你的榮譽值。
	ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_06]" , C_SYSTEM )
	AddRoleValue( OwnerID() , EM_RoleValue_Honor , reward )--給予榮譽值
	ScriptMessage( OwnerID(),  -1, 1, "[SC_GUILD_WARRIOR_15][$SETVAR1="..reward.."]" , C_SYSTEM ) 	--你獲得了 [$VAR1] 點榮譽點數
	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_15][$SETVAR1="..reward.."]" , C_SYSTEM ) 	--你獲得了 [$VAR1] 點榮譽點數	

	CancelBuff(OwnerID(), 506289 )  -- 清除專用技能 
	SetSmallGameMenuType( OwnerID() , 14 , 2 )	-- 關閉介面  (記分板，填1為創造，填2為關閉)
	ClockClose( OwnerID() ) 			-- 關閉計數器	
	ChangeZone( OwnerID(), 354 , RoomID , 5122 , 13, 2527, 270 )	--ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  

	DebugMsg( 0 , 0 , "time out end" )

end

--清除計時器,計分板, 
function lua_mika_wolfcome_close2() 	--結束遊戲 (換區)

	DebugMsg( 0 , 0 , "change zone event start" )

	CancelBuff(OwnerID(), 506289 )  -- 清除專用技能 
	SetSmallGameMenuType( OwnerID() , 14 , 2 )	-- 關閉介面  (記分板，填1為創造，填2為關閉)
	ClockClose( OwnerID() ) 			-- 關閉計數器

	DebugMsg( 0 , 0 , "change zone event end" )
	
end


---------------------------
-- 每秒檢查此區域是否有玩家存在, 如果沒有就刪在場所有運作的物件
-- 時間到時刪除場面上相關npc

function lua_mika_welcome_playercheck()
-- OwnerID -- NPC

	local time = 300 

	while true do 
		time = time -1
		local Player = SearchRangePlayer( OwnerID() , 1600 ) --判斷附近是否有玩家 1600/2 = 800 (2012.05. 29 修改範圍數值為2000)
	--	Tell( player[0], OwnerID(),  "time = "..time )  --密語   受話人,發話人,string
		sleep(10)  -- 間隔檢查時間
		if table.getn(player) > 0 then
	--	if CheckID( Player[0] ) == true then	--如果附近XX內有玩家
			local Dis = GetDistance(OwnerID(), player[0])
		--	Tell( player[0], OwnerID(),  "dis = "..Dis )  --密語   受話人,發話人,string
		--	Tell( player[0], OwnerID(),  "ok ok" )  --密語   受話人,發話人,string
		else
		--	Tell( player[0], OwnerID(),  "player is not here" )  --密語   受話人,發話人,string
		--	Tell( player[0], OwnerID(),  "kill all npc" )  --密語   受話人,發話人,string

			sleep(10)
			DebugMsg( 0 , 0 , "player is not here" )

		--	Say(OwnerID(), "SHOW")
			SetModeEx( OwnerID() , EM_SetModeType_Show , True )--顯示
			SetModeEx( OwnerID() , EM_SetModeType_Mark , True )--標記
			Beginplot(OwnerID(), "lua_mika_wolfcome_delobj" , 0 )
			break
		end

		if time  == 0 then
			DebugMsg( 0 , 0 , "time is over" )
		--	Say(OwnerID(), "SHOW")
			SetModeEx( OwnerID() , EM_SetModeType_Show , True )--顯示
			SetModeEx( OwnerID() , EM_SetModeType_Mark , True )--標記
			Beginplot(OwnerID(), "lua_mika_wolfcome_delobj" , 0 )
			break
		end

	end
end


-- 刪除所有生出物件 ( 狼, 羊 , 草 , 石堆 , 控制器 ) 
function lua_mika_wolfcome_delobj()
	local TempObj = {117052, 117050, 117053, 105023, 105024  }
	for i = 1 ,table.getn(TempObj) do
		Lua_DavisDelObj(TempObj[i])
	end
	DebugMsg( 0 , 0 , "delete ok" )
end

--117052 --牧草
--117050 --石堆
--117053 --隱藏物件(中控器)
--105023 --羊鴕
--105024 --狼
------------------------------------------

--測試專用指令

-- 進行中若需重新開始
function lua_mika_wolfcome_test01()

	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
--	say(OwnerID() , "OwnerID" )  -- Player

	DebugMsg( 0 , 0 , "RESET GAME 10" )

	local NPC = Lua_Hao_NPC_Closest_Search( OwnerID() , 117051  , 800 )-- 以Owner為中心做范圍搜尋，回傳最接近的物件 (2011.11.22 修改範圍數值為1600)
	Say(NPC, "SHOW")
	SetModeEx( NPC , EM_SetModeType_Show , True )--顯示
	SetModeEx( NPC , EM_SetModeType_Mark , True )--標記

	BeginPlot(OwnerID(), "lua_mika_wolfcome_delobj" , 0 )

	local score = GuildWolfcomeScore[RoomID]
	local reward = score*10

--	DebugMsg( 0 , 0 , "score = "..score )
--	DebugMsg( 0 , 0 , "reward = "..reward )

	--宣布得分 轉換榮譽點數
	ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_05][$SETVAR1="..score.."]" , C_SYSTEM )  -- 遊戲結束，你這次的得分為：[$VAR1]
	ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_05][$SETVAR1="..score.."]" , C_SYSTEM )  -- 遊戲結束，你這次的得分為：[$VAR1]
	ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_06]" , C_SYSTEM )-- 本次的試煉結束了，依照獲得的積分將轉為增加你的榮譽值。
	ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_06]" , C_SYSTEM )
	FN_GuildGame_Honor( OwnerID(), reward )
--	AddRoleValue( OwnerID() , EM_RoleValue_Honor , reward )--給予榮譽值
--	ScriptMessage( OwnerID(),  -1, 1, "[SC_GUILD_WARRIOR_15][$SETVAR1="..reward.."]" , C_SYSTEM ) 	--你獲得了 [$VAR1] 點榮譽點數
--	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_15][$SETVAR1="..reward.."]" , C_SYSTEM ) 	--你獲得了 [$VAR1] 點榮譽點數	

	CancelBuff(OwnerID(), 506289 )  -- 清除專用技能 
	SetSmallGameMenuType( OwnerID() , 14 , 2 )	-- 關閉介面  (記分板，填1為創造，填2為關閉)
	ClockClose( OwnerID() ) 			-- 關閉計數器	

	Setflag(OwnerID(), 542249, 0)

	DebugMsg( 0 , 0 , "RESET GAME 10 OK !!" )
end