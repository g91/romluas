function LuaPE_ZONE18_PE01_GlobalSet()	
	ZONE18_PE01_Obj = {}							-- �ϥΪ���޲z�}�C
	ZONE18_PE01_Var = {}							-- �ϥΰѼƺ޲z�}�C

	ZONE18_PE01_Phase = 0							-- ���q����
	ZONE18_PE01_ArgidinNowMove = 0	
	ZONE18_PE01_TotalScore = 0
	ZONE18_PE01_Move_FlagNum = 1
	ZONE18_PE01_PEIndex = 1
	ZONE18_PE01_Agidin_In_Water = 0	
	ZONE18_PE01_Art = {}
	ZONE18_PE01_Run_In_Pool = {0,0,0,0,0} --�O�_�}��--�O�_�w�L�Ĥ@����--�O�_�w�L�ĤG����--�O�_�w�L�ĤT����--�O�_�w�L�ĥ|����--
	ZONE18_PE01_Message = {			
							--�\��@��۶��q�y�H������
							[1] = "[SC_PE_ZONE18_01_M01]";--[<S>104485]�X�{�F�A�Ҧ��H�ǳ�[<S>208197]�I		
							[2] = "[SC_PE_ZONE18_01_M02]"; --���L�̻��@�I�I�p�ߤ��n�E��L��...���M�s[116392]���O����A...		--�Ȱ�B�w���e
							[3] = "[SC_PE_ZONE18_01_M03]";--[<S>104487]�X�{�F�I�άۦP����k�����L�I				--���j�Ȱ�B�X�{
							[4] = "[SC_PE_ZONE18_01_M04]";--[<S>115600]�ɨ��F�@�y������[116402]�j�\�A�å����~���y��[104286]�C
								
							[5] = "[SC_PE_ZONE18_01_M05]"; --���誺�y�H�ǰT��[<S>104485]�a��F�A�j�ٮ���[<S>208197]�ǳƧa�I
							[6] = "[SC_PE_ZONE18_01_M06]"; --�n�u�@���l�A�j�ٳ��n�������A��ڨӧa�I

							[7] = "[SC_PE_ZONE18_01_M07]"; --�ө񪺦a�I�@�Ӥ]�O�|�F�A[<S>104485]�|�q�Żض��p�L�ӡI
							[8] = "[SC_PE_ZONE18_01_M08]"; --�S��[<S>208197]���H�i�H�ӧ�ڮ��I
							[9] = "[SC_PE_ZONE18_01_M09]"; --[<S>104485]���W������L���R�A�ڭ̭n�Q�γo��[116392]�޾ɥL�̶i���u�I
							[10] = "[SC_PE_ZONE18_01_M10]"; --�Ҧ��ө񪺦a��ڭ̳����F�аO�A�j�٨ӧ�ڮ�[<S>208197]�a�I

							[11] = "[SC_PE_ZONE18_01_M11]";--����[<S>208197]�C
							[12] = "[SC_PE_ZONE18_01_M12]";--�o�̤w�g�\��F�@��[116392]�C
							[13] = "[SC_PE_ZONE18_01_M13]";--�A�����V�y�H����[<S>208197]�b���\��C
							--�Ȱ�B��ʶ��q�y�H������
							[14] = "[SC_PE_ZONE18_01_M14]"; --�u�n�w�L�����L�̪�����N�|�ܳn...���o�X�@�@������...			--�Ȱ�B�Ĥ@���w����ĤG���w���e
							[15] = "[SC_PE_ZONE18_01_M15]"; --���n�a��A�o�Ǽ��u��ڭ̤]�O�Q���M�I...				--�Ȱ�B�ĤG���w����
							--�Ȱ�B�w���ɿù����
							[16] = "[SC_PE_ZONE18_01_M16]";--[116402]��w������}�l�n�ơC						--�Ĥ@���w��
							[17] = "[SC_PE_ZONE18_01_M17]";--�w�L���u��[<S>104485]���o�X�@�@�������C				--�ĤG���w��
							[18] = "[SC_PE_ZONE18_01_M18]";--[116402]�ݦ��@���e�N�L���׸z...						--�ĤT���w��
							[19] = "[SC_PE_ZONE18_01_M19]";--�Aı�o�O�ɭԸӥh��o�����Q�Q���׸z�B�z���F�C				--�ĥ|���w��

							--�Ȱ�B�D�J���p���y�H������
							[20] = "[SC_PE_ZONE18_01_M20]";--�Ҧ��H�h��ګ᭱�I�u�n��[116392]�L�̴N���|�L�ӡI		--�Ȱ�B�S�w�������p�U��L�@���
							[21] = "[SC_PE_ZONE18_01_M21]";--�V�|�I���@�Ӧa�I�|�F�I�y�H�̩쩵�ɶ��O�@�Ҧ��H�^�������I		--�Ȱ�B�S�w�������p�U��L�@���
							[22] = "[SC_PE_ZONE18_01_M22]";--�L������w�g�n�ƤF�A�j�٤W�A�p�ߧO���i���u���o�I			--�Ȱ�B�w�L�@��T����
							[23] = "[SC_PE_ZONE18_01_M23]";--�ܦn...�N�o��i���u�h�~�Ӿ��a...					--�Ȱ�B�Ĥ@���w��
							[24] = "[SC_PE_ZONE18_01_M24]";--�S���A�N�o��½��A�A��ı�o�ܭ��ܡH					--�Ȱ�B�ĤG���w��
							[25] = "[SC_PE_ZONE18_01_M25]";--�γ\�w�g���F�A���٬O�A���@�U�l�C					--�Ȱ�B�ĤT���w��
							[26] = "[SC_PE_ZONE18_01_M26]";--�L�w�g�ܵ�z�F�I�j�٫ݷ|�p�ߧO������u�̭��o�I					--�Ȱ�B�ĥ|���w��
							--�y�H���`
							[27] = "[SC_PE_ZONE18_01_M27]";--�ڦ��I�����A�ѤU���N���U�A�̤F...					--�y�H���`
							[28] = "[SC_PE_ZONE18_01_M28]";--����X�{�F�t�@�����~�C							--�y�H����
							[29] = "[SC_PE_ZONE18_01_M29]";--[104450]�L�`�����}�A[<S>115600]���G�w�g�ߺD�o�˪����p�A�����~���y��[104286]�C--�p�����}
							--PE����
							[30] = "[SC_PE_ZONE18_01_M30]";--�Ҧ����y�H���M�h�F�A��a�Y�N���{�M���C							
							--BOSS�ԫe�e������������
							[31] = "[SC_PE_ZONE18_01_M31]";--�̤j�����ӤF�A�j�٤p�ߡC		
							[32] = "[SC_PE_ZONE18_01_M32]";--��a�D��Ȱ�B���]��A�Ҧ��y�H���^�h�u�@�L�̪���a�F�C	
							[100] = "[SC_PE_ZONE18_01_M100]";--��s[116392]�C
							[101] = "[SC_PE_ZONE18_01_M101]";--�A�Q���u���u���ҿS�ˡA�p�G�~��ݦb�����|�Q�N���C
							[102] = "[SC_PE_ZONE18_01_M102]";--[<S>115600]�S�}�l�~���y��[104286]�C
							[103] = "[SC_PE_ZONE18_01_M103]";--[<S>115600]�S�}�l�~���y��[104286]�C
				}
	
--	ZONE18_PE01_Var["White"] = Lua_DW_CreateObj("flag" ,116398,780753,1)		--���s�гy�դ�
--	ZONE18_PE01_Var["White2"] = Lua_DW_CreateObj("flag" ,116399,780753,1)	
--	ZONE18_PE01_Var["White3"] = Lua_DW_CreateObj("flag" ,116400,780753,1)	
--	table.insert( ZONE18_PE01_Obj , ZONE18_PE01_Var["White"] )
--	table.insert( ZONE18_PE01_Obj , ZONE18_PE01_Var["White2"] )
--	table.insert( ZONE18_PE01_Obj , ZONE18_PE01_Var["White3"] )
	--ZONE18_PE01_Var["ResetTime"] = 30				-- �������ȭ��m�ɶ�(��)	1�p��
	ZONE18_PE01_Var["CreateTime"] = 70				-- �Ǫ��Ͳ��ˬd���j
	ZONE18_PE01_Var["MapID"] = 631					-- �����ƥ���Ͻs��
	ZONE18_PE01_Var["TestID"] = 1					-- �����ƥ���հϽs��
	ZONE18_PE01_Var["RoomID"] = 0	
	
	ZONE18_PE01_Var["ControllerID"] = 116390		-- PE�����GID
	ZONE18_PE01_Var["CreaterID"] = 116393			-- �Ǫ��Ͳ������GID
	--ZONE18_PE01_Var["WellID"] = 116107				-- ����GID
	ZONE18_PE01_Var["Controller"] = 0				-- PE�����
	ZONE18_PE01_Var["Creater"] = 0					-- �Ͳ�����
	ZONE18_PE01_Var["CountMachine"] = 0					-- �Ͳ�����
	ZONE18_PE01_Var["FlagID"] = {780756,780757,780759,780753}				-- �X��ID
	local FlagID = ZONE18_PE01_Var["FlagID"]
	--ZONE18_PE01_Var["BossFlagID"] = 780657			-- BOSS�κX��
	ZONE18_PE01_Var["FlagNum"] = GetMoveFlagCount( FlagID[2] ) --�X�m�ƶq
	--ZONE18_PE01_Var["CropType"] = 50				-- �@���Ϲj���X�нs��
		
	ZONE18_PE01_Var["HunterCount"] = 0
	ZONE18_PE01_Var["MstCount"] = 0	
	ZONE18_PE01_Var["Mark"] = {}							-- �ϥΰѼƺ޲z�}�C
	ZONE18_PE01_Var["ShowMark"] = {}						-- �ϥΰѼƺ޲z�}�C
	ZONE18_PE01_Agidin = {}						-- �ϥΰѼƺ޲z�}�C
	ZONE18_PE01_Hunter = {}							-- �ϥΰѼƺ޲z�}�C
	ZONE18_PE01_Var["HunterID"] = { 116394,			-- �y�H
									116395, 		-- �y�H
									116396,			-- �y�H
									116397 }		-- �y�H
									

	ZONE18_PE01_Var["GiveItem"] =  208197			-- �@���

	ZONE18_PE01_Var["MstID"] = {	104286,			-- ���~�Ȱ�B
									104485,			-- �w�֨Ȱ�B
									104487 }		-- ���j�Ȱ�B
		
	ZONE18_PE01_Var["TimeCreateMst"] = 1				-- �C�����j�X�����Ǫ��ƥ�
	ZONE18_PE01_Var["MaxHunter"] = 10				-- ���W�������y�H�ƥ�
	ZONE18_PE01_Var["NowHunter"] = 0				-- ���W���y�H�ƥ�
	ZONE18_PE01_Var["MaxMst"] = 5					-- ���W�������Ǫ��ƥ�

	ZONE18_PE01_Var["HunterDead"] = 0				-- �ثe�y�H���`�ƥ�
	ZONE18_PE01_Var["agidin"] = 0					-- �Ȱ�B���`�ƶq
	ZONE18_PE01_Var["MstDead"] = 0					-- �Ȱ�B���`�ƶq
	ZONE18_PE01_Var["MstBoss"] = 0					-- ���j�Ȱ�B��GitemID
	
	ZONE18_PE01_Var["ResetTime"] = 2400
	ZONE18_PE01_Var["PH1Require"]  = 60				-- ���q0�ݭn�������~�Ȱ�B�ƶq
	ZONE18_PE01_Var["PH2Time"] = 120					-- ���q1�`�ɶ�(��)
	ZONE18_PE01_Var["PH3Require"] = 30				-- ���q2�ݭn���˪��w�ߨȰ�B�ƶq
	ZONE18_PE01_Var["PH4Require"] = 1				-- ���q3�ݭn���˪����j�Ȱ�B�ƶq
	
	ZONE18_PE01_Var["MaxHunterDead"] = 10			-- �y�H�̤j���`�� (���ѱ���)
	ZONE18_PE01_Var["NumInTown"] = 3				-- ���q3~4�Ȱ�B�s�b����Ǫ��̤j�ƶq		
	
	ZONE18_PE01_Var["Bonus"] = { 5,10,25,300 }			-- �C���q����
	
	ZONE18_PE01_Var["ExCha_Ratio"] = 100			-- �^�X��v
	ZONE18_PE01_Var["MaxBonus"] = 1200				-- �̤j����
end

--==================================================--
--  �����ƥ�]�w��                                  --
--==================================================--
function LuaPE_ZONE18_PE01_PESet()

	local PE_Name = "SC_PE_ZONE18_01_NAME"					-- [116402]�E�T
	local PE_Desc = "SC_PE_ZONE18_01_DESC"					-- ���F�ǻ����������A[<S>115600]�B�߿n�{�y��[104286]�A���X�غإi��Ĳ��[104487]���欰�C
	local PEIndex = ZONE18_PE01_PEIndex
	local PE_ResetTime = ZONE18_PE01_Var["ResetTime"] * 1000	
	PE_AddPE( PE_Name , PE_Desc , PEIndex , 3000 ) 	-- �s�W�@�Өƥ�

	local MapID = ZONE18_PE01_Var["MapID"]
	local TestID = ZONE18_PE01_Var["TestID"]
	PE_AddRegion( PEIndex , MapID )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�
	--���q�ܼ�
	local PH0Index = 100	--���q�ܼ�
	local PH1Index = 101	
	local PH2Index = 102
	local PH3Index = 103
	local PH4Index = 104
	--���q�W��
	local PH0_Name = "SC_PE_ZONE18_01_PHNAME04" 	--�y�L�w��
	local PH1_Name = "SC_PE_ZONE18_01_PHNAME00" 	--�ۭt�z�p[116402]
	local PH2_Name = "SC_PE_ZONE18_01_PHNAME01"	--�t�������ð}��
	local PH3_Name = "SC_PE_ZONE18_01_PHNAME02"	--���񪺵w��
	local PH4_Name = "SC_PE_ZONE18_01_PHNAME03"	--���j�c�]«�X
	--���q�ԭz
	local PH0_Desc = "SC_PE_ZONE18_01_M44"		--�g�L�W�@��[<S>116402]�������A[<S>115600]�y�L�w���F�ǡA�γ\����ɭԤS�|���Ȧ�����[<S>104286]�ӦY�C
	local PH1_Desc = "SC_PE_ZONE18_01_M40"		--���M[<S>116402]�۷��ơA���L���׽�]�Q���A���A�s[<S>115600]���Ԥ����ӦY�C
	local PH2_Desc = "SC_PE_ZONE18_01_M41"		--[<S>104485]�ǳƵo�_�����F�A�n�ǳƦn[<S>208197]�ө��[<S>104485]�C
	local PH3_Desc = "SC_PE_ZONE18_01_M42"		--[<S>116402]�X�{�F�A�n�N�L�޶i���u�A���]�n�p�ߧO�^�U�h�A�_�h�����N���u�O[<S>116402]�C
	local PH4_Desc = "SC_PE_ZONE18_01_M43"		--���j��[104296]�X�{�F�A�ϥάۦP����k���˥L�C
	--�s�W���q
	PE_AddPhase( PEIndex , PH0Index , PH0_Name , PH0_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q0
	PE_AddPhase( PEIndex , PH1Index , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q1
	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q2
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 0 , 1 , 0 )	-- �s�W���q3
	PE_AddPhase( PEIndex , PH4Index , PH4_Name , PH4_Desc , 0 , 0 , 1 , 0 )	-- �s�W���q3
	--���q�^���ܼ�
	local OB0Index = 1000
	local OB1Index = 1001
	local OB2Index = 1002
	local OB3Index = 1003
	local OB4Index = 1004
	local OB5Index = 1005
	local OB6Index = 1006
	--���q���\����
	local OB0_Name = "SC_PE_ZONE18_01_OBNAME05" 	-- �Z���U���}�l���ݮɶ�
	local OB1_Name = "SC_PE_ZONE18_01_OBNAME00" 	-- ����[<S>104286]
	local OB2_Name = "SC_PE_ZONE18_01_OBNAME01"	-- �Z��[<S>104485]��F�ɶ��Ѿl
	local OB3_Name = "SC_PE_ZONE18_01_OBNAME02"	-- �����j���Ȱ�B
	local OB4_Name = "SC_PE_ZONE18_01_OBNAME03"	-- �����`���]����
	local OB5_Name = "SC_PE_ZONE18_01_OBNAME04"	-- �`���]���̾a����a
	local OB6_Name = "SC_PE_ZONE18_01_OBNAME06"	-- �]����a���Ȱ�B
	--���q���\����ԭz
	local OB0_Desc = "SC_PE_ZONE18_01_OB0_DESC"	--���ݭ��m�ɶ�����
	local OB1_Desc = "SC_PE_ZONE18_01_OB1_DESC" --�ϥή���[<S>104286]����÷�y��[<S>104286]�A��÷�i�H�b����[116398]���e�U����o�C
	local OB2_Desc = "SC_PE_ZONE18_01_OB2_DESC" --�����b[<S>104485]��F��F���e�b�Ҧ����ܪ��a���m[116392]�C
	local OB3_Desc = "SC_PE_ZONE18_01_OB3_DESC" --�ϥέ�~�ƦC��[<S>116392]�N[<S>104485]�޾ɦܼ��u���A�����L�̡C
	local OB4_Desc = "SC_PE_ZONE18_01_OB4_DESC" --���j��[104296]�X�{�F�A�L�N�O�o���M�����̫�@�Y[116402]�A�ϥάۦP����k���˥L�C
	local OB5_Desc = "SC_PE_ZONE18_01_OB5_DESC" --�d�U���������G���`���]���̨���a�C
	local OB6_Desc = "SC_PE_ZONE18_01_OB6_DESC" --��a�D�켫��Ȱ�B���]��ӳ��J�M�I�A�Хߨ�����o�ǨȰ�B
	
	local PH1Require = ZONE18_PE01_Var["PH1Require"]
	local PH2Require = ZONE18_PE01_Var["PH2Time"]
	local PH3Require = ZONE18_PE01_Var["PH3Require"]
	local PH4Require = ZONE18_PE01_Var["PH4Require"]	
	local MaxHunterDead = ZONE18_PE01_Var["MaxHunterDead"]
	local NumInTown = ZONE18_PE01_Var["NumInTown"]


	PE_PH_AddObjective_TimeLimit( PEIndex , PH0Index , OB0Index , OB0_Name , OB0_Desc , "ZONE18_PE01_ResetTime" , ZONE18_PE01_Var["ResetTime"] *1000 , 0 ,  true )
	-- �y���p�Ȱ�B	
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH1Index , OB1Index , OB1_Name , OB1_Desc , "ZONE18_PE01_Var_SmallAgidinDead" , 0 , PH1Require ,  true )
	
	-- �s�W�@�ӥؼСA���q1���\����G�˼Ʈɶ�����
	PE_PH_AddObjective_TimeLimit( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "ZONE18_PE01_PH2Time" , ZONE18_PE01_Var["PH2Time"]*1000 , 0 ,  true )
	
	-- �s�W�@�ӥؼСA���q2���\����G�����w�ߨȰ�B
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "ZONE18_PE01_Var_BigAgidinDead" , 0 , PH3Require ,  true )	
	
	-- �s�W�@�ӥؼСA���q3���\����G�������j�F�ɨȰ�B
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB4Index , OB4_Name , OB4_Desc , "ZONE18_PE01_Var_BossDead" , 0 , 1 ,  true )	
	
	-- �s�W�@�ӥؼСA���q2,3,4���ѱ���G�y�H�M�h
	--PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB5Index , OB5_Name , OB5_Desc , "ZONE18_PE01_Var_MaxHunterDead" , 0 , MaxHunterDead ,  false )
	--PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB5Index , OB5_Name , OB5_Desc , "ZONE18_PE01_Var_MaxHunterDead" , 0 , MaxHunterDead ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB5Index , OB5_Name , OB5_Desc , "ZONE18_PE01_Var_BigInTown" , 0 , 1 ,  false )	
	--�s�W�@�ӥ��ѥؼСA���q2.3���ѡG�]����a�����j�Ȱ�B�L�h
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB6Index , OB6_Name , OB6_Desc , "ZONE18_PE01_Var_MaxAgidinInTown" , 0 , NumInTown ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH4Index , OB6Index , OB6_Name , OB6_Desc , "ZONE18_PE01_Var_MaxAgidinInTown" , 0 , NumInTown ,  false )	

	-- �]�w���q�s��
	PE_PH_SetNextPhase( PEIndex , PH0Index , PH1Index )
	PE_PH_SetNextPhase( PEIndex , PH1Index , PH2Index )
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )
	-- �]�w�ն�/�ζ����q���y�n��
--	PE_PH_SetBonusScore( PEIndex , PH1Index , 20 , 20 )
--	PE_PH_SetBonusScore( PEIndex , PH2Index , 40 , 20 )
--	PE_PH_SetBonusScore( PEIndex , PH3Index , 80 , 20 )
--	PE_PH_SetBonusScore( PEIndex , PH4Index , 100 , 40 )
	
	-- �]�w�ؼйF�����^��禡
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE18_PE01_OB_OnAchieve" )
	
	-- �]�w�ƥ󵲧�������^��禡
	PE_SetCallBackOnBalance( PEIndex , "LuaPE_ZONE18_PE01_FinalExchange" )

	-- �ƥ�Ұ�
	PE_Start( PEIndex , PH0Index )

end

function LuaPE_ZONE18_PE01_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	debugmsg(0,0,"PHIndex = "..PHIndex.." & OBIndex = "..OBIndex)
	local Controller = ZONE18_PE01_Var["Controller"]	-- �����
	local Creater = ZONE18_PE01_Var["Creater"]	-- �����
	local Phase = ZONE18_PE01_Phase
--	Local White = ZONE18_PE01_Var["White"]
--	Local White2 = ZONE18_PE01_Var["White2"]
	if	PHIndex == 100 and OBIndex == 1000 then
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", Phase )		--[<S>115600]�S�}�l�~���y��[104286]�C
		BeginPlot( Controller, "LuaPE_ZONE18_PE01_DelArt", 0 )
		CallPlot( Controller, "LuaPE_ZONE18_PE01_Add_Number_PerTime" )
	elseif PHIndex == 101 and OBIndex == 1001 then 	-- PE�}�l-->�i�J�Ĥ@���q
		ZONE18_PE01_TotalHunterDead = 0
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", Phase )		--[<S>104485]�X�{�F�A�Ҧ��H�ǳ�[<S>208197]�C
--		BeginPlot( Controller, "LuaPE_ZONE18_PE01_CreateControl", 0 )		--�դ��˶�
		BeginPlot(Controller,"LuaPE_ZONE18_PE01_Phase2_Start",0)		--�X�{���и��y�H

	elseif PHIndex == 102 and OBIndex == 1002 then 	-- �����Ĥ@���q-->�i�J�ĤG���q 

		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", Phase )		--���L�̻��@�I�I�p�ߤ��n�E��L��...���M�s[116392]���O����A...
		BeginPlot(Creater,"LuaPE_ZONE18_PE01_Phase3_Start",0)			--�X�{�w�֨Ȱ�B
		BeginPlot(Creater,"LuaPE_ZONE18_PE01_Phase3_NPCsay",0)			--�y�H�}�l�o��	
		BeginPlot(Controller,"LuaPE_ZONE18_PE01_Creater_SetCount_Agidin_In_Town",0)	
	elseif PHIndex == 103 and OBIndex == 1003 then -- �����ĤG���q-->�i�J�ĤT���q		
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", Phase )		--[<S>104487]�X�{�F�I�άۦP����k�����L�I
		BeginPlot(Creater,"LuaPE_ZONE18_PE01_Phase4_Start",0)			--�X�{���j�Ȱ�B
	elseif PHIndex == 104 and OBIndex == 1004 then -- �����ĤT���q	 �X������	
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", Phase )		--[<S>115600]�ɨ��F�@�y������[116402]�j�\�A�å����~���y��[104286]�C	
		sleep(10)
		BeginPlot( Controller , "LuaPE_ZONE18_PE01_Reset" , 0 )			-- ���m��������
	elseif OBIndex == 1005 then --�y�H�M�h
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", 30 )  		-- �Ҧ����y�H���M�h�F�A��a�Y�N���{�M���C
		BeginPlot( Controller, "LuaPE_ZONE18_PE01_Art", 0 )
		sleep(20)
		BeginPlot( Controller , "LuaPE_ZONE18_PE01_Reset" , 0 )			-- ���m��������
	elseif OBIndex == 1006 then --��a�Q�]��
		CallPlot( Controller, "LuaPE_ZONE18_PE01_PhaseDO", 32 )  		-- �Ҧ����y�H���M�h�F�A��a�Y�N���{�M���C
		BeginPlot( Controller, "LuaPE_ZONE18_PE01_Art", 0 )
		sleep(20)
		BeginPlot( Controller , "LuaPE_ZONE18_PE01_Reset" , 0 )			-- ���m��������
	end
end
		
function LuaPE_ZONE18_PE01_FinalExchange( PEIndex , GUID , Score )
	local LV = 57
	local MapID = ZONE18_PE01_Var["MapID"]
	if LuaPE_KS_CheckLv( GUID, LV, MapID ) == false then return end
	local ExCha_Ratio = ZONE18_PE01_Var["ExCha_Ratio"]
	local MaxBonus = ZONE18_PE01_Var["MaxBonus"]
	local AddScore = ( ZONE18_PE01_Var["MaxHunter"] - ZONE18_PE01_TotalHunterDead ) * 20
--	local CountMachine = ZONE18_PE01_Var["CountMachine"]
	--say(GUID,GUID)
	DelBodyItem(GUID,208197,CountBodyItem ( GUID, 208197 ))				--�R���Ҧ��H���W���ۻ��
	if Score > 0	and	 DW_CheckMap( GUID, MapID ) == true	then
		if Score > 50	and	ZONE18_PE01_BigADInTown < 3	and	ZONE18_PE01_RedADInTown < 1	then
			Score = Score + AddScore
			debugmsg(0,0,GetName(GUID).." get bonus "..AddScore.." point")
		end
		if Score < ExCha_Ratio and Score > ExCha_Ratio/2 then
			CallPlot(GUID, "YOYO_GetTokenValue", 2, 1);--�j�N��"
		elseif Score > ExCha_Ratio then
			if Score >= MaxBonus then Score = MaxBonus end
			CallPlot(GUID, "YOYO_GetTokenValue", 2, math.floor( Score/ExCha_Ratio ));--�j�N��"
		end
		debugmsg(0,0,GetName(GUID).." total get "..Score.." point")
	end
end

--==================================================--
--  ���q/�T���B�z��                                 --
--==================================================--
--���q�B�z
function LuaPE_ZONE18_PE01_PhaseDO( Phase )

	local Total = ZONE18_PE01_TotalScore
	if Phase == 0 then
		ZONE18_PE01_Phase = 1
		LuaPE_ZONE18_PE01_Message( 102 , C_SYSTEM ) -- �Ĥ@���q�T��		
	elseif Phase == 1 then
		ZONE18_PE01_Phase = 2
		LuaPE_ZONE18_PE01_Message( 1 , C_SYSTEM ) -- �Ĥ@���q�T��
	elseif Phase == 2 then
		ZONE18_PE01_Phase = 3
		LuaPE_ZONE18_PE01_Message( 2 , C_DEFAULT ) -- �ĤG���q�T��
	elseif Phase == 3 then
		ZONE18_PE01_Phase = 4
		LuaPE_ZONE18_PE01_Message( 3 , C_DEFAULT ) -- �ĤT���q�T��
	elseif Phase == 4 then	
		ZONE18_PE01_Phase = 5
		LuaPE_ZONE18_PE01_Message( 4 , C_DEFAULT ) -- �ĥ|���q�T��
	elseif Phase == 30 then
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE18_PE01_Message( 30 , C_DEFAULT ) -- �y�H���M�h
	elseif Phase == 32 then
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE18_PE01_Message( 32 , C_DEFAULT ) -- �y�H���M�h
	end
end

function LuaPE_ZONE18_PE01_Message( Index , Color )
	local MapID = ZONE18_PE01_Var["MapID"]		-- 
	local RoomID = ZONE18_PE01_Var["RoomID"]		
	local Message = ZONE18_PE01_Message
	Color = "0xffffff00"	-- �j��T��������
	local AreaPlayer = LuaPE_KS_GetAreaPlayer( MapID, RoomID )
	if Index == 102 then
		debugmsg( 0, 0, "PE Start")
		ScriptMessage( OwnerID(), -1 , 1 , Message[Index] , Color )
		ScriptMessage( OwnerID(), -1 , 0 , Message[Index] , Color )
		debugmsg( 0, 0, "PE Start!!!")
	else
		for i = 1 , table.getn(AreaPlayer) do
			ScriptMessage( OwnerID(), AreaPlayer[i] , 1 , Message[Index] , Color )			
			ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , Message[Index], Color )
		end
	end
end

--==================================================--
--    ���q�@�B�z��                   				  	--
--==================================================--
function LuaPE_ZONE18_PE01_Add_Number_PerTime()
	local SmallAgidinDead
	While	ZONE18_PE01_Phase == 1	do
		sleep(150)
		SmallAgidinDead = ZONE18_PE01_Var["agidin"]
		SmallAgidinDead = SmallAgidinDead +1
		ZONE18_PE01_Var["agidin"] = SmallAgidinDead
		PE_SetVar( "ZONE18_PE01_Var_SmallAgidinDead" , SmallAgidinDead )
	end
end

--==================================================--
--    ���q�G�B�z��                   				  	--
--==================================================--
function LuaPE_ZONE18_PE01_Phase2_Start()
	debugmsg(0,0,"Phase 2")
	local FlagNum = ZONE18_PE01_Var["FlagNum"]
	local FlagID = ZONE18_PE01_Var["FlagID"]
	local Mark = {}
	local Phase = ZONE18_PE01_Phase
	local Hunter = ZONE18_PE01_Var["HunterID"]
	local FourHunter = {}
	local msg = ZONE18_PE01_Message 
	local ShowMark = {}
	for i = 1 , FlagNum+1 do						--��ܩҦ����ܦ�m�é�WĲ�I�@��
		Mark[i] =    Lua_DW_CreateObj("flag" ,116391,FlagID[2],i)		
		ShowMark[i] =    Lua_DW_CreateObj("flag" ,116467,FlagID[2],i)		
		--say(Mark[i],"i am number "..i)
		WriteRoleValue( Mark[i] , EM_RoleValue_Register+2, 0 )
		WriteRoleValue( Mark[i] , EM_RoleValue_Register+1, i )		 
		SetPlot(Mark[i],"touch","LuaPE_ZONE18_PE01_TouchMark",10)
		table.insert( ZONE18_PE01_Obj , Mark[i] )
		table.insert( ZONE18_PE01_Obj , ShowMark[i] )
	end
	ZONE18_PE01_Var["Mark"] = Mark						--�N���ܪ��Ǩ�����ܼ�
	ZONE18_PE01_Var["ShowMark"] = ShowMark
	for i = 1,4 do								--�إߥ|���y�H��U�B�h��ۻ��
		--say(OwnerID(),Hunter[i])
		FourHunter[i] =    KS_CreateObjMode( Hunter[i], FlagID[4] , 2 , 30, 1, 1 )

		SetPlot(FourHunter[i],"dead","LuaPE_ZONE18_PE01_HunterDead",100)
		table.insert( ZONE18_PE01_Obj , FourHunter[i] )
		table.insert( ZONE18_PE01_Hunter , FourHunter[i] )
		WriteRoleValue( FourHunter[i] , EM_RoleValue_LiveTime , 1800 )
		CallPlot(FourHunter[i],"LuaPE_ZONE18_PE01_Phase2_FourHunterAI",FlagID[4],i+i+1)  --Flag , FlagNum
	end
	ZONE18_PE01_Var["NowHunter"] = ZONE18_PE01_Var["NowHunter"] + 4		--�w�X���y�H��+4
	Npcsay(FourHunter[rand(3)+1],msg[5])
	sleep(40)
	Npcsay(FourHunter[rand(3)+1],msg[6])

end

function LuaPE_ZONE18_PE01_TouchMark() --register+1 =>�N��L�����X       register+2 =>�N��L�����Y   register+3 => �N��L�O�_���b�Q��m
	local CastBarStatus
	local PEIndex = ZONE18_PE01_PEIndex
	local MapID = ZONE18_PE01_Var["MapID"]				-- �ϰ�a�Ͻs��
	local Bonus = ZONE18_PE01_Var["Bonus"]
	local Phase = ZONE18_PE01_Phase
	local ShowMark = ZONE18_PE01_Var["ShowMark"]
	if ReadRoleValue( TargetID(), EM_RoleValue_Register+3 ) == 1 then
		ScriptMessage( TargetID(), OwnerID(), 1, "[SYS_AUCTION_WAIT_NEXT]", 0 )	--���L���A�еy�ԦA�աC
	elseif	CountBodyItem ( OwnerID(), 208197 ) < 1 then
		ScriptMessage( TargetID(), OwnerID(), 1, "[SC_PE_ZONE18_01_M13]", 0 )	--�S���ۻ�ۡA�Ч��y�H���o	
	else	
		DW_CancelTypeBuff(68,  OwnerID() )
		BeginCastBar( OwnerID(), "[SC_SC_PE_ZONE18_01_PUTING]", 100, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0 )	--�ۤU��m
		WriteRoleValue( TargetID() , EM_RoleValue_Register+3, 1 )										--���ܪ����L��
		while true do																--���\�h��m�ۻ�۵�������,���ѴN���_��
			sleep( 2 )
			CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus > 0) then --�I�����\
				DelBodyItem(OwnerID(),208197,1)
				Local Stone = Lua_DW_CreateObj("obj",116392,TargetID())
				table.insert( ZONE18_PE01_Obj , Stone )				
				WriteRoleValue( TargetID() , EM_RoleValue_Register+2, Stone )
				EndCastBar( OwnerID(), CastBarStatus )
				SetPlot( TargetID(), "touch", "", 0 )
				WriteRoleValue( TargetID(), EM_RoleValue_Register+3, 0 )
				--say(TargetID(),"stone = "..ReadRoleValue( TargetID(), EM_RoleValue_Register+2 )..";StoneNum = "..ReadRoleValue( TargetID(), EM_RoleValue_Register+1 ))
				BeginPlot(TargetID(),"LuaPE_ZONE18_PE01_DontLook",0)
				BeginPlot(ShowMark[ReadRoleValue( TargetID(), EM_RoleValue_Register+1 )],"LuaPE_ZONE18_PE01_DontLook",0)
				CallPlot(TargetID(),"LuaPE_KS_SetBonus", PEIndex, MapID, Bonus[2],OwnerID() )         -- ��������
				ZONE18_PE01_TotalScore = ZONE18_PE01_TotalScore + Bonus[Phase]
				break
			elseif ( CastBarStatus < 0 ) then --�I�����_
				WriteRoleValue( TargetID(), EM_RoleValue_Register+3, 0 )
				EndCastBar( OwnerID(), CastBarStatus )
				break
			end			
		end		
	end		
		
		
end

function LuaPE_ZONE18_PE01_Phase3_FourHunterTalk()								---�y�H�����
	local msg = ZONE18_PE01_Message 
	LoadQuestOption( OwnerID() )
	AddSpeakOption(OwnerID(),TargetID(),msg[11],"LuaPE_ZONE18_PE01_Phase_GetStone",0)	--�����ۻ��

end

function LuaPE_ZONE18_PE01_Phase_GetStone()
	local Phase = ZONE18_PE01_Phase
	local msg = ZONE18_PE01_Message 
	if	CountBodyItem( OwnerID(), 208197 ) > 0	then
		SetSpeakDetail( OwnerID(), "[SC_SC_PE_ZONE18_01_GETSTONE0]" )	
	elseif EmptyPacketCount( OwnerID() ) == 0  then
		SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG8]")--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
	elseif	Phase == 2	then			
		SetSpeakDetail( OwnerID(), "[SC_SC_PE_ZONE18_01_GETSTONE2]" )			
		GiveBodyItem ( OwnerID(), 208197, 1 )	
	elseif	HateListCount( TargetID() ) == 0	then
		SetSpeakDetail( OwnerID(), "[SC_SC_PE_ZONE18_01_GETSTONE3]" )			
		GiveBodyItem ( OwnerID(), 208197, 1 )	
	else
		SetSpeakDetail( OwnerID(), "[SC_SC_PE_ZONE18_01_GETSTONE4]" )
		GiveBodyItem ( OwnerID(), 208197, 1 )	
	end
end


function LuaPE_ZONE18_PE01_Phase2_FourHunterAI(FlagID,FlagNum)  --register+1 => �O�_���ؼ�		---�y�H��AI
	local Mark = ZONE18_PE01_Var["Mark"]
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )		-- ����
	CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_AttackEnable")
	sleep(20)
	WriteRoleValue(OwnerID() , EM_RoleValue_IsWalk, 0 )			---�ζ]��		
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, 0 )	--�ثe�S���B�z����@���
	if	FlagID ~= nil and FlagNum ~= nil	then
		DW_MoveToFlag(OwnerID(),FlagID , FlagNum , 0 ,1)	
		DW_MoveToFlag(OwnerID(),FlagID , FlagNum+1 , 0 ,1)
	end
	CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_Hunter_Del")
	While ZONE18_PE01_Phase	== 2 do					---2���q���ɭ�
		local Phase = ZONE18_PE01_Phase	
		AddBuff( OwnerID() , 506303 , 0 , -1 ) -- ��AE Buff	
		if CheckID( OwnerID() ) ~= true or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			LuaPE_KS_StopAttack( OwnerID() ) --�������
			break
		elseif Phase > 4 then
			LuaPE_KS_StopAttack( OwnerID() ) --�������
			break			
		end

		CastSpell( OwnerID(), OwnerID(), 496180 )				--�j�M�@���
		local target = ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 )	--register+1 = �ؼ�
		--say(OwnerID(),"My Target is "..target)

		if	target > 0 and CheckID(target) == true then
			--say(OwnerID(),"so I close "..Target)
			DW_GetClose(OwnerID(),target,20)				--�a��ؼСA�S�a��e���|��
			while GetDistance( OwnerID() , target ) > 20 do
			sleep(10)
			end
			--say(OwnerID(),ReadRoleValue( target, EM_RoleValue_Register+3 ).."  "..HateListCount( OwnerID() ))
			--���ʫ�P�_,���ܪ������L,���ܪ��W�S���@���,�ۤv�ثe���b�԰����h
			if ReadRoleValue( target, EM_RoleValue_Register+3 ) == 0 and ReadRoleValue( target, EM_RoleValue_Register+2 ) == 0 and HateListCount( OwnerID() ) == 0 then
				--say(OwnerID(),"i am working")
				WriteRoleValue( target , EM_RoleValue_Register+3, 1 )					---�ؼЦ��L
				CastSpell( OwnerID(), target, 496202 )							---��m
				sleep(5)
				local MagicID = ReadRoleValue( OwnerID(), EM_RoleValue_SpellMagicID )			---�ˬd�I�k���A
				--debugmsg( 0,0,"MagicID = "..MagicID)

				if MagicID ~= 0 and HateListCount( OwnerID() ) == 0 then				---���M�O���I�k
				--say(OwnerID(),"i am CROUCH")				
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_LOOP )
				--say(OwnerID(),"i cast "..ReadRoleValue( OwnerID(), EM_RoleValue_SpellMagicID ))
					for i = 1 , 11 do
						if	ZONE18_PE01_Phase == 2	then
							sleep(10)
						else
							break
						end
					end
				--say(OwnerID(),"i cast "..ReadRoleValue( OwnerID(), EM_RoleValue_SpellMagicID ))
					if	HateListCount( OwnerID() ) == 0 then
						PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
					end
				end
				WriteRoleValue( target , EM_RoleValue_Register+3, 0 )
			end
			if	ReadRoleValue( target, EM_RoleValue_Register+2 ) ~= 0 then		--�N����
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, 0 )
			end
		else
			WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, 0 )
		end
		if	HateListCount( OwnerID() ) == 0 then						--�p�G�S���b�԰��N�H������+����
			LuaPE_ZONE18_PE01_RandomMove()			
		end
		sleep(10)
	end
	--debugmsg(0,0,"ZONE18_PE01_PHASE = "..ZONE18_PE01_Phase)
	local FlagID = ZONE18_PE01_Var["FlagID"]
	while	(ZONE18_PE01_Phase > 2 or ReadRoleValue( OwnerID(), EM_RoleValue_IsDead) == 1) do										---�ĤT���q���ɭ�
		
		
		if	DW_CheckDis( OwnerID() , FlagID[3] , ZONE18_PE01_Move_FlagNum , 30 ) == false and HateListCount( OwnerID() ) == 0 then		--����
			DW_MoveToFlag(OwnerID(),FlagID[4] , 10+ZONE18_PE01_Move_FlagNum , 30 ,1)	
			
			sleep(5)
			AdjustFaceDir( OwnerID() ,Mark[ZONE18_PE01_Move_FlagNum], 0 )	
		elseif	HateListCount( OwnerID() ) == 0	then
			sleep(20)
			CastSpell( OwnerID(), OwnerID(), 496218 )			
		end
		sleep(10)
	end

end

function LuaPE_ZONE18_PE01_RandomMove()
	local time = ks_MoveToObj( OwnerID(), OwnerID(), 30 )--�ۨ��P��üƲ���
	local msg = ZONE18_PE01_Message
	local Phase = ZONE18_PE01_Phase

	if ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 ) < 10 then					---����
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2, ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 )+1 )
	else
		if	Phase == 2 then
			Npcsay(OwnerID(),msg[rand(3)+7])
		else
			Npcsay(OwnerID(),msg[rand(3)+7])			
		end
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2, 0 )		
	end

	sleep(time+10)
end

function LuaPE_ZONE18_PE01_Phase2_Search_Mark()			---�k��,�M��S���ۻ�۪����ܪ�
	--say(TargetID(),ReadRoleValue( TargetID(), EM_RoleValue_Register+2 ).."   "..ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ))
	--say(ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ), " i am "..ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ))
	if	ReadRoleValue( TargetID(), EM_RoleValue_Register+2 ) == 0 and ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ) == 0 and ReadRoleValue( TargetID() , EM_RoleValue_OrgID) == 116391 then
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, TargetID() )
		return true
	end
	return false
end

function LuaPE_ZONE18_PE01_Phase2_Set_Stone()			---��m�ۻ��,�[�J�}�C,�ݤ������ܪ�
	Local Stone = Lua_DW_CreateObj("obj",116392,TargetID())
	local ShowMark = ZONE18_PE01_Var["ShowMark"]
	--say(OwnerID(),"i put stone")
	--say(TargetID(),"i have stone")
	table.insert( ZONE18_PE01_Obj , Stone )				
	WriteRoleValue( TargetID() , EM_RoleValue_Register+2, Stone )
	SetPlot( TargetID(), "touch", "", 0 )
	WriteRoleValue( TargetID(), EM_RoleValue_Register+3, 0 )
	--say(TargetID(),"stone = "..ReadRoleValue( TargetID(), EM_RoleValue_Register+2 )..";StoneNum = "..ReadRoleValue( TargetID(), EM_RoleValue_Register+1 ))
	BeginPlot(TargetID(),"LuaPE_ZONE18_PE01_DontLook",0)	
	BeginPlot(ShowMark[ReadRoleValue( TargetID(), EM_RoleValue_Register+1 )],"LuaPE_ZONE18_PE01_DontLook",0)	
	return true
end

function LuaPE_ZONE18_PE01_Check_Agidin()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104485 or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104487	then
		return true
	end
	return false
end

function LuaPE_ZONE18_PE01_Attack_Agidin()
	SetAttack(OwnerID(),TargetID())
end

--==================================================--
--    ���q�T�B�z��                   				  	--
--==================================================--

function LuaPE_ZONE18_PE01_Phase3_Start()				---�ĤT���q�}�l		---�Ȱ�Brigister+1�O�O��creater
	local FlagID = ZONE18_PE01_Var["FlagID"]						---�Ȱ�Brigister+2�O�O���L�ثe�Q�S�X��,�p�G�Q�S����>=�o�Ӭu��PID,�N���|�A�Q�S
	local Creater = OwnerID()								
	local MaxAgidin = ZONE18_PE01_Var["MaxMst"]
	local Phase = ZONE18_PE01_Phase 			--���q		
	local MstRestTime = ZONE18_PE01_Var["CreateTime"]
	WriteRoleValue( Creater , EM_RoleValue_Register+1, 0 )
	sleep(50)
	local BigAgidinNum = 0
	while  1  do							---�Cn���ͤ@���Ȱ�B
		local HardAgidin = Lua_DW_CreateObj("flag" ,104485,FlagID[1],0)
		BigAgidinNum = BigAgidinNum +1
		table.insert( ZONE18_PE01_Obj , HardAgidin )
		table.insert( ZONE18_PE01_Agidin , HardAgidin )
		WriteRoleValue( HardAgidin , EM_RoleValue_LiveTime , 1800 )
		WriteRoleValue( Creater , EM_RoleValue_Register+1, ReadRoleValue( Creater, EM_RoleValue_Register+1 )+1)	--�w�ߨȰ�B�ƶq+1
		WriteRoleValue( HardAgidin , EM_RoleValue_Register+1, Creater )
		SetPlot(HardAgidin,"dead","LuaPE_ZONE18_PE01_BigAgidinDead",100)
		sleep(20)
		WriteRoleValue(HardAgidin , EM_RoleValue_IsWalk, 0 )			---�ζ]��		
		BeginPlot(HardAgidin,"LuaPE_ZONE18_PE01_Phase3_MonsterAI",0)		---�j�Ȱ�BAI
		sleep(MstRestTime-40)
--		while ReadRoleValue( Creater, EM_RoleValue_Register+1 ) >= MaxAgidin do	---�u�n�Ȱ�B�ƶq������w�ƶq�h����Ͳ�
--			sleep(10)
--		end
		sleep(20)
--		if	ZONE18_PE01_Phase  ~= 3	then
--			break
--		end
		if	BigAgidinNum > 50	then
			break
		end

	end
end


function LuaPE_ZONE18_PE01_Phase3_MonsterAI()
	local FlagID = ZONE18_PE01_Var["FlagID"]
	local GoToFlag = 1
	local FlagNum = ZONE18_PE01_Var["FlagNum"]
	local Mark = ZONE18_PE01_Var["Mark"]
	local InPool = ZONE18_PE01_Run_In_Pool
	local Message = ZONE18_PE01_Message
	local AllHunter = ZONE18_PE01_Hunter								---�s�Ҧ��S�b�԰����y�H�����ۤv
	local AllHunterNum = table.getn(AllHunter)
--	local white = ZONE18_PE01_Var["White2"]

	AddBuff(OwnerID(),506981,0,-1)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_RUN_FORWARD )
	while GoToFlag < FlagNum do
		--say(OwnerID(),"i am going to "..GoToFlag)
		if ZONE18_PE01_Move_FlagNum < GoToFlag then					---��s�Ȱ�B���̫e�ݦ�m
			ZONE18_PE01_Move_FlagNum = GoToFlag
		end								---�]���Ҧ��X�Ыe���n���o�ӧP�_
 		local X , Y , Z							---��MOVEDIRECT����
		X = GetMoveFlagValue( FlagID[1] , GoToFlag , EM_RoleValue_X )
		Y = GetMoveFlagValue( FlagID[1] , GoToFlag , EM_RoleValue_Y )
		Z = GetMoveFlagValue( FlagID[1] , GoToFlag , EM_RoleValue_Z )
		while HateListCount( OwnerID() ) == 0 and DW_CheckDis( OwnerID() , FlagID[1] , GoToFlag , 5 ) == false do	---�Q�����N�����
			--DW_MoveToFlag(OwnerID(),FlagID[1] , GoToFlag , 0 ,1)				---�]��GOTOFLAG����m
			MoveDirect( OwnerID(), X , Y , Z )
			sleep(2)
		end
		while HateListCount( OwnerID() ) ~= 0 and GoToFlag == 1	do	---�Q�����N�����
			SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
			--DW_MoveToFlag(OwnerID(),FlagID[1] , GoToFlag , 0 ,1)				---�]��GOTOFLAG����m
			sleep(10)
		end
		SetDefIdleMotion( OwnerID(), ruFUSION_MIME_RUN_FORWARD )
		if	ReadRoleValue( Mark[GoToFlag], EM_RoleValue_Register+2 ) == 0	or	HateListCount( OwnerID() ) ~= 0		then	---�p�G�S�\�ۻ�۩γQ���NBREAK
			if	ReadRoleValue( Mark[GoToFlag] , EM_RoleValue_Register+4 ) == 0	then		---�ˬd�o�Ӧ�m�O�_�Q��}�L
				WriteRoleValue( Mark[GoToFlag] , EM_RoleValue_Register+4, 1 )
				if	InPool[1] == 1	then
					CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_Phase3_SimonHunter",Mark[GoToFlag])
					CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_Phase3_SimonHunter2",Mark[GoToFlag])
				else							---�p�G�O�Ĥ@�����L����,���Y�y��
					local temp = AllHunter[rand(AllHunterNum-1)+1] 
					if	ReadRoleValue( temp, EM_RoleValue_IsDead) == 0 then
						if	HateListCount( OwnerID() ) ~= 0	then
							debugmsg(0,0,"player fight")
							NPCsay(temp ,Message[103])
						elseif	CheckBuff( OwnerID() , 506981 ) == true	then
							NPCsay(temp ,Message[21])
						elseif	CheckBuff( OwnerID() , 507666 ) == true	or CheckBuff( OwnerID() , 507667 ) == true or CheckBuff( OwnerID() , 507668 ) == true then
							NPCsay(temp ,Message[22])
						elseif	CheckBuff( OwnerID() , 507669 ) == true	then
							NPCsay(temp ,Message[26])
						end
					end
				end			
				InPool[1] = 1
			end
			
			break
		end
		GoToFlag = GoToFlag + 1								---�˴��U�@�Ӧ�m
		sleep(1)
	end
	--debugmsg(0,0,"Agidin not cross")
	local goes
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
	--	
	if	GoToFlag == FlagNum	and	HateListCount( OwnerID() ) == 0 then			---�p�G������Y�N���ʨ���I
		CallPlot(OwnerID(),"DW_MoveToFlag",OwnerID(),FlagID[3] , GoToFlag , 0 ,1)
		goes = GoToFlag+1
	elseif	GoToFlag ~= FlagNum	and	HateListCount( OwnerID() ) == 0 then
		CallPlot(OwnerID(),"DW_MoveToFlag",OwnerID(),FlagID[3] , GoToFlag , 0 ,1)				---���L�ۻ�۪��|�}
		goes = GoToFlag	
	end
	--debugmsg(0,0,"Agidin cross")
	sleep(50)
	while 1  do
		CallPlot(OwnerID(),"LuaPE_ZONE18_PE01_HunterAttack")					---�s�Ҧ��y�H����
		if	DW_CheckDis( OwnerID() , FlagID[4] , 2 , 90 ) == false and HateListCount( OwnerID() ) == 0 then		--����
			--debugmsg(0,0,"Agidin go to Town")
			DW_MoveToFlag(OwnerID(),FlagID[4] , 2 , 90 ,1)								--�Z���ؼ��٦�90�H�W�B�S���԰��N����
			sleep(10)
		elseif	DW_CheckDis( OwnerID() , FlagID[4] , 2 , 90 ) == true	then
			SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
			FaceFlag ( OwnerID(),780753, 51 )			
--			AdjustFaceDir( OwnerID() ,white,0 )
		end
		
		sleep(20)
	end
end

function LuaPE_ZONE18_PE01_HunterAttack()
	local AllHunter = ZONE18_PE01_Hunter								---�s�Ҧ��S�b�԰����y�H�����ۤv
	local AllHunterNum = table.getn(AllHunter)
	if AllHunterNum > 0 then
		for i = 1, AllHunterNum do
			--say(AllHunter[i] ,"i am here")
			if CheckID(AllHunter[i]) == true and HateListCount(AllHunter[i]) == 0 and GetDistance( OwnerID() , AllHunter[i] ) < 400 then
			SetAttack(AllHunter[i],OwnerID())
			end
		end
	end
end

function LuaPE_ZONE18_PE01_Phase3_SimonHunter(Target)					
	local Flag = ZONE18_PE01_Var["FlagID"]
	local HunterID = ZONE18_PE01_Var["HunterID"]
	local MaxHunter = ZONE18_PE01_Var["MaxHunter"]	
	local HunterDead = 	ZONE18_PE01_Var["HunterDead"]		
	if	ZONE18_PE01_Var["NowHunter"] + HunterDead < MaxHunter	then						---�p�G�{�b���y�H�ƶq�٨S��W��
		ZONE18_PE01_Var["NowHunter"] = ZONE18_PE01_Var["NowHunter"] + 1
		local Hunter1 = LuaS_MK_MoveToObj("flag",HunterID[rand(3)+1],Target,Flag[4],2,100,150,0)		---�Z���ۤv150�B�ؤ@���y�H�]��Z��50�B�ç����ۤv
		table.insert( ZONE18_PE01_Obj , Hunter1 )
		table.insert( ZONE18_PE01_Hunter ,Hunter1)
		WriteRoleValue( Hunter1 , EM_RoleValue_LiveTime , 1800 )
		DisableQuest( Hunter1 , false )
		SetModeEx( Hunter1 , EM_SetModeType_Searchenemy , TRUE )		-- ����
		SetPlot(Hunter1,"dead","LuaPE_ZONE18_PE01_HunterDead",100)					---�������`�@��

		--CallPlot(Hunter1,"LuaPE_ZONE18_PE01_AttackEnable")
		CallPlot(Hunter1,"LuaPE_ZONE18_PE01_Phase2_FourHunterAI")					---����AI
		SetAttack(Hunter1,OwnerID())
	end
end


function LuaPE_ZONE18_PE01_Phase3_SimonHunter2(Target)								---�P�W
	local Flag = ZONE18_PE01_Var["FlagID"]
	local HunterID = ZONE18_PE01_Var["HunterID"]
	local Hunter1
	local MaxHunter = ZONE18_PE01_Var["MaxHunter"]
	local HunterDead = 	ZONE18_PE01_Var["HunterDead"]		
	if	ZONE18_PE01_Var["NowHunter"] + HunterDead < MaxHunter	then					
		ZONE18_PE01_Var["NowHunter"] = ZONE18_PE01_Var["NowHunter"] + 1
		local Hunter1 = LuaS_MK_MoveToObj("flag",HunterID[rand(3)+1],Target,Flag[4],2,100,130,0)
		table.insert( ZONE18_PE01_Obj , Hunter1 )
		table.insert( ZONE18_PE01_Hunter ,Hunter1)
		WriteRoleValue( Hunter1 , EM_RoleValue_LiveTime , 1800 )
		DisableQuest( Hunter1 , false )
		SetModeEx( Hunter1 , EM_SetModeType_Searchenemy , TRUE )		-- ����
		SetPlot(Hunter1,"dead","LuaPE_ZONE18_PE01_HunterDead",100)
		--CallPlot(Hunter1,"LuaPE_ZONE18_PE01_AttackEnable")
		CallPlot(Hunter1,"LuaPE_ZONE18_PE01_Phase2_FourHunterAI")
		SetAttack(Hunter1,OwnerID())
	end
end

---------���-------------
function LuaPE_ZONE18_PE01_Phase3_NPCsay()
	--debugmsg(0,0,"NPCsay Action")
	local ControllerID = ZONE18_PE01_Var["ControllerID"]
	local RoomID = ZONE18_PE01_Var["RoomID"]
	local Phase = ZONE18_PE01_Phase	
	local NPCsayCommand = LuaPE_ZONE18_PE01_CreaterSet( ControllerID, RoomID )	-- �]�w�����	
	table.insert( ZONE18_PE01_Obj , NPCsayCommand )
	while 1 do									--���q>2���ɭ�
		if	Phase > 2	then
			CallPlot(NPCsayCommand , "LuaPE_ZONE18_PE01_Phase3_HunterSay")
		end
		sleep(10)
	end
