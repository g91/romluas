
--==================================================--
-- �Ӷ�												--
--==================================================--
--==================================================--
--  �����ܼư�                                      --
--==================================================--

function Lua_Zone19_PE01_GlobalSet()	
	Zone19_PE01_Obj = {}							-- �ϥΪ���޲z�}�C
	Zone19_PE01_NPC = {}							-- �ϥΪ���޲z�}�C
	Zone19_PE01_LinkList = {}						-- �F���嵲
	Zone19_PE01_Var = {}							-- �ϥΰѼƺ޲z�}�C	
	Zone19_PE01_Phase = 0							-- ���q����
	Zone19_PE01_PEIndex = 1901
							
	Zone19_PE01_Var["ResetTime"] = 3600				-- �������ȭ��m�ɶ�(��)	1�p��	
	Zone19_PE01_Var["MapID"] = 515					-- �����ƥ���Ͻs��		�J�|���Ӷ�(926)
	Zone19_PE01_Var["TestID"] = 1					-- �����ƥ���հϽs��
	Zone19_PE01_Var["RoomID"] = 0	
		
	Zone19_PE01_Var["ControllerID"] = 115053		-- PE�����GID
	Zone19_PE01_Var["CreaterID"] = 115506			-- �Ͳ������GID	
	Zone19_PE01_Var["Controller"] = 0				-- PE�����
	Zone19_PE01_Var["Creater"] = 0					-- �Ͳ�����
	Zone19_PE01_Var["FlagID"] = 780656				-- �X��ID
	Zone19_PE01_Var["MstFlagID"] = 780657			-- �X��ID
	Zone19_PE01_Var["BossFlagID"] = 780657			-- BOSS�κX��
	
	Zone19_PE01_Var["GiveItem"] = {	[1] = 208434;	--����
									[2] = 208433	--�ľ�
									}
		
	Zone19_PE01_Var["NPCID"] = {	116808,		-- ����
									116809, 	-- ����
									116810,		-- ����
									116811, 	-- ����
									116812		-- ����
									}
	
	Zone19_PE01_Var["MstID"] = 104859			-- �Ӷ�G��(�j�ƪ�)
	Zone19_PE01_Var["DeathID"] = 116813			-- ����
	Zone19_PE01_Var["BladeID"] = 116815			-- �`�W���b
	Zone19_PE01_Var["BossID"] = 104852			-- BOSS
	Zone19_PE01_Var["Boss"] = 0					-- BOSS
										
	Zone19_PE01_Var["TimeSpace"] = 20			-- �p�ɶ��j(��)
	Zone19_PE01_Var["NPCDead"] = 0				-- NPC���`�ƶq
	Zone19_PE01_Var["MaxMst"] = 5				-- Mst�̤j�ƶq
	Zone19_PE01_Var["TimeCreateMst"] = 3		-- �C���X���ƶq
	
	Zone19_PE01_Var["PH2Require"] = 10			--�ĤG���q�N����ƶq
	Zone19_PE01_Var["PH4Kill"] = 25				--�ĥ|���q����^�ƶq
	Zone19_PE01_Var["PH6Time"]	= 180			--�������q�����ɶ�
	
	Zone19_PE01_Var["Bonus"] = { 5, 10, 15, 200 }	-- ����
	
	Zone19_PE01_Var["ExCha_Ratio"] = 100			-- �^�X��v
	Zone19_PE01_Var["MaxBonus"] = 1400				-- �̤j����

	Zone19_PE01_NPC_Message = {	[10] = "[SC_PE_ZONE19_01_NPCSAY_05]";--���F�O�@��L�H�A�Э�̧ڭ�...
								[20] = "[SC_PE_ZONE19_01_NPCSAY_06]";--���٬O�����۫H�L�̤]���g�O���`�H�C
								[30] = "[SC_PE_ZONE19_01_NPCSAY_07]";--�ڭ̬O�_�]�|�V�L�̤@��?
								[40] = "[SC_PE_ZONE19_01_NPCSAY_08]";--�o�̪��G����b���H���ӮD�N�C
								[50] = "[SC_PE_ZONE19_01_NPCSAY_09]";--�o�ǷP�V�̦��G�w�g�S������...
							}	
end

--==================================================--



--==================================================--
--  �����ƥ�]�w��                                  --
--==================================================--
function Lua_Zone19_PE01_PESet()

	local PE_Name = "SC_PE_ZONE19_01_NAME"					-- �L�ɪ��]��
	local PE_Desc = "SC_PE_ZONE19_01_DESC"					-- ��`�Ӷ餺���F�C�����G�ͥ~�٦��Ǥ��M�`���Ʊ��o�͡C
	local PEIndex = Zone19_PE01_PEIndex	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 	-- �s�W�@�Өƥ�

	local MapID = Zone19_PE01_Var["MapID"]
	local TestID = Zone19_PE01_Var["TestID"]
	PE_AddRegion( PEIndex , MapID )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�
	
	local PH0Index = 100	--���q�ܼ�
	local PH1Index = 101	
	local PH2Index = 102
	local PH3Index = 103
	local PH4Index = 104
	local PH5Index = 105
	local PH6Index = 106
	local PH7Index = 107
	
	local PH0_Name = "SC_PE_ZONE16_DW_22" --���m�ɶ�
	local PH1_Name = "SC_PE_ZONE19_01_PHNAME01"	-- ���������v
	local PH2_Name = "SC_PE_ZONE19_01_PHNAME02"	-- �G�h���M�w
	local PH3_Name = "SC_PE_ZONE19_01_PHNAME03"	-- �E�̪��_��
	local PH4_Name = "SC_PE_ZONE19_01_PHNAME04"	-- ��ר�ŧ
	local PH5_Name = "SC_PE_ZONE19_01_PHNAME05"	-- �L�k��U������
	local PH6_Name = "SC_PE_ZONE19_01_PHNAME06"	-- ��ū
	local PH7_Name = "SC_PE_ZONE19_01_PHNAME07"	-- �M������
	
	local PH0_Desc = ""
	local PH1_Desc = "SC_PE_ZONE19_01_PH1_DESC"	-- �X�{�b�Ӷ骺�������v�b�D���Ǥ���...
	local PH2_Desc = "SC_PE_ZONE19_01_PH2_DESC"	-- ���M���o�w�A���]�u��N�P�V�̪�����Τ��b�ơC
	local PH3_Desc = "SC_PE_ZONE19_01_PH3_DESC"	-- �������e�f�o�ͦb�լd�Ψ��W�C
	local PH4_Desc = "SC_PE_ZONE19_01_PH4_DESC"	-- �x�u�䤤�A�]�u��ĤO����...
	local PH5_Desc = "SC_PE_ZONE19_01_PH5_DESC"	-- �I�t�Ӧh�L�k��U���ƪ�...
	local PH6_Desc = "SC_PE_ZONE19_01_PH6_DESC"	-- �V�F�Ӧh���A��å��h�F�\�h�P��A�Y�Ϧ��`�]�L�k�w��...
	local PH7_Desc = "SC_PE_ZONE19_01_PH7_DESC"	-- �̫᪺���@

	PE_AddPhase( PEIndex , PH0Index , PH0_Name , PH0_Desc , 0 , 0 , 0 , 0 )	-- �˼�
	PE_AddPhase( PEIndex , PH1Index , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- ����
	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 1 , 0 , 0 )	-- �N����
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 1 , 0 , 0 )	-- �]��
	PE_AddPhase( PEIndex , PH4Index , PH4_Name , PH4_Desc , 0 , 1 , 0 , 0 )	-- ���L��
	PE_AddPhase( PEIndex , PH5Index , PH5_Name , PH5_Desc , 0 , 1 , 0 , 0 )	-- ����
	PE_AddPhase( PEIndex , PH6Index , PH6_Name , PH6_Desc , 0 , 0 , 0 , 0 )	-- ��BOSS
	PE_AddPhase( PEIndex , PH7Index , PH7_Name , PH7_Desc , 0 , 0 , 0 , 0 )	-- ����

	local OB0Index = 1000
	local OB1Index = 1001
	local OB2Index = 1002
	local OB3Index = 1003
	local OB4Index = 1004
	local OB5Index = 1005
	local OB6Index = 1006
	local OB7Index = 1007
	
	local OB8Index = 1008
	local OB9Index = 1009
	
	local OB0_Name = "SC_PE_ZONE16_DW_21" --�Ѿl�ɶ�
	local OB1_Name = "SC_PE_ZONE19_01_OBNAME01"	-- ���F�j�q
	local OB2_Name = "SC_PE_ZONE19_01_OBNAME02"	-- �I�N����
	local OB3_Name = "SC_PE_ZONE19_01_OBNAME03"	-- �լd
	local OB4_Name = "SC_PE_ZONE19_01_OBNAME04"	-- ��׷P�V�̨�ŧ
	local OB5_Name = "SC_PE_ZONE19_01_OBNAME05"	-- �D���ɪ����
	local OB6_Name = "SC_PE_ZONE19_01_OBNAME06"	-- ��ū�g�����`��
	local OB7_Name = "SC_PE_ZONE19_01_OBNAME07"	-- ���@
	
	local OB8_Name = "SC_PE_ZONE19_01_OBNAME08"	-- [116808]�����`
	local OB9_Name = "SC_PE_ZONE16_DW_21"	--�Ѿl�ɶ�
	
	local OB0_Desc = ""
	local OB1_Desc = "" 
	local OB2_Desc = "SC_PE_ZONE19_01_OB2_DESC" --��U�լd�Ϊ���ʡA�èϥ�[208434]�I�N�P�V�̪�����C
	local OB3_Desc = "SC_PE_ZONE19_01_OB3_DESC" --��U�լd�Ϊ���ʡA�èϥ�[208433]�v�����P�V���լd�̡C
	local OB4_Desc = "SC_PE_ZONE19_01_OB4_DESC" --��U�լd�Ω�ר�ŧ�C	
	local OB5_Desc = ""
	local OB6_Desc = "SC_PE_ZONE19_01_OB6_DESC" --�b�������ɶ�����ū�g�����`��
	local OB7_Desc = ""
	local OB8_Desc = ""
	local OB9_Desc = ""

	local PH2Require = Zone19_PE01_Var["PH2Require"]
	local PH4Kill = Zone19_PE01_Var["PH4Kill"]
	local PH6Time = Zone19_PE01_Var["PH6Time"]
	
	-- PE���m�˼�
	PE_PH_AddObjective_TimeLimit( PEIndex , PH0Index , OB0Index , OB0_Name , OB0_Desc , "Zone19_PE01_PH0_Time" , Zone19_PE01_Var["ResetTime"]*1000 , 0 ,  true )
	
	-- ���q1���\����:����
	PE_PH_AddObjective_Equal( PEIndex , PH1Index , OB1Index , OB1_Name , OB1_Desc , "Zone19_PE01_Var_PH1Require" , 0 , 1 ,  true )
	
	-- ���q2���\����G�N����
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "Zone19_PE01_Var_PH2Require" , 0 , PH2Require,  true )
	
	-- ���q3���\����G�]��
	PE_PH_AddObjective_Equal( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "Zone19_PE01_Var_PH3Require" , 0 , 3,  true )	
	
	-- ���q4���\����G���L��
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB4Index , OB4_Name , OB4_Desc , "Zone19_PE01_Var_PH4Kill" , 0 , PH4Kill,  true )
	
	-- ���q5���\����G����
	PE_PH_AddObjective_Equal( PEIndex , PH5Index , OB5Index , OB5_Name , OB5_Desc , "Zone19_PE01_Var_PH5Require" , 0 , 1 ,  true )
	
	-- ���q6���\����GBOSS���`
	PE_PH_AddObjective_Equal( PEIndex , PH6Index , OB6Index , OB6_Name , OB6_Desc , "Zone19_PE01_Var_BossDead" , 0 , 1,  true )
	
	-- ���q7���\����G����
	PE_PH_AddObjective_Equal( PEIndex , PH7Index , OB7Index , OB7_Name , OB7_Desc , "Zone19_PE01_Var_PH7Require" , 0 , 1,  true )
	
	-- ���q2,3,4���ѱ���G�լd�α��I
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB8Index , OB8_Name , OB8_Desc , "Zone19_PE01_Var_NPCDead" , 0 , 1,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB8Index , OB8_Name , OB8_Desc , "Zone19_PE01_Var_NPCDead" , 0 , 1,  false )	
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB8Index , OB8_Name , OB8_Desc , "Zone19_PE01_Var_NPCDead" , 0 , 1,  false )	
	
	-- ���q6���ѱ���G�ɶ���
	PE_PH_AddObjective_TimeLimit( PEIndex , PH6Index , OB9Index , OB9_Name , OB9_Desc , "Zone19_PE01_PH6_Time" , PH6Time*1000 , 0 ,  false )

	-- �]�w���q�s��
	PE_PH_SetNextPhase( PEIndex , PH0Index , PH1Index )
	PE_PH_SetNextPhase( PEIndex , PH1Index , PH2Index )
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )
	PE_PH_SetNextPhase( PEIndex , PH4Index , PH5Index )
	PE_PH_SetNextPhase( PEIndex , PH5Index , PH6Index )
	PE_PH_SetNextPhase( PEIndex , PH6Index , PH7Index )
		
	-- �]�w�ؼйF�����^��禡
	PE_OB_SetCallBackOnAchieve( PEIndex , "Lua_Zone19_PE01_OB_OnAchieve" )
	
	-- �]�w�ƥ󵲧�������^��禡
	PE_SetCallBackOnBalance( PEIndex , "Lua_Zone19_PE01_FinalExchange" )

	-- �ƥ�Ұ�
	PE_Start( PEIndex , PH0Index )

