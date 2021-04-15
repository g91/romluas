--============================================================傳送script======================================================================================================--
--入口
function LuaS_207to206_0()
	SetPlot(OwnerID() , "range" , "LuaS_207to206_1" , 30 )
end


function LuaS_207to206_1()
	if  ChangeZone( OwnerID() , 206 , 0, 5443, 396, 2413, 80) then
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaS_206to205_0()
	SetPlot(OwnerID() , "range" , "LuaS_206to205_1" , 30 )
end


function LuaS_206to205_1()
	if ChangeZone( OwnerID() , 205 , 0, 5731 , 429 , 3786 , 90) then
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end
------------------------

--出口

function LuaS_205to206_0()
	SetPlot(OwnerID() , "range" , "LuaS_205to206_1" , 30 )
end

function LuaS_205to206_1()
	if ChangeZone( OwnerID() , 206 , 0, 3364 , 362 , 1614 , 270) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- 取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- 取得玩家副職等級
		DesignLog(OwnerID() , 206 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- 紀錄進入人次	-- 守衛軍曲廊
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end





function LuaS_206to207_0()
	SetPlot(OwnerID() , "range" , "LuaS_206to207_1" , 30 )
end

function LuaS_206to207_1()
	if ChangeZone( OwnerID() , 207 , 0, 4822, 343, 1258, 270) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- 取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- 取得玩家副職等級
		DesignLog(OwnerID() , 207 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- 紀錄進入人次	-- 皇族避難所
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

--從海波拉古城到哈洛夫交易站

function Lua_PP_GOTO_TOWN()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_PP_GOTO_TOWN_A" , 0 )
end

function Lua_PP_GOTO_TOWN_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 5 , 0 ,  -14466, 756, -170, 2 )
end

--從外面進入海波拉古城

function LuaS_Zone5to205_0()
	SetPlot(OwnerID() , "touch" , "LuaS_Zone5to205_1" , 50 )
end

function LuaS_Zone5to205_1()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	if ChangeZone( OwnerID() , 205 , 0, 1813 , 395 , 1139 , 270 ) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- 取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- 取得玩家副職等級
		DesignLog(OwnerID() , 205 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- 紀錄進入人次	-- 復活者甬道
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end



function LuaS_Zone5to206_0()
	SetPlot(OwnerID() , "touch" , "LuaS_Zone5to203_1" , 50 )
end

function LuaS_Zone5to206_1()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	if ChangeZone( OwnerID() , 206 , 0, 3364 , 365 , 1614 , 270) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- 取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- 取得玩家副職等級
		DesignLog(OwnerID() , 206 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- 紀錄進入人次	-- 守衛軍曲廊
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end



function LuaS_Zone5to207_0()
	SetPlot(OwnerID() , "touch" , "LuaS_Zone5to204_1" , 50 )
end

function LuaS_Zone5to207_1()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	if ChangeZone( OwnerID() , 207 , 0, 4822, 346, 1258, 270) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- 取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			-- 取得玩家副職等級
		DesignLog(OwnerID() , 207 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	-- 紀錄進入人次	-- 皇族避難所
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

--205各點傳送
function Lua_205_GOTO_PP1()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_205_GOTO_PP1_A" , 0 )
end

function Lua_205_GOTO_PP1_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 205 , 0 , 3120, 429 ,  1440 , 0 )
end

function Lua_205_GOTO_PP2()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_205_GOTO_PP2_A" , 0 )
end

function Lua_205_GOTO_PP2_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 205 , 0 ,5561, 429 , 1055 , 90 )
end

function Lua_205_GOTO_PP3()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_205_GOTO_PP3_A" , 0 )
end

function Lua_205_GOTO_PP3_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 205 , 0 , 6156, 429 , 2638 , 90 )
end

--206各點傳送
function Lua_206_GOTO_PP1()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_206_GOTO_PP1_A" , 0 )
end

function Lua_206_GOTO_PP1_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 206 , 0 ,  1314, 396, 1268, 180 )
end

function Lua_206_GOTO_PP2()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_206_GOTO_PP2_A" , 0 )
end

function Lua_206_GOTO_PP2_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 206 , 0 , 1916, 396, 2915, 90 )
end

function Lua_206_GOTO_PP3()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_206_GOTO_PP3_A" , 0 )
end

function Lua_206_GOTO_PP3_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 206 , 0 ,  3303, 396, 2900 , 90 )
end

function Lua_206_GOTO_PP4()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_206_GOTO_PP4_A" , 0 )
end

function Lua_206_GOTO_PP4_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 206 , 0 ,5198, 396, 1696 , 90 )
end

--207各點傳送
function Lua_207_GOTO_PP1()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_207_GOTO_PP1_A" , 0 )
end

function Lua_207_GOTO_PP1_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 207 , 0 , 4167, 378, 3432, 360 )
end

function Lua_207_GOTO_PP2()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_207_GOTO_PP2_A" , 0 )
end

function Lua_207_GOTO_PP2_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 207 , 0 ,  2412, 390, 4143 , 90 )
end

function Lua_207_GOTO_PP3()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "Lua_207_GOTO_PP3_A" , 0 )
end

function Lua_207_GOTO_PP3_A()
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep( 5 )
	ChangeZone( OwnerID() , 207 , 0 ,  1913 , 378 , 2392 , 270 )
end