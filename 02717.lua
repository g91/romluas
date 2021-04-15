
-- 測試指令
-- 非活動時段開啟活動
function sasa_Auction_test01()
	local OID = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 121088 , 200 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	WriteRoleValue( NPC , EM_RoleValue_Register2 , 100 )
	local test = ReadRoleValue( NPC , EM_RoleValue_Register2 )  --測試用報名開關
	Say( OID , "test - auction begin ." )
end

-- 直接寫入報名人數 只能在報名時間時使用 填入數字請填 1 ~ 15
function sasa_Auction_test02(P)
	local OID = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 121088 , 200 , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	WriteRoleValue( NPC , EM_RoleValue_Register , P )
	local PP = ReadRoleValue( NPC , EM_RoleValue_Register )  -- 活動報名人數
	Say( OID , "PP ="..PP )
end




function sasa_Auction_ctrl()
	local CTRL = OwnerID() -- 活動npc
	local ZoneID = ReadRoleValue( CTRL , EM_RoleValue_ZoneID ) --讀取ZONE
	AddBuff( CTRL , 503217 , 1 , -1 )			--節慶標誌
	sasa_Auction_shop()

	while 1 do
		sleep(600)	
		local Hour = GetSystime(1)		--取得現在時間：時
		local Min = GetSystime(2)		--取得現在時間：分
		local test = ReadRoleValue( CTRL , EM_RoleValue_Register2 )  --測試用報名開關
		local PID = ReadRoleValue(CTRL, EM_RoleValue_PID )
		--Say( CTRL , "It is "..Hour..":"..min )
		if ZoneID < 1000 then --( 分流 1：2、分流 2：1002、分流 3：2002，若ZoneID大於1000則為分流 
			if test == 100 then
				WriteRoleValue( CTRL , EM_RoleValue_Register2 , 0 ) --將測試值改回0
				if  PID == 0 then
					WriteRoleValue( CTRL , EM_RoleValue_PID , 1 ) --把NPC的PID值寫為"1"，表示NPC開放報名
					BeginPlot( CTRL , "sasa_Auction_begin2" , 0 )  --報名開始
				end
			elseif (( Hour >= 08 ) and ( Hour <= 23 )) then
				if min == 40 then
					WriteRoleValue( CTRL , EM_RoleValue_PID , 1 ) --把NPC的PID值寫為"1"，表示NPC開放報名
					BeginPlot( CTRL , "sasa_Auction_begin" , 0 )  --報名開始
				end
			end
		end
	end
end

-- 報名總共有10分鐘
function sasa_Auction_begin()
	local CTRL = OwnerID() -- 活動npc
	local timer = 0
	local endtime = 600  -- 設定活動報名總共時間 600
	local step = 0 -- 階段 , 判斷多少玩家參加時 出多少npc	
	local speaktime = 60   --   講題目的間隔 120

--	local msg = { "[SC_SASA2012_12]" , "[SC_SASA2012_13]" , "[SC_SASA2012_14]" , "[SC_SASA2012_15]" }

--	local itemlist  = { 224792 , 224793 , 224794 , 224795 }  --  5.0.1
	local itemlist  = { 232011 , 232012 , 232013 , 232014 }   -- 6.0.2 
--	local number = rand(3)+1 
	local number = rand(4)+1 
	local rewardid = itemlist[number] 
	WriteRoleValue( CTRL , EM_RoleValue_register10 , rewardid )  -- 獎本次報名物品id寫入 npc R10
	local reward  = ReadRoleValue(Ctrl, EM_RoleValue_register10 )
--	say(CTRL, "this time reward is  "..reward )

--	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01]".."["..rewardid.."]" )  -- 6.0.2改
	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01][$SETVAR1=".."["..rewardid.."]".."]" )  -- 6.0.2改
	--各位冒險者，目前在凡瑞娜斯城入口廣場舉行慈善拍賣，這次的拍賣品為「xxxxx」。

	while true do 
		sleep(10)  --1秒跑一次
		timer = timer +1 
	--	say(CTRL, "timer ="..timer  )

		if timer%speaktime == 0 then -- 1分鐘一次 說題目
		--	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01]".."["..rewardid.."]" )  -- 6.0.2改
			NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01][$SETVAR1=".."["..rewardid.."]".."]" )  -- 6.0.2改
		end
		local PP = ReadRoleValue( CTRL , EM_RoleValue_Register )  -- 活動報名人數
		--	say(CTRL, " now Join people ="..PP )
		if  PP > 0 and PP <= 3  then
			step = 2
		--	say(CTRL, "step ="..step )
		elseif  PP >= 4 and PP <= 6  then
			step =  3
		--	say(CTRL, "step ="..step )
		elseif PP >= 7 and PP <= 9 then
			step = 4		
		--	say(CTRL, "step ="..step )
		elseif PP >= 10 and PP <= 12  then
			step = 4
		--	say(CTRL, "step ="..step )
		elseif  PP >= 13  then
			step = 5
		--	say(CTRL, "step ="..step )
		end


		if timer == endtime then
			WriteRoleValue( CTRL , EM_RoleValue_Register , 0 )   -- reset 報名人數
	 		WriteRoleValue( CTRL , EM_RoleValue_PID , 0 ) --把NPC的PID =0
			if step >= 2  then -- 參加人數 > 0
				Callplot( CTRL , "sasa_Auction_eventbegin" , reward, step )  --活動開始
			else
				NPCSAY( CTRL , "[SC_SASA2012_11]" )
				--看來大家最近似乎都很忙碌吧…
				local Player2 = SearchRangePlayer( CTRL , 160  ) --搜尋周圍玩家  saha的範圍
				for i = 0 , table.getn(Player2)-1  do 	--搜尋範圍內玩家
					CloseSpeak(Player2[i])
				end
			end
			break
		end
	end
