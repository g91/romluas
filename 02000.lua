-- 玩家
-- EM_RoleValue_Register 	讓玩家記得教官
-- EM_RoleValue_Register+1	讓玩家記得開場隱藏物件
-- EM_RoleValue_Register+2	球體追蹤模式 1為追蹤 0為不追蹤
-- EM_RoleValue_Register+3	讓玩家記得碰觸黃球後的隱形物件
-- EM_RoleValue_Register+3	讓玩家記得目前播放的音效
-- 教官
-- EM_RoleValue_Register 	記錄玩家是否玩過此活動
-- EM_RoleValue_Register+2	讓教官記得玩家
-- 開場隱藏物件
-- 碰觸黃球後的隱形物件
-- EM_RoleValue_Register+2 讓物件記得玩家
-- 移動球體
-- EM_RoleValue_Register	模式
-- EM_RoleValue_Register+1	讓球體記得玩家
-- EM_RoleValue_Register+3	讓球體記得觸碰隱藏物件

function Lua_Hao_GuildBall_NPC()	-- 傳送後靠近NPC觸發劇情
	SetPlot( OwnerID() , "range" , "Lua_Hao_GuildBall_NPC_2" , 150 )
end

function Lua_Hao_GuildBall_NPC_2()	-- 表演劇情
--	say(OwnerID() , "1" ) --玩家
--	say(TargetID() , "2" ) --NPC
	local Face = { 109 , 114 }	-- 快過來，訓練課程已經準備好了。 , 想要學習更完美的技巧嗎?
	local String = { "[SC_GUILD_BARRAGE_3]" , "[SC_GUILD_BARRAGE_4]" }

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then 	-- 讓 NPC 表演劇情
		return
	else
		WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , OwnerID() )	-- 將玩家寫入NPC 116472 中
	--	local Player = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )
		CallPlot( TargetID() , "Lua_Hao_GuildBall_NPC_5" , OwnerID() , 500 )		-- 避免遊戲進行中關掉重登，若使用公會校場重置卷，進入後會看到兩隻NPC的問題
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		for i = 1 , table.getn(Face) , 1 do
			Sleep(20)
			AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
			PlayMotion( TargetID() , Face[i] ) -- 指向
			ScriptMessage( TargetID() , OwnerID() , 2 , String[i] , 0 )
			ScriptMessage( TargetID() , OwnerID() , 0 , String[i] , 0 )
		end
	end
end

function Lua_Hao_GuildBall_NPC_3()	-- 與NPC對話後的劇情
--	say(OwnerID() , "3" ) --玩家
--	say(TargetID() , "4" ) --NPC

	local PlayerJob = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  )	-- 職業
	local Bonus = ReadRoleValue( TargetID() , EM_RoleValue_Register  )	-- NPC身上的Reg值，用來記錄玩家是否玩過此活動	未使用
	local Highest = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem20 )	-- 積分的最高記錄
	local Ticket = CheckFlag( OwnerID() , 542248 )				-- 票

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	PlayMotion( TargetID() , 111 ) --敬禮
	BeginPlot( TargetID() , "Lua_Hao_GuildBall_NPC_4" , 0 )	-- 超過距離50即關閉視窗

	if CheckBuff( OwnerID() , 503783 ) == true then
			SetSpeakDetail( OwnerID() , "[GUILD_TC_HITPLATYPUS_27]"   ) --你身上擁有命運指環的效果，無法進行遊戲。  
	else
	--	if Bonus == 0 or PlayerJob == 0 then
		if Ticket == false or PlayerJob == 0 then
			if Highest ~= 0 then
				SetSpeakDetail( OwnerID() , "[SC_GUILD_BARRAGE_12][$SETVAR1="..Highest.."]" ) --[$PLAYERNAME]，你曾經獲得的榮譽點數最高記錄為<CY>[$VAR1]</CY>，準備好接受挑戰了嗎？
			else
				SetSpeakDetail( OwnerID() , "[SC_GUILD_WARRIOR_16]"  ) --[$PLAYERNAME]，準備好接受挑戰了嗎？
			end
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_GUILD_BARRAGE_5]" , "Lua_Hao_GuildBall_Teaching", 0 )--全面衝突說明
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_GUILD_BARRAGE_6]" , "Lua_Hao_GuildBall_Begin " , 0 )--進行 <CB>全面衝突</CB>
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_CLICKFUNGO04]" , "Lua_Hao_GuildBall_Leave", 0 )--離開校場
	--	elseif Bonus == 101 then
		elseif Ticket == true then
			SetSpeakDetail(  OwnerID(), "[SC_GUILD_WARRIOR_12]"  ) -- 這次的試煉到此為止，期待你下次的表現。
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "Lua_Hao_GuildBall_Leave", 0 )--離開校場
		end
	end
end

function Lua_Hao_GuildBall_NPC_4()	-- 關閉對話劇情
--	say(OwnerID() , "IamNPC" ) --NPC
--	say(TargetID() , "IamPlayer" ) --玩家

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			break
		end
		sleep(5)
	end
end

