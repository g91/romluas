function LuaS_110815_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 2 , "collect" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest �O�N�Jorgid ���o questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--�����ܤ��e--
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Lumbering ) >= 80 )  then --�ˬd���j�v�H�W��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110815_5" )   );--#�ݨӧA�u���ܧV�O�O�I�{�b�j�a���b�ͽ׳o�ӥ@�ɤS�h�F�@�ӯ੺�A�ǻ�������H�C
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), "[SC_110815_MASTER_HINT]"  );--���ܥh�F�ԥ���
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) >= 40  then --���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110815_3" )   );--#�A�ӧ�ھǧ�h�޳N�ܡH���L���U�Ӫ��ҵ{�b�M�~�ɮv���B�����ͨ��̡A�A���ӥh��L�~
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering  ) == 20 ) then  --���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110815_2" )   );--#�A���ޥ��w�g��F�F�~�V�A���ݧA�ǤF����h��L���ޯ�A�ڬݼȮɤ]�S���h�l���߫�ǲߧ󰪲`�����޳N�F�C
		end
		--################################--
	else --0~40�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110815_0" )  );--/*�ڬO����Z����A�p�G�A�Q�Ǥ@�������쪺�ޥ��A�ڥi�H�ЧA�C
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110815_2", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

	if ( CheckFlag( OwnerID(), 540270) == true ) then --�p�G�|���
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );  --#�ڭn�p��~��ֳt�a���Ķ��ؼСH
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_WOOD") , "LuaS_AFTER_GATHER_WOOD", 0 ); --#�Чi�D�ګd�s���Ʊ��C		
	else  --�p�G���|���
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110815_1" ), "LuaS_110815_1", 0 );	--/*�ڷQ�ǲߥ��C
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110815_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110815_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110815_1")   );--/*��줣�O�u�n�ӶO��O�N���F�A�٦��\�h�ޥ��b�̭��C�@���_��쪺�H�A�|�]�����Y�ӭ��_�I
								--/*�Q�n��쥲�����n���@��X�⪺�u��A�ڳo�̭�n���h�@��u�H�誺����v�A�A�N���h�a�I
								--/*�M��A�n�N����˳ư_�ӡA���i�H��諸����A��۾����U�ƹ�����N�Y�i�H�F�C
								--/*�b��@���A�|��F�ѳo�ǰʧ@�A�쫰�~�h�ոլݧa�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110815_3", 0 );--
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110815_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN")   );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_LUMBERING", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110815_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110815_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_LUMBERING_Dialog", 0 )

end
--------------------------------------------------------------------------------------------------------------------------