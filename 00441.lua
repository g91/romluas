
function LuaS_110652()

	local talk = Rand( 5 ); -- 0-5 ���ػ��ܤ��e

	--LoadQuestOption( OwnerID() );  --���J���ȼҪO

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