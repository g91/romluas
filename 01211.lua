

function LuaS_420452_0()
	if	ReadRoleValue(TargetID() , EM_RoleValue_OrgID) == 101582	then
		return	true
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_421249_4]", 0 ) 
		return	false
	end
end

function LuaS_420452_1()
	if	Lua_DW_GetAlternative( OwnerID() , 201993 )	then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_420452_3]", 0 ) 
		BeginPlot(TargetID(),"LuaS_420452_2" , 0)
	end
	BeginPlot(OwnerID() , "LuaS_420452_3" , 0)
end


function LuaS_420452_2()
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_420452_3()
	CastSpell( OwnerID() , OwnerID() , 491029 )
	sleep(30)
	CancelBuff( OwnerID(), 501409 )
end