function Lua_Hao_Doraemon()	-- 快速換裝

	local Player = OwnerID()

	if CheckBuff( Player , 501570 ) == true then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )	--視窗已經打開了
		return 0
	end
	AddBuff( Player , 501570 , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , "[AC_ITEMTYPENAME_1]" )
	DialogSelectStr( Player , "Accept" )
	DialogSelectStr( Player , "Cancel" )

	local Time = 0
	local DialogStatus
	local inputstring = ""

	local List = { }
		List[0] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_0]"		-- 0	頭部
		List[1] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_4]"		-- 1	手套
		List[2] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_5]"		-- 2	鞋子
		List[3] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_1]"		-- 3	上身
		List[4] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_3]"		-- 4	下身
		List[5] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_6]"		-- 5	披風
		List[6] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_2]"		-- 6	腰帶
		List[7] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_7]"		-- 7	肩甲
		List[8] = "[SC_USING]".."[AC_ITEMTYPENAME_1_4_2]"		-- 8	項鍊
		List[9] = "[SC_USING]".."[SYS_EQWEARPOS_09]"			-- 9	彈藥
		List[10] = "[SC_USING]".."[AC_ITEMTYPENAME_0_5]"		-- 10	遠程武器
		List[11] = "[SC_USING]".."[AC_ITEMTYPENAME_1_4_1]".."1"		-- 11	戒指 1
		List[12] = "[SC_USING]".."[AC_ITEMTYPENAME_1_4_1]".."2"		-- 12	戒指 2
		List[13] = "[SC_USING]".."[AC_ITEMTYPENAME_1_4]".."1"		-- 13	耳環 1
		List[14] = "[SC_USING]".."[AC_ITEMTYPENAME_1_4]".."2"		-- 14	耳環 2
		List[15] = "[SC_USING]".."[SYS_EQWEARPOS_15]"			-- 15	主手
		List[16] = "[SC_USING]".."[AC_ITEMTYPENAME_1_5]"		-- 16	副手
		List[17] = "[SC_USING]".."Nothing"				-- 17	無
		List[18] = "[SC_USING]".."[AC_ITEMTYPENAME_1_6]".."1"		-- 18	法寶 1
		List[19] = "[SC_USING]".."[AC_ITEMTYPENAME_1_6]".."2"		-- 19	法寶 2
		List[20] = "[SC_USING]".."[AC_ITEMTYPENAME_1_6]".."3"		-- 20	法寶 3
		List[21] = "[SC_USING]".."[AC_ITEMTYPENAME_1_7]"		-- 21	裝飾品
		List[22] = "22 = Fast Copy"					-- 複製模式

	local Armor , Options = { } , { }

	for k = 0 , table.getn( List ) , 1 do
		-- 2012.07.22 新增，複製模式
		if k < 22 then
		--
			Armor[k] = GetItemInfo( Player , EM_ItemPacketType_EQ , k , EM_ItemValueType_OrgObjID )
		end
	end

	for i = 0 , table.getn( List ) , 1 do
	--	ScriptMessage ( Player , Player , ０ , List[i].." = "..i , 0 ) 
		if Armor[i] == 0 then
			Armor[i] = "Not equipped"
		end
		Options[i] = string.format("%02d", i )
		-- 2012.07.22 新增，複製模式
		if i == 22 then
			Tell( Player , Player , List[i] )
		else
		--
			if Armor[i] ~= "Not equipped" then
				Tell( Player , Player , Options[i].." = "..List[i].."".." : ".."["..Armor[i].."]".."("..Armor[i].. ")" )
			end
		end
	--	Tell( Player , Player , List[i].." = "..i )
	end
	-- 當玩家使用第一套裝備，使用頁面為 0 ~ 21 備用頁面為 100 ~ 121
	if ( DialogSendOpen(Player ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end
	-- 2012.07.22 新增，複製模式，由 0 ~ 21，變更為 0 ~ 22
	Tell( Player , Player , "Enter Number".." : 0 ~ 22 " )
	--
	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "Idle for more than 60 sec , window will close automatically." , 0 ) -- 閒置超過60秒,自動關閉視窗。
			break
		end
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
--		Say( Player , "DialogStatus = "..DialogStatus )
--		Tell( Player , Player , "Number".." : 0 ~ 21 " )
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 初始化、中斷
			inputstring = DialogGetInputResult( Player )
		--	Say( Player , "inputstring = "..tonumber(inputstring) )
			if DialogStatus == 0 then  -- 有填入字串
				if Type(inputstring) ~= "string" or inputstring == ""  then
					Tell( Player , Player , "Nullity String Code .")
					break
				else
				--	Tell( Player , Player , "inputstring".." = "..inputstring )
					CancelBuff( Player, 501570 )
					DialogClose( Player )
					-- 2012.07.22 新增，複製模式，追加 22
					if inputstring == "22" then
					--	return Lua_Hao_Doraemon_02( 0 , inputstring )
						return Lua_Hao_Doraemon_02( 0 )
					else
						return Lua_Hao_Doraemon_01( 0 , inputstring )
					end
				end
			else
				break
			end
		elseif DialogStatus == -1 then
			break
		end
	end
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end

function Lua_Hao_Doraemon_01( X , Part , Menu )

	local Player = OwnerID()

	if CheckBuff( Player , 501570) == true then 
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local Time = 0 
	local DialogStatus
	local inputstring = ""
	local outputstring = ""
	local LimitLv , Tier	-- 2012.12.06 該裝備的等級、階層
	
	if Menu == nil then
		Menu = { }
	end

	local ItemValue = {}
 		ItemValue[1] = EM_ItemValueType_OrgObjID	-- 物品ID
 		ItemValue[2] = EM_ItemValueType_Inherent1 	-- 屬性1
 		ItemValue[3] = EM_ItemValueType_Inherent2 	-- 屬性2
 		ItemValue[4] = EM_ItemValueType_Inherent3 	-- 屬性3
 		ItemValue[5] = EM_ItemValueType_Inherent4 	-- 屬性4
 		ItemValue[6] = EM_ItemValueType_Inherent5 	-- 屬性5
 		ItemValue[7] = EM_ItemValueType_Inherent6 	-- 屬性6
 		ItemValue[8] = EM_ItemValueType_Rune1 	-- 符文1
 		ItemValue[9] = EM_ItemValueType_Rune2 	-- 符文2
 		ItemValue[10] = EM_ItemValueType_Rune3 	-- 符文3
 		ItemValue[11] = EM_ItemValueType_Rune4 	-- 符文4
 		ItemValue[12] = EM_ItemValueType_Level 	-- 精鍊等級
 		ItemValue[13] = EM_ItemValueType_Durable 	-- 當前耐久度
 		ItemValue[14] = EM_ItemValueType_MaxDurable	-- 最大耐久度
 		ItemValue[15] = EM_ItemValueType_PowerQuality	--  階層
 		
	AddBuff(Player , 501570,0,-1)
	if X == 0 then	-- 物品ID 0
		DialogCreate( Player , EM_LuaDialogType_Input , "Enter Item ID" )
	elseif X > 0 and X < 7  then	-- 附加屬性 0 ~ 6
		if X == 1 then
			Tell( Player , Player , "[SYS_WEAREQTYPE_7]".." : 510000 ~ 519999 " )
		end
		DialogCreate( Player , EM_LuaDialogType_Input , "[SYS_WEAREQTYPE_7]".." "..X )
	elseif X > 6 and X < 11 then	-- 符文 7 ~ 10
		if X == 7 then
			Tell( Player , Player , "[ITEM_RUNE]".." : 520000 ~ 529999 " )
		end
		DialogCreate( Player , EM_LuaDialogType_Input , "[ITEM_RUNE]".." "..X-6 )
	elseif X == 11 then		-- 精鍊等級 11
		DialogCreate( Player , EM_LuaDialogType_Input , "Power Level" )
		Tell( Player , Player , "Power Level".." : 1 ~ 20 " )
	elseif X == 12 then		-- 耐久度 12
		DialogCreate( Player , EM_LuaDialogType_Input , "[SYS_WEAREQTYPE_1]" )
		Tell( Player , Player , "[SYS_WEAREQTYPE_1]".." : 1 ~ 200 " )
	elseif X == 13 then		-- 最大耐久度 13
		DialogCreate( Player , EM_LuaDialogType_Input , "Max".."[SYS_WEAREQTYPE_1]" )
		Tell( Player , Player , "Max".."[SYS_WEAREQTYPE_1]".." : 1 ~ 200 " )
	elseif X == 14 then		-- 2012.12.06 階層
		LimitLv = GameObjInfo_Int( Menu[1] , "LimitLv" )	-- 該裝備的等級
		Tier = math.ceil( LimitLv / 20 )			-- 該裝備的當前階層
		DialogCreate( Player , EM_LuaDialogType_Input , "Tier" )
		Tell( Player , Player , "Tier".." : "..Tier.." ~ 20 " )
	end

	DialogSelectStr( Player , "Accept" )
	DialogSelectStr( Player , "Cancel" )

	if ( DialogSendOpen(Player ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "Idle for more than 60 sec, window will close automatically." , 0 ) -- 閒置超過60秒,自動關閉視窗。
			break
		end

		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目

		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 初始化、中斷
			inputstring = DialogGetInputResult( Player )
			outputstring = "["..inputstring.."]"
			if DialogStatus == 0 then  -- 有填入字串
				if Type(inputstring) ~= "string" or inputstring == "" then
					Tell( Player , Player , "Nullity String Code." )
					break
				else
					if X >= 0 and X <= 10 then
						ScriptMessage( Player , Player , 0 , outputstring , 0 ) -- 閒置超過60秒,自動關閉視窗。
					--	Tell( Player , TargetID() , inputstring.." = "..outputstring )
					end
					X = X + 1
					Menu[X] = inputstring
				--	DebugMsg( Player , 0 , "X = "..X )
				--	DebugMsg( Player , 0 , "X = "..X.." Menu = "..Menu[X] )
					if X < 15 then
						CancelBuff( Player, 501570 )
						DialogClose( Player )
					--	if X == 2 then
						if X >= 2 and X <= 7  then	-- 附加屬性 2 ~ 7
							if tonumber(Menu[X]) == 0 then
								for i = X , 7 , 1 do
									Menu[i] = 0
								--	DebugMsg( Player , 0 , "Menu = "..Menu[i+1] )
								end
								X = 7
							end
					--	elseif X == 8 then
						elseif X >= 8 and X <= 11 then	-- 符文 8 ~ 11
							if tonumber(Menu[X]) == 0 then
								for i = X , 11 , 1 do
									Menu[i] = 0
								--	DebugMsg( Player , 0 , "Menu = "..Menu[X+i] )
								end
								X = 11
							end
						end
						return Lua_Hao_Doraemon_01( X , Part , Menu )
					elseif X == 15 then
						for i = 1 , #Menu , 1 do
							if i == 13 or i == 14 then	-- 耐久度、最大耐久度
								Menu[i] = Menu[i]*100
							elseif i == 15 then	-- 2012.12.06 階層
								Menu[i] = tonumber(Menu[i])
							--	DebugMsg( Player , 0 , "Tier = "..Menu[i] )
								if Menu[i] >= 20 then
									Menu[i] = 20
								elseif Menu[i] <= Tier then
									Menu[i] = Tier
								end
								Menu[i] = Menu[i] - Tier + 10
							end
							SetItemInfo( Player , EM_ItemPacketType_EQ , Part , ItemValue[i] , Menu[i] )
						--	DebugMsg( Player , 0 , "ItemValue = "..ItemValue[i].." Menu = "..Menu )
						end
					else
						break
					end
				end
			elseif DialogStatus == 1 then
				break
			end
		elseif DialogStatus == -1 then
			break
		end
	end
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end

function Lua_Hao_Doraemon_02( X , Menu )

	local Owner = OwnerID()
	if CheckBuff( Owner , 501570 ) == true then 
		ScriptMessage( Owner , Owner , 0 , "[SC_WINDOW_OPENED]", 0 ) --視窗已經打開了
		return 0
	end

	local Time = 0 
	local Key , DialogStatus
	local inputstring = ""
	local outputstring = ""
	if Menu == nil then
		Menu = {}
	end

	local List = { }
		List[0] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_0]"		-- 0	頭部
		List[1] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_4]"		-- 1	手套
		List[2] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_5]"		-- 2	鞋子
		List[3] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_1]"		-- 3	上身
		List[4] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_3]"		-- 4	下身
		List[5] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_6]"		-- 5	披風
		List[6] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_2]"		-- 6	腰帶
		List[7] = "[SC_USING]".."[AC_ITEMTYPENAME_1_0_7]"		-- 7	肩甲
		List[8] = "[SC_USING]".."[AC_ITEMTYPENAME_1_4_2]"		-- 8	項鍊
		List[9] = "[SC_USING]".."[SYS_EQWEARPOS_09]"			-- 9	彈藥
		List[10] = "[SC_USING]".."[AC_ITEMTYPENAME_0_5]"		-- 10	遠程武器
		List[11] = "[SC_USING]".."[AC_ITEMTYPENAME_1_4_1]".."1"		-- 11	戒指 1
		List[12] = "[SC_USING]".."[AC_ITEMTYPENAME_1_4_1]".."2"		-- 12	戒指 2
		List[13] = "[SC_USING]".."[AC_ITEMTYPENAME_1_4]".."1"		-- 13	耳環 1
		List[14] = "[SC_USING]".."[AC_ITEMTYPENAME_1_4]".."2"		-- 14	耳環 2
		List[15] = "[SC_USING]".."[SYS_EQWEARPOS_15]"			-- 15	主手
		List[16] = "[SC_USING]".."[AC_ITEMTYPENAME_1_5]"		-- 16	副手
		List[17] = "[SC_USING]".."Nothing"				-- 17	無
		List[18] = "[SC_USING]".."[AC_ITEMTYPENAME_1_6]".."1"		-- 18	法寶 1
		List[19] = "[SC_USING]".."[AC_ITEMTYPENAME_1_6]".."2"		-- 19	法寶 2
		List[20] = "[SC_USING]".."[AC_ITEMTYPENAME_1_6]".."3"		-- 20	法寶 3
		List[21] = "[SC_USING]".."[AC_ITEMTYPENAME_1_7]"		-- 21	裝飾品
 
	local Armor , Options = {} , {}

	for k = 0 , table.getn( List ) , 1 do
		Armor[k] = GetItemInfo( Owner , EM_ItemPacketType_EQ , k , EM_ItemValueType_OrgObjID )
	end

	for i = 0 , table.getn( List ) , 1 do
		if Armor[i] == 0 then
			Armor[i] = "Not equipped"
		end
		Options[i] = string.format("%02d", i )
		if Armor[i] ~= "Not equipped" then
			Tell( Owner , Owner , Options[i].." = "..List[i].."".." : ".."["..Armor[i].."]".."("..Armor[i].. ")" )
		end
	end

	AddBuff( Owner , 501570 , 0 , -1 )

	if X == 0 then
		DialogCreate( Owner , EM_LuaDialogType_Input , "[AC_ITEMTYPENAME_1]" )
		Tell( Owner , Owner , "Select what you want to Ctrl+C : 00 ~ 21" )
	elseif X == 1 then
		DialogCreate( Owner , EM_LuaDialogType_Input , "[AC_ITEMTYPENAME_1]" )
		Tell( Owner , Owner , "Select what you want to Ctrl+V : 00 ~ 21" )
	elseif X == 2 then
		DialogCreate( Owner , EM_LuaDialogType_Input , "Enter Item ID" )
	end
	
	DialogSelectStr( Owner , "Accept" )
	DialogSelectStr( Owner , "Cancel" )

	if ( DialogSendOpen( Owner ) == false ) then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Owner , Owner , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 600 then  -- 60秒無動作，關閉對話視窗
			ScriptMessage( Owner , Owner , 0 , "Idle for more than 60 sec, window will close automatically." , 0 ) -- 閒置超過60秒,自動關閉視窗。
			break
		end
		DialogStatus = DialogGetResult( Owner )  --檢查使用者選取的項目
	--	DebugMsg( Owner , 0 , "Time = "..Time.."Dialog = "..DialogStatus )
		inputstring = DialogGetInputResult( Owner )
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 初始化、中斷、取消
			if DialogStatus == 0 then  -- 有填入字串
				if Type(inputstring) ~= "string" or inputstring == "" then
					Tell( Owner , Owner , "Nullity String Code .")
					break
				else
					DebugMsg( Owner , 0 , "Input = "..inputstring )
					outputstring = "["..inputstring.."]"
					ScriptMessage( Owner , Owner , 0 , outputstring , 0 )	-- 顯示輸入號碼
					CancelBuff( Owner , 501570 )
					DialogClose( Owner )
					X = X + 1
					Menu[X] = inputstring
					if X < 3 then	-- 1 = 想要複製的部位、2 = 想要複製到哪個部位、3 = 物品ID
						return Lua_Hao_Doraemon_02( X , Menu )
					else
						return Lua_Hao_Doraemon_02_1( Owner , Menu )
					end
				end
			elseif DialogStatus == 1 then
				break
			end
		elseif DialogStatus == -1 then
			break
		end
	end
	CancelBuff( Owner , 501570 )
	DialogClose( Owner )	