end

function Lua_Zone19_PE01_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	local Controller = Zone19_PE01_Var["Controller"]	-- �����
	local Creater = Zone19_PE01_Var["Creater"]			-- �����

	if PHIndex == 100 and OBIndex == 1000 then 		-- �i�J�Ĥ@���q	
		BeginPlot( Controller, "Lua_Zone19_PE01_NPC_ACT1", 0 )
	elseif PHIndex == 103 and OBIndex == 1003 then	-- �i�J�ĥ|���q
		BeginPlot( Creater, "Lua_Zone19_PE01_CreateMst", 0 )		
	elseif PHIndex == 104 and OBIndex == 1004 then	-- �i�J�Ĥ����q
		BeginPlot( Controller, "Lua_Zone19_PE01_NPC_ACT2", 0 )
	elseif PHIndex == 105 and OBIndex == 1005 then	-- �i�J�Ĥ����q	
		BeginPlot( Controller, "Lua_Zone19_PE01_CreateBoss", 0 )		--����Boss
	elseif PHIndex == 106 and OBIndex == 1006 then	-- �i�J�ĤC���q
		BeginPlot( Controller, "Lua_Zone19_PE01_NPC_ACT3", 0 )
	end
	
	CallPlot( Controller, "Lua_Zone19_PE01_Message", OBIndex%1000+1, PEIndex )
	if OBIndex >= 1007 then
		CallPlot( Controller , "Lua_Zone19_PE01_Init" , 1 )-- ���m��������
	end
end

function Lua_Zone19_PE01_FinalExchange( PEIndex , GUID , Score )
	local item = Zone19_PE01_Var["GiveItem"]
	for i=1, table.getn(item) do
		if CountItem( GUID, item[i] ) == 1 then
			DelBodyItem( GUID, item[i], 1 )
		end
	end

	local LV = 60
	local MapID = ZONE19_PE01_Var["MapID"]
	if LuaPE_KS_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = Zone19_PE01_Var["ExCha_Ratio"]
	local MaxBonus = Zone19_PE01_Var["MaxBonus"]
	
	if Score > 0 then
		if Score < ExCha_Ratio and Score > ExCha_Ratio/2 then
			CallPlot(GUID, "YOYO_GetTokenValue", 2, 1);--�j�N��"
		else
			if Score >= MaxBonus then Score = MaxBonus end			
			CallPlot(GUID, "YOYO_GetTokenValue", 2, math.floor( Score/ExCha_Ratio ));--�j�N��"
		end
	end	
end

--==================================================--

--==================================================--
--  ���q/�T���B�z��                                 --
--==================================================--

function Lua_Zone19_PE01_Message( Phase, PEIndex )--�ǰe�T��	
	local Color = "0xffffff00"	-- �j��T��������
	local OID = OwnerID()
	Zone19_PE01_Phase = Zone19_PE01_Phase + 1	
	
	local Message = {	[1] = "[SC_PE_ZONE19_01_PHASE1]";--�Ӷ���G�S�X�{�F�\�h�_�Ǫ��H�v...						
						[2] = "[SC_PE_ZONE19_01_PHASE2]";--�P�V�̪����饲���Τ��b��!!
						[3] = "[SC_PE_ZONE19_01_PHASE3]";--�լd�@�������Y
						[4] = "[SC_PE_ZONE19_01_PHASE4]";--�b������ӫe������u�U�h
						[5] = "[SC_PE_ZONE19_01_PHASE5]";--���h�F�Ҧ��A�ٳѤU����
						[6] = "[SC_PE_ZONE19_01_PHASE6]";--��_�q�·t������!?
						[7] = "[SC_PE_ZONE19_01_PHASE7]";--�����Ӷi�F�·t��
						[8] = "[SC_PE_ZONE19_01_PHASE8]";--�O�����٬O�t�@�Ӷ}�l...
						[9] = "[SC_PE_ZONE19_01_PHASE9]";--�@���p���گ몺����...
						[10] = "[SC_PE_ZONE19_01_PHASE10]";--�רs�٬O�Q�·t�]��...
					}	
	
	
	debugmsg( 0,0, "Phase = "..Phase)
	if Phase == 1 then
		ScriptMessage( OID, -1 , 1 , Message[Phase] , Color )
		ScriptMessage( OID, -1 , 0 , Message[Phase] , Color )		
	else		
		local Count = PE_GetActivePlayerGUIDCount( PEIndex )
		local item = Zone19_PE01_Var["GiveItem"]
		debugmsg( 0,0, "PE_Count = "..Count )
		local GUID
			
		for i = 1 , Count do
			GUID = PE_GetActivePlayerGUID( PEIndex )
			debugmsg(0,0,"GUID = "..GUID)
			if Phase < 6 then
				for i=1, table.getn(item) do
					if CountItem( GUID, item[i] ) <= 0 and GetUseItemGUID( GUID ) ~= item[i] then
						GiveBodyItem( GUID, item[i], 1 )
					end
				end
			end
			if Phase == 5 and CheckAcceptQuest( GUID, 423761 ) == true and CheckCompleteQuest( GUID, 423761 ) ~= true and CheckFlag( GUID, 544664 ) ~= true then
				SetFlag( GUID, 544664, 1 )
			end
			ScriptMessage( OID, GUID, 1 , Message[Phase] , Color )
			ScriptMessage( OID, GUID, 0 , Message[Phase] , Color )		
		end
	end	
