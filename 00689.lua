--�����g�G�W�O�߾i�U�@�N�O�@��x�����ơA���O�ڤ��M���|��󪺡C

function LuaS_420847_0_0()
	if CheckAcceptQuest( OwnerID() , 420847) == true and CountBodyItem( OwnerID(), 202172)>=1 and CheckFlag( OwnerID(), 540949 ) == false then
		LoadQuestOption(OwnerID())	
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_0") , "LuaS_420847_0_1", 0 ) --���a�ﶵ�G�o�ǭ����Ʊ�����W�A����
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420847_0_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_1" )   )--�ڭ̨ä����ѡA������A�n��ڳo��n�H
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_2") , "LuaS_420847_0_2", 0 ) --���a�ﶵ�G���U�@�Ӱ��j�����ˬO�Ѹg�a�q
end

function LuaS_420847_0_2()
	DelBodyItem( OwnerID(), 202172, 1 )
	SetFlag( OwnerID()  , 540949 , 1 )
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_3" )   )--��K�K���n�a�C���§A���n�N�A�o���F�ڭ̥��l�@�Ӥj���C
end

--����Ԧ̭C�G�f���ش��I�Ф޻�ڪ��V�Ҩ�w�֪���g�h�a�K�K

function LuaS_420847_1_0()
	if CheckAcceptQuest( OwnerID() , 420847) == true and CountBodyItem( OwnerID(), 202172)>=1 and CheckFlag( OwnerID(), 540950 ) == false then
		LoadQuestOption(OwnerID())	
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_4") , "LuaS_420847_1_1", 0 ) --���a�ﶵ�G�A�o�Y�I�F��
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420847_1_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_5" )   )--��F�a�C�ڲ{�b�S���G�f�Y�F��C
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_6") , "LuaS_420847_1_2", 0 ) --���a�ﶵ�G�A���V�Ҥ��|�Ʊ�A�j�ۨ{�l����L
end

function LuaS_420847_1_2()
	DelBodyItem( OwnerID(), 202172, 1 )
	SetFlag( OwnerID()  , 540950 , 1 )
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_7" )   )--��K�K���n�a�A���§A���n�N�C�@�f���ش����`�A�A���}���H���B�͡C
end

--����N���R�G���M�j�a�����ڪ��V�Ҥw�g���b�W�����H��U�A���O�ڤ����|���Ʊ�A�γ\�L�U�@��N�|�X�{�b�ڪ����e�I

function LuaS_420847_2_0()
	if CheckAcceptQuest( OwnerID() , 420847) == true and CountBodyItem( OwnerID(), 202172)>=1 and CheckFlag( OwnerID(), 540951 ) == false then
		LoadQuestOption(OwnerID())	
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_4") , "LuaS_420847_2_1", 0 ) --���a�ﶵ�G�A�o�Y�I�F��
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420847_2_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_5" )   )--��F�a�C�ڲ{�b�S���G�f�Y�F��C
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420847_8") , "LuaS_420847_2_2", 0 ) --���a�ﶵ�G�کȦb�A�V�ҥX�{�e�A�|���j��
end

function LuaS_420847_2_2()
	DelBodyItem( OwnerID(), 202172, 1 )
	SetFlag( OwnerID()  , 540951 , 1 )
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420847_9" )   )--��K�K���n�a�A���F�O����O�ڱo�Y�I�F��K�K
end