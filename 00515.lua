function LuaFunc_InitZone_2( RoomID )

	--Z2Äq2ºX¼Ð½s¸¹780126 X91
	--Z2¤ì2ºX¼Ð½s¸¹780127 X91
	--Z2¯ó2ºX¼Ð½s¸¹780128 X91

	--Z2Äq3ºX¼Ð½s¸¹780129 X101
	--Z2¤ì3ºX¼Ð½s¸¹780130 X101
	--Z2¯ó3ºX¼Ð½s¸¹780131 X101

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780126, 560002, 46 );	-- ¿üÄq
	GenerateMine( RoomID, 780129, 560003, 51 );	-- ¨ªÅKÄq	
	GenerateMine( RoomID, 780126, 560055, 2 );	-- ¤õµK¹Ð
	GenerateMine( RoomID, 780126, 560056, 3 );	-- ÂÅ¦B¥Û
	GenerateMine( RoomID, 780129, 560056, 5 );	-- ÂÅ¦B¥Û

	GenerateMine( RoomID, 780127, 560019, 46 );
	GenerateMine( RoomID, 780130, 560020, 51 );
	GenerateMine( RoomID, 780127, 560062, 2 );
	GenerateMine( RoomID, 780127, 560063, 3 );
	GenerateMine( RoomID, 780130, 560063, 5 );

	GenerateMine( RoomID, 780128, 560036, 46 );
	GenerateMine( RoomID, 780131, 560037, 51 );
	GenerateMine( RoomID, 780128, 560069, 2 );
	GenerateMine( RoomID, 780128, 560070, 3 );
	GenerateMine( RoomID, 780131, 560070, 5 );


end