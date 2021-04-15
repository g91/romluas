function Lua_Hao_Sop_Daily_Articles_Basic_1() -- 每日送1個物品A

	Lua_Hao_Sop_Daily_Articles_Basic_1_0( GetDBKeyValue("BagSpace_00") , GetDBKeyValue("ItemID_00") , GetDBKeyValue("ItemAmount_00") , GetDBKeyValue("Keyitem_00") , GetDBKeyValue("Lvlimit_00")  )
end

function Lua_Hao_Sop_Daily_Articles_Basic_1_0( BagSpace_00 , ItemID_00 , ItemAmount_00 , Keyitem_00 , Lvlimit_00 ) -- 每日物品基礎 
	--( 需求空間、物品ID、物品數量、重要物品、限制等級 )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	-- 讀取玩家等級

	if Check_Bag_Space( OwnerID() , BagSpace_00 ) == false or Lvlimit_00 > PlayerLv  then
		return false
	end

	if CheckFlag( OwnerID() , Keyitem_00 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		PlayMotion( TargetID() , 107 )	-- 搖頭
		return false
	else
		GiveBodyItem( OwnerID() , ItemID_00 , ItemAmount_00 )
		SetFlag( OwnerID() , Keyitem_00 , 1 )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115808 ,"1 Present Daily (Plan 1) is "..ItemAmount_00.."x".."["..ItemID_00.."]" )
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_Basic_2() -- 每日送1個物品B

	Lua_Hao_Sop_Daily_Articles_Basic_2_0( GetDBKeyValue("BagSpace_01") , GetDBKeyValue("ItemID_01") , GetDBKeyValue("ItemAmount_01") , GetDBKeyValue("Keyitem_01") , GetDBKeyValue("Lvlimit_01") )
end

function Lua_Hao_Sop_Daily_Articles_Basic_2_0( BagSpace_01 , ItemID_01 , ItemAmount_01 , Keyitem_01 , Lvlimit_01 ) -- 每日物品基礎 
	--( 需求空間、物品ID、物品數量、重要物品、限制等級 )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	-- 讀取玩家等級

	if Check_Bag_Space( OwnerID() , BagSpace_01 ) == false or Lvlimit_01 > PlayerLv then
		return false
	end

	if CheckFlag( OwnerID() , Keyitem_01 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		PlayMotion( TargetID() , 107 )	-- 搖頭
		return false
	else
		GiveBodyItem( OwnerID() , ItemID_01 , ItemAmount_01 )
		SetFlag( OwnerID() , Keyitem_01 , 1 )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115809 ,"1 Present Daily (Plan 2) is "..ItemAmount_01.."x".."["..ItemID_01.."]" )
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_Basic_3() -- 每日送2個物品

	Lua_Hao_Sop_Daily_Articles_Basic_3_0( GetDBKeyValue("BagSpace_02") , GetDBKeyValue("ItemID_02") , GetDBKeyValue("ItemID_02_1") , GetDBKeyValue("ItemAmount_02") , GetDBKeyValue("ItemAmount_02_1") , GetDBKeyValue("Keyitem_02") , GetDBKeyValue("Lvlimit_02") )
end

function Lua_Hao_Sop_Daily_Articles_Basic_3_0( BagSpace_02 , ItemID_02 , ItemID_02_1 , ItemAmount_02 , ItemAmount_02_1 , Keyitem_02 , Lvlimit_02 )
	--( 需求空間、物品ID、物品ID2、物品數量、物品數量2、重要物品、限制等級 )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	-- 讀取玩家等級

	if Check_Bag_Space( OwnerID() , BagSpace_02 ) == false or Lvlimit_02 > PlayerLv  then
		return false
	end

	if CheckFlag( OwnerID() , Keyitem_02 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		PlayMotion( TargetID() , 107 )	-- 搖頭
		return false
	else
		GiveBodyItem( OwnerID() , ItemID_02 , ItemAmount_02 )
		GiveBodyItem( OwnerID() , ItemID_02_1 , ItemAmount_02_1 )
		SetFlag( OwnerID() , Keyitem_02 , 1 )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115810 ,"2 Present Daily is "..ItemAmount_02.."x".."["..ItemID_02.."]".." , "..ItemAmount_02_1.."x".."["..ItemID_02_1.."]" )
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_Basic_4() --每日送3個物品

	Lua_Hao_Sop_Daily_Articles_Basic_4_0( GetDBKeyValue("BagSpace_03") , GetDBKeyValue("ItemID_03") , GetDBKeyValue("ItemID_03_1") , GetDBKeyValue("ItemID_03_2") , GetDBKeyValue("ItemAmount_03") , GetDBKeyValue("ItemAmount_03_1") , GetDBKeyValue("ItemAmount_03_2") , GetDBKeyValue("Keyitem_03") , GetDBKeyValue("Lvlimit_03") )
end

function Lua_Hao_Sop_Daily_Articles_Basic_4_0( BagSpace_03 , ItemID_03 , ItemID_03_1 , ItemID_03_2 , ItemAmount_03 , ItemAmount_03_1 , ItemAmount_03_2 , Keyitem_03 , Lvlimit_03 ) -- 每日物品基礎 
	--( 需求空間、物品ID、物品ID2、物品ID3、物品數量、物品數量2、物品數量3、重要物品、限制等級 )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	-- 讀取玩家等級

	if Check_Bag_Space( OwnerID() , BagSpace_03 ) == false or Lvlimit_03 > PlayerLv then
		return false
	end

	if CheckFlag( OwnerID() , Keyitem_03 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_BUFFNPC_27]") --你今天已經領取過了，明天再來吧。
		PlayMotion( TargetID() , 107 )	-- 搖頭
		return false
	else
		GiveBodyItem( OwnerID() , ItemID_03 , ItemAmount_03 )
		GiveBodyItem( OwnerID() , ItemID_03_1 , ItemAmount_03_1 )
		GiveBodyItem( OwnerID() , ItemID_03_2 , ItemAmount_03_2 )
		SetFlag( OwnerID() , Keyitem_03 , 1 )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115811 ,"3 Presents Daily is "..ItemAmount_03.."x".."["..ItemID_03.."]".." , "..ItemAmount_03_1.."x".."["..ItemID_03_1.."]".." , "..ItemAmount_03_2.."x".."["..ItemID_03_2.."]" )
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_Basic_1(  ) -- 以A換B 方案1(對話劇情)

	Lua_Hao_Sop_Barter_Basic_1_0( GetDBKeyValue("ExBagSpace_00") , GetDBKeyValue("ExItemID_00") , GetDBKeyValue("ExItemAmount_00") , GetDBKeyValue("ExReturnGoods_00") , GetDBKeyValue("ExReturnAmount_00") )
