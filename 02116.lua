function LuaS_423658()
	LoadQuestOption( OwnerID() )

	if	CheckAcceptQuest( OwnerID() ,423658 ) == true	and CheckFlag( OwnerID() , 544622) == false	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423658_5]" , "LuaS_423658_1", 0 )	--ªü?
	end
end


function LuaS_423658_1()
	SetSpeakDetail(OwnerID(),"[SC_423658_1]")
	SetFlag(OwnerID() , 544622 , 1 )
end