function LuaS_111472()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421464)==true )and(CountBodyItem( OwnerID(), 203076 )<1)then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SC_421464_0"),"LuaS_421464_1",0)
	end
end

function LuaS_421464_1()
	SetSpeakDetail(OwnerID(),GetString("SC_421464_1"))
	GiveBodyItem( OwnerID(), 203076, 1 )
	DelBodyItem( OwnerID(), 203075, 10 )
	Sleep(30)
	Say(TargetID(),GetString("SC_421464_2")) 
end