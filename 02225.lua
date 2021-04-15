-- 2011.04.11 新增
function Lua_Hao_Sop_Barter_Basic_2(  ) -- 以A換B 方案2(對話劇情)

	Lua_Hao_Sop_Barter_Basic_2_0( GetDBKeyValue("ExBagSpace_01") , GetDBKeyValue("ExItemID_01") , GetDBKeyValue("ExItemAmount_01") ,
	GetDBKeyValue("ExReturnGoods_01") , GetDBKeyValue("ExReturnAmount_01") )
end

function Lua_Hao_Sop_Barter_Basic_2_0( ExBagSpace_01 , ExItemID_01 , ExItemAmount_01 , ExReturnGoods_01 , ExReturnAmount_01 ) -- 以A換B 方案2
	--( 需求空間、物品A_ID、物品A_數量、換取物品B_ID、換取物品B_數量 )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count6_8 , 8 )	-- 讀取玩家帳號單日交易上限量
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )			-- 讀取Server單日尚餘交易量
	local MaxHeap = GameObjInfo_Int( ExReturnGoods_01 ,"MaxHeap" ) -- 抓物品的堆疊量
	local ItemB_I = Math.floor( ExReturnAmount_01 / MaxHeap )	-- 物品B整數
	local ItemB_R = ExReturnAmount_01 % MaxHeap			-- 物品B餘數

--	DebugMsg( 0 , 0 , "MaxHeap = "..MaxHeap )

	if ExBagSpace_01 > 8 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "Maximum number of support are 8 items per time,Setting error." ) -- 每次最多只支援8個物品，選項錯誤
		return false
	end

	if Check_Bag_Space( OwnerID() , ExBagSpace_01 ) == false then
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
		
	if CountBodyItem( OwnerID() , ExItemID_01 ) < ExItemAmount_01 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_112311_6]") -- 您所持有的數量不足，還不能兌換喔。 
		return false	
	elseif CountBodyItem( OwnerID() , ExItemID_01 ) >= ExItemAmount_01 then
		--------------------2011.03.10--------------------新追加
		if ExReturnAmount_01 > MaxHeap then
--		DebugMsg( 0 , 0 , "MaxHeap = "..MaxHeap )
			local Recheck = Math.floor( ExReturnAmount_01 / MaxHeap + 0.999 )
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
				GiveBodyItem( OwnerID() , ExReturnGoods_01 , MaxHeap )
			end
			if ItemB_R ~= 0 then
				GiveBodyItem( OwnerID() , ExReturnGoods_01 , ItemB_R )
			end
		else
			GiveBodyItem( OwnerID() , ExReturnGoods_01 , ExReturnAmount_01 )
		end
		DelBodyItem( OwnerID() , ExItemID_01 , ExItemAmount_01 )
		Servertrade = Servertrade - 1
		Freetrade = Freetrade - 1
		WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
		WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count6_8 , 8 , Freetrade )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115817 ,"Exchange "..ExItemAmount_01.."x".."["..ExItemID_01.."]".." for "..ExReturnAmount_01.."x".."["..ExReturnGoods_01.."]" )
		if Servertrade == 0 then
			DesignLog( OwnerID() , 1158170 ,"There is a limit cap in exchanging "..ExItemAmount_01.."x".."["..ExItemID_01.."]".." to "..ExReturnAmount_01.."x".."["..ExReturnGoods_01.."]".." today" )
		end
	end
end

-- 2011.04.11 新增
function Lua_Hao_Sop_Barter_Basic_3(  ) -- 以A換B、C

	Lua_Hao_Sop_Barter_Basic_3_0( GetDBKeyValue("ExBagSpace_02") , GetDBKeyValue("ExItemID_02") , GetDBKeyValue("ExItemAmount_02") , 
	GetDBKeyValue("ExReturnGoods_02") , GetDBKeyValue("ExReturnAmount_02") , GetDBKeyValue("ExReturnGoods_02_1") , GetDBKeyValue("ExReturnAmount_02_1") )
end

