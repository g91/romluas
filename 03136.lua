
function ZONE_32_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_32_BOSS_IN_2" , 1 )
end

function ZONE_32_BOSS_IN_2()--順序=困難,正常,簡單,X,Y,Z,Dir
	All_ZONE_BOSS_IN123(169,170,171,1402,1576,-728,290)
end

function ZONE_32_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_32_BOSS_OUT_2",0)
end

function ZONE_32_BOSS_OUT_2()--出副本後的座標點
	if ChangeZone(OwnerID(),32,0,-9832,36,-9115,35) then	--ZONE,層,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end