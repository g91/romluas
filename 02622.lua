function Lua_Hao_Set_Magic_Wardrobe(Choise)

	local Player = OwnerID()
	if Choise ~= 0 and Choise ~= 1 then 
		DebugMsg( Player , 0 , "Entry error" )
		return false
	end
	
	local Page= {	EM_AccountFlag_MW_Space_Switch_1 ,
			EM_AccountFlag_MW_Space_Switch_2 ,
			EM_AccountFlag_MW_Space_Switch_3 ,
			EM_AccountFlag_MW_Space_Switch_4 , 
			EM_AccountFlag_MW_Space_Switch_5 ,
			EM_AccountFlag_MW_Space_Switch_6 ,
			EM_AccountFlag_MW_Space_Switch_7 ,
			EM_AccountFlag_MW_Space_Switch_8	}			
			
	local Set= {	EM_AccountFlag_MW_Set_Switch_1 , 
			EM_AccountFlag_MW_Set_Switch_2 ,
			EM_AccountFlag_MW_Set_Switch_3 ,
			EM_AccountFlag_MW_Set_Switch_4 ,
			EM_AccountFlag_MW_Set_Switch_5	}

	local Select = { Page , Set }

	for i = 1 , table.getn(Select) , 1 do
		for j = 1 , table.getn(Select[i]) , 1 do
		--	DebugMsg( Player , 0 , Select[i][j] )
			WriteAccountFlagValue( Player , Select[i][j] , 1 , Choise )
		--	DelBodyItem( Player , Select[i][j] , 1 )
		end
	end
end

function Lua_Event_Return_Log(Value)

	local Player = OwnerID()
	local Lv = ReadRoleValue( Player , EM_RoleValue_LV )		-- 取得玩家等級
	local SubLv = ReadRoleValue( Player , EM_RoleValue_LV_SUB )	-- 取得玩家副職等級
	local String = "Lv = "..Lv.." SubLv = "..SubLv.." "
--	local Month = string.format("%02d", GetSystime(3)+1 )
--	local Day = string.format("%02d", GetSystime(4) )
--	local Hour = string.format("%02d", GetSystime(1) )
--	local Min = string.format("%02d", GetSystime(2) )	
	
	if Value == nil then
		DebugMsg( Player , 0 , " Entry error" )
		return false
	else
		if Type(Value) == "table" then
			for i = 1 , table.getn(Value) , 1 do
				if Type(Value[i]) ~= "number" and Type(Value[i]) ~= "string" then
					DebugMsg( Player , 0 , i.." Entry error" )
					return
				end
				if i > 1 then
					String = String..Value[i]
				end
			end
			Value = Value[1]
		end
		DesignLog( Player , Value , String )
	end
end

function Lua_Hao_ReturnKeyitem(Value)

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	if CheckFlag( Player , Value )  == true then
		DebugMsg( Player , Room , "True" )
	else
		DebugMsg( Player , Room , "False" )
	end
end


function Lua_Del_QuestDetail(Value)	-- 刪除任務編號

	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local QuestID = 420025
	
	if Value ~= nil then
		DeleteQuest( Player , Value )
		DebugMsg( Player , RoomID , "You have already deleted Quest "..Value )
	else
		While true do
			if QuestID <= 429999 then
				if CheckAcceptQuest( Player , QuestID ) == true then
					DeleteQuest( Player , QuestID )
					DebugMsg( Player , RoomID , "You have already deleted Quest "..QuestID )				
					break
				end
				if QuestID % 100 == 0 then
					DebugMsg( Player , RoomID , QuestID )
					sleep(1)
				end
			end
			QuestID = QuestID + 1
		end
	end
end

function Lua_Hao_Test_Check_SetPlot_Touch()

	if Lua_Hao_Check_SetPlot_Touch(OwnerID()) == true then
		Say( OwnerID() , "Casting" )
	else
		Say( OwnerID() , "Nothing" )
	end
end

function Lua_Hao_Check_SetPlot_Touch( ObjID )	-- 查詢目標是否有觸碰劇情的施法條

	if ObjID == nil then
		ObjID = OwnerID()
	end
	
	if CheckCastBarStatus( ObjID ) == -1 then
		return false
	else
		return true
	end
end
-- 2013.09.24 觸碰劇情進行中換區，導致觸碰劇情卡住不會重置的情況，所以需要執行手動刪除。
function Hao_SetPlot_Touch_Reset( ObjID )	-- 關閉目標身上觸碰劇情的施法條狀態

	if ObjID == nil then
		ObjID = OwnerID()
	end
	
	local CheckStatus = CheckCastBar( ObjID )

	if CheckStatus == 0 then	-- 大於0為成功完成、0為進行中、小於0為中斷
		EndCastBar( ObjID , CheckStatus )
	end
end
--
function Lua_FE_Reset(ObjID)	-- Festival&Event -- 清除活動中會影響的Buff

	if ObjID == nil then
		ObjID = OwnerID()
	end

	local BuffID = {
			502030	-- 2012.10.25 最終救贖
					}

	for i = 1 , #BuffID , 1 do
		if CheckBuff( ObjID , BuffID[i] ) == true then
			CancelBuff( ObjID , BuffID[i] )
		end
	end
end

function Hao_Cancel_Buff()	-- 刪除身上所有Buff

	local Player = OwnerID()
	local BodyBuff
	local CountBuff = BuffCount( Player )	-- 讀取身上的Buff數量
	for i = CountBuff-1 , 0 , -1 do
		BodyBuff = BuffInfo( Player , i , EM_BuffInfoType_BuffID )	-- 讀取該Buff的ID
		CancelBuff_NoEvent( Player, BodyBuff )
		DebugMsg( Player , 0 , BodyBuff )
	end
