function LuaFunc_InitZone_26( RoomID )

	--Z26 �q26_1 �X�нs�� 781298 X 120
	--Z26 ��26_1 �X�нs�� 781299 X 120
	--Z26 ��26_1 �X�нs�� 781300 X 120

	--Z26 �q26_2 �X�нs�� 781301 X 120
	--Z26 ��26_2 �X�нs�� 781302 X 120
	--Z26 ��26_2 �X�нs�� 781303 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781298 , 560089, 40 )	-- Z26_1 ���q�q 
	GenerateMine( RoomID, 781298 , 560101, 5 )	-- Z26_1 �}���q

	GenerateMine( RoomID, 781299 , 560093, 40 )	-- Z26_1 ���q��
	GenerateMine( RoomID, 781299 , 560103, 5 )	-- Z26_1 �}����

	GenerateMine( RoomID, 781300 , 560097, 40 )	-- Z26_1 ���q��
	GenerateMine( RoomID, 781300 , 560105, 5 )	-- Z26_1 �}����

--	GenerateMine( RoomID, 781301 , 560089, 40 )	-- Z26_2 ���q�q 
--	GenerateMine( RoomID, 781301 , 560088, 5 )	 --Z26_2 �}���q

--	GenerateMine( RoomID, 781302 , 560093, 40 )	-- Z26_2 ���q��
--	GenerateMine( RoomID, 781302 , 560103, 5 )	-- Z26_2 �}����

--	GenerateMine( RoomID, 781303 , 560097, 40 )	-- Z26_2 ���q��
--	GenerateMine( RoomID, 781303 , 560101, 5 )	-- Z26_2 �}����
	
	Lua_ZonePE_Z26_Set();
end