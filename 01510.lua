function LuaI_113389_0()
	CastSpell( OwnerID() , OwnerID() , 493343 )
end

function LuaS_GetWarden_0()

	if ReadRoleValue( OwnerID() , EM_RoleValue_Race ) ~= 1 then
		SetSpeakDetail( OwnerID(), "[SC_HUMAN_CANT_USE_THISCLASS]")
	else
		LoadQuestOption( OwnerID() )
		if ( CheckFlag( OwnerID() , 540804 ) == false ) then
			local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- 如果不報到，一開始就來解的話
			if ( job == 7 ) then
				SetFlag( OwnerID() , 540817 , 1 )	-- 新手職業選森林牧者
			end
			SetFlag( OwnerID() , 540804 , 1 )	-- 新手職業已選
		end

		if ReadRoleValue( OwnerID() , 907 ) == 0 then -- 檢查任務
			if ReadRoleValue( OwnerID() , EM_RoleValue_LV) >= 10 or CheckFlag(OwnerID() , 540820 ) == true then
				AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETWARDEN_1]", "LuaS_GetWarden_1", 0 )	--/*請教導我森林牧者的技巧
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
	SetSpeakDetail( OwnerID(), "[ST_GETVOCMASSAGE]" )	--/*在學習這個職業之後，此職業將成為你目前的副職業；你確定要取得這個職業嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_GetWarden_2", 0 )		--/*確定 
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]" , "LuaS_GetWarden_0", 0 )	--/*我再考慮看看

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetWarden_2()

	local Job_Num = JobCount()
	if  Job_Num then
		SetSpeakDetail( OwnerID(), "[ST_GETWARDEN_1]" )

		WriteRoleValue( OwnerID() , EM_RoleValue_VOC_SUB, 7 )
		if CheckFlag( OwnerID() , 540820 ) == false then
			Lua_GetJobGetEQ()
			GiveBodyItem(OwnerID(),540820,1)	--給重要物品540820「取得職業」，開啟往職業管理員的任務
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
		SetSpeakDetail( OwnerID(), "[SC_GETJOBERROR]" )	--對不起，目前你已達可取得職業數的上限，所以無法取得新的職業！！
	end

end
-----------------------------------------------------------------------------------------------------------------------------------
function LuaS_GetDruid_0()
	if ReadRoleValue( OwnerID() , EM_RoleValue_Race ) ~= 1 then
		SetSpeakDetail( OwnerID(), "[SC_HUMAN_CANT_USE_THISCLASS]")
	else
		LoadQuestOption( OwnerID() )

		if ( CheckFlag( OwnerID() , 540804 ) == false ) then
			local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- 如果不報到，一開始就來解的話
			if ( job == 8 ) then
				SetFlag( OwnerID() , 540818 , 1 )	-- 新手職業選自然神官
			end
			SetFlag( OwnerID() , 540804 , 1 )	-- 新手職業已選
		end
	
		if ReadRoleValue( OwnerID() , 908 ) == 0 then -- 檢查任務
			if ReadRoleValue( OwnerID() , EM_RoleValue_LV) >= 10 or CheckFlag(OwnerID() , 540820 ) == true then
				AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETDRUID_1]" , "LuaS_GetDruid_1", 0 )	--/*請教導我自然神官的技巧
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

	SetSpeakDetail( OwnerID(), "[ST_GETVOCMASSAGE]" )	--/*在學習這個職業之後，此職業將成為你目前的副職業；你確定要取得這個職業嗎？
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_YES]", "LuaS_GetDruid_2", 0 )		--/*確定 
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_GETVOC_NO]" , "LuaS_GetDruid_0", 0 )	--/*我再考慮看看

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetDruid_2()

	local Job_Num = JobCount()
	if  Job_Num then
		SetSpeakDetail( OwnerID(), "[ST_GETDRUID_1]" )
		WriteRoleValue( OwnerID() , EM_RoleValue_VOC_SUB, 8 )
		if CheckFlag( OwnerID() , 540820 ) == false then
			Lua_GetJobGetEQ()
			GiveBodyItem(OwnerID(),540820,1)	--給重要物品540820「取得職業」，開啟往職業管理員的任務
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
		SetSpeakDetail( OwnerID(), "[SC_GETJOBERROR]" )	--對不起，目前你已達可取得職業數的上限，所以無法取得新的職業！！
	end

end

--------------------------------------------------------------------------------------------------------------------------