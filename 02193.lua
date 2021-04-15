function Lua_Hao_House_Energy( Energy )	-- 增加房屋能量

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )

	if Zone == 400 then
		AddHouseEnergy( OwnerID() , Energy )
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ONLY_FOR_HOUSE]" , C_SYSTEM )
		-- 此物品只可在個人房屋內使用。 
		return false
	end
end