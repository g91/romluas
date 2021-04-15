--AC1 GM���O���~  243292
function Lua_OneYear_OrderObj_1()
	DebugMsg(0,0,"���O");
	local _ownerID = OwnerID();

	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0;
	end

	Beginplot( _ownerID ,"Lua_OneYear_OrderObj_Start_1", 0 )
end
function Lua_OneYear_OrderObj_Start_1()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);

	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_11]" );
	AddBuff( _ownerID , 501570 , 0 , -1 );
	local _transferSelect = {};
	_transferSelect[0] = { "[AC_INSTRUCTION_12]" }; -- 
	_transferSelect[1] = { "[AC_INSTRUCTION_13]" }; -- 
	_transferSelect[2] = { "[AC_INSTRUCTION_14]" }; -- 
	_transferSelect[3] = { "[AC_INSTRUCTION_15]" }; -- 
	_transferSelect[4] = { "[AC_INSTRUCTION_16]" }; -- 
	_transferSelect[5] = { "[AC_INSTRUCTION_17]" }; -- 
	_transferSelect[6] = { "[241124]" }; -- 2015.09.07 ���E:�s�W�¤������ﶵ
--	_transferSelect[6] = { "[AC_INSTRUCTION_18]" }; -- 
--	_transferSelect[7] = { "[AC_INSTRUCTION_19]" }; -- 
	for i = 0, table.getn( _transferSelect ) do
		DialogSelectStr( _ownerID , _transferSelect[i][1] );
	end
	if( DialogSendOpen( _ownerID ) == false ) then 
		ScriptMessage( _ownerID , _ownerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0;
	end
	local _runTime = 1;
	local _dialogStatus = 0;
	while true do
		Sleep( 5 );
		_runTime = _runTime + 1;
		if _runTime  > 600 then -- ���L�a�j��A600 = �@����
			DebugMsg( 0, _roomID ,"Exit the MENU because IDLE a long Time !!");
			DialogClose( _ownerID );
			CancelBuff( _ownerID, 501570 );--
			break;
		end		
		_dialogStatus = DialogGetResult( _ownerID );
--		Say( _ownerID , _dialogStatus );
		if _dialogStatus == -2 then
			-- DO nothing
		elseif _dialogStatus == -1 then
			DialogClose( _ownerID );
			CancelBuff( _ownerID , 501570 );--
			break;
		elseif _dialogStatus == 0 then  --AC_1 ��l�]�w
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_AC1_Init", 0 );
			break;
		elseif _dialogStatus == 1 then -- ���}�� AC_1 ��l�]�w
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_Zone2_WorldPE_Init", 0 );
			break;	
		elseif _dialogStatus == 2 then -- �K��������H��buff
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"AC1testRandbuff", 0 );
			break;	
		elseif _dialogStatus == 3 then -- �W�[�i��
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_AC1_WorldAC_Bless1", 0 );
			break;	
		elseif _dialogStatus == 4 then -- �W�[���B
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_AC1_WorldAC_Bless2", 0 );
			break;	
		elseif _dialogStatus == 5 then -- �W�[��w
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_AC1_WorldAC_Bless3", 0 );
			break;
		elseif _dialogStatus == 6 then	-- �]�w�¤�����
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );
			CallPlot( _ownerID, "Hao_SetAC_DarkwaterCrystal", _ownerID, _roomID );
		end
	end
end

--AC_1 ��l�]�w
function Lua_AC1_Init()
	Lua_Zone2_WorldPE_Init();
	Beginplot( OwnerID() ,"lua_AC1npcShow", 0 );
end

--�W�[�i��
function Lua_AC1_WorldAC_Bless1()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0;
	end
	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_15]" );
	AddBuff( _ownerID , 501570 , 0 , -1 );
	local _transferSelect = {};
	_transferSelect[0] = { "[AC_INSTRUCTION_10]"..": 10000" }; -- 	
	_transferSelect[1] = { "[AC_INSTRUCTION_10]"..": 100000" }; --
	_transferSelect[2] = { "[AC_INSTRUCTION_10]"..": 1000000" }; --
	_transferSelect[3] = { "[AC_INSTRUCTION_10]"..": 10000000" }; --
	_transferSelect[4] = { "[AC_INSTRUCTION_10]"..": 100000000" }; --
	for i = 0, table.getn( _transferSelect ) do
		DialogSelectStr( _ownerID , _transferSelect[i][1] )
	end
	if( DialogSendOpen( _ownerID ) == false ) then 
		ScriptMessage( _ownerID , _ownerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 );	--��ưe�X�����D
		return 0;
	end
	local _runTime = 1;
	local _dialogStatus = 0;
	while true do
		Sleep( 5 );
		_runTime = _runTime + 1;
		if _runTime  > 600 then -- ���L�a�j��A600 = �@����
			DebugMsg( 0, _roomID ,"Exit the MENU because IDLE a long Time !!");
			DialogClose( _ownerID );
			CancelBuff( _ownerID, 501570 );--
			break;
		end		
		_dialogStatus = DialogGetResult( _ownerID );