end

--------------  測試用的報名 -----------------

-- 報名總共有1分鐘
function sasa_Auction_begin2()
	local CTRL = OwnerID() -- 活動npc
	local timer = 0
	local endtime = 60 -- 設定活動報名總共時間 600
	local step = 0 -- 階段 , 判斷多少玩家參加時 出多少npc	
	local speaktime = 20   --   講題目的間隔 120

--	local msg = { "[SC_SASA2012_12]" , "[SC_SASA2012_13]" , "[SC_SASA2012_14]" , "[SC_SASA2012_15]" }

--	local itemlist  = { 224792 , 224793 , 224794 , 224795 }  --  5.0.1
	local itemlist  = { 232011 , 232012 , 232013 , 232014 }   -- 6.0.2 
	local number = rand(4)+1 
	local rewardid = itemlist[number] 
	WriteRoleValue( CTRL , EM_RoleValue_register10 , rewardid )  -- 獎本次報名物品id寫入 npc R10
	local reward  = ReadRoleValue(Ctrl, EM_RoleValue_register10 )
--	say(CTRL, "this time reward is  "..reward )

--	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01]".."["..rewardid.."]" )  -- 6.0.2改
	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01][$SETVAR1=".."["..rewardid.."]".."]" )  -- 6.0.2改

	--各位冒險者，目前在凡瑞娜斯城入口廣場舉行慈善拍賣，這次的拍賣品為「xxxxx」。

	SAY( CTRL , "test - join me  !!" )

	while true do 
		sleep(10)  --1秒跑一次
		timer = timer +1 
	--	say(CTRL, "timer ="..timer  )

		if timer%speaktime == 0 then -- 1分鐘一次 說題目
			--	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01]".."["..rewardid.."]" )  -- 6.0.2改
			NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01][$SETVAR1=".."["..rewardid.."]".."]" )  -- 6.0.2改
		end
		local PP = ReadRoleValue( CTRL , EM_RoleValue_Register )  -- 活動報名人數
		--	say(CTRL, " now Join people ="..PP )
		if  PP > 0 and PP <= 3  then
			step = 2
		--	say(CTRL, "step ="..step )
		elseif  PP >= 4 and PP <= 6  then
			step =  3
		--	say(CTRL, "step ="..step )
		elseif PP >= 7 and PP <= 9 then
			step = 4		
		--	say(CTRL, "step ="..step )
		elseif PP >= 10 and PP <= 12  then
			step = 4
		--	say(CTRL, "step ="..step )
		elseif  PP >= 13  then
			step = 5
		--	say(CTRL, "step ="..step )
		end


		if timer == endtime then
			WriteRoleValue( CTRL , EM_RoleValue_Register , 0 )   -- reset 報名人數
	 		WriteRoleValue( CTRL , EM_RoleValue_PID , 0 ) --把NPC的PID =0
			if step >= 2  then -- 參加人數 > 0
				Callplot( CTRL , "sasa_Auction_eventbegin" , reward, step )  --活動開始
			else
				NPCSAY( CTRL , "[SC_SASA2012_11]" )
				--看來大家最近似乎都很忙碌吧…
				local Player2 = SearchRangePlayer( CTRL , 160  ) --搜尋周圍玩家  saha的範圍
				for i = 0 , table.getn(Player2)-1  do 	--搜尋範圍內玩家
					CloseSpeak(Player2[i])
				end
			end
			break
		end
	end
