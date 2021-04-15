function ZONE_23_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_23_BOSS_IN_2" , 1 )
end
function ZONE_23_BOSS_IN_2()
	All_ZONE_BOSS_IN123(146,147,148,-1424,1093,-862,83)
end
function ZONE_23_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_23_BOSS_OUT_2",0)
end
function ZONE_23_BOSS_OUT_2()
	if ChangeZone(OwnerID(),23,0,-4097,829,-21462,306) then			--出副本後的座標點
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end