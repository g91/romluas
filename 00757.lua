function LuaFunc_InitZone_10( RoomID )

	--Z10�q1�X�нs��780159 X81
	--Z10��1�X�нs��780160 X81
	--Z10��1�X�нs��780161 X81

	--Z10�q2�X�нs��780162 X83
	--Z10��2�X�нs��780163 X84
	--Z10��2�X�нs��780164 X83

	--Z10�q3�X�нs��780165 X87
	--Z10��3�X�нs��780166 X87
	--Z10��3�X�нs��780167 X87

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780159, 560001, 40 );	-- �����q
	GenerateMine( RoomID, 780162, 560002, 42 );	-- ���q
	GenerateMine( RoomID, 780165, 560003, 43 );	-- ���K�q
	GenerateMine( RoomID, 780159, 560055, 4 );	-- ���K��
	GenerateMine( RoomID, 780162, 560055, 2 );	-- ���K��
	GenerateMine( RoomID, 780162, 560056, 2 );	-- �ŦB��
	GenerateMine( RoomID, 780165, 560056, 4 );	-- �ŦB��

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