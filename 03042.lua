
function ZONE_27_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_27_BOSS_IN_2" , 1 )
end

function ZONE_27_BOSS_IN_2()--����=�x��,���`,²��
	All_ZONE_BOSS_IN123(157,158,159,448,958,-1733,260)
end

function ZONE_27_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_27_BOSS_OUT_2",0)
end

function ZONE_27_BOSS_OUT_2()
	if ChangeZone(OwnerID(),27,0,-7813,53,6364,180) then			--�X�ƥ��᪺�y���I
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end