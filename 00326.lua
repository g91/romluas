function LuaS_110329_0()
	LoadQuestOption()
	if CheckAcceptQuest(OwnerID(),420267) then
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110329_1"),  "LuaS_110329_1",  0 );
		--/*詢問前往風之靈居地的方法
	end
end
-----------------------------------------------------------------------------------------------------------
function LuaS_110329_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_110329_2" , 0 )
	SetPlot( TargetID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
end
-----------------------------------------------------------------------------------------------------------
function LuaS_110329_2()
	local Chilayk = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110327 , 100 )
	SetPlot( Chilayk , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	Say( OwnerID() ,GetString("SAY_110329_0") ) --/*......
	sleep( 10 )
	Say( OwnerID() ,GetString("SAY_110329_1") ) --/*我沒有選擇，現在只能相信你們了。
	sleep( 10 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	sleep( 30 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep( 30 )
	Say( OwnerID() ,GetString("SAY_110329_2") ) --/*這把刀上有我的血，將這些血放在風之靈祭壇獻祭，便可以打開通往風之靈居地的通道。
	sleep( 10 )
	GiveBodyItem( TargetID() , 201010 , 1 )
	Say( Chilayk , GetString("SAY_110327_0") ) --/*唉～妳不必割那麼深吧！
	MoveToFlagEnabled( Chilayk , false )
	FaceObj( Chilayk , OwnerID() )
	sleep( 30 )
	PlayMotion( Chilayk , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Say( OwnerID() ,GetString("SAY_110329_3") ) --/*柴列克，我只是希望自己能多出一點力……
	sleep( 30 )
	PlayMotion( Chilayk , ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep( 30 )
	Say( Chilayk , GetString("SAY_110327_1") ) --/*艾德雷的事情就交給他們吧！盡快讓身體復原是你現在的責任，這也是我們和艾德雷的約定不是？
	MoveToFlagEnabled( Chilayk , true )
	sleep( 30 )
	SetPlot( Chilayk , "touch" , "" , 0 )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end
------------------------------------------------------------------------------------------------------------
function LuaQ_420345_Complete()
	local Chilayk = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110327 , 100 )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	SetPlot( Chilayk , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 30 )
	Say( OwnerID() ,GetString("SAY_110329_4") ) --/*這是……！？
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DYING)
	MoveToFlagEnabled( Chilayk , false )
	FaceObj( Chilayk , OwnerID() )
	sleep( 30 )
	Say( Chilayk , GetString("SAY_110327_2") ) --/*亞琦？亞琦？
	--PlayMotion( Chilayk ,   ) --蹲下的動作
	sleep( 30 )
	Say( Chilayk , GetString("SAY_110327_3") ) --/*呼吸和脈搏停了……這是怎麼回事？亞琦！醒過來！
	sleep( 10 )	
	--PlayMotion( Chilayk ,   ) --站起的動作
	--轉身背對亞琦的動作
	PlayMotion( Chilayk, ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( Chilayk , GetString("SAY_110327_4") ) --/*快！快去找巫醫！我們不能讓她死掉！
	sleep( 20 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_SLEEP_END) --亞琦爬起的動作
	Say( OwnerID() ,GetString("SAY_110329_5") ) --/*不……不用了，我沒事……	
	sleep( 10 )
	--轉身面對亞琦的動作
	sleep( 30 )
	--PlayMotion( Chilayk ,   ) --蹲下的動作
	Say( Chilayk , GetString("SAY_110327_5") ) --/*妳還好吧？剛剛發生了甚麼事？
	sleep( 10 )
	Say( OwnerID() ,GetString("SAY_110329_6") ) --/*嗯，我沒事，不過剛剛發生的事情我也還不清楚……我只知道有一件事我要查清楚。
	sleep( 10 )
	--PlayMotion( Chilayk ,   ) --站起的動作
	MoveToFlagEnabled( Chilayk , true )
	Say( OwnerID() ,GetString("SAY_110329_7") ) --/*〈玩家姓名〉，那件事我希望能拜託你。
	sleep( 30 )
	SetPlot( Chilayk , "touch" , "" , 0 )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end
---------------------------------------------------------------------------------------------------------
function LuaQ_420346_Complete()
	local Chilayk = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110327 , 100 )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	SetPlot( Chilayk , "touch" , "LuaFunc_Obj_BUSY" , 40 )
	ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420346_0"), 0 ); --/*亞琦看了計畫書之後將計畫書交給柴列克。
	--PlayMotion( Chilayk ,   ) --蹲下的動作
	sleep( 30 )
	--PlayMotion( Chilayk ,   ) --站起的動作
	ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420346_1"), 0 ); --/*柴列克仔細地看著計劃書的內容。
	sleep( 10 )
	PlayMotion( Chilayk, ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep( 30 )
	SetPlot( Chilayk , "touch" , "" , 0 )
	SetPlot( OwnerID() , "touch" , "" , 0 )

end