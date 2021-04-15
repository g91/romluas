function ZONE_26_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_26_BOSS_IN_2" , 1 )
end
function ZONE_26_BOSS_IN_2()
	All_ZONE_BOSS_IN123(154,155,156,894,1811,-2332,0)
end
function ZONE_26_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_26_BOSS_OUT_2",0)
end
function ZONE_26_BOSS_OUT_2()
	if ChangeZone(OwnerID(),26,0,-18340,255,-13818,250) then			--出副本後的座標點
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end