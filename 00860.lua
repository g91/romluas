function LuaFunc_50HPMPPotion()
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local Job2 = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )
	WriteRoleValue( OwnerID() , EM_RoleValue_HP , ReadRoleValue ( OwnerID() , EM_RoleValue_HP  )+50)
	if Job == 4 or Job == 5 or Job == 6 or Job2 == 4 or Job2 == 5 or Job2 == 6 then
		WriteRoleValue( OwnerID() , EM_RoleValue_MP ,  ReadRoleValue (OwnerID() , EM_RoleValue_MP)+50)
	end 
end