function LuaS_110387_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Carpenter ) > 80) then --�ˬd�W���j��80����
		SetSpeakDetail( OwnerID(), GetString ( "ST_110387_5" )   );--#���I�o���O���Ӷǩ_����u�j�v�ܡH�S�Q��A�|�S�a�Ӭݧڪ��o���O�I�ڡH���O�ڡH
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Carpenter  ) == 80 )then --�ˬd���j�v��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110387_4" )   );--#�A����u�޳N�u�ΰڡI�ڭ̩γ\�i�H�ͽ�����o������......���A�O�����u���Ʊ��C
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110387_3" )   );--#�A���{�׫ܦ������o�I�M�~����I�ڥi�H���ЧA�{�Ѥ@�ӤH�A�L�O�o���j�v�I��L��......�ڡH��p�A�A�O�n����u�o�i�a�H�o�˪��ܴN�O�n����`�ۭn��h�A���ئ���u�j�v�������A��F�A�A�u�����Q�{�ѵo���j�v�ܡH�L�s���ն�w�A�O�ڪ��n��......
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter ) < 40  then --���Ťp��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110387_2" )   );--#�x�H�A�ӧ�ھǤ�u���ܡH�Ӥ��|......���I�S�������g�k�f�S�ǤF�a�I�ܩ�p�A�o�O�کf�f�A�q�p�N�@���g�g�k�k���A�Ф��n�b�N�A�o�γ\�u�O�ѰO�ۤv�O�J����u�ɮv�A�h��o���X���o�٬O�|�O�_�Ӫ��C
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter ) == 40 ) then  --���ŵ���40�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit then
			LoadQuestOption( OwnerID() );
		end
		--################################--
	else --40~60�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110387_0")   );--/*��u�u�Y�N���D�d���S�A�A�n�A�Q�ǲߤ�u�i�H�ӧ�ڡA�t�~�ڪ�����O�o���H���J��C
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Carpenter ) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110387_1", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110387_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110387_1()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN")   );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_CARPENTER", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110387_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------