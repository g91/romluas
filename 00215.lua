function LuaS_110389_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith  ) > 80) then --�ˬd�W���j��80����
		SetSpeakDetail( OwnerID(), GetString ( "ST_110389_5" )   );--#�O�ܡH�A�w�g��F�F�o�ӹҬɤF�ڡC�ڦb�o�ӻ�줤�k���F�A���A�o����d�F�U�ӡA�γ\�O�A�٨S��|��ک���|���A��......�γ\�O......�A�w�g��|����٥�����|��......
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_BlackSmith  ) == 80 )then --�ˬd���j�v��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110389_4" )   );--#�{�b�A�w�g���b�ۤv���K�K�����W�F�A�A�n�k���]�n�A�n�Ӿ�]�n�A���A����N�z�A�o����˱���y�v���L�Y�H�Χ_�w�A�һs�y���Z���A�ӧ_�w�ۤv�@�~���H�N�|���ڤ@�ˡA�ڤ��Ʊ�A�ݨ�ڨ��W���d�@�o�ͤF�C
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110389_3" )   );--#�A�����K�޳N�w�g�ܤ����F�A�i�H���󰪪��Ҭ��ڶi�A���ڦb�K�K�����W�w�g�O�ӫ������H�A�L�k�b���U�A����F�F�A�p�G�����ߦb�o�����W�e�i�A�h���`�ۭn��a�I���̦��̴Ϊ��K�K�A�L�̩γ\���H�|���D�֯�����U�A�C
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) < 40  then --���Ťp��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110389_2" )   );--#�A�ӬO�Q��ھǥ��K�ܡH�ڬݧA�s�K�񳣮����n�A�A�Q���٬O�h�䧢��a�I�u�n�o���n�S�h����ӫ_�I�̨p�|���ܡA���ӴN�b�o����C
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith  ) == 40 ) then  --���ŵ���40�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit then
			LoadQuestOption( OwnerID() );
		end
		--################################--
	else --40~60�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110389_0")   );--/*�O�A�ڬO�M�~�K�K�ɮv�F���M�ڪ��u�@�O���ɨ�L�H�޳N�A���ګ��i�A�ɶq���n�ӷЧڡC
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith ) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110389_1", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110389_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110389_1()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_BLACKSMITH", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110389_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
-------------------------------------------------------------------------------------------------------------------------