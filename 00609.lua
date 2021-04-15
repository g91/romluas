
--- 掛在npc 產生劇情
function lua_mika_skillcraft_ev1_timer()
--	Say(OwnerID(), "OwnerID" )  --NPC
--	Say(TargetID(), "TargetID" ) --NPC
	local NPC = OwnerID()
	local eventhour = {2, 6, 10, 14, 18, 22 }  -- 時間

	while true do  
		local hour = GetSystime(1)
		local min = GetSystime(2)
		local R5 = ReadRoleValue(NPC, EM_RoleValue_Register+5 )
	--	Say(OwnerID(), hour..":"..min ) -- say出現在時間 TEST MSG
		
		-- 本活動開始
		for i = 1 , #eventhour do
			if hour == eventhour[i] and min == 0 then --  0分 (活動共同廣播)
				local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
				local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_SKILLEVENT_ALLCAST01]" )   -- 6.0.1 巧藝節活動共用廣播
				end
			elseif hour == eventhour[i] and min == 30 then  -- 30分 (活動開始)  
				Beginplot(OwnerID(), "lua_mika_skillcraft_ev1_start" , 0 )

			elseif hour == eventhour[i] and min == 50 then  --  50分 (活動結束)  
				-- 結束活動. 清空題目.
				Beginplot(OwnerID(), "lua_mika_skillcraft_ev1_close" , 0 )

			end
	
		end
	
		sleep(600)  
	end
end


-- 巧藝節 活動1 出題NPC初始對話
function lua_mika_skillcraft_ev1_speak()
--	Say(OwnerID(), "OwnerID" )  --Player
--	Say(TargetID(), "TargetID" )  -- NPC
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家

	local Status = ReadRoleValue(TargetID(),  EM_RoleValue_Register )   --npc狀態  ( 0 = 活動未開始 , 1 = 活動進行中 )

	if Status == 1 then  -- 活動進行中
		local okbuff = CheckBuff(OwnerID(), 620241 )   -- 當持有此BUFF時, 無法重付交付物品  
		if okbuff == false then  -- 當場次未完成過
			local now_itemid = ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )  -- 記在npc身上的題目物品id號碼
			SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_EV1_03][$SETVAR1=".."["..now_itemid.."]".."]"   )   -- 告訴玩家題目
			AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_EV1_04]" , "lua_mika_skillcraft_ev1_rule", 0 ) -- 活動說明
			AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_EV1_05]" , "lua_mika_skillcraft_ev1_back", 0 ) -- 交付物品
		else  -- 當場次已完成過
			SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_EV1_07]"   )  -- [$PLAYERNAME]，我想這次需要的材料就再差一點就夠了，謝謝你的幫忙。
		end
	else  -- 活動未開始
		SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_EV1_08]"   )   -- 和玩家介紹活動
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLEVENT_EV1_04]" , "lua_mika_skillcraft_ev1_rule", 0 ) -- 活動說明
	end
end


 -- 活動規則介紹
function lua_mika_skillcraft_ev1_rule()
	SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_EV1_06]"   )   -- 活動規則介紹內容
end


 -- 交付需求物品
function lua_mika_skillcraft_ev1_back()
--	Say(OwnerID(), "OwnerID" )  -- player
--	Say(TargetID(), "TargetID" )    -- npc
	local Player = OwnerID()

	local now_itemid = ReadRoleValue( TargetID(),  EM_RoleValue_Register+2 )  -- 記在npc身上的題目物品id號碼
	local count_player =  CountBodyItem(Player, now_itemid ) -- 玩家身上指定物品的數量

--	Say(OwnerID(), "Now number is  "..now_itemid )
--	Say(OwnerID(), "Now item count is  "..count_player )

	if count_player > 0 then  -- 如果有需求物品
		SetSpeakDetail( Player, "[SC_SKILLEVENT_EV1_09]"   )   -- 感謝玩家幫忙
		DelBodyItem(Player, now_itemid,  1 )

		local key = Checkflag(Player, 543897 )   -- 當天完成第一次給的key	
		if key == false then
			GiveBodyItem(Player, 240060, 2)  --給 巧藝節活動歡慶憑證 X2 (當天第一次完成才有)
			GiveBodyItem(Player, 241642, 1)  --給 巧匠公會材料包
			Setflag(Player, 543897, 1 )  -- 給KEY
			Lua_Festival_06_All(Player)   -- 給予巧藝節全勤獎
		end

		GiveBodyItem(Player, 240061, 5 )  --給 巧匠的感謝狀 X5  (每次完成給)
		AddBuff(Player, 620241, 0, 1800 )  -- 給 當場次完成 buff 30 分鐘
		DesignLog( Player , 113922 , "craft festival - ev1 complete" ) -- 巧藝節活動1完成計次 (6.0.1後)

	else  -- 物品數量不足
--		Say(OwnerID(), " you have no item !" )
		SetSpeakDetail( Player, "[SC_SKILLEVENT_EV1_10]"   )   -- 告訴玩家物品數量不足

	end

end


-- 開放活動. 給題目
function lua_mika_skillcraft_ev1_start()
--	Say(OwnerID(), "OwnerID" )  -- npc
--	Say(TargetID(), "TargetID" ) -- npc
	local NPC = OwnerID()  -- 活動npc

	-- 開始活動.給題目
	local register =  {   { 11 , 12, 13, 14, 15, 16},
	 		   { 21 , 22, 23, 24, 25, 26},
	 		   { 31 , 32, 33, 34, 35, 36},
	 		   { 41 , 42, 43, 44, 45, 46},
	 		   { 51 , 52, 53, 54, 55, 56} 	
			}

	local needid = {	{ 209720 , 209721 , 209722 , 209723, 241578, 241579 } ,
	 		{ 209728 , 209729 , 209730 , 209733, 241582, 241583 } ,
	 		{ 209738 , 209739 , 209740 , 209741, 241586, 241587 } ,
	 		{ 209746 , 209747 , 209748 , 209749, 241590, 241591 } ,
	 		{ 209754 , 209755 , 209756 , 209757, 241594, 241595 }	}

	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 )    
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 ) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 0 )    
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, 0 ) 

	-- 開放活動
	WriteRoleValue(OwnerID() , EM_RoleValue_Register , 1 )    -- 寫入NPC register 值為1
	local Status = ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   
