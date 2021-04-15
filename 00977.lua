function LuaS_111618_0()
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
	    if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_MakeArmor ) >= 80 then	--�ˬd���j�v�H�W��檺��
		SetSpeakDetail( OwnerID() , GetString("SC_111618_01") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) == 60 then	--����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID() , GetString("SC_111618_02") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) >= 40 then	--���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID() , GetString("SC_111618_03") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_MakeArmor ) == 20 then	--���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() )
		else	--�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID() , GetString ("SC_111618_04") )
		end
		--################################--
	else --0~40�Ū����
		LoadQuestOption( OwnerID() )
	end

--�����ܿﶵ--
	if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_MakeArmor ) >= 40 then
		AddSpeakOption( OwnerID(), TargetID() , GetString("SO_DEGRADE_DIALOG") , "LuaS_111618_2" , 0 )	--�ڷQ���ثe�����
		AddSpeakOption( OwnerID(), TargetID() , GetString("SO_DEGRADE_SAY") , "LuaS_DEGRADE" , 0 )	--���󦳮ɭn���C���H
	end 

	if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_MakeArmor ) > 0 then		--�p�G�|�s��
		AddSpeakOption( OwnerID(), TargetID( ), GetString ( "SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 )	--�ڭn���ǲ߷s���s�y�κ���H
	else  --�p�G���|�s��
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110390_1") , "LuaS_111618_1", 0 )			--�ڷQ�ǲ߻s�ҡC
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_FORMULA_STORE") , "Lua_111618_RecipeList_Touch", 0 )	--�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LIVING_SAY") , "LuaS_LIVING_SAY", 0 )			--����O�ͬ��ޯ�H
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111618_1()
	SetSpeakDetail( OwnerID(), GetString("SC_111618_05" )  )
	--�Q����o�~�Y�٦��H�u���Q�ǻs�ҡA�s�ҫ֪ܲ��O�I
	--�`���A���������s�Ҿ���A�M��b������䥴�}�A�t�ΦC�����u�ͬ��ޯ�v��ܡu�s�ҡv�A�M���ܧA�n�s�@�����~�H�μƶq�K�i�H�}�l�s�y�F�C
	--���K�ЧA�@�ǹϼ˦n�F�A�o�˧A�N�i�H�s�@�o�ǪF��ӽm�ߡC
	AddSpeakOption( OwnerID(), TargetID(), GetString ("SO_IKNOW") , "LuaS_111618_3", 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111618_2()
	SetSpeakDetail( OwnerID() , GetString("ST_DEGRADE_WARN") )	--�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_YES") , "LuaS_DEGRADE_MAKEARMOR", 0 )	--�T�w�C
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_NO") , "LuaS_111618_0", 0 )		--�ڦA�Ҽ{�ݬݡC
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111618_3()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() ,"LuaFunc_MAKEARMOR_Dialog", 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_111618_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_111618_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550620 ); --���O�ݥ�
AddRecipe( OwnerID(), 550579 ); --�ֻs�@�L
AddRecipe( OwnerID(), 550581 ); --�֥�
AddRecipe( OwnerID(), 550623 ); --�ʻ��@�L
AddRecipe( OwnerID(), 550582 ); --�����֥�
AddRecipe( OwnerID(), 550625 ); --�ʻ����
AddRecipe( OwnerID(), 550584 ); --���Z�֥�
AddRecipe( OwnerID(), 550628 ); --�����@�L
AddRecipe( OwnerID(), 550585 ); --���Z�@�L
AddRecipe( OwnerID(), 550629 ); --�����
AddRecipe( OwnerID(), 550587 ); --���ڥ֥�
AddRecipe( OwnerID(), 550590 ); --�~�@�L
AddRecipe( OwnerID(), 550630 ); --�����@�L
AddRecipe( OwnerID(), 550591 ); --�~�֥�
AddRecipe( OwnerID(), 550633 ); --�I�����
end

function Lua_111618_RecipeList_Touch()
	CloseSpeak( OwnerID() )
	GetRecipeList( OwnerID() , TargetID() )		-- GetRecipeList( Player, NPC )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111619_0()
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
	    if ReadRoleValue(OwnerID() , EM_RoleValue_SkillMax_Cook ) >= 80 then	--�ˬd���j�v�H�W��檺��
		SetSpeakDetail( OwnerID() , GetString("SC_111619_01") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 60 then	--����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID() , GetString("SC_111619_02") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) >= 40 then	--���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID() , GetString("SC_111619_03") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Cook ) == 20 then	--���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() )
		else --�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "SC_111619_04" ) )
		end
		--################################--
	else --0~40�Ū����
		LoadQuestOption( OwnerID() )
	end

--�����ܿﶵ--
	if ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook ) >= 40 then
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_DEGRADE_DIALOG") , "LuaS_111619_2" , 0 )	--�ڷQ���ثe�����
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_DEGRADE_SAY") , "LuaS_DEGRADE" , 0 )	--���󦳮ɭn���C���H
	end 

	if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Cook ) > 0 then	--�p�G�|�i��
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LEARNING_SAY") , "LuaS_LEARNING_SAY" , 0 )	--�ڭn���ǲ߷s���s�y�κ���H
	else	--�p�G���|�i��
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110388_1") , "LuaS_111619_1" , 0 )		--�ڷQ�ǲ߲i���C
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_FORMULA_STORE") , "Lua_111619_RecipeList_Touch" , 0 )	--�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LIVING_SAY") , "LuaS_LIVING_SAY" , 0 )			--����O�ͬ��ޯ�H
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111619_1()
	SetSpeakDetail( OwnerID() , GetString("SC_111619_05") )
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_IKNOW") , "LuaS_111619_3" , 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111619_2()
	SetSpeakDetail( OwnerID() , GetString("ST_DEGRADE_WARN") )	--�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_YES") , "LuaS_DEGRADE_COOK" , 0 )		--�T�w�C
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_NO") , "LuaS_111619_0" , 0 )		--�ڦA�Ҽ{�ݬݡC
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111619_3()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaFunc_COOK_Dialog" , 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_111619_RecipeList_Init()
--	SetPlot( OwnerID() , "Touch" , "Lua_111619_RecipeList_Touch" , 60 );
AddRecipe( OwnerID(), 550432 ); --�N��
AddRecipe( OwnerID(), 550434 ); --�ĹT�G
AddRecipe( OwnerID(), 550436 ); --�N��
AddRecipe( OwnerID(), 550438 ); --����G�l
AddRecipe( OwnerID(), 550440 ); --�M��
AddRecipe( OwnerID(), 550442 ); --�����Ѱ�
AddRecipe( OwnerID(), 550444 ); --�t��
AddRecipe( OwnerID(), 550446 ); --�G���ѥ]
AddRecipe( OwnerID(), 550448 ); --�e�ĿN��
AddRecipe( OwnerID(), 550450 ); --�j�[�ѥ]
AddRecipe( OwnerID(), 550452 ); --���Z�T���v
AddRecipe( OwnerID(), 550454 ); --���`�ѥ]
AddRecipe( OwnerID(), 550456 ); --���o���A��
--AddRecipe( OwnerID(),  ); --�iۣ��
AddRecipe( OwnerID(), 550460 ); --���汲��
AddRecipe( OwnerID(), 550462 ); --�����}
AddRecipe( OwnerID(), 550464 ); --�h�A����
AddRecipe( OwnerID(), 550466 ); --�_�����G��
AddRecipe( OwnerID(), 550468 ); --�Φ׮��A�F��
AddRecipe( OwnerID(), 550470 ); --�A��n�|
AddRecipe( OwnerID(), 550472 ); --�N�x�T�⭻�z
end

