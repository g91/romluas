function Lua_na_starpet_Check() --�ˬd�ثe�w�g�}���d����Ų���
	local Owner = OwnerID()
	local CountPet = 39
	for i = 0 , CountPet-1 do
		if ReadRoleValue( Owner , EM_RoleValue_PetCard+i ) ~= 0 then
			Say( Owner , ReadRoleValue( Owner , EM_RoleValue_PetCard+i) )
		end
	end
end



function Lua_na_starpet_reset()   --���m�d����Ų
	local Owner = OwnerID()
	local CountPet = 39
	for i = 0 , CountPet do
		WriteRoleValue( Owner, EM_RoleValue_PetCard+i , 0 )
	end
	Say( Owner , "Done!")
end


function Lua_na_starpet_setall()   --�d����Ų open all
	local Owner = OwnerID()
	local CountPet = 39
	for i = 0 , CountPet-1 do
		WriteRoleValue( Owner, EM_RoleValue_PetCard+i , 1 )		
	end
	Say( Owner , " OPEN ALL!" )
end