
--==================================================--
-- ���W�䧮���]�ڤJ�I		�������N�u���O115053�F  zone2 zone 6���P						--
--==================================================--

--==================================================--
--  �����ܼư�                                      --
--==================================================--

function LuaPE_ZONE6_PE01_GlobalSet()	
	ZONE6_PE01_Obj = {}							-- �ϥΪ���޲z�}�C	
	ZONE6_PE01_Guard = {}
	ZONE6_PE01_Boss = {}
	ZONE6_PE01_Act = {}
	ZONE6_PE01_Var = {}							-- �ϥΰѼƺ޲z�}�C
	ZONE6_PE01_Phase = 0							-- ���q����
	ZONE6_PE01_TotalScore = 0
	ZONE6_PE01_PEIndex = 1
	
	ZONE6_PE01_Message = { 	[1] = "[SC_PE_ZONE6_01_M01]"; --
					[2] = "[SC_PE_ZONE6_01_M02]"; --
					[3] = "[SC_PE_ZONE6_01_M03]"; --
					[4] = "[SC_PE_ZONE6_01_M04]"; --
					[5] = "[SC_PE_ZONE6_01_M05]"; --
					}
							
	ZONE6_PE01_Var["ResetTime"] = 300				-- �������ȭ��m�ɶ�(��)	1�p��
	ZONE6_PE01_Var["MapID"] = 251						-- �����ƥ���Ͻs��		�����¹A��(926)
	ZONE6_PE01_Var["TestID"] = 1					-- �����ƥ���հϽs��
	ZONE6_PE01_Var["RoomID"] = 0	
		
	ZONE6_PE01_Var["ControllerID"] = 115053			-- PE�����GID
	ZONE6_PE01_Var["CreaterID"] = 115506			-- �Ͳ������GID
	ZONE6_PE01_Var["Controller"] = 0				-- PE�����
	ZONE6_PE01_Var["PH1_Creater"] = { 0,0,0,0,0,0 }	-- �Ͳ�����
	ZONE6_PE01_Var["PH2_Creater"] = 0
	ZONE6_PE01_Var["PH3_Creater"] = 0
	ZONE6_PE01_Var["GuardFlagID"] = 780656			-- �u�úX��
	ZONE6_PE01_Var["OtherFlagID"] = 780657			-- ��L�X��
	ZONE6_PE01_Var["ActFlagID"] = 780755			-- �t���X��

	ZONE6_PE01_Var["Acter"] = 0						-- �t�������
	ZONE6_PE01_Var["GuardFlag"] = { 1,2,3,4,5,6,7, 8 }
	ZONE6_PE01_Var["OtherFlag"] = { 1,2,3,4,5,6,7 }
	
	ZONE6_PE01_Var["PH1_Door"] = { 0,0,0,0,0,0 }
	ZONE6_PE01_Var["PH2_Door"] = 0
	ZONE6_PE01_Var["PH3_Door"] = 0
	ZONE6_PE01_Var["Boss"] = 0
	ZONE6_PE01_Var["DoorID"] = {	116403,			-- �ǰe��
									116404			-- �ǰe��
									}		

	ZONE6_PE01_Var["GuardLeader"] = 0
	ZONE6_PE01_Var["GuardMege"] = 0
	ZONE6_PE01_Var["GuardID"] = {	104608,		-- �j�k�v
						104609,		-- ����
						104610,		-- ����
						118173		-- �ǰe�v
					} 		
								
	ZONE6_PE01_Var["MstID"] = {		105625,		-- lv1
						105626,		-- lv2
						105627,		-- lv3
						105628 }		-- lv4
		
	ZONE6_PE01_Var["TimeSpace"] = 15				-- �p�ɶ��j(��)
	ZONE6_PE01_Var["MaxGuard"] = { 4, 6 }				-- �X�����u�üƥ�
	ZONE6_PE01_Var["MaxMst"] = { 6,8 }				-- �Ǫ��̤j��
	ZONE6_PE01_Var["TimeCreateMst"] = { 4, 6 }			-- �C�����j�X�����Ǫ��ƥ�	
	ZONE6_PE01_Var["TimeCreateGuard"] = 3			-- �C�����j�X�����Ǫ��ƥ�
	
	ZONE6_PE01_Var["Guard"] = {}					--���ͼƶq
	ZONE6_PE01_Var["Mst"] = {}					--���ͼƶq
	
	ZONE6_PE01_Var["PH1_Num"] = 4				-- �Ĥ@���q�J�I�I�ƶq
	ZONE6_PE01_Var["PH1_BossDead"] = 0				-- �Ĥ@���q����i��
	ZONE6_PE01_Var["PH2_Time"] = 900				-- �ĤG���q�˼Ʈɶ�	
end

--==================================================--

