function ZONE_33_2_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_33_2_BOSS_IN_2" , 1 )
end

function ZONE_33_2_BOSS_IN_2()--����=�x��,���`,²��,X,Y,Z,Dir
	All_ZONE_BOSS_IN123(175,176,177,2741,3500,-614,275)
end

function ZONE_33_2_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_33_2_BOSS_OUT_2",0)
end

function ZONE_33_2_BOSS_OUT_2()--�X�ƥ��᪺�y���I
	if ChangeZone(OwnerID(),33,0,-6223,455,-4040,310) then	--ZONE,�h,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end

-----------------------------------------------------------------------------------------------------------------------
--�q�n�������a�U�K�D�ǰe�ܦa���W
function Lua_Z33_YoYo_123207()	--�k����m
	local Teleport = OwnerID()
	AddBuff( OwnerID() , 625204, 0, -1 )
	SetPlot( OwnerID() , "range" , "Lua_Z33_YoYo_123207_Teleport" , 30 )  	
end
function Lua_Z33_YoYo_123207_Teleport()
	local Player = OwnerID()
	local Teleport = TargetID()	--�k����m
	SetPosByFlag( Player , 781474 , 0 )
end