end

function LuaPE_ZONE18_PE01_Phase3_HunterSay()						--�̷Ӷ��q�CN���@����
	local InPool = ZONE18_PE01_Run_In_Pool
	local Message = ZONE18_PE01_Message
	local AllHunter = ZONE18_PE01_Hunter
	local AllHunterNum = table.getn(AllHunter)
	local temp = AllHunter[rand(AllHunterNum)+1]
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 3 and ReadRoleValue( temp, EM_RoleValue_IsDead) == 0 then
		--debugmsg(0,0,"NPCsay 1")
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, 0 )
		if	Inpool[1] == 0	then
			NPCsay(temp ,Message[20])
		elseif	Inpool[2] > 0	and	Inpool[3] < 1	then
			NPCsay(temp ,Message[14])
		elseif	Inpool[3] > 0	then
			NPCsay(temp ,Message[15])
		end
	else
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )+1 )		
	end
end

--==================================================--
--    ���q�|�B�z��                   				  	--
--==================================================--

function LuaPE_ZONE18_PE01_Phase4_Start()				---�ĥ|���q�}�l
	local FlagID = ZONE18_PE01_Var["FlagID"]
	local Creater = OwnerID()
	local MaxAgidin = ZONE18_PE01_Var["MaxMst"]
	local Phase = ZONE18_PE01_Phase 			--���q		
	local MstRestTime = ZONE18_PE01_Var["CreateTime"]
	local BigAgidin = Lua_DW_CreateObj("flag" ,104487,FlagID[1],0)
	local Message = ZONE18_PE01_Message
	local AllHunter = ZONE18_PE01_Hunter
	local AllHunterNum = table.getn(AllHunter)
	NPCsay(AllHunter[rand(AllHunterNum)+1] ,Message[31])
	table.insert( ZONE18_PE01_Obj , BigAgidin )
	table.insert( ZONE18_PE01_Agidin , BigAgidin )
	WriteRoleValue( BigAgidin , EM_RoleValue_LiveTime , 1800 )
	WriteRoleValue( Creater , EM_RoleValue_Register+1, ReadRoleValue( Creater, EM_RoleValue_Register+1 )+1)	--�w�ߨȰ�B�ƶq+1
	WriteRoleValue( BigAgidin , EM_RoleValue_Register+1, Creater )
	SetPlot(BigAgidin,"dead","LuaPE_ZONE18_PE01_BigAgidinDead",100)
	sleep(20)
	WriteRoleValue(BigAgidin , EM_RoleValue_IsWalk, 0 )			---�ζ]��		
	BeginPlot(BigAgidin,"LuaPE_ZONE18_PE01_Phase3_MonsterAI",0)		---�j�Ȱ�BAI
