--AC1 GM指令物品  243292
function Lua_OneYear_OrderObj_1()
	DebugMsg(0,0,"指令");
	local _ownerID = OwnerID();

	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
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
	_transferSelect[6] = { "[241124]" }; -- 2015.09.07 阿浩:新增黑水結晶選項
--	_transferSelect[6] = { "[AC_INSTRUCTION_18]" }; -- 
--	_transferSelect[7] = { "[AC_INSTRUCTION_19]" }; -- 
	for i = 0, table.getn( _transferSelect ) do
		DialogSelectStr( _ownerID , _transferSelect[i][1] );
	end
	if( DialogSendOpen( _ownerID ) == false ) then 
		ScriptMessage( _ownerID , _ownerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0;
	end
	local _runTime = 1;
	local _dialogStatus = 0;
	while true do
		Sleep( 5 );
		_runTime = _runTime + 1;
		if _runTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
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
		elseif _dialogStatus == 0 then  --AC_1 初始設定
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_AC1_Init", 0 );
			break;
		elseif _dialogStatus == 1 then -- 重開機 AC_1 初始設定
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_Zone2_WorldPE_Init", 0 );
			break;	
		elseif _dialogStatus == 2 then -- 免投錢測試隨機buff
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"AC1testRandbuff", 0 );
			break;	
		elseif _dialogStatus == 3 then -- 增加勇氣
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_AC1_WorldAC_Bless1", 0 );
			break;	
		elseif _dialogStatus == 4 then -- 增加幸運
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_AC1_WorldAC_Bless2", 0 );
			break;	
		elseif _dialogStatus == 5 then -- 增加堅定
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_AC1_WorldAC_Bless3", 0 );
			break;
		elseif _dialogStatus == 6 then	-- 設定黑水結晶
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );
			CallPlot( _ownerID, "Hao_SetAC_DarkwaterCrystal", _ownerID, _roomID );
		end
	end
end

--AC_1 初始設定
function Lua_AC1_Init()
	Lua_Zone2_WorldPE_Init();
	Beginplot( OwnerID() ,"lua_AC1npcShow", 0 );
end

--增加勇氣
function Lua_AC1_WorldAC_Bless1()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
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
		ScriptMessage( _ownerID , _ownerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 );	--資料送出有問題
		return 0;
	end
	local _runTime = 1;
	local _dialogStatus = 0;
	while true do
		Sleep( 5 );
		_runTime = _runTime + 1;
		if _runTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
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
	SetWorldVar( "Zone2_WorldPE_Money_1", _money )--設定金錢(固定跳錢)
end

--增加幸運
function Lua_AC1_WorldAC_Bless2()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
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
		ScriptMessage( _ownerID , _ownerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 );	--資料送出有問題
		return 0;
	end
	local _runTime = 1;
	local _dialogStatus = 0;
	while true do
		Sleep( 5 );
		_runTime = _runTime + 1;
		if _runTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
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
	SetWorldVar( "Zone2_WorldPE_Money_2", _money )--設定金錢(固定跳錢)
end

--增加堅定
function Lua_AC1_WorldAC_Bless3()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
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
		ScriptMessage( _ownerID , _ownerID , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 );	--資料送出有問題
		return 0;
	end
	local _runTime = 1;
	local _dialogStatus = 0;
	while true do
		Sleep( 5 );
		_runTime = _runTime + 1;
		if _runTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
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
	SetWorldVar( "Zone2_WorldPE_Money_3", _money )--設定金錢(固定跳錢)
end


function Hao_SetAC_DarkwaterCrystal( Owner, Room )	-- 設定黑水結晶

	if CheckBuff( Owner, 501570 ) then
		ScriptMessage( Owner, Owner, 0, "[SC_WINDOW_OPENED]", 0 );	-- 視窗已經打開了
		return 0;
	end
	AddBuff( Owner, 501570, 0, -1 );
	DialogCreate( Owner, EM_LuaDialogType_Input, "[AC_INSTRUCTION_10]" );
	DialogSelectStr( Owner , "[SO_YES]" );	-- 確定
	DialogSelectStr( Owner , "[SC_CANCEL]" );	-- 取消

	local Time = 0;
	local DialogStatus;

	if not DialogSendOpen( Owner ) then	-- 表單使用錯誤，回傳錯誤訊息
		ScriptMessage( Owner, Owner, 1, "[SYS_FIXEQ_DATA_ERROR]", 0 );	-- 資料有問題
		return;
	end

	while true do
		Sleep(1);
		Time = Time+1;
		DialogStatus = DialogGetResult( Owner );	-- 檢查使用者選取的項目

	--	DebugMsg( Owner, Room, "Time = "..Time..", DialogStatus = "..DialogStatus );
	 	if Time > 600 then	-- 60秒無動作，關閉對話視窗
			ScriptMessage( Owner, Owner, 0, "Idle for more than 60 sec, window will close automatically.", 0 );	-- 閒置超過60秒，自動關閉視窗。
			break;
		end

	--	if DialogStatus == -2 then	-- 預設值，不處理
	--	end

		if DialogStatus == -1 or DialogStatus == 1 then	-- 中斷、按下取消時
			break;
		end

		if DialogStatus == 0 then	-- 按下確定時
			local InputString = DialogGetInputResult( Owner );	-- 取得使用者輸入字串
		--	DebugMsg( Owner, Room, "String = "..tostring(InputString) );
			if tonumber(InputString) ~= nil then	-- 當輸入字串為有效數字時
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
				ScriptMessage( Owner, Owner, 0, "Increase amount of ".."[".."241124".."]".." to "..InputString..", The total is "..SetCrystal.."." , 0 );	-- 當前捐款總量
				break;
			else
				Tell( Owner, Owner, "Nullity String Code." );	-- 無效字串
				break;
			end
		end
	end
	CancelBuff_NoEvent( Owner, 501570 );
	DialogClose( Owner );
end