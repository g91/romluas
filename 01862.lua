--==================================================--
--  �����ܼư�                                      --
--==================================================--
function LuaPE_ZONE16_PE01ORC_GlobalSet()
	ZONE16_PE01ORC_Obj = {}								-- �ϥΪ���޲z�}�C
	ZONE16_PE01ORC_Var = {}								-- �ϥΰѼƺ޲z�}�C
	ZONE16_PE01ORC_Phase = 0							-- ���q����
	ZONE16_PE01ORC_PEIndex = 1
	ZONE16_PE01ORC_Total = 0							-- �`�@�����n��
	
	ZONE16_PE01ORC_Var["ResetTime"] = 3600				-- �������ȭ��m�ɶ�(��)	1�p��
	ZONE16_PE01ORC_Var["MapID"] = 824					-- �����ƥ���Ͻs��		�ǷϪL�a(824)
	ZONE16_PE01ORC_Var["TestID"] = 1					-- �����ƥ���հϽs��
	ZONE16_PE01ORC_Var["RoomID"] = 0
	ZONE16_PE01ORC_Var["ControllerFlag"] = 0			-- �������ͦ�m 0
	
	ZONE16_PE01ORC_Var["CreaterID"] = 115506			-- �O���ӭt����ID
	ZONE16_PE01ORC_Var["Creater"] = 0					-- �O���ӭt����
	ZONE16_PE01ORC_Var["ControllerID"] = 115053			-- �����
	ZONE16_PE01ORC_Var["Controller"] = 0				-- �����GID
	ZONE16_PE01ORC_Var["FlagID"] = 780656				-- �X��ID
	ZONE16_PE01ORC_Var["GuardFlagID"] = { 5,6,7,8,9 }	-- ���L�X�ͦ�m
	ZONE16_PE01ORC_Var["GLordFlagID"] = 10				-- ���L�����X�ͦ�m
	ZONE16_PE01ORC_Var["OrcFlagID"] = { 11,12,13,14,15 }-- �~�H�X�ͦ�m
	ZONE16_PE01ORC_Var["OLordFlagID"] = 16				-- �~�HBOSS�X�ͦ�m
	
	ZONE16_PE01ORC_Var["GuardArt"] = {}
	ZONE16_PE01ORC_Var["GuardArtID"] = { 115578,		--�˹��Υ��L����
										115575,			--�˹��Υ��L
										115577,			--�˹��Υ��L
										115576 }		--�˹��Υ��L
	ZONE16_PE01ORC_Var["GuardArtFlag"] = { 30,31,32,33}	--�˹��Υ��L�������ͦ�m
	
	ZONE16_PE01ORC_Var["Worker"] = {}
	ZONE16_PE01ORC_Var["WorkerFlag"] = { 20,21,22,23,	--���u���ͦ�m
										 24,25,26,27}
	
	ZONE16_PE01ORC_Var["WorkerID"] = { 	115488,			-- ���u
										115574,			-- ���u
										115573 }		-- ���u
			
	ZONE16_PE01ORC_Var["GuardID"] = { 103853,			-- ���L
									  103854,			-- ���L
									  103939,			-- ���L
									  103940 }			-- ���L
	ZONE16_PE01ORC_Var["GuardLordID"] = 103841 			-- ���L����
	
	ZONE16_PE01ORC_Var["OrcID"] = { 103605,				-- �p�w�d���J
									103604,				-- �p�w�d�y��
									103603,				-- �p�w�d�Ԥh
									103606 } 			-- �p�w�d����
	ZONE16_PE01ORC_Var["OrcLordID"] = 103607 			-- �p�w�d���� �������i
	
	ZONE16_PE01ORC_Var["TimeSpace"] = 15				-- �p�ɶ��j(��)
	ZONE16_PE01ORC_Var["TimeCreateGuard"] = 3			-- �C�����j�X�������L�ƥ�
	ZONE16_PE01ORC_Var["TimeCreateOrc"] = 4				-- �C�����j�X�����~�H�ƥ�
	ZONE16_PE01ORC_Var["MaxGuard"] = 5					-- ���W���������L�ƥ�
	ZONE16_PE01ORC_Var["MaxOrc"] = 8					-- ���W�������~�H�ƥ�

	ZONE16_PE01ORC_Var["GuardDead"] = 0					-- �ثe���L���`�ƥ�
	ZONE16_PE01ORC_Var["OrcDead"] = 0					-- �ثe�~�H���`�ƥ�
	
	ZONE16_PE01ORC_Var["PH1Require"]  = 30				-- ���q�@�ݭn�����~�H�ƥ�
	ZONE16_PE01ORC_Var["PH2Require"]  = 40				-- ���q�G�ݭn�����~�H�ƥ�
	ZONE16_PE01ORC_Var["PH3Time"] = 60					-- ���q�T�`�ɶ�(��)
	
	ZONE16_PE01ORC_Var["MaxGuardDead"] = 12				-- ���L�̤j���`�� (���ѱ���)
	
	ZONE16_PE01ORC_Var["ExCha_Ratio"] = 100				-- �^�X��v
end
--==================================================--



--==================================================--
--  �����ƥ�]�w��                                  --
--==================================================--
function LuaPE_ZONE16_PE01ORC_PESet()

	local PE_Name = "SC_PE_ZONE16_01_NAME"					-- �ǷϪL�a������
	local PE_Desc = "SC_PE_ZONE16_01_DESC"					-- �H�۸������T�_�A�d�����������P�p�w�d�~�H���Ĭ��X�j�A�ǷϪL�a�����ܾԦb���i�}�C
	local PEIndex = ZONE16_PE01ORC_PEIndex
	PE_AddPE( PE_Name , PE_Desc , PEIndex , 0 ) 	-- �s�W�@�Өƥ�

	local MapID = ZONE16_PE01ORC_Var["MapID"]
	local TestID = ZONE16_PE01ORC_Var["TestID"]
	PE_AddRegion( PEIndex , MapID )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�
	
	local PH0Index = 100	--���q�ܼ�
	local PH1Index = 101	
	local PH2Index = 102
	local PH3Index = 103
	local PH4Index = 104
	
	local PH0_Name = "SC_PE_ZONE16_DW_22" --���m�ɶ�
	local PH1_Name = "SC_PE_ZONE16_01_PHNAME01"	-- �s�P��ŧ�Z	
	local PH2_Name = "SC_PE_ZONE16_01_PHNAME02"	-- �j�|�i��
	local PH3_Name = "SC_PE_ZONE16_01_PHNAME03"	-- �p�w�d������
	local PH4_Name = "SC_PE_ZONE16_01_PHNAME04"	-- �̲ת��M��
	
	local PH1_Desc = ""	-- ���ڦǷϪL�a���p�w�d�~�H�Aŧ�Z�L�����ȤH�P�̾a�ǷϪL�a���ͪ��d���������C	
	local PH2_Desc = ""	-- �]���ڤH�D�������Ӧ��`�A�ް_�F�p�w�d�~�H������A�M�w�岽�H���C	
	local PH3_Desc = ""	-- �H�۸����T�_�ǷϪL�a���Ԫp�i�J�F�ռ��ơC
	local PH4_Desc = ""	-- �~�H����M�w�˦ۥX���a��ڤH�N�ǷϪ��H�����ɱ����C
	
	PE_AddPhase( PEIndex , PH0Index , PH0_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q0
	PE_AddPhase( PEIndex , PH1Index , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q1
	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q2
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q3
	PE_AddPhase( PEIndex , PH4Index , PH4_Name , PH4_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q4

	local OB0Index = 1000
	local OB1Index = 1001
	local OB2Index = 1002
	local OB3Index = 1003
	local OB4Index = 1004
	local OB5Index = 1005
	
	local OB0_Name = "SC_PE_ZONE16_DW_21" --�Ѿl�ɶ�
	local OB1_Name = "SC_PE_ZONE16_01_OBNAME01"	-- �����p�w�d�~�H
	local OB2_Name = "SC_PE_ZONE16_01_OBNAME02"	-- ����p�w�d�~�H
	local OB3_Name = "SC_PE_ZONE16_01_OBNAME03"	-- ��׹p�w�d�~�H������
	local OB4_Name = "SC_PE_ZONE16_01_OBNAME04"	-- ���ѹp�w�d�~�H���� �������i
	local OB5_Name = "SC_PE_ZONE16_01_OBNAME05"	-- �d�������L���Ѱh
	
	local OB0_Desc = ""
	local OB1_Desc = ""
	local OB2_Desc = ""
	local OB3_Desc = ""
	local OB4_Desc = ""
	local OB5_Desc = ""
	
	local PH1Require = ZONE16_PE01ORC_Var["PH1Require"]
	local PH2Require = ZONE16_PE01ORC_Var["PH2Require"]	
	local MaxGuardDead = ZONE16_PE01ORC_Var["MaxGuardDead"]	
	
	-- PE���m�˼�
	PE_PH_AddObjective_TimeLimit( PEIndex , PH0Index , OB0Index , OB0_Name , OB0_Desc , "ZONE16_PE01_ResetTime" , ZONE16_PE01ORC_Var["ResetTime"]*1000 , 0 ,  true )
	
	-- �s�W�@�ӥؼСA���q1���\����G�p�w�d�~�H�����`�W�L30
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH1Index , OB1Index , OB1_Name , OB1_Desc , "ZONE16_PE01ORC_Var_OrcDead1" , 0 , PH1Require ,  true )	
	
	-- �s�W�@�ӥؼСA���q2���\����G����50���~�H
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "ZONE16_PE01ORC_Var_OrcDead2" , 0 , PH2Require ,  true )	
	
	-- �s�W�@�ӥؼСA���q3���\����G�����~�H���⪺�n��
	PE_PH_AddObjective_TimeLimit( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "ZONE16_PE01_PH3Time" , ZONE16_PE01ORC_Var["PH3Time"]*1000 , 0 ,  true )	
	
	-- �s�W�@�ӥؼСA���q4���\����G�����~�H����
	PE_PH_AddObjective_Equal( PEIndex , PH4Index , OB4Index , OB4_Name , OB4_Desc , "ZONE16_PE01ORC_Var_OrcBossDead" , 0 , 1 ,  true )	
	
	-- �s�W�@�ӥؼСA���q2,3,4���ѱ���G���L���`�L�h
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB5Index , OB5_Name , OB5_Desc , "ZONE16_PE01ORC_Var_MaxGuardDead" , 0 , MaxGuardDead ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB5Index , OB5_Name , OB5_Desc , "ZONE16_PE01ORC_Var_MaxGuardDead" , 0 , MaxGuardDead ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB5Index , OB5_Name , OB5_Desc , "ZONE16_PE01ORC_Var_MaxGuardDead" , 0 , MaxGuardDead ,  false )

	-- �]�w���q�s��
	PE_PH_SetNextPhase( PEIndex , PH0Index , PH1Index )
	PE_PH_SetNextPhase( PEIndex , PH1Index , PH2Index )
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )
	
	
	-- �]�w�ؼйF�����^��禡
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE16_PE01ORC_OB_OnAchieve" )
	
	-- �]�w�ƥ󵲧�������^��禡
	PE_SetCallBackOnBalance( PEIndex , "LuaPE_ZONE16_PE01ORC_FinalExchange" )

	-- �ƥ�Ұ�
	PE_Start( PEIndex , PH0Index )

