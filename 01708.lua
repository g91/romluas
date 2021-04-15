--==================================================--
-- ���q�y�{
-- 1. Phase1 �B�鶤�B�e�L�{
-- 2. Phase2 �Ǫ��Ϋe�W����(1���\)
-- 3. Phase3 �Ǫ����`����(2���\)
-- 4. Phase4 �Ǫ��έ������(3���\)
-- ?. Phase? �B�鶤���æ��\(4���\)
-- ?. Phase? �Ǫ��ηm�ܦ��\(2,3,4����)
-- ?. Phase? �B�e������(���˴�)
--==================================================--

--==================================================--
--  ���ը禡��                                      --
--==================================================--

function LuaPE_ZONE15_PE03MAD_DeleteAll( DeleteMode )
	local Obj = ZONE15_PE03MAD_Obj
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

function LuaPE_ZONE15_PE03MAD_KillMonster()
	PE_SetVar( "ZONE15_PE03MAD_Var_MonsterKilled" , 30 )
end
function LuaPE_ZONE15_PE03MAD_KillGuard()
	PE_SetVar( "ZONE15_PE03MAD_Var_GuardKilled" , 25 )
end

--==================================================--



--==================================================--
--  �����ܼư�                                      --
--==================================================--
function LuaPE_ZONE15_PE03MAD_GlobalSet()
	ZONE15_PE03MAD_Obj = {}		-- �ϥΪ���޲z�}�C
	ZONE15_PE03MAD_Var = {}		-- �ϥΰѼƺ޲z�}�C
	ZONE15_PE03MAD_Phase = 0	-- ���q����

	ZONE15_PE03MAD_Var["ControllerID"] = 113714	-- �����(�}���c)
	ZONE15_PE03MAD_Var["Controller"] = 0		-- �����GID

	ZONE15_PE03MAD_Var["FlagID"] = 780538	-- �X��ID
	
	ZONE15_PE03MAD_Var["TotalGuardNum"] = 0	-- �����`��
	ZONE15_PE03MAD_Var["GuardNum"] = 0	-- �ثe�����ƶq
	ZONE15_PE03MAD_Var["MonsterNum"] = 0	-- �ثe�Ǫ��ƶq

	ZONE15_PE03MAD_Var["PH2NeedKillMonster"]  = 30	-- ���q�G�ݭn�����Ǫ��ƥ�
	ZONE15_PE03MAD_Var["PH2CanKillGuard"] = 25		-- ���q�G�|�X�{�������ƥ�

	ZONE15_PE03MAD_Var["GoFlag"] = 12	-- �԰��o�ͺX�l��m

	ZONE15_PE03MAD_Var["ResetTime"] = 3600	-- �������ȭ��m�ɶ�(��)	1�p��
	ZONE15_PE03MAD_Var["TimeSpace"] = 15		-- �p�ɶ��j(��)

	ZONE15_PE03MAD_Var["GuardID"] = { 103107, 103108 }	-- �U���D�޲z�M�h
	ZONE15_PE03MAD_Var["GuardLeaderID"] = 103109	-- �U���D�޲z�M�h

	ZONE15_PE03MAD_Var["MonsterID"] = { 103117, 103118 }	-- ���ߥ�����,�\�򥨻j��
	ZONE15_PE03MAD_Var["MonsterLeaderID"] = 103119	-- �����H�G�f����

	ZONE15_PE03MAD_Var["GuardCreateNum"] = 4		-- �@���������ͼƶq
	ZONE15_PE03MAD_Var["MaxGuardNum"] = 7		-- ���W���������ƶq

	ZONE15_PE03MAD_Var["PH3Time"] = 90		-- ���q�T�`�ɶ�(��)	3����	

	ZONE15_PE03MAD_Var["AreaID"] = 775		-- �����ƥ���Ͻs��		�F�ԥ����o����
	ZONE15_PE03MAD_Var["TestID"] = 1		-- �����ƥ���հϽs��
	
end
--==================================================--



--==================================================--
--  �����ƥ�]�w��                                  --
--==================================================--
function LuaPE_ZONE15_PE03MAD_PESet()

	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_PESet Start!!" )
	local PE_Name = "SC_PE_ZONE15_03MAD_PENAME"	-- �U���D�ͪ����ϧ�
	local PE_Desc = "SC_PE_ZONE15_03MAD_PEDESC"	-- �F�ԥ������U���D���ۯ����޲�����^�A�髬���o���`���j���ͪ���������ɯ�«�X�A�U���D�޲z�M�h�ثe����o�ǥ����ͪ��i�}�²M...
	local PEIndex = 3
	local PE_ResetTime = ZONE15_PE03MAD_Var["ResetTime"] * 1000
	-- �s�W�@�Өƥ�
	PE_AddPE( PE_Name , PE_Desc , PEIndex , PE_ResetTime )

	local AreaID = ZONE15_PE03MAD_Var["AreaID"]
	local TestID = ZONE15_PE03MAD_Var["TestID"]
	PE_AddRegion( PEIndex , AreaID )	-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )	-- ��PE��i���հ�


	local PH2Index = 302
	local PH2_Name = "SC_PE_ZONE15_03MAD_PHNAME02"	-- �¦�ͪ�������
	local PH2_Desc = ""
	local PH3Index = 303
	local PH3_Name = "SC_PE_ZONE15_03MAD_PHNAME03"	-- �@��ӥX�������ͪ���
	local PH3_Desc = ""
	local PH4Index = 304
	local PH4_Name = "SC_PE_ZONE15_03MAD_PHNAME04"	-- �@�ê������H�G�f����
	local PH4_Desc = ""

	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q2
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q3
	PE_AddPhase( PEIndex , PH4Index , PH4_Name , PH4_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q4

	local OB2Index = 3002
	local OB2_Name = "SC_PE_ZONE15_03MAD_OBNAME02"	-- �������ߥ�����
	local OB2_Desc = ""
	-- �s�W�@�ӥؼСA���q2���\����G����30�өǪ�
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "ZONE15_PE03MAD_Var_MonsterKilled" , 0 , ZONE15_PE03MAD_Var["PH2NeedKillMonster"] ,  true )

	local OB3Index = 3003
	local OB3_Name = "SC_PE_ZONE15_03MAD_OBNAME03"	-- �²M�@��ӥX�������ͪ�
	local OB3_Desc = ""
	-- �s�W�@�ӥؼСA���q3���\����G���L���w�ɶ�
	PE_PH_AddObjective_TimeLimit( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "ZONE15_PE03MAD_Time" , ZONE15_PE03MAD_Var["PH3Time"]*1000 , 0 ,  true )

	local OB4Index = 3004
	local OB4_Name = "SC_PE_ZONE15_03MAD_OBNAME04"	-- ��������H�G�f����
	local OB4_Desc = ""
	-- �s�W�@�ӥؼСA���q4���\����G�F���Ǫ��έ���
	PE_PH_AddObjective_Equal( PEIndex , PH4Index , OB4Index , OB4_Name , OB4_Desc , "ZONE15_PE03MAD_Var_MonsterBossKill" , 0 , 1 ,  true )

	local OB5Index = 3005
	local OB5_Name = "SC_PE_ZONE15_03MAD_OBNAME05"	-- �U���D�޲z�M�h�Q���h
	local OB5_Desc = ""
	-- �s�W�@�ӥؼСA���q2,3,4���ѱ���G�M�h�T�T
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE03MAD_Var_GuardKilled" , 0 , ZONE15_PE03MAD_Var["PH2CanKillGuard"] ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE03MAD_Var_GuardKilled" , 0 , ZONE15_PE03MAD_Var["PH2CanKillGuard"] ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB5Index , OB5_Name , OB5_Desc , "ZONE15_PE03MAD_Var_GuardKilled" , 0 , ZONE15_PE03MAD_Var["PH2CanKillGuard"] ,  false )

	-- �]�w���q�s��
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )


	-- �]�w�ؼйF�����^��禡
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE15_PE03MAD_OB_OnAchieve" )
	
	-- �]�w�ƥ󵲧�������^��禡
	PE_SetCallBackOnBalance( PEIndex , "LuaPE_ZONE15_PE03MAD_FinalExchange" )

	-- �ƥ�Ұ�
	PE_Start( PEIndex , PH2Index )

	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_PESet END!!" )
