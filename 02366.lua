function LuaS_424212_complete()
	local NPC = CreateObjByFlag( 118258 , 780004 , 1 , 1 )
	writerolevalue( NPC , EM_RoleValue_IsWalk ,0)
	AddToPartition( NPC , 0 )
	say (NPC , "that mine!")

	MoveToFlagEnabled( NPC , false )
	LuaFunc_MoveToFlag( NPC , 780004 , 2 ,  0 )
	sleep (5)
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_EMOTE_ROFL_LOOP)
end

function OrgIdTester()
	local _ownerID = OwnerID();
	DebugMsg( 0 , 0 , "InstanceID : ".._ownerID );
	DebugMsg( 0 , 0 , "OrgID : "..tostring( ReadRoleValue( _ownerID , EM_RoleValue_OrgID )  ) );
	DebugMsg( 0 , 0 , "DBID : "..tostring( ReadRoleValue( _ownerID , EM_RoleValue_DBID )  ) );
	DebugMsg( 0 , 0 , "NameByInstanceID : "..GetName( _ownerID )  );
	DebugMsg( 0 , 0 , "NameByDBID : "..GetName( ReadRoleValue( _ownerID , EM_RoleValue_DBID ) )  );
end