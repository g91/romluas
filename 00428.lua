function LuaS_GETROGUE_0()

	LoadQuestOption( OwnerID() )

	if ( CheckFlag( OwnerID() , 540804 ) == false ) then
		local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- �p�G������A�@�}�l�N�ӸѪ���
		if ( job == 3 ) then
			SetFlag( OwnerID() , 540813 , 1 )	-- �s��¾�~��s��
		end
		SetFlag( OwnerID() , 540804 , 1 )	-- �s��¾�~�w��
	end

	if ReadRoleValue( OwnerID(), EM_RoleValue_RACE )>=2 then
	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Rogue ) == 0 then -- �ˬd����
			if ReadRoleValue( OwnerID() , EM_RoleValue_LV) >= 10 or CheckFlag(OwnerID() , 540820 ) == true then
				AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETROGUE_1"), "LuaS_GetRogue_1",0 )	--/*�боɧڵs�骺�ޥ�
			else
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_LVLIMIT") , "LuaS_GetJob_EXIT", 0 );	
			end
		end
	end

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_SPEAK") , "LuaS_"..NPC.."_0", 0 );

AddSpeakOption( OwnerID(), TargetID( ), "[SC_CHANGEJOB]" , "LuaS_ChangeJob_Intro", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetRogue_1()

	SetSpeakDetail( OwnerID(), GetString("ST_GETVOCMASSAGE") )	--/*��M�i�H�A���L��|���Ѫ��V�m���O�K�O���A�ݭn�I�X 30 ���Ť崹��A�A�T�w�n�����V�m�ܡH
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETVOC_YES"), "LuaS_GetRogue_2", 0 )		--/*�T�w 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO") , "LuaS_GETROGUE_0", 0 )	--/*�ڦA�Ҽ{�ݬ�

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetRogue_2()

	local Job_Num = JobCount()
	if  Job_Num then
		SetSpeakDetail( OwnerID(), GetString("ST_GETROGUE_1") )

		WriteRoleValue( OwnerID() , EM_RoleValue_VOC_SUB, 3 )
		if CheckFlag( OwnerID() , 540820 ) == false then
			Lua_GetJobGetEQ()
			GiveBodyItem(OwnerID(),540820,1)	--�����n���~540820�u���o¾�~�v�A�}�ҩ�¾�~�޲z��������
		end
		if CheckFlag( OwnerID() , 540190 ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_Race ) == 0 then
			SetFlag(OwnerID(),540190,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491891]]" , C_SYSTEM )
		end
		if CheckFlag( OwnerID() , 540192 ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_Race ) == 1 then
			SetFlag(OwnerID(),540192,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[493899]]" , C_SYSTEM )
		end
		if CheckFlag( OwnerID() , 540191 ) == false then
			SetFlag(OwnerID(),540191,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491913]]" , C_SYSTEM )
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_GETJOBERROR") )	--�藍�_�A�ثe�A�w�F�i���o¾�~�ƪ��W���A�ҥH�L�k���o�s��¾�~�I�I
	end

end

--------------------------------------------------------------------------------------------------------------------------

function LuaS_GetMage_0()

	LoadQuestOption( OwnerID() )

	if ( CheckFlag( OwnerID() , 540804 ) == false ) then
		local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- �p�G������A�@�}�l�N�ӸѪ���
		if ( job == 4 ) then
			SetFlag( OwnerID() , 540814 , 1 )	-- �s��¾�~��k�v
		end
		SetFlag( OwnerID() , 540804 , 1 )	-- �s��¾�~�w��
	end

	if ReadRoleValue( OwnerID(), EM_RoleValue_RACE )>=2 then
	else

		if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Wizard ) == 0 then -- �ˬd����
			if ReadRoleValue( OwnerID() , EM_RoleValue_LV) >= 10 or CheckFlag(OwnerID() , 540820 ) == true then
				AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETMAGE_1"), "LuaS_GetMage_1", 0 )	--/*�боɧڪk�v���ޥ�
			else
				AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_LVLIMIT") , "LuaS_GetJob_EXIT", 0 );		
			end
		end
	end

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_SPEAK") , "LuaS_"..NPC.."_0", 0 );

AddSpeakOption( OwnerID(), TargetID( ), "[SC_CHANGEJOB]" , "LuaS_ChangeJob_Intro", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetMage_1()

	SetSpeakDetail( OwnerID(), GetString("ST_GETVOCMASSAGE") )	--/*��M�i�H�A���L��|���Ѫ��V�m���O�K�O���A�ݭn�I�X 10 ���Ť崹��A�A�T�w�n�����V�m�ܡH
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETVOC_YES"), "LuaS_GetMage_2", 0 )		--/*�T�w 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO") , "LuaS_GetMage_0", 0 )	--/*�ڦA�Ҽ{�ݬ�

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetMage_2()

	local Job_Num = JobCount()
	if  Job_Num then
		SetSpeakDetail( OwnerID(), GetString("ST_GETMAGE_1") )

		WriteRoleValue( OwnerID() , EM_RoleValue_VOC_SUB, 4 )
		if CheckFlag( OwnerID() , 540820 ) == false then
			Lua_GetJobGetEQ()
			GiveBodyItem(OwnerID(),540820,1)	--�����n���~540820�u���o¾�~�v�A�}�ҩ�¾�~�޲z��������
		end
		if CheckFlag( OwnerID() , 540190 ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_Race ) == 0 then
			SetFlag(OwnerID(),540190,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491891]]" , C_SYSTEM )
		end
		if CheckFlag( OwnerID() , 540192 ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_Race ) == 1 then
			SetFlag(OwnerID(),540192,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[493899]]" , C_SYSTEM )
		end
		if CheckFlag( OwnerID() , 540191 ) == false then
			SetFlag(OwnerID(),540191,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491913]]" , C_SYSTEM )
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_GETJOBERROR") )	--�藍�_�A�ثe�A�w�F�i���o¾�~�ƪ��W���A�ҥH�L�k���o�s��¾�~�I�I
	end

end
--------------------------------------------------------------------------------------------------------------------------


