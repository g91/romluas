function ic_zone22_down_door()---傳送門用
SetPlot( OwnerID(),"collision","ic_zone22_down",30 ) 
end
function ic_zone22_up_door()---傳送門用
SetPlot( OwnerID(),"collision","ic_zone22_up",30 ) 
end
function ic_zone22_down()
ChangeZone( OwnerID(), 22,0,-18676,725,-17772,343 )
end
function ic_zone22_up()
ChangeZone( OwnerID(), 22,0,-18770,996,-18034,121 )
end