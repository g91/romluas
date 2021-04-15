function Lua_ying_weave_begin()

	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --讀取隱藏物件位於哪個Zone
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() , 119003 , 100 , 0 ) --以隱藏物件118969為中心，向周圍100碼搜尋NPC英格麗119003
										       --(最後的0為Type，Type 0 的話會在只找到一個目標時回傳該目標，適用於已知數量目標)
										       --(1 的話則是無論找到幾個，都回傳整個群組，適用於未知數量目標)
	local HR = { 11 , 14 , 17 , 20 } --50分：11點50、14點50、17點50、20點50
	local HR2 = { 12 , 15 , 18 , 21 } --整點：12點、15點、18點、21點
--	local Modelnpc = { {118970 , 118971 , 1 } , { 118987 , 118988 , 2 } , { 118989 , 118990 , 3 } , { 118991 , 118992 , 4 } , { 118993 , 118994 , 5 } , { 118995 , 118996 , 6 } , { 118997 , 118998 , 7 } , { 118999 , 119000 , 8 } , { 119001 , 119002 , 9 } }
	local Modelnpc = { {122452 , 122453 , 1 } , { 122454 , 122455 , 2 } , { 122456 , 122457 , 3 } , { 122458 , 122459 , 4 } , { 122460 , 122461 , 5 } , { 122462 , 122463 , 6 } , { 118989 , 118990 , 7 } , { 118997 , 118998 , 8 } , { 119001 , 119002 , 9 } }   --6.0.2 更新
	local Flag = { 0 , 4 }
	local Random
	local Model
	-- 118970 = Modelnpc[1][1] , 118901 = Modelnpc[1][2] 
	while true do
--		Say( OwnerID() , "begin" )
--		Say( NPC , "NPC = "..NPC )
		local Hour = GetSystime(1) --取得現在時間：時
		local Min = GetSystime(2) --取得現在時間：分
		local Weave_Hour = ReadRoleValue( NPC , EM_RoleValue_Register+2 )	-- 調整現在時
		local Weave_Min = ReadRoleValue( NPC , EM_RoleValue_Register+3 )	-- 調整現在分

		if Hour + Weave_Hour >= 24 then
			hour = Weave_Hour + hour - 24
		else
			hour = Weave_Hour + hour
		end

		if Min + Weave_Min >= 60 then
			min = Weave_Min + min  - 60
			hour = hour + 1
			if hour >= 24 then
				hour = hour - 24
			end
		else
			min = Weave_Min + min
		end
--		local Reg
--		Reg = ReadRoleValue( NPC , EM_RoleValue_Register9 ) --讀取NPC英格麗119003身上的Register9值
--		Say( OwnerID() , "Reg1 = "..Reg)
		if ZoneID < 1000 then --(分流1：2、分流2：1002、分流3：2002，若ZoneID大於1000則為分流)
			for i = 1 , table.getn(HR) , 1 do --1 , 4 , 1 do --HR的1~4位置
				if Hour == HR[i] and Min == 50 then --若"時=11 , 14 , 17 , 20 & 分=50"
					DebugMsg( 0 , 0 , "Hour ="..Hour.."Min ="..Min.."Weave_Sign" )
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_WEAVE_2011_01]" ) --綵織節活動"經典回顧．服裝展"即將在10分鐘後開始，請前往凡瑞娜絲城尋找英格麗報名參加！
					WriteRoleValue( NPC , EM_RoleValue_Register9 , 1 ) --把NPC英格麗的Register9值寫為"1"，表示NPC開放報名
