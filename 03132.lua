
function ZONE_30_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_30_BOSS_IN_2" , 1 )
end

function ZONE_30_BOSS_IN_2()--順序=困難,正常,簡單,X,Y,Z,Dir
	All_ZONE_BOSS_IN123(166,167,168,1825,3104,-2526,265)
end

function ZONE_30_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_30_BOSS_OUT_2",0)
end

function ZONE_30_BOSS_OUT_2()--出副本後的座標點
	if ChangeZone(OwnerID(),30,0,22351,196,44273,150) then	--ZONE,層,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end