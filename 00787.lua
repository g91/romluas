Function luaQ_421350_Complete()
              PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_DYING)
              sleep(30)
              PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DEAD)
              sleep(30)
              PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_SLEEP_END)
              sleep(30)
END 

function LUAS_421425_Complete()
            Say( OwnerID() , GetString("SC_421425_0") )
             sleep( 30 )
             Hide(OwnerID())
             sleep(60)
	Show( OwnerID() , 0 )
             sleep(60)
END



