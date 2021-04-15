-- Entity Chamber
function ZONE_257_BOSS_IN_1()
		SetPlot( OwnerID() , "Collision" , "ZONE_257_BOSS_IN_2" , 1 )
end

function ZONE_257_BOSS_IN_2()
		All_ZONE_BOSS_IN123(257,257,257,-500,1069,1209,270)
end

function ZONE_257_BOSS_OUT_1()
		SetPlot( OwnerID(),"Collision","ZONE_257_BOSS_OUT_2",0)
end

function ZONE_257_BOSS_OUT_2()
	if ChangeZone(OwnerID(),38,0,3948,-138,-3145,210) then
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end 

-- IBP 35
function ZONE_35_BOSS_IN_1()
		SetPlot( OwnerID() , "Collision" , "ZONE_35_BOSS_IN_2" , 1 )
end

function ZONE_35_BOSS_IN_2()
		All_ZONE_BOSS_IN123(181,182,183,5365,31,5823,143)
end

function ZONE_35_BOSS_OUT_1()
		SetPlot( OwnerID(),"Collision","ZONE_35_BOSS_OUT_2",0)
end

function ZONE_35_BOSS_OUT_2()
	if ChangeZone(OwnerID(),35,0,-4490,543,4273,338) then
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end 

-- Enoh
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

-- New Pantheon 38
function ZONE_38_BOSS_IN_1()
		SetPlot( OwnerID() , "Collision" , "ZONE_38_BOSS_IN_2" , 1 )
end

function ZONE_38_BOSS_IN_2()
		All_ZONE_BOSS_IN123(254,255,256,-5560,2451,1715,267)
end

function ZONE_38_BOSS_OUT_1()
		SetPlot( OwnerID(),"Collision","ZONE_38_BOSS_OUT_2",0)
end

function ZONE_38_BOSS_OUT_2()
	if ChangeZone(OwnerID(),38,0,5457,227,2364,210) then
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end 

-- Sun Temple 36
function ZONE_36_BOSS_IN_1()
		SetPlot( OwnerID() , "Collision" , "ZONE_36_BOSS_IN_2" , 1 )
end

function ZONE_36_BOSS_IN_2()
		All_ZONE_BOSS_IN123(184,185,186,-146,569,-3460,255)
end

function ZONE_36_BOSS_OUT_1()
		SetPlot( OwnerID(),"Collision","ZONE_36_BOSS_OUT_2",0)
end

function ZONE_36_BOSS_OUT_2()
	if ChangeZone(OwnerID(),36,0,-885,331,-2780,210) then
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end 

-- Tp from Tasuq
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

-- Tp from Enoch
function ZONE_36A_BOSS_IN_1()
		SetPlot( OwnerID() , "Collision" , "ZONE_36A_BOSS_IN_2" , 1 )
end

function ZONE_36A_BOSS_IN_2()
		All_ZONE_BOSS_IN123(36,36,36,1572,537,4455,270)
end

function ZONE_36A_BOSS_OUT_1()
		SetPlot( OwnerID(),"Collision","ZONE_36A_BOSS_OUT_2",0)
end

function ZONE_36A_BOSS_OUT_2()
	if ChangeZone(OwnerID(),34,0,-4044,529,-2933,210) then
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end 

-- Tp from Korris
function ZONE_35A_BOSS_IN_1()
		SetPlot( OwnerID() , "Collision" , "ZONE_35A_BOSS_IN_2" , 1 )
end

function ZONE_35A_BOSS_IN_2()
		All_ZONE_BOSS_IN123(35,35,35,-2240,-29,-860,270)
end

function ZONE_35A_BOSS_OUT_1()
		SetPlot( OwnerID(),"Collision","ZONE_35A_BOSS_OUT_2",0)
end

function ZONE_35A_BOSS_OUT_2()
	if ChangeZone(OwnerID(),34,0,-4044,529,-2933,210) then
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end 

-- Tomb of Souls 37
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

-- Tp from Vortis
function ZONE_37A_BOSS_IN_1()
		SetPlot( OwnerID() , "Collision" , "ZONE_37A_BOSS_IN_2" , 1 )
end

function ZONE_37A_BOSS_IN_2()
		All_ZONE_BOSS_IN123(37,37,37,-123,357,-3556,270)
end

function ZONE_37A_BOSS_OUT_1()
		SetPlot( OwnerID(),"Collision","ZONE_37A_BOSS_OUT_2",0)
end

function ZONE_37A_BOSS_OUT_2()
	if ChangeZone(OwnerID(),34,0,-4044,529,-2933,210) then
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end 

-- Vale of Rites 34 
function ZONE_34_BOSS_IN_1()
		SetPlot( OwnerID() , "Collision" , "ZONE_34_BOSS_IN_2" , 1 )
end

function ZONE_34_BOSS_IN_2()
		All_ZONE_BOSS_IN123(178,179,180,670,-2,730,270)
end

function ZONE_34_BOSS_OUT_1()
		SetPlot( OwnerID(),"Collision","ZONE_34_BOSS_OUT_2",0)
end

function ZONE_34_BOSS_OUT_2()
	if ChangeZone(OwnerID(),34,0,-2200,391,2684,210) then
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end 

-- To Morlands of Farsitan

function ZONE_33A_BOSS_IN_1()
		SetPlot( OwnerID() , "Collision" , "ZONE_34_BOSS_IN_2" , 1 )
end

function ZONE_33A_BOSS_IN_2()
		All_ZONE_BOSS_IN123(33,33,33,-4452,1027,6545,270)
end

function ZONE_33A_BOSS_OUT_1()
		SetPlot( OwnerID(),"Collision","ZONE_34_BOSS_OUT_2",0)
end

function ZONE_33A_BOSS_OUT_2()
	if ChangeZone(OwnerID(),34,0,-4044,529,-2933,210) then
		else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end 

--  