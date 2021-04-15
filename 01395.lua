---//
---// 以下所使用的 CheckFlag 為區域任務識別碼，當一個區域有兩個以上的 PQ （或使用PQ全域變數的劇情）就必須填入 CheckFlag 作為全域變數的識別碼 //---
--//通常可以不填，不填的話會自動以該物件所在的 RoomID 作為識別碼，如果該物件未 AddToPartition 或 Hide 起來了，則 CheckFlag 設定為 0 //---
--//
---------------------------------------- 將 PID 換算成所出現的 Stage 用 ----------------

function LuaPQ_AnalysisStage()
	local StageShow = {}
	local Num = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	if Num <= 0 then
		return -1
	end
	local TempNum = 0
	for i = 1 , 20 , 1 do --最高可以計算到 10 的 20 次方
		if math.floor( Num ) <= 0 then
			break
		end
		TempNum = Num - math.floor( Num/10 ) * 10
		table.insert(StageShow,TempNum)
		Num = math.floor( Num/10 )
	end
	return StageShow
end
--------------------------------------- 檢查目前 Stage 是否符合可出現的 Stage -------------

function LuaPQ_CheckStage_Check( checktable , Stage ) --單純檢查
	for i = 1,table.getn(checktable),1 do
		if Stage == checktable[i] then
			return true
		end
	end
	return false
end

-------------------- 將 PID 換算成所出現的 Stage 並判斷是否該在這個 Stage 出現，建議不要在迴圈中使用，避免重複進行相同的動作而浪費資源----------------

function LuaPQ_CheckStage( CheckFlag ) 
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Checktable = LuaPQ_AnalysisStage()
	local Stage = LuaPQ_GetStage(CheckFlag)
	for i = 1 , table.getn(checktable) , 1 do
		if Stage == checktable[i] then
			return true
		end
	end
	return false
end
---------------------------------------------------------寫入PQ全域變數用------------------

function LuaPQ_WriteValue( name , Value , CheckFlag) --將特定值寫入目前的全域變數之中，類型有"Number"(累積計數） "Time"（剩餘時間）  "Stage"（階段） 
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	if name == "Number" then
		if Type(Value) == "number" and Value >= 0 then
			ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage] = Value
		end
		return ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage]
	end
	if name == "Time" then
		if Type(Value) == "number" and Value >= 0 then
			ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = Value
		end
		return ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage]
	end
	if name == "Stage" then
		if Type(Value) == "number" and Value >= 0 then
			ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] = Value
		end
		return ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	end
	return false
end

function LuaPQ_ChangeNum( Value , CheckFlag) --改變計數器的值，正值為增加累積數字，負值為減少累積數字
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	if Type(Value) == "number" then
		ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage] = ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage] + Value
	end
	return ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage]
end

function LuaPQ_ChangeTime( Value , CheckFlag) --改變計時器剩餘時間的值，正值為增加剩餘時間，負值為減少剩餘時間
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	if Type(Value) == "number" then
		ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] + Value
	end
	return ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage]
end

------------------------------------------------------取PQ全域變數用--------------------

function LuaPQ_GetValue( type , CheckFlag) --讀取某個pq全域變數，類型有 "Number"（累積數量） "OrgNumber"（計數器設定值） "Time"（剩餘時間） "OrgTime"（計時器設定值） "Stage"（階段） 
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	if Type == "Number" then
		return ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage]
	elseif Type == "Time" then
		return ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage]
	elseif Type == "OrgNumber" then
		return ZonePQ_ValueGroup_Drama[CheckFlag]["CheckNum"][Stage]
	elseif Type == "OrgTime" then
		return ZonePQ_ValueGroup_Drama[CheckFlag]["CheckTime"][Stage]
	else
		return Stage
	end
end

function LuaPQ_GetNum(CheckFlag) --讀取目前計數器的值（累積數量）
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 	
	return ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage]
end

function LuaPQ_GetOrgNum(CheckFlag) --讀取計數器設定數字的值
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	return ZonePQ_ValueGroup_Drama[CheckFlag]["CheckNum"][Stage]
end

function LuaPQ_GetTime(CheckFlag) --讀取目前計時器上的值（剩餘時間）
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	return ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage]
end

function LuaPQ_GetOrgTime(CheckFlag) --讀取計時器設定數字的值
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	return ZonePQ_ValueGroup_Drama[CheckFlag]["CheckTime"][Stage]
end

