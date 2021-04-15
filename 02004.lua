--�D�u2
------����423554���A�¬��d----
function Luas_423554()	--���b�¬��d���W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423554 ) == true and	checkFlag( OwnerID() , 544368 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423554_1]", "LuaS_423554_1", 0 )--�A�Q������H�����򤣸�����}�H
	end
end

function LuaS_423554_1()
	SetSpeakDetail(	OwnerID() , "[SC_423554_2]" )
	AddSpeakOption( OwnerID() , TargetID(), "[SC_423554_3]", "LuaS_423554_2" , 0 )
end

function LuaS_423554_2()
	SetSpeakDetail( OwnerID() , "[SC_423554_4]" )
	AddSpeakOption( OwnerID() ,TargetID(),  "[SC_423554_5]" , "LuaS_423554_3" , 0 )
end

function LuaS_423554_3()
	SetSpeakDetail( OwnerID() , "[SC_423554_6]" )
	SetFlag( OwnerID() , 544368 , 1 )
end

--------------------------------------------

------����423561�ä�������----
function Luas_423561()	--���b116267�ä����W
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423561 ) == true and	checkFlag( OwnerID() , 544369 )	== false then
		AddSpeakOption( OwnerID() ,	TargetID() ,"[SC_423561_1]", "LuaS_423561_1", 0 )--�A�Q������H�����򤣸�����}�H
	end
end

function LuaS_423561_1()
	SetSpeakDetail(	OwnerID() , "[SC_423561_2]" )
	AddSpeakOption( OwnerID() ,TargetID(), "[SC_423561_3]", "LuaS_423561_2" , 0 )
end

function LuaS_423561_2()
	SetSpeakDetail( OwnerID() , "[SC_423561_4]" )
	AddSpeakOption( OwnerID() ,TargetID(), "[SC_423561_5]" , "LuaS_423561_3" , 0 )
end

function LuaS_423561_3()
	SetSpeakDetail( OwnerID() , "[SC_423561_6]" )
	AddSpeakOption( OwnerID() , TargetID(),"[SC_423561_7]" , "LuaS_423561_4" , 0 )
end

function LuaS_423561_4()
	SetSpeakDetail( OwnerID() , "[SC_423561_8]" )
	SetFlag( OwnerID() , 544369 , 1 )
end
---------------------------------------------------------------------------------
function LuaS_423561_9()	--423561���ȧ��������
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423561_9]" , "0xFFFFFF00"  ) 
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423561_9]" , "0xFFFFFF00"  )
end

------------------------------423562���o�u��----------------------------------

--/GM ? createflag 780732 1
--116271�u���¬��d 
--116278�u���̱Z�g

--116273�����¬��d       �X�l:780728
-- 116274�����̱Z�g       �X�l:780731

--116275�F�X�J�D�M��       �X�l:780732
--116276�ڨF���D�Q�O       �X�l:780733
--116277�责�F�D�_��       �X�l:780734
--116279�������m��      �X�l:780735

--���o�u���ˬd�I116281		�����X�нs���G544392    ����BUFF:507178
function LuaS_423562()			--���b116281����NPC�����~�U
	SetPlot( OwnerID(), "range","LuaS_423562_1", 150 )
end
	
function LuaS_423562_1()--  OwnerID�O���a  �t�X�@�����i�b���a���W����
	if	CheckAcceptQuest( OwnerID() ,423562 ) == true	and 	CheckFlag( OwnerID() , 544392 ) == false and CheckBuff( OwnerID(), 507178 ) == false and
		ReadRoleValue( TargetID(), EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( TargetID(),EM_RoleValue_Register1, 1 )	--��NPC��
		BeginPlot( TargetID(), "LuaS_423562_2", 0 )
	elseif	CheckAcceptQuest( OwnerID() ,423562 ) == true	and 	CheckFlag( OwnerID() , 544392 ) == false and CheckBuff( OwnerID(), 507178 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423562_0]" , "0xFFFFFF00"  ) --�i�D���a�A�����a�����A��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423562_0]" , "0xFFFFFF00"  )
	end	
end

