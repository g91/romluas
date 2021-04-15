function LuaS_110416_0()
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
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) > 80) then --�ˬd�W���j��80����
		SetSpeakDetail( OwnerID(), GetString ( "ST_110416_5" )   );--#�A���ǩ_�G�Ƥw�g�ǹM�F�o�ӥ@�ɡI�ڭn�V�A�P�q�I
	elseif ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Mining ) == 80 )then --�ˬd���j�v��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110416_4" )   );--#�u�O�ȱo�Y���ڡI�A�]��������ڽͽ��q�����{�פF�O�I
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110416_3" )   );--#�p�G�A�Q���󰪹Ҭ��ڶi�A�N�h�M��ǻ������q���j�v�a�Iť�����`�ۭn�릳�L�������C
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) < 40  then --���Ťp��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110416_2" )   );--#�M�~���Ķ��V�m�v�A�ڮ��D�}��A�A�n�A�ڥi�H�N�A�V�m���̴Ϊ����q�v�A���L�b�����e�A�A�������V�ڸ��S�Ƿ|�򥻪������~��C
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining  ) == 40 ) then  --���ŵ���40�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110416_1" )   );--#�A�Q�n�}�ħ�öQ���q���ܡH���A�����n�ǲߧ󰪲`�����ѡA�ӳo�����n�����A��h���믫�A���A��������믫���ɭԦA�ӧ�ڧa�I
		end
		--################################--
	else --40~60�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110416_0")   );		--/*�M�~���Ķ��V�m�v�A�ڮ��D�}��A�A�n�A�ڥi�H�N�A�V�m���̴Ϊ����q�v�C
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110416_1", 0 ) --/*���C�ثe���
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110416_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110416_1()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MINING", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110416_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------