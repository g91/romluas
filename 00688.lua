--物品消失之後刪BUFF
function Lua_ObjDel_BuffCancel( BuffID)
	if CheckBuff( OwnerID() , BuffID ) then
		CancelBuff( OwnerID() , BuffID )
	end
end
--使用物品時檢查是否在戰鬥中
function Lua_UseCheck_Battle( Type)

	local result
	if Type == "YES" then --戰鬥中才可使用
		result = 1
	elseif Type == "NO" then --戰鬥中不可使用
		result = 0
	end
	
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 1 then
		if result == 1 then
			return true
		else
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_USECHECK_BATTLE_0]",0) --此物品戰鬥中不能使用。
			return false
		end
	else
		if result == 1 then
			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_USECHECK_BATTLE_1]",0) --此物品必須在戰鬥中使用。
			return false
		else
			return true
		end
	end
end