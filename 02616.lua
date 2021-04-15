function LuaFunc_InitZone_25( RoomID )

	--Z25 礦25_1 旗標編號 781265 X 120
	--Z25 木25_1 旗標編號 781266 X 120
	--Z25 草25_1 旗標編號 781267 X 120

	--Z25 礦25_2 旗標編號 781268 X 120
	--Z25 木25_2 旗標編號 781269 X 120
	--Z25 草25_2 旗標編號 781270 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781265 , 560085, 40 )	-- Z25_1 普通礦 
	GenerateMine( RoomID, 781265 , 560088, 5 )	-- Z25_1 稀有礦

	GenerateMine( RoomID, 781266 , 560084, 40 )	-- Z25_1 普通木
	GenerateMine( RoomID, 781266 , 560087, 5 )	-- Z25_1 稀有木

	GenerateMine( RoomID, 781267 , 560083, 40 )	-- Z25_1 普通草
	GenerateMine( RoomID, 781267 , 560086, 5 )	-- Z25_1 稀有草

--	GenerateMine( RoomID, 781268 , 560085, 40 )	-- Z25_2 普通礦 
--	GenerateMine( RoomID, 781268 , 560088, 5 )	 --Z25_2 稀有礦

--	GenerateMine( RoomID, 781269 , 560084, 40 )	-- Z25_2 普通木
--	GenerateMine( RoomID, 781269 , 560087, 5 )	-- Z25_2 稀有木

--	GenerateMine( RoomID, 781270 , 560083, 40 )	-- Z25_2 普通草
--	GenerateMine( RoomID, 781270 , 560086, 5 )	-- Z25_2 稀有草
	
	Lua_ZonePE_Z25_Set();
end