-- 702775 新版結婚系統_NPC傳送

---------- NPC傳送機制 ----------------------------------------- 

-- npc全域變數重置 (此段掛在npc套用初始劇情)  z2 婚禮申請員
function lua_mika_weddingtrans_NPC0()
	local NPC = OwnerID()  -- NPC
	-- SC_2012MARRY_TRANSNPC01 私人婚宴會場申請
	SetWorldVar( "SC_2012MARRY_TRANSNPC01" , 000000000) -- 設定世界變數 
	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- 讀取世界變數
--	Say(NPC, "Reset Room status = "..Room)

end

-- 測試指令- 寫入房間id
function lua_mika_weddingtrans_test01(SN)
	local Player = OwnerID()  -- 玩家
	WriteRoleValue(Player, EM_LuaValueFlag_UseItem43, SN )
	Say(Player, "SN = "..SN)

end

-- 測試指令 - 重置場地申請狀況 (玩家執行)
function lua_mika_weddingtrans_test02(number)
	local Player = OwnerID() 
	-- SC_2012MARRY_TRANSNPC01 私人婚宴會場申請
	SetWorldVar( "SC_2012MARRY_TRANSNPC01" , number ) -- 設定世界變數 
	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- 讀取世界變數
	Say(Player, "Reset Room status = "..Room)
end

-- 測試指令
function lua_mika_weddingtrans_test03()
	local Player = OwnerID()  -- 玩家
	local SN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
	Say(Player, "SN = "..SN)

end

function lua_mika_weddingtrans_test05()
	local box = OwnerID()


	while true do 
		local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- 讀取世界變數
		say(box, "Room ="..Room)
		sleep(100)
	end
end
-------------------------------------------------------
-- 會場傳送npc 初始對話
function lua_mika_weddingtrans_NPC1()
	local Player = OwnerID()  
	local PartyNum = GetPartyID(player , -1 )
	local Couple1 = GetPartyID( player , 1 )
	local Couple2 = GetPartyID( player , 2 )

	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- 讀取世界變數  - 私人婚禮會場申請
	local ChoosedSN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43)
	local count = 0
	local RoomList = {}
	RoomList[1] = math.floor(Room%1000000000/100000000) 	-- 取第1個房間  305  - 1
	RoomList[2] = math.floor(Room%100000000/10000000) 	-- 取第2個房間 306 - 1
	RoomList[3] = math.floor(Room%10000000/1000000) 	-- 取第3個房間 307 - 1
	RoomList[4] = math.floor(Room%1000000/100000) 		-- 取第4個房間 305 - 2 
	RoomList[5] = math.floor(Room%100000/10000)		-- 取第5個房間 306 - 2
	RoomList[6] = math.floor(Room%10000/1000)		-- 取第6個房間 307 - 2
	RoomList[7] = math.floor(Room%1000/100)			-- 取第7個房間 305 - 3
	RoomList[8] = math.floor(Room%100/10)			-- 取第8個房間 306 - 3 
	RoomList[9] = math.floor(Room%10/1)			-- 取第9個房間 307 - 3

	if CheckBuff(Player, 623790 ) == True then  -- 有私人會場租借buff
		SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC02]")   -- 再次進入會場？
		AddSpeakOption(Player,Player,"[SC_GETTITLE_1]","Lua_Mika_weddingtrans_room6("..ChoosedSN..")", 0)  -- 確定
	else
		if PartyNum ~= 2 then
			CloseSpeak(player)
			ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC21]" , 0 )	--畫面中間訊息  申請失敗，必須維持兩人小隊，才可辦理結婚申請
			ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC21]" , 0 )	--訊息欄
		else --   人數ok
			if Player == Couple1 then
				SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC06]")   -- 婚禮會場介紹
				AddSpeakOption( Player, Player, "[SC_2012MARRY_TRANSNPC15]" , "Lua_Mika_weddingtrans_room", 0 )  -- 私人婚禮會場申請
				AddSpeakOption( Player,  Player,"[SC_MARRY_36]" , "lua_mika_merryzonego" , 0 )  --前往一般婚禮會場
			else
				CloseSpeak(player)
				ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC22]" , 0 )	--畫面中間訊息  僅有隊長可辦理婚禮會場申請
				ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC22]" , 0 )
			end
		end
	end
