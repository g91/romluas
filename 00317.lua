function LuaS_110407_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 3 , "make" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest �O�N�Jorgid ���o questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--�����ܤ��e--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor ) > 80) then --�ˬd�W���j��80����
		SetSpeakDetail( OwnerID(), GetString ( "ST_110407_5" )   );--#��b�F���_�I�ݨӧڦ����D���ɭԤS�h�F�@�ӥi�H�бЪ��H�աI
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_MakeArmor ) == 80 )then --�ˬd���j�v��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110407_4" )   );--#�����I�ݨӧA�̪�L�o������I
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110407_3" )   );--#������A���{�פw�g�Q�������F�O�I���S�������i�@�B�ڡH�ڪ��D���`�ۭn�릳�ӻs�Ҥj�v���ǻ���I�ڬO�����D���Ӥj�v�O���O�ڻ{�Ѫ����ӤH�աI���L��Q�٬��j�v�A�@�w����������O����ɧA���C
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) < 40  then --���Ťp��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110407_2" )   );--#�u�r�H�A�ӧ�ڬO�Q�ǰ�¦���s�ҶܡH�o�譱�A�i�H�h��ͯS�A�o���M�f���`�`���A�����O�ӫܻ{�u���k�ĩO�I�o�@�w�|�ɤO�ЧA�F�誺�C
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor  ) == 40 ) then  --���ŵ���40�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110407_1" )   );--#�A�ݰ_�Ӥw�g����M���L�u�@�ޯ�F�O�I�H��ڸI��򨺨ǻ�즳�������D�A�|���ڧa�H�����I�٬O���ѧA�Q��䤤�@�ӱM��令�s�Ҫ��ܡA�ڤ]�ַܼN��������I
		end
		--################################--
	else --40~60�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110407_0")   );
		--/*�����I���Ǩ�A�Q�Ǫ��F��ܡH�٬O�A�Q�ǧ�Ϊ��H�@���I�A�Z�Ƴ��o�@�B�@�B�ӡA�`���@�ѧA��N�ڳo�̪��F������ǥh���C
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110407_1", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110407_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110407_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MAKEARMOR", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110407_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------