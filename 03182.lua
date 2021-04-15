--Author : K.J. Aris
--Version : 14.06.27.
--Script : 703182

-------------------------------public functions
function Lua_703182_AddDoor( _doorGUID , _flagGUID , _flagPos , _roomID )--在Z32~Z34統一
	DebugMsg(0,0,"--Lua_703182_AddDoor  ".._flagPos.." : ".._roomID.." : ".._doorGUID );
	local _doorID = CreateObjByFlag( _doorGUID , _flagGUID , _flagPos , 1 );
	SetModeEx( _doorID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _doorID , EM_SetModeType_HideName , true );	--不顯示名稱
	SetModeEx( _doorID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _doorID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _doorID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _doorID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _doorID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _doorID , EM_SetModeType_Obstruct , true );	--有阻擋效果
	SetRoleCampID( _doorID , 1 );--避免門被打到
	LockHP( _doorID , 100 , "" );--避免門被打到
	AddToPartition( _doorID , _roomID );
	Lua_703182_DelDuplicateDoor( _doorID , _doorGUID );
	return _doorID;
end--function Lua_703182_AddDoor( _flagPos , _roomID )

function Lua_703182_DelDuplicateDoor( _doorID , _doorGUID )
	local _doorIDs = SearchRangeNPC( _doorID , 10 ); 

	local _npcGUID = 0;
	for _index , _npcID in pairs( _doorIDs ) do
		_npcGUID = ReadRoleValue( _npcID , EM_RoleValue_OrgID );
		if ( _npcGUID == _doorGUID and _npcID ~= _doorID ) then
			DelObj( _npcID );
		end
	end

	return;
end