end

--==================================================--

--==================================================--
--  	��t��                      				--
--==================================================--

function Lua_Zone19_PE01_NPC_ACT0()
	local NPCID = Zone19_PE01_Var["NPCID"]
	local FlagID = Zone19_PE01_Var["FlagID"]
	local npc = {}
	local num = 5
	
	for i=1, num do	
		npc[i] = KS_CreateObjMode( NPCID[i], FlagID , i,  0, 1, 1 )
		MoveToFlagEnabled( npc[i], false )
		SetModeEx( npc[i] , EM_SetModeType_Fight, false )			-- �i�������
		SetModeEx( npc[i] , EM_SetModeType_Strikback , false )		-- ����		
		SetModeEx( npc[i] , EM_SetModeType_Searchenemy , false )	-- ����
		table.insert( Zone19_PE01_NPC , npc[i] )					-- �[�J����޲z�}�C
		table.insert( Zone19_PE01_Obj , npc[i] )					-- �[�J����޲z�}�C		
		if i ~= 1 then
			AdjustFaceDir( npc[i], npc[1], 0 ) --���V�ؼ�
			PlayMotion( npc[i], ruFUSION_ACTORSTATE_CROUCH_LOOP )		-- �ۤU
		end
	end
	
	AdjustDir( npc[1], 180 )
end

function Lua_Zone19_PE01_NPC_ACT1()
	local npc = Zone19_PE01_NPC
	local num = 5
	
	for i=1, num do
		ks_ActSetMode( npc[i] )										-- �t����
		if i == 1 then
			DisableQuest( npc[i],true )
		else
			PlayMotion( npc[i], ruFUSION_ACTORSTATE_CROUCH_LOOP )		-- �ۤU
		end		
	end

	PlayMotion( npc[2], ruFUSION_ACTORSTATE_EMOTE_IDLE )		-- ����
	AdjustFaceDir( npc[2], npc[1], 0 ) --���V�ؼ�
	sleep(15)
	PlayMotion( npc[2], ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	NPCSay( npc[2], "[SC_PE_ZONE19_01_ACT1_01]" )--�ݨӳo�̤]�_���F...�P�V�̬ƦܵL�k����ħڡC���D�ڭ̭n���F�L�̶ܡH
	sleep(35)
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	AdjustFaceDir( npc[1], npc[2], 0 ) --���V�ؼ�
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT1_02]" )--���ȧA�һ����N�n���u�F�A�u�ڡC
	sleep(25)
	PlayMotion( npc[3], ruFUSION_ACTORSTATE_CROUCH_END )
	AdjustFaceDir( npc[3], npc[1], 0 ) --���V�ؼ�
	NPCSay( npc[3], "[SC_PE_ZONE19_01_ACT1_03]" )--���U�A���D�z�n......
	sleep(30)
	AdjustFaceDir( npc[1], npc[3], 0 ) --���V�ؼ�
	PlayMotion( npc[1],ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT1_04]" )--�������o�ǳQ�P�V�̶ˮ`��L�������A�Y�ѷN�n�کӾ�o���o�W......
	sleep(35)
	PlayMotion( npc[4], ruFUSION_ACTORSTATE_CROUCH_END )
	PlayMotion( npc[5], ruFUSION_ACTORSTATE_CROUCH_END )
	AdjustFaceDir( npc[4], npc[1], 0 ) --���V�ؼ�
	AdjustFaceDir( npc[5], npc[1], 0 ) --���V�ؼ�
	NPCSay( npc[4], "[SC_PE_ZONE19_01_ACT1_05]" )--���U...!!�зǳ\�ڭ̬��z���~�I
	NPCSay( npc[5], "[SC_PE_ZONE19_01_ACT1_05]" )--���U...!!�зǳ\�ڭ̬��z���~�I
	sleep(30)
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT1_06]" )--��@���A�̪���S�A�O�ڳo���l�̽��ת��aģ�C�ڭ̨��I
	sleep(20)
	AdjustFaceDir( npc[1], npc[2], 0 ) --���V�ؼ�
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	sleep(15)
	
	PE_SetVar( "Zone19_PE01_Var_PH1Require", 1 )
	for i=1, num do
		ks_AttackMode( npc[i] )
		AddBuff( npc[i], 507514 , 0 , -1 ) 						-- �v���K��
		SetPlot( npc[i], "Dead", "Lua_Zone19_PE01_NPCDead", 0 )
		BeginPlot( npc[i], "Lua_Zone19_PE01_NPC_AI", 0 )
		WriteRoleValue( npc[i], EM_RoleValue_PID, 6 )
	end
end

function Lua_Zone19_PE01_NPC_ACT2()
	local npc = Zone19_PE01_NPC
	local count = 0
	for i=2, table.getn(npc) do
		if CheckID(npc[i]) == true then
			count = count +1
			DelObj(npc[i])
		end
	end
	
	for i = 1 , PE_GetActivePlayerGUIDCount( Zone19_PE01_PEIndex ) do
		local GUID = PE_GetActivePlayerGUID( Zone19_PE01_PEIndex )
		if PE_GetPlayerScore( Zone19_PE01_PEIndex, GUID ) >= 400 then
			LuaPE_KS_SetBonus( Zone19_PE01_PEIndex, Zone19_PE01_Var["MapID"], count*50, GUID )--(���w)���ƭp��
			break
		end
	end
	
	ks_ActSetMode( npc[1] )		-- �t����
	CancelBuff( npc[1], 507520 )--�M���E��
	AddBuff( npc[1], 507899, 0, -1 )--���i���z����
	ClearHateList( npc[1], -1 )--�M������
	SetModeEx( npc[1], EM_SetModeType_Move , false )	
	sleep(10)	
	AdjustDir( npc[1], 90 )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_01]" )--�k���w�H......�u�ڡH�A�̦b���H
	sleep(10)
	AdjustDir( npc[1], 90 )
	sleep(10)
	AdjustDir( npc[1], 90 )
	sleep(10)
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_02]" )--��......�u�ѤU�ڤF�ܡH
	sleep(35)
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_03]" )--�A�̦b�ڭ��e���V�ͩR���Y......�ӧګo���򳣤��వ�I
	sleep(40)
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_04]" )--�쥻�Ʊ�ର�ڪ��l���̿ѱo���֡A��......�ݬݧڳ����F�Ǥ���H
	sleep(20)
	CallPlot( npc[1], "Lua_Zone19_PE01_NPC_ACT", npc[1] )--�ܨ�
	sleep(20)
	PlayMotion( npc[1], ruFUSION_ACTORSTATE_CROUCH_LOOP )
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_05]" )--�ڹ藍�_�A��......
	sleep(25)	
	NPCSay( npc[1], "[SC_PE_ZONE19_01_ACT2_06]" )--�k���w...�u��...���̩M������......�ڧ�藍�_�A��
	sleep(35)

	PE_SetVar( "Zone19_PE01_Var_PH5Require", 1 )
end

function Lua_Zone19_PE01_NPC_ACT( Obj )--�ܨ�
	local Ball = Lua_Davis_BornByMultilateral( 112399 , 5 , 50 )
	local num = table.getn(Ball)
	for i=1, num do
		Lua_ObjDontTouch( Ball[i] )
		DW_UnFight( Ball[i] )
	end

	for i=1, num do
		CastSpell(Ball[i], Obj, 496446 )
		sleep(10)
	end

	sleep(15)
	SysCastSpellLv( Obj, Obj, 496177, 1 )
	sleep(5)
	for i=1, num do
		SysCastSpellLv( Obj, Ball[i], 492185, 1 )
		DW_CheckThenDel( Ball[i] )
	end
end

