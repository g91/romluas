
function luaDinaya()

	say( OwnerID(), "Stupit Guy!!" );

	local x = ReadRoleValue(TargetID(), EM_RoleValue_X ); 
	local y = ReadRoleValue(TargetID(), EM_RoleValue_Y); 
	local z =ReadRoleValue(TargetID(), EM_RoleValue_Z ); 


	move( OwnerID(), x ,y ,z)


end


--[[
	local x = ReadRoleValue(OwnerID(), EM_RoleValue_X ); 
	local y = ReadRoleValue(OwnerID(), EM_RoleValue_Y); 
	local z =ReadRoleValue(OwnerID(), EM_RoleValue_Z ); 


	local Is_once = false --boolean

	say( Target(), "Stupit Guy!!" );


	Sleep( 10); 

	for n=1,5,1 do


		x = ReadRoleValue(Owner(), EM_RoleValue_X ); 
		y = ReadRoleValue(OwnerID(), EM_RoleValue_Y); 
		z =ReadRoleValue(OwnerID(), EM_RoleValue_Z ); 

		move( OwnerID(), x ,y ,z)
		say( OwnerID(), "Hey!!" );



		if ReadRoleValue(TargetID(), EM_RoleValue_Z ) == z and ReadRoleValue(TargetID(), EM_RoleValue_X) == x then

			if Is_once == false then
				say( OwnerID(), "Catch u" );
			
			Is_once = true;

			end
		end

		Sleep( 10 ); 

	end

	

	
	local room=ReadRoleValue(OwnerID(), EM_RoleValue_RoomID ); 
	debugmsg( OwnerID() ,  room,  "ownerid="..OwnerID() )
	debugmsg( OwnerID() ,  room,  "room="..room)
	debugmsg( OwnerID() ,  room,  "Hellow")

	moveToFlagEnabled( OwnerID(), false );
]]--