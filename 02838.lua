function ZONE_25_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_25_BOSS_IN_2" , 1 )
end
function ZONE_25_BOSS_IN_2()
	All_ZONE_BOSS_IN123(152,151,153,1691,3142,-1680,260)
end
function ZONE_25_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_25_BOSS_OUT_2",0)
end
function ZONE_25_BOSS_OUT_2()
	if ChangeZone(OwnerID(),25,0,-3037,1125,-2422,90) then			--出副本後的座標點
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end