function LuaS_423562_2()
	while true do							--�`�N �o�O�j��
		local O_ID = OwnerID()				--���bNPC���W���t���@��
		local QuestID = 423562				--���Ƚs��
		local FinishFlagID = 544392			--����������o���X��
		local CheckBuffID = 507178			--�ˬd�O�_���b�t����BUFF
		local CheckRange = 200				--�t�����ˬd�d��
		local DoScript = "Lua_423562_break"	--��@�������Ϊ̨S�H�b�����ɧ@���B�z	
		
		local BK = Lua_DW_CreateObj("flag" ,116273,780728,1)
		local DM = Lua_DW_CreateObj("flag" ,116275,780732,1)	--�N�F�X�J�D�M���b�Ĥ@�ںX�l�W�إX�� �ëŧi
		local BS = Lua_DW_CreateObj("flag" ,116276,780733,1)	--�N�ڨF���D�Q�O�b�Ĥ@�ںX�l�W�إX�� �ëŧi     
		local GT = Lua_DW_CreateObj("flag" ,116277,780734,1)	--�N�责�F�D�_�� �b�Ĥ@�ںX�l�W�إX�� �ëŧi
		local icl = Lua_DW_CreateObj("flag" ,116274,780731,1)	--�N�̱Z�g����b�Ĥ@�ںX�l�W�إX�� �ëŧi
		local SM1 =Lua_DW_CreateObj("flag" ,116279,780735,1)	--�N�������m���b�Ĥ@�ںX�l�W�إX��
		local SM2 =Lua_DW_CreateObj("flag" ,116279,780735,2)	--�N�������m���b�Ĥ@�ںX�l�W�إX��
		local SM3 =Lua_DW_CreateObj("flag" ,116279,780735,3)	--�N�������m���b�Ĥ@�ںX�l�W�إX��
		local SM4 =Lua_DW_CreateObj("flag" ,116279,780735,4)	--�N�������m���b�Ĥ@�ںX�l�W�إX��
		local SM5 =Lua_DW_CreateObj("flag" ,116279,780735,5)	--�N�������m���b�Ĥ@�ںX�l�W�إX��
		ks_ActSetMode( DM )	--�N�F�X�J�D�M��
		ks_ActSetMode( BS )	--�N�ڨF���D�Q�O
		ks_ActSetMode( GT )	--�N�责�F�D�_��
		ks_ActSetMode( BK )	--�¬��d
		ks_ActSetMode( icl )--�̱Z�g
		ks_ActSetMode( SM1 )--�m��
		ks_ActSetMode( SM2 )--�m��
		ks_ActSetMode( SM3 )--�m��
		ks_ActSetMode( SM4 )--�m��
		ks_ActSetMode( SM5 )--�m��
		Sleep(5)
		CallPlot( OwnerID(), "ks_QuestAddBuff", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript )--�d������Ϊ��ˬd�禡
		Sleep(10)
		--�t����
		AdjustFaceDir ( DM, BK ,0 )	--��1����2
		AdjustFaceDir ( BS, BK ,0 )
		AdjustFaceDir ( GT, BK ,0 )
		AdjustFaceDir ( SM1, BK ,0 )
		AdjustFaceDir ( SM2, BK ,0 )
		AdjustFaceDir ( SM3, BK ,0 )
		AdjustFaceDir ( SM4, BK ,0 )
		AdjustFaceDir ( SM5, BK ,0 )
		Sleep(5)
		Say(DM,"[SC_423562_1]")	--�F�X�J:�i�����s�Ӹ�I�p�G�A�S���s�ӡA������ڤ��˪������٫��|�b�A����W�H
		PlayMotion ( DM, ruFUSION_ACTORSTATE_ATTACK_2H )
		Sleep(3)
		AdjustFaceDir ( BK, DM ,0 )
		Sleep(20)
		Say(BS,"[SC_423562_2]")	--�ڨF��:��L�ӥ޸̪�����]�������F�A�A�쩳���F����H
		Sleep(3)
		AdjustFaceDir ( BK, BS ,0 )
		Sleep(20)
		Say(BK,"[SC_423562_3]")	--�¬��d:�ڻ��L�F�A�L�̳Q[116220]�ܦ��F���w�Ԥh�A�{�b�����Q�æb�R�w�J���u�a�̡C
		PlayMotion ( BK, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
		Sleep(40)
		Say(GT,"[SC_423562_4]")	--�责�F:���M�ڭ̳�����[116218]�A�����]���N��ڭ̷|�o��²��N�Q����
		Sleep(3)
		AdjustFaceDir ( BK, GT ,0 )
		Sleep(20)
		Say(icl,"[SC_423562_5]")	--�̱Z�g"�U��A�L�������O�u��
		Sleep(5)
		AdjustFaceDir ( DM, icl ,0 )	--��1����2
		AdjustFaceDir ( BS, icl ,0 )
		AdjustFaceDir ( GT, icl ,0 )
		AdjustFaceDir ( SM1, icl ,0 )
		AdjustFaceDir ( SM2, icl ,0 )
		AdjustFaceDir ( SM3, icl ,0 )
		AdjustFaceDir ( SM4, icl ,0 )
		AdjustFaceDir ( SM5, icl ,0 )
		Sleep(40)
		Say(GT,"[SC_423562_6]")	--�责�F:�F�d�ڧ��٥d�O���F���N�x�����C
		Sleep(3)
		AdjustFaceDir ( GT, icl ,0 )
		Sleep(20)
		Say(icl,"[SC_423562_7]")	--�̱Z�g:���u�O�L���x�L�Ǥf
		Sleep(3)
		AdjustFaceDir ( icl, GT ,0 )
		Sleep(40)
		Say(BS,"[SC_423562_8]")	--�ڨF��:�����A���j���Ԥh�O���b�Գ��W�A�Ӥ��O���Ѥ��U
		Sleep(3)
		AdjustFaceDir ( BS, icl ,0 )
		Sleep(20)
		Say(icl,"[SC_423562_9]")	--�̱Z�g:�ڦ��S�������A�A�̳̲M���F
		Sleep(3)
		AdjustFaceDir ( icl, BS ,0 )
		Sleep(20)
		Say(DM,"[SC_423562_10]")	--:���T�A�o�S�������A�ڽT��Pı����o���߸��[�֩άO��L�æ������ɷ|�X�{���Ͳz�����C
		Sleep(5)
		AdjustFaceDir ( icl, DM ,0 )	--��1����2
		AdjustFaceDir ( BK, DM ,0 )
		AdjustFaceDir ( BS, DM ,0 )
		AdjustFaceDir ( GT, DM ,0 )
		AdjustFaceDir ( SM1, DM ,0 )
		AdjustFaceDir ( SM2, DM ,0 )
		AdjustFaceDir ( SM3, DM ,0 )
		AdjustFaceDir ( SM4, DM ,0 )
		AdjustFaceDir ( SM5, DM ,0 )
		Sleep(30)
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423562_11]" , "0xFFFFFF00" )	--(���Hĳ�ׯɯ�)
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423562_11]" , "0xFFFFFF00" )	
		Sleep(20)
		Say(DM,"[SC_423562_12]")	--�F�X�J:���ڤ����աA������F�d�ڭn�o��h�����w�Ԥh���L�@�ԡH
		Sleep(20)
		Say(icl,"[SC_423562_13]")	--�̱Z�g:�����]�A�]�\���@���u�ۤj�դ���A�A�̴N�|�A�ѤF�C
		Sleep(20)
		Say(DM,"[SC_423562_14]")	--���n�a�A�ڭ̤]�u�n����u�ۤj�ժ����ѡC
		Sleep(3)
		AdjustFaceDir ( DM, icl ,0 )
		Sleep(20)
		CallPlot( OwnerID(), "ks_QuestEnd", QuestID, FinishFlagID, CheckBuffID, CheckRange, DoScript ) --���t���F �����X��
		break								--�b�̫᭱�O�o�[break���_
	end
end

function Lua_423562_break()					--�o�q�����_/�����ɭn�@���Ʊ�
	local DM = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116275, 150, 0 )--�j�M����ѥ[��NPC�t��
	local BS = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116276, 150, 0 )
	local GT = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116277, 150, 0 )
	local icl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116274, 150, 0 )
	local SM1 = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116279, 150, 0 )
	local BK = LuaFunc_SearchNPCbyOrgID( OwnerID(), 116273, 150, 0 )
	
	if DM ~= nil then delobj(DM) end							--�p�G�s�b �h�R��
	if BS ~= nil then delobj(BS) end
	if GT ~= nil then delobj(GT) end
	if icl ~= nil then delobj(icl) end
	if SM1 ~= nil then 
		for i=0, table.getn(SM1) do
			delobj(SM1[i]) end
		end
	if BK ~= nil then delobj(BK) end
	local obj = ks_resetObj( OwnerID(), nil )									--�D�`���n �R�������t���@����NPC �@���m
	ks_SetController( obj )--�]�w���α����
end

------------------------------------------------------------------------------------------------