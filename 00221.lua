function LuaQ_420181_Onclick()
	if CountBodyItem( OwnerID(), 200639 ) == 0 then
		return 1
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420181_0"), 0 )		
		return -1
	end
end
------------------------
function LuaQ_420181_AfterClick()

	local Mob
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420181_1"), 0 )	
	Mob = LuaFunc_CreateObjByObj ( 100072, TargetID() ) 
	BeginPlot( Mob, "LuaQ_420181_2",0)
	SetAttack( Mob , OwnerID() )
	return 1
end

--------------------------------------------------------------------------------------------------------
function LuaQ_420181_2()
	LuaFunc_Obj_Suicide(300)
end
--------------------------------------------------------------------------------------------------------
		