function LuaPQ_GetStage(CheckFlag) --讀取目前階段的值
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	return Stage
end
---------------------------初始值設定以及建立全域變數-------------------------------------------------------------------

function LuaPQ_CreatePQStage(Table1,Table2,CheckFlag)
	local StageTable = {}
	local TimeTable = {}
	local OrgStageTable = {}
	local OrgTimeTable = {}
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local i = 1
	StageTable[0] = 0 --休息階段
	OrgStageTable[0] = 0 
	for pry , obj in pairs(Table1)  do --計算矩陣中合法的NPC數量
		if Type(obj) == "number" then --負值代表數量到之後重置
			if Obj >= 0 then
				obj = math.floor(obj) --取整數
			else
				obj = -1*math.floor(math.abs(obj) ) --取整數
			end
			OrgStageTable[i] = obj
		else
			OrgStageTable[i] = 0
		end
		StageTable[i] = 0
		i = i + 1
	end
	i = 1
	for pry , obj in pairs(Table2)  do --計算矩陣中合法的NPC數量
		if Type(obj) == "number" then --負值代表時間到之後重置
			if Obj >= 0 then
				obj = math.floor(obj) --取整數
			else
				obj = -1*math.floor(math.abs(obj) ) --取整數
			end
			if i ~= 0 then
				OrgTimeTable[i] = obj
			else
				OrgTimeTable[i] = math.abs(obj)
			end
			TimeTable[i] = math.abs(obj) 
		else
			OrgTimeTable[i] = 0
			TimeTable[i] = 0
		end
		if i == 0 and TimeTable[0] == 0 then
			OrgTimeTable[0] = 180
			TimeTable[0] = 180
		end
		i = i + 1
		if i == table.getn(Table2) then --把最後一個數字當成 TimeTable[0] ，作為重置的時間
			i = 0
		end
	end
	ZonePQ_ValueGroup_Drama[CheckFlag] = {}
	ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] = 0
	ZonePQ_ValueGroup_Drama[CheckFlag]["CheckNum"] = OrgStageTable
	ZonePQ_ValueGroup_Drama[CheckFlag]["Number"] = StageTable
	ZonePQ_ValueGroup_Drama[CheckFlag]["CheckTime"] = OrgTimeTable
	ZonePQ_ValueGroup_Drama[CheckFlag]["Time"] = TimeTable
	return StageTable , TimeTable
end

--------------------------------------------------------------------階段控制迴圈-------------------------------------------------

function LuaI_PQ_ControlCenter(CheckFlag) 
	--------------初始化參數------------------
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	local Timer = 0--計時器
	local OrgTimer = 0--計時器原值
	local Num = 0--計數器
	local OrgNum = 0--計數器原值
	local Stage = 0 --階段
	local Wait = "on"
	local SetState = "no"

	--------------經過重置時間之後才會開始-----
	ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] = 0
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

----------------------------------------------------------------物件登台控制迴圈------------------------------------------------------

