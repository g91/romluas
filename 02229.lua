function Lua_Hao_Tell_All_Reg_PID( Obj ) -- 讀取玩家的 PID 及 Reg值

	--	EM_RoleValue_Register = EM_RoleValue_Register1
	--	EM_RoleValue_Register1 = EM_RoleValue_Register+0
	--	EM_RoleValue_Register2 = EM_RoleValue_Register+1
	--	EM_RoleValue_Register3 = EM_RoleValue_Register+2
	--	EM_RoleValue_Register4 = EM_RoleValue_Register+3
	--	EM_RoleValue_Register5 = EM_RoleValue_Register+4
	--	EM_RoleValue_Register6 = EM_RoleValue_Register+5
	--	EM_RoleValue_Register7 = EM_RoleValue_Register+6
	--	EM_RoleValue_Register8 = EM_RoleValue_Register+7
	--	EM_RoleValue_Register9 = EM_RoleValue_Register+8
	--	EM_RoleValue_Register10 = EM_RoleValue_Register+9
	
	if Obj == Nil then
		Obj = OwnerID()
	end

	local Reg
	local PID = ReadRoleValue( Obj , EM_RoleValue_PID )

	DebugMsg( 0 , 0 , "PID ="..PID )
	Say( Obj , "PID ="..PID )
	for i = 0 , 9 , 1 do
		Reg =  ReadRoleValue( Obj , EM_RoleValue_Register+i )
		Say( Obj , "Reg".."+"..i.." = "..Reg )
		DebugMsg( 0 , 0 , "Reg".."+"..i.." = "..Reg )
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_NPCofAll_Clear( ObjID , Range ) -- 清除區域或範圍內的所有物件

	local NpcID = ObjID
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local T1Obj , NewID

	if Range == nil or Range <= -1 then
		local Count = SetSearchAllNPC( RoomID )
		local Obj
		local NPC = { ObjID }
		local Number = 0
		if  Count ~= 0 then
			for i=1 , Count , 1 do
				local ID = GetSearchResult()
				Obj=Role:New(ID)
				if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
					for j = 1 , table.getn( NPC ) , 1 do
						if Name == NPC[j] then  --若為陣列中的值
						--	SetModeEx( ID , EM_SetModeType_Revive , false )	-- 關閉重生
						--	SetModeEx( ID , EM_SetModeType_Save , false )	-- 關閉儲存
							DelObj( ID )
							Number = Number + 1
						end
					end
				end
			end
		end
		DebugMsg( OwnerID() , 0 , "Del "..Number )

	else
		local Count = SetSearchRangeInfo( OwnerID() , Range )	-- 掃出範圍內所有物件(含自己)
		for i = 1 , Count , 1 do
			local T1ID = GetSearchResult()	-- 回傳範圍內所有物件的 GitemID
		--	Say( T1ID , "0" )
			if ReadRoleValue( T1ID , EM_RoleValue_IsNPC ) == 1 then -- 若為 NPC 時...
		--		Say( T1ID , "1" )
				T1Obj = ReadRoleValue( T1ID , EM_RoleValue_OrgID )	-- 讀取該物件的 OrgID
				if NpcID == T1Obj then
				--	Say( T1ID , "2" )
					if ReadRoleValue(  T1ID ,  EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( T1ID , EM_RoleValue_IsPlayer ) ~= 1 then	-- 若為非玩家並身於此 Room
					--	Say( T1ID , "3" )
						DelObj( T1ID )
					end
				end
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_NPCofAll_Clear_Test()

	Lua_Hao_NPCofAll_Clear( 113105 , 1000 )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_NPC_Range_Search( ObjID , SearchID , Range ) -- 回報範圍內的指定物件有幾個

	local RoomID , Number = ReadRoleValue( ObjID , EM_RoleValue_RoomID )  , 0
	local Count = SetSearchRangeInfo( ObjID , Range )	-- 掃出範圍內所有物件(含自己)
	local T1Obj
	for i = 1 , Count , 1 do
		local T1ID = GetSearchResult()	-- 回傳範圍內所有物件的 GitemID
	--	Say( T1ID , "0" )
		if ReadRoleValue( T1ID , EM_RoleValue_IsNPC ) == 1 then -- 若為 NPC 時...
	--		Say( T1ID , "1" )
			T1Obj = ReadRoleValue( T1ID , EM_RoleValue_OrgID )	-- 讀取該物件的 OrgID
			if SearchID == T1Obj then
			--	Say( T1ID , "2" )
				if ReadRoleValue(  T1ID ,  EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( T1ID , EM_RoleValue_IsPlayer ) ~= 1 then	-- 若為非玩家並身於此 Room
					Number = Number + 1
				--	Say( T1ID , "3" )
				end
			end
		end
	end
--	DebugMsg( 0 , 0 , "Number = "..Number )
	return Number
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Search_NPC_Mode( ObjID )	-- 搜尋該區域的此物件有幾個

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { ObjID }
	local Number = 0

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						Number = Number + 1
					end
				end
			end
		end
		Say( OwnerID() , "Number ="..Number )
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_ResetColdown(ObjID,MagicID,Value)  -- 清除特定CD時間( Value 不輸入時清除物品CD、 = 0 時清除職業CD、 = 1 時清除裝備CD )

	local Class = GameObjInfo_Int( MagicID ,"ColdownClass")  -- 抓這個法術的施法冷卻欄位 - 分類
	local Type = GameObjInfo_Int( MagicID ,"ColdownType")  -- 抓這個法術的施法冷卻欄位次分類 - 冷卻類型
	local CD = GameObjInfo_Int( MagicID ,"ColdownTime") -- 抓這個法術的施法冷卻欄位次分類 - 冷卻時間
	local Data

	if CD > 0 then
	--	if Class == 3 then
		--	if Type == 14 or Type == 18 or Type == 19 or Type == 24 then
			if Value == nil then
				WriteRoleValue( ObjID , EM_RoleValue_Coldown_Item + Type ,  0 ) 
				Data = ReadRoleValue( ObjID , EM_RoleValue_Coldown_Item + Type )
--				Say( ObjID , ReadRoleValue( ObjID , EM_RoleValue_Coldown_Item + Type ) )
			elseif Value == 0 then
				WriteRoleValue( ObjID , EM_RoleValue_Coldown_Job + Type ,  0 )
				Data = ReadRoleValue( ObjID , EM_RoleValue_Coldown_Job + Type )
			--	DebugMsg( OwnerID() , 0 , Value.." , Value = "..Value )
			elseif Value == 1 then
				WriteRoleValue( ObjID , EM_RoleValue_Coldown_EQ + Type ,  0 )
				Data = ReadRoleValue( ObjID , EM_RoleValue_Coldown_EQ + Type )
			--	DebugMsg( OwnerID() , 0 , Value.." , Value = "..Value )
			end
				CD = GameObjInfo_Int( MagicID ,"ColdownTime") -- 抓這個法術的施法冷卻欄位次分類 - 冷卻時間
			--	DebugMsg( OwnerID() , 0 , ObjID.." , Data = "..Data )
			--	DebugMsg( OwnerID() , 0 , ObjID.." , Coldown = "..CD )
--				Say( ObjID , "Class = "..Class )
--				Say( ObjID , "Type = "..Type )
--				Say( ObjID , "CD = "..CD )
		--	end
	--	end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Reset_TestMagic()

	Lua_Hao_ResetColdown( OwnerID() , 493069 )
end

function Lua_Mounts_Copilot2()

	Lua_Mounts_Copilot( OwnerID() )
end

function Lua_Mounts_Copilot( ObjID )	-- 偵測『目標』是否在雙人坐騎的副座上，不是則等於 -1 ，如果是則不等於 -1

	if ObjID == nil then
		ObjID = OwnerID()
	end
	local Mode = ReadRoleValue( ObjID , EM_RoleValue_AttachObjGUID )
--	DebugMsg( 0 , 0 , "GUID = "..Mode )
	if Mode == -1 then
		return true
	else
		return false
	end
	--範例
--	if Lua_Mounts_Copilot( OwnerID() ) == false then	-- 當OwnerID()在副座時...
--		Say( OwnerID() , "1" )		-- 讓目標無法接取這個任務
--	else					-- 當OwnerID()不在副座時...
--		Say( OwnerID() , "2" )		--讓目標可以接取這個任務
--	end
end

function Lua_UseItem_CastingBar( ObjID )	-- 偵測『目標』是否正處於使用物品後的施法條中，-1 為初始值、0為有施法條狀態

	local Cast =  ReadRoleValue( ObjID , EM_RoleValue_CastingType )

	if Cast == -1 then
		return false
	else
		return true
	end
	--範例
--	if Lua_UseItem_CastingBar( OwnerID() ) == true then	-- 當OwnerID()還有使用物品後的施法條時...
--		Say( OwnerID() , "1" )		-- 讓目標無法執行其它動作...
--	else					-- 當OwnerID()沒有使用物品後的施法條時...
--		Say( OwnerID() , "2" )		--讓目標可以執行其它動作...
--	end
end

function Lua_UseItem_CastingBar_Test()	-- 範例

	if Lua_UseItem_CastingBar( OwnerID() ) == true then	-- 當OwnerID()還有使用物品後的施法條時...
		Say( OwnerID() , "1" )		-- 讓目標無法執行其它動作...
	else					-- 當OwnerID()沒有使用物品後的施法條時...
		Say( OwnerID() , "2" )		--讓目標可以執行其它動作...
	end
end

function Lua_Dual_Battle( ObjID )	-- 偵測『目標』是否正處於決鬥

	local Dual = ReadRoleValue( ObjID , EM_RoleValue_DualTargetDBID )

	if Dual ~= 0 then
		return false
	else
		return true
	end
	--範例
--	if Lua_Dual_Battle( OwnerID() ) == true then	-- 當OwnerID()有跟人決鬥時
--		Say( OwnerID() , "1" )		-- 不執行劇情
--	else					-- 當OwnerID()沒有跟人決鬥時
--		Say( OwnerID() , "2" )		-- 執行劇情
--	end
end

function Lua_Check_Flag( Keyitem )

	if CheckFlag( OwnerID() , Keyitem ) == true then
		DebugMsg( 0 , 0 , "You already have "..Keyitem )
	else
		DebugMsg( 0 , 0 , "Miss Keyitem" )
	end
end

function Lua_Hao_Test_Dept_EXP_TP()	-- 調整負債用

	Lua_Hao_Test_Dept_EXP_TP_01( 0 )
end

function Lua_Hao_Test_Dept_EXP_TP_01( X , DebtExp , DebtTp )

	local Time = 0 
	local Key , DialogStatus
	local inputstring = ""

	if DebtExp == nil then
		DebtExp = 0
	end
	if DebtTp == nil then
		DebtTp = 0
	end


	if X == 0 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice DebtExp" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter Exp value" , 0 )
	elseif X == 1 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice DebtTp" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter Tp value" , 0 )
	end
	DialogSelectStr( OwnerID() , "Accept" )
	DialogSelectStr( OwnerID() , "Cancel" )

	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 300 then  -- 30秒無動作，關閉對話視窗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- 閒置超過30秒,自動關閉視窗。
			DialogClose( OwnerID() )
			break
		end

		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目

		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 初始化、中斷

			inputstring = DialogGetInputResult( OwnerID() )

			if DialogStatus == 0 then  -- 有填入字串
				X = X + 1
			--	Say( OwnerID() , "X ="..X )
				if X == 1 then
					DebtExp = inputstring
				--	Say( OwnerID() , "DebtExp ="..DebtExp )
				elseif X == 2 then
					DebtTp = inputstring
				--	Say( OwnerID() , "DebtTp ="..DebtTp )
				end

				if X < 2 then
					return Lua_Hao_Test_Dept_EXP_TP_01( X , DebtExp , DebtTp )
				elseif X == 2 then
					local OldDebtEXP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtExp )
					local OldDebtTP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtTP )
				--	Say( OwnerID() , "OldDebtEXP = "..OldDebtEXP )
				--	Say( OwnerID() , "OldDebtTP = "..OldDebtTP )
					local NewDebtEXP = DebtExp + OldDebtEXP
					local NewDebtTP = DebtTp + OldDebtTP
					local Msg = 0
					if NewDebtEXP >= 0 and NewDebtTP >= 0 then
						ScriptMessage( OwnerID() , OwnerID() , 0 , "Your have no DetpEXP and DetpTP" , C_SYSTEM )		--你負債已經清空了！
						Msg = 1
					end
					if NewDebtEXP < 0 then
						WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , NewDebtEXP )
					elseif NewDebtEXP >= 0 then
						WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , 0 )
						if Msg == 0 then
							ScriptMessage( OwnerID() , OwnerID() , 0 , "Your have no DetpEXP" , C_SYSTEM )		--你負債已經清空了！
						end
					end
					if NewDebtTP < 0 then
						WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , NewDebtTP )
					elseif NewDebtTP >= 0 then
						WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , 0 )
						if Msg == 0 then
							ScriptMessage( OwnerID() , OwnerID() , 0 , "Your have no DetpTP" , C_SYSTEM )		--你負債已經清空了！
						end
					end
				end
			end
			Key = 1
		else
		end
		if Key == 1 then
			DialogClose( OwnerID() )
			break
		end
	end
