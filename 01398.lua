function LuaS_101268_DeadLog()	-- ¨¹¬¥
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 101268 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )
	return true
end

function LuaS_101584_DeadLog()	-- ¶ð¶©
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 101584 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )
	return true
end