function Lua_Hao_Item_SOP_NPC() -- 掛在任務NPC上的劇情

	local Owner = OwnerID();
	local Target = TargetID();
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID )
	local Month = GetSystime(3)+1	-- 讀取現在月份
	local Date = GetSystime(4)	-- 讀取現在日期 (1)為時 (2)為分 (3)+1 為月 (4)為天　預設為 4
	local SysTime = Month*100+Date	-- 系統時間 最小顯示 101 ( 1月1號 ) 最大顯示 1231 ( 12月31號 )

	local PlayerLv = ReadRoleValue( Owner, EM_RoleValue_LV );
	local OrgID = ReadRoleValue ( Target, EM_RoleValue_OrgID );

	NpcDialog( Target, Owner );  --檢查NPC與玩家的距離

	if OrgID == 115808 then --每日送1個物品A
		local ID = GetDBKeyValue("ItemID_00")	-- 物品ID
		local Count = GetDBKeyValue("ItemAmount_00")	-- 物品數量
		local Lv = GetDBKeyValue("Lvlimit_00")	-- 領取需求等級
		PlayMotion( Target, 254 ) -- 伸懶腰
		if Lv > PlayerLv then
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_04][$SETVAR1="..Lv.."]" )	
		--	領取物品的需求主職等級為：<CM>[$VAR1]</CM>...
		else
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_00][$SETVAR1=".."["..ID.."]".."][$SETVAR2="..Count.."]" )
		--	今天贈送的物品為<CM>[$VAR1]</CM><CY>[$VAR2]</CY>個...
			AddSpeakOption( Owner, Target, "[SC_422367_1]" , "Lua_Hao_Sop_Daily_Articles_Basic_1", 0 )
		end
	elseif OrgID == 115809 then --每日送1個物品B
		local ID = GetDBKeyValue("ItemID_01")	-- 物品ID
		local Count = GetDBKeyValue("ItemAmount_01")	-- 物品數量
		local Lv = GetDBKeyValue("Lvlimit_01")	-- 領取需求等級
		PlayMotion( Target, 251 ) -- 宮廷禮儀
		if Lv > PlayerLv then
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_04][$SETVAR1="..Lv.."]" )	
		--	領取物品的需求主職等級為：<CY>[$VAR1]</CY>...
		else
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_00][$SETVAR1=".."["..ID.."]".."][$SETVAR2="..Count.."]" )
		--	今天贈送的物品為<CM>[$VAR1]</CM><CY>[$VAR2]</CY>個...
			AddSpeakOption( Owner, Target, "[SC_422367_1]" , "Lua_Hao_Sop_Daily_Articles_Basic_2", 0 )
		end
	elseif OrgID == 115810 then --每日送2個物品
		local ID = GetDBKeyValue("ItemID_02")			-- 第一個物品ID
		local ID2 = GetDBKeyValue("ItemID_02_1")		-- 第二個物品ID
		local Count = GetDBKeyValue("ItemAmount_02")		-- 第一個物品數量
		local Count2 = GetDBKeyValue("ItemAmount_02_1")	-- 第二個物品數量
		local Lv = GetDBKeyValue("Lvlimit_02")			-- 領取需求等級
		PlayMotion( Target, 108 ) -- 竊笑
		if Lv > PlayerLv then
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_04][$SETVAR1="..Lv.."]" )	
		--	領取物品的需求主職等級為：<CY>[$VAR1]</CY>，請您達成這個條件後再過來吧！
		else
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_02][$SETVAR1=".."["..ID.."]".."][$SETVAR2="..Count.."][$SETVAR3=".."["..ID2.."]".."][$SETVAR4="..Count2.."]" )
		--	今天贈送的物品為<CM>[$VAR1]</CM><CY>[$VAR2]</CY>個及<CM>[$VAR3]</CM><CY>[$VAR4]</CY>個，你要現在領取嗎？
			AddSpeakOption( Owner, Target, "[SC_422367_1]" , "Lua_Hao_Sop_Daily_Articles_Basic_3", 0 )
		end
	elseif OrgID == 115811 then --每日送3個物品
		local ID = GetDBKeyValue("ItemID_03")			-- 第一個物品ID
		local ID2 = GetDBKeyValue("ItemID_03_1")		-- 第二個物品ID
		local ID3 = GetDBKeyValue("ItemID_03_2")		-- 第三個物品ID
		local Count = GetDBKeyValue("ItemAmount_03")		-- 第一個物品數量
		local Count2 = GetDBKeyValue("ItemAmount_03_1")	-- 第個物品數量
		local Count3 = GetDBKeyValue("ItemAmount_03_2")	-- 第三個物品數量
		local Lv = GetDBKeyValue("Lvlimit_03")			-- 領取需求等級
		PlayMotion( Target, 106 ) -- 點頭
		if Lv > PlayerLv then
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_04][$SETVAR1="..Lv.."]" )
		--	領取物品的需求主職等級為：<CY>[$VAR1]</CY>，請您達成這個條件後再過來吧！
		else
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_03][$SETVAR1=".."["..ID.."]".."][$SETVAR2="..Count.."][$SETVAR3=".."["..ID2.."]".."][$SETVAR4="..Count2.."][$SETVAR5=".."["..ID3.."]".."][$SETVAR6="..Count3.."]" )
		--	今天贈送的物品為<CM>[$VAR1]</CM><CY>[$VAR2]</CY>個、<CM>[$VAR3]</CM><CY>[$VAR4]</CY>個及<CM>[$VAR5]</CM><CY>[$VAR6]</CY>個，你要現在領取嗎？
			AddSpeakOption( Owner, Target, "[SC_422367_1]" , "Lua_Hao_Sop_Daily_Articles_Basic_4", 0 )
		end
	elseif OrgID == 115812 then --以A換B 方案1
		local LowestLv = GetDBKeyValue("ExLowestLv_00");	-- 兌換最低需求等級
		local HighestLv = GetDBKeyValue("ExHighestLv_00");	-- 兌換最高需求等級
		local ID = GetDBKeyValue("ExItemID_00")			-- 付出的物品ID
		local Count = GetDBKeyValue("ExItemAmount_00")		-- 付出的物品數量
		local RID = GetDBKeyValue("ExReturnGoods_00")			-- 得到的物品ID
		local RCount = GetDBKeyValue("ExReturnAmount_00")		-- 得到的物品數量
		local AccountBarter = GetDBKeyValue("ExBarterlimit_00")		-- 玩家帳號單日交易上限量
		local ServerBarter = GetDBKeyValue("ExServerBarterlimit_00")	-- 伺服器單日交易上限量
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- 讀取開關的設定值-- 配合伺服器交易開關
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- 讀取NPC身上最後一次與玩家兌換的時間
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date5_12 , 12 )	-- 讀取玩家身上最後一次與NPC兌換的時間

		if LowestLv > 0 and HighestLv > 0 then
			if PlayerLv < LowestLv or PlayerLv > HighestLv then	-- 您的主職等級必須介於此區間才符合使用資格：<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
				PlayMotion( Target, 107 )	-- 搖頭
				SetSpeakDetail( Owner, "[SC_ITEM_SOP_45][$SETVAR1="..LowestLv.."][$SETVAR2="..HighestLv.."]" );
				return;
			end
		end

		if NPCTime == 0 then	-- 初次兌換時，該值必為零
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if PlayerTime == 0 then	-- 初次兌換時，該值必為零
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date5_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC 開關
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )		-- 寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )				-- 開啟開關1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- 重新寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count5_8 , 8 , AccountBarter )	-- 重新寫入玩家帳號單日交易上限量
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date5_12 , 12 , SysTime )
		end
  	
		local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count5_8 , 8 )	-- 玩家帳號身上的單日交易上限量
		local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )			-- NPC身上的伺服器單日交易上限量

		PlayMotion( Target, 112 ) -- 比劃
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_12][$SETVAR1="..Count.."][$SETVAR2=".."["..ID.."]".."][$SETVAR5="..RCount.."][$SETVAR6=".."["..RID.."]".."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."]" )
		-- 你確定要用<CY>[$VAR1]</CY>個<CM>[$VAR2]</CM>兌換<CY>[$VAR5]</CY>個<CM>[$VAR6]</CM>嗎？
		-- 每日可兌換次數還剩下：<CY>[$VAR3]</CY>
		-- 伺服器每日可兌換次數還剩下：<CY>[$VAR4]<CY>
		AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_Barter_Basic_1" , 0 )
