--	Say( OwnerID() , GetName(OwnerID()) )
--	Say( TargetID() , GetName(TargetID()) )
function BuffTower_BuildFX()

end

function BuffTower_CancelFX()

end

function BuildTower( Player , TowerID )
	local Obj = Role:new( Player ) 

	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()

	local NewTower = CreateObj( TowerID , BaseX , BaseY , BaseZ , BaseDir , 1 )

	return NewTower
end

function BuffTower_LV0_01()	-- �ؿv�u�a
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_BUILD_01") , "BuffTower_LV0_01_Build" , 0 )	--�ﶵ�A�ؿv�L�ıj���
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_BUILD_02") , "BuffTower_LV0_02_Build" , 0 )	--�ﶵ�A�ؿv���慨����
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_BUILD_03") , "BuffTower_LV0_03_Build" , 0 )	--�ﶵ�A�ؿv�]���@���
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_BUILD_04") , "BuffTower_LV0_04_Build" , 0 )	--�ﶵ�A�ؿv���֦�����
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_BUILD_05") , "BuffTower_LV0_05_Build" , 0 )	--�ﶵ�A�ؿv���t�ǲ߶�
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_BUILD_06") , "BuffTower_LV0_06_Build" , 0 )	--�ﶵ�A�ؿv���_�B�ն�
end

function BuffTower_LV0_01_Build()	-- �ؿv�L�ıj���
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_01M") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_01_Build_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_01_Build_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_01_Building", 1 )	
end

function BuffTower_LV0_01_Building()
	CastSpell( OwnerID() , OwnerID() , 492019 )	-- �]�I�سy
	local NewTower = BuildTower( OwnerID() , 111631 )
	Sleep( 20 )
	AddToPartition( NewTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV0_01_Cancel()	-- ��L�ıj���
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_01C") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_01_Cancel_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_01_Cancel_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_01_Canceling", 1 )
end

function BuffTower_LV0_01_Canceling()
	CastSpell( OwnerID() , OwnerID() , 492020 )	-- �]�I�
	local CancelTower = BuildTower( OwnerID() , 111630 )
	Sleep( 15 )
	AddToPartition( CancelTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_Build_No()
	CloseSpeak( OwnerID() )	--������ܵ���
end

function BuffTower_LV0_02_Build()	-- �ؿv���慨����
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_02M") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_02_Build_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_02_Build_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_02_Building", 1 )
end

function BuffTower_LV0_02_Building()
	CastSpell( OwnerID() , OwnerID() , 492019 )	-- �]�I�سy
	local NewTower = BuildTower( OwnerID() , 111632 )
	Sleep( 20 )
	AddToPartition( NewTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV0_02_Cancel()	-- ����慨����
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_02C") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_02_Cancel_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_02_Cancel_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_02_Canceling", 1 )
end

function BuffTower_LV0_02_Canceling()
	CastSpell( OwnerID() , OwnerID() , 492020 )	-- �]�I�
	local CancelTower = BuildTower( OwnerID() , 111630 )
	Sleep( 15 )
	AddToPartition( CancelTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV0_03_Build()	-- �ؿv�]���@���
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_03M") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_03_Build_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_03_Build_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_03_Building", 1 )
end

function BuffTower_LV0_03_Building()
	CastSpell( OwnerID() , OwnerID() , 492019 )	-- �]�I�سy
	local NewTower = BuildTower( OwnerID() , 111633 )
	Sleep( 20 )
	AddToPartition( NewTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV0_03_Cancel()	-- ��]���@���
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_03C") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_03_Cancel_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_03_Cancel_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_03_Canceling", 1 )
end

function BuffTower_LV0_03_Canceling()
	CastSpell( OwnerID() , OwnerID() , 492020 )	-- �]�I�
	local CancelTower = BuildTower( OwnerID() , 111630 )
	Sleep( 15 )
	AddToPartition( CancelTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV0_04_Build()	-- �ؿv���֦�����
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_04M") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_04_Build_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_04_Build_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_04_Building", 1 )
end

function BuffTower_LV0_04_Building()
	CastSpell( OwnerID() , OwnerID() , 492019 )	-- �]�I�سy
	local NewTower = BuildTower( OwnerID() , 111634 )
	Sleep( 20 )
	AddToPartition( NewTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV0_04_Cancel()	-- ����֦�����
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_04C") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_04_Cancel_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_04_Cancel_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_04_Canceling", 1 )
end