function Lua_Hao_Sop_Barter_Basic_3_0( ExBagSpace_02 , ExItemID_02 , ExItemAmount_02 , ExReturnGoods_02 , ExReturnAmount_02 , ExReturnGoods_02_1 , ExReturnAmount_02_1 ) -- 以A換B、C
	--( 需求空間、物品A_ID、物品A_數量、換取物品B_ID、換取物品B_數量、換取物品C_ID、換取物品C_數量 )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count7_8 , 8 )	-- 讀取玩家帳號單日交易上限量
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )			-- 讀取Server單日尚餘交易量
	local MaxHeap = GameObjInfo_Int( ExReturnGoods_02 ,"MaxHeap" ) -- 抓物品的堆疊量
	local MaxHeap2 =  GameObjInfo_Int( ExReturnGoods_02_1 ,"MaxHeap" ) -- 抓物品的堆疊量
	local ItemB_I = Math.floor( ExReturnAmount_02 / MaxHeap )	-- 物品B整數
	local ItemB_R = ExReturnAmount_02 % MaxHeap			-- 物品B餘數
	local ItemC_I = Math.floor( ExReturnAmount_02_1 / MaxHeap2 )	-- 物品C整數
	local ItemC_R = ExReturnAmount_02_1 % MaxHeap2		-- 物品C餘數

--	DebugMsg( 0 , 0 , "MaxHeap = "..MaxHeap.." ".."MaxHeap2 = "..MaxHeap2 )
--	DebugMsg( 0 , 0 , "ItemB_I = "..ItemB_I.." ".."ItemB_R = "..ItemB_R )
--	DebugMsg( 0 , 0 , "ItemC_I = "..ItemC_I.." ".."ItemB_R = "..ItemC_R )

	if ExBagSpace_02 > 8 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "Maximum number of support are 8 items per time,Setting error." ) -- 每次最多只支援8個物品，選項錯誤
		return false
	end

	if Check_Bag_Space( OwnerID() , ExBagSpace_02 ) == false then
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
		
	if CountBodyItem( OwnerID() , ExItemID_02 ) < ExItemAmount_02 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_112311_6]") -- 您所持有的數量不足，還不能兌換喔。 
		return false	
	elseif CountBodyItem( OwnerID() , ExItemID_02 ) >= ExItemAmount_02 then
		--------------------2011.03.10--------------------新追加
		if ExReturnAmount_02 > MaxHeap or ExReturnAmount_02_1 > MaxHeap2 then

			local Recheck = Math.floor( ExReturnAmount_02 / MaxHeap + 0.999 )
			local Recheck2 = Math.floor( ExReturnAmount_02_1 / MaxHeap2 + 0.999 )

			if Check_Bag_Space( OwnerID() , Recheck+Recheck2 ) == false then
				PlayMotion( TargetID() , 107 )	-- 搖頭
				SetSpeakDetail( OwnerID() , "[SC_TREASURE_NOSPACE]" ) -- 你的背包空間不足
				return false
			end

			if Recheck+Recheck2 > 8 then
				PlayMotion( TargetID() , 107 )	-- 搖頭
				SetSpeakDetail( OwnerID() , "Maximum number of support are 8 items per time,Setting error." ) -- 每次最多只支援8個物品，選項錯誤
				return false
			end
			-- 給予物品B
			for i = 1 , ItemB_I , 1 do
				GiveBodyItem( OwnerID() , ExReturnGoods_02 , MaxHeap )
			end
			if ItemB_R ~= 0 then
				GiveBodyItem( OwnerID() , ExReturnGoods_02 , ItemB_R )
			end
			-- 給予物品C
			for i = 1 , ItemC_I , 1 do
				GiveBodyItem( OwnerID() , ExReturnGoods_02_1 , MaxHeap2 )
			end
			if ItemC_R ~= 0 then
				GiveBodyItem( OwnerID() , ExReturnGoods_02_1 , ItemC_R )
			end
		else
			GiveBodyItem( OwnerID() , ExReturnGoods_02 , ExReturnAmount_02 )
			GiveBodyItem( OwnerID() , ExReturnGoods_02_1 , ExReturnAmount_02_1 )
		end
		DelBodyItem( OwnerID() , ExItemID_02 , ExItemAmount_02 )
		Servertrade = Servertrade - 1
		Freetrade = Freetrade - 1
		WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
		WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count7_8 , 8 , Freetrade )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115825 ,"Exchange "..ExItemAmount_02.."x".."["..ExItemID_02.."]".." for "..ExReturnAmount_02.."x".."["..ExReturnGoods_02.."]".." . "..ExReturnAmount_02_1.."x".."["..ExReturnGoods_02_1.."]" )
		if Servertrade == 0 then
			DesignLog( OwnerID() , 1158250 ,"There is a limit cap in exchanging "..ExItemAmount_02.."x".."["..ExItemID_02.."]".." to "..ExReturnAmount_02.."x".."["..ExReturnGoods_02.."]".." . "..ExReturnAmount_02_1.."x".."["..ExReturnGoods_02_1.."]".."today" )
		end
	end
