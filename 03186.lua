function LuaFunc_InitZone_32( RoomID )

	--Z32 �q32_1 �X�нs�� 781430 X 120
	--Z32 ��32_1 �X�нs�� 781431 X 120
	--Z32 ��32_1 �X�нs�� 781432 X 120
                 
	--Z32 �q32_2 �X�нs�� 781433 X 120
	--Z32 ��32_2 �X�нs�� 781434 X 120
	--Z32 ��32_2 �X�нs�� 781435 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781430 , 560091, 40 )	-- Z32_1 ���q�q 
	GenerateMine( RoomID, 781430 , 560102, 5 )	-- Z32_1 �}���q

	GenerateMine( RoomID, 781431 , 560095, 40 )	-- Z32_1 ���q��
	GenerateMine( RoomID, 781431 , 560104, 5 )	-- Z32_1 �}����

	GenerateMine( RoomID, 781432 , 560099, 40 )	-- Z32_1 ���q��
	GenerateMine( RoomID, 781432 , 560106, 5 )	-- Z32_1 �}����

--	GenerateMine( RoomID, 781433 , 560091, 40 )	-- Z32_2 ���q�q 
--	GenerateMine( RoomID, 781433 , 560102, 5 )	 --Z32_2 �}���q

--	GenerateMine( RoomID, 781434 , 560095, 40 )	-- Z32_2 ���q��
--	GenerateMine( RoomID, 781434 , 560104, 5 )	-- Z32_2 �}����

--	GenerateMine( RoomID, 781435 , 560099, 40 )	-- Z32_2 ���q��
--	GenerateMine( RoomID, 781435 , 560106, 5 )	-- Z32_2 �}����
	
	Lua_ZonePE_Z32_Set()	--Z32 PE�@��
end