----------- 2011.04.11 新增以A換B 方案2、以A換B、C、以A換B、C、D
	elseif OrgID == 115817 then --以A換B 方案2
		local LowestLv = GetDBKeyValue("ExLowestLv_01");	-- 兌換最低需求等級
		local HighestLv = GetDBKeyValue("ExHighestLv_01");	-- 兌換最高需求等級
		local ID = GetDBKeyValue("ExItemID_01")			-- 付出的物品ID
		local Count = GetDBKeyValue("ExItemAmount_01")		-- 付出的物品數量
		local RID = GetDBKeyValue("ExReturnGoods_01")			-- 得到的物品ID
		local RCount = GetDBKeyValue("ExReturnAmount_01")		-- 得到的物品數量
		local AccountBarter = GetDBKeyValue("ExBarterlimit_01")		-- 玩家帳號單日交易上限量
		local ServerBarter = GetDBKeyValue("ExServerBarterlimit_01")	-- 伺服器單日交易上限量
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- 讀取開關的設定值-- 配合伺服器交易開關
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- 讀取NPC身上最後一次與玩家兌換的時間
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date6_12 , 12 )	-- 讀取玩家身上最後一次與NPC兌換的時間

		if LowestLv > 0 and HighestLv > 0 then
			if PlayerLv < LowestLv or PlayerLv > HighestLv then	-- 您的主職等級必須介於此區間才符合使用資格：<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
				PlayMotion( Target, 107 )	-- 搖頭
				SetSpeakDetail( Owner, "[SC_ITEM_SOP_45][$SETVAR1="..LowestLv.."][$SETVAR2="..HighestLv.."]" );
				return;
			end
		end

		if NPCTime == 0 then	-- 初次兌換時，該值必為零
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if PlayerTime == 0 then	-- 初次兌換時，該值必為零
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date6_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC 開關
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- 寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )			-- 開啟開關1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- 重新寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count6_8 , 8 , AccountBarter )	-- 重新寫入玩家帳號單日交易上限量
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date6_12 , 12 , SysTime )
		end
  	
		local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count6_8 , 8 )	-- 玩家帳號身上的單日交易上限量
		local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )			-- NPC身上的伺服器單日交易上限量

		PlayMotion( Target, 112 ) -- 比劃
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_12][$SETVAR1="..Count.."][$SETVAR2=".."["..ID.."]".."][$SETVAR5="..RCount.."][$SETVAR6=".."["..RID.."]".."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."]" )
		-- 你確定要用<CY>[$VAR1]</CY>個<CM>[$VAR2]</CM>兌換<CY>[$VAR3]</CY>個<CM>[$VAR4]</CM>嗎？
		-- 每日可兌換次數還剩下：<CY>[$VAR3]</CY>
		-- 伺服器每日可兌換次數還剩下：<CY>[$VAR4]<CY>
		AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_Barter_Basic_2" , 0 )
	elseif OrgID == 115825 then --以A換B、C
		local LowestLv = GetDBKeyValue("ExLowestLv_02");	-- 兌換最低需求等級
		local HighestLv = GetDBKeyValue("ExHighestLv_02");	-- 兌換最高需求等級
		local ID = GetDBKeyValue("ExItemID_02")			-- 付出的物品A_ID
		local Count = GetDBKeyValue("ExItemAmount_02")		-- 付出的物品A_數量
		local RID_1 = GetDBKeyValue("ExReturnGoods_02")		-- 得到的物品B_ID
		local RCount_1 = GetDBKeyValue("ExReturnAmount_02")		-- 得到的物品B_數量
		local RID_2 = GetDBKeyValue("ExReturnGoods_02_1")		-- 得到的物品C_ID
		local RCount_2 = GetDBKeyValue("ExReturnAmount_02_1")	-- 得到的物品C_數量
		local AccountBarter = GetDBKeyValue("ExBarterlimit_02")		-- 玩家帳號單日交易上限量
		local ServerBarter = GetDBKeyValue("ExServerBarterlimit_02")	-- 伺服器單日交易上限量
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- 讀取開關的設定值-- 配合伺服器交易開關
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- 讀取NPC身上最後一次與玩家兌換的時間
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date7_12 , 12 )	-- 讀取玩家身上最後一次與NPC兌換的時間

		if LowestLv > 0 and HighestLv > 0 then
			if PlayerLv < LowestLv or PlayerLv > HighestLv then	-- 您的主職等級必須介於此區間才符合使用資格：<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
				PlayMotion( Target, 107 )	-- 搖頭
				SetSpeakDetail( Owner, "[SC_ITEM_SOP_45][$SETVAR1="..LowestLv.."][$SETVAR2="..HighestLv.."]" );
				return;
			end
		end

		if NPCTime == 0 then	-- 初次兌換時，該值必為零
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end
		if PlayerTime == 0 then	-- 初次兌換時，該值必為零
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date7_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC 開關
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- 寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )			-- 開啟開關1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- 重新寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count7_8 , 8 , AccountBarter )	-- 重新寫入玩家帳號單日交易上限量
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date7_12 , 12 , SysTime )
		end
  	
		local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count7_8 , 8 )	-- 玩家帳號身上的單日交易上限量
		local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )			-- NPC身上的伺服器單日交易上限量

		PlayMotion( Target, 112 ) -- 比劃
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_54][$SETVAR1="..Count.."][$SETVAR2=".."["..ID.."]".."][$SETVAR5="..RCount_1.."][$SETVAR6=".."["..RID_1.."]".."][$SETVAR7="..RCount_2.."][$SETVAR8=".."["..RID_2.."]".."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."]" )
		-- 你確定要用<CY>[$VAR1]</CY>個<CM>[$VAR2]</CM>兌換<CY>[$VAR5]</CY>個<CM>[$VAR6]</CM>、<CY>[$VAR7]</CY>個<CM>[$VAR8]</CM>嗎？
		-- 每日可兌換次數還剩下：<CY>[$VAR3]</CY>
		-- 伺服器每日可兌換次數還剩下：<CY>[$VAR4]<CY>
		AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_Barter_Basic_3" , 0 )
	elseif OrgID == 116067 then --以A換B、C、D
		local LowestLv = GetDBKeyValue("ExLowestLv_03");	-- 兌換最低需求等級
		local HighestLv = GetDBKeyValue("ExHighestLv_03");	-- 兌換最高需求等級
		local ID = GetDBKeyValue("ExItemID_03")			-- 付出的物品A_ID
		local Count = GetDBKeyValue("ExItemAmount_03")		-- 付出的物品A_數量
		local RID_1 = GetDBKeyValue("ExReturnGoods_03")		-- 得到的物品B_ID
		local RCount_1 = GetDBKeyValue("ExReturnAmount_03")		-- 得到的物品B_數量
		local RID_2 = GetDBKeyValue("ExReturnGoods_03_1")		-- 得到的物品C_ID
		local RCount_2 = GetDBKeyValue("ExReturnAmount_03_1")	-- 得到的物品C_數量
		local RID_3 = GetDBKeyValue("ExReturnGoods_03_2")		-- 得到的物品D_ID
		local RCount_3 = GetDBKeyValue("ExReturnAmount_03_2")	-- 得到的物品D_數量
		local AccountBarter = GetDBKeyValue("ExBarterlimit_03")		-- 玩家帳號單日交易上限量
		local ServerBarter = GetDBKeyValue("ExServerBarterlimit_03")	-- 伺服器單日交易上限量
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- 讀取開關的設定值-- 配合伺服器交易開關
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- 讀取NPC身上最後一次與玩家兌換的時間
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date8_12 , 12 )	-- 讀取玩家身上最後一次與NPC兌換的時間

		if LowestLv > 0 and HighestLv > 0 then
			if PlayerLv < LowestLv or PlayerLv > HighestLv then	-- 您的主職等級必須介於此區間才符合使用資格：<CY>[$VAR1]</CY> ~ <CY>[$VAR2]</CY>
				PlayMotion( Target, 107 )	-- 搖頭
				SetSpeakDetail( Owner, "[SC_ITEM_SOP_45][$SETVAR1="..LowestLv.."][$SETVAR2="..HighestLv.."]" );
				return;
			end
		end

		if NPCTime == 0 then	-- 初次兌換時，該值必為零
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end
		if PlayerTime == 0 then	-- 初次兌換時，該值必為零
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date8_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC 開關
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- 寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )			-- 開啟開關1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , ServerBarter )	-- 重新寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count8_8 , 8 , AccountBarter )	-- 重新寫入玩家帳號單日交易上限量
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date8_12 , 12 , SysTime )
		end
  	
		local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count8_8 , 8 )	-- 玩家帳號身上的單日交易上限量
		local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )			-- NPC身上的伺服器單日交易上限量

		PlayMotion( Target, 112 ) -- 比劃
		SetSpeakDetail( Owner, "[SC_ITEM_SOP_55][$SETVAR1="..Count.."][$SETVAR2=".."["..ID.."]".."][$SETVAR5="..RCount_1.."][$SETVAR6=".."["..RID_1.."]".."][$SETVAR7="..RCount_2.."][$SETVAR8=".."["..RID_2.."]".."][$SETVAR9="..RCount_3.."][$SETVAR10=".."["..RID_3.."]".."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."]" )
		-- 你確定要用<CY>[$VAR1]</CY>個<CM>[$VAR2]</CM>兌換<CY>[$VAR5]</CY>個<CM>[$VAR6]</CM>、<CY>[$VAR7]</CY>個<CM>[$VAR8]</CM>、<CY>[$VAR9]</CY>個<CM>[$VAR10]</CM>嗎？
		-- 每日可兌換次數還剩下：<CY>[$VAR3]</CY>
		-- 伺服器每日可兌換次數還剩下：<CY>[$VAR4]<CY>
		AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_Barter_Basic_4" , 0 )
	elseif OrgID == 115813 then --金幣兌換晶鑽
		local Money = GetDBKeyValue("Money_00")
		local Diamond = GetDBKeyValue("Diamond_00")
		local Freetrade_00 = GetDBKeyValue("Freetrade_00")					-- 玩家帳號單日交易上限量
		local Servertrade_00 = GetDBKeyValue("Servertrade_00")				-- 伺服器單日交易上限量
		local Weektrade_00 = GetDBKeyValue("Weektrade_00")				-- 伺服器開啟 / 關閉交易上限量
		local Pass_00 = ReadRoleValue( Target, EM_RoleValue_PID )
		local Keyitem =  544050								-- 遊戲幣兌換晶鑽每日旗標
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- 讀取開關的設定值-- 配合伺服器交易開關
		local WeekSwitch = GetWorldVar( "SC_ITEM_SOP_100" )				-- 讀取開關的設定值-- 配合伺服器開啟 / 關閉交易上限量
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- 讀取NPC身上最後一次與玩家兌換的時間
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date1_12 , 12 )	-- 讀取玩家身上最後一次與NPC兌換的時間
		-- Reg1 NPC(定點)的交易開關
		-- Reg2 NPC 伺服器單日交易上限量
		-- Reg3 NPC 交易開關
		-- Reg4 NPC 時間記錄旗標

		if NPCTime == 0 then		-- 初次兌換時，該值必為零
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if PlayerTime == 0 then	-- 初次兌換時，該值必為零
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date1_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC 開關
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_00 )	-- 寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )			-- 開啟開關1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_00 )	-- 重新寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if WeekSwitch == 0 then
			SetWorldVar( "SC_ITEM_SOP_100" , Weektrade_00+100 )
		end

