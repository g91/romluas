function LuaFunc_InitZone_28( RoomID )

	--Z28 �q28_1 �X�нs�� 781371 X 120
	--Z28 ��28_1 �X�нs�� 781372 X 120
	--Z28 ��28_1 �X�нs�� 781373 X 120

	--Z28 �q28_2 �X�нs�� 781374 X 120
	--Z28 ��28_2 �X�нs�� 781375 X 120
	--Z28 ��28_2 �X�нs�� 781376 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781371 , 560090, 40 )	-- Z28_1 ���q�q 
	GenerateMine( RoomID, 781371 , 560101, 5 )	-- Z28_1 �}���q

	GenerateMine( RoomID, 781372 , 560094, 40 )	-- Z28_1 ���q��
	GenerateMine( RoomID, 781372 , 560103, 5 )	-- Z28_1 �}����

	GenerateMine( RoomID, 781373 , 560098, 40 )	-- Z28_1 ���q��
	GenerateMine( RoomID, 781373 , 560105, 5 )	-- Z28_1 �}����

--	GenerateMine( RoomID, 781374 , 560090, 40 )	-- Z28_2 ���q�q 
--	GenerateMine( RoomID, 781374 , 560101, 5 )	 --Z28_2 �}���q

--	GenerateMine( RoomID, 781375 , 560094, 40 )	-- Z28_2 ���q��
--	GenerateMine( RoomID, 781375 , 560103, 5 )	-- Z28_2 �}����

--	GenerateMine( RoomID, 781376 , 560098, 40 )	-- Z28_2 ���q��
--	GenerateMine( RoomID, 781376 , 560105, 5 )	-- Z28_2 �}����
	
 	Lua_ZonePE_Z28_Set();
end