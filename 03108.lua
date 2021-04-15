

function KJ_ParasiteTest()
	local _ownerID = OwnerID();
	local _RoomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local x , y , z , dir = DW_Location( _ownerID );

	local _host_AvatarID = 108131;
	local _parasite_AvatarID = 108430;

	local _currentTargetID = CreateObj( _host_AvatarID , x , y , z , dir , 1 );--host
	WriteRoleValue( _currentTargetID , EM_RoleValue_LiveTime , 5 );
	SetModeEx( _currentTargetID , EM_SetModeType_Show , true );
	SetModeEx( _currentTargetID , EM_SetModeType_Mark , true );
	SetModeEx( _currentTargetID , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( _currentTargetID , EM_SetModeType_Fight , true );
	SetModeEx( _currentTargetID , EM_SetModeType_Move , true );
	--SetModeEx( _currentTargetID , EM_SetModeType_Revive , true );
	SetModeEx( _currentTargetID , EM_SetModeType_Searchenemy , true );

	AddToPartition( _currentTargetID , _RoomID );
	
	local function Wiggle( _InputRandRange , _InputOffset )
		local function Closure()
			return DW_Rand( _InputRandRange ) + _InputOffset;
		end
		return Closure;
	end

	local _addParisiteOnBoss = AssignParasiteHost( _currentTargetID );
	local _PosWiggle = Wiggle( 60 , -30 );
	for i = 1 , 5 , 1 do--parasites
			_currentTargetID = CreateObj( _parasite_AvatarID , x + _PosWiggle() , y , z + _PosWiggle() , dir , 1 );
			SetModeEx( _currentTargetID , EM_SetModeType_Show , true );
			SetModeEx( _currentTargetID , EM_SetModeType_Mark , true );
			SetModeEx( _currentTargetID , EM_SetModeType_ShowRoleHead , true );
			SetModeEx( _currentTargetID , EM_SetModeType_Fight , true );
			SetModeEx( _currentTargetID , EM_SetModeType_Move , true );
			--SetModeEx( _currentTargetID , EM_SetModeType_Revive , true );
			SetModeEx( _currentTargetID , EM_SetModeType_Searchenemy , true );

			WriteRoleValue( _currentTargetID , EM_RoleValue_LiveTime , 15 );
			AddToPartition( _currentTargetID , _RoomID );
			DebugMsg( 0 , 0 , "Create parasites".._currentTargetID );
			_addParisiteOnBoss( _currentTargetID );
	end
	
end