end
function LuaPE_ZONE15_PE03MAD_OB_OnAchieve( PEIndex , PHIndex , OBIndex )
	local Ctrl = ZONE15_PE03MAD_Var["Controller"]
	
	if PHIndex == 302 and OBIndex == 3002 then
		LuaPE_ZONE15_PE03MAD_Message( 2 )
	elseif PHIndex == 303 and OBIndex == 3003 then
		LuaPE_ZONE15_PE03MAD_Message( 3 )
		LuaPE_ZONE15_PE03MAD_BossCreate()	-- ��BOSS��
	elseif PHIndex == 304 and OBIndex == 3004 then
		LuaPE_ZONE15_PE03MAD_Message( 4 )		
		LuaPE_ZONE15_PE03MAD_RobBack()--NPC���}
		CallPlot( Ctrl, "LuaPE_ZONE15_PE03MAD_Reset", 0 )
	elseif OBIndex == 3005 then
		LuaPE_ZONE15_PE03MAD_Message( 5 )
		LuaPE_ZONE15_PE03MAD_Message( 6 )
		LuaPE_ZONE15_PE03MAD_RobBack()--NPC���}
		CallPlot( Ctrl, "LuaPE_ZONE15_PE03MAD_Reset", 0 )
	end
end
function LuaPE_ZONE15_PE03MAD_FinalExchange( PEIndex , GUID , Score )
	local LV = 54
	local MapID = ZONE15_PE03MAD_Var["AreaID"]
	if LuaPE_ZONE15_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = 10
	local TokenID = 206873	-- �޲z�M�h���ɹ�
	
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
function LuaPE_ZONE15_PE03MAD_Message( Index )
	ZONE15_PE03MAD_Phase = Index
	local Ctrl = ZONE15_PE03MAD_Var["Controller"]	
	local Color = "0xffffff00"	-- �j��T��������	
	local Message = {}
	Message[1] = "[SC_PE_ZONE15_03MAD_M05]"	-- ���ߥ������ƨg���k«�X�ӡI
	Message[2] = "[SC_PE_ZONE15_03MAD_M06]"	-- �\�򥨻j����������ߥ������s��@��ӥX�I
	Message[3] = "[SC_PE_ZONE15_03MAD_M07]"	-- �����H�G�f���鮨�����X�{�b�����ͪ��s�餧���I�I
	Message[4] = "[SC_PE_ZONE15_03MAD_M08]"	-- �U���D�޲z�M�h���\���²M«�X�������ͪ��s��I
	Message[5] = "[SC_PE_ZONE15_03MAD_M09]"	-- �U���D�޲z�M�h�L�k��ץ����ͪ��s�骺�����I�I
	Message[6] = "[SC_PE_ZONE15_03MAD_M10]"	-- �ݾl�������ͪ��̤@�ȷϪ������b�U���D�����I�I
	
	if Index == 1 or Index == 4 or Index == 6 then
		ScriptMessage( Ctrl, -1 , 1 , Message[Index] , Color )
		ScriptMessage( Ctrl, -1 , 0 , Message[Index] , Color )
	else
		local AreaID = ZONE15_PE03MAD_Var["AreaID"]	-- �Ǫ��ɵ��u�F��
		local AreaPlayer = LuaPE_ZONE15_GetAreaPlayer( AreaID )
		for i = 1 , table.getn(AreaPlayer) do
			ScriptMessage( Ctrl, AreaPlayer[i] , 1 , Message[Index] , Color )
			ScriptMessage( Ctrl, AreaPlayer[i] , 0 , Message[Index] , Color )
		end
	end
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_Message "..Index )
end

--==================================================--



--==================================================--
--  �@�Ψ禡��                                      --
--==================================================--

--���󲣥�
function LuaPE_ZONE15_PE03MAD_ObjCreate( ObjID , FlagID , Flag , ObjNum, ObjType )
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ObjCreate "..ObjType.." Start!!" )
	local Obj = {}
	local RoomID = 0
	
	for i = 1 , ObjNum do
		if Type(ObjID) == "table" then
			Obj[i] = CreateObjByFlag( ObjID[(i%2)+1], FlagID , Flag[i], 1 )
		elseif Type(Flag) == "table" then
			Obj[i] = CreateObjByFlag( ObjID, FlagID , Flag[i], 1 )
		else
			Obj[i] = CreateObjByFlag( ObjID, FlagID , Flag, 1 )
		end
		
		WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 0 )	-- �ζ]������
		AddToPartition( Obj[i] , RoomID )
		SetIdleMotion( Obj[i] , ruFUSION_ACTORSTATE_COMBAT_1H )	-- �w�]�O�԰��ʧ@
		MoveToFlagEnabled( Obj[i] , false )		-- �������޼@��
		table.insert( ZONE15_PE03MAD_Obj , Obj[i] )	-- �[�J����޲z�}�C
		
		AddBuff( Obj[i] , 506303 , 0 , -1 )	-- ��AE��Buff
		SetFlag( Obj[i], 544801, 1 )--�������_��(4.0.0�l�[)
		
		if ObjType == "NPC" then
			ZONE15_PE03MAD_Var["TotalGuardNum"] = ZONE15_PE03MAD_Var["TotalGuardNum"] +1
			ZONE15_PE03MAD_Var["GuardNum"] = ZONE15_PE03MAD_Var["GuardNum"]+1	-- �ثe�����ƶq
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE03MAD_GuardDead" , 0 )
		elseif ObjType == "Mst" then
			ZONE15_PE03MAD_Var["MonsterNum"] = ZONE15_PE03MAD_Var["MonsterNum"]+1	-- �ثe�Ǫ��ƶq
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE03MAD_MstDead" , 0 )
		else
			SetPlot( Obj[i] , "DEAD" , "LuaPE_ZONE15_PE03MAD_BossDead" , 0 )
		end
		
		CallPlot( Obj[i] , "LuaPE_ZONE15_PE03MAD_NPCDo" , 0 )
		
		Sleep( 1 )
	end

	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ObjCreate "..ObjType.." END!!" )
	if ObjNum == 1 then
		return obj[1]
	end
	return obj;
end

--==================================================--

--==================================================--
--  �Ǫ��Ω]ŧ  ���󲣥Ͱ�                          --
--==================================================--

