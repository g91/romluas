-----------------------------一直講話(交談 戰鬥後回復)------------------------------------
function LuaP_Speak_Discowood()
	
	Local Pos_x = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	Local Pos_z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)


	sleep( 30 )
	Local Speak={}
	Local Motion

	for i = 1 , 5 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	end
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE

	While 1  do 
		if HateListCount( OwnerID()) > 0 then
			sleep(20)
		else
			if 	math.abs(  ReadRoleValue( OwnerID() , EM_RoleValue_X  ) ) - math.abs( Pos_X) <6 	and
				math.abs(  ReadRoleValue( OwnerID() , EM_RoleValue_Z  ) ) - math.abs( Pos_Z) <6	then
				sleep(20)
				Local j = rand(5) + 1
				Motion = Speak[j]
				PlayMotion( OwnerID(),Motion )
			end
			sleep(20+Rand(30))
		end
	end
end


-----------------一直蹲下(戰鬥後回復)------------------------------


function LuaP_Crouch_Discowood()
	Local Pos_x = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	Local Pos_z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)

	while 1 do
		if HateListCount( OwnerID()) > 0 then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register10,1)
			sleep(20)
		else
			if ReadRoleValue(OwnerID() , EM_RoleValue_Register10) ~= 2  then
				if 	math.abs(  ReadRoleValue( OwnerID() , EM_RoleValue_X  ) ) - math.abs( Pos_X) <6 	and
					math.abs(  ReadRoleValue( OwnerID() , EM_RoleValue_Z  ) ) - math.abs( Pos_Z) <6	then

					PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
					WriteRoleValue(OwnerID(),EM_RoleValue_Register10,2)
				end
			end
			sleep(30)
		end
	end
end


-----------------一直工作(戰鬥後回復)------------------------------


function LuaP_Crafting_Discowood()
	Local Pos_x = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	Local Pos_z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)

	while 1 do
		if HateListCount( OwnerID()) > 0 then
			WriteRoleValue(OwnerID(),EM_RoleValue_Register10,1)
			sleep(20)
		else
			if ReadRoleValue(OwnerID() , EM_RoleValue_Register10) ~= 2  then
				if 	math.abs(  ReadRoleValue( OwnerID() , EM_RoleValue_X  ) ) - math.abs( Pos_X) <6 	and
					math.abs(  ReadRoleValue( OwnerID() , EM_RoleValue_Z  ) ) - math.abs( Pos_Z) <6	then

					PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
					WriteRoleValue(OwnerID(),EM_RoleValue_Register10,2)
				end
			end
			sleep(30)
		end
	end
end

