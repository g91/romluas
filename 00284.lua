function LuaS_110070_0()
	SetSpeakDetail( OwnerID(), GetString("ST_110070_0")   );
	--/*�K�K�K......�ڻD��A���W���������D�F�A�ڴN�O�H�ٯT�ݨF��������y�H�A�A�O�n���ΧڶܡH
	--  �٬O�n��ڶR�����H	
	if CheckFlag(OwnerID() , 540766 ) ~= true and CheckFlag( OwnerID() , 540254 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_1") , "LuaS_110070_1", 0 )
		--/*ť���A�o�̦��d�ҥd���쪺�ӫa
	end
	if CheckFlag(OwnerID() , 540766 ) == true and CheckAcceptQuest(OwnerID(),420305) == false then
		LoadQuestOption( OwnerID() )
	end
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_0") , "LuaS_110070_EXIT", 0 );
	--/*�������
end

function LuaS_110070_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110070_1")   );
	--/*�ӫa�H��K�K�ڷQ�Q�K�K�S���A�̪�ڨS�����L���ӫa�o�˪��F��C

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_2") , "LuaS_110070_2", 0 );
	--/*�O�ܡH��p�A�ݨӧڱo�쪺�������G�O���~���C
end

function LuaS_110070_2()
	SetSpeakDetail( OwnerID(), GetString("ST_110070_2")   );
	--/*�����I�ڦn���S���@�I�L�H�A�ڦn�����T���L�@�Ӭӫa�C

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_3") , "LuaS_110070_3", 0 );
	--/*��K�K���A�쩳���S���o��L�@�Ӭӫa�H
end

function LuaS_110070_3()
	SetSpeakDetail( OwnerID(), GetString("ST_110070_3")   );
	--/*�o�ӶܡK�K�]���ڥH�e�b�԰����Y���L�ˡA�ҥH���ǨƱ��|��M�ѰO�S��M�Q�_�ӡA���L���@�˪F��i�H�Ȯ����U��o�ӯg���A�γ\�A�൹�ڤ@�ǳo�تF��A�ڴN�i�H�i�D�A�T���������C

	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_4") , "LuaS_110070_4", 0 );
	--/*���تF��s�����a�H�A�ݭn�h�֤~�����o��[�g��]�����H
end

function LuaS_110070_4()
	SetSpeakDetail( OwnerID(), GetString("ST_110070_4")   );
	--/*�K�K�K�K���o���H����D�u�O�بɨ��A�u�n��3�ȡA�ڴN�|�O�_�ӳo�Ӯ����F�C
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 300 then 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_5") , "LuaS_110070_5", 0 );
		--/*�n�C
	end
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_6") , "LuaS_110070_EXIT", 0 );
	--/*�ڷ|�Ҽ{�A����ĳ�C
end

function LuaS_110070_5()
	if CheckFlag( OwnerID() , 540766 ) ~= true then
		AddRoleValue ( OwnerID() , EM_RoleValue_Money,-300 )
		Setflag( OwnerID() , 540766 , 1 )
	end
	LoadQuestOption( OwnerID() )
--	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110070_0") , "LuaS_110070_EXIT", 0 );
	--/*�������
end

function LuaS_110070_EXIT()

	CloseSpeak( OwnerID() );	--������ܵ���

end