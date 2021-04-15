function LuaFunc_InitZone_12( RoomID )

	--Z12Äq1ºX¼Ð½s¸¹780262 X81
	--Z12¤ì1ºX¼Ð½s¸¹780263 X81
	--Z12¯ó1ºX¼Ð½s¸¹780264 X81

	--Z12Äq2ºX¼Ð½s¸¹780265 X101
	--Z12¤ì2ºX¼Ð½s¸¹780266 X101
	--Z12¯ó2ºX¼Ð½s¸¹780267 X101

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780262, 560001, 26 );	-- ¶À»ÉÄq
	GenerateMine( RoomID, 780265, 560002, 46 );	-- ¿üÄq
	GenerateMine( RoomID, 780262, 560055, 4 );	-- ¤õµK¹Ð
	GenerateMine( RoomID, 780265, 560055, 1 );	-- ¤õµK¹Ð
	GenerateMine( RoomID, 780265, 560056, 1 );	-- ÂÅ¦B¥Û


	GenerateMine( RoomID, 780263, 560018, 26 );
	GenerateMine( RoomID, 780266, 560019, 46 );
	GenerateMine( RoomID, 780263, 560062, 4 );
	GenerateMine( RoomID, 780266, 560062, 1 );
	GenerateMine( RoomID, 780266, 560063, 1 );

	GenerateMine( RoomID, 780264, 560035, 26 );
	GenerateMine( RoomID, 780267, 560036, 46 );
	GenerateMine( RoomID, 780264, 560069, 4 );
	GenerateMine( RoomID, 780267, 560069, 1 );
	GenerateMine( RoomID, 780267, 560070, 1 );

end