end

function Lua_Hao_Sop_Barter_Basic_1_0( ExBagSpace_00 , ExItemID_00 , ExItemAmount_00 , ExReturnGoods_00 , ExReturnAmount_00 ) -- 以物換物
	--( 需求空間、物品ID、物品數量、換取物品ID、換取物品數量 )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count5_8 , 8 )		-- 讀取玩家帳號單日交易上限量
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )			-- 讀取Server單日尚餘交易量
	local MaxHeap = GameObjInfo_Int( ExReturnGoods_00 ,"MaxHeap" ) -- 抓物品的堆疊量
	local ItemB_I = Math.floor( ExReturnAmount_00 / MaxHeap )	-- 物品B整數
	local ItemB_R = ExReturnAmount_00 % MaxHeap			-- 物品B餘數

--	DebugMsg( 0 , 0 , "MaxHeap = "..MaxHeap )

	if ExBagSpace_00 > 8 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "Maximum number of support are 8 items per time,Setting error." ) -- 每次最多只支援8個物品，選項錯誤
		return false
	end

	if Check_Bag_Space( OwnerID() , ExBagSpace_00 ) == false then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_TREASURE_NOSPACE]" ) -- 你的背包空間不足
		return false
	end 

	if Servertrade <= 0 or Freetrade <= 0 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_08]" ) -- I am very sorry but our exchange service for today has ended.
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		return false
	end
		
	if CountBodyItem( OwnerID() , ExItemID_00 ) < ExItemAmount_00 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_112311_6]") -- 您所持有的數量不足，還不能兌換喔。 
		return false	
	elseif CountBodyItem( OwnerID() , ExItemID_00 ) >= ExItemAmount_00 then
		--------------------2011.03.10--------------------新追加
		if ExReturnAmount_00 > MaxHeap then
--		DebugMsg( 0 , 0 , "MaxHeap = "..MaxHeap )
			local Recheck = Math.floor( ExReturnAmount_00 / MaxHeap + 0.999 )