function BuffTower_LV0_04_Canceling()
	CastSpell( OwnerID() , OwnerID() , 492020 )	-- �]�I�
	local CancelTower = BuildTower( OwnerID() , 111630 )
	Sleep( 15 )
	AddToPartition( CancelTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV0_05_Build()	-- �ؿv���t�ǲ߶�
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_05M") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_05_Build_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_05_Build_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_05_Building", 1 )
end

function BuffTower_LV0_05_Building()
	CastSpell( OwnerID() , OwnerID() , 492019 )	-- �]�I�سy
	local NewTower = BuildTower( OwnerID() , 111635 )
	Sleep( 20 )
	AddToPartition( NewTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV0_05_Cancel()	-- ����t�ǲ߶�
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_05C") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_05_Cancel_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_05_Cancel_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_05_Canceling", 1 )
end

function BuffTower_LV0_05_Canceling()
	CastSpell( OwnerID() , OwnerID() , 492020 )	-- �]�I�
	local CancelTower = BuildTower( OwnerID() , 111630 )
	Sleep( 15 )
	AddToPartition( CancelTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV0_06_Build()	-- �ؿv���_�B�ն�
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_06M") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_06_Build_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_06_Build_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_06_Building", 1 )
end

function BuffTower_LV0_06_Building()
	CastSpell( OwnerID() , OwnerID() , 492019 )	-- �]�I�سy
	local NewTower = BuildTower( OwnerID() , 111636 )
	Sleep( 20 )
	AddToPartition( NewTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV0_06_Cancel()	-- ����_�B�ն�
	SetSpeakDetail( OwnerID() , GetString("SC_BUFFTOWER_BUILD_06C") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_OKAY") , "BuffTower_LV0_06_Cancel_Yes" , 0 )	--�ﶵ�A�T�w
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_CANCEL") , "BuffTower_Build_No" , 0 )		--�ﶵ�A����
end

function BuffTower_LV0_06_Cancel_Yes()
	CloseSpeak( OwnerID() )	--������ܵ���
	BeginPlot( TargetID(), "BuffTower_LV0_06_Canceling", 1 )
end

function BuffTower_LV0_06_Canceling()
	CastSpell( OwnerID() , OwnerID() , 492020 )	-- �]�I�
	local CancelTower = BuildTower( OwnerID() , 111630 )
	Sleep( 15 )
	AddToPartition( CancelTower , 0 )
	DelObj( OwnerID() )
end

function BuffTower_LV1_01()	-- ���z�����B�]�k����
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_01") , "BuffTower_LV1_01_GetBuff" , 0 )	--�ﶵ�A����u�L�ıj��v���W�q���A

	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_01") , "BuffTower_LV1_01_StartE" , 0 )		--�ﶵ�A�}�l�P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_02") , "BuffTower_LV1_01_StopE" , 0 )		--�ﶵ�A����P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_03") , "BuffTower_LV1_01_UP" , 0 )		--�ﶵ�A�ɯųo�ӳ]�I
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_04") , "BuffTower_LV0_01_Cancel" , 0 )		--�ﶵ�A��o�ӳ]�I
end

function BuffTower_LV1_01_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492051 )
end

function BuffTower_LV1_02()	-- ���z���m�B�]�k���m
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_02") , "BuffTower_LV1_02_GetBuff" , 0 )	--�ﶵ�A����u���慨���v���W�q���A

	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_01") , "BuffTower_LV1_02_StartE" , 0 )		--�ﶵ�A�}�l�P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_02") , "BuffTower_LV1_02_StopE" , 0 )		--�ﶵ�A����P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_03") , "BuffTower_LV1_02_UP" , 0 )		--�ﶵ�A�ɯųo�ӳ]�I
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_04") , "BuffTower_LV0_02_Cancel" , 0 )		--�ﶵ�A��o�ӳ]�I
end

function BuffTower_LV1_02_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492052 )
end

