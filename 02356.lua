function LuaI_206486() --��o�m�J�a��§��
	
	local RoleName = GetName( OwnerID() )

	local itemset = { 11 , ""	, {209620 , 1 } , 	--���m�J�L�� 209620 ���v 11/100
			   22 , ""	, {209621 , 1 } , 	--�_�L�m�J�\�� 209621 ���v 11/100
			   33 , ""	, {209622 , 1 } , 	--�����m�J�ֹ� 209622 ���v 11/100
			   44 , ""	, {209623 , 1 } , 	--�Ȭ`�m�J���x 209623 ���v 11/100
			   55 , ""	, {209624 , 1 } , 	--�ɩ|�m�J���� 209624 ���v 11/100
			   66 , ""	, {209625 , 1 } , 	--��s�m�J�\�� 209625 ���v 11/100
			   77 , ""	, {209626 , 1 } , 	--�����m�J�˻O 209626 ���v 11/100
			   88 , ""	, {209627 , 1 } , 	--�j��m�J���x 209627 ���v 11/100
			   100 , ""	, {209628 , 1 } }	--��N�m�J���x 209628 ���v 12/100

	return BaseTressureProc(   itemset , 1  )	-- 1 = �ݨD�I�]�Ŷ� �A �^�� itemset �B�λݨD�I�]�Ŷ�
end
----------------------------------------------------------------------------------------------------------------------
function LuaI_209550() --�ä[�Ԥ��d���߽c

	local RoleName = GetName( OwnerID() )

	local itemset = { 25 , ""	, {209546 , 1 } ,		--�ä[�Ԥ���d���J 209546 ���v 25/100
			   50 , ""	, {209547 , 1 } ,		--�ä[�Ԥ���d���J 209547 ���v 25/100
			   75 , ""	, {209548 , 1 } ,		--�ä[�Ԥ���d���J 209548 ���v 25/100
			   100 , ""	, {209549 , 1 } }	--�ä[�Ԥ���d���J 209549 ���v 25/100

	return BaseTressureProc(   itemset , 1  )	-- 1 = �ݨD�I�]�Ŷ� �A �^�� itemset �B�λݨD�I�]�Ŷ�
end
-----------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_118157talk() --�K�B�`���ʺ޲z���㫽�D�Ԥ���

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a
	LoadQuestOption( OwnerID()) --Ū�����ȼҪO
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRING_2011EV2_04]", "Lua_ying_spring_story", 0 ) --"�ڷQ�n�A�ѬK�B�`�y���ʭI��"�ﶵ
	AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW01]", "Lua_mika_spring_reward", 0) --�I�����y����	

	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
	if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
		AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRINGFES_NEW09]", "Lua_mika_springfes_changeitem", 0) --�I��[206847]
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_story() --"�ڷQ�n��F�ѬK�B�`�y����"�ﶵ
	
	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_10]" ) --�K�B�`�y���ʭI��1
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_111700_29]", "Lua_ying_spring_story2", 0 ) --"��h�K�B�`�y���ʭI��"�ﶵ
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_spring_118157talk", 0 ) --�^��W�@��
end
-------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_story2() --"��h�K�B�`�y���ʭI��"�ﶵ

	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_3]" ) --�K�B�`�y���ʭI��2 
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_spring_118157talk", 0 ) --�^��W�@��
end
-------------------------------------------------------------------------------------------------------------------------------------------------------