function LuaFunc_InitZone_21( RoomID )

	--Z21 �q21_1 �X�нs�� 781018 X 140
	--Z21 ��21_1 �X�нs�� 781019 X 140
	--Z21 ��21_1 �X�нs�� 781020 X 140

	--Z21 �q21_2 �X�нs�� 781021 X 140
	--Z21 ��21_2 �X�нs�� 781022 X 140
	--Z21 ��21_2 �X�нs�� 781023 X 140

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781018 , 560080, 45 )	-- Z20_1 ���q�q 
	GenerateMine( RoomID, 781018 , 560061, 5 )	-- Z20_1 �}���q

	GenerateMine( RoomID, 781019 , 560081, 45 )	-- Z20_1 ���q��
	GenerateMine( RoomID, 781019 , 560068, 5 )	-- Z20_1 �}����

	GenerateMine( RoomID, 781020 , 560082, 45 )	-- Z20_1 ���q��
	GenerateMine( RoomID, 781020 , 560075, 5 )	-- Z20_1 �}����

--	GenerateMine( RoomID, 781021 , 560080, 45 )	-- Z20_2 ���q�q 
--	GenerateMine( RoomID, 781021 , 560060, 5 )	 --Z20_2 �}���q

--	GenerateMine( RoomID, 781022 , 560081, 45 )	-- Z20_2 ���q��
--	GenerateMine( RoomID, 781022 , 560067, 5 )	-- Z20_2 �}����

--	GenerateMine( RoomID, 781023 , 560082, 45 )	-- Z20_2 ���q��
--	GenerateMine( RoomID, 781023 , 560074, 5 )	-- Z20_2 �}����
	Lua_ZonePE_Z21_Set();
end