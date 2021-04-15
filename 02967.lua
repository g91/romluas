	
function gotoAndPlay(tx ,tz ,followID)
	

	Is_once = false

	while Is_once == false do

		if ReadRoleValue(followID, EM_RoleValue_Z) == tz and ReadRoleValue(followID, EM_RoleValue_X) == tx then

			say(followID, "DONE!!002" );
			PlayMotionEX(followID,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP) 

			Is_once = true
		end

	end

end