function LuaPE_ZONE15_PE03MAD_GuardTimeCreate()--�����M�h
	local Var = ZONE15_PE03MAD_Var
	local TimeSpace = Var["TimeSpace"]		-- �p�ɶ��j(��)
	local GuardID = Var["GuardID"]
	local FlagID = Var["FlagID"]	
	local MaxNum = Var["MaxGuardNum"]
	local TimeCreateNum = Var["GuardCreateNum"]
	local GuardLeaderID = Var["GuardLeaderID"]
	local Flag = { 1 , 2 , 3 , 4 , 5 }
		
	while true do
		local Num = Var["GuardNum"]	-- �������ͼƥ�
		local CreateNum = 0
	
		if ZONE15_PE03MAD_Phase > 3 or Var["TotalGuardNum"] >= Var["PH2CanKillGuard"] then
			break;
		elseif Num < MaxNum then
			CreateNum = MaxNum - Num
			if CreateNum >= TimeCreateNum then
				LuaPE_ZONE15_PE03MAD_ObjCreate( GuardLeaderID , FlagID , 1 , 1, "NPC" )
				LuaPE_ZONE15_PE03MAD_ObjCreate( GuardID , FlagID , Flag , TimeCreateNum, "NPC" )
			elseif CreateNum < TimeCreateNum and CreateNum > 0 then
				LuaPE_ZONE15_PE03MAD_ObjCreate( GuardID , FlagID , Flag , CreateNum, "NPC" )
			else
				DebugLog( 2, "LuaPE_ZONE15_PE03MAD_GuardTimeCreate 0" )
			end
		end
		Sleep( TimeSpace * 20 )
	end
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_GuardTimeCreate END!!" )
end

