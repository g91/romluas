--�D�u3--
------------------------------423564���ۧ���------------------------------------
--/GM ? createflag 780746 1
--���Ƚs��:423564
--���ű�l�s��: 116352          �X�нs��:544393   ����BUFF:507178
--116350�u����:        ���F�����٤��|�X�{  �t�����~�X�{
--116351�̱Z�g:       ���F�����٤��|�X�{   �t�����~�X�{


--�t�X���t��
--116349����:       �t�X�X�l: 780746 �s�� 1��   
--116353�̱Z�g:       �t�X�X�l: 780746 �s�� 2��
--116354�F�d��:       �t�X�X�l: 780746  �s��3 ��   ��4���[�k�N�S��
--116216�w�U�J:       �t�X�X�l: 780746  �s��5��   ��6���[�k�N�S��
--116355�ä�:           �t�X�X�l: 780746  �s��7��   ��8��
--116356�¬��d:       �t�X�X�l:780746   �s��9��   ����
--116348�w�U�J���p�L    �X�l:780746   �s��10   11   12    13    14    ��
function LuaS_423564()			--���b116281����NPC�����~�U
	SetPlot( OwnerID(), "range","LuaS_423564_1", 250 )
end

function LuaS_423564_1()--  OwnerID�O���a  �t�X�@�����i�b���a���W����
	if	CheckAcceptQuest( OwnerID() ,423564 ) == true	and 	CheckFlag( OwnerID() , 544393 ) == false and CheckBuff( OwnerID(), 507178 ) == false and
		ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( TargetID(),EM_RoleValue_Register1, 1 )	--��NPC��
		BeginPlot( TargetID(), "LuaS_423564_2", 0 )
	elseif
		CheckAcceptQuest( OwnerID() ,423564 ) == true	and 	CheckFlag( OwnerID() , 544393 ) == false and CheckBuff( OwnerID(), 507178 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423564_0]" , "0xFFFFFF00"  ) --�i�D���a�A�����a�����A��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423564_0]" , "0xFFFFFF00"  )
	end	
end

function LuaS_423564_2()
	while true do							--�`�N �o�O�j��
		local O_ID = OwnerID()				--���bNPC���W���t���@��
		local QuestID = 423564				--���Ƚs��
		local FinishFlagID = 544393			--����������o���X��
		local CheckBuffID = 507178			--�ˬd�O�_���b�t����BUFF
		local CheckRange = 200				--�t�����ˬd�d��
		local DoScript = "Lua_423564_break"	--��@�������Ϊ̨S�H�b�����ɧ@���B�z	
		
		local tony = Lua_DW_CreateObj("flag" ,116349,780746,1)	--�N�����b��1�ںX�l�W�إX�� �ëŧi
		local icl = Lua_DW_CreateObj("flag" ,116353,780746,2)	--�N�̱Z�g�b��2�ںX�l�W�إX�� �ëŧi
		local SK = Lua_DW_CreateObj("flag" ,116354,780746,3)	--�N�F�d�ڦb��3�ںX�l�W�إX�� �ëŧi     
		local DK = Lua_DW_CreateObj("flag" ,116216,780746,5)	--�N�w�U�J�b��5�ںX�l�W�إX�� �ëŧi
		local ih = Lua_DW_CreateObj("flag" ,116355,780746,7)	--�N�ä��b��7�ںX�l�W�إX�� �ëŧi
		local BK =Lua_DW_CreateObj("flag" ,116356,780746,9)		--�N�¬��d�b��9�ںX�l�W�إX��
		local D1 =Lua_DW_CreateObj("flag" ,116348,780746,10)	--�N�p�L�b��10�ںX�l�W�إX��
		local D2 =Lua_DW_CreateObj("flag" ,116348,780746,11)	--�N�p�L�b��11�ںX�l�W�إX��
		local D3 =Lua_DW_CreateObj("flag" ,116348,780746,12)	--�N�p�L�b��12�ںX�l�W�إX��
		local D4 =Lua_DW_CreateObj("flag" ,116348,780746,13)	--�N�p�L�b��13�ںX�l�W�إX��
		local D5 =Lua_DW_CreateObj("flag" ,116348,780746,14)	--�N�p�L�b��14�ںX�l�W�إX��
		
		local Obj = {}
		table.insert( Obj, tony)
		table.insert( Obj, icl)
		table.insert( Obj, SK)
		table.insert( Obj, DK)
		table.insert( Obj, ih)
		table.insert( Obj, BK )
		table.insert( Obj, D1 )
		table.insert( Obj, D2 )
		table.insert( Obj, D3)
		table.insert( Obj, D4 )
		table.insert( Obj, D5 )


		for i=1, table.getn(Obj) do
			ks_ActSetMode(Obj[i])
		end
		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--�d������Ϊ��ˬd�禡
		Sleep(10)
		--�t����
		for i=1, table.getn(Obj) do
			if Obj[i] ~= SK then
				AdjustFaceDir ( Obj[i], SK ,0 )
			end
		end
		Sleep(5)
		Say(tony,"[SC_423564_1]")	--����:�F�d�ڡA�A�ĵ��]�ڡA���`�ۤv������A�ٱN�L�̰������w
		PlayMotion ( tony, ruFUSION_ACTORSTATE_DEBUFF_INSTANT )
		Sleep(40)
		Say( tony , "[SC_423564_2]")	--����:�A�i�{�o?
		PlayMotion ( tony, ruFUSION_ACTORSTATE_EMOTE_POINT )
		Sleep(20)
		Say( DK , "[SC_423564_3]")	--�w�U�J:�o���b�A�ڲ{�b�n�n�n���M�A�M��@�U
		PlayMotion ( DK, ruFUSION_ACTORSTATE_ATTACK_1H )
		Sleep(40)
		Say( SK , "[SC_423564_4]")	--�F�d��:�����ѱF�I
		PlayMotion ( SK, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
		Sleep(40)
		Say( DK , "[SC_423564_5]") --�w�U�J:�L�w�I�ӧa�A�ݬݧA���ޭp�O�_�ٷ|���h�~�e�@�˦��\�I
		PlayMotion ( DK, ruFUSION_ACTORSTATE_BUFF_SP01 )
		Sleep(20)
		CastSpell( SK , SK, 491276 )
		Sleep(10)
		Say( SK , "[SC_423564_6]") --�F�d��:�A�̴N���ۤH���p���~�򪱵ۤp�k�Ī���a�a�s�a�I
		AddBuff( SK, 506984, 3, -1 )	
		WriteRoleValue( SK, EM_RoleValue_IsWalk, 0 )
		Sleep(10)
		for i=1, table.getn(Obj) do
			if Obj[i] ~= SK or Obj[i] ~= DK then
				PlayMotion( Obj[i], ruFUSION_ACTORSTATE_CROUCH_BEGIN )--�ۤU
			end
		end
		Say( tony , "[SC_423564_11]")
		Say( icl , "[SC_423564_12]")
		CallPlot( O_ID, "LuaS_423564_GO1", DK )
		DW_MoveToFlag(SK,780746 , 4 ,0 ,1) --3���X��4����
		Sleep(15)
		for i=1, table.getn(Obj) do
			if Obj[i] ~= SK or Obj[i] ~= DK then
				PlayMotion( Obj[i], ruFUSION_ACTORSTATE_CROUCH_END )--�_��
			end
		end
		delobj(SK)
		LuaS_423564_GO2(ih,BK)
		Sleep(10)
		for i=1, table.getn(Obj) do
			if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == 116348 then
				AdjustFaceDir ( Obj[i], SK ,0 )
				Say( Obj[i], "[SC_423564_10]")
				CastSpell( Obj[i] , Obj[i], 494222 )	
			end
		end
		Sleep(15)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --���t���F �����X��
		break								--�b�̫᭱�O�o�[break���_
	end
end
	
function LuaS_423564_GO1( DK)  
	WriteRoleValue( DK, EM_RoleValue_IsWalk, 0 )
	Say( DK , "[SC_423564_7]") --�w�U�J:�A�k���F���I
	--CallPlot( DK, "LuaS_423564_GO2",ih)
	--CastSpell( DK , DK , 490147 )		
	Sleep(10)
	DW_MoveToFlag(DK,780746 , 6 ,0 ,1) --5���X��6����
	delobj(DK)	
end

function LuaS_423564_GO2(ih,BK)
	WriteRoleValue( ih, EM_RoleValue_IsWalk, 0 )
	Sleep(5)
	Say( ih , "[SC_423564_8]") --�ä�:���ˡI
	CallPlot( ih, "LuaS_423564_GO3",BK)
	DW_MoveToFlag(ih,780746 , 8 ,0 ,1) --7���X��8����
	delobj(ih)
end
	
function LuaS_423564_GO3(BK)
	Sleep(20)
	WriteRoleValue( BK, EM_RoleValue_IsWalk, 0 )
	Say( BK , "[SC_423564_9]") --�¬��d:�i�c�A�j�a�ְl�W�h�O�@�N�x�I
	DW_MoveToFlag(BK,780746 , 15 ,0 ,1) --9���X��15����
	delobj(BK)
end

function Lua_423564_break()					--�o�q�����_/�����ɭn�@���Ʊ�
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116349, 300, 0 )--�j�M����ѥ[��NPC�t��
	local icl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116353, 300, 0 )
	local SK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116354, 300, 0 )
	local DK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116216, 300, 0 )
	local ih = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116355, 300, 0 )
	local BK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116356, 300, 0 )
	local D1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116348, 300, 0 )
	
	if tony ~= nil then delobj(tony) end							--�p�G�s�b �h�R��
	if icl ~= nil then delobj(icl) end
	if SK ~= nil then delobj(SK) end
	if DK ~= nil then delobj(DK) end
	if ih ~= nil then delobj(ih) end
	if BK ~= nil then delobj(BK) end
	if D1 ~= nil then 
		for i=0, table.getn(D1) do
			delobj(D1[i]) end
		end
	local obj = ks_resetObj( OwnerID(), nil )									--�D�`���n �R�������t���@����NPC �@���m
	ks_SetController( obj )--�]�w���α����
end

function Lua_CROUCH_DOWN()
	PlayMotion( TargetID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )
end

function Lua_CROUCH_UP()
	PlayMotion( TargetID(), ruFUSION_ACTORSTATE_CROUCH_END )
end

function Lua_CROUCH_CHECK()
	if TargetID() == OwnerID() then		
		return false
	end
end

--------------------------------------------------------------------------------------------------------
---------------------------423567����L��-------------------------------

--/GM ? createflag 780746 20  �q20�}�l
--���Ƚs��:423567
--�X�нs��:544403           ����BUFF:507544

--�t�X���t��   
--116377�������H
--116378�̱Z�g���H
--116268��R����   
--116361��R����U 

function LuaS_423567()	--���b116375�������W
	if CheckAcceptQuest( OwnerID(), 423567 ) == true and CheckFlag( OwnerID(), 544403 ) == false and ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) > 0 then
		--�P�_������  �S���X��  �åB��NPC���L��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423567_03]", "Lua_423567_0",0) --�ڷǳƦn�F	
	elseif CheckAcceptQuest( OwnerID(), 423567 ) == true and CheckFlag( OwnerID(), 544403 ) == false then 
		--�_�h�i��ĤG�P�_  ������ �S���X�� �ø�NPC�����L��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_423567_03]", "Lua_423567_1",0) --�ڷǳƦn�F�C
	else
		LoadQuestOption( OwnerID() )	--�p�G�����o�ӡA��NPC��L���ȱN���|�Q���a�ݨ�
	end
end
function Lua_423567_0()
	SetSpeakDetail( OwnerID(), "[SC_423567_02]" ) --�����S��:�����A�{�b����A�e���٦��@�ǼĤH�A���L�����}�a
end

function Lua_423567_1()
	SetSpeakDetail(OwnerID(),"[SC_423567_01]") --�ǳƦn�F�ܡH���ڭ̫e�i�a�C
	CloseSpeak( OwnerID() )	--�����Ҧ���ܵ���
	WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )	--��NPC�ܦ��L
	BeginPlot( TargetID(), "Lua_423567_2", 0 )	--�I�s�U�@�q�禡
end

function Lua_423567_2()
	while true do							--�`�N �o�O�j�� �N�۰ʤWBUFF �۰ʧP�_���a���L���}�@���d��
		local O_ID = OwnerID()				--���bNPC���W���t���@��
		local QuestID = 423567				--���Ƚs�� (�u�n��ʦ��s��)
		local FinishFlagID = 544403			--����������o���X��	(�u�n��ʦ��s��)
		local CheckBuffID = 507544			--�ˬd�O�_���b�t����BUFF(�u�n��ʦ��s��) 507178���t��BUFF 503977���ɦ�BUFF
		local CheckRange = 150				--�t�����ˬd�d��(�u�n��ʦ��d��)
		local DoScript = "Lua_544403_break"	--��@�������Ϊ̨S�H�b�����ɧ@���B�z	(423519�n�אּ�ۤv�����Ƚs��)
				
		--�t����
		local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116375, 120, 0 )	--�ŧi�j�M�쪺�u������tony
		tony = LuaFunc_CreateObjByObj ( 116377 , tony ) --�åBtony����������H�A�æbtony����m�W�إX116207�o�Ӵ������H
		local icl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116376, 120, 0 )	--�ŧi�j�M�쪺�u�̱Z�g��icl
		icl = LuaFunc_CreateObjByObj ( 116378 , icl ) --�åBicl����̱Z�g���H�A�æbicl����m�W�إX116378�o�Ө̱Z�g���H
		Sleep(10)
		local an = Lua_DW_CreateObj("flag" ,116268,780746,20)	--�N116268����b780746����20�ںX�l�W�إX�� �ëŧi��an
		ks_ActSetMode( tony )	--�t���M�Ψ禡  ���H�]��(�������ʼ@�� �O���������A �L�k����'����'����'�I��'���æ��'��ܦW��)
		ks_ActSetMode( icl )
		ks_ActSetMode( an )
		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--�d������Ϊ��ˬd�禡(�n�[�J �I���ˬd�禡)
		Sleep(10)
		yell(icl,"[SC_423567_11]",2)
		Sleep(3)
		AdjustFaceDir ( an, tony ,0 ) --��A����B
		DW_MoveToFlag(an,780746 , 22 ,0 ,1) 
				AdjustFaceDir ( tony, an ,0 )
		AdjustFaceDir ( icl, an ,0 )
		yell(an,"[SC_423567_0]",2)	
		PlayMotion ( an, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(20)
		yell(tony,"[SC_423567_1]",2)
		Sleep(20)
		yell(an,"[SC_423567_2]",2)	
		Sleep(20)
		yell(icl,"[SC_423567_3]",2)
		Sleep(20)
		yell(an,"[SC_423567_4]",2)	
		PlayMotion ( an, ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
		Sleep(20)
		yell(tony,"[SC_423567_5]",2)
		PlayMotion ( tony, ruFUSION_ACTORSTATE_EMOTE_POINT )
		PlayMotion ( an, ruFUSION_ACTORSTATE_EMOTE_POINT )
		Sleep(30)
		yell(an,"[SC_423567_6]",2)	
		PlayMotion ( an, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		local ang = Lua_DW_CreateObj("flag" ,116361,780746,21)--��R���Ȫ����w��U
		CastSpell( an , ang , 494395 )--���ۤv�[�W�k�N�S��
		ks_ActSetMode( ang )
		Sleep(20)
		AdjustFaceDir ( ang, tony ,0 )
		Sleep(3)
		WriteRoleValue( ang, EM_RoleValue_IsWalk, 0 )	--�ϻ��w�ܦ��]�B
		Sleep(3)
		--AddBuff( ang, 506984, 2, -1 )
		DW_MoveToFlag(ang,780746 , 23 ,0 ,1)
		SysCastSpellLv(ang,ang,495769,1)---�I��k�N�A�L�I�k�ʧ@�ASysCastSpellLv(�I�k���H,�ؼ�,�k�N�N��,�k�N����)
		CallPlot( OwnerID(), "LuaS_423567_GO1", icl,tony )
		Sleep(20)
		delobj(icl)
		delobj(ang)
		Sleep(30)
		yell(tony,"[SC_423567_8]",2)
		Sleep(5)
		yell(an,"[SC_423567_9]",2)	
		Sleep(20)
		yell(an,"[SC_423567_10]",2)
		CastSpell( an , an , 495735 )
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --���t���F �۰ʵ����X��(�n�[�J �I���禡)
		break								--�b�̫᭱�O�o�[break���_
	end
end
function LuaS_423567_GO1( icl,tony)  
	WriteRoleValue( icl, EM_RoleValue_IsWalk, 0 )
	PlayMotion( tony,ruFUSION_ACTORSTATE_DODGE )
	Sleep(3)
	AddBuff( icl, 506984, 3, -1 )
	Say(icl,"[SC_423567_7]")
	DW_MoveToFlag(icl,780746 , 24 ,0 ,1)
	Sleep(3)
	Say(tony,"[SC_423567_12]")
	PlayMotion( tony,ruFUSION_ACTORSTATE_KNOCKDOWN_RECOVER )
	Sleep(10)
end

function Lua_544403_break()					--�o�q�����_/�����ɭn�@���Ʊ�(�ݭn���禡���U�P�_)(423519�n�אּ�ۤv�����Ƚs��)
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116377, 350, 0 )--�j�M����ѥ[��NPC�t��
	local icl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116378, 350, 0 )
	local an = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116268, 350, 0 )
	local ang = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116361, 350, 0 )
	
	if tony ~= nil then delobj(tony) end							--�p�G�s�b �h�R��
	if icl ~= nil then delobj(icl) end
	if an ~= nil then delobj(an) end
	if ang ~= nil then delobj(ang) end
	
	ks_resetObj( OwnerID(), nil )
end

--------------------------------------------------------------------------------

---------------------------423568�^���A��----------------------------------
--/GM ? createflag 780746
--���Ƚs��:423568
--���ű�l�s��:116362           �X�нs��:544402   ����BUFF:507178

--116164�u����:�t�������~�|�X�{

--�t�X���t��   �q25�}�l
--116354 �F�d��:       �t�X�X�l:   �s�� 25��  --31--34--36
--116359 ���w��:      �X�l    �s�� 26--39--46
--116356 �¬��d:       �t�X�X�l:   �s�� 27--38--47
--116349 ����:       �t�X�X�l:  �s�� 28--33
--116216 �w�U�J:       �t�X�X�l:   �s�� 29--32--35
--116355 �ä�:           �t�X�X�l:   �s�� 30--37--45

--116348 �w�L����    �X�l:   �s�� 40  41  42  43 
--116360 �G���h�L  �X�l:    �s�� 50  51  52  
--116358 �F�L����   �X�l:  �s�� 60  61  62  63 64 65 66 67 68 69

function LuaS_423568()			--���b116362����NPC�����~�U
	SetPlot( OwnerID(), "range","LuaS_423568_1", 150 )
end

function LuaS_423568_1()--  OwnerID�O���a  �t�X�@�����i�b���a���W����
	if	CheckAcceptQuest( OwnerID() ,423568 ) == true	and 	CheckFlag( OwnerID() , 544402 ) == false and CheckBuff( OwnerID(), 507178 ) == false and 
		ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( TargetID(),EM_RoleValue_Register1, 1 )	--��NPC��
		BeginPlot( TargetID(), "LuaS_423568_2", 0 )
	elseif
		CheckAcceptQuest( OwnerID() ,423568 ) == true	and 	CheckFlag( OwnerID() , 544402 ) == false and CheckBuff( OwnerID(), 507178 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423568_0]" , "0xFFFFFF00"  ) --�i�D���a�A�����a�����A��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423568_0]" , "0xFFFFFF00"  )
	end	
end

function LuaS_423568_2()
	while true do							--�`�N �o�O�j��
		local O_ID = OwnerID()				--���bNPC���W���t���@��
		local QuestID = 423568				--���Ƚs��
		local FinishFlagID = 544402			--����������o���X��
		local CheckBuffID = 507178			--�ˬd�O�_���b�t����BUFF
		local CheckRange = 250				--�t�����ˬd�d��
		local DoScript = "Lua_423568_break"	--��@�������Ϊ̨S�H�b�����ɧ@���B�z	
		
	--�t���i��--
		local SK = Lua_DW_CreateObj("flag" ,116354,780746,25)--�F�d��
		local PD = Lua_DW_CreateObj("flag" ,116359,780746,26)--���w��
		local BK = Lua_DW_CreateObj("flag" ,116356,780746,27)	--�N�¬��d
		local tony = Lua_DW_CreateObj("flag" ,116349,780746,28)--����
		local DK = Lua_DW_CreateObj("flag" ,116216,780746,29)--�w��J
		local ih = Lua_DW_CreateObj("flag" ,116355,780746,30)--�ä�
		
		local DB1 = Lua_DW_CreateObj("flag" ,116348,780746,40, 0)--�w�L
		local DB2 = Lua_DW_CreateObj("flag" ,116348,780746,41, 0)--�w�L
		local DB3 = Lua_DW_CreateObj("flag" ,116348,780746,42, 0)--�w�L
		local DB4 = Lua_DW_CreateObj("flag" ,116348,780746,43, 0)--�w�L
		
		local FB1 = Lua_DW_CreateObj("flag" ,116360,780746,50, 0)--�G�L
		local FB2 = Lua_DW_CreateObj("flag" ,116360,780746,51, 0)--�G�L
		local FB3 = Lua_DW_CreateObj("flag" ,116360,780746,52, 0)--�G�L
		
		local SB1 = Lua_DW_CreateObj("flag" ,116358,780746,60, 0)--�F�L
		local SB2 = Lua_DW_CreateObj("flag" ,116358,780746,61, 0)--�F�L
		local SB3 = Lua_DW_CreateObj("flag" ,116358,780746,62, 0)--�F�L
		local SB4 = Lua_DW_CreateObj("flag" ,116358,780746,63, 0)--�F�L
		local SB5 = Lua_DW_CreateObj("flag" ,116358,780746,64, 0)--�F�L
		local SB6 = Lua_DW_CreateObj("flag" ,116358,780746,65, 0)--�F�L
		local SB7 = Lua_DW_CreateObj("flag" ,116358,780746,66, 0)--�F�L
		local SB8 = Lua_DW_CreateObj("flag" ,116358,780746,67, 0)--�F�L
		local SB9 = Lua_DW_CreateObj("flag" ,116358,780746,68, 0)--�F�L

		SetDefIdleMotion(DB1,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(DB2,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(DB3,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(DB4,ruFUSION_MIME_DEATH_LOOP)
		
		SetDefIdleMotion(FB1,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(FB2,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(FB3,ruFUSION_MIME_DEATH_LOOP)
		
		SetDefIdleMotion(SB1,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB2,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB3,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB4,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB5,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB6,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB7,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB8,ruFUSION_MIME_DEATH_LOOP)
		SetDefIdleMotion(SB9,ruFUSION_MIME_DEATH_LOOP)

		AddToPartition( DB1 , 0 )
		AddToPartition( DB2 , 0 )
		AddToPartition( DB3 , 0 )
		AddToPartition( DB4 , 0 )
		
		AddToPartition( FB1 , 0 )
		AddToPartition( FB2 , 0 )
		AddToPartition( FB3 , 0 )
		
		AddToPartition( SB1 , 0 )
		AddToPartition( SB2 , 0 )
		AddToPartition( SB3 , 0 )
		AddToPartition( SB4 , 0 )
		AddToPartition( SB5 , 0 )
		AddToPartition( SB6 , 0 )
		AddToPartition( SB7 , 0 )
		AddToPartition( SB8 , 0 )
		AddToPartition( SB9 , 0 )
	--�t���i������--
	--���w�t����ʼҦ�--
		ks_ActSetMode( SK )	--�F�d��
		SetDefIdleMotion(SK,ruFUSION_MIME_IDLE_STAND_02)--��NPC���񯸥�IDLE
		ks_ActSetMode( PD )	--���w��
		SetDefIdleMotion(PD,ruFUSION_MIME_IDLE_STAND_02)
		ks_ActSetMode( tony )--����
		SetDefIdleMotion(tony,ruFUSION_MIME_IDLE_STAND_02)
		ks_ActSetMode( BK )	--�¬��d
		SetDefIdleMotion(BK,ruFUSION_MIME_IDLE_STAND_02)
		ks_ActSetMode( ih )--�ä�
		SetDefIdleMotion(ih,ruFUSION_MIME_IDLE_STAND_02)
		ks_ActSetMode( DK )--�w��J
		SetDefIdleMotion(DK,ruFUSION_MIME_IDLE_STAND_02)
		
		ks_ActSetMode( DB1 )--�w�L
		ks_ActSetMode( DB2 )--�w�L
		ks_ActSetMode( DB3 )--�w�L
		ks_ActSetMode( DB4 )--�w�L
		
		ks_ActSetMode( FB1 )--�G�L
		ks_ActSetMode( FB2 )--�G�L
		ks_ActSetMode( FB3 )--�G�L
		
		ks_ActSetMode( SB1 )--�F�L
		ks_ActSetMode( SB2 )--�F�L
		ks_ActSetMode( SB3 )--�F�L
		ks_ActSetMode( SB4 )--�F�L
		ks_ActSetMode( SB5 )--�F�L
		ks_ActSetMode( SB6 )--�F�L
		ks_ActSetMode( SB7 )--�F�L
		ks_ActSetMode( SB8 )--�F�L
		ks_ActSetMode( SB9 )--�F�L
	--���w����
		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--�d������Ϊ��ˬd�禡
		Sleep(10)
		--�t����
		AdjustFaceDir ( PD, SK ,0 )	--��1����2
		AdjustFaceDir ( tony, SK ,0 )
		AdjustFaceDir ( BK, SK ,0 )
		AdjustFaceDir ( ih, SK ,0 )
		AdjustFaceDir ( DK, SK ,0 )
		Sleep(5)
		yell(PD,"[SC_423568_1]",2)	--���w��:�A�k�������A����N��a
		PlayMotion ( PD, ruFUSION_ACTORSTATE_EMOTE_POINT )
		Sleep(15)
		yell(SK,"[SC_423568_2]",2)--�F�d��:���i��I�ڪ��h�L�ƶq���������ӹL�A�̪��I
		PlayMotion ( SK, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
		Sleep(25)
		yell(DK,"[SC_423568_3]",2)--�w��J�G�A���h�L�w�h�Ӥ[
		PlayMotion ( DK, ruFUSION_ACTORSTATE_EMOTE_POINT )
		Sleep(25)
		yell(ih,"[SC_423568_4]",2)--�ä��G�A�����K�����ڪ��@���A�o�ĵ��]��
		Sleep(30)
		yell(SK,"[SC_423568_5]",2)--�F�d�ڡG�ĵ��]��?
		PlayMotion ( SK, ruFUSION_ACTORSTATE_EMOTE_LAUGH )
		Sleep(20)
		yell(SK,"[SC_423568_5_0]",2)--�F�d�ڡG���ܡA�d�~�e�A�ڤ@�ڥ��N�O�]�ڤ@�誺
		PlayMotion ( SK, ruFUSION_ACTORSTATE_ATTACK_1H )
		Sleep(40)
		yell(tony,"[SC_423568_5_1]",2)--����:�n���O�A�A�̱Z�g�]���|�Q[116268]�a���I
		PlayMotion ( tony, ruFUSION_ACTORSTATE_DEBUFF_INSTANT )
		Sleep(20)
		yell(SK,"[SC_423568_6]",2)--�F�d�ڡG�i�c�Iê�ƪ��p���A�ڭn�ԧA����
		CallPlot( OwnerID(), "LuaS_423568_GO1", DK,SK )
		Sleep(5)
		WriteRoleValue( SK, EM_RoleValue_IsWalk, 0 )
		DW_MoveToFlag(SK,780746 , 31 ,0 ,1)
		CallPlot( OwnerID(), "LuaS_423568_GO2", tony,SK )
		CastSpell( SK , SK , 495769 )
		AdjustFaceDir ( SK, DK ,0 )
		AdjustFaceDir ( DK, SK ,0 )
		PlayMotion ( SK, ruFUSION_ACTORSTATE_CAST_SP01 )
		Sleep(15)
		DW_MoveToFlag(SK,780746 , 34 ,0 ,1)
		--CallPlot( OwnerID(), "LuaS_423568_GO5", DK,SK )
		AdjustFaceDir ( SK, DK ,0 )
		yell(SK,"[SC_423568_8]",2)--�F�d�ڡG�A�ƤF
		Sleep(5)
		AdjustFaceDir ( DK, SK ,0 )
		yell(DK,"[SC_423568_9]",2)--�w�U�J�G�A�N��ۧڨ�t�@�ӥ@�ɥh
		Sleep(10)
		yell(SK,"[SC_423568_10]",2)--�F�d��:�n�ڦ��H�S�o��e���I
		PlayMotion ( SK, ruFUSION_ACTORSTATE_ATTACK_UNARMED )
		Sleep(10)
		yell(DK,"[SC_423568_11]",2)--�w��J:���c....
		PlayMotion ( DK, ruFUSION_ACTORSTATE_DYING )
		Sleep(10)
		AdjustFaceDir ( BK, DK ,0 )
		yell(BK,"[SC_423568_12]",2)--�¬��d:���I�N�x�I
		WriteRoleValue( BK, EM_RoleValue_IsWalk, 0 )
		Sleep(10)
		CallPlot( OwnerID(), "LuaS_423568_GO3", DK,ih )
		DW_MoveToFlag(BK,780746 , 38 ,0 ,1)
		PlayMotion ( BK, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
		CallPlot( OwnerID(), "LuaS_423568_GO4",SK )
		Sleep(50)
		yell(ih,"[SC_423568_14]",2)--�ä�:����....
		PlayMotion ( BK, ruFUSION_ACTORSTATE_CROUCH_END )
		Sleep(20)
		AdjustFaceDir ( ih, tony ,0 )
		AdjustFaceDir ( BK, tony ,0 )
		AdjustFaceDir ( PD, tony ,0 )
		Sleep(10)
		WriteRoleValue( ih, EM_RoleValue_IsWalk, 1 )
		WriteRoleValue( BK, EM_RoleValue_IsWalk, 1 )
		Sleep(10)
		yell(ih,"[SC_423568_15]",2)--�ä�:���U�A�Ф��\���ڥ��N���ˤU��......
		Sleep(10)
		yell(tony,"[SC_423568_16]",2)--����:�گ�z��
		Sleep(30)
		yell(ih,"[SC_423568_17]",2)--�ä�:���¡C�а��U�O���F
		Sleep(10)
		AdjustFaceDir ( ih, tony ,180 )
		AdjustFaceDir ( BK, tony ,180 )
		AdjustFaceDir ( PD, tony ,180 )
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --���t���F �����X��
		break								--�b�̫᭱�O�o�[break���_
	end
end

function LuaS_423568_GO1( DK,SK)  
	WriteRoleValue( DK, EM_RoleValue_IsWalk, 0 )
	Sleep(10)
	yell(DK,"[SC_423568_7]",2)--�w�U�J�G�ڤ��|���A�o�x��
	DW_MoveToFlag(DK,780746 , 32 ,0 ,1)
	AdjustFaceDir ( DK, SK ,0 )
	Sleep(10)
	PlayMotion ( DK, ruFUSION_ACTORSTATE_PARRY_1H )
	Sleep(20)
	DW_MoveToFlag(DK,780746 , 35 ,0 ,1)
	CastSpell( DK , SK , 495769 )
end
function LuaS_423568_GO2( tony,SK)  
	WriteRoleValue( tony, EM_RoleValue_IsWalk, 0 )
	Sleep(10)
	AdjustFaceDir ( tony, SK ,0 )
	DW_MoveToFlag(tony,780746 , 33 ,0 ,1)
	AdjustFaceDir ( tony, SK ,0 )
	Sleep(5)
	PlayMotion ( tony, ruFUSION_ACTORSTATE_PARRY_UNARMED )
end
function LuaS_423568_GO3( DK,ih)  
	AdjustFaceDir ( ih, DK ,0 )
	yell(ih,"[SC_423568_13]",2)--�ä�:���ˡI
	WriteRoleValue( ih, EM_RoleValue_IsWalk, 0 )
	Sleep(10)
	DW_MoveToFlag(ih,780746 , 37 ,0 ,1)
	Sleep(20)
	PlayMotion ( ih, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	Sleep(20)
	PlayMotion ( ih, ruFUSION_ACTORSTATE_CROUCH_END )
end

function LuaS_423568_GO4( SK)  
	WriteRoleValue( SK, EM_RoleValue_IsWalk, 0 )
	Sleep(10)
	yell(SK,"[SC_423568_13_1]",2)--�F�d��:�@�s���f�A�o���b�A�H��A��A�̲M��C
	DW_MoveToFlag(SK,780746 , 36 ,0 ,1)
	Sleep(20)
	CastSpell( SK , SK , 495769 )
	delobj(SK)
end
--function LuaS_423568_GO5( DK,SK)  
	--PlayMotion ( DK, ruFUSION_ACTORSTATE_PARRY_1H )
	--Sleep(20)
--	DW_MoveToFlag(DK,780746 , 35 ,0 ,1)
--	CastSpell( DK , SK , 495769 )
--end

function Lua_423568_break()					--�o�q�����_/�����ɭn�@���Ʊ�
	local PD = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116359, 300, 0 )--�j�M����ѥ[��NPC�t��
	local tony = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116349, 300, 0 )
	local DK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116216, 300, 0 )
	local ih = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116355, 300, 0 )
	local SK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116354, 300, 0 )
	local BK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116356, 300, 0 )
	
	local DB1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116348, 300, 0 )
	local DB2 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116348, 300, 0 )
	local DB3 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116348, 300, 0 )
	local DB4 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116348, 300, 0 )
	
	local FB1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116360, 300, 0 )
	local FB2 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116360, 300, 0 )
	local FB3 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116360, 300, 0 )
	
	local SB1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB2 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB3 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB4 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB5 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB6 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB7 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB8 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	local SB9 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116358, 300, 0 )
	
	if PD ~= nil then delobj(PD) end							--�p�G�s�b �h�R��
	if tony ~= nil then delobj(tony) end
	if DK ~= nil then delobj(DK) end
	if ih ~= nil then delobj(ih) end
	if SK ~= nil then delobj(SK) end
	if BK ~= nil then delobj(BK) end
	if DB1 ~= nil then 
		for i=0, table.getn(DB1) do
			delobj(DB1[i]) end
		end
	if FB1 ~= nil then 
		for i=0, table.getn(FB1) do
			delobj(FB1[i]) end
		end
	if SB1 ~= nil then 
		for i=0, table.getn(SB1) do
			delobj(SB1[i]) end
		end
	
	local obj = ks_resetObj( OwnerID(), nil )									--�D�`���n �R�������t���@����NPC �@���m
	ks_SetController( obj )--�]�w���α����
end

--------------------------------------------------------------------------------------------------------

--------------------------------�P�_���a���S���Ѹ̽u����----------------------------------
function Luas_423551()	--���b423551����Ž׳o�ӥ��Ȫ�����������
	if CheckAcceptQuest( TargetID() , 423569 ) == true and  CheckCompleteQuest( TargetID(), 423513 )==false then
		SetFlag( TargetID() , 544401 , 1 )
	end
end

-----------------------------------------------------------------
------------------423569����Ž�-----------------
function LuaS_423569() 
	SetPlot( OwnerID(), "Range", "LuaS_423569_1", 200 )	
end
function LuaS_423569_1()--  OwnerID�O���a  �t�X�@�����i�b���a���W����
	if	CheckAcceptQuest( OwnerID() ,423569 ) == true and CheckFlag( OwnerID() , 544404) == false and
		ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) == 0 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423569_1]", 0 )--ĵ�i���a�A�ǭn�X�{�F
		WriteRoleValue( TargetID(),EM_RoleValue_Register1, 1 )
		BeginPlot( TargetID(), "LuaS_423569_2", 0 )
