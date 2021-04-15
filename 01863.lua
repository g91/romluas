function LuaFunc_InitZone_16( RoomID )

	--Z16 礦16_1 旗標編號 780647 X 110
	--Z16 木16_1 旗標編號 780648 X 110
	--Z16 草16_1 旗標編號 780649 X 110

	--Z16 礦16_2 旗標編號 780650 X 110
	--Z16 木16_2 旗標編號 780651 X 110
	--Z16 草16_2 旗標編號 780652 X 110

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 780647 , 560009, 35 )	-- Z16_1 普通礦 
	GenerateMine( RoomID, 780647 , 560060, 4 )	-- Z16_1 稀有礦

	GenerateMine( RoomID, 780648 , 560026, 35 )	-- Z16_1 普通木
	GenerateMine( RoomID, 780648 , 560067, 4 )	-- Z16_1 稀有木

	GenerateMine( RoomID, 780649 , 560043, 35 )	-- Z16_1 普通草
	GenerateMine( RoomID, 780649 , 560074, 4 )	-- Z16_1 稀有草

--	GenerateMine( RoomID, 780650 , 560009, 50 )	-- Z16_2 普通礦 
--	GenerateMine( RoomID, 780650 , 560060, 5 )	 --Z16_2 稀有礦

--	GenerateMine( RoomID, 780651 , 560026, 50 )	-- Z16_2 普通木
--	GenerateMine( RoomID, 780651 , 560067, 5 )	-- Z16_2 稀有木

--	GenerateMine( RoomID, 780652 , 560043, 50 )	-- Z16_2 普通草
--	GenerateMine( RoomID, 780652 , 560074, 5 )	-- Z16_2 稀有草

end