end

function LuaPE_ZONE16_PE01ORC_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	local Controller = ZONE16_PE01ORC_Var["Controller"]	-- �����	
	local creater = ZONE16_PE01ORC_Var["Creater"]	
	local Phase = ZONE16_PE01ORC_Phase
	
	if PHIndex == 100 and OBIndex == 1000 then 	-- �����Ĥ@���q ���L�}�l����
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", Phase )
		BeginPlot( Controller ,"LuaPE_ZONE16_PE01ORC_DelGuardArt", 0 )			--�R���˹����L
	elseif PHIndex == 101 and OBIndex == 1001 then 	-- �����Ĥ@���q ���L�}�l����	
		ZONE16_PE01ORC_Var["OrcDead"] = 0		
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", Phase )
		BeginPlot( Controller , "LuaPE_ZONE16_PE01ORC_GuardDo" , 0 ) 			--���ͥ��L
		sleep(50)
		BeginPlot( Controller , "LuaPE_ZONE16_PE01ORC_OrcDo" , 0 )				--�����~�H
	elseif PHIndex == 102 and OBIndex == 1002 then -- �����ĤG���q �}�l�˼�		
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", Phase )
		--ZONE16_PE01ORC_Var["TimeSpace"] = ZONE16_PE01ORC_Var["TimeSpace"]*2/3 -- �p�ɶ��j(��) �����
	elseif PHIndex == 103 and OBIndex == 1003 then -- �����ĤT���q BOSS�X�{
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", Phase )
		BeginPlot( Controller , "LuaPE_ZONE16_PE01ORC_BossCreate", 0 ) 			--�����~�HBOSS
	elseif PHIndex == 104 and OBIndex == 1004 then 								-- ���L�ӧQ
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", Phase )
		WriteRoleValue( creater, EM_RoleValue_Register1, 1 )					--���L�ӧQ
		Sleep(20)
		BeginPlot( Controller, "LuaPE_ZONE16_PE01ORC_CreateWorker", 0 ) 		--���ͥ��u 
		BeginPlot( Controller , "LuaPE_ZONE16_PE01ORC_Reset" , 0 )				-- ���m��������
	elseif OBIndex == 1005 then
		CallPlot( Controller, "LuaPE_ZONE16_PE01ORC_PhaseDO", 5 )  				-- ���L�Ѱh �~�H�ӧQ
		WriteRoleValue( creater, EM_RoleValue_Register1, 0 )					--�~�H�ӧQ
		BeginPlot( Controller , "LuaPE_ZONE16_PE01ORC_Reset" , 0 )				-- ���m��������
	end
end

function LuaPE_ZONE16_PE01ORC_FinalExchange( PEIndex , GUID , Score )
	local LV = 55
	local MapID = ZONE16_PE01ORC_Var["MapID"] 
	if LuaPE_KS_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = ZONE16_PE01ORC_Var["ExCha_Ratio"]
	local Total = ZONE16_PE01ORC_Total
	
	if Score > 0 then
		if Score < ExCha_Ratio and Score > ExCha_Ratio/2 then
			CallPlot(GUID, "YOYO_GetTokenValue", 2, 1);--�j�N��"
		else
			if Score >= 800 then Score = 800 end
			CallPlot(GUID, "YOYO_GetTokenValue", 2, math.floor( Score/ExCha_Ratio ));--�j�N��"
		end
	end

end
--==================================================--



--==================================================--
--  ���q/�T���B�z��                                 --
--==================================================--
--���q�B�z
function LuaPE_ZONE16_PE01ORC_PhaseDO( Phase )
	local Controller = ZONE16_PE01ORC_Var["Controller"]
	local OrcID = ZONE16_PE01ORC_Var["OrcID"]
	local creater = ZONE16_PE01ORC_Var["Creater"]
	local winner = ReadRoleValue( creater, EM_RoleValue_Register1 ) --0���~�H�ӧQ 1�����L�ӧQ
	local OrcDead = ZONE16_PE01ORC_Var["PH1Require"]
	local Total = ZONE16_PE01ORC_Total
	debugmsg( 0, 0, "winner = "..winner .."; Phase = " ..Phase )
	
	if Phase == 0 then
		ZONE16_PE01ORC_Phase = 1
		if winner == 0 then
			LuaPE_ZONE16_PE01ORC_Message( 1 , C_SYSTEM )
		else
			LuaPE_ZONE16_PE01ORC_DelWorker()
		end
	elseif Phase == 1 then
		ZONE16_PE01ORC_Phase = 2
		if winner == 0 then
			LuaPE_ZONE16_PE01ORC_Message( 2 , C_DEFAULT )
		else
			LuaPE_ZONE16_PE01ORC_Message( 3 , C_DEFAULT )
		end
	elseif Phase == 2 then
		ZONE16_PE01ORC_Phase = 3
		if winner == 0 then
			LuaPE_ZONE16_PE01ORC_Message( 4 , C_DEFAULT )
		else
			LuaPE_ZONE16_PE01ORC_Message( 5 , C_DEFAULT )
		end
	elseif Phase == 3 then	
		ZONE16_PE01ORC_Phase = 4		
		LuaPE_ZONE16_PE01ORC_Message( 6 , C_DEFAULT )
	elseif Phase == 4 then
		ZONE16_PE01ORC_Phase = 8
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE16_PE01ORC_Message( 8 , C_SYSTEM )
	elseif Phase == 5 then
		ZONE16_PE01ORC_Phase = 9
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE16_PE01ORC_Message( 7 , C_DEFAULT )
	end
	
end


--�ǰe�T��
function LuaPE_ZONE16_PE01ORC_Message( Index , Color )
	Color = "0xffffff00"	-- �j��T��������

	local AreaPlayer = LuaPE_ZONE16_PE01ORC_GetAreaPlayer()
	local Message = {}
	Message = {	
	[1] = "[SC_PE_ZONE16_01_M01]";								-- �d���������L�S�}�l�����A�åB�b���ݾ��|...
	[2] = "[SC_PE_ZONE16_01_M02]";								-- ���L���� �·G�E�ذǷPı�ɾ����{�A�]���v��ۥ��L�e���ǷϪL�a�A���⻰���p�w�d�~�H!!		
	[3] = "[SC_PE_ZONE16_01_M03]";								-- �p�w�d�ڭn�����}�a�L�̥ͬ����R���H��!!		
	[4] = "[SC_PE_ZONE16_01_M04]";								-- �H���j�|�ӥǪ��欰�A�A���S�o�F�ǷϪL�a�����p�w�d��...	
	[5] = "[SC_PE_ZONE16_01_M05]";								-- �p�w�d�ڨM�w�����i��!!...	
	[6] = "[SC_PE_ZONE16_01_M06]";								-- ���F���ܩ~��a�A�p�w�d������ �������i�˦ۥX��!!
	[7] = "[SC_PE_ZONE16_01_M07]";								-- �p�w�d�H���\���O�æ�L�̪��a��A���Ѫ��d�������u�n�A�����L�̪����L�a�C
	[8] = "[SC_PE_ZONE16_01_M08]";								-- �ѩ�p�w�d���⪺�Ѱh�A�p�w�d�H�u�n�Ȯɰh�^�ǷϪL�a�`�B����a�C
	}

	if Index == 1 or Index == 3 then
		debugmsg( 0, 0, "PE Start")
		ScriptMessage( OwnerID(), -1 , 1 , Message[Index] , Color )
		ScriptMessage( OwnerID(), -1 , 0 , Message[Index] , Color )
		debugmsg( 0, 0, "PE Start!!!")
	else
		for i = 1 , table.getn(AreaPlayer) do
			ScriptMessage( OwnerID(), AreaPlayer[i] , 1 , Message[Index] , Color )
			ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , Message[Index] , Color )
		end
	end
end
--==================================================--



--==================================================--
--  �@�Ψ禡��                                      --
--==================================================--
--����ϰ쪱�a
function LuaPE_ZONE16_PE01ORC_GetAreaPlayer()
	local MapID = ZONE16_PE01ORC_Var["MapID"]	-- �s��ɵ��u�F��
	local TestID = ZONE16_PE01ORC_Var["TestID"]	-- ���հ�
	local RoomID = ZONE16_PE01ORC_Var["RoomID"]
	local AreaPlayer = {}
	local ZonePlayer = {}

	local PlayerCount = SetSearchAllPlayer( RoomID )	-- �^�ǧ��Ӽ�
	for i = 1 , PlayerCount do
		ZonePlayer[i] = GetSearchResult()	-- ���o�j�M�쪺���a
		local X = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_X )
		local Y = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Y )
		local Z = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Z )
		if CheckMapID( X , Y , Z , MapID ) == true or CheckMapID( X , Y , Z , TestID ) then
			table.insert( AreaPlayer , ZonePlayer[i] )	-- �j�M��o�Ӥ��Ϫ����a�N�[�i�h
		end
	end

	return AreaPlayer;
end

function LuaPE_ZONE16_PE01ORC_StopAttack( Player ) --�������
	local times = 0
	while CheckID( OwnerID() ) and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) ~= 1 do
		times = times+1
		SetStopAttack( Player )
		SetModeEx( Player , EM_SetModeType_Strikback , false )		-- ����
		SetModeEx( Player , EM_SetModeType_Searchenemy , false )	-- ����
		SetModeEx( Player , EM_SetModeType_Fight , false )			-- �i�������
		SetModeEx( Player , EM_SetModeType_Mark	, false )			-- �аO
		--SetRoleCamp( Player, "Visitor" )			
		WriteRoleValue( Player , EM_RoleValue_IsAttackMode , 0 )
		if times == 4 then DelObj(OwnerID()) end
		sleep(10)
	end
end
--==================================================--





--==================================================--
--  �ǷϪL�a���ܾ�  �ҰʳB�z��                      --
--==================================================--
function LuaPE_ZONE16_PE01ORC_Start( Mode )
	local FlagTmp
	local GuardArt
	local worker = {}
	
	if Mode == 1 then
		FlagTmp = ZONE16_PE01ORC_Var["Controller"]		
		GuardArt = ZONE16_PE01ORC_Var["GuardArt"]
	end
		
	local Creater = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115506, 100, 0 )
	local winner = ReadRoleValue( creater, EM_RoleValue_Register1 ) --0���~�H�ӧQ 1�����L�ӧQ
	
	
	if winner == 1 then 
		worker = ZONE16_PE01ORC_Var["Worker"]
	end	
	
	LuaPE_ZONE16_PE01ORC_GlobalSet()	-- �@���ܼƳ]�w
	LuaPE_ZONE16_PE01ORC_PESet()		-- �����ƥ�]�w		
	ZONE16_PE01ORC_Var["Creater"] = Creater
	ZONE16_PE01ORC_Var["Worker"] = worker
	ZONE16_PE01ORC_Var["GuardArt"] = GuardArt
	
	local Phase = ZONE16_PE01ORC_Phase
	local ControllerID = ZONE16_PE01ORC_Var["ControllerID"]		-- ���
	local ControllerFlag = ZONE16_PE01ORC_Var["ControllerFlag"] --���ͤ�����m
	local FlagID = ZONE16_PE01ORC_Var["FlagID"]					-- �X�lID
	local RoomID = ZONE16_PE01ORC_Var["RoomID"]
	local winner = ReadRoleValue( creater, EM_RoleValue_Register1 ) --0���~�H�ӧQ 1�����L�ӧQ
	local OrcDead = ZONE16_PE01ORC_Var["PH1Require"]
	
	local Controller = LuaPE_ZONE16_PE01ORC_ControllerSet( ControllerID , FlagID , ControllerFlag , RoomID )	-- �]�w�����
	WriteRoleValue( Controller, EM_RoleValue_Register1, 0 ) --�~�H�ƶq��l
	WriteRoleValue( Controller, EM_RoleValue_Register2, 0 ) --���L�ƶq��l

	if winner == 1 then
		PE_SetVar( "ZONE16_PE01ORC_Var_OrcDead1" , OrcDead )
	end
	
	if FlagTmp ~= nil then
		DelObj( FlagTmp )	-- �R���e�@�ӱ����	
	end
end
--==================================================--


--==================================================--
--  �p�w�d���fŧ  ���󲣥Ͱ�                        --
--==================================================--
--�����]�w
function LuaPE_ZONE16_PE01ORC_ControllerSet( ControllerID , FlagID , ControllerBronFlag , RoomID )
	local Controller = CreateObjByFlag( ControllerID , FlagID , ControllerBronFlag , 1 )
	SetModeEx( Controller , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Controller , EM_SetModeType_Obstruct , false )			-- ����
	SetModeEx( Controller , EM_SetModeType_Gravity , false )			-- ���O
	SetModeEx( Controller , EM_SetModeType_Mark , false )				-- �аO
	SetModeEx( Controller , EM_SetModeType_Move , false )				-- ����
	SetModeEx( Controller , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( Controller , EM_SetModeType_HideName , false )			-- �W��
	SetModeEx( Controller , EM_SetModeType_ShowRoleHead , false )		-- �Y����
	SetModeEx( Controller , EM_SetModeType_Fight , false )				-- �i�������
	SetModeEx( Controller , EM_SetModeType_Show , false )				-- ���
	AddToPartition( Controller , RoomID )

	ZONE16_PE01ORC_Obj[1] = Controller	-- �N�ާ@����[�J�Ĥ@��

	ZONE16_PE01ORC_Var["Controller"] = Controller	-- ��ɪ���GID

	return Controller;
end

--�˹����u
function LuaPE_ZONE16_PE01ORC_CreateWorker()	
	local Var = ZONE16_PE01ORC_Var					
	local FlagID = Var["FlagID"]
	local RoomID = Var["RoomID"]
	local workerID = Var["WorkerID"]
	local workerFlag = Var["WorkerFlag"]
	local Obj = {}
	
	for i = 1 , table.getn(workerFlag) do
		Obj[i] = CreateObjByFlag( workerID[rand(3)+1] , FlagID , workerFlag[i] , 1 )
		SetModeEx( Obj[i] , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
		SetModeEx( Obj[i] , EM_SetModeType_Obstruct , false )			-- ����
		SetModeEx( Obj[i] , EM_SetModeType_Gravity , true )				-- ���O
		SetModeEx( Obj[i] , EM_SetModeType_Mark , false )				-- �аO
		SetModeEx( Obj[i] , EM_SetModeType_Move , true )				-- ����
		SetModeEx( Obj[i] , EM_SetModeType_Searchenemy , false )		-- ����
		SetModeEx( Obj[i] , EM_SetModeType_HideName , true )			-- �W��
		SetModeEx( Obj[i] , EM_SetModeType_ShowRoleHead , false )		-- �Y����
		SetModeEx( Obj[i] , EM_SetModeType_Fight , false )				-- �i�������
		SetModeEx( Obj[i] , EM_SetModeType_Show , true )				-- ���
		AddToPartition( Obj[i] , RoomID )
		table.insert( Var["Worker"] , Obj[i] )	
	end
end

function LuaPE_ZONE16_PE01ORC_Mining()
	while 1 do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN )
		sleep(50)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_MINING_END )
		sleep(30)
	end	
end

function LuaPE_ZONE16_PE01ORC_CreateGuardArt()
	local Var = ZONE16_PE01ORC_Var					
	local FlagID = Var["FlagID"]
	local RoomID = Var["RoomID"]
	local GuardArtID = Var["GuardArtID"]
	local GuardArtFlag = Var["GuardArtFlag"]
	local GuardArt = {}
	
	for i = 1 , table.getn(GuardArtFlag) do	
		GuardArt[i] = CreateObjByFlag( GuardArtID[i], FlagID, GuardArtFlag[i], 1 )
		sleep(10)
		SetModeEx( GuardArt[i], EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
		SetModeEx( GuardArt[i], EM_SetModeType_Obstruct , false )			-- ����
		SetModeEx( GuardArt[i], EM_SetModeType_Gravity , true )				-- ���O
		SetModeEx( GuardArt[i], EM_SetModeType_Mark , true )				-- �аO
		SetModeEx( GuardArt[i], EM_SetModeType_Move , true )				-- ����
		SetModeEx( GuardArt[i], EM_SetModeType_Searchenemy , true )			-- ����
		SetModeEx( GuardArt[i], EM_SetModeType_HideName , false )			-- �W��
		SetModeEx( GuardArt[i], EM_SetModeType_ShowRoleHead , true )		-- �Y����
		SetModeEx( GuardArt[i], EM_SetModeType_Strikback , true )			-- ����
		SetModeEx( GuardArt[i], EM_SetModeType_Fight , true )				-- �i�������
		SetModeEx( GuardArt[i], EM_SetModeType_Show , true )				-- ���
		sleep(10)
		WriteRoleValue( GuardArt[i] , EM_RoleValue_IsWalk , 1 )				-- �Ψ�������
		MoveToFlagEnabled( GuardArt[i], true )
		AddToPartition( GuardArt[i], RoomID )
		CallPlot( GuardArt[i], "LuaPE_ZONE16_PE01ORC_GuardArtMove", i )		
	end
	return GuardArt
end

-- �R�����u
function LuaPE_ZONE16_PE01ORC_DelWorker()	
	local Worker = ZONE16_PE01ORC_Var["Worker"]
	for i = 1 , table.getn(Worker) do
		DelObj(Worker[i])
	end
end

-- �R���˹����L
function LuaPE_ZONE16_PE01ORC_DelGuardArt()	
	local GuardArt = ZONE16_PE01ORC_Var["GuardArt"]
	if GuardArt ~= nil then
		for i = 1 , table.getn(GuardArt) do
			DelObj(GuardArt[i])
		end
	end
end

--�˹����L����
function LuaPE_ZONE16_PE01ORC_GuardArtMove( FlagNum )
	local Var = ZONE16_PE01ORC_Var					
	local FlagID = Var["FlagID"]
	local GuardArtFlag = Var["GuardArtFlag"]
	while true do
		WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )				-- �Ψ�������
		sleep(rand(30)+50)
		LuaFunc_MoveToFlag( OwnerID(), FlagID, GuardArtFlag[FlagNum], 20 )		
	end
end

--���󲣥�
function LuaPE_ZONE16_PE01ORC_ObjCreate( ObjID, FlagID, ObjBronFlag, ObjNum )
	local Obj = {}
	local OrgID
	local Phase = ZONE16_PE01ORC_Phase
	local Var = ZONE16_PE01ORC_Var
	local RoomID = Var["RoomID"]
	local GuardID = Var["GuardID"]					-- ���L����ID
	local GuardLordID = Var["GuardLordID"]			-- ���L��������ID
	local OrcID = Var["OrcID"]						-- �~�H����ID
	local OrcLordID = Var["OrcLordID"]				-- �~�HBOSS����ID
	local Controller = Var["Controller"]			-- ��������	
	local rnd
	local count
	local Guard = {}
	local Orc = {}
		
	for i = 1 , ObjNum do			
		if type( ObjID ) ~= "table" then
			Obj[i] = CreateObjByFlag( ObjID , FlagID , ObjBronFlag, 1 )
		elseif type( ObjID ) == "table" then
			if Phase == 2 then
				rnd = rand(2)+1
			elseif Phase == 3 then
				rnd = rand(4)+1
			elseif Phase == 4 then
				rnd = rand(2)+3
			end	
			
			if ObjID == GuardID then		
				Obj[i] = CreateObjByFlag( ObjID[ rand(4)+1 ] , FlagID , ObjBronFlag[ rand(5)+1 ] , 1 )
			elseif ObjID == OrcID then
				Obj[i] = CreateObjByFlag( ObjID[ rnd ] , FlagID , ObjBronFlag[ rand(5)+1 ] , 1 )
			end
		end
		
		Sleep(2)
		WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 0 )			-- �ζ]������
		SetModeEx( Obj[i] , EM_SetModeType_Mark , true )			-- �аO
		SetModeEx( Obj[i] , EM_SetModeType_Strikback , true )		-- ����
		SetModeEx( Obj[i] , EM_SetModeType_Searchenemy , true )		-- ����
		SetModeEx( Obj[i] , EM_SetModeType_Fight , true )			-- �i�������
		SetIdleMotion( Obj[i] , ruFUSION_ACTORSTATE_COMBAT_1H )		-- �w�]�O�԰��ʧ@
		AddToPartition( Obj[i] , RoomID )
		MoveToFlagEnabled( Obj[i] , false )							-- �������޼@��
		table.insert( ZONE16_PE01ORC_Obj , Obj[i] )					-- �[�J����޲z�}�C
		AddBuff( Obj[i] , 506303 , 0 , -1 )							-- ��AE��Buff		
		BeginPlot( Obj[i], "LuaPE_ZONE16_PE01ORC_MoveToAttack", 0 ) -- �ۥD���ʧ����P�_	
		MoveToFlagEnabled( Obj[i], false )
		
		OrgID = ReadRoleValue( Obj[i] , EM_RoleValue_OrgID )
		for j = 1, table.getn( OrcID ) do
			if OrgID == OrcID[j] or OrgID == OrcLordID then		--����~�H	
				count = ReadRoleValue( Controller, EM_RoleValue_Register1 )
				WriteRoleValue( Controller, EM_RoleValue_Register1, count+1 )
				SetPlot( Obj[i], "DEAD", "LuaPE_ZONE16_PE01ORC_OrcDead", 0 )
				WriteRoleValue( Obj[i], EM_RoleValue_Register2, 1 ) -- ���O���~�H				
				break			
			elseif OrgID == GuardID[j] or OrgID == GuardLordID then		--�����L	
				count = ReadRoleValue( Controller, EM_RoleValue_Register2 )					
				WriteRoleValue( Controller, EM_RoleValue_Register2, count+1 )
				SetModeEx( Obj[i] , EM_SetModeType_Searchenemy , false ) -- �������L���
				WriteRoleValue( Obj[i], EM_RoleValue_Register2, 2 ) -- ���O�����L
				SetPlot( Obj[i], "DEAD", "LuaPE_ZONE16_PE01ORC_GuardDead", 0 )				
				break				
			end
		end		
		Sleep( 2 )
	end
	return Obj
end
--==================================================--



--==================================================--
--  �p�w�d���fŧ  ���`�B�z��                        --
--==================================================--
function LuaPE_ZONE16_PE01_Orc() --�a�ϭ�l�Ǫ�����
	SetPlot( OwnerID(), "DEAD", "LuaPE_ZONE16_PE01ORC_OrcDead", 0 )
