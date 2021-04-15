function LuaS_101431_DeadLog()	-- 亡靈守衛製造者
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 101431 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )
	return true
end

function LuaS_101432_DeadLog()	-- 符文守衛中樞
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 101432 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )
	return true
end

function LuaS_101433_DeadLog()	-- 破壞者瑞德屈肯
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 101433 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )
	return true
end

function LuaS_101462_DeadLog()	-- 安格羅
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 101462 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )
	return true
end