--==================================================--
--  �����ƥ�]�w��                                  --
--==================================================--
function LuaPE_ZONE6_PE01_PESet()

	local PE_Name = "SC_PE_ZONE6_01_NAME"					-- �x��������
	local PE_Desc = "SC_PE_ZONE6_01_DESC"					-- XXX���x�������A���X�{�b[ZONE_SILVERSPRING]�A�����b[ZONE_VARANAS]���H���o�{���e����L�A�_�h�N�|�a�Ӯ��W�C
	local PEIndex = ZONE6_PE01_PEIndex
	PE_AddPE( PE_Name , PE_Desc , PEIndex , 0 ) 	-- �s�W�@�Өƥ�

	local MapID = ZONE6_PE01_Var["MapID"]
	local TestID = ZONE6_PE01_Var["TestID"]
	PE_AddRegion( PEIndex , MapID )						-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , 261 )						-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , 254 )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , 259 )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�
	
	local PHIndex = 100	--���q�ܼ�
	
	local PH0_Name = "SC_PE_ZONE2_01_PHNAME00" --�޲���q������
	local PH1_Name = "SC_PE_ZONE6_01_PHNAME01"	-- XXX������
	local PH2_Name = "SC_PE_ZONE6_01_PHNAME02"	-- XXX���O�@
	local PH3_Name = "SC_PE_ZONE6_01_PHNAME03"	-- XXX������
	local PH4_Name = "SC_PE_ZONE6_01_PHNAME04"	-- XXX������
	
	local PH0_Desc = ""
	local PH1_Desc = "SC_PE_ZONE6_01_DESC_01"	-- ��U[104448]����XXX�������Q�}��
	local PH2_Desc = "SC_PE_ZONE6_01_DESC_02"	-- �O�@XXX�Ҷ}�_�q��XX���q�D�C
	local PH3_Desc = "SC_PE_ZONE6_01_DESC_03"	-- �O�@XXX�Ҷ}�_�q��XX���q�D�C
	local PH4_Desc = "SC_PE_ZONE6_01_DESC_04"	-- �O�@XXX�Ҷ}�_�q��XX���q�D�C

	PE_AddPhase( PEIndex , PHIndex , PH0_Name , PH0_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q0
	PE_AddPhase( PEIndex , PHIndex+1 , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q1
	PE_AddPhase( PEIndex , PHIndex+2 , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q2
	PE_AddPhase( PEIndex , PHIndex+3 , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q3
	PE_AddPhase( PEIndex , PHIndex+4 , PH4_Name , PH4_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q4

	local OBIndex = 1000
	
	local OB0_Name = "SC_PE_ZONE2_01_OBNAME00" --�Z����q�{���I
	local OB1_Name = "SC_PE_ZONE6_01_OBNAME01"	-- ���ѵ����}�Ҫ�
	local OB2_Name = "SC_PE_ZONE6_01_OBNAME02"	-- �O�@�j�k�v
	local OB3_Name = "SC_PE_ZONE6_01_OBNAME03"	-- �O�@�j�k�v
	local OB4_Name = "SC_PE_ZONE6_01_OBNAME04"	-- �O�@�j�k�v
	
	local OB0_Desc = ""
	local OB1_Desc = ""
	local OB2_Desc = ""
	local OB3_Desc = ""
	local OB4_Desc = ""
	
	-- PE���m�˼�
	PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex , OBIndex , OB0_Name , OB0_Desc , "ZONE6_PE01_ResetTime" , ZONE6_PE01_Var["ResetTime"]*1000 , 0 ,  true )
	
	-- �s�W�@�ӥؼСA���q1���\����GBoss ���`
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PHIndex+1 , OBIndex+1 , OB1_Name , OB1_Desc ,  "ZONE6_PE01_PH1_BossDead", 0 , ZONE6_PE01_Var["PH1_Num"],  true )
	
	-- �s�W�@�ӥؼСA���q2���\����G�w���˼�
	PE_PH_AddObjective_TimeLimit( PEIndex , PHIndex+2 , OBIndex+2 , OB2_Name , OB2_Desc , "ZONE6_PE01_PH2_Time" , ZONE6_PE01_Var["PH2_Time"]*1000 , 0 ,  true )
	
	-- �s�W�@�ӥؼСA���q3���\����G�k�v���`
	PE_PH_AddObjective_Equal( PEIndex , PHIndex+3 , OBIndex+3 , OB3_Name , OB3_Desc , "ZONE6_PE01_PH3_MegeDead" , 0 , 1 ,  true )

	-- �s�W�@�ӥؼСA���q4���\����GBoss ���`
	PE_PH_AddObjective_Equal( PEIndex , PHIndex+4 , OBIndex+4 , OB4_Name , OB4_Desc , "ZONE6_PE01_PH4_BossDead" , 0 , 1 ,  true )
		
	-- �]�w���q�s��
	PE_PH_SetNextPhase( PEIndex , PHIndex , PHIndex+1 )
	PE_PH_SetNextPhase( PEIndex , PHIndex+1 , PHIndex+2 )
	PE_PH_SetNextPhase( PEIndex , PHIndex+2 , PHIndex+3 )
	PE_PH_SetNextPhase( PEIndex , PHIndex+3 , PHIndex+4 )
		
	-- �]�w�ؼйF�����^��禡
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE6_PE01_OB_OnAchieve" )
	
	PE_SetScoreVisible( PEIndex, false )--����ܿn��
	-- �ƥ�Ұ�
	PE_Start( PEIndex , PHIndex )
end


function LuaPE_ZONE6_PE01_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	local Controller = ZONE6_PE01_Var["Controller"]	-- �����
	local Phase = ZONE6_PE01_Phase+1
	ZONE6_PE01_Phase = Phase

	if PHIndex == 100 and OBIndex == 1000 then 
	-- PE�˼Ƶ���-->�i�J�Ĥ@���q
		local PEIndex = ZONE6_PE01_PEIndex
		local OB1_Name = "SC_PE_ZONE6_01_OBNAME01"		
		local PH1_Num = rand(5)+2
		ZONE6_PE01_Var["PH1_Num"] = PH1_Num
		PE_PH_AddObjective_EqualAndGreater( PEIndex , 101 , 1001 , OB1_Name , "" ,  "ZONE6_PE01_PH1_BossDead", 0 , PH1_Num,  true )
		PE_RefreshConfig()--��sPE����
		CallPlot( Controller, "LuaPE_ZONE6_PE01_Message", Phase )		-- �bXXX�o�{�F�۴������A�������W�e���C
		CallPlot( Controller, "LuaPE_ZONE6_PE01_PhaseCreate", 1 )		-- ���ͩǪ�/�@��
	elseif PHIndex == 101 and OBIndex == 1001 then 
	-- �����Ĥ@���q-->�i�J�ĤG���q
		CallPlot( Controller, "LuaPE_ZONE6_PE01_Message", Phase )
		CallPlot( Controller, "LuaPE_ZONE6_PE01_PhaseCreate", 2 )		-- �����@��
	elseif PHIndex == 102 and OBIndex == 1002 then 
	-- �����ĤG���q-->�i�J�ĤT���q
		CallPlot( Controller, "LuaPE_ZONE6_PE01_Message", Phase )		-- ��ŧ
		CallPlot( Controller, "LuaPE_ZONE6_PE01_PhaseCreate", 3 )		-- ���ͩǪ�
	elseif PHIndex == 103 and OBIndex == 1003 then
	-- �����ĤT���q-->�i�J�ĥ|���q
		CallPlot( Controller, "LuaPE_ZONE6_PE01_CreateHelp", 0 )	--�W��
		CallPlot( Controller, "LuaPE_ZONE6_PE01_Message", Phase )		-- 				
	elseif PHIndex == 104 and OBIndex == 1004 then
	-- �����ĥ|���q
		CallPlot( Controller, "LuaPE_ZONE6_PE01_Message", Phase )		-- 
		CallPlot( Controller , "LuaPE_ZONE6_PE01_Start" , 0 )			-- ���m��������
	end
end

--==================================================--

--==================================================--
--  ���q/�T���B�z��                                 --
--==================================================--

function LuaPE_ZONE6_PE01_Message( Index )--�o�e�T��
	local Message = ZONE6_PE01_Message
	local Color = "0xffffff00"	-- �j��T��������
	
	ScriptMessage( OwnerID(), -1 , 1 , Message[Index] , Color )
	ScriptMessage( OwnerID(), -1 , 0 , Message[Index] , Color )
end

--==================================================--

--==================================================--
--  �����¹A��  ���󲣥Ͱ�                        --
--==================================================--

--�����]�w
function LuaPE_ZONE6_PE01_ControlSet( ObjID , RoomID, Site )	
	local Obj = KS_CreateObjMode( ObjID, Site , nil, 10, 1, 0 )
	
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Obj , EM_SetModeType_Obstruct , false )			-- ����
	SetModeEx( Obj , EM_SetModeType_Gravity , false )			-- ���O
	SetModeEx( Obj , EM_SetModeType_Mark , false )				-- �аO
	SetModeEx( Obj , EM_SetModeType_Move , false )				-- ����
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( Obj , EM_SetModeType_HideName , false )			-- �W��
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , false )		-- �Y����
	SetModeEx( Obj , EM_SetModeType_Fight , false )				-- �i�������
	SetModeEx( Obj , EM_SetModeType_Show , false )				-- ���
	AddToPartition( Obj , RoomID )
	table.insert( ZONE6_PE01_Obj, Obj )
	
	return Obj
end

function LuaPE_ZONE6_PE01_PhaseCreate( Phase )	-- �ةǱ���
	local CreaterID = ZONE6_PE01_Var["CreaterID"]
	local Controller = ZONE6_PE01_Var["Controller"]	
	local RoomID = ZONE6_PE01_Var["RoomID"]
	local OtherFlag = ZONE6_PE01_Var["OtherFlag"]
	local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
	local GuardFlag = ZONE6_PE01_Var["GuardFlag"]			-- ���ͦ�m
	local Creater
	
	if Phase == nil or Phase == 1 then
		local PH1_Num = ZONE6_PE01_Var["PH1_Num"]
		
		local FlagNum = table.getn(PH1_Door)
		Creater = ZONE6_PE01_Var["PH1_Creater"]	
		
		local Acter = LuaPE_ZONE6_PE01_ControlSet( CreaterID , RoomID, Controller )	-- �]�w�����
		ZONE6_PE01_Var["Acter"] = Acter
		BeginPlot( Acter, "LuaPE_ZONE6_PE01_GuardAct", 0 )	--�t��
		
		for i = 1 , PH1_Num do
			local random = rand(FlagNum)+1
			if Creater[random] ~= nil and Creater[random] ~= 0 then
				random = ks_CreateObjSearch( Creater, FlagNum, 0 )
			end
			Creater[random] = LuaPE_ZONE6_PE01_ControlSet( CreaterID , RoomID, Controller )	-- �]�w�����
			debugmsg(0,0,"random = "..random)
			CallPlot( Creater[random], "LuaPE_ZONE6_PE01_CreateMst", random, 1 )--���ͩǪ�
			CallPlot( Creater[random], "LuaPE_ZONE6_PE01_CreateGuard", random, 1 )--�����@��									
		end
	elseif Phase == 2 then
		Creater = LuaPE_ZONE6_PE01_ControlSet( CreaterID , RoomID, Controller )	-- �]�w�����
		ZONE6_PE01_Var["PH2_Creater"] = Creater
		CallPlot( Creater, "LuaPE_ZONE6_PE01_CreateGuard", 7, 2 )--�����@��	
	elseif Phase == 3 then
		Creater = LuaPE_ZONE6_PE01_ControlSet( CreaterID , RoomID, Controller )	-- �]�w�����
		ZONE6_PE01_Var["PH3_Creater"] = Creater
		CallPlot( Creater, "LuaPE_ZONE6_PE01_CreateMst", 7, 2 )--���ͩǪ�
	end
	
end

function LuaPE_ZONE6_PE01_CreateDoor( Mode, Site )--���ͪ�
	local DoorID = ZONE6_PE01_Var["DoorID"]
	local OtherFlagID = ZONE6_PE01_Var["OtherFlagID"]
	local GuardFlagID = ZONE6_PE01_Var["GuardFlagID"]
	local door
	local Height = 20
	local Trans = false
	
	if Site == 8 then
		door = LuaPE_ZONE6_PE01_ObjCreate( DoorID[Mode] , "Other", GuardFlagID, Site, 1 )
		SetPlot( door , "Collision" , "LuaZone_wb01_EnterPortal" , 50 )
		Height = 45
		Site = 7
		Trans = true
	else
		door = LuaPE_ZONE6_PE01_ObjCreate( DoorID[Mode] , "Other", OtherFlagID, Site, 1 )
	end
	SetModeEx( door , EM_SetModeType_Gravity , false )			-- ���O
	local X1 = ReadRoleValue( door, EM_RoleValue_X )
	local Y = ReadRoleValue( door, EM_RoleValue_Y )
	local Z1 = ReadRoleValue( door, EM_RoleValue_Z )
	local X2 = GetMoveFlagValue( GuardFlagID, Site, EM_RoleValue_X )
	local Z2 = GetMoveFlagValue( GuardFlagID, Site, EM_RoleValue_Z )	
	local Dir = CalDir( (X2-X1), (Z2-Z1) )
	
	if Trans == true then
		local PosDir = Dir+180
		if PosDir < 0 then PosDir = PosDir + 360
		elseif PosDir > 360 then PosDir = PosDir -360 end
	
		local Dis = 30	
		local radian = (math.pi/180)*( PosDir )--�|��
		local PosX = X1 +(Dis*math.cos(radian))
		local PosZ = Z1 - (Dis*math.sin(radian))	
		SetPos( door, PosX, Y+Height, PosZ, Dir )
	else
		SetPos( door, X1, Y+Height, Z1, Dir )
	end
	ks_ActSetMode( door )
	return door
end

function LuaPE_ZONE6_PE01_CreateGuard( Site, Num )--�����@��
	local Var = ZONE6_PE01_Var
	local GuardFlagID = Var["GuardFlagID"]
	local GuardID = Var["GuardID"]					-- �@�ê���ID	
	local MaxGuard = Var["MaxGuard"]				-- �@�üƥس̤j��
	local TimeCreateGuard = Var["TimeCreateGuard"] 	-- ���ͼƶq
	local TimeSpace = Var["TimeSpace"]				-- �p�ɶ��j(��)	
	local CreateGuard = 0
	local GuardNum = 0
	local Ctrl = OwnerID()
	local CreateType = 0
	
	Var["Guard"][Site] = 0
	if Site == 7 then
		ZONE6_PE01_Var["PH2_Door"] = LuaPE_ZONE6_PE01_CreateDoor( 2, Site+1 )
		LuaPE_ZONE6_PE01_ObjCreate( GuardID[1] , "Guard", GuardFlagID , Site, 1 )--�k�v
		CreateType = 1
	end
	
	while true do		
		GuardNum = Var["Guard"][Site] --Ū���ƶq
		
		if GuardNum < MaxGuard[Num] then
			CreateGuard = MaxGuard[Num] - GuardNum
			if CreateGuard >= TimeCreateGuard then
				LuaPE_ZONE6_PE01_ObjCreate( GuardID[3] , "Guard", GuardFlagID, Site, TimeCreateGuard, CreateType )
			elseif CreateGuard < TimeCreateGuard and CreateGuard > 0 then
				LuaPE_ZONE6_PE01_ObjCreate( GuardID[3] , "Guard", GuardFlagID, Site, CreateGuard, CreateType )
			end
		end
		--DebugMsg(0,0,"GuardNum["..Site.."] = "..Var["Guard"][Site])
		Sleep( TimeSpace*30 ) --�Ͳ����j
	end
end

function LuaPE_ZONE6_PE01_CreateHelp()--�W��
	local GuardFlagID = ZONE6_PE01_Var["GuardFlagID"]
	local GuardID = ZONE6_PE01_Var["GuardID"]					-- �@�ê���ID	
	local OtherFlagID = ZONE6_PE01_Var["OtherFlagID"]
	local MstID = ZONE6_PE01_Var["MstID"]
	
	local Boss = LuaPE_ZONE6_PE01_ObjCreate( MstID[4] , "Mst", OtherFlagID, 7, 1 )
	ZONE6_PE01_Var["Boss"] = Boss
	AddBuff( Boss, 509569, 0, -1 )--��j30%
	AddBuff( Boss, 502707, 0, -1 )--���|�^��
	table.insert( ZONE6_PE01_Boss, Boss )
	
	Sleep(30)
	local Leader = LuaPE_ZONE6_PE01_ObjCreate( GuardID[2] , "Guard", GuardFlagID , 7, 1 )--����
	SetAttack( Leader, Boss )
	SysCastSpellLv( Boss, Leader, 495767, 0 )--����MAX
	LuaPE_ZONE6_PE01_ObjCreate( GuardID[3] , "Guard", GuardFlagID, 7, 5 )
	Sleep(10)
	NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_19]" )
	Sleep(25)
	NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_20]" )
end

function LuaPE_ZONE6_PE01_GuardAct()--�����@��
	local Var = ZONE6_PE01_Var
	local Phase = ZONE6_PE01_Phase
	local ActFlagID = Var["ActFlagID"]
	local CreaterID = ZONE6_PE01_Var["CreaterID"]
	local RoomID = ZONE6_PE01_Var["RoomID"]
	local GuardID = Var["GuardID"]					-- �@�ê���ID	
	local TimeSpace = Var["TimeSpace"]				-- �p�ɶ��j(��)	
	local ActFlag = ZONE6_PE01_Var["ActFlag"] 		-- ���ͦ�m
	local Acter = ZONE6_PE01_Var["Acter"]
	local Creater = ZONE6_PE01_Var["PH1_Creater"]
	local Mege
	local Leader
	local Guard = {}
	local create
	
	local Trans = CreateObjByFlag( GuardID[4], ActFlagID, 4, 1 )
	AddToPartition( Trans , 0 )
	local shinning = LuaFunc_CreateObjByObj ( 111432 , Trans )
	table.insert( ZONE6_PE01_Obj , Trans )-- �[�J����޲z�}�C
	table.insert( ZONE6_PE01_Obj , shinning )-- �[�J����޲z�}�C
	SetMinimapIcon ( Trans, EM_MapIconType_FlightPoint )
	
	local Count = PE_GetActivePlayerGUIDCount( ZONE6_PE01_PEIndex )
	for i = 1 , Count do
		local GUID = PE_GetActivePlayerGUID( ZONE6_PE01_PEIndex )
		if ReadRoleValue( GUID, EM_RoleValue_LV ) >= 30 and GetDistance( GUID, Trans ) > 250 then
			local X = ReadRoleValue( GUID, EM_RoleValue_X )
			local Y = ReadRoleValue( GUID, EM_RoleValue_Y )
			local Z = ReadRoleValue( GUID, EM_RoleValue_Z )
			if CheckMapID( X , Y , Z , 261 ) == false then
				CallPlot( GUID, "LuaPE_ZONE6_PE01_Go", 0, "[SC_PE_ZONE6_01_TRANS_1]" )--���եζǰe
			end
		end
	end
	
	while (Phase == 1) do
		local count = 0
		for i =1, table.getn(Creater) do
			if Creater[i] > 0 and CheckID(Creater[i]) == true then
				count = count +1
			end
		end
		
		Phase = ZONE6_PE01_Phase
		if count <= 1 or Phase > 1 then
			DelObj(Acter)
			break
		end
		
		Mege = LuaPE_ZONE6_PE01_ObjCreate( GuardID[1] , "Act", ActFlagID , 1, 1 )
		Leader = LuaPE_ZONE6_PE01_ObjCreate( GuardID[2] , "Act", ActFlagID , 2, 1 )

		local X1 = GetMoveFlagValue( ActFlagID , 2 , EM_RoleValue_X )
		local X2 = GetMoveFlagValue( ActFlagID , 3 , EM_RoleValue_X )
		local Z1 = GetMoveFlagValue( ActFlagID , 2 , EM_RoleValue_Z )
		local Z2 = GetMoveFlagValue( ActFlagID , 3 , EM_RoleValue_Z )
		local Y = GetMoveFlagValue( ActFlagID , 3 , EM_RoleValue_Y )
		local Dir = CalDir( (X2-X1), (Z2-Z1) )
		local gDir = CalDir( (X1-X2), (Z1-Z2) )

		for i=1, 9 do
			local Dis = 30
			if i < 6 then
				PosDir =(gDir-60)+(120/5)*i
			else
				PosDir =(gDir-90)+(120/4)*(i-4)
				Dis = 20
			end
			if PosDir < 0 then PosDir = PosDir + 360
			elseif PosDir > 360 then PosDir = PosDir -360 end			
			
			local radian = (math.pi/180)*( PosDir )--�|��
			local PosX = X2 +(Dis*math.cos(radian))
			local PosZ = Z2 - (Dis*math.sin(radian))
			Y = GetHeight( PosX, Y, PosZ )
			Guard[i] = CreateObj ( GuardID[3] , PosX , Y, PosZ , gDir , 1)						
			AddToPartition( Guard[i] , 0 )
			
			ks_ActSetMode( Guard[i] )--�]�w�t����NPC
			table.insert( ZONE6_PE01_Act, Guard[i] )
			table.insert( ZONE6_PE01_Obj , Guard[i] )
		end
		
		SetDir( Leader, Dir ) --���V�ؼ�
		AdjustFaceDir( Mege, Guard[3], 0 ) --���V�ؼ�
				
		Sleep(20)
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_01]" )--�ݨӳo�̤]�����Ĥ�������ؼФF�C
		Sleep(20)
		AdjustFaceDir( Leader, Mege, 0 ) --���V�ؼ�
		NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_02]" ) -- �A�����ĤH�쩳�O...
		PlayMotion( Leader, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(25)
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_03]" )--�q�����ϰ�Ө�o�̪��J�I�̡C
		PlayMotion( Mege, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(25)
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_04]" )--�ثe[ZONE_VARANAS]�]�D������A���n�ήɤ����~�S���������Ǩ�ʩm�դ��A���J�I�ƥ󤴦b����o�͡C
		PlayMotion( Mege, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--�n�Y
		Sleep(35)
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_05]" )--�Ť��q���Z���۷��A�ݨӹ�襴��o�ʩ_ŧ�C
		PlayMotion( Mege, ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
		Sleep(25)
		AdjustFaceDir( Leader, Guard[3], 0 ) --���V�ؼ�
		NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_06]" )--����Ƥ��y��I�ڭ̤]�ߨ�X�ʡI
		PlayMotion( Leader, ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		Sleep(20)
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_07]" )--��L�]�k�A�A�̱N�P�ĤH��W�A�Хߨ谵�n�ǳơI
		AddBuff( Mege, 502662, 1, 30 ) --��o��
		PlayMotion( Mege, ruFUSION_ACTORSTATE_CHANNEL_LOOP )--�I�k
		Sleep(25)
		
		AdjustFaceDir( Mege, Guard[1], 0 ) --���V�ؼ�
		for i = 1, table.getn(Guard) do
			if rand(3) == 0 then
				NPCSay( Guard[i], "[SC_PE_ZONE6_01_ACT_08]" )--�ڭ̪��Z���H�ɳ����n�ǳƤF�I
			end
			PlayMotion( Guard[i], ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		end
		Sleep(15)
		for i = 1, table.getn(Guard) do
			PlayMotion( Mege, ruFUSION_ACTORSTATE_BUFF_BEGIN )
			CastSpell( Mege, Guard[i], 495735 )--�ǰe�S��
			WriteRoleValue( Guard[i], EM_RoleValue_LiveTime, 1 )
			sleep(10)
		end
		CancelBuff( Mege, 502662 )
		sleep(15)
		
		AdjustFaceDir( Mege, Leader, 0 ) --���V�ؼ�
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_09]" )--���۫H�O�ܦn�A���M�h������V�ӶV�t�F�C
		PlayMotion( Mege, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--�n�Y		
		Sleep(25)
		AdjustFaceDir( Leader, Mege, 0 ) --���V�ؼ�
		NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_10]" )--���O�o�򻡡A���ڭ̬��F��I�_�誺�Ǫ��w�g�S���h�l���H�O�F�C
		PlayMotion( Leader, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(25)		
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_11]" )--�p�G�o�̥���A[ZONE_VARANAS]�N�i�ন���ĤH�E�����O���ؼСA���[ZONE_CANDARA]�N�����_���C
		PlayMotion( Leader, ruFUSION_ACTORSTATE_EMOTE_SPEAK )		
		Sleep(25)		
		NPCSay( Mege, "[SC_PE_ZONE6_01_ACT_12]" )--�ҥH�A�̤����I
		PlayMotion( Mege, ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
		Sleep(20)		
		CastSpell( Mege, Mege, 495735 )--�ǰe�S��
		WriteRoleValue( Mege, EM_RoleValue_LiveTime, 1 )
		
		NPCSay( Leader, "[SC_PE_ZONE6_01_ACT_13]" )--�ݨӧY�ϬO�ħL�]���L�k��ܪ��԰�...
		PlayMotion( Leader, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )--�n�Y
		WriteRoleValue( Leader, EM_RoleValue_IsWalk, 1 )
		Sleep(10)
		ks_Move( Leader, 50, Leader )--�üƲ���
		WriteRoleValue( Leader, EM_RoleValue_LiveTime, 2 )
		Sleep( TimeSpace*10 ) --�Ͳ����j
	end
end

function LuaPE_ZONE6_PE01_CreateMst( Site, Num )	--�����]��
	local Phase
	local Var = ZONE6_PE01_Var
	local OtherFlagID = Var["OtherFlagID"]
	local MstID = Var["MstID"]						-- �Ǫ�����ID
	local MaxMst = Var["MaxMst"]					-- �Ǫ��ƶq
	local TimeSpace = Var["TimeSpace"]				-- �p�ɶ��j(��)
	local TimeCreateMst = Var["TimeCreateMst"] 		-- ���ͼƶq
	local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
	local PH3_Door = ZONE6_PE01_Var["PH3_Door"]
	
	local type = 0
	local CreateMst = 0
	local MstNum = 0
	local Ctrl = OwnerID()
	
	Var["Mst"][Site] = 0
	if Site ~= 7 then
		PH1_Door[Site] = LuaPE_ZONE6_PE01_CreateDoor( 1, Site )
		local Boss = LuaPE_ZONE6_PE01_ObjCreate( MstID[3] , "Mst", OtherFlagID, Site, 1 )
		AddBuff( Boss, 509568, 0, -1 )--��j20%
		AddBuff( Boss, 502707, 0, -1 )--���|�^��
		table.insert( ZONE6_PE01_Boss, Boss )
		DebugMsg( 0,0, "CreateBoss  ; Site = "..Site )
	else
		ZONE6_PE01_Var["PH3_Door"] = LuaPE_ZONE6_PE01_CreateDoor( 1, Site )				
		type = 1		
	end
	
	while true do
		MstNum = Var["Mst"][Site] --Ū���ƶq
		
		if MstNum < MaxMst[Num] then
			CreateMst = MaxMst[Num] - MstNum
			if CreateMst >= TimeCreateMst[Num] then
				LuaPE_ZONE6_PE01_ObjCreate( MstID[type+1] , "Mst", OtherFlagID, Site, TimeCreateMst[Num] )
			elseif CreateMst < TimeCreateMst[Num] then
				LuaPE_ZONE6_PE01_ObjCreate( MstID[type+1] , "Mst", OtherFlagID, Site, CreateMst )
			end
		end
		--DebugMsg(0,0,"MstNum["..Site.."] = "..Var["Mst"][Site])
		Sleep( TimeSpace*10 ) --�Ͳ����j
	end
end

function LuaPE_ZONE6_PE01_ObjCreate( ObjID, ObjType, FlagID, FlagObjID, ObjNum, CreateType )--���󲣥�
	local Obj = {}
	local Var = ZONE6_PE01_Var
	local RoomID = ZONE6_PE01_Var["RoomID"]
	local PhaseFlag = ZONE6_PE01_Var["OtherFlag"]
	local FlagNum = table.getn(PhaseFlag)-1
	local count = 0
	local Camp = {	["Guard"] = EM_RoleValue_Register1,
			["Mst"] = EM_RoleValue_Register2 
			}			
	local Ctrl = OwnerID()
	local Dir = 0
	local Range = 10
	
	if ObjType == "Guard" then
		if FlagObjID ~= 7 then
			local OtherFlagID = ZONE6_PE01_Var["OtherFlagID"]
			local X1 = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_X )
			local Z1 = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_Z )
			local X2 = GetMoveFlagValue( OtherFlagID, FlagObjID, EM_RoleValue_X )
			local Z2 = GetMoveFlagValue( OtherFlagID, FlagObjID, EM_RoleValue_Z )
			Dir = CalDir( (X2-X1), (Z2-Z1) )
			Range = 35
		else
			local X1 = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_X )
			local Z1 = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_Z )
			local X2 = GetMoveFlagValue( FlagID, FlagObjID+1, EM_RoleValue_X )
			local Z2 = GetMoveFlagValue( FlagID, FlagObjID+1, EM_RoleValue_Z )
			if ObjID == ZONE6_PE01_Var["GuardID"][1] then
				Dir = CalDir( (X2-X1), (Z1-Z2) )
				Range = 0
			else
				Dir = CalDir( (X1-X2), (Z1-Z2) )
				Range = 45
			end
		end
	elseif ObjType == "Other" then
		Range = 0		
	end

	local X = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_X )
	local Y= GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_Y )
	local Z = GetMoveFlagValue( FlagID, FlagObjID, EM_RoleValue_Z )
	
	for i = 1 , ObjNum do
		if CreateType == 1 then
			local PosDir = (Dir-60)+(120/ObjNum)*i
			if PosDir < 0 then PosDir = PosDir + 360
			elseif PosDir > 360 then PosDir = PosDir -360 end			
			
			local Dis = rand(20)+30
			local PosDir = PosDir - rand(15)+rand(15)
			local radian = (math.pi/180)*( PosDir )--�|��
			local PosX = X +(Dis*math.cos(radian))
			local PosZ = Z - (Dis*math.sin(radian))
			Y = GetHeight( PosX, Y, PosZ )
			Obj[i] = CreateObj ( ObjID , PosX , Y, PosZ , Dir , 1 )
		else
			Obj[i] = KS_CreateObjMode( ObjID, FlagID , FlagObjID, Range, 1, 0 )
		end
		Sleep(1)
		
		if ObjType ~= "Other" then
			WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 1 )			-- ����
			MoveToFlagEnabled( Obj[i] , false )					-- �������޼@��
			AddBuff( Obj[i] , 506303 , 0 , -1 )					-- ��AE��Buff
			
			if ObjType == "Guard" then		--�u��
				table.insert( ZONE6_PE01_Guard, Obj[i] )
				SetPlot( Obj[i], "DEAD", "LuaPE_ZONE6_PE01_GuardDead", 0 )
				WriteRoleValue( Obj[i], EM_RoleValue_Dir, Dir )
			elseif ObjType == "Mst" then	--�Ǫ�			
				SetPlot( Obj[i], "DEAD", "LuaPE_ZONE6_PE01_MstDead", 0 )
				BeginPlot( Obj[i], "LuaPE_ZONE6_PE01_AI", 0 )			-- AI
			elseif ObjType == "Act" then
				table.insert( ZONE6_PE01_Act, Obj[i] )
				ks_ActSetMode( Obj[i] )--�]�w�t����NPC
			end
			
			if ObjType ~= "Act" then
				Var[ObjType][FlagObjID] = Var[ObjType][FlagObjID] + 1
				WriteRoleValue( Obj[i], EM_RoleValue_Register1, Ctrl )--�Ѫ�
				WriteRoleValue( Obj[i], EM_RoleValue_Register3, FlagObjID )--�X�ͦ�m
			end
		end		
		AddToPartition( Obj[i] , RoomID )
		if ObjType == "Guard" then 
			if ObjID == ZONE6_PE01_Var["GuardID"][1] then
				CallPlot( Obj[i], "LuaPE_ZONE6_PE01_Mege", 0 )--�s��I�k
			end
			AddBuff( Obj[i], 509570, 4, -1 )--����W�[50%
			SysCastSpellLv( Obj[i], Obj[i], 495735, 0 )--�ǰe�S��
			SetIdleMotion( Obj[i], ruFUSION_ACTORSTATE_COMBAT_1H )	-- �w�]�O�԰��ʧ@
		end
		SetFlag( Obj[i], 544801, 1 )--�������_��
		table.insert( ZONE6_PE01_Obj , Obj[i] )-- �[�J����޲z�}�C
	end
	if ObjNum == 1 then
		return Obj[1]
	else
		return Obj
	end
end

function LuaPE_ZONE6_PE01_Mege()--��̬I�k
	local OID = OwnerID()
	local MaxHP = ReadRoleValue( OID, EM_RoleValue_MaxHP )
	local lock = { 0,0,0 }

	AddBuff( OID, 507514, 0, -1 )--�K�̪v��
	AddBuff( OID, 502707, 0, -1 )--���|�^��
	SetModeEx( OID , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( OID , EM_SetModeType_Move , false )			-- ����
	SetModeEx( OID , EM_SetModeType_Strikback , false )			-- ����	
	
	while CheckID(OID) do
		AdjustFaceDir( OID, ZONE6_PE01_Var["PH2_Door"], 0 ) --���V�ؼ�
		AddBuff( OID, 504936, 0, -1 ) --��o��
		PlayMotionEX( OID,ruFUSION_ACTORSTATE_CHANNEL_BEGIN, ruFUSION_ACTORSTATE_CHANNEL_LOOP )
		ClearHateList( OID, -1 )
		local HP = ReadRoleValue( OID, EM_RoleValue_HP )
		for i=1, 3 do
			if HP > 0 and HP< MaxHP*(0.25*i) and lock[i] == 0 then
				lock[i] = 1
				NPCSay( OID, "[SC_PE_ZONE6_01_ACT_1"..(8-i).."]" )
				break
			end
		end
		SysCastSpellLv( OID, OID, 496946, 2 )--�s�餳��
		sleep(20)
	end
end

--==================================================--

--==================================================--
--    ���`�B�z��                       				--
--==================================================--

function LuaPE_ZONE6_PE01_GuardDead()
	local OID = OwnerID()
	if GetModeEx( OID , EM_SetModeType_Fight ) == true then
		local GuardID = ZONE6_PE01_Var["GuardID"]
		local Create = ReadRoleValue( OID, EM_RoleValue_Register1 )
		local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID )	
		local site = ReadRoleValue( OID, EM_RoleValue_Register3 )
		ZONE6_PE01_Var["Guard"][Site] = ZONE6_PE01_Var["Guard"][Site] - 1
	
		if OrgID == GuardID[1] then		
			local PH2_Door = ZONE6_PE01_Var["PH2_Door"]
			PE_SetVar( "ZONE6_PE01_PH3_MegeDead" , 1 )	-- PE�ܼƧ���
			NPCSay( OID, "[SC_PE_ZONE2_01_ACT_18]" )
			DelObj(PH2_Door)
		elseif OrgID ~= GuardID[2] and rand(2) > 0 and CheckBuff( OID, 504345 ) ~= true then
			NPCSay( OID, "[SC_PE_ZONE6_01_ACT_1"..(rand(5)+4).."]" )
		end
		SetModeEx( OID , EM_SetModeType_Fight , false )			-- �i�������
		SetModeEx( OID , EM_SetModeType_Searchenemy , false )		-- ����
		SetModeEx( OID , EM_SetModeType_Move , false )			-- ����
		SetModeEx( OID , EM_SetModeType_Strikback , false )			-- ����		
		SetStopAttack( OID )
		ClearHateList( OID, -1 )
		SysCastSpellLv( OID, OID, 495735, 0 )--�ǰe�S��
		WriteRoleValue( OID, EM_RoleValue_LiveTime, 1 )
	end
	return false
end

function LuaPE_ZONE6_PE01_MstDead()
	local OID = OwnerID()
	local Phase = ZONE6_PE01_Phase
	local MstID = ZONE6_PE01_Var["MstID"]	
	local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID )
	local Create = ReadRoleValue( OID, EM_RoleValue_Register1 )
	local site = ReadRoleValue( OID, EM_RoleValue_Register3 )
	ZONE6_PE01_Var["Mst"][Site] = ZONE6_PE01_Var["Mst"][Site] - 1
	
	if OrgID == MstID[3] then
		local Obj = ZONE6_PE01_Obj
		local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
		ZONE6_PE01_Var["PH1_BossDead"] = ZONE6_PE01_Var["PH1_BossDead"] + 1
		PE_SetVar( "ZONE6_PE01_PH1_BossDead", ZONE6_PE01_Var["PH1_BossDead"] )	-- PE�ܼƧ���
		
		for i=1, table.getn(Obj) do
			if CheckID( Obj[i] ) == true and ReadRoleValue( Obj[i], EM_RoleValue_Register3 ) == site then
				AddBuff( Obj[i], 504345, 0, -1 )--�b�z��
				KillID( Obj[i], Obj[i] )
			end
		end
		DelObj(Create)
		DelObj(PH1_Door[site])
		local Hider = LuaFunc_CreateObjByObj ( 115506 , OID )
		Hide(Hider)
		SetModeEx( Hider , EM_SetModeType_Show , false )-- ���
		SetModeEx( Hider , EM_SetModeType_Mark , false )-- �аO
		Show( Hider, 0 )
		BeginPlot( Hider, "LuaPE_ZONE6_PE01_TransPlayer", 0 )
		DebugMsg(0,0, "PH1_Boss["..site.."] Dead")
	elseif OrgID == MstID[4] then
		local PH3_Door = ZONE6_PE01_Var["PH3_Door"]
		local PH2_Creater = ZONE6_PE01_Var["PH2_Creater"]
		local PH3_Creater = ZONE6_PE01_Var["PH3_Creater"]
		PE_SetVar( "ZONE6_PE01_PH4_BossDead", 1 )	-- PE�ܼƧ���
		DelObj(PH2_Creater)
		DelObj(PH3_Creater)
		DelObj(PH3_Door)
		DebugMsg(0,0, "PH1_Boss Dead" )
	end
	
	DelObj(OID)
	return false
end

function LuaPE_ZONE6_PE01_TransPlayer()--�ǰe
	Sleep(20)
	local Player = SearchRangePlayer( OwnerID() , 250 )
	for i = 0 , table.getn( Player ) do
		if Player[i] == -1 then 
			break
		end
		if ReadRoleValue( Player[i], EM_RoleValue_LV ) >= 30 then
			CallPlot( Player[i], "LuaPE_ZONE6_PE01_SetPos", Str )--�ǰe
		end
	end
	DelObj(OwnerID())
end

--==================================================--

--==================================================--
--  	���ʳB�z��                      			--
--==================================================--

function LuaPE_ZONE6_PE01_AI()--�Ǫ�AI
	local OID = OwnerID()
	local GuardID = ZONE6_PE01_Var["GuardID"]
	local MstID = ZONE6_PE01_Var["MstID"]
	local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID )
	local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
	local PH2_Door = ZONE6_PE01_Var["PH2_Door"]
	local PH3_Door = ZONE6_PE01_Var["PH3_Door"]
	local GuardFlagID = ZONE6_PE01_Var["GuardFlagID"]
	local Create = ReadRoleValue( OID, EM_RoleValue_Register1 )
	local Site = ReadRoleValue( OID, EM_RoleValue_Register3 )	
	
	while CheckID(Create) do
		if KS_InCombat( OID ) == false then -- �D�԰�
			if OrgID == MstID[3] or OrgID == MstID[4] then
				SysCastSpellLv( OID, OID, 496179, 0 )--�s��̰��ŬD�]
			end			
			WriteRoleValue( OID, EM_RoleValue_IsWalk, 1 )
			if PH3_Door ~= 0 and CheckID(PH3_Door) == true then
				ks_Move( OID, 30, GuardFlagID, Site )--�üƲ���
			elseif Site ~= 0 then
				ks_Move( OID, 40, GuardFlagID, Site )--�üƲ���
			end
		end
		sleep(20)
	end
