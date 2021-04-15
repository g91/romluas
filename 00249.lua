Function LuaI_110230()
	--SetPosture( OwnerID(), 32, ruFUSION_ACTORSTATE_SIT_BEGIN  )
	--sleep(30)
	--SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_SIT_LOOP )	--貝瑞尼執行坐下動作
End

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function LuaS_110230_Complet()

--	setplot( OwnerID(), "touch" , "LuaFunc_Obj_BUSY", 40)	
	--LoadQuestOption( OwnerID() );  --載入任務模板
	--sleep(10);
	--PlayMotion( TargetID(), ruFUSION_ACTORSTATE_SIT_END );		--貝瑞尼結束坐下動作
	--sleep(30);
	--Say( TargetID(), "莫名奇妙，憑什麼說我就是偷雞賊...");	--貝瑞尼範圍發話
	--MoveToFlagEnabled( OwnerID(), false);	--關閉巡邏劇情
	--Move( OwnerID(), 3591,-36,4053 );	--移動到指定座標	
	--sleep(50);

	--Hide( OwnerID() );	--NPC消失
	--sleep(50);
	--LuaFunc_ResetObj( TargetID() );		--重置NPC劇情
	
End
