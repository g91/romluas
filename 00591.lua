function lua_bico_CastSpell_myself(MagicID)	--��ۤv�I�k
	CastSpell( OwnerID(), OwnerID(), MagicID)
end

function lua_bico_KillID_myself()	--KillID�۱�
	KillID( OwnerID() , OwnerID() )
end

function lua_bico_ResetNPC_myself()	--Reset�Ǫ����`����(�����_)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )	
	CallPlot(OwnerID(), "LuaFunc_ResetObj", OwnerID())
end

function lua_bico_NoPhyAttack()
	AddBuff( OwnerID(), 507899, 0, -1 )
end

function lua_bico_notformyselfuese()	--��ۤv�L��
	if TargetID() == OwnerID() then
		return false
	else
		return true
	end
end

function lua_bico_PlayerFalse()	--�缾�a�L��
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