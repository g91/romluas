function LuaFunc_InitZone_1( RoomID )

	--Z1�q1�X�нs��780120 X81
	--Z1��1�X�нs��780121 X81
	--Z1��1�X�нs��780122 X81

	--Z1�q2�X�нs��780123 X41
	--Z1��2�X�нs��780124 X41
	--Z1��2�X�нs��780125 X41

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780120, 560001, 41 );	-- �����q
	GenerateMine( RoomID, 780123, 560002, 21 );	-- ���q
	GenerateMine( RoomID, 780120, 560055, 4 );		-- ���K��
	GenerateMine( RoomID, 780123, 560055, 1 );		-- ���K��
	GenerateMine( RoomID, 780123, 560056, 1 );		-- �ŦB��


	GenerateMine( RoomID, 780121, 560018, 41 );	-- ����
	GenerateMine( RoomID, 780124, 560019, 21 );	-- �h��
	GenerateMine( RoomID, 780121, 560062, 4 );		-- ���a��
	GenerateMine( RoomID, 780124, 560062, 1 );		-- ���a��
	GenerateMine( RoomID, 780124, 560063, 1 );		-- �a�î�

	GenerateMine( RoomID, 780122, 560035, 41 );	-- �s�]����
	GenerateMine( RoomID, 780125, 560036, 21 );	-- ���߯�
	GenerateMine( RoomID, 780122, 560069, 4 );		-- �g����
	GenerateMine( RoomID, 780125, 560069, 1 );		-- �g����
	GenerateMine( RoomID, 780125, 560070, 1 );		-- �g�ȯ�

end