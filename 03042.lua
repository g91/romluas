
function ZONE_27_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_27_BOSS_IN_2" , 1 )
end

function ZONE_27_BOSS_IN_2()--順序=困難,正常,簡單
	All_ZONE_BOSS_IN123(157,158,159,448,958,-1733,260)
end

function ZONE_27_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_27_BOSS_OUT_2",0)
end

function ZONE_27_BOSS_OUT_2()
	if ChangeZone(OwnerID(),27,0,-7813,53,6364,180) then			--出副本後的座標點
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end