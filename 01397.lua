function LuaS_100998_DeadLog()	-- ªü³Á
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 100998 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )
	return true
end

function LuaS_100649_DeadLog()	--©_¦w¤h 
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 100649 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )
	return true
end