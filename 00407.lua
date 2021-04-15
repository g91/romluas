function LuaS_GetWarrior_0()

	LoadQuestOption( OwnerID() )

	if ( CheckFlag( OwnerID() , 540804 ) == false ) then
		local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- 如果不報到，一開始就來解的話
		if ( job == 1 ) then
			SetFlag( OwnerID() , 540811 , 1 )	-- 新手職業選戰士
		end
		SetFlag( OwnerID() , 540804 , 1 )	-- 新手職業已選

	end

	if ReadRoleValue( OwnerID(), EM_RoleValue_RACE )>=2 then
	else

		if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Warrior ) == 0 then -- 檢查任務
			if ReadRoleValue( OwnerID() , EM_RoleValue_LV) >= 10 or CheckFlag(OwnerID() , 540820 ) == true then
				AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETWARRIOR_1"), "LuaS_GetWarrior_1", 0 )	--/*請教導我戰士的技巧
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
function LuaS_GetWarrior_1()

	SetSpeakDetail( OwnerID(), GetString("ST_GETVOCMASSAGE") )	--/*協會提供的訓練不是免費的，需要付出 10 塊符文晶砂，你確定要接受訓練嗎？
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETVOC_YES"), "LuaS_GetWarrior_2", 0 )	--/*確定 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO") , "LuaS_GetWarrior_0", 0 )	--/*我再考慮看看

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetWarrior_2()

	local Job_Num = JobCount()
	if  Job_Num then
		SetSpeakDetail( OwnerID(), GetString("ST_GETWARRIOR_1") )

		WriteRoleValue( OwnerID() , EM_RoleValue_VOC_SUB, 1 )
		if CheckFlag( OwnerID() , 540820 ) == false then
			Lua_GetJobGetEQ()
			GiveBodyItem(OwnerID(),540820,1)	--給重要物品540820「取得職業」，開啟往職業管理員的任務
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
		SetSpeakDetail( OwnerID(), GetString("SC_GETJOBERROR") )	--對不起，目前你已達可取得職業數的上限，所以無法取得新的職業！！
	end

end

--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetRanger_0()
	local Race = ReadRoleValue( OwnerID() , EM_RoleValue_Race ) 
	if  Race ==2 then
		SetSpeakDetail( OwnerID(), "[SC_YOU_CANT_USE_THISCLASS]")
	else
		LoadQuestOption( OwnerID() )

		if ( CheckFlag( OwnerID() , 540804 ) == false ) then
			local job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )	-- 如果不報到，一開始就來解的話
			if ( job == 2 ) then
				SetFlag( OwnerID() , 540812 , 1 )	-- 新手職業選遊俠
			end
			SetFlag( OwnerID() , 540804 , 1 )	-- 新手職業已選
		end

		if ReadRoleValue( OwnerID() , EM_RoleValue_VOCLV_Ranger) == 0 then -- 檢查任務
			if ReadRoleValue( OwnerID() , EM_RoleValue_LV) >= 10 or CheckFlag(OwnerID() , 540820 ) == true then
				AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETRANGER_1"), "LuaS_GetRanger_1", 0 )	--/*請教導我遊俠的技巧
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
function LuaS_GetRanger_1()

	SetSpeakDetail( OwnerID(), GetString("ST_GETVOCMASSAGE") )	--/*當然可以，不過協會提供的訓練不是免費的，需要付出 10 塊符文晶砂，你確定要接受訓練嗎？
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_GETVOC_YES"), "LuaS_GetRanger_2", 0 )	--/*確定 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_GETVOC_NO") , "LuaS_GetRanger_0", 0 )	--/*我再考慮看看

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_GetRanger_2()

	local Job_Num = JobCount()
	if  Job_Num then

		SetSpeakDetail( OwnerID(), GetString("ST_GETRANGER_1") )

		WriteRoleValue( OwnerID() , EM_RoleValue_VOC_SUB, 2 )
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
		if CheckFlag( OwnerID() , 540820 ) == false then
			Lua_GetJobGetEQ()
			GiveBodyItem(OwnerID(),540820,1)	--給重要物品540820「取得職業」，開啟往職業管理員的任務
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_GETJOBERROR") )	--對不起，目前你已達可取得職業數的上限，所以無法取得新的職業！！
	end

end
--------------------------------------------------------------------------------------------------------------------------