function Lua_111619_RecipeList_Touch()
	CloseSpeak( OwnerID() )
	GetRecipeList( OwnerID() , TargetID() )		-- GetRecipeList( Player , NPC )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111620_0()
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
	    if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Tailor ) >= 80 then --�ˬd���j�v�H�W��檺��
		SetSpeakDetail( OwnerID() , GetString("SC_111620_01") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 60 then  --����60���ܭn���a�h���`�ۭn��
		SetSpeakDetail( OwnerID() , GetString("SC_111620_02") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) >= 40  then --���Ťj��40�h�s���a�h��t�@��NPC
		SetSpeakDetail( OwnerID() , GetString("SC_111620_03") )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_Skill_Tailor ) == 20 then  --���ŵ���20�ɧP�_�O�_�i������
		--###�ޯ�F��i���зǮɥ[�J����###--
		if not tolimit  then
			LoadQuestOption( OwnerID() )
		else	--�i�����a�ҾǤu�@�ޯ�W�L�F
			SetSpeakDetail( OwnerID(), GetString ( "SC_111620_04" ) )
		end
		--################################--
	else	--0~40�Ū����
		LoadQuestOption( OwnerID() )
	end

--�����ܿﶵ--
	if( ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor ) >= 40) then
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_DEGRADE_DIALOG") , "LuaS_111620_2" , 0 )	--�ڷQ���ثe�����
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_DEGRADE_SAY") , "LuaS_DEGRADE" , 0 )	--���󦳮ɭn���C���H
	end 

	if ReadRoleValue( OwnerID() , EM_RoleValue_SkillMax_Tailor ) > 0 then	--�p�G�|���_
		AddSpeakOption( OwnerID() , TargetID() , GetString ("SO_LEARNING_SAY") , "LuaS_LEARNING_SAY", 0 )	--�ڭn���ǲ߷s���s�y�κ���H
	else	--�p�G���|���_
		AddSpeakOption( OwnerID() , TargetID() , GetString("SO_110417_1") , "LuaS_111620_1", 0 )			--�ڷQ�ǲߵ��_�C
	end

--�`�A��ܿﶵ--
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_FORMULA_STORE") , "Lua_111620_RecipeList_Touch" , 0 )	--�ڷQ�ݬݧA�檺�t��C--�����|���H�]��ݬݯవ����F��
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_LIVING_SAY") , "LuaS_LIVING_SAY" , 0 )			--����O�ͬ��ޯ�H

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111620_1()
	SetSpeakDetail( OwnerID(), GetString("SC_111620_05") )
	AddSpeakOption( OwnerID() , TargetID() , GetString ( "SO_IKNOW") , "LuaS_111620_3" , 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111620_2()
	SetSpeakDetail( OwnerID() , GetString("ST_DEGRADE_WARN") )	--�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_YES") , "LuaS_DEGRADE_TAILOR" , 0 )	--�T�w�C
	AddSpeakOption( OwnerID() , TargetID() , GetString("SO_GETVOC_NO") , "LuaS_111620_0" , 0 )		--�ڦA�Ҽ{�ݬݡC
end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_111620_3()
	CloseSpeak( OwnerID() )
	Beginplot( OwnerID() , "LuaFunc_TAILOR_Dialog" , 0 )
end
--------------------------------------------------------------------------------------------------------------------------
function Lua_111620_RecipeList_Init()

--	SetPlot( OwnerID() , "Touch" , "Lua_111620_RecipeList_Touch" , 60 );
	
AddRecipe( OwnerID(), 550484 ); --�ʥ���
AddRecipe( OwnerID(), 550486 ); --�ʥ���
AddRecipe( OwnerID(), 550536 ); --�k�O����
AddRecipe( OwnerID(), 550538 ); --�u�k�T
AddRecipe( OwnerID(), 550488 ); --�۵��ܭ�
AddRecipe( OwnerID(), 550489 ); --�u´��
AddRecipe( OwnerID(), 550540 ); --�C���k�T
AddRecipe( OwnerID(), 550492 ); --�u´��
AddRecipe( OwnerID(), 550493 ); --�C����
AddRecipe( OwnerID(), 550543 ); --�������
AddRecipe( OwnerID(), 550495 ); --�g���
AddRecipe( OwnerID(), 550544 ); --����u�T
AddRecipe( OwnerID(), 550545 ); --���b�u��
AddRecipe( OwnerID(), 550496 ); --�m���ܭ�
AddRecipe( OwnerID(), 550548 ); --���b���T
AddRecipe( OwnerID(), 550498 ); --�մֿ�
AddRecipe( OwnerID(), 550499 ); --���R�ܭ�
AddRecipe( OwnerID(), 550502 ); --�մ֦�
AddRecipe( OwnerID(), 550505 ); --������
AddRecipe( OwnerID(), 550551 ); --��P����
AddRecipe( OwnerID(), 550506 ); --������
AddRecipe( OwnerID(), 550553 ); --��P�u�T
AddRecipe( OwnerID(), 550555 ); --�L�Ф���
AddRecipe( OwnerID(), 550508 ); --�ۭ��ܭ�
AddRecipe( OwnerID(), 550556 ); --�L�еu�T
AddRecipe( OwnerID(), 550509 ); --�񸭤���
AddRecipe( OwnerID(), 550558 ); --�M�`����
AddRecipe( OwnerID(), 550510 ); --�񸭿�
AddRecipe( OwnerID(), 550514 ); --���a�ܭ�
AddRecipe( OwnerID(), 550513 ); --�¥��U
AddRecipe( OwnerID(), 550559 ); --����u�T
AddRecipe( OwnerID(), 550516 ); --�Q�ڦ�
AddRecipe( OwnerID(), 550560 ); --�������
AddRecipe( OwnerID(), 550517 ); --�n���U
AddRecipe( OwnerID(), 550563 ); --�����Y�y
AddRecipe( OwnerID(), 550518 ); --�ŵK�ܭ�
AddRecipe( OwnerID(), 550565 ); --�H������

end

function Lua_111620_RecipeList_Touch()
	CloseSpeak( OwnerID() )
	GetRecipeList( OwnerID() , TargetID() )		-- GetRecipeList( Player, NPC )
end