--		Say( _ownerID , _dialogStatus );
		if _dialogStatus == -2 then
			-- DO nothing
		elseif _dialogStatus == -1 then
			DialogClose( _ownerID );
			CancelBuff( _ownerID , 501570 );--
			break;
		elseif _dialogStatus == 0 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless1_Add( 10000 );
			break;
		elseif _dialogStatus == 1 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless1_Add( 100000 );
			break;
		elseif _dialogStatus == 2 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless1_Add( 1000000 );
			break;
		elseif _dialogStatus == 3 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless1_Add( 10000000 );
			break;
		elseif _dialogStatus == 4 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless1_Add( 100000000 );
			break;
		end
	end	
end
function Lua_AC1_WorldAC_Bless1_Add( _quantity )
	local _money = GetWorldVar( "Zone2_WorldPE_Money_1");
	_money = _money + _quantity;
	SetWorldVar( "Zone2_WorldPE_Money_1", _money )--�]�w����(�T�w����)
end

--�W�[���B
function Lua_AC1_WorldAC_Bless2()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0;
	end
	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_16]" );
	AddBuff( _ownerID , 501570 , 0 , -1 );
	local _transferSelect = {};
	_transferSelect[0] = { "[AC_INSTRUCTION_10]"..": 10000" }; -- 	
	_transferSelect[1] = { "[AC_INSTRUCTION_10]"..": 100000" }; --
	_transferSelect[2] = { "[AC_INSTRUCTION_10]"..": 1000000" }; --
	_transferSelect[3] = { "[AC_INSTRUCTION_10]"..": 10000000" }; --
	_transferSelect[4] = { "[AC_INSTRUCTION_10]"..": 100000000" }; --
	for i = 0, table.getn( _transferSelect ) do
		DialogSelectStr( _ownerID , _transferSelect[i][1] )
	end
	if( DialogSendOpen( _ownerID ) == false ) then 
		ScriptMessage( _ownerID , _ownerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 );	--��ưe�X�����D
		return 0;
	end
	local _runTime = 1;
	local _dialogStatus = 0;
	while true do
		Sleep( 5 );
		_runTime = _runTime + 1;
		if _runTime  > 600 then -- ���L�a�j��A600 = �@����
			DebugMsg( 0, _roomID ,"Exit the MENU because IDLE a long Time !!");
			DialogClose( _ownerID );
			CancelBuff( _ownerID, 501570 );--
			break;
		end		
		_dialogStatus = DialogGetResult( _ownerID );
--		Say( _ownerID , _dialogStatus );
		if _dialogStatus == -2 then
			-- DO nothing
		elseif _dialogStatus == -1 then
			DialogClose( _ownerID );
			CancelBuff( _ownerID , 501570 );--
			break;
		elseif _dialogStatus == 0 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless2_Add( 10000 );
			break;
		elseif _dialogStatus == 1 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless2_Add( 100000 );
			break;
		elseif _dialogStatus == 2 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless2_Add( 1000000 );
			break;
		elseif _dialogStatus == 3 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless2_Add( 10000000 );
			break;
		elseif _dialogStatus == 4 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless2_Add( 100000000 );
			break;
		end
	end	
end
function Lua_AC1_WorldAC_Bless2_Add( _quantity )
	local _money = GetWorldVar( "Zone2_WorldPE_Money_2");
	_money = _money + _quantity;
	SetWorldVar( "Zone2_WorldPE_Money_2", _money )--�]�w����(�T�w����)
end

--�W�[��w
function Lua_AC1_WorldAC_Bless3()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0;
	end
	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_16]" );
	AddBuff( _ownerID , 501570 , 0 , -1 );
	local _transferSelect = {};
	_transferSelect[0] = { "[AC_INSTRUCTION_10]"..": 10000" }; -- 	
	_transferSelect[1] = { "[AC_INSTRUCTION_10]"..": 100000" }; --
	_transferSelect[2] = { "[AC_INSTRUCTION_10]"..": 1000000" }; --
	_transferSelect[3] = { "[AC_INSTRUCTION_10]"..": 10000000" }; --
	_transferSelect[4] = { "[AC_INSTRUCTION_10]"..": 100000000" }; --
	for i = 0, table.getn( _transferSelect ) do
		DialogSelectStr( _ownerID , _transferSelect[i][1] )
	end
	if( DialogSendOpen( _ownerID ) == false ) then 
		ScriptMessage( _ownerID , _ownerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 );	--��ưe�X�����D
		return 0;
	end
	local _runTime = 1;
	local _dialogStatus = 0;
	while true do
		Sleep( 5 );
		_runTime = _runTime + 1;
		if _runTime  > 600 then -- ���L�a�j��A600 = �@����
			DebugMsg( 0, _roomID ,"Exit the MENU because IDLE a long Time !!");
			DialogClose( _ownerID );
			CancelBuff( _ownerID, 501570 );--
			break;
		end		
		_dialogStatus = DialogGetResult( _ownerID );
