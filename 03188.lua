--Author : K.J. Aris
--Version : 14.04.29.
--NPC : 109083
--Script : 703188

function Lua_703188_DungeonBossIgnitor()--���q������NPC 109083 ��l�@��  --�Τ@�_�l�Ӱƥ����Ұʾ�  --�U���Ұʾ��Ԩ��U��Script
	--this is an ignition of dungeon bosses to initialize ignitors of individuals	--
	local _ctrlID = OwnerID();
	--this NPC is using as a controller
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _ctrlID , EM_SetModeType_HideName , false );	--����ܦW��
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG

	--�]�w��
	local _ignitorGUIDs = { 	109084 ,--Z34B1
				109085 ,--Z34B2
				109086 ,--Z34B3
				109087 ,--Z34B4
				109088 ,--Z34B5
				109089 ,--Z34B6
				109090 ,--Z34B7
				}

	--���׳]�w
	local _zoneID = ReadRoleValue( _ctrlID , EM_RoleValue_ZoneID );
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );

	local _maxBosses = #_ignitorGUIDs;

	--���F�x���ƥ��H�~  �S������
	if ( _zoneID == 179 or _zoneID == 180 ) then
		_maxBosses = _maxBosses - 1;
		--�b6������ת�--�צ�h��������
		local _doorGUID = 106012;
		local _flagGUID = 781416;
		local _doorFlagPos = 4;
		local _doorID = Lua_703182_AddDoor( _doorGUID , _flagGUID , _doorFlagPos , _roomID );
		SetPlot( _doorID , "range", "Lua_703188_DungeonEnd" , 30 ); 
	end

	local _ignitorID = 0;
	local x,y,z,dir = DW_Location( _ctrlID );
	
	for _i = 1 , _maxBosses , 1 do
		_ignitorID = CreateObj( _ignitorGUIDs[ _i ] , x,y,z,dir , 1 );
		AddToPartition( _ignitorID , _roomID );
	end

end

function Lua_703188_DungeonEnd()
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	DebugMsg( 0 , 0 , "--Lua_703188_DungeonEnd" );
	ScriptMessage( _targetID , 0 , 2 , "[Lua_703188_AI_NobodyHome]" , 0 );--�������s�b
end