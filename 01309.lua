function Lua_Z3_CoastReturnPoint()
	SetPlot( OwnerID() , "range" , "Lua_Z3_CoastReturnPoint_DO" , 500)
end
function Lua_Z3_CoastReturnPoint_DO()
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
		ChangeZone( OwnerID(), 3 , 0, 13666, 215 , 8838, Dir)
	end
end