end

function Lua_Hao_NPC_Closest_Search( ObjID , SearchID , Range ) -- 以ObjID為中心做範圍搜尋，回傳範圍內最接近的NPC物件

	local RoomID , Number = ReadRoleValue( ObjID , EM_RoleValue_RoomID )  , 0
	local Count = SetSearchRangeInfo( ObjID , Range )	-- 掃出範圍內所有物件(含自己)
	local Closest = 9999
	local T1Obj
	local ID = 0
	for i = 1 , Count , 1 do
		local T1ID = GetSearchResult()	-- 回傳範圍內所有物件的 GitemID
		local Distance = GetDistance( OwnerID() , T1ID ) 
		if ReadRoleValue( T1ID , EM_RoleValue_IsNPC ) == 1 then -- 若為 NPC 時...
			T1Obj = ReadRoleValue( T1ID , EM_RoleValue_OrgID )	-- 讀取該物件的 OrgID
			if SearchID == T1Obj then
				if ReadRoleValue(  T1ID ,  EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( T1ID , EM_RoleValue_IsPlayer ) ~= 1 then	-- 若為非玩家並身於此 Room
				--	Say( T1ID , "OrgID"..T1ID.." Distance ="..Distance )
					if Closest > Distance then
						Closest = Distance
						ID = T1ID
					end
				end
			end
		end
		if i == Count then
		--	Say( ID , "I am close you")
			DebugMsg( OwnerID() , 0 , "Distance = "..Closest.." ID = "..ID )
			return ID
		end
	end
end

function Lua_Hao_Set_GuildResources( Player , Gold , BonusGold , Mine , Wood , Herb , Rune , Stone )	-- 增加公會資源
	-- 資金、紅鑽、礦物、木材、藥草、魔物精華、王者核心
	AddGuildResource( Player , Gold , BonusGold , Mine , Wood  , Herb , Rune , Stone ," " )
end

function Lua_Hao_ReSet_GuildResources( )	-- 重置公會資源

	local Player = OwnerID()
	local Gold = GuildInfo( Player , EM_GuildInfoType_Resource_Gold )		-- 基金
	local BonusGold = GuildInfo( Player , EM_GuildInfoType_Resource_BonusGold )	-- 紅鑽
	local Mine = GuildInfo( Player , EM_GuildInfoType_Resource_Mine )		-- 礦物
	local Wood = GuildInfo( Player , EM_GuildInfoType_Resource_Wood )		-- 木材
	local Herb = GuildInfo( Player , EM_GuildInfoType_Resource_Herb )		-- 藥草
	local Rune = GuildInfo( Player , EM_GuildInfoType_Resource_GuildRune )	-- 魔物精華
	local Stone = GuildInfo( Player , EM_GuildInfoType_Resource_GuildStone )	-- 王者核心

	AddGuildResource( Player , -Gold , -BonusGold , -Mine , -Wood  , -Herb , -Rune , -Stone ," " )
end

function Lua_Hao_Test_Round_wall()
	Lua_Hao_Round_wall( OwnerID() , 113621 , 36 , 100 , 2 )
end
function Lua_Hao_Round_wall( ObjID , CreateID , CreateCount , Distance , Delay )
-- 參考物件、建立物件的ID、建立物件的數量、圓的半徑、建立物件是否延遲
	Lua_Hao_NPCofAll_Clear( CreateID , 500 ) 	-- 清除
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local BaseX = ReadRoleValue( ObjID , EM_RoleValue_X )
	local BaseY = ReadRoleValue( ObjID , EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( ObjID , EM_RoleValue_Z )
	local BaseDir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
	local CreateWall
	local CreateID = CreateID -- 門
	local Polygon = CreateCount -- 幾邊型
	local dis = Distance -- 距離圓心的距離
	local Count = 1

	for i = 1 , Polygon , 1 do
		CreateWall = CreateObj( CreateID , BaseX-dis*math.cos(math.pi*2*(i/Polygon)) , BaseY , BaseZ+dis*math.sin(math.pi*2*(i/Polygon)) , BaseDir , 1 )
		SetModeEx( CreateWall , EM_SetModeType_Strikback , false )--反擊
		SetModeEx( CreateWall , EM_SetModeType_SearchenemyIgnore , false )--被搜尋
		SetModeEx( CreateWall , EM_SetModeType_Obstruct , true )--阻擋
		SetModeEx( CreateWall , EM_SetModeType_Mark , false )--標記
		SetModeEx( CreateWall , EM_SetModeType_Move , false )--移動
		SetModeEx( CreateWall , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( CreateWall , EM_SetModeType_HideName , false )--名稱
		SetModeEx( CreateWall , EM_SetModeType_ShowRoleHead , false )--頭像框
		SetModeEx( CreateWall , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( CreateWall , EM_SetModeType_Drag , false )--阻力
		SetModeEx( CreateWall , EM_SetModeType_Show , true )--顯示
		AdjustFaceDir( CreateWall , ObjID , 0 ) 	-- 讓建立物件面向參考物件
		AddToPartition( CreateWall , RoomID )
		if Delay ~= 0 or Delay ~= nil then
			Sleep(Delay)
		end
	end
end