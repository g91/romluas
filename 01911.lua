-- 已開放 --
-- 每日物品
-- 交換物品
-- 晶鑽、金幣兌換

-- 未開放 --
-- 蒐集物品
-- 打怪蒐集物品
-- 每日魔法
-- 每日物品，持續領取會越來越好的類型
-- 每日物品，依照天數不同，送出的禮物也不同( Day1 、Day2、Day3、Day4、Day5、Day6、Day7 )
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_SOP_CHECK()

	local Owner = OwnerID();
	local Obj = Role:new( Owner )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )	-- 判斷Zone與分流
	--local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	--local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )

	if ZoneID> 0 and  ZoneID< 100 and Obj:RoomID() == 0 then
		return true
	else
		ScriptMessage( Owner, Owner, 1 , "[SC_CANTHOME]" , 0 )	--你不能在此使用。
		ScriptMessage( Owner, Owner, 0 , "[SC_CANTHOME]" , 0 )	--你不能在此使用。
		return false
	end
end

function Lua_Hao_Item_SOP_00()

	BeginPlot( OwnerID() , "Lua_Hao_Item_SOP_01" , 0 )
end

function Lua_Hao_Item_SOP_01()

	local Owner = OwnerID();

	if CheckBuff( Owner, 501570 ) == true then 
		ScriptMessage( Owner, Owner, 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	local Menu = {}	
	Menu[1]={ "[SC_ITEM_SOP_20]" }	--每日物品
	Menu[2]={ "[SC_ITEM_SOP_21]" }	--以物換物
	Menu[3]={ "[SC_ITEM_SOP_22]" }	--遊戲幣與晶鑽交易
	Menu[4]={ "[SC_ITEM_SOP_227]" }	--建立彈性物品互換Npc
	Menu[5]={ "[SC_ITEM_SOP_228]" }	--建立彈性貨幣互換Npc
	Menu[6]={ "[SC_BUFFNPC_06]" }	--刪除NPC
	Menu[7]={ "[SO_EXIT]"}			--離開選單

	DialogCreate( Owner, EM_LuaDialogType_Select , "[SC_ITEM_SOP_0]" )   --NPC類型選擇表單 請選擇活動內容
	AddBuff( Owner, 501570,0,-1);
	
	for i = 1 , table.getn(Menu) , 1 do
 		DialogSelectStr( Owner, Menu[i][1] ) 	--每日物品
	end

	if ( DialogSendOpen( Owner ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Owner, Owner, 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(5)
		Time = Time+1
	 	if Time > 60 then  -- 30秒無動作，關閉對話視窗
			ScriptMessage( Owner, Owner, 0 , "[SC_BUFFNPC_07]" , 0 ) -- 閒置超過30秒,自動關閉視窗。
			DialogClose( Owner )
			CancelBuff( Owner, 501570 );--
			break
		end
		
		DialogStatus = DialogGetResult( Owner)  --檢查使用者選取的項目
			if DialogStatus == -2  then -- 初始化
			
			elseif DialogStatus == -1  then--中斷
				Step = 1
			elseif DialogStatus == 0 then  -- 每日物品
				Beginplot( Owner, "Lua_Hao_Sop_Daily_Articles_Menu" , 0 )
				Step = 1			
			elseif DialogStatus == 1 then -- 以物換物
				Beginplot( Owner, "Lua_Hao_Sop_Barter_Menu" , 0 )
				Step = 1
			elseif DialogStatus == 2 then --遊戲幣與晶鑽交易
				Beginplot( Owner, "Lua_Hao_Sop_MandD_Trade_Menu" , 0 )
				Step = 1
			elseif DialogStatus == 3 then	-- 彈性兌換物品
				CallPlot( Owner, "Lua_Hao_Sop_CreateNPC", 124148 );
				Step = 1
			elseif DialogStatus == 4 then	-- 彈性兌換貨幣
				CallPlot( Owner, "Lua_Hao_Sop_CreateNPC", 124149 );
				Step = 1
			elseif DialogStatus == 5 then -- 刪除NPC
				Beginplot( Owner, "Lua_Hao_Sop_Del_NPC" , 0 )
				Step = 1
			elseif DialogStatus == 6 then -- 離開選單
				Step = 1
			end
		if Step == 1 then
			CancelBuff( Owner, 501570 );
			DialogClose( Owner)
			break
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_Menu( )	-- 每日物品贈送選單
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	local Menu = {}

	Menu[1]={ "[SC_ITEM_SOP_30]" }	--每日贈送1個物品 方案1
	Menu[2]={ "[SC_ITEM_SOP_31]" }	--每日贈送1個物品 方案2
	Menu[3]={ "[SC_ITEM_SOP_32]" }	--每日同時贈送2個物品
	Menu[4]={ "[SC_ITEM_SOP_33]" }	--每日同時贈送3個物品
	Menu[5]={ "[SO_BACK]"}		--回到上一頁
	Menu[6]={ "[SO_EXIT]"}		--離開選單

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_ITEM_SOP_0]" )   --NPC類型選擇表單
	AddBuff(OwnerID() , 501570,0,-1);

	for i = 1 , table.getn(Menu) , 1 do
 		DialogSelectStr( OwnerID() , Menu[i][1] ) 	--每日物品
	end

	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(5)
		Time = Time+1
	 	if Time > 60 then  -- 30秒無動作，關閉對話視窗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- 閒置超過30秒,自動關閉視窗。
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			break
		end
	
		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目

		if DialogStatus == -2  then -- 初始化
		
		elseif DialogStatus == -1  then--中斷
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 0 then --每日送1個物品A
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Daily_Articles_1" , 0 )
			DialogClose( OwnerID() )
			Step = 1			
		elseif DialogStatus == 1 then --每日送1個物品B
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Daily_Articles_2" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 2 then --每日送2個物品
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Daily_Articles_3" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 3 then --每日送3個物品
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Daily_Articles_4" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 4 then --回到上一頁
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Item_SOP_00" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 5 then --離開選單
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		end

		if Step == 1 then
			break
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_Menu()	-- 以物換物選單
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	
	local Time , Step , DialogStatus = 0 , 0 , 0
	local Menu = {}
--	行不通，物品選單有字數或連結上限
	-- 以A換取B 方案1
--	local ID_1 = GetDBKeyValue("ExItemID_00")		-- 付出的物品A_ID
--	local Count_1 = GetDBKeyValue("ExItemAmount_00")	-- 付出的物品A_數量
--	local RID_1 = GetDBKeyValue("ExReturnGoods_00")	-- 得到的物品B_ID
--	local RCount_1 = GetDBKeyValue("ExReturnAmount_00")	-- 得到的物品B_數量
--	-- 以A換取B 方案2
--	local ID_2 = GetDBKeyValue("ExItemID_01")		-- 付出的物品A_ID
--	local Count_2 = GetDBKeyValue("ExItemAmount_01")	-- 付出的物品A_數量
--	local RID_2 = GetDBKeyValue("ExReturnGoods_01")	-- 得到的物品B_ID
--	local RCount_2 = GetDBKeyValue("ExReturnAmount_01")	-- 得到的物品B_數量
--	-- 以A換取B、C
--	local ID_3 = GetDBKeyValue("ExItemID_02")			-- 付出的物品A_ID
--	local Count_3 = GetDBKeyValue("ExItemAmount_02")		-- 付出的物品A_數量
--	local RID_3_0 = GetDBKeyValue("ExReturnGoods_02")		-- 得到的物品B_ID
--	local RCount_3_0 = GetDBKeyValue("ExReturnAmount_02")	-- 得到的物品B_數量
--	local RID_3_1 = GetDBKeyValue("ExReturnGoods_02_1")		-- 得到的物品C_ID
--	local RCount_3_1 = GetDBKeyValue("ExReturnAmount_02_1")	-- 得到的物品C_數量
--	-- 以A換取B、C、D
--	local ID_4 = GetDBKeyValue("ExItemID_03")			-- 付出的物品A_ID
--	local Count_4 = GetDBKeyValue("ExItemAmount_03")		-- 付出的物品A_數量
--	local RID_4_0 = GetDBKeyValue("ExReturnGoods_03")		-- 得到的物品B_ID
--	local RCount_4_0 = GetDBKeyValue("ExReturnAmount_03")	-- 得到的物品B_數量
--	local RID_4_1 = GetDBKeyValue("ExReturnGoods_03_1")		-- 得到的物品C_ID
--	local RCount_4_1 = GetDBKeyValue("ExReturnAmount_03_1")	-- 得到的物品C_數量
--	local RID_4_2 = GetDBKeyValue("ExReturnGoods_03_2")		-- 得到的物品D_ID
--	local RCount_4_2 = GetDBKeyValue("ExReturnAmount_03_2")	-- 得到的物品D_數量
--
--	Menu[1]={ "[SC_ITEM_SOP_50][$SETVAR1="..Count_1.."][$SETVAR2=".."["..ID_1.."]".."][$SETVAR3="..RCount_1.."][$SETVAR4=".."["..RID_1.."]".."]" }
--	--以<CM>[$VAR2]</CM>x<CY>[$VAR1]</CY>兌換<CM>[$VAR4]</CM>x<CY>[$VAR3]</CY>。
--	Menu[2]={ "[SC_ITEM_SOP_50][$SETVAR1="..Count_2.."][$SETVAR2=".."["..ID_2.."]".."][$SETVAR3="..RCount_2.."][$SETVAR4=".."["..RID_2.."]".."]" }
--	--以<CY>[$VAR1]</CY> x <CM>[$VAR2]</CM>兌換<CY>[$VAR3]</CY> x <CM>[$VAR4]</CM>。
--	Menu[3]={ "[SC_ITEM_SOP_51][$SETVAR1="..Count_3.."][$SETVAR2=".."["..ID_3.."]".."][$SETVAR3="..RCount_3_0.."][$SETVAR4=".."["..RID_3_0.."]".."][$SETVAR5="..RCount_3_1.."][$SETVAR6=".."["..RID_3_1.."]".."]" }
--	--以<CY>[$VAR1]</CY> x <CM>[$VAR2]</CM>兌換<CY>[$VAR3]</CY> x <CM>[$VAR4]</CM>、<CY>[$VAR5]</CY> x <CM>[$VAR6]</CM>。
--	Menu[4]={ "[SC_ITEM_SOP_52][$SETVAR1="..Count_4.."][$SETVAR2=".."["..ID_4.."]".."][$SETVAR3="..RCount_4_0.."][$SETVAR4=".."["..RID_4_0.."]".."][$SETVAR5="..RCount_4_1.."][$SETVAR6=".."["..RID_4_1.."]".."][$SETVAR7="..RCount_4_2.."][$SETVAR8=".."["..RID_4_2.."]".."]" }
--	--以<CY>[$VAR1]</CY> x <CM>[$VAR2]</CM>兌換<CY>[$VAR3]</CY> x <CM>[$VAR4]</CM>、<CY>[$VAR5]</CY> x <CM>[$VAR6]</CM>、<CY>[$VAR7]</CY> x <CM>[$VAR8]</CM>。
	Menu[1]={ "[SC_ITEM_SOP_50]" }	--以A換取B(方案1)
	Menu[2]={ "[SC_ITEM_SOP_51]" }	--以A換取B(方案2)
	Menu[3]={ "[SC_ITEM_SOP_52]" }	--以A換取B、C
	Menu[4]={ "[SC_ITEM_SOP_53]" }	--以A換取B、C、D
	Menu[5]={ "[SO_BACK]"}		--回到上一頁
	Menu[6]={ "[SO_EXIT]"}		--離開選單

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_ITEM_SOP_0]" )   --NPC類型選擇表單
	AddBuff(OwnerID() , 501570,0,-1);

	for i = 1 , table.getn(Menu) , 1 do
 		DialogSelectStr( OwnerID() , Menu[i][1] ) 	-- 以物換物
	end

	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(5)
		Time = Time+1
	 	if Time > 60 then  -- 30秒無動作，關閉對話視窗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- 閒置超過30秒,自動關閉視窗。
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
	
		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目

		if DialogStatus == -2  then -- 初始化
		
		elseif DialogStatus == -1  then--中斷
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 0 then --以A換取B 方案1
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Barter_1" , 0 )
			DialogClose( OwnerID() )
			Step = 1			
		elseif DialogStatus == 1 then --以A換取B 方案2
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Barter_2" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 2 then --以A換取B、C
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Barter_3" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 3 then --以A換取B、C、D
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Barter_4" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 4 then --回到上一頁
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Item_SOP_00" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 5 then --離開選單
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		end

		if Step == 1 then
			break
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Menu( )	-- 金幣、晶鑽兌換選單
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	local Menu = {}

	Menu[1]={ "[SC_ITEM_SOP_40]" }	--以金錢換取晶鑽
	Menu[2]={ "[SC_ITEM_SOP_41]" }	--以晶鑽換取金錢
	Menu[3]={ "[SC_ITEM_SOP_42]"}	--開放目標NPC的兌換服務
	Menu[4]={ "[SC_ITEM_SOP_43]"}	--關閉目標NPC的兌換服務
	Menu[5]={ "[SO_BACK]"}		--回到上一頁
	Menu[6]={ "[SO_EXIT]"}		--離開選單

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_ITEM_SOP_0]" )   --NPC類型選擇表單
	AddBuff(OwnerID() , 501570,0,-1);

	for i = 1 , table.getn(Menu) , 1 do
 		DialogSelectStr( OwnerID() , Menu[i][1] ) 	--每日物品
	end

	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(5)
		Time = Time+1
	 	if Time > 60 then  -- 30秒無動作，關閉對話視窗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- 閒置超過30秒,自動關閉視窗。
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
	
		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目

		if DialogStatus == -2  then -- 初始化
		
		elseif DialogStatus == -1  then--中斷
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 0 then --金錢換取晶鑽
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_MandD_Trade_1" , 0 )
			DialogClose( OwnerID() )
			Step = 1			
		elseif DialogStatus == 1 then --晶鑽換取金錢
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_MandD_Trade_2" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 2 then --開放該Zone NPC兌換服務
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_MandD_Trade_Open" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 3 then --關閉該Zone NPC兌換服務
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_MandD_Trade_Close" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 4 then --回到上一頁
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Item_SOP_00" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 5 then --離開選單
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		end

		if Step == 1 then
			break
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_1( )		 --每日送1個物品A		

	Lua_Hao_Sop_CreateNPC( 115808  )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_2( )		 --每日送1個物品B	

	Lua_Hao_Sop_CreateNPC( 115809 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_3( )		 --每日送2個物品	

	Lua_Hao_Sop_CreateNPC( 115810 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_4( )		 --每日送3個物品	

	Lua_Hao_Sop_CreateNPC( 115811 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_1()			-- 以A換B 方案一

	Lua_Hao_Sop_CreateNPC( 115812 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_2()			-- 以A換B 方案二

	Lua_Hao_Sop_CreateNPC( 115817 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_3()			-- 以A換B、C

	Lua_Hao_Sop_CreateNPC( 115825 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_4()			-- 以A換B、C、D

	Lua_Hao_Sop_CreateNPC( 116067 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_1( )		--隨機建立NPC 遊戲幣交換為晶鑽

	local Pass = GetDBKeyValue("Pass_00")	-- 是否可交易限制
	Lua_Hao_Sop_CreateNPC( 115813 , 1 )
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )	-- 讓玩家記起NPC
	WriteRoleValue( NPC , EM_RoleValue_PID , Pass )			-- 將交意開關寫入NPC
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )		-- 將玩家 Reg +9 值清空
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_2( )		--隨機建立NPC 晶鑽交換為遊戲幣

	local Pass = GetDBKeyValue("Pass_01")	-- 是否可交易限制
	Lua_Hao_Sop_CreateNPC( 115814 , 1 )
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )	-- 讓玩家記起NPC
	WriteRoleValue( NPC , EM_RoleValue_PID , Pass )			-- 將交易開關寫入NPC
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )		-- 將玩家 Reg+9 值清空
end

function Lua_Hao_Sop_CreateNPC(QNPC , Step)	-- 於 Owner 地點建立 QNPC

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj : X()
 	local BaseY = Obj : Y()
 	local BaseZ = Obj : Z()
	local BaseDir = Obj : Dir()
	local NPC = CreateObj( QNPC , BaseX , BaseY , BaseZ , BaseDir , 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC , EM_SetModeType_Strikback , false )--反擊
	SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
	SetModeEx( NPC , EM_SetModeType_Obstruct , false )--阻擋
	SetModeEx( NPC , EM_SetModeType_Mark , true )--標記
	SetModeEx( NPC , EM_SetModeType_Move , false )--移動
	SetModeEx( NPC , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( NPC , EM_SetModeType_HideName , false )--名稱
	SetModeEx( NPC , EM_SetModeType_ShowRoleHead , true )--頭像框
	SetModeEx( NPC , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC , EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC , EM_SetModeType_Show , true )--顯示
	AddBuff( NPC , 503217 , 0 , -1 )
	AddToPartition( NPC , RoomID ) -- 建立物件
	if Step == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , NPC )	-- 為了寫入開關
	else
	--	Say( OwnerID() , "0" )
	end
end

function Lua_Hao_Sop_Reset_WorldVar() -- 重置世界變數

	local Weektrade_00 = GetDBKeyValue("Weektrade_00")	--金幣兌換晶鑽
	local Weektrade_01 = GetDBKeyValue("Weektrade_01")	--晶鑽兌換金幣
	AddBuff( TargetID() , 503217 , 0 , -1 )
	SetWorldVar( "SC_ITEM_SOP_100" , Weektrade_00+100 )
	SetWorldVar( "SC_ITEM_SOP_101" , Weektrade_01+100 )
--	SetWorldVar( "SC_ITEM_SOP_100" , Value )
--	SetWorldVar( "SC_ITEM_SOP_101" , Value )
end

function Lua_Hao_Sop_Reset_WorldVar2() -- 讀取世界變數

	local Gold = GetWorldVar( "SC_ITEM_SOP_100" )	-- 金幣兌換晶鑽
	local Diamond = GetWorldVar( "SC_ITEM_SOP_101" )	-- 晶鑽兌換金幣

	DebugMsg( OwnerID() , 1 , "Money to Diamond = "..Gold )
	DebugMsg( OwnerID() , 1 , "Diamond to Money = "..Diamond )
end

function Lua_Hao_Sop_Set_WorldVar( Value )

	SetWorldVar( "SC_ITEM_SOP_100" , Value )
	SetWorldVar( "SC_ITEM_SOP_101" , Value )

	local Gold = GetWorldVar( "SC_ITEM_SOP_100" )	-- 金幣兌換晶鑽
	local Diamond = GetWorldVar( "SC_ITEM_SOP_101" )	-- 晶鑽兌換金幣

	DebugMsg( OwnerID() , 1 , "Money to Diamond = "..Gold )
	DebugMsg( OwnerID() , 1 , "Diamond to Money = "..Diamond )
end