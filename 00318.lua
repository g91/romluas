function LuaS_110409_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 2 , "make" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest �O�N�Jorgid ���o questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--�����ܤ��e--
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_BlackSmith  ) == 80 )  then --�ˬd���j�v��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110409_5" )   );--#�̼����˪��ǻ��A�޳N���W���K�K�A�A���G�Ƴ��w�g�Q���ǶħL������F�C�`���A���ߡA�A�����@�ӤQ���u�q���K�K�F�O�I
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110409_4" )   );--#��...�n���A�����K��i�@�B�ڡH���j���u�����ӳQ�٬����K�j�v��......���L�L���Ƨڤ��Q�h���C��p�A�A�ۤv�h���`�ۭn��ݧa�I
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) >= 40  then --���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110409_3" )   );--#�޳ޡ�کM�A�������о����Y�w�g�����աI���U�ӦA��ڭn�t�~���O�o�I�A���ӥh�䨺��ѬO�\�i���y���M��ɮv���Ԯ�~��C
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith  ) == 20 ) then  --���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110409_2" )   );--#�u�O�����F�A�̡A�o��ִN����~��`�y���K�աH���L�H�U���ӹ��I��L�a��]�[�o�o�I
		end
		--################################--
	else --0~40�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110409_0")   );
		--/*�ڬO�K�K����D�v�K���A���n�ݧڨS��u�@�A�N�h�çڪ��޳N�A�ܦh�ħL�����W�ڴ��L�̥��y�L���O�I�]�����֤H��ھǥ��K��I
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110409_2", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

	if ( ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_BlackSmith ) > 0) then --�p�G�|���K
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#�ڭn���ǲ߷s���s�y�κ���H	
	else  --�p�G���|���K
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110409_1") , "LuaS_110409_1", 0 );	--/*�گu���ܷQ�ǥ��K�C
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110409_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110409_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110409_1")   );--/*�Ʊ�A���O��۪������ߺA�A���M�ڭ̤]�������O�ɶ��F�C
								--���}�t�ΦC�����u�ͬ��ޯ�v��ܡu���K�v�A�ݬݧA�Q�s�y���F��ݭn�ݭn���ǧ��ơA�p�G�A���䦳���K���㪺�ܴN�i�H�i��s�y�F�C
								--�ڥu�лs�y�@��²�檺�F��A��L�N�n�a�A�ۤv�F�C

	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110409_3", 0 );--
	
end
-------------------------------------------------------------------------------------------------------------------------
function LuaS_110409_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_BLACKSMITH", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110409_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end

-------------------------------------------------------------------------------------------------------------------------
function LuaS_110409_3()

	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_BLACKSMITH_Dialog", 0 )


end