function Lua_Zone19_PE01_NPC_ACT3_Fire()
	local Obj = Zone19_PE01_Obj
	local BladeID = Zone19_PE01_Var["BladeID"]
	for i = 1, table.getn(Obj) do
		if Obj[i] ~= nil and CheckID(Obj[i]) == true and ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == BladeID then
			local Fire = LuaFunc_CreateObjByObj( 116814, Obj[i] )			
			WriteRoleValue( Fire, EM_RoleValue_LiveTime, 3 )
			Hide( Fire )
			SetModeEx( Fire, EM_SetModeType_Mark, false )
			Show( Fire, 0 )
			DelObj(Obj[i])
			sleep(3)
		end
	end
end

function Lua_Zone19_PE01_NPC_ACT3()
	local NPCID = Zone19_PE01_Var["NPCID"]
	local Boss = Zone19_PE01_Var["Boss"]
	local npc = KS_CreateObjMode( NPCID[1], Boss, nil, 0, 1, 1 )	--���]��
	table.insert( Zone19_PE01_Obj , npc )					-- �[�J����޲z�}�C
	DisableQuest( npc, true )
	BeginPlot( OwnerID(), "Lua_Zone19_PE01_NPC_ACT3_Fire", 0 )
	
	sleep(15)
	PlayMotion( npc, ruFUSION_ACTORSTATE_EMOTE_LAUGH )--�j��
	NPCSay( npc, "[SC_PE_ZONE19_01_ACT3_01]" )--�F�\�B����B�����٦��L�U......���̴X�G�N�ڧ]�S�C
	sleep(40)	
	NPCSay( npc, "[SC_PE_ZONE19_01_ACT3_02]" )--���M�����D�A�̬O�֡A���O���§A�̱N�ڱq�ƨg������C
	sleep(35)
	NPCSay( npc, "[SC_PE_ZONE19_01_ACT3_03]" )--�խY��ɡA�گ�J�W���A�̳o�˪��_�I��......	
	sleep(20)
	PlayMotion( npc, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep(15)
	NPCSay( npc, "[SC_PE_ZONE19_01_ACT3_04]" )--�]�}�A�J�M�@�����w�L�h......
	sleep(35)
	PlayMotion( npc, ruFUSION_ACTORSTATE_EMOTE_SALUTE2 )
	NPCSay( npc, "[SC_PE_ZONE19_01_ACT3_05]" )--���§A�̡A�_�I�̡C
	sleep(25)
	
	PE_SetVar( "Zone19_PE01_Var_PH7Require", 1 )
end

--==================================================--

--==================================================--
--  ���󲣥Ͱ�                       				--
--==================================================--

function Lua_Zone19_PE01_CreateBoss()--���󲣥�
	local BossID = Zone19_PE01_Var["BossID"]		
	local npc = Zone19_PE01_NPC	

	local Boss = KS_CreateObjMode( BossID, npc[1], nil, 0, 1, 1 )	--���]��
	Hide(npc[1])
	Zone19_PE01_Var["Boss"] = Boss
	BeginPlot( Boss, "Lua_Zone19_PE01_Boss_AI", 0 )
	SetPlot( Boss, "Dead", "Lua_Zone19_PE01_MstDead", 0 )
	table.insert( Zone19_PE01_Obj , Boss )					-- �[�J����޲z�}�C	
end

function Lua_Zone19_PE01_CreateMst()--���ͱj���L��
	local Var = ZONE19_PE01_Var
	local MstFlagID = Var["MstFlagID"]
	local Creater = Var["Creater"]					-- ��������
	local MstID = Var["MstID"]						-- �Ǫ�����ID
	local TimeCreateMst = Var["TimeCreateMst"]		-- �C�����j�ƥ�
	local MaxMst = Var["MaxMst"]					-- ���W�̤j�ƶq		
	local MstNum = 0								-- ���W�ثe�ƶq
	local CreateMst	= 0								-- ��ڲ��ͼƶq
	debugmsg(0,0,"CreateMst")
	while true do		
		if ZONE19_PE01_Phase < 3 or ZONE19_PE01_Phase > 6 then
			debugmsg(0,0,"Break CreateMst")
			break
		end--����
		MstNum = ReadRoleValue( Creater, EM_RoleValue_Register1 ) --Ū���ƶq
		if MstNum < MaxMst then
			CreateMst = MaxMst - MstNum
			if CreateMst >= TimeCreateMst then
				Lua_ZONE19_PE01_MstCreateMode( 7, TimeCreateMst )
			elseif CreateMst < TimeCreateMst then
				Lua_ZONE19_PE01_MstCreateMode( 7, CreateMst )
			end
		end
		Sleep( Zone19_PE01_Var["TimeSpace"]*10 )
	end
end

function Lua_ZONE19_PE01_MstCreateMode( SiteMode, Num )
	local Var = ZONE19_PE01_Var
	local Creater = Var["Creater"]		-- ��������	
	local MstID = Var["MstID"]			-- �Ǫ�����ID
	local MstFlagID = Var["MstFlagID"]
	local Site = {	[1] = { 1 };
					[2] = { 2,3 };
					[3] = { 4,5 };
					[4] = { 6,7 };
					[5] = { 8,9,10 };
					[6] = { 11,12,13 };
					[7] = { 14,15,16,17,18 }}
	local Obj = {}
	local count
	if SiteMode ~= nil and Num == nil then 
		Num = table.getn(Site[SiteMode])
	elseif Num == nil then
		Num = 1
	end
	for i = 1, Num do
		if SiteMode ~= nil then
			obj[i] = KS_CreateObjMode( MstID, MstFlagID, Site[SiteMode][i], 15, 1, 1 )
			-- ObjID(����ID), var1(�X��ID) , var2(�X�Ц�m), Range(���ͽd��), ObjNum(���ͼƶq), Add(�O�_AddToPartition )
		else
			obj[i] = KS_CreateObjMode( MstID, OwnerID(), nil, 15, 1, 1 )
			-- ObjID(����ID),  var1(���w�����m), var2(nil), Range(���ͽd��), ObjNum(���ͼƶq), Add(�O�_AddToPartition )
		end		
		
		AddBuff( Obj[i] , 506303 , 0 , -1 )							-- ��AE��Buff
		table.insert( Zone19_PE01_Obj , Obj[i] )					-- �[�J����޲z�}�C
		ks_AttackMode( Obj[i] )
		
		SetPlot( Obj[i], "Dead", "Lua_Zone19_PE01_MstDead", 0 )
		BeginPlot( Obj[i], "Lua_Zone19_PE01_Mst_AI", 0 )

		count = ReadRoleValue( Creater, EM_RoleValue_Register1 )
		WriteRoleValue( Creater, EM_RoleValue_Register1, count+1 )
	end
	if Num > 1 then
		return Obj
	else
		return Obj[1]
	end
end

--==================================================--


--==================================================--
--  	AI ���ʳB�z��                      			--
--==================================================--

