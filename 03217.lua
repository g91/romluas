--=============台版營運需求 - 英勇之證勳章蒐集者商店=============--
function Lua_na_CallPVShop()	--使用道具劇情
	Beginplot( OwnerID() ,"Lua_na_CallPVShop_OPEN", 0 )
end

function Lua_na_CallPVShop_OPEN()	--對話視窗劇情
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
	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_DRSHOP_01]" )   --NPC類型選擇表單
	AddBuff( Player , 501570,0,-1)	--給予對話檢查Buff
 	DialogSelectStr( Player , "[SC_PVSHOP_01]")	-- 召喚英勇之證商人
	DialogSelectStr( Player , "[SC_PVSHOP_02]")	--刪除英勇之證商人

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
		
		elseif DialogStatus == 0 then  --召喚「勇士勳章蒐集者」
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			Beginplot( Player , "Lua_na_CreatePVShop" , 0 )
			DialogClose( Player )
			Step = 1
		
		elseif DialogStatus == 1 then --刪除「勇士勳章蒐集者」
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			Beginplot( Player , "Lua_na_DelPVShop" , 0 )
			DialogClose( Player )
			Step = 1
		end
		if Step == 1 then
			break
		end
	end
end

function Lua_na_CreatePVShop()	--召喚「英勇之證商人」劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role : new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj : X()
 	local BaseY = Obj : Y()
 	local BaseZ = Obj : Z()
	local BaseDir = Obj : Dir()
	local NPC = CreateObj(  124122  , BaseX, BaseY, BaseZ, BaseDir, 1 )	--在玩家座標 X.Y.Z.Dir 身上準備創立「英勇之證商人」
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

function Lua_na_DelPVShop()	--刪除「英勇之證商人」劇情

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	--確認伺服器的分流
	local Count = SetSearchAllNPC( RoomID )	--尋找分流內所有的NPC
	local NPC

	if  Count ~= 0 then
		for i = 1 , Count , 1 do	--設定搜尋所有NPC次數的迴圈
			local ObjID = GetSearchResult() --取得搜尋NPC的結果
			NPC = Role : New( ObjID )
			
			if NPC : IsNPC() == true then
			local GUID = ReadRoleValue(  ObjID , EM_RoleValue_OrgID )	--確認所有NPC的編號
				if GUID == 124122  then  --若是為特定NPC
				DelObj( ObjID ) 
				end
			end
		end
	end
end

function Lua_na_124122()	--與「英勇之證商人」對話劇情
	local Owner = OwnerID()
	local Target = TargetID()
	if CheckAcceptQuest( Owner, 425709 ) == true then
		SetSpeakDetail( Owner , "[SC_PVSHOP_SPEAK]" )
		AddSpeakOption( Owner , Owner, "[SC_PVSHOP_03]" , "lua_na_124122_Shop" , 5 )	--商店對話選項
	else
		SetSpeakDetail( Owner , "[SC_PVSHOP_SPEAK1]" )
	end
end

function Lua_na_124122_Shop()	--開啟英勇之證商店劇情
	SetShop( TargetID() , 600477 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end