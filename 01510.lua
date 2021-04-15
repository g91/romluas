function LuaI_113389_0()
	CastSpell( OwnerID() , OwnerID() , 493343 )
end

function LuaS_GetWarden_0()

	if ReadRoleValue( OwnerID() , EM_RoleValue_Race ) ~= 1 then
		SetSpeakDetail( OwnerID(), "[SC_HUMAN_CANT_USE_THISCLASS]")
	else
		LoadQuestOption( OwnerID() )
		if ( CheckFlag( OwnerID() , 540804 ) == false ) then
			local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- �p�G������A�@�}�l�N�ӸѪ���
			if ( job == 7 ) then
				SetFlag( OwnerID() , 540817 , 1 )	-- �s��¾�~��˪L����
			end
			SetFlag( OwnerID() , 540804 , 1 )	-- �s��¾�~�w��
		end

		if ReadRoleValue( OwnerID() , 907 ) == 0 then -- �ˬd����
			if ReadRoleValue( OwnerID() , EM_RoleValue_LV) >= 10 or CheckFlag(OwnerID() , 540820 ) == true then
				AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETWARDEN_1]", "LuaS_GetWarden_1", 0 )	--/*�боɧڴ˪L���̪��ޥ�
			else
				AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_LVLIMIT]" , "LuaS_GetJob_EXIT", 0 );	
			end
		end
	end

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_SPEAK]" , "LuaS_"..NPC.."_0", 0 );

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CHANGEJOB]" , "LuaS_ChangeJob_Intro", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetWarden_1()
	SetSpeakDetail( OwnerID(), "[ST_GETVOCMASSAGE]" )	--/*�b�ǲ߳o��¾�~����A��¾�~�N�����A�ثe����¾�~�F�A�T�w�n���o�o��¾�~�ܡH
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_GetWarden_2", 0 )		--/*�T�w 
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]" , "LuaS_GetWarden_0", 0 )	--/*�ڦA�Ҽ{�ݬ�

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetWarden_2()

	local Job_Num = JobCount()
	if  Job_Num then
		SetSpeakDetail( OwnerID(), "[ST_GETWARDEN_1]" )

		WriteRoleValue( OwnerID() , EM_RoleValue_VOC_SUB, 7 )
		if CheckFlag( OwnerID() , 540820 ) == false then
			Lua_GetJobGetEQ()
			GiveBodyItem(OwnerID(),540820,1)	--�����n���~540820�u���o¾�~�v�A�}�ҩ�¾�~�޲z��������
		end
		if CheckFlag( OwnerID() , 540192 ) == false then
			SetFlag(OwnerID(),540192,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[493899]]" , C_SYSTEM )
		end
		if CheckFlag( OwnerID() , 540191 ) == false then
			SetFlag(OwnerID(),540191,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491913]]" , C_SYSTEM )
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_GETJOBERROR]" )	--�藍�_�A�ثe�A�w�F�i���o¾�~�ƪ��W���A�ҥH�L�k���o�s��¾�~�I�I
	end

end
-----------------------------------------------------------------------------------------------------------------------------------
function LuaS_GetDruid_0()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Race ) ~= 1 then
		SetSpeakDetail( OwnerID(), "[SC_HUMAN_CANT_USE_THISCLASS]")
	else
		LoadQuestOption( OwnerID() )

		if ( CheckFlag( OwnerID() , 540804 ) == false ) then
			local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- �p�G������A�@�}�l�N�ӸѪ���
			if ( job == 8 ) then
				SetFlag( OwnerID() , 540818 , 1 )	-- �s��¾�~��۵M���x
			end
			SetFlag( OwnerID() , 540804 , 1 )	-- �s��¾�~�w��
		end
	
		if ReadRoleValue( OwnerID() , 908 ) == 0 then -- �ˬd����
			if ReadRoleValue( OwnerID() , EM_RoleValue_LV) >= 10 or CheckFlag(OwnerID() , 540820 ) == true then
				AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETDRUID_1]" , "LuaS_GetDruid_1", 0 )	--/*�боɧڦ۵M���x���ޥ�
			else
				AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_LVLIMIT]" , "LuaS_GetJob_EXIT", 0 );	
			end
		end
	end

	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_SPEAK]"  , "LuaS_"..NPC.."_0", 0 );

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CHANGEJOB]" , "LuaS_ChangeJob_Intro", 0 )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetDruid_1()

	SetSpeakDetail( OwnerID(), "[ST_GETVOCMASSAGE]" )	--/*�b�ǲ߳o��¾�~����A��¾�~�N�����A�ثe����¾�~�F�A�T�w�n���o�o��¾�~�ܡH
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_GetDruid_2", 0 )		--/*�T�w 
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]" , "LuaS_GetDruid_0", 0 )	--/*�ڦA�Ҽ{�ݬ�

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetDruid_2()

	local Job_Num = JobCount()
	if  Job_Num then
		SetSpeakDetail( OwnerID(), "[ST_GETDRUID_1]" )
		WriteRoleValue( OwnerID() , EM_RoleValue_VOC_SUB, 8 )
		if CheckFlag( OwnerID() , 540820 ) == false then
			Lua_GetJobGetEQ()
			GiveBodyItem(OwnerID(),540820,1)	--�����n���~540820�u���o¾�~�v�A�}�ҩ�¾�~�޲z��������
		end
		if CheckFlag( OwnerID() , 540192 ) == false then
			SetFlag(OwnerID(),540192,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[493899]]" , C_SYSTEM )
		end
		if CheckFlag( OwnerID() , 540191 ) == false then
			SetFlag(OwnerID(),540191,1)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[491913]]" , C_SYSTEM )
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_GETJOBERROR]" )	--�藍�_�A�ثe�A�w�F�i���o¾�~�ƪ��W���A�ҥH�L�k���o�s��¾�~�I�I
	end

end

--------------------------------------------------------------------------------------------------------------------------