function LuaFunc_InitZone_29( RoomID )

	--Z29 礦29_1 旗標編號 781388 X 120
	--Z29 木29_1 旗標編號 781389 X 120
	--Z29 草29_1 旗標編號 781390 X 120

	--Z29 礦29_2 旗標編號 781391 X 120
	--Z29 木29_2 旗標編號 781392 X 120
	--Z29 草29_2 旗標編號 781393 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781388 , 560090, 40 )	-- Z29_1 普通礦 
	GenerateMine( RoomID, 781388 , 560101, 5 )	-- Z29_1 稀有礦

	GenerateMine( RoomID, 781389 , 560094, 40 )	-- Z29_1 普通木
	GenerateMine( RoomID, 781389 , 560103, 5 )	-- Z29_1 稀有木

	GenerateMine( RoomID, 781390 , 560098, 40 )	-- Z29_1 普通草
	GenerateMine( RoomID, 781390 , 560105, 5 )	-- Z29_1 稀有草

--	GenerateMine( RoomID, 781374 , 560090, 40 )	-- Z29_2 普通礦 
--	GenerateMine( RoomID, 781374 , 560101, 5 )	 --Z29_2 稀有礦

--	GenerateMine( RoomID, 781375 , 560094, 40 )	-- Z29_2 普通木
--	GenerateMine( RoomID, 781375 , 560103, 5 )	-- Z29_2 稀有木

--	GenerateMine( RoomID, 781376 , 560098, 40 )	-- Z29_2 普通草
--	GenerateMine( RoomID, 781376 , 560105, 5 )	-- Z29_2 稀有草
	
 	Lua_ZonePE_Z29_Set();
end