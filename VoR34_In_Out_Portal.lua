function ZONE_34_BOSS_IN_1()
SetPlot( OwnerID() , "Collision" , "ZONE_34_BOSS_IN_2" , 1 )
end

function ZONE_34_BOSS_IN_2()
All_ZONE_BOSS_IN123(178,179,180,670,-2,730,270)
end

function ZONE_34_BOSS_OUT_1()
SetPlot( OwnerID(),"Collision","ZONE_34_BOSS_OUT_2",0)
end

function ZONE_34_BOSS_OUT_2()
if ChangeZone(OwnerID(),34,0,-2200,391,2684,210) then
else
ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
end
end 