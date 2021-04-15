--=============台版營運需求 - 經驗球============--
function Lua_na_209977_EXPTP()	--使用道具劇情
	Beginplot( OwnerID() ,"Lua_na_209977_EXPTP_OPEN", 0 )
end

function Lua_na_209977_EXPTP_OPEN()	--對話視窗劇情
	local Player = OwnerID()
	-- 檢查使用者是否為 GM
	if ReadRoleValue( Player , EM_RoleValue_VOC ) ~= 0 then
		DebugMsg( Player , 0 , "GM only" )
		return false
	end

	if CheckBuff( Player , 501570) == true then 
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 )	--視窗已經打開了
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_DRSHOP_01]" )   --選擇要執行的動作
	AddBuff( Player , 501570,0,-1)	--給予對話檢查Buff
 	DialogSelectStr( Player , "[SC_SELL_EXP]")	-- 召喚經驗球商人
	DialogSelectStr( Player , "[SC_SELL_TP]")	-- 召喚TP經驗球商人

	if ( DialogSendOpen( Player ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Player , Player , 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do  	--選單開啟之後，執行迴圈
	sleep(10)
		Time = Time + 1
		--say( Player , Time)
	 	if Time > 30 then	--30秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "[SC_DRSHOP_04]" , 0 ) --閒置30秒，關閉視窗
			DialogClose( Player )
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			break
		end
	
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
		if DialogStatus == -2  then	--初始化
		
		elseif DialogStatus == -1  then	--中斷
			DialogClose( Player )
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			break
		
		elseif DialogStatus == 0 then  --召喚EXP商人
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			Beginplot( Player , "Lua_na_EXP_SELLNPC" , 0 )
			DialogClose( Player )
			Step = 1
		
		elseif DialogStatus == 1 then --召喚TP商人
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			Beginplot( Player , "Lua_na_TP_SELLNPC" , 0 )
			DialogClose( Player )
			Step = 1
		end	
		if Step == 1 then
			break
		end
	end
end


--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- 經驗值NPC選單
function Lua_na_EXP_SELLNPC()
	local Player = OwnerID()
	-- 檢查使用者是否為 GM
	if CheckBuff( Player , 501570) == true then 
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 )	--視窗已經打開了
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_SELL_TYPE_EXP]" )   --準備召喚經驗球商人，請選擇收取的幣值。
	AddBuff( Player , 501570,0,-1)	--給予對話檢查Buff
 	DialogSelectStr( Player , "[SC_SELL_TYPE1]")	-- 必爾汀代幣
	DialogSelectStr( Player , "[SC_SELL_TYPE2]")	-- 必爾汀圓貝
	DialogSelectStr( Player , "[SC_SELL_TYPE3]")	-- 正義能量
	DialogSelectStr( Player , "[SC_SELL_TYPE4]")	-- 夢境先遣印記
	DialogSelectStr( Player , "[SC_SELL_TYPE5]")	-- 古代遺物

	if ( DialogSendOpen( Player ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Player , Player , 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do  	--選單開啟之後，執行迴圈
	sleep(10)
		Time = Time + 1
		--say( Player , Time)
	 	if Time > 30 then	--30秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "[SC_DRSHOP_04]" , 0 ) --閒置30秒，關閉視窗
			DialogClose( Player )
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			break
		end
	
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
		if DialogStatus == -2  then	--初始化
		
		elseif DialogStatus == -1  then	--中斷
			DialogClose( Player )
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			break
		
		elseif DialogStatus == 0 then  --必爾汀代幣 [203038]
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			CallPlot ( Player , "Lua_na_EXP_SELLNPC_Create" , 1)
			DialogClose( Player )
			Step = 1
		
		elseif DialogStatus == 1 then --必爾汀圓貝 [240181]
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			CallPlot ( Player , "Lua_na_EXP_SELLNPC_Create" , 2)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 2 then --正義能量 [201545]
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			CallPlot ( Player , "Lua_na_EXP_SELLNPC_Create" , 3)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 3 then --夢境先遣印記 [208681]
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			CallPlot ( Player , "Lua_na_EXP_SELLNPC_Create" , 4)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 4 then --古代遺物 [242376]
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			CallPlot ( Player , "Lua_na_EXP_SELLNPC_Create" , 5)
			DialogClose( Player )
			Step = 1
		end
	
		if Step == 1 then
			break
		end
	end
end


function Lua_na_EXP_SELLNPC_Create(num)	--召喚經驗球NPC劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Type = {	[1] =	124132,
			[2] =	124133,
			[3] =	124134,
			[4] =	124135,
			[5] = 	124136	}

	local Obj = Role : new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj : X()
 	local BaseY = Obj : Y()
 	local BaseZ = Obj : Z()
	local BaseDir = Obj : Dir()
	local NPC = CreateObj( Type[num]  , BaseX, BaseY, BaseZ, BaseDir, 1 )	--在玩家座標 X.Y.Z.Dir 身上準備創立經驗球NPC
	SetModeEx( NPC, EM_SetModeType_Strikback, false )	--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )	--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )	--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )	--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )	--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )	--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )	--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )	--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )	--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )	--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
