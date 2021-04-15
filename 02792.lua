function ZONE_24_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_24_BOSS_IN_2" , 1 )
end
function ZONE_24_BOSS_IN_2()
	All_ZONE_BOSS_IN12(149,150,-96,3164,-471,180)
end
function ZONE_24_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_24_BOSS_OUT_2",0)
end
function ZONE_24_BOSS_OUT_2()
	if ChangeZone(OwnerID(),24,0,6032,974,-7521,180) then			--出副本後的座標點
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end