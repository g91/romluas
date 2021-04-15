-- 2013詠火節_npc與棋子

		
-- npc套用劇情 (將活動重新開放報名 / 清空已參加人數)
function lua_mika_fireday_chess_npc_00()
	local NPC = OwnerID()

	AddBuff(  NPC,  503217, 1, -1) 
	FireDayChessPlayers = {}  -- 宣告全域變數
	WriteRoleValue(NPC, EM_RoleValue_Register+3, 0 )  -- 目前剩下倒數時間
	WriteRoleValue(NPC, EM_RoleValue_Register+1, 0 )  -- 活動是否開放報名, 0 為可以報名 , 1為不可報名
end

-- NPC初始對話劇情
function lua_mika_fireday_chess_npc_01()
	local Player = OwnerID()
	local NPC = TargetID()

	local Open = ReadRoleValue(NPC, EM_RoleValue_Register+1 )  -- 活動是否開放報名, 0 為可以報名 , 1為不可報名
	local LimitCount = 4  -- 限制人數 4
	local LessCount = 1  -- 至少人數 2
	local todayKey = 547380  -- 今天已參加過活動的key 
	local JoinBuff = 623962  -- 報名憑證buff

	if Open == 1 then  -- 不可報名 (活動開始了)
		SetSpeakDetail(Player, "[SC_2013FIRE_EV1_07]")   -- 目前遊戲正在進行中，請等結束後再報名參加。
	else  -- 可以報名
	--	say(NPC, "join count ="..#FireDayChessPlayers )
		if CheckFlag(player, todayKey ) == true then  -- 今天參加過了

			local Language = GetServerDataLanguage() 
		--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
			if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
				SetSpeakDetail(Player, "[SC_2013FIRE_EV1_06]")  --  你今天已經參加過囉！玩得還盡興嗎？ (略)
			else
				SetSpeakDetail(Player, "[SC_2013FIRE_EV1_06_TW]")  -- 台版特殊對話
			end

		--	if Language ~= "rw" then  -- 台版專屬沒有重置選項  測試用
			if Language ~= "tw" then  -- 台版專屬沒有重置選項  正式版
				AddSpeakOption(Player, Player, "[SC_2013FIRE_EV1_10]" , "lua_mika_fireday_chess_npc_05" , 0  )  -- 兌換詠火節重置券
			end

		else  -- 還沒完成過
			if CheckBuff(Player, JoinBuff  ) == true then  -- 持有報名buff 
				SetSpeakDetail(Player, "[SC_2013FIRE_EV1_03][$SETVAR1="..#FireDayChessPlayers.."]")   -- 目前已報名的人數有[$VAR1]名。 (略)
			else
				if #FireDayChessPlayers > (LimitCount-1) then  -- 超過人數
					SetSpeakDetail(Player, "[SC_2013FIRE_EV1_05]" )  -- 抱歉，本場次遊戲報名人數已滿，請等等再來吧。
					AddSpeakOption(Player, Player, "[SC_2013FIRE_EV1_09]" , "lua_mika_fireday_chess_npc_04" , 0  )  -- 我想了解遊戲規則
				else  -- 還有參加名額
					SetSpeakDetail(Player, "[SC_2013FIRE_EV1_02]")   -- 有興趣來挑戰符文棋盤嗎？
					AddSpeakOption(Player, Player, "[SC_2013FIRE_EV1_09]" , "lua_mika_fireday_chess_npc_04" , 0  )  -- 我想了解遊戲規則
					AddSpeakOption(Player, Player, "[SC_2013FIRE_EV1_08]", "lua_mika_fireday_chess_npc_02" , 0  )  -- 我想挑戰符文棋盤
				end
			end
		end
	end
end

-- 活動規則說明 
function lua_mika_fireday_chess_npc_04()
	local Player = OwnerID()

	SetSpeakDetail(Player, "[SC_2013FIRE_EV1_01]")  -- 歸責說明
end

-- 兌換重置券
function lua_mika_fireday_chess_npc_05()
	local Player = OwnerID()

	SetSpeakDetail(Player, "[SC_2013FIRE_EV1_11]")  -- 確定要以<CS>[202904]1個</CS>兌換[208919]1個</CS>？
	AddSpeakOption(Player, Player, "[SC_0908SEANSON_65]", "lua_mika_fireday_chess_npc_06" , 0  )  -- 確定
end

-- 兌換重置券2
function lua_mika_fireday_chess_npc_06()
	local Player = OwnerID()
	local runeid = 202904   -- 兌換條件
	local ticketid = 208919  -- 兌換物

	if CountBodyItem(Player, runeid ) >= 1 then  
		CloseSpeak(Player)
		DelBodyItem(Player, runeid, 1 )
		GiveBodyItem(Player,ticketid, 1)
	else
		SetSpeakDetail(Player, "[SC_XMASGOODERROR]")  -- 您所持有物品數量不足，還不能兌換喔。
	end

end

-- 選項- 參加活動
function lua_mika_fireday_chess_npc_02()
	local Player = OwnerID()
	local NPC = TargetID()

	local Open = ReadRoleValue(NPC, EM_RoleValue_Register+1 )  -- 活動是否開放報名, 0 為可以報名 , 1為不可報名
	local fulltime = 60 -- 報名時間長度 60
	local LimitCount = 4  -- 限制人數
	local todayKey = 547380  -- 今天已參加過活動的key 
	local JoinBuff = 623962  -- 報名憑證buff	

--	say(NPC, "join count =".. #FireDayChessPlayers )

	if Open == 1 then  -- 不可報名 (活動開始了)
		SetSpeakDetail(Player, "[SC_2013FIRE_EV1_07]")   -- 目前遊戲正在進行中，請等結束後再報名參加。
	elseif #FireDayChessPlayers > (LimitCount-1) then  -- 超過人數
		SetSpeakDetail(Player, "[SC_2013FIRE_EV1_05]" )  -- 抱歉，本場次遊戲報名人數已滿，請等等再來吧。
		AddSpeakOption(Player, Player, "[SC_2013FIRE_EV1_09]" , "lua_mika_fireday_chess_npc_04" , 0  )  -- 我想了解遊戲規則
	else  -- 可以報名
		CloseSpeak(Player)
		table.insert(FireDayChessPlayers, Player)  -- 把參加的玩家加入Table

	--	say(NPC, "now join count ="..#FireDayChessPlayers )

		local joinTime = ReadRoleValue(NPC, EM_RoleValue_Register+3 )  -- 目前剩下倒數時間
		Callplot(Player, "lua_mika_fireday_chess_rangecheck", NPC )  -- 玩家執行 檢查玩家與npc之間的距離 (超過就刪掉報名buff)

		if #FireDayChessPlayers == 1  then  -- 表示 此玩家為本場次第一個參加的玩家
			WriteRoleValue(NPC, EM_RoleValue_Register+3, 0 )  -- 時間歸0
			Callplot(NPC, "lua_mika_fireday_chess_npc_03", 0  )  -- 120秒判斷是否開啟活動 ( 人數 >= 2 ) 
		--	say(NPC, "first join,  120 sec check " )
			AddBuff(Player, JoinBuff, 0, fulltime )  -- 給報名用buff 
		else
			AddBuff(Player, JoinBuff, 0, (fulltime-joinTime+1))  -- 給報名用buff 
		end

		ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_01]" , C_SYSTEM )   -- 報名成功！請不要離開活動區域或登出，否則將會喪失參加資格。
		ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_01]" , C_SYSTEM )   -- 報名成功！請不要離開活動區域或登出，否則將會喪失參加資格。
	end
end

-- 玩家執行 - 檢查自己與活動npc 間的距離
function lua_mika_fireday_chess_rangecheck(NPC)
	local player = OwnerID()

	local limitrange = 300  -- 玩家與npc之間的限至距離
	local joinbuff = 623962  -- 報名用buff
	local buffid = {623956, 623957, 623958 }  -- 符文棋buff ( 紅 黃 藍)
	local gamebuff = 623959  -- 活動進行中buff

	while true do 
		local dis =  GetDistance(NPC, player ) 
	--	say(player, "dis = "..dis )

		if CheckBuff(player, joinbuff)  == true or CheckBuff(Player, gamebuff ) == true then   -- 有報名buff or 開始buff
			if CheckID(NPC) == false then  -- 找不到npc -- 取消資格
				Callplot(Player, "lua_mika_fireday_chess_endvent" , 0 )
				ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_02]" , 0  )   --你離開了符文棋盤的活動區域，參加資格已取消。
				ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_02]" , 0  )   --你離開了符文棋盤的活動區域，參加資格已取消。
				break
			elseif dis >= limitrange then  -- 距離超過200  -- 取消資格
				Callplot(Player, "lua_mika_fireday_chess_endvent" , 0 )
				ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_02]" , 0  )   --你離開了符文棋盤的活動區域，參加資格已取消。
				ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_02]" , 0  )   --你離開了符文棋盤的活動區域，參加資格已取消。
				break
	  		elseif dis >= (limitrange-50) then  -- 距離超過150  -- 警告訊息	 
				ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_03]" , 0  )   -- 注意，你即將離開符文棋盤的活動區域！
				ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_03]" , 0  )   -- 注意，你即將離開符文棋盤的活動區域！
			end
		else  
			Callplot(Player, "lua_mika_fireday_chess_endvent" , 0 )
			break
		end
		sleep(15)  -- 每秒檢查一次
	end
