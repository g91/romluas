function Lua_CheckJobtoban()
	local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	local subjob = ReadRoleValue( TargetID() , EM_RoleValue_VOC_SUB )
	if (job == 0) or (subjob == 0) then
		return false
	else
		return true
	end
end