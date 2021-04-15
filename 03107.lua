--Auther : K.J. Aris
--Version : 13.10.18.14.05

--Public functions
--ScriptID : 703107

---------------------------寄生物件
--this function is for general objects which will disappear with a Host Object's death and deletion.
--use closure method to add a Parasitic Object by ID.
--Parasitic Objects on list will all be remove when Host Object is dead or deleted.
function AssignParasiteHost( _hostID )--Caution : this is a closure pack !!
	local _parasitesList = {};
	local _deleteAll = false;

	local _roomID = ReadRoleValue( _hostID , EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location( _hostID );

	local _ctrlID = CreateObj( 110987 , x , y , z , dir , 1 );	--this closure contains an Object as a central controller	--you can have it reused
	SetModeEx( _ctrlID , EM_SetModeType_Show , false );
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );
	SetModeEx( _ctrlID , EM_SetModeType_ShowRoleHead , false );
	DW_UnFight( _ctrlID , false );
	Lua_ObjDontTouch( _ctrlID , false );
	AddToPartition( _ctrlID , _roomID );

	function Sub_703107_AssignParasiteHost_HostMonitor( _inputHostID )--衍生物規則，隨主動存活
		if not _inputHostID then--host checking
			return false;
		end

		--monitoring host
		while ( CheckID( _inputHostID ) ) and ( ReadRoleValue( _inputHostID , EM_RoleValue_IsDead ) == 0 and _deleteAll == false ) do	
			sleep( 30 );
		end
		
		--kill all parasites if the host doesn't exist 
		DebugMsg( 0 , 0 , "---------------Destroy all parasites. "..#_parasitesList );
		for i = 1 , #_parasitesList , 1 do
			DelObj( _parasitesList[ i ] );
			DebugMsg( 0 , 0 , "----Destroy parasite ".._parasitesList[ i ] );
		end

		DelObj( _ctrlID );
		--_parasitesList = {};
	end
	
	local function AddParasite( _parasiteID )--closure
		--DebugMsg( 0 , 0 , "add _parasiteID : ".._parasiteID.."  "..#_parasitesList );
		if #_parasitesList <= 0 then--index length less than 0 meaning it's the first parasite on the list
			--DebugMsg( 0 , 0 , "### ".._parasiteID.." as monitor" );
			CallPlot( _ctrlID , "Sub_703107_AssignParasiteHost_HostMonitor" , _hostID );--add a monitor
		end
		table.insert( _parasitesList , _parasiteID );
	end		
	
	local function DemoveAll()
		_deleteAll = true;
	end

	return AddParasite , _ctrlID;
end
-------------------END-----寄生物件






function Lua_703107_Return_Buff_Lv( ObjID , MagicID )	-- 查詢『遊戲中』法術等級，回傳-1時，代表沒有此Buff，回傳0時，代表資料庫中的 0
	local BuffLv = -1;				-- 技能等級
	local Count = BuffCount( ObjID );	-- 查詢身上的技能

	for i = 0 , Count , 1 do
		local BuffID = BuffInfo( ObjID , i , EM_BuffInfoType_BuffID );
		if BuffID == MagicID then
			BuffLv = BuffInfo( ObjID , i , EM_BuffInfoType_Power );
		end
	end

	return BuffLv;
end