end

--==================================================--

--==================================================--
--  	�ǰe�B�z��                      			--
--==================================================--

function LuaPE_ZONE6_PE01_Say()
	local T_ID = TargetID() --NPC
	local O_ID = OwnerID() --���a
	
	AdjustFaceDir( T_ID, O_ID, 0 ) --���V�ؼ�
	
	if ReadRoleValue( O_ID, EM_RoleValue_LV ) >= 30 then
		SetSpeakDetail( O_ID, "[SC_PE_ZONE6_01_TRANS_YES]" ) --�i�H�ǰe
		AddSpeakOption( O_ID, T_ID, "[SC_111796_0]", "LuaPE_ZONE6_PE01_SetPos",0)
	else
		SetSpeakDetail( O_ID, "[SC_PE_ZONE6_01_TRANS_NO]" ) --���i�H�ǰe
	end
end

function LuaPE_ZONE6_PE01_SetPos( Str )--�]�w�ǰe
	CloseSpeak( OwnerID() )
	local Phase = ZONE6_PE01_Phase
	local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
	local Creater = ZONE6_PE01_Var["PH1_Creater"]
	local GuardFlagID = ZONE6_PE01_Var["GuardFlagID"]
	Str = Str or "[SC_PE_ZONE6_01_TRANS_2]"
	local Flag = {}
	
	if Phase == 1 then
		for i =1, table.getn(PH1_Door) do
			if Creater[i] > 0 and CheckID(Creater[i]) == true then
				table.insert( Flag, i )
				debugmsg(0,0,"Flag = "..i)
			end
		end
	elseif Phase > 1 then
		Str = "[SC_PE_ZONE6_01_TRANS_3]"
		table.insert( Flag, 7 )
	end
	debugmsg(0,0,"-------------------")
	local Site = table.getn(Flag)
	CallPlot( OwnerID(), "LuaPE_ZONE6_PE01_DialogRePort", OwnerID(), GuardFlagID, Flag[rand(Site)+1], str, 30, 100, 15 )--�߰ݪ��a��ǰe
