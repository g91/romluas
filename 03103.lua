
function ZONE_28_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_28_BOSS_IN_2" , 1 )
end

function ZONE_28_BOSS_IN_2()--����=�x��,���`,²��,X,Y,Z,Dir
	All_ZONE_BOSS_IN123(160,161,162,637,3537,-884,310)
end

function ZONE_28_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_28_BOSS_OUT_2",0)
end

function ZONE_28_BOSS_OUT_2()--�X�ƥ��᪺�y���I
	if ChangeZone(OwnerID(),28,0,1407,810,21157,180) then	--ZONE,�h,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end