function LuaFunc_InitZone_22( RoomID )

	--Z22 礦22_1 旗標編號 781091 X 120
	--Z22 木22_1 旗標編號 781092 X 120
	--Z22 草22_1 旗標編號 781093 X 120

	--Z22 礦22_2 旗標編號 781094 X 120
	--Z22 木22_2 旗標編號 781095 X 120
	--Z22 草22_2 旗標編號 781096 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781091 , 560080, 40 )	-- Z22_1 普通礦 
	GenerateMine( RoomID, 781091 , 560061, 5 )	-- Z22_1 稀有礦

	GenerateMine( RoomID, 781092 , 560081, 40 )	-- Z22_1 普通木
	GenerateMine( RoomID, 781092 , 560068, 5 )	-- Z22_1 稀有木

	GenerateMine( RoomID, 781093 , 560082, 40 )	-- Z22_1 普通草
	GenerateMine( RoomID, 781093 , 560075, 5 )	-- Z22_1 稀有草

--	GenerateMine( RoomID, 781094 , 560080, 40 )	-- Z22_2 普通礦 
--	GenerateMine( RoomID, 781094 , 560060, 5 )	 --Z22_2 稀有礦

--	GenerateMine( RoomID, 781095 , 560081, 40 )	-- Z22_2 普通木
--	GenerateMine( RoomID, 781095 , 560067, 5 )	-- Z22_2 稀有木

--	GenerateMine( RoomID, 781096 , 560082, 40 )	-- Z22_2 普通草
--	GenerateMine( RoomID, 781096 , 560074, 5 )	-- Z22_2 稀有草

	Lua_ZonePE_Z22_Set();
end