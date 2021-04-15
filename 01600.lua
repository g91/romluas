----副本出入口的Script

-----副本傳送門暫定區

function LuaI_zone_119_Enter()
	SetPlot( OwnerID() , "Collision" , "LuaS_zone_119_Enter" , 0 )
end
function LuaS_zone_119_Enter()
	if ChangeZone( OwnerID() , 119 , -1 , 3407 , 1502 , 3462 , 200 ) then ---飛進去副本的座標
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
		DesignLog( OwnerID() , 119 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

function LuaI_zone_119_Out()
	SetPlot( OwnerID() , "Collision" , "LuaS_zone_119_Out" , 0 )
end
function LuaS_zone_119_Out()
	if ChangeZone( OwnerID() , 9 , 0, -18430 , 904 , 27013 , 259 ) then ---出副本後的座標點

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
