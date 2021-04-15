function LuaFunc_InitZone_27( RoomID )

	--Z27 礦27_1 旗標編號 781348 X 120
	--Z27 木27_1 旗標編號 781349 X 120
	--Z27 草27_1 旗標編號 781350 X 120

	--Z27 礦27_2 旗標編號 781351 X 120
	--Z27 木27_2 旗標編號 781352 X 120
	--Z27 草27_2 旗標編號 781353 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781348 , 560089, 40 )	-- Z27_1 普通礦 
	GenerateMine( RoomID, 781348 , 560101, 5 )	-- Z27_1 稀有礦

	GenerateMine( RoomID, 781349 , 560093, 40 )	-- Z27_1 普通木
	GenerateMine( RoomID, 781349 , 560103, 5 )	-- Z27_1 稀有木

	GenerateMine( RoomID, 781350 , 560097, 40 )	-- Z27_1 普通草
	GenerateMine( RoomID, 781350 , 560105, 5 )	-- Z27_1 稀有草

--	GenerateMine( RoomID, 781351 , 560089, 40 )	-- Z27_2 普通礦 
--	GenerateMine( RoomID, 781351 , 560101, 5 )	 --Z27_2 稀有礦

--	GenerateMine( RoomID, 781352 , 560093, 40 )	-- Z27_2 普通木
--	GenerateMine( RoomID, 781352 , 560103, 5 )	-- Z27_2 稀有木

--	GenerateMine( RoomID, 781353 , 560097, 40 )	-- Z27_2 普通草
--	GenerateMine( RoomID, 781353 , 560105, 5 )	-- Z27_2 稀有草
	
 	Lua_ZonePE_Z27_Set();
end