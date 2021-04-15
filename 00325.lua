function LuaS_110090_0()
	LoadQuestOption( OwnerID() )
	if CheckCompleteQuest(OwnerID(),420268) then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SO_110090_1"),"LuaS_110090_1",0)
		--/*請求風之靈打開通往其居地的通道
	end
end
--------------------------------------------------------------------------------------------------
function LuaS_110090_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaQ_420268_Accept" , 0 )
end
--------------------------------------------------------------------------------------------------
function LuaQ_420268_Accept()
	--檢查傳送門在不在，不在就開門
	--召喚傳送門(副本)
	Say( OwnerID() , "門打開了" )
	--BeginPlot( Door , "LuaQ_420268_DoorClose" , 0 ) --設定關門
end
---------------------------------------------------------------------------------------------------
function LuaQ_420268_DoorClose()
	sleep( 300 )
 	DelObj( OwnerID() )
end
---------------------------------------------------------------------------------------------------