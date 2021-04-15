function LuaFunc_InitZone_19( RoomID )

	--Z19 礦19_1 旗標編號 780832 X 110
	--Z19 木19_1 旗標編號 780833 X 110
	--Z19 草19_1 旗標編號 780834 X 110

	--Z19 礦19_2 旗標編號 780835 X 110
	--Z19 木19_2 旗標編號 780836 X 110
	--Z19 草19_2 旗標編號 780837 X 110

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 780832 , 560076, 35 )	-- Z19_1 普通礦 
	GenerateMine( RoomID, 780832 , 560060, 4 )	-- Z19_1 稀有礦

	GenerateMine( RoomID, 780833 , 560077, 35 )	-- Z19_1 普通木
	GenerateMine( RoomID, 780833 , 560067, 4 )	-- Z19_1 稀有木

	GenerateMine( RoomID, 780834 , 560078, 35 )	-- Z19_1 普通草
	GenerateMine( RoomID, 780834 , 560074, 4 )	-- Z19_1 稀有草

--	GenerateMine( RoomID, 780835 , 560010, 50 )	-- Z19_2 普通礦 
--	GenerateMine( RoomID, 780835 , 560060, 5 )	 --Z19_2 稀有礦

--	GenerateMine( RoomID, 780836 , 560027, 50 )	-- Z19_2 普通木
--	GenerateMine( RoomID, 780836 , 560067, 5 )	-- Z19_2 稀有木

--	GenerateMine( RoomID, 780837 , 560044, 50 )	-- Z19_2 普通草
--	GenerateMine( RoomID, 780837 , 560074, 5 )	-- Z19_2 稀有草

end