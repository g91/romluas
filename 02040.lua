----副本出入口的Script
-------102678   110578  112224
-----副本傳送門暫定區
function zone_18_NOOPEN_Enter()
	SetPlot( OwnerID() , "Collision" , "Az_18_NOOPEN_enter" , 1 )
end
function Az_18_NOOPEN_enter()
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_17NOOPEN]" , 0 )
end
function zone_18_134_135_Enter()
	SetPlot( OwnerID() , "Collision" , "Az_18_134_135_Enter" , 1 )
end
function Az_18_134_135_Enter()
	local PlayerLV = 0
	local PlayerSUBLV = 0
	local y=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	if GetPartyID( OwnerID() , -1 ) == 0 then		-----判斷有沒有隊伍
		if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then
			if ChangeZone( OwnerID() , 135 , -1 , 1373,892,-2800,270) then ---飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
				DesignLog( OwnerID() , 135 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then
			if ChangeZone( OwnerID() , 134 , -1 , 1373,892,-2800,270) then ---飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
				DesignLog( OwnerID() , 134 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		--elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 2 then ------------讀取個人的困難度選擇
		--	if ChangeZone( OwnerID() ,  , -1 , 1855 , 495.5 , 1889.5 , 350 ) then ---飛進去副本的座標
		--		PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
		--		PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
		--		DesignLog( OwnerID() ,  , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
		--	else
		---		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		---	end
		end	
	elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
		if PartyInstanceLv( OwnerID() ) == 0 then
			if ChangeZone( OwnerID() , 135 , -1 , 1373,892,-2800,270) then ---飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
				DesignLog( OwnerID() , 135 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
		elseif PartyInstanceLv( OwnerID() ) == 1 then
			if ChangeZone( OwnerID() , 134 , -1 , 1373,892,-2800,270) then ---飛進去副本的座標
				PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
				PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
				DesignLog( OwnerID() , 134 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
			else
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
			end
	--	elseif PartyInstanceLv( OwnerID() ) == 2 then-------------讀取隊伍的困難度選擇
		--	if ChangeZone( OwnerID() ,  , -1 , 1855 , 495.5 , 1889.5 , 350 ) then ---飛進去副本的座標
		--		PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
		--		PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
		--		DesignLog( OwnerID() ,  , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
		--	else
		--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		--	end
		end	
	end	
end

function zone_18_134_135_Out()
	SetPlot( OwnerID() , "Collision" , "Az_18_134_135_Out" , 1 )
end
function Az_18_134_135_Out()
	if ChangeZone( OwnerID(),18,0,2920,160,48700,90) then ---出副本後的座標點

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end