function LuaFunc_AllFullPotion()
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )
	local Job2 = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )
	local HP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	WriteRoleValue( OwnerID() , EM_RoleValue_HP , HP)
	if Job ==1 or Job ==2 or Job ==3 then
		WriteRoleValue( OwnerID() , EM_RoleValue_SP , 100)
		if Job2 == 1 or Job2 ==2 or Job2 ==3 then
			WriteRoleValue( OwnerID() , EM_RoleValue_SP_Sub , 100)
		elseif Job2 == 4 or Job2 ==5 or Job2 ==6 then
			local MP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxMP )
			WriteRoleValue( OwnerID() , EM_RoleValue_MP , MP)
		end		
	elseif Job == 4 or Job == 5 or Job == 6 then
		local MP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxMP )
		WriteRoleValue( OwnerID() , EM_RoleValue_MP , MP)
		if Job2 == 1 or Job2 ==2 or Job2 ==3 then
			WriteRoleValue( OwnerID() , EM_RoleValue_SP_Sub , 100)
		end	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Damn GM ! Use Your Command!" , 0 )
	end 
end