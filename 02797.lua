--=============宣傳NPC=============--
function BG_AA_NPC_Introduction_0()
	local player = OwnerID()
	SetSpeakDetail(player,"[BG_AA_NOTE_1]")
	AddSpeakOption(player,player,"[BG_AA_NOTE_0]","BG_AA_NPC_Introduction_1",0)
end

function BG_AA_NPC_Introduction_1()
	local player = OwnerID()
	SetSpeakDetail(player,"[BG_AA_NOTE_2]")
	AddSpeakOption(player,player,"[BG_AA_NOTE_0]","BG_AA_NPC_Introduction_2",0)
	AddSpeakOption(player,player,"[SO_BACK]","BG_AA_NPC_Introduction_0",0)
end

function BG_AA_NPC_Introduction_2()
	local player = OwnerID()
	SetSpeakDetail(player,"[BG_AA_NOTE_3]")
	AddSpeakOption(player,player,"[SO_BACK]","BG_AA_NPC_Introduction_1",0)
end

function LuaQ_GEMTEST_REWARD(Num)
	local player = OwnerID()
	local reward = ReadRoleValue(player,EM_RoleValue_DuelistReward)	-- 讀取玩家持有的勇士勳章總量
--	addRoleValue(player,EM_RoleValue_DuelistReward,(reward+Num))
	AddSpeicalCoin( Player , 11 , 14 , Num )	-- 給予勇士勳章 2014.04.29  調整為會回傳 Log 的函式
	DebugMsg( Player , "Reward = "..Num )
end

--=============台版營運需求 - 勇士勳章蒐集者商店=============--
function YoYo_CallDRShop_0()	--使用道具劇情
	Beginplot( OwnerID() ,"YoYo_CallDRShop_1", 0 )
end

function YoYo_CallDRShop_1()	--對話視窗劇情
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
 	DialogSelectStr( Player , "[SC_DRSHOP_02]")	-- 召喚勇士勳章商人
	DialogSelectStr( Player , "[SC_DRSHOP_03]")	--刪除勇士勳章商人

	if ( DialogSendOpen( Player ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Player , Player , 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do  	--選單開啟之後，執行迴圈
	sleep(10)
		Time = Time + 1
		--say( Player , Time)
	 	if Time > 30 then	--30秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "[SC_DRSHOP_04]" , 0 )
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
			Beginplot( Player , "YoYo_CallDRShop_2" , 0 )
			DialogClose( Player )
			Step = 1
		
		elseif DialogStatus == 1 then --刪除「勇士勳章蒐集者」
			CancelBuff( Player , 501570 )	--關閉對話檢查Buff
			Beginplot( Player , "YoYo_CallDRShop_3" , 0 )
			DialogClose( Player )
			Step = 1
		end
		if Step == 1 then
			break
		end
	end
end

function YoYo_CallDRShop_2()	--召喚「勇士勳章蒐集者」劇情
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role : new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
	local BaseX = Obj : X()
 	local BaseY = Obj : Y()
 	local BaseZ = Obj : Z()
	local BaseDir = Obj : Dir()
	local NPC = CreateObj(  112263  , BaseX, BaseY, BaseZ, BaseDir, 1 )	--在玩家座標 X.Y.Z.Dir 身上準備創立「勇士勳章蒐集者」
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

function YoYo_CallDRShop_3()	--刪除「勇士勳章蒐集者」劇情

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	--確認伺服器的分流
	local Count = SetSearchAllNPC( RoomID )	--尋找分流內所有的NPC
	local NPC

	if  Count ~= 0 then
		for i = 1 , Count , 1 do	--設定搜尋所有NPC次數的迴圈
			local ObjID = GetSearchResult() --取得搜尋NPC的結果
			NPC = Role : New( ObjID )
			
			if NPC : IsNPC() == true then
			local GUID = ReadRoleValue(  ObjID , EM_RoleValue_OrgID )	--確認所有NPC的編號
				if GUID == 112263  then  --若是為特定NPC
				DelObj( ObjID ) 
				end
			end
		end
	end
end

function YoYo_ShopNPC112263()	--與「勇士勳章蒐集者」對話劇情
	local NPC = OwnerID()
	local Player = TargetID()
	SetSpeakDetail( NPC , "[SC_DRSHOP_05]" )
	AddSpeakOption( NPC , Player , "[SC_DRSHOP_06]" , "YoYo_ShopNPC112263_Shop1" , 5 )	--商店對話選項
end

function YoYo_ShopNPC112263_Shop1()	--開啟勇士勳章商店劇情
	SetShop( TargetID() , 600185 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() )	--關閉對話視窗
	OpenShop()
end
