function LuaQ_421177_BeforeClick()
	return true
end
function LuaQ_421177_AfterClick()
	if rand( 100 ) < 50 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421177_0"), 0 ); --再你採集花朵的同時出現了一隻精怪
		BeginPlot( TargetID() , "LuaQ_421177_AfterClick_Reset" , 0 )
		sleep(50)
		local Goblin = LuaFunc_CreateObjByObj ( 100408, TargetID() ) --怪物編號
		SetAttack( Goblin , OwnerID() )
		BeginPlot(Goblin,"LuaQ_421177_Sui",0)
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421177_1"), 0 ); --/*這朵花枯萎了
		BeginPlot( TargetID() , "LuaQ_421177_AfterClick_Reset" , 0 )
		return true
	end
end

function LuaQ_421177_AfterClick_Reset()
	LuaFunc_ResetObj( OwnerID() )
end

function LuaQ_421177_Sui() 
	LuaFunc_Obj_Suicide(10)
end