--		Say( _ownerID , _dialogStatus );
		if _dialogStatus == -2 then
			-- DO nothing
		elseif _dialogStatus == -1 then
			DialogClose( _ownerID );
			CancelBuff( _ownerID , 501570 );--
			break;
		elseif _dialogStatus == 0 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless3_Add( 10000 );
			break;
		elseif _dialogStatus == 1 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless3_Add( 100000 );
			break;
		elseif _dialogStatus == 2 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless3_Add( 1000000 );
			break;
		elseif _dialogStatus == 3 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless3_Add( 10000000 );
			break;
		elseif _dialogStatus == 4 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_AC1_WorldAC_Bless3_Add( 100000000 );
			break;
		end
	end	
end
function Lua_AC1_WorldAC_Bless3_Add( _quantity )
	local _money = GetWorldVar( "Zone2_WorldPE_Money_3");
	_money = _money + _quantity;
	SetWorldVar( "Zone2_WorldPE_Money_3", _money )--�]�w����(�T�w����)
end


function Hao_SetAC_DarkwaterCrystal( Owner, Room )	-- �]�w�¤�����

	if CheckBuff( Owner, 501570 ) then
		ScriptMessage( Owner, Owner, 0, "[SC_WINDOW_OPENED]", 0 );	-- �����w�g���}�F
		return 0;
	end
	AddBuff( Owner, 501570, 0, -1 );
	DialogCreate( Owner, EM_LuaDialogType_Input, "[AC_INSTRUCTION_10]" );
	DialogSelectStr( Owner , "[SO_YES]" );	-- �T�w
	DialogSelectStr( Owner , "[SC_CANCEL]" );	-- ����

	local Time = 0;
	local DialogStatus;

	if not DialogSendOpen( Owner ) then	-- ���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage( Owner, Owner, 1, "[SYS_FIXEQ_DATA_ERROR]", 0 );	-- ��Ʀ����D
		return;
	end

	while true do
		Sleep(1);
		Time = Time+1;
		DialogStatus = DialogGetResult( Owner );	-- �ˬd�ϥΪ̿��������

	--	DebugMsg( Owner, Room, "Time = "..Time..", DialogStatus = "..DialogStatus );
	 	if Time > 600 then	-- 60��L�ʧ@�A������ܵ���
			ScriptMessage( Owner, Owner, 0, "Idle for more than 60 sec, window will close automatically.", 0 );	-- ���m�W�L60��A�۰����������C
			break;
		end

	--	if DialogStatus == -2 then	-- �w�]�ȡA���B�z
	--	end

		if DialogStatus == -1 or DialogStatus == 1 then	-- ���_�B���U������
			break;
		end

		if DialogStatus == 0 then	-- ���U�T�w��
			local InputString = DialogGetInputResult( Owner );	-- ���o�ϥΪ̿�J�r��
		--	DebugMsg( Owner, Room, "String = "..tostring(InputString) );
			if tonumber(InputString) ~= nil then	-- ���J�r�ꬰ���ļƦr��
				local Crystal = GetWorldVar( "ZONE2_WORLDPE_CRYSTAL" );
				if Crystal == nil then
					Crystal = 0;
				end;

				local SetCrystal = Crystal + InputString;
				if SetCrystal > 26000 then
					SetCrystal = 26000;
				end
				if SetCrystal < 0 then
					SetCrystal = 0;
				end
				SetWorldVar( "ZONE2_WORLDPE_CRYSTAL", SetCrystal );
				ScriptMessage( Owner, Owner, 0, "Increase amount of ".."[".."241124".."]".." to "..InputString..", The total is "..SetCrystal.."." , 0 );	-- ��e�����`�q
				break;
			else
				Tell( Owner, Owner, "Nullity String Code." );	-- �L�Ħr��
				break;
			end
		end
	end
	CancelBuff_NoEvent( Owner, 501570 );
	DialogClose( Owner );
end