function LuaI_207058(Option)
	local PlayerID = OwnerID()
	local PackageID = 207058
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 725050 , 1 ) 
	end
end

function Lua_fn_KR_blackValentine_423073() --任務劇情
	BeginPlot( TargetID(), "Lua_fn_KR_blackValentine_UseItem7", 0)
	SetFlag(TargetID() , 543801 , 1)
end

function Lua_fn_KR_blackValentine_423074() --任務劇情
	BeginPlot( TargetID(), "Lua_fn_KR_blackValentine_UseItem7", 0)
	SetFlag(TargetID() , 543802 , 1)
	SetFlag(TargetID() , 543801 , 0)
end

function Lua_fn_KR_blackValentine_423075() --任務劇情
	BeginPlot( TargetID(), "Lua_fn_KR_blackValentine_UseItem7", 0)
	SetFlag(TargetID() , 543802 , 0)
end

function Lua_fn_KR_blackValentine_UseItem7()  --任務劇情呼叫的Plot
	if ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem7 ) >= 14 then   
		SetFlag(OwnerID() , 543756 , 1)
	else
		local tempint = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem7 )
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem7 , 1 )
	end
end

function black_test1() --測試用
	AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem7 , 1 )
	local tempint = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem7 )
	Say (OwnerID(),tempint)
end

function black_test2() --測試用
	AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem7 , -1 )
	local tempint = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem7 )
	Say (OwnerID(),tempint)
end

function black_test3() --測試用
	local tempint = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem7 )
	Say (OwnerID(),tempint)
end

function Lua_fn_KR_blackValentine_NPC01() --菲琳劇情
	SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_17]" )
	LoadQuestOption( OwnerID() )
end

function Lua_fn_KR_blackValentine_NPC02() --多雷多尼劇情
	if CheckAcceptQuest(OwnerID(),423073) == TRUE and CheckFlag( OwnerID() ,543804) == false and CountBodyItem ( OwnerID(), 207055) >= 1 then
		local TempSex = ReadRoleValue( OwnerID(), EM_RoleValue_SEX  )  
		If TempSex == 0 then
			SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_08]" )	 --跑男生的
		elseif TempSex == 1 then
			SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_09]" )	 --跑女生的
		end
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_10]", "Lua_fn_KR_blackValentine_NPC02_Quest", 0)
	else
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_14]" )
	end
end

function Lua_fn_KR_blackValentine_NPC02_Quest() --多雷多尼任務劇情
	if CountBodyItem ( OwnerID(), 207055) >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_11]" )
		DelBodyItem ( OwnerID(), 207055, 1 )
		SetFlag(OwnerID() , 543804 , 1)
	else
		ScriptMessage( OwnerID(),  OwnerID() , 1 , "[SC_110497_5]" , 0 );
		CloseSpeak( OwnerID() )
	end
end

function Lua_fn_KR_blackValentine_NPC03() --索蕾伊劇情
	SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_15]" )
	if CheckAcceptQuest(OwnerID(),423074) == TRUE and CheckFlag( OwnerID() ,543805) == false and CountBodyItem ( OwnerID(), 207055) >= 1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_10]", "Lua_fn_KR_blackValentine_NPC03_Quest", 0)
	end
end

function Lua_fn_KR_blackValentine_NPC03_Quest() --索蕾伊任務劇情
	if CountBodyItem ( OwnerID(), 207055) >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_12]" )
		DelBodyItem ( OwnerID(), 207055, 1 )
		SetFlag(OwnerID() , 543805 , 1)
	else
		ScriptMessage( OwnerID(),  OwnerID() , 1 , "[SC_110497_5]" , 0 );
		CloseSpeak( OwnerID() )
	end

end

function Lua_fn_KR_blackValentine_NPC04() --努特劇情
	SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_16]" )
	if CheckAcceptQuest(OwnerID(),423075)  == TRUE and CheckFlag( OwnerID() ,543806) == false and CountBodyItem ( OwnerID(), 207055) >= 1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_10]", "Lua_fn_KR_blackValentine_NPC04_Quest", 0)
	end
end

function Lua_fn_KR_blackValentine_NPC04_Quest() --努特任務劇情
	if CountBodyItem ( OwnerID(), 207055) >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_13]" )
		DelBodyItem ( OwnerID(), 207055, 1 )
		SetFlag(OwnerID() , 543806 , 1)
	else
		ScriptMessage( OwnerID(),  OwnerID() , 1 , "[SC_110497_5]" , 0 );
		CloseSpeak( OwnerID() )
	end
	
end

function Lua_fn_KR_blackValentine_NPC05() --柏格劇情
	if CheckAcceptQuest(OwnerID(),423076) == TRUE then
		if CountItem ( OwnerID(), 207056 ) >=1 or CountItem ( OwnerID(), 207063 ) == 0 then
			SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_02]" )
		else
			SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_01]" )
			AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_03]", "Lua_fn_KR_blackValentine_NPC_op1", 0)
			AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_04]", "Lua_fn_KR_blackValentine_NPC_op2", 0)
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_02]" )
	end
end

function Lua_fn_KR_blackValentine_NPC_op1() --柏格劇情選項1
	if CountItem ( OwnerID(), 207063 ) == 0 then
		ScriptMessage( OwnerID(),  OwnerID() , 1 , "[SC_110497_5]" , 0 );
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_05]" )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_07]", "Lua_fn_KR_blackValentine_NPC_end", 0)
	end
end

function Lua_fn_KR_blackValentine_NPC_op2() --柏格劇情選項2
	if CountItem ( OwnerID(), 207063 ) == 0 then
		ScriptMessage( OwnerID(),  OwnerID() , 1 , "[SC_110497_5]" , 0 );
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_06]" )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_07]", "Lua_fn_KR_blackValentine_NPC_end", 0)
	end
end

function Lua_fn_KR_blackValentine_NPC_end()
	if CountItem ( OwnerID(), 207063 ) == 0 then
		ScriptMessage( OwnerID(),  OwnerID() , 1 , "[SC_110497_5]" , 0 );
		CloseSpeak( OwnerID() )
	else
		DelBodyItem ( OwnerID(), 207063, 1 )
		GiveBodyItem(OwnerID() , 207056 , 1)
		CloseSpeak( OwnerID() )
	end
end