end

function Lua_Mika_weddingtrans_room()
	local Player = OwnerID()  
	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- 讀取世界變數  - 私人婚禮會場申請
	local ChoosedSN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43)
	local count = 0
	local RoomList = {}
	RoomList[1] = math.floor(Room%1000000000/100000000) 	-- 取第1個房間  305  - 1
	RoomList[2] = math.floor(Room%100000000/10000000) 		-- 取第2個房間 306 - 1
	RoomList[3] = math.floor(Room%10000000/1000000) 		-- 取第3個房間 307 - 1
	RoomList[4] = math.floor(Room%1000000/100000) 		-- 取第4個房間 305 - 2 
	RoomList[5] = math.floor(Room%100000/10000)			-- 取第5個房間 306 - 2
	RoomList[6] = math.floor(Room%10000/1000)			-- 取第6個房間 307 - 2
	RoomList[7] = math.floor(Room%1000/100)			-- 取第7個房間 305 - 3
	RoomList[8] = math.floor(Room%100/10)				-- 取第8個房間 306 - 3 
	RoomList[9] = math.floor(Room%10/1)				-- 取第9個房間 307 - 3


		for i = 1 , #RoomList , 1 do
			if RoomList[i] == 0 then
				count = count + 1
			end
			if i == #RoomList then
				if count > 0 then
					SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC13]")   -- 請選擇..
				else
					SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC10]")   -- 目前沒有可使用的會場
				end
			end
		end

		local string = { 
				"[SC_2012MARRY_TRANSNPC03]" ,
				"[SC_2012MARRY_TRANSNPC04]" ,
				"[SC_2012MARRY_TRANSNPC05]" 
									}  -- 各場地類型名稱

		for Style=1,3,1 do  -- 樣式1~ 3 
			for Position=1,3,1 do   -- 房間1~3
				local SN=(Style-1)*3+Position; -- 序號1~9
				if RoomList[SN]==0 then -- 空的房間才列出選項
					AddSpeakOption(Player,Player,string[Style].."("..Position..")","Lua_Mika_weddingtrans_room1("..SN..")", 0)  -- 會場的選項
				end
			end
		end

end

-- 檢查選擇房間有沒有人已選了
function Lua_Mika_weddingtrans_gocheck(SN)  -- SN
	local Player = OwnerID()
	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- 讀取世界變數
	local number = {
			100000000, 10000000, 1000000, 
			100000, 10000, 1000, 
			100, 10 , 1
			 }

	local RoomList = {}
	RoomList[1] = math.floor(Room%1000000000/100000000) 	-- 取第1個房間  305  - 1
	RoomList[2] = math.floor(Room%100000000/10000000) 		-- 取第2個房間 306 - 1
	RoomList[3] = math.floor(Room%10000000/1000000) 		-- 取第3個房間 307 - 1
	RoomList[4] = math.floor(Room%1000000/100000) 		-- 取第4個房間 305 - 2 
	RoomList[5] = math.floor(Room%100000/10000)			-- 取第5個房間 306 - 2
	RoomList[6] = math.floor(Room%10000/1000)			-- 取第6個房間 307 - 2
	RoomList[7] = math.floor(Room%1000/100)			-- 取第7個房間 305 - 3
	RoomList[8] = math.floor(Room%100/10)				-- 取第8個房間 306 - 3 
	RoomList[9] = math.floor(Room%10/1)				-- 取第9個房間 307 - 3

	if Roomlist[SN] == 0 then -- ok
		return true 
	else
		return false
	end

end

