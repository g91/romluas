function Lua_apon_206436_cancel()
	CancelBuff( TargetID() , 505371 )
end

function Lua_apon_206436_check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == 120 then
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102693 or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102694 then
			if CheckBuff(TargetID() , 505371) == true then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206436_02]" , 1 )-------------------------------------此生物的情緒被平撫了下來。
				return true
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206436_03]" , 1 )-------------------------------------此生物的情緒已被平撫，不需使用此物品。
				return false
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206436_01]" , 1 )-------------------------------------此物品只能夠被使用於安撫、鎮靜怪異的生物方面。
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_CANTHOME]" , 1 )	
		return false
	end	
end