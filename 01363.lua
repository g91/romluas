function LuaFunc_InitZone_7( RoomID )

	--Z7礦7旗標編號780253 X46
	--Z7木7旗標編號780254 X46
	--Z7草7旗標編號780255 X46

	--Z7礦8_1旗標編號780256 X100
	--Z7木8_1旗標編號780257 X100
	--Z7草8_1旗標編號780258 X100

	--Z7礦8_2旗標編號780259 X75
	--Z7木8_2旗標編號780260 X75
	--Z7草8_2旗標編號780261 X75


	-- GenerateMine( RoomID, FlagID, MineID, Count );    

	GenerateMine( RoomID, 780253, 560008, 23 );
	GenerateMine( RoomID, 780256, 560009, 50 );
	GenerateMine( RoomID, 780259, 560009, 38 );
	GenerateMine( RoomID, 780253, 560059, 2 );
	GenerateMine( RoomID, 780253, 560060, 1 );
	GenerateMine( RoomID, 780256, 560060, 4);
	GenerateMine( RoomID, 780259, 560060, 2 );

	GenerateMine( RoomID, 780254, 560025, 23 );
	GenerateMine( RoomID, 780257, 560026, 50 );
	GenerateMine( RoomID, 780260, 560026, 38 );
	GenerateMine( RoomID, 780254, 560066, 2 );
	GenerateMine( RoomID, 780254, 560067, 1 );
	GenerateMine( RoomID, 780257, 560067, 4 );
	GenerateMine( RoomID, 780260, 560067, 2 );

	GenerateMine( RoomID, 780255, 560042, 23 );
	GenerateMine( RoomID, 780258, 560043, 50 );
	GenerateMine( RoomID, 780261, 560043, 38 );
	GenerateMine( RoomID, 780255, 560073, 2 );
	GenerateMine( RoomID, 780255, 560074, 1 );
	GenerateMine( RoomID, 780258, 560074, 4 );
	GenerateMine( RoomID, 780261, 560074, 2 );
end