end

--==================================================--
--    ���u�B�z��                   				  	--
--==================================================--

function LuaPE_ZONE18_PE01_Hot_Spring_Hurt100()
	LuaPE_ZONE18_PE01_DontLook()
	while 1 do
		sleep(10)			---�@��S�@��
		SysCastSpellLV(OwnerID(),OwnerID(),496219,1)
		SysCastSpellLV(OwnerID(),OwnerID(),496220,1)
	end
end

function LuaPE_ZONE18_PE01_Hot_Spring_Hurt70()
	LuaPE_ZONE18_PE01_DontLook()
	while 1 do
		sleep(10)			---�@��S�@��
		SysCastSpellLV(OwnerID(),OwnerID(),496338,1)
		SysCastSpellLV(OwnerID(),OwnerID(),496339,1)
	end
end
--�ˬd���i���u���ͪ�

function LuaPE_ZONE18_PE01_Check_Fall_In_Pool_Player()
	local Message = ZONE18_PE01_Message
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1	then
		return false
	elseif	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	< 0.1	or	
		ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	== 0.1	then
		SysCastSpellLV(TargetID(),TargetID(),496338,1)	
		return false		
	else
		ScriptMessage( TargetID() , TargetID() , 1 , Message[101] , 0 ) --
		ScriptMessage( TargetID() , TargetID() , 0 , Message[101] , 0 )
		return true
	end