end

function LuaPE_ZONE6_PE01_DialogRePort( Obj, var1, var2, str, RndRange, CloseRange, time  )--�߰ݪ��a��ǰe
--�d��1 ���a(Obj) �X�Ъ���s��(var1) �X�Ц�m(var2) �T���r��(str) �H���Z��(Rnd_Range) ��������(�Z��CloseRange/ �ɶ�time )
--�d��2 ���a(Obj) ����GUID(var1) �ŭ�(var2) �T���r��(str) �H���Z��(Rnd_Range) ��������(�Z��CloseRange/ �ɶ�time )

	if CheckBuff( Obj, 501570 ) == false then  --�W�[�ˬd�P�_
		AddBuff( Obj, 501570, 0, -1);--�M�ᵹ��BUFF

		DialogCreate( Obj, EM_LuaDialogType_YesNo, str )
		DialogSelectStr( Obj, "[SO_YES]" )
		DialogSelectStr( Obj, "[SO_NO]" )
		if	ks_DialogRePort_TwoChoose( Obj, CloseRange, time ) == "Yes" then
			local Creater = ZONE6_PE01_Var["PH1_Creater"]
			local Phase = ZONE6_PE01_Phase
			local PH1_Door = ZONE6_PE01_Var["PH1_Door"]
			local Flag = {}
			--DebugMsg(0,0,"var2 = "..var2)
			if Phase == 1 and CheckID(Creater[var2]) ~= true then
				for i =1, table.getn(PH1_Door) do
					if Creater[i] > 0 and CheckID(Creater[i]) == true then
						table.insert( Flag, i )
						--debugmsg(0,0,"Flag = "..i)
					end
				end
			elseif Phase > 1 then
				table.insert( Flag, 7 )
			end
			local Site = table.getn(Flag)
			if Site > 0 then
				var2 = Flag[rand(Site)+1]
			end
			AddBuff( Obj, 506098, 0, -1 )--�e���@��
			sleep(5)
		
			AddBuff( Obj, 509583, var2-1, -1 )--�˹�ǰe��
			ks_RandRangeSetPos( Obj, var1, var2, RndRange )--�ǰe�ܺX�Ц�m
			CancelBuff( Obj, 506098 )
		end
	else
		ScriptMessage( Obj, Obj, 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function LuaPE_ZONE6_PE01_CheckSite()--�T�{��m
	local Obj = OwnerID()
	local Site = KS_CheckBuffLV( Obj, 509583 )	
	DebugMsg(0,0,"Site = "..Site)
	local Creater = ZONE6_PE01_Var["PH1_Creater"]
	local Phase = ZONE6_PE01_Phase
	local PH1_Door = ZONE6_PE01_Var["PH1_Door"]	
	local Flag = {}
	local str = "[SC_PE_ZONE6_01_TRANS_2]"
	if Site ~= 7 and Site > 0 then
		if Phase == 1 and CheckID(Creater[Site]) ~= true then
			for i =1, table.getn(PH1_Door) do
				if Creater[i] > 0 and CheckID(Creater[i]) == true then
					table.insert( Flag, i )
					debugmsg(0,0,"Flag = "..i)
				end
			end
		elseif Phase > 1 then
			Str = "[SC_PE_ZONE6_01_TRANS_3]"
			table.insert( Flag, 7 )				
		end
		local SiteNum = table.getn(Flag)
		if SiteNum > 0 then		
			Site = Flag[rand(SiteNum)+1]
			local GuardFlagID = ZONE6_PE01_Var["GuardFlagID"]
			DebugMsg(0,0,"NewSite = "..Site)
			CancelBuff( Obj, 509583 )--�M���˹�ǰe��
			--CallPlot( Obj, "ks_RandRangeSetPos", Obj, GuardFlagID, Site, 30 )--�ǰe�ܺX�Ц�m
			CallPlot( Obj, "LuaPE_ZONE6_PE01_DialogRePort", Obj, GuardFlagID, Site, str, 20, 100, 60 )--�߰ݪ��a��ǰe
		end
		--CancelBuff( Obj, 509583 )--�M���˹�ǰe��
	else
		CancelBuff( Obj, 509583 )--�M���˹�ǰe��
	end
end

--==================================================--

--==================================================--
--    �ҰʳB�z��                   				  	--
--==================================================--

function LuaPE_ZONE6_PE01_Start( Mode )
	if ZONE6_PE01_Obj ~= nil then		
		LuaPE_ZONE6_PE01_DelObj( 1 )
	end
	
	LuaPE_ZONE6_PE01_GlobalSet()	-- �@���ܼƳ]�w
	ZONE6_PE01_Var["Controller"] = OwnerID()
	if Mode == nil then
		LuaPE_ZONE6_PE01_PESet()	-- �����ƥ�]�w		
	end
	debugmsg(0,0,"ZONE6_PE01 Start")
end

--==================================================--

--==================================================--
--		�R������P���ճB�z��						--
--==================================================--

function LuaPE_ZONE6_PE01_DelObj( Mode, Kill )
	local Obj
	
	if Mode == nil or Mode == 1 then
		Obj = ZONE6_PE01_Obj
	elseif Mode == 2 then
		Obj = ZONE6_PE01_Boss
	elseif Mode == 3 then
		Obj = ZONE6_PE01_Guard
	elseif Mode == 4 then
		Obj = ZONE6_PE01_Act
	end
		
	local ObjNum = table.getn(Obj)
	if ObjNum > 0 then
		for i = 1, ObjNum do
			if CheckID( Obj[i]) == true then
				DelObj( Obj[i] )
			end
		end
	end	
end

function LuaPE_ZONE6_PE01_KillBoss()--�����Ҧ�BOSS
	local Obj = ZONE6_PE01_Boss
	local ObjNum = table.getn(Obj)
	if ObjNum > 0 then
		for i = 1, ObjNum do
			if CheckID( Obj[i]) == true then
				KillID( Obj[i], Obj[i] )
			end
		end
	end
end

function LuaPE_ZONE6_PE01_Go( Site, Str )--���եζǰe
	Str = Str or "[SC_PE_ZONE16_DW_40]"
	local FlagID = ZONE6_PE01_Var["GuardFlagID"]
	local OID = OwnerID()
	Site = Site or 0
	
	if Site == 0 then
		FlagID = ZONE6_PE01_Var["ActFlagID"]
		CallPlot( OID, "ks_DialogRePort_SetPos", OID, FlagID, 3, str, 30, 100, 15 )--�߰ݪ��a��ǰe
	else
		CallPlot( OID, "ks_DialogRePort_SetPos", OID, FlagID, Site, str, 30, 100, 15 )--�߰ݪ��a��ǰe
	end
end

function LuaPE_ZONE6_PE01_SetTime( Type )--�]�wPE�ɶ�
	Type = Type or 0
	
	if Type == 0 then
		PE_SetVar( "ZONE6_PE01_ResetTime", 20000 )
	elseif Type == 1 then
		PE_SetVar( "ZONE6_PE01_PH2_Time", 20000 )
	end
end

--==================================================--