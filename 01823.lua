function ZONE_33_2_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_33_2_BOSS_IN_2" , 1 )
end

function ZONE_33_2_BOSS_IN_2()--順序=困難,正常,簡單,X,Y,Z,Dir
	All_ZONE_BOSS_IN123(175,176,177,2741,3500,-614,275)
end

function ZONE_33_2_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_33_2_BOSS_OUT_2",0)
end

function ZONE_33_2_BOSS_OUT_2()--出副本後的座標點
	if ChangeZone(OwnerID(),33,0,-6223,455,-4040,310) then	--ZONE,層,X,Y,Z,Dir
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end

-----------------------------------------------------------------------------------------------------------------------
--從南嶺神殿地下密道傳送至地面上
function Lua_Z33_YoYo_123207()	--攀爬位置
	local Teleport = OwnerID()
	AddBuff( OwnerID() , 625204, 0, -1 )
	SetPlot( OwnerID() , "range" , "Lua_Z33_YoYo_123207_Teleport" , 30 )  	
end
function Lua_Z33_YoYo_123207_Teleport()
	local Player = OwnerID()
	local Teleport = TargetID()	--攀爬位置
	SetPosByFlag( Player , 781474 , 0 )
end