end
function LuaPE_ZONE18_PE01_Check_Fall_In_Pool()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104485 or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104487 or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104286 then
		if	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 2	then
			CancelBuff( TargetID()  , 507666  )
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 3	then
			CancelBuff( TargetID()  , 507666  )
			CancelBuff( TargetID()  , 507667  )
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 4	then
			CancelBuff( TargetID()  , 507666  )
			CancelBuff( TargetID()  , 507667  )
			CancelBuff( TargetID()  , 507668  )	
		end
		if	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) < ReadRoleValue( OwnerID() , EM_RoleValue_PID)	then
			return true
		end
	end
	return false
end
--�H�Q�S�����ƨM�w�٭n�Q�S�X��
function LuaPE_ZONE18_PE01_Monster_Fall_In_Pool()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104286	then
		SysCastSpellLV(TargetID() , TargetID() , 496224 , 1)		
		
	elseif	ZONE18_PE01_Phase > 2	then
		local InPool = ZONE18_PE01_Run_In_Pool
		local Message = ZONE18_PE01_Message
		local AllHunter = ZONE18_PE01_Hunter								---�s�Ҧ��S�b�԰����y�H�����ۤv
		local AllHunterNum = table.getn(AllHunter)
		local Count = PE_GetActivePlayerGUIDCount(1)
		
		--�Ȱ�B�w������ܤ�r
		if	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 0	and	Inpool[2] == 0 and Count ~= 0	then
			for i = 1 , Count , 1 do
				local ID = PE_GetActivePlayerGUID(1)
				ScriptMessage( ID , ID , 1 , Message[16] , 0 ) --
				ScriptMessage( ID , ID , 0 , Message[16] , 0 )
			end	
			InPool[1] = 1
			NPCsay(AllHunter[rand(AllHunterNum-1)+1] ,Message[23])
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 1	and	Inpool[3] == 0 and Count ~= 0  	then
			for i = 1 , Count , 1 do
				local ID = PE_GetActivePlayerGUID(1)
				ScriptMessage( ID , ID , 1 , Message[17] , 0 ) --
				ScriptMessage( ID , ID , 0 , Message[17] , 0 )
			end	
			InPool[2] = 1
			NPCsay(AllHunter[rand(AllHunterNum-1)+1] ,Message[24])
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 2	and	Inpool[4] == 0 and Count ~= 0  	then
			for i = 1 , Count , 1 do
				local ID = PE_GetActivePlayerGUID(1)
				ScriptMessage( ID , ID , 1 , Message[18] , 0 ) --
				ScriptMessage( ID , ID , 0 , Message[18] , 0 )
			end	
			InPool[3] = 1
			NPCsay(AllHunter[rand(AllHunterNum-1)+1] ,Message[25])
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 3	and	Inpool[5] == 0 and Count ~= 0  	then
			for i = 1 , Count , 1 do
				local ID = PE_GetActivePlayerGUID(1)
				ScriptMessage( ID , ID , 1 , Message[19] , 0 ) --
				ScriptMessage( ID , ID , 0 , Message[19] , 0 )
			end	
			InPool[4] = 1
			NPCsay(AllHunter[rand(AllHunterNum-1)+1] ,Message[26])
		end

		--�Ȱ�B�w���ɲ��ͪ��A
		if	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 0	then	--�R������BUFF,�W�[�S��1BUFF,�Q�S�@��
			CancelBuff( TargetID()  , 506981  )
			AddBuff(TargetID(),507666,0,-1)
			WriteRoleValue( TargetID() , EM_RoleValue_Register+2, 1 )
			Inpool[2] = 1
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 1	then	--�R���S��1BUFF,�W�[�S��2BUFF,���ˤ@��,�Q�S2��
			CancelBuff( TargetID()  , 506981  )
			CancelBuff( TargetID()  , 507666  )
			AddBuff(TargetID(),507667,0,-1)
			AddBuff( TargetID() , 507532 , 0 , -1 )					--�[�J���|�^��BUFF
			SysCastSpellLV(TargetID() , TargetID() , 496224 , 1)
			WriteRoleValue( TargetID() , EM_RoleValue_Register+2, 2 )
			Inpool[3] = 1
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 2	then	--�R���S��2BUFF,�W�[�S��3BUFF,����2��,�Q�S3��
			CancelBuff( TargetID()  , 506981  )
			CancelBuff( TargetID()  , 507666  )
			CancelBuff( TargetID()  , 507667  )
			AddBuff(TargetID(),507668,0,-1)
			SysCastSpellLV(TargetID() , TargetID() , 496225 , 1)
			WriteRoleValue( TargetID() , EM_RoleValue_Register+2, 3 )
			Inpool[4] = 1
		elseif	ReadRoleValue( TargetID(), EM_RoleValue_Register+2) == 3	then	--�R���S��3BUFF,�W�[�S��4BUFF,����3��,�Q�S4��
			CancelBuff( TargetID()  , 506981  )
			CancelBuff( TargetID()  , 507666  )
			CancelBuff( TargetID()  , 507667  )
			CancelBuff( TargetID()  , 507668  )
			AddBuff(TargetID(),507669,0,-1)
			SysCastSpellLV(TargetID() , TargetID() , 496226 , 1)
			WriteRoleValue( TargetID() , EM_RoleValue_Register+2, 4 )
			Inpool[5] = 1
		end
	end
end

--==================================================--
--    �ҰʳB�z��                   				  	--
--==================================================--
function LuaPE_ZONE18_PE01_Reset()
	local Mode = 1
	LuaPE_ZONE18_PE01_Start(1)
end

function LuaPE_ZONE18_PE01_Start(mode)
	local Temp
	local Art
	
	if ZONE18_PE01_Obj ~= nil then
		--Temp = ZONE18_PE01_Var["Controller"]
		LuaPE_ZONE18_PE01_DelObj()
	end
	
	if ZONE18_PE01_Art ~= nil then
		Art = ZONE18_PE01_Art
	end
	
	LuaPE_ZONE18_PE01_GlobalSet()	-- �@���ܼƳ]�w
	if Art ~= nil then
		ZONE18_PE01_Art = Art
	end
	
	if mode == nil then
		LuaPE_ZONE18_PE01_PESet()		-- �����ƥ�]�w
	end
	
	local ControllerID = ZONE18_PE01_Var["ControllerID"]
	local RoomID = ZONE18_PE01_Var["RoomID"]
	--if ZONE18_PE01_Var["Controller"] == 0 then
		ZONE18_PE01_Var["Controller"] = OwnerID()
	--end
	--local Controller = LuaPE_ZONE18_PE01_CreaterSet( ControllerID, RoomID )	-- �]�w�����	
	local Creater = LuaPE_ZONE18_PE01_CreaterSet( ControllerID, RoomID )	-- �]�w�����	
	--ZONE18_PE01_Var["Controller"] = Controller
	ZONE18_PE01_Var["Creater"] = Creater
	--table.insert( ZONE18_PE01_Obj , Controller )	
	table.insert( ZONE18_PE01_Obj , Creater )		
--	BeginPlot( OwnerID(), "LuaPE_ZONE18_PE01_CreateControl", 0 )
	--[[if temp ~= nil then
		DelObj( Temp )
	end--]]
end

function LuaPE_ZONE18_PE01_CreateControl()		---���q�i���2�����ñ����Ȫ��դ�
	local Phase = ZONE18_PE01_Phase
--	Local White = ZONE18_PE01_Var["White"]
--	Local White2 = ZONE18_PE01_Var["White2"]

	if	Phase == 0	then
--	Show(white,0)
--	Hide(white2)
	else
--	Show(white2,0)
--	Hide(white)	
	end
end


function LuaPE_ZONE18_PE01_Creater_SetCount_Agidin_In_Town()				--�]�w�Ȱ�B�����X�I
	LuaPE_ZONE18_PE01_DontLook()
	local FlagID = ZONE18_PE01_Var["FlagID"]
	local ControllerID = ZONE18_PE01_Var["ControllerID"]
	local Obj = KS_CreateObjMode( ControllerID, FlagID[4] , 2 , 0, 1, 1 )
	BeginPlot( Obj, "LuaPE_ZONE18_PE01_DontLook", 0 )
	ZONE18_PE01_Var["CountMachine"] = obj	

	table.insert( ZONE18_PE01_Obj , Obj )
	BeginPlot(Obj,"LuaPE_ZONE18_PE01_Creater_Count_Agidin_In_Town",0)
