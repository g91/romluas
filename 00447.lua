Function LuaS_110122_0()

	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 420232 ) == true and CheckFlag(OwnerID() ,540788 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_1") , "LuaS_110122_1", 0 ) --/*���G�Ʈɶ��}�l�C
	end
	if CheckAcceptQuest( OwnerID() , 420544 ) == true and CountBodyItem( OwnerID() , 200680) == 0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_0") , "LuaS_110122_6", 0 ) --/*�A�n�@���@���šC
	end

end
--------------------------------------------------------------------
Function LuaS_110122_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_1")   );
	--/*�o�˪��_�I�ڭ̧��̪��y�H�N�`�`������F�A�ڷQť�@�ǳo�Ӧa��ť���쪺�G��......
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_2") , "LuaS_110122_2", 0 ) --/*��L���Z��R�������Ʊ�

end
--------------------------------------------------------------------
Function LuaS_110122_2()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_2")   );
	--/*�o�ӧ�ť�L�F�A�Z��R���`�`���H��ȩ��̡A�L�̳�������o�ǬG��......�A�S����L���G�ƶܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_3") , "LuaS_110122_3", 0 ) --/*��L�����p���y���Ʊ�

end
----------------------------------------------------------------------
Function LuaS_110122_3()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_3")   );
	--/*���p���y�H�L�̤��O�@�몺�H���ܡH������A�|���L�̫ܦM�I�H
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_4") , "LuaS_110122_4", 0 ) --/*��L���ŧ��w�d���Ȫ��Ʊ�

end
----------------------------------------------------------------------
Function LuaS_110122_4()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_4")   );
	--/*�ŧ�......��A�L�̸򦺤`���H�X�@�H�L���٦����L���Ǫ��X�@�ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_5") , "LuaS_110122_5", 0 ) --/*��L�����d���]�~���Ʊ�

end
----------------------------------------------------------------------
Function LuaS_110122_5()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_5")   );
	--/*�]�~�I�O���إ��j���]�~�ܡH����������p���y�M�]�~......�A�u���b��I�o�ǪF��H
	SetFlag( OwnerID() , 540788 , 1 )
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110122_6") , "LuaS_110122_0", 0 ) --/*�N�G�Ʀ���

end
----------------------------------------------------------------------
Function LuaS_110122_6()

	SetSpeakDetail( OwnerID(), GetString("ST_110122_6")   );
	--/*�Ьñ��A�C�@�����|���O�_�Q���C
	GiveBodyItem( OwnerID() , 200680 , 1 )

end