--					Reg = ReadRoleValue( NPC , EM_RoleValue_Register9 ) --讀取NPC英格麗119003身上的Register9值
--					Say( OwnerID() , "Reg2 = "..Reg)
				elseif Hour == HR2[i] and Min == 0 then
					DebugMsg( 0 , 0 , "Hour ="..Hour.."Min ="..Min.."Weave_Begin" )
					if table.getn(Modelnpc) == 0 then --當 Modelnpc table總數等於0時，則重新寫入Modelnpc table
					--	Modelnpc = { {118970 , 118971 , 1 } , { 118987 , 118988 , 2 } , { 118989 , 118990 , 3 } , { 118991 , 118992 , 4 } , { 118993 , 118994 , 5 } , { 118995 , 118996 , 6 } , { 118997 , 118998 , 7 } , { 118999 , 119000 , 8 } , { 119001 , 119002 , 9 } }
						Modelnpc = { {122452 , 122453 , 1 } , { 122454 , 122455 , 2 } , { 122456 , 122457 , 3 } , { 122458 , 122459 , 4 } , { 122460 , 122461 , 5 } , { 122462 , 122463 , 6 } , { 118989 , 118990 , 7 } , { 118997 , 118998 , 8 } , { 119001 , 119002 , 9 } }   --6.0.2 更新
					end

					for j = 1 , 3 , 1 do --總共依序出現三組表演npc
						Random = Rand(table.getn(Modelnpc))+1 --第一次出場Rand(9)+1 = 1~9 (第幾組) --第2次出場則Rand(8)+1 = 1~8(因扣除第一次已出場的組別)
						SetModeEx( NPC , EM_SetModeType_Mark, false ) --將英格麗標記關閉
						WriteRoleValue( NPC , EM_RoleValue_Register9 , 2 ) --把NPC英格麗的Register9值寫為"2"，表示活動進行中
--						Reg = ReadRoleValue( NPC , EM_RoleValue_Register9 ) --讀取NPC英格麗119003身上的Register9值
--						Say( OwnerID() , "Reg3 = "..Reg)
						if j == 1 then --若為第一次出場則
							Yell( NPC , "[SC_WEAVE_2011_08_1]" , 2 ) --哈囉～大家好呀，首先歡迎各位能前來參與「經典回顧．服裝展」…
							PlayMotion( NPC , 116 ) --揮手
							Sleep(50)
							Yell( NPC , "[SC_WEAVE_2011_08_2]" , 2 ) --讓我先為大家說明一下活動流程吧！
							PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_CUTE2 ) --鞠躬
							Sleep(50)
							Yell( NPC , "[SC_WEAVE_2011_08_3]" , 2 ) --等等會有模特兒分別展出三套的服裝，每當展示完一套服裝時，會留有5分鐘時間給大家，而大家必須在這5分鐘內，
												      --來向我出示各位手上氣息絲線，出示氣息絲線最多的前三位，就能獲得兌換該服裝的資格唷！
							PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話 
							Sleep(80)
							Yell( NPC , "[SC_WEAVE_2011_08_4]", 2 ) --每個人每天只能能獲得一次的兌換資格，所以大家一定要仔細看清楚想要的服裝後，再來向我出示氣息絲線，都明白了嗎？
							PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話 
						Sleep(50)
							Yell( NPC , "[SC_WEAVE_2011_08_5]", 2 ) --那麼接下來服裝展即將要開始囉，祝大家好運！
						else
							Yell( NPC , "[SC_WEAVE_2011_10]" , 2 ) --前三名的朋友都拿到兌換服裝資格證明了嗎？沒獲得的朋友別灰心唷，下一輪的服裝展示即將開始！
						end
						PlayMotion( NPC , 103 ) --加油
						Sleep(50)
						--Say( OwnerID() , "Random = "..Random.."; Count = "..table.getn(Modelnpc) )
						for i = 1 , 2 , 1 do --建立1女1男 NPC						
							Model = CreateObjByFlag( Modelnpc[Random][i] , 780989 , Flag[i] , 1 ) --參照指定旗子的位置來產生物件(NPC編號、旗子代號、第幾號旗子、物件數量 )
							SetModeEx( Model , EM_SetModeType_Mark , false ) --不顯示標記
							SetModeEx( Model , EM_SetModeType_SearchenemyIgnore , false ) --不可被搜尋
							AddToPartition( Model , 0 )
							Callplot( Model , "Lua_ying_weave_Delnpc" , 3600 , Random ) --6分鐘後刪除NPC
							Callplot( Model , "Lua_ying_weave_model" , i , NPC ) --走秀						
						end
						WriteRoleValue( NPC , EM_RoleValue_Register+7 , Modelnpc[Random][3] ) --將npc身上的Register+7寫入Rand的1~9
						Sleep(3000) --5分鐘後提示剩下一分鐘
						Yell( NPC , "[SC_WEAVE_2011_24]" , 2 ) --時間只剩下一分鐘唷！
						PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話 
						Sleep(600)--6分鐘刪除NPC後
						SetModeEx( NPC , EM_SetModeType_Mark, false ) --將英格麗標記關閉
						WriteRoleValue( NPC , EM_RoleValue_Register9, 3 ) --把NPC英格麗的Register9值寫為"3"，讓獲得資格玩家領取兌換資格及出哪件套裝BUFF
