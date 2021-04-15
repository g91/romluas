----副本出入口的Script
function LuaI_the_origin_Enter()
	SetPlot( OwnerID() , "Collision" , "LuaS_the_origin_Enter" , 0 )
end
function LuaS_the_origin_Enter()
	if ChangeZone( OwnerID() , 116 , -1 , 828 , 263 , 963 , 343 ) then ---飛進去副本的座標
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
		DesignLog( OwnerID() , 116 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

function LuaI_the_origin_Out()
	SetPlot( OwnerID() , "Collision" , "LuaS_the_origin_Out" , 0 )
end
function LuaS_the_origin_Out()
	if ChangeZone( OwnerID() , 4 , 0 , -11724, 119 , 8629 , 360 ) then ---出副本後的座標點

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end