end


-- 生活動相關物件

function sasa_Auction_eventbegin(reward, step)
	local CTRL = OwnerID() -- 活動npc
	local flag = 781176
	local range = 140	--報名員活動半徑範圍

	-- 生活動主辦人
	local Leader = CreateObjByFlag( 121089 , flag , 0 , 1 )  -- 棋子id 0 
	AddToPartition( Leader , 0 )
	WriteRoleValue( Leader , EM_RoleValue_Register10 , reward )  -- 活動主辦npc r10 = reward

	-- 生活動相關NPC
	Callplot(CTRL, "sasa_Auction_npcshow", step ,Leader)

	if step >= 4 then
		NPCSAY( Leader , "[SC_SASA2012_10]" )	--沒想到來了這麼多人，事不宜遲，我們開始吧！
	else
		NPCSAY( Leader , "[SC_SASA2012_09]" )	--只要有心想幫忙都非常歡迎！
	end

	Sleep(30)
	local Player2 = SearchRangePlayer( CTRL , 160  ) --搜尋周圍玩家  saha的範圍
	for i = 0 , table.getn(Player2)-1  do 	--搜尋範圍內玩家
		CloseSpeak(Player2[i])
	end

	--給玩家SKILL
	local Player = SearchRangePlayer( Leader , range  ) --搜尋周圍玩家
	for i = 0 , table.getn(Player)-1  do 	--搜尋範圍內玩家
		if CheckBuff( Player[i] , 623225 ) == true then		-- 有報名證明buff的人
			AddBuff( Player[i] , 623229 , 0 , 200 )		--活動技能buff
			WriteRoleValue( Player[i] , EM_RoleValue_Register8 , Leader ) 
			CancelBuff( Player[i] , 623225 )		--刪報名證明buff
			Callplot(Player[i], "sasa_Auction_checkrange" ,Leader )  -- 跑 檢查距離劇情
		end
	end

	NPCSAY( Leader , "[SC_SASA2012_24]" )
	--大夥看過來，該是你們注視這的大好時刻了!
	ScriptMessage( CTRL , 0 , 2 , "[SC_SASA2012_25]" , 1 ) --慈善搶標會正式開始！

	-- 活動主辦人的check ai
	WriteRoleValue(Leader, EM_RoleValue_PID, 1 )  -- 活動主辦人 PID = 1 活動開始
	BeginPlot( Leader , "sasa_Leader_Talkshow_AI" , 0 )
end

-- 偵測玩家與活動主辦者距離  超出喪失資格
function sasa_Auction_checkrange(Leader)
	local OID = OwnerID()
	local timer = 0
	local endtime = 180  -- 活動3分鐘
	local range = 140+15 -- 140

	while true do 
		sleep(10)
		timer = timer + 1
		local dis = GetDistance(OID, Leader ) 

		if timer >= 177  then 
			break
		else
			if CheckID(Leader) == false then
				DebugMsg( 0 , 0 , "weave event - not find Leader,  break" )
				break
			else
				if dis > range then -- 140
					CancelBuff(OID , 623229 )  -- Del 活動技能buff   (刪除後會觸發Leave 的劇情)
					break
				elseif dis >= (range-10) then  --130
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_23]" , 0 )   --注意！你即將離開活動區域，若離開活動區域將會失去活動資格！
					ScriptMessage( OID , OID , 0 , "[SC_WEAVE_TAILOR_23]" , 0 )   
				end
			end
		end
	end

end

-- 活動進行中 活動技能buff被刪除時觸發 ( 換區 離線 死亡 出界)
function sasa_Auction_leave()
	local OID = OwnerID()
	ScriptMessage( OID , OID , 1 , "[SC_SASA2012_40]" , 0 )   --你在慈善搶標會進行中離開，失去了參與資格。
	ScriptMessage( OID , OID , 0 , "[SC_SASA2012_40]" , 0 )   
	CancelBuff(OID , 623237 )  -- Del 活動分數buff  
	CancelBuff(OID , 623241 )  -- Del king buff
	CancelBuff( OID , 623245 )	--刪號碼牌
	GiveBodyItem( OID , 241645 , 1 )  

