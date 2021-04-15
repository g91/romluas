function LV15Limit()
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if ( PlayerLV <= 15 ) then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("ST_LV15LIMIT") , C_DEFAULT )		-- 這個物品必須職業等級15以下才可使用！
		return false
	end
end