--		Say( OwnerID() , "Recheck = "..Recheck )
			if Check_Bag_Space( OwnerID() , Recheck ) == false then
				PlayMotion( TargetID() , 107 )	-- 搖頭
				SetSpeakDetail( OwnerID() , "[SC_TREASURE_NOSPACE]" ) -- 你的背包空間不足
				return false
			end
			if Recheck > 8 then
				PlayMotion( TargetID() , 107 )	-- 搖頭
				SetSpeakDetail( OwnerID() , "Maximum number of support are 8 items per time,Setting error." ) -- 每次最多只支援8個物品，選項錯誤
				return false
			end
			-- 給予物品B
			for i = 1 , ItemB_I , 1 do
				GiveBodyItem( OwnerID() , ExReturnGoods_00 , MaxHeap )
			end
			if ItemB_R ~= 0 then
				GiveBodyItem( OwnerID() , ExReturnGoods_00 , ItemB_R )
			end
		else
			GiveBodyItem( OwnerID() , ExReturnGoods_00 , ExReturnAmount_00 )
		end
		DelBodyItem( OwnerID() , ExItemID_00 , ExItemAmount_00 )
		Servertrade = Servertrade - 1
		Freetrade = Freetrade - 1
		WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
		WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count5_8 , 8 , Freetrade )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115812 ,"Exchange "..ExItemAmount_00.."x".."["..ExItemID_00.."]".." for "..ExReturnAmount_00.."x".."["..ExReturnGoods_00.."]" )
		if Servertrade == 0 then
		--	DesignLog( OwnerID() , 1158120 ,"There is a limit cap in exchanging ".."["..ExItemID_00.."]".." to ".."["..ExReturnGoods_00.."]".." today" )
			DesignLog( OwnerID() , 1158120 ,"There is a limit cap in exchanging "..ExItemAmount_00.."x".."["..ExItemID_00.."]".." to "..ExReturnAmount_00.."x".."["..ExReturnGoods_00.."]".." today" )
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_1(  ) -- 隨機建立NPC 遊戲幣兌換晶鑽(對話劇情)

	Lua_Hao_Sop_MandD_Trade_Basic_1_0( GetDBKeyValue("Money_00") , GetDBKeyValue("Diamond_00") )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_1_0( Money_00 , Diamond_00 ) -- 遊戲幣兌換晶鑽

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	local Starttime_00 = GetDBKeyValue("Starttime_00")						-- 每日交易起始時間
	local Endtime_00 = GetDBKeyValue("Endtime_00")						-- 每日交易結束時間
	local Lowestlv_00 = GetDBKeyValue("Lowestlv_00")						-- 可交易最低等級
	local Highestlv_00 = GetDBKeyValue("Highestlv_00")						-- 可交易最高等級
	local Freetrade_00 = GetDBKeyValue("Freetrade_00")						-- 玩家單日交易限制
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- 讀取玩家等級
	local Hour_Now = GetSystime(1)								-- 讀取現在時間(時)
	local Date_Now = GetSystime(4)								-- 讀取現在日期
	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count1_8 , 8 )	-- 讀取玩家帳號單日交易上限量
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )			-- 讀取Server單日尚餘交易量
	local Weektrade = GetWorldVar( "SC_ITEM_SOP_100" )
	
	if Servertrade <= 0 or Freetrade <= 0 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_08]" ) -- 今日兌換次數已達上限，限量是殘酷的...請您明天再來。
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		return false
	elseif Weektrade <= 100 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_14]" ) -- 本次兌換次數已達上限，兌換服務將於伺服器維護後重新開放。
		return false
	end

	if Starttime_00 >= 24 then
		Starttime_00 = 0
	end
	if Endtime_00 >= 24 or Endtime_00 == 0 then
		Endtime_00 = 24
	end

	if Hour_Now >= Starttime_00 and Hour_Now < Endtime_00 then	-- 小時判斷
		if PlayerLv >= Lowestlv_00 and PlayerLv <= Highestlv_00 then	-- 玩家等級判斷
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < Money_00 then
				PlayMotion( TargetID() , 107 )	-- 搖頭
				SetSpeakDetail( OwnerID() , "[SC_112311_6]" ) -- 您所持有的數量不足，還不能兌換喔。 
				return false
			else
				PlayMotion( TargetID() , 106 )	-- 點頭
				AddRoleValue( OwnerID() , EM_RoleValue_Money_Account , Diamond_00 )
				AddRoleValue( OwnerID() , EM_RoleValue_Money , - Money_00 )
				DesignLog( OwnerID() , 115813 ,"Convert "..Diamond_00.." diamonds with "..Money_00.." gold successfully" ) -- 金幣兌換晶鑽 隨機 兌換完成
				PlaySoundToPlayer( OwnerID() , "sound\\interface\\ui_backpack_loot01.mp3", false )
				Servertrade = Servertrade - 1
				Freetrade = Freetrade - 1
				Weektrade = Weektrade - 1
				if Servertrade == 0 then
					DesignLog( OwnerID() , 200000 ,"There is a limit cap in exchanging "..Money_00.." money to "..Diamond_00.." diamond today" )
				end
				if Weektrade == 100 then
					DesignLog( OwnerID() , 20000000 ,"Your exchange times for "..Money_00.." money to "..Diamond_00.." diamond  arrived to the cap this week" )
				end
				WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
				WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count1_8 , 8 , Freetrade )
				SetWorldVar( "SC_ITEM_SOP_100" , Weektrade )
				CloseSpeak( OwnerID() )
			end
		else
			PlayMotion( TargetID() , 107 )	-- 搖頭
			SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_45][$SETVAR1="..Lowestlv_00.."][$SETVAR2="..Highestlv_00.."]" )
			-- 您的主職等級必須在<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>此區間內才符合兌換資格，請您先達成此需求。
		end
	else
		PlayMotion( TargetID() , 107 )	-- 搖頭
		Starttime_00 = string.format("%02d", Starttime_00 )
		Endtime_00 = string.format("%02d", Endtime_00 )
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_46][$SETVAR1="..Starttime_00.."][$SETVAR2="..Endtime_00.."]" ) 
		-- 兌換服務將於<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>開放，請您耐心等候。
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_2(  ) -- 隨機建立NPC 晶鑽兌換遊戲幣(對話劇情)

	Lua_Hao_Sop_MandD_Trade_Basic_2_0( GetDBKeyValue("Money_01") , GetDBKeyValue("Diamond_01") )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_2_0( Money_01 , Diamond_01 ) -- 晶鑽兌換遊戲幣

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	local Starttime_01 = GetDBKeyValue("Starttime_01")			-- 每日交易起始時間
	local Endtime_01 = GetDBKeyValue("Endtime_01")			-- 每日交易結束時間
	local Lowestlv_01 = GetDBKeyValue("Lowestlv_01")			-- 可交易最低等級
	local Highestlv_01 = GetDBKeyValue("Highestlv_01")			-- 可交易最高等級
	local Freetrade_01 = GetDBKeyValue("Freetrade_01")			-- 玩家單日交易限制
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )		-- 讀取玩家等級
	local Hour_Now = GetSystime(1)						-- 讀取現在時間(時)
	local Date_Now = GetSystime(4)						-- 讀取現在日期
	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count2_8 , 8 )		-- 讀取玩家帳號單日交易上限量
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )			-- 讀取Server單日尚餘交易量
	local TotalDiamond = ReadRoleValue( OwnerID() , EM_RoleValue_Money_Account )		-- 總晶鑽
	local LockDiamond = ReadRoleValue( OwnerID() , EM_RoleValue_Money_AccountLock )		-- 信用卡購買後，鎖住30天的晶鑽
	local Weektrade = GetWorldVar( "SC_ITEM_SOP_101" )

	if Servertrade <= 0 or Freetrade <= 0 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_08]" )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		return false
	elseif Weektrade <= 100 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_14]" ) -- 本次兌換次數已達上限，兌換服務將於伺服器維護後重新開放。
		return false
	end

	if Starttime_01 >= 24 then
		Starttime_01 = 0
	elseif Endtime_01 >= 24 or Endtime_01 == 0 then
		Endtime_01 = 24
	end

	if Hour_Now >= Starttime_01 and Hour_Now < Endtime_01 then	-- 小時判斷
		if PlayerLv >= Lowestlv_01 and PlayerLv <= Highestlv_01 then	-- 玩家等級判斷
			if ( TotalDiamond - LockDiamond ) < Diamond_01 then	-- 2010.09.24 信用卡機制
				PlayMotion( TargetID() , 107 )	-- 搖頭
				SetSpeakDetail( OwnerID() , "[SC_112311_6]" ) -- 您所持有的數量不足，還不能兌換喔。 
				return false
			else
				PlayMotion( TargetID() , 106 )	-- 點頭
				AddRoleValue( OwnerID() , EM_RoleValue_Money , Money_01 )
				AddRoleValue( OwnerID() , EM_RoleValue_Money_Account , - Diamond_01 )
				DesignLog( OwnerID() , 115814 ,"Convert "..Money_01.." gold with "..Diamond_01.." diamonds successfully" ) -- 晶鑽兌換金幣 隨機 兌換完成
				PlaySoundToPlayer( OwnerID() , "sound\\interface\\ui_backpack_loot01.mp3", false )
				Servertrade = Servertrade - 1
				Freetrade = Freetrade - 1
				Weektrade = Weektrade - 1
				if Servertrade == 0 then
					DesignLog( OwnerID() , 200003 ,"There is a limit cap in exchanging "..Diamond_01.." diamond to "..Money_01.." money today" )
				end
				if Weektrade == 100 then
					DesignLog( OwnerID() , 20000003 ,"Your exchange times for "..Diamond_01.." diamond to "..Money_01.." money arrived to the cap this week" )
				end
				WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
				WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count2_8 , 8 , Freetrade )
				SetWorldVar( "SC_ITEM_SOP_101" , Weektrade )
				CloseSpeak( OwnerID() )
			end
		else
			PlayMotion( TargetID() , 107 )	-- 搖頭
			SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_45][$SETVAR1="..Lowestlv_01.."][$SETVAR2="..Highestlv_01.."]" )
			-- 您的主職等級必須在<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>此區間內才符合兌換資格，請您先達成此需求。
		end
	else
		PlayMotion( TargetID() , 107 )	-- 搖頭
		Starttime_01 = string.format("%02d", Starttime_01 )
		Endtime_01 = string.format("%02d", Endtime_01 )
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_46][$SETVAR1="..Starttime_01.."][$SETVAR2="..Endtime_01.."]" ) 
		-- 兌換服務將於<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>開放，請您耐心等候。
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_3(  ) -- Zone2 NPC 金幣兌換晶鑽(對話劇情)

	Lua_Hao_Sop_MandD_Trade_Basic_3_0( GetDBKeyValue("Money_11") , GetDBKeyValue("Diamond_11") )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_3_0( Money_11 , Diamond_11 ) -- Zone2 NPC 金幣兌換晶鑽

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	local Starttime_11 = GetDBKeyValue("Starttime_11")			-- 每日交易起始時間
	local Endtime_11 = GetDBKeyValue("Endtime_11")			-- 每日交易結束時間
	local Lowestlv_11 = GetDBKeyValue("Lowestlv_11")			-- 可交易最低等級
	local Highestlv_11 = GetDBKeyValue("Highestlv_11")			-- 可交易最高等級
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )		-- 讀取玩家等級
	local Freetrade_11 = GetDBKeyValue("Freetrade_11")			-- 玩家單日交易限制
	local Hour_Now = GetSystime(1)						-- 讀取現在時間(時)
	local Date_Now = GetSystime(4)						-- 讀取現在日期
	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count3_8 , 8 )	-- 讀取玩家帳號單日交易上限量
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )		-- 讀取Server單日尚餘交易量
	local Weektrade = GetWorldVar( "SC_ITEM_SOP_100" )
	
	if Servertrade <= 0 or Freetrade <= 0 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_08]" ) -- I am very sorry but our exchange service for today has ended.
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		return false
	elseif Weektrade <= 100 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_14]" ) -- 本次兌換次數已達上限，兌換服務將於伺服器維護後重新開放。
		return false
	end

	if Starttime_11 >= 24 then
		Starttime_11 = 0
	elseif Endtime_11 >= 24 or Endtime_11 == 0 then
		Endtime_11 = 24
	end

	if Hour_Now >= Starttime_11 and Hour_Now < Endtime_11 then	-- 小時判斷
		if PlayerLv >= Lowestlv_11 and PlayerLv <= Highestlv_11 then	-- 玩家等級判斷
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < Money_11 then
				PlayMotion( TargetID() , 107 )	-- 搖頭
				SetSpeakDetail( OwnerID() , "[SC_112311_6]" ) -- 您所持有的數量不足，還不能兌換喔。 
				return false
			else
				PlayMotion( TargetID() , 106 )	-- 點頭
				AddRoleValue( OwnerID() , EM_RoleValue_Money_Account , Diamond_11 )
				AddRoleValue( OwnerID() , EM_RoleValue_Money , - Money_11 )
				DesignLog( OwnerID() , 115815 ,"Convert "..Diamond_11.." diamonds with "..Money_11.." gold successfully in Zone 2" ) -- 金幣兌換晶鑽 Zone2 兌換完成
				PlaySoundToPlayer( OwnerID() , "sound\\interface\\ui_backpack_loot01.mp3", false )
				Servertrade = Servertrade - 1
				Freetrade = Freetrade - 1
				Weektrade = Weektrade - 1
				if Servertrade == 0 then
					DesignLog( OwnerID() , 2000000 ,"There is a limit cap in exchanging  "..Money_11.." money to "..Diamond_11.." diamond today in Zone 2" )
				end
				if Weektrade == 100 then
					DesignLog( OwnerID() , 200000000 ,"Your exchange times for "..Money_11.." money to "..Diamond_11.." diamond  arrived to the cap in Zone 2 this week" )
				end
				WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
				WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count3_8 , 8 , Freetrade )
				SetWorldVar( "SC_ITEM_SOP_100" , Weektrade )
				CloseSpeak( OwnerID() )
			end
		else
			PlayMotion( TargetID() , 107 )	-- 搖頭
			SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_45][$SETVAR1="..Lowestlv_11.."][$SETVAR2="..Highestlv_11.."]" )
			-- 您的主職等級必須在<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>此區間內才符合兌換資格，請您先達成此需求。
		end
	else
		PlayMotion( TargetID() , 107 )	-- 搖頭
		Starttime_11 = string.format("%02d", Starttime_11 )
		Endtime_11 = string.format("%02d", Endtime_11 )

		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_46][$SETVAR1="..Starttime_11.."][$SETVAR2="..Endtime_11.."]" ) 
		-- 兌換服務將於<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>開放，請您耐心等候。
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_4(  ) -- Zone2 NPC 晶鑽兌換金幣(對話劇情)

	Lua_Hao_Sop_MandD_Trade_Basic_4_0( GetDBKeyValue("Money_12") , GetDBKeyValue("Diamond_12") )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_4_0( Money_12 , Diamond_12 ) -- 晶鑽兌換金幣

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	local Starttime_12 = GetDBKeyValue("Starttime_12")			-- 每日交易起始時間
	local Endtime_12 = GetDBKeyValue("Endtime_12")			-- 每日交易結束時間
	local Lowestlv_12 = GetDBKeyValue("Lowestlv_12")			-- 可交易最低等級
	local Highestlv_12 = GetDBKeyValue("Highestlv_12")			-- 可交易最高等級
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )		-- 讀取玩家等級
	local Freetrade_12 = GetDBKeyValue("Freetrade_12")			-- 玩家單日交易限制
	local Hour_Now = GetSystime(1)						-- 讀取現在時間(時)
	local Date_Now = GetSystime(4)						-- 讀取現在日期
	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count4_8 , 8 )	-- 讀取玩家帳號單日交易上限量
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )			-- 讀取Server單日尚餘交易量
	local TotalDiamond = ReadRoleValue( OwnerID() , EM_RoleValue_Money_Account )		-- 總晶鑽
	local LockDiamond = ReadRoleValue( OwnerID() , EM_RoleValue_Money_AccountLock )		-- 信用卡購買後，鎖住30天的晶鑽
	local Weektrade = GetWorldVar( "SC_ITEM_SOP_101" )

	if Starttime_12 >= 24 then
		Starttime_12 = 0
	elseif Endtime_12 >= 24 or Endtime_12 == 0 then
		Endtime_12 = 24
	end

	if Servertrade <= 0 or Freetrade <= 0 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_08]" )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		return false
	elseif Weektrade <= 100 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_14]" ) -- 本次兌換次數已達上限，兌換服務將於伺服器維護後重新開放。
		return false
	end

	if Hour_Now >= Starttime_12 and Hour_Now < Endtime_12 then		-- 小時判斷
		if PlayerLv >= Lowestlv_12 and PlayerLv <= Highestlv_12 then	-- 玩家等級判斷
			if ( TotalDiamond - LockDiamond ) < Diamond_12 then	-- 2010.09.24 信用卡機制
				PlayMotion( TargetID() , 107 )	-- 搖頭
				SetSpeakDetail( OwnerID() , "[SC_112311_6]" ) -- 您所持有的數量不足，還不能兌換喔。 
				return false
			else
				PlayMotion( TargetID() , 106 )	-- 點頭
				AddRoleValue( OwnerID() , EM_RoleValue_Money , Money_12 )
				AddRoleValue( OwnerID() , EM_RoleValue_Money_Account , - Diamond_12 )
				DesignLog( OwnerID() , 115816 ,"Convert "..Money_12.." gold with "..Diamond_12.." diamonds successfully in Zone 2" ) -- 晶鑽兌換金幣 Zone2 兌換完成
				PlaySoundToPlayer( OwnerID() , "sound\\interface\\ui_backpack_loot01.mp3", false )
				Servertrade = Servertrade - 1
				Freetrade = Freetrade - 1
				Weektrade = Weektrade - 1
				if Servertrade == 0 then
					DesignLog( OwnerID() , 2000003 ,"There is a limit cap in exchanging "..Diamond_12.." diamond to "..Money_12.." money today in Zone 2" )
				end
				if Weektrade == 100 then
					DesignLog( OwnerID() , 200000003 ,"Your exchange times for "..Diamond_12.." diamond to "..Money_12.." money arrived to the cap in Zone 2 this week" )
				end
				WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
				WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count4_8 , 8 , Freetrade )
				SetWorldVar( "SC_ITEM_SOP_101" , Weektrade )
				CloseSpeak( OwnerID() )
			end
		else
			PlayMotion( TargetID() , 107 )	-- 搖頭
			SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_45][$SETVAR1="..Lowestlv_12.."][$SETVAR2="..Highestlv_12.."]" )
			-- 您的主職等級必須在<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>此區間內才符合兌換資格，請您先達成此需求。
		end
	else
		PlayMotion( TargetID() , 107 )	-- 搖頭
		Starttime_12 = string.format("%02d", Starttime_12 )
		Endtime_12 = string.format("%02d", Endtime_12 )
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_46][$SETVAR1="..Starttime_12.."][$SETVAR2="..Endtime_12.."]" ) 
		-- 兌換服務將於<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>開放，請您耐心等候。
	end
