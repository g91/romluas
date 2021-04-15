------Idle
function LuaAS_IdelPlay_TypeA()
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep(50)
	if DW_Rand( 2 ) == 1 then
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	else
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	end
end
------

-----邊說話邊喝酒
Function LuaAS_Speak_D()
	While 1  do 
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(30+Rand(20))
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_DRINK)
		sleep(30+Rand(20))
	end
end



