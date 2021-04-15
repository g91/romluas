function Lua_100074_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100074_deadlog_1" , 0 );
end
function Lua_100074_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100074,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
--	Say(OwnerID(),"DeadScript Starting...")
	local Player = LuaFunc_PartyData(TargetID())
	for i = 1 , Player[0] do
--		Say(OwnerID(),"Player["..i.."]"..Player[i])
--		Say(OwnerID(),"count="..CountBodyItem( Player[i] , 530358 ))
--		if CheckBuff( Player[i] , 502039 ) == true then
--			Say(OwnerID(),"checkbuff=true")
--		end
		if (CheckBuff( Player[i] , 502039 ) == true) and (CountBodyItem( Player[i] , 530358 ) < 1 )then
			GiveBodyItem ( Player[i] , 530358 , 1 )	-- 頭銜：「不死摧毀者」
		end
	end
	return true
end
function Lua_100561_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100561_deadlog_1" , 0 );
end

function Lua_100561_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100561,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function Lua_100073_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100073_deadlog_1" , 0 );
end

function Lua_100073_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100073,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100563_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100563_deadlog_1" , 0 );
end

function Lua_100563_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100563,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100562_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100562_deadlog_1" , 0 );
end

function Lua_100562_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100562,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100166_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100166_deadlog_1" , 0 );
end

function Lua_100166_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100166,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100233_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100233_deadlog_1" , 0 );
end

function Lua_100233_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100233,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100236_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100236_deadlog_1" , 0 );
end

function Lua_100236_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100236,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function Lua_100264_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100264_deadlog_1" , 0 );
end

function Lua_100264_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100264,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100138_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100138_deadlog_1" , 0 );
end

function Lua_100138_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100138,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100154_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100154_deadlog_1" , 0 );
end

function Lua_100154_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100154,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100274_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100274_deadlog_1" , 0 );
end

function Lua_100274_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100274,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end
function Lua_100611_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100611_deadlog_1" , 0 );
end

function Lua_100611_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100611,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	local Player = LuaFunc_PartyData(TargetID())
	for i = 1 , Player[0] , 1 do
		if CheckBuff( Player[i] , 502042 ) == true then
			GiveBodyItem ( Player[i] , 530360 , 1 )	-- 頭銜：「索雷爾頓通緝犯」
		end
	end
	return true
end
function Lua_100160_deadlog()
	SetPlot( OwnerID() , "dead" , "Lua_100160_deadlog_1" , 0 );
end

function Lua_100160_deadlog_1()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100160,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	local Player = LuaFunc_PartyData(TargetID())
	for i = 1 , Player[0] , 1 do
		if CheckBuff( Player[i] , 502043 ) == true and CountBodyItem( Player[i] , 530361 ) <1 then
			GiveBodyItem ( Player[i] , 530361 , 1 )	-- 頭銜：「昆蟲剋星」
		end
	end
	return true
end

