function LuaQ_421289_BeforeClick()
	if CheckFlag( OwnerID() , 541310 )==false then
		return true
	else
		return false
	end
end
function LuaQ_421289_AfterClick()
	if CheckFlag( OwnerID() , 541310 )==false then
		local Goblin = LuaFunc_CreateObjByObj ( 100868, TargetID() ) --�Ǫ��s��
		SetAttack( Goblin , OwnerID() )
		BeginPlot(Goblin,"LuaQ_421177_Sui",0)
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_420459_1"), 0 ); --�o�ͤ@�}�̰ʡA�ѥ۸O���]�X
		sleep(60)
		return true
	end
end