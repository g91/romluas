
function ZONE_29_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_29_BOSS_IN_2" , 1 )
end

function ZONE_29_BOSS_IN_2()--順序=困難,正常,簡單,X,Y,Z,Dir
	All_ZONE_BOSS_IN123(163,164,165,-172,784,276,265)
end

function ZONE_29_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_29_BOSS_OUT_2",0)
end

function ZONE_29_BOSS_OUT_2()--出副本後的座標點
	if ChangeZone(OwnerID(),29,0,15177,-3,21971,280) then	--ZONE,層,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end