--						Reg = ReadRoleValue( NPC , EM_RoleValue_Register9 ) --讀取NPC英格麗119003身上的Register9值
--						Say( OwnerID() , "Reg5 = "..Reg)
						Yell( NPC , "[SC_WEAVE_2011_11]" , 2 ) --出示時間到囉～恭喜前三名的朋友！接下來的3分鐘，就請前三名的朋友，來跟我領取兌換服裝資格證明吧！
						PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話
						Sleep(30)
						SetModeEx( NPC , EM_SetModeType_Mark, true ) --將英格麗標記打開
						Sleep(1800)--3分鐘 --再建立下一組NPC
						WriteRoleValue( NPC , EM_RoleValue_Register+7 , 0 ) --將npc身上的Register+7歸0
						table.remove( Modelnpc , Random ) --移除model table裡rand到的組別 ( 哪個Table , 第幾組 )
						if j == 3 then --若為第三次出場表演NPC
							WriteRoleValue( NPC , EM_RoleValue_Register9 , 0 )
							WriteRoleValue( NPC , EM_RoleValue_Register+2 , 0 )
--							Reg = ReadRoleValue( NPC , EM_RoleValue_Register9 ) --讀取NPC英格麗119003身上的Register9值
--							Say( OwnerID() , "Reg4 = "..Reg)
							Yell( NPC , "[SC_WEAVE_2011_23]", 2 ) --這個場次的服裝展就到這邊結束囉！感謝大家熱情參與！
							PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_CUTE2 ) --鞠躬
						end
					end
				end
			end			
		end
		Sleep(600) --1分鐘跑一次迴圈
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_Delnpc( Sec , Random ) --60秒後刪除NPC

--	for i = 1 , Sec/10 , 1 do --1 , 30 , 1 do
--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Random ) --寫入第幾組PID
		Sleep( Sec ) 
--		Say( OwnerID() , i )
--	end
		DelObj( OwnerID() ) --60秒後刪除
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_model( Sex , NPC ) --走秀(將上一個function的 i 代入)

	local Flag = 780989
	local Count
	local Motion = { }
--	local Motion = { 103 , 109 , 111 , 114 , 116 , 123 , 250 , 251 , 253 , 260 , 261 , 266 }

	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 ) --設定為走路
	if Sex == 1 then --女 --table的第一個位置
		Count = 0
		Motion = { 103 , 109 , 111 , 114 , 116 , 123 , 250 , 251 , 260 , 261 }
	elseif Sex == 2 then --男 --table的第二個位置
		Count = 4
		Motion = { 103 , 109 , 111 , 114 , 116 , 123 , 250 , 251 , 260 , 261 }
	end
--	Say( OwnerID() , "Count = "..Count )
	for i = 1 , 3 , 1 do
		local Random = Rand(10)+1
		Count = Count + 1
		DW_MoveToFlag( OwnerID() , Flag , Count , 0 , Enable )
		-- 執行移動的對象、旗子的資料庫編號、旗子編號、亂數決定移動到定點的範圍、Enable  0，不關閉movotoflag   1，關閉movetoflag
		Sleep(10)
		PlayMotion( OwnerID() , Motion[Random] )
		Sleep(40)
	end
	
	for i = 1 , 3 , 1 do
		local Random = Rand(10)+1
		Count = Count - 1
		DW_MoveToFlag( OwnerID() , Flag , Count , 0 , Enable )
		-- 執行移動的對象、旗子的資料庫編號、旗子編號、亂數決定移動到定點的範圍、Enable  0，不關閉movotoflag   1，關閉movetoflag
		Sleep(10)
		if i == 1 or i == 2 then --走回旗標2與旗標1做動作
			if Sex == 1 then --女
				FA_FaceFlagEX( OwnerID() , 780989 , 3 ) --面向旗標3
			elseif Sex == 2 then --男
				FA_FaceFlagEX( OwnerID() , 780989 , 7 ) --面向旗標7
			end
			PlayMotion( OwnerID() , Motion[Random] )
			Sleep(40)
		end
	end
	if Sex == 1 then --女
		FA_FaceFlagEX( OwnerID() , 780989 , 3 ) --面向旗標3
	elseif Sex == 2 then --男
		FA_FaceFlagEX( OwnerID() , 780989 , 7 ) --面向旗標7
		WriteRoleValue( NPC , EM_RoleValue_Register+1 , 0 ) --將npc身上的Register+1、Registe+4、Registe+5、Registe+6 歸零
		WriteRoleValue( NPC , EM_RoleValue_Register+4 , 0 ) 
		WriteRoleValue( NPC , EM_RoleValue_Register+5 , 0 ) 
		WriteRoleValue( NPC , EM_RoleValue_Register+6 , 0 ) 
		Yell( NPC , "[SC_WEAVE_2011_09]" , 2 ) --模特兒身上穿的衣服很美吧！想獲得的話，就趕緊過來向我出示你手中的氣息絲線吧！
		PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --說話
		Sleep(20)
		SetModeEx( NPC , EM_SetModeType_Mark, true ) --將英格麗標記打開	
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_119003talk() --NPC英格麗 對話劇情
--	Say(OwnerID(), "Owner") --玩家
--	Say(TargetID(), "Target") --NPC
	local Reg = ReadRoleValue( TargetID() , EM_RoleValue_Register9 ) --讀取NPC身上的Register9值
	local Sign = CheckBuff( OwnerID() , 620636 ) --已報名BUFF
	local Change = CheckBuff( OwnerID() , 620637 ) --兌換服裝資格
	local Over = CheckFlag( OwnerID() , 545450 ) --得標領取完成key
	local Rank = {	[1] = ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) ,
