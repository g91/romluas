function LuaFunc_InitZone_5( RoomID )

	--Z5Äq5ºX¼Ð½s¸¹780141 X41
	--Z5¤ì5ºX¼Ð½s¸¹780142 X41
	--Z5¯ó5ºX¼Ð½s¸¹780143 X41

	--Z5Äq6ºX¼Ð½s¸¹780144 X101
	--Z5¤ì6ºX¼Ð½s¸¹780145 X101
	--Z5¯ó6ºX¼Ð½s¸¹780146 X101

	--Z5Äq7ºX¼Ð½s¸¹780147 X61
	--Z5¤ì7ºX¼Ð½s¸¹780148 X61
	--Z5¯ó7ºX¼Ð½s¸¹780149 X61

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780141, 560005, 21 );	-- îî´¹Äq
	GenerateMine( RoomID, 780144, 560006, 51 );	-- ¥Õ»ÈÄq
	GenerateMine( RoomID, 780147, 560007, 31 );	-- §ÅÅKÄq
	GenerateMine( RoomID, 780141, 560057, 1 );	-- ¤j¤ô´¹
	GenerateMine( RoomID, 780141, 560058, 1 );	-- ¶ø§Q«¢º¸
	GenerateMine( RoomID, 780144, 560058, 5 );	-- ¶ø§Q«¢º¸
	GenerateMine( RoomID, 780147, 560058, 1 );	-- ¶ø§Q«¢º¸
	GenerateMine( RoomID, 780147, 560059, 2 );	-- ¦Ì´µ¨½¾|

	GenerateMine( RoomID, 780142, 560022, 21 );
	GenerateMine( RoomID, 780145, 560023, 51 );
	GenerateMine( RoomID, 780148, 560024, 21 );
	GenerateMine( RoomID, 780142, 560064, 1 );
	GenerateMine( RoomID, 780142, 560065, 1 );
	GenerateMine( RoomID, 780145, 560065, 5 );
	GenerateMine( RoomID, 780148, 560065, 1 );
	GenerateMine( RoomID, 780148, 560066, 2 );

	GenerateMine( RoomID, 780143, 560039, 21 );
	GenerateMine( RoomID, 780146, 560040, 51 );
	GenerateMine( RoomID, 780149, 560041, 21 );
	GenerateMine( RoomID, 780143, 560071, 1 );
	GenerateMine( RoomID, 780143, 560072, 1 );
	GenerateMine( RoomID, 780146, 560072, 5 );
	GenerateMine( RoomID, 780149, 560072, 1 );
	GenerateMine( RoomID, 780149, 560073, 2 );

end
