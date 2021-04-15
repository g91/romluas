function ZONE_257_BOSS_IN_1()
SetPlot( OwnerID() , "Collision" , "ZONE_257_BOSS_IN_2" , 1 )
end

function ZONE_257_BOSS_IN_2()
All_ZONE_BOSS_IN123(257,257,257,-500,1069,1209,270)
end

function ZONE_257_BOSS_OUT_1()
SetPlot( OwnerID(),"Collision","ZONE_257_BOSS_OUT_2",0)
end

function ZONE_257_BOSS_OUT_2()
if ChangeZone(OwnerID(),38,0,3948,-138,-3145,210) then
else
ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
end
end 