end

--	PlayMotion( TargetID() , 112 ) -- 比劃
--	PlayMotion( OwnerID() , 119 ) -- 躊躇不已
--	PlayMotion( OwnerID() , 120 ) -- 聳肩
--	PlayMotion( OwnerID() , 250 ) -- 飛吻
--	PlayMotion( OwnerID() , 253 ) -- 中國式行禮
--	PlayMotion( OwnerID() , 254 ) -- 伸懶腰
--	PlayMotion( OwnerID() , 266 ) -- 俏皮閃耀
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Del_NPC()	-- 刪除NPC選單

	local Owner = OwnerID();

	if CheckBuff( Owner, 501570 ) == true then 
		ScriptMessage( Owner, Owner, 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end

	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	
	AddBuff( Owner, 501570,0,-1);
	DialogCreate( Owner, EM_LuaDialogType_Select, "[SC_ITEM_SOP_1]" )   --NPC類型選擇表單
 		DialogSelectStr( Owner, "[SC_BUFFNPC_39]") 	--是的
		DialogSelectStr( Owner, "[SO_BACK]")	--返回上一頁

	if ( DialogSendOpen( Owner ) == false )  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Owner, Owner, 1 , "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end

	while true do  	--選單開啟之後，執行迴圈
		sleep(5)
		Time = Time+1
	 	if Time > 60 then  --30秒無動作，關閉對話視窗
			ScriptMessage( Owner, Owner, 0 , "[SC_BUFFNPC_07]" , 0 )
			DialogClose( Owner )
			CancelBuff( Owner, 501570 );--
			break
		end
		
		DialogStatus = DialogGetResult( Owner )  --檢查使用者選取的項目
			if DialogStatus == -2  then -- 初始化
			
			elseif DialogStatus == -1  then-- 中斷
				CancelBuff( Owner, 501570 );--
				DialogClose( Owner )
				Step = 1
			elseif DialogStatus == 0 then  -- 刪除NPC
				CancelBuff( Owner, 501570 );--
				Beginplot( Owner, "Lua_Hao_Sop_Del_NPC_01" , 0 )
				DialogClose( Owner )	
				Step = 1			
			elseif DialogStatus == 1 then -- 回到上ㄧ頁
				CancelBuff( Owner, 501570 );--
				Beginplot( Owner, "Lua_Hao_Item_SOP_00", 0 )
				DialogClose( Owner )
				Step= 1
			end
		if Step == 1 then
			break
		end
	end
end  
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Del_NPC_01() 	--執行刪除NPC

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 115808 , 115809 , 115810 , 115811 , 115812 , 115813 , 115814 , 115817 , 115825 , 116067, 124148, 124149 }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for i = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[i] then  --若為陣列中的值
						DelObj(ID) 
					end
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_SOP_Ranger( dis )	-- 距離超過即關閉對話視窗

	local Player = OwnerID()
	local BuffID = 621751
	local BuffIDPos , NpcGuid , Npc
	while true do
		BuffIDPos = Lua_BuffPosSearch( Player , BuffID )				-- 取 Buff 的位置
		NpcGuid = BuffInfo( Player , BuffIDPos , EM_BuffInfoType_OwnerID )	-- 取 Buff 施展者
		Npc = ReadRoleValue( NpcGuid , EM_RoleValue_OrgID )
	--	DebugMsg( 0 , 0 , " Npc = "..Npc )
		if GetDistance( Player , NpcGuid )  >= dis then
			CloseSpeak( Player )
			AdjustFaceDir( NpcGuid , Player , 0 ) -- 面向
			if Npc ==  115808 then	--每日送1個物品A
				PlayMotion( NpcGuid , 111 ) -- 致敬
				break
			elseif Npc == 115809 then	--每日送1個物品 B
				PlayMotion( NpcGuid , 251 ) -- 宮廷禮儀
				break
			elseif Npc == 115810 then	--每日送2個物品
				PlayMotion( NpcGuid , 250 ) -- 飛吻
				break
			else									--其它
				PlayMotion( NpcGuid , 116 ) -- 再見				
				break
			end
		end
		sleep(1)
	end
	CancelBuff_NoEvent( Player , BuffID )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_SOP_Reset_Keyitem()	-- 將每日重要旗標歸零

	local Owner = OwnerID();
	local Flag = { 544045 , 544046 , 544047 , 544048 , 544049 };

	for i = 1 , table.getn(Flag) , 1 do
		SetFlag( Owner, Flag[i], 0 );
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_SOP_Reset_Player(Amount) -- 重置"玩家"當日1.已兌換金幣、晶鑽 2.以物換物的次數，恢復至後台設定的上限次數。

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Upperlimit = {
				GetDBKeyValue("Freetrade_00"),	-- 物品招換NPC 金幣兌換晶鑽  
				GetDBKeyValue("Freetrade_01"),	-- 物品招換NPC 晶鑽兌換金幣
				GetDBKeyValue("Freetrade_11"),	-- Zone2 NPC 金幣兌換晶鑽
				GetDBKeyValue("Freetrade_12"),	-- Zone2 NPC 晶鑽兌換金幣
				GetDBKeyValue("ExBarterlimit_00"),	-- 以A換B 方案1
				GetDBKeyValue("ExBarterlimit_01"),	-- 以A換B 方案2
				GetDBKeyValue("ExBarterlimit_02"),	-- 以A換B、C
				GetDBKeyValue("ExBarterlimit_03"),	-- 以A換B、C、D
				GetDBKeyValue("Plus_01_DailyAccountLimit"),	-- 彈性設定以物換物 方案1
				GetDBKeyValue("Plus_02_DailyAccountLimit"),	-- 彈性設定以物換物 方案2
				GetDBKeyValue("Plus_03_DailyAccountLimit"),	-- 彈性設定以物換物 方案3
				GetDBKeyValue("Plus_04_DailyAccountLimit"),	-- 彈性設定以物換物 方案4
				GetDBKeyValue("Plus_05_DailyAccountLimit"),	-- 彈性設定以物換物 方案5
				GetDBKeyValue("Currency_01_DailyAccountLimit"),	-- 彈性設定以幣換幣 方案1
				GetDBKeyValue("Currency_02_DailyAccountLimit"),	-- 彈性設定以幣換幣 方案2
				GetDBKeyValue("Currency_03_DailyAccountLimit"),	-- 彈性設定以幣換幣 方案3
				GetDBKeyValue("Currency_04_DailyAccountLimit"),	-- 彈性設定以幣換幣 方案4
				GetDBKeyValue("Currency_05_DailyAccountLimit")	-- 彈性設定以幣換幣 方案5
										}

	local Count = {
			EM_AccountFlag_CE_Count1_8,
			EM_AccountFlag_CE_Count2_8,
			EM_AccountFlag_CE_Count3_8,
			EM_AccountFlag_CE_Count4_8,
			EM_AccountFlag_CE_Count5_8,
			EM_AccountFlag_CE_Count6_8,
			EM_AccountFlag_CE_Count7_8,
			EM_AccountFlag_CE_Count8_8,
			EM_AccountFlag_CE_Count9_8,
			EM_AccountFlag_CE_Count10_8,
			EM_AccountFlag_CE_Count11_8,
			EM_AccountFlag_CE_Count12_8,
			EM_AccountFlag_CE_Count13_8,
			EM_AccountFlag_CE_Count14_8,
			EM_AccountFlag_CE_Count15_8,
			EM_AccountFlag_CE_Count16_8,
			EM_AccountFlag_CE_Count17_8,
			EM_AccountFlag_CE_Count18_8
							};

	for Index, Limit in pairs(Upperlimit) do
		local SetValue
		if type(Amount) == "number" and Amount >= 0 then
			SetValue = Amount;
		else
			SetValue = Limit;
		end
		WriteAccountFlagValue( Owner, Count[Index], 8, SetValue );
	--	DebugMsg( Owner, Room, "Index = "..Index..", Value = "..SetValue );
	--	Say( Owner, "Index = "..Index..", Value = "..SetValue );
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_SOP_Reset_Server(Amount)	-- 重置"伺服器"當日1.已兌換金幣、晶鑽 2.以物換物的次數，恢復至後台設定的上限次數。( 僅限使用者目前Zone )

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Upperlimit = {
				{ 115813, GetDBKeyValue("Servertrade_00"), EM_RoleValue_Register+2 },	-- 物品招換NPC 金幣兌換晶鑽
				{ 115814, GetDBKeyValue("Servertrade_01"), EM_RoleValue_Register+2 },	-- 物品招換NPC 晶鑽兌換金幣
				{ 115815, GetDBKeyValue("Servertrade_11"), EM_RoleValue_Register+2 },	-- Zone2 NPC 金幣兌換晶鑽
				{ 115816, GetDBKeyValue("Servertrade_12"), EM_RoleValue_Register+2 },	-- Zone2 NPC 晶鑽兌換金幣
				{ 115812, GetDBKeyValue("ExServerBarterlimit_00"), EM_RoleValue_Register+2 },	-- 以A換B 方案1
				{ 115817, GetDBKeyValue("ExServerBarterlimit_01"), EM_RoleValue_Register+2 },	-- 以A換B 方案2
				{ 115825, GetDBKeyValue("ExServerBarterlimit_02"), EM_RoleValue_Register+2 },	-- 以A換B、C
				{ 116067, GetDBKeyValue("ExServerBarterlimit_03"), EM_RoleValue_Register+2 },	-- 以A換B、C、D

				{ 124148, GetDBKeyValue("Plus_01_DailyServerLimit"), EM_RoleValue_Register+1 },	-- 彈性設定以物換物 方案1
				{ 124148, GetDBKeyValue("Plus_02_DailyServerLimit"), EM_RoleValue_Register+3 },	-- 彈性設定以物換物 方案2
				{ 124148, GetDBKeyValue("Plus_03_DailyServerLimit"), EM_RoleValue_Register+5 },	-- 彈性設定以物換物 方案3
				{ 124148, GetDBKeyValue("Plus_04_DailyServerLimit"), EM_RoleValue_Register+7 },	-- 彈性設定以物換物 方案4
				{ 124148, GetDBKeyValue("Plus_05_DailyServerLimit"), EM_RoleValue_Register+9 },	-- 彈性設定以物換物 方案5

				{ 124149, GetDBKeyValue("Currency_01_DailyServerLimit"), EM_RoleValue_Register+1 },	-- 彈性設定以幣換幣 方案1
				{ 124149, GetDBKeyValue("Currency_02_DailyServerLimit"), EM_RoleValue_Register+3 },	-- 彈性設定以幣換幣 方案2
				{ 124149, GetDBKeyValue("Currency_03_DailyServerLimit"), EM_RoleValue_Register+5 },	-- 彈性設定以幣換幣 方案3
				{ 124149, GetDBKeyValue("Currency_04_DailyServerLimit"), EM_RoleValue_Register+7 },	-- 彈性設定以幣換幣 方案4
				{ 124149, GetDBKeyValue("Currency_05_DailyServerLimit"), EM_RoleValue_Register+9 }	-- 彈性設定以幣換幣 方案5
														}

	local Count = SetSearchAllNPC( Room );
	for i=1 , Count , 1 do
		local Guid = GetSearchResult();
		local OrgID = ReadRoleValue( Guid, EM_RoleValue_OrgID );	-- Npc 編號
		for Index, Date in pairs(Upperlimit) do
			if OrgID == Date[1] then  -- 若為陣列中的值
				if type(Amount) == "number" and Amount >= 0 then
					WriteRoleValue( Guid, Date[3], Amount );
				else
					WriteRoleValue( Guid, Date[3], Date[2] );
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Open()	-- 開啟目標NPC的兌換服務

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 115813 , 115814 , 115815 , 115816 }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						WriteRoleValue( ID , EM_RoleValue_PID , 1 )
					end
					if Name == 115815 or Name == 115816 then
						WriteRoleValue( ID ,  EM_RoleValue_Register+1  , 0 )
					end
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Close()	-- 關閉目標NPC的兌換服務

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 115813 , 115814 , 115815 , 115816 }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						WriteRoleValue( ID , EM_RoleValue_PID , 0 )
					end
					if Name == 115815 or Name == 115816 then
						WriteRoleValue( ID , EM_RoleValue_Register+1  , 1 )
					end
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Test_Server_Count()	-- 讀取玩家帳號中記錄的對應時間與數字

	local Owner = OwnerID();
	local Date = {
			EM_AccountFlag_CE_Date1_12,
			EM_AccountFlag_CE_Date2_12,
			EM_AccountFlag_CE_Date3_12,
			EM_AccountFlag_CE_Date4_12,
			EM_AccountFlag_CE_Date5_12,
			EM_AccountFlag_CE_Date6_12,
			EM_AccountFlag_CE_Date7_12,
			EM_AccountFlag_CE_Date8_12,
			EM_AccountFlag_CE_Date9_12,
			EM_AccountFlag_CE_Date10_12,
			EM_AccountFlag_CE_Date11_12,
			EM_AccountFlag_CE_Date12_12,
			EM_AccountFlag_CE_Date13_12,
			EM_AccountFlag_CE_Date14_12,
			EM_AccountFlag_CE_Date15_12,
			EM_AccountFlag_CE_Date16_12,
			EM_AccountFlag_CE_Date17_12,
			EM_AccountFlag_CE_Date18_12
							};

	local Count = {
			EM_AccountFlag_CE_Count1_8,
			EM_AccountFlag_CE_Count2_8,
			EM_AccountFlag_CE_Count3_8,
			EM_AccountFlag_CE_Count4_8,
			EM_AccountFlag_CE_Count5_8,
			EM_AccountFlag_CE_Count6_8,
			EM_AccountFlag_CE_Count7_8,
			EM_AccountFlag_CE_Count8_8,
			EM_AccountFlag_CE_Count9_8,
			EM_AccountFlag_CE_Count10_8,
			EM_AccountFlag_CE_Count11_8,
			EM_AccountFlag_CE_Count12_8,
			EM_AccountFlag_CE_Count13_8,
			EM_AccountFlag_CE_Count14_8,
			EM_AccountFlag_CE_Count15_8,
			EM_AccountFlag_CE_Count16_8,
			EM_AccountFlag_CE_Count17_8,
			EM_AccountFlag_CE_Count18_8
							};

	for Index, Define in ipairs(Date) do
		Say( Owner, "Index = "..Index.." ,Date = "..ReadAccountFlagValue( Owner, Define, 12 ).." ,Count = "..ReadAccountFlagValue( Owner, Count[Index], 8 ) );
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_Sop_Diamond_Lock()	-- 讀取玩家不信任晶鑽的量

	local Owner = OwnerID();
	local LockDiamond = ReadRoleValue( Owner, EM_RoleValue_Money_AccountLock );
	Say( Owner, LockDiamond );