function Lua_Hao_GuildBall_NPC_5( Player , Range )		-- 避免遊戲進行中關掉重登，若使用公會校場重置卷，進入後會看到兩隻NPC的問題

	while true do	--由 NPC 自己判斷是否要刪除自己
		if CheckID(Player) == false then
			DelObj( OwnerID() )
			break
		elseif CheckDistance( OwnerID() , Player , Range ) == false then
			BeginPlot( Player , "Lua_Hao_GuildBall_Del_NPC" , 0 )
			DelObj( OwnerID() )
			break
		end
		sleep(10)
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildBall_Teaching() -- 『全面衝突』課程注意事項：
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --面向
	PlayMotion( TargetID() , 112 ) 
	SetSpeakDetail( OwnerID() , "[SC_GUILD_BARRAGE_7]" ) 
	AddSpeakOption( OwnerID() , TargetID( ) , "[SC_111352_2]" , "Lua_Hao_GuildBall_NPC_3" , 0 )--回上一頁
end

function Lua_Hao_GuildBall_Leave()--離開訓練場

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	CloseSpeak( OwnerID() ) 	
	ChangeZone( OwnerID() , 354 , RoomID , 5121.3 , 13.4 , 2515.2 , 269.9 )	--ChangeZone( OwnerID() , ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x , y , z , Dir )
	DelObj( TargetID() )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildBall_Begin() -- 準備開始遊戲　將NPC取消標記

	SetModeEx( TargetID() , EM_SetModeType_Show , false )--顯示
	SetModeEx( TargetID() , EM_SetModeType_Mark , false )--標記
	BeginPlot( OwnerID() , "Lua_Hao_GuildBall_LoopClose" , 0 )
	DisableQuest( TargetID() , true )
--	say(OwnerID() , "5" ) --玩家
--	say(TargetID() , "6" ) --NPC
--	DebugMsg( 0 , 0 , "OwnerID:"..OwnerID() )
--	DebugMsg( 0 , 0 , "TargetID:"..TargetID )
--	Hide( TargetID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , TargetID() )  -- 讓玩家記得NPC為 Reg
	Beginplot( OwnerID() , "Lua_Hao_GuildBall_Action" , 0 )
end

function Lua_Hao_GuildBall_LoopClose() -- 每1/100秒關閉一次對話視窗，防止遊戲開始的瞬間，在NPC消失前，玩家還可以點擊NPC帶來的問題。

	local Step = 0

	while Step < 200 do
		for i = 1 , 10 , 1 do
			CloseSpeak( OwnerID() ) 
			Step = Step + 1
		--	DebugMsg( OwnerID() , 0 , "Step = "..Step )
		end
	--	DebugMsg( OwnerID() , 0 , "Step_End = "..Step )
		sleep(1)
	end
end

function Lua_Hao_GuildBall_Action()
-- 可以分為　第一圈、第二圈、第三圈、第四圈、第五圈　(漸進式)移動速度加快等。
--	say(OwnerID() , "5" ) --玩家
--	say(TargetID() , "6" ) --玩家
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

--	DeBugMSG( OwnerID() , 0 , "Start Memory = "..GetMemory() )
	Lua_Hao_Get_Memory()

	local Time = 5

	Lua_Hao_GuildBall_Build_QBox( 113105 , 1 )

	local QNPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	CallPlot( QNPC , "Lua_Hao_GuildBall_Build_Door" , OwnerID() )
--	BeginPlot( QNPC , "Lua_Hao_GuildBall_Build_Door" , 0 )

	local QBOX = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
	WriteRoleValue( QBOX , EM_RoleValue_Register , OwnerID() ) --讓隱藏物件記住玩家
	ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_7]" , C_SYSTEM ) -- 試鍊將在5秒後開始。

	AddBuff( OwnerID() , 506509 , 0 , -1 ) -- 試煉者的証明
	AddBuff( OwnerID() , 506580 , 0 , -1 ) -- 定身，讓玩家不能直接前往打王
	sleep(15)

	LuaDan_HitShrew_CheckOK(5,5,0)--倒數五秒進行

	if GuildBallStep == nil then	-- 波次
		GuildBallStep = {}
	end
	if GuildBallScore == nil then	-- 分數
		GuildBallScore = {}
	end
	if GuildBallSoundID == nil then	-- 音效
		GuildBallSoundID = {}
	end
	
	GuildBallStep[RoomID] = 0
	GuildBallScore[RoomID] = 0