end

function Lua_Hao_Doraemon_02_1( Owner , Menu )

	local Armor = {}
	local ItemValue = {}
		ItemValue[1] = EM_ItemValueType_OrgObjID	-- 物品ID
		ItemValue[2] = EM_ItemValueType_Inherent1 	-- 屬性1
		ItemValue[3] = EM_ItemValueType_Inherent2 	-- 屬性2
		ItemValue[4] = EM_ItemValueType_Inherent3 	-- 屬性3
		ItemValue[5] = EM_ItemValueType_Inherent4 	-- 屬性4
		ItemValue[6] = EM_ItemValueType_Inherent5 	-- 屬性5
		ItemValue[7] = EM_ItemValueType_Inherent6 	-- 屬性6
		ItemValue[8] = EM_ItemValueType_Rune1 	-- 符文1
		ItemValue[9] = EM_ItemValueType_Rune2 	-- 符文2
		ItemValue[10] = EM_ItemValueType_Rune3 	-- 符文3
		ItemValue[11] = EM_ItemValueType_Rune4 	-- 符文4
		ItemValue[12] = EM_ItemValueType_Level 	-- 精鍊等級
		ItemValue[13] = EM_ItemValueType_Durable 	-- 當前耐久度
		ItemValue[14] = EM_ItemValueType_MaxDurable 	-- 最大耐久度
 		ItemValue[15] = EM_ItemValueType_PowerQuality	--  階層		

	-- Menu[1] = 想要複製的部位、Menu[2] = 想要複製到哪個部位、Menu[3] = 物品ID
	for i = 1 , #ItemValue , 1 do
		Armor[i] = GetItemInfo( Owner , EM_ItemPacketType_EQ , Menu[1] , ItemValue[i] )
	end

	for i = 1 , #ItemValue , 1 do
		if i == 1 then
			SetItemInfo( Owner , EM_ItemPacketType_EQ , Menu[2] , ItemValue[i] , Menu[3] )
		else
			SetItemInfo( Owner , EM_ItemPacketType_EQ , Menu[2] , ItemValue[i] , Armor[i] )
		end
	end
