function LuaFunc_InitZone_8( RoomID )

	--Z8礦9_1旗標編號780268 X146
	--Z8木9_1旗標編號780269 X146
	--Z8草9_1旗標編號780270 X146

	--Z8礦9_2旗標編號780271 X75
	--Z8木9_2旗標編號780272 X75
	--Z8草9_2旗標編號780273 X75


	-- GenerateMine( RoomID, FlagID, MineID, Count );    

	GenerateMine( RoomID, 780268, 560008, 23 );
	GenerateMine( RoomID, 780268, 560009, 50 );
	GenerateMine( RoomID, 780271, 560009, 38 );
	GenerateMine( RoomID, 780268, 560059, 2 );
	GenerateMine( RoomID, 780268, 560060, 1 );
	GenerateMine( RoomID, 780268, 560060, 4);
	GenerateMine( RoomID, 780271, 560060, 2 );

	GenerateMine( RoomID, 780269, 560025, 23 );
	GenerateMine( RoomID, 780269, 560026, 50 );
	GenerateMine( RoomID, 780272, 560026, 38 );
	GenerateMine( RoomID, 780269, 560066, 2 );
	GenerateMine( RoomID, 780269, 560067, 1 );
	GenerateMine( RoomID, 780269, 560067, 4 );
	GenerateMine( RoomID, 780272, 560067, 2 );

	GenerateMine( RoomID, 780270, 560042, 23 );
	GenerateMine( RoomID, 780270, 560043, 50 );
	GenerateMine( RoomID, 780273, 560043, 38 );
	GenerateMine( RoomID, 780270, 560073, 2 );
	GenerateMine( RoomID, 780270, 560074, 1 );
	GenerateMine( RoomID, 780270, 560074, 4 );
	GenerateMine( RoomID, 780273, 560074, 2 );
end