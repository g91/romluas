function LuaFunc_Zone_30_Mineral( RoomID )

	--Z30 礦30_1 旗標編號 781394 X 120
	--Z30 木30_1 旗標編號 781395 X 120
	--Z30 草30_1 旗標編號 781396 X 120

	--Z30 礦30_2 旗標編號 781397 X 120
	--Z30 木30_2 旗標編號 781398 X 120
	--Z30 草30_2 旗標編號 781399 X 120

	-- GenerateMine( RoomID, FlagID, MineID, Count )    

	GenerateMine( RoomID, 781394 , 560091, 40 )	-- Z30_1 普通礦 
	GenerateMine( RoomID, 781394 , 560102, 5 )	-- Z30_1 稀有礦

	GenerateMine( RoomID, 781395 , 560095, 40 )	-- Z30_1 普通木
	GenerateMine( RoomID, 781395 , 560104, 5 )	-- Z30_1 稀有木

	GenerateMine( RoomID, 781396 , 560099, 40 )	-- Z30_1 普通草
	GenerateMine( RoomID, 781396 , 560106, 5 )	-- Z30_1 稀有草

--	GenerateMine( RoomID, 781397 , 560091, 40 )	-- Z30_2 普通礦 
--	GenerateMine( RoomID, 781397 , 560102, 5 )	 --Z30_2 稀有礦

--	GenerateMine( RoomID, 781398 , 560095, 40 )	-- Z30_2 普通木
--	GenerateMine( RoomID, 781398 , 560104, 5 )	-- Z30_2 稀有木

--	GenerateMine( RoomID, 781399 , 560099, 40 )	-- Z30_2 普通草
--	GenerateMine( RoomID, 781399 , 560106, 5 )	-- Z30_2 稀有草
	
	Lua_ZonePE_Z30_Set()	--Z30 PE劇情
end