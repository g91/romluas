function Lua_mika_NOGWUSE() -- �j���|�ԵL�k�ϥίS�w���~
	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )
	local NoZone = 402 -- ����L�k�ϥΦ����~���ϰ�

--	Say(OwnerID(), Zone )
--	Say(OwnerID(), NoZone )

	if Zone == NoZone then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_ITEMRULE_01]",0)
		-- �A�L�k�b���ϰ�ϥγo�����~�C
		return false
	else
		return true
	end	
end