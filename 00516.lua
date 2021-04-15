function LuaFunc_InitZone_1( RoomID )

	--Z1Äq1ºX¼Ð½s¸¹780120 X81
	--Z1¤ì1ºX¼Ð½s¸¹780121 X81
	--Z1¯ó1ºX¼Ð½s¸¹780122 X81

	--Z1Äq2ºX¼Ð½s¸¹780123 X41
	--Z1¤ì2ºX¼Ð½s¸¹780124 X41
	--Z1¯ó2ºX¼Ð½s¸¹780125 X41

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780120, 560001, 41 );	-- ¶À»ÉÄq
	GenerateMine( RoomID, 780123, 560002, 21 );	-- ¿üÄq
	GenerateMine( RoomID, 780120, 560055, 4 );		-- ¤õµK¹Ð
	GenerateMine( RoomID, 780123, 560055, 1 );		-- ¤õµK¹Ð
	GenerateMine( RoomID, 780123, 560056, 1 );		-- ÂÅ¦B¥Û


	GenerateMine( RoomID, 780121, 560018, 41 );	-- »´¤ì
	GenerateMine( RoomID, 780124, 560019, 21 );	-- ¬h¤ì
	GenerateMine( RoomID, 780121, 560062, 4 );		-- ­·¹a¤ì
	GenerateMine( RoomID, 780124, 560062, 1 );		-- ­·¹a¤ì
	GenerateMine( RoomID, 780124, 560063, 1 );		-- ¦aÃÃ®Ú

	GenerateMine( RoomID, 780122, 560035, 41 );	-- ¤sÅ]·¨¯ó
	GenerateMine( RoomID, 780125, 560036, 21 );	-- ³¥¼ß¯ó
	GenerateMine( RoomID, 780122, 560069, 4 );		-- °g­¡­»
	GenerateMine( RoomID, 780125, 560069, 1 );		-- °g­¡­»
	GenerateMine( RoomID, 780125, 560070, 1 );		-- °gÂÈ¯ó

end