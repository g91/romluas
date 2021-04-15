
	
-- for the CallBeing()

function gotoAndPlayEX()
	

	local Is_once = false
	local x = ReadRoleValue(TargetID(), EM_RoleValue_X ); 
	local y = ReadRoleValue(TargetID(), EM_RoleValue_Y); 
	local z =ReadRoleValue(TargetID(), EM_RoleValue_Z ); 

	while Is_once == false do

		if ReadRoleValue(OwnerID, EM_RoleValue_Z) == z and ReadRoleValue(OwnerID, EM_RoleValue_X) == x then

			say(OwnerID, "DONE!!002" );
			PlayMotionEX(Owner,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP) 

			Is_once = true
		end

	end

end
