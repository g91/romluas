----------------- box -----------------
-- pid  - 房間編號
-- r+1 - 計時器時間
-- r+2 - 房間重新計時開關
	
---------------- 玩家 ----------------
-- EM_LuaValueFlag_UseItem43   -- 所在房間id

-- 各會場邀請函領取NPC ------------------------------------

function Lua_Mika_weddingCard_set()  --商店設定 掛在任務Npc物件產生劇情
	local NPC = OwnerID()
	SetMinimapIcon( NPC, EM_MapIconType_Shop )
	SetShop( NPC , 600431 , "Test_Shop_Close" )  -- 婚禮商店
end

function Lua_Mika_weddingCard_NPC0()
	local Player = OwnerID()
	local NPC = TargetID()
	local box = LuaFunc_SearchNPCbyOrgID( NPC , 121515, 200 , 0)       -- box 
	local limit =1501  -- 限制剩餘時間 25分鐘以上才可再購買 入場券是20分鐘 
--	local limit =300  -- 測試用時間
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- 目前剩餘時間

--	say(NPC, "timer ="..timer )
	SetSpeakDetail(Player, "[SC_2012MARRY_SHOPSNPC04]")   --需要購買婚禮邀請函或是會場餐點擺設嗎？

	AddSpeakOption( Player, Player, "[SC_2012MARRY_SHOPSNPC05]" , "Marry_Shop", 0 )  -- 購買餐點擺設
	if CheckBuff(Player, 623790 ) == true then  -- 新人雙方才可購買邀請函
		if timer >= limit then
			AddSpeakOption( Player, Player, "[SC_2012MARRY_SHOPSNPC06]" , "Lua_Mika_weddingCard_NPC1", 0 )  -- 購買婚禮邀請函
		end
	end
end

function Lua_Mika_weddingCard_NPC1()
	local Player = OwnerID()
	local Count = {1, 5, 10 }

	SetSpeakDetail(Player, "[SC_2012MARRY_SHOPSNPC01]")   --一生只有一次的結婚典禮，親朋好友的祝福是不可或缺的，需要購買婚禮邀請函發送給好友嗎？
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[1].."]","Lua_Mika_weddingCard_NPC2("..Count[1]..")", 0)  -- 我要購買邀請函[$VAR1]張
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[2].."]","Lua_Mika_weddingCard_NPC2("..Count[2]..")", 0)  
	AddSpeakOption(Player,Player,"[SC_2012MARRY_SHOPSNPC02][$SETVAR1="..Count[3].."]","Lua_Mika_weddingCard_NPC2("..Count[3]..")", 0)  

end

function Lua_Mika_weddingCard_NPC2(count)
	local Player = OwnerID()
	local NPC = TargetID()
	local box = LuaFunc_SearchNPCbyOrgID( NPC , 121515, 200 , 0)       -- box 
	local limit =1501  -- 限制剩餘時間 25分鐘以上才可再購買 入場券是20分鐘 
--	local limit =300  -- 測試用時間
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- 目前剩餘時間

	local money = 5000
	local pay = count*money

	if timer >= limit then
		SetSpeakDetail(Player, "[SC_2012MARRY_SHOPSNPC03][$SETVAR1="..count.."][$SETVAR2="..pay.."]")   --你選擇購買邀請函[$VAR1]張，總共是[$VAR2]元，確定要購買嗎？
		AddSpeakOption( Player, Player, "[SC_GETTITLE_1]" , "Lua_Mika_weddingCard_NPC3("..pay..")", 0 )  -- 確定
	else
		CloseSpeak(Player)
		ScriptMessage( player, player, 1, "[SC_2012MARRY_SHOPSNPC07]" , 0 )	-- 婚禮會場結束開放時間將近，無法再邀請朋友入場。
		ScriptMessage( player, player, 0, "[SC_2012MARRY_SHOPSNPC07]" , 0 )	
	end

end

function Lua_Mika_weddingCard_NPC3(pay)
	local Player = OwnerID()
	local NPC = TargetID()
	local box = LuaFunc_SearchNPCbyOrgID( NPC , 121515, 200 , 0)       -- box 
	local limit =1501  -- 限制剩餘時間 25分鐘以上才可再購買 入場券是20分鐘 
