
function LuaS_110652()

	local talk = Rand( 5 ); -- 0-5 五種說話內容

	--LoadQuestOption( OwnerID() );  --載入任務模板

	if ( talk == 0) then
		SetSpeakDetail( OwnerID(), GetString("SO_ZONE2RNDTALK06") )
	elseif ( talk == 1) then
		SetSpeakDetail( OwnerID(), GetString("SO_ZONE2RNDTALK07") )
	elseif ( talk == 2) then
		SetSpeakDetail( OwnerID(), GetString("SO_ZONE2RNDTALK08") )
	elseif ( talk == 3) then
		SetSpeakDetail( OwnerID(), GetString("SO_ZONE2RNDTALK09") )
	else
		SetSpeakDetail( OwnerID(), GetString("SO_ZONE2RNDTALK10") )
	end
end