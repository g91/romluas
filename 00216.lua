function LuaS_110390_0()
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
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_MakeArmor   ) >= 80 )  then --�ˬd���j�v�H�W��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110390_5" )   );--#�s�үu�����򦳽�ܡH������A��m��o�ئa�B�H������ڨS��k......
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor  ) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110390_4" )   );--#�x�H���|�a�I�A�w�g���o�ص{�פF�H�ݼˤl�j�v�ťi���@�N���A�ǧ�h�F��......�֬O�j�v�šH�N�O�s�Ҥj�v�ڡI�u�O�ڳ̪�]�S�L�������A�uť���L�e�@�}�l���`�ۭn��̦��H�J�L�L�Ӥw�A�A�γ\�i�H�h���̥�ť�ݬݡC
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor  ) >= 40  then --���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110390_3" )   );--#�A�ٯu�O�Ǥ��İڡI���M��s�ҽm��o�ئa�B�F�㤣�L���U�Ӫ��ҵ{�O�M�~�ɮv�d�����j�����Ʊ��F�A���~��h���ۤv�����o�I
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor  ) == 20 ) then  --���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit then
			LoadQuestOption( OwnerID() );
		end
		--################################--
	else --0~40�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110390_0")   );--/*�ڬO�t�d��µĵ�ƶ��Z�Ҫ��ͯS�A���L�ڪ��u�@�]�]�A���ɨ�L�H�s�Ҫ��޳N�C
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor  ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110390_2", 0 ) --/*�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

	if ( ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_MakeArmor  ) > 0) then --�p�G�|�s��
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#�ڭn���ǲ߷s���s�y�κ���H	
	else  --�p�G���|�s��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110390_1") , "LuaS_110390_1", 0 );--/*�ڷQ�ǲ߻s�ҡC
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110390_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110390_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110390_1" )  );--/*�Q����o�~�Y�٦��H�u���Q�ǻs�ҡA�s�ҫ֪ܲ��O�I
	--/*�`���A���������s�Ҿ���A�M��b������䥴�}�A�t�ΦC�����u�ͬ��ޯ�v��ܡu�s�ҡv�A�M���ܧA�n�s�@�����~�H�μƶq�K�i�H�}�l�s�y�F�C
	--/*���K�ЧA�@�ǹϼ˦n�F�A�o�˧A�N�i�H�s�@�o�ǪF��ӽm�ߡC
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110390_3", 0 );--

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110390_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN")   );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_MAKEARMOR", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110390_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110390_3()

	CloseSpeak( OwnerID())	
	Beginplot( OwnerID() ,"LuaFunc_MAKEARMOR_Dialog", 0 )


end
--------------------------------------------------------------------------------------------------------------------------