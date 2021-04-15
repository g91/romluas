--------------------------------------------------------------------階段控制迴圈中控型-------------------------------------------------

function LuaI_PQ_AllBeControledByOne( CheckFlag ) 
	--------------初始化參數------------------
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end

	ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"] = {}
	local Timer = 0--計時器
	local OrgTimer = 0--計時器原值
	local Num = 0--計數器
	local OrgNum = 0--計數器原值
	local Stage = 0 --階段
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --RoomID
	local Wait = "on"
	local TempTable = {}
	local SetState = "no"

	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["CheckTime"]) do --從 CheckTime 的單元數來判斷有幾個階段
		ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry] = {}
	end
	-------------------------------------------
	while 1 do
		Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"]
		Timer = ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage]
		OrgTimer = ZonePQ_ValueGroup_Drama[CheckFlag]["CheckTime"][Stage]
		Num = ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage]
		OrgNum = ZonePQ_ValueGroup_Drama[CheckFlag]["CheckNum"][Stage]
		SetState = "no"
		
		if OrgTimer == 0 and OrgNum == 0 then
			break
		end

		if OrgTimer ~= 0 then
			if Timer <= 0 and OrgTimer < 0 and SetState == "no" then
				Stage = 0
				ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] = Stage

				LuaPQ_ChangeCircle(RoomID , Stage , CheckFlag )
				
				SetState = "yes"
				if Wait == "on" then
					Wait = "off"
				end
			elseif Timer <= 0 and OrgTimer > 0 and SetState == "no" then
				Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] + 1
				if ZonePQ_ValueGroup_Drama[CheckFlag]["CheckNum"][Stage] == nil then
					Stage = 0
				end
				ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] = Stage
				
				LuaPQ_ChangeCircle(RoomID , Stage , CheckFlag )
				
				SetState = "yes"
				if Wait == "on" then
					Wait = "off"
				end
			end
		end

		if OrgNum ~= 0 then
			if OrgNum < 0  and Num >= -( OrgNum ) and SetState == "no" then
				Stage = 0
				ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] = Stage

				LuaPQ_ChangeCircle(RoomID , Stage , CheckFlag )
				
				SetState = "yes"
				if Wait == "on" then
					Wait = "off"
				end

			elseif  OrgNum > 0 and Num >= OrgNum and SetState == "no" then
				Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] + 1
				if ZonePQ_ValueGroup_Drama[CheckFlag]["CheckNum"][Stage] == nil then
					Stage = 0
				end
				ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] = Stage

				LuaPQ_ChangeCircle(RoomID , Stage , CheckFlag )
				
				SetState = "yes"
				if Wait == "on" then
					Wait = "off"
				end
			end
		end

		if ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] == 0 and Wait == "off" then --重置
			ZonePQ_ValueGroup_Drama[CheckFlag]["Number"] = {}
			ZonePQ_ValueGroup_Drama[CheckFlag]["Time"] = {}
			local temp = ZonePQ_ValueGroup_Drama[CheckFlag]["CheckNum"]
			for pry , obj in pairs(temp)  do 
				ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][pry] = 0
			end
			temp = {}
			temp = ZonePQ_ValueGroup_Drama[CheckFlag]["CheckTime"]
			for pry , obj in pairs(temp)  do 
				ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][pry] = math.abs(obj)
			end
			Wait = "on"
		end

		sleep( 10 )

		if OrgTimer ~= 0 then
			Timer = ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] - 1
			ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = Timer
		end
	end

end

---------------------------------------------------中控物件副函式：控制顯現或隱藏--------------------------------------------------

function LuaPQ_ChangeCircle(RoomID , Stage , CheckFlag )  --用一個暫時的table把值存起來，以保證每一個物件都會被處理到
	local TempTable = {}	

	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][Stage])  do  
		TempTable[pry] =  obj
	end
	
	for pry , obj in pairs(TempTable)  do  --控制物件顯現或消失
		 LuaPQ_ObjectStateChange( obj , RoomID , Stage , CheckFlag ) --此函式在下方
	end

	TempTable = {}

end