---------2010/08/17 信任玩家機制　金幣兌換晶鑽
		local Flag = ReadRoleValue( Owner, EM_RoleValue_UnTrust_Flag )
	--	DebugMsg( 0 , RoomID ,"Flag = "..Flag )
		local UnTrust = {}
		for i = 0 , 31 do	-- 二進制
			if checkbit( Flag , i ) == true then
				UnTrust[i] = 1
			else
				UnTrust[i] = 0
			end
		--	DebugMsg( 0 , RoomID ,"UnTrust ["..i.."] = "..UnTrust[i] )
		end
		if UnTrust[Trusted_Player_Flag_Design1] == 1 then	-- 2^16
			SetSpeakDetail( Owner, "[SYS_GAMEMSGEVENT_704]" ) -- 你的帳號目前無法使用此功能。 
			DebugMsg( 0 , RoomID ,"UnTrust is online" )
			return false
		end
---------
		if Pass_00 == 1 then
			if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count1_8 , 8 , Freetrade_00 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date1_12 , 12 , SysTime )
			end
  		
			local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count1_8 , 8 )	-- 玩家帳號身上的單日交易上限量
			local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )		-- NPC身上的伺服器單日交易上限量
			local Weektrade = GetWorldVar( "SC_ITEM_SOP_100" ) - 100				-- 全伺服器內的值(可跨Zone)

			PlayMotion( Target, 253 ) -- 中國式行禮
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_05][$SETVAR1="..Money.."][$SETVAR2="..Diamond.."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."][SC_ITEM_SOP_13][$SETVAR5="..Weektrade.."]" )
			-- 你確定要用<CY>[$VAR1]</CY><CM>[200000]</CM>兌換<CY>[$VAR2]</CY><CM>[200003]</CM>嗎？

			AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_MandD_Trade_Basic_1" , 0 )
		else
			if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count1_8 , 8 , Freetrade_00 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date1_12 , 12 , SysTime )
			end
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_10]" )	-- 兌換服務尚未開始，請您耐心等待活動開放。
		end
	elseif OrgID == 115814 then --晶鑽兌換金幣
		local Money = GetDBKeyValue("Money_01")
		local Diamond = GetDBKeyValue("Diamond_01")
		local Freetrade_01 = GetDBKeyValue("Freetrade_01")					-- 玩家帳號單日上限量
		local Servertrade_01 = GetDBKeyValue("Servertrade_01")					-- 伺服器單日交易上限量
		local Weektrade_01 = GetDBKeyValue("Weektrade_01")				-- 伺服器開啟 / 關閉交易上限量
		local Pass_01 = ReadRoleValue( Target, EM_RoleValue_PID )
		local Keyitem =  544051									-- 遊戲幣兌換晶鑽每日旗標
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- 讀取開關的設定值-- 配合伺服器交易開關
		local WeekSwitch = GetWorldVar( "SC_ITEM_SOP_101" )				-- 讀取開關的設定值-- 配合伺服器開啟 / 關閉交易上限量
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- 讀取NPC身上最後一次與玩家兌換的時間
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date2_12 , 12 )	-- 讀取玩家身上最後一次與NPC兌換的時間

		if NPCTime == 0 then		-- 初次兌換時，該值必為零
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if PlayerTime == 0 then	-- 初次兌換時，該值必為零
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date2_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC 開關
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_01 )		-- 寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )			-- 開啟開關1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_01 )	-- 重新寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if WeekSwitch == 0 then
			SetWorldVar( "SC_ITEM_SOP_101" , Weektrade_01+100 )
		end

		-- 無法使用晶鑽兌換金幣
		local Flag = ReadRoleValue( Owner, EM_RoleValue_UnTrust_Flag )
	--	DebugMsg( 0 , RoomID ,"Flag = "..Flag )
		local UnTrust = {}
		for i = 0 , 31 do	-- 二進制
			if checkbit( Flag , i ) == true then
				UnTrust[i] = 1
			else
				UnTrust[i] = 0
			end
		--	DebugMsg( 0 , RoomID ,"UnTrust ["..i.."] = "..UnTrust[i] )
		end
		if UnTrust[Trusted_Player_Flag_Design2] == 1 then	-- 2^17
			SetSpeakDetail( Owner, "[SYS_GAMEMSGEVENT_704]" ) -- 你的帳號目前無法使用此功能。 
			DebugMsg( 0 , RoomID ,"UnTrust is online" )
			return
		end
