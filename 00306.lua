function LuaQ_420310_Complete()
	DisableQuest( OwnerID() , True)
	Say( OwnerID() ,GetString("SAY_110289_0")) --/*安伊墨……狄……墨斯德……呼呼……哈哈……
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CAST_INSTANT )
	sleep( 30 )
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 30 )
--	local Shadow = LuaFunc_CreateObjByObj ( 100042 , OwnerID() ) --代用
--	SetRoleCamp( Shadow , "SNPC" )
--	sleep( 30 )	
--	Delobj(Shadow)
	Say( OwnerID() ,GetString("SAY_110289_1")) --/*呼呼呼～哈哈哈哈～～
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	sleep( 30 )
	Say( OwnerID() ,GetString("SAY_110289_3")) --/*沒想到連艾爾菲墨斯的亡約的力量也只剩這一點點，還不夠啊......還不夠啊......
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG)
	sleep( 50 )
	DisableQuest( OwnerID() , false)	
end
function LusS_110289_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest(OwnerID(),420308) == true or CheckAcceptQuest(OwnerID(),420308) == true then
		if CountBodyItem( OwnerID() , 200885 ) == 0 and CheckCompleteQuest(OwnerID(),420310) == false then
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110289_1") , "LuaS_110289_1", 0 ); --/*縛靈魔粉
		end
	end
end

function LuaS_110289_1()

	CloseSpeak( OwnerID() );	--關閉對話視窗
	Say( TargetID() ,GetString("SAY_110289_2")) --/*愚笨的傢伙！幸好我夠聰明，還記得留下備用的分量。
	GiveBodyItem(OwnerID(),200885,1)
end