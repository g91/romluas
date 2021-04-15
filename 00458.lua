function LuaI_CaptainBrandy_Check_A()
	if ReadRoleValue( OwnerID() , EM_RoleValue_SEX) == 0 then
		return true
	else
		return false
	end
end

function LuaI_CaptainBrandy_Check_B()
	if ReadRoleValue( OwnerID() , EM_RoleValue_SEX ) == 0 then
		return false
	else
		return true
	end
end