---------
		if Pass_01 == 1 then
			if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count2_8 , 8 , Freetrade_01 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date2_12 , 12 , SysTime )
			end
  		
			local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count2_8 , 8 )	-- 玩家帳號身上的單日交易上限量
			local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )		-- NPC身上的伺服器單日交易上限量
			local Weektrade = GetWorldVar( "SC_ITEM_SOP_101" ) - 100				-- 全伺服器內的值(可跨Zone)

			PlayMotion( Target, 112 ) -- 比畫
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_06][$SETVAR1="..Diamond.."][$SETVAR2="..Money.."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."][SC_ITEM_SOP_13][$SETVAR5="..Weektrade.."]" )
			-- 你確定要用<CY>[$VAR1]</CY><CM>[200003]</CM>兌換<CY>[$VAR2]</CY><CM>[200000]</CM>嗎？

			AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_MandD_Trade_Basic_2" , 0 )
		else
			if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count2_8 , 8 , Freetrade_01 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date2_12 , 12 , SysTime )
			end
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_10]" )	-- 兌換服務尚未開始，請您耐心等待活動開放。
		end

	elseif OrgID == 115815 then	-- Zone2 NPC 金幣兌換晶鑽
		local Money = GetDBKeyValue("Money_11")
		local Diamond = GetDBKeyValue("Diamond_11")
		local Freetrade_11 = GetDBKeyValue("Freetrade_11")		-- 玩家帳號單日交易上限量
		local Servertrade_11 = GetDBKeyValue("Servertrade_11")		-- 伺服器單日交易上限量
		local Weektrade_00 = GetDBKeyValue("Weektrade_00")		-- 伺服器開啟 / 關閉交易上限量
		local Keyitem =  544052						-- 遊戲幣兌換晶鑽每日旗標
		local Pass = GetDBKeyValue("Pass_11")				-- Zone2 金幣兌換為晶鑽 - 兌換開關 1為可兌換 0為不可
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- 讀取開關的設定值-- 配合伺服器交易開關
		local WeekSwitch = GetWorldVar( "SC_ITEM_SOP_100" )				-- 讀取開關的設定值-- 配合伺服器開啟 / 關閉交易上限量
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- 讀取NPC身上最後一次與玩家兌換的時間
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date3_12 , 12 )	-- 讀取玩家身上最後一次與NPC兌換的時間

		if NPCTime == 0 then	-- 初次兌換時，該值必為零
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if PlayerTime == 0 then	-- 初次兌換時，該值必為零
			WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date3_12 , 12 , SysTime )
		end

		if Switch == 0 then		-- Reg3 NPC 開關
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_11 )		
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )				-- 開啟開關1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_11 )	-- 重新寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if WeekSwitch == 0 then
			SetWorldVar( "SC_ITEM_SOP_100" , Weektrade_00+100 )
		end