--			[2] = String.rep( "0" , 1 ) , --1表示引號裡的字串顯示1次
--			[3] = String.rep( "0" , 1 ) 					}
			[2] = 0 , 
			[3] = 0	}
	local Score = { [1] = ReadRoleValue( TargetID() , EM_RoleValue_Register+4 ) ,  -- 第一高的出價
			[2] = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 ) ,  -- 第二高的出價
			[3] = ReadRoleValue( TargetID() , EM_RoleValue_Register+6 ) }  -- 第三高的出價

	if Rank[1] == 0 then		-- 都沒有人競標時
--		Rank[1] = String.rep( "0" , 1 )	
		Rank[1] = 0
	elseif Rank[1] == 2 then	-- 只有兩人競標時
		Rank[2] = Rank[1] - 1
	elseif Rank[1] > 2 then	-- 三人以上競標時
		Rank[2] = Rank[1] - 1
		Rank[3] = Rank[1] - 2
	end

	if Reg == 2 then --活動開始
		if Sign == true then --已報名
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_13][$SETVAR1="..Rank[1].."][$SETVAR2="..Rank[2].."][$SETVAR3="..Rank[3].."][$SETVAR4="..Score[1].."][$SETVAR5="..Score[2].."][$SETVAR6="..Score[3].."]" )
		--想得到模特兒身上展示的服裝嗎？把握時間，別吝嗇手上的氣息絲線唷～ --目前能獲取兌換服裝資格的前三名為：
		-- 第一名：編號[$VAR1]號出示者 ，出示數量為[$VAR4]個。  -- 第二名：編號[$VAR2]號出示者 ，出示數量為[$VAR5]個。  -- 第三名：編號[$VAR3]號出示者 ，出示數量為[$VAR6]個。
		-- 那麼，這次你想出示多少個氣息絲線呢？
			AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_14][$SETVAR1=".."10".."]" , "Lua_ying_weave_giveitem10" , 0 ) --我想比第一名多出示10個氣息絲線！
			AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_14][$SETVAR1=".."20".."]" , "Lua_ying_weave_giveitem20" , 0 ) --我想比第一名多出示20個氣息絲線！
			AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_14][$SETVAR1=".."50".."]" , "Lua_ying_weave_giveitem50" , 0 ) --我想比第一名多出示50個氣息絲線！
		elseif Change == true then --已有兌換服裝資格
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_15]" ) --你已經獲得了兌換服裝資格囉，趕緊去找特瑞西進行兌換吧！
		elseif Over == true then --得標領取完成key
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_20]" ) --你今天已經獲得過經典服裝了，明天才能再參與活動哦～
		else --未報名
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_12]" ) --由於你沒有報名獲得參與服裝展的資格，所以無法進行此活動哦～
		end
	elseif Reg == 3 then --讓獲得資格玩家領取兌換資格及哪件套裝BUFF
		if Sign == true then --有報名buff
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_17][$SETVAR1="..Rank[1].."][$SETVAR2="..Rank[2].."][$SETVAR3="..Rank[3].."][$SETVAR4="..Score[1].."][$SETVAR5="..Score[2].."][$SETVAR6="..Score[3].."]" )
			--恭喜以下編號的朋友，將可獲得兌換服裝證明，你們很厲害唷！趕緊帶著你們所出示的數量來跟我兌換證明吧～
			--編號[$VAR1]號，出示氣息絲線的數量為[$VAR4]個。--編號[$VAR2]號，出示氣息絲線的數量為[$VAR5]個。--編號[$VAR3]號，出示氣息絲線的數量為[$VAR6]個。
			AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_18]" , "Lua_ying_weave_cloth" , 0 ) --我想領取兌換服裝資格！
		elseif Change == true then --已有兌換服裝資格
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_15]" ) --你已經獲得了兌換服裝資格囉，趕緊去找特瑞西進行兌換吧！
		elseif Over == true then --得標領取完成key
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_20]" ) --你今天已經獲得過經典服裝了，明天才能再參與活動哦～
		else --無報名BUFF 
			SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_12]" ) --由於你沒有報名獲得參與服裝展的資格，所以無法進行此活動哦～
		end
	elseif Reg == 1 then --活動開始報名
		LoadQuestOption( OwnerID() ) --讀取模版
		AddSpeakOption( OwnerID() , TargetID() , "[SC_111576_YU_03]" , "Lua_ying_weave_sign" , 0 ) --"我要報名！"選項
		AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_02]" , "Lua_ying_weave_game" , 0 ) --我想知道「經典回顧．服裝展」的活動內容  選項
	elseif Reg == 0 then --活動未開始、未在報名時間
		LoadQuestOption( OwnerID() ) --讀取模版
		AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_02]" , "Lua_ying_weave_game" , 0 ) --我想知道「經典回顧．服裝展」的活動內容  選項
		AddSpeakOption( OwnerID() , TargetID() , "[SC_COLORWEAVE_01]" , "Lua_ying_weave_story" , 0 ) --我想知道綵織節的由來
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_cloth() --我想領取兌換服裝資格！

	CloseSpeak( OwnerID() )

	local NumBuff = CheckBuff( OwnerID() , 507946 ) --編號buff
	local BuffLV = FN_CountBuffLevel( OwnerID() , 507946 ) --判斷玩家身上的出示編號BUFF等級多少
	local Count = CountBodyItem( OwnerID() , 240502 ) --判斷玩家身上氣息絲線的數量
	local Reg7 = ReadRoleValue( TargetID() , EM_RoleValue_Register+7 ) --讀取NPCRegister+7值，用來判斷出哪件套裝
	local Rank = {	[1] = ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) ,
			[2] = 0 , 
			[3] = 0	}
	local Score = { [1] = ReadRoleValue( TargetID() , EM_RoleValue_Register+4 ) ,  -- 第一高的出價
			[2] = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 ) ,  -- 第二高的出價
			[3] = ReadRoleValue( TargetID() , EM_RoleValue_Register+6 ) }  -- 第三高的出價

	if Rank[1] == 0 then		-- 都沒有人競標時
		Rank[1] = 0
	elseif Rank[1] == 2 then	-- 只有兩人競標時
		Rank[2] = Rank[1] - 1
	elseif Rank[1] > 2 then	-- 三人以上競標時
		Rank[2] = Rank[1] - 1
		Rank[3] = Rank[1] - 2
	end
