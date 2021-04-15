function LuaS_110268_0()

	if CheckFlag(OwnerID(),540213) == true and CheckFlag(OwnerID() ,540215) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_110268_0") );		--/*�A�K�K�ڥH���A�O�Ӧn�H�A�~��ڪ��B�ͰU�I���A�K�K�A���M�����L�I
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_1") , "LuaS_110268_1", 0 );		--/*�ڬO���F�A�n�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_0") , "LuaS_110268_EXIT", 0 ); 		--/*�ѯu���å�A�ڸ�A�S����n�����C
	else
		LoadQuestOption( OwnerID() )
	end

end

function LuaS_110268_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_1") );	--/*���F�ڦn�H���򬰤F�ڦn�I�A���P�_�o��ڬO�n�O�a�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_2") , "LuaS_110268_2", 0 ); 	--/*�L�O�Ӥ��Y�H�A�ӧA�O�ӤH���A�A���T�w�L�_��ᤣ�|�ˮ`�A�H
end

function LuaS_110268_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_2") );	--/*�L��M���|�ˮ`�ڡI�L�O�@�Ӧn���Y�H�I�ڭ̬O�B�͡I
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_3") , "LuaS_110268_3", 0 ); 	--/*�O�ڡI��L�ӻ��A�]�O�@�Ӧn�H���A�ҥH�L���|�ˮ`�A�C
end

function LuaS_110268_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_3") );	--/*�S���I�ڭ̤������ͽ˴N�O�p���K�K
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_4") , "LuaS_110268_4", 0 ); 	--/*���L�|���|�ˮ`��L���H���O�H
end

function LuaS_110268_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_4") );	--/*�L���|���I�]���ڬO�L���B�͡I�L���|�ˮ`�K�K
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_5") , "LuaS_110268_5", 0 ); 	--/*�N��A���L�o�ӪB�͡A�A�J���L���Y�H���|���_�Z���԰��ܡH
end

function LuaS_110268_5()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_5") );	--/*�L�M��L���Y�H���@�ˡI�L�O�n�����Y�H�K�K
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_6") , "LuaS_110268_6", 0 ); 	--/*�A���T�w�ˮ`�L���@�w�O�a�H�H�ӧA�ˮ`�����Y�H�@�w���O�n���Y�H�H
end

function LuaS_110268_6()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_6") );	--/*�ڡK�K�]���L�̷|�����ڡA�ҥH�L�̤��O�K�K
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_7") , "LuaS_110268_7", 0 ); 	--/*�A�]�{�ѫܦh�|�������Y�H���H���A�L�̳��O�a�H�ܡH
end

function LuaS_110268_7()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_7") );	--/*�o�K�K
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_8") , "LuaS_110268_8", 0 ); 	--/*�O�A�ѯu�F�I�����a�I�A�M���Ӥ��Y�H�p�G�b��L���p�U�۹J�A�A�̤@�w�|�����ݱ��C
end

function LuaS_110268_8()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_8") );	--/*�K�K
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_9") , "LuaS_110268_9", 0 ); 	--/*���Y�H�N�O���Y�H�A�H���N�O�H���A��Ӻرڵ��������ĤH�O�z�ҷ�M���A�P���O�n�O�a�L���C
end

function LuaS_110268_9()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_9") );	--/*�A���i�H�o�򻡡H�o�����_�w�F����P�ڭ̪��}���P���z�K�K
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_10") , "LuaS_110268_10", 0 ); 	--/*�o�N�O���z�I�{��N�O�o��ݻšI�p�G�A�O���b�a�����Q���٥i�H���˦ۤv�P�{��L���A���{�b�A�O�e�u���h�L�I�A�𦭭n����o�شݻŪ��ƹ�I
end

function LuaS_110268_10()
	SetSpeakDetail( OwnerID(), GetString("ST_110268_10") );	--/*�ڡK�K
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_11") , "LuaS_110268_11", 0 ); 	--/*�N��L���˦n�F�A���D�L���|�^����Y�H�������H���D�L���|��ۨ�L���Y�H�@�_�����H���H
	SetFlag( OwnerID() , 540215 , 1 )
end

function LuaS_110268_11()
	--SetSpeakDetail( OwnerID(), GetString("ST_110268_8") );	--/*�K�K
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110268_12") , "LuaS_110268_0", 0 ); 	--/*�p�G�A�̨�ɭԬ۹J�F�A�N��L�u���Q�O�@�A�A�L�@�o��ܡH�N��A�Q�O�@�L�A�A�@�o��ܡH
end

function LuaS_110268_EXIT()
	CloseSpeak( OwnerID() );	--������ܵ���
end

function LuaS_110268_CheckRune()
	if CountBodyItem( TargetID() , 201234 ) >= 1 then
		DelBodyItem ( TargetID() , 201234 , 1 )	
		return true
	else
		return false
	end
end