function lua_bico_CastSpell_myself(MagicID)	--對自己施法
	CastSpell( OwnerID(), OwnerID(), MagicID)
end

function lua_bico_KillID_myself()	--KillID自殺
	KillID( OwnerID() , OwnerID() )
end

function lua_bico_ResetNPC_myself()	--Reset怪物死亡重生(不掉寶)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )	
	CallPlot(OwnerID(), "LuaFunc_ResetObj", OwnerID())
end

function lua_bico_NoPhyAttack()
	AddBuff( OwnerID(), 507899, 0, -1 )
end

function lua_bico_notformyselfuese()	--對自己無效
	if TargetID() == OwnerID() then
		return false
	else
		return true
	end
end

function lua_bico_PlayerFalse()	--對玩家無用
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then
		return false
	else
		return true
	end
end

function lua_bico_PlayerOnlyTrue()
	if ReadRoleValue( TargetID(), EM_RoleValue_IsPlayer ) ==1 then
		return true
	else
		return false
	end
end