function LuaPE_ZONE15_PE03MAD_MstTimeCreate()--���ͩǪ�
	local Var = ZONE15_PE03MAD_Var
	local TimeSpace = Var["TimeSpace"]		-- �p�ɶ��j(��)
	local MonsterID = Var["MonsterID"]
	local FlagID = Var["FlagID"]
	local Flag = { 6 , 7 , 8 , 9 , 10 , 6 , 7 , 8 , 9 , 10 }
	local MstID

	while true do
		local Num = Var["MonsterNum"]-- �ثe�Ǫ��ƶq
		local MaxNum = math.floor( (ZONE15_PE03MAD_Phase+1)*4 )
		local TimeCreateNum = math.floor( (ZONE15_PE03MAD_Phase+1)*2 )
		local CreateNum = 0			
		if ZONE15_PE03MAD_Phase == 1 then
			MstID = MonsterID[1]
		else
			MstID = MonsterID
		end
		
		if ZONE15_PE03MAD_Phase > 3 then
			break;
		elseif Num < MaxNum then
			CreateNum = MaxNum - Num			
			if CreateNum >= TimeCreateNum then
				LuaPE_ZONE15_PE03MAD_ObjCreate( MstID , FlagID , Flag , TimeCreateNum, "Mst" )
			elseif CreateNum < TimeCreateNum and CreateNum > 0 then
				LuaPE_ZONE15_PE03MAD_ObjCreate( MstID , FlagID , Flag , CreateNum, "Mst" )
			else
				DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ThiefTimeCreate 0" )
			end
		end
		Sleep( TimeSpace * 10 )
	end
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ThiefTimeCreate END!!" )
end

