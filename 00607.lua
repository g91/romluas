--�����`���y�I��

--�I�����yNPC ��l��ܼ@��
function lua_mika_skllcraft_reward_00()
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC���V���a

	SetSpeakDetail( OwnerID(), "[SC_SKILLEVENT_REWARD01]"   )  -- �_�I�̡A�A�n��ڬO�����`���ʼ��y�I�����I (��)
	AddSpeakOption( OwnerID(), TargetID(), "[SC_SKILLCRAFT_01]" , "lua_mika_skllcraft_story", 0 )  -- �ڷQ���D�����`���Ѩ� 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BEERDAY_29]" , "lua_mika_skllcraft_reward_01", 0 ) -- �ڷQ�I�����y
end

--�ﶵ-�ڷQ���D�����`���Ѩ� 
function lua_mika_skllcraft_story()
	SetSpeakDetail( OwnerID(), "[SC_SKILLCRAFT_02]"   )  -- �����`story (��)
end

--�ﶵ-�I�����y
function lua_mika_skllcraft_reward_01()

	local itemid = 240060  ---�ݨD���~�s��
	local needcount = 6  -- �ݨD�ƶq  �n��ƶq�ɽбq�o�̧�
	local playercount = CountBodyItem(OwnerID(), itemid)   --���a���W�ݨD���~���ƶq
	local rewardid = 242090   --�����`���y - ���ԥ���§��

	if playercount < needcount then -- �ƶq����
		SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C
	else
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(), itemid, needcount )  -- DEL �I�����~
		GiveBodyitem(OwnerID(), rewardid, 1 )   -- �����y�s��
		DesignLog( OwnerID() , 113933 , "craft festival - reward change. " ) -- �����`���y�I���p�� (6.0.1��)
		if DW_Rand(100) <= 3 then	--3%���v��o
			GiveBodyitem(OwnerID(), 241456, 1 ) --2012 �s�W�t�X�P�y�d�������Ƽ��y   ���l���~����
		end
	end
end