--	Say(OwnerID(), "Status ="..Status )  --說出狀態 TEST MSG
	Sleep(5)
	-- 給題目
	local ran01 = rand(5)+1  -- 1~5  木工, 打鐵 ,裁縫, 煉金, 製甲
	local ran02 = rand(6)+1  -- 1~4 題目1, 題目2 , 題目3 , 題目4  , 題目5  , 題目6
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, ran01 )    -- 寫入NPC題目 --種類
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, ran02 )    -- 寫入NPC題目 -- 題號
	local theme1 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+3 )   -- 讀取剛剛寫入的題目 -- 種類
	local theme2 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+4 )   -- 讀取剛剛寫入的題目 -- 題號
--	Say(OwnerID(), theme1 )
--	Say(OwnerID(), theme2 )

	local Qns1 = register[theme1][theme2]  -- 11~54 當中1個數字
	local Qns2 = needid[theme1][theme2]   -- 上面數字對應物品id
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, Qns1 )    -- 寫入NPC  -- 題目數字(11~54當中1個數字)  ex : 11 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, Qns2 )    -- 寫入NPC  -- 上述題目對應的需求物品編號   ex : 209720

	local now_number = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+1 )
	local now_itemid = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+2 )

	NPCSAY(NPC, "[SC_SKILLEVENT_EV1_11][$SETVAR1=".."["..now_itemid.."]".."]" )
	Callplot(NPC, "lua_mika_skillcraft_ev1_msg", 0  )
	-- 巧匠協會目前徵求大量的<CS>[$VAR1]</CS>，如果有的話可以提供嗎？
--	Say(OwnerID(), "Now number is  "..now_number )
--	Say(OwnerID(), "Now needitem id is  "..now_itemid )

end

-- 活動進行中 每5分鐘告訴玩家活動需求物品
function lua_mika_skillcraft_ev1_msg()
	local NPC = OwnerID()  -- 活動npc
	local timer = 0

	while True  do
		local now_itemid = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+2 )
		if now_itemid <= 0 then
			break
		else
			timer = timer +1 
			if timer%300 == 0 then  -- 5分鐘
				NPCSAY(NPC, "[SC_SKILLEVENT_EV1_11][$SETVAR1=".."["..now_itemid.."]".."]" )
			end
		end
		sleep(10)  
	end
end

-- 活動結束.把所有題目相關值清空
function lua_mika_skillcraft_ev1_close()
--	Say(OwnerID(), "OwnerID" )  -- npc
--	Say(TargetID(), "TargetID" )  -- Player
	local NPC = OwnerID()
	NPCSAY(NPC, "[SC_SKILLEVENT_EV1_12]")  -- 活動結束SAY

	WriteRoleValue(OwnerID() , EM_RoleValue_Register , 0 )    -- 寫入NPC register 值為0
	local Status = ReadRoleValue(OwnerID(),  EM_RoleValue_Register )   
--	Say(OwnerID(), "Status = "..Status )  --說出狀態 TEST MSG

	WriteRoleValue(OwnerID() , EM_RoleValue_Register+1, 0 )    
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 ) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+3, 0 )    
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+4, 0 ) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+5, 0 ) 
	local  R1 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+1 )
	local  R2 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+2 )
	local  R3 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+3 )
	local  R4 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+4 )
	local  R4 = ReadRoleValue(OwnerID(),  EM_RoleValue_Register+5 )
--	Say(OwnerID(), R1 )
--	Say(OwnerID(), R2 )
--	Say(OwnerID(), R3 )
--	Say(OwnerID(), R4 )
--	Say(OwnerID(), R5 )

end

-- 測試用指令

-- 活動直接開始
function lua_mika_skillcraft_ev1_test01()
	local Player = OwnerID()
	local npc = LuaFunc_SearchNPCbyOrgID(Player , 113922, 100 , 0)       --活動NPC  - 席蘿娜．克魯

	if min == 20 then 
		say(Player, "time error ")
	else
		CancelBuff(Player, 620241)
		Beginplot(npc, "lua_mika_skillcraft_ev1_start" , 0 )
		say(npc, "skill craft ev1 - test begin"  )
	end
end

-- 活動直接結束
function lua_mika_skillcraft_ev1_test02()
	local Player = OwnerID()
	local npc = LuaFunc_SearchNPCbyOrgID(Player , 113922, 100 , 0)       --活動NPC  - 席蘿娜．克魯
	local min = GetSystime(2)

	if min == 50 then 
		say(Player, "time error ")
	else
		Beginplot(npc, "lua_mika_skillcraft_ev1_close" , 0 )
		say(npc, "skill craft ev1 - test close . " )
	end
end

--秀廣播
function lua_mika_skillcraft_ev1_test03()
	local Player = OwnerID()
--	local npc = LuaFunc_SearchNPCbyOrgID(Player , 113922, 100 , 0)       --活動NPC  - 席蘿娜．克魯

	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
		RunningMsgEx( OwnerID() , 2 , 3 , "[SC_SKILLEVENT_ALLCAST01]" )   -- 6.0.1 巧藝節活動共用廣播
	end
end