---//
---// �H�U�ҨϥΪ� CheckFlag ���ϰ�����ѧO�X�A��@�Ӱϰ즳��ӥH�W�� PQ �]�Ψϥ�PQ�����ܼƪ��@���^�N������J CheckFlag �@�������ܼƪ��ѧO�X //---
--//�q�`�i�H����A���񪺸ܷ|�۰ʥH�Ӫ���Ҧb�� RoomID �@���ѧO�X�A�p�G�Ӫ��� AddToPartition �� Hide �_�ӤF�A�h CheckFlag �]�w�� 0 //---
--//
---------------------------------------- �N PID ���⦨�ҥX�{�� Stage �� ----------------

function LuaPQ_AnalysisStage()
	local StageShow = {}
	local Num = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	if Num <= 0 then
		return -1
	end
	local TempNum = 0
	for i = 1 , 20 , 1 do --�̰��i�H�p��� 10 �� 20 ����
		if math.floor( Num ) <= 0 then
			break
		end
		TempNum = Num - math.floor( Num/10 ) * 10
		table.insert(StageShow,TempNum)
		Num = math.floor( Num/10 )
	end
	return StageShow
end
--------------------------------------- �ˬd�ثe Stage �O�_�ŦX�i�X�{�� Stage -------------

function LuaPQ_CheckStage_Check( checktable , Stage ) --����ˬd
	for i = 1,table.getn(checktable),1 do
		if Stage == checktable[i] then
			return true
		end
	end
	return false
end

-------------------- �N PID ���⦨�ҥX�{�� Stage �çP�_�O�_�Ӧb�o�� Stage �X�{�A��ĳ���n�b�j�餤�ϥΡA�קK���ƶi��ۦP���ʧ@�Ӯ��O�귽----------------

function LuaPQ_CheckStage( CheckFlag ) 
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
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
---------------------------------------------------------�g�JPQ�����ܼƥ�------------------

function LuaPQ_WriteValue( name , Value , CheckFlag) --�N�S�w�ȼg�J�ثe�������ܼƤ����A������"Number"(�ֿn�p�ơ^ "Time"�]�Ѿl�ɶ��^  "Stage"�]���q�^ 
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
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

function LuaPQ_ChangeNum( Value , CheckFlag) --���ܭp�ƾ����ȡA���Ȭ��W�[�ֿn�Ʀr�A�t�Ȭ���ֲֿn�Ʀr
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	if Type(Value) == "number" then
		ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage] = ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage] + Value
	end
	return ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage]
end

function LuaPQ_ChangeTime( Value , CheckFlag) --���ܭp�ɾ��Ѿl�ɶ����ȡA���Ȭ��W�[�Ѿl�ɶ��A�t�Ȭ���ֳѾl�ɶ�
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	if Type(Value) == "number" then
		ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] = ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage] + Value
	end
	return ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage]
end

------------------------------------------------------��PQ�����ܼƥ�--------------------

function LuaPQ_GetValue( type , CheckFlag) --Ū���Y��pq�����ܼơA������ "Number"�]�ֿn�ƶq�^ "OrgNumber"�]�p�ƾ��]�w�ȡ^ "Time"�]�Ѿl�ɶ��^ "OrgTime"�]�p�ɾ��]�w�ȡ^ "Stage"�]���q�^ 
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
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

function LuaPQ_GetNum(CheckFlag) --Ū���ثe�p�ƾ����ȡ]�ֿn�ƶq�^
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 	
	return ZonePQ_ValueGroup_Drama[CheckFlag]["Number"][Stage]
end

function LuaPQ_GetOrgNum(CheckFlag) --Ū���p�ƾ��]�w�Ʀr����
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	return ZonePQ_ValueGroup_Drama[CheckFlag]["CheckNum"][Stage]
end

function LuaPQ_GetTime(CheckFlag) --Ū���ثe�p�ɾ��W���ȡ]�Ѿl�ɶ��^
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	return ZonePQ_ValueGroup_Drama[CheckFlag]["Time"][Stage]
end

function LuaPQ_GetOrgTime(CheckFlag) --Ū���p�ɾ��]�w�Ʀr����
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	return ZonePQ_ValueGroup_Drama[CheckFlag]["CheckTime"][Stage]
end

