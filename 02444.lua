function ZONE21_BOSS_IN()
	SetPlot( OwnerID() , "Collision" , "ZONE21_BOSS_IN_1" , 1 )
end
function ZONE21_BOSS_IN_1()
	All_ZONE_BOSS_IN123(141,142,143,-1511,1141,-1647,270)
end
function ZONE21_BOSS_OUT()
	SetPlot( OwnerID() , "Collision" , "ZONE21_BOSS_OUT_1" , 0 )
end
function ZONE21_BOSS_OUT_1()
	if ChangeZone( OwnerID() , 15 , 0 , -3292 , -798 , 14174 , 270 ) then			--出副本後的座標點

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end