------------------------------------------------------------------------------------------------------Extend Objects
function Lua_703182_ExtendObjectClosure( _hostID )--Caution : this is a closure pack !!
	DebugMsg( 0 , 0 , "----Lua_703182_ExtendObjectClosure : ".._hostID );
	local _parasitesList = {};
	local _deleteAll = false;

	local _roomID = ReadRoleValue( _hostID , EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location( _hostID );

	local _ctrlID = CreateObj( 110987 , x , y , z , dir , 1 );
	SetModeEx( _ctrlID , EM_SetModeType_Show , false );
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );
	SetModeEx( _ctrlID , EM_SetModeType_ShowRoleHead , false );

	SetModeEx( _ctrlID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--顯示血條
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );		--移動
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--攻擊
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--有阻擋效果
	DW_UnFight( _ctrlID , false );
	Lua_ObjDontTouch( _ctrlID , false );
	AddToPartition( _ctrlID , _roomID );

	local function AddParasite( _parasiteID )--closure
		table.insert( _parasitesList , _parasiteID );
	end		
	
	local function RemoveAll()
		--kill all parasites if the host doesn't exist 
		DebugMsg( 0 , 0 , "---------------Destroy all parasites. "..#_parasitesList );
		for i = 1 , #_parasitesList , 1 do
			DelObj( _parasitesList[ i ] );
			DebugMsg( 0 , 0 , "----Destroy parasite ".._parasitesList[ i ] );
		end
		--DelObj( _ctrlID );
		WriteRoleValue( _ctrlID , EM_RoleValue_LiveTime , 10 );
		DebugMsg( 0 , 0 , "----Destroy Controller ".._ctrlID );
		--_parasitesList = nil;
	end

	return _ctrlID , AddParasite , RemoveAll;
end--Lua_703182_ExtendObjectClosure( _hostID )
----------------------------------------------------------------------------------------END-----------Extend Objects



--hate list handlers
function Lua_703182_TableMerge( _oriTable , _extTable , _duplicateCheck )--_duplicateCheck : 0 : 不處理   ,  1 : 排除重複內容( 回傳index表 )     2 : 排除重複內容( 回傳hash表 ) 	--只能處理簡單資料型別 String Number
	_duplicateCheck = _duplicateCheck or 0;

	--排除重複內容
	if ( _duplicateCheck ~= 0 ) then
		local _mergedList = {};--合併清單
		for _index , _content in pairs( _oriTable ) do--檢視原清單內容
			_mergedList[ _content ] = _content;
		end

		for _index , _content in pairs( _extTable ) do--檢視新清單內容
			_mergedList[ _content ] = _content;--相同的內容會被覆寫
		end

		if ( _duplicateCheck == 1 ) then--回傳index表
			local _result = {};
			for _index , _content in pairs( _mergedList ) do--整理合併清單內容
				table.insert( _result , _content );--
			end
			return _result;
		end

		return _mergedList;--回傳hash表
	end

	--不做重複排除
	for _index , _content in pairs( _extTable ) do
		table.insert( _oriTable , _content );
	end
	return _oriTable;
end

function Lua_703182_RandomFromList( _table , _maxNumber )
	_maxNumber = _maxNumber or #_table;

	if _maxNumber < #_table then
		local _targetList = {};
		local _randomIndex = 0;
		for _i = 1, _maxNumber , 1 do
			_randomIndex = RandRange( 1 , #_table );
			table.insert( _targetList , _table[ _randomIndex ] );
		end

		return _targetList;
	else
		return _table
	end

end


function Lua_703182_Shuffle( _InputList )--打亂輸入的Table
	local _randomIndex = 0;
	local _tempCache = 0;

	for i = 1 , #_InputList , 1 do
		_randomIndex = RandRange( 1 , #_InputList );
		_tempCache = _InputList[ _randomIndex ];
		 _InputList[ _randomIndex ] = _InputList[ i ];
		_InputList[ i ] = _tempCache;
	end
	return _InputList;
end



function Lua_703182_BuffTweakTest()
	local _ownerID = OwnerID();
	AddBuff( _ownerID , 625968 , 18 , -1 );
	DebugMsg( 0 , 0 , "Lua_703182_BuffTweakTest" );
	Lua_703182_BuffTweak( _ownerID , 625968 , -1 , 20 );
end

--在_targetID身上 _duration(秒)內 每隔_frequency(秒) 增(減)_buffID層數_scale層  直到_finalBuffLv層或_duration時間到為止    ※_newBuffTime會刷新Buff持續時間
function Lua_703182_BuffTweak( _targetID , _buffID , _finalBuffLv , _duration , _frequency  , _scale , _newBuffTime )--_frequency  , _scale , _newBuffTime 可不填
	local _targetHasBuff = CheckBuff( _targetID , _buffID );
	_frequency = _frequency or 1;
	_scale = _scale or 1;
	_newBuffTime = _newBuffTime or -1;

	CallPlot( _targetID , "Lua_703182_BuffTweaking" , _targetID , _buffID , _finalBuffLv , _duration , _frequency  , _scale , _newBuffTime );

	return;
end

function Lua_703182_BuffTweaking( _targetID , _buffID , _finalBuffLv , _duration , _frequency  , _scale , _newBuffTime )
	--DebugMsg( 0 , 0 , "Lua_703182_BuffTweaking : ".._targetID );
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _buffID );

	local _vec = _finalBuffLv - _currentBuffLv;--判斷增或減
	if ( _vec > 0 ) then--代表使用加法
		_scale = math.abs( _scale );
	elseif ( _vec < 0 ) then--代表使用減法
		_scale = math.abs( _scale )*-1;
	else--_vec == 0
		return;--同層甭做
	end
	
	local _clock = 0;
	while ( _duration > 0 ) do--在時間範圍內
		Sleep( 10 );

		if ( _clock%_frequency == 0 ) then--每隔_frequency秒
			_currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _buffID );
			if ( _vec > 0 ) then
				if ( _currentBuffLv >= _finalBuffLv ) then break; end
			else
				if ( _currentBuffLv <= _finalBuffLv ) then break; end
			end
			_currentBuffLv = _currentBuffLv + _scale;
			CancelBuff_NoEvent( _targetID , _buffID );
			if ( _currentBuffLv > -1 ) then AddBuff( _targetID , _buffID , _currentBuffLv , _newBuffTime ); end
			--DebugMsg( 0 , 0 , "Lua_703182_BuffTweaking : Now LV : ".._currentBuffLv );
		end

		_clock = _clock + 1;
		_duration = _duration - 1;
	end

	return;
end