--	GuildBallSoundID[RoomID] = 0

	SetSmallGameMenuType( OwnerID() , 13 , 1 ) --開啟介面 
	SetSmallGameMenuStr( OwnerID() , 13 , 1 , "[SC_GUILD_BARRAGE_1][$SETVAR1="..GuildBallStep[RoomID].."]" ) -- 波次		-- INSTANCE_STATE_13
	SetSmallGameMenuStr( OwnerID() , 13 , 2 , "[SC_GUILD_BARRAGE_2][$SETVAR1="..GuildBallScore[RoomID].."]"  ) -- 分數	-- INSTANCE_SCORE_13
																	-- INSTANCE_TIPS_13
	for i = 1 , 5 , 1 do
	--	ScriptMessage( OwnerID(),  -1 , 1 , "[SC_GUILD_WARRIOR_3][$SETVAR1="..Time.."]" , C_SYSTEM ) --[$VAR1]
		CancelBuff( OwnerID() , 500675 ) -- 拔掉目標潛行
		CancelBuff( OwnerID() , 500745 ) -- 拔掉目標躲藏
		CancelBuff( OwnerID() , 504888 ) -- 拔掉精英技能躲藏
		CancelBuff( OwnerID() , 501909 ) -- 拔掉目標隨風而逝
		CancelBuff( OwnerID() , 500535 ) -- 拔掉聖靈契約
		if Time ==5 then
			ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_20]" , C_SYSTEM )	--	請注意，在競技場的公正試煉下，無法使用原有職業技能。
			ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_20]" , C_SYSTEM )	--	請注意，在競技場的公正試煉下，無法使用原有職業技能。
		elseif Time == 3 then
			ScriptMessage( OwnerID() , -1  , 1 , "[SC_LOSTTREASURE_10]" , C_SYSTEM )	--	祝你好運
		elseif Time == 1 then
			ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_10]" , C_SYSTEM )	--	試鍊開始 !
			ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_10]" , C_SYSTEM )	--	試鍊開始 !
		end
		sleep(10)
		Time = Time - 1
	end
	Setflag( OwnerID() , 542248 , 1 )
	CancelBuff( OwnerID() , 506580 )
	ClockOpen( OwnerID() , EM_ClockCheckValue_23 , 121 ,121 , 0 , "Lua_Hao_GuildBall_Del_NPC" , "Lua_Hao_GuildBall_Del_NPC" ) --倒數計時器  ( 函式： "換區消失"，"時間到時呼叫函式" )
--	PlaySoundToPlayer( OwnerID() , "music\\Guild_Drill_Ground\\9\\ET09_04_JFL_kings_valor.mp3", false )
	BeginPlot( QBOX , "Lua_Hao_GuildBall_Action_2" , 0 )
end

function Lua_Hao_GuildBall_Action_2()
--	say(OwnerID() , "3" ) --隱藏物件
--	say(TargetID() , "4" ) --玩家

	local Job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local LifeBuff , LifeBuff_Icon = 507593 , 507600

--	if Job == 0 then
		CancelBuff( TargetID() , LifeBuff )
		AddBuff( TargetID() , LifeBuff , 9 , -1 )
--	end

	while true do
		local QNPC = { }
		local Flag = 780373	-- 旗標ID
		local Count = { }	-- 物件產生數量
			Count[1] = 1	--3
			Count[2] = 3	--6	
			Count[3] = 6	--9
			Count[4] = 8	--12	
			Count[5] = 12	--15	
		local Array = { }
			Array[1] = { 1,2,3,4,5,6 }											-- 旗標量　第一個圓 6個產生點
			Array[2] = { 7,8,9,10,11,12,13,14,15,16,17,18 }									-- 旗標量　第二個圓 12個產生點
			Array[3] = { 19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36 }						-- 旗標量　第三個圓 18個產生點
			Array[4] = { 37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60 }				-- 旗標量　第四個圓 24個產生點
			Array[5] = { 61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90 }		-- 旗標量　第五個圓 30個產生點
		local DelArray = { }	-- 從Array找出其中一個數值
		local Value = 1
		local SearchFlag	-- 搜尋旗標位置
		local Random

		for i = 1 , 5 , 1 do
			local HideBox = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )	--讀取玩家的 Reg+2 值，若該值為1以上，會追蹤玩家
			local YellowBox = ReadRoleValue( TargetID() , EM_RoleValue_Register+3 )	--讀取玩家的 Reg+3 值，記錄碰觸黃球後產生的隱藏物件
			local RollNPC
		--	Say( TargetID() , "HideBox = "..HideBox )
			if HideBox == 1 then				-- 只生紅球
				QNPC = { 115348 , 115348 , 115348 }	-- 扣分球(紅)
			elseif HideBox == 2 then			-- 只生藍球
				QNPC = { 116470 , 116470 , 116470 }	-- 得分球(藍)
			else
				QNPC = { 115348 , 116470 , 116469 , 116468 , 116471 }		-- 扣分球(紅)、得分球(藍)、特殊球(黃)、特殊球Ex(綠)、備用球(紫)
			end

			for j = 1 , Count[Value] , 1 do	-- 6 12 18 24 30
				Random = Rand(100)+1	-- 全部的球
			--	Random = 91			-- 黃球
				SearchFlag = Rand( table.getn( Array[Value] ) )+1	-- 1 2 3 4 5
				DelArray[j] = Array[Value][SearchFlag]
				if Random <= 50 then				-- 扣分球
					RollNPC = QNPC[1]
				elseif Random > 50 and Random <= 90 then	-- 加分球
					RollNPC = QNPC[2]
				elseif Random > 90 and Random <= 100 then	-- 特殊球
					RollNPC = QNPC[3]
				end

				local NPC = CreateObjByFlag( RollNPC , Flag , DelArray[j]  , 1 )	-- (產生物件ID , 產生旗子ID , 旗子位置ID , 產生數量)
				local ID = ReadRoleValue( NPC , EM_RoleValue_OrgID )		-- 球體ID

				if HideBox ~= 0 then
					WriteRoleValue( NPC , EM_RoleValue_Register , 1 )		-- 將模式寫入球體的 Reg1
					WriteRoleValue( NPC , EM_RoleValue_Register+1 , TargetID() )	-- 將玩家寫入球體的 Reg2
				end

				AddToPartition( NPC , RoomID )
				local DelDate = table.remove( Array[Value] , SearchFlag )
			end
			Value = Value + 1
			sleep(20)
			GuildBallStep[RoomID] = GuildBallStep[RoomID] + 1
			SetSmallGameMenuStr( TargetID() , 13 , 1 , "[SC_GUILD_BARRAGE_1][$SETVAR1="..GuildBallStep[RoomID].."]" ) -- 波次
		end
	end
