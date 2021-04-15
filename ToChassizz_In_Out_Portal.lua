function ZONE_34A_BOSS_IN_1()
SetPlot( OwnerID() , "Collision" , "ZONE_34A_BOSS_IN_2" , 1 )
end

function ZONE_34A_BOSS_IN_2()
All_ZONE_BOSS_IN123(38,38,38,344,-239,-3955,270)
end

function ZONE_34A_BOSS_OUT_1()
SetPlot( OwnerID(),"Collision","ZONE_34A_BOSS_OUT_2",0)
end

function ZONE_34A_BOSS_OUT_2()
if ChangeZone(OwnerID(),34,0,-4044,529,-2933,210) then
else
ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
end
end 