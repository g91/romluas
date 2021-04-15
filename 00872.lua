function LuaYU_100699_0()
	SetPlot( OwnerID() , "Range" , "LuaYU_100699_1" , 20 )
end

function LuaYU_100699_1()
	if CountBodyItem( OwnerID() , 202982 ) >= 1 or CheckBuff( OwnerID() , 502159 ) == true then

		local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
--		local Key

		ScriptMessage(OwnerID(), OwnerID() , 1 , GetString("SAY_MYSTERYLAND_2") , C_SYSTEM )	-- 你被神秘的光芒吸了進去。

--		Key = CountBodyItem( OwnerID() , 202982 )
--		DelBodyItem( OwnerID() , 202982 , Key )

			if ChangeZone( OwnerID(), 250 , -1 , 2425, 16, 256, Dir) then   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
					local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
					local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
					DesignLog(OwnerID(),250,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
			else
					ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
			end


						
	else
			ScriptMessage(OwnerID(), OwnerID() , 1 , GetString("SAY_MYSTERYLAND_3") , 0)	-- 你需要祕魔石才能進入。
	end
end