function BuffTower_LV1_03()	-- �ͩR�O�B�]�O���̤j��
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_03") , "BuffTower_LV1_03_GetBuff" , 0 )	--�ﶵ�A����u�]���@��v���W�q���A

	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_01") , "BuffTower_LV1_03_StartE" , 0 )		--�ﶵ�A�}�l�P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_02") , "BuffTower_LV1_03_StopE" , 0 )		--�ﶵ�A����P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_03") , "BuffTower_LV1_03_UP" , 0 )		--�ﶵ�A�ɯųo�ӳ]�I
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_04") , "BuffTower_LV0_03_Cancel" , 0 )		--�ﶵ�A��o�ӳ]�I
end

function BuffTower_LV1_03_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492053 )
end

function BuffTower_LV1_04()	-- �g���
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_04") , "BuffTower_LV1_04_GetBuff" , 0 )	--�ﶵ�A����u���֦����v���W�q���A

	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_01") , "BuffTower_LV1_04_StartE" , 0 )		--�ﶵ�A�}�l�P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_02") , "BuffTower_LV1_04_StopE" , 0 )		--�ﶵ�A����P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_03") , "BuffTower_LV1_04_UP" , 0 )		--�ﶵ�A�ɯųo�ӳ]�I
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_04") , "BuffTower_LV0_04_Cancel" , 0 )		--�ﶵ�A��o�ӳ]�I
end

function BuffTower_LV1_04_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492054 )
end

function BuffTower_LV1_05()	-- �ޯ�ǲ߭�
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_05") , "BuffTower_LV1_05_GetBuff" , 0 )	--�ﶵ�A����u���t�ǲߡv���W�q���A

	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_01") , "BuffTower_LV1_05_StartE" , 0 )		--�ﶵ�A�}�l�P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_02") , "BuffTower_LV1_05_StopE" , 0 )		--�ﶵ�A����P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_03") , "BuffTower_LV1_05_UP" , 0 )		--�ﶵ�A�ɯųo�ӳ]�I
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_04") , "BuffTower_LV0_05_Cancel" , 0 )		--�ﶵ�A��o�ӳ]�I
end

function BuffTower_LV1_05_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492055 )
end

function BuffTower_LV1_06()	-- �_���������v
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_06") , "BuffTower_LV1_06_GetBuff" , 0 )	--�ﶵ�A����u���_�B�աv���W�q���A

	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_01") , "BuffTower_LV1_06_StartE" , 0 )		--�ﶵ�A�}�l�P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_02") , "BuffTower_LV1_06_StopE" , 0 )		--�ﶵ�A����P��
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_03") , "BuffTower_LV1_06_UP" , 0 )		--�ﶵ�A�ɯųo�ӳ]�I
	--AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_OP_04") , "BuffTower_LV0_06_Cancel" , 0 )		--�ﶵ�A��o�ӳ]�I
end

function BuffTower_LV1_06_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492056 )
end

function BuffTower_LV2_01()	-- ���z�����B�]�k����
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_01") , "BuffTower_LV2_01_GetBuff" , 0 )	--�ﶵ�A����u�L�ıj��v���W�q���A
end

function BuffTower_LV2_01_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492061 )
end

function BuffTower_LV2_02()	-- ���z���m�B�]�k���m
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_02") , "BuffTower_LV2_02_GetBuff" , 0 )	--�ﶵ�A����u���慨���v���W�q���A
end

function BuffTower_LV2_02_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492062 )
end

function BuffTower_LV2_03()	-- �ͩR�O�B�]�O���̤j��
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_03") , "BuffTower_LV2_03_GetBuff" , 0 )	--�ﶵ�A����u�]���@��v���W�q���A
end

function BuffTower_LV2_03_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492063 )
end

function BuffTower_LV2_04()	-- �g���
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_04") , "BuffTower_LV2_04_GetBuff" , 0 )	--�ﶵ�A����u���֦����v���W�q���A
end

function BuffTower_LV2_04_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492064 )
end

function BuffTower_LV2_05()	-- �ޯ�ǲ߭�
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_05") , "BuffTower_LV2_05_GetBuff" , 0 )	--�ﶵ�A����u���t�ǲߡv���W�q���A
end

function BuffTower_LV2_05_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492065 )
end

function BuffTower_LV2_06()	-- �_���������v
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_06") , "BuffTower_LV2_06_GetBuff" , 0 )	--�ﶵ�A����u���_�B�աv���W�q���A
end

function BuffTower_LV2_06_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492066 )
end