end

function Lua_Hao_Test_Running_Msg()	-- 測試跑馬燈

	Lua_Hao_Test_Running_Msg_01( 0 )
end

function Lua_Hao_Test_Running_Msg_01( X , People , Type , String )
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	
	local Time = 0 
	local Key , DialogStatus
	local inputstring = ""
	local outputstring = ""
	if Type == nil then
		Type = { }
	end
	
	AddBuff(OwnerID() , 501570,0,-1);
	if X == 0 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice Mode" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , " 0 = Owner , 1 = Zone , 2 = Server " , 0 )
	elseif X == 1 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice Type" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , " 0 = Red , 1 = Blue , 2 = Green , 3 = Gray" , 0 )
		--	0 (GM廣播專用)、1 (技術廣播專用)、2 (商城、轉蛋專用)、3 (PE、節慶等其它類專用)
	elseif X == 2 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Enter String" )
	end
	DialogSelectStr( OwnerID() , "Accept" )
	DialogSelectStr( OwnerID() , "Cancel" )

	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 300 then  -- 30秒無動作，關閉對話視窗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- 閒置超過30秒,自動關閉視窗。
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			break
		end

		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目

		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 初始化、中斷

			inputstring = DialogGetInputResult( OwnerID() )
			outputstring = "["..inputstring.."]"

			if DialogStatus == 0 then  -- 有填入字串
				X = X + 1
			--	Say( OwnerID() , "X ="..X )
				if X == 1 then
					People = inputstring
				--	Say( OwnerID() , "People ="..People )
				elseif X == 2 then
					Type = inputstring
				--	Say( OwnerID() , "Type ="..Type )
				elseif X == 3 then
					String = inputstring
				--	Say( OwnerID() , "String ="..String )
				end

				if X < 3 then
					if People == nil then
						People = 0
					end
					if Type == nil then
						Type = 0
					end
					if String == nil then
						String = 0
					end
					CancelBuff( OwnerID(), 501570 );--
					DialogClose( OwnerID() )
					return Lua_Hao_Test_Running_Msg_01( X , People , Type , String )
				elseif X == 3 then
				--	if ( string.find( String ,"SC" ) == nil then
					RunningMsgEx( OwnerID() , People , Type , "["..String.."]" )
					RunningMsgEx( OwnerID() , People , Type , String )
				end
			--	end
			elseif DialogStatus == 1 then
				CancelBuff( OwnerID() , 501570 )
				DialogClose( OwnerID() )
			--	DebugMsg( OwnerID() , 0 , "1" )
				break			
			end
		--	DebugMsg( OwnerID() , 0 , "4" )
			Key = 1
		elseif DialogStatus==-1 then
		--	CancelBuff( OwnerID(), 501570 );--
		--	DialogClose( OwnerID() )
		--	DebugMsg( OwnerID() , 0 , "2" )
			Key = 1
		end
		if Key == 1 then
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
		--	DebugMsg( OwnerID() , 0 , "3" )
			break
		end
	end
end


function Lua_Hao_Test_Running_Msg_03()

	RunningMsgEx( OwnerID() , 2 , 0 , "IamRed" )  
	RunningMsgEx( OwnerID() , 2 , 1 , "IamBlue" )  
	RunningMsgEx( OwnerID() , 2 , 2 , "IamGreen" )  
	RunningMsgEx( OwnerID() , 2 , 3 , "IamGray" )  
end

function Lua_Hao_Check_Magic_Flag( MagicID )	-- 查詢基本法術的法術群組分類( MagicGroupSet )

	local Type = GameObjInfo_Int( MagicID ,"MagicGroupSet" )	-- 抓取這個欄位
	local Square = { }						-- 次方

	for i = 0 , 21 , 1 do
		if checkbit( Type , i ) == true then
			Square[i] = 1
			DebugMsg( 0 , 0 , "2^"..""..i.."".." = "..Square[i] )
		--	Say( OwnerID() , "2^"..""..i.."".." = "..Square[i] )
		else
			Square[i] = 0
		end
	end

	return Square

end

function Lua_Hao_Check_Magic_Flag_00( )

	local Count = BuffCount( OwnerID() )

	Say( OwnerID() , "Count = "..Count )

	for i = 0 , Count , 1 do
	--	DebugMsg( 0 , 0 , "Count = "..Count )
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
	--	DebugMsg( 0 , 0 , "BuffID = "..BuffID )
		local Square = Lua_Hao_Check_Magic_Flag( BuffID )	-- 回傳 Square
		if BuffID ~= 0 and Square[10] ~= 1 then
			Say( OwnerID() , "BuffID = "..BuffID )
		elseif Square[10] == 1 then
			Say( OwnerID() , "BuffID = "..BuffID.." 2^10 = 1" )
		end
	end
end

function Lua_Hao_Test_Bag_Drive_Thru() -- 測試轉蛋

	Lua_Hao_Test_Bag_Drive_Thru_01( 0 )
end

function Lua_Hao_Test_Bag_Drive_Thru_01( X , ItemID , Count ) -- 得來速轉蛋
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end

	local Time = 0 
	local Key , DialogStatus , SrvScript , CheckUseScript , UseType , Pcall_1 , Pcall_2
	local inputstring = ""
	local outputstring = ""

	AddBuff(OwnerID() , 501570,0,-1);
	if X == 0 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice ItemID" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter PackageID" , 0 )
	elseif X == 1 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice Count" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter the amount" , 0 )
	end
	DialogSelectStr( OwnerID() , "Accept" )
	DialogSelectStr( OwnerID() , "Cancel" )

	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 300 then  -- 30秒無動作，關閉對話視窗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- 閒置超過30秒,自動關閉視窗。
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end

		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目

		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 初始化、中斷
			inputstring = DialogGetInputResult( OwnerID() )
			outputstring = "["..inputstring.."]"
			if DialogStatus == 0 then  -- 有填入字串
				if Type(inputstring) ~= "string" or inputstring == "" then
					Tell( OwnerID() , OwnerID() , "Nullity String Code." )
					Key = 1
				else
					-- Tell( OwnerID() , TargetID() , inputstring.." = "..outputstring )
					X = X + 1
					if X == 1 then
						ItemID = tonumber(inputstring)
						UseType = GameObjInfo_Int( ItemID , "UseType" ) -- 抓使用效果類型
						CheckUseScript = GameObjInfo_Str( ItemID ,"CheckUseScript" ) -- 抓使用檢查LUA
						SrvScript = GameObjInfo_Str( ItemID ,"SrvScript" ) -- 抓使用效果Script
					--	if SrvScript ~= "LuaI_"..ItemID then
						if Type(SrvScript) ~= "string" then
							CancelBuff( OwnerID(), 501570 );--
							DialogClose( OwnerID() )
							DebugMsg( OwnerID() , 0 , "Error Type" )
							return false
						end
					--	if CheckUseScript == "" or CheckUseScript == "LuaI_"..ItemID.."box" and UseType == 2 then
						if UseType == 2 then						
							if ( ItemID >= 200000 and ItemID <= 209999 ) or ( ItemID >= 240001 and ItemID <= 249999 ) then
					 			ScriptMessage( OwnerID() , OwnerID() , 0 , outputstring , 0 ) -- 顯示物品名稱
							else
					 			ScriptMessage( OwnerID() , OwnerID() , 0 , "Error number" , 0 ) -- 輸入錯誤
					 			CancelBuff( OwnerID(), 501570 );--
					 			DialogClose( OwnerID() )
					 			return false
					 		end
						else
					 		ScriptMessage( OwnerID() , OwnerID() , 0 , "Error number" , 0 ) -- 輸入錯誤
					 		CancelBuff( OwnerID(), 501570 );--
					 		DialogClose( OwnerID() )
							return false
						end
					elseif X == 2 then
						Count = tonumber(inputstring)
						if ( Count <= 0 or Count >= 1000 ) then
					 		ScriptMessage( OwnerID() , OwnerID() , 0 , "Error number" , 0 ) -- 輸入錯誤
					 		CancelBuff( OwnerID(), 501570 );--
					 		DialogClose( OwnerID() )
							return false
						end
					 	ScriptMessage( OwnerID() , OwnerID() , 0 , Count , 0 ) -- 顯示物品名稱
					--	Tell( OwnerID() , OwnerID() ,  "Count = "..Count )
					end

					if X < 2 then
						CancelBuff( OwnerID(), 501570 );--
						DialogClose( OwnerID() )
						return Lua_Hao_Test_Bag_Drive_Thru_01(  X , ItemID , Count )
					elseif X == 2 then
						SrvScript = GameObjInfo_Str( ItemID ,"SrvScript" ) -- 抓物品的字串
						Pcall_1 = String.gsub( SrvScript , "%(.*%)", "")	-- %(　%) 代表() , . 代表任意字串 , .* 代表可以匹配0個以上的字串
						Pcall_2 = String.gsub(string.gsub( SrvScript , ".*%(.", ""),".%)","")
						for i = 1 , Count , 1 do
							if SrvScript ~= "LuaI_"..ItemID then
								CallPlot( OwnerID() , Pcall_1 , Pcall_2 )
							else
								BeginPlot( OwnerID() , SrvScript , 0 )
							end
							sleep(10)
						end
					else
						Key = 1
					end
				end
			elseif DialogStatus == 1 then
				Key = 1
			end
		elseif DialogStatus==-1 then
			Key = 1
		end
		if Key == 1 then
			CancelBuff( OwnerID(), 501570 )
			DialogClose( OwnerID() )
			break
		end
	end
end
function Lua_Hao_Test_Drive_Thru()

	local SrvScript = GameObjInfo_Str( 204554 ,"SrvScript" ) -- 抓使用效果Script
	local A , B , C

	A = string.gsub( SrvScript , "%(.*%)", "")	-- %(　%) 代表() , . 代表任意字串 , .* 代表可以匹配0個以上的字串
	B = string.gsub( SrvScript , ".*%(.", "")
	C = string.gsub( B ,".%)","" )
	
	DebugMsg( OwnerID() , 0 ,  "A = "..A )
	DebugMsg( OwnerID() , 0 , "B = "..B )
	DebugMsg( OwnerID() , 0 , "C = "..C )
end
----------------------------------------------------------------------------------
function Lua_Hao_Check_Zone()	-- 不依賴 ObjID 自行讀取 ZoneID
	local ZoneID = GetIniValueSetting ( "ZoneID" )

	DeBugMSG( 0  , 0 , "ZoneID = "..ZoneID )
end
----------------------------------------------------------------------------------
function Lua_Hao_Return_Buff_Lv( ObjID , MagicID )	-- 查詢『遊戲中』法術等級，回傳-1時，代表沒有此Buff，回傳0時，代表資料庫中的 0

	local BuffLv				-- 技能等級
	local Count = BuffCount( ObjID )	-- 查詢身上的技能
	local Key = 0

	for i = 0 , Count , 1 do
		local BuffID = BuffInfo( ObjID , i , EM_BuffInfoType_BuffID )
		if BuffID == MagicID then
			BuffLv = BuffInfo( ObjID , i , EM_BuffInfoType_Power )
		--	DebugMsg( 0 , 0 , "BuffLv  = "..BuffLv )
			return BuffLv
		end
	end

	if Key == 0 then
		return -1
	end
end

function Lua_Hao_Check_Bank_Item_Data( ItemID , Stack )

	local Item = { }
	local Count = 0

	for i = -1 , 200 , 1 do
		Item[i] = GetItemInfo( OwnerID() , EM_ItemPacketType_Bank , i , EM_ItemValueType_OrgObjID )
		Count = Count + 1 
		Say( OwnerID() , "ItemID = "..Item[i].." Count = "..Count  )
		sleep(1)
	end
end

function Lua_Hao_Check_Item_Stack( ObjID , ItemID , GiveCount )	-- 查詢銀行與物品的堆疊量

	local Maximum = GameObjInfo_Int( ItemID ,"BodyMaxCount" )	-- 抓取這個欄位
	local Count = CountItem( ObjID , ItemID )
	local Room = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	DebugMsg( ObjID , Room , "Maximum = "..Maximum.." Stack = "..Count )	-- 資料庫設定上限量、庫存數量
--	Say( OwnerID() , "Maximum = "..Maximum )
--	Say( OwnerID() , "Stack = "..Count )
	return Lua_Hao_Check_Item_Stack_Count( Maximum , Count , GiveCount , ItemID , ObjID )	-- 拾取上限、銀行與背包的總量、給的數量、物品ID
end

function Lua_Hao_Check_Item_Stack_Count( Maximum , Count , GiveCount , ItemID , ObjID )

	local Room = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local Operator = Maximum - Count	-- 資料庫設定上限量、庫存數量
	local Answer = Operator - GiveCount	-- 可拾取量、取得數量

	if Answer >= 0 then
		DebugMsg( ObjID , Room , "Ok ,".." You can get "..GiveCount.." ".."["..ItemID.."]" )
	--	Say( OwnerID() , "ok".." You can only get "..Operator.." but the item obtained = "..GiveCount )
		return GiveCount
	else
		if Operator >= 0 then
			DebugMsg( ObjID , Room , "Oh ,".." You can only get "..Operator.." ".."["..ItemID.."]" )
		else
			DebugMsg( ObjID , Room , "Error ,".." Over count "..Operator )
		end
	--	Say( OwnerID() , "error".." Operator = "..Operator.." GiveCount  = "..GiveCount )
		return Operator
	end
end

function Lua_Hao_Get_Memory()	-- 取得記憶體

	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Memory = GetMemory()
	local Kb = Memory / 1024
	local Mb = Kb / 1024

--	DeBugMSG( OwnerID() , Room , "Memory = "..GetMemory().." Bytes".." = "..Kb.." Kb".." = "..Mb.." Mb" )
	DeBugMSG( OwnerID() , Room , "Memory = "..Mb.." Mb" )
end

function Lua_Hao_Get_Distance( Target )

	local Owner = OwnerID();
	local Target = Target or TargetID();
	local Distance = GetDistance( Owner, Target );
	DebugMsg( Owner, 0, "Distance = "..Distance );
	return Distance;
end

function Lua_Hao_Get_Ruby(Num)	-- 取得紅鑽

	local Player = OwnerID()
	AddRoleValue( Player ,EM_RoleValue_BonusMoney , Num )
end

function Hao_500675_Disappear_BuffList()	-- 回傳潛行結果結束時，身上持有的所有BuffID

	local Player = OwnerID()
	local Zone = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	
	if Zone == 402 or Zone >= 900 then
		local CountBuff = BuffCount( Player )
		local List = "Own Buffs : "

		for Pos = 0 , CountBuff-1 , 1 do
			local BodyBuff = BuffInfo( Player , Pos , EM_BuffInfoType_BuffID )	-- 讀取該Buff的ID
			if Pos ~= CountBuff-1 then
				List = List..BodyBuff.." , "
			else
				List = List..BodyBuff
			end
		end
		DesignLog( Player , 500675 , List )
	end
end