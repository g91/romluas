function ZONE_33_1_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_33_1_BOSS_IN_2" , 1 )
end

function ZONE_33_1_BOSS_IN_2()--����=�x��,���`,²��,X,Y,Z,Dir
	All_ZONE_BOSS_IN123(172,173,174,-1124,3188,-1731,0)
end

function ZONE_33_1_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_33_1_BOSS_OUT_2",0)
end

function ZONE_33_1_BOSS_OUT_2()--�X�ƥ��᪺�y���I
	if ChangeZone(OwnerID(),33,0,-11474,996,4486,310) then	--ZONE,�h,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end


