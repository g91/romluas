function LuaS_110195_0()

	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest(OwnerID(),420041) == true then
		if CountBodyItem(OwnerID(),200066) >= 1 then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110195_1" ), "LuaS_110195_1", 0 ) --/*�յ۶}���_�c
		else
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110195_1" ), "LuaS_110195_2", 0 ) --/*�յ۶}���_�c
		end
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110195_0") , "LuaS_110195_EXIT", 0 ); --/*�������	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110195_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110195_1")   );
	--/*�A���}�F��A�c�l�̭��O�ө_�Ǫ��˸m�C
	--/*�˸m�W���ӼаO�P���T��̤������٫��ۦP�A�o�i��]�O��̤������F��a�I
	--/*�A���ӱN�o�ӪF�讳�^�h���p�F�A�����w�o��ױ��঳�����U�C
	if CountBodyItem(OwnerID(),200066) >= 1 then
		DelBodyItem( OwnerID() , 200066 , 1 )
		GiveBodyItem( OwnerID(),200035,1 )
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110195_0") , "LuaS_110195_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110195_2()

	SetSpeakDetail( OwnerID(),GetString("ST_110195_2")   );
	--/*�A�L�k�ΤO�q���]�k�}�a�o����A�p�G�}�a�c�l���ܡA�̭����F��i��]�|�@�_�Q�}�a���C
	--/*�ݨ��٬O�����h��o���ꪺ�_�ͤ~��C
	--/*�_�ͫܥi��N�b����Y�ӯ��p���y���{���W�a�I
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110195_0") , "LuaS_110195_EXIT", 0 ); --/*�������

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110195_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���
end