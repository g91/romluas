
function LuaS_110602()

	local talk = Rand( 5 ); -- 0-5 ���ػ��ܤ��e

	--LoadQuestOption( OwnerID() );  --���J���ȼҪO

	if ( talk == 0) then
		SetSpeakDetail( OwnerID(), GetString("SO_ZONE2RNDTALK01") )
	elseif ( talk == 1) then
		SetSpeakDetail( OwnerID(), GetString("SO_ZONE2RNDTALK02") )
	elseif ( talk == 2) then
		SetSpeakDetail( OwnerID(), GetString("SO_ZONE2RNDTALK03") )
	elseif ( talk == 3) then
		SetSpeakDetail( OwnerID(), GetString("SO_ZONE2RNDTALK04") )
	else
		SetSpeakDetail( OwnerID(), GetString("SO_ZONE2RNDTALK05") )
	end
end