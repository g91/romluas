function LuaZonePVP( KillerID, DeadID, ZoneID, ParallelZoneID, RoomID )

	Say( DeadID, "I SEE DEAD PEOPLE" );
	Say( DeadID , 	"DeadID = " .. DeadID .. ", KillID = " .. KillerID .. ", ZoneID = " .. ZoneID .. ", ParallelZoneID = " .. ParallelZoneID .. ", RoomID = " .. RoomID );

	GiveBodyItem( KillerID, 210001, 1 );
end