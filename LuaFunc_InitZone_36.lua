function ZONE_36_BOSS_IN_1()
SetPlot( OwnerID() , "Collision" , "ZONE_36_BOSS_IN_2" , 1 )
end

function ZONE_36_BOSS_IN_2()
All_ZONE_BOSS_IN123(184,185,186,-146,570,-3460,270)
end

function ZONE_36_BOSS_OUT_1()
SetPlot( OwnerID(),"Collision","ZONE_36_BOSS_OUT_2",0)
end

function ZONE_36_BOSS_OUT_2()
if ChangeZone(OwnerID(),36,0,-886,330,-2778,210) then
else
ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
end
end 