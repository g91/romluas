function LuaFunc_InitZone_25( RoomID )

	--Z25 �q25_1 �X�нs�� 781265 X 120
	--Z25 ��25_1 �X�нs�� 781266 X 120
	--Z25 ��25_1 �X�нs�� 781267 X 120

	--Z25 �q25_2 �X�нs�� 781268 X 120
	--Z25 ��25_2 �X�нs�� 781269 X 120
	--Z25 ��25_2 �X�нs�� 781270 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781265 , 560085, 40 )	-- Z25_1 ���q�q 
	GenerateMine( RoomID, 781265 , 560088, 5 )	-- Z25_1 �}���q

	GenerateMine( RoomID, 781266 , 560084, 40 )	-- Z25_1 ���q��
	GenerateMine( RoomID, 781266 , 560087, 5 )	-- Z25_1 �}����

	GenerateMine( RoomID, 781267 , 560083, 40 )	-- Z25_1 ���q��
	GenerateMine( RoomID, 781267 , 560086, 5 )	-- Z25_1 �}����

--	GenerateMine( RoomID, 781268 , 560085, 40 )	-- Z25_2 ���q�q 
--	GenerateMine( RoomID, 781268 , 560088, 5 )	 --Z25_2 �}���q

--	GenerateMine( RoomID, 781269 , 560084, 40 )	-- Z25_2 ���q��
--	GenerateMine( RoomID, 781269 , 560087, 5 )	-- Z25_2 �}����

--	GenerateMine( RoomID, 781270 , 560083, 40 )	-- Z25_2 ���q��
--	GenerateMine( RoomID, 781270 , 560086, 5 )	-- Z25_2 �}����
	
	Lua_ZonePE_Z25_Set();
end