function LuaS_110286_0()
	if ReadRoleValue( OwnerID() , EM_RoleValue_SEX) == 0 then
		SetSpeakDetail( OwnerID(), GetString("ST_110286_0")   );
		--/*����p�A�~�l��L�u���[�A�ҥH�ڤ��న�W�����A���ܽСA���L�p�G�u�O�쨺��y�L�ͽ����ӨS���Y�A���ڭ�......
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110286_1")   );
		--/*���r��u��p�A�ڤ��O�o�A�O���쪺���H�Ωd�l�A���L�p�G�A�O�ӧ�ڲz�ת��ܡA�ڥi�H�j�誺��A���k�H�ٵ��A�A�ϥ��ڷ|�ѰO�����O�Ǥp�}����I���������
	end
	if CheckFlag(OwnerID() , 540767 ) ~= true and CheckFlag( OwnerID() , 540254 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_1") , "LuaS_110286_1", 0 )
		--/*�d�ҥd���쪺����
	end
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_0") , "LuaS_110286_EXIT", 0 );
	--/*�������

end

function LuaS_110286_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_2")   );
	--/*�����H�ڬO���ܦh�����A�o�Ǧ������Q�����R�O�I�A�O�Q�ݧڪ����@�Ӧ����H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_2") , "LuaS_110286_2", 0 )
	--/*��p�A�ҤH�A�ڧƱ檾�D���O���������ͩҿ�d�U�������A�ëD�ҤH�ۤv�������C
end

function LuaS_110286_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_3")   );
	--/*�ڡK�K�ڡI�L§���å�I�A���N��O���ګI���F�ڥ��ͪ��򪫡H�L�O�ڥ��͡A�L��d�U�Ӫ��@���۵M�N�O�ѧڨ��~�ӰڡI
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_3") , "LuaS_110286_3", 0 )
	--/*�ҤH�A�~�|�F�A�ڨèS���o�ӷN��A�u�O�ڤ��e�o�쪺�u���u�����o�Ӧ��������������ͩҦ��C
end

function LuaS_110286_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_4")   );
	--/*�K�K�L���T�O���L�o��@������A�ӥL�]�ȶȦ��L�o��@��A�L�ͫe�O�Z�����o��������A�����������ڨӻ��Ӥj�F�A�˦��ڤ]�����w�F�A�ݳo�ӬO�Q������H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_4") , "LuaS_110286_4", 0 )
	--/*���Y�H�ͫe���V���������ͻ��n�n�R�U�o������A���ܥi�����������ͨӤ��Χ�������N���F�A��O�L�K�Чڨӧ�ҤH��A�A�Ʊ�৹���o������C
end

function LuaS_110286_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_5")   );
	--/*�O�ܡK�K���L��������ڤw�g�e���O�H�F�A�ڥ��ͪ��Ʊ��ڤ��Q�ޡA�A�̭n����h��O�H�a�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_5") , "LuaS_110286_5", 0 )
	--/*�i�H�i�D�ڨ��ӤH�O�ֶܡH�ҤH�C
end

function LuaS_110286_5()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_6")   );
	--/*�A�K�K�A�ݳo�Ӱ�����I�A�̤���n�ڧi�D�A�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_6") , "LuaS_110286_6", 0 )
	--/*�ҤH�Ю���A�ڥu�O�Q�����o������������Ӥw�A�ä����D�ҤH�����U�{�Ӥ��K���X�o�H���W�r�A��b�ܹ藍�_�C
end

function LuaS_110286_6()
	SetSpeakDetail( OwnerID(), GetString("ST_110286_7")   );
	--/*�ڡK�K�ڤ~�S�������U�{�O�I��K�K�ڥu�O�]�����L���U�ҥH������e���L�A�ڭ̤����S�������L���Y�I�y�K�K�y�K�K�`���A�L�O�_�Ժ��[����Ҫ��@�Ӥp�h�L�A�s�����w�Q�A�W�r�ڤw�g�i�D�A�F�A�A�n����N�h��L�I�O�A�ӷЧڤF�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110286_7") , "LuaS_110286_EXIT", 0 )
	--/*�O���A���¤ҤH�����U�C
	SetFlag( OwnerID() , 540767 , 1 )
end

function LuaS_110286_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���

end