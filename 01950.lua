
--==================================================--
-- �����ª��}�߹A��									--
--==================================================--
--==================================================--
--  �����ܼư�                                      --
--==================================================--
function LuaPE_ZONE17_PE01_GlobalSet()	
	ZONE17_PE01_Obj = {}							-- �ϥΪ���޲z�}�C
	ZONE17_PE01_Var = {}							-- �ϥΰѼƺ޲z�}�C
	ZONE17_PE01_Phase = 0							-- ���q����
	ZONE17_PE01_TotalScore = 0
	ZONE17_PE01_PEIndex = 1
	
	ZONE17_PE01_Message = { [1] = "[SC_PE_ZONE17_01_M01]"; --�u��q�A�ЮǪ�����������@�u���ǳ·СC
							[2] = "[SC_PE_ZONE17_01_M02]"; --�n���ǪήƧ@���~�|�ͪ��o����n�C
							[3] = "[SC_PE_ZONE17_01_M03]"; --�@����ۤ��ޥi�O�|�\�䪺�C
							[4] = "[SC_PE_ZONE17_01_M04]"; --�S�ήƪ��H�N��ڮ��a�C
							[5] = "[SC_PE_ZONE17_01_M05]"; --�u�Ʊ�঳�۰���@����k�C
							[6] = "[SC_PE_ZONE17_01_M06]"; --�o�ǰQ�H�����F��쩳�O�q���_�X�Ӫ��C
							[7] = "[SC_PE_ZONE17_01_M07]"; --�ͬ��u�O���n�L�C
							[8] = "[SC_PE_ZONE17_01_M08]"; --�s�b���S�ӤF�C
							[9] = "[SC_PE_ZONE17_01_M09]"; --�ڦ��ǲ֤F�n���𮧤@�|�C
							[10] = "[SC_PE_ZONE17_01_M10]";--�V�L�����ήơC
							[11] = "[SC_PE_ZONE17_01_M11]";--�w�g��L���F�C
							[12] = "[SC_PE_ZONE17_01_M12]";--�w�g�I�L�ΤF�C
							[13] = "[SC_PE_ZONE17_01_M13]";--[$VAR1] �٨S�������C
							[21] = "[SC_PE_ZONE17_01_M21]";--�ӬO���ت��ɭԤF�A���L�����¹A�ФW���\�h����ݭn�M���C
							[22] = "[SC_PE_ZONE17_01_M22]";--����I�μ˼ˤ���֡A���n���ӮƤ~���n�������C
							[23] = "[SC_PE_ZONE17_01_M23]";--�������ɭ��`�O�|���ǰQ�H�����F��C
							[24] = "[SC_PE_ZONE17_01_M24]";--�s�b�S�ӤF!!!!�֪���e�̰٭��ڭ̪��@���C
							[25] = "[SC_PE_ZONE17_01_M25]";--�I�X�������`�⦳��ì�F�C
							[26] = "[SC_PE_ZONE17_01_M26]";--�ݨӹA�ҭ̳��h�ҹL�׵L�k�ѧ@�F�C
							[27] = "[SC_PE_ZONE17_01_M28]";--�o����������ΡA[<S>116108]���q�઺���}�F�C
							[28] = "[SC_PE_ZONE17_01_M27]";--�n���e���������@�����Q�s�b�Y���F...							
							[29] = "[SC_PE_ZONE17_01_M29]";--�Ħ��������@���ƶq: [$VAR1]
							[30] = "[SC_PE_ZONE17_01_M30]";--[<S>104012]�ƶq:  [$VAR1]
							[100] = "[SC_PE_ZONE17_01_M100]";--�]���A�S��[$VAR1] �A�ҥH[$VAR2]�@�L�����C
							[101] = "[SC_PE_ZONE17_01_M101]";--�����
							[102] = "[SC_PE_ZONE17_01_M102]";--�I�Τ�
							[103] = "[SC_PE_ZONE17_01_M103]";--������
							[104] = "[SC_PE_ZONE17_01_M104]";}--�Ħ���
							
	ZONE17_PE01_Var["ResetTime"] = 3600				-- �������ȭ��m�ɶ�(��)	1�p��
	ZONE17_PE01_Var["CreateTime"] = 120				-- �Ǫ��Ͳ��ˬd���j
	ZONE17_PE01_Var["MapID"] = 926					-- �����ƥ���Ͻs��		�����¹A��(926)
	ZONE17_PE01_Var["TestID"] = 1					-- �����ƥ���հϽs��
	ZONE17_PE01_Var["RoomID"] = 0	
		
	ZONE17_PE01_Var["ControllerID"] = 115053		-- PE�����GID
	ZONE17_PE01_Var["CreaterID"] = 115506			-- �Ͳ������GID
	ZONE17_PE01_Var["WellID"] = 116107				-- ����GID
	ZONE17_PE01_Var["Controller"] = 0				-- PE�����
	ZONE17_PE01_Var["Creater"] = 0					-- �Ͳ�����
	ZONE17_PE01_Var["FlagID"] = 780656				-- �X��ID
	ZONE17_PE01_Var["BossFlagID"] = 780657			-- BOSS�κX��
	ZONE17_PE01_Var["FlagNum"] = GetMoveFlagCount( ZONE17_PE01_Var["FlagID"] ) --�X�m�ƶq
	ZONE17_PE01_Var["CropType"] = 50				-- �@���Ϲj���X�нs��
		
	ZONE17_PE01_Var["FarmerCount"] = 0
	ZONE17_PE01_Var["MstCount"] = 0	
	ZONE17_PE01_Var["FarmerID"] = { 116108,			-- �A��
									116109, 		-- �A��
									116113,			-- �A��
									116114 }		-- �A��
									

	ZONE17_PE01_Var["GiveItem"] = { 208075,			-- �˺�������l
									208076 }		-- �����ή�
									
	ZONE17_PE01_Var["Crop1ID"] = {	116104,			-- �g��
									115691,			-- �ɦ̮�lv1
									115694, 		-- �ɦ̮�lv2
									115695 } 		-- �ɦ̮�lv3
	ZONE17_PE01_Var["Crop2ID"] = {	116104,			-- �g��
									116177,			-- �n��lv1
									116176,			-- �n��lv2
									116178 }		-- �n��lv3
									
	ZONE17_PE01_Var["CropCarID"] = {	104012,		-- ��n���@��(�p)
										102717 } 	-- ��n���@��(�j)
										
	ZONE17_PE01_CropCar = {}
	ZONE17_PE01_Var["DeadCrop1ID"] = {	115693,		-- �\�䪺�ɦ̮�lv1
										116105,		-- �\�䪺�ɦ̮�lv2
										115976	}	-- �\�䪺�ɦ̮�lv3
	ZONE17_PE01_Var["DeadCrop2ID"] = {	116175, 	--�\�䪺�n��lv1
										116174,		--�\�䪺�n��lv2
										116174 }	--�\�䪺�n��lv3
	
	ZONE17_PE01_Var["MstID"] = {	104149,			-- ���r���P�K��
									104011,			-- �ޭ����Ϊ�����
									103998,			-- ���I�b��
									104010 }		-- �s�b
		
	ZONE17_PE01_Var["CropLiveTime"] = 25			-- �@���ͪ��ɶ�
	ZONE17_PE01_Var["TimeSpace"] = 15				-- �p�ɶ��j(��)
	ZONE17_PE01_Var["TimeCreateFarmer"] = 6			-- �C�����j�X�����A�Ҽƥ�
	ZONE17_PE01_Var["TimeCreateMst"] = 14			-- �C�����j�X�����Ǫ��ƥ�	
	ZONE17_PE01_Var["MaxFarmer"] = 12				-- ���W�������A�Ҽƥ�
	ZONE17_PE01_Var["MaxMst"] = 28					-- ���W�������Ǫ��ƥ�

	ZONE17_PE01_Var["FarmerDead"] = 0				-- �ثe�A�Ҧ��`�ƥ�
	ZONE17_PE01_Var["WeedDead"] = 0					-- ���󦺤`�ƶq
	ZONE17_PE01_Var["MstDead"] = 0					-- �b�����`�ƶq
	ZONE17_PE01_Var["MstBoss"] = 0					-- �b����
	
	ZONE17_PE01_Var["PH1Require"]  = 40				-- ���q�@�ݭn��������ƥ�
	ZONE17_PE01_Var["PH2Time"] = 90					-- ���q�G�`�ɶ�(��)
	ZONE17_PE01_Var["PH3Time"] = 120				-- ���q�T�`�ɶ�(��)
	ZONE17_PE01_Var["GetCrop"] = 0					-- �w���o���@���ƶq
	
	ZONE17_PE01_Var["MaxFarmerDead"] = 10			-- �A�ҳ̤j���`�� (���ѱ���)
	ZONE17_PE01_Var["CropLoss"]	= 5					-- �\���U���h�q(�ĥ|���q���ѱ���)
	ZONE17_PE01_Var["CropNum"] = 20					-- �C���oN�ӧ@���I���@�ӽ\��
	ZONE17_PE01_Var["MaxCropLoss"] = 5				-- �\���U�̤j���h�q(�ĥ|���q���ѱ���)
	ZONE17_PE01_Var["GetCropCar"] = 0	 			-- �w�g���o���@���U�ƶq
	
	ZONE17_PE01_Var["Bonus"] = { 5,5,5,5 }			-- ��ا@��/��������
	
	ZONE17_PE01_Var["ExCha_Ratio"] = 100			-- �^�X��v
	ZONE17_PE01_Var["MaxBonus"] = 1000				-- �̤j����
end
--==================================================--



--==================================================--
--  �����ƥ�]�w��                                  --
--==================================================--
function LuaPE_ZONE17_PE01_PESet()

	local PE_Name = "SC_PE_ZONE17_01_NAME"					-- �����ª��A���ͬ�
	local PE_Desc = "SC_PE_ZONE17_01_DESC"					-- �S��F���ت��u�`�A�g�a�W�O�ͪ�����P�H�⤣�������D�A�ϱo�����¹A�����A�ҳ��J�x�ҡC
	local PEIndex = ZONE17_PE01_PEIndex	
	PE_AddPE( PE_Name , PE_Desc , PEIndex , 0 ) 	-- �s�W�@�Өƥ�

	local MapID = ZONE17_PE01_Var["MapID"]
	local TestID = ZONE17_PE01_Var["TestID"]
	PE_AddRegion( PEIndex , MapID )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�
	
	local PH0Index = 100	--���q�ܼ�
	local PH1Index = 101	
	local PH2Index = 102
	local PH3Index = 103
	local PH4Index = 104
	local PH5Index = 105
	
	local PH0_Name = "SC_PE_ZONE16_DW_22" --���m�ɶ�
	local PH1_Name = "SC_PE_ZONE17_01_PHNAME01"	-- ����j�@��	
	local PH2_Name = "SC_PE_ZONE17_01_PHNAME02"	-- �V�O�~����ì
	local PH3_Name = "SC_PE_ZONE17_01_PHNAME03"	-- ���t����
	local PH4_Name = "SC_PE_ZONE17_01_PHNAME04"	-- �@�i�T��
	
	local PH0_Desc = ""
	local PH1_Desc = "SC_PE_ZONE17_01_M21"	-- �ӬO���ت��ɭԤF�A���L�����¹A�ФW���\�h����ݭn�M���C
	local PH2_Desc = "SC_PE_ZONE17_01_M22"	-- ����I�μ˼ˤ���֡A���n���ӮƤ~���n�������C
	local PH3_Desc = "SC_PE_ZONE17_01_M23"	-- �������ɭ��`�O�|���ǰQ�H�����F��C
	local PH4_Desc = "SC_PE_ZONE17_01_M24"	-- �s�b�S�ӤF!!!!�֪���٭��ڭ̪��@���C

	PE_AddPhase( PEIndex , PH0Index , PH0_Name , PH0_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q0
	PE_AddPhase( PEIndex , PH1Index , PH1_Name , PH1_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q1
	PE_AddPhase( PEIndex , PH2Index , PH2_Name , PH2_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q2
	PE_AddPhase( PEIndex , PH3Index , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q3
	PE_AddPhase( PEIndex , PH4Index , PH3_Name , PH3_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q4
	PE_AddPhase( PEIndex , PH5Index , PH4_Name , PH4_Desc , 0 , 0 , 0 , 0 )	-- �s�W���q4

	local OB0Index = 1000
	local OB1Index = 1001
	local OB2Index = 1002
	local OB3Index = 1003
	local OB4Index = 1004
	local OB5Index = 1005
	local OB6Index = 1006
	local OB7Index = 1007
	local OB8Index = 1008
	
	local OB0_Name = "SC_PE_ZONE17_DW_21" --�Ѿl�ɶ�
	local OB1_Name = "SC_PE_ZONE17_01_OBNAME01"	-- �M���A�a�W������
	local OB2_Name = "SC_PE_ZONE17_01_OBNAME02"	-- ��U���
	local OB3_Name = "SC_PE_ZONE17_01_OBNAME03"	-- �m���@��
	local OB4_Name = ""
	local OB5_Name = "SC_PE_ZONE17_01_OBNAME04"	-- �X���s�b
	local OB6_Name = "SC_PE_ZONE17_01_OBNAME05"	-- �h�Ϊ��A��
	local OB7_Name = "SC_PE_ZONE17_01_OBNAME06"	-- �l���@���U
	local OB8_Name = "SC_PE_ZONE17_01_OBNAME06"	-- �l���@���U
	
	local OB0_Desc = ""
	local OB1_Desc = "SC_PE_ZONE17_01_OB1_DESC" --���U[<S>116108]�M��[ZONE_SLEY_FARMS]�̪�[<S>104149]
	local OB2_Desc = "SC_PE_ZONE17_01_OB2_DESC" --�q[ZONE_SLEY_FARMS]����[<S>116107]������@�A�A�q[<S>116108]���W���o[<S>208076]���@���I�ΡA�M�ᵥ�ݧ@�������C
	local OB3_Desc = "SC_PE_ZONE17_01_OB3_DESC" --�����b[<S>104011]�P[<S>103998]�N�@���٭��p�ɫe�A�N�@���Ħ������A�åB�������Ǩ�ê�̡C
	local OB4_Desc = ""
	local OB5_Desc = "SC_PE_ZONE17_01_OB4_DESC" --�b[104010]�P���ǰ��j��[<S>103998]�N[<S>102717]�Y���e�A�N[104010]�����X�v�C
	local OB6_Desc = ""
	local OB7_Desc = ""
	local OB8_Desc = ""
	
	local PH1Require = ZONE17_PE01_Var["PH1Require"]
	local MaxFarmerDead = ZONE17_PE01_Var["MaxFarmerDead"]
	local CropLoss = ZONE17_PE01_Var["CropLoss"]

	-- PE���m�˼�
	PE_PH_AddObjective_TimeLimit( PEIndex , PH0Index , OB0Index , OB0_Name , OB0_Desc , "ZONE17_PE01_ResetTime" , ZONE17_PE01_Var["ResetTime"]*1000 , 0 ,  true )
	
	-- �s�W�@�ӥؼСA���q1���\����G���󦺤`�W�L
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH1Index , OB1Index , OB1_Name , OB1_Desc , "ZONE17_PE01_Var_WeedDead" , 0 , PH1Require ,  true )	
	
	-- �s�W�@�ӥؼСA���q2���\����G�����@�����
	PE_PH_AddObjective_TimeLimit( PEIndex , PH2Index , OB2Index , OB2_Name , OB2_Desc , "ZONE17_PE01_PH2Time" , ZONE17_PE01_Var["PH2Time"]*1000 , 0 ,  true )
	
	-- �s�W�@�ӥؼСA���q3���\����G�@�i�T��(�m��)
	PE_PH_AddObjective_TimeLimit( PEIndex , PH3Index , OB3Index , OB3_Name , OB3_Desc , "ZONE17_PE01_PH3Time" , ZONE17_PE01_Var["PH3Time"]*1000 , 0 ,  true )
	
	-- �s�W�@�ӥؼСA���q4���\����G�˼�
	PE_PH_AddObjective_TimeLimit( PEIndex , PH4Index , OB4Index , OB3_Name , OB3_Desc , "ZONE17_PE01_PH4Time" , 5*1000 , 0 ,  true )
	
	-- �s�W�@�ӥؼСA���q5���\����G���t����(�����s�b)
	PE_PH_AddObjective_Equal( PEIndex , PH5Index , OB5Index , OB5_Name , OB5_Desc , "ZONE17_PE01_Var_BossDead" , 0 , 1 ,  true )
	
	-- �s�W�@�ӥؼСA���q2,3���ѱ���G�A�Ҳ֦�
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH2Index , OB6Index , OB6_Name , OB6_Desc , "ZONE17_PE01_Var_MaxFarmerDead" , 0 , MaxFarmerDead ,  false )
	PE_PH_AddObjective_EqualAndGreater( PEIndex , PH3Index , OB6Index , OB6_Name , OB6_Desc , "ZONE17_PE01_Var_MaxFarmerDead" , 0 , MaxFarmerDead ,  false )	
	
	-- �s�W�@�ӥؼСA���q4.5���ѱ���G�@���Q�Y��
	PE_PH_AddObjective_Equal( PEIndex , PH4Index , OB7Index , OB7_Name , OB7_Desc , "ZONE17_PE01_Var_CropLoss" , CropLoss , ZONE17_PE01_Var["MaxCropLoss"] ,  false )
	PE_PH_AddObjective_Equal( PEIndex , PH5Index , OB8Index , OB8_Name , OB8_Desc , "ZONE17_PE01_Var_CropLoss" , CropLoss , ZONE17_PE01_Var["MaxCropLoss"] ,  false )

	-- �]�w���q�s��
	PE_PH_SetNextPhase( PEIndex , PH0Index , PH1Index )
	PE_PH_SetNextPhase( PEIndex , PH1Index , PH2Index )
	PE_PH_SetNextPhase( PEIndex , PH2Index , PH3Index )
	PE_PH_SetNextPhase( PEIndex , PH3Index , PH4Index )
	PE_PH_SetNextPhase( PEIndex , PH4Index , PH5Index )	
	
	-- �]�w�ؼйF�����^��禡
	PE_OB_SetCallBackOnAchieve( PEIndex , "LuaPE_ZONE17_PE01_OB_OnAchieve" )
	
	-- �]�w�ƥ󵲧�������^��禡
	PE_SetCallBackOnBalance( PEIndex , "LuaPE_ZONE17_PE01_FinalExchange" )

	-- �ƥ�Ұ�
	PE_Start( PEIndex , PH0Index )

end

function LuaPE_ZONE17_PE01_OB_OnAchieve( PEIndex, PHIndex , OBIndex )
	local Controller = ZONE17_PE01_Var["Controller"]	-- �����
	local Creater = ZONE17_PE01_Var["Creater"]	-- �����
	local Phase = ZONE17_PE01_Phase

	if PHIndex == 100 and OBIndex == 1000 then 	-- PE�˼Ƶ���-->�i�J�Ĥ@���q
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", Phase )		--�ӬO���ت��ɭԤF�A���L�����¹A�ФW���\�h����ݭn�M���C
	elseif PHIndex == 101 and OBIndex == 1001 then 	-- �����Ĥ@���q-->�i�J�ĤG���q 
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", Phase )		--����I�μ˼ˤ���֡A���n���ӮƤ~���n�������C
		LuaPE_ZONE17_PE01_DelCreater()		--���󰱤�ͪ�(�R���Ͳ����s����)		
		BeginPlot( Controller, "LuaPE_ZONE17_PE01_CreateControl", 0 )--���ͤg��
		BeginPlot( Controller, "LuaPE_ZONE17_PE01_CreateFarmer", 0 ) 	--���͹A��
	elseif PHIndex == 102 and OBIndex == 1002 then -- �����ĤG���q-->�i�J�ĤT���q		
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", Phase )		--�������ɭ��`�O�|���ǰQ�H�����F��C
		BeginPlot( Controller, "LuaPE_ZONE17_PE01_CreateMst", 0 ) 		--���ͫb��
	elseif PHIndex == 103 and OBIndex == 1003 then -- �����ĤT���q-->�i�J�ĥ|���q	
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_CreateCrop", 0 ) 	--���ͽ\��
	elseif PHIndex == 104 and OBIndex == 1004 then -- �����ĥ|���q-->�i�J�Ĥ����q
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", Phase )		--�s�b�S�ӤF!!!!�֪���٭��ڭ̪��@���C		
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_CreateBoss", 0 )		--���ͩs�b		
	elseif PHIndex == 105 and OBIndex == 1005 then 	-- �����Ĥ����q �X������	
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", Phase )		-- �I�X�������`�⦳��ì�F�C
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_Reset" , 0 )			-- ���m��������
	elseif OBIndex == 1006 then --�A�Ҳ֦�
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", 5 )  		-- �ݨӹA�ҭ̳��h�ҹL�׵L�k�ѧ@�F�C		
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_Reset" , 0 )			-- ���m��������
	elseif OBIndex == 1007 then --�������
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", 6 )  		-- �n���e���������@�����Q�s�b�Y���F...		
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_Reset" , 0 )			-- ���m��������	
	elseif OBIndex == 1008 then --�\���Q�Y��
		CallPlot( Controller, "LuaPE_ZONE17_PE01_PhaseDO", 7 )  		-- �n���e���������@�����Q�s�b�Y���F...		
		BeginPlot( Controller , "LuaPE_ZONE17_PE01_Reset" , 0 )			-- ���m��������	
	end
end

function LuaPE_ZONE17_PE01_FinalExchange( PEIndex , GUID , Score )
	local LV = 56
	local MapID = ZONE17_PE01_Var["MapID"]
	if LuaPE_KS_CheckLv( GUID, LV, MapID ) == false then return end

	local ExCha_Ratio = ZONE17_PE01_Var["ExCha_Ratio"]
	local MaxBonus = ZONE17_PE01_Var["MaxBonus"]	
	local MaxCropLoss = ZONE17_PE01_Var["MaxCropLoss"]
	local CropLoss = ZONE17_PE01_Var["CropLoss"]
	local AddScore = (MaxCropLoss - CropLoss)*50
		
	if Score > 0 then			
		if Score < ExCha_Ratio and Score > ExCha_Ratio/2 then
			CallPlot(GUID, "YOYO_GetTokenValue", 2, 1);--�j�N��"
		elseif Score > ExCha_Ratio then
			Score = Score + AddScore
			if Score >= MaxBonus then Score = MaxBonus end			
			CallPlot(GUID, "YOYO_GetTokenValue", 2, math.floor( Score/ExCha_Ratio ));--�j�N��"
		end
	end	
end

--==================================================--

--==================================================--
--  ���q/�T���B�z��                                 --
--==================================================--
--���q�B�z
function LuaPE_ZONE17_PE01_PhaseDO( Phase )
	local Total = ZONE17_PE01_TotalScore
	if Phase == 0 then
		ZONE17_PE01_Phase = 1
		LuaPE_ZONE17_PE01_Message( 1 , C_SYSTEM ) -- �Ĥ@���q�T��
	elseif Phase == 1 then
		ZONE17_PE01_Phase = 2
		LuaPE_ZONE17_PE01_Message( 2 , C_DEFAULT ) -- �ĤG���q�T��
	elseif Phase == 2 then
		ZONE17_PE01_Phase = 3
		LuaPE_ZONE17_PE01_Message( 3 , C_DEFAULT ) -- �ĤT���q�T��
	elseif Phase == 3 then	
		ZONE17_PE01_Phase = 4
		LuaPE_ZONE17_PE01_Message( 4 , C_DEFAULT ) -- �ĥ|���q�T��
	elseif Phase == 4 then
		ZONE17_PE01_Phase = 5
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE17_PE01_Message( 5 , C_SYSTEM ) -- PE�����T��
	elseif Phase == 5 then
		ZONE17_PE01_Phase = 6
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE17_PE01_Message( 6 , C_DEFAULT ) -- �A�Ҳ֦��T��
	elseif Phase == 6 then
		ZONE17_PE01_Phase = 7
		debugmsg( 0, 0, "This PE Total Give Bonus = " ..Total )
		LuaPE_ZONE17_PE01_Message( 7 , C_DEFAULT ) -- �o����������ΡA[<S>116108]���q�઺���}�F�C
	elseif Phase == 7 then
		ZONE17_PE01_Phase = 8		
		debugmsg( 0, 0, "GetCropCar = " ..ZONE17_PE01_Var["GetCropCar"] )
		LuaPE_ZONE17_PE01_Message( 8 , C_DEFAULT ) -- �\���Q�Y���T��
	end

end


--�ǰe�T��
function LuaPE_ZONE17_PE01_Message( Index , Color )
	local MapID = ZONE17_PE01_Var["MapID"]		-- �����¹A��	
	local RoomID = ZONE17_PE01_Var["RoomID"]		
	local Message = ZONE17_PE01_Message
	Color = "0xffffff00"	-- �j��T��������
	local AreaPlayer = LuaPE_KS_GetAreaPlayer( MapID, RoomID )
	
	if Index == 1 then
		debugmsg( 0, 0, "PE Start")
		ScriptMessage( OwnerID(), -1 , 1 , Message[20+Index] , Color )
		ScriptMessage( OwnerID(), -1 , 0 , Message[20+Index] , Color )
		debugmsg( 0, 0, "PE Start!!!")
	elseif Index == 9 then
			local GetCrop = ZONE17_PE01_Var["GetCrop"]
			local CropNum = ZONE17_PE01_Var["CropNum"]
			local MaxCropLoss = ZONE17_PE01_Var["MaxCropLoss"]
			local Num = math.floor(GetCrop/CropNum)	
		for i = 1 , table.getn(AreaPlayer) do
			if Num > ZONE17_PE01_Var["GetCropCar"] then
				ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , "[SC_PE_ZONE17_01_M29][$SETVAR1="..GetCrop.."]", Color )--�Ħ��������@���ƶq:
				ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , "[SC_PE_ZONE17_01_M30][$SETVAR1="..Num.."]", Color )--���n���@���U�ƶq: 										
			else
				ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , "[SC_PE_ZONE17_01_M29][$SETVAR1="..GetCrop.."]", Color )--�Ħ��������@���ƶq:
			end		
		end
		ZONE17_PE01_Var["GetCropCar"] = Num
	else
		for i = 1 , table.getn(AreaPlayer) do
			ScriptMessage( OwnerID(), AreaPlayer[i] , 1 , Message[20+Index] , Color )			
			ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , Message[20+Index], Color )
		end			
	end
