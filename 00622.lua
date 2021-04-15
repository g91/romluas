function LuaS_110813_0()
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
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Tailor  ) >= 80 )  then --�ˬd���j�v�H�W��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110813_5" )   );--#�H�դU���{�סA�ڤw�g�L�k�H�Ѯv�������ӫ��ɧA�F�A���ڭ̤��O�B�͡A�Ʊ榳�Ū��ɭԧA��`�^�ӽͽ͵��_�C
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), "[SC_110813_MASTER_HINT]"  );--���ܥh�F�ԥ���
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor  ) >= 40  then --���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110813_3" )   );--#�ګַܼN�~����ɧA�o�˪��ǥ͡A���o�˹�A�ä��n�A�ڪ����˷��ҤH�~������U�A��i�@�B�C
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 20 ) then  --���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110813_2" ) )  --#�A�����_��O���ӥi�H�b��W�h�ӡA���L�A�{�b�ݰ_�ӨèS���h�l���ߤO�i�H�ǲߧ󰪲`�����_�޳N�F�S���Y�A���A�ݭn��h���_���V�m���ܡA���H�ɦb�o�̵��ԡC
		end
		--################################--
	else --0~40�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110813_0")   );
		--/*���_�v�s�i�D���ǡA�ܰ����{�ѧA�A�аݧA�O�n�q���A�˩O�H�٬O�ǲߵ��_�O�H
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG" ), "LuaS_110813_2", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

	if ( ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Tailor  ) > 0) then --�p�G�|���_
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#�ڭn���ǲ߷s���s�y�κ���H
	else  --�p�G���|���_
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110813_1") , "LuaS_110813_1", 0 );	--/*�ڷQ�ǲߵ��_�C
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110813_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110813_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110813_1" )  );--/*�n�I�{�b�N�ЧA���_���򥻡C�n�����_�u�@���ܡA���䥲���n�����_����C�M��A�i�H���}�t�ΦC�����u�ͬ��ޯ�v��ܡu���_�v�A�u�n���Ʒǳƻ����i�H�}�l�i��s�y�C�������_�~�F�C

	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110813_3", 0 );--

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110813_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN" )  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_TAILOR", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110813_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_110813_3()

	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_TAILOR_Dialog", 0 )

end