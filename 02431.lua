----副本出入口的Script
-------102678   110578  112224
-----副本傳送門暫定區
--function zone_17_NOOPEN_Enter()
	--SetPlot( OwnerID() , "Collision" , "bk_17_NOOPEN_enter" , 1 )
--end
--function bk_17_NOOPEN_enter()
	--ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_17NOOPEN]" , 0 )
--end

--傳進點：/GM ? zone 139 -1 909.8 1470.6 -1420.9 180.5
--傳出點：/GM ? Zone 20 0 -18371.4 191.1 33711.4
--外面門點：/GM ? Zone 20 0 -18372 191.1 33667
--內部門點：/GM ? zone 139 -1 935.9 1472.2 -1419.4

function zone_20_139_140_Enter()
	SetPlot( OwnerID() , "Collision" , "sasa_20_139_140_Enter" , 1 )
end
function sasa_20_139_140_Enter()
	local PlayerLV = 0
	local PlayerSUBLV = 0
	local y=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	if GetPartyID( OwnerID() , -1 ) == 0 then			--判斷有沒有隊伍
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then				--讀取個人的困難度選擇
			if ChangeZone( OwnerID() , 140 , -1 , 909.8 , 1470.6 , -1420.9 , 180.5 ) then	--飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )						--取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
				DesignLog( OwnerID() , 140 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		--紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then			--讀取個人的困難度選擇
			if ChangeZone( OwnerID() , 139 , -1 , 909.8 , 1470.6 , -1420.9 , 180.5 ) then	--飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )						--取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
				DesignLog( OwnerID() , 139 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		--紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		--elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 2 then			--讀取個人的困難度選擇
			--if ChangeZone( OwnerID() , 133 , -1 , 1855 , 495.5 , 1889.5 , 350 ) then		--飛進去副本的座標
				--PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )						--取得玩家等級
				--PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
				--DesignLog( OwnerID() , 133 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	--紀錄進入人次	
			--else
				--ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			--end
		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then			--判斷有沒有隊伍
		if PartyInstanceLv( OwnerID() ) == 0 then										--讀取個人的困難度選擇
			if ChangeZone( OwnerID() , 140 , -1 , 909.8 , 1470.6 , -1420.9 , 180.5 ) then	--飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )						--取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
				DesignLog( OwnerID() , 140 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		--紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif PartyInstanceLv( OwnerID() ) == 1 then										--讀取個人的困難度選擇
			if ChangeZone( OwnerID() , 139 , -1 , 909.8 , 1470.6 , -1420.9 , 180.5 ) then	--飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )						--取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
				DesignLog( OwnerID() , 139 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		--紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		--elseif PartyInstanceLv( OwnerID() ) == 2 then										--讀取個人的困難度選擇
			--if ChangeZone( OwnerID() , 133 , -1 , 1855 , 495.5 , 1889.5 , 350 ) then		--飛進去副本的座標
				--PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
				--PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )			--取得玩家副職等級
				--DesignLog( OwnerID() , 133 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )	--紀錄進入人次	
			--else
				--ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			--end
		end	
	end	
end

function zone_20_139_140_Out()
	SetPlot( OwnerID() , "Collision" , "sasa_20_139_140_Out" , 0 )
end
function sasa_20_139_140_Out()
	if ChangeZone( OwnerID() , 20 , 0 , -18371.4 , 191.1 , 33711.4 , 0 ) then			--出副本後的座標點

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end