end

function Lua_Hao_GuildBall_Score_Ball()	-- 得分球、扣分球、特殊球，產生後的執行劇情。
-- O.T 等於隱藏物件
	local Flag = 780373
	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )			-- 球體ID
	local Type = ReadRoleValue( OwnerID() , EM_RoleValue_Register )		-- Type 為1時，產生的球體會追蹤玩家
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local QNPC = { 115348 , 116470 , 116469 , 116468 , 116471 }		-- 扣分球(紅)、得分球(藍)、特殊球(黃)、特殊球Ex(綠)、備用球(紫)
	Sleep(10)
	CallPlot( OwnerID() , "Lua_Hao_GuildBall_Ball_Move" , Type )	-- 普通移動或引力

	if ID == QNPC[1] then
		while true do
		--	for i = 1 , 10 , 1 do	-- 10/1000秒施放一次
				SysCastSpellLv( OwnerID() , TargetID() , 496232 , 0 )
		--	end
			sleep(1)
		end
	elseif ID == QNPC[2] then
		while true do
		--	for i = 1 , 10 , 1 do
				SysCastSpellLv( OwnerID() , TargetID() , 496229 , 0 )
		--	end
			sleep(1)
		end
	elseif ID == QNPC[3] then
		while true do
			for i = 1 , 10 , 1 do
				SysCastSpellLv( OwnerID() , TargetID() , 496230 , 0 )
			end
			sleep(1)
		end
--	elseif ID == QNPC[4] then
--		SetPlot( OwnerID() , "range" , "Lua_Hao_GuildBall_Blue_Ball" , 15 )
--	elseif ID == QNPC[5] then
--		SetPlot( OwnerID() , "range" , "Lua_Hao_GuildBall_Purple_Ball" , 15 )
	end
end

function Lua_Hao_GuildBall_Ball_Move( Type )
--	O 為球體
	local Flag = 780373
	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )	-- 讓球體記得玩家是誰
	local QNPC = { 115348 , 116470 , 116469 , 116468 , 116471 }		-- 扣分球(紅)、得分球(藍)、特殊球(黃)、特殊球Ex(綠)、備用球(紫)
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 ) 			-- 設定為跑步
	CallPlot( OwnerID() , "Lua_Hao_GuildBall_Ball_DelObj" , 0 )

	if Type == 0 then
		while true do
			local Random = Rand(91)
			DW_MoveToFlag( OwnerID() , Flag , Random , 0 , Enable )
		--	function DW_MoveToFlag( ObjID , FlagObjID , FlagID,Range , Enable )
		--	執行移動的對象、旗子的資料庫編號、旗子編號、亂數決定移動到定點的範圍、Enable  0，不關閉movotoflag   1，關閉movetoflag
		--	LuaFunc_MoveToFlag( OwnerID() , Flag , Random , 10 )	-- 角色代號、旗類號、旗子編號、允許範圍
		end
	elseif Type == 1 then
		local Count = BuffCount( OwnerID() )				-- 查詢身上的技能
		for i = 0 , Count , 1 do
			local BuffID = BuffInfo( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 507596 then
				CancelBuff( OwnerID() , BuffID )
			end
		end
		if ID == QNPC[1] then
		--	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 ) --設定為走路
		--	AddBuff( OwnerID() , 507595 , 0 , -1 )
		--	AddBuff( OwnerID() , 507594 , 4 , -1 )
		elseif ID == QNPC[2] then
			AddBuff( OwnerID() , 507603 , 2 , -1 )
		--	AddBuff( OwnerID() , 502875 , 0 , -1 )
		end
		SetFollow( OwnerID() , Player )
	end
end

function Lua_Hao_GuildBall_Ball_DelObj(Key)	-- 刪除劇情

	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )

	for i = 1 , 10 , 1 do
		sleep(10)
		if i == 10 then
			Delobj( OwnerID() )
			if Key ~= 0 then
				WriteRoleValue( Player , EM_RoleValue_Register+2 , 0 ) --將Key值寫進玩家Reg+2
				WriteRoleValue( Player , EM_RoleValue_Register+3 , 0 ) --將Key值寫進玩家Reg+3	
			--	Say( Player , "Wait 10 Sec" )
			end
		end
	end
