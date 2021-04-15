function LuaS_buffnpc_begin()

	BeginPlot( OwnerID(), "LuaS_buffnpc_na", 0)

end

function LuaS_buffnpc_na()

	-- 2013.07.02 加入使用者是否為 GM 的檢查
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		DebugMsg( OwnerID() , 0 , "GM only" )
		return false
	end
	--

	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end

	local Time = 0 
	local Step = 0
	local DialogStatus = 0

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_01]" )   --NPC類型選擇表單
	AddBuff(OwnerID() , 501570,0,-1);
 		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_02]")  -- TP項目[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_03]") --EXP項目[1]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_04]") --DR項目[2]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_05]") --Debt項目[3]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_06]") --項目[4]

	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end

	while true do  	--選單開啟之後，執行迴圈
		sleep(10)
		Time = Time+1
	--	say( OwnerID() , Time)
	 	if Time > 30 then  -- 一分鐘無動作，關閉對話視窗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 )
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目
			if DialogStatus == -2  then -- 初始化
			
			elseif DialogStatus == -1  then--中斷
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break

			elseif DialogStatus == 0 then  --TP
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_TP" , 0 )
				DialogClose( OwnerID() )
				
			--	Say( OwnerID() , DialogStatus )			
				Step = 1			
			elseif DialogStatus == 1 then --EXP
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_EXP" , 0 )
				DialogClose( OwnerID() )
				Step = 1
			elseif DialogStatus == 2 then --掉寶率
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_DR", 0 )
				DialogClose( OwnerID() )
				Step = 1
			elseif DialogStatus == 3 then --除債
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_debt" , 0 )
				DialogClose( OwnerID())
				Step = 1
			elseif DialogStatus == 4 then --刪除NPC
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_DelNPC_01", 0 )
				DialogClose( OwnerID() )
				Step = 1
			end
		if Step == 1 then
			break
		end
	end
end  	--第一張選單結束

		

function LuaS_buffnpc_na_TP()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local Time = 0 
	local DialogStatus = 0
	local Step = 0 

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_08]" )   --TP數值比率選擇
	CancelBuff( OwnerID(), 501570 );--
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_09]" ) --項目[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_10]" ) --項目[1]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_11]" ) --項目[2]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]") --項目[3]
	
	if  ( DialogSendOpen( OwnerID() ) == false) then
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do
		sleep(10)
			Time = Time+1
		if Time>30 then
	--		say( OwnerID() , Time)
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_BUFFNPC_07]",0 )
			DialogClose( OwnerID())
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
	DialogStatus = DialogGetResult( OwnerID() )

		if DialogStatus == -2 then   --初始化 
		elseif DialogStatus == -1 then --中斷
		break

		elseif DialogStatus == 0 then --20%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() , "LuaS_TP_na_20" , 0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 1 then -- 50%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_TP_na_50" , 0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 2 then --100%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_TP_na_100" , 0 )
			DialogClose( OwnerID() )
			Step= 1
	
 		elseif DialogStatus == 3 then -- 回到上ㄧ頁
 			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_buffnpc_na" , 0 )
			DialogClose( OwnerID() )
			Step= 1 
		end
		if Step == 1 then
			break
		end
	end
end



function LuaS_buffnpc_na_EXP()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local Time = 0 
	local DialogStatus = 0
	local Step = 0 

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_13]" )   --EXP數值比率選擇
	CancelBuff( OwnerID(), 501570 );--
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_14]" ) --項目[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_15]" ) --項目[1]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_16]" ) --項目[2]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]") --項目[3]
	
	if  ( DialogSendOpen( OwnerID() ) == false) then
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do
		sleep(10)
			Time = Time+1
		if Time>30 then
	--		say( OwnerID() , Time)
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_BUFFNPC_07]",0 )
			DialogClose( OwnerID())
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
	DialogStatus = DialogGetResult( OwnerID() )

		if DialogStatus == -2 then   --初始化 
		elseif DialogStatus == -1 then --中斷
		break

		elseif DialogStatus == 0 then --20%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() , "LuaS_EXP_na_20",0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 1 then -- 50%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_EXP_na_50",0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 2 then --100%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_EXP_na_100",0 )
			DialogClose( OwnerID() )
			Step= 1
	
 		elseif DialogStatus == 3 then -- 回到上ㄧ頁
 			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_buffnpc_na",0 )
			DialogClose( OwnerID() )
			Step= 1
		end
		if Step == 1 then
			break
		end
	end