function LuaI_PQ_ObjectController(CheckFlag) 
	--注意！物件本身的 PID 以及 EM_RoleValue_Register + 9 (EM_RoleValue_Register10) 必須保留給 PQ 
	--
	--------------初始化參數------------------
	--DebugLog( 2, "XXX"..GetName(OwnerID()).." PQ BEGING XXX" )
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag 未填，不是數字或是為負值，則直接取 roomid 為 checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --如果 CheckFlag 不是整數，則取整數
	end
	--DebugLog( 2, "XXX"..GetName(OwnerID()).." STATE CHECK OK XXX" )
	local MyShow = LuaPQ_AnalysisStage()
	if MyShow == -1 then
	--	DebugLog( 2, "XXX"..GetName(OwnerID()).." BREAK XXX" )
		return
	end

	local Stage = 0
	local ModeFlag = {}
	local View = "Show"
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )

	if GameObjInfo_Int(OrgID , "CampID" ) == 6 then --陣營為 Visitor 者不處理戰鬥的部分
		ModeFlag = {EM_SetModeType_Show , EM_SetModeType_Move , EM_SetModeType_ShowRoleHead }
	else
		ModeFlag = {EM_SetModeType_Show ,  EM_SetModeType_Move , EM_SetModeType_Strikback , EM_SetModeType_Searchenemy , EM_SetModeType_Fight , EM_SetModeType_ShowRoleHead}
	end

	--DebugLog( 2, "XXX"..GetName(OwnerID()).." MODE CHECK OK  XXX" )
	Hide( OwnerID() )
	for pry , obj in pairs(ModeFlag)  do
		SetModeEx( OwnerID() , ModeFlag[pry] , true );
	end
	Show( OwnerID() , RoomID )
	--DebugLog( 2, "XXX"..GetName(OwnerID()).." MODE BASIC SET OK  XXX" )

	Hide( OwnerID() )
	for pry , obj in pairs(ModeFlag)  do
		SetModeEx( OwnerID() , ModeFlag[pry] , false );
	end
	SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , true );
	SetModeEx( OwnerID() , EM_SetModeType_HideName, true );
	Show( OwnerID() , RoomID )
	MoveToFlagEnabled( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 ) --隱藏中
	View = "Hide"
	--DebugLog( 2, "XXX"..GetName(OwnerID()).." FIRST HIDE OK  XXX" )
	while 1 do
		Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"]
		if LuaPQ_CheckStage_Check( MyShow , Stage ) == false and View == "Show" and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 0 then
			SetStopAttack( OwnerID() )
			Lua_CancelAllBuff( OwnerID() ) 
			ClearHateList( OwnerID() , -1 )
			WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 ) --隱藏中
			View = "Hide"
			--DebugLog( 2, "XXX"..GetName(OwnerID()).." BE HIDE   XXX" )
			break
		end
		if LuaPQ_CheckStage_Check( MyShow , Stage ) == true and View == "Hide" and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 0 then
			Hide( OwnerID() )
			for pry , obj in pairs(ModeFlag)  do
				SetModeEx( OwnerID() , ModeFlag[pry] , true );
			end
			SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , false );
			SetModeEx( OwnerID() , EM_SetModeType_HideName, false );
			Show( OwnerID() , RoomID )
			MoveToFlagEnabled( OwnerID() , true )
			WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 1 ) --顯示中
			View = "Show"
			--DebugLog( 2, "XXX"..GetName(OwnerID()).." BE SHOW   XXX" )
		end
		sleep( 10 )
	end
	--DebugLog( 2, "XXX"..GetName(OwnerID()).." RESET XXX" )
	LuaFunc_ResetObj( OwnerID() )
end

function LuaI_PQ_ObjectController_RH(CheckFlag) --階段只影響出現不影響消失( RH = Reborn Hind Only )
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
			ScriptMessage( OwnerID() , -1 , 0 , "My Show Break" , 0 )
		return
	end

	local Stage = 0
	local ModeFlag = {}
	local View = "Show"
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )

	if GameObjInfo_Int(OrgID , "CampID" ) == 6 then --陣營為 Visitor 者不處理戰鬥的部分
		ModeFlag = {EM_SetModeType_Show , EM_SetModeType_Mark , EM_SetModeType_Move , EM_SetModeType_ShowRoleHead}
	else
		ModeFlag = {EM_SetModeType_Show , EM_SetModeType_Mark , EM_SetModeType_Move , EM_SetModeType_Strikback , EM_SetModeType_Searchenemy , EM_SetModeType_Fight ,EM_SetModeType_ShowRoleHead}
	end

	Hide( OwnerID() )
	for pry , obj in pairs(ModeFlag)  do
		SetModeEx( OwnerID() , ModeFlag[pry] , true );
	end
	Show( OwnerID() , RoomID )

	Hide( OwnerID() )
	for pry , obj in pairs(ModeFlag)  do
		SetModeEx( OwnerID() , ModeFlag[pry] , false );
	end
	SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , true );
	SetModeEx( OwnerID() , EM_SetModeType_HideName, true );
	Show( OwnerID() , RoomID )
	MoveToFlagEnabled( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 ) --隱藏中
	View = "Hide"

	while 1 do
		sleep( 10 )
		Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"]
		if LuaPQ_CheckStage_Check( MyShow , Stage ) == true and View == "Hide" and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 0 then
			Hide( OwnerID() )
			for pry , obj in pairs(ModeFlag)  do
				SetModeEx( OwnerID() , ModeFlag[pry] , true );
			end
			SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , false );
			SetModeEx( OwnerID() , EM_SetModeType_HideName, false );
			Show( OwnerID() , RoomID )
			MoveToFlagEnabled( OwnerID() , true )
			WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 1 ) --顯示中
			View = "Show"
			break
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------