end
--==================================================--

--==================================================--
--  �����¹A��  ���󲣥Ͱ�                        --
--==================================================--
--�����]�w
function LuaPE_ZONE17_PE01_CreaterSet( ObjID , RoomID )
	local Controller = ZONE17_PE01_Var["Controller"]
	local Obj = KS_CreateObjMode( ObjID, Controller, nil, 30, 1, 0 )
	
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

	return Obj
end

function LuaPE_ZONE17_PE01_CreateFarmer()--�A�Ҳ���
	local Var = ZONE17_PE01_Var
	local Phase = ZONE17_PE01_Phase
	local FlagID = Var["FlagID"]					
	local FarmerID = Var["FarmerID"]				--�A�Ҫ���ID
	local Controller = Var["Controller"]			--��������
	local MaxFarmer = Var["MaxFarmer"]				--���W�̤j�A�Ҽƶq	
	local TimeSpace = Var["TimeSpace"]				--�p�ɶ��j(��)
	local TimeCreateFarmer = Var["TimeCreateFarmer"]--�C�����j�X�����A�Ҽƥ�
	local RoomID = Var["RoomID"]
	local FarmerNum = 0								--���W�ثe�A�Ҽƶq	
	local CreateFarmer								--��ڲ��ͼƶq

	while true do
		Phase = ZONE17_PE01_Phase
		if Phase < 2 and Phase > 4 then break end --����
		FarmerNum = ReadRoleValue( Controller, EM_RoleValue_Register2 )	--Ū���A�Ҽƶq
		if FarmerNum < MaxFarmer then
			CreateFarmer = MaxFarmer - FarmerNum
			if CreateFarmer >= TimeCreateFarmer then
				CreateFarmer = TimeCreateFarmer - FarmerNum
				LuaPE_ZONE17_PE01_ObjCreate( FarmerID , FlagID , nil, TimeCreateFarmer )
			elseif CreateFarmer < TimeCreateFarmer then
				LuaPE_ZONE17_PE01_ObjCreate( FarmerID , FlagID , nil, CreateFarmer )				
			end
		end
		Sleep( TimeSpace*10 ) --�Ͳ����j
	end