---------2010/08/17 信任玩家機制　金幣兌換晶鑽
		-- 無法使用金幣兌換晶鑽
		local Flag = ReadRoleValue( Owner, EM_RoleValue_UnTrust_Flag )
	--	DebugMsg( 0 , RoomID ,"Flag = "..Flag )
		local UnTrust = {}
		for i = 0 , 31 do	-- 二進制
			if checkbit( Flag , i ) == true then
				UnTrust[i] = 1
			else
				UnTrust[i] = 0
			end
		--	DebugMsg( 0 , RoomID ,"UnTrust ["..i.."] = "..UnTrust[i] )
		end
		if UnTrust[Trusted_Player_Flag_Design1] == 1 then	-- 2^16
			SetSpeakDetail( Owner, "[SYS_GAMEMSGEVENT_704]" ) -- 你的帳號目前無法使用此功能。 
			DebugMsg( 0 , RoomID ,"UnTrust is online" )
			return false
		end
---------
		WriteRoleValue( Target, EM_RoleValue_PID , Pass )

		local Pass_11 = ReadRoleValue ( Target, EM_RoleValue_PID )		-- Zone2 金幣兌換為晶鑽 - 兌換開關 1為可兌換 0為不可
		local Pass_11_1 = ReadRoleValue( Target, EM_RoleValue_Register+1 )	-- Zone2 金幣兌換為晶鑽 - 物品選單開關 0為可兌換 1為不可

		if Pass_11 == 1 and Pass_11_1 == 0 then
			if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count3_8 , 8 , Freetrade_11 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date3_12 , 12 , SysTime )
			end
  		
			local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count3_8 , 8 )	-- 玩家帳號身上的單日交易上限量
			local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )		-- NPC身上的伺服器單日交易上限量
			local Weektrade = GetWorldVar( "SC_ITEM_SOP_100" ) - 100				-- 全伺服器內的值(可跨Zone)

  			PlayMotion( Target, 253 ) -- 中國式行禮
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_05][$SETVAR1="..Money.."][$SETVAR2="..Diamond.."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."][SC_ITEM_SOP_13][$SETVAR5="..Weektrade.."]" )
			-- 你確定要用<CY>[$VAR1]</CY><CM>[200000]</CM>兌換<CY>[$VAR2]</CY><CM>[200003]</CM>嗎？
			AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_MandD_Trade_Basic_3" , 0 )
		else
			if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count3_8 , 8 , Freetrade_11 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date3_12 , 12 , SysTime )
			end
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_10]" )	-- 兌換服務尚未開始，請您耐心等待活動開放。
		end
	elseif OrgID == 115816 then	-- Zone2 NPC 晶鑽兌換金幣
		local Money = GetDBKeyValue("Money_12")
		local Diamond = GetDBKeyValue("Diamond_12")
		local Freetrade_12 = GetDBKeyValue("Freetrade_12")					-- 玩家單日交易限制
		local Servertrade_12 = GetDBKeyValue("Servertrade_12")				-- 伺服器單日交易上限量
		local Weektrade_01 = GetDBKeyValue("Weektrade_01")				-- 伺服器開啟 / 關閉交易上限量
		local Pass = GetDBKeyValue("Pass_12")							-- Zone2 晶鑽兌換為金幣 - 兌換開關 1為可兌換 0為不可
		local Keyitem =  544053								-- 遊戲幣兌換晶鑽每日旗標(未使用)
		local Switch = ReadRoleValue( Target, EM_RoleValue_Register+3 )			-- 讀取開關的設定值-- 配合伺服器交易開關
		local WeekSwitch = GetWorldVar( "SC_ITEM_SOP_101" )				-- 讀取開關的設定值-- 配合伺服器開啟 / 關閉交易上限量
		local NPCTime = ReadRoleValue( Target, EM_RoleValue_Register+4 )			-- 讀取NPC身上最後一次與玩家兌換的時間
		local PlayerTime = ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Date4_12 , 12 )	-- 讀取玩家身上最後一次與NPC兌換的時間

			if NPCTime == 0 then	-- 初次兌換時，該值必為零
				WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
			end
			if PlayerTime == 0 then	-- 初次兌換時，該值必為零
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date4_12 , 12 , SysTime )
			end

		if Switch == 0 then		-- Reg3 NPC 開關
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_12 )		-- 寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+3 , 1 )				-- 開啟開關1
		elseif Switch == 1 and SysTime ~= NPCTime then
			WriteRoleValue( Target, EM_RoleValue_Register+2 , Servertrade_12 )	-- 重新寫入伺服器單日交易上限量
			WriteRoleValue( Target, EM_RoleValue_Register+4 , SysTime )
		end

		if WeekSwitch == 0 then
			SetWorldVar( "SC_ITEM_SOP_101" , Weektrade_01+100 )
		end

