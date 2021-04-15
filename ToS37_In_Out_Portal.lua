function ZONE_37_BOSS_IN_1()
SetPlot( OwnerID() , "Collision" , "ZONE_37_BOSS_IN_2" , 1 )
end

function ZONE_37_BOSS_IN_2()
All_ZONE_BOSS_IN123(187,188,189,-678,426,582,270)
end

function ZONE_37_BOSS_OUT_1()
SetPlot( OwnerID(),"Collision","ZONE_37_BOSS_OUT_2",0)
end

function ZONE_37_BOSS_OUT_2()
if ChangeZone(OwnerID(),37,0,1870,274,1885,150) then
else
ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
end
end 