end

function LuaPE_ZONE17_PE01_CreateMst()--���ͫb��
	local Phase = ZONE17_PE01_Phase
	local Var = ZONE17_PE01_Var				
	local FlagID = Var["FlagID"]					
	local Controller = Var["Controller"]			-- ��������
	local MstID = Var["MstID"]						-- �Ǫ�����ID
	local BossFlagID = ZONE17_PE01_Var["BossFlagID"]-- Boss���ͺX��	
	local MaxMst = Var["MaxMst"]					-- ���W�̤j�b���ƶq
	local TimeCreateMst = Var["TimeCreateMst"]		-- �C�����j�X�����b���ƥ�
	local TimeSpace = Var["TimeSpace"]				-- �p�ɶ��j(��)
	local MstNum = 0								-- ���W�ثe�b���ƶq
	local CreateMst	= 0								-- ��ڲ��ͼƶq
	local FlagObjID
	
	while true do
		Phase = ZONE17_PE01_Phase		
		if Phase < 2 and Phase > 4 then break --����
		elseif Phase == 4 then 
			FlagID = BossFlagID
			FlagObjID = 0
		end
		MstNum = ReadRoleValue( Controller, EM_RoleValue_Register1 ) --Ū���b���ƶq
		if MstNum < MaxMst then
			CreateMst = MaxMst - MstNum
			if CreateMst >= TimeCreateMst then				
				LuaPE_ZONE17_PE01_ObjCreate( MstID[3] , FlagID, FlagObjID, TimeCreateMst )
			elseif CreateMst < TimeCreateMst then
				LuaPE_ZONE17_PE01_ObjCreate( MstID[3] , FlagID, FlagObjID, CreateMst )
			end		
		end				
		Sleep( TimeSpace*10 ) --�Ͳ����j
	end
end

function LuaPE_ZONE17_PE01_CreateBoss()--���ͩs�b
	local BossFlagID = ZONE17_PE01_Var["BossFlagID"]-- Boss���ͺX��
	local MstID = ZONE17_PE01_Var["MstID"]						-- �Ǫ�����ID
	
	ZONE17_PE01_Var["MstBoss"] = LuaPE_ZONE17_PE01_ObjCreate( MstID[4] , BossFlagID , 0, 1 )	
end

function LuaPE_ZONE17_PE01_CreateCrop()
	local FlagID = ZONE17_PE01_Var["BossFlagID"]
	local CropCarID = ZONE17_PE01_Var["CropCarID"]
	local MaxCropLoss = ZONE17_PE01_Var["MaxCropLoss"]
	local RoomID = ZONE17_PE01_Var["RoomID"]	
	local GetCropCar = ZONE17_PE01_Var["GetCropCar"]
	local GetCrop = ZONE17_PE01_Var["GetCrop"]
	local CropNum = ZONE17_PE01_Var["CropNum"]
	local Num = math.floor(GetCrop/CropNum)
	local mod = GetCrop%CropNum
	local Obj = {}
	if mod >= math.floor(CropNum/2) then GetCropCar = GetCropCar + 1 end
	PE_SetVar( "ZONE17_PE01_Var_CropLoss" , MaxCropLoss - GetCropCar )		-- PE�ܼƧ���
	ZONE17_PE01_Var["CropLoss"] = MaxCropLoss - GetCropCar
	ZONE17_PE01_Var["GetCropCar"] = GetCropCar
	debugmsg( 0, 0, "GetCropCar = " ..ZONE17_PE01_Var["GetCropCar"] )
	
	if GetCropCar > 0 then
		for i=0, GetCropCar-1 do
			if mod >= math.floor(CropNum/2) and i == GetCropCar-1 then
				Obj[i] = KS_CreateObjMode( CropCarID[1], FlagID , i+1, 20, 1, 0 )
			else
				Obj[i] = KS_CreateObjMode( CropCarID[2], FlagID , i+1, 20, 1, 0 )
			end
			SetModeEx( Obj[i] , EM_SetModeType_Mark , true )			-- �аO
			SetModeEx( Obj[i] , EM_SetModeType_Strikback , false )		-- ����
			SetModeEx( Obj[i] , EM_SetModeType_Searchenemy , false )	-- ����
			SetModeEx( Obj[i] , EM_SetModeType_Move, false )			-- ����
			SetModeEx( Obj[i] , EM_SetModeType_ShowRoleHead, false )	-- �Y����
			SetModeEx( Obj[i] , EM_SetModeType_Fight , true )			-- �i�������
			AddBuff( Obj[i] , 506303 , 0 , -1 )--AE���
			AddBuff( Obj[i] , 507532 , 0 , -1 )--���|�^HP/SP
			AddBuff( Obj[i] , 507514 , 0 , -1 ) -- �v���K��
			AddToPartition( Obj[i] , RoomID )
			table.insert( ZONE17_PE01_Obj , Obj[i] )					-- �[�J����޲z�}�C
			table.insert( ZONE17_PE01_CropCar, Obj[i] )
			SetPlot( Obj[i], "DEAD", "LuaPE_ZONE17_PE01_CropLoss", 0 )
		end	
	end
end

