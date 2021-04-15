--羅茜斯
function LuaQ_420060_Complete()

	MoveToFlagEnabled( OwnerID(), false );	--關閉巡邏劇情-羅茜斯
	sleep(20);
	WaitMoveTo( OwnerID(), 3118, 23, 5574);		--移動到指定座標
	sleep(20);
	SAY( OwnerID(), "可惡的蟲子，通通消失！");
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN );	--羅茜斯執行工作的動作
	Sleep(50);

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END);	--羅茜斯結束工作的動作
	Sleep(20);

	MoveToFlagEnabled(  OwnerID(), true);	--開啟巡邏劇情-羅茜斯
End