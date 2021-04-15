function LuaFunc_InitZone_31( RoomID )

	--Z31_礦1 旗標編號 781118 X 90
	--Z31_木1 旗標編號 781119 X 90
	--Z31_草1 旗標編號 781120 X 90

	--預備編號 未使用
	--Z31_礦2 旗標編號 781121 
	--Z31_木2 旗標編號 781122 
	--Z31_草2 旗標編號 781123

	GenerateMine( RoomID, 781118, 560001, 20 );	-- 黃銅礦  普通礦
	GenerateMine( RoomID, 781118, 560002, 7 );	-- 錫礦      普通礦
	GenerateMine( RoomID, 781118, 560055, 3 );	-- 火焰塵  稀有礦

	GenerateMine( RoomID, 781119, 560018, 20 );	-- 輕木       普通木
	GenerateMine( RoomID, 781119, 560019, 7 );	-- 柳木       普通木
	GenerateMine( RoomID, 781119, 560062, 3 );	-- 風鈴木   稀有木

	GenerateMine( RoomID, 781120, 560035, 20 );	-- 山魔楊草 普通草
	GenerateMine( RoomID, 781120, 560036, 7 );	-- 野漿草     普通草
	GenerateMine( RoomID, 781120, 560069, 3 );	-- 迷迭香     稀有草

	-- 備用
--	GenerateMine( RoomID, 781121, 560001, 20 );	-- 黃銅礦  普通礦
--	GenerateMine( RoomID, 781121, 560002, 7 );	-- 錫礦      普通礦
--	GenerateMine( RoomID, 781121, 560055, 3 );	-- 火焰塵  稀有礦

--	GenerateMine( RoomID, 781122, 560018, 20 );	-- 輕木       普通木
--	GenerateMine( RoomID, 781122, 560019, 7 );	-- 柳木       普通木
--	GenerateMine( RoomID, 781122, 560062, 3 );	-- 風鈴木   稀有木

--	GenerateMine( RoomID, 781123, 560035, 20 );	-- 山魔楊草 普通草
--	GenerateMine( RoomID, 781123, 560036, 7 );	-- 野漿草     普通草
--	GenerateMine( RoomID, 781123, 560069, 3 );	-- 迷迭香     稀有草

end