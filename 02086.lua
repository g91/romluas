--後台任務npc召喚書
--2010.12.20

function Lua_mika_QTool_create_00()  --使用物品後執行的劇情
	Beginplot( OwnerID() ,"Lua_mika_QTool_create_01", 0 )
end

function Lua_mika_QTool_create_01()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end

	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_SPQUESTSET_SELECT_1]" }   --建置打怪收集物品任務NPC-[116662]
	TransferSelect[1] = { "[SC_SPQUESTSET_SELECT_2]"  }  --建置送信任務NPC-[116662]
	TransferSelect[2] = { "[SC_SPQUESTSET_SELECT_3]"  }  --建置送信任務NPC-[116663]
	TransferSelect[3] = { "[SC_SPQUESTSET_SELECT_4]"  }  --顯示目前所有相關設定值
	TransferSelect[4] = { "[SC_SPQUESTSET_SELECT_5]" }  --刪除所有打怪收集物品任務相關NPC
	TransferSelect[5] = { "[SC_SPQUESTSET_SELECT_6]" }  --刪除所有送信任務相關NPC
	TransferSelect[6] = { "[SC_SPQUESTSET_SELECT_7]" }  --刪除所有任務相關重要物品
	TransferSelect[7] = { "[SO_EXIT]" }	-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_SPQUESTSET_ITEM_01]" )  --請選擇使用功能
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			break
		end
		WriteRoleValue(OwnerID() , EM_RoleValue_PID, 0 )   --清除PID值
		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then  --建置打怪收集物品任務NPC-116666
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  10 ) 
			local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "the value is "..value.."" )
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_sure", 0 )
			break
		elseif DialogStatus == 1 then --建置送信任務NPC-1-116662
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID , 20   ) 
			local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "the value is "..value.."" )
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_sure", 0 )
			break
		elseif DialogStatus == 2 then --建置送信任務NPC-2-116663
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID , 30   ) 
			local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "the value is "..value.."" )
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_sure", 0 )
			break

		elseif DialogStatus == 3 then  --顯示目前所有相關設定值
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			Beginplot( OwnerID() ,"Lua_mika_QTool_ShowValue", 0 )
			break

		elseif DialogStatus == 4 then -- 刪除所有打怪收集物品任務相關NPC
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  50 ) 
			local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "the value is "..value.."" )
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_Delsure00", 0 )
			break

		elseif DialogStatus == 5 then --刪除所有送信任務相關NPC
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  60 ) 
			local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "the value is "..value.."" )
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_Delsure00", 0 )
			break
		elseif DialogStatus == 6 then --刪除所有任務相關重要物品
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_QTool_Delkey", 0 )
			break
		elseif DialogStatus == 7 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function Lua_mika_QTool_Delkey() --刪除所有任務相關重要物品
	Setflag(OwnerID(), 544424, 0 )
	Setflag(OwnerID(), 544425, 0 )
	Setflag(OwnerID(), 544426, 0 )
	Setflag(OwnerID(), 544427, 0 )
	Setflag(OwnerID(), 544708, 0 )
	DebugMsg( 0, RoomID ,"del all quest keyitem !!")
end


------------------------------------顯示目前所有相關設定值--------------------------------
function Lua_mika_QTool_ShowValue() --
	local itemid = GetDBKeyValue("ItemID_100") --任務需求道具ID (後台)
	local needAmount = GetDBKeyValue("ItemIDAmount_100")   --任務需求道具數量 (後台)
	local rewardid = GetDBKeyValue("RewardItemID_100")   -- 給予獎勵ID(後台)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_100")   -- 給予獎勵數量(後台)
	local needlv = GetDBKeyValue("Lvlimit_100")   --任務需求角色等級 (後台)

	DebugMsg( 0, RoomID ,"quest itemid is "..itemid.."")
	DebugMsg( 0, RoomID ,"quest item need amount is "..needAmount.."")
	DebugMsg( 0, RoomID ,"Reward itemid is "..rewardid.."")
	DebugMsg( 0, RoomID ,"Reward item need amount is "..RewardAmount.."")
	DebugMsg( 0, RoomID ,"Quest litmited leve is "..needlv.."")