end

function LuaPE_ZONE18_PE01_Creater_Count_Agidin_In_Town()				--�C��I��k�N�p��@���Ȱ�B���ƶq

	while ReadRoleValue( OwnerID(), EM_RoleValue_Register+1) < 3	and	ReadRoleValue( OwnerID(), EM_RoleValue_Register+2) < 1	do
		WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, 0 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register+2, 0 )
		CastSpell( OwnerID(), OwnerID(), 496217 )
		sleep(20)
		ZONE18_PE01_BigADInTown = ReadRoleValue( OwnerID(), EM_RoleValue_Register+1)
		PE_SetVar( "ZONE18_PE01_Var_MaxAgidinInTown" , ZONE18_PE01_BigADInTown )
		ZONE18_PE01_RedADInTown = ReadRoleValue( OwnerID(), EM_RoleValue_Register+2)
		PE_SetVar( "ZONE18_PE01_Var_BigInTown" , ZONE18_PE01_RedADInTown )		
		if	ReadRoleValue( OwnerID(), EM_RoleValue_Register+1) > 2	or	ReadRoleValue( OwnerID(), EM_RoleValue_Register+2) > 0	then
			break
		end
	end

end
function LuaPE_ZONE18_PE01_Count_Agidin_In_Town()

	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104485	then
		if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 0 and CheckID( TargetID() ) == true then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1, ReadRoleValue( OwnerID(), EM_RoleValue_Register+1)+1 )			
		end
	end
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 104487	then
		if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 0 and CheckID( TargetID() ) == true then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+2, ReadRoleValue( OwnerID(), EM_RoleValue_Register+2)+1 )			
		end
	end
end
--���ի��O�[�b701887(�����L��)