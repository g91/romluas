function LuaS_110406_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy  ) > 80) then --�ˬd�W���j��80����
		SetSpeakDetail( OwnerID(), GetString ( "ST_110406_5" )   );--#�F�H�I�A�O�u�f�ܡH�A�u���O���ӷs���ǩ_�Ҫ��v�ܡH
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Alchemy  ) == 80 )then --�ˬd���j�v��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110406_4" )   );--#���r�r��S�Q��M�ڦP���Ū��Ҫ��v�]�n�ӽбЧڡA�گu�O��ۤv���~��P����_�ڡI
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110406_3" )   );--#���A�ݰ_�ӹ�Ҫ��N�w�g�Z���߱o�F���I���M�٬O�񤣤W�ں����աI���ڤ@�V�֩󴣩ޫ�i�A�ڴN�i�D�A���`�ۭn�먺�̥i�H���Ҫ��N�j�v�������a�I���L�j�v���W�r�O.....�O����K�㵪�קA���Ӧۤv�h��X�ӳ��
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) < 40  then --���Ťp��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110406_2" )   );--#�򥻪��Ҫ��N�n�����ǳ�I���M�o�٤������A���Ф��ξ�ߡA�ں����|�n�n�n�ۦo�ЧA
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 40 ) then  --���ŵ���40�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110406_1" )   );--#���r�I�S���H�ӧ䥻�p�j�F�I���L�ڡ�p�G�A�O���ƭn�������A�ڪ���{�w�g�ƨ�U�Ӥ�F�A�p�G�A�Q��ھǲ߱M�~���Ҫ��N�A�A���ݬݦۤv�����a�I�A�H���A��ǶW�L�T�ӱM��ޯ�ܡH
		end
		--################################--
	else --40~60�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110406_0")   );
		--/*��H�A�s���p�j�O�Q������H�ګ��I�A���D���p�j�O�Ҫ��@�a�ڧJ�K���S�a�ڤ��̦����z���H�A�ҥH�Q�n��ھǲ߬O�a�I
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy ) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110406_1", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110406_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110406_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_ALCHEMY", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110406_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC
end
--------------------------------------------------------------------------------------------------------------------------