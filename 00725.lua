function LuaQ_421177_BeforeClick()
	return true
end
function LuaQ_421177_AfterClick()
	if rand( 100 ) < 50 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421177_0"), 0 ); --�A�A�Ķ��ᦷ���P�ɥX�{�F�@�����
		BeginPlot( TargetID() , "LuaQ_421177_AfterClick_Reset" , 0 )
		sleep(50)
		local Goblin = LuaFunc_CreateObjByObj ( 100408, TargetID() ) --�Ǫ��s��
		SetAttack( Goblin , OwnerID() )
		BeginPlot(Goblin,"LuaQ_421177_Sui",0)
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421177_1"), 0 ); --/*�o����\��F
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