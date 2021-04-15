
function east_RuneExchange_Dialog_2()
	--Say(OwnerID() , "test")
	--LoadQuestOption( OwnerID() )
	SetSpeakDetail( OwnerID(), "[SC_RUNEEXCHANE_1]" )
	AddSpeakOption( OwnerID() , TargetID() , "[SC_RUNEEXCHANE_SELECT_1]" ,  "east_RuneExchange_Dialog_3" ,  0 )			-----¶}±Ò¥æ´«¤¶­±	
end

function east_RuneExchange_Dialog_3()
	Hsiang_OpenRare3EqExchange()
	CloseSpeak( OwnerID() )
end