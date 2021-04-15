function LuaYU_ACTTEST_00() -- 動作測試
	local i = 0

	for i = 120, 125 do

		Say(OwnerID(), i )
		PlayMotion( OwnerID(), i) 	
		sleep(10)

	end

end

function LuaYU_ACTTEST_01() -- 動作測試

	--for i = 146, 148 do
	--	Say(OwnerID(), "146" )
	--	PlayMotion( OwnerID(), 146) 	
	--	sleep(66660)
	--end

--	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP) 

	PlayMotion( OwnerID(), emote_kiss) 	

end







