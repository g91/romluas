function LuaFunc_Zone_30_Mineral( RoomID )

	--Z30 �q30_1 �X�нs�� 781394 X 120
	--Z30 ��30_1 �X�нs�� 781395 X 120
	--Z30 ��30_1 �X�нs�� 781396 X 120

	--Z30 �q30_2 �X�нs�� 781397 X 120
	--Z30 ��30_2 �X�нs�� 781398 X 120
	--Z30 ��30_2 �X�нs�� 781399 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781394 , 560091, 40 )	-- Z30_1 ���q�q 
	GenerateMine( RoomID, 781394 , 560102, 5 )	-- Z30_1 �}���q

	GenerateMine( RoomID, 781395 , 560095, 40 )	-- Z30_1 ���q��
	GenerateMine( RoomID, 781395 , 560104, 5 )	-- Z30_1 �}����

	GenerateMine( RoomID, 781396 , 560099, 40 )	-- Z30_1 ���q��
	GenerateMine( RoomID, 781396 , 560106, 5 )	-- Z30_1 �}����

--	GenerateMine( RoomID, 781397 , 560091, 40 )	-- Z30_2 ���q�q 
--	GenerateMine( RoomID, 781397 , 560102, 5 )	 --Z30_2 �}���q

--	GenerateMine( RoomID, 781398 , 560095, 40 )	-- Z30_2 ���q��
--	GenerateMine( RoomID, 781398 , 560104, 5 )	-- Z30_2 �}����

--	GenerateMine( RoomID, 781399 , 560099, 40 )	-- Z30_2 ���q��
--	GenerateMine( RoomID, 781399 , 560106, 5 )	-- Z30_2 �}����
	
	Lua_ZonePE_Z30_Set()	--Z30 PE�@��
end