-- 跳出房間介紹
function Lua_Mika_weddingtrans_room1(roomid)
	local player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID ) -- NPC ID
	local NPCID = { 115002 ,111274 }  -- 1 同性不可結婚  2. 同性可結婚

	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- 讀取世界變數
	local number = {
			100000000, 10000000, 1000000, 
			100000, 10000, 1000, 
			100, 10 , 1
			 }
	-- 後台版本	
	local coin1 = GetDBKeyValue("WeddingRoomCost_01")	--  會場1 價格
	local coin2 = GetDBKeyValue("WeddingRoomCost_02")	--  會場2 價格
	local coin3 = GetDBKeyValue("WeddingRoomCost_03")	--  會場3 價格
	local type1 = GetDBKeyValue("WeddingRoomCoin_01")               --  會場1 消費金額類型
	local type2 = GetDBKeyValue("WeddingRoomCoin_02")               --  會場1 消費金額類型
	local type3 = GetDBKeyValue("WeddingRoomCoin_03")    	--  會場3 消費金額類型
	-- 測試版本
--	local coin1 = 10
--	local coin2 = 20
--	local coin3 = 30

--	Say(NPC, "orgid = "..NPCOrgID )

	if Lua_Mika_weddingtrans_gocheck(roomid) == true then  -- 選擇的房間是空的
		if roomid <= 3 then  -- 會場1 
			SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC07][$SETVAR1=".."["..type1.."]".."][$SETVAR2="..coin1.."]")
		elseif roomid >= 4 and  roomid <= 6 then  -- 會場2
			SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC08][$SETVAR1=".."["..type2.."]".."][$SETVAR2="..coin2.."]")
		elseif roomid >= 7 and  roomid <= 9 then  -- 會場3
			SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC09][$SETVAR1=".."["..type3.."]".."][$SETVAR2="..coin3.."]")
		end

		if NPCOrgID == NPCID[1] then
		--	say(NPC, "NPC1")
			AddSpeakOption( Player, NPC, "[SC_0908SEANSON_65]" , "Lua_Mika_weddingtrans_room2_1("..roomid..")", 0 )  -- 確定  -- 婚禮場地申請  (同性不可結婚)
		elseif NPCOrgID == NPCID[2] then
		--	say(NPC, "NPC2")
			AddSpeakOption( Player, NPC, "[SC_0908SEANSON_65]" , "Lua_Mika_weddingtrans_room2_2("..roomid..")", 0 )  -- 確定  -- 婚禮場地申請  (同性可結婚)
		end
	else
		CloseSpeak(Player)
		ScriptMessage( Player , Player , 0, "[SC_2012MARRY_TRANSNPC17]", 0 );  --申請失敗，您選擇的會場目前已被租借中
	end
end

-- 婚禮場地申請  (同性不可結婚)
function Lua_Mika_weddingtrans_room2_1(roomid)
	local player = OwnerID()

	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- 讀取世界變數
	local number = {
			100000000, 10000000, 1000000, 
			100000, 10000, 1000, 
			100, 10 , 1
			 }
	-- 後台版本	
	local coin1 = GetDBKeyValue("WeddingRoomCost_01")	--  會場1 價格
	local coin2 = GetDBKeyValue("WeddingRoomCost_02")	--  會場2 價格
	local coin3 = GetDBKeyValue("WeddingRoomCost_03")	--  會場3 價格
	local type1 = GetDBKeyValue("WeddingRoomCoin_01")               --  會場1 消費金額類型
	local type2 = GetDBKeyValue("WeddingRoomCoin_02")               --  會場1 消費金額類型
	local type3 = GetDBKeyValue("WeddingRoomCoin_03")    	--  會場3 消費金額類型

	local itemid = 203038
	local coinlist = {coin1, coin1, coin1, coin2, coin2, coin2, coin3, coin3, coin3 }
	local typelist = {type1, type1, type1, type2, type2, type2, type3, type3, type3 }
	local mycoin = CountBodyItem(Player, itemid )  -- 必爾汀代幣持有量
