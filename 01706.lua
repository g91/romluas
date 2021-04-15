--==================================================--
-- ���q�y�{
-- 1. Phase1 �B�鶤�B�e�L�{
-- 2. Phase2 �s��Ϋe�W����(1���\)
-- 3. Phase3 �s����`����(2���\)
-- 4. Phase4 �s��έ������(3���\)
-- ?. Phase? �B�鶤���æ��\(4���\)
-- ?. Phase? �s��ηm�ܦ��\(2,3,4����)
-- ?. Phase? �B�e������(���˴�)
--==================================================--

--==================================================--
--  ���ը禡��                                      --
--==================================================--

function LuaPE_ZONE15_PE01TAD_DeleteAll( DeleteMode )
	local Obj = ZONE15_PE01TAD_Obj
	local StartNum = 1

	if DeleteMode ~= nil and DeleteMode == 1 then
		StartNum = 2
	end

	for i = StartNum, table.getn(Obj) do
		if CheckID(Obj[i]) == true then
			DelObj( Obj[i] )
		end
	end
end

function LuaPE_ZONE15_PE01TAD_KillThief()
	PE_SetVar( "ZONE15_PE01TAD_Var_ThiefKilled" , 30 )
end

function LuaPE_ZONE15_PE01TAD_KillGuard()
	local Var = ZONE15_PE01TAD_Var
	local GuardID = Var["GuardID"]
	local GuardLeaderID = Var["GuardLeaderID"]
	local Obj = ZONE15_PE01TAD_Obj
	
	for i=1, table.getn(Obj) do
		local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
		if OrgID == GuardID[1] or OrgID == GuardID[2] Or OrgID == GuardLeaderID then
			DelObj( Obj[i] )
		end
	end
	ZONE15_PE01TAD_Var["TotalGuardNum"] = ZONE15_PE01TAD_Var["PH2CanKillGuard"] + 1
end
--==================================================--



--==================================================--
--  �����ܼư�                                      --
--==================================================--
function LuaPE_ZONE15_PE01TAD_GlobalSet()
	ZONE15_PE01TAD_Obj = {}		-- �ϥΪ���޲z�}�C
	ZONE15_PE01TAD_Var = {}		-- �ϥΰѼƺ޲z�}�C
	ZONE15_PE01TAD_Phase = 0	-- ���q����

	ZONE15_PE01TAD_Var["ControllerID"] = 113714	-- �����(�}���c)
	ZONE15_PE01TAD_Var["Controller"] = 0		-- �����GID

	ZONE15_PE01TAD_Var["FlagID"] = 780536	-- �X��ID
	
	ZONE15_PE01TAD_Var["TotalGuardNum"] = 0	-- �����`��
	ZONE15_PE01TAD_Var["GuardNum"] = 0		-- �ثe�����ƶq
	ZONE15_PE01TAD_Var["ThiefNum"] = 0		-- �ثe�s��ƶq
	
	ZONE15_PE01TAD_Var["GuardCreateNum"] = 4 	-- �C�����Ͷ�����
	ZONE15_PE01TAD_Var["MaxGuardNum"] = 7	-- �������h�ƶq

	ZONE15_PE01TAD_Var["PH2NeedKillThief"]  = 30	-- ���q�G�ݭn�����s��ƥ�
	ZONE15_PE01TAD_Var["PH2CanKillGuard"] = 25		-- ���q�G�|�X�{�������ƥ�

	ZONE15_PE01TAD_Var["TransCarID"] = 103100	-- �B�f��ID
	ZONE15_PE01TAD_Var["TransCar"] = 0			-- �B�f��GID
	ZONE15_PE01TAD_Var["TransTeam"] = {}		-- �B�鶤��

	ZONE15_PE01TAD_Var["RobFlag"] = 24	-- �B�f��������ӺX�СA�s��n��

	ZONE15_PE01TAD_Var["ResetTime"] = 3600	-- �������ȭ��m�ɶ�(��)	1�p��
	ZONE15_PE01TAD_Var["TimeSpace"] = 15			-- �p�ɶ��j(��)
	
	ZONE15_PE01TAD_Var["GuardID"] = { 103101, 103102 }	-- �B�鶤��, �p�˹B�鶤��
	ZONE15_PE01TAD_Var["GuardLeaderID"] = 103103	-- �B��p����

	ZONE15_PE01TAD_Var["ThiefID"] = { 103104, 103105 }	-- �T���s��, �ʲr�s��
	ZONE15_PE01TAD_Var["ThiefLeaderID"] = 103106		-- �s��έ���D��R

	ZONE15_PE01TAD_Var["PH3Time"] = 90				-- ���q�T�`�ɶ�(��)
	
	ZONE15_PE01TAD_Var["AreaID"] = 765		-- �����ƥ���Ͻs��		�L��ù��
	ZONE15_PE01TAD_Var["TestID"] = 1		-- �����ƥ���հϽs��
	
end
--==================================================--



--==================================================--
--  �����ƥ�]�w��                                  --
--==================================================--

function LuaPE_ZONE15_PE01TAD_PESet()

	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_PESet Start!!" )
	local PE_Name = "SC_PE_ZONE15_01TAD_PENAME"	-- �s��Ϊ�ŧ��
	local PE_Desc = "SC_PE_ZONE15_01TAD_PEDESC"	-- ù�ܬ��B�鶤�O�N�f�����w�e��U�a���@�ӪZ�˹B�鶤�A���O�L�̩ҹB�e���f���w�g�Q��R�s��ΩҨn�W�A�p���B�f���Y�N��F�F�ԥ����o���Ϫ����...
	local PEIndex = 1
	local PE_ResetTime = ZONE15_PE01TAD_Var["ResetTime"] * 1000
	-- �s�W�@�Өƥ�
	PE_AddPE( PE_Name , PE_Desc , PEIndex , PE_ResetTime )

	local AreaID = ZONE15_PE01TAD_Var["AreaID"]
	local TestID = ZONE15_PE01TAD_Var["TestID"]
	PE_AddRegion( PEIndex , AreaID )	-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )	-- ��PE��i���հ�

	local PH1Index = 101
	local PH1_Name = "SC_PE_ZONE15_01TAD_PHNAME01"	-- ù�ܬ��B�鶤�����{
	local PH1_Desc = ""	-- �ѩ�B�鶤���V�O�A�N�f�����\�@�e��F��������C
	local PH2Index = 102
	local PH2_Name = "SC_PE_ZONE15_01TAD_PHNAME02"	-- ��R�s��α��l������
	local PH2_Desc = ""	-- �I��h�ɪ��T���s����{���v�A�}�lŧ���B�鶤�I
	local PH3Index = 103
	local PH3_Name = "SC_PE_ZONE15_01TAD_PHNAME03"	-- ��R�s��Ϊ����O����
	local PH3_Desc = ""	-- �s��@��ӥX�A���O�����B�鶤�H�ܨ��f���I
	local PH4Index = 104
	local PH4_Name = "SC_PE_ZONE15_01TAD_PHNAME04"	-- �s��έ���D��R���̫����
	local PH4_Desc = ""	-- �s��Τw���ƶɱ_�ӥX�A�֨�U�B�鶤�A�O�@��f���a�I

	PE_AddPhase( PEIndex , PH1Index , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q1
	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q2
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q3
	PE_AddPhase( PEIndex , PH4Index , PH4_Name , PH4_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q4

	local OB1Index = 1001
	local OB1_Name = "SC_PE_ZONE15_01TAD_OBNAME01"	-- �B�f����F
	local OB1_Desc = ""
	-- �s�W�@�ӥؼСA���q1���\����G�B�f����F
	PE_PH_AddObjective_Equal( PEIndex , PH1Index , OB1Index , OB1_Name , OB1_Desc , "ZONE15_PE01TAD_Var_TransCarComing" , 0 , 1 ,  true )

	local OB2Index = 1002
	local OB2_Name = "SC_PE_ZONE15_01TAD_OBNAME02"	-- ����T���s��
	local OB2_Desc = ""
	-- �s�W�@�ӥؼСA���q2���\����G����30�ӵs��
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "ZONE15_PE01TAD_Var_ThiefKilled" , 0 , ZONE15_PE01TAD_Var["PH2NeedKillThief"] ,  true )

	local OB3Index = 1003
	local OB3_Name = "SC_PE_ZONE15_01TAD_OBNAME03"	-- ��׶�R�s��Ϊ����O���� 
	local OB3_Desc = ""
	-- �s�W�@�ӥؼСA���q3���\����G���L���w�ɶ�
	PE_PH_AddObjective_TimeLimit( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "ZONE15_PE01TAD_Time" , ZONE15_PE01TAD_Var["PH3Time"]*1000 , 0 ,  true )

	local OB4Index = 1004
	local OB4_Name = "SC_PE_ZONE15_01TAD_OBNAME04"	-- ���˵s��έ���D��R
	local OB4_Desc = ""
	-- �s�W�@�ӥؼСA���q4���\����G�F���s��έ���
	PE_PH_AddObjective_Equal( PEIndex , PH4Index , OB4Index , OB4_Name , OB4_Desc , "ZONE15_PE01TAD_Var_ThiefBossKill" , 0 , 1 ,  true )

	local OB5Index = 1005
	local OB5_Name = "SC_PE_ZONE15_01TAD_OBNAME05"	-- �B�f���Q���ܤ@��
	local OB5_Desc = ""
	-- �s�W�@�ӥؼСA���q2,3,4���ѱ���G�B�f���Q����
	PE_PH_AddObjective_Equal( PEIndex , PH2Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE01TAD_Var_TransCarKill" , 0 , 1 ,  false )
	PE_PH_AddObjective_Equal( PEIndex , PH3Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE01TAD_Var_TransCarKill" , 0 , 1 ,  false )
	PE_PH_AddObjective_Equal( PEIndex , PH4Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE01TAD_Var_TransCarKill" , 0 , 1 ,  false )

	-- �]�w���q�s��
	PE_PH_SetNextPhase( PEIndex , PH1Index , PH2Index )
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )

	-- �]�w�ؼйF�����^��禡
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE15_PE01TAD_OB_OnAchieve" )
	
	-- �]�w�ƥ󵲧�������^��禡
	PE_SetCallBackOnBalance( PEIndex , "LuaPE_ZONE15_PE01TAD_FinalExchange" )

	-- �ƥ�Ұ�
	PE_Start( PEIndex , PH1Index )
	
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_PESet END!!" )
end

function LuaPE_ZONE15_PE01TAD_OB_OnAchieve( PEIndex , PHIndex , OBIndex )
	local Ctrl = ZONE15_PE01TAD_Var["Controller"]

	if PHIndex == 101 and OBIndex == 1001 then
		LuaPE_ZONE15_PE01TAD_Message( 2  )--�s��}�l�X�{
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_ThiefTimeCreate" , 0 )	-- ���s��
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_GuardTimeCreate" , 0 )	-- ���@��
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_FlagtoCallAttack", 0 )	--�w���ˬd
	elseif PHIndex == 102 and OBIndex == 1002 then
		LuaPE_ZONE15_PE01TAD_Message( 3  )--�s��j�q�X�{		
	elseif PHIndex == 103 and OBIndex == 1003 then
		LuaPE_ZONE15_PE01TAD_Message( 4  )--BOSS�X�{
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_BossCreate", 0 )-- ��BOSS��
	elseif PHIndex == 104 and OBIndex == 1004 then
		LuaPE_ZONE15_PE01TAD_Message( 5  )
		LuaPE_ZONE15_PE01TAD_Message( 7  )
		LuaPE_ZONE15_PE01TAD_RobBack( true )--NPC���}
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_Reset", 0 )
	elseif OBIndex == 1005 then
		LuaPE_ZONE15_PE01TAD_Message( 6  )
		LuaPE_ZONE15_PE01TAD_RobBack( false )--NPC���}
		CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_Reset", 0 )
	end
end

function LuaPE_ZONE15_PE01TAD_FinalExchange( PEIndex , GUID , Score )
	local LV = 54
	local MapID = ZONE15_PE01TAD_Var["AreaID"]
	if LuaPE_ZONE15_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = 10
	local TokenID = 206871	-- ù�ܬ��զ�ï]
	
	if Score > ExCha_Ratio then
		if Score >= 600 then Score = 600 end
		GiveBodyItem( GUID , TokenID , math.floor( Score/ExCha_Ratio ) )
	end
end

--==================================================--

--==================================================--
--  �T���B�z��                                      --
--==================================================--

--�ǰe�T��
function LuaPE_ZONE15_PE01TAD_Message( Index  )	
	ZONE15_PE01TAD_Phase = Index
	local Ctrl = ZONE15_PE01TAD_Var["Controller"]
	local Color = "0xffffff00"	-- �j��T��������

	local Message = {}
	Message[1] = "[SC_PE_ZONE15_01TAD_M04]"	-- ù�ܬ��B�鶤�Y�N��F�F�ԥ����o���Ϧ���I
	Message[2] = "[SC_PE_ZONE15_01TAD_M05]"	-- �I��b���񪺶�R�s��α��l�X�{�F�I
	Message[3] = "[SC_PE_ZONE15_01TAD_M06]"	-- ��R�s��Ϊ��s��i�}�F���O�����I
	Message[4] = "[SC_PE_ZONE15_01TAD_M07]"	-- �s��έ���D��R�{���o�ʳ̫�����I�I
	Message[5] = "[SC_PE_ZONE15_01TAD_M08]"	-- �f�������\���Q�O�@�U�ӡI
	Message[6] = "[SC_PE_ZONE15_01TAD_M09]"	-- ��R�s��Ϊ��s��N�f���m�ܦ^�h�F�I�I
	Message[7] = "[SC_PE_ZONE15_01TAD_M10]"	-- ��R�s��δݾl���s��ܬӪ��M�h�F�I�I
	
	
	if Index == 1 or Index > 5 then
		ScriptMessage( Ctrl, -1 , 1 , Message[Index] , Color )
		ScriptMessage( Ctrl, -1 , 0 , Message[Index] , Color )
	else
		local AreaID = ZONE15_PE01TAD_Var["AreaID"]	-- �Ǫ��ɵ��u�F��
		local AreaPlayer = LuaPE_ZONE15_GetAreaPlayer( AreaID )
		for i = 1 , table.getn(AreaPlayer) do
			ScriptMessage( Ctrl, AreaPlayer[i] , 1 , Message[Index] , Color )
			ScriptMessage( Ctrl, AreaPlayer[i] , 0 , Message[Index] , Color )
		end
	end
	DebugMsg(0,0,"LuaPE_ZONE15_PE01TAD_Message "..Index )
end

--==================================================--



--==================================================--
--  �@�Ψ禡��                                      --
--==================================================--

--���󲣥�
function LuaPE_ZONE15_PE01TAD_ObjCreate( ObjID , FlagID , Flag , ObjNum, ObjType )
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ObjCreate Start!!" )
	local Obj = {}
	local RoomID = 0
		
	for i = 1 , ObjNum do
		if Type(ObjID) == "table" then
			Obj[i] = CreateObjByFlag( ObjID[(i%2)+1], FlagID , Flag[i], 1 )
		else
			Obj[i] = CreateObjByFlag( ObjID, FlagID , Flag, 1 )
		end

		WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 0 )	-- �ζ]������
		AddToPartition( Obj[i] , RoomID )
		SetIdleMotion( Obj[i] , ruFUSION_ACTORSTATE_COMBAT_1H )	-- �w�]�O�԰��ʧ@
		MoveToFlagEnabled( Obj[i] , false )		-- �������޼@��
		table.insert( ZONE15_PE01TAD_Obj , Obj[i] )	-- �[�J����޲z�}�C
		
		AddBuff( Obj[i] , 506303 , 0 , -1 )	-- ��AE��Buff
		SetFlag( Obj[i], 544801, 1 )--�������_��(4.0.0�l�[)
		
		if ObjType == "NPC" then
			ZONE15_PE01TAD_Var["TotalGuardNum"] = ZONE15_PE01TAD_Var["TotalGuardNum"] +1
			ZONE15_PE01TAD_Var["GuardNum"] = ZONE15_PE01TAD_Var["GuardNum"] + 1
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE01TAD_GuardDead", 0 )
		elseif ObjType == "Thief" then
			ZONE15_PE01TAD_Var["ThiefNum"] = ZONE15_PE01TAD_Var["ThiefNum"] + 1
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE01TAD_ThiefDead", 0 )
		else
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE01TAD_BossDead", 0 )			
		end
		
		CallPlot( Obj[i] , "LuaPE_ZONE15_PE01TAD_NPCDo" , 0 )
		Sleep( 1 )
	end

	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ObjCreate END!!" )
	if ObjNum == 1 then
		return obj[1]
	end
	return obj
end

function LuaPE_ZONE15_PE01TAD_SetAttack()--�n�D�����f��
	local Obj = ZONE15_PE01TAD_Obj
	local Var = ZONE15_PE01TAD_Var
	local TransCarID = Var["TransCarID"]
	local ThiefID = Var["ThiefID"]
	local ThiefLeaderID = Var["ThiefLeaderID"]
	local x = ReadRoleValue( TransCarID, EM_RoleValue_X )
	local y = ReadRoleValue( TransCarID, EM_RoleValue_Y )
	local z = ReadRoleValue( TransCarID, EM_RoleValue_Z )
		
	for i=1, table.getn(Obj) do
		local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
		if OrgID == ThiefID[1] or OrgID == ThiefID[2] or OrgID == ThiefLeaderID then
			ClearHateList( Obj[i], -1 )
			MoveDirect( Obj[i], x, y, z )
			SetAttack( Obj[i] , TransCarID )	-- �Ҧ��H����
		end
	end
end

--==================================================--

--==================================================--
--  �s��Ω]ŧ  ���󲣥Ͱ�                          --
--==================================================--
function LuaPE_ZONE15_PE01TAD_GuardTimeCreate()--�����@��
	local Var = ZONE15_PE01TAD_Var
	
	local TimeSpace = Var["TimeSpace"]		-- �p�ɶ��j(��)
	local GuardID = Var["GuardID"]	
	local FlagID = Var["FlagID"]	
	local GuardNum = Var["GuardNum"]	-- �������ͼƥ�
	local MaxNum = Var["MaxGuardNum"]
	local TimeCreateNum = Var["GuardCreateNum"]
	local Flag = { 1 , 2 , 3 , 4 , 5 }

	while true do
		Sleep( TimeSpace * 20 )
		local Num = Var["GuardNum"]	-- �������ͼƥ�
		local CreateNum = 0
	
		if ZONE15_PE01TAD_Phase > 4 or Var["TotalGuardNum"] >= Var["PH2CanKillGuard"] then
			break;
		elseif Num < MaxNum then
			CreateNum = MaxNum - Num
			if CreateNum >= TimeCreateNum then
				LuaPE_ZONE15_PE01TAD_ObjCreate( GuardID , FlagID , Flag , TimeCreateNum, "NPC" )
			elseif CreateNum < TimeCreateNum and CreateNum > 0 then
				LuaPE_ZONE15_PE01TAD_ObjCreate( GuardID , FlagID , Flag , CreateNum, "NPC" )
			else
				DebugLog( 2, "LuaPE_ZONE15_PE01TAD_GuardTimeCreate 0" )
			end
		end		
	end
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_GuardTimeCreate END" ) 
end

function LuaPE_ZONE15_PE01TAD_ThiefTimeCreate()--���͵s���
	local Var = ZONE15_PE01TAD_Var
	local FlagID = Var["FlagID"]
	local TimeSpace = Var["TimeSpace"]		-- �p�ɶ��j(��)
	local ThiefID = Var["ThiefID"]
	local Flag = { 6 , 7 , 8 , 9 , 10 , 6 , 7 , 8 , 9 , 10 }
	
	while true do			
		local Num = Var["ThiefNum"]-- �ثe�Ǫ��ƶq
		local MaxNum = ZONE15_PE01TAD_Phase*4 
		local TimeCreateNum = math.floor( ZONE15_PE01TAD_Phase*2 )
		local CreateNum = 0
		
		if ZONE15_PE01TAD_Phase > 4 then
			break;	
		elseif Num < MaxNum then
			CreateNum = MaxNum - Num			
			if CreateNum >= TimeCreateNum then
				LuaPE_ZONE15_PE01TAD_ObjCreate( ThiefID , FlagID , Flag , TimeCreateNum, "Thief" )
			elseif CreateNum < TimeCreateNum and CreateNum > 0 then
				LuaPE_ZONE15_PE01TAD_ObjCreate( ThiefID , FlagID , Flag , CreateNum, "Thief" )
			else
				DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ThiefTimeCreate 0" )
			end
		end

		Sleep( TimeSpace * 10 )
	end
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ThiefTimeCreate END!!" )
end

function LuaPE_ZONE15_PE01TAD_BossCreate()--����BOSS
	local ThiefLeaderID = ZONE15_PE01TAD_Var["ThiefLeaderID"]	
	local FlagID = ZONE15_PE01TAD_Var["FlagID"]
	local Boss = LuaPE_ZONE15_PE01TAD_ObjCreate( ThiefLeaderID , FlagID , 24 , 1 , "Boss" )
	AddBuff( Boss, 502546, 0, -1 )--��j1.3
	NPCSay( Boss, "[SC_PE_ZONE15_01TAD_M13]" )	-- �ӺC�F�I�ڿ˦ۨӷm�f�����I
	
	CallPlot( ZONE15_PE01TAD_Var["Controller"], "LuaPE_ZONE15_PE01TAD_SetAttack", 0 )
end

function LuaPE_ZONE15_PE01TAD_TransTeamCreate()	-- ���͹B�鶤
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_TransTeamCreate Start!!" )
	local Var = ZONE15_PE01TAD_Var

-- �o�H�U�O�B�f��
	local TransCarID = Var["TransCarID"]
	local FlagID = Var["FlagID"]
	local TransCarBronFlag = 21
	local RoomID = 0

	local TransCar = CreateObjByFlag( TransCarID , FlagID , TransCarBronFlag , 1 )
	SetModeEx( TransCar , EM_SetModeType_Mark , false )		-- �аO
	SetModeEx( TransCar , EM_SetModeType_Strikback , false )	-- ����
	SetModeEx( TransCar , EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( TransCar , EM_SetModeType_Fight , false )		-- �i�������
	SetModeEx( TransCar , EM_SetModeType_ShowRoleHead , false )	-- �Y����
	--WriteRoleValue( TransCar , EM_RoleValue_IsAttackMode , 0 )	-- ���O�������A
	WriteRoleValue( TransCar , EM_RoleValue_IsWalk , 1 )	-- �Ψ�������
	AddToPartition( TransCar , RoomID )
	MoveToFlagEnabled( TransCar , false )	-- �������޼@��
	AddBuff( TransCar, 502707, 0, -1 )--HP����^�_
	table.insert( ZONE15_PE01TAD_Obj , TransCar )
	ZONE15_PE01TAD_Var["TransCar"] = TransCar 
	Sleep( 5 )
	
	SetPlot( TransCar , "DEAD" , "LuaPE_ZONE15_PE01TAD_CarDead" , 0 )	-- �]�w���`�@��

-- �o�H�U�O�B�鶤
	local GuardID = Var["GuardID"]
	local GuardLeaderID =  Var["GuardLeaderID"]
	
	local TransTeamID = { GuardLeaderID , GuardID[2] , GuardID[2] , GuardID[1] , GuardID[1], GuardID[1] }
	local TransTeamNum = 5	-- �o��u���� �e�򥪥k���䪺�@��

	local X = ReadRoleValue( TransCar , EM_RoleValue_X )
 	local Y = ReadRoleValue( TransCar , EM_RoleValue_Y )
 	local Z = ReadRoleValue( TransCar , EM_RoleValue_Z )
	local Dir = ReadRoleValue( TransCar , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( TransCar , EM_RoleValue_RoomID )

	local Width = 30
	local Height = 30

	local TransTeam = {}
	local TransTeamBornPosition = LuaPE_ZONE15_FormationPosition( X , Y , Z , Width , Height , Dir )

	for i = 1 , TransTeamNum do
		if TransTeamID[i] ~= nil then
			TransTeam[i] = CreateObj( TransTeamID[i] , TransTeamBornPosition["X"][i], TransTeamBornPosition["Y"][i] , TransTeamBornPosition["Z"][i] , Dir , 1 )
			SetModeEx( TransTeam[i] , EM_SetModeType_Mark , false )			-- �аO
			SetModeEx( TransTeam[i] , EM_SetModeType_Strikback , false )	-- ����
			SetModeEx( TransTeam[i] , EM_SetModeType_Searchenemy , false )	-- ����
			SetModeEx( TransTeam[i] , EM_SetModeType_Fight , false )		-- �i�������
			WriteRoleValue( TransTeam[i] , EM_RoleValue_IsWalk , 1 )		-- �Ψ�������
			AddToPartition( TransTeam[i] , RoomID )
			MoveToFlagEnabled( TransTeam[i] , false )	-- �������޼@��
			table.insert( ZONE15_PE01TAD_Obj , TransTeam[i] )
			SetPlot( TransTeam[i] , "DEAD" , "LuaPE_ZONE15_PE01TAD_GuardDead" , 0 )	-- �]�w���`�@��
		end
	end
	
	ZONE15_PE01TAD_Var["GuardNum"] = ZONE15_PE01TAD_Var["GuardNum"] + TransTeamNum
	ZONE15_PE01TAD_Var["TotalGuardNum"] = ZONE15_PE01TAD_Var["TotalGuardNum"] + TransTeamNum
	ZONE15_PE01TAD_Var["TransTeam"] = TransTeam

	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_TransTeamCreate END!!" )
end
--==================================================--



--==================================================--
--  �s��Ω]ŧ  ���`�B�z��                          --
--==================================================--
function LuaPE_ZONE15_PE01TAD_GuardDead()
	if ZONE15_PE01TAD_Phase < 5 then
		ZONE15_PE01TAD_Var["GuardNum"] = ZONE15_PE01TAD_Var["GuardNum"] - 1
	end
	DelObj( OwnerID() )
	return true;
end

function LuaPE_ZONE15_PE01TAD_ThiefDead()
	if ZONE15_PE01TAD_Phase < 5 then
		local PEIndex = 1
		local MapID = ZONE15_PE01TAD_Var["AreaID"]
		local Car = ZONE15_PE01TAD_Var["TransCar"]
		LuaPE_ZONE15_GetBonus( PEIndex, MapID, 3,  450, Car )         -- ������������
		
		ZONE15_PE01TAD_Var["ThiefNum"] = ZONE15_PE01TAD_Var["ThiefNum"] - 1
		PE_SetVar( "ZONE15_PE01TAD_Var_ThiefKilled" , PE_GetVar( "ZONE15_PE01TAD_Var_ThiefKilled" )+1  )		-- PE�ܼƧ���
	end
	DelObj( OwnerID() )
	return true;
end

function LuaPE_ZONE15_PE01TAD_BossDead()
	PE_SetVar( "ZONE15_PE01TAD_Var_ThiefBossKill" , 1 )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ReadRoleValue( TargetID() , EM_RoleValue_IsNPC ) == 0 then
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_	
			RunningMsg( OwnerID() , 1 , "[SC_PE_ZONE15_01TAD_M14][$SETVAR1="..GetName(TargetID()).."]" )		-- �b���a [$VAR1] �^�i���@�Ԥ��U�A[103106] �Q���h�F�I
		end
	else
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_	
			RunningMsg( OwnerID() , 1 , "[SC_PE_ZONE15_01TAD_M15]" )		-- �b���H�^�i���@�Ԥ��U�A[103106] �Q���h�F�I
		end
	end

	local PEIndex = 1
	local MapID = ZONE15_PE01TAD_Var["AreaID"]
	local Car = ZONE15_PE01TAD_Var["TransCar"]
	LuaPE_ZONE15_GetBonus( PEIndex, MapID, 50, 450, Car )         -- ������������
	DelObj( OwnerID() )
	return true;
end

function LuaPE_ZONE15_PE01TAD_CarDead()
	PE_SetVar( "ZONE15_PE01TAD_Var_TransCarKill" , 1 )
	DelObj( OwnerID() )
	return true;
end
--==================================================--



--==================================================--
--  �s��Ω]ŧ  ���ʪ�t��                          --
--==================================================--

function LuaPE_ZONE15_PE01TAD_NPCDo()
	local FlagObjID = ZONE15_PE01TAD_Var["FlagID"]
	local FlagGoID = ZONE15_PE01TAD_Var["RobFlag"]
	local Range = 30

	LuaPE_ZONE15_ObjGoFlag( OwnerID() , FlagObjID , FlagGoID , Range )
end

function LuaPE_ZONE15_PE01TAD_TransTeamDo()
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_TransTeamDo Start!!" )
	local Var = ZONE15_PE01TAD_Var

	local TransCar = Var["TransCar"]
	local TransTeam = Var["TransTeam"]
	local FlagObjID = Var["FlagID"]
	local FlagGoID = 21	-- �q�� 21 �I�}�l��
	local Range = 30
	local Width = 30
	local Height = 50
	local CheckDis = 30
	local TransTeamNum = 5	-- �o��u���� �e�򥪥k���䪺�@��

	local FlagX = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )
	
	local RoomID = 0

	local TransCarDir = ReadRoleValue( TransCar , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( TransCar, EM_RoleValue_RoomID )
	PreviousDir = TransCarDir

	while true do
		Sleep( 10 )
		local TransCarX = ReadRoleValue( TransCar , EM_RoleValue_X )
	 	local TransCarY = ReadRoleValue( TransCar , EM_RoleValue_Y )
	 	local TransCarZ = ReadRoleValue( TransCar , EM_RoleValue_Z )
		local TransCarDir = ReadRoleValue( TransCar , EM_RoleValue_Dir )

		if math.abs( TransCarX - FlagX ) < Range and math.abs( TransCarZ - FlagZ ) < Range then	-- ����w�I�]�w�U�@�I��m
			FlagGoID = FlagGoID + 1
			FlagX = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
			FlagY = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
			FlagZ = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )
			FlagX = FlagX + Rand( Range ) * 2 - Range + 1
			FlagZ = FlagZ + Rand( Range ) * 2 - Range + 1
			MoveDirect( TransCar , FlagX , FlagY , FlagZ )	-- �B�f������
		end

		local DeltaDir = math.abs( PreviousDir - TransCarDir )	--��V�B�z�A�ݬO�_�ݭn�ܤư}����m
		if DeltaDir > 90 and DeltaDir < 270 then	-- �ܤư}����m
			local tmp = 0
			if TransTeam[1] ~= nil and TransTeam[6] ~= nil then
				tmp = TransTeam[1]
				TransTeam[1] = TransTeam[6]
				TransTeam[6] = tmp
			end
			if TransTeam[2] ~= nil and TransTeam[5] ~= nil then
				tmp = TransTeam[2]
				TransTeam[2] = TransTeam[5]
				TransTeam[5] = tmp
			end
			if TransTeam[3] ~= nil and TransTeam[4] ~= nil then
				tmp = TransTeam[3]
				TransTeam[3] = TransTeam[4]
				TransTeam[4] = tmp
			end
		end
		PreviousDir = TransCarDir

		local TransTeamBornPosition = LuaPE_ZONE15_FormationPosition( TransCarX , TransCarY , TransCarZ , Width , Height , TransCarDir )	-- �p��Ө��쪺��m

		for i = 1 , TransTeamNum do
			if TransTeam[i] ~= nil and CheckID( TransTeam[i] ) == true and ReadRoleValue( TransTeam[i] , EM_RoleValue_IsNPC ) == 1 then	-- �O�_ NPC �B�s�b
				local DeltaX = math.abs( TransTeamBornPosition["X"][i]-ReadRoleValue( TransTeam[i] , EM_RoleValue_X ) )
				local DeltaY = math.abs( TransTeamBornPosition["Y"][i]-ReadRoleValue( TransTeam[i] , EM_RoleValue_Y ) )
				local DeltaZ = math.abs( TransTeamBornPosition["Z"][i]-ReadRoleValue( TransTeam[i] , EM_RoleValue_Z ) )
				if DeltaX > CheckDis or DeltaY > CheckDis or DeltaZ > CheckDis then
					WriteRoleValue( TransTeam[i] , EM_RoleValue_IsWalk , 0 )
					if DeltaX < 2*CheckDis and DeltaY < 2*CheckDis and DeltaZ < 2*CheckDis then
						WriteRoleValue( TransTeam[i] , EM_RoleValue_IsWalk , 1 )
						MoveDirect( TransTeam[i] , TransTeamBornPosition["X"][i] , TransTeamBornPosition["Y"][i] , TransTeamBornPosition["Z"][i] )
					else
						WriteRoleValue( TransTeam[i] , EM_RoleValue_IsWalk , 0 )
						Move( TransTeam[i] , TransTeamBornPosition["X"][i] , TransTeamBornPosition["Y"][i] , TransTeamBornPosition["Z"][i] )
					end
				else
					WriteRoleValue( TransTeam[i] , EM_RoleValue_IsWalk , 1 )
					MoveDirect( TransTeam[i] , TransTeamBornPosition["X"][i] , TransTeamBornPosition["Y"][i] , TransTeamBornPosition["Z"][i] )
				end
			end
		end
		
		if FlagGoID == Var["RobFlag"] then
			PE_SetVar( "ZONE15_PE01TAD_Var_TransCarComing" , 1 )

			for j = 1 , table.getn(TransTeam) do
				Hide( TransTeam[j] )
				SetModeEx( TransTeam[j] , EM_SetModeType_Mark , true )			-- �аO
				SetModeEx( TransTeam[j] , EM_SetModeType_Strikback , true )		-- ����
				SetModeEx( TransTeam[j] , EM_SetModeType_Searchenemy , true )	-- ����
				SetModeEx( TransTeam[j] , EM_SetModeType_Fight , true )			-- �i�������
				SetIdleMotion( TransTeam[j] , ruFUSION_ACTORSTATE_COMBAT_1H )	-- �w�]�O�԰��ʧ@			
				Show( TransTeam[j] , RoomID )
				if j == 1 then
					NPCSay( TransTeam[j] , "[SC_PE_ZONE15_01TAD_M11]" )
				else
					NPCSay( TransTeam[j] , "[SC_PE_ZONE15_01TAD_M12]" )
				end
			end

	--�`�N�I���H�ӷm�T�F�A�O�@�n�f�����I
			Hide( TransCar )
			SetModeEx( TransCar , EM_SetModeType_Mark , true )		-- �аO
			SetModeEx( TransCar , EM_SetModeType_Fight , true )		-- �i�������
			SetModeEx( TransCar , EM_SetModeType_Move , false )		-- ������
			SetModeEx( TransCar , EM_SetModeType_ShowRoleHead , true )	-- �Y����			
			Show( TransCar , RoomID )
			break;
		end
	end
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_TransTeamDo END!!" )
end

function LuaPE_ZONE15_PE01TAD_FlagtoCallAttack()	-- ����H���o�b
	local Obj = ZONE15_PE01TAD_Obj
	local Var = ZONE15_PE01TAD_Var
	local GuardID = Var["GuardID"]
	local ThiefID = Var["ThiefID"]
	local GuardLeaderID = Var["GuardLeaderID"]
	local ThiefLeaderID = Var["ThiefLeaderID"]
	local TransCarID = Var["TransCarID"]

	while true do
		if ZONE15_PE01TAD_Phase > 4 then break end
		
		local Guard = {}	-- �k�s
		local Thief = {}	-- �k�s

		for i = 1, table.getn(Obj) do
			if CheckID(Obj[i]) == true and ReadRoleValue( Obj[i] , EM_RoleValue_IsDead ) ~= 1 then
				local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
				if OrgID == GuardID[1] or OrgID == GuardID[2] or OrgID == GuardLeaderID or OrgID == TransCarID then
					table.insert( Guard , Obj[i] )
				elseif OrgID == ThiefID[1] or OrgID == ThiefID[2] or OrgID == ThiefLeaderID then
					table.insert( Thief , Obj[i] )
				end
			end
		end

		for i = 1, table.getn(Guard) do
			if CheckID( Guard[i]) == true then							
				if ReadRoleValue( Guard[i], EM_RoleValue_AttackTargetID ) == 0 and HateListCount( Guard[i] ) == 0 then
					local Num = table.getn(Thief )
					for j=1, Num do
						local Rnd = rand(Num)+1
						if CheckID(Thief[Rnd]) == true then
							SetAttack( Guard[i] , Thief[Rnd] )
							break
						end
					end
				end
			end
		end

		for i = 1, table.getn(Thief) do
			if CheckID( Thief[i]) == true then							
				if ReadRoleValue( Thief[i], EM_RoleValue_AttackTargetID ) == 0 and HateListCount( Thief[i] ) == 0 then
					local Num = table.getn(Guard )
					for j=1, Num do
						local Rnd = rand(Num)+1
						if CheckID(Guard[Rnd]) == true then
							SetAttack( Thief[i] , Guard[Rnd] )
							break
						end
					end
				end
			end
		end
		sleep( 50 )
	end
end

--==================================================--



--==================================================--
--  �s��Ω]ŧ  ��t���t��                          --
--==================================================--

function LuaPE_ZONE15_PE01TAD_RobBack( Victory )
	local Obj = ZONE15_PE01TAD_Obj
	local Var = ZONE15_PE01TAD_Var
	local TransCar = Var["TransCar"]
	local GuardID = Var["GuardID"]
	local ThiefID = Var["ThiefID"]
	local GuardLeaderID = Var["GuardLeaderID"]
	local ThiefLeaderID = Var["ThiefLeaderID"]
	if CheckID( TransCar ) == true then
		Hide( TransCar )
		DelObj( TransCar )
	end
	
	for i = 1, table.getn(Obj) do
		if Obj[i] ~= nil and CheckID(Obj[i]) == true then
			LuaPE_ZONE15_StopAttack( Obj[i] )

			local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
			if OrgID == GuardID[1] or OrgID == GuardID[2] Or OrgID == GuardLeaderID then
				CallPlot( Obj[i] , "LuaPE_ZONE15_PE01TAD_GuardWinDo" , Victory )
			elseif OrgID == ThiefID[1] or OrgID == ThiefID[2] or OrgID == ThiefLeaderID then
				BeginPlot( Obj[i] , "LuaPE_ZONE15_PE01TAD_ThiefRobBackDo" , 0 )
			end
		end
	end
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_RobBack" )
end

function LuaPE_ZONE15_PE01TAD_GuardWinDo( Victory )
	if Victory == true then
		Sleep( 30 )
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		WriteRoleValue( OwnerID(), EM_RoleValue_LiveTime, 2 )
	else
		DelObj( OwnerID() )
	end
end

function LuaPE_ZONE15_PE01TAD_ThiefRobBackDo()
	local FlagObjID = ZONE15_PE01TAD_Var["FlagID"]
	local FlagGoID = 6
	local Range = 30
	
	WriteRoleValue( OwnerID(), EM_RoleValue_LiveTime, 3 )
	LuaPE_ZONE15_ObjGoFlag( OwnerID() , FlagObjID , FlagGoID , Range )
	DelObj( OwnerID() )
end
--==================================================--

--==================================================--
--  �s��Ω]ŧ  �ҰʳB�z��                          --
--==================================================--

function LuaPE_ZONE15_PE01TAD_Start( Mode )
	local Obj = ZONE15_PE01TAD_Obj
	local tmp = 0
	
	if Obj ~= nil then
		tmp = ZONE15_PE01TAD_Var["Controller"]
		--LuaPE_ZONE15_PE01TAD_DeleteAll( Mode )	-- �N���e���e�@�Өƥ󪺪�������R��
	end

	LuaPE_ZONE15_PE01TAD_GlobalSet()	-- �@���ܼƳ]�w
	if Mode == nil then
		LuaPE_ZONE15_PE01TAD_PESet()		-- �����ƥ�]�w
	end

	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ControllerSet Start!!" )
	local ControllerID = ZONE15_PE01TAD_Var["ControllerID"]		-- �}���c
	local FlagID = ZONE15_PE01TAD_Var["FlagID"]		-- �X�lID
	local Flag = 11					-- �X�ͺX�l11
	local RoomID = 0
	local Ctrl = LuaPE_ZONE15_ControllerSet( ControllerID , FlagID , Flag , RoomID )	-- �]�w�����
	ZONE15_PE01TAD_Var["Controller"] = Ctrl
	ZONE15_PE01TAD_Obj[1] = Ctrl	-- �N�ާ@����[�J�Ĥ@��
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_ControllerSet END!!" )
	
	LuaPE_ZONE15_PE01TAD_TransTeamCreate()			-- ���͹B�鶤
	CallPlot( Ctrl, "LuaPE_ZONE15_PE01TAD_TransTeamDo", 0 )	--�}�l����	
	LuaPE_ZONE15_PE01TAD_Message( 1 )				--�e�X�T��
	
	if tmp ~= 0 then 
		DelObj(tmp)
		DebugMsg(0,0,"Del ZONE15_PE01 Ctrl")
	end
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_Start!!" )
	
end

function LuaPE_ZONE15_PE01TAD_Reset()--���m
	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_END!!" )
	
	LuaPE_ZONE15_PE01TAD_DeleteAll( 1 )	-- �N���e���e�@�Өƥ󪺪�������R��
	
	local ResetTime = ZONE15_PE01TAD_Var["ResetTime"]
	DebugLog( 2, "PE01_ResetTime="..ResetTime )
	Sleep( ResetTime*10 )

	DebugLog( 2, "LuaPE_ZONE15_PE01TAD_Start Begin!!" )
	LuaPE_ZONE15_PE01TAD_Start( 1 )
end

--==================================================--