end

function Lua_Hao_GuildBall_Red_Ball()		-- 碰觸扣分球(紅)
--	SetPlot( OwnerID() , "range" , "" , 15 )
--	PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\red_ball.mp3", false )
	AddBuff( TargetID() , 507599 , 0 , 1 )		-- 紅球特效

	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )	-- 讀取物件ID
	local BuffLv , NewBuffLv					-- 技能等級
	local Count = BuffCount( TargetID() )				-- 查詢身上的技能
	local QNPC = 115348						-- 扣分球(紅)
--	local Reverse = CheckBuff( TargetID() , 507603 )		-- 反轉
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	DelObj( OwnerID() )

	for i = 0 , Count , 1 do
		local BuffID = BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 507593 then	-- 507593 遊戲體力
			BuffLv = BuffInfo( TargetID() , i , EM_BuffInfoType_Power )
			if ID == QNPC then
			--	if Reverse == true then
					NewBuffLv = BuffLv - 1
					CancelBuff( TargetID() , BuffID )			-- 取消玩家身上的體力
					AddBuff( TargetID() , BuffID , NewBuffLv , -1 )	-- 讓玩家身上的體力-1
					if NewBuffLv == -1 then	-- 當體力為0時，則執行...
						CancelBuff( TargetID() , BuffID )
					--	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_DDR_STRING01_FINISH] " , C_SYSTEM ) -- 本次的試煉結束了，依照獲得的積分將轉為增加你的榮譽值。 
					--	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_DDR_STRING01_FINISH] " , C_SYSTEM )
						BeginPlot( TargetID() , "Lua_Hao_GuildBall_Del_NPC" , 0 )
						return false
					elseif NewBuffLv <= 2 then
						CancelBuff( TargetID() , 507600 )
						AddBuff( TargetID() , 507599 , 0 , -1 )
						ScriptMessage( TargetID() , TargetID() , 0 , "[SC_GUILD_BARRAGE_8] " , C_SYSTEM ) -- 注意！生命點數不足
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_GUILD_BARRAGE_8] " , C_SYSTEM )
					--	Lua_Hao_GuildBall_MSG_TIPS( TargetID() , 5 , 5 , 2 , 1 )
					end
					return false
			--	end
			--	break
			end
		end
	end
end

function Lua_Hao_GuildBall_Blue_Ball()		-- 碰觸得分球(藍)
--	SetPlot( OwnerID() , "range" , "" , 15 )
--	PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\blue_ball.mp3", false )
--	PlaySoundToPlayer( TargetID() , "sound\\guildBall\\blue_ball.mp3", false )
	AddBuff( TargetID() , 507596 , 0 , 1 )				-- 藍球特效
	AddBuff( TargetID() , 507603 , 0 , 5 )				-- 藍球獎勵

	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local QNPC = 116470							-- 得分球(藍)
	local Bonus = Lua_Hao_Return_Buff_Lv( TargetID() , 507603 )		-- 藍球獎勵	依照堆疊Buff加分
--	local Reverse = CheckBuff( TargetID() ,  507603 )			-- 反轉
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
--	local Bonus = 1	-- 不依照堆疊Buff加分
	DelObj( OwnerID() )

	if ID == QNPC then	--	得分球
		Bonus = Bonus+1
		GuildBallScore[RoomID] = GuildBallScore[RoomID] + Bonus
		SetSmallGameMenuStr( TargetID() , 13 , 2 , "[SC_GUILD_BARRAGE_2][$SETVAR1="..GuildBallScore[RoomID].."]"  ) -- 分數(綠)
		return false
	end
end

function Lua_Hao_GuildBall_Yellow_Ball()	-- 碰觸特殊球(黃)

	AddBuff( TargetID() , 507601 , 0 , 1 )			-- 黃球特效

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--	local Random , Type = Rand(1)+7 , 0	-- 0 為正常模式、1為紅球追逐模式、2為藍球追逐模式
	local Random , Type = Rand(10)+1 , 0	-- 0 為正常模式、1為紅球追逐模式、2為藍球追逐模式
	local Bonus = 507595							-- 黃球獎勵
