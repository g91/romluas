--EM_RoleValue_Skill_BlackSmith 	= Value; Value = Value + 1;	--15	���K
--EM_RoleValue_Skill_Carpenter 	= Value; Value = Value + 1;	--16	��u
--EM_RoleValue_Skill_MakeArmor 	= Value; Value = Value + 1;	--17	�s��
--EM_RoleValue_Skill_Tailor	= Value; Value = Value + 1;	--18	���_
--EM_RoleValue_Skill_Cook	= Value; Value = Value + 1;	--19	�i��
--EM_RoleValue_Skill_Alchemy	= Value; Value = Value + 1;	--20	�Ҫ�
--EM_RoleValue_Skill_Mining	= Value; Value = Value + 1;	--21	���q
--EM_RoleValue_Skill_Lumbering	= Value; Value = Value + 1;	--22	���
--EM_RoleValue_Skill_Herblism	= Value; Value = Value + 1;	--23	����


--�ǩ__�Ҫ�_0
function LuaS_122403_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--��ܤ��e���
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--���ߧA�F�A�A�w�g�b�o�ӻ�줧����F�F�̰����ҬɡC
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy  ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--�b�P�@��Ʊ��W�M�ߡA�~��컷�n�p�y�����ҬɡA���O�A�ҾǤӦh�F�C
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122403]" );
	end

	--��ܿﶵ����G�ڷQ���ثe�����
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Alchemy ) >= 60) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122403_1", 0 )
	end 

	--�`�A��ܿﶵ�G�ڷQ�ݬݧA�檺�t��G����ǩ_�t��
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )	

end
--�ǩ__�Ҫ�_1
function LuaS_122403_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_ALCHEMY", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122403_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
-------------------------------------------------------------------------------------------------------------------------
--�ǩ__�i��_0
function LuaS_122404_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--��ܤ��e���
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--���ߧA�F�A�A�w�g�b�o�ӻ�줧����F�F�̰����ҬɡC
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--�b�P�@��Ʊ��W�M�ߡA�~��컷�n�p�y�����ҬɡA���O�A�ҾǤӦh�F�C
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122404]" );
	end

	--��ܿﶵ����G�ڷQ���ثe�����
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Cook ) >= 60) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122404_1", 0 )
	end 

	--�`�A��ܿﶵ�G�ڷQ�ݬݧA�檺�t��G����ǩ_�t��
	--AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )	

end
--�ǩ__�i��_1
function LuaS_122404_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_COOK", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122404_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
-------------------------------------------------------------------------------------------------------------------------
--�ǩ__��u_0
function LuaS_122405_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--��ܤ��e���
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--���ߧA�F�A�A�w�g�b�o�ӻ�줧����F�F�̰����ҬɡC
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--�b�P�@��Ʊ��W�M�ߡA�~��컷�n�p�y�����ҬɡA���O�A�ҾǤӦh�F�C
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122405]" );
	end

	--��ܿﶵ����G�ڷQ���ثe�����
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Carpenter ) >= 60) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122405_1", 0 )
	end 

	--�`�A��ܿﶵ�G�ڷQ�ݬݧA�檺�t��G����ǩ_�t��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )	

end
--�ǩ__��u_1
function LuaS_122405_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_CARPENTER", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122405_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
-------------------------------------------------------------------------------------------------------------------------
--�ǩ__���K_0
function LuaS_122406_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--��ܤ��e���
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--���ߧA�F�A�A�w�g�b�o�ӻ�줧����F�F�̰����ҬɡC
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_BlackSmith ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--�b�P�@��Ʊ��W�M�ߡA�~��컷�n�p�y�����ҬɡA���O�A�ҾǤӦh�F�C
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122406]" );
	end

	--��ܿﶵ����G�ڷQ���ثe�����
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_BlackSmith ) >= 60) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122406_1", 0 )
	end 
	--�`�A��ܿﶵ�G�ڷQ�ݬݧA�檺�t��G����ǩ_�t��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )	
