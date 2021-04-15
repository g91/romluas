function LuaS_421509()
	LoadQuestOption( OwnerID() )
	if ( CheckAcceptQuest(OwnerID() , 421509 ) == true ) and ( CountBodyItem( OwnerID() , 203149 ) < 1 ) then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SC_421509_0"),"LuaS_421509_1",0)
	end
end

function LuaS_421509_1()
	CloseSpeak( OwnerID() )
	GiveBodyItem( OwnerID(), 203149, 1 )
end


Function luaQ_421519_Complete()
              PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_REVIVING)
              sleep(300)
              PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_LOOP)
END 


function LuaQ_111590_2()
	if DelBodyItem ( OwnerID() , 203172 , 1 ) and DelBodyItem ( OwnerID() , 203170 , 1) then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421516_0"), 0 )
		return true
	end
end