function Lua_Zone19_PE01_NPC_AI()
	local Message = Zone19_PE01_NPC_Message
	local FlagID = Zone19_PE01_Var["FlagID"]
	local MstFlagID = Zone19_PE01_Var["MstFlagID"]
	local NPCID = Zone19_PE01_Var["NPCID"]		
	local DeathID = Zone19_PE01_Var["DeathID"]
	local NPC = Zone19_PE01_NPC
	local O_ID = OwnerID()
	local target = 0
	local Phase
	local Goal = 19 --���I
	local site
	local BuffLV
	local rnd
	local Hate
	local help = false
	local FindLock = false
	
	while true do		
		Phase = Zone19_PE01_Phase
		rnd = rand(70)
		site = ReadRoleValue( O_ID, EM_RoleValue_PID )
		if Phase > 4 then
			break
		end

		if DW_CheckDis( O_ID, FlagID, site, 30 ) == true then			
			if ReadRoleValue( O_ID, EM_RoleValue_OrgID ) == NPCID[1] and FindLock ~= true then
				Lua_Zone19_PE01_NPC_Find( site )--����
				if site == 19 then FindLock = true end
			end
			if site < Goal and O_ID == NPC[1] then				
				WriteRoleValue( NPC[1], EM_RoleValue_PID, site+1 )
			elseif site < Goal and O_ID ~= NPC[1] then
				WriteRoleValue( O_ID, EM_RoleValue_PID, ReadRoleValue( NPC[1], EM_RoleValue_PID ) )
			end		
		end		
							
		if Phase >= 2 and Phase < 5 then
			BuffLV = KS_CheckBuffLV( O_ID, 507520 )--�P�_���r
			if BuffLV == 5 and rnd < 5 then
				NPCSay( O_ID, "[SC_PE_ZONE19_01_NPCSAY_01]" )--��ı�o�n�֡A�ݭn��...
			else
				if BuffLV > 0 and KS_GetColdown( O_ID, 496480 ) ~= 0 and rnd > 55 then
					NPCSay( O_ID, "[SC_PE_ZONE19_01_NPCSAY_02]" )--�ڦ��I���ΪA�A��Ϊv�������ڶ�?
				end
			end
		end
		
		for i=1, table.getn(NPC) do
			if NPC[i] ~= nil and NPC[i] ~= O_ID and CheckID(NPC[i]) == true and KS_InCombat(NPC[i]) == true then					
				Hate = ReadRoleValue( NPC[i], EM_RoleValue_AttackTargetID )
				if Hate ~= 0 then
					SysCastSpellLv( Hate, O_ID, 495767, 0 )--���ŬD�]
				else
					Hate = KS_GetHateList( NPC[i] ) --�����( Type:1 �̤���; 2 �̶Z��;)
					SysCastSpellLv( Hate[1], O_ID, 495767, 0 )--���ŬD�]
				end
				sleep(10)
				break
			end
		end	
		
		if KS_InCombat(O_ID) == false and ReadRoleValue( O_ID, EM_RoleValue_Register2 ) == 0 then--�D�԰�
			target = Lua_Zone19_PE01_NPCSearch()--�j�M
			if target == 0 and Phase < 4 and help == false then
				WriteRoleValue( O_ID, EM_RoleValue_IsWalk , 1 )			-- �Ψ�������
				
				ks_Move( O_ID, 25, FlagID, ReadRoleValue( O_ID, EM_RoleValue_PID ) )
			elseif CheckID( target ) == true and ReadRoleValue( O_ID, EM_RoleValue_SpellMagicID ) == 0 then			
				if 	GetDistance( O_ID, target )	<= 30 then					
					StopMove( O_ID, true )
					if ReadRoleValue( O_ID, EM_RoleValue_SpellMagicID ) == 0 then
						if ReadRoleValue( target, EM_RoleValue_OrgID ) == DeathID and KS_GetColdown( O_ID, 496479 ) == 0 and CheckID(target) == true then
							if rnd%2 == 0 then
								NPCSay( O_ID, "[SC_PE_ZONE19_01_NPCSAY_03]" )--�@�A�̯�]���w��...
							end
							sleep(rnd%10*2)
							CastSpell( O_ID, target, 496479 )--�I�U															
						elseif KS_CheckBuffLV( target, 507520 ) > 0 and KS_GetColdown( O_ID, 496480 ) == 0 and CheckID(target) == true then
							if target ~= O_ID and rnd%2 == 0 then
								NPCSay( O_ID, "[SC_PE_ZONE19_01_NPCSAY_04]" )--�y���@�U�A�ڥ��b���A�v���C
							end
							sleep(rnd%10*2)
							CastSpell( O_ID, target, 496480 )--�v��
						end
					end
				else
					ks_Move( O_ID, 30, target )
				end				
			end
			help = false
			WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )		
		else
			AddBuff( O_ID, 506303 , 0 , -1 )							-- ��AE��Buff
			local str = ReadRoleValue( ReadRoleValue( O_ID, EM_RoleValue_AttackTargetID ), EM_RoleValue_Register2 )
			if str ~= 0 and rnd < 5 then
				NPCSay( O_ID, "[SC_PE_ZONE19_01_NPCSAY_10][$SETVAR1=["..Str.."]]" )--[$VAR1]�A���F�@�Ϩ�L�H... �Э�̧�......
			elseif Message[rnd] ~= nil then
				NPCSay( O_ID, Message[rnd] )				
			end
		end
		sleep(10)
	end
end

function Lua_Zone19_PE01_NPCSearch()--�ˬd�i�u�@��H
	local OID = OwnerID()		
	local NPC = Zone19_PE01_NPC	
	local NPCnum = table.getn(NPC)
	local count = 1		
	local DeathID = Zone19_PE01_Var["DeathID"]
	local obj = SearchRangeNPC( OID, 60 )	
	local num = table.getn(obj)
	
	if KS_GetColdown( OID, 496480 ) == 0 then
		for i= 1, NPCnum do			
			if NPC[i] ~= nil and CheckID(NPC[i]) == true and KS_CheckBuffLV( NPC[i], 507520 ) > 0 then
				for j= 1, NPCnum do
					if NPC[j] ~= nil and CheckID(NPC[j]) == true and NPC[j] ~= OID and ReadRoleValue( NPC[j], EM_RoleValue_Register1 ) ~= NPC[i] then
						count = count + 1
					elseif NPC[j] == nil or CheckID(NPC[j]) ~= true then
						NPCnum = NPCnum - 1
					end
				end
				if count == NPCnum then
					WriteRoleValue( OID, EM_RoleValue_Register1, NPC[i] )
					return NPC[i]
				end
			end
		end
	end
	
	if KS_GetColdown( OID, 496479 ) == 0 then
		for i=0, num do
			if ReadRoleValue( obj[i], EM_RoleValue_OrgID ) == DeathID then
				for j= 1, NPCnum do				
					if NPC[j] ~= nil and CheckID(NPC[j]) == true and NPC[j] ~= OID and ReadRoleValue( NPC[j], EM_RoleValue_Register1 ) ~= obj[i] then
						count = count + 1
					elseif NPC[j] == nil or CheckID(NPC[j]) ~= true then
						NPCnum = NPCnum - 1
					end
				end
				if count == NPCnum then
					WriteRoleValue( OID, EM_RoleValue_Register1, obj[i] )
					return obj[i]					
				end
			end			
		end
	end
	return 0
end