--	local limit =300  -- 測試用時間
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- 目前剩餘時間

	local itemlist = { 
			241977, 241978 , 241979 ,
 			241980, 241981 , 241982 ,
 			241983, 241984 , 241985 
			}  -- 傳送石的id
	local money = 5000
	local count = pay/money  -- 個數
	local SN = ReadRoleValue(NPC, EM_RoleValue_PID )   --- 1 ~ 9 	say(box, "pid = "..pid )
	local itemid = itemlist[SN]
	local NeedSpace = count  -- 需要背包空間數
	local NeedSpaceStatus  = Check_Bag_Space( Player , NeedSpace  )   -- 檢查格數是否夠 true = 夠 , false = 不夠
 
	CloseSpeak(Player)
	if timer >= limit then 
		if NeedSpaceStatus == true then  -- 背包空間數量夠
			if ReadRoleValue( Player , EM_RoleValue_Money ) < pay then  -- 持有金額不足
				ScriptMessage( player, player, 1, "[SC_BUY_MONEY]" , 0 )	-- 你沒有足夠的金錢！
				ScriptMessage( player, player, 0, "[SC_BUY_MONEY]" , 0 )
			else
			--	Say(Player, "itemid ="..itemid.." , count = "..count.. ", pay = "..pay )
				AddRoleValue( Player , EM_RoleValue_Money , -(pay) ) 
				for i = 1 , count do -- 按照個數跑次數
					GiveBodyItem(Player, itemid, 1 )
				end
			end
		end
	else
		ScriptMessage( player, player, 1, "[SC_2012MARRY_SHOPSNPC07]" , 0 )	-- 婚禮會場結束開放時間將近，無法再邀請朋友入場。
		ScriptMessage( player, player, 0, "[SC_2012MARRY_SHOPSNPC07]" , 0 )	
	end

end

-------------------------------------------------------------

-- 各會場中入口的隱藏物件劇情 , objedit 套用劇情
function Lua_Mika_weddingtrans_box0()
	local box = OwnerID()
	local flagid_1 = { 781213, 781216, 781219, 781214, 781217, 781220, 781215, 781218, 781221 }  -- 桌上甜點
	local flagid_2 = { 781226, 781229, 781232, 781227, 781230, 781233, 781228, 781231, 781234 }  -- 餐點桌
	local flagid_3 = { 781235, 781238, 781241, 781236, 781239, 781242, 781237, 781240, 781243 }  -- 樂團

	local SN = ReadRoleValue(box, EM_RoleValue_PID )   --- 1 ~ 9 	say(box, "pid = "..pid )

	local npcid = { 121476, 121477, 121478 }  -- 物件清單
		-- 121476 桌上點心
		-- 121477 餐點桌
		-- 121478 樂團

	WriteRoleValue(box, EM_RoleValue_Register+2, 0 )  -- 計時開關預設為0
	local Switch = ReadRoleValue(box, EM_RoleValue_Register+2 )
--	say(box, "switch = "..Switch )
--	say(box, "SN ="..SN..", flagid_1 = "..flagid_1[SN]..", flagid_2 = "..flagid_2[SN].." , flagid_3 = "..flagid_3[SN] )

	if WeddingObjlist == nil then
		WeddingObjlist = {}  -- 建立空的擺放物件清單
	end

	if WeddingObjlist[SN] == nil then
		WeddingObjlist[SN] = {}  -- 建立Table
	end

	-- 這是對應氣球和捧花用的
	if WeddingObjlist2 == nil then
		WeddingObjlist2 = {}  -- 建立空的擺放物件清單
	end

	if WeddingObjlist2[SN] == nil then
		WeddingObjlist2[SN] = {}  -- 建立Table
	end

	--- flag 1 桌上點心
	local count1 = GetMoveflagCount(flagid_1[SN])  -- 對應編號棋子的數量
