function LuaFunc_InitZone_18( RoomID )

	--Z17 礦17_1 旗標編號 780787 X 120
	--Z17 木17_1 旗標編號 780788 X 120
	--Z17 草17_1 旗標編號 780792 X 120

	--Z17 礦17_2 旗標編號 780790 X 120
	--Z17 木17_2 旗標編號 780791 X 120
	--Z17 草17_2 旗標編號 780789 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 780787 , 560010, 40 )	-- Z17_1 普通礦 
	GenerateMine( RoomID, 780787 , 560060, 4 )	-- Z17_1 稀有礦

	GenerateMine( RoomID, 780788 , 560027, 40 )	-- Z17_1 普通木
	GenerateMine( RoomID, 780788 , 560067, 4 )	-- Z17_1 稀有木

	GenerateMine( RoomID, 780792 , 560044, 40 )	-- Z17_1 普通草
	GenerateMine( RoomID, 780792 , 560074, 4 )	-- Z17_1 稀有草

--	GenerateMine( RoomID, 780790 , 560010, 50 )	-- Z17_2 普通礦 
--	GenerateMine( RoomID, 780790 , 560060, 5 )	 --Z17_2 稀有礦

--	GenerateMine( RoomID, 780791 , 560027, 50 )	-- Z17_2 普通木
--	GenerateMine( RoomID, 780791 , 560067, 5 )	-- Z17_2 稀有木

--	GenerateMine( RoomID, 780789 , 560044, 50 )	-- Z17_2 普通草
--	GenerateMine( RoomID, 780789 , 560074, 5 )	-- Z17_2 稀有草

end