function Lua_Zone19_PE01_NPC_Find( site )--����
	local AttackSite = { 7,9,11,14,15,17 }
	local NPC = Zone19_PE01_NPC
	
	if site == 11 or site == 15 or site == 19 then
		for i=1, table.getn(NPC) do
			if CheckID(npc[i]) == true then
				ks_ActSetMode( npc[i] )	-- �t����
				ClearHateList( npc[i], -1 )--�M����
				SetModeEx( npc[i], EM_SetModeType_Move , false )		-- ����
				SetDefIdleMotion( npc[i], ruFUSION_MIME_IDLE_COMBAT_1H )
				WriteRoleValue( npc[i], EM_RoleValue_Register2, 1 )
			end
		end
		sleep(15)
		PlayMotion( npc[1], ruFUSION_ACTORSTATE_CROUCH_LOOP )		-- �ۤU	
		CallPlot( npc[1], "Lua_Zone19_PE01_NpcMessage", "[SC_PE_ZONE19_01_NPCSAY_12]" )--�o�a�誺�Pı���ګܤ��ΪA�A���G���õۤ���...
		Sleep(35)
		if PE_GetVar("Zone19_PE01_Var_PH3Require") == 2 then
			local obj = Lua_ZONE19_PE01_MstCreateMode( 7 )
			for i=1, table.getn(obj) do
				if CheckID(obj[i]) == true then
					ks_ActSetMode( obj[i] )	-- �t����
					SetModeEx( obj[i], EM_SetModeType_Move , false )	-- ����
				end
			end
			PlayMotion( npc[1], ruFUSION_ACTORSTATE_CROUCH_END )		-- �_��			
			CallPlot( npc[1], "Lua_Zone19_PE01_NpcMessage", "[SC_PE_ZONE19_01_NPCSAY_13]" )--�ӧڭ̦��G�Q�]��F...
			sleep(20)
			PlayMotion( npc[1],ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
			CallPlot( npc[1], "Lua_Zone19_PE01_NpcMessage", "[SC_PE_ZONE19_01_NPCSAY_14]" )--�b�����o�@�����e...�ӧڭ̵�����ˤU!!			
			sleep(25)
			for i=1, table.getn(obj) do
				if CheckID(obj[i]) == true then
					ks_AttackMode( obj[i] )
					SetModeEx( obj[i], EM_SetModeType_Move , true )	-- ����
				end
			end
		end		
		PE_SetVar( "Zone19_PE01_Var_PH3Require", PE_GetVar("Zone19_PE01_Var_PH3Require")+1 )
		for i=1, table.getn(NPC) do
			if CheckID(npc[i]) == true then
				SetDefIdleMotion( npc[i], ruFUSION_MIME_IDLE_STAND )
				ks_AttackMode( npc[i] )
				WriteRoleValue( npc[i], EM_RoleValue_Register2, 0 )
				AddBuff( npc[i], 506984, 0, 30 )--�[�t30%
			end
		end
	end
	for i=1, table.getn(AttackSite) do
		if AttackSite[i] == site then			
			CallPlot( npc[1], "Lua_Zone19_PE01_NpcMessage", "[SC_PE_ZONE19_01_NPCSAY_15]", 0xffff0000 )--�`�N�F!!���P�V�̨�ŧ...	
			for i=1, table.getn(NPC) do
				if CheckID(npc[i]) == true then
					SetDefIdleMotion( npc[i], ruFUSION_MIME_IDLE_COMBAT_1H )
					StopMove( npc[i], true )
					sleep(2)
				end
			end
			sleep(10)
			Lua_ZONE19_PE01_MstCreateMode( i )
			for i=1, table.getn(NPC) do
				if CheckID(npc[i]) == true then
					SetDefIdleMotion( npc[i], ruFUSION_MIME_IDLE_STAND )
				end
			end
			break
		end
	end
end

function Lua_Zone19_PE01_Mst_AI()
	local OID = OwnerID()
	local NPC = Zone19_PE01_NPC
	local FlagID = Zone19_PE01_Var["FlagID"]
	local time = 0
	local Hate = 0
	local rnd = rand(5)
	local Phase
	
	while true do
		Phase = Zone19_PE01_Phase
		if  Phase >= 7 then DelObj( OID) end
		
		if KS_InCombat(OID) == false then--�D�԰�
			if Phase < 5 then
				ks_Move( OID, 30, NPC[1] )
			elseif Phase > 5 and Zone19_PE01_Var["Boss"] ~= 0 then
				ks_Move( OID, 30, Zone19_PE01_Var["Boss"] )
			end
			time = 0
		elseif KS_InCombat(OID) == true then
			AddBuff( OID, 506303 , 0 , -1 )			-- ��AE��Buff
			
			if time > 1 and time%(7+rnd) == 0 then
				Hate = ReadRoleValue( OID, EM_RoleValue_AttackTargetID )
				if Hate == 0 then
					Hate = KS_GetHateList( OID ) --�����( Type:1 �̤���; 2 �̶Z��;)
					Hate = Hate[1]
				end
				SysCastSpellLv( OID, Hate, 496545, 60 )--�r��
			end
			if Phase < 5 and  time%(16+rnd) == 0 then
				SysCastSpellLv( OID, OID, 496536, 0 )--�E��
			elseif Phase == 5 then			
				ClearHateList( OID, NPC[1] )--�M����
			end
			time = time + 1
		end
		sleep(10)
	end
end

function Lua_Zone19_PE01_Boss_AI()
	local Message = {	[1] = "[SC_PE_ZONE19_01_BOSS_SAY01]";--�O�H����k���o�̡A�o�����ڤ��|�����������C(�·t���b)
						[2] = "[SC_PE_ZONE19_01_BOSS_SAY02]";--�a�Ϧ��A�j���O�q�]�L�k���ܤ���...(�T�D���C)
						[3] = "[SC_PE_ZONE19_01_BOSS_SAY03]";--�A�̯�F�Ѥ�b�ۤv�ڥ����h�W��!?(�F���)
					}
	local OID = OwnerID()
	local time = 0
	local combat = false
	local HateList = {}
		
	Lua_Zone19_PE01_UBW()--�L�����b
	while true do
		if KS_InCombat(OID) == true	then--�԰�
			AddBuff( OID, 506303 , 0 , -1 )							-- ��AE��Buff
			if time%17 == 0 then
				CastSpell( OID, OID, 496537 )--�h�W����
				SysCastSpellLv( OID, OID, 496548, 0 )--�z��
			end
			if time > 1 and time%13 == 0 then
				CallPlot( OID, "Lua_Zone19_PE01_NpcMessage", Message[2] )
				BeginPlot( OID, "Lua_Zone19_PE01_GetBatter", 0 )--�T�D���C
			elseif time > 1 and time%17 == 0 then
				CallPlot( OID, "Lua_Zone19_PE01_NpcMessage", Message[1] )				
				Lua_Zone19_PE01_RangeAttack()--�·t���b�s��
			elseif time > 1 and time%19 == 0 then
				CallPlot( OID, "Lua_Zone19_PE01_NpcMessage", Message[3] )
				BeginPlot( OID, "Lua_Zone19_PE01_SetSoulLink", 0 )--�F���
			end
			
			HateList = KS_GetHateList( OID )
			if HateList[1] ~= nil then
				SetAttack( OID, HateList[1] )
				if GetDistance( OID, HateList[1] ) > 70 then
					SysCastSpellLv( OID, HateList[1], 496478, 100 )--�·t���b
					CallPlot( OID, "Lua_Zone19_PE01_NpcMessage", Message[1] )
				end
			end
			combat = true
			time = time+1			
		else
			if combat == true then
				KS_ClearArray( Zone19_PE01_LinkList )--����}�C
				combat = false
			end
			time = 0
		end
		sleep(10)
	end	
end

function Lua_Zone19_PE01_NpcMessage( Message, Color )
	Color = Color or "0xffffff80"	-- �j��T�����զ�
	local PEIndex = Zone19_PE01_PEIndex
	local Count = PE_GetActivePlayerGUIDCount( PEIndex )
	local OID = OwnerID()
	local GUID	
	
	for i = 1 , Count do
		GUID = PE_GetActivePlayerGUID( PEIndex )	
		ScriptMessage( OID, GUID, 1 , Message, Color )		
	end
	NPCSay( OID, Message )
end

		
--==================================================--


--==================================================--
--    ���`�B�z��                       				--
--==================================================--

function Lua_Zone19_PE01_MstDeadSet()
	SetPlot( OwnerID(), "Dead", "Lua_Zone19_PE01_MstDead", 0 )
end

function Lua_Zone19_PE01_NPCDead()
	local OID = OwnerID()
	local NPCID = Zone19_PE01_Var["NPCID"]
	if ReadRoleValue( OID, EM_RoleValue_OrgID ) == NPCID[1] then
		if ZONE19_PE01_Phase <= 4 then
			PE_SetVar( "Zone19_PE01_Var_NPCDead" , 1 )		-- PE�ܼƧ���
		else
			return false
		end
	else
		local OrgID		
		local npc = Zone19_PE01_NPC
		local Str = {	[116809] = 116816;
						[116810] = 116817;
						[116811] = 116994;
						[116812] = 116995	}
		for i=2, table.getn(npc) do
			OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID )						
			if OrgID == NPCID[i] then				
				NPCSay( OID, "[SC_PE_ZONE19_01_NPCSAY_17]" )--���U... �Э�̧ڤ����~��l�H�A...				
				CallPlot( npc[1], "Lua_Zone19_PE01_NpcMessage", "[SC_PE_ZONE19_01_NPCSAY_16][$SETVAR1=["..Str[OrgID].."]]" )--[$VAR1]�A�ڷ|���y���o�@�����H�I�X�N����!!
				SysCastSpellLv( npc[1], npc[1], 496546, 0 )--����
				if Zone19_PE01_Phase < 4 then
					local dead = Lua_ZONE19_PE01_MstCreateMode()
					WriteRoleValue( dead, EM_RoleValue_Register2, Str[OrgID] )
				else
					for i = 1 , PE_GetActivePlayerGUIDCount( Zone19_PE01_PEIndex ) do
						local GUID = PE_GetActivePlayerGUID( Zone19_PE01_PEIndex )
						if PE_GetPlayerScore( Zone19_PE01_PEIndex, GUID ) >= 200 then
							LuaPE_KS_SetBonus( Zone19_PE01_PEIndex, Zone19_PE01_Var["MapID"], 10+(PE_GetVar( "Zone19_PE01_Var_PH4Kill" )%10)*10, GUID )--(���w)���ƭp��
							break
						end
					end
				end
				break
			end
		end
		DelObj(OID)
	end	
end

function Lua_Zone19_PE01_MstDead()
	local O_ID = OwnerID()
	local T_ID = TargetID()
	local OrgID = ReadRoleValue( O_ID, EM_RoleValue_OrgID )
	local npc = Zone19_PE01_NPC
	
	if Zone19_PE01_Phase > 0 then
		local PEIndex = Zone19_PE01_PEIndex		
		local BossID = Zone19_PE01_Var["BossID"]
		local MapID = Zone19_PE01_Var["MapID"]
		local Bonus = Zone19_PE01_Var["Bonus"]
		local MstID = Zone19_PE01_Var["MstID"]
		local BladeID = Zone19_PE01_Var["BladeID"]
		local Creater = Zone19_PE01_Var["Creater"]-- �Ͳ������GID
		local Type = 1
		
		if OrgID == BossID then	--Boss���`
			type = 4
			PE_SetVar( "Zone19_PE01_Var_BossDead", 1 )		
		elseif OrgID == MstID then
			type = 3
			count = ReadRoleValue( Creater, EM_RoleValue_Register1 )
			WriteRoleValue( Creater, EM_RoleValue_Register1, count-1 )
			if Zone19_PE01_Phase >= 4 then
				PE_SetVar( "Zone19_PE01_Var_PH4Kill", PE_GetVar("Zone19_PE01_Var_PH4Kill") + 1 )
			end
		end
		local TOrgID = ReadRoleValue( T_ID, EM_RoleValue_OrgID )
		if ReadRoleValue( T_ID, EM_RoleValue_IsPlayer ) == 1 then
			if type == 4 then				
				local TimeBonus = math.floor(PE_GetVar( "Zone19_PE01_PH6_Time" )/1000)*2
				LuaPE_KS_GetBonus( PEIndex, MapID, Bonus[Type]+ TimeBonus )       -- ������������
			elseif ( type == 3 and Zone19_PE01_Phase > 2 ) or type == 1 then
				local str = ReadRoleValue( O_ID, EM_RoleValue_Register2 )
				if str ~= 0 then
					NPCSay( npc[1], "[SC_PE_ZONE19_01_NPCSAY_11][$SETVAR1=["..str.."]]" )--[$VAR1]�A�Цw���a......
				end
				LuaPE_KS_GetBonus( PEIndex, MapID, Bonus[Type] )       -- ������������				
			end			
		elseif TOrgID == BossID then				
			local Boss = Zone19_PE01_Var["Boss"]			
			local Blade = LuaFunc_CreateObjByObj( BladeID, O_ID )
			table.insert( Zone19_PE01_Obj, Blade )
			ks_ActorMode( Blade, true )--�]�w�t����NPC
			WriteRoleValue( Blade, EM_RoleValue_Register2, Boss )
			AddBuff( Boss, 507541, 0, -1 )
		end	
	
		if OrgID ~= BossID and OrgID ~= MstID and Zone19_PE01_Phase < 5 then
			local DeathID = Zone19_PE01_Var["DeathID"]
			local death = LuaFunc_CreateObjByObj ( DeathID, O_ID )
			table.insert( Zone19_PE01_Obj , death )
			SetDir( death, ReadRoleValue( O_ID, EM_RoleValue_Dir ) )		
			ks_ActorMode( death, true )--�]�w�t����NPC	
			SetDefIdleMotion( death, ruFUSION_MIME_IDLE_DEAD )
			PlayMotion( death, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )	
			WriteRoleValue( death, EM_RoleValue_LiveTime, 60 )
		end
	end
	Hide(O_ID)
end

--==================================================--


--==================================================--
--  		�p��N�@�����                     		--
--==================================================--

function Lua_Zone19_PE01_SpellFire()--�ϥΪ��~��
	local OID = OwnerID()	
	if ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 0 then
		local Obj = SearchRangeNPC( OID, 40 ) --TargetID()	
		local OrgID
		for i= 0, table.getn(Obj) do		
			OrgID = ReadRoleValue( Obj[i], EM_RoleValue_OrgID )
			if OrgID == Zone19_PE01_Var["DeathID"] or OrgID == Zone19_PE01_Var["BladeID"] then			
				CastSpell( OID, Obj[i], 496479 )--���
				return
			end
		end
	
		ScriptMessage( OID, OID, 1 , "[SYS_TOUCH_NOTARGET]" , 0 )--�S���ؼ�		
	end
end

function Lua_Zone19_PE01_CheckFire()--�M��復���
	local Obj = TargetID()
	local Player = OwnerID()
	if ReadRoleValue( Obj, EM_RoleValue_Register1 ) == 0 then
		AdjustFaceDir( Player, Obj, 0 ) --���V�ؼ�
		PlayMotion( Player, ruFUSION_ACTORSTATE_CRAFTING_LOOP )
		return true
	else
		return false
	end	
end

function Lua_Zone19_PE01_Fire()--�M��復���
	local O_ID = OwnerID() --���a
	local T_ID = TargetID()--��H
	local PEIndex = Zone19_PE01_PEIndex
	local DeathID = Zone19_PE01_Var["DeathID"]
	local BladeID = Zone19_PE01_Var["BladeID"]
	local Bonus = Zone19_PE01_Var["Bonus"]
	local MapID = Zone19_PE01_Var["MapID"]
	local OrgID = ReadRoleValue( T_ID, EM_RoleValue_OrgID )	
	local Boss
	
	if ReadRoleValue( T_ID, EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )
		if OrgID == DeathID then
			local MstFire = PE_GetVar( "Zone19_PE01_Var_PH2Require" )
			PE_SetVar( "Zone19_PE01_Var_PH2Require", MstFire+1 )
		elseif OrgID == BladeID then
			Boss = ReadRoleValue( T_ID, EM_RoleValue_Register2 )
			KS_ClearBuffLV( Boss, 507541, 1 )--�M��BOSS BUFF
			SysCastSpellLv( O_ID, Boss, 496534, 0 )--�y���ˮ`
		end
		if ReadRoleValue( O_ID, EM_RoleValue_IsPlayer ) == 1 then
			LuaPE_KS_SetBonus( PEIndex, MapID, Bonus[2], O_ID )--���ƭp��	
		end
		
		local Fire = LuaFunc_CreateObjByObj( 116814, T_ID )
		WriteRoleValue( Fire, EM_RoleValue_LiveTime, 5 )
		Hide( Fire )
		SetModeEx( Fire, EM_SetModeType_Mark, false )
		Show( Fire, 0 )
		DelObj(T_ID)		
	end
end

--==================================================--

--==================================================--
--  		�p��r���H 	                    		--
--==================================================--

function Lua_Zone19_PE01_NpcCheck()--����X��H
	local NPCID = Zone19_PE01_Var["NPCID"]
	local TID = TargetID()
	if ReadRoleValue( TID, EM_RoleValue_IsPlayer ) ~= 1 then
		for i=1, table.getn(NPCID) do
			if ReadRoleValue( TID, EM_RoleValue_OrgID ) == NPCID[i] then
				return true
			end
		end
	end
	return false
end

function Lua_Zone19_PE01_HealCheck()--����X�Φ�
	local Obj = TargetID()
	local Player = OwnerID()	
	local NPCID = Zone19_PE01_Var["NPCID"]
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
		
	for i=1, table.getn(NPCID) do
		if OrgID == NPCID[i] and KS_CheckBuffLV( Obj, 507520 ) > 0 then
			AdjustFaceDir( Player, Obj, 0 ) --���V�ؼ�
			PlayMotion( Player, ruFUSION_ACTORSTATE_CRAFTING_LOOP )
			return true
		end
	end	
	ScriptMessage( Player, Player, 1 , "[SC_Z19PE_ITEM]" , 0 )--�ثe���G�٥Τ���
	return false
end

function Lua_Zone19_PE01_Heal()--�M��復�Q�r
	local O_ID = OwnerID() --���a
	local T_ID = TargetID()--��H
	local PEIndex = Zone19_PE01_PEIndex
	local Bonus = Zone19_PE01_Var["Bonus"]
	local MapID = Zone19_PE01_Var["MapID"]
	
	AdjustFaceDir( T_ID, O_ID, 0 ) --���V�ؼ�
	
	if KS_CheckBuffLV( T_ID, 507520 ) > 0 then
		KS_ClearBuffLV( T_ID, 507520, 1 )
		SysCastSpellLv( O_ID, T_ID, 496547, Zone19_PE01_Phase-2 ) -- �ɦ�
	end
	
	if ReadRoleValue( O_ID, EM_RoleValue_IsPlayer ) == 1 then		
		LuaPE_KS_SetBonus( PEIndex, MapID, Bonus[2], O_ID )--���ƭp��
	end
end

--==================================================--

--==================================================--
--  			�S�h�S�Ǫ��T�D���C	                --
--==================================================--

function Lua_Zone19_PE01_GetBatter()--���H
	local Boss = OwnerID()
	local HateList = KS_GetHateList( Boss )--�줳���
	local HateNum = table.getn(HateList)
	
	if HateNum > 0 then
		local num = math.floor(HateNum/2)
		local List = KS_RegroupArray( HateList, num )
		for i=1, num do
			if List[i] ~= Boss then
				SysCastSpellLv( Boss, List[i], 496530, 0 )--�T�D���C
			end
		end
	end		
end

function Lua_Zone19_PE01_CheckMagic()--�ˬd�I�k
	local OID = OwnerID()
	local lv = KS_CheckBuffLV( OID, 508062 )
	if CheckBuff( OID, 508093 ) ~= true and lv < 7 then		
		CancelBuff_NoEvent( OID, 508062 )--�M���˹��BUFF
		CancelBuff_NoEvent( OID, 508093 )--�M���˹��BUFF
		AddBuff( OID, 508062, lv, 5 )--�T�D���C
		AddBuff( OID, 508093, 0, -1 )--�˹��BUFF
		WriteRoleValue( OID, EM_RoleValue_Register3, lv )
		--SysCastSpellLv( OID, OID, 496530, 0 )
	end
end

function Lua_Zone19_PE01_CreateBatter()-- ���ͳs���C	
	local OID = OwnerID()	
		CancelBuff_NoEvent( OID, 508093 )--�M���˹��BUFF
		AddBuff( OID, 508068, 0, 3 )--�w��
		local ObjID = 117219
		local Num = ReadRoleValue( OID, EM_RoleValue_Register3 )
		WriteRoleValue( OID, EM_RoleValue_Register3, 0 )

		local Obj = ks_RandBornByMultilateral( ObjID, OID, nil, Num+3, 50, 60 )	--�b�P���ObjID �� Num ����	
		for i =1, table.getn(Obj) do
			ks_ActSetMode( Obj[i] )--�]�w�t����NPC
			WriteRoleValue( Obj[i], EM_RoleValue_LiveTime, 3 )
			CallPlot( Obj[i], "Lua_Zone19_PE01_BatterDo", OID )
		end
	