end


function sasa_Auction_npcshow(step,Leader)
	local CTRL = OwnerID() -- 活動npc
	local flag = 781176
	local bornflag = {1, 2, 3, 4, 5 }
	local moveflag = {6,7,8,9,10 }
	local npclist = { 121092, 121093, 121094, 121095, 121096 }
	local speaklist = { "[SC_SASA2012_19]", "[SC_SASA2012_20]" , "[SC_SASA2012_21]", "[SC_SASA2012_22]" , "[SC_SASA2012_23]" }
	local people = {}

	-- 生活動參加npc
--	say(CTRL, "now step ="..step )

	for i = 1, step do
		People[i] = CreateObjByFlag( npclist[i] , flag , i , 1 )
		WriteRoleValue( People[i] , EM_RoleValue_Register8 , Leader ) 
		local R = Rand(5)+1
		AddToPartition( People[i] , 0 )
	--	say(people[i], "npc born -"..i )
		DW_MoveToFlag( People[i] , Flag , moveflag[i]  , 0 , 1 )  -- 移動到棋子上
		NPCSay( People[i], speaklist[R] )  -- npc隨機字串講話
		BeginPlot( People[i]  , "sasa_People_AInew" , 0 )  -- npc活動開始AI
		sleep(5)
	end
--	say(Ctrl, "npc born end")
end


-- 主辦人NPC AI
function sasa_Leader_Talkshow_AI()
	local Leader  = OwnerID()
	local reward = ReadRoleValue(Leader, EM_RoleValue_Register10 )  -- 活動主辦npc r10 = reward
	local range = 140		--活動半徑範圍
	local Maxmoney = 0
	local Leadertimer = 0
	local endtime = 180  -- 原設定是 180
	local endchecktime =  endtime-3  -- 活動結束前5秒 停止清空玩家
	local checktime = 20  --  20sec 檢查一次目前最高價出價者 總共 sec次
	local checkplayertime = 13
	local mostlv = 0
	local kingbuffid = 623241
	local scorebuff = 623237

	WriteRoleValue(Leader, EM_RoleValue_Register6, 1 )--活動中1 活動結束0
	while true do 
		sleep(10)
		Leadertimer = Leadertimer + 1 
	--	say(Leader, "Leadertimer = "..Leadertimer )

		if Leadertimer == endtime then -- 活動時間到
			WriteRoleValue(Leader, EM_RoleValue_Register6, 0 )--活動中1 活動結束0
			local Player = SearchRangePlayer( Leader , range ) --周圍150玩家
