function LuaS_423669()
	LoadQuestOption( OwnerID() )

	if	CheckAcceptQuest( OwnerID() ,423669 ) == true	and CheckFlag( OwnerID() , 544570) == false	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423669_0]" , "LuaS_423669_1", 0 )	--你知道艾德霍克姆?
	end
end

function LuaS_423670()

	LoadQuestOption( OwnerID() )

	if	CheckAcceptQuest( OwnerID() ,423669 ) == true	and CheckFlag( OwnerID() , 544569) == false	then 

		AddSpeakOption( OwnerID(), TargetID( ), "[SC_423669_0]" , "LuaS_423670_1", 0 )	--你知道艾德霍克姆?
	end

end


function LuaS_423669_1()
	SetSpeakDetail(OwnerID(),"[SC_423669_1]")
	SetFlag(OwnerID() , 544570 , 1 )			--任務完成旗標
end

function LuaS_423670_1()
	SetSpeakDetail(OwnerID(),"[SC_423669_2]")
	SetFlag(OwnerID() , 544569 , 1 )			--任務完成旗標
end
