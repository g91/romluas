function LuaFunc_InitZone_12( RoomID )

	--Z12�q1�X�нs��780262 X81
	--Z12��1�X�нs��780263 X81
	--Z12��1�X�нs��780264 X81

	--Z12�q2�X�нs��780265 X101
	--Z12��2�X�нs��780266 X101
	--Z12��2�X�нs��780267 X101

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780262, 560001, 26 );	-- �����q
	GenerateMine( RoomID, 780265, 560002, 46 );	-- ���q
	GenerateMine( RoomID, 780262, 560055, 4 );	-- ���K��
	GenerateMine( RoomID, 780265, 560055, 1 );	-- ���K��
	GenerateMine( RoomID, 780265, 560056, 1 );	-- �ŦB��


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