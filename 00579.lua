
function LuaS_110807()

	local RND = Rand( 5 ) + 1	-- 1-5 五種說話內容
	SetSpeakDetail( OwnerID(), "[SO_ZONE6RNDTALK0"..RND.."]" )

end