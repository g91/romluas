function LuaS_Zone6to107_0()
	SetPlot(OwnerID() , "range" , "LuaS_Zone6to107_1" , 55 )
end

function LuaS_Zone6to107_1()
	if ChangeZone( OwnerID() , 107 , -1 ,4714.7 , 679.8 , 824.3 , 264) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
		DesignLog( OwnerID() , 107 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)		-- 紀錄進入人次	-- 喀里恩神殿
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaS_107toZone6_0()
	SetPlot(OwnerID() , "range" , "LuaS_107toZone6_1" , 55 )
end

function LuaS_107toZone6_1()
	ChangeZone( OwnerID() , 6 , 0 , -18560.5 ,  -778.7 , 12451.2 , 185 )
end