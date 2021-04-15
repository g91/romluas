
function LuaS_Zone7to115_0()
	SetPlot(OwnerID(),"range","LuaS_Zone7to115_1",50)
end

function LuaS_Zone7to115_1()
	if	CheckFlag(OwnerID(),542696)	then
		local PlayerLV = 0
		local PlayerSUBLV = 0
		if GetPartyID( OwnerID() , -1 ) == 0 then		-----判斷有沒有隊伍
			if ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 0 then
				if ChangeZone( OwnerID(), 126 , -1 , 2346 , 663 , 3338  , 25 ) then ---飛進去副本的座標
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( OwnerID() , 126 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			elseif ReadRoleValue( OwnerID() , EM_RoleValue_ClinetSetting ) == 1 then
				if ChangeZone( OwnerID(), 115 , -1 , 2346 , 663 , 3338  , 25 ) then ---飛進去副本的座標
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( OwnerID() , 115 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end	
		elseif GetPartyID( OwnerID() , -1 ) ~= 0 then
			if PartyInstanceLv( OwnerID() ) == 0 then
				if ChangeZone( OwnerID(), 126 , -1 , 2346 , 663 , 3338  , 25 ) then ---飛進去副本的座標
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( OwnerID() , 126 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			elseif PartyInstanceLv( OwnerID() ) == 1 then
				if ChangeZone( OwnerID(), 115 , -1 , 2346 , 663 , 3338  , 25 ) then ---飛進去副本的座標
					PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- 取得玩家等級
					PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- 取得玩家副職等級
					DesignLog( OwnerID() , 115 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- 紀錄進入人次	
				else
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
				end
			end	
		end			
	else
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_ZONE7TO115_0]",0 );
	end
end

function LuaS_Zone7to115_2()
	SetPlot(OwnerID(),"range","LuaS_Zone7to115_3",100)
end

function LuaS_Zone7to115_3()
	if	not	CheckBuff(OwnerID(),503499)	then
		AddBuff(OwnerID(),503499,1,-1)
	end
end

function LuaS_115toZone7_0()
	SetPlot(OwnerID(),"range","LuaS_115toZone7_1",50)
end

function LuaS_115toZone7_1()
	ChangeZone( OwnerID(), 7 , 0 , 24932 ,-30  , 19051 , 210 );
end