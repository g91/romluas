function Lua_na_casting()  --�򥻤W�N�O�Ǫ���cast01
	local Owner = OwnerID()
	PlayMotion( Owner , ruFUSION_ACTORSTATE_CAST_INSTANT)
end 

function Lua_na_casting_loop()  --
	local Owner = OwnerID()
	PlayMotionEX(OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP) 
	SLEEP(50)
	PlayMotion( Owner , ruFUSION_ACTORSTATE_CAST_END)
end 

function Lua_na_casting_loop2()  --���㪺�I�k�ʧ@(����)
	local Owner = OwnerID()
	PlayMotionEX(OwnerID(), ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP) 
end