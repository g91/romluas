function ZONE22_BOSS_IN()   
	SetPlot( OwnerID() , "Collision" , "ZONE22_BOSS_IN_1" , 1 )
end
function ZONE22_BOSS_IN_1()
	All_ZONE_BOSS_IN12(144,145,-960,2610,1466,265)
end
function ZONE22_BOSS_OUT()
	SetPlot( OwnerID() , "Collision" , "ZONE22_BOSS_OUT_1" , 0 )
end
function ZONE22_BOSS_OUT_1()
	if ChangeZone( OwnerID(), 22,0,-18298,749,-17511,146) then			--出副本後的座標點
		
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end