--���󲣥�
function LuaPE_ZONE17_PE01_ObjCreate( ObjID, FlagID, FlagObjID, ObjNum )
	local Obj = {}
	local ObjType
	local Phase = ZONE17_PE01_Phase
	local RoomID = ZONE17_PE01_Var["RoomID"]
	local FarmerID = ZONE17_PE01_Var["FarmerID"]				-- �A��ID
	local MstID = ZONE17_PE01_Var["MstID"]						-- �Ǫ�ID
	local Controller = ZONE17_PE01_Var["Controller"]			-- ��������
	local FlagNum = ZONE17_PE01_Var["FlagNum"]					-- �X�m�ƶq
	local count
	
	for i = 1 , ObjNum do
		if FlagObjID == nil then
			FlagObjID = rand(FlagNum)+1
		end
		
		if ObjID ~= FarmerID then
			if FlagID == nil then
				Obj[i] = KS_CreateObjMode( ObjID, FlagObjID, nil, 25, 1, 0 )
			else				
				Obj[i] = KS_CreateObjMode( ObjID, FlagID , FlagObjID,  25, 1, 0 )
			end
			ObjType = 1
		else
			Obj[i] = KS_CreateObjMode( ObjID[rand(4)+1], FlagID , FlagObjID,  30, 1, 0 )
			ObjType = 2				
		end

		Sleep(2)
		if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == MstID[4] then
			BeginPlot( Obj[i], "LuaPE_ZONE17_PE01_BossWork", 0 )		-- �}�l�u�@
			SetModeEx( Obj[i] , EM_SetModeType_Strikback , false )		-- ����
		else
			BeginPlot( Obj[i], "LuaPE_ZONE17_PE01_MoveWork", 0 ) 		-- �}�l�u�@
			SetModeEx( Obj[i] , EM_SetModeType_Strikback , true )		-- ����
		end
		WriteRoleValue( Obj[i] , EM_RoleValue_IsWalk , 1 )			-- �ζ]������
		SetModeEx( Obj[i] , EM_SetModeType_Mark , true )			-- �аO				
		SetModeEx( Obj[i] , EM_SetModeType_Searchenemy , true )		-- ����
		SetModeEx( Obj[i] , EM_SetModeType_Fight , true )			-- �i�������
		AddToPartition( Obj[i] , RoomID )
		MoveToFlagEnabled( Obj[i] , false )							-- �������޼@��
		table.insert( ZONE17_PE01_Obj , Obj[i] )					-- �[�J����޲z�}�C
		AddBuff( Obj[i] , 506303 , 0 , -1 )							-- ��AE��Buff					
			
		if ObjType == 1 then				--�Ǫ�
			count = ReadRoleValue( Controller, EM_RoleValue_Register1 )
			WriteRoleValue( Controller, EM_RoleValue_Register1, count+1 )
			SetPlot( Obj[i], "DEAD", "LuaPE_ZONE17_PE01_MstDead", 0 )
		elseif ObjType == 2 then		--�A��
			count = ReadRoleValue( Controller, EM_RoleValue_Register2 )
			WriteRoleValue( Controller, EM_RoleValue_Register2, count+1 )			
			SetPlot( Obj[i], "DEAD", "LuaPE_ZONE17_PE01_FarmerDead", 0 )
		end
		
		FlagObjID = nil
	end
	return Obj
end
--==================================================--



--==================================================--
--    ���`�B�z��                       				--
--==================================================--

function LuaPE_ZONE17_PE01_Weeds() --�a�ϭ�l�Ǫ�����
	SetPlot( OwnerID(), "DEAD", "LuaPE_ZONE17_PE01_MstDead", 0 )
	while true do
		if ZONE17_PE01_Phase > 1 then
			DelObj(OwnerID())
		end
		sleep(30)
	end
end

function LuaPE_ZONE17_PE01_FarmerDead()	
	if ZONE17_PE01_Phase > 0 and ZONE17_PE01_Phase < 5 then
		local Var = ZONE17_PE01_Var
		local Controller = Var["Controller"]		-- �����
		local FarmerDead = Var["FarmerDead"]		-- �ثe�Q���A�Ҽƥ�
		local FlagID = Var["FlagID"]
		local count
		local Message = "[SC_PE_ZONE17_01_M09]" 				--�ڥ��𮧤@�|�C
		
		FarmerDead = FarmerDead + 1		-- ���`�p��
		Var["FarmerDead"] = FarmerDead
		PE_SetVar( "ZONE17_PE01_Var_MaxFarmerDead" , FarmerDead )		-- PE�ܼƧ���
		count = ReadRoleValue( Controller, EM_RoleValue_Register2 )
		WriteRoleValue( Controller, EM_RoleValue_Register2, count-1 )
		
		NPCSay( OwnerID(), Message )
		DelObj(OwnerID())	
		return false
	end
	--debugmsg(0,0,"true dead")
	return true
end

function LuaPE_ZONE17_PE01_MstDead()	
	if ZONE17_PE01_Phase > 0 and ZONE17_PE01_Phase < 5 then
		local PEIndex = ZONE17_PE01_PEIndex
		local Phase = ZONE17_PE01_Phase
		local Controller = ZONE17_PE01_Var["Controller"]	-- �����
		local MstDead = ZONE17_PE01_Var["MstDead"]			-- �ثe�����Ǫ��ƶq
		local MaxMst = ZONE17_PE01_Var["MaxMst"]			-- ���W�̤j�b���ƶq
		local MaxMstDead = ZONE17_PE01_Var["MaxMstDead"]	-- �̤j�b�����`�ƶq
		local MstID = ZONE17_PE01_Var["MstID"]				-- �Ǫ�ID
		local MapID = ZONE17_PE01_Var["MapID"]				-- �ϰ�a�Ͻs��
		local Bonus = ZONE17_PE01_Var["Bonus"]
		local WeedDead = ZONE17_PE01_Var["WeedDead"] 
		local ObjID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
				
		if ObjID == MstID[1] and Phase == 1 then
			WeedDead = WeedDead + 1
			ZONE17_PE01_Var["WeedDead"] = WeedDead				-- ���󦺤`�ƶq
			PE_SetVar( "ZONE17_PE01_Var_WeedDead" , WeedDead )	-- PE�ܼƧ��� ���󱾱�
			--debugmsg(0,0,"MstDead 1")
			ks_CreateObj_reset(false)
		elseif Phase == 4 then
			local count = ReadRoleValue( Controller, EM_RoleValue_Register1 )
			WriteRoleValue( Controller, EM_RoleValue_Register1, count-1 )
			ZONE17_PE01_Var["MstDead"] = MstDead + 1		-- �b�����`�ƶq
			--debugmsg(0,0,"MstDead 3")
		end
		
		if ObjID == MstID[4] then	--Boss���`
			LuaPE_KS_GetBonus( PEIndex, MapID, Bonus[Phase]*20 )
			PE_SetVar( "ZONE17_PE01_Var_BossDead", 1 )
			ZONE17_PE01_TotalScore = ZONE17_PE01_TotalScore + Bonus[Phase]*20
			debugmsg(0,0,"BossDead")
			return true
		else			
			LuaPE_KS_GetBonus( PEIndex, MapID, Bonus[Phase] )         -- ������������
			ZONE17_PE01_TotalScore = ZONE17_PE01_TotalScore + Bonus[Phase]
		end		
		return true
	else
		ks_CreateObj_reset(false)
		return true		
	end
end

function LuaPE_ZONE17_PE01_CropLoss()
	local CropLoss = ZONE17_PE01_Var["CropLoss"]
	CropLoss = CropLoss + 1
	ZONE17_PE01_Var["CropLoss"] = CropLoss
	PE_SetVar( "ZONE17_PE01_Var_CropLoss", CropLoss )
	debugmsg(0,0,"CropLoss = "..ZONE17_PE01_Var["CropLoss"])
	WriteRoleValue( OwnerID(), EM_RoleValue_LiveTime, 2 )
	return true
end

--==================================================--

--==================================================--
--  	�k�N���X�B�z��                      		--
--==================================================--

function LuaPE_ZONE17_PE01_CheckCrop()
	local Obj = TargetID()
	local Crop1ID = ZONE17_PE01_Var["Crop1ID"]
	local Crop2ID = ZONE17_PE01_Var["Crop2ID"]
	local CropCarID = ZONE17_PE01_Var["CropCarID"]
	local MstID = ZONE17_PE01_Var["MstID"]
	local FarmerID = ZONE17_PE01_Var["FarmerID"]
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
	local O_ID = ReadRoleValue( OwnerID(), EM_RoleValue_OrgID )
	
	for i=1, table.getn(MstID) do
		if O_ID == MstID[i] then
			for j=2, table.getn( Crop1ID ) do
				if ( OrgID == Crop1ID[j] or OrgID == Crop2ID[j] ) or OrgID == CropCarID[1] or OrgID == CropCarID[2] then					
					WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Obj )
					return true
				end
			end
		end
	end
	for i=1, table.getn( FarmerID ) do		
		if O_ID == FarmerID[i] then
			if ZONE17_PE01_Phase < 4 then
				for j=1, table.getn(Crop1ID) do
					if ( OrgID == Crop1ID[j] or OrgID == Crop2ID[j] ) and ( OrgID ~= Crop1ID[3] or OrgID ~= Crop2ID[3] )then
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Obj )
						return true
					end
				end
			elseif ZONE17_PE01_Phase == 4 then
				for i=1, table.getn(MstID) do
					if OrgID == MstID[i] then
						WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Obj )					
						return true
					end
				end			
			end
		end
	end	
	return false
end

