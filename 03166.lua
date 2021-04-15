function ZONE_196_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_196_BOSS_OUT_2",0)
end

function ZONE_196_BOSS_OUT_2()--出副本後的座標點
	if ChangeZone(OwnerID(),81,0,-1005,5,993,230) then	--ZONE,層,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end

function ZONE_197_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_197_BOSS_OUT_2",0)
end

function ZONE_197_BOSS_OUT_2()--出副本後的座標點
	if ChangeZone(OwnerID(),81,0,1008,1,1015,320) then	--ZONE,層,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end

function ZONE_198_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_198_BOSS_OUT_2",0)
end

function ZONE_198_BOSS_OUT_2()--出副本後的座標點
	if ChangeZone(OwnerID(),81,0,-1021,1,-1011,140) then	--ZONE,層,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end

function ZONE_199_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_199_BOSS_OUT_2",0)
end

function ZONE_199_BOSS_OUT_2()--出副本後的座標點
	if ChangeZone(OwnerID(),81,0,1006,22,-1026,45) then	--ZONE,層,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end