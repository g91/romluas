--------------------------------------------------------------------���q����j�餤����-------------------------------------------------

function LuaI_PQ_AllBeControledByOne( CheckFlag ) 
	--------------��l�ưѼ�------------------
	if CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then --Checkflag ����A���O�Ʀr�άO���t�ȡA�h������ roomid �� checkflag
		CheckFlag = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if  CheckFlag == nil or Type(CheckFlag) ~="number" or CheckFlag < 0 then
			CheckFlag = 0
		end
	else
		CheckFlag = math.floor(CheckFlag) --�p�G CheckFlag ���O��ơA�h�����
	end

	ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"] = {}
	local Timer = 0--�p�ɾ�
	local OrgTimer = 0--�p�ɾ����
	local Num = 0--�p�ƾ�
	local OrgNum = 0--�p�ƾ����
	local Stage = 0 --���q
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --RoomID
	local Wait = "on"
	local TempTable = {}
	local SetState = "no"

	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["CheckTime"]) do --�q CheckTime ���椸�ƨӧP�_���X�Ӷ��q
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

---------------------------------------------------��������ƨ禡�G������{������--------------------------------------------------

function LuaPQ_ChangeCircle(RoomID , Stage , CheckFlag )  --�Τ@�ӼȮɪ�table��Ȧs�_�ӡA�H�O�ҨC�@�Ӫ��󳣷|�Q�B�z��
	local TempTable = {}	

	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][Stage])  do  
		TempTable[pry] =  obj
	end
	
	for pry , obj in pairs(TempTable)  do  --�������{�ή���
		 LuaPQ_ObjectStateChange( obj , RoomID , Stage , CheckFlag ) --���禡�b�U��
	end

	TempTable = {}

end

function LuaPQ_ObjectStateChange( RoleID , RoomID , Stage ,CheckFlag )

	if CheckID(math.abs(RoleID)) == false or ReadRoleValue(math.abs(RoleID), EM_RoleValue_RoomID ) ~= RoomID or ReadRoleValue(math.abs(RoleID), EM_RoleValue_IsPlayer ) ~= 0 then
		for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do
			for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry])  do --��ؼбq�}�C������
				if obj2 == RoleID or obj2 == -RoleID then
					table.remove(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry],pry2) 
					break
				end
			end
		end
		return
	end

	local NowState = ReadRoleValue( math.abs(RoleID) , EM_RoleValue_Register + 9 )

	if RoleID > 0 and NowState == 0 then --�����A����ܪ��������
		local OrgID = ReadRoleValue( RoleID, EM_RoleValue_OrgID )
		if GameObjInfo_Int(OrgID , "CampID" ) == 6 then --�}�笰 Visitor �̤��B�z�԰�������
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
		WriteRoleValue( RoleID , EM_RoleValue_Register + 9 , 1 ) --��ܤ�
	end

	if RoleID < 0 and NowState == 1 and ReadRoleValue( math.abs(RoleID) , EM_RoleValue_IsDead ) == 0 then --�����A���������������
		for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do
			for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry])  do --��ؼбq�}�C������
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
		WriteRoleValue( RoleID , EM_RoleValue_Register + 9 , 0 ) --���ä�
		BeginPlot( RoleID , "LuaPQ_ObjectReset" , 0 )
	end

end

function LuaPQ_ObjectReset()
	LuaFunc_ResetObj( OwnerID() )
end
----------------------------------------------------------------�����l�@��-----------------------------------------------------

