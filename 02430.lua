function LuaFunc_InitZone_20( RoomID )

	--Z20 礦20_1 旗標編號 780977 X 150
	--Z20 木20_1 旗標編號 780978 X 150
	--Z20 草20_1 旗標編號 780979 X 150

	--Z20 礦20_2 旗標編號 780980 X 150
	--Z20 木20_2 旗標編號 780981 X 150
	--Z20 草20_2 旗標編號 780982 X 150

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 780977 , 560076, 50 )	-- Z20_1 普通礦 
	GenerateMine( RoomID, 780977 , 560061, 5 )	-- Z20_1 稀有礦

	GenerateMine( RoomID, 780978 , 560077, 50 )	-- Z20_1 普通木
	GenerateMine( RoomID, 780978 , 560068, 5 )	-- Z20_1 稀有木

	GenerateMine( RoomID, 780979 , 560078, 50 )	-- Z20_1 普通草
	GenerateMine( RoomID, 780979 , 560075, 5 )	-- Z20_1 稀有草

--	GenerateMine( RoomID, 780980 , 560080, 50 )	-- Z20_2 普通礦 
--	GenerateMine( RoomID, 780980 , 560060, 5 )	 --Z20_2 稀有礦

--	GenerateMine( RoomID, 780981 , 560081, 50 )	-- Z20_2 普通木
--	GenerateMine( RoomID, 780981 , 560067, 5 )	-- Z20_2 稀有木

--	GenerateMine( RoomID, 780982 , 560082, 50 )	-- Z20_2 普通草
--	GenerateMine( RoomID, 780982 , 560074, 5 )	-- Z20_2 稀有草

end