end

-- 玩家的報名與活動buff 結束時觸發lua  (換區 +離線 / 超過範圍 / 死亡  / 活動結束)
function lua_mika_fireday_chess_endvent()
	local player = OwnerID()
	local joinbuff = 623962  -- 報名用buff
	local gamebuff = 623959  -- 活動進行中buff
	local buffid = {623956, 623957, 623958 }  -- 符文棋buff ( 紅 黃 藍)

	ClockClose(Player)
	for j = 1 , #buffid do				
		CancelBuff(Player, buffid[j])  --  刪除棋子buff
	end

	for i = 1, #FireDayChessPlayers do
	--	say(FireDayChessPlayers[i], "player -"..i )
		if FireDayChessPlayers[i] == Player then
			table.remove(FireDayChessPlayers, i )
		end
	end
	WriteRoleValue(Player, EM_RoleValue_Register10, 0 )  --  清除玩家身上紀錄npc
	CancelBuff_Noevent(Player, joinbuff )  -- 刪除報名buff
	CancelBuff_Noevent(Player, gamebuff )  -- 刪除報名buff
--	say(Player, "buff end")
end

-- 本場次 第一個玩家報名後 計算報名時間  == > 報名時間結束 活動開始
function lua_mika_fireday_chess_npc_03()
	local NPC = OwnerID()

	local fulltime = 59  -- 報名時間 60
	local LessCount = 1  -- 至少人數 2
	local buffid = {623956, 623957, 623958 }  -- 符文棋buff ( 紅 黃 藍)
	local limitrange = 300  -- 活動範為距離
	local todayKey = 547380  -- 今天已參加過活動的key 
	local gametime = 180

	for k = 1, fulltime do  -- 120 sec 報名時間 
		AddRoleValue(NPC, EM_RoleValue_Register+3, 1 )  -- 時間
		local joinTime = ReadRoleValue(NPC, EM_RoleValue_Register+3 )  -- 目前剩下倒數時間
	--	say(NPC, "Join time  ="..joinTime )
	
		if #FireDayChessPlayers == 0 then
			break
		end

		if k == fulltime then  -- 活動時間開始 
			if #FireDayChessPlayers > 0  then   -- 有人報名
				WriteRoleValue(NPC, EM_RoleValue_Register+1 , 1 )  -- 寫入npc為不可報名

				for i = 1, #FireDayChessPlayers do
					DesignLog( FireDayChessPlayers[i] , 1217371 , " 2013Firegame Chess , join player count = "..#FireDayChessPlayers )	--  紀錄本場次參加人數
					ClockOpen( FireDayChessPlayers[i] ,EM_ClockCheckValue_21, gametime, gametime, 0,"Lua_Clockending", "Lua_Clockending") --倒數計時器  (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")
					WriteRoleValue(FireDayChessPlayers[i], EM_RoleValue_Register10, NPC )  --  將活動NPC寫入玩家R10
					SetFlag(FireDayChessPlayers[i], 547380, 1 )  -- 給key - 今天參加過遊戲
					CancelBuff_Noevent(FireDayChessPlayers[i], 623962)  -- 刪除報名buff
					AddBuff(FireDayChessPlayers[i], 623959, 0,  -1 )  -- 給予參加活動的buff
					AddBuff(FireDayChessPlayers[i], buffid[Rand(3)+1], 0, -1  )  -- 給予隨機一種棋子的 BUFF
					ScriptMessage( FireDayChessPlayers[i] , FireDayChessPlayers[i] , 1 , "[SC_2013FIRE_EV1_MSG_05]" , C_SYSTEM  )   -- 符文棋盤遊戲開始！點選純淨符文水晶，盡可能將同色的符文水晶連結成直線吧！
					ScriptMessage( FireDayChessPlayers[i] , FireDayChessPlayers[i] , 0 , "[SC_2013FIRE_EV1_MSG_05]" , C_SYSTEM  )   -- 符文棋盤遊戲開始！點選純淨符文水晶，盡可能將同色的符文水晶連結成直線吧！
				end
				Callplot(NPC, "lua_mika_fireday_chess_start", 0 )  -- 活動開始

			end
		end
		sleep(10)
	end
end

-- 活動開始
function lua_mika_fireday_chess_start()
	local NPC = OwnerID()
	local limitrange = 300  -- 活動範為距離
	local gametime = 180  -- 活動時間 180

	-- 清除npc身上值
	WriteRoleValue(NPC, EM_RoleValue_Register8 , 0 )  
	WriteRoleValue(NPC, EM_RoleValue_Register9, 0 )  
	WriteRoleValue(NPC, EM_RoleValue_Register10, 0 ) 

	for i = 1 , gametime do
		if i == gametime then  -- 活動時間到
			Callplot(NPC, "lua_mika_fireday_chess_end", 0 )
		elseif ReadRoleValue(NPC, EM_RoleValue_Register8)  == 25 then  -- 判斷死棋
			FireDay2013_Chess_Reboot()  -- 將物件全部改回白色水晶
			local score =  ReadRoleValue(NPC, EM_RoleValue_Register10 ) 
			if score < 10 then  -- 現在分數是否小於10分
				AddRoleValue( NPC, EM_RoleValue_Register10, -(score) )   -- 扣掉目前的分數
			else
				AddRoleValue( NPC, EM_RoleValue_Register10, -10 )   -- 扣10分
			end
			WriteRoleValue(NPC, EM_RoleValue_Register8, 0  )  -- R8 歸0
			for p = 1, #FireDayChessPlayers do
				Callplot(FireDayChessPlayers[p], "lua_mika_fireday_chess_deadmsg", 0 )   -- 死棋訊息
			end
		else

			if #FireDayChessPlayers  == 0 then  -- table 中沒有玩家 所有人都離開了
				FireDay2013_Chess_Reboot()  -- 將物件全部改回白色水晶
				FireDayChessPlayers = {}  -- 重新宣告全域變數
				WriteRoleValue(NPC, EM_RoleValue_Register+3, 0 )  -- 目前剩下倒數時間
				WriteRoleValue(NPC, EM_RoleValue_Register+1, 0 )  --  寫入npc為可報名
				break
			end
		end
		sleep(10)
	end
end

function lua_mika_fireday_chess_deadmsg()
	local Player = OwnerID()
	local NPC = ReadRoleValue(Player, EM_RoleValue_Register10 )  -- 玩家的r10是npc
	local OrgScroe = ReadRoleValue( NPC, EM_RoleValue_Register10 )		-- NPC身上所記錄現有分數

	-- 由於無法再進行遊戲，所有水晶已被還原為純淨符文水晶並扣除團隊分數10分
	ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_10]", 0 ) 
	ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_10]", 0 ) 
	sleep(10)
	-- 死棋懲罰，團隊分數已被扣除10分，目前的分數為[$VAR1]分
	ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_11][$SETVAR1="..OrgScroe.."]" , C_SYSTEM  )  
	ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_11][$SETVAR1="..OrgScroe.."]" , C_SYSTEM  )  

