function LV15Limit()
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	if ( PlayerLV <= 15 ) then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("ST_LV15LIMIT") , C_DEFAULT )		-- �o�Ӫ��~����¾�~����15�H�U�~�i�ϥΡI
		return false
	end
end