end
--�ǩ__���K_1
function LuaS_122406_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_BLACKSMITH", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122406_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
-------------------------------------------------------------------------------------------------------------------------
--�ǩ__���__0
function LuaS_122407_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--��ܤ��e���
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--���ߧA�F�A�A�w�g�b�o�ӻ�줧����F�F�̰����ҬɡC
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--�b�P�@��Ʊ��W�M�ߡA�~��컷�n�p�y�����ҬɡA���O�A�ҾǤӦh�F�C
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122407]" );
	end

	--��ܿﶵ����G�ڷQ���ثe�����
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Tailor ) >= 60) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122407_1", 0 )
	end 
	--�`�A��ܿﶵ�G�ڷQ�ݬݧA�檺�t��G����ǩ_�t��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )
end
--�ǩ__���__1
function LuaS_122407_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_TAILOR", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122407_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC
end
-------------------------------------------------------------------------------------------------------------------------
--�ǩ__�ҭH_0
function LuaS_122408_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "make" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--��ܤ��e���
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--���ߧA�F�A�A�w�g�b�o�ӻ�줧����F�F�̰����ҬɡC
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--�b�P�@��Ʊ��W�M�ߡA�~��컷�n�p�y�����ҬɡA���O�A�ҾǤӦh�F�C
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122408]" );
	end

	--��ܿﶵ����G�ڷQ���ثe�����
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_MakeArmor ) >= 60) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122408_1", 0 )
	end 
	--�`�A��ܿﶵ�G�ڷQ�ݬݧA�檺�t��G����ǩ_�t��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )
end
--�ǩ__�ҭH_1
function LuaS_122408_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MAKEARMOR", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122408_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC
end
-------------------------------------------------------------------------------------------------------------------------
--�ǩ__�į�_0
function LuaS_122409_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "collect" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--��ܤ��e���
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--���ߧA�F�A�A�w�g�b�o�ӻ�줧����F�F�̰����ҬɡC
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--�b�P�@��Ʊ��W�M�ߡA�~��컷�n�p�y�����ҬɡA���O�A�ҾǤӦh�F�C
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122409]" );
	end

	--��ܿﶵ����G�ڷQ���ثe�����
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Herblism ) >= 60) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122409_1", 0 )
	end 
	--�`�A��ܿﶵ�G�ڷQ�ݬݧA�檺�t��G����ǩ_�t��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )
end
--�ǩ__�į�_1
function LuaS_122409_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_HERBLISM", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122409_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC
end
-------------------------------------------------------------------------------------------------------------------------
--�ǩ__���_0
function LuaS_122410_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "collect" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--��ܤ��e���
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--���ߧA�F�A�A�w�g�b�o�ӻ�줧����F�F�̰����ҬɡC
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Lumbering ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--�b�P�@��Ʊ��W�M�ߡA�~��컷�n�p�y�����ҬɡA���O�A�ҾǤӦh�F�C
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122410]" );
	end

	--��ܿﶵ����G�ڷQ���ثe�����
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Lumbering ) >= 60) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122410_1", 0 )
	end 
	--�`�A��ܿﶵ�G�ڷQ�ݬݧA�檺�t��G����ǩ_�t��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )
end
--�ǩ__���_1
function LuaS_122410_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_LUMBERING", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122410_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC
end
-------------------------------------------------------------------------------------------------------------------------
--�ǩ__���q_0
function LuaS_122411_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 5 , "collect" ) == false;
		if tolimit then
			local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
			local questid=LuaFunction_identifyquest(org);
				if questid and CheckAcceptQuest(OwnerID(), questid) then
					DeleteQuest(OwnerID(), questid);
				end
		end
	--��ܤ��e���
	if ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) == 100  then
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_HIGHTEST]" );	--���ߧA�F�A�A�w�g�b�o�ӻ�줧����F�F�̰����ҬɡC
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) == 80 ) then
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else
			SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_OVER]"   );	--�b�P�@��Ʊ��W�M�ߡA�~��컷�n�p�y�����ҬɡA���O�A�ҾǤӦh�F�C
		end
	else 
		SetSpeakDetail( OwnerID(), "[SC_WORKSKILL_122411]" );
	end

	--��ܿﶵ����G�ڷQ���ثe�����
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_Skill_Mining ) >= 60) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_122411_1", 0 )
	end 
	--�`�A��ܿﶵ�G�ڷQ�ݬݧA�檺�t��G����ǩ_�t��
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_Com_SpeakOpenRecipeList", 0 )
end
--�ǩ__���q_1
function LuaS_122411_1()
	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MINING", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_122411_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC
end
-------------------------------------------------------------------------------------------------------------------------