end


function lua_mika_fireday_chess_end()
	local NPC = OwnerID()
	local buffid = {623956, 623957, 623958 }  -- 符文棋buff ( 紅 黃 藍)

	FireDay2013_Chess_Reboot()  -- 將物件全部改回白色水晶

	-- 刪除參加玩家的buff  / 給予獎勵
	for p = 1, #FireDayChessPlayers do
	--	say(FireDayChessPlayers[p], "player -"..p )

		Callplot(FireDayChessPlayers[p], "lua_mika_fireday_chess_endvent" , 0 )

		local score = ReadRoleValue( NPC, EM_RoleValue_Register10 )		-- NPC身上所記錄現有分數
		DesignLog( FireDayChessPlayers[p] , 121737 , " 2013Firegame Chess Complete, group socre = "..score )	--記錄參加人次
		if score > 0 then
			ScriptMessage( FireDayChessPlayers[p] , FireDayChessPlayers[p] , 1 , "[SC_2013FIRE_EV1_MSG_06][$SETVAR1="..score.."]", C_SYSTEM ) 
			ScriptMessage( FireDayChessPlayers[p] , FireDayChessPlayers[p] , 0 , "[SC_2013FIRE_EV1_MSG_06][$SETVAR1="..score.."]", C_SYSTEM ) 
			GiveBodyItem(FireDayChessPlayers[p], 240996, 2 )	
			if score >= 201 then
				GiveBodyItem(FireDayChessPlayers[p], 208918, 2 )	 
				GiveBodyItem(FireDayChessPlayers[p], 203487, 2 )  -- 魔幻寶盒1點
				DesignLog( FireDayChessPlayers[p] , 1217372 , " 2013Firegame Chess , most high score level, group socre = "..score  )	--  紀錄最高區間分數取得數
			elseif score >= 101 and score <= 200 then	
				GiveBodyItem(FireDayChessPlayers[p], 208918, 1 )	 
				GiveBodyItem(FireDayChessPlayers[p], 240378, 3 )  -- 風障魔藥
			elseif score >= 51 and score <= 100 then	
				GiveBodyItem(FireDayChessPlayers[p], 208918, 1 )	 
				GiveBodyItem(FireDayChessPlayers[p], 725654, 1 )
			elseif score >= 11 and score <= 50 then	
				GiveBodyItem(FireDayChessPlayers[p], 208918, 1 )	
			elseif score <= 10 then
				GiveBodyItem(FireDayChessPlayers[p], 725654, 1 )	
			end 
		else  -- 沒有分數
			GiveBodyItem(FireDayChessPlayers[p], 725654, 1 )		
			ScriptMessage( FireDayChessPlayers[p] , FireDayChessPlayers[p] , 1 , "[SC_2013FIRE_EV1_MSG_08]", C_SYSTEM ) 
			ScriptMessage( FireDayChessPlayers[p] , FireDayChessPlayers[p] , 0 , "[SC_2013FIRE_EV1_MSG_08]", C_SYSTEM ) 
		end
		Lua_Festival_01_All(FireDayChessPlayers[p])  -- 給全勤獎
	end

	FireDayChessPlayers = {}  -- 宣告全域變數
	WriteRoleValue(NPC, EM_RoleValue_Register+3, 0 )  -- 目前剩下倒數時間
	WriteRoleValue(NPC, EM_RoleValue_Register10,  0 )   -- 清空玩家分數
	WriteRoleValue(NPC, EM_RoleValue_Register+1, 0 )  --  寫入npc為可報名

	--	say(NPC, "game over ,  now join ok ")
end

 ---------------------------測試用指令  ---------------------------

------------- 寫入分數指令 -------------
-- 活動進行中才能使用

function lua_mika_fireday_chess_score(score) 
	local Player = OwnerID()
	local NPC = ReadRoleValue( Player, EM_RoleValue_Register10 )	-- NPC


	if CheckID(NPC) == false then  -- 是否檢查得到npc
		say(Player, "commend error ")
	else
		WriteRoleValue( NPC, EM_RoleValue_Register10, score )
		local nowScore = ReadRoleValue( NPC, EM_RoleValue_Register10 )	--  分數
		say(Player, "now score = "..nowScore)
	end
end


-- 測試用給特定顏色的buff  紅 = 1 , 黃 = 2 , 藍 = 3
function lua_mika_fireday_chess_buffget(colorid)  
	local Player = OwnerID()
	local buffid = {623956, 623957, 623958 }  -- 符文棋buff ( 紅 黃 藍)  
	
	for i = 1, #buffid do
		CancelBuff(Player, buffid[i])
	end
	AddBuff(Player, buffid[colorid], 0, -1  )  -- 給予隨機一種棋子的 BUFF
end