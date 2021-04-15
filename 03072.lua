
function LuaI_PantheonKey()
	SetPlot( OwnerID() , "Range" , "Enter_Pantheon" , 65);
end

function Enter_Pantheon()

		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_CLOISTER_1") , 0 )

			if PlayerLV <= 25 then
			AddBuff( OwnerID() ,502039,1 ,1200);
			end
		sleep(10)
		if ChangeZone( OwnerID() , 254, -1, -5555, 2451, 1766, 268) then

			DesignLog(OwnerID(), 254, "last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
		end

end

function LuaI_PantheonHomeKey()
	SetPlot( OwnerID() , "Range" , "Enter_PantheonHome" , 65);
end

function Enter_PantheonHome()

		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_CLOISTER_1") , 0 )

			if PlayerLV <= 25 then
			AddBuff( OwnerID() ,502039,1 ,1200);
			end
		sleep(10)
		if ChangeZone( OwnerID() , 38, -1, 6416, 204, 2395, 38) then

			DesignLog(OwnerID(), 38, "last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
		end

end

function ZONE_34_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_34_BOSS_IN_2" , 1 )
end

function ZONE_34_BOSS_IN_2()
	All_ZONE_BOSS_IN123(178,179,180,683,-3.6,762.4,270)
end

function ZONE_34_BOSS_OUT_1()
	SetPlot( OwnerID(),"Collision","ZONE_34_BOSS_OUT_2",0)
end
	
function ZONE_34_BOSS_OUT_2()
	if ChangeZone(OwnerID(),34,0,-2225,392,2747,210) then
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARNING_ZONE_NOT_OPEN]",0)
	end
end

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
	if ChangeZone(OwnerID(),37,0,1870,274,1885,160) then
	else
		ScriptMessage(OwnerID(),OwnerID(),0,"[WARRING_ZONE_NOT_OPEN]",0)
	end
end

function ZONE_38_BOSS_IN_1()
	SetPlot( OwnerID() , "Collision" , "ZONE_38_BOSS_IN_2" , 1 )
end

function ZONE_38_BOSS_IN_2()
	All_ZONE_BOSS_IN123(254,255,256,-5560,2451,1715,270)
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