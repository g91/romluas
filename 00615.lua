function LuaS_110814_0()
	--�p�G���a�i�Υͬ��ޯ���ȤW���w���A�R����
	local npc = TargetID();
	local tolimit = LuaFunction_IsRestrction( 2 , "collect" ) == false;
	if tolimit then
		local org = ReadRoleValue(npc, EM_RoleValue_OrgID);
		--LuaFunction_identifyquest �O�N�Jorgid ���o questid
		local questid=LuaFunction_identifyquest(org);
		if questid and CheckAcceptQuest(OwnerID(), questid) then
			DeleteQuest(OwnerID(), questid);
		end
	end
--�����ܤ��e--
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Mining ) >= 80 )  then --�ˬd���j�v�H�W��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110814_5" )   );--#�F���_�I�A�����N�w�g�W�L�ڤF�I
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), "[SC_110814_MASTER_HINT]"  );--���ܥh�F�ԥ���
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining ) >= 40  then --���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110814_3" )   );--#�����I�ڪ��{�רS��k�A�ЧA����F�A�A�ӥh��M�~�ɮv�ڮ��D�}��ǲߤF�a�I
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Mining  ) == 20 ) then  --���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F����
			SetSpeakDetail( OwnerID(), GetString ( "ST_110814_2" )   );--#�A���ޯ�w�g���媺�ܤ����աI�i���A�A�ǤF�Ӧh��L���ޯ�A�o�˧ڴN�S��k�Ǳ§A�u�K�����Z�o�I
		end
		--################################--
	else --0~40�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110814_0")   );--/*�ڴN�O�q�u�u�Y�ڸ��S�A������q���Ʊ����ްݧڡI�ڤ��@�w���o�X�ӴN�O�F�A�����I
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining ) >= 40) then --�֦��u�K�H�W���h�X�{�i�H����檺�ﶵ
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110814_2", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

	if ( CheckFlag( OwnerID(), 540269 ) == true ) then --�p�G�|���q
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );--#�ڭn�p��~��ֳt�a���Ķ��ؼСH
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_MINE") , "LuaS_AFTER_GATHER_MINE", 0 );--#�Чi�D��������媺�Ʊ��C			
	else  --�p�G���|���q
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_110814_1") , "LuaS_110814_1", 0 );--#�ڷQ�ǲ߫��q�C
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110814_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110814_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110814_1")   );--/*�A�Q�ǫ��q�ڡI�ڪ��T�i�H�ЧA�@�I��¦���A�����q�ܨ��W��I
								--/*�����A�A�������@�Ӥu��A�ڥ��e�A�@�ӧa�I
								--/*�A�n�N�o�ӡu���W���Q�r��v�˳ư_�ӡA�M����q���I������N�i�H���q�F�C
								--/*�ڴN�ЧA�o�ǡA���U�ӧA�N��@���q���ںt�m�a�I
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110814_3", 0 );--

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110814_2()

	SetSpeakDetail( OwnerID(),GetString( "ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MINING", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110814_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_110814_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_MINING_Dialog", 0 )

end

--------------------------------------------------------------------------------------------------------------------------