end

-- 2011.04.11 新增
function Lua_Hao_Sop_Barter_Basic_4(  ) -- 以A換B、C、D

	Lua_Hao_Sop_Barter_Basic_4_0( GetDBKeyValue("ExBagSpace_03") , GetDBKeyValue("ExItemID_03") , GetDBKeyValue("ExItemAmount_03") , 
	GetDBKeyValue("ExReturnGoods_03") , GetDBKeyValue("ExReturnAmount_03") ,
	GetDBKeyValue("ExReturnGoods_03_1") , GetDBKeyValue("ExReturnAmount_03_1") ,
	GetDBKeyValue("ExReturnGoods_03_2") , GetDBKeyValue("ExReturnAmount_03_2") )
end

function Lua_Hao_Sop_Barter_Basic_4_0( ExBagSpace_03 , ExItemID_03 , ExItemAmount_03 , ExReturnGoods_03 , ExReturnAmount_03 ,
	ExReturnGoods_03_1 , ExReturnAmount_03_1 , ExReturnGoods_03_2 , ExReturnAmount_03_2 ) -- 以A換B、C、D
	--( 需求空間、物品A_ID、物品A_數量、換取物品B_ID、換取物品B_數量、換取物品C_ID、換取物品C_數量 )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向

	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count8_8 , 8 )	-- 讀取玩家帳號單日交易上限量
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )		-- 讀取Server單日尚餘交易量
	local MaxHeap = GameObjInfo_Int( ExReturnGoods_03 ,"MaxHeap" ) -- 抓物品的堆疊量
	local MaxHeap2 =  GameObjInfo_Int( ExReturnGoods_03_1 ,"MaxHeap" ) -- 抓物品的堆疊量
	local MaxHeap3 =  GameObjInfo_Int( ExReturnGoods_03_2 ,"MaxHeap" ) -- 抓物品的堆疊量
	local ItemB_I = Math.floor( ExReturnAmount_03 / MaxHeap )	-- 物品B整數
	local ItemB_R = ExReturnAmount_03 % MaxHeap			-- 物品B餘數
	local ItemC_I = Math.floor( ExReturnAmount_03_1 / MaxHeap2 )	-- 物品C整數
	local ItemC_R = ExReturnAmount_03_1 % MaxHeap2		-- 物品C餘數
	local ItemD_I = Math.floor( ExReturnAmount_03_2 / MaxHeap3 )	-- 物品D整數
	local ItemD_R = ExReturnAmount_03_2 % MaxHeap3		-- 物品D餘數