function LuaPQ_GetStage(CheckFlag) --Ū���ثe���q����
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
	end
	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] 
	return Stage
end
---------------------------��l�ȳ]�w�H�Ϋإߥ����ܼ�-------------------------------------------------------------------

function LuaPQ_CreatePQStage(Table1,Table2,CheckFlag)
	local StageTable = {}
	local TimeTable = {}
	local OrgStageTable = {}
	local OrgTimeTable = {}
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
	end
	local i = 1
	StageTable[0] = 0 --�𮧶��q
	OrgStageTable[0] = 0 
	for pry , obj in pairs(Table1)  do --�p��x�}���X�k��NPC�ƶq
		if Type(obj) == "number" then --�t�ȥN��ƶq�줧�᭫�m
			if Obj >= 0 then
				obj = math.floor(obj) --�����
			else
				obj = -1*math.floor(math.abs(obj) ) --�����
			end
			OrgStageTable[i] = obj
		else
			OrgStageTable[i] = 0
		end
		StageTable[i] = 0
		i = i + 1
	end
	i = 1
	for pry , obj in pairs(Table2)  do --�p��x�}���X�k��NPC�ƶq
		if Type(obj) == "number" then --�t�ȥN��ɶ��줧�᭫�m
			if Obj >= 0 then
				obj = math.floor(obj) --�����
			else
				obj = -1*math.floor(math.abs(obj) ) --�����
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
		if i == table.getn(Table2) then --��̫�@�ӼƦr�� TimeTable[0] �A�@�����m���ɶ�
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

--------------------------------------------------------------------���q����j��-------------------------------------------------

function LuaI_PQ_ControlCenter(CheckFlag) 
	--------------��l�ưѼ�------------------
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
	end
	local Timer = 0--�p�ɾ�
	local OrgTimer = 0--�p�ɾ����
	local Num = 0--�p�ƾ�
	local OrgNum = 0--�p�ƾ����
	local Stage = 0 --���q
	local Wait = "on"
	local SetState = "no"

	--------------�g�L���m�ɶ�����~�|�}�l-----
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

		if ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"] == 0 and Wait == "off" then --���m
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

----------------------------------------------------------------����n�x����j��------------------------------------------------------

function LuaI_PQ_ObjectController(CheckFlag) 
	--�`�N�I���󥻨��� PID �H�� EM_RoleValue_Register + 9 (EM_RoleValue_Register10) �����O�d�� PQ 
	--
	--------------��l�ưѼ�------------------
	--DebugLog( 2, "XXX"..GetName(OwnerID()).." PQ BEGING XXX" )
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
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

	if GameObjInfo_Int(OrgID , "CampID" ) == 6 then --�}�笰 Visitor �̤��B�z�԰�������
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
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 ) --���ä�
	View = "Hide"
	--DebugLog( 2, "XXX"..GetName(OwnerID()).." FIRST HIDE OK  XXX" )
	while 1 do
		Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"]
		if LuaPQ_CheckStage_Check( MyShow , Stage ) == false and View == "Show" and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 0 then
			SetStopAttack( OwnerID() )
			Lua_CancelAllBuff( OwnerID() ) 
			ClearHateList( OwnerID() , -1 )
			WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 ) --���ä�
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
			WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 1 ) --��ܤ�
			View = "Show"
			--DebugLog( 2, "XXX"..GetName(OwnerID()).." BE SHOW   XXX" )
		end
		sleep( 10 )
	end
	--DebugLog( 2, "XXX"..GetName(OwnerID()).." RESET XXX" )
	LuaFunc_ResetObj( OwnerID() )
end

function LuaI_PQ_ObjectController_RH(CheckFlag) --���q�u�v�T�X�{���v�T����( RH = Reborn Hind Only )
	--�`�N�I���󥻨��� PID �H�� EM_RoleValue_Register + 9 (EM_RoleValue_Register10) �����O�d�� PQ 
	--
	--------------��l�ưѼ�------------------
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
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

	if GameObjInfo_Int(OrgID , "CampID" ) == 6 then --�}�笰 Visitor �̤��B�z�԰�������
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
	WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 ) --���ä�
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
			WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 1 ) --��ܤ�
			View = "Show"
			break
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------