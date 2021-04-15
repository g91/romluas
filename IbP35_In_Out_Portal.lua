function ZONE_35_BOSS_IN_1()
SetPlot( OwnerID() , "Collision" , "ZONE_35_BOSS_IN_2" , 1 )
end

function ZONE_35_BOSS_IN_2()
All_ZONE_BOSS_IN123(181,182,183,5365,31,5823,270)
end

function ZONE_35_BOSS_OUT_1()
SetPlot( OwnerID(),"Collision","ZONE_35_BOSS_OUT_2",0)
end

function ZONE_35_BOSS_OUT_2()
if ChangeZone(OwnerID(),35,0,-4490,543,4273,210) then
else
ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
end
end 