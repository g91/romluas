function LuaS_110412_0()
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
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Carpenter   ) >= 80 )  then --�ˬd���j�v�H�W��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110412_5" )   );--#�A���W�r......�ڦn��ť�L........��......�b����ť�L�O�H
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110412_4" )   );--#�n�W�i��u�޳N�ڡH��u�j�v�������b���`�ۭn��A�A�ӥh��......�ڬ�����n�o�˻��D�H��......��]�K�K�ڤ��O�o�F�C
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter  ) >= 40  then --���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110412_3" )   );--#�ڻ{�o�A��......�H�ڡI�A����u�޳N�ܦn�A���A���ӬO�n��ڪ������N�����a�I�L�O�M��Ū���u�ɮv�O�I�u�K�Ū��ɮv......�S�����D�d���S�H�o�ӦW�r�n����......
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Carpenter  ) == 20 ) then  --���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() );
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "ST_110412_2" )   );--#�u�K���K�K�䧢��......�u�K�ŷҪ��v����......�u�K�Żs�Үv��ͯS......�u�K�Ť�u......�u�K�Ť�u......����ڦn�����L�H�A���O�Q���_�ӭC�I���L�ڦn���O�o......�u�K�ŧ޳N���i�H�W�L����......�o�O����N��ڡH
		end
		--################################--
	else --0~40�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110412_0")   );
		--/*�S�����D�d���S�H�n�����W�r......�ڡI�O�ڪ��W�r.......
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Carpenter  ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG" ), "LuaS_110412_2", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

	if ( ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Carpenter  ) > 0) then --�p�G�|��u
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#�ڭn���ǲ߷s���s�y�κ���H
	else  --�p�G���|��u
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110412_1" ), "LuaS_110412_1", 0 );	--/*�ڷQ�ǲߤ�u�C
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110412_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110412_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110412_1" )  );
	--/*��u�ڡH����......�ڬݬ�......��u......�O�@�ػݭn�@��......�Ӥߪ��u�@�A�A�i�H�ǥѤ�u�s�y......���{.......�k�t���Z���C�ߨ�t��......�b��u�������......���}�t�ΦC�����u�ͬ��ޯ�v......��ܡu��u�v......�N�i�H�s�y......��s�Z����......��L���~�F�C�ѤW�o�˼g......���ӨS���a�H
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110412_3", 0 );--
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110412_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN")   );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_CARPENTER", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110412_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110412_3()

	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_CARPENTER_Dialog", 0 )

end
--------------------------------------------------------------------------------------------------------------------------