end

function Lua_Zone19_PE01_BatterDo( site )--�C����/�ˮ`
	local OID = OwnerID()
	local Boss = Zone19_PE01_Var["Boss"]
	local x = ReadRoleValue( OID, EM_RoleValue_X )
	local y = ReadRoleValue( site, EM_RoleValue_Y )
	local z = ReadRoleValue( OID, EM_RoleValue_Z )
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID )
	local MoveY
	MoveDirect( OID, x+1 , y, z+1 )

	while true do		
		AddBuff( OID, 506984, 4, -1 )
		MoveY = ReadRoleValue( OID, EM_RoleValue_Y )		
		if MoveY <= y+30 then
			break
		end
		sleep(3)
	end
	SysCastSpellLv( Boss, OID, 496533, 0 )--�y���ˮ`
end

--==================================================--

--==================================================--
--  			���ڦh�ִN�٧A�h��	                --
--==================================================--

function Lua_Zone19_PE01_SetSoulLink()--�F��s��
	local Boss = OwnerID()
	local BuffLv = 0
	local HateList = KS_GetHateList( Boss, 3 )--�줳���	
	local Num = table.getn(HateList)
	local time = 10
	
	if Num > 0 then
		AddBuff( Boss, 508064, 0, time )
		Zone19_PE01_LinkList = HateList
		BuffLv = KS_CheckBuffLV( Boss, 507541 )--���o���w���󨭤WBUFF����
		for i=1, Num do
			AddBuff( HateList[i], 508066, math.floor(BuffLv/Num), time )
		end
	end	
