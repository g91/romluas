function LuaFunc_InitZone_28( RoomID )

	--Z28 礦28_1 旗標編號 781371 X 120
	--Z28 木28_1 旗標編號 781372 X 120
	--Z28 草28_1 旗標編號 781373 X 120

	--Z28 礦28_2 旗標編號 781374 X 120
	--Z28 木28_2 旗標編號 781375 X 120
	--Z28 草28_2 旗標編號 781376 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781371 , 560090, 40 )	-- Z28_1 普通礦 
	GenerateMine( RoomID, 781371 , 560101, 5 )	-- Z28_1 稀有礦

	GenerateMine( RoomID, 781372 , 560094, 40 )	-- Z28_1 普通木
	GenerateMine( RoomID, 781372 , 560103, 5 )	-- Z28_1 稀有木

	GenerateMine( RoomID, 781373 , 560098, 40 )	-- Z28_1 普通草
	GenerateMine( RoomID, 781373 , 560105, 5 )	-- Z28_1 稀有草

--	GenerateMine( RoomID, 781374 , 560090, 40 )	-- Z28_2 普通礦 
--	GenerateMine( RoomID, 781374 , 560101, 5 )	 --Z28_2 稀有礦

--	GenerateMine( RoomID, 781375 , 560094, 40 )	-- Z28_2 普通木
--	GenerateMine( RoomID, 781375 , 560103, 5 )	-- Z28_2 稀有木

--	GenerateMine( RoomID, 781376 , 560098, 40 )	-- Z28_2 普通草
--	GenerateMine( RoomID, 781376 , 560105, 5 )	-- Z28_2 稀有草
	
 	Lua_ZonePE_Z28_Set();
end