function BuffTower_LV3_01()	-- ���z�����B�]�k����
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_01") , "BuffTower_LV3_01_GetBuff" , 0 )	--�ﶵ�A����u�L�ıj��v���W�q���A
end

function BuffTower_LV3_01_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492071 )
end

function BuffTower_LV3_02()	-- ���z���m�B�]�k���m
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_02") , "BuffTower_LV3_02_GetBuff" , 0 )	--�ﶵ�A����u���慨���v���W�q���A
end

function BuffTower_LV3_02_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492072 )
end

function BuffTower_LV3_03()	-- �ͩR�O�B�]�O���̤j��
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_03") , "BuffTower_LV3_03_GetBuff" , 0 )	--�ﶵ�A����u�]���@��v���W�q���A
end

function BuffTower_LV3_03_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492073 )
end

function BuffTower_LV3_04()	-- �g���
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_04") , "BuffTower_LV3_04_GetBuff" , 0 )	--�ﶵ�A����u���֦����v���W�q���A
end

function BuffTower_LV3_04_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492074 )
end

function BuffTower_LV3_05()	-- �ޯ�ǲ߭�
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_05") , "BuffTower_LV3_05_GetBuff" , 0 )	--�ﶵ�A����u���t�ǲߡv���W�q���A
end

function BuffTower_LV3_05_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492075 )
end

function BuffTower_LV3_06()	-- �_���������v
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_06") , "BuffTower_LV3_06_GetBuff" , 0 )	--�ﶵ�A����u���_�B�աv���W�q���A
end

function BuffTower_LV3_06_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492076 )
end

function BuffTower_LV4_01()	-- ���z�����B�]�k����
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_01") , "BuffTower_LV4_01_GetBuff" , 0 )	--�ﶵ�A����u�L�ıj��v���W�q���A
end

function BuffTower_LV4_01_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492081 )
end

function BuffTower_LV4_02()	-- ���z���m�B�]�k���m
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_02") , "BuffTower_LV4_02_GetBuff" , 0 )	--�ﶵ�A����u���慨���v���W�q���A
end

function BuffTower_LV4_02_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492082 )
end

function BuffTower_LV4_03()	-- �ͩR�O�B�]�O���̤j��
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_03") , "BuffTower_LV4_03_GetBuff" , 0 )	--�ﶵ�A����u�]���@��v���W�q���A
end

function BuffTower_LV4_03_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492083 )
end

function BuffTower_LV4_04()	-- �g���
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_04") , "BuffTower_LV4_04_GetBuff" , 0 )	--�ﶵ�A����u���֦����v���W�q���A
end

function BuffTower_LV4_04_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492084 )
end

function BuffTower_LV4_05()	-- �ޯ�ǲ߭�
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_05") , "BuffTower_LV4_05_GetBuff" , 0 )	--�ﶵ�A����u���t�ǲߡv���W�q���A
end

function BuffTower_LV4_05_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492085 )
end

function BuffTower_LV4_06()	-- �_���������v
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_06") , "BuffTower_LV4_06_GetBuff" , 0 )	--�ﶵ�A����u���_�B�աv���W�q���A
end

function BuffTower_LV4_06_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492086 )
end


function BuffTower_LV5_01()	-- ���z�����B�]�k����
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_01") , "BuffTower_LV5_01_GetBuff" , 0 )	--�ﶵ�A����u�L�ıj��v���W�q���A
end

function BuffTower_LV5_01_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492091 )
end

function BuffTower_LV5_02()	-- ���z���m�B�]�k���m
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_02") , "BuffTower_LV5_02_GetBuff" , 0 )	--�ﶵ�A����u���慨���v���W�q���A
end

function BuffTower_LV5_02_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492092 )
end

function BuffTower_LV5_03()	-- �ͩR�O�B�]�O���̤j��
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_03") , "BuffTower_LV5_03_GetBuff" , 0 )	--�ﶵ�A����u�]���@��v���W�q���A
end

function BuffTower_LV5_03_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492093 )
end

function BuffTower_LV5_04()	-- �g���
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_04") , "BuffTower_LV5_04_GetBuff" , 0 )	--�ﶵ�A����u���֦����v���W�q���A
end

function BuffTower_LV5_04_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492094 )
end