--	local SoundID = 0
	Lua_Hao_GuildBall_Build_QBox( 113105 , 2 )				-- 讓球體記住碰觸黃球後，產生的隱藏物件
	local QBOX = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )	-- 讓球體記起隱藏物件
	WriteRoleValue( QBOX , EM_RoleValue_Register+2 , TargetID() )	-- 讓當前觸碰的隱藏物件記住玩家
	Delobj( OwnerID())
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		
	if CheckBuff( TargetID() , Bonus ) == false then
		if Random <= 6 then				-- 6/10
			Type = 0
		elseif Random >= 7 and Random <= 8 then	-- 2/10
			Type = 1
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_GUILD_BARRAGE_9]" , C_SYSTEM ) -- 警告！紅色警戒
			ScriptMessage( TargetID() , TargetID() , 2 , "[SC_GUILD_BARRAGE_9]" , C_SYSTEM ) -- 警告！紅色警戒
		--	GuildBallSoundID[RoomID] = PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\bad_yallow_ball.mp3", false )
		--	SoundID = PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\bad_yallow_ball.mp3", false )
		--	PlaySoundToPlayer( TargetID() , "sound\\guildBall\\bad_yallow_ball.mp3", false )
		--	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		--		RunningMsgEx( OwnerID() , 0 , 0 , "[SC_GUILD_BARRAGE_9]" )  
		--	end
		else						-- 2/10
			Type = 2
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_GUILD_BARRAGE_10]" , C_SYSTEM ) -- 得分時間
			ScriptMessage( TargetID() , TargetID() , 2 , "[SC_GUILD_BARRAGE_10]" , C_SYSTEM ) -- 得分時間
		--	GuildBallSoundID[RoomID] = PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\good_yallow_ball.mp3", false )
		--	SoundID = PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\good_yallow_ball.mp3", false )
		--	PlaySoundToPlayer( TargetID() , "sound\\guildBall\\good_yallow_ball.mp3", false )
		--	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		--		RunningMsgEx( OwnerID() , 0 , 1 , "[SC_GUILD_BARRAGE_10]" )  
		--	end
		end
		WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Type ) --將Key值寫進玩家Reg+2
	--	WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , SoundID ) --將目前播放音效寫進玩家Reg+4
		CallPlot( QBOX , "Lua_Hao_GuildBall_Ball_DelObj" , 1 )		-- 執行刪除劇情
	else
		CallPlot( QBOX , "Lua_Hao_GuildBall_Ball_DelObj" , 0 )		-- 執行刪除劇情
	end
	BeginPlot( QBOX , "Lua_Hao_GuildBall_Yellow_Ball_2" , 0 )	-- 執行黃球劇情
end

function Lua_Hao_GuildBall_Yellow_Ball_2()	-- 特殊球(黃)

--	local Ball = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )	-- 讓隱藏物件記起球體
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	-- 讓隱藏物件記起玩家
	local ID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
--	local ID = ReadRoleValue( Ball , EM_RoleValue_OrgID )
	local QNPC = 116469							-- 特殊球(黃)
--	local Reverse = CheckBuff( Player , 507603 )				-- 反轉
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Bonus = 507595							-- 額外獎勵

--	Say( Player , "ID = "..ID )	-- 球體
--	Say( Player , "Hello" )		-- 玩家

	if CheckBuff( Player , Bonus ) == false then
		AddBuff( Player , Bonus , 0 , 10 )
		if ID == QNPC then						-- 特殊球效果1 球緩速
			local Random = Rand(90)+1
			if Random <= 45 then	-- 緩速
				CallPlot( OwnerID() , "Lua_Hao_GuildBall_Skill_Basic" , 507594 )
				AddBuff( Player , 507594 , 4 , 10 )				-- 玩家身上的緩速
				ScriptMessage( Player , Player , 1 , "[507594]" , C_SYSTEM )
				return false
			elseif Random > 45 and Random <= 90 then		-- 特殊球效果2 球加速
				CallPlot( OwnerID() , "Lua_Hao_GuildBall_Skill_Basic" , 507597 )	-- 加速
				ScriptMessage( Player , Player , 1 , "[507597]" , C_SYSTEM )
				return false
			elseif Random > 90 and Random <= 100 then 		-- 特殊球效果3 清空範圍內圓球
				CallPlot( OwnerID() , "Lua_Hao_GuildBall_Skill_Basic" , 999999 )
				SysCastSpellLv( Player , TargetID() , 492456 , 0 )
				ScriptMessage( Player , Player , 1 , "Clear" , C_SYSTEM )
				return false
			end
		end
	else
		GuildBallScore[RoomID] = GuildBallScore[RoomID] + 10
		SetSmallGameMenuStr( Player , 13 , 2 , "[SC_GUILD_BARRAGE_2][$SETVAR1="..GuildBallScore[RoomID].."]"  ) -- 分數(黃)
		return false
	end
end

function Lua_Hao_GuildBall_Skill_Basic(Value) -- 刪除、加速該區域的所有物件

	local QNPC =  { }
	local Quantity , Sec = 0 , 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	-- 讓隱藏物件想起玩家
	local Buff = { 507594 , 507597 }

	if Value == 999999 then
		QNPC = { 115348 }						-- 扣分球(紅)、特殊球(黃)
	else
		QNPC = { 115348 , 116470 , 116469 , 116468 , 116471 }	-- 扣分球(紅)、得分球(藍)、特殊球(黃)、特殊球Ex(綠)、備用球(紫)
	end

	while Sec < 101 do
		for i=1 , table.getn( QNPC ) , 1 do
			local Count = SetSearchAllNPC( RoomID )
			for j = 1 , Count , 1 do
				local ID = GetSearchResult() -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				if Name == QNPC[i] then  --若為陣列中的值
					Quantity = Quantity + 1
					if Value == 999999 then
						DelObj(ID)			-- 清除紅球
					elseif Value == Buff[1] then
						WriteRoleValue( ID , EM_RoleValue_IsWalk , 1 ) --設定為走路
					else
						AddBuff( ID , Value , 0 , 3 )
					end
				end
			end
		--	DebugMsg( 0 , RoomID ,"Total '"..NPC[i].."' Remove is "..Quantity )
		end
		if Value == 999999 then
			break
		end
		Sleep(1)
		Sec = Sec + 1
	end
