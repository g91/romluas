function LuaI_Zone5_Dun_StoneMist_Check()
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	if ZoneID == 204 or ZoneID == 31 or ZoneID == 34 then
		AddBuff( TargetID() , 502535 , 1 , 20 )
	else
		AddBuff( TargetID() , 502535 , 1 , 40 )
	end
end

function LuaI_Zone5_PoisonDisableBuff_Check()
	if CheckBuff( TargetID() , 502535 ) == true or CheckBuff(TargetID() , 502451) == true then
		CancelBuff( TargetID() , 502535 )
		CancelBuff( TargetID() , 502451 )
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_101433_BUFFCANCEL]" , 1 ) --劇毒與石化的效果彼此抵銷了
		return false
	end
	if CheckBuff( TargetID() , 502537 )  == true then
		return false
	end
	return true
end

function LuaI_Zone5_StoneDisableBuff_Check()
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	if CheckBuff( TargetID() , 502537 ) == true then
		CancelBuff( TargetID() , 502537 )
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_101433_BUFFCANCEL]" , 1 ) --劇毒與石化的效果彼此抵銷了
		return false
	end
	if CheckBuff( TargetID() , 502535 ) == true then
		return false
	end
	if ZoneID == 204 or ZoneID == 31 or ZoneID == 34 then
		AddBuff( TargetID() , 502535 , 1 , 20 )
	else
		AddBuff( TargetID() , 502535 , 1 , 40 )
	end
	return true
end

function LuaI_Zone5_DemonRoar_Check()
	if CheckBuff( TargetID() , 502539 ) == true then
		return false
	end
	return true
end

function LuaI_Zone5_MistMaker(Type)
	if Type == "Stone" then
		BeginPlot( TargetID() , "LuaI_Zone5_Dun_StoneMist" , 0 )
	else
		BeginPlot( TargetID() , "LuaI_Zone5_Dun_PoisonMist" , 0 )
	end
end