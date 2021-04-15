function Lua_100706_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100706_deadlog_1" , 0 );
end

function Lua_100706_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100706,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100707_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100707_deadlog_1" , 0 );
end

function Lua_100707_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100707,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	if CheckBuff( TargetID() , 502044 ) == true then
		GiveBodyItem ( OwnerID() , 530362 , 1 )	-- 頭銜：「吸血鬼獵人」
	end
	return true
end

function Lua_100904_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100904_deadlog_1" , 0 );
end

function Lua_100904_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100904,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function Lua_100905_deadlog()
SetPlot( OwnerID() , "dead" , "Lua_100905_deadlog_1" , 0 );
end

function Lua_100905_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100905,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function Lua_100906_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100906_deadlog_1" , 0 );
end

function Lua_100906_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100906,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function Lua_101057_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_101057_deadlog_1" , 0 )
end

function Lua_101057_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),101057,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100794_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100794_deadlog_1" , 0 )
end

function Lua_100794_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100794,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	local Player = LuaFunc_PartyData(TargetID())
	local NPC = SearchRangeNPC ( OwnerID() , 1000 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Door = 0 
	Door = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	for i=0 , table.getn(NPC) do
		if ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 112052 then
			DelObj(NPC[i])
		end
	
	end
	if CheckID( Door ) == true and ReadRoleValue( Door , EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( Door , EM_RoleValue_IsNPC) == 1 then
		DelObj(Door)
	end
	for i = 1 , Player[0] , 1 do
		if CheckBuff( Player[i] , 502180 ) == true and CountBodyItem( Player[i] , 530367) <1 then
			GiveBodyItem ( Player[i] , 530367, 1 )	-- 頭銜：「不死摧毀者」
		end
	end
	return true
end
function Lua_101018_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_101018_deadlog_1" , 0 )
end

function Lua_101018_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Door = ArFaLonandBardDoor[RoomID]


	DesignLog(OwnerID(),101018,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
--	local NPC = SearchRangeNPC ( OwnerID() , 1000 )
--	for i=0 , table.getn(NPC) do
--		if ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 112052 then
--			DelObj(NPC[i])
--		end
	
--	end
--	Say( OwnerID() , GetName( OwnerID() ) .." "..Door ) 
	DebugMsg( 0, RoomID ,"ArFaLonandBard1 = "..ArFaLonandBard[RoomID])
	if ArFaLonandBard[RoomID] > 1 then
		ArFaLonandBard[RoomID] = ArFaLonandBard[RoomID] -1
	end
	DebugMsg( 0, RoomID ,"ArFaLonandBard2 = "..ArFaLonandBard[RoomID])
	if ArFaLonandBard[RoomID] == 1 then
	DebugMsg( 0, RoomID ,"DELDOOR "..Door)
		Delobj( Door )
	end
	return true
end
function Lua_101019_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_101019_deadlog_1" , 0 )
end

function Lua_101019_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),101019,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Door = ArFaLonandBardDoor[RoomID]
	
--	if ArFaLonandBard[RoomID] == 1 then
--		local NPC = SearchRangeNPC ( OwnerID() , 1000 )
--		for i=0 , table.getn(NPC) do
--			if ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 112052 then
--				DelObj(NPC[i])
--			end
--		end
--	end
--	Say( OwnerID() , GetName( OwnerID() ) .." "..Door ) 
	DebugMsg( 0, RoomID ,"ArFaLonandBard1 = "..ArFaLonandBard[RoomID])

	if ArFaLonandBard[RoomID] > 1 then
		ArFaLonandBard[RoomID] = ArFaLonandBard[RoomID] -1
	end
	DebugMsg( 0, RoomID ,"ArFaLonandBard2 = "..ArFaLonandBard[RoomID])

	if ArFaLonandBard[RoomID] == 1 then
	DebugMsg( 0, RoomID ,"DELDOOR "..Door)
		Delobj( Door )
	end
	return true
end
function Lua_101020_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_101020_deadlog_1" , 0 )
end

function Lua_101020_deadlog_1()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	local Door = {}
	for i = 1 , 2 , 1 do
		Door[i] = 0
	end
	DesignLog(OwnerID(),101020,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	if ArFaLonandBard[RoomID] == 1 then
		local NPC = SearchRangeNPC ( OwnerID() , 1000 )
		for i=0 , table.getn(NPC) do
			if ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 112052 then
				DelObj(NPC[i])
			end
		end
	end
	Door[1] = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )
	Door[2] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  )
	for i = 1 , table.getn(Door)  , 1 do
		if CheckID( Door[i] ) == true and ReadRoleValue( Door[i] , EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( Door[i] , EM_RoleValue_IsNPC) == 1 then
			DelObj(Door[i])
		end
	end
	return true
end
function Lua_101021_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_101021_deadlog_1" , 0 )
end

function Lua_101021_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	local Door = {}
	local RoomID = readroleValue( OwnerID() , EM_RoleValue_RoomID )
	for i = 1 , 2 , 1 do
		Door[i] = 0
	end
	DesignLog(OwnerID(),101021,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	local NPC = SearchRangeNPC ( OwnerID() , 1000 )
	for i=0 , table.getn(NPC) do
		if ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 112052 then
			DelObj(NPC[i])
		end
	
	end
	Door[1] = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )
	Door[2] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1  )
	for i = 1 , table.getn(Door)  , 1 do
		if CheckID( Door[i] ) == true and ReadRoleValue( Door[i] , EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( Door[i] , EM_RoleValue_IsNPC) == 1 then
			DelObj(Door[i])
		end
	end
	return true
end

function Lua_100965_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100965_deadlog_1" , 0 );
end

function Lua_100965_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100965 ,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function Lua_100969_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100969_deadlog_1" , 0 );
end

function Lua_100969_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100969 ,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function Lua_100967_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100967_deadlog_1" , 0 );
end

function Lua_100967_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100967 ,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function Lua_100971_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100971_deadlog_1" , 0 );
end

function Lua_100971_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100971 ,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end