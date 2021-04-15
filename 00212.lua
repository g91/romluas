function LuaS_110386_0()
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
	if ( ReadRoleValue(OwnerID(), EM_RoleValue_SkillMax_Alchemy ) >= 80 )  then --�ˬd���j�v�H�W��檺��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110386_5" )   );--#���I�A���n�ӧ�ڰաI�p�G�j�j���D�ڥH�e���ǥͲ{�b��ڼF�`�A���ڴN�G�F��ָ˰����{�ѧڡI���U�աI
	elseif ( ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy) == 60 ) then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID(), GetString ( "ST_110386_4" )   );--#�z��A���{�פw�g���򰪤F......���ӥi�H�s�A�h��Ҫ��N�j�v�F.......���L�j�j��ڻ�����i�D�O�H�Ҫ��N�j�v�������A�u�໡���ӤH�������b���`�ۭn��......��p�F�A�ڤ����D������j�j�n�o�ˤl���A���p�G�Q���ɷҪ��N����O�A�A�N�h���`�ۭn��ݬݧa�I
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) >= 40  then --���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID(), GetString ( "ST_110386_3" )   );--#����աI�A���ӧ�ڡA�p�G�����j�j���D�F�A�@�w�S�H���ڰ��бM��Ū��Ҫ��N�A�o�˧ڴN�G�F�F�A�n�Ǫ��ܡA�h�亿���j�j�A���n��ڰաI
	elseif(    ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Alchemy ) == 20 ) then  --���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit then
			LoadQuestOption( OwnerID() );
		end
		--################################--
	else --0~40�Ū����
		SetSpeakDetail( OwnerID(), GetString("ST_110386_0")   );
		--/*�A�n�A�ڬO�ڧJ�K���S�a�ڪ�����A�ڧƱ�j�a����֩�ǲ߷Ҫ��A�p�G�A�����쪺�ܧڥi�H�ЧA�@�ǰ�¦�C
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy ) >= 40) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_DIALOG") , "LuaS_110386_2", 0 ) --/*�ڷQ���ثe�����C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_DEGRADE_SAY"), "LuaS_DEGRADE", 0 ); --/*���󦳮ɭn���C���H
	end 

	if ( CheckFlag( OwnerID(), 540338 ) == true ) then --�p�G�|���
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 );--#�ڭn���ǲ߷s���s�y�κ���H			
	else  --�p�G���|���
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110386_1") , "LuaS_110386_1", 0 );	--/*�ڷQ�ǲ�����C
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_FORMULA_STORE") , "Lua_110386_RecipeList_Touch", 0 )  --/*�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 );--#����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110386_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110386_1")   );--/*�Ӧn�F�I�S���ͤO�x�[�J�ڭ̷Ҫ�����C�F�I
								--/*�ڥ��ЧA�@��²�檺�Ҫ��t��A���O�A�Q�n�i��Ҫ����ܡA�����n���Ҫ�����b����C
								--/*�M�ᥴ�}�t�ΦC���u�ͬ��ޯ�v���Ҫ��C��A�̫��ܧA�Q�n�s�@���Ĥ��H�μƶq�A�N�i�H�}�l�s�@�F�C
								--/*�ڡI��F�A�٦��A�o�ǳƧ��ơA���ǭn�b�ө����R�A���ǱĶ��ɥi�H��o�A���Ƥ����O���檺�C
								--/*���...�����A�N�}�l�m�ߧa�I
	
	AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_IKNOW") , "LuaS_110386_3", 0 );--

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110386_2()

	SetSpeakDetail( OwnerID(), GetString("ST_DEGRADE_WARN")   );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_YES"), "LuaS_DEGRADE_ALCHEMY", 0 ); --/*�T�w�C
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO"), "LuaS_110386_0", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110386_3()

	CloseSpeak( OwnerID())
	Beginplot( OwnerID() ,"LuaFunc_ALCHEMY_Dialog", 0 )

end
--------------------------------------------------------------------------------------------------------------------------