function BuffTower_LV5_05()	-- �ޯ�ǲ߭�
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_05") , "BuffTower_LV5_05_GetBuff" , 0 )	--�ﶵ�A����u���t�ǲߡv���W�q���A
end

function BuffTower_LV5_05_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492095 )
end

function BuffTower_LV5_06()	-- �_���������v
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_06") , "BuffTower_LV5_06_GetBuff" , 0 )	--�ﶵ�A����u���_�B�աv���W�q���A
end

function BuffTower_LV5_06_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492096 )
end

function BuffTower_LV6_01()	-- ���z�����B�]�k����
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_01") , "BuffTower_LV6_01_GetBuff" , 0 )	--�ﶵ�A����u�L�ıj��v���W�q���A
end

function BuffTower_LV6_01_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492101 )
end

function BuffTower_LV6_02()	-- ���z���m�B�]�k���m
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_02") , "BuffTower_LV6_02_GetBuff" , 0 )	--�ﶵ�A����u���慨���v���W�q���A
end

function BuffTower_LV6_02_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492102 )
end

function BuffTower_LV6_03()	-- �ͩR�O�B�]�O���̤j��
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_03") , "BuffTower_LV6_03_GetBuff" , 0 )	--�ﶵ�A����u�]���@��v���W�q���A
end

function BuffTower_LV6_03_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492103 )
end

function BuffTower_LV6_04()	-- �g���
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_04") , "BuffTower_LV6_04_GetBuff" , 0 )	--�ﶵ�A����u���֦����v���W�q���A
end

function BuffTower_LV6_04_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492104 )
end

function BuffTower_LV6_05()	-- �ޯ�ǲ߭�
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_05") , "BuffTower_LV6_05_GetBuff" , 0 )	--�ﶵ�A����u���t�ǲߡv���W�q���A
end

function BuffTower_LV6_05_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492105 )
end

function BuffTower_LV6_06()	-- �_���������v
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_06") , "BuffTower_LV6_06_GetBuff" , 0 )	--�ﶵ�A����u���_�B�աv���W�q���A
end

function BuffTower_LV6_06_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492106 )
end

function BuffTower_LV7_01()	-- ���z�����B�]�k����
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_01") , "BuffTower_LV7_01_GetBuff" , 0 )	--�ﶵ�A����u�L�ıj��v���W�q���A
end

function BuffTower_LV7_01_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492111 )
end

function BuffTower_LV7_02()	-- ���z���m�B�]�k���m
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_02") , "BuffTower_LV7_02_GetBuff" , 0 )	--�ﶵ�A����u���慨���v���W�q���A
end

function BuffTower_LV7_02_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492112 )
end

function BuffTower_LV7_03()	-- �ͩR�O�B�]�O���̤j��
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_03") , "BuffTower_LV7_03_GetBuff" , 0 )	--�ﶵ�A����u�]���@��v���W�q���A
end

function BuffTower_LV7_03_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492113 )
end

function BuffTower_LV7_04()	-- �g���
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_04") , "BuffTower_LV7_04_GetBuff" , 0 )	--�ﶵ�A����u���֦����v���W�q���A
end

function BuffTower_LV7_04_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492114 )
end

function BuffTower_LV7_05()	-- �ޯ�ǲ߭�
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_05") , "BuffTower_LV7_05_GetBuff" , 0 )	--�ﶵ�A����u���t�ǲߡv���W�q���A
end

function BuffTower_LV7_05_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492115 )
end

function BuffTower_LV7_06()	-- �_���������v
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_06") , "BuffTower_LV7_06_GetBuff" , 0 )	--�ﶵ�A����u���_�B�աv���W�q���A
end

function BuffTower_LV7_06_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492116 )
end

function BuffTower_LV8_01()	-- ���z�����B�]�k����
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_01") , "BuffTower_LV8_01_GetBuff" , 0 )	--�ﶵ�A����u�L�ıj��v���W�q���A
end

function BuffTower_LV8_01_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492121 )
end

function BuffTower_LV8_02()	-- ���z���m�B�]�k���m
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_02") , "BuffTower_LV8_02_GetBuff" , 0 )	--�ﶵ�A����u���慨���v���W�q���A
end

function BuffTower_LV8_02_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492122 )
end

function BuffTower_LV8_03()	-- �ͩR�O�B�]�O���̤j��
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_03") , "BuffTower_LV8_03_GetBuff" , 0 )	--�ﶵ�A����u�]���@��v���W�q���A
end

