
function luaTest_ks_skill_test_shot()
	local obj = OwnerID()
	local target
	while true do
		sleep(10)
		target = ReadRoleValue( obj, EM_RoleValue_AttackTargetID )
		if target ~= 0 then
			break
		end
	end
		local x = ReadRoleValue( target, EM_RoleValue_X )
		local y = ReadRoleValue( target, EM_RoleValue_Y )
		local z = ReadRoleValue( target, EM_RoleValue_Z )

		WriteRoleValue( obj, EM_RoleValue_Register1, x )
		WriteRoleValue( obj, EM_RoleValue_Register2, y )
		WriteRoleValue( obj, EM_RoleValue_Register3, z )

		CastspellPos( obj, x, y, z, 850115, 0 )
end

function luaTest_ks_skill_test_end()
	local obj = OwnerID()
	local x = ReadRoleValue( obj, EM_RoleValue_Register1 )
	local y = ReadRoleValue( obj, EM_RoleValue_Register2 )
	local z = ReadRoleValue( obj, EM_RoleValue_Register3 )

	SetPos( obj, x, y, z, 0 )
	CallPlot( obj, "luaTest_ks_skill_test_shot" )
end