--	Say(TargetID() , "Reg7 = "..Reg7 )
	if NumBuff == true then  --身上已有編號buff
		for i = 1 , table.getn( Rank ) , 1 do --1 , 3 ,1 do
			if BuffLV + 1 == Rank[i] then --buff號碼符合前三名
				if Count >= Score[i] then --如果玩家身上的氣息絲線>= 出價數量
					CancelBuff( OwnerID() , 507946 ) --刪除編號buff
					CancelBuff( OwnerID() ,  620636 ) --刪除報名buff
					AddBuff( OwnerID() , 620637 , Reg7- 1 , 10800 ) --給予有效時間3小時的兌換資格buff --3小時 --等級做為判別哪一套服裝0~8 遊戲中為1~9
					DelBodyItem( OwnerID() , 240502 , Score[i] ) --刪除氣息絲線
					return false
				else --氣息絲線不足
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_WEAVE_2011_16]" , C_SYSTEM ) --你身上的氣息絲線不足！
					ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_WEAVE_2011_16]" , C_SYSTEM ) --你身上的氣息絲線不足！
					return false
				end			
			end
		end
		CancelBuff( OwnerID() , 507946 ) --刪除編號buff
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --你並不符合可領取條件！
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --你並不符合可領取條件！
	else --無編號buff
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --你並不符合可領取條件！
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --你並不符合可領取條件！
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_giveitem10() --這次我想出示10個氣息絲線！

	CloseSpeak( OwnerID() )
	CallPlot( TargetID() , "Lua_ying_weave_giveitem" , OwnerID() , 10 ) --執行者為Target=NPC	
	local Key = ReadRoleValue( TargetID() , EM_RoleValue_PID )
