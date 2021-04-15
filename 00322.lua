function LuaS_110415_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 3 , "collect" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest �O�N�Jorgid ���o questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--�����ܤ��e--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering ) > 80) then --�ˬd�W���j��80����
		SetSpeakDetail( OwnerID(), GetString ( "ST_110415_5" )   );--#�A�w�g�l�y�F�ǻ��A�ڴ��ݵۧ�h����A���ǻ��X�{�C
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Lumbering ) == 80 )then --�ˬd���j�v��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110415_4" )   );--#����M�A�ͽ�������Y�����ѯu�O�O�H�P�찪���C
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110415_3" )   );--#�A�ܤW�i�A���p�G�A�n�A�i�@�B�A�N������������A���j�v������F�Ӧ��窺�Ĥ@�B�N�O���L�A�ߤ@�������b���`�ۭn�뤧���A�����쪺�ܴN�h�ݬݧa�I
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) < 40  then --���Ťp��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110415_2" )   );--#�Q����ѡA�ڦp�G�q��¦�}�l�ЧA���A�N�S���ɶ��оɨ�L�ӴM�D�M�몾�Ѫ��H�A���L���B���O�A���䪺�J���ɮv��������ڤ���o�ӳd���C
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering  ) == 40 ) then  --���ŵ���40�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110415_1" )   );--#�@�ӤH�n�M��T�˥H�W���u�@�ޯ�O���i�઺�A�p�G�A���߾ǲߧ󰪲`����쪾�ѡA�A�����n��ı���A������T�ӧA�ү��ܪ��M�뤧�@�~��C
		end
		--################################--
	else --40~60�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110415_0")   );
		--/*�M�~���Ķ��V�m�v�A���B���D�d�S�A������Y�����ѧڥi�H�Ǳµ��A�A�o�N�O�ڪ��u�@�C
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110415_1", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110415_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110415_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_LUMBERING", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110415_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------