function LuaPE_ZONE17_PE01_Working()
	local O_ID = OwnerID() --NPC
	local T_ID = TargetID()--�I����
	local MstID = ZONE17_PE01_Var["MstID"]
	local FlagID = ZONE17_PE01_Var["FlagID"]
	local FarmerID = ZONE17_PE01_Var["FarmerID"]
	local OrgID = ReadRoleValue( O_ID, EM_RoleValue_OrgID )
	local T_OrgID = ReadRoleValue( T_ID, EM_RoleValue_OrgID )
	local CropPhase = LuaPE_ZONE17_PE01_GetCropPhase( T_OrgID )
	local Phase = ZONE17_PE01_Phase
	for i=1, table.getn(FarmerID) do
		if OrgID == FarmerID[i] then
			if Phase < 4 then
				if ReadRoleValue( T_ID, EM_RoleValue_Register3 ) == 0 then
					WriteRoleValue( T_ID, EM_RoleValue_Register3, 1 )--�����I��				
					if CropPhase == 4 then
						ZONE17_PE01_Var["GetCrop"] = ZONE17_PE01_Var["GetCrop"] + 1						
						debugmsg(0,0,"GetCrop = "..ZONE17_PE01_Var["GetCrop"])
						LuaPE_ZONE17_PE01_Message( 9 , C_DEFAULT ) -- �Ħ����\�T��
						SetPlot( T_ID, "TOUCH", "", 0 )	
						DelObj(T_ID)
					elseif CropPhase < 3 then
						BeginPlot( T_ID, "LuaPE_ZONE17_PE01_CropMode", 0 )
					end
				end
			end
			WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )			
			break
		elseif OrgID == MstID[i] then
			if CropPhase > 1 then
				DelObj(T_ID)				
				break
			end
			WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )
		end
	end
	WriteRoleValue( O_ID, EM_RoleValue_Register1, 0 )--�L��H
end

--==================================================--

--==================================================--
--  	AI ���ʳB�z��                      			--
--==================================================--

function LuaPE_ZONE17_PE01_MoveWork()
	local Message = ZONE17_PE01_Message
	local FarmerID = ZONE17_PE01_Var["FarmerID"]
	local MstID = ZONE17_PE01_Var["MstID"]
	local BossFlagID = ZONE17_PE01_Var["BossFlagID"]
	local OrgID = ReadRoleValue( OwnerID(), EM_RoleValue_OrgID )			
	local type = 0
	local time

	for i=1, table.getn(FarmerID) do
		if OrgID == FarmerID[i] then
			type = 1
			break
		end
	end
	while true do
		local Phase = ZONE17_PE01_Phase
		local MaxCropLoss = ZONE17_PE01_Var["MaxCropLoss"]
		local CropLoss = ZONE17_PE01_Var["CropLoss"]	

		AddBuff( OwnerID() , 506303 , 0 , -1 ) -- ��AE Buff	
		if CheckID( OwnerID() ) ~= true or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			LuaPE_KS_StopAttack( OwnerID() ) --�������
			break
		elseif Phase > 4 then
			LuaPE_KS_StopAttack( OwnerID() ) --�������
			break			
		end
		
		local Obj = Role:new( OwnerID())
		if Obj:IsAttack() ~= true and HateListCount( OwnerID() ) == 0 then
			if rand(10)+1 > 8 and type == 1 and Phase < 4 then				
				NPCSay( OwnerID(), Message[rand(5)+1] )
			end
			if Phase == 4 then
				WriteRoleValue( OwnerID(), EM_RoleValue_IsWalk , 0 )
			else
				WriteRoleValue( OwnerID(), EM_RoleValue_IsWalk , 1 )
			end
			local target = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
			local work = ReadRoleValue( target, EM_RoleValue_Register3 )
			if target ~= 0 and CheckID(target) == true then
				if Phase < 4 and work == 0 then											
					while true do						
						if GetDistance( OwnerID(), target ) <=25 then
							StopMove( OwnerID(), true )
							SetModeEx( OwnerID(), EM_SetModeType_Move , false )
							CastSpell( OwnerID(), target, 495836 )--�Ķ�
						end
						sleep(5)
						local MagicID = ReadRoleValue( OwnerID(), EM_RoleValue_SpellMagicID )
						work = ReadRoleValue( target, EM_RoleValue_Register3 )
						if MagicID ~= 0 and HateListCount( OwnerID() ) == 0 and work == 0 then
							if type == 1 then
								PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )
								PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_LOOP )
							else
								PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
							end
						else
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE )
							SetModeEx( OwnerID(), EM_SetModeType_Move , true )
							time = ks_MoveToObj( OwnerID(), target, 30 )--���ʨ�ؼ�
							break
						end
						sleep(time+10)
					end	
				elseif Phase < 4 and work ~= 0 then
					WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , 0 )
				elseif Phase == 4 then
					time = ks_MoveToObj( OwnerID(), target, 30 )--���ʨ�ؼ�
					sleep(time+5)
					if ReadRoleValue( target, EM_RoleValue_IsPlayer ) ~= 1 and type == 0 then
						SetAttack( OwnerID() , target )
					end
				end
			else
				StopMove( OwnerID(), true )
				if target ~= 0 then DelObj(target) end
				if Phase == 4 then
					local CropCar = ZONE17_PE01_CropCar
					for i=1, table.getn(CropCar) do
						if CheckID(CropCar[i]) == true then
							WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , CropCar[i] )
							time = ks_MoveToObj( OwnerID(), CropCar[i], 30 )							
							break
						end											
					end									
				else
					time = ks_MoveToObj( OwnerID(), OwnerID(), 30 )--�ۨ��P��üƲ���
				end
				sleep(time+10)
				CastSpell( OwnerID(), OwnerID(), 495835 )--�j�M�P�_				
			end
		else
			if rand(10)+1 > 9 and type == 1 and Phase < 4 then		
				NPCSay( OwnerID(), Message[rand(2)+6] )
			elseif rand(10)+1 > 9 and type == 1 and Phase == 4 then
				NPCSay( OwnerID(), Message[rand(3)+6] )
			end
		end
		sleep( 10 )
	end
end

function LuaPE_ZONE17_PE01_BossWork()
	local time = 0
	local times = 0
	local target
	local magic = { [1] = 496043;--��s
					[3] = 496042;--����	
					[7] = 496044;--�V��									
					}	
	
	while true do		
		AddBuff( OwnerID() , 507525 , 0 , -1 ) -- �K�����h
		AddBuff( OwnerID() , 506303 , 0 , -1 ) -- ��AE Buff
		SetModeEx( OwnerID() , EM_SetModeType_Strikback , false )	-- ����
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy , false )	-- ����
		WriteRoleValue( OwnerID(), EM_RoleValue_IsWalk , 0 )
		local Phase = ZONE17_PE01_Phase
		if CheckID( OwnerID() ) ~= true or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
			LuaPE_KS_StopAttack( OwnerID() ) --�������
			break
		elseif Phase > 4 then
			LuaPE_KS_StopAttack( OwnerID() ) --�������
			break			
		end
		
		local Obj = Role:new( OwnerID())
		local CropCar = ZONE17_PE01_CropCar
		for i=1, table.getn(CropCar) do
			if CheckID(CropCar[i]) == true then
				CastSpell( CropCar[i], OwnerID(), 495767 )--�@���U�D�]
				if GetDistance( OwnerID(), CropCar[i] ) <= 30 then
					SetAttack( OwnerID() , CropCar[i] )
				else
					ks_MoveToObj( OwnerID(), CropCar[i], 30 )
				end
				target = CropCar[i]
				break
			end
		end		
		if Obj:IsAttack() ~= true and HateListCount( OwnerID() ) == 0 then
			
		else			
			local AttackTID = ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID )
			if ReadRoleValue( AttackTID, EM_RoleValue_IsPlayer ) == 1 then
				SetStopAttack( OwnerID() )
				CastSpell( OwnerID(), OwnerID(), 495874 )--�M������
			elseif target ~= nil then 				
				while true do
					local Distance = GetDistance( OwnerID(), target )
					if Distance < 80 then										
						time = ks_MoveToObj( OwnerID(), target, 30 )						
					else
						CastSpell( OwnerID(), target, 496142 )--�ļ�						
					end					
					sleep(time+10)
					if Distance <= 30 then break end
				end				
				SetAttack( OwnerID() , target )				
			end			
			
			if magic[times] ~= nil then
				CastSpell( OwnerID(), OwnerID(), magic[times] )--��k�N			
			end
			if times == 10 then times = 0 end
			times = times + 1
		end
		sleep( 10 )
	end
end



--==================================================--


--==================================================--
--  			�@��Ĳ�I�@����                  	--
--==================================================--

