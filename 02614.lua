function LuaFunc_InitZone_23( RoomID )

	--Z23 礦23_1 旗標編號 781159 X 120
	--Z23 木23_1 旗標編號 781160 X 120
	--Z23 草23_1 旗標編號 781161 X 120

	--Z23 礦23_2 旗標編號 781162 X 120
	--Z23 木23_2 旗標編號 781163 X 120
	--Z23 草23_2 旗標編號 781164 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781159 , 560085, 40 )	-- Z23_1 普通礦 
	GenerateMine( RoomID, 781159 , 560088, 5 )	-- Z23_1 稀有礦

	GenerateMine( RoomID, 781160 , 560084, 40 )	-- Z23_1 普通木
	GenerateMine( RoomID, 781160 , 560087, 5 )	-- Z23_1 稀有木

	GenerateMine( RoomID, 781161 , 560083, 40 )	-- Z23_1 普通草
	GenerateMine( RoomID, 781161 , 560086, 5 )	-- Z23_1 稀有草

--	GenerateMine( RoomID, 781162 , 560085, 40 )	-- Z23_2 普通礦 
--	GenerateMine( RoomID, 781162 , 560088, 5 )	 --Z23_2 稀有礦

--	GenerateMine( RoomID, 781163 , 560084, 40 )	-- Z23_2 普通木
--	GenerateMine( RoomID, 781163 , 560087, 5 )	-- Z23_2 稀有木

--	GenerateMine( RoomID, 781164 , 560083, 40 )	-- Z23_2 普通草
--	GenerateMine( RoomID, 781164 , 560086, 5 )	-- Z23_2 稀有草

	Lua_ZonePE_Z23_Set();
end