end



function LuaS_buffnpc_na_DR()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local Time = 0 
	local DialogStatus = 0
	local Step = 0 

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_17]" )   --DR數值比率選擇
	CancelBuff( OwnerID(), 501570 );--
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_18]" ) --項目[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_19]" ) --項目[1]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_20]" ) --項目[2]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]") --項目[3]
	
	if  ( DialogSendOpen( OwnerID() ) == false) then
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do
		sleep(10)
			Time = Time+1
		if Time>30 then
	--		say( OwnerID() , Time)
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_BUFFNPC_07]",0 )
			DialogClose( OwnerID())
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
	DialogStatus = DialogGetResult( OwnerID() )

		if DialogStatus == -2 then   --初始化 
		elseif DialogStatus == -1 then --中斷
		break

		elseif DialogStatus == 0 then --20%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() , "LuaS_DR_na_20",0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 1 then -- 50%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_DR_na_50",0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 2 then --100%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_DR_na_100",0 )
			DialogClose( OwnerID() )
			Step= 1
	
 		elseif DialogStatus == 3 then -- 回到上ㄧ頁
 			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_buffnpc_na",0 )
			DialogClose( OwnerID() )
			Step= 1
		end
		if Step == 1 then
			break
		end
	end
end



function LuaS_buffnpc_na_debt()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end
	local Time = 0 
	local DialogStatus = 0
	local Step = 0 	

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_21]" )   --EXP數值比率選擇
	CancelBuff( OwnerID(), 501570 );--
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_22]" ) --項目[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_23]" ) --項目[1]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]") --項目[2]
	
	if  ( DialogSendOpen( OwnerID() ) == false) then
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do
		sleep(10)
			Time = Time+1
		if Time>30  then
	--		say( OwnerID() , Time)
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_BUFFNPC_07]",0 )
			DialogClose( OwnerID())
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
	DialogStatus = DialogGetResult( OwnerID() )

		if DialogStatus == -2 then  --初始化 
		elseif DialogStatus == -1 then --中斷
		break

		elseif DialogStatus == 0 then --一定數量
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() , "LuaS_debt_na_part",0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 1 then -- 全部
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_debt_na_all",0 )
			DialogClose( OwnerID() )
			Step= 1
	
 		elseif DialogStatus == 2 then -- 回到上ㄧ頁
 			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_buffnpc_na",0 )
			DialogClose( OwnerID() )
			Step= 1
		end
		if Step == 1 then
			break
		end
	end
end


function LuaS_TP_na_20( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115554  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 101 )
	AddToPartition( NPC , RoomID) -- 建立物件

end


function LuaS_TP_na_50( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115554  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 102 )
	AddToPartition( NPC , RoomID) -- 建立物件

end


function LuaS_TP_na_100( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115554  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 103 )
	AddToPartition( NPC , RoomID) -- 建立物件

end


function LuaS_EXP_na_20( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115555  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 201 )
	AddToPartition( NPC , RoomID) -- 建立物件

end


function LuaS_EXP_na_50( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115555  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 202 )
	AddToPartition( NPC , RoomID) -- 建立物件

end


function LuaS_EXP_na_100( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115555  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 203 )
	AddToPartition( NPC , RoomID) -- 建立物件

end


function LuaS_DR_na_20( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115556  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 301 )
	AddToPartition( NPC , RoomID) -- 建立物件

end


function LuaS_DR_na_50( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115556  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 302 )
	AddToPartition( NPC , RoomID) -- 建立物件

end


function LuaS_DR_na_100( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115556  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 303 )
	AddToPartition( NPC , RoomID) -- 建立物件

end


function LuaS_debt_na_part( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115557  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 401 )
	AddToPartition( NPC , RoomID) -- 建立物件

end


function LuaS_debt_na_all( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115557  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	WriteRoleValue( NPC , EM_RoleValue_PID , 402 )
	AddToPartition( NPC , RoomID) -- 建立物件

end