end


--↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
-- TP經驗值NPC選單
function Lua_na_TP_SELLNPC()
	local Player = OwnerID()
	-- 檢查使用者是否為 GM
	if CheckBuff( Player , 501570) == true then 
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 )	--視窗已經打開了
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_SELL_TYPE_TP]" )   --準備召喚經驗球商人，請選擇收取的幣值。
	AddBuff( Player , 501570,0,-1)	--給予對話檢查Buff
 	DialogSelectStr( Player , "[SC_SELL_TYPE1]")	-- 必爾汀代幣
	DialogSelectStr( Player , "[SC_SELL_TYPE2]")	-- 必爾汀圓貝
	DialogSelectStr( Player , "[SC_SELL_TYPE3]")	-- 正義能量
	DialogSelectStr( Player , "[SC_SELL_TYPE4]")	-- 夢境先遣印記
	DialogSelectStr( Player , "[SC_SELL_TYPE5]")	-- 古代遺物

	if ( DialogSendOpen( Player ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Player , Player , 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do  	--選單開啟之後，執行迴圈
	sleep(10)
		Time = Time + 1
		--say( Player , Time)
	 	if Time > 30 then	--30秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "[SC_DRSHOP_04]" , 0 ) --閒置30秒，關閉視窗
			DialogClose( Player )
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			break
		end
	
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
		if DialogStatus == -2  then	--初始化
		
		elseif DialogStatus == -1  then	--中斷
			DialogClose( Player )
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			break
		
		elseif DialogStatus == 0 then  --必爾汀代幣 [203038]
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			CallPlot ( Player , "Lua_na_TP_SELLNPC_Create" , 1)
			DialogClose( Player )
			Step = 1
		
		elseif DialogStatus == 1 then --必爾汀圓貝 [240181]
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			CallPlot ( Player , "Lua_na_TP_SELLNPC_Create" , 2)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 2 then --正義能量 [201545]
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			CallPlot ( Player , "Lua_na_TP_SELLNPC_Create" , 3)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 3 then --夢境先遣印記 [208681]
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			CallPlot ( Player , "Lua_na_TP_SELLNPC_Create" , 4)
			DialogClose( Player )
			Step = 1
		elseif DialogStatus == 4 then --古代遺物 [242376]
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			CallPlot ( Player , "Lua_na_TP_SELLNPC_Create" , 5)
			DialogClose( Player )
			Step = 1
		end
		if Step == 1 then
			break
		end
	end
end



function Lua_na_TP_SELLNPC_Create(num)	--召喚經驗球NPC劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Type = {	[1] =	124137,
			[2] =	124138,
			[3] =	124139,
			[4] =	124140,
			[5] = 	124141	}

	local Obj = Role : new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj : X()
 	local BaseY = Obj : Y()
 	local BaseZ = Obj : Z()
	local BaseDir = Obj : Dir()
	local NPC = CreateObj( Type[num]  , BaseX, BaseY, BaseZ, BaseDir, 1 )	--在玩家座標 X.Y.Z.Dir 身上準備創立經驗球NPC
	SetModeEx( NPC, EM_SetModeType_Strikback, false )	--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )	--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )	--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )	--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )	--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, false )	--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )	--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )	--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )	--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )	--顯示
	AddToPartition( NPC , RoomID) -- 建立物件
end



function Lua_na_EXPTP_NPCSPEAK(type)
	local Owner = OwnerID()
	local Target = TargetID()
	local Job = ReadRoleValue( Owner , EM_RoleValue_VOC)
	WriteRoleValue( Target , EM_RoleValue_PID, type)
	if type <= 5 then	
		SetSpeakDetail( Owner , "[SC_SELL_EXPTP_NPC1]")  --對話
	else
		SetSpeakDetail( Owner , "[SC_SELL_EXPTP_NPC2]")  --對話
	end
	AddSpeakOption( Owner , Owner, "[SO_110439_0]" , "Lua_na_EXPTP_NPCSPEAK2" , 5 )	--商店對話選項
	if Job == 0 then
		AddSpeakOption( Owner ,Owner , "[SC_BUFFNPC_06]" , "Lua_na_EXPTP_NPCDel" , 0)  --刪除NPC
	end
end


function Lua_na_EXPTP_NPCSPEAK2()	--開啟商店劇情
	local Target = TargetID()
	local PID = ReadRoleValue( Target , EM_RoleValue_PID)	
	local Shop =  {	[1] = 600587,
			[2] = 600588,
			[3] = 600589,
			[4] = 600590,
			[5] = 600591,
			[6] = 600592,
			[7] = 600593,
			[8] = 600594,
			[9] = 600595,	
			[10] = 600596	}   --NPC對應的商店 EXP*5 / TP*5
	SetShop( Target , SHOP[PID] , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end


function Lua_na_EXPTP_NPCDel()
	CloseSpeak( OwnerID())
	DelObj( TargetID())
end