function LuaFunc_InitZone_14( Room14 )

	--Z14 礦14_1 旗標編號 780917 X 130
	--Z14 木14_1 旗標編號 780919 X 130
	--Z14 草14_1 旗標編號 780921 X 130

	--Z14 礦14_2 旗標編號 780918 X 130
	--Z14 木14_2 旗標編號 780920 X 130
	--Z14 草14_2 旗標編號 780922 X 130

	-- GenerateMine( Room14, FlagID, MineID, Count )    

	GenerateMine( Room14, 780917 , 560008, 45 )	-- Z14_1 普通礦 
	GenerateMine( Room14, 780917 , 560059, 5 )	-- Z14_1 稀有礦

	GenerateMine( Room14, 780919 , 560025, 45 )	-- Z14_1 普通木
	GenerateMine( Room14, 780919 , 560066, 5 )	-- Z14_1 稀有木

	GenerateMine( Room14, 780921 , 560042, 45 )	-- Z14_1 普通草
	GenerateMine( Room14, 780921 , 560073, 5 )	-- Z14_1 稀有草

--	GenerateMine( Room14, 780918 , 560010, 50 )	-- Z14_2 普通礦 
--	GenerateMine( Room14, 780918 , 560060, 5 )	 --Z14_2 稀有礦

--	GenerateMine( Room14, 780920 , 560027, 50 )	-- Z14_2 普通木
--	GenerateMine( Room14, 780920 , 560067, 5 )	-- Z14_2 稀有木

--	GenerateMine( Room14, 780922 , 560044, 50 )	-- Z14_2 普通草
--	GenerateMine( Room14, 780922 , 560074, 5 )	-- Z14_2 稀有草

end