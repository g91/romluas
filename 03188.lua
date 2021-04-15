--Author : K.J. Aris
--Version : 14.04.29.
--NPC : 109083
--Script : 703188

function Lua_703188_DungeonBossIgnitor()--本段掛載於NPC 109083 初始劇情  --統一起始該副本王啟動器  --各王啟動器詳見各自Script
	--this is an ignition of dungeon bosses to initialize ignitors of individuals	--
	local _ctrlID = OwnerID();
	--this NPC is using as a controller
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _ctrlID , EM_SetModeType_HideName , false );	--不顯示名稱
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--無阻擋效果

	--設定表
	local _ignitorGUIDs = { 	109084 ,--Z34B1
				109085 ,--Z34B2
				109086 ,--Z34B3
				109087 ,--Z34B4
				109088 ,--Z34B5
				109089 ,--Z34B6
				109090 ,--Z34B7
				}

	--難度設定
	local _zoneID = ReadRoleValue( _ctrlID , EM_RoleValue_ZoneID );
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );

	local _maxBosses = #_ignitorGUIDs;

	--除了困難副本以外  沒有尾王
	if ( _zoneID == 179 or _zoneID == 180 ) then
		_maxBosses = _maxBosses - 1;
		--在6王後門擋門--擋住去尾王的路
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
	ScriptMessage( _targetID , 0 , 2 , "[Lua_703188_AI_NobodyHome]" , 0 );--尾王不存在
end