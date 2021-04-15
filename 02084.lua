 --	普通怪(男女)	精英	(Boss)(王級精英、世界王精英)
 --	1	0	0
 --	1	1	0
 --	1	0	1
 --	1	1	1
 --	0	1	0
 --	0	1	1
 --	0	0	1

function Lua_Hao_Event_NpcSwitch( Switch )

--	Say( OwnerID() , "1" )	-- NPC
--	Say( TargetID() , "2" )	-- 玩家
	local Treasure

	if Switch == 1 then
		Treasure = Lua_Hao_Event_NpcType( 1 , 1 , 1 )
	elseif Switch == 2 then
		Treasure = Lua_Hao_Event_NpcType( 1 , 1 , 0 ) 
	elseif Switch == 3 then
		Treasure = Lua_Hao_Event_NpcType( 1 , 0 , 1 )
	elseif Switch == 4 then
		Treasure = Lua_Hao_Event_NpcType( 0 , 1 , 1 )
	elseif Switch == 5 then
		Treasure = Lua_Hao_Event_NpcType( 1 , 0 , 0 )
	elseif Switch == 6 then
		Treasure = Lua_Hao_Event_NpcType( 0 , 1 , 0 )
	elseif Switch == 7 then
		Treasure = Lua_Hao_Event_NpcType( 0 , 0 , 1 )
	elseif Switch >= 100001 and Switch <= 109999  then
		Treasure = Lua_Hao_Event_NpcID( Switch )
		--	DebugMsg( 0 , 0 , "Let's Go" )
	else
		DebugMsg( 0 , 0 , "Error ! There is no such option ." )
	end

	if Treasure == true then
	--	DebugMsg( 0 , 0 , "Let's ok" )
		return true
	else
		return false
	end
end

function Lua_Hao_Event_NpcType( Switch1 , Switch2 , Switch3 )

	local NPCID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) 
	local Type = GameObjInfo_Int( NPCID ,"Sex" )  -- 抓取這個欄位

--	Say( OwnerID() , "1" )	-- NPC
--	Say( TargetID() , "2" )	-- 玩家

--	DebugMsg( 0 , 0 , "OrgID = " .. NPCID .. " , " .."Type = ".. Type )
--	DebugMsg( 0 , 0 , "Switch = " .. Switch1 .. " , " ..  Switch2 .. " , " .. Switch3 )

	if Type  == 0 or Type == 1 then
		if Switch1 == 1 then
		--	DebugMsg( 0 , 0 , "ok1" )
			return true
		elseif Switch1 == 0 then
			return false
		end
	elseif Type == 2 then
		if Switch2 == 1 then
		--	DebugMsg( 0 , 0 , "ok2" )
			return true
		elseif Switch2 == 0 then
			return false
		end
	elseif Type == 3 or Type == 4 then
		if Switch3 == 1 then
		--	DebugMsg( 0 , 0 , "ok3" )
			return true
		elseif Switch3 == 0 then
			return false
		end
	end
end

function Lua_Hao_Event_NpcID( ID )

	local NPCID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) 
--	DebugMsg( 0 , 0 , "OrgID = " .. NPCID .. " , " .."ID = ".. ID )
	if ID == NPCID then
	--	DebugMsg( 0 , 0 , "ok" )
		return true
	else
	--	DebugMsg( 0 , 0 , "ID does not match" )
		return false
	end
end