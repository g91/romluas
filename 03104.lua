function LuaFunc_InitZone_29( RoomID )

	--Z29 �q29_1 �X�нs�� 781388 X 120
	--Z29 ��29_1 �X�нs�� 781389 X 120
	--Z29 ��29_1 �X�нs�� 781390 X 120

	--Z29 �q29_2 �X�нs�� 781391 X 120
	--Z29 ��29_2 �X�нs�� 781392 X 120
	--Z29 ��29_2 �X�нs�� 781393 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781388 , 560090, 40 )	-- Z29_1 ���q�q 
	GenerateMine( RoomID, 781388 , 560101, 5 )	-- Z29_1 �}���q

	GenerateMine( RoomID, 781389 , 560094, 40 )	-- Z29_1 ���q��
	GenerateMine( RoomID, 781389 , 560103, 5 )	-- Z29_1 �}����

	GenerateMine( RoomID, 781390 , 560098, 40 )	-- Z29_1 ���q��
	GenerateMine( RoomID, 781390 , 560105, 5 )	-- Z29_1 �}����

--	GenerateMine( RoomID, 781374 , 560090, 40 )	-- Z29_2 ���q�q 
--	GenerateMine( RoomID, 781374 , 560101, 5 )	 --Z29_2 �}���q

--	GenerateMine( RoomID, 781375 , 560094, 40 )	-- Z29_2 ���q��
--	GenerateMine( RoomID, 781375 , 560103, 5 )	-- Z29_2 �}����

--	GenerateMine( RoomID, 781376 , 560098, 40 )	-- Z29_2 ���q��
--	GenerateMine( RoomID, 781376 , 560105, 5 )	-- Z29_2 �}����
	
 	Lua_ZonePE_Z29_Set();
end