end

function LuaPE_ZONE16_PE01ORC_GuardDead()	
	if ZONE16_PE01ORC_Phase > 0 and ZONE16_PE01ORC_Phase < 5 then
		local Var = ZONE16_PE01ORC_Var
		local Controller = Var["Controller"]		-- �����
		local GuardDead = Var["GuardDead"]			-- �ثe�Q�������ƥ�
		local MaxDeadGuard = Var["MaxDeadGuard"]	-- �ƥ󥢱ѳ̤j���L���`�ƥ�
		local MaxGuard = Var["MaxGuard"]			-- ���W�̦h���L�ƶq
		local FlagID = Var["FlagID"]	
		local GuardFlagID = Var["GuardFlagID"]		--���L���ͦ�m
		local count
		local backSay = {	"[SC_PE_ZONE16_01_M09]", 					--�ڭn���h���F�C
							"[SC_PE_ZONE16_01_M10]"	}					--�ѤU�N�浹�A�̤F�C
		
		GuardDead = GuardDead + 1		-- ���`�p��
		Var["GuardDead"] = GuardDead
		PE_SetVar( "ZONE16_PE01ORC_Var_MaxGuardDead" , GuardDead )		-- PE�ܼƧ���
		count = ReadRoleValue( Controller, EM_RoleValue_Register2 )
		WriteRoleValue( Controller, EM_RoleValue_Register2, count-1 )
				
		NPCSay( OwnerID(), backSay[rand(2)+1] )	
		for i=1, 3 do
			rnd = rand(5)+1		
			ks_MoveToFlag( OwnerID(), FlagID, GuardFlagID[rnd], 20 )
			Sleep(10)
		end
		DelObj( OwnerID() )
		return false
	end	
	return true