function BuffTower_LV8_03_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492123 )
end

function BuffTower_LV8_04()	-- �g���
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_04") , "BuffTower_LV8_04_GetBuff" , 0 )	--�ﶵ�A����u���֦����v���W�q���A
end

function BuffTower_LV8_04_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492124 )
end

function BuffTower_LV8_05()	-- �ޯ�ǲ߭�
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_05") , "BuffTower_LV8_05_GetBuff" , 0 )	--�ﶵ�A����u���t�ǲߡv���W�q���A
end

function BuffTower_LV8_05_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492125 )
end

function BuffTower_LV8_06()	-- �_���������v
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_06") , "BuffTower_LV8_06_GetBuff" , 0 )	--�ﶵ�A����u���_�B�աv���W�q���A
end

function BuffTower_LV8_06_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492126 )
end

function BuffTower_LV9_01()	-- ���z�����B�]�k����
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_01") , "BuffTower_LV9_01_GetBuff" , 0 )	--�ﶵ�A����u�L�ıj��v���W�q���A
end

function BuffTower_LV9_01_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492131 )
end

function BuffTower_LV9_02()	-- ���z���m�B�]�k���m
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_02") , "BuffTower_LV9_02_GetBuff" , 0 )	--�ﶵ�A����u���慨���v���W�q���A
end

function BuffTower_LV9_02_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492132 )
end

function BuffTower_LV9_03()	-- �ͩR�O�B�]�O���̤j��
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_03") , "BuffTower_LV9_03_GetBuff" , 0 )	--�ﶵ�A����u�]���@��v���W�q���A
end

function BuffTower_LV9_03_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492133 )
end

function BuffTower_LV9_04()	-- �g���
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_04") , "BuffTower_LV9_04_GetBuff" , 0 )	--�ﶵ�A����u���֦����v���W�q���A
end

function BuffTower_LV9_04_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492134 )
end

function BuffTower_LV9_05()	-- �ޯ�ǲ߭�
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_05") , "BuffTower_LV9_05_GetBuff" , 0 )	--�ﶵ�A����u���t�ǲߡv���W�q���A
end

function BuffTower_LV9_05_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492135 )
end

function BuffTower_LV9_06()	-- �_���������v
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_06") , "BuffTower_LV9_06_GetBuff" , 0 )	--�ﶵ�A����u���_�B�աv���W�q���A
end

function BuffTower_LV9_06_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492136 )
end

function BuffTower_LV10_01()	-- ���z�����B�]�k����
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_01") , "BuffTower_LV10_01_GetBuff" , 0 )	--�ﶵ�A����u�L�ıj��v���W�q���A
end

function BuffTower_LV10_01_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492141 )
end

function BuffTower_LV10_02()	-- ���z���m�B�]�k���m
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_02") , "BuffTower_LV10_02_GetBuff" , 0 )	--�ﶵ�A����u���慨���v���W�q���A
end

function BuffTower_LV10_02_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492142 )
end

function BuffTower_LV10_03()	-- �ͩR�O�B�]�O���̤j��
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_03") , "BuffTower_LV10_03_GetBuff" , 0 )	--�ﶵ�A����u�]���@��v���W�q���A
end

function BuffTower_LV10_03_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492143 )
end

function BuffTower_LV10_04()	-- �g���
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_04") , "BuffTower_LV10_04_GetBuff" , 0 )	--�ﶵ�A����u���֦����v���W�q���A
end

function BuffTower_LV10_04_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492144 )
end

function BuffTower_LV10_05()	-- �ޯ�ǲ߭�
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_05") , "BuffTower_LV10_05_GetBuff" , 0 )	--�ﶵ�A����u���t�ǲߡv���W�q���A
end

function BuffTower_LV10_05_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492145 )
end

function BuffTower_LV10_06()	-- �_���������v
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID() , GetString("SC_BUFFTOWER_06") , "BuffTower_LV10_06_GetBuff" , 0 )	--�ﶵ�A����u���_�B�աv���W�q���A
end

function BuffTower_LV10_06_GetBuff()
	CloseSpeak( OwnerID() )	--������ܵ���
	CastSpell( TargetID() , OwnerID() , 492146 )
end