--	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_DBID )
--	local Name = GetGUIDByDBID( Player )
--	DebugMsg( 0 , 0 , OwnerID().." Key2  = "..Key )
--	Say( OwnerID() , "Guid = "..Name )
	if Key == 1 then  -- NPC的PID為1，則表示NPC對話被鎖
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- 給玩家訊息，目標忙碌中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- 給玩家訊息，目標忙碌中
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_giveitem20() --這次我想出示20個氣息絲線！

	CloseSpeak( OwnerID() )
	CallPlot( TargetID() , "Lua_ying_weave_giveitem" , OwnerID() , 20 ) --執行者為Target=NPC	
	local Key = ReadRoleValue( TargetID() , EM_RoleValue_PID )
--	DebugMsg( 0 , 0 , OwnerID().." Key3  = "..Key )
	if Key == 1 then  -- NPC的PID為1，則表示NPC對話被鎖
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- 給玩家訊息，目標忙碌中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- 給玩家訊息，目標忙碌中
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_giveitem50() --這次我想出示10個氣息絲線！

	CloseSpeak( OwnerID() )
	CallPlot( TargetID() , "Lua_ying_weave_giveitem" , OwnerID() , 50 ) --執行者為Target=NPC	
	local Key = ReadRoleValue( TargetID() , EM_RoleValue_PID )
--	DebugMsg( 0 , 0 , OwnerID().." Key3  = "..Key )
	if Key == 1 then  -- NPC的PID為1，則表示NPC對話被鎖
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- 給玩家訊息，目標忙碌中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , C_SYSTEM ) -- 給玩家訊息，目標忙碌中
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_giveitem( Player , Value )  -- 在NPC身上執行

	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 ) -- 鎖住NPC對話
	DisableQuest( OwnerID() , true )

	local Rank = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) --號碼buff
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )
	local Count = CountBodyItem( Player , 240502 ) --判斷玩家身上氣息絲線的數量
	local Check = CheckBuff( Player , 507946 ) --檢查玩家身上是否有出示絲線buff
	local BuffLV = FN_CountBuffLevel( Player , 507946 ) --檢查出示BUFF的等級
	
	if Check == true then
		if BuffLV+1 == Rank or BuffLV+1 == Rank-1 or BuffLV+1 == Rank-2 then
			ScriptMessage( Player , Player , 1 , "[SC_WEAVE_2011_22]" , C_SYSTEM ) --你已在前三名中，不需再出示更多的氣息絲線！
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )	-- 解開NPC對話
			DisableQuest( OwnerID() , false )
			return false
		end
	end
	
	if Count >= Score + Value then --若玩家身上的氣息絲線 >= 目前第一名出價的值+10
		Rank = Rank + 1
		Score = Score + Value
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , Rank )
		CancelBuff( Player , 507946 ) --刪除出示氣息絲線BUFF
		AddBuff( Player , 507946 , Rank-1 , 600 )
		CallPlot( OwnerID() , "Lua_ying_weave_newgive" , Score ) --將新的出示數量值寫入NPC身上
	else --若玩家身上的氣息絲線 < 目前第一名出價的值+10
		ScriptMessage( Player , Player , 1 , "[SC_WEAVE_2011_16]" , C_SYSTEM ) --你身上的氣息絲線不足！
		ScriptMessage( Player , Player , 0 , "[SC_WEAVE_2011_16]" , C_SYSTEM ) --你身上的氣息絲線不足！
	end
	Sleep(10)
	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )  -- 解開NPC對話
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_newgive( Score ) --判斷對話視窗中的出示物品數量用 (將新的出示數量值寫入NPC身上)

	local No = {	[1] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) ,		-- 第一高的出示數量
			[2] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) ,	}	-- 第二高的出示數量