end
	
function Lua_Zone19_PE01_InCombat( MagicID, Dmg )	--����k�N�v�T
	local Boss = TargetID()
	if CheckBuff( Boss, 508064 ) == true and Dmg < 0 and MagicID ~= 508087 then		
		local LinkList = Zone19_PE01_LinkList
		local lv = math.floor(math.abs(Dmg/1000))
		if lv > 0 then
			lv = lv - 1
		end		
		for i=1, table.getn(LinkList) do
			if LinkList[i] ~= nil and CheckID(LinkList[i]) == true then
				SysCastSpellLv( Boss, LinkList[i], 496535, lv )--�y���ˮ`
			end
		end		
	end	
	return Dmg
end

--==================================================--
--  			�L�����b		                  	--
--==================================================--

function Lua_Zone19_PE01_UBW()--�L�����b
	local Boss = OwnerID()
	local ObjID = Zone19_PE01_Var["BladeID"]
	local Num = 25
	local dis = 150
	local Obj = ks_RandBornByMultilateral( ObjID, Boss, nil, Num, dis, 0 )
	AddBuff( Boss, 507541, Num-1, -1 )
	
	for i =1, table.getn(Obj) do		
		table.insert( Zone19_PE01_Obj, Obj[i] )
		ks_ActorMode( Obj[i] )--�]�w�t����NPC
		WriteRoleValue( Obj[i], EM_RoleValue_Register2, Boss )
	end
end

--==================================================--

--==================================================--
--  				�M���̻�������                 	--
--==================================================--
function Lua_Zone19_PE01_RangeAttack()--�M���̻���
	local Boss = OwnerID()
	local HateRange = KS_GetHateListRange( Boss )--���o�����(�Z���V������V�e)
	local Num = table.getn(HateRange)
	Num = math.floor(Num/3)
	if Num > 0 then	
		for i=1, Num do
			if HateRange[i] ~= nil and CheckID(HateRange[i]) == true then
				SysCastSpellLv( Boss, HateRange[i], 496478, 0 )--�ۼv����
			else
				break
			end
			sleep(5)
		end
	end
end

--==================================================--

--==================================================--
--  			���~����]�w	                  	--
--==================================================--

function Lua_Zone19_PE01_NPCSet()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCID = Zone19_PE01_Var["NPCID"]
	if Zone19_PE01_Phase == 0 and ReadRoleValue( NPC, EM_RoleValue_OrgID ) == NPCID[1] then
		LoadQuestOption( Player )	
	else
		local Message = Zone19_PE01_NPC_Message
		SetSpeakDetail( Player, Message[(rand(5)+1)*10] )
		if Zone19_PE01_Phase > 1 then
			local GiveItem = Zone19_PE01_Var["GiveItem"]
			if CountBodyItem( player, GiveItem[1] ) == 0 or CountBodyItem( player, GiveItem[2] ) == 0 then
				AddSpeakOption( Player, NPC, "[SC_PE_ZONE19_GETITEM]", "Lua_Zone19_PE01_get",0) --�V�L�������~�C
			end
		end
	end
end

function Lua_Zone19_PE01_get()
	local OID = OwnerID()
	local item = Zone19_PE01_Var["GiveItem"]
	for i=1, table.getn(item) do
		if CountBodyItem( OID, item[i] ) == 0 then
			GiveBodyItem( OID, item[i], 1 )
		end
	end
	CloseSpeak( OID )
end

--==================================================--

--==================================================--
--    �ҰʳB�z��                   				  	--
--==================================================--

function Lua_Zone19_PE01_Init( Mode )
	if Zone19_PE01_Obj ~= nil then
		Lua_Zone19_PE01_DelObj()
	end
		
	Lua_Zone19_PE01_GlobalSet()	-- �@���ܼƳ]�w
	Zone19_PE01_Var["Controller"] = OwnerID()
	
	local CreaterID = Zone19_PE01_Var["CreaterID"]-- �Ͳ������GID
	local Creater = KS_CreateObjMode( CreaterID, OwnerID(), nil, 30, 1, 1 )
	ks_SetController( Creater )--�]�w���α����
	Zone19_PE01_Var["Creater"] = Creater	
	ZONE19_PE01_Obj[1] = Creater	-- �N�ާ@����[�J�Ĥ@��
	
	Mode = Mode or Lua_Zone19_PE01_PESet()		-- �����ƥ�]�w
	while true do
		sleep(50)
		if math.floor(PE_GetVar( "Zone19_PE01_PH0_Time" )/1000) <= Zone19_PE01_Var["ResetTime"]*0.1 then break end
	end	
	Lua_Zone19_PE01_NPC_ACT0()
end

--==================================================--

--==================================================--
--		�R������P���ճB�z��						--
--==================================================--

function Lua_Zone19_PE01_DelObj()
	local Obj = Zone19_PE01_Obj
	local ObjNum = table.getn(Obj)
	if ObjNum > 0 then
		for i = 1, ObjNum do
			if Obj[i] ~= nil and CheckID(Obj[i]) == true then
				DelObj( Obj[i] )
			end
		end
	end
	KS_ClearArray( Obj )--����}�C
end

function Lua_Zone19_PE01_test01()--�Y�u���m�ɶ�
	PE_SetVar( "Zone19_PE01_PH0_Time", 30000 )
end

function Lua_Zone19_PE01_test02()--��������
	local NPC = Zone19_PE01_NPC
	local FlagID = Zone19_PE01_Var["FlagID"]	
	local PEIndex = Zone19_PE01_PEIndex
	
	local PH2Require = Zone19_PE01_Var["PH2Require"]
	local PH4Kill = Zone19_PE01_Var["PH4Kill"]
	
	PE_SetVar( "Zone19_PE01_PH0_Time", 15000 )
	PE_SetVar( "Zone19_PE01_Var_PH1Require", 1 )
	PE_SetVar( "Zone19_PE01_Var_PH2Require", PH2Require )
	PE_SetVar( "Zone19_PE01_Var_PH3Require", 3 )
	
	sleep(200)
	for i=1, table.getN(NPC) do
		CancelBuff( npc[i], 507520 )--�M���E��
		AddBuff( npc[i], 507899, 0, -1 )--���i���z����
		ClearHateList( npc[i], -1 )--�M������
		SetModeEx( npc[i], EM_SetModeType_Move , false )				-- ����
		ks_RandRangeSetPos( NPC[i], FlagID, 19, 20 )--�ǰe
	end

	local Count = PE_GetActivePlayerGUIDCount( PEIndex )	
	local GUID
			
	for i = 1 , Count do
		GUID = PE_GetActivePlayerGUID( PEIndex )
		ks_RandRangeSetPos( GUID, FlagID, 19, 20 )--�ǰe
	end
	PE_SetVar( "Zone19_PE01_Var_PH4Kill", PH4Kill )
end

function Lua_Zone19_PE01_test03()
	DebugMsg( 0,0, "ResetTime = "..math.floor(PE_GetVar( "Zone19_PE01_PH0_Time" )/1000) )
end
--[[
/gm ? pcall LuaPE_ZONE19_PE01_GetScore(100)
--]]
function LuaPE_ZONE19_PE01_GetScore(Score)--���ۤv����
	PE_GivePlayerScore( ZONE19_PE01_PEIndex , OwnerID() , Score );
end

--==================================================--