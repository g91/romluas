function Sys_AddGuildResource( )
	AddGuildResource( OwnerID() , 10000000 , 100000 , 100000 , 100000  ,100000 ,100000 ,100000  ,"" )
end

--建立房子
function Sys_BuildGuildHouse( )
	local Ret = BuildGuildHouse( OwnerID()  );
	if( Ret == false ) then
		Tell( OwnerID() , TargetID() , "build guild house error" );
	end
end


function Sys_GuildHouseVisit_Auto()
	SetPlot( OwnerID() , "Touch" , "Sys_GuildHouseVisit_Open" , 50 );
end

function Sys_GuildHouseVisit_Open()
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_Z )

	local Obj = Role:new( OwnerID() );

--	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , X , Y , Z , Obj:Dir() );
	if( Ret == false ) then
		Tell( OwnerID() , TargetID() , " Save Return position error" );
		return;
	end
	OpenVisitGuildHouse( false );--開啟參觀介面
end

function Sys_MyGuildHouse_Open()
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_CliOk_Z )

	local Obj = Role:new( OwnerID() );

--	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
	local Ret = SaveReturnPos( OwnerID() , Obj:ZoneID() , X , Y , Z , Obj:Dir() );
	if( Ret == false ) then
		Tell( OwnerID() , TargetID() , "Save Return position error" );
		return;
	end
	OpenVisitGuildHouse( true ); --回自己房屋
end