---------2010/08/17 信任玩家機制　晶鑽兌換金幣
		-- 無法使用晶鑽兌換金幣
		local Flag = ReadRoleValue( Owner, EM_RoleValue_UnTrust_Flag )
	--	DebugMsg( 0 , RoomID ,"Flag = "..Flag )
		local UnTrust = {}
		for i = 0 , 31 do	-- 二進制
			if checkbit( Flag , i ) == true then
				UnTrust[i] = 1
			else
				UnTrust[i] = 0
			end
		--	DebugMsg( 0 , RoomID ,"UnTrust ["..i.."] = "..UnTrust[i] )
		end
		if UnTrust[Trusted_Player_Flag_Design2] == 1 then	-- 2^17
			SetSpeakDetail( Owner, "[SYS_GAMEMSGEVENT_704]" ) -- 你的帳號目前無法使用此功能。 
			DebugMsg( 0 , RoomID ,"UnTrust is online" )
			return
		end
---------
		WriteRoleValue( Target, EM_RoleValue_PID , Pass )
		local Pass_12 = ReadRoleValue ( Target, EM_RoleValue_PID )			-- Zone2 晶鑽兌換為金幣 - 兌換開關 1為可兌換 0為不可
		local Pass_12_1 = ReadRoleValue( Target, EM_RoleValue_Register+1 )		-- Zone2 晶鑽兌換為金幣 - 物品選單開關 0為可兌換 1為不可

		if Pass_12 == 1 and Pass_12_1 == 0 then
			if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count4_8 , 8 , Freetrade_12 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date4_12 , 12 , SysTime )
			end
  		
			local Freetrade =  ReadAccountFlagValue( Owner, EM_AccountFlag_CE_Count4_8 , 8 )	-- 玩家帳號身上的單日交易上限量
			local Servertrade = ReadRoleValue( Target, EM_RoleValue_Register+2 )		-- NPC身上的伺服器單日交易上限量
			local Weektrade = GetWorldVar( "SC_ITEM_SOP_101" ) - 100				-- 全伺服器內的值(可跨Zone)

			PlayMotion( Target, 112 ) -- 比劃
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_06][$SETVAR1="..Diamond.."][$SETVAR2="..Money.."][SC_ITEM_SOP_07][$SETVAR3="..Freetrade.."][SC_ITEM_SOP_11][$SETVAR4="..Servertrade.."][SC_ITEM_SOP_13][$SETVAR5="..Weektrade.."]" )
			-- 你確定要用<CY>[$VAR1]</CY><CM>[200003]</CM>兌換<CY>[$VAR2]</CY><CM>[200000]</CM>嗎？
			AddSpeakOption( Owner, Target, "[SC_111284_6]" , "Lua_Hao_Sop_MandD_Trade_Basic_4" , 0 )
		else
			if SysTime ~= PlayerTime then	-- 每日判斷，給允玩家帳號單日交易次數
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Count4_8 , 8 , Freetrade_12 )
				WriteAccountFlagValue( Owner, EM_AccountFlag_CE_Date4_12 , 12 , SysTime )
			end
			SetSpeakDetail( Owner, "[SC_ITEM_SOP_10] " )	-- 兌換服務尚未開始，請您耐心等待活動開放。
		end
	end
end
----------------------------------------------------------------------------------------------------------------