end

------------------------------------產生NPC--------------------------------
function Lua_mika_QTool_create_sure() -- 確定是否產生npc
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end

	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --確定
	TransferSelect[1] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_SPQUESTSET_ITEM_02]" ) --確定要建立設定的NPC嗎？
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 0 then  --sure
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_ok", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			break
		end
	end
end

function Lua_mika_QTool_create_ok()   --最後步驟
	local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
--	Say (OwnerID(), "the value is "..value.."" )
	if value == 10 then
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
		local BaseX = Obj :X()
	 	local BaseY = Obj :Y();
	 	local BaseZ = Obj :Z();
		local BaseDir = Obj:Dir();
		local NPC = CreateObj(  116666  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
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
		AddToPartition( NPC , RoomID) -- 建立物件
	elseif value  == 20 then
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
		local BaseX = Obj :X()
	 	local BaseY = Obj :Y();
	 	local BaseZ = Obj :Z();
		local BaseDir = Obj:Dir();
		local NPC = CreateObj(  116662  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
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
		AddToPartition( NPC , RoomID) -- 建立物件
	elseif value == 30 then
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Obj = Role:new( OwnerID() )  -- 取得玩家 X.Y.Z.Dir值
		local BaseX = Obj :X()
	 	local BaseY = Obj :Y();
	 	local BaseZ = Obj :Z();
		local BaseDir = Obj:Dir();
		local NPC = CreateObj(  116663  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --在玩家座標 X.Y.Z.Dir 身上準備創立物件
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
		AddToPartition( NPC , RoomID) -- 建立物件
	end
end

------------------------------------清除NPC--------------------------------
function Lua_mika_QTool_create_Delsure00() -- 確定是否刪除npc
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0
	end

	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --確定
	TransferSelect[1] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_SPQUESTSET_ITEM_03]" ) --確定要刪除該區域的任務NPC嗎？
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 0 then  --sure
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_Delsure01", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function Lua_mika_QTool_create_Delsure01()   --最後步驟
	local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
--	Say (OwnerID(), "the value is "..value.."" )
	if value == 50 then
		Beginplot( OwnerID() ,"Lua_mika_QTool_DelNPC01", 0 )
	elseif value  == 60 then
		Beginplot( OwnerID() ,"Lua_mika_QTool_DelNPC02", 0 )
	end
end


function Lua_mika_QTool_DelNPC01() 	--刪除NPC-01  (116666)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID) --確認伺服器的分流
	local Count = SetSearchAllNPC( RoomID) --尋找分流內所有的NPC
	local Obj
	if  Count ~= 0 then
		for i=1 , Count, 1 do  --設定搜尋所有NPC次數的迴圈
			local ID = GetSearchResult() --取得搜尋NPC的結果
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue(  ID, EM_RoleValue_OrgID)--確認所有NPC的編號
				if Name == 116666  then  --若是為相關npc
				DelObj(ID) 
				DebugMsg( 0, RoomID ,"Delete NPC 116666 !!")
				end
			end
		end
	end
end

function Lua_mika_QTool_DelNPC02() 	--刪除NPC-02  (116662,116663)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID) --確認伺服器的分流
	local Count = SetSearchAllNPC( RoomID) --尋找分流內所有的NPC
	local Obj
	if  Count ~= 0 then
		for i=1 , Count, 1 do  --設定搜尋所有NPC次數的迴圈
			local ID = GetSearchResult() --取得搜尋NPC的結果
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue(  ID, EM_RoleValue_OrgID)--確認所有NPC的編號
				if Name == 116662  or Name == 116663 then  --若是為相關npc
				DelObj(ID) 
				DebugMsg( 0, RoomID ,"Delete NPC 116662 and 116663 !!")
				end
			end
		end
	end
end