--	DebugMsg( 0 , 0 , "Score = "..Score ) 
--	DebugMsg( 0 , 0 , "No[1] = "..No[1] ) 
--	DebugMsg( 0 , 0 , "No[2] = "..No[2] ) 
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+4 , Score )	-- 將新競標的價格寫入Reg+4
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , No[1] )	-- 將原本是No.1的標價寫入Reg+5
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6 , No[2] )	-- 將原本是No.2的標價寫入Reg+6
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_game() --我想知道「經典回顧．服裝展」的活動內容

	SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_03]" ) --「經典回顧．服裝展」，顧名思義就是會在服裝展中，展示出以往那些具有特色又經典的服裝....
	AddSpeakOption ( OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_weave_119003talk", 0 ) --回到上一頁
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_story() --我想知道綵織節的由來

	SetSpeakDetail( OwnerID() , "[SC_COLORWEAVE_02]" ) --綵織的由來
	AddSpeakOption ( OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_weave_119003talk", 0 ) --回到上一頁
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_sign() --我要報名！

	local Sign = CheckBuff( OwnerID() , 620636 ) --已報名BUFF
	local NotS = CheckBuff( OwnerID() , 620638 ) --服裝展禁制
	local Over = CheckFlag( OwnerID() , 545450 ) --得標領取完成key

	if Over == true then --已得標領取完成
		SetSpeakDetail( OwnerID() , "[SC_DAN_112756_6]" ) --你今天已經完成此活動，請明天再繼續報名吧。
	elseif NotS == true then --服裝展禁制
		SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_04]" ) --XXX，你在取得兌換服裝資格後，沒有在3小時內找特瑞西進行兌換，所以目前無法再次報名參加。
	elseif Sign == true then --已報名
		SetSpeakDetail( OwnerID() , "[SC_WEAVE_2011_05]" ) --你已經報名過囉！整點的時候「經典回顧．服裝展」就會開始了，請記得多準備一些氣息絲線哦，祝你好運！
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WEAVE_2011_06]" , C_SYSTEM ) --你的報名已經申請完成！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WEAVE_2011_06]" , C_SYSTEM ) --你的報名已經申請完成！
		AddBuff( OwnerID() , 620636 , 0 , 2400 ) --給予報名BUFF
		CloseSpeak( OwnerID() )
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_119004talk() --NPC特瑞西 對話劇情

	local Change = CheckBuff( OwnerID() , 620637 ) --兌換服裝資格
	local Sign = CheckBuff( OwnerID() , 620636 ) --已報名BUFF

	LoadQuestOption( OwnerID() ) --讀取模版
	if Sign == true then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2013_CHANGE_01]" , "Lua_mika_weave_getitem" , 0 ) -- 我需要更多的[240502]
	end
	if Change == true then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2011_07]" , "Lua_ying_weave_change" , 0 ) --"我已擁有了兌換服裝資格，我想進行兌換！"選項
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_mika_weave_getitem()
	local Player = OwnerID()

	SetSpeakDetail( Player , "[SC_WEAVE_2013_CHANGE_02]" )   
	--  你正在煩惱看到心動的服裝卻沒有足夠的[240502]進行競標嗎？
	-- 如果你持有我需要的<CS>[201607]</CS>，我就以<CS>[201607]1個和你交換<CS>[240502]20個</CS>，意下如何？

	AddSpeakOption( OwnerID() , TargetID() , "[SC_WEAVE_2013_CHANGE_03]" , "Lua_mika_weave_getitem2" , 0 ) --成交！
end

function Lua_mika_weave_getitem2()  -- 2013 6.0.2 綵織節新增 兌換氣息絲線選項
	local Player = OwnerID()
	local stoneid = 201607  -- 融合核心
	local weaveid =  240502  -- 氣息絲線
	local itemcount = 20

	if CountBodyItem(Player, stoneid ) >= 1 then
		CloseSpeak(Player)
		DelBodyItem(Player, stoneid, 1) -- 刪除 融合核心 x1
		GiveBodyItem(Player, 240502, 20 )  -- 給予 氣息絲線 x 20
		DesignLog( Player , 119004 , " 201607 Change Item 240502 x20 " )
	else
		SetSpeakDetail( Player , "[SC_112503_NO] " )   --  你所持的物品數量不足喔！
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_change() --"我已擁有了兌換服裝資格，我想進行兌換！"

	CloseSpeak( OwnerID() )

	local Change = CheckBuff( OwnerID() , 620637 ) --兌換服裝資格
	local BuffLV = FN_CountBuffLevel( OwnerID() , 620637 ) --判斷玩家身上的兌換資格BUFF等級多少(等級為判斷第幾編號的套裝)
	local BuffNum = { 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 }
