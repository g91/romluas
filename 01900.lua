----副本出入口的Script
-------102678   110578  112224
-----副本傳送門暫定區

function zone_16_129_131_Enter()
	SetPlot( OwnerID() , "Collision" , "bk_16_129_131_Enter" , 1 )
end
function bk_16_129_131_Enter()
	local PlayerLV = 0
	local PlayerSUBLV = 0
	local y=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	if y>=-50 then 
	elseif y<= -60 then 
		if GetPartyID( OwnerID() , -1 ) == 0 then		-----判斷有沒有隊伍
			if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then
				if ChangeZone( OwnerID() , 131 , -1 , 1855 , 495.5 , 1889.5 , 350 ) then ---飛進去副本的座標
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( OwnerID() , 131 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then
				if ChangeZone( OwnerID() , 129 , -1 , 1855 , 495.5 , 1889.5 , 350 ) then ---飛進去副本的座標
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( OwnerID() , 129 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end	
		elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
			if PartyInstanceLv( OwnerID() ) == 0 then
				if ChangeZone( OwnerID() , 131 , -1 , 1855 , 495.5 , 1889.5 , 350 ) then ---飛進去副本的座標
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( OwnerID() , 131 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			elseif PartyInstanceLv( OwnerID() ) == 1 then
				if ChangeZone( OwnerID() , 129 , -1 , 1855 , 495.5 , 1889.5 , 350 ) then ---飛進去副本的座標
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( OwnerID() , 129 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end	
		end	
	end
end

function zone_16_129_131_Out()
	SetPlot( OwnerID() , "Collision" , "bk_16_129_131_Out" , 0 )
end
function bk_16_129_131_Out()
	if ChangeZone( OwnerID() , 16 , 0, -1413.5 , -209, 18445.8 , 311.4 ) then ---出副本後的座標點

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end