--	elseif 
	--	CheckAcceptQuest( OwnerID() ,423569 ) == true and CheckFlag( OwnerID() , 544404) == false and CheckID(Monster) ~= true then
	--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423569_2]" , "0xFFFFFF00"  ) --�i�D���a�A�����a�����A��
	--	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423569_2]" , "0xFFFFFF00"  )
	end	
end

function LuaS_423569_2()
	local Monster = LuaFunc_CreateObjByObj( 104486, OwnerID() ) --�b���w��m���ͩǪ�"104486" 
	--AddToPartition( Monster, 0 )	
	BeginPlot(Monster,"LuaS_423569_4",0) --8�����i�J�԰����A�N�|����
	WriteRoleValue( Monster,EM_RoleValue_Register1, OwnerID() )	

	SetPlot( Monster, "dead", "LuaS_423569_3", 0 )
	AdjustFaceDir ( Monster, TargetID() ,0 )

	--if CheckAcceptQuest( TargetID() ,423569 ) == true and ReadRoleValue( Monster, EM_RoleValue_IsDead ) == 1 then
	--SetFlag( TargetID() , 544404 , 1 )
	--end
end

function LuaS_423569_3()	
	local allplayer = {}
	local playerCount = 0	
	local QuestID = 423569
	local FinishFlagID = 544404
	local CheckRange = 400
	
	allplayer = SearchRangePlayer ( OwnerID(), CheckRange )	
	for pry , obj in pairs( allplayer ) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do
		if CheckAcceptQuest( allplayer[i], QuestID ) == true and CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			SetFlag( allplayer[i] , 544404 , 1 )
		end
	end

	local ctrl = ReadRoleValue( OwnerID(),EM_RoleValue_Register1 )	

	local ctrl = ks_resetObj( ctrl, nil )									--�D�`���n �R�������t���@����NPC �@���m
	ks_SetController( ctrl )--�]�w���α����
	PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_DEAD)
	PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_DYING)
	npcsay(OwnerID(), "[SC_423569_3]")
	delObj(OwnerID())
end

function LuaS_423569_4()
	local OID = OwnerID()
	while true do
		sleep(80)
		local AttackTarget = ReadRoleValue( OID , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			local ctrl = ReadRoleValue( OwnerID(),EM_RoleValue_Register1 )	
			local ctrl = ks_resetObj( ctrl, nil )									--�D�`���n �R�������t���@����NPC �@���m
			ks_SetController( ctrl )--�]�w���α����
			DelObj(OID)
			break
		end
	end
end