function LuaPE_ZONE17_PE01_CropPhase()
	local O_ID = OwnerID() --���a
	local T_ID = TargetID()--�I����	
	local item = ZONE17_PE01_Var["GiveItem"]
	local OrgID = ReadRoleValue( T_ID, EM_RoleValue_OrgID )
	local Message = ZONE17_PE01_Message
	local CropPhase = LuaPE_ZONE17_PE01_GetCropPhase( OrgID )
	local IsPlayer = ReadRoleValue( T_ID, EM_RoleValue_IsPlayer )
	
	if ReadRoleValue( T_ID, EM_RoleValue_Register3 ) == 0 then
		if CropPhase < 3 then
			if CountBodyItem( O_ID, item[CropPhase] ) > 0 then	--101����� 102�I�Τ�
				if BeginCastBarEvent( O_ID, T_ID, Message[100+CropPhase], 40, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaPE_ZONE17_PE01_CropPhaseDo" ) ~= 1 then
					ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )
					return
				end
			else
				ScriptMessage( O_ID, O_ID, 1 , "[SC_PE_ZONE17_01_M100][$SETVAR1=[<S>"..item[CropPhase].."]][$SETVAR2=["..OrgID.."]]", 0 )--�]���A�S��[$VAR1] �A�ҥH[$VAR2]�@�L�����C
				ScriptMessage( O_ID, O_ID, 0 , "[SC_PE_ZONE17_01_M100][$SETVAR1=[<S>"..item[CropPhase].."]][$SETVAR2=["..OrgID.."]]", 0 )
			end
		elseif CropPhase == 3 then
			ScriptMessage( O_ID, O_ID, 1 , Message[13], 0 )	--�٨S�������C
			ScriptMessage( O_ID, O_ID, 0 , Message[13], 0 )	--�٨S�������C
		elseif CropPhase == 4 then	-- 104�Ħ���
			if BeginCastBarEvent( O_ID, T_ID, Message[100+CropPhase], 40, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaPE_ZONE17_PE01_CropPhaseDo" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )
				return
			end		
		end
	elseif ReadRoleValue( T_ID, EM_RoleValue_Register3 ) ~= 0 then
		ScriptMessage( O_ID, O_ID, 1 , Message[10+CropPhase], 0 )--11�w�g��L���F�C 12�w�g�I�L�ΤF�C
		ScriptMessage( O_ID, O_ID, 0 , Message[10+CropPhase], 0 )
	end
end

function LuaPE_ZONE17_PE01_CropPhaseDo( ObjID, CheckStatus )
	local O_ID = OwnerID() --���a
	local T_ID = TargetID()--�@��
	local PEIndex = ZONE17_PE01_PEIndex
	local Bonus = ZONE17_PE01_Var["Bonus"]
	local MstID = ZONE17_PE01_Var["MstID"]
	local FlagID = ZONE17_PE01_Var["FlagID"]
	local GiveItem = ZONE17_PE01_Var["GiveItem"]
	local OrgID = ReadRoleValue( T_ID, EM_RoleValue_OrgID )
	local CropPhase = LuaPE_ZONE17_PE01_GetCropPhase( OrgID )
	local IsPlayer = ReadRoleValue( T_ID, EM_RoleValue_IsPlayer )
	local MapID = ZONE17_PE01_Var["MapID"]
	
	if CheckStatus ~= 0 then
		if CheckStatus > 0 and ReadRoleValue( T_ID, EM_RoleValue_Register3 ) == 0 then -- ���\				
			EndCastBar( O_ID, CheckStatus )
			WriteRoleValue( T_ID, EM_RoleValue_Register3, 1 )--�����I��
			
			if CropPhase == 5 then
				GiveBodyItem( O_ID, GiveItem[1], 5 )
				WriteRoleValue( T_ID, EM_RoleValue_Register3, 0 )--�����I��
				return
			end
			if CropPhase == 4 then
				ZONE17_PE01_Var["GetCrop"] = ZONE17_PE01_Var["GetCrop"] + 1
				LuaPE_ZONE17_PE01_Message( 9 , C_DEFAULT ) -- �Ħ����\�T��
				debugmsg(0,0,"GetCrop = "..ZONE17_PE01_Var["GetCrop"])
				SetPlot( T_ID, "TOUCH", "", 0 )	
				DelObj(T_ID)
			else
				DelBodyItem( O_ID, GiveItem[CropPhase], 1 )
				if rand(2)+1 >1 then
					CallPlot( T_ID, "LuaPE_ZONE17_PE01_ObjCreate", MstID[2], nil, T_ID, 1 )
				end
			end
			if CropPhase < 4 then
				BeginPlot( T_ID, "LuaPE_ZONE17_PE01_CropMode", 0 )
			elseif CropPhase < 3 and IsPlayer == 1 then
				DelBodyItem( O_ID, item[CropPhase] )
			end
			LuaPE_KS_SetBonus( PEIndex, MapID, Bonus[CropPhase]*2, O_ID )--���ƭp��	
			--PE_GivePlayerScore( PEIndex , O_ID, Bonus[CropPhase]*2 )
			ZONE17_PE01_TotalScore = ZONE17_PE01_TotalScore + Bonus[CropPhase]*2
		else	-- ����
			CheckStatus = -1
			EndCastBar( O_ID, CheckStatus )
		end
	end
end

function LuaPE_ZONE17_PE01_CropMode()
	local O_ID = OwnerID() --�@��
	local OrgID = ReadRoleValue( O_ID, EM_RoleValue_OrgID )
	local CropPhase = LuaPE_ZONE17_PE01_GetCropPhase( OrgID )
	local DeadPhase = CropPhase-1
	local Crop1ID = ZONE17_PE01_Var["Crop1ID"]
	local Crop2ID = ZONE17_PE01_Var["Crop2ID"]
	local DeadCrop1ID = ZONE17_PE01_Var["DeadCrop1ID"]
	local CropLiveTime = ZONE17_PE01_Var["CropLiveTime"]
	local FlagID = ZONE17_PE01_Var["FlagID"]
	local MstID = ZONE17_PE01_Var["MstID"]
	local CropType = ZONE17_PE01_Var["CropType"]	
	local Num = ReadRoleValue( O_ID, EM_RoleValue_Register2 )
	local Obj
	
	WriteRoleValue( O_ID, EM_RoleValue_Register3, 1 )
	sleep(CropLiveTime*10)
	if ( CropPhase == 1 and Num < CropType ) or ( CropPhase > 1 and OrgID == Crop1ID[CropPhase] ) then	
		Obj = LuaFunc_CreateObjByObj( Crop1ID[CropPhase+1], O_ID )
		WriteRoleValue( Obj, EM_RoleValue_Register2, Num )
	elseif OrgID == Crop2ID[CropPhase] then		
		Obj = LuaFunc_CreateObjByObj( Crop2ID[CropPhase+1], O_ID )
		WriteRoleValue( Obj, EM_RoleValue_Register2, Num )
	end	
	table.insert( ZONE17_PE01_Obj, Obj )
	CallPlot( Obj, "LuaPE_ZONE17_PE01_CropDead", 2 )
	if CropPhase == 2 then
		BeginPlot( Obj, "LuaPE_ZONE17_PE01_CropMode", 0 )	
		if rand(5)+1 > 3 then
			LuaPE_ZONE17_PE01_ObjCreate( MstID[CropPhase] , nil , Obj, 1 )
		end
	end	
	SetPlot( Obj, "TOUCH", "LuaPE_ZONE17_PE01_CropPhase", 20 )
	SetPlot( OwnerID(), "TOUCH", "", 0 )
	sleep(5)
	DelObj(OwnerID())
end

function LuaPE_ZONE17_PE01_GetCropPhase( OrgID )
	local Crop1ID = ZONE17_PE01_Var["Crop1ID"]
	local Crop2ID = ZONE17_PE01_Var["Crop2ID"]
	local WellID = ZONE17_PE01_Var["WellID"]
	local CropPhase
	for i=1, table.getn(Crop1ID) do
		if OrgID == Crop1ID[i] or OrgID == Crop2ID[i] then
			CropPhase = i
			break
		elseif OrgID == WellID then
			CropPhase = 5
			break
		end
	end
	return CropPhase
end

function LuaPE_ZONE17_PE01_CropDead( Type )	
	local Obj
	if Type == 1 then		
		local time = ZONE17_PE01_Var["PH2Time"]
		Sleep( time*10 )
		if ReadRoleValue( OwnerID(), EM_RoleValue_Register3 ) == 0 then
			DelObj(OwnerID())
		end		
	elseif Type == 2 then --�\��		
		local OrgID = ReadRoleValue( OwnerID(), EM_RoleValue_OrgID )
		local CropPhase = LuaPE_ZONE17_PE01_GetCropPhase( OrgID )
		local CropLiveTime = ZONE17_PE01_Var["CropLiveTime"]
		local DeadPhase = CropPhase-1
		local Crop1ID = ZONE17_PE01_Var["Crop1ID"]
		local Crop2ID = ZONE17_PE01_Var["Crop2ID"]
		local DeadCrop1ID = ZONE17_PE01_Var["DeadCrop1ID"]
		local DeadCrop2ID = ZONE17_PE01_Var["DeadCrop2ID"]
		Sleep( CropLiveTime*20 )
		if ReadRoleValue( OwnerID(), EM_RoleValue_Register3 ) == 0 then
			if OrgID == Crop1ID[CropPhase] then
				Obj = LuaFunc_CreateObjByObj( DeadCrop1ID[DeadPhase], OwnerID() )			
			elseif OrgID == Crop2ID[CropPhase] then
				Obj = LuaFunc_CreateObjByObj( DeadCrop2ID[DeadPhase], OwnerID() )			
			end
			SetModeEx( Obj , EM_SetModeType_Mark , false )			-- �аO
			SetModeEx( Obj , EM_SetModeType_ShowRoleHead, false )	-- �Y����
			table.insert( ZONE17_PE01_Obj, Obj )
			sleep(10)
			DelObj(OwnerID())
		end
	end
end

--==================================================--

--==================================================--
--  			NPC�]�w��		                  	--
--==================================================--

