function LuaS_491931_0()
	local NPC = SearchRangeNPC ( OwnerID() , 100 )
	for i=0 , table.getn(NPC)-1 do
		if 	NPC[i] ~= OwnerID() then
			SetAttack(NPC[i] , ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID) )
		end
	end
	return true
end

function LuaS_101582_0()
	WriteRoleValue(OwnerID() , EM_RoleValue_PID , 1)
	return true
end