function LuaPQ_ObjectStateChange( RoleID , RoomID , Stage ,CheckFlag )

	if CheckID(math.abs(RoleID)) == false or ReadRoleValue(math.abs(RoleID), EM_RoleValue_RoomID ) ~= RoomID or ReadRoleValue(math.abs(RoleID), EM_RoleValue_IsPlayer ) ~= 0 then
		for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do
			for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry])  do --把目標從陣列中移除
				if obj2 == RoleID or obj2 == -RoleID then
					table.remove(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry],pry2) 
					break
				end
			end
		end
		return
	end

	local NowState = ReadRoleValue( math.abs(RoleID) , EM_RoleValue_Register + 9 )

	if RoleID > 0 and NowState == 0 then --讓狀態未顯示的物件顯示
		local OrgID = ReadRoleValue( RoleID, EM_RoleValue_OrgID )
		if GameObjInfo_Int(OrgID , "CampID" ) == 6 then --陣營為 Visitor 者不處理戰鬥的部分
			ModeFlag = {EM_SetModeType_Show , EM_SetModeType_Move , EM_SetModeType_ShowRoleHead }
		else
			ModeFlag = {EM_SetModeType_Show ,  EM_SetModeType_Move , EM_SetModeType_Strikback , EM_SetModeType_Searchenemy , EM_SetModeType_Fight , EM_SetModeType_ShowRoleHead}
		end

		Hide( RoleID )
		for pry , obj in pairs(ModeFlag)  do
			SetModeEx( RoleID , ModeFlag[pry] , true );
		end
		SetModeEx(RoleID, EM_SetModeType_HideMinimap , false );
		SetModeEx( RoleID , EM_SetModeType_HideName, false );
		Show( RoleID , RoomID )
		MoveToFlagEnabled(RoleID , true )
		WriteRoleValue( RoleID , EM_RoleValue_Register + 9 , 1 ) --顯示中
	end

	if RoleID < 0 and NowState == 1 and ReadRoleValue( math.abs(RoleID) , EM_RoleValue_IsDead ) == 0 then --讓狀態未消失的物件消失
		for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do
			for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry])  do --把目標從陣列中移除
				if obj2 == RoleID or obj2 == -RoleID then
					table.remove(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry],pry2) 
					break
				end
			end
		end

		RoleID = -RoleID

		SetStopAttack(RoleID )
		Lua_CancelAllBuff( RoleID) 
		ClearHateList( RoleID , -1 )
		WriteRoleValue( RoleID , EM_RoleValue_Register + 9 , 0 ) --隱藏中
		BeginPlot( RoleID , "LuaPQ_ObjectReset" , 0 )
	end

end

function LuaPQ_ObjectReset()
	LuaFunc_ResetObj( OwnerID() )
end
----------------------------------------------------------------物件初始劇情-----------------------------------------------------

