
--/gm ? pcall Lua_CheckBoss
function Lua_CheckBoss()
	
	local _ctrlID = OwnerID(); --���
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );
	DebugMsg(0,_roomID,"--Lua_CheckBoss--");
	
	SetModeEX ( _ctrlID , EM_SetModeType_Show , false );
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );--���i�I��
	SetModeEx( _ctrlID , EM_SetModeType_HideName , false );--����ܦW��
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );--����ܦ��
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );--���i����
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );--�L���׮ĪG

	local _npcCount;
	local _current;
	local _timer = 0;
	
	while true do
--		_npcCount = SetSearchAllNPC( _roomID );
		_npcCount = SetSearchRangeInfo( _ctrlID , 500 );
		DebugMsg(0,_roomID,"_npcCount=".._npcCount);
		for i = 1 , _npcCount , 1 do
			_current = GetSearchResult();
			if ReadRoleValue( _current , EM_RoleValue_OrgID ) == 107966 then
				DebugMsg(0,_roomID,"--Lua_CheckBoss--return");
				return;
			end
		end
		if _timer == 10 then
			DebugMsg(0,_roomID,"--Lua_CheckBoss--Create");
			_npcCount = SetSearchRangeInfo( _ctrlID , 500 );
			for i = 1 , _npcCount , 1 do
				_current = GetSearchResult();
				if ReadRoleValue( _current , EM_RoleValue_OrgID ) == 106251 then
					DebugMsg(0,_roomID,"--Lua_CheckBoss--DelDoor");
					DelObj ( _current ); 
				end	
			end
			local _bossID = CreateObjByFlag( 107966 , 781444 , 0 , 1 );
			AddToPartition( _bossID , _roomID );
			return;
		end
		_timer = _timer + 1;
		Sleep(10);
	end
end
--109226