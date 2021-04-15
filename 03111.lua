--Auther : K.J. Aris
--Version : 13.10.18.14.05

--Z166	Z167	Z168
--Z30 dungen Boss	No.1
--Script	703110

function AI_703111_Init()
	_Z30D_Boss1_VO = {};--value object

	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location( _bossID );
	


end

function AI_703111_Engage()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location( _bossID );


	


	local _ctrlID = CreateObj( 110987 , x , y , z , dir , 1 );
	SetModeEx( ctrl , EM_SetModeType_Show , false );
	SetModeEx( ctrl , EM_SetModeType_Mark , false );
	SetModeEx( ctrl , EM_SetModeType_ShowRoleHead , false );
	AddToPartition( ctrl , room );
	
	BeginPlot( ctrl , "AI_703101_lua_27in_boss1_main" , 0 );






	
end