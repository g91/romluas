
function ZONE_32_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_32_BOSS_IN_2" , 1 )
end

function ZONE_32_BOSS_IN_2()--����=�x��,���`,²��,X,Y,Z,Dir
	All_ZONE_BOSS_IN123(169,170,171,1402,1576,-728,290)
end

function ZONE_32_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_32_BOSS_OUT_2",0)
end

function ZONE_32_BOSS_OUT_2()--�X�ƥ��᪺�y���I
	if ChangeZone(OwnerID(),32,0,-9832,36,-9115,35) then	--ZONE,�h,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end