function LuaPE_ZONE15_PE03MAD_BossCreate()--����BOSS
	local MonsterLeaderID = ZONE15_PE03MAD_Var["MonsterLeaderID"]
	local FlagID = ZONE15_PE03MAD_Var["FlagID"]
	local Boss = LuaPE_ZONE15_PE03MAD_ObjCreate( MonsterLeaderID, FlagID , 6 , 1, "Boss" )
	AddBuff( Boss, 502546, 0, -1 )--��j1.3
end

--==================================================--



--==================================================--
--  �Ǫ��Ω]ŧ  ���`�B�z��                          --
--==================================================--

function LuaPE_ZONE15_PE03MAD_GuardDead()--�M�h���`
	if ZONE15_PE03MAD_Phase < 5 then
		ZONE15_PE03MAD_Var["GuardNum"] = ZONE15_PE03MAD_Var["GuardNum"] - 1
		PE_SetVar( "ZONE15_PE03MAD_Var_GuardKilled" , PE_GetVar( "ZONE15_PE03MAD_Var_GuardKilled" )+1 )		-- PE�ܼƧ���		
	end
	DelObj( OwnerID() )
	return true;
end

function LuaPE_ZONE15_PE03MAD_MstDead()--�Ǫ����`
	if ZONE15_PE03MAD_Phase < 4 then
		local PEIndex = 3	
		local MapID = ZONE15_PE03MAD_Var["AreaID"]
		LuaPE_ZONE15_GetBonus( PEIndex, MapID, 3 )         -- ������������
			
		ZONE15_PE03MAD_Var["MonsterNum"] = ZONE15_PE03MAD_Var["MonsterNum"] - 1		
		PE_SetVar( "ZONE15_PE03MAD_Var_MonsterKilled" , PE_GetVar( "ZONE15_PE03MAD_Var_MonsterKilled" )+1 )		-- PE�ܼƧ���
	end
	DelObj( OwnerID() )
	return true;
end

function LuaPE_ZONE15_PE03MAD_BossDead()--BOSS���`
	PE_SetVar( "ZONE15_PE03MAD_Var_MonsterBossKill" , 1 )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�

	if ReadRoleValue( TargetID() , EM_RoleValue_IsNPC ) == 0 then
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( OwnerID() , 1 , "[SC_PE_ZONE15_03MAD_M14][$SETVAR1="..GetName(TargetID()).."]" )		-- �b���a [$VAR1] �j�O����U���U�A[103119]�Q���\������F�I
		end
	else
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( OwnerID() , 1 , "[SC_PE_ZONE15_03MAD_M15]" )		-- �b���H�j�O����U���U�A[103119]�Q���\������F�I
		end
	end
	
	local PEIndex = 3
	local MapID = ZONE15_PE03MAD_Var["AreaID"]
	LuaPE_ZONE15_GetBonus( PEIndex, MapID, 50 )         -- ������������
	DelObj( OwnerID() )
	return true;
end

--==================================================--



--==================================================--
--  �Ǫ��Ω]ŧ  ���ʪ�t��                          --
--==================================================--

function LuaPE_ZONE15_PE03MAD_NPCDo()--NPC����
	local FlagObjID = ZONE15_PE03MAD_Var["FlagID"]
	local FlagGoID = ZONE15_PE03MAD_Var["GoFlag"]
	local Range = 30

	LuaPE_ZONE15_ObjGoFlag( OwnerID() , FlagObjID , FlagGoID , Range )
end

--==================================================--



--==================================================--
--  �Ǫ��Ω]ŧ  ��t���t��                          --
--==================================================--

