function LuaFunc_InitZone_2( RoomID )

	--Z2�q2�X�нs��780126 X91
	--Z2��2�X�нs��780127 X91
	--Z2��2�X�нs��780128 X91

	--Z2�q3�X�нs��780129 X101
	--Z2��3�X�нs��780130 X101
	--Z2��3�X�нs��780131 X101

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780126, 560002, 46 );	-- ���q
	GenerateMine( RoomID, 780129, 560003, 51 );	-- ���K�q	
	GenerateMine( RoomID, 780126, 560055, 2 );	-- ���K��
	GenerateMine( RoomID, 780126, 560056, 3 );	-- �ŦB��
	GenerateMine( RoomID, 780129, 560056, 5 );	-- �ŦB��

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