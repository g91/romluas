function LuaS_110165_0()

	SetSpeakDetail( OwnerID(),GetString("ST_110165_0")   );
	--/*���n��ڻ��ܡI�ڤw�g���F�A�N��ڪ�����S���A���ڪ��F��w�g���h�I����
	if CheckAcceptQuest( OwnerID(),420210 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110165_1" ), "LuaS_110165_1", 0 ) --/*���ɥL���ܡA�÷Q��k�M�X�L����
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110165_0") , "LuaS_110165_EXIT", 0 ); --/*�������	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110165_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110165_1")   );
	--/*���ѡH�O�ڡI���ө]�ߡA���F��}�H�����ө]�ߡI���אּ�F�ڦӦ��h�A�ӧګo�i���h�o�Ӧ��������I�s�o���̫�@���]������......
	--/*������o�ӫ��𨺻��q�H������کM���藍��ηR�Ӷ�ɧڭ̨������t�Z�H
	--/*�A��^���ڶܡH�֯�^���ڡI
	if CountBodyItem( OwnerID() , 200034 ) == 0 then
		GiveBodyItem( OwnerID(),200034,1 )
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110165_0") , "LuaS_110165_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110165_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end
------------------------------------------------------------------------------------------------------------------------------
function LuaS_110169_0()

	SetSpeakDetail( OwnerID(),GetString("ST_110169_0")   );
	--/*�_�I�̡H�A�O���ְ��ƪ��H��ڰ�����H
	if CheckAcceptQuest( OwnerID(),420210 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110169_1" ), "LuaS_110169_1", 0 ) --/*���P�L���٤ߡA�÷Q��k�M�X�L����
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110169_0") , "LuaS_110169_EXIT", 0 ); --/*�������	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110169_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110169_1")   );
	--/*�A�����S���I�{�b�Q�Q�A��̤����Dŧ�����ѱߤW������ڭ̳o�@�����H�h��ӡA�����w�N�O�ӳ���......
	--/*���e�ڪ�����A�ϦӦn�����Өƥ�P�ڦ���......�o�˥i�����F�A�ڳ��M�S�Q��o�@�B......
	--/*���L......�����w�i�H�Q�γo�Ӿ��|......���......
	if CountBodyItem( OwnerID() , 200036 ) == 0 then
		GiveBodyItem( OwnerID(),200036,1 )
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110169_0") , "LuaS_110169_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110169_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end
------------------------------------------------------------------------------------------------------------------------------
function LuaS_110072_0()

	SetSpeakDetail( OwnerID(),GetString("ST_110072_0")   );
	--/*�A�ݰ_�Ӧ��G�]�O�ӮȦ�̡A������ƶܡH
	if CheckAcceptQuest( OwnerID(),420210 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110072_1" ), "LuaS_110072_1", 0 ) --/*��L�M���Y�A�÷Q��k�M�X�L����
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110072_0") , "LuaS_110072_EXIT", 0 ); --/*�������	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110072_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110072_1")   );
	--/*�������I���T�p���I�o�˧a�I�ڴN���A�[�J�ڪ��p�e�C
	--/*��̤����Dŧ���o��ƪ��T�ܥO�H�Ҳ��A���o�O�Ӿ��|�A�A�S�ݨ�ĵ�ƶ��j�������H���h�B�z�o��ƤF�ܡH
	--/*�ڴN�O���D�o�ӨƱ��A�~�S�a�]�ӤZ��R���A�Q�n�n�j���@���I
	--/*�K�K��ϥ��o�ت��H�Ӧ����F�A�ڭ̮����@�ǥL�����Ӥ]���|�b�N���I
	if CountBodyItem( OwnerID() , 200061 ) == 0 then
		GiveBodyItem( OwnerID(),200061,1 )
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110072_0") , "LuaS_110072_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110072_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end