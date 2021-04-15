function LuaFunc_InitZone_26( RoomID )

	--Z26 礦26_1 旗標編號 781298 X 120
	--Z26 木26_1 旗標編號 781299 X 120
	--Z26 草26_1 旗標編號 781300 X 120

	--Z26 礦26_2 旗標編號 781301 X 120
	--Z26 木26_2 旗標編號 781302 X 120
	--Z26 草26_2 旗標編號 781303 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781298 , 560089, 40 )	-- Z26_1 普通礦 
	GenerateMine( RoomID, 781298 , 560101, 5 )	-- Z26_1 稀有礦

	GenerateMine( RoomID, 781299 , 560093, 40 )	-- Z26_1 普通木
	GenerateMine( RoomID, 781299 , 560103, 5 )	-- Z26_1 稀有木

	GenerateMine( RoomID, 781300 , 560097, 40 )	-- Z26_1 普通草
	GenerateMine( RoomID, 781300 , 560105, 5 )	-- Z26_1 稀有草

--	GenerateMine( RoomID, 781301 , 560089, 40 )	-- Z26_2 普通礦 
--	GenerateMine( RoomID, 781301 , 560088, 5 )	 --Z26_2 稀有礦

--	GenerateMine( RoomID, 781302 , 560093, 40 )	-- Z26_2 普通木
--	GenerateMine( RoomID, 781302 , 560103, 5 )	-- Z26_2 稀有木

--	GenerateMine( RoomID, 781303 , 560097, 40 )	-- Z26_2 普通草
--	GenerateMine( RoomID, 781303 , 560101, 5 )	-- Z26_2 稀有草
	
	Lua_ZonePE_Z26_Set();
end