function LuaS_421484_0()
	local Wolf = LuaFunc_CreateObjByObj ( 101292 , TargetID() )
	AddToPartition( Wolf , 0 )
	SetAttack(Wolf , OwnerID())
	BeginPlot( Wolf , "LuaS_421484_1" , 0 )
	return true
end

function LuaS_421484_1()
	while true do
		local AttackTarget = ReadRoleValue(OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			DelObj(OwnerID())
			break
		end
		sleep(20)
	end
end