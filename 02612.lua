function LuaFunc_InitZone_22( RoomID )

	--Z22 �q22_1 �X�нs�� 781091 X 120
	--Z22 ��22_1 �X�нs�� 781092 X 120
	--Z22 ��22_1 �X�нs�� 781093 X 120

	--Z22 �q22_2 �X�нs�� 781094 X 120
	--Z22 ��22_2 �X�нs�� 781095 X 120
	--Z22 ��22_2 �X�нs�� 781096 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781091 , 560080, 40 )	-- Z22_1 ���q�q 
	GenerateMine( RoomID, 781091 , 560061, 5 )	-- Z22_1 �}���q

	GenerateMine( RoomID, 781092 , 560081, 40 )	-- Z22_1 ���q��
	GenerateMine( RoomID, 781092 , 560068, 5 )	-- Z22_1 �}����

	GenerateMine( RoomID, 781093 , 560082, 40 )	-- Z22_1 ���q��
	GenerateMine( RoomID, 781093 , 560075, 5 )	-- Z22_1 �}����

--	GenerateMine( RoomID, 781094 , 560080, 40 )	-- Z22_2 ���q�q 
--	GenerateMine( RoomID, 781094 , 560060, 5 )	 --Z22_2 �}���q

--	GenerateMine( RoomID, 781095 , 560081, 40 )	-- Z22_2 ���q��
--	GenerateMine( RoomID, 781095 , 560067, 5 )	-- Z22_2 �}����

--	GenerateMine( RoomID, 781096 , 560082, 40 )	-- Z22_2 ���q��
--	GenerateMine( RoomID, 781096 , 560074, 5 )	-- Z22_2 �}����

	Lua_ZonePE_Z22_Set();
end