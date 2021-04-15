--Author : K.J. Aris
--Version : 14.06.27.
--Script : 703182

-------------------------------public functions
function Lua_703182_AddDoor( _doorGUID , _flagGUID , _flagPos , _roomID )--�bZ32~Z34�Τ@
	DebugMsg(0,0,"--Lua_703182_AddDoor  ".._flagPos.." : ".._roomID.." : ".._doorGUID );
	local _doorID = CreateObjByFlag( _doorGUID , _flagGUID , _flagPos , 1 );
	SetModeEx( _doorID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _doorID , EM_SetModeType_HideName , true );	--����ܦW��
	SetModeEx( _doorID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _doorID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _doorID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _doorID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _doorID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _doorID , EM_SetModeType_Obstruct , true );	--�����׮ĪG
	SetRoleCampID( _doorID , 1 );--�קK���Q����
	LockHP( _doorID , 100 , "" );--�קK���Q����
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

	SetModeEx( _ctrlID , EM_SetModeType_HideName , true );	--��ܦW��
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--��ܦ��
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );		--����
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--����
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--����
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--�����׮ĪG
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
function Lua_703182_TableMerge( _oriTable , _extTable , _duplicateCheck )--_duplicateCheck : 0 : ���B�z   ,  1 : �ư����Ƥ��e( �^��index�� )     2 : �ư����Ƥ��e( �^��hash�� ) 	--�u��B�z²���ƫ��O String Number
	_duplicateCheck = _duplicateCheck or 0;

	--�ư����Ƥ��e
	if ( _duplicateCheck ~= 0 ) then
		local _mergedList = {};--�X�ֲM��
		for _index , _content in pairs( _oriTable ) do--�˵���M�椺�e
			_mergedList[ _content ] = _content;
		end

		for _index , _content in pairs( _extTable ) do--�˵��s�M�椺�e
			_mergedList[ _content ] = _content;--�ۦP�����e�|�Q�мg
		end

		if ( _duplicateCheck == 1 ) then--�^��index��
			local _result = {};
			for _index , _content in pairs( _mergedList ) do--��z�X�ֲM�椺�e
				table.insert( _result , _content );--
			end
			return _result;
		end

		return _mergedList;--�^��hash��
	end

	--�������Ʊư�
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


function Lua_703182_Shuffle( _InputList )--���ÿ�J��Table
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

--�b_targetID���W _duration(��)�� �C�j_frequency(��) �W(��)_buffID�h��_scale�h  ����_finalBuffLv�h��_duration�ɶ��쬰��    ��_newBuffTime�|��sBuff����ɶ�
function Lua_703182_BuffTweak( _targetID , _buffID , _finalBuffLv , _duration , _frequency  , _scale , _newBuffTime )--_frequency  , _scale , _newBuffTime �i����
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

	local _vec = _finalBuffLv - _currentBuffLv;--�P�_�W�δ�
	if ( _vec > 0 ) then--�N��ϥΥ[�k
		_scale = math.abs( _scale );
	elseif ( _vec < 0 ) then--�N��ϥδ�k
		_scale = math.abs( _scale )*-1;
	else--_vec == 0
		return;--�P�h�ǰ�
	end
	
	local _clock = 0;
	while ( _duration > 0 ) do--�b�ɶ��d��
		Sleep( 10 );

		if ( _clock%_frequency == 0 ) then--�C�j_frequency��
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