--			Maxmoney = ReadRoleValue(Leader,EM_RoleValue_Register8)--最高價
			sasa_Leader_checkking();
			local king = ReadRoleValue(Leader, EM_RoleValue_Register9 )--得標者
		--	local name = getname(king) 

			if ReadRoleValue(king  , EM_RoleValue_IsPlayer ) == 1 then
				NPCSAY( Leader ,  getname(king).."[SC_SASA2012_26]" )--你真是太棒了，這項殊榮是屬於你的！
				GiveBodyItem( king , reward , 1 )  --給大獎
			end
			AddBuff(king, kingbuffid, 0, 14  )  -- 目前最高分者--給buff判斷

			for i = 0, table.getn(Player)-1 do
				if CheckBuff(Player[i], 623229 ) == true then -- 活動技能
					if CheckBuff( Player[i] , scorebuff ) == true then 	--有分數的紀錄
						local bufflv = FN_CountBuffLevel(Player[i], scorebuff )    -- 出價等級
						local bufflvnew = bufflv+1

						--活動結束，你在這次搶標會的出價次數為<CS>[$VAR1]</CS>。
						ScriptMessage( Player[i], Player[i] , 1 , "[SC_SASA2012_34][$SETVAR1="..bufflvnew.."]" , C_SYSTEM )   
						ScriptMessage( Player[i], Player[i] , 0 , "[SC_SASA2012_34][$SETVAR1="..bufflvnew.."]" , C_SYSTEM )  

						if CheckBuff(Player[i], kingbuffid ) == false then
							Tell(  Player[i], Leader , "[SC_SASA2012_16]" )
							--恭喜你啦！快來領獎吧！其他人也別氣餒，我們也有精美小禮品要送給你們。
						end

						--  有分數者都給
						if bufflvnew >= 41 then
							GiveBodyItem( Player[i] , 241646 , 1 )  
						elseif bufflvnew >= 31 and bufflvnew <= 40 then
							GiveBodyItem( Player[i] , 241645 , 5 )  
						elseif bufflvnew >= 21 and bufflvnew <= 30 then
							GiveBodyItem( Player[i] , 241645 , 3 )  
						elseif bufflvnew >= 11 and bufflvnew <= 20 then
							GiveBodyItem( Player[i] , 241645 , 2 )  
						elseif bufflvnew >= 1 and bufflvnew <= 10 then
							GiveBodyItem( Player[i] , 241645 , 1 )  
						end

					end

					Setflag(Player[i], 546876, 1 )  -- 給予當天完成key
			--		DesignLog( Player[i], 120905 , "Craft event machine play number".."." )

					sleep(10)
					---------------  給予全勤獎 --------------------
					Lua_Festival_07_All(Player[i])    -- 2013 改全勤獎函式 
					-----------------------------------------------------
				
					CancelBuff( Player[i] , 623237 )	--刪喊價次數
					CancelBuff( Player[i] , 623245 )	--刪號碼牌
					CancelBuff_NoEvent( Player[i]  , 623229 )  --刪技能BAR

				end
			
			end
		
		--	say(king, "del king buff")	
			CancelBuff( king, kingbuffid )
			WriteRoleValue(Leader, EM_RoleValue_Register9, 0 )

			sleep(25)
			NPCSAY(Leader, "[SC_SASA2012_37]")
			-- 感謝各位的參與，這次的慈善搶標會到此結束，我們下會見！

			sleep(30)

			-- 刪除活動相關npc
			local npc = SearchRangeNPC(Leader, range )
			local objlist = { 121092 , 121093 , 121094 , 121095 , 121096  }

		--	say(Leader, "del event obj")

			for i = 0 , table.getn(npc)-1 do 	-- 搜尋範圍內玩家
				local Orgid = ReadRoleValue(NPC[i], EM_RoleValue_OrgID )
				if Orgid == objlist[1] or Orgid == objlist[2] or Orgid == objlist[3] or Orgid == objlist[4] or Orgid == objlist[5] then
					Delobj(npc[i] )
				end
			end
			Delobj( Leader )
			break
		elseif Leadertimer%checkplayertime == 0 then
			BeginPlot(Leader, "sasa_Leader_checkplayer", 0 )
		elseif Leadertimer%checktime == 0 then  -- 檢查目前最高價者
			if Leadertimer < endchecktime then  -- 結束前5秒不再檢查
				Callplot( Leader, "sasa_Leader_checkking", 0 )
			end
		end
	end
end


function sasa_Leader_checkplayer()
	local Leader  = OwnerID()
	local range = 140		--活動半徑範圍
	local joinplayer = {}
	local Player = SearchRangePlayer( Leader , range ) --周圍150玩家

	for i = 0, table.getn(Player)-1 do
		if CheckBuff( Player[i] , 623229 ) == true then  -- 參與活動的玩家
			table.insert( joinplayer , Player[i] ) 
		end
	end
--	say(Leader, "joinplayer="..table.getn(joinplayer) )
	if table.getn(joinplayer) == 0 then
		say(Leader, "[SC_SASA2012_36]")
		sleep(25)
		-- 刪除活動相關npc
		local npc = SearchRangeNPC(Leader, range )
		local objlist = { 121092 , 121093 , 121094 , 121095 , 121096  }

		for i = 0 , table.getn(npc)-1 do 	-- 搜尋範圍內玩家
			local Orgid = ReadRoleValue(NPC[i], EM_RoleValue_OrgID )
			if Orgid == objlist[1] or Orgid == objlist[2] or Orgid == objlist[3] or Orgid == objlist[4] or Orgid == objlist[5] then
				Delobj(npc[i] )
			end
		end

		Delobj( Leader )
	end

end


