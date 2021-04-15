function LuaI_B2Door_Zone2A_0()
	SetPlot( OwnerID() , "touch" , "LuaI_B2Door_Zone2A_1" , 40 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaI_B2Door_Zone2A_1()
	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_PID, 100 )
		BeginPlot( targetID() , "LuaI_B2Door_Zone2A_2" , 0 )
	end
end

function LuaI_B2Door_Zone2A_2()
	local Door = LuaFunc_SearchNPCbyOrgID( OwnerID(), 110477 , 350 )
	local Switch = LuaFunc_SearchNPCbyOrgID( OwnerID(), 110480 , 350 )
	WriteRoleValue( Switch , EM_RoleValue_PID , 100 )
	BeginPlot( Door , "LuaI_B2Door_Zone2A_DoorOpen" , 0 )
	BeginPlot( Switch , "LuaI_B2Door_Zone2A_DoorOpen" , 0 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	sleep( 300 )
	BeginPlot( Door , "LuaI_B2Door_Zone2A_DoorClose" , 0 )
	BeginPlot( Switch , "LuaI_B2Door_Zone2A_DoorClose" , 0 )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END )
	sleep(40)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	WriteRoleValue( Switch , EM_RoleValue_PID , 0 )		
end

function LuaI_B2Door_Zone2A_3()
	SetPlot( OwnerID() , "touch" , "LuaI_B2Door_Zone2A_4" , 40 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaI_B2Door_Zone2A_4()
	if ReadRoleValue(TargetID() , EM_RoleValue_PID ) == 0 then
		WriteRoleValue(TargetID() , EM_RoleValue_PID , 100 )
		BeginPlot( targetID() , "LuaI_B2Door_Zone2A_5" , 0 )
	end
end

function LuaI_B2Door_Zone2A_5()	
	local Door = LuaFunc_SearchNPCbyOrgID( OwnerID(), 110477 , 350 )
	local Switch = LuaFunc_SearchNPCbyOrgID( OwnerID(), 110479 , 350 )
	WriteRoleValue( Switch , EM_RoleValue_PID, 100 )
	BeginPlot( Door , "LuaI_B2Door_Zone2A_DoorOpen" , 0 )
	BeginPlot( Switch , "LuaI_B2Door_Zone2A_DoorOpen" , 0 )
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	sleep( 300 )
	BeginPlot( Door , "LuaI_B2Door_Zone2A_DoorClose" , 0 )
	BeginPlot( Switch , "LuaI_B2Door_Zone2A_DoorClose" , 0 )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END )
	sleep(40)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	WriteRoleValue( Switch , EM_RoleValue_PID, 0 )		
end

function LuaI_B2Door_Zone2A_DoorOpen()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	sleep(40)
end

function LuaI_B2Door_Zone2A_DoorClose()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END )
	sleep(40)
end

function LuaI_B2Door_Zone2A_6()
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
end