function LuaPE_ZONE15_PE03MAD_RobBack()--NPC���}
	local Obj = ZONE15_PE03MAD_Obj
	local Var = ZONE15_PE03MAD_Var

	local GuardID = Var["GuardID"]
	local MonsterID = Var["MonsterID"]
	local GuardLeaderID = Var["GuardLeaderID"]
	local MonsterLeaderID = Var["MonsterLeaderID"]

	for i = 1, table.getn(Obj) do
		if Obj[i] ~= nil and CheckID(Obj[i]) == true then
			LuaPE_ZONE15_StopAttack( Obj[i] )

			local OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
			if OrgID == GuardID[1] or OrgID == GuardID[2] Or OrgID == GuardLeaderID then
				BeginPlot( Obj[i] , "LuaPE_ZONE15_PE03MAD_GuardWinDo" , 0 )
			elseif OrgID == MonsterID[1] or OrgID == MonsterID[2] or OrgID == MonsterLeaderID then
				BeginPlot( Obj[i] , "LuaPE_ZONE15_PE03MAD_MonsterRobBackDo" , 0 )
			end
		end
	end
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_RobBack" )
end

function LuaPE_ZONE15_PE03MAD_GuardWinDo()
	Sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	WriteRoleValue( OwnerID(), EM_RoleValue_LiveTime, 3 )
end

function LuaPE_ZONE15_PE03MAD_MonsterRobBackDo()
	local FlagObjID = ZONE15_PE03MAD_Var["FlagID"]
	local FlagGoID = 6
	local Range = 30
	
	WriteRoleValue( OwnerID(), EM_RoleValue_LiveTime, 3 )
	LuaPE_ZONE15_ObjGoFlag( OwnerID() , FlagObjID , FlagGoID , Range )
	DelObj( OwnerID() )
end

--==================================================--

--==================================================--
--  �Ǫ��Ω]ŧ  �ҰʳB�z��                          --
--==================================================--

function LuaPE_ZONE15_PE03MAD_Start( Mode )--�_�l�禡
	local Obj = ZONE15_PE03MAD_Obj
	local tmp = 0
	if Obj ~= nil then
		tmp = ZONE15_PE03MAD_Var["Controller"]
		--LuaPE_ZONE15_PE03MAD_DeleteAll( Mode )	-- �N���e���e�@�Өƥ󪺪�������R��
	end

	LuaPE_ZONE15_PE03MAD_GlobalSet()	-- �@���ܼƳ]�w
	if Mode == nil then
		LuaPE_ZONE15_PE03MAD_PESet()		-- �����ƥ�]�w
	end

	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ControllerSet Start!!" )
	local ControllerID = ZONE15_PE03MAD_Var["ControllerID"]		-- �}���c
	local FlagID = ZONE15_PE03MAD_Var["FlagID"]		-- �X�lID
	local Flag = 11					-- �X�ͺX�l11
	local RoomID = 0	
	local Ctrl = LuaPE_ZONE15_ControllerSet( ControllerID , FlagID , Flag , RoomID )	-- �]�w�����
	ZONE15_PE03MAD_Var["Controller"] = Ctrl
	ZONE15_PE03MAD_Obj[1] = Ctrl	-- �N�ާ@����[�J�Ĥ@��	
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_ControllerSet END!!" )
	
	LuaPE_ZONE15_PE03MAD_Message( 1 )
	CallPlot( Ctrl, "LuaPE_ZONE15_PE03MAD_GuardTimeCreate", 0 )	-- �����n��
	CallPlot( Ctrl, "LuaPE_ZONE15_PE03MAD_MstTimeCreate", 0 )	-- �Ǫ��n��
	
	if tmp ~= 0 then 
		DelObj(tmp)
		DebugMsg(0,0,"Del ZONE15_PE03 Ctrl")
	end
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_Start!!" )	
end

function LuaPE_ZONE15_PE03MAD_Reset()
	DebugLog( 2, "LuaPE_ZONE15_PE03WAD_END!!" )	
	
	LuaPE_ZONE15_PE03MAD_DeleteAll( 1 )	-- �N���e���e�@�Өƥ󪺪�������R��
	
	local ResetTime = ZONE15_PE03MAD_Var["ResetTime"]		-- ��	
	DebugLog( 2, "PE03_ResetTime="..ResetTime )
	Sleep( ResetTime*10 )
	
	DebugLog( 2, "LuaPE_ZONE15_PE03MAD_Start Begin!!" )
	LuaPE_ZONE15_PE03MAD_Start( 1 )	
end

--==================================================--