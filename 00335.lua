function LuaQ_420347_Complete()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_Nothing" , 40 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep( 30 )
	Say( OwnerID() , GetString("SAY_110317_0" ) ) --/*願神寬恕我，讓騎士團以及要塞中的人民免於災難，我竟然讓騎士團中出現這樣的邪惡，咳咳……
	sleep( 20 )
	ScriptMessage( OwnerID(), TargetID(), 0, GetString("SAY_110317_1" ), 0 ); --/*克雷斯．海諾壓低聲音跟你說：「〈玩家姓名〉，這件事我不希望太多人知道，我希望你能幫助我解決那個叛徒，秘密地……」
	sleep( 20 )
	Say( OwnerID() , GetString("SAY_110317_2" ) ) --/*咳咳！
	SetPlot( OwnerID() , "touch" , "" , 0 )
end