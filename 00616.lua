function LuaS_110816_0()
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
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Herblism ) >= 80 )  then --�ˬd���j�v�H�W��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110816_5" )   );--#�A���Ӥw�g�౵Ĳ��o�Ӧ۵M�������F�a�H�ڰJ�ߦa���A�P�찪���C
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), "[SC_110816_MASTER_HINT]"  );--���ܥh�F�ԥ���
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) >= 40  then --���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110816_3" )   );--#�A�u�����u�q�A���M���f�k�h���I�G�o�A���o�����ѻ��ө�ڡA�ڧƱ�A���o�n�n�ǲߡC
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Herblism ) == 20 ) then  --���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110816_2" )   );--#�A���G���L���u�@�ޯ���������A���p�G�A�@�N�Ŷ��X�@�I�믫�ӾǲߡA���٬O�ַܼN�ЧA�u�K�Ū����Ī��ѡC
		end
		--################################--
	else --0~40�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110816_0")   );--/*�ڬO���Įv�R��A�ګַܼN�P�A���������į󪺪��ѡC
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG" ), "LuaS_110816_2", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

	if ( CheckFlag( OwnerID(), 540333) == true ) then --�p�G�|����
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_GATHER_SAY") , "LuaS_GATHER_SAY", 0 );  --#�ڭn�p��~��ֳt�a���Ķ��ؼСH
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_AFTER_GATHER_HERB") , "LuaS_AFTER_GATHER_HERB", 0 ); --#�Чi�D�ڴ��Ҫ��Ʊ��C	
	else  --�p�G���|����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110816_1") , "LuaS_110816_1", 0 );	--/*�ڷQ�ǲ߱��ġC
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110816_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110816_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110816_1" )  );
	--/*�ګܰ����A�@�N�ǲ߳o�Ǫ��ѡA���ĬO�@���ݭn�@�ߥH�βӤߪ��u�@�A�A�ݰ_�ӴN�Pı�ܦX�A�C
	--/*���ĮɡA����O���i�ίʪ��A�o��u�J�����p��l�v�N��O�ڰe�A������§�a�I
	--/*��A�⥦�˳ư_�ӥH��A�����I���A�ҧ�쪺�į�K�|�}�l�Ķ��C
	--/*���~�����@�ǹs�P���į��O�A�h�ոլݧa�I
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110816_3", 0 );--
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110816_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_HERBLISM", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110816_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110816_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_HERBLISM_Dialog", 0 )

end
--------------------------------------------------------------------------------------------------------------------------