function sasa_Leader_checkking()
	local Leader  = OwnerID()
	local reward = ReadRoleValue(Leader, EM_RoleValue_Register10 )  -- 活動主辦npc r10 = reward
	local number = ReadRoleValue(Leader, EM_RoleValue_Register7 )  -- 活動主辦npc r7 = 目前號碼牌
	local range = 140		--活動半徑範圍
	local Leadertimer = 0
	local mostlv = 0
	local mostindex = 0
	local kingbuffid = 623241
	local scorebuff = 623237
	local scorebuff2 = 623245
	local cardbuff = 623244 -- 出價號碼牌buff
	local Win01 = SearchRangePlayer( Leader , range ) --周圍150玩家
	local Win02 = SearchRangeNPC ( Leader , range ) --周圍150 NPC

	WriteRoleValue(Leader, EM_RoleValue_Register9, 0  )
--	say(Leader, "reset mostlv  ")

	for i = 0 , table.getn(Win01)-1 do  -- 檢查玩家
		if CheckBuff( Win01[i] , scorebuff ) == true then 	--有分數的紀錄
			local bufflv = FN_CountBuffLevel(Win01[i], scorebuff )  
			local bufflv2 = FN_CountBuffLevel(Win01[i], scorebuff2 )  
			if mostlv < bufflv  or (mostlv == bufflv and mostindex > bufflv2)then
				mostlv = bufflv
				mostindex = bufflv2
				WriteRoleValue(Leader, EM_RoleValue_Register9, Win01[i]  )
			end
		end
	end
	for i = 0 , table.getn(Win02)-1 do  -- 檢查npc
		if CheckBuff( Win02[i] , scorebuff ) == true then 	--有分數的紀錄
			local bufflv = FN_CountBuffLevel(Win02[i], scorebuff ) 
			local bufflv2 = FN_CountBuffLevel(Win02[i], scorebuff2 )  
			if mostlv < bufflv  or (mostlv == bufflv and mostindex > bufflv2)then
				mostlv = bufflv
				mostindex = bufflv2
				WriteRoleValue(Leader, EM_RoleValue_Register9, Win02[i]  )
			end
		end
	end

	local king = ReadRoleValue(Leader, EM_RoleValue_Register9 )
--	say(king, "I am king")

	if CheckID(king) == True then   -- 有king
		local dis = GetDistance(Leader, king )
	--	say(Leader, "king dis ="..dis )
		if dis <= range then
	--		say(Leader, "in range" )

			local bufflv = FN_CountBuffLevel(king, scorebuff ) 
			local bufflvnew = bufflv + 1
		--	local name = getname(king) 
			AddBuff(king, kingbuffid, 0, 14  )  -- 目前最高分者
			NPCSAY( Leader ,  getname(king).."[SC_SASA2012_29][$SETVAR1="..bufflvnew.."]" )
			--的出價次數為[$VAR1]，是目前最高的出價者，還有誰躍躍欲試呀？
		end
	end
end


