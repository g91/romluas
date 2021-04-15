function LuaFunc_InitZone_21( RoomID )

	--Z21 礦21_1 旗標編號 781018 X 140
	--Z21 木21_1 旗標編號 781019 X 140
	--Z21 草21_1 旗標編號 781020 X 140

	--Z21 礦21_2 旗標編號 781021 X 140
	--Z21 木21_2 旗標編號 781022 X 140
	--Z21 草21_2 旗標編號 781023 X 140

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781018 , 560080, 45 )	-- Z20_1 普通礦 
	GenerateMine( RoomID, 781018 , 560061, 5 )	-- Z20_1 稀有礦

	GenerateMine( RoomID, 781019 , 560081, 45 )	-- Z20_1 普通木
	GenerateMine( RoomID, 781019 , 560068, 5 )	-- Z20_1 稀有木

	GenerateMine( RoomID, 781020 , 560082, 45 )	-- Z20_1 普通草
	GenerateMine( RoomID, 781020 , 560075, 5 )	-- Z20_1 稀有草

--	GenerateMine( RoomID, 781021 , 560080, 45 )	-- Z20_2 普通礦 
--	GenerateMine( RoomID, 781021 , 560060, 5 )	 --Z20_2 稀有礦

--	GenerateMine( RoomID, 781022 , 560081, 45 )	-- Z20_2 普通木
--	GenerateMine( RoomID, 781022 , 560067, 5 )	-- Z20_2 稀有木

--	GenerateMine( RoomID, 781023 , 560082, 45 )	-- Z20_2 普通草
--	GenerateMine( RoomID, 781023 , 560074, 5 )	-- Z20_2 稀有草
	Lua_ZonePE_Z21_Set();
end