end

function Lua_Hao_GuildBall_Del_NPC() 	--執行刪除光球，結束遊戲時執行的劇情
--	Say( OwnerID() ,"THE END" ) -- 玩家
--	Say( TargetID() ,"THE END" ) -- NPC

	Lua_Hao_Get_Memory()

	ScriptMessage( OwnerID(),  -1, 1, "[SC_DDR_STRING01_FINISH]" , C_SYSTEM )-- 本次的試煉結束了，依照獲得的積分將轉為增加你的榮譽值。
	ScriptMessage( OwnerID(),  -1, 0, "[SC_DDR_STRING01_FINISH]" , C_SYSTEM )

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local NPC = { 115348 , 116468 , 116469 , 116470 , 116471 , 113621 }
	local QNPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register )		-- 讓玩家想起 Reg 為任務NPC
	local QBOX = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )		-- 讓玩家想起 Reg+1 為隱藏物件
--	local SoundID = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )	-- 讓玩家想起目前播放的音效
	local Buff = { 506509 , 506580 , 507593 , 507594 , 507595 , 507596 , 507597 , 507598 , 507599 , 507600 , 507601 , 507603 }	-- 相關Buff

--	StopSound( OwnerID() , GuildBallSoundID[RoomID] )	--關閉目前播放的音效
	SetModeEx( QNPC , EM_SetModeType_Mark, true )	--標記
	SetModeEx( QNPC , EM_SetModeType_Show , true )	--顯示
	DisableQuest( QNPC , false )
--	Show( QNPC , RoomID )
	WriteRoleValue(  QNPC  , EM_RoleValue_Register ,  101 ) 	-- 讓 NPC 知道玩家已經玩過此遊戲 暫時沒用

	local Step = GuildBallStep[RoomID]
	local Score = GuildBallScore[RoomID]

	for i = 1 , table.getn(Buff) , 1 do
		CancelBuff( OwnerID() , Buff[i] )
	end

	ScriptMessage( OwnerID(),  -1, 2, "[SC_GUILD_WARRIOR_8]" , C_SYSTEM ) 	--試鍊結束
	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_BARRAGE_1][$SETVAR1="..Step.."]" , C_SYSTEM )	--<CY>關卡：</CY>[$VAR1] 
	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_BARRAGE_2][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--<CY>分數：</CY>[$VAR1]
--------------------------------------------------
	SetSmallGameMenuType( OwnerID() , 13 , 2 )		-- 關閉介面
	ClockClose( OwnerID() ) 				-- 關閉計數器
--------------------------------------------------
	DelObj( QBOX )

	if  Count ~= 0 then
		for i=1 , table.getn( NPC ) , 1 do
			local Count = SetSearchAllNPC( RoomID )
			local Quantity = 0
			for j = 1 , Count , 1 do
				local ID = GetSearchResult() -- 回傳執行 SetSearchAllNPC 後所搜尋到的所有物件
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				if Name == NPC[i] then  --若為陣列中的值
					DelObj(ID) 
					Quantity = Quantity + 1
				end
			end
			if Quantity ~= 0 then
			DebugMsg( 0 , RoomID ,"Total '"..NPC[i].."' Remove is "..Quantity )
			end
		end
	end

	FN_GuildGame_Honor( OwnerID(), Score )
--	AddRoleValue( OwnerID() , EM_RoleValue_Honor , Score )--給予榮譽值
--	ScriptMessage( OwnerID(),  -1, 1, "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--你獲得了 [$VAR1] 點榮譽點數
--	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--你獲得了 [$VAR1] 點榮譽點數

	local OldScore = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem20 ) -- 記錄最高分數
	if OldScore == 0 then
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem20  , Score )	
	elseif OldScore >= Score then

	elseif OldScore < Score then
	--	ScriptMessage( OwnerID(),  -1, 2, "[SC_GUILD_BARRAGE_13][$SETVAR1="..Score.."]" , C_SYSTEM )
		ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_BARRAGE_13][$SETVAR1="..Score.."]" , C_SYSTEM )
		--恭喜你打破了之前保持的分數記錄，現在的記錄為<CY>[$VAR1]</CY>，這次的試煉到此為止，期待你下次的表現。
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem20  , Score )
	end

	GuildBallStep[RoomID] = 0
	GuildBallScore[RoomID] = 0

	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	for i = 0 , 9 , 1 do
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+i , 0 )
	end
end

