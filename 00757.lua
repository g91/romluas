function LuaFunc_InitZone_10( RoomID )

	--Z10Äq1ºX¼Ð½s¸¹780159 X81
	--Z10¤ì1ºX¼Ð½s¸¹780160 X81
	--Z10¯ó1ºX¼Ð½s¸¹780161 X81

	--Z10Äq2ºX¼Ð½s¸¹780162 X83
	--Z10¤ì2ºX¼Ð½s¸¹780163 X84
	--Z10¯ó2ºX¼Ð½s¸¹780164 X83

	--Z10Äq3ºX¼Ð½s¸¹780165 X87
	--Z10¤ì3ºX¼Ð½s¸¹780166 X87
	--Z10¯ó3ºX¼Ð½s¸¹780167 X87

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780159, 560001, 40 );	-- ¶À»ÉÄq
	GenerateMine( RoomID, 780162, 560002, 42 );	-- ¿üÄq
	GenerateMine( RoomID, 780165, 560003, 43 );	-- ¨ªÅKÄq
	GenerateMine( RoomID, 780159, 560055, 4 );	-- ¤õµK¹Ð
	GenerateMine( RoomID, 780162, 560055, 2 );	-- ¤õµK¹Ð
	GenerateMine( RoomID, 780162, 560056, 2 );	-- ÂÅ¦B¥Û
	GenerateMine( RoomID, 780165, 560056, 4 );	-- ÂÅ¦B¥Û

	GenerateMine( RoomID, 780160, 560018, 40 );
	GenerateMine( RoomID, 780163, 560019, 42 );
	GenerateMine( RoomID, 780166, 560020, 43 );
	GenerateMine( RoomID, 780160, 560062, 4 );
	GenerateMine( RoomID, 780163, 560062, 2 );
	GenerateMine( RoomID, 780163, 560063, 2 );
	GenerateMine( RoomID, 780166, 560063, 4 );

	GenerateMine( RoomID, 780161, 560035, 40 );
	GenerateMine( RoomID, 780164, 560036, 42 );
	GenerateMine( RoomID, 780167, 560037, 43 );
	GenerateMine( RoomID, 780161, 560069, 4 );
	GenerateMine( RoomID, 780164, 560069, 2 );
	GenerateMine( RoomID, 780164, 560070, 2 );
	GenerateMine( RoomID, 780167, 560070, 4 );

end