function LuaS_101456_0()--in
	SetPlot( OwnerID() , "Range" , "LuaS_101456_1" ,  10 )
end

function LuaS_101456_1()
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
	local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
	if PlayerLV <= 10 then
--			AddBuff( OwnerID() ,502040,1 ,1200);							--加入計時
	end
	sleep(10)
	if ChangeZone( OwnerID() , 110 , -1 , 1765 , 250 , 1371 , 240 ) then

--		DesignLog(OwnerID(),110,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end


function LuaS_101456_2()--out
	SetPlot( OwnerID() , "Range" , "LuaS_101456_3" ,  80 )
--	SetPlot( OwnerID() , "collision" , "LuaS_101456_3" ,  30 )
end


function LuaS_101456_3()
--	Say(OwnerID() , "!" )
	ChangeZone( OwnerID() , 1 , 0 , -4645 , 41  , -2966  , 240 ) 
end