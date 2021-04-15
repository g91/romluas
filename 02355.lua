function Lua_ying_spring_118282talk() --�S�R�Ԥ� ��ܼ@��
--	Say(OwnerID(), "Owner") --���a
--	Say(TargetID(), "Target") --NPC
	local Reg = ReadRoleValue( TargetID() , EM_RoleValue_Register7 ) --Ū��NPC���W��Register7��
	local over = CheckFlag( OwnerID() , 545046 ) --�⧹���y --�C�魫�m
	local keyA = CheckFlag( OwnerID() , 545047 ) --���Wkey --�C�魫�m
	local keyB = CheckFlag( OwnerID() , 545048 ) --���Lkey

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a
	if over == true then --�⧹���y
		SetSpeakDetail( OwnerID() , "[SC_SPRING_2011EV2_03]" ) --�A���Ѥw�g�ѻP�L�o�Ӭ����o�I
		AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRING_2011EV2_04]", "Lua_ying_spring_story", 0 ) --"�ڷQ�n�A�ѬK�B�`�y���ʭI��"�ﶵ
	else --������y
		if Reg == 1 then --Register7��=1��ܬ��ʥ��b�i�椤
			SetSpeakDetail( OwnerID() , "[SC_SPRING_2011EV2_02]" ) --����w�g�}�l�o�I�ڥ��b�X�D�O��
		elseif Reg == 2 then --Register7�ȼg=2���NPC�}����W
			if keyB == true then --�w���L����
				LoadQuestOption( OwnerID()) --Ū���ҪO
				AddSpeakOption( OwnerID() , TargetID() , "[SC_SPRING_2011EV2_05]" , "Lua_ying_spring_gift" , 0 ) --"�D�ԧ����A�ڷQ�n������y�I"�ﶵ
				AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRING_2011EV2_04]", "Lua_ying_spring_story", 0) --"�ڷQ�n�A�ѬK�B�`�y���ʭI��"�ﶵ
			elseif keyA == true then --�w���W�A���|��������
				SetSpeakDetail( OwnerID() , "[SC_SPRING_2011EV2_06]" ) --�A�w�g���W�L�o�I���I���ɭԦ���N�|�}�l�F�I���A�n�B��
			else --�����W
				LoadQuestOption( OwnerID()) --Ū���ҪO
				AddSpeakOption( OwnerID() , TargetID() , "[SC_111576_YU_03]" , "Lua_ying_spring_sign" , 0 ) --"�ڭn���W�I"�ﶵ
			end
		else --���ʩ|���}�l
			LoadQuestOption( OwnerID()) --Ū���ҪO
			AddSpeakOption(OwnerID(), TargetID(), "[SC_SPRING_2011EV2_04]", "Lua_ying_spring_story3", 0) --"�ڷQ�n�A�ѬK�B�`�y���ʭI��"�ﶵ
			if keyB == true then --�w���L����
				AddSpeakOption( OwnerID() , TargetID() , "[SC_SPRING_2011EV2_05]" , "Lua_ying_spring_gift" , 0 ) --"�D�ԧ����A�ڷQ�n������y�I"�ﶵ
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_story3() --"�ڷQ�n��F�ѬK�B�`�y����"�ﶵ
	
	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_10]" ) --�K�B�`�y���ʭI��1
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_111700_29]", "Lua_ying_spring_story4", 0 ) --"��h�K�B�`�y���ʭI��"�ﶵ
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_spring_118282talk", 0 ) --�^��W�@��
end
-------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_story4() --"��h�K�B�`�y���ʭI��"�ﶵ

	SetSpeakDetail (OwnerID(), "[SC_DAN_111700_3]" ) --�K�B�`�y���ʭI��2 
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_ying_spring_118282talk", 0 ) --�^��W�@��
end
-------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_sign() --"�ڭn���W�I"�ﶵ
	
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SPRING_2011EV2_07]" , C_SYSTEM ) --�A�����W�w�g�ӽЧ����I
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_SPRING_2011EV2_07]" , C_SYSTEM ) --�A�����W�w�g�ӽЧ����I
	SetFlag( OwnerID() , 545047 , 1 ) --�������Wkey
	CloseSpeak( OwnerID() )
end		
------------------------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_spring_gift() --"�D�ԧ����A�ڷQ�n������y�I"�ﶵ

---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_118283npc() --���b�S�R �E �Ԥ����ê���W(���󲣥ͼ@��)
--	Say(OwnerID(), "Owner") --���ê���
--	Say(TargetID(), "Target") --���ê���
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --Ū�����ê��������Zone
	local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() , 118282 , 100 , 0 ) --�H���ê���118283�����ߡA�V�P��100�X�j�MNPC�S�R�Ԥ�118282
										        --(�̫᪺0��Type�AType 0 ���ܷ|�b�u���@�ӥؼЮɦ^�ǸӥؼСA�A�Ω�w���ƶq�ؼ�)
										        --(1 ���ܫh�O�L�ק��X�ӡA���^�Ǿ�Ӹs�աA�A�Ω󥼪��ƶq�ؼ�)
	local hrtable = { 2 , 8 , 14 , 20 } --50��
	local hrtable2 = { 3 , 9 , 15 , 21 } --���I

	while true do
		Say(OwnerID() , "1")
		Sleep(600) --1�����]�@���j��
		local hour = GetSystime(1) --���o�{�b�ɶ��G��
		local min = GetSystime(2) --���o�{�b�ɶ��G��
		local Reg = ReadRoleValue( NPC , EM_RoleValue_Register7 ) --Ū��NPC���W��Register7��

		Say( OwnerID() , "Reg = "..Reg)
		if ZoneID < 1000 then --(���y1�G15�B���y2�G15001�B���y3�G15002�A�YZoneID�j��1000�h�����y)
			for i = 1 , table.getn(hrtable) , 1 do --hrtable��1~4��m
				if hour == hrtable[i] and min == 50 then --��=2 , 8 , 14 , 20 & ��=50
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_SPRING_2011EV2_01]" ) --�K�B�`����"�Ԥ�ڪ�����"�Y�N�b10������}�l�A�Ыe���F�ԥ������M��K�B�`���ʺ޲z���X�S�R �E �Ԥ���W�ѥ[�I
					WriteRoleValue( NPC , EM_RoleValue_Register7, 2 ) --��Ԥ�Register7�ȼg��"2"�A���NPC�}����W
				elseif hour == hrtable2[i] and min == 0 then --��=3 , 9 , 15 , 21 & ��=0
					Say(OwnerID() , "2")
--					Beginplot( NPC , "" , 0 ) --���I��Ԥ�}�l�X�D�@��
					WriteRoleValue( NPC , EM_RoleValue_Register7, 1 ) --��Ԥ�Register7�ȼg��"1"�A��ܬ��ʶi�椤
				end
			end
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_123()
	
	Lua_Hao_NPCofAll_Clear( 118157 , 300 )
end