function LuaFunc_InitZone_23( RoomID )

	--Z23 �q23_1 �X�нs�� 781159 X 120
	--Z23 ��23_1 �X�нs�� 781160 X 120
	--Z23 ��23_1 �X�нs�� 781161 X 120

	--Z23 �q23_2 �X�нs�� 781162 X 120
	--Z23 ��23_2 �X�нs�� 781163 X 120
	--Z23 ��23_2 �X�нs�� 781164 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781159 , 560085, 40 )	-- Z23_1 ���q�q 
	GenerateMine( RoomID, 781159 , 560088, 5 )	-- Z23_1 �}���q

	GenerateMine( RoomID, 781160 , 560084, 40 )	-- Z23_1 ���q��
	GenerateMine( RoomID, 781160 , 560087, 5 )	-- Z23_1 �}����

	GenerateMine( RoomID, 781161 , 560083, 40 )	-- Z23_1 ���q��
	GenerateMine( RoomID, 781161 , 560086, 5 )	-- Z23_1 �}����

--	GenerateMine( RoomID, 781162 , 560085, 40 )	-- Z23_2 ���q�q 
--	GenerateMine( RoomID, 781162 , 560088, 5 )	 --Z23_2 �}���q

--	GenerateMine( RoomID, 781163 , 560084, 40 )	-- Z23_2 ���q��
--	GenerateMine( RoomID, 781163 , 560087, 5 )	-- Z23_2 �}����

--	GenerateMine( RoomID, 781164 , 560083, 40 )	-- Z23_2 ���q��
--	GenerateMine( RoomID, 781164 , 560086, 5 )	-- Z23_2 �}����

	Lua_ZonePE_Z23_Set();
end