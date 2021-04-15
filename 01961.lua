function LuaFunc_InitZone_17( RoomID )

	--Z17 礦17_1 旗標編號 780705 X 110
	--Z17 木17_1 旗標編號 780706 X 110
	--Z17 草17_1 旗標編號 780707 X 110

	--Z17 礦17_2 旗標編號 780708 X 110
	--Z17 木17_2 旗標編號 780709 X 110
	--Z17 草17_2 旗標編號 780710 X 110

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 780705 , 560010, 35 )	-- Z17_1 普通礦 
	GenerateMine( RoomID, 780705 , 560060, 4 )	-- Z17_1 稀有礦

	GenerateMine( RoomID, 780706 , 560027, 35 )	-- Z17_1 普通木
	GenerateMine( RoomID, 780706 , 560067, 4 )	-- Z17_1 稀有木

	GenerateMine( RoomID, 780707 , 560044, 35 )	-- Z17_1 普通草
	GenerateMine( RoomID, 780707 , 560074, 4 )	-- Z17_1 稀有草

--	GenerateMine( RoomID, 780708 , 560010, 50 )	-- Z17_2 普通礦 
--	GenerateMine( RoomID, 780708 , 560060, 5 )	 --Z17_2 稀有礦

--	GenerateMine( RoomID, 780709 , 560027, 50 )	-- Z17_2 普通木
--	GenerateMine( RoomID, 780709 , 560067, 5 )	-- Z17_2 稀有木

--	GenerateMine( RoomID, 780710 , 560044, 50 )	-- Z17_2 普通草
--	GenerateMine( RoomID, 780710 , 560074, 5 )	-- Z17_2 稀有草

end