function LuaS_110411_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook ) > 80) then --�ˬd�W���j��80����
		SetSpeakDetail( OwnerID(), GetString ( "ST_110411_5" )   );--#���b���I���Pı�p��H���̪������٤��O�کүਣ�Ѫ��A�A��i�D�ڡA�٦������ڭ̪��p�v�F���~��l�D���A�󰶤j���ҬɶܡH
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Cook ) == 80 )then --�ˬd���j�v��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110411_4" )   );--#�A�]����|����������j�ҬɤF�a�I���o�٤��O���I�A�i���N�O�_�I�I�d�U�O���h�l�D�_�I���߰ڡI
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110411_3" )   );--#�u�����p�v�ڡ����ӭn�h���C�|��I�ڦ]���@�ǳd���Ӱ��d�󦹡A���ڪ��B�ͥ��b�Y�B�l�M�کҤ����D�������A�p�G�A�ݭn�ݨ�W�V�{�b�������A�N�h��L�a�I�h�䨺�ӳQ�٬��i���j�v���H�I�ڳ̫�o�쪺�����A�ڥL���g�b���`�ۭn��ݹL�@�}�l�A�������Ӧ��L���u���C
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) < 40  then --���Ťp��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110411_2" )   );--#�������I�O�o�Ӭ������\�I�a��A�Ө�ڭ��e���ܡH�Q�ۤv�s�@�o�˪������ܡH�h�ǲߧa�I�h�򰨪L�ǲߧa�I�u���i�J�����������H�A�ڤ~����N�����������i�}�b�L�����e�I
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook  ) == 40 ) then  --���ŵ���40�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110411_1" )   );--#�A�i���������٦b�ܡH�Q�~��l�D��������_�������ܡH�A�Q�����M�몺�@���l�ܡH���F�M�D�i�����M��A�ݭn�α˹��L�u�@�ޯ઺�ߦn�A�A�u���ܫO�d��L��ӱM�몺�u�@�ޯ�F�p�G�o���O�A�һݭn���A���N���}�a�I���A�H�ɳ��i�H�^�ӡA���s�^��i�����D�W�C
		end
		--################################--
	else --40~60�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110411_0")   );
		--/*�A�D��o�D�檺�����F�ܡH�S�ݨ��H��M�A�]�����٨S�N�A���u�����p�v�b�氵�X�Ӥ��e�A�N�w�g�i�H�D��o�D�檺���B����o�D�檺���C
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110411_1", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110411_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110411_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_COOK", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110411_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------