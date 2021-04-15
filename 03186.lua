function LuaFunc_InitZone_32( RoomID )

	--Z32 礦32_1 旗標編號 781430 X 120
	--Z32 木32_1 旗標編號 781431 X 120
	--Z32 草32_1 旗標編號 781432 X 120
                 
	--Z32 礦32_2 旗標編號 781433 X 120
	--Z32 木32_2 旗標編號 781434 X 120
	--Z32 草32_2 旗標編號 781435 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781430 , 560091, 40 )	-- Z32_1 普通礦 
	GenerateMine( RoomID, 781430 , 560102, 5 )	-- Z32_1 稀有礦

	GenerateMine( RoomID, 781431 , 560095, 40 )	-- Z32_1 普通木
	GenerateMine( RoomID, 781431 , 560104, 5 )	-- Z32_1 稀有木

	GenerateMine( RoomID, 781432 , 560099, 40 )	-- Z32_1 普通草
	GenerateMine( RoomID, 781432 , 560106, 5 )	-- Z32_1 稀有草

--	GenerateMine( RoomID, 781433 , 560091, 40 )	-- Z32_2 普通礦 
--	GenerateMine( RoomID, 781433 , 560102, 5 )	 --Z32_2 稀有礦

--	GenerateMine( RoomID, 781434 , 560095, 40 )	-- Z32_2 普通木
--	GenerateMine( RoomID, 781434 , 560104, 5 )	-- Z32_2 稀有木

--	GenerateMine( RoomID, 781435 , 560099, 40 )	-- Z32_2 普通草
--	GenerateMine( RoomID, 781435 , 560106, 5 )	-- Z32_2 稀有草
	
	Lua_ZonePE_Z32_Set()	--Z32 PE劇情
end