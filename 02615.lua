function LuaFunc_InitZone_24( RoomID )

	--Z24 �q24_1 �X�нs�� 781195 X 120
	--Z24 ��24_1 �X�нs�� 781196 X 120
	--Z24 ��24_1 �X�нs�� 781197 X 120

	--Z24 �q24_2 �X�нs�� 781198 X 120
	--Z24 ��24_2 �X�нs�� 781199 X 120
	--Z24 ��24_2 �X�нs�� 781200 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781195 , 560085, 40 )	-- Z24_1 ���q�q 
	GenerateMine( RoomID, 781195 , 560088, 5 )	-- Z24_1 �}���q

	GenerateMine( RoomID, 781196 , 560084, 40 )	-- Z24_1 ���q��
	GenerateMine( RoomID, 781196 , 560087, 5 )	-- Z24_1 �}����

	GenerateMine( RoomID, 781197 , 560083, 40 )	-- Z24_1 ���q��
	GenerateMine( RoomID, 781197 , 560086, 5 )	-- Z24_1 �}����

--	GenerateMine( RoomID, 781198 , 560085, 40 )	-- Z24_2 ���q�q 
--	GenerateMine( RoomID, 781198 , 560088, 5 )	 --Z24_2 �}���q

--	GenerateMine( RoomID, 781199 , 560084, 40 )	-- Z24_2 ���q��
--	GenerateMine( RoomID, 781199 , 560087, 5 )	-- Z24_2 �}����

--	GenerateMine( RoomID, 781200 , 560083, 40 )	-- Z24_2 ���q��
--	GenerateMine( RoomID, 781200 , 560086, 5 )	-- Z24_2 �}����
	
	Lua_ZonePE_Z24_Set();
end