--	DebugMsg( 0 , 0 , "MaxHeap = "..MaxHeap.." ".."MaxHeap2 = "..MaxHeap2.." ".."MaxHeap3 = "..MaxHeap3 )
--	DebugMsg( 0 , 0 , "ItemB_I = "..ItemB_I.." ".."ItemB_R = "..ItemB_R )
--	DebugMsg( 0 , 0 , "ItemC_I = "..ItemC_I.." ".."ItemB_R = "..ItemC_R )
--	DebugMsg( 0 , 0 , "ItemD_I = "..ItemD_I.." ".."ItemD_R = "..ItemD_R )

	if ExBagSpace_03 > 8 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "Maximum number of support are 8 items per time,Setting error." ) -- 每次最多只支援8個物品，選項錯誤
		return false
	end

	if Check_Bag_Space( OwnerID() , ExBagSpace_03 ) == false then
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
		
	if CountBodyItem( OwnerID() , ExItemID_03 ) < ExItemAmount_03 then
		PlayMotion( TargetID() , 107 )	-- 搖頭
		SetSpeakDetail( OwnerID() , "[SC_112311_6]") -- 您所持有的數量不足，還不能兌換喔。 
		return false	
	elseif CountBodyItem( OwnerID() , ExItemID_03 ) >= ExItemAmount_03 then
		--------------------2011.03.10--------------------新追加
		if ExReturnAmount_03 > MaxHeap or ExReturnAmount_03_1 > MaxHeap2 or ExReturnAmount_03_2 > MaxHeap3 then

			local Recheck = Math.floor( ExReturnAmount_03 / MaxHeap + 0.999 )
			local Recheck2 = Math.floor( ExReturnAmount_03_1 / MaxHeap2 + 0.999 )
			local Recheck3 = Math.floor( ExReturnAmount_03_2 / MaxHeap3 + 0.999 )
		--	DebugMsg( 0 , 0 , "Recheck = "..Recheck.." ".."Recheck2 = "..Recheck.." ".."Recheck3 ="..Recheck3 )

			if Check_Bag_Space( OwnerID() , Recheck+Recheck2+Recheck3 ) == false then
				PlayMotion( TargetID() , 107 )	-- 搖頭
				SetSpeakDetail( OwnerID() , "[SC_TREASURE_NOSPACE]" ) -- 你的背包空間不足
				return false
			end
			if Recheck+Recheck2+Recheck3 > 8 then
				PlayMotion( TargetID() , 107 )	-- 搖頭
				SetSpeakDetail( OwnerID() , "Maximum number of support are 8 items per time,Setting error." ) -- 每次最多只支援8個物品，選項錯誤
				return false
			end
			-- 給予物品B
			for i = 1 , ItemB_I , 1 do
				GiveBodyItem( OwnerID() , ExReturnGoods_03 , MaxHeap )
			end
			if ItemB_R ~= 0 then
				GiveBodyItem( OwnerID() , ExReturnGoods_03 , ItemB_R )
			end
			-- 給予物品C
			for i = 1 , ItemC_I , 1 do
				GiveBodyItem( OwnerID() , ExReturnGoods_03_1 , MaxHeap2 )
			end
			if ItemC_R ~= 0 then
				GiveBodyItem( OwnerID() , ExReturnGoods_03_1 , ItemC_R )
			end
			-- 給予物品D
			for i = 1 , ItemD_I , 1 do
				GiveBodyItem( OwnerID() , ExReturnGoods_03_2 , MaxHeap3 )
			end
			if ItemD_R ~= 0 then
				GiveBodyItem( OwnerID() , ExReturnGoods_03_2 , ItemD_R )
			end
		else
			GiveBodyItem( OwnerID() , ExReturnGoods_03 , ExReturnAmount_03 )
			GiveBodyItem( OwnerID() , ExReturnGoods_03_1 , ExReturnAmount_03_1 )
			GiveBodyItem( OwnerID() , ExReturnGoods_03_2 , ExReturnAmount_03_2 )
		end
		DelBodyItem( OwnerID() , ExItemID_03 , ExItemAmount_03 )
		Servertrade = Servertrade - 1
		Freetrade = Freetrade - 1
		WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
		WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count8_8 , 8 , Freetrade )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 116067 ,"Exchange "..ExItemAmount_03.."x".."["..ExItemID_03.."]".." for "..ExReturnAmount_03.."x".."["..ExReturnGoods_03.."]".." . "..ExReturnAmount_03_1.."x".."["..ExReturnGoods_03_1.."]".." . "..ExReturnAmount_03_2.."x".."["..ExReturnGoods_03_2.."]" )
		if Servertrade == 0 then
			DesignLog( OwnerID() , 1160670 ,"There is a limit cap in exchanging "..ExItemAmount_03.."x".."["..ExItemID_03.."]".." to "..ExReturnAmount_03.."x".."["..ExReturnGoods_03.."]".." . "..ExReturnAmount_03_1.."x".."["..ExReturnGoods_03_1.."]".." . "..ExReturnAmount_03_2.."x".."["..ExReturnGoods_03_2.."]".."today" )
		end
	end
end