--	say(box, "flag count = "..count1 )

	local putnpc1 = {}
	for i= 2 , count1+1 do
		putnpc1[i] = CreateObjByFlag( npcid[1] , flagid_1[SN] , i  , 1 )
		SetModeEx( putnpc1[i]   , EM_SetModeType_ShowRoleHead, True )--頭像框
		SetModeEx( putnpc1[i]   , EM_SetModeType_Mark, True )--標記
		SetModeEx( putnpc1[i]   , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( putnpc1[i]   , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( putnpc1[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( putnpc1[i]   , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( putnpc1[i]   , EM_SetModeType_Move, false )--移動
		SetModeEx( putnpc1[i]   , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( putnpc1[i]   , EM_SetModeType_HideName, false )--名稱
		SetModeEx( putnpc1[i]   , EM_SetModeType_Gravity, false )--重力
		AddToPartition( putnpc1[i], 0 )
	--	say(putnpc1[i],"putnpc 1 = "..i)
	end

	--- flag 2 餐點桌
	local count2 = GetMoveflagCount(flagid_2[SN])  -- 對應編號棋子的數量
--	say(box, "flag count = "..count2 )

	local putnpc2 = {}
	for i= 0 , count2-1 do
		putnpc2[i] = CreateObjByFlag( npcid[2] , flagid_2[SN] , i  , 1 )
		SetModeEx( putnpc2[i]   , EM_SetModeType_ShowRoleHead, True )--頭像框
		SetModeEx( putnpc2[i]   , EM_SetModeType_Mark, True )--標記
		SetModeEx( putnpc2[i]   , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( putnpc2[i]   , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( putnpc2[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( putnpc2[i]   , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( putnpc2[i]   , EM_SetModeType_Move, false )--移動
		SetModeEx( putnpc2[i]   , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( putnpc2[i]   , EM_SetModeType_HideName, false )--名稱
		SetModeEx( putnpc2[i]   , EM_SetModeType_Gravity, false )--重力
		AddToPartition( putnpc2[i], 0 )
	--	say(putnpc2[i],"putnpc 2 = "..i)
	end

	--- flag 3 精靈樂團
	local putnpc3 = CreateObjByFlag( npcid[3] , flagid_3[SN] , 0  , 1 )
	SetModeEx( putnpc3   , EM_SetModeType_ShowRoleHead, True )--頭像框
	SetModeEx( putnpc3   , EM_SetModeType_Mark, True )--標記
	SetModeEx( putnpc3   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( putnpc3   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( putnpc3   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( putnpc3   , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( putnpc3   , EM_SetModeType_Move, false )--移動
	SetModeEx( putnpc3   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( putnpc3   , EM_SetModeType_HideName, false )--名稱
	SetModeEx( putnpc3   , EM_SetModeType_Gravity, false )--重力
	AddToPartition( putnpc3, 0 )

--	say(box, "Create point ok" )
	SetPlot( box , "range","Lua_Mika_weddingtrans_box2" , 50 )  --box 範圍劇情

end

function Lua_Mika_weddingtrans_box2()    --box 範圍劇情
	local Player = OwnerID()
	local box = TargetID()
	local Switch = ReadRoleValue(box, EM_RoleValue_Register+2 )
	local fulltime = 3600   -- 初始計時器時間   正確時間3600
--	local fulltime = 600   -- 初始計時器時間 測試時間版 600
	local EnterKey =  545671-- keyitem 傳入區域時給予
	local roomid = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43  )  -- 房間ID
	local timer =ReadRoleValue(box, EM_RoleValue_Register+1 ) --讀取記錄在box的殘餘時間

--	say(box, "switch = "..Switch )
	if Checkflag(Player, EnterKey) == false then  -- 沒有傳入區域的key (防止重複觸發劇情)
		Setflag(Player, 545671, 1 )  -- 給予進入區域的key  
		AddBuff(Player, 623833, 0, -1 )  -- 給與離線後上線劇情BUFF   -- Lua_Mika_weddingtrans_buffevt2
		AddBuff(Player, 624426, 0, -1 )  -- 幸福氣氛  6.0.1 新增BUFF  用於限制PK和傳送術

		if Switch > 0 then -- 已有第一個人開啟timer
		--	say(Player, "timer 1 = "..timer ) 
	
			if CheckBuff(Player, 623790) == true then  -- 給新人buff
				CancelBuff(Player, 623790  )
				AddBuff(Player, 623790, 0, timer )  -- 給 私人婚禮會場租借憑證 BUFF  用來判斷會場邀請函NPC
			else  -- 不是新人其中之一
				AddBuff(Player, 623791, 0, timer )  -- 給予剩餘時間 私人婚禮會場租借憑證 BUFF
			end

		else  -- 未開啟
			if CheckBuff(Player, 623790) == True then  -- 有新人buff
				WriteRoleValue(box, EM_RoleValue_Register+2, 1 )  -- 計時器開 , 設為1
				CancelBuff(Player, 623790  )
				AddBuff(Player, 623790, 0, fulltime )  -- 給 私人婚禮會場租借憑證 BUFF  用來判斷會場邀請函NPC
			--	say(box, "Switch = "..Switch..", Roomid = "..roomid ) 

				WriteRoleValue(box, EM_RoleValue_Register+1, fulltime ) 
				local timer =ReadRoleValue(box, EM_RoleValue_Register+1 ) --讀取記錄在box的殘餘時間
			--	say(Player, "timer 2 = "..timer ) 

				Callplot(box, "Lua_Mika_weddingtrans_box3", roomid )  -- 讓此box開始倒數計時
			end
		end
	end
end

-- box 計時開始
function Lua_Mika_weddingtrans_box3(roomid)
	local box = OwnerID()
	local npcid = 121476 -- 擺放參考點物件id
	local number = {
			100000000, 10000000, 1000000, 
			100000, 10000, 1000, 
			100, 10 , 1
			 }

--	say(box, "count down start." )

	while true do 
		AddRoleValue(box, EM_RoleValue_Register+1, -1 ) 
		local timer =ReadRoleValue(box, EM_RoleValue_Register+1 )  -- 目前剩餘時間
	--	say(box, "timer ="..timer )

		if timer == 0 then  -- 當會場時間到 (將有擺放的物件外觀都改回參考物件  /  將世界變數歸零 )
	--		say(box, "timer up" )
		
			Lua_Mika_wedding_itemtest1(roomid)  -- 重置該區所有玩家擺設物件

			-- 將此box的計時器開關重置
			WriteRoleValue(box, EM_RoleValue_Register+2, 0 )  -- 計時開關預設為0
			local Switch = ReadRoleValue(box, EM_RoleValue_Register+2 )
		--	say(box, "switch = "..Switch )

			-- 將此房間的世界變數歸零 ( 重新開放房間 )	 
		--	Say(box, "Roomid = "..roomid )
			local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- 讀取世界變數
			Room = Room - number[roomid]
			SetWorldVar( "SC_2012MARRY_TRANSNPC01" , Room) -- 設定世界變數 
		--	Say(box, "new Room status = "..Room)

			break
		end

		sleep(10)  -- 每1秒跑ㄧ次
	end
end	

-- buff 事件 1 -  buff時間到  (  1.刪除房間序號 2.  如果在那些區域就傳出 )
function Lua_Mika_weddingtrans_buffevt1()
	local Player = OwnerID()
	local zonelist = { 305, 306, 307 }

	ScriptMessage( player, player, 1, "[SC_2012MARRY_TRANSNPC18]" , 0 )	-- [623790]效果已到期
	ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC18]" , 0 )

	
	SetFlag( Player , 541320 , 0 ) --  將持有的房間id歸零
	Setflag( Player, 545671, 0 )  -- 刪除進入會場KEY   -- 2013.08.13 修改
	WriteRoleValue(Player, EM_LuaValueFlag_UseItem43, 0 )
	local SN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
--	say(Player, "SN ="..SN )

	-- 如果角色在婚禮區域就傳出
	local myzone = ReadRoleValue(Player, EM_RoleValue_ZoneID ) 
--	say(Player, "My zone ="..myzone )
	if myzone == zonelist[1] or myzone == zonelist[2] or myzone == zonelist[3] then  
		ChangeZone( Player , 2 , 0, 4678 , 110, -2220, 0 )   -- 傳回中央廣場入口
	end

end

-- buff 事件2 - 玩家上線後觸發 ( 傳到中央廣場 )
function Lua_Mika_weddingtrans_buffevt2()
	local Player = OwnerID()
	local zonelist = { 305, 306, 307 }

	if CheckBuff(Player, 623790) == false then
		SetFlag( Player , 541320 , 0 )
		Setflag( Player, 545671, 0 )  -- 刪除進入會場KEY   -- 2013.08.13 修改
		WriteRoleValue(Player, EM_LuaValueFlag_UseItem43, 0 )
		local SN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
	--	say(Player, "SN ="..SN )
		ScriptMessage( player, player, 1, "[SC_2012MARRY_TRANSNPC18]" , 0 )	-- [623790]效果已到期
		ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC18]" , 0 )

	end

	-- 如果角色在婚禮區域就傳出
	local myzone = ReadRoleValue(Player, EM_RoleValue_ZoneID ) 
--	say(Player, "My zone ="..myzone )
	if myzone == zonelist[1] or myzone == zonelist[2] or myzone == zonelist[3] then  
		ChangeZone( Player , 2 , 0, 4678 , 110, -2220, 0 )   -- 傳回中央廣場入口
	end

end


-- 重置該roomid的所有物件
function Lua_Mika_wedding_itemtest1(Roomid)

	if WeddingObjlist ~= nil then
	--	say(Player, "obj reset 1_1 ")
		if WeddingObjlist[Roomid] ~= nil then
		--	say(Player, "obj reset 1_2 ")
			for i = 1,  #WeddingObjlist[roomid] do
				local objorgid = ReadRoleValue(WeddingObjlist[roomid][i], EM_RoleValue_OrgID)
				local putgroup_1 = {121494, 121495, 121496, 121503, 121504, 121505, 121506, 121507, 121508 }  -- 蛋糕 飲料 點心
				local putgroup_2 = {121509, 121510, 121511 }  -- 餐桌
				local putgroup_3 = {121512, 121513, 121514 }  -- 精靈樂團
				local putnpc = { 121476, 121477, 121478 }  -- 蛋糕飲料點心 / 餐桌/ 精靈樂團 參考物件

				if objorgid == putgroup_1[1] or objorgid == putgroup_1[2] or objorgid == putgroup_1[3] or objorgid == putgroup_1[4] or objorgid == putgroup_1[5] or objorgid == putgroup_1[6] or objorgid == putgroup_1[7] or objorgid == putgroup_1[8] or objorgid == putgroup_1[9] then
					ChangeObjID( WeddingObjlist[roomid][i] , putnpc[1] )  -- 將table中的每一個物件外觀改回 參考物件	
				--	say(WeddingObjlist[roomid][i], "reset to putnpc. 1 "..i)
				elseif objorgid == putgroup_2[1] or objorgid == putgroup_2[2] or objorgid == putgroup_2[3] then
  					ChangeObjID( WeddingObjlist[roomid][i] , putnpc[2] )  -- 將table中的每一個物件外觀改回 參考物件
				--	say(WeddingObjlist[roomid][i], "reset to putnpc. 2 "..i)
				elseif objorgid == putgroup_3[1] or objorgid == putgroup_3[2] or objorgid == putgroup_3[3] then
  					ChangeObjID( WeddingObjlist[roomid][i] , putnpc[3] )  -- 將table中的每一個物件外觀改回 參考物件
				--	say(WeddingObjlist[roomid][i], "reset to putnpc. 3 "..i)
				end
				SetPlot( WeddingObjlist[roomid][i], "touch" , "" , 0)
				SetModeEx( WeddingObjlist[roomid][i] , EM_SetModeType_ShowRoleHead, true )--開啟頭像框
			end
		end
	end

--	say(Player, "del obj grroup 1 ok")

	if WeddingObjlist2 ~= nil then
	--	say(Player, "obj reset 2_1 ")
		if WeddingObjlist2[Roomid] ~= nil then
		--	say(Player, "obj reset 2_2")
			for j = 1, #WeddingObjlist2[roomid] do
			--	say(WeddingObjlist2[roomid][j], "del obj "..j)
				DelOBJ(WeddingObjlist2[roomid][j])  -- 刪除捧花與氣球
			end
		end	
	end

--	say(Player, "del obj grroup 2 ok")
end