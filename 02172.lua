function LuaS_423689()
	LoadQuestOption( OwnerID() )

	if	CheckAcceptQuest( OwnerID() ,423669 ) == true	and CheckFlag( OwnerID() , 544644) == false	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423689]" , "LuaS_423689_1", 0 )	
	end
	if	CheckAcceptQuest( OwnerID() ,423688 ) == true	and CheckFlag( OwnerID() , 544654) == false	and	CountBodyItem( OwnerID() , 208436 ) > 0	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423688_2]" , "LuaS_423688_3", 0 )	
	end	
end

function LuaS_423688_3()
	if	CountBodyItem( OwnerID() , 208436 ) > 0	then 
		SetSpeakDetail(OwnerID(),"[SC_423688_3]")	
		DelBodyItem(OwnerID(),208436,1)
		SetFlag(OwnerID(),544654,1)
	else
		closespeak(OwnerID())
	end
end

function LuaS_423689_1()
	SetSpeakDetail(OwnerID(),"[SC_423689_1]")
end