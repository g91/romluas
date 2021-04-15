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

function Lua_fn_KR_blackValentine_423073() --���ȼ@��
	BeginPlot( TargetID(), "Lua_fn_KR_blackValentine_UseItem7", 0)
	SetFlag(TargetID() , 543801 , 1)
end

function Lua_fn_KR_blackValentine_423074() --���ȼ@��
	BeginPlot( TargetID(), "Lua_fn_KR_blackValentine_UseItem7", 0)
	SetFlag(TargetID() , 543802 , 1)
	SetFlag(TargetID() , 543801 , 0)
end

function Lua_fn_KR_blackValentine_423075() --���ȼ@��
	BeginPlot( TargetID(), "Lua_fn_KR_blackValentine_UseItem7", 0)
	SetFlag(TargetID() , 543802 , 0)
end

function Lua_fn_KR_blackValentine_UseItem7()  --���ȼ@���I�s��Plot
	if ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem7 ) >= 14 then   
		SetFlag(OwnerID() , 543756 , 1)
	else
		local tempint = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem7 )
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem7 , 1 )
	end
end

function black_test1() --���ե�
	AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem7 , 1 )
	local tempint = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem7 )
	Say (OwnerID(),tempint)
end

function black_test2() --���ե�
	AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem7 , -1 )
	local tempint = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem7 )
	Say (OwnerID(),tempint)
end

function black_test3() --���ե�
	local tempint = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem7 )
	Say (OwnerID(),tempint)
end

function Lua_fn_KR_blackValentine_NPC01() --��Y�@��
	SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_17]" )
	LoadQuestOption( OwnerID() )
end

function Lua_fn_KR_blackValentine_NPC02() --�h�p�h���@��
	if CheckAcceptQuest(OwnerID(),423073) == TRUE and CheckFlag( OwnerID() ,543804) == false and CountBodyItem ( OwnerID(), 207055) >= 1 then
		local TempSex = ReadRoleValue( OwnerID(), EM_RoleValue_SEX  )  
		If TempSex == 0 then
			SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_08]" )	 --�]�k�ͪ�
		elseif TempSex == 1 then
			SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_09]" )	 --�]�k�ͪ�
		end
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_10]", "Lua_fn_KR_blackValentine_NPC02_Quest", 0)
	else
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_14]" )
	end
end

function Lua_fn_KR_blackValentine_NPC02_Quest() --�h�p�h�����ȼ@��
	if CountBodyItem ( OwnerID(), 207055) >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_11]" )
		DelBodyItem ( OwnerID(), 207055, 1 )
		SetFlag(OwnerID() , 543804 , 1)
	else
		ScriptMessage( OwnerID(),  OwnerID() , 1 , "[SC_110497_5]" , 0 );
		CloseSpeak( OwnerID() )
	end
end

function Lua_fn_KR_blackValentine_NPC03() --������@��
	SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_15]" )
	if CheckAcceptQuest(OwnerID(),423074) == TRUE and CheckFlag( OwnerID() ,543805) == false and CountBodyItem ( OwnerID(), 207055) >= 1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_10]", "Lua_fn_KR_blackValentine_NPC03_Quest", 0)
	end
end

function Lua_fn_KR_blackValentine_NPC03_Quest() --��������ȼ@��
	if CountBodyItem ( OwnerID(), 207055) >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_12]" )
		DelBodyItem ( OwnerID(), 207055, 1 )
		SetFlag(OwnerID() , 543805 , 1)
	else
		ScriptMessage( OwnerID(),  OwnerID() , 1 , "[SC_110497_5]" , 0 );
		CloseSpeak( OwnerID() )
	end

end

function Lua_fn_KR_blackValentine_NPC04() --�V�S�@��
	SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_16]" )
	if CheckAcceptQuest(OwnerID(),423075)  == TRUE and CheckFlag( OwnerID() ,543806) == false and CountBodyItem ( OwnerID(), 207055) >= 1 then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_10]", "Lua_fn_KR_blackValentine_NPC04_Quest", 0)
	end
end

function Lua_fn_KR_blackValentine_NPC04_Quest() --�V�S���ȼ@��
	if CountBodyItem ( OwnerID(), 207055) >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_13]" )
		DelBodyItem ( OwnerID(), 207055, 1 )
		SetFlag(OwnerID() , 543806 , 1)
	else
		ScriptMessage( OwnerID(),  OwnerID() , 1 , "[SC_110497_5]" , 0 );
		CloseSpeak( OwnerID() )
	end
	
end

function Lua_fn_KR_blackValentine_NPC05() --�f��@��
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

function Lua_fn_KR_blackValentine_NPC_op1() --�f��@���ﶵ1
	if CountItem ( OwnerID(), 207063 ) == 0 then
		ScriptMessage( OwnerID(),  OwnerID() , 1 , "[SC_110497_5]" , 0 );
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_KR_BLACKVALENTINE_05]" )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_KR_BLACKVALENTINE_07]", "Lua_fn_KR_blackValentine_NPC_end", 0)
	end
end

function Lua_fn_KR_blackValentine_NPC_op2() --�f��@���ﶵ2
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