end

function Hao_Give_All_Recipes()	-- 給予玩家至今為止全部的生產配方

	local Player = OwnerID()
	local Field = {}
	
	for GUID = 540000 , 540005 , -1 do
	 	Field[1] = GameObjInfo_Int( GUID , "Type" )
	 	Field[2] = GameObjInfo_Int( GUID , "OutputLanguage" )
	 	Field[3] = GameObjInfo_Int( GUID , "Translate" )
	 	DebugMsg( Player , 0 , " 1 ="..Field[1].." 2 = "..Field[2].." 3 = "..Field[3] )
		if Field[1] == 5 and Field[2] == -1 and Field[3] == 1 then
			SetFlag( Player , GUID , 1 )
		end
		if GUID%1000 == 0 then
			Sleep(1)
		end
	end
end

function Hao_Get_Server_Level_Cap()	-- 讀取該伺服器設定的等級上限

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local LV_Cap = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- 讀取該伺服器設定的等級上限
	DebugMsg( Player , Room , "Server Player Level Cap = "..Lv_Cap )
end

function Hao_Search_Player(Room)
-- 於對話視窗中顯示該 Zone 前50個Room的玩家清單，每次最多同時顯示 255 個玩家，超過此數字，請以指定 Room 的方式進行。
--/gm pcall Hao_Search_Player(
--/gm pcall Hao_Search_Player(Room

	local Player = OwnerID()
	local Total = 0		-- 該區域玩家總數量
	if Room == nil then	-- 不代入指定 Room 時，一次掃50個Room
		Room = 50
	end

	for i = 0 , Room , 1 do
		local Count
		local Choise = 0
	--	local localRoom = ReadRoleValue( Player , EM_RoleValue_RoomID )		
		if Room == 50 then	-- 沒有指定搜尋特定 Room 時
			Count = SetSearchAllPlayer(i)
		else	-- 有指定搜尋特定 Room 時
			Count = SetSearchAllPlayer(Room)
			Choise = 1
			if Count == 0 then
				ScriptMessage( Player , Player , 0 , "Room : "..Room.." Nobody here" , C_SYSTEM )
				break
			end
		end
	--	DebugMsg( Player , 0 , "Room : "..i.." Count : "..Count )
		if Count ~= 0 then
			for Number = 1 , Count , 1 do
				if ReadRoleValue( Player , EM_RoleValue_Register+1 ) == 1 then
				else
					Total = Total + 1
					local Guid = GetSearchResult()
					local Name = GetName( Guid )
					if Choise == 1 then
						ScriptMessage( Player , Player , 0 , "Room : "..Room.." No."..string.format( "%03d", Total ).." Name : "..Name , C_SYSTEM )
					else
						ScriptMessage( Player , Player , 0 , "Room : "..i.." No."..string.format( "%03d", Total ).." Name : "..Name , C_SYSTEM )
					end
				--	DebugMsg( Player , localRoom , "Room : "..i.." No."..string.format( "%03d", Number ).." Name : "..Name )
				--	if Total%200 == 0 then	-- 於對話視窗中顯示的玩家名單每超過200人時，會等候 15 秒
				--	end
				end
			end
			if Choise == 1 then
				break
			end
		end
	end
end

function Hao_Recall_Npc(ObjID)	-- 建立物件時，該物件的等級不會隨資料庫設定的隨機等級而變動

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Pos = {}
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Player) -- 取玩家當前座標
	local Level = GameObjInfo_Int( ObjID , "Level" )	-- 讀取資料庫中設定的等級，不包含隨機區間部分
	local Npc = CreateObj( ObjID , Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] , 1 )	-- 建立 Npc
	WriteRoleValue( Npc , EM_RoleValue_LV , Level )	-- 設定制式化的測試 Level
	SetModeEx( Npc , EM_SetModeType_Show , true )	-- 顯示
	SetModeEx( Npc , EM_SetModeType_Drag , true )		-- 水平
	SetModeEx( Npc , EM_SetModeType_Searchenemy , true )	-- 索敵
	SetModeEx( Npc , EM_SetModeType_Mark , true )		-- 標記
	SetModeEx( Npc , EM_SetModeType_Revive , true )	-- 重生
	SetModeEx( Npc , EM_SetModeType_Strikback , true )	-- 反擊
	SetModeEx( Npc , EM_SetModeType_Fight , true )		-- 砍殺
	SetModeEx( Npc , EM_SetModeType_Gravity , true )	-- 重力
	SetModeEx( Npc , EM_SetModeType_Move , true )	-- 移動
	SetModeEx( Npc , EM_SetModeType_ShowRoleHead , true )	-- 頭像框
	AddToPartition( Npc , Room )
	return Npc
end

function Dis_Between_Objs(Range)	-- 讓範圍內的所有物件，說出與Obj間的距離

	local ObjID = OwnerID()
	local Count = SetSearchRangeInfo( ObjID , Range )	-- 掃出範圍內所有物件(含自己)
	local ID , Distance 
	for i = 1 , Count , 1 do
		ID = GetSearchResult()	-- 回傳範圍內所有物件的 GitemID
		Distance = GetDistance( ObjID , ID )
		if ID ~= ObjID then
			Yell( ID , Distance , 5 )		
		--	Say( ID , Distance )
		end
	end
end

function Hao_Check_MaxLevel()	-- 不依照參考物件，讀出 Server 中設定的值
	
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local MaxRoleLevel = GetIniValueSetting("MaxRoleLevel")
	DebugMsg( Player , Room , MaxRoleLevel )
end