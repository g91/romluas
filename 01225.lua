
function Lua_DW_GetAlternative( RoleID , WantID , Num )
	if	RoleID == nil	or
		WantID == nil	then
		return false
	end

	if	WantID > 540000		then
		SetFlag( RoleID , WantID , 1 )
	else
		if	Num == nil	then
			Num = 1
		end
		GiveBodyItem(RoleID , WantID , Num )
	end
	return true
end


function Lua_DW_DelAlternative( RoleID , WantID , Num )
	if	RoleID == nil	or
		WantID == nil	then
		return false
	end

	if	WantID > 540000		then
		SetFlag( RoleID , WantID , 0 )
	else
		if	Num == nil	then
			Num = 1
		end
		DelBodyItem(RoleID , WantID , Num )
	end
	return true
end
