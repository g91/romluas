function LuaI_208301() --Snowflake Package 2010/08/16

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 203561 , 1 , 203513 , 1 , 206533 , 1 , 206493 , 1 , 206499 , 1, } }	-- 30天暖冬馴鹿坐騎、雪人變身藥水、金色暖冬雪人樂團裝飾、藍色緞帶暖冬樹、暖冬節浪漫裝飾圓桌

	return BaseTressureProc(   itemset , 5 )
end