function LuaI_PQ_ObjectInitial(CheckFlag) 
	--�`�N�I���󥻨��� EM_RoleValue_Register + 7(EM_RoleValue_Register8)  �H�� EM_RoleValue_Register + 6 (EM_RoleValue_Register7) �����O�d�� PQ 
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
		return
	end

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )

	if GameObjInfo_Int(OrgID , "CampID" ) == 6 then --�}�笰 Visitor �̤��B�z�԰�������
		ModeFlag = {EM_SetModeType_Show , EM_SetModeType_Move , EM_SetModeType_ShowRoleHead }
	else
		ModeFlag = {EM_SetModeType_Show ,  EM_SetModeType_Move , EM_SetModeType_Strikback , EM_SetModeType_Searchenemy , EM_SetModeType_Fight , EM_SetModeType_ShowRoleHead}
	end

	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"]

	Hide( OwnerID() ) --����ۤv���ð_��
	sleep(10 + Rand(10)) --���ݤ��� NPC �X�{�åB�׶}�P�ɲ��ͷ|�y�����t�έt��

	if Stage == nil or LuaPQ_CheckStage_Check( MyShow , Stage ) == false then
		for pry , obj in pairs(ModeFlag)  do
			SetModeEx( OwnerID() , ModeFlag[pry] , false );
		end
		SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , true );
		SetModeEx( OwnerID() , EM_SetModeType_HideName, true );
		Show( OwnerID() , RoomID )
		MoveToFlagEnabled( OwnerID() , false )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 ) --���ä�
	else
		for pry , obj in pairs(ModeFlag)  do
			SetModeEx( OwnerID() , ModeFlag[pry] , true );
		end
		SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , false );
		SetModeEx( OwnerID() , EM_SetModeType_HideName, false );
		Show( OwnerID() , RoomID )
		MoveToFlagEnabled( OwnerID() , true )
		WriteRoleValue(  OwnerID()  , EM_RoleValue_Register + 9 , 1 ) --��ܤ�
	end
	------------------------��}�C���M�ۤv���ƪ����X�R��-----------------------
	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do
		for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry])  do 
			if obj2 == OwnerID()  or obj2 == -1*OwnerID()  then
				table.remove(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry],pry2) 
				break
			end
		end
	end
	------------------------------------------------------------------------------------------
	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do  --�⪫����}�C���A�������Ӷ��q�n��{�A�t�����Ӷ��q����{
		if LuaPQ_CheckStage_Check( MyShow , pry ) == true then
			table.insert(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry] , OwnerID()) 
		else
			table.insert(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry] , -1 * OwnerID() )
		end 
	end
end


function LuaI_PQ_ObjectInitial_RH(CheckFlag) --���q�u�v�T�X�{���v�T����( RH = Reborn Hind Only )

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
		return
	end

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )

	if GameObjInfo_Int(OrgID , "CampID" ) == 6 then --�}�笰 Visitor �̤��B�z�԰�������
		ModeFlag = {EM_SetModeType_Show , EM_SetModeType_Move , EM_SetModeType_ShowRoleHead }
	else
		ModeFlag = {EM_SetModeType_Show ,  EM_SetModeType_Move , EM_SetModeType_Strikback , EM_SetModeType_Searchenemy , EM_SetModeType_Fight , EM_SetModeType_ShowRoleHead}
	end

	local Stage = ZonePQ_ValueGroup_Drama[CheckFlag]["Stage"]

	Hide( OwnerID() ) --����ۤv���ð_��
	sleep(10 + Rand(10)) --���ݤ��� NPC �X�{�åB�׶}�P�ɲ��ͷ|�y�����t�έt��

	if Stage == nil or LuaPQ_CheckStage_Check( MyShow , Stage ) == false then
		for pry , obj in pairs(ModeFlag)  do
			SetModeEx( OwnerID() , ModeFlag[pry] , false );
		end
		SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , true );
		SetModeEx( OwnerID() , EM_SetModeType_HideName, true );
		Show( OwnerID() , RoomID )
		MoveToFlagEnabled( OwnerID() , false )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register + 9 , 0 ) --���ä�
	else
		for pry , obj in pairs(ModeFlag)  do
			SetModeEx( OwnerID() , ModeFlag[pry] , true );
		end
		SetModeEx( OwnerID() , EM_SetModeType_HideMinimap , false );
		SetModeEx( OwnerID() , EM_SetModeType_HideName, false );
		Show( OwnerID() , RoomID )
		MoveToFlagEnabled( OwnerID() , true )
		WriteRoleValue(  OwnerID()  , EM_RoleValue_Register + 9 , 1 ) --��ܤ�
	end
	------------------------��}�C���M�ۤv���ƪ����X�R��-----------------------
	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do
		for pry2 , obj2 in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry])  do 
			if obj2 == OwnerID()  or obj2 == -1*OwnerID()  then
				table.remove(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry],pry2) 
				break
			end
		end
	end
	------------------------------------------------------------------------------------------
	for pry , obj in pairs(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"])  do  --�⪫����}�C���A�������Ӷ��q�n��{
		if LuaPQ_CheckStage_Check( MyShow , pry ) == true then
			table.insert(ZonePQ_ValueGroup_Drama[CheckFlag]["Mob"][pry] , OwnerID()) 
		end 
	end
end