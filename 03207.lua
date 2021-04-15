function Lua_na_casting()  --基本上就是怪物的cast01
	local Owner = OwnerID()
	PlayMotion( Owner , ruFUSION_ACTORSTATE_CAST_INSTANT)
end 

function Lua_na_casting_loop()  --
	local Owner = OwnerID()
	PlayMotionEX(OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP) 
	SLEEP(50)
	PlayMotion( Owner , ruFUSION_ACTORSTATE_CAST_END)
end 

function Lua_na_casting_loop2()  --完整的施法動作(持續)
	local Owner = OwnerID()
	PlayMotionEX(OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP) 
end