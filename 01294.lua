function LuaS_422166_0()---°V»|¦Ì·²º¸
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422166 ) == true and CheckFlag( OwnerID() , 542492 ) == false   and CountBodyItem( OwnerID() , 204263 ) > 0     then
	    AddSpeakOption( OwnerID(), TargetID( ), "[SC_422166]", "LuaS_422166_1", 0 ) 
		else
			LoadQuestOption( OwnerID() )  --¸ü¤J¥ô°È¼ÒªO
	end
	
end

function LuaS_422166_1()
	SetSpeakDetail( OwnerID(), "[SC_422166_1]" )
	SetFlag( OwnerID() , 542492 , 1 )
end