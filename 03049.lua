function LuaFunc_InitZone_27( RoomID )

	--Z27 �q27_1 �X�нs�� 781348 X 120
	--Z27 ��27_1 �X�нs�� 781349 X 120
	--Z27 ��27_1 �X�нs�� 781350 X 120

	--Z27 �q27_2 �X�нs�� 781351 X 120
	--Z27 ��27_2 �X�нs�� 781352 X 120
	--Z27 ��27_2 �X�нs�� 781353 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781348 , 560089, 40 )	-- Z27_1 ���q�q 
	GenerateMine( RoomID, 781348 , 560101, 5 )	-- Z27_1 �}���q

	GenerateMine( RoomID, 781349 , 560093, 40 )	-- Z27_1 ���q��
	GenerateMine( RoomID, 781349 , 560103, 5 )	-- Z27_1 �}����

	GenerateMine( RoomID, 781350 , 560097, 40 )	-- Z27_1 ���q��
	GenerateMine( RoomID, 781350 , 560105, 5 )	-- Z27_1 �}����

--	GenerateMine( RoomID, 781351 , 560089, 40 )	-- Z27_2 ���q�q 
--	GenerateMine( RoomID, 781351 , 560101, 5 )	 --Z27_2 �}���q

--	GenerateMine( RoomID, 781352 , 560093, 40 )	-- Z27_2 ���q��
--	GenerateMine( RoomID, 781352 , 560103, 5 )	-- Z27_2 �}����

--	GenerateMine( RoomID, 781353 , 560097, 40 )	-- Z27_2 ���q��
--	GenerateMine( RoomID, 781353 , 560105, 5 )	-- Z27_2 �}����
	
 	Lua_ZonePE_Z27_Set();
end