function Lua_Hao_GuildBall_Build_QBox( ObjID , Choise )	-- 建物件、並且讓玩家(球體)記住該物件

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local QBOX = CreateObj( ObjID , BaseX , BaseY , BaseZ , BaseDir , 1 ) --在玩家(球體)座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( QBOX , EM_SetModeType_Strikback , false )--反擊
	SetModeEx( QBOX , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
	SetModeEx( QBOX , EM_SetModeType_Obstruct , false )--阻擋
	SetModeEx( QBOX , EM_SetModeType_Mark , false )--標記
	SetModeEx( QBOX , EM_SetModeType_Move , false )--移動
	SetModeEx( QBOX , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( QBOX , EM_SetModeType_HideName , false )--名稱
	SetModeEx( QBOX , EM_SetModeType_ShowRoleHead , false )--頭像框
	SetModeEx( QBOX , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( QBOX , EM_SetModeType_Drag , false )--阻力
	SetModeEx( QBOX , EM_SetModeType_Show , true )--顯示

	if Choise == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , QBOX ) --讓玩家記住起始隱藏物件
	elseif Choise == 2 then
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , QBOX ) --讓球體記住碰觸黃球後，產生的隱藏物件
	end
	AddToPartition( QBOX , RoomID ) -- 建立物件
	Hide(QBOX)
end

function Lua_Hao_GuildBall_Build_Box()	-- 產生圓型物件

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local MonsterID = 113105 -- 隱藏物件
	local X = { 1 , 6 , 12 , 18 , 24 , 30 }-- 幾邊型
	local dis = { 0 , 30 , 60 , 90 , 120 , 150 } -- 距離圓心的距離
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			MonsterGroup[Count] = CreateObj( MonsterID , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])),BaseY,BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])),BaseDir, 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
	end
end

function Lua_Hao_GuildBall_Recall_SS()	-- 波次、榮譽點數

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Step , Score = GuildBallStep[RoomID] , GuildBallScore[RoomID]

	Say( OwnerID() , "Step = "..Step )
	Say( OwnerID() , "Score = "..Score )
end

function Lua_Hao_GuildBall_MSG_TIPS( ObjID , Time , NowTime , type , Select )

	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				if Select == 1 then
					StartClientCountDown ( ID , Time , NowTime , 0 , 0 , type , "[SC_GUILD_BARRAGE_8]" )	-- 小心，生命點數不足
				end
			end
		end	
	end
end

function Lua_Hao_GuildBall_Build_Door( Player )	-- 產生阻擋門

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Lua_Hao_NPCofAll_Clear( 113621 , 500 ) 	-- 清除

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local MonsterID = 113621 -- 門
	local X = { 36 }-- 幾邊型
	local dis = { 160 } -- 距離圓心的距離
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			MonsterGroup[Count] = CreateObj( MonsterID , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			WriteRoleValue( MonsterGroup[Count] , EM_RoleValue_PID , Count )
			Count = Count + 1
		end
	end
--	PlaySoundToPlayer( Player , "sound\\guildBall\\metal_door.mp3", false )
	for i = 1 , table.getn(MonsterGroup) do
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( MonsterGroup[i] , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Obstruct , true )--阻擋
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Mark , false )--標記
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Move , false )--移動
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( MonsterGroup[i] , EM_SetModeType_HideName , false )--名稱
		SetModeEx( MonsterGroup[i] , EM_SetModeType_ShowRoleHead , false )--頭像框
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Drag , false )--阻力
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Show , true )--顯示
		Sleep(2)
		AdjustFaceDir( MonsterGroup[i] , OwnerID() , 0 ) 
	--	MoveToflagEnabled( MonsterGroup[i] , false )
		AddToPartition( MonsterGroup[i] , RoomID )
		if i == 5 then
		--	PlaySoundToPlayer( Player , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\metal_door.mp3", false )
		end
	end
end

function Lua_Hao_GuildBall_Reset_Key( Score ) -- 重置

	if Score == nil then
		Setflag( OwnerID() , 542248 , 0 )
		Score = "Reset"
	elseif Score >= 0 then
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem20  , Score )
	else
		Score = "Entry error"
	end
	DeBugMSG( OwnerID() , 0 , Score )
end

function Lua_Hao_Test_Clear_Buff()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	AddBuff( OwnerID() , 503693 , 1 , -1 ) --傳送特效
	sleep(10)
	ChangeZone( OwnerID() , 354 , RoomID , 4110.1 , 16.3 , 3468.4 , 269.7 )
end

function Lua_Hao_GuildBall_Test_PlaySound()

--	local SoundID = PlaySoundToPlayer( OwnerID() , "sound/sound_new/skill/Music_Festival/scale/5.mp3" , false )

--	local SoundID = PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\metal_door.mp3", false )
--	local SoundID = PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\bad_yallow_ball.mp3" , false )
--	local SoundID = PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\bad_yallow_ball.mp3" , false )
--	local SoundID = PlaySoundToPlayer( OwnerID() , "sound\\guildBall\\bad_yallow_ball.mp3" , false )
	--PlaySoundToPlayer( OwnerID() , "music\\Guild_Drill_Ground\\9\\ET09_04_JFL_kings_valor.mp3", false )
	Sleep(50)
	StopSound( OwnerID() , SoundID )
end