--	local Gift = { 240045 , 240046 , 240047 , 240048 , 240049 , 240050 , 240051 , 240052 , 240053 }   -- 6.0.2 以前禮盒
	local Gift = { 242697 , 242698 , 242699 , 242700 , 242701 , 242702 , 240047 , 240051 , 240053 }   -- 6.0.2 新增禮盒
--	DebugMsg( OwnerID() , 0 , "BuffLV = "..BuffLV )
	if Change == true then --身上有兌換資格
		for i = 1 , table.getn(BuffNum) , 1 do -- 1 , 9 , 1 do --BuffNum的1~9位置
			if BuffLV == BuffNum[i] then --若BUFF等級="0~8"
				GiveBodyItem( OwnerID() , Gift[i] , 1 ) --給予玩家Gift裡1~9相對位置禮盒
				SetFlag( OwnerID() ,  545450 , 1 ) --給予得標領取完成key
				CancelBuff( OwnerID() , 620637) --刪除兌換服裝資格
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_WEAVE_2011_21][$SETVAR1=".."["..Gift[i].."]".."]" , C_SYSTEM ) --你已成功領取了[$VAR1]禮盒！
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WEAVE_2011_21][$SETVAR1=".."["..Gift[i].."]".."]" , C_SYSTEM ) --你已成功領取了[$VAR1]禮盒！
				BeginPlot( OwnerID() , "Lua_ying_weave_cancelbuff" , 1 ) --若有兌換則刪除服裝禁制
			end
		end
	else
		ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --你並不符合可領取條件！
		ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --你並不符合可領取條件！
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_cancelbuff()
	
	CancelBuff( OwnerID() , 620638) --刪除服裝禁制
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_test_clean() --清除表演NPC

--	local Modelnpc = { 118970 , 118971 , 118987 , 118988 , 118989 , 118990 ,  118991 , 118992  , 118993 , 118994  , 118995 , 118996 , 118997 , 118998 , 118999 , 119000 , 119001 , 119002 }
	local Modelnpc = { 122452 , 122453 , 122454 , 122455 , 122456 , 122457 ,  122458 , 122459 ,  122460 , 122461 , 122462 , 122463  , 118989 , 118990 ,  118997 , 118998 ,  119001 , 119002 }   --6.0.2 更新

	for i = 1 , table.getn(Modelnpc) , 1 do
		Lua_Hao_NPCofAll_Clear( Modelnpc[i] , 300 )
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_weave_test_time( Time )	-- 調整目前時間　請使用 /gm ? pcall Lua_ying_weave_test_time 操作
-- 輸入值為 -2 時，查詢目前時間， -1 時，將前進時間歸零，輸入為 0000 至 2359 時，為改變設定時間。

	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() , 119003 , 200 , 0 ) --向周圍200碼搜尋NPC英格麗119003
	local Hour = GetSystime(1) --取得現在時間：時
	local Min = GetSystime(2) --取得現在時間：分
	local Weave_Hour = ReadRoleValue( NPC , EM_RoleValue_Register+2 )	-- 調整現在時
	local Weave_Min = ReadRoleValue( NPC , EM_RoleValue_Register+3 )	-- 調整現在分
	local Select_Hour , Select_Min

	if Time == -2 then							-- 查詢目前，前進了多少時間
		DebugMsg( OwnerID() , 0 , "Weave_Hour = "..Weave_Hour.." Weave_Min = "..Weave_Min )
	elseif Time == -1 then							-- 將前進的時間 小時與分 歸零
		WriteRoleValue( NPC , EM_RoleValue_Register+2 , 0 )
		WriteRoleValue( NPC , EM_RoleValue_Register+3 , 0 )
	elseif Time >= 0 and Time <= 2359 then					-- 調整目前時間　00:00 ~ 23:59
		Select_Hour = Math.floor( Time / 100 )				-- 取整除部分
		Select_Min = Time % 100					-- 取餘數部分
		if ( Select_Hour >= 0 and Select_Hour <= 23 ) and ( Select_Min >= 0 and Select_Min <= 59 ) then
			WriteRoleValue( NPC , EM_RoleValue_Register+2 , Select_Hour )
			WriteRoleValue( NPC , EM_RoleValue_Register+3 , Select_Min )
		else
			DebugMsg( OwnerID() , "Enter Error" )
		end
	else
		DebugMsg( OwnerID() , "Enter Error" )
	end
end