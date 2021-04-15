local _Z940_703106_Switch = false;
function Z940_703106_mob_test( )
	
	local _ExecutionerID = OwnerID();
	local _RoomID = ReadRoleValue( _ExecutionerID , EM_RoleValue_RoomID );

	local _MaxTime = 30;

	local _CasualMember = 12;
	local _MobA_Number = _CasualMember;
	local _MobB_Number = _CasualMember;

	local _MobA_AvatarID = 108131;
	local _MobB_AvatarID = 108430;
	
	local _MobFlagID = 780685;
	
	local function Wiggle( _InputRandRange , _InputOffset )
		local function Closure()
			return DW_Rand( _InputRandRange ) + _InputOffset;
		end
		return Closure;
	end

	local function CreateMob( _InputAvatarID , _InputFlagID , _InputFlagNum )
		local x , y , z , dir = DW_Location( _InputFlagID , _InputFlagNum );
		local _PosWiggle = Wiggle( 60 , -30 );

		local _MemberList = {}
		local _currentTargetID = 0;
		for i = 1 , _MobA_Number , 1 do
			_currentTargetID = CreateObj( _InputAvatarID , x + _PosWiggle() , y , z + _PosWiggle() , dir , 1 );
			SetModeEx( _currentTargetID , EM_SetModeType_Show , true );
			SetModeEx( _currentTargetID , EM_SetModeType_Mark , true );
			SetModeEx( _currentTargetID , EM_SetModeType_ShowRoleHead , true );
			SetModeEx( _currentTargetID , EM_SetModeType_Fight , true );
			SetModeEx( _currentTargetID , EM_SetModeType_Move , true );
			--SetModeEx( _currentTargetID , EM_SetModeType_Revive , true );
			SetModeEx( _currentTargetID , EM_SetModeType_Searchenemy , true );

			WriteRoleValue( _currentTargetID , EM_RoleValue_LiveTime , _MaxTime + 5 );
			AddToPartition( _currentTargetID , _RoomID );
			table.insert( _MemberList , _currentTargetID );
		end
		DebugMsg( 0 , 0 , _InputAvatarID.." has "..#_MemberList );
		return _MemberList;
	end

	--Mob A
	local _TeamAList = CreateMob( _MobA_AvatarID , _MobFlagID , 0 );

	--Mob B
	local _TeamBList = CreateMob( _MobB_AvatarID , _MobFlagID , 1 );

	ScriptMessage( _ExecutionerID , 0 , 2 , "A mob war is inevitable..."..tostring( #_TeamAList ).." VS "..tostring( #_TeamBList ) , 0 );
	
--	local function Z940_703106_StartMobGame()
--		local _OwnerID = OwnerID();
		--start fight
		local _winnerA = true;
		local _currentTargetID = 0;
		_Z940_703106_Switch = true;

		local _clock = 0;
		--main loop
		while _Z940_703106_Switch == true do
			DebugMsg( 0 , 0 , "Loop is runing !!" );
			DebugMsg( 0 , 0 , "Team A has "..#_TeamAList );
			for i = #_TeamAList , 1 , -1 do
				_currentTargetID = _TeamAList[ i ];
				if( CheckID( _currentTargetID ) == false ) or ( ReadRoleValue( _currentTargetID , EM_RoleValue_IsDead ) == 1  ) then
					table.remove( _TeamAList , i );
					DebugMsg( 0 , 0 , "fighter ".._currentTargetID.." is out . "..tostring( #_TeamAList ) .."  left." );
				end
			end
			DebugMsg( 0 , 0 , "Team B has "..#_TeamBList );
			for i = #_TeamBList , 1 , -1 do
				_currentTargetID = _TeamBList[ i ];
				if( CheckID( _currentTargetID ) == false ) or ( ReadRoleValue( _currentTargetID , EM_RoleValue_IsDead ) == 1  ) then
					table.remove( _TeamBList , i );
					DebugMsg( 0 , 0 , "fighter ".._currentTargetID.." is out. "..tostring( #_TeamBList ) .."  left." );
				end
			end	
			
			if ( #_TeamAList <= 0 or #_TeamBList <=0 ) or _clock >= _MaxTime then
				Say( _ExecutionerID , "mob should be end" );
				_Z940_703106_Switch = false;
				if ( #_TeamAList > #_TeamBList ) then
					_winnerA = true;
				else
					_winnerA = false;
				end

				break;
			end
			_clock = _clock + 1;
			sleep( 15 );
		end--end while
		
		_Z940_703106_Switch = false;
		Say( _ExecutionerID , "mob is end" );
		--out of fight
		if( _winnerA == true ) then
			ScriptMessage( _ExecutionerID , 0 , 2 , "it seems team A won the mob..." , 0 );
		else
			ScriptMessage( _ExecutionerID , 0 , 2 , "it seems team B won the mob..." , 0 );
		end

		Sleep( 50 );
		for i = #_TeamAList , 1 , -1 do
			_currentTargetID = _TeamAList[ i ];
			DelObj( _currentTargetID );
		end


		for i = #_TeamBList , 1 , -1 do
			_currentTargetID = _TeamBList[ i ];
			DelObj( _currentTargetID );
		end
		
--		DelObj( _OwnerID );
--	end--function Z940_703106_StartMobGame



--	local x , y , z , dir = DW_Location( _MobFlagID , 0 );
--	local _ctrl=CreateObj(110987 , x , y , z , dir , 1 );
--	SetModeEx( _ctrl , EM_SetModeType_Show , false );
--	SetModeEx( _ctrl , EM_SetModeType_Mark , false );
--	SetModeEx( _ctrl , EM_SetModeType_ShowRoleHead , false );
--	AddToPartition( _ctrl , _RoomID );
--	CallPlot( _ctrl , "Z940_703106_StartMobGame" );

end


function Z940_703106_end_mob_test()
	_Z940_703106_Switch = false;
end