-- 活動參與npc AI
function sasa_People_AInew()
	local OID = OwnerID()
	local skill1 = 850360  -- 喊價 (對自己使用的)
	local skill2 = { 850355 , 850371 }	--保鏢 , 套索 (對)
	local range = 140
	local Leader =  LuaFunc_SearchNPCbyOrgID( OID , 121089 , range , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	local skill1R = RandRange( 5, 8  )  -- 15 ~ 20 次
	local skill2R = RandRange( 13, 20  )  -- 10 ~ 15 次
	local endtime = 180 -- 原設定為 180
	local npctimer = 0
	local skill1R = RandRange( 5, 8  )  -- 15 ~ 20 次
	local skill2R = RandRange( 13, 20  )  -- 10 ~ 15 次
	sleep(40)

	local NPC1 = LuaFunc_SearchNPCbyOrgID( OID , 121092 , range , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	local NPC2 = LuaFunc_SearchNPCbyOrgID( OID , 121093 , range , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	local NPC3 = LuaFunc_SearchNPCbyOrgID( OID , 121094 , range , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	local NPC4 = LuaFunc_SearchNPCbyOrgID( OID , 121095 , range , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	local NPC5 = LuaFunc_SearchNPCbyOrgID( OID , 121096 , range , 0 ) --以物件為中心，向周圍N碼搜尋特定IDNPC
	local count_npc1  = Lua_Hao_NPC_Range_Search( OID ,121092 , range )  -- range 內物件數量 
	local count_npc2  = Lua_Hao_NPC_Range_Search( OID ,121093 , range )  -- range 內物件數量 
	local count_npc3  = Lua_Hao_NPC_Range_Search( OID ,121094 , range )  -- range 內物件數量 
	local count_npc4  = Lua_Hao_NPC_Range_Search( OID ,121095 , range )  -- range 內物件數量 
	local count_npc5  = Lua_Hao_NPC_Range_Search( OID ,121096 , range )  -- range 內物件數量 
	local OwnerOrg = ReadRoleValue(OID, EM_RoleValue_OrgID )

	local objlist = {}
	if  ( OwnerOrg ~= 121092 ) and ( count_npc1 > 0 )  then 
		table.insert( objlist , NPC1 ) 
	end
	if  ( OwnerOrg ~= 121093 ) and ( count_npc2 > 0 )  then 
		table.insert( objlist , NPC2 ) 
	end
	if  ( OwnerOrg ~= 121094 ) and ( count_npc3 > 0 )  then 
		table.insert( objlist , NPC3 ) 
	end
	if  ( OwnerOrg ~= 121095 ) and ( count_npc4 > 0)  then 
		table.insert( objlist , NPC4 ) 
	end
	if  ( OwnerOrg ~= 121096 ) and ( count_npc5 > 0 )  then 
		table.insert( objlist , NPC5 ) 
	end

--	say(OID, "NPC Target ="..table.getn(objlist) )

	while true do 
	--	NPCsay(OID, "npctimer = "..npctimer )

		if npctimer == endtime then  -- 活動時間到
			break
		elseif npctimer < ( endtime - 3 ) then
			if CheckBuff(OID, 623228 )  == false then   -- 沒有被套索
				if npctimer%skill1R == 0 then  -- 施放加價
					CastSpell(OID, OID, 850360 )
				elseif npctimer%skill2R == 0 then  -- 施放其他技能
					local R2 = Rand(100)+1  --判斷使用哪一個skill
					local RR = Rand(100)+1  -- RAND要對玩家 還是NPC
					if RR >= 65 then  -- 對npc放 
						if table.getn(objlist) > 0 then
							local RN = Rand(table.getn(objlist))+1  -- 從joinplayer table 取一個玩家
							local TargeNPC = objlist[RN]
						--	SAY(TargeNPC, "IT IS ME - NPC ")

							if R2 >= 65 then
								CastSpell(OID, TargeNPC, skill2[1] )
							else
								CastSpell(OID, TargeNPC, skill2[2] )	
							end
						end
					else   -- 對玩家放
						local joinplayer = {}
						local player  = SearchRangePlayer(OID, range )
						local R2 = Rand(100)+1

						for i = 0 , table.getn(player)-1 do 	-- 搜尋範圍
						--	SAY(Player[i], "Player ")
							if CheckBuff(Player[i], 623229 ) == true then -- 有活動技能buff
						--		SAY(Player[i], "have buff ")
								table.insert(joinplayer, Player[i] )
							end
						end
						if table.getn(joinplayer) > 0 then
							local RP = Rand(table.getn(joinplayer))+1  -- 從joinplayer table 取一個玩家
							local TargetPlayer = joinplayer[RP]
						--	SAY(TargetPlayer, "IT IS ME 2 ")
							if R2 >= 55 then
								CastSpell(OID, TargetPlayer, skill2[1] )
							else
								CastSpell(OID,  TargetPlayer, skill2[2] )	
							end
						end
					end
				end
			end
		end
		sleep(10)
		npctimer = npctimer +1

	end
end


---------------------技能---------------------

--使用 喊價
function sasa_Skill_Money()
	local Player = OwnerID()
	local Leader = ReadRoleValue(Player,EM_RoleValue_Register8)
	local Maxmoney = ReadRoleValue(Leader,EM_RoleValue_Register8)--總喊價次序
	local Action = ReadRoleValue(Leader,EM_RoleValue_Register6)
	if(Action == 1) then
		Maxmoney = Maxmoney +1
		Addbuff( Player , 623237 , 0 , 310 ) --玩家獲得分數
		WriteRoleValue(Leader, EM_RoleValue_Register9, Player )--玩家id
		WriteRoleValue(Leader, EM_RoleValue_Register8, Maxmoney )--總喊價次序
		--喊價次序
		CancelBuff(Player, 623245);
		Addbuff( Player , 623245 , Maxmoney , 310 ) --玩家喊價次序
		
	--	DebugMsg(0,0,"Maxmoney = "..Maxmoney.." PlayerID = "..getname(Player))
		--ScriptMessage( Player , Player , 1 , "[SC_SASA2012_35][$SETVAR1="..Maxmoney.."]" , C_SYSTEM )   -- 你使用了出價，現在的出價次數為<CS>[$VAR1]</CS>。
		--ScriptMessage( Player , Player , 0 , "[SC_SASA2012_35][$SETVAR1="..Maxmoney.."]" , C_SYSTEM )   -- 你使用了出價，現在的出價次數為<CS>[$VAR1]</CS>。
		--NPCSAY( Leader , "[SC_SASA2012_29][$SETVAR1="..Maxmoney.."]" )
	end
end

--保鑣 
function sasa_Skill_Safelive()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local XR = RandRange(6, 8)
	local ZR = RandRange(6, 8)
	local Xman = star_CreateObj_NoAdd( OwnerID() , 121091 , XR , 0 , ZR , Room , 0 )
	SetModeEx( Xman , EM_SetModeType_SearchenemyIgnore , true )	--物件不會被搜尋
	SetModeEx( Xman , EM_SetModeType_HideName , true )  		--物件頭上是否顯示名稱
	SetModeEx( Xman , EM_SetModeType_HideMinimap , true )		--物件是否在小地圖上顯示
	SetModeEx( Xman , EM_SetModeType_Searchenemy , false )   	--索敵
	SetModeEx( Xman , EM_SetModeType_Mark , false )				--標記
	SetModeEx( Xman , EM_SetModeType_Fight , false ) 			--砍殺
	SetModeEx( Xman , EM_SetModeType_Move , false )				--移動
	SetModeEx( Xman , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( Xman , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( Xman , EM_SetModeType_Show , true )				--秀出
	AddToPartition( Xman , Room )
	WriteRoleValue( Xman , EM_RoleValue_Livetime, 8 )			--存在秒數
	NPCSAY( Xman , "[SC_SASA2012_17]" )
	--保護老闆！
end


-- 套索 施法檢查 
function sasa_Check_cantuse01()		
	local OID = OwnerID()
	local buffid = 623229  -- 活動技能buff
	local npclist = {121092, 121093, 121094, 121095, 121096 }
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )  -- 施法目標的Orgid

	if CheckBuff(TargetID(), 623228 ) == true then  --有套索
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SASA2012_33]" , 0 )  
		return false
	-- 目標對象已有[623228]效果，無法重複使用
	elseif CheckBuff(TargetID(), 623226 ) == true then  -- 有保鑣
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SASA2012_41]" , 0 )  
		return false
		-- 目標對象持有[623226]效果，無法使用。
	else
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			if TargetID() == OwnerID() then  -- 對自己使用
				ScriptMessage( OID , OID , 1 , "[SC_SASA2012_30]" , 0 ) 
				return false
				-- 使用目標錯誤，請對慈善搶標會活動相關角色使用。
			else
				if CheckBuff(TargetID(), buffid ) == false then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SASA2012_32]" , 0 )  
					-- 目標對象沒有參與活動，無法使用
					return false
				else
					return true
				end
			end
		else  -- 不是玩家
			if ( OrgID == npclist[1] ) or ( OrgID == npclist[2] ) or ( OrgID == npclist[3] ) or ( OrgID == npclist[4] ) or ( OrgID == npclist[5] ) then
				return true

			else 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SASA2012_30]" , 0 )   
				 --  使用目標錯誤，請對慈善搶標會活動相關角色使用
				return false
			end
		end
	end
end


-- 喊價 , 保鑣 施法檢查 (可對自己用的)
function sasa_Check_cantuse02()	
	local OID = OwnerID()	
	if TargetID() ~= OwnerID() then
		ScriptMessage( OID , OID , 1 , "[SC_SASA2012_31]" , 0 )
		-- 使用目標錯誤，此技能只能對自己使用
		return false
	else
		return true
	end
end 

function mika_weave_auction_test1()
	local OID = OwnerID()	
	local itemlist  = { 232011 , 232012 , 232013 , 232014 }   -- 6.0.2 
	local number = rand(3)+1 
	local rewardid = itemlist[number] 

	SAY( OID , "[SC_WEAVE2013_AUCTION_01][$SETVAR1=".."["..rewardid.."]".."]" )  -- 6.0.2改

end