function LuaPE_ZONE17_PE01_setNPC()
	SetPlot( OwnerID(), "TOUCH", "LuaPE_ZONE17_PE01_GetItem", 20 )	
end

function LuaPE_ZONE17_PE01_GetItem()
	local Message = ZONE17_PE01_Message
	local GiveItem = ZONE17_PE01_Var["GiveItem"]
	if CountBodyItem( OwnerID(), GiveItem[1] ) == 0 then
		if BeginCastBarEvent( OwnerID(), TargetID(), Message[103], 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaPE_ZONE17_PE01_CropPhaseDo" ) ~= 1 then
			ScriptMessage( TargetID(), TargetID(), 0,"[SAY_NPC_BUSY]", 0 )
			return
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_PE_ZONE17_01_M14][$SETVAR1=[<S>"..GiveItem[1].."]]", 0 )--�A�w�g�֦��Ӧh[$VAR1]�F�C
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_PE_ZONE17_01_M14][$SETVAR1=[<S>"..GiveItem[1].."]]", 0 )
	end
end

function LuaPE_ZONE17_PE01_Say()
	local Phase = ZONE17_PE01_Phase
	local GiveItem = ZONE17_PE01_Var["GiveItem"]
	local Message = ZONE17_PE01_Message	
	
	SetSpeakDetail( OwnerID(), Message[rand(5)+1] )
	if Phase > 0 and Phase < 4 then
		if CountBodyItem( OwnerID(), GiveItem[2] ) == 0 then
			AddSpeakOption( OwnerID(), TargetID(), Message[10], "LuaPE_ZONE17_PE01_get",0) --�V�L�����ήơC	
		end
	end
end

function LuaPE_ZONE17_PE01_get()
	local GiveItem = ZONE17_PE01_Var["GiveItem"]	
	GiveBodyItem( OwnerID(), GiveItem[2], 5 )	
	CloseSpeak( OwnerID() )
end

function LuaPE_ZONE17_PE01_SetPlotCrop()	
	SetPlot( OwnerID(), "TOUCH", "LuaPE_ZONE17_PE01_CropPhase", 20 )
	CallPlot( OwnerID(), "LuaPE_ZONE17_PE01_CropDead", 1 )
end

--==================================================--

--==================================================--
--    �ҰʳB�z��                   				  	--
--==================================================--

function LuaPE_ZONE17_PE01_Reset()
	local Mode = 1
	LuaPE_ZONE17_PE01_Start(1)
end



function LuaPE_ZONE17_PE01_Start( Mode )
	local Temp
	if ZONE17_PE01_Obj ~= nil then
		Temp = ZONE17_PE01_Var["Controller"]
		LuaPE_ZONE17_PE01_DelObj()
	end
	
	LuaPE_ZONE17_PE01_GlobalSet()	-- �@���ܼƳ]�w
	if Mode == nil then
		LuaPE_ZONE17_PE01_PESet()		-- �����ƥ�]�w
	end
	
	local ControllerID = ZONE17_PE01_Var["ControllerID"]
	local RoomID = ZONE17_PE01_Var["RoomID"]
	if ZONE17_PE01_Var["Controller"] == 0 then
		ZONE17_PE01_Var["Controller"] = OwnerID()
	end
	local Controller = LuaPE_ZONE17_PE01_CreaterSet( ControllerID, RoomID )	-- �]�w�����	
	ZONE17_PE01_Var["Controller"] = Controller
	
	BeginPlot( Controller, "LuaPE_ZONE17_PE01_CreateControl", 0 )
	
	if temp ~= nil then
		DelObj( Temp )
	end
end

function LuaPE_ZONE17_PE01_CreateControl()
	local Phase = ZONE17_PE01_Phase
	local CreaterID = ZONE17_PE01_Var["CreaterID"]		-- �ةǱ���
	local ControllerID = ZONE17_PE01_Var["ControllerID"] -- PE����
	local FlagID = ZONE17_PE01_Var["FlagID"]			-- �X�lID
	local RoomID = ZONE17_PE01_Var["RoomID"]
	local Creater = LuaPE_ZONE17_PE01_CreaterSet( CreaterID , RoomID )	-- �]�w�����
	ZONE17_PE01_Var["Creater"] = Creater
	ZONE17_PE01_Obj[1] = Creater	-- �N�ާ@����[�J�Ĥ@��
	
	BeginPlot( Creater, "LuaPE_ZONE17_PE01_create", 0 )
end

function LuaPE_ZONE17_PE01_create()
	local FlagObjID = ZONE17_PE01_Var["FlagID"] --�X�m����s��
	local FlagNum = ZONE17_PE01_Var["FlagNum"] 	--�X�m�ƶq
	local Phase = ZONE17_PE01_Phase 			--���q	
	local CreateTime = ZONE17_PE01_Var["CreateTime"] --���s�ɶ�(��)
	local Range = 30							--�Ͳ��d��
	local Gravity = true 						--���O
	local Move = false							--����
	local ObjNum = math.floor( FlagNum / 4 )	--�شӪ���ƶq
	local Obj									--�شӪ���s��									
	
	if Phase < 2 then
		Obj = ZONE17_PE01_Var["MstID"]		
		ks_CreateObj( FlagObjID, FlagNum, Obj[1], ObjNum, CreateTime, Range, Gravity, Move )
	else
		local create = {}
		Obj = ZONE17_PE01_Var["Crop1ID"]
		for i=0, FlagNum do
			local x = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_X ) 
			local y = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_Y ) 
			local z = GetMoveFlagValue( FlagObjID, i , EM_RoleValue_Z ) 
			create[i] = CreateObj( Obj[1], x, y, z, 0, 1 )
			AddToPartition( create[i], 0 )
			WriteRoleValue( create[i], EM_RoleValue_Register2, i )
			table.insert( ZONE17_PE01_Obj , create[i] )					-- �[�J����޲z�}�C
			WriteRoleValue( create[i], EM_RoleValue_LiveTime, 900 )
		end
	end		
end

--==================================================--

--==================================================--
--		�R������P���ճB�z��						--
--==================================================--

function LuaPE_ZONE17_PE01_DelCreater()
	local Creater = ZONE17_PE01_Var["Creater"]
	DelObj(Creater)--�R���Ͳ����s����
end

function LuaPE_ZONE17_PE01_DelObj()
	local Obj = ZONE17_PE01_Obj
	local ObjNum = table.getn(Obj)
	local count = 0
	local type
	if ObjNum > 0 then
		for i = 1, ObjNum do
			if Obj[i] ~= nil then
				DelObj( Obj[i] )
			end			
		end
	end
end

function LuaPE_ZONE17_PE01_test()
	local Phase = ZONE17_PE01_Phase
	LuaPE_ZONE17_PE01_PhaseDO( Phase )	
end


--==================================================--
function LuaPE_ZONE17_PE01_TimeFly()--�ֳt�������m�ɶ�
	PE_SetVar("ZONE17_PE01_ResetTime", 1);
end
function LuaPE_ZONE17_PE01_Pass1()--�ֳt������1���q
	PE_GivePlayerScore( ZONE17_PE01_PEIndex , OwnerID() , 1000 );
	PE_SetVar("ZONE17_PE01_Var_WeedDead", 40);
end
function LuaPE_ZONE17_PE01_Pass2()--�ֳt������2���q
	PE_GivePlayerScore( ZONE17_PE01_PEIndex , OwnerID() , 1000 );
	PE_SetVar("ZONE17_PE01_Var_MaxFarmerDead", 0);
	ZONE17_PE01_Var["GetCropCar"]=80;
	PE_SetVar("ZONE17_PE01_PH2Time", 1);
end
function LuaPE_ZONE17_PE01_Pass3()--�ֳt������3���q
	PE_GivePlayerScore( ZONE17_PE01_PEIndex , OwnerID() , 1000 );
	PE_SetVar("ZONE17_PE01_Var_MaxFarmerDead", 0);
	ZONE17_PE01_Var["GetCropCar"]=80;
	PE_SetVar("ZONE17_PE01_PH3Time", 1);
end
function LuaPE_ZONE17_PE01_Pass4()--�ֳt�������X�{�e���˼�
	PE_GivePlayerScore( ZONE17_PE01_PEIndex , OwnerID() , 1000 );
	PE_SetVar("ZONE17_PE01_Var_CropLoss", 0);
	ZONE17_PE01_Var["GetCropCar"]=80;
	PE_SetVar("ZONE17_PE01_PH4Time", 1);
end