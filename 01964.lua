function LuaS_115955_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 4 , "make" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest �O�N�Jorgid ���o questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--�����ܤ��e--
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 80  then --�ثe�u�}���80��
		SetSpeakDetail( OwnerID(), "[ST_115955_2]"   );--#
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 60 ) then  --���ŵ���40�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), "[ST_115955_1]"   );--#
		end
		--################################--
	else --60~80�Ū����
		SetSpeakDetail( OwnerID(), "[ST_115955_0]"   );
		--/*
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy ) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_115955_1", 0 ) --/*�ڷQ���ثe�����
	end 

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_115955_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_ALCHEMY", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_115955_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC
end
--------------------------------------------------------------------------------------------------------------------------