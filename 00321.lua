function LuaS_110414_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism ) > 80) then --�ˬd�W���j��80����
		SetSpeakDetail( OwnerID(), GetString ( "ST_110414_5" )   );--#�A�O�ڳ�ź�ƪ��ǥ͡I�C�X���ŧ�ө��ŰڡI�ڬO�b�Ӱ����F�I�A���D�ܡH�C��ť��O�H���_�A���Ʊ��A�ڳ��P�ʲ��W......�u��......�ӥO�H�P�ʤF......
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Herblism ) == 80 )then --�ˬd���j�v��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110414_4" )   );--#�N�O�o�ˤl�I�N�O�o�ˤl�I��F�o�ӹҬɤ���A�N�O�n�~��ǲߡI�ӧa�I���ڭ̨ӽͽͨ����į�a�I
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110414_3" )   );--#�A�O���u�q���ǥ͡I�u�q��ڷQ��کҦ������ѥ浹�A�A�����D�A�@���@�N�H���I�u���A�@�N�]����A�٬O�o���j�v�оɧA�����䪺�����~��A���Ĥj�v�A���D�ܡH��A�����D�]�O���Ӫ��A�����s�ڤ]�ܤ[�S�L�������F�A���L���`�ۭn��n�����H���D�A�����w�쨺�̥h�A�N����L�F�C
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) < 40  then --���Ťp��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110414_2" )   );--#�A�ܦ��W�i�ߡI���O�ڤ���N�o�˱ЧA�A�A�]����N�o�˨ӾǡA�d������l�󨬤U�A�A�������Ƿ|�e�����ҵ{�A�ڤ~����ЧA�᭱�������F�ܩ�e�����ҵ{�A�ڪ��ǥͮR��O�ӫܦ��@�ߪ��H�A�o�|�J�Ӧa�оɧA���ǽҵ{���C
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism  ) == 40 ) then  --���ŵ���40�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110414_1" )   );--#����I����I�A�����ľǵ{�פw�g�J��~�V�F�A���D�ܡH�����M�i�H�оɧA�A���p�G�A�Q�M��A�t�~�T�ؤu�@�W�����ܡA�ڦb���|�Ф]�O�S�Ϊ��C
		end
		--################################--
	else --40~60�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110414_0")   );
		--/*�M�~���Ķ��V�m�v�A���B�D�}��A�A�n�A�ڥi�H�N�A�V�m���̴Ϊ����Įv�C
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110414_1", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110414_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110414_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_HERBLISM", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110414_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------