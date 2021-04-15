function Signs_DC_Start_1()
	DebugMsg(0, 0, "DC_start_1 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	say( OwnerID(), "( Seems no need to turn this starting roadsign... )") ;
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_2()
	DebugMsg(0, 0, "DC_start_2 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	AdjustDir( me , 90);
	if WTG ==3 then
		WTG = 5;	
	elseif WTG == 5 then
		WTG = 1;
		AdjustDir( me , 90);
	elseif WTG == 1 then
		WTG = 3;
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_3()
	DebugMsg(0, 0, "DC_start_3 system functional!");
	local me = TargetID();
	MoveToFlagEnabled( me , false ); 
	AdjustDir( me , 90);
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	if WTG == 6 then
		WTG = 2;
	elseif WTG == 2 then
		WTG = 4;
		AdjustDir( me , 90);
	elseif WTG == 4 then
		WTG = 6;
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_4()
	DebugMsg(0, 0, "DC_start_4 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	AdjustDir( me , 90);
	if WTG == 7 then
		WTG = 3;
	elseif WTG == 3 then
		WTG = 7;
		AdjustDir( me , 180);
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_5()
	DebugMsg(0, 0, "DC_start_5 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	AdjustDir( me , 90); 
	if WTG == 2 then
		WTG = 6;
	elseif WTG == 6 then
		WTG = 10;
	elseif WTG == 10 then
		AdjustDir( me , 90);
		WTG = 2;
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_6()
	DebugMsg(0, 0, "DC_start_6 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	AdjustDir( me , 90);
	if WTG== 3 then
		WTG = 7;
	elseif WTG== 7 then
		WTG = 8;
	elseif WTG== 8 then
		WTG = 5;
	elseif WTG== 5 then
		WTG = 3;
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_7()
	DebugMsg(0, 0, "DC_start_7 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	AdjustDir( me , 90);
	if WTG== 9 then
		WTG = 6;
	elseif WTG== 6 then
		WTG = 4;
	elseif WTG== 4 then
		WTG = 9;
		AdjustDir( me , 90);
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_8()
	DebugMsg(0, 0, "DC_start_8 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	AdjustDir( me , 90);
	if WTG== 11 then
		WTG = 6;
		AdjustDir( me , 90);
	elseif WTG== 6 then
		WTG = 9;
	elseif WTG== 9 then
		WTG = 11;
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_9()
	DebugMsg(0, 0, "DC_start_9 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	AdjustDir( me , 90);
	if WTG == 8 then
		WTG = 7;
	elseif WTG == 7 then
		WTG = 8;
		AdjustDir( me , 180);
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_10()
	DebugMsg(0, 0, "DC_start_10 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	AdjustDir( me , 90);
	if WTG == 5 then
		WTG = 11;
	elseif WTG == 11 then
		WTG = 5;
		AdjustDir( me , 180);
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_11()
	DebugMsg(0, 0, "DC_start_11 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	AdjustDir( me , 90);
	if WTG == 10 then
		WTG = 8;
	elseif WTG == 8 then
		WTG = 12;
		AdjustDir( me , 90);
	elseif WTG == 12 then
		WTG = 10;
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end
function Signs_DC_Start_12()
	DebugMsg(0, 0, "DC_start_12 system functional!");
	local me = TargetID();
	local WTG = ReadRoleValue(me, EM_RoleValue_Register2);
	MoveToFlagEnabled( me , false ); 
	say( OwnerID(), "( Seems no need to turn this exiting roadsign... )") ;
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
end