end

function Lua_Hao_Test_Week0(X)	-- 調整伺服器每周交易上限量

	local String = "SC_ITEM_SOP_";
	local List = {};
	List[1] = 100	-- 晶鑽兌換金幣
	List[2] = 101	-- 金幣兌換晶鑽
	List["WeeklyServerItemExchang_01"] = 200	-- 彈性設定 指定物品兌換指定物品 方案1
	List["WeeklyServerItemExchang_02"] = 201
	List["WeeklyServerItemExchang_03"] = 202
	List["WeeklyServerItemExchang_04"] = 203
	List["WeeklyServerItemExchang_05"] = 204
	List["WeeklyServerCurrencyExchang_01"] = 205	-- 彈性設定 指定貨幣兌換指定貨幣 方案1
	List["WeeklyServerCurrencyExchang_02"] = 206
	List["WeeklyServerCurrencyExchang_03"] = 207
	List["WeeklyServerCurrencyExchang_04"] = 208
	List["WeeklyServerCurrencyExchang_05"] = 209

	for Index, Number in pairs(List) do
		SetWorldVar( String..Number , X+100 );

	end
	DebugMsg( 0, 0, "Ready to work" );
end

function Lua_Hao_Test_Week1()	-- 重置伺服器每周交易上限量

	local Weektrade_00 = GetDBKeyValue("Weektrade_00") + 100;	-- 金幣兌換為晶鑽 - 伺服器每周交易上限量
	local Weektrade_01 = GetDBKeyValue("Weektrade_01") + 100;	-- 晶鑽兌換為金幣 - 伺服器每周交易上限量
	SetWorldVar( "SC_ITEM_SOP_100", Weektrade_00 );
	SetWorldVar( "SC_ITEM_SOP_101", Weektrade_01 );

	-- 彈性設定 物品兌換物品(5個方案) Plus_01_WeeklyServerLimit ~ Plus_05_WeeklyServerLimit 對應 SC_ITEM_SOP_200 ~ SC_ITEM_SOP_204
	for i = 0, 4 do
		local WeeklyServerLimit = GetDBKeyValue("Plus_"..string.format( "%02d", i+1 ).."_WeeklyServerLimit") + 100;	-- Server 每周兌換上限量
		SetWorldVar( "SC_ITEM_SOP_20"..i , WeeklyServerLimit );
	end

	-- 彈性設定 貨幣兌換貨幣(5個方案) Currency_01_WeeklyServerLimit ~ Currency_05_WeeklyServerLimit 對應 SC_ITEM_SOP_205 ~ SC_ITEM_SOP_209
	for i = 0, 4 do
		local WeeklyServerLimit = GetDBKeyValue("Currency_"..string.format( "%02d", i+1 ).."_WeeklyServerLimit") + 100;	-- Server 每周兌換上限量
		SetWorldVar( "SC_ITEM_SOP_20"..(i+5) , WeeklyServerLimit );
	end
end

function Lua_Hao_Test_Week2()	-- 顯示伺服器當前的每周交易上限量

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Weektrade_00 = GetWorldVar( "SC_ITEM_SOP_100" ) - 100;	-- 讀取開關的設定值-- 配合伺服器開啟 / 關閉交易上限量
	local Weektrade_01 = GetWorldVar( "SC_ITEM_SOP_101" ) - 100;	-- 讀取開關的設定值-- 配合伺服器開啟 / 關閉交易上限量
	DebugMsg( Owner, Room, "Weektrade_00 = "..Weektrade_00 );
	DebugMsg( Owner, Room, "Weektrade_01 = "..Weektrade_01 );

	for i = 0, 9 do	-- 彈性設定 以物換物及以幣換幣
		local WeeklyServerLimit = GetWorldVar("SC_ITEM_SOP_20"..i ) - 100;	-- Server 每周兌換上限量
		DebugMsg( Owner, Room, "WeeklyServerLimit_0"..i.." = "..WeeklyServerLimit );
	end
end