end

function LuaPE_ZONE16_PE01ORC_OrcDead()
	if ZONE16_PE01ORC_Phase > 0 and ZONE16_PE01ORC_Phase < 5 then
		local PEIndex = ZONE16_PE01ORC_PEIndex
		local Phase = ZONE16_PE01ORC_Phase
		local Var = ZONE16_PE01ORC_Var
		local Controller = Var["Controller"]	-- �����
		local OrcLordID = Var["OrcLordID"]		-- �~�HBossID
		local OrcDead = Var["OrcDead"]			-- �ثe�����~�H�ƶq
		local PH1Require = Var["PH1Require"]	-- �ƥ󺡨��ݭn�����~�H�ƥ�
		local PH2Require = Var["PH2Require"]	-- �ƥ󺡨��ݭn�����~�H�ƥ�
		local MapID = Var["MapID"] 
		local MaxOrc = Var["MaxOrc"]			-- ���W�̤j�~�H�ƶq
		local Total = ZONE16_PE01ORC_Total      -- PE�ֿn�`�n��
		local OrcBossDead
		local count
		local ObjID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
		local OrcID = ZONE16_PE01ORC_Var["OrcID"]--�Ǫ�
		
		local Bonus = 5
		for i=1, table.getn(OrcID) do
			if ObjID == OrcID[i] then
				if i >2 then
					Bonus = 20
				end
				break
			end
		end

		count = ReadRoleValue( Controller, EM_RoleValue_Register1 )
		if count > 0 then
			WriteRoleValue( Controller, EM_RoleValue_Register1, count-1 )
		end
				
		OrcDead = OrcDead + 1		-- ���`�p��
		Var["OrcDead"] = OrcDead
		if Phase == 1 then			
			PE_SetVar( "ZONE16_PE01ORC_Var_OrcDead1" , OrcDead )		-- PE�ܼƧ���
		elseif Phase == 2 then
			PE_SetVar( "ZONE16_PE01ORC_Var_OrcDead2" , OrcDead )		-- PE�ܼƧ���
		end	
		if ObjID == OrcLordID then	--Boss���` �ӧQ
			OrcBossDead = 1
			PE_SetVar( "ZONE16_PE01ORC_Var_OrcBossDead" , OrcBossDead )
			LuaPE_KS_GetBonus( PEIndex, MapID, 300 )
			Total = Total + 300
			ZONE16_PE01ORC_Total  = Total
		else
			LuaPE_KS_GetBonus( PEIndex, MapID, Bonus )         -- ������������
			Total = Total + Bonus
			ZONE16_PE01ORC_Total  = Total
		end
		return true	
	end
end

--==================================================--

--==================================================--
--  �ǷϪL�a���ܾ�  ���ʪ�t��                      --
--==================================================--
function LuaPE_ZONE16_PE01ORC_GuardDo()
	local Var = ZONE16_PE01ORC_Var
	local Phase = ZONE16_PE01ORC_Phase
	local FlagID = Var["FlagID"]					
	local GuardLordID = Var["GuardLordID"]			--���L��������ID
	local GuardID = Var["GuardID"]					--���L����ID
	local Controller = Var["Controller"]			--��������
	local GuardFlagID = Var["GuardFlagID"]			--���L���ͦ�m
	local GLordFlagID = Var["GLordFlagID"]			--���L�������ͦ�m
	local OrcFlagID = Var["OrcFlagID"]				--�~�H���ͦ�m
	local MaxGuard = Var["MaxGuard"]				--���W�̤j���L�ƶq	
	local TimeSpace = Var["TimeSpace"]				--�p�ɶ��j(��)
	local TimeCreateGuard = Var["TimeCreateGuard"]	--�C�����j�X�������L�ƥ�
	local RoomID = Var["RoomID"]
	local GuardNum = 0								--���W�ثe���L�ƶq	
	local CreateGuard								--��ڲ��ͼƶq
	local Guard = {}
	local GuardLord 
	
	GuardLord = LuaPE_ZONE16_PE01ORC_ObjCreate( GuardLordID , FlagID , GLordFlagID , 1 )

	while true do
		Phase = ZONE16_PE01ORC_Phase
		if Phase > 4 then break end --����
		GuardNum = ReadRoleValue( Controller, EM_RoleValue_Register2 )	--Ū�����L�ƶq
		if GuardNum < MaxGuard then			
			CreateGuard = MaxGuard - GuardNum			
			if CreateGuard >= TimeCreateGuard then
				LuaPE_ZONE16_PE01ORC_ObjCreate( GuardID , FlagID , GuardFlagID , TimeCreateGuard )			
			elseif CreateGuard < TimeCreateGuard then
				LuaPE_ZONE16_PE01ORC_ObjCreate( GuardID , FlagID , GuardFlagID , CreateGuard )
			end
		end
		Sleep( TimeSpace*10 ) --�Ͳ����j
	end
end

function LuaPE_ZONE16_PE01ORC_OrcDo()
	local Phase = ZONE16_PE01ORC_Phase
	local Var = ZONE16_PE01ORC_Var				
	local FlagID = Var["FlagID"]					
	local Controller = Var["Controller"]			-- ��������
	local GuardID = Var["GuardID"]					-- ���L����ID
	local OrcID = Var["OrcID"]						-- �~�H����ID
	local GuardFlagID = Var["GuardFlagID"]			-- ���L���ͦ�m
	local OrcFlagID = Var["OrcFlagID"]				-- �~�H���ͦ�m
	local MaxOrc = Var["MaxOrc"]					-- ���W�̤j�~�H�ƶq
	local TimeCreateOrc = Var["TimeCreateOrc"]		-- �C�����j�X�����~�H�ƥ�
	local TimeSpace = Var["TimeSpace"]				-- �p�ɶ��j(��)
	local OrcNum = 0								-- ���W�ثe�~�H�ƶq
	local CreateOrc									-- ��ڲ��ͼƶq
	
	while true do
		Phase = ZONE16_PE01ORC_Phase
		if Phase > 4 then break end --����
		TimeSpace = Var["TimeSpace"]
		CreateOrc = 0		
		OrcNum = ReadRoleValue( Controller, EM_RoleValue_Register1 ) --Ū���~�H�ƶq
		if OrcNum < MaxOrc then
			CreateOrc = MaxOrc - OrcNum 
			if CreateOrc >= TimeCreateOrc then
				LuaPE_ZONE16_PE01ORC_ObjCreate( OrcID , FlagID , OrcFlagID , TimeCreateOrc )
			elseif CreateOrc < TimeCreateOrc then
				LuaPE_ZONE16_PE01ORC_ObjCreate( OrcID , FlagID , OrcFlagID , CreateOrc )
			end
		end				
		Sleep( TimeSpace*10 ) --�Ͳ����j
	end
end

function LuaPE_ZONE16_PE01ORC_BossCreate()
	local Var = ZONE16_PE01ORC_Var
	local FlagID = Var["FlagID"]
	local OrcLordID = Var["OrcLordID"]				-- �~�HBOSS����ID
	local OLordFlagID = Var["OLordFlagID"]			-- �~�HBOSS���ͦ�m
	local OrcLord
	OrcLord = LuaPE_ZONE16_PE01ORC_ObjCreate( OrcLordID , FlagID , OLordFlagID , 1 )
end


--==================================================--


--==================================================--
--  �ǷϪL�a���ܾ�  �����������ܰ�              --
--==================================================--
function LuaPE_ZONE16_PE01ORC_MoveToAttack()		-- ����H���o�b
	local Phase = ZONE16_PE01ORC_Phase
	local Var = ZONE16_PE01ORC_Var					
	local FlagID = Var["FlagID"]					
	local Controller = Var["Controller"]			-- ��������
	local GuardID = Var["GuardID"]					-- ���L����ID
	local GuardLordID = Var["GuardLordID"]			-- ���L��������ID
	local OrcID = Var["OrcID"]						-- �~�H����ID
	local OrcLordID = Var["OrcLordID"]				-- ���L��������ID
	local GuardFlagID = Var["GuardFlagID"]			-- ���L���ͦ�m
	local OrcFlagID = Var["OrcFlagID"]				-- �~�H���ͦ�m	
	local moveCenter = 0
	local rnd = 0
	local SayRnd
	local moveRnd = 0
	local ObjType
	local Obj
	local gd1 = ZONE16_PE01ORC_Var["GuardDead"]
	local gd2 = 0
	local GuardSay = { 	[1] = "[SC_PE_ZONE16_01_M11]",  -- �ǷϪL�a�O�ڭ̪�!!
						[9] = "[SC_PE_ZONE16_01_M12]",  -- �u�X�ڭ̪��˪L!
						[17] = "[SC_PE_ZONE16_01_M13]",  -- �����ǹp�w�d�~�H�@�I�аV!
						[25] = "[SC_PE_ZONE16_01_M14]",  -- �ΤO��a!
						[33] = "[SC_PE_ZONE16_01_M15]" } -- �֨ӤH����!

	local OrcSay = { 	[1] = "[SC_PE_ZONE16_01_M16]",  -- ������n���Z�ڭ̪��ͬ�!!
						[9] = "[SC_PE_ZONE16_01_M17]",  -- �p�w�d�ڤ��|�Q���˪�!
						[17] = "[SC_PE_ZONE16_01_M18]",  -- �A�̵���|�I�X�N����!
						[25] = "[SC_PE_ZONE16_01_M19]",  -- �i�c���H��...
						[33] = "[SC_PE_ZONE16_01_M20]" } -- �˪L�����i��O�A�̪�!	
	
	while true do
		AddBuff( OwnerID() , 506303 , 0 , -1 ) -- ��AE Buff			
		Phase = ZONE16_PE01ORC_Phase
		rnd = rand(5)+1		
		if CheckID( OwnerID() ) ~= true or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			break
		else
			ObjType = ReadRoleValue( OwnerID(), EM_RoleValue_Register2 )
		end
		
		if Phase > 4 and CheckID( OwnerID() ) == true and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) ~= 1 then			
			LuaPE_ZONE16_PE01ORC_StopAttack( OwnerID() )
			if ReadRoleValue( OwnerID(), EM_RoleValue_OrgID ) == OrcFlagID then
				DelObj( OwnerID() )
			end
			ClearHateList( OwnerID(), -1 )
			
			if ObjType == 2 then --���L						
				if moveCenter < 2 then
					ks_MoveToFlag( OwnerID(), FlagID, GuardFlagID[rnd], 20 )
				elseif moveCenter == 2 then
					moveRnd = rand(2)+3
					ks_MoveToFlag( OwnerID(), FlagID, moveRnd, 20 )
				end
			elseif ObjType == 1 then	--�~�H
				ks_MoveToFlag( OwnerID(), FlagID, OrcFlagID[rnd], 20 )					
			end
			Sleep( 30 )
			DelObj( OwnerID() )
			break
		end
		
		SayRnd = rand(40)+1
		if ObjType == 2 then --���L	
			gd2 = ZONE16_PE01ORC_Var["GuardDead"]
			if gd2 > gd1 then
				gd1 = gd2
				AddBuff( OwnerID() , 506846 , 0 , -1 ) -- �E�y Buff
			end	
			if GuardSay[SayRnd] ~= nil and rand(2) == 0 then
				NPCSay( OwnerID(), GuardSay[SayRnd])
			end
		elseif ObjType == 1 then	--�~�H 
			if OrcSay[SayRnd] ~= nil and rand(2) == 0 then
				NPCSay( OwnerID(), OrcSay[SayRnd])
			end
		end

		Obj = Role:new( OwnerID())
		if Obj:IsAttack() ~= true and HateListCount( OwnerID() ) == 0 then
			--StopMove( OwnerID(), true )			
			if ObjType == 2 then --���L			
				if LuaPE_ZONE16_PE01ORC_GuardAttack() == false then
					if moveCenter == 0 then
						if moveRnd == 0 then moveRnd = rand(2)+3 end
						ks_MoveToFlag( OwnerID(), FlagID, moveRnd, 20 )
						if DW_CheckDis( OwnerID(), FlagID, moveRnd, rand(20)+20 ) then
							moveCenter = 1
						end
					elseif moveCenter == 1 then
						ks_MoveToFlag( OwnerID(), FlagID, moveRnd-2, 20 )
						if DW_CheckDis( OwnerID(), FlagID, moveRnd-2, rand(20)+20 ) then
							moveCenter = 2
						end
					elseif moveCenter == 2 then
						ks_MoveToFlag( OwnerID(), FlagID, OrcFlagID[rnd], 30 )
					end
				end
			elseif ObjType == 1 then	--�~�H 
				if Phase > 1 then
					if moveCenter == 0 then
						if moveRnd == 0 then moveRnd = rand(2)+1 end
						ks_MoveToFlag( OwnerID(), FlagID, moveRnd, 20 )
						if DW_CheckDis( OwnerID(), FlagID, moveRnd, rand(20)+20 ) then
							moveCenter = 1
						end
					elseif moveCenter == 1 then
						moveRnd = rand(2)+3
						ks_MoveToFlag( OwnerID(), FlagID, moveRnd, 30 )
						if DW_CheckDis( OwnerID(), FlagID, moveRnd, rand(20)+20 ) then
							moveCenter = 0
						end
					end
				end		
			end		
		end
		sleep(10)
	end
end

function LuaPE_ZONE16_PE01ORC_CheckOrc()
	local Obj = TargetID()
	local OrcID = ZONE16_PE01ORC_Var["OrcID"]
	local OrcLordID = ZONE16_PE01ORC_Var["OrcLordID"]
	
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
	for i=1, table.getn( OrcID )-1 do
		if OrgID == OrcID[i] or OrgID == OrcLordID and ReadRoleValue( OrgID, EM_RoleValue_IsDead ) ~= 1 then 
			return true
		end
	end
	return false
end

function LuaPE_ZONE16_PE01ORC_CheckGuard()
	local Obj = TargetID()
	local GuardID = ZONE16_PE01ORC_Var["GuardID"]
	local GuardLordID = ZONE16_PE01ORC_Var["GuardLordID"]
	
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
	for i=1, table.getn( GuardID )-1 do
		if OrgID == GuardID[i] or OrgID == GuardLordID then 
			return true
		end
	end
	return false	
end



function LuaPE_ZONE16_PE01ORC_GetOrc()
	local Guard = OwnerID()
	local Orc = TargetID()
	local target = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
	if target == 0 then
		WriteRoleValue( Guard, EM_RoleValue_Register1, Orc )
		SetAttack( OwnerID() , Orc )
	end
end

function LuaPE_ZONE16_PE01ORC_GuardAttack()	
	local Orc
	CastSpell( OwnerID(), OwnerID(), 495599 )--��ħP�_	
	Orc = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
	if CheckID( Orc ) == true and ReadRoleValue( Orc , EM_RoleValue_IsDead ) ~= 1 then
		return true
	else
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
		return false
	end

end
--==================================================--

--==================================================--
--  �ǷϪL�a���ܾ�  �ҰʳB�z��                      --
--==================================================--

function LuaPE_ZONE16_PE01ORC_Reset()--��PE���m
	local Var = ZONE16_PE01ORC_Var					
	local ResetTime = Var["ResetTime"]		-- ��	
	local creater = ZONE16_PE01ORC_Var["Creater"]
	local Mode = 1
	local GuardArt = LuaPE_ZONE16_PE01ORC_CreateGuardArt()
	ZONE16_PE01ORC_Var["GuardArt"] = GuardArt
	--Sleep( ResetTime*10 )
	LuaPE_ZONE16_PE01ORC_Start( Mode ) --mode
end

function LuaPE_ZONE16_PE01Test()--���L����1�p�ɪ��ɶ�
	local PEIndex = ZONE16_PE01ORC_PEIndex
	local Phase = ZONE16_PE01ORC_Phase	
	local PHIndex = 101
	
	LuaPE_ZONE16_PE01ORC_PhaseDO( Phase )
	PE_JumpToPhase( PEIndex, PHIndex )	
end
function LuaPE_ZONE16_PE01_Pass()--�q�L�Ĥ@���q
	PE_SetVar( "ZONE16_PE01ORC_Var_OrcDead1" , 30 )		-- PE�ܼƧ���
end
function LuaPE_ZONE16_PE02_Pass()--�q�L�ĤG���q
	PE_SetVar( "ZONE16_PE01ORC_Var_OrcDead2" , 40 )		-- PE�ܼƧ���
end


--==================================================--