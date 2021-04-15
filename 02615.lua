function LuaFunc_InitZone_24( RoomID )

	--Z24 礦24_1 旗標編號 781195 X 120
	--Z24 木24_1 旗標編號 781196 X 120
	--Z24 草24_1 旗標編號 781197 X 120

	--Z24 礦24_2 旗標編號 781198 X 120
	--Z24 木24_2 旗標編號 781199 X 120
	--Z24 草24_2 旗標編號 781200 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781195 , 560085, 40 )	-- Z24_1 普通礦 
	GenerateMine( RoomID, 781195 , 560088, 5 )	-- Z24_1 稀有礦

	GenerateMine( RoomID, 781196 , 560084, 40 )	-- Z24_1 普通木
	GenerateMine( RoomID, 781196 , 560087, 5 )	-- Z24_1 稀有木

	GenerateMine( RoomID, 781197 , 560083, 40 )	-- Z24_1 普通草
	GenerateMine( RoomID, 781197 , 560086, 5 )	-- Z24_1 稀有草

--	GenerateMine( RoomID, 781198 , 560085, 40 )	-- Z24_2 普通礦 
--	GenerateMine( RoomID, 781198 , 560088, 5 )	 --Z24_2 稀有礦

--	GenerateMine( RoomID, 781199 , 560084, 40 )	-- Z24_2 普通木
--	GenerateMine( RoomID, 781199 , 560087, 5 )	-- Z24_2 稀有木

--	GenerateMine( RoomID, 781200 , 560083, 40 )	-- Z24_2 普通草
--	GenerateMine( RoomID, 781200 , 560086, 5 )	-- Z24_2 稀有草
	
	Lua_ZonePE_Z24_Set();
end