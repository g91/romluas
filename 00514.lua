function LuaFunc_InitZone_4( RoomID )

	--Z4�q3�X�нs��780132 X31
	--Z4��3�X�нs��780133 X31
	--Z4��3�X�нs��780134 X31

	--Z4�q4�X�нs��780135 X101
	--Z4��4�X�нs��780136 X101
	--Z4��4�X�нs��780137 X101

	--Z4�q5�X�нs��780138 X51
	--Z4��5�X�нs��780139 X51
	--Z4��5�X�нs��780140 X51

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780132, 560003, 16 );	-- ���K�q
	GenerateMine( RoomID, 780135, 560004, 51 );	-- �����q
	GenerateMine( RoomID, 780138, 560005, 26 );	-- ��q
	GenerateMine( RoomID, 780132, 560056, 2 );	-- �ŦB��
	GenerateMine( RoomID, 780135, 560057, 5 );	-- �j����
	GenerateMine( RoomID, 780138, 560057, 2 );	-- �j����
	GenerateMine( RoomID, 780138, 560058, 1 );	-- ���Q����

	GenerateMine( RoomID, 780133, 560020, 16 );
	GenerateMine( RoomID, 780136, 560021, 51 );
	GenerateMine( RoomID, 780139, 560022, 26 );
	GenerateMine( RoomID, 780133, 560063, 2 );
	GenerateMine( RoomID, 780136, 560064, 5 );
	GenerateMine( RoomID, 780139, 560064, 2 );
	GenerateMine( RoomID, 780139, 560065, 1 );

	GenerateMine( RoomID, 780134, 560037, 16 );
	GenerateMine( RoomID, 780137, 560038, 51 );
	GenerateMine( RoomID, 780140, 560039, 26 );
	GenerateMine( RoomID, 780134, 560070, 2 );
	GenerateMine( RoomID, 780137, 560071, 5 );
	GenerateMine( RoomID, 780140, 560071, 2 );
	GenerateMine( RoomID, 780140, 560072, 1 );
end
