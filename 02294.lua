function LuaMAP_105294_1()
	MoveToPathPoint( OwnerID() , 1 ) 
end

function LuaMAP_105294_2()
	MoveToPathPoint( OwnerID() , 2 ) 
end

function LuaMAP_105294()
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1)
end