function LuaI_Zone109( RoomID )
	SetZoneReviveScript( "LuaZone_DG109_Revive" );
end
function LuaZone_DG109_Revive()
	
	-- 區域重生劇情
	local 	Obj	= Role:new( OwnerID() );
	local	X	= 0;
	local	Y	= 0;
	local	Z	= 0;
	local	Dir	= 0;
	local 	Zone	= 0;

	if Obj:X() > 817 and Obj:X() < 1817 and Obj:Z() > 720 and Obj:Z() < 1720 then	
		X 	= 3367
		Y	= 356;
		Z 	= 1830;
		Dir	= 90
		Zone	= 206
	else		
		X 	= 4822
		Y	= 339
		Z 	= 1467
		Dir	= 85
		Zone	= 207
	end

	WriteRoleValue( OwnerID(), EM_RoleValue_X, X );
	WriteRoleValue( OwnerID(), EM_RoleValue_Y, Y );
	WriteRoleValue( OwnerID(), EM_RoleValue_Z, Z );
	WriteRoleValue( OwnerID(), EM_RoleValue_Dir, Dir );
	WriteRoleValue( OwnerID(), EM_RoleValue_ZoneID, Zone );

end