function LuaFunc_InitZone_5( RoomID )

	--Z5�q5�X�нs��780141 X41
	--Z5��5�X�нs��780142 X41
	--Z5��5�X�нs��780143 X41

	--Z5�q6�X�нs��780144 X101
	--Z5��6�X�нs��780145 X101
	--Z5��6�X�нs��780146 X101

	--Z5�q7�X�нs��780147 X61
	--Z5��7�X�нs��780148 X61
	--Z5��7�X�нs��780149 X61

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780141, 560005, 21 );	-- ��q
	GenerateMine( RoomID, 780144, 560006, 51 );	-- �ջ��q
	GenerateMine( RoomID, 780147, 560007, 31 );	-- ���K�q
	GenerateMine( RoomID, 780141, 560057, 1 );	-- �j����
	GenerateMine( RoomID, 780141, 560058, 1 );	-- ���Q����
	GenerateMine( RoomID, 780144, 560058, 5 );	-- ���Q����
	GenerateMine( RoomID, 780147, 560058, 1 );	-- ���Q����
	GenerateMine( RoomID, 780147, 560059, 2 );	-- �̴����|

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
