function Lua_mika_NOGWUSE() -- 綁公會戰無法使用特定物品
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local NoZone = 402 -- 限制無法使用此物品的區域

--	Say(OwnerID(), Zone )
--	Say(OwnerID(), NoZone )

	if Zone == NoZone then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_ITEMRULE_01]",0)
		-- 你無法在此區域使用這項物品。
		return false
	else
		return true
	end	
end