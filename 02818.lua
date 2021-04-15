function Lua_na_starpet_Check() --檢查目前已經開啟寵物圖鑑欄位
	local Owner = OwnerID()
	local CountPet = 39
	for i = 0 , CountPet-1 do
		if ReadRoleValue( Owner , EM_RoleValue_PetCard+i ) ~= 0 then
			Say( Owner , ReadRoleValue( Owner , EM_RoleValue_PetCard+i) )
		end
	end
end



function Lua_na_starpet_reset()   --重置寵物圖鑑
	local Owner = OwnerID()
	local CountPet = 39
	for i = 0 , CountPet do
		WriteRoleValue( Owner, EM_RoleValue_PetCard+i , 0 )
	end
	Say( Owner , "Done!")
end


function Lua_na_starpet_setall()   --寵物圖鑑 open all
	local Owner = OwnerID()
	local CountPet = 39
	for i = 0 , CountPet-1 do
		WriteRoleValue( Owner, EM_RoleValue_PetCard+i , 1 )		
	end
	Say( Owner , " OPEN ALL!" )
end