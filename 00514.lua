function LuaFunc_InitZone_4( RoomID )

	--Z4礦3旗標編號780132 X31
	--Z4木3旗標編號780133 X31
	--Z4草3旗標編號780134 X31

	--Z4礦4旗標編號780135 X101
	--Z4木4旗標編號780136 X101
	--Z4草4旗標編號780137 X101

	--Z4礦5旗標編號780138 X51
	--Z4木5旗標編號780139 X51
	--Z4草5旗標編號780140 X51

	-- GenerateMine( RoomID, FlagID, MineID, Count );

	GenerateMine( RoomID, 780132, 560003, 16 );	-- 赤鐵礦
	GenerateMine( RoomID, 780135, 560004, 51 );	-- 紫銅礦
	GenerateMine( RoomID, 780138, 560005, 26 );	-- 闇晶礦
	GenerateMine( RoomID, 780132, 560056, 2 );	-- 藍冰石
	GenerateMine( RoomID, 780135, 560057, 5 );	-- 大水晶
	GenerateMine( RoomID, 780138, 560057, 2 );	-- 大水晶
	GenerateMine( RoomID, 780138, 560058, 1 );	-- 奧利哈爾

	GenerateMine( RoomID, 780133, 560020, 16 );
	GenerateMine( RoomID, 780136, 560021, 51 );
	GenerateMine( RoomID, 780139, 560022, 26 );
	GenerateMine( RoomID, 780133, 560063, 2 );
	GenerateMine( RoomID, 780136, 560064, 5 );
	GenerateMine( RoomID, 780139, 560064, 2 );
	GenerateMine( RoomID, 780139, 560065, 1 );

	GenerateMine( RoomID, 780134, 560037, 16 );
	GenerateMine( RoomID, 780137, 560038, 51 );
	GenerateMine( RoomID, 780140, 560039, 26 );
	GenerateMine( RoomID, 780134, 560070, 2 );
	GenerateMine( RoomID, 780137, 560071, 5 );
	GenerateMine( RoomID, 780140, 560071, 2 );
	GenerateMine( RoomID, 780140, 560072, 1 );
end
