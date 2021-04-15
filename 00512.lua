function LuaS_GetPriest_0()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Race ) == 1 then
		SetSpeakDetail( OwnerID(), "[SC_ELF_CANT_USE_THISCLASS]")
	else
		LoadQuestOption( OwnerID() )

		if ( CheckFlag( OwnerID() , 540804 ) == false ) then
			local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- �p�G������A�@�}�l�N�ӸѪ���
			if ( job == 5 ) then
				SetFlag( OwnerID() , 540815 , 1 )	-- �s��¾�~�ﲽ�q
			end
			SetFlag( OwnerID() , 540804 , 1 )	-- �s��¾�~�w��
		end
	
		if ReadRoleValue( OwnerID(), EM_RoleValue_RACE )>=2 then
		else
			if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Priest ) == 0 then -- �ˬd����
				if ReadRoleValue( OwnerID() , EM_RoleValue_LV) >= 10 or CheckFlag(OwnerID() , 540820 ) == true then
					AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETPRIEST_1"), "LuaS_GetPriest_1", 0 )	--/*�боɧڲ��q���ޥ�
				else
					AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_LVLIMIT") , "LuaS_GetJob_EXIT", 0 );	
				end
			end
		end

	end

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_SPEAK") , "LuaS_"..NPC.."_0", 0 );

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CHANGEJOB]" , "LuaS_ChangeJob_Intro", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetPriest_1()

	SetSpeakDetail( OwnerID(), GetString("ST_GETVOCMASSAGE") )	--/*��M�i�H�A���L��|���Ѫ��V�m���O�K�O���A�ݭn�I�X 10 ���Ť崹��A�A�T�w�n�����V�m�ܡH
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETVOC_YES"), "LuaS_GetPriest_2", 0 )		--/*�T�w 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO") , "LuaS_GetPriest_0", 0 )	--/*�ڦA�Ҽ{�ݬ�

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetPriest_2()

	local Job_Num = JobCount()
	if  Job_Num then
		SetSpeakDetail( OwnerID(), GetString("ST_GETPRIEST_1") )
		WriteRoleValue( OwnerID() , EM_RoleValue_VOC_SUB, 5 )
		if CheckFlag( OwnerID() , 540820 ) == false then
			Lua_GetJobGetEQ()
			GiveBodyItem(OwnerID(),540820,1)	--�����n���~540820�u���o¾�~�v�A�}�ҩ�¾�~�޲z��������
		end
		if CheckFlag( OwnerID() , 540190 ) == false then
			SetFlag(OwnerID(),540190,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491891]]" , C_SYSTEM )
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

function LuaS_GetKnight_0()

	local Race = ReadRoleValue( OwnerID() , EM_RoleValue_Race ) 
	if  Race==1 or Race ==2 then
		SetSpeakDetail( OwnerID(), "[SC_YOU_CANT_USE_THISCLASS]")
	else
		LoadQuestOption( OwnerID() )
		if ( CheckFlag( OwnerID() , 540804 ) == false ) then
			local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- �p�G������A�@�}�l�N�ӸѪ���
			if ( job == 6 ) then
				SetFlag( OwnerID() , 540816 , 1 )	-- �s��¾�~���M�h
			end
			SetFlag( OwnerID() , 540804 , 1 )	-- �s��¾�~�w��
		end

		if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Knight ) == 0 then -- �ˬd����
			if ReadRoleValue( OwnerID() , EM_RoleValue_LV) >= 10 or CheckFlag(OwnerID() , 540820 ) == true then
				AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETKNIGHT_1"), "LuaS_GetKnight_1", 0 )	--/*�боɧ��M�h���ޥ�
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
function LuaS_GetKnight_1()

	SetSpeakDetail( OwnerID(), GetString("ST_GETVOCMASSAGE") )	--/*��M�i�H�A���L��|���Ѫ��V�m���O�K�O���A�ݭn�I�X 10 ���Ť崹��A�A�T�w�n�����V�m�ܡH
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETVOC_YES"), "LuaS_GetKnight_2", 0 )	--/*�T�w 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO") , "LuaS_GetKnight_0", 0 )	--/*�ڦA�Ҽ{�ݬ�

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetKnight_2()

	local Job_Num = JobCount()
	if  Job_Num then
		SetSpeakDetail( OwnerID(), GetString("ST_GETKNIGHT_1") )

		WriteRoleValue( OwnerID() , EM_RoleValue_VOC_SUB, 6 )
		if CheckFlag( OwnerID() , 540820 ) == false then
			Lua_GetJobGetEQ()
			GiveBodyItem(OwnerID(),540820,1)	--�����n���~540820�u���o¾�~�v�A�}�ҩ�¾�~�޲z��������
		end
		if CheckFlag( OwnerID() , 540190 ) == false then
			SetFlag(OwnerID(),540190,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491891]]" , C_SYSTEM )
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
function LuaS_GetJob_EXIT()
	CloseSpeak( OwnerID() )
end