function ZONE_38_BOSS_IN_1()
SetPlot( OwnerID() , "Collision" , "ZONE_38_BOSS_IN_2" , 1 )
end

function ZONE_38_BOSS_IN_2()
All_ZONE_BOSS_IN123(254,255,256,-5560,2451,1715,270)
end

function ZONE_38_BOSS_OUT_1()
SetPlot( OwnerID(),"Collision","ZONE_38_BOSS_OUT_2",0)
end

function ZONE_38_BOSS_OUT_2()
if ChangeZone(OwnerID(),38,0,5457,227,2364,210) then
else
ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
end
end 