function LuaI_PQ_ObjectInitial(CheckFlag) 
	--注意！物件本身的 EM_RoleValue_Register + 7(EM_RoleValue_Register8)  以及 EM_RoleValue_Register + 6 (EM_RoleValue_Register7) 必須保留給 PQ 
	--
	--------------初始化參數------------------
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end

	local MyShow = LuaPQ_AnalysisStage()
	if MyShow == -1 then
		return
	end

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )

	if GameObjInfo_Int(OrgID , "CampID" ) == 6 then --陣營為 Visitor 者不處理戰鬥的部分
		ModeFlag = {EM_SetModeType_Show , EM_SetModeType_Move , EM_SetModeType_ShowRoleHead }
	else
		ModeFlag = {EM_SetModeType_Show ,  EM_SetModeType_Move , EM_SetModeType_Strikback , EM_SetModeType_Searchenemy , EM_SetModeType_Fight , EM_SetModeType_ShowRoleHead}
	end

	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"]

	Hide( OwnerID() ) --先把自己隱藏起來
	sleep(10 + Rand(10)) --等待中控 NPC 出現並且避開同時產生會造成的系統負擔

	if Stage == nil or LuaPQ_CheckStage_Check( MyShow , Stage ) == false then
		for pry , obj in pairs(ModeFlag)  do
			SetModeEx( OwnerID() , ModeFlag[pry] , false );
		end
		SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , true );
		SetModeEx( OwnerID() , EM_SetModeType_HideName, true );
		Show( OwnerID() , RoomID )
		MoveToFlagEnabled( OwnerID() , false )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 ) --隱藏中
	else
		for pry , obj in pairs(ModeFlag)  do
			SetModeEx( OwnerID() , ModeFlag[pry] , true );
		end
		SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , false );
		SetModeEx( OwnerID() , EM_SetModeType_HideName, false );
		Show( OwnerID() , RoomID )
		MoveToFlagEnabled( OwnerID() , true )
		WriteRoleValue(  OwnerID()  , EM_RoleValue_Register + 9 , 1 ) --顯示中
	end
	------------------------把陣列中和自己重複的號碼刪除-----------------------
	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do
		for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry])  do 
			if obj2 == OwnerID()  or obj2 == -1*OwnerID()  then
				table.remove(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry],pry2) 
				break
			end
		end
	end
	------------------------------------------------------------------------------------------
	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do  --把物件填到陣列中，正的為該階段要顯現，負的為該階段不顯現
		if LuaPQ_CheckStage_Check( MyShow , pry ) == true then
			table.insert(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry] , OwnerID()) 
		else
			table.insert(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry] , -1 * OwnerID() )
		end 
	end
end


function LuaI_PQ_ObjectInitial_RH(CheckFlag) --階段只影響出現不影響消失( RH = Reborn Hind Only )

	--注意！物件本身的 PID 以及 EM_RoleValue_Register + 9 (EM_RoleValue_Register10) 必須保留給 PQ 
	--
	--------------初始化參數------------------
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end

	local MyShow = LuaPQ_AnalysisStage()
	if MyShow == -1 then
		return
	end

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )

	if GameObjInfo_Int(OrgID , "CampID" ) == 6 then --陣營為 Visitor 者不處理戰鬥的部分
		ModeFlag = {EM_SetModeType_Show , EM_SetModeType_Move , EM_SetModeType_ShowRoleHead }
	else
		ModeFlag = {EM_SetModeType_Show ,  EM_SetModeType_Move , EM_SetModeType_Strikback , EM_SetModeType_Searchenemy , EM_SetModeType_Fight , EM_SetModeType_ShowRoleHead}
	end

	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"]

	Hide( OwnerID() ) --先把自己隱藏起來
	sleep(10 + Rand(10)) --等待中控 NPC 出現並且避開同時產生會造成的系統負擔

	if Stage == nil or LuaPQ_CheckStage_Check( MyShow , Stage ) == false then
		for pry , obj in pairs(ModeFlag)  do
			SetModeEx( OwnerID() , ModeFlag[pry] , false );
		end
		SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , true );
		SetModeEx( OwnerID() , EM_SetModeType_HideName, true );
		Show( OwnerID() , RoomID )
		MoveToFlagEnabled( OwnerID() , false )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 ) --隱藏中
	else
		for pry , obj in pairs(ModeFlag)  do
			SetModeEx( OwnerID() , ModeFlag[pry] , true );
		end
		SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , false );
		SetModeEx( OwnerID() , EM_SetModeType_HideName, false );
		Show( OwnerID() , RoomID )
		MoveToFlagEnabled( OwnerID() , true )
		WriteRoleValue(  OwnerID()  , EM_RoleValue_Register + 9 , 1 ) --顯示中
	end
	------------------------把陣列中和自己重複的號碼刪除-----------------------
	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do
		for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry])  do 
			if obj2 == OwnerID()  or obj2 == -1*OwnerID()  then
				table.remove(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry],pry2) 
				break
			end
		end
	end
	------------------------------------------------------------------------------------------
	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do  --把物件填到陣列中，正的為該階段要顯現
		if LuaPQ_CheckStage_Check( MyShow , pry ) == true then
			table.insert(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry] , OwnerID()) 
		end 
	end
end