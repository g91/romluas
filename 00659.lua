function LuaI_Rog_Windmill_0()
	SetPlot( OwnerID() , "Range" , "LuaI_Rog_Windmill_in" , 20 )
end
function LuaI_Rog_Windmill_MSG()
	while 1 do
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		
		if GetSystime(1) == 11 and  GetSystime(2) == 30 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("SAY_WINDMILL_1") ) 
			end
		end 
		if GetSystime(1) == 11 and  GetSystime(2) == 50 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("SAY_WINDMILL_2") ) 
			end
		end 
		if GetSystime(1) == 11 and  GetSystime(2) == 55 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("SAY_WINDMILL_3") ) 
			end
		end 
		if GetSystime(1) == 12 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("SAY_WINDMILL_4") ) 
			end
		end 

		if GetSystime(1) == 17 and  GetSystime(2) == 30 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("SAY_WINDMILL_1") ) 
			end
		end 
		if GetSystime(1) == 17 and  GetSystime(2) == 50 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("SAY_WINDMILL_2") ) 
			end
		end 
		if GetSystime(1) == 17 and  GetSystime(2) == 55 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("SAY_WINDMILL_3") ) 
			end
		end 
		if GetSystime(1) == 18 and  GetSystime(2) == 0 then
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString("SAY_WINDMILL_4") ) 
			end
		end 
		
		sleep( 300 )

	end
end

function LuaI_Rog_Windmill_in()
	local TimeCheck = "CLOSE"

	if GetSystime(1) >= 12 and GetSystime(1) <= 13 then
		 TimeCheck = "OPEN"
	elseif GetSystime(1) >= 18 and GetSystime(1) <= 19 then
		 TimeCheck = "OPEN"
	end

	if CountBodyItem( OwnerID() , 530060 ) > 0 then
		if TimeCheck == "OPEN" then 
			local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
			local Key

			ScriptMessage(OwnerID(), OwnerID() , 1 , GetString("SAY_MYSTERYLAND_2") , C_SYSTEM )	-- 你被神秘的光芒吸了進去。

			Key = CountBodyItem( OwnerID() , 201929 )
			DelBodyItem( OwnerID() , 201929 , Key )

			if Rand(2) == 0 then 
				if ChangeZone( OwnerID(), 250 , 0, 2425, 16, 256, Dir) then
					local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
					local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
					DesignLog(OwnerID(),105,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
				end
			else
				if ChangeZone( OwnerID(), 250 , 0, 2627, 16, 268, Dir) then
					local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
					local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
					DesignLog(OwnerID(),105,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
				end
			end
		else
			ScriptMessage(OwnerID(), OwnerID() , 1 , GetString("SAY_WINDMILL_0") , C_SYSTEM ) 
		end
	else
			ScriptMessage(OwnerID(), OwnerID() , 1 , GetString("SAY_MYSTERYLAND_3") , 0)	-- 你被神秘的光芒吸了進去。
	end
end

function LuaI_Rog_Windmill_1()
	SetPlot( OwnerID() , "Range" , "LuaI_Rog_Windmill_out" , 20 )
end

function LuaI_Rog_Windmill_out()
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local Key

	Key = CountBodyItem( OwnerID() , 201929 )
	DelBodyItem( OwnerID() , 201929 , Key )

	ChangeZone( OwnerID(), 1 , 0, -1284, 61, -5613, Dir)
end

function LuaI_Rog_Windmill_kickout()
	while 1 do

		if GetSystime(1) == 14 or GetSystime(1) == 20 then
			local Obj;
			local Count = SetSearchAllPlayer(0)
			if count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsPlayer() == True then
						BeginPlot(  ID , "LuaI_Rog_Windmill_out" , 0 )
					end
				end	
			end
		end 
		
		sleep( 300 )
	end
end