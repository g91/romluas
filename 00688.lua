--���~��������RBUFF
function Lua_ObjDel_BuffCancel( BuffID)
	if CheckBuff( OwnerID() , BuffID ) then
		CancelBuff( OwnerID() , BuffID )
	end
end
--�ϥΪ��~���ˬd�O�_�b�԰���
function Lua_UseCheck_Battle( Type)

	local result
	if Type == "YES" then --�԰����~�i�ϥ�
		result = 1
	elseif Type == "NO" then --�԰������i�ϥ�
		result = 0
	end
	
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 1 then
		if result == 1 then
			return true
		else
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_USECHECK_BATTLE_0]",0) --�����~�԰�������ϥΡC
			return false
		end
	else
		if result == 1 then
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_USECHECK_BATTLE_1]",0) --�����~�����b�԰����ϥΡC
			return false
		else
			return true
		end
	end
end