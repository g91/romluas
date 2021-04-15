function LuaFunc_InitZone_15( RoomID )

	--Z15 礦15_1 旗標編號 780580 X 150
	--Z15 木15_1 旗標編號 780581 X 150
	--Z15 草15_1 旗標編號 780582 X 150

	--Z15 礦15_2 旗標編號 780583 X 150
	--Z15 木15_2 旗標編號 780584 X 150
	--Z15 草15_2 旗標編號 780585 X 150

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 780580 , 560009, 50 )	-- Z15_1 普通礦 
	GenerateMine( RoomID, 780580 , 560060, 5 )	-- Z15_1 稀有礦

	GenerateMine( RoomID, 780581 , 560026, 50 )	-- Z15_1 普通木
	GenerateMine( RoomID, 780581 , 560067, 5 )	-- Z15_1 稀有木

	GenerateMine( RoomID, 780582 , 560043, 50 )	-- Z15_1 普通草
	GenerateMine( RoomID, 780582 , 560074, 5 )	-- Z15_1 稀有草

--	GenerateMine( RoomID, 780583 , 560009, 50 )	-- Z15_2 普通礦 
--	GenerateMine( RoomID, 780583 , 560060, 5 )	 --Z15_2 稀有礦

--	GenerateMine( RoomID, 780584 , 560026, 50 )	-- Z15_2 普通木
--	GenerateMine( RoomID, 780584 , 560067, 5 )	-- Z15_2 稀有木

--	GenerateMine( RoomID, 780585 , 560043, 50 )	-- Z15_2 普通草
--	GenerateMine( RoomID, 780585 , 560074, 5 )	-- Z15_2 稀有草

end