-- 	

	CloseSpeak(player)
	if Marry_Apply_Check_1(player) == true then  -- 通過結婚會場申請資格檢查 (同性不可結婚)
		local Couple1 = GetPartyID( player , 1 )
		local Couple2 = GetPartyID( player , 2 )

		if Lua_Mika_weddingtrans_gocheck(roomid) == true then  -- 選擇的房間是空的	
		--	say(Couple1, "coin type ="..typelist[roomid] )
			if typelist[roomid] ~= 203038 then -- 不是必爾汀代幣
				if (AddMoneyEx_Account( Couple1 , EM_ActionType_PlotGive , -(coinlist[roomid]) , true ) == true ) and ( AddMoneyEx_Account( Couple2 , EM_ActionType_PlotGive , -(coinlist[roomid]) , true ) == true ) then 
				--	Say(Couple1, "Roomid = "..roomid)
					Room = Room + number[roomid]
					SetWorldVar( "SC_2012MARRY_TRANSNPC01" , Room) -- 設定世界變數 
				--	Say(Couple2, "Room status = "..room)

					WriteRoleValue(Couple1, EM_LuaValueFlag_UseItem43, roomid)  -- 寫入房間id
					WriteRoleValue(Couple2, EM_LuaValueFlag_UseItem43, roomid)  -- 寫入房間id
				--	DelBodyItem(Couple1, itemid, coinlist[roomid])
				--	DelBodyItem(Couple2, itemid, coinlist[roomid])
					DesignLog( Couple1, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
					DesignLog( Couple2, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
					local SD1 = ReadRoleValue(Couple1, EM_LuaValueFlag_UseItem43)
					local SD2 = ReadRoleValue(Couple2, EM_LuaValueFlag_UseItem43)
				--	say(Couple1, "SD ="..SD1..", SD2 ="..SD2 )
					Callplot(Couple1, "Lua_Mika_weddingtrans_room5", roomid)
					Callplot(Couple2, "Lua_Mika_weddingtrans_room5", roomid)
				else
					ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC19]", 0 );   -- 申請失敗，雙方或其中之一持有的晶鑽數量不足
					ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC19]", 0 );
					ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC19]", 0 );	
					ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC19]", 0 );	
				end
			else --  必爾汀代幣
				if Marry_Money_Check(Couple1, roomid ) == true and Marry_Money_Check(Couple2, roomid ) == true then	
				--	Say(Couple1, "Roomid = "..roomid)
					Room = Room + number[roomid]
					SetWorldVar( "SC_2012MARRY_TRANSNPC01" , Room) -- 設定世界變數 
				--	Say(Couple2, "Room status = "..room)

					WriteRoleValue(Couple1, EM_LuaValueFlag_UseItem43, roomid)  -- 寫入房間id
					WriteRoleValue(Couple2, EM_LuaValueFlag_UseItem43, roomid)  -- 寫入房間id
					DelBodyItem(Couple1, itemid, coinlist[roomid])
					DelBodyItem(Couple2, itemid, coinlist[roomid])
					DesignLog( Couple1, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
					DesignLog( Couple2, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
					local SD1 = ReadRoleValue(Couple1, EM_LuaValueFlag_UseItem43)
					local SD2 = ReadRoleValue(Couple2, EM_LuaValueFlag_UseItem43)
				--	say(Couple1, "SD ="..SD1..", SD2 ="..SD2 )
					Callplot(Couple1, "Lua_Mika_weddingtrans_room5", roomid)
					Callplot(Couple2, "Lua_Mika_weddingtrans_room5", roomid)
				else
					ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC16]", 0 );   -- 申請失敗，雙方或其中之一持有的[203038]數量不足
					ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC16]", 0 );
					ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC16]", 0 );	
					ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC16]", 0 );	
				end
			end
		else
			ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC17]", 0 );   --申請失敗，您選擇的會場目前已被租借中
			ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC17]", 0 );   
			ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC17]", 0 );
			ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC17]", 0 );
		end

	end
end

-- 婚禮場地申請  (同性可結婚)
function Lua_Mika_weddingtrans_room2_2(roomid)
	local player = OwnerID()

	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- 讀取世界變數
	local number = {
			100000000, 10000000, 1000000, 
			100000, 10000, 1000, 
			100, 10 , 1
			 }
	-- 後台版本	
	local coin1 = GetDBKeyValue("WeddingRoomCost_01")	--  會場1 價格
	local coin2 = GetDBKeyValue("WeddingRoomCost_02")	--  會場2 價格
	local coin3 = GetDBKeyValue("WeddingRoomCost_03")	--  會場3 價格
	local type1 = GetDBKeyValue("WeddingRoomCoin_01")               --  會場1 消費金額類型
	local type2 = GetDBKeyValue("WeddingRoomCoin_02")               --  會場1 消費金額類型
	local type3 = GetDBKeyValue("WeddingRoomCoin_03")    	--  會場3 消費金額類型

	local itemid = 203038
	local coinlist = {coin1, coin1, coin1, coin2, coin2, coin2, coin3, coin3, coin3 }
	local typelist = {type1, type1, type1, type2, type2, type2, type3, type3, type3 }
	local mycoin = CountBodyItem(Player, itemid )  -- 必爾汀代幣持有量
-- 	

	CloseSpeak(player)
	if Marry_Apply_Check_2(player) == true then  -- 通過結婚會場申請資格檢查 (同性可結婚)

		local Couple1 = GetPartyID( player , 1 )
		local Couple2 = GetPartyID( player , 2 )
		if CheckFlag(Couple1, 541320) == false or CheckFlag(Couple2, 541320) == false then  --  其中有一方未辦理婚禮申請
			ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC20]", 0 );   -- 申請失敗，雙方或其中之一持有的晶鑽數量不足
			ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC20]", 0 );
			ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC20]", 0 );	
			ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC20]", 0 );	
		else
			if Lua_Mika_weddingtrans_gocheck(roomid) == true then  -- 選擇的房間是空的	
			--	say(Couple1, "coin type ="..typelist[roomid] )
				if typelist[roomid] ~= 203038 then -- 不是必爾汀代幣
					if (AddMoneyEx_Account( Couple1 , EM_ActionType_PlotGive , -(coinlist[roomid]) , true ) == true ) and ( AddMoneyEx_Account( Couple2 , EM_ActionType_PlotGive , -(coinlist[roomid]) , true ) == true ) then 
					--	Say(Couple1, "Roomid = "..roomid)
						Room = Room + number[roomid]
						SetWorldVar( "SC_2012MARRY_TRANSNPC01" , Room) -- 設定世界變數 
					--	Say(Couple2, "Room status = "..room)

						WriteRoleValue(Couple1, EM_LuaValueFlag_UseItem43, roomid)  -- 寫入房間id
						WriteRoleValue(Couple2, EM_LuaValueFlag_UseItem43, roomid)  -- 寫入房間id
						DesignLog( Couple1, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
						DesignLog( Couple2, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
					--	DelBodyItem(Couple1, itemid, coinlist[roomid])
					--	DelBodyItem(Couple2, itemid, coinlist[roomid])
						local SD1 = ReadRoleValue(Couple1, EM_LuaValueFlag_UseItem43)
						local SD2 = ReadRoleValue(Couple2, EM_LuaValueFlag_UseItem43)
					--	say(Couple1, "SD ="..SD1..", SD2 ="..SD2 )
						Callplot(Couple1, "Lua_Mika_weddingtrans_room5", roomid)
						Callplot(Couple2, "Lua_Mika_weddingtrans_room5", roomid)
					else
						ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC19]", 0 );   -- 申請失敗，雙方或其中之一持有的晶鑽數量不足
						ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC19]", 0 );
						ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC19]", 0 );	
						ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC19]", 0 );	
					end
				else --  必爾汀代幣
					if Marry_Money_Check(Couple1, roomid ) == true and Marry_Money_Check(Couple2, roomid ) == true then	
					--	Say(Couple1, "Roomid = "..roomid)
						Room = Room + number[roomid]
						SetWorldVar( "SC_2012MARRY_TRANSNPC01" , Room) -- 設定世界變數 
					--	Say(Couple2, "Room status = "..room)
						WriteRoleValue(Couple1, EM_LuaValueFlag_UseItem43, roomid)  -- 寫入房間id
						WriteRoleValue(Couple2, EM_LuaValueFlag_UseItem43, roomid)  -- 寫入房間id
						DelBodyItem(Couple1, itemid, coinlist[roomid])
						DelBodyItem(Couple2, itemid, coinlist[roomid])
						DesignLog( Couple1, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
						DesignLog( Couple2, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
						local SD1 = ReadRoleValue(Couple1, EM_LuaValueFlag_UseItem43)
						local SD2 = ReadRoleValue(Couple2, EM_LuaValueFlag_UseItem43)
					--	say(Couple1, "SD ="..SD1..", SD2 ="..SD2 )
						Callplot(Couple1, "Lua_Mika_weddingtrans_room5", roomid)
						Callplot(Couple2, "Lua_Mika_weddingtrans_room5", roomid)
					else
						ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC16]", 0 );   -- 申請失敗，雙方或其中之一持有的[203038]數量不足
						ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC16]", 0 );
						ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC16]", 0 );	
						ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC16]", 0 );	
					end
				end
			else
				ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC17]", 0 );   --申請失敗，您選擇的會場目前已被租借中
				ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC17]", 0 );   
				ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC17]", 0 );
				ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC17]", 0 );
			end
		end
	end
end


-- 傳入會場
function Lua_Mika_weddingtrans_room5(roomid)
	local Player = OwnerID()
	local EnterKey =  545671-- keyitem 傳入區域時給予
	local fulltime = 3600 -- 正確時間  
	local fulltime = 600 -- 暫定時間  

	local pos = {
		[1] =  { 305 ,  -3578, 226, 3371, 256 }, 
		[2] =  { 306 ,  -3578, 226, 3371, 256 }, 
		[3] =  { 307 ,  -3578, 226, 3371, 256 }, 
		[4] =  { 305 ,  -3554, 225, -498, 262 }, 
		[5] =  { 306 ,  -3554, 225, -498, 262 }, 
		[6] =  { 307 ,  -3554, 225, -498, 262 }, 
		[7] =  { 305 ,  -3563, 340, -4176, 96 }, 
		[8] =  { 306 ,  -3563, 340, -4176, 96 }, 
		[9] =  { 307 ,  -3563, 340, -4176, 96 }
		}

	CloseSpeak(player)
	Setflag(Player, EnterKey, 0 ) --清除隱藏物件範圍觸發劇情Key
	if CheckBuff(Player, 623790) == false then
		AddBuff(Player, 623790, 0, fulltime )  -- 給予2小時 私人婚禮會場租借憑證 BUFF  用來判斷會場邀請函NPC
	end
--	say(Player, "pos1 ="..pos[roomid][1]..", pos2 ="..pos[roomid][2]..", pos3 ="..pos[roomid][3]..", pos4 ="..pos[roomid][4]..", pos5 ="..pos[roomid][5]  )
	ChangeZone( Player , pos[roomid][1] , 0, pos[roomid][2] , pos[roomid][3], pos[roomid][4], pos[roomid][5] ) 
end

-- 再次進入會場

function Lua_Mika_weddingtrans_room6(roomid)
	local Player = OwnerID()
	local EnterKey =  545671-- keyitem 傳入區域時給予
	local pos = {
		[1] =  { 305 ,  -3578, 226, 3371, 256 }, 
		[2] =  { 306 ,  -3578, 226, 3371, 256 }, 
		[3] =  { 307 ,  -3578, 226, 3371, 256 }, 
		[4] =  { 305 ,  -3554, 225, -498, 262 }, 
		[5] =  { 306 ,  -3554, 225, -498, 262 }, 
		[6] =  { 307 ,  -3554, 225, -498, 262 }, 
		[7] =  { 305 ,  -3563, 340, -4176, 96 }, 
		[8] =  { 306 ,  -3563, 340, -4176, 96 }, 
		[9] =  { 307 ,  -3563, 340, -4176, 96 }
		}

	CloseSpeak(Player)
	if CheckBuff(Player, 623790) == false then  -- 如果沒有buff
		ScriptMessage( Player , Player , 2, "[SC_2012MARRY_TRANSNPC18]", 0 );   --[623790]效果已到期
		ScriptMessage( Player , Player , 0, "[SC_2012MARRY_TRANSNPC18]", 0 );   
	else
		Setflag(Player, EnterKey, 0 ) --清除隱藏物件範圍觸發劇情Key
	--	say(Player, "pos1 ="..pos[roomid][1]..", pos2 ="..pos[roomid][2]..", pos3 ="..pos[roomid][3]..", pos4 ="..pos[roomid][4]..", pos5 ="..pos[roomid][5]  )
		ChangeZone( Player , pos[roomid][1] , 0, pos[roomid][2] , pos[roomid][3], pos[roomid][4], pos[roomid][5] ) 
	end
end