-- SetWorldVar 設定資訊
-- OneYear_AC_Season --> 季節代碼
-- OneYear_AC_Type --> 階段代碼	0--停止 1  2  3 
-- OneYear_AC_Money --> 累積金錢數量
-- OneYear_AC_Money_Type --> P1 階段代碼
-- OneYear_AC_Material --> 累積材料數量
-- OneYear_AC_Material_Type --> P2 階段代碼
-- OneYear_AC_DuplicateSetTimer --> 副本開啟累計時間
-- OneYear_AC_DuplicateTimer --> 副本開啟時間

--108931
--掛在P1 NPC 初始劇情上
function Lua_OneYear_P1_NPC()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _x , _y , _z , _dir=DW_Location( _ownerID );
	local _npcID = nil;

	Lua_OneYear_P1_Set = function( _type )
		if _type == 1 then
			SetModeEX ( _ownerID , EM_SetModeType_Show , false );
			SetModeEx( _ownerID , EM_SetModeType_HideName , true );--不顯示名稱
			SetModeEx( _ownerID , EM_SetModeType_Mark , false );--不可點選
		elseif _type == 2 then
			SetModeEX ( _ownerID , EM_SetModeType_Show , true );
			SetModeEx( _ownerID , EM_SetModeType_HideName , false );--不顯示名稱
			SetModeEx( _ownerID , EM_SetModeType_Mark , true );--不可點選
		end
	end

	-- 創建祕法室通道         ? zone 81  1.2 -106 1.2 0
	Lua_OneYear_P1_Create_NPC = function()
		if _npcID == nil then
			DebugMsg(0,0,"Lua_OneYear_P1_Create_NPC");
--			_npcID = CreateObj( 123649 , _x , _y , _z , _dir , 1 ); -- ZONE 2 0 4815,50,-33481
			_npcID = CreateObj( 123649 , 4815 , 50 , -3348 , 0 , 1 );
			AddToPartition( _npcID , _roomID );
			BeginPlot( _npcID , "AC2_arcane_Enter" , 0 );
		end
	end
	
	-- 刪除祕法室通道
	Lua_OneYear_P1_Del_NPC = function()
		if _npcID ~= nil then 
			DelObj( _npcID );
			_npcID = nil;
		end;
	end
	
	BeginPlot( _ownerID , "Lua_OneYear_P1_NPC_Ctrl" , 0 );
end

function Lua_OneYear_P1_NPC_Ctrl()
	local _sleepTime = 50;
	local _type;
		
	while true do
		_type = GetWorldVar( "OneYear_AC_Type" );
	--	DebugMsg(0,0,"_type=".._type);
		if _type <= 1 then
			SetWorldVar( "OneYear_AC_DuplicateSetTimer" , 0 ); --副本累計時間歸零
			Lua_OneYear_P1_Del_NPC();-- 刪除祕法室通道
			Lua_OneYear_P1_Set(2);
		elseif _type >= 2 then
			Lua_OneYear_P1_Create_NPC(); -- 創建祕法室通道
			Lua_OneYear_P1_Set(1);
--			Lua_OneYear_AC_GetSystime(); --計時器
		end
--		DebugMsg(0,0,"Lua_OneYear_P1_NPC_Ctrl");
		Sleep( _sleepTime );
	end
end

--計時器 
function Lua_OneYear_AC_GetSystime()
	local _nowTimerMonth;--月  0-11
	local _nowTimerDay;--日 1-31
	local _nowTimerH; --時 0-23 午夜12點為0
	local _nowTimerM; --分 0-59
	local _nowTimer = 0;

	_nowTimerH = GetSystime(1);
	_nowTimerM = GetSystime(2);
--	DebugMsg(0,0,"_nowTimerH=".._nowTimerH);
--	DebugMsg(0,0,"_nowTimerM=".._nowTimerM);
	_nowTimerMonth = GetSystime(3) + 1;
	_nowTimerDay = GetSystime(4);
--	DebugMsg(0,0,"_nowTimerMonth=".._nowTimerMonth);
--	DebugMsg(0,0,"_nowTimerDay=".._nowTimerDay);
	_nowTimer = Lua_OneYear_AC_GetSystime_Number( _nowTimerMonth , _nowTimerDay , _nowTimerH );
	DebugMsg(0,0,"_nowTimer=".._nowTimer);
end
function Lua_OneYear_AC_GetSystime_Number( _month , _day , _hour )
	_day = ( _day < 10 ) and tostring( 0 ).._day or _day;
	_hour = ( _hour < 10 ) and tostring( 0 ).._hour or _hour;
	local _timer = tostring( _month )..tostring( _day )..tostring( _hour );
	return tonumber( _timer );
end

----------------------------------------------------------------------------------------------------------------
--/gm ? pcall Lua_OneYear_CreateCtrl
function Lua_OneYear_CreateCtrl()
	DebugMsg(0,0,"--CreateCtrl--CreateCtrl--");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _x , _y , _z , _dir=DW_Location( _ownerID );
	local _ctrlID = CreateObj( 108902 , _x , _y , _z , _dir , 1 );
	AddToPartition( _ctrlID , _roomID );
end

--108902
function Lua_OneYear_Ctrl()
	local _ctrlID = OwnerID(); --控制器
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );
	local _type = GetWorldVar( "OneYear_AC_Type" );
	DebugMsg(0,0,"_type=".._type);
	local _currentNPC;
	local _npcAry = {};
	local _monsterNPC;
	local _monsterAry = {};
	
	SetModeEX ( _ctrlID , EM_SetModeType_Show , false );
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );--不可點選
	SetModeEx( _ctrlID , EM_SetModeType_HideName , false );--不顯示名稱
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );--不顯示血條
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );--不會反擊
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );--不會移動
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );--不可攻擊
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );--不會索敵
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );--無阻擋效果
	
	--副本時間 預設
	if GetWorldVar( "OneYear_AC_DuplicateTimer" ) == 0 then
		SetWorldVar( "OneYear_AC_DuplicateTimer" , 72 ); -- 預設72小時
	end
	
	--P1
	Lua_OneYear_Ctrl_P1_Start = function()
		DebugMsg(0,0,"--P1_Start--");
		BeginPlot( _ctrlID, "Lua_OneYear_P1_Start", 0 );
	end
	
	--P2
	Lua_OneYear_Ctrl_P2_Start = function()
		DebugMsg(0,0,"--P2_Start--");
		if lua_ACuseRealZoneID( _ctrlID ) then
			BeginPlot( _ctrlID, "Lua_OneYear_P2_Start", 0 );
		else
			BeginPlot( _ctrlID, "Lua_OneYear_P2_Start_Bypass", 0 );
		end
	end
	
	--副本
	Lua_OneYear_Ctrl_Duplicate_Start = function()
		DebugMsg(0,0,"--副本_Start--");
		DesignLog( OwnerID() , 108902 , "AC2_Open_Season"..GetWorldVar( "OneYear_AC_Season" ) );
		Lua_OneYear_StartDuplicate( GetWorldVar( "OneYear_AC_Season" ) ); -- 開啟副本入口
		BeginPlot( _ctrlID, "Lua_OneYear_DuplicateSetTimer_Start", 0 ); --副本計時
	end
	
	--副本NPC入口 
	Lua_OneYear_Create_NPC = function(  _orgID , _x , _y , _z , _dir )
		_currentNPC = CreateObj( _orgID , _x , _y , _z , _dir , 1 );
		AddToPartition( _currentNPC , _roomID );
		table.insert( _npcAry , _currentNPC );
	end

	--刪除副本NPC入口 & 傳送玩家
	Lua_OneYear_Del_NPC = function()
		DesignLog( OwnerID() , 108902 , "AC2_Closed_ReSet" )
		local _npcAryLen = #_npcAry;
		
		--傳送玩家
		if tonumber( _npcAryLen ) ~= 0 then
			Lua_OneYear_ChangeZonePlayer( _ctrlID ); --傳送玩家至Zone 2 
		end
		
		--刪除副本NPC入口 
		for i = 1 , _npcAryLen , 1 do
			DelObj( _npcAry[ i ] );
		end
		_npcAry = {};
	end

	Lua_OneYear_CreateMonster_NPC = function( _flagID , _monsterOrgID_1 , _monsterOrgID_2 )
		local _x , _y , _z , _dir = 0;
		local _flagNum = 0;
		local _randNum = 0;
		local _randMonster = 0;
		while true do
			_x , _y , _z , _dir = DW_Location( _flagID , _flagNum );
			if _x == 0 and _y == 0 and _z == 0 and _dir == 0 then
				break;
			else
				_flagNum = _flagNum + 1;
				_randNum = RandRange( 1 , 2 );
				_randMonster = ( _randNum == 1 ) and _monsterOrgID_1 or _monsterOrgID_2;
--				DebugMsg(0,0,"_randMonster=".._randMonster);				
				_monsterNPC = CreateObj( _randMonster , _x , _y , _z , _dir , 1 );
				SetModeEx( _monsterNPC , EM_SetModeType_Revive , true );--
				AddToPartition( _monsterNPC , _roomID );
--				DebugMsg(0,0,"_monsterNPC=".._monsterNPC);
				table.insert( _monsterAry , _monsterNPC );
			end
		end
	end

	Lua_OneYear_DelMonster_NPC = function()
--		DebugMsg(0,0,"Lua_OneYear_DelMonster_NPC ");
		local _npcAryLen = #_monsterAry;
		--刪除副本入口怪NPC
		for i = 1 , _npcAryLen , 1 do
			DelObj( _monsterAry[ i ] );
		end
		_monsterAry = {};
	end
	
	--刪除 隱藏 控制器
	--/gm ? pcall Lua_OneYear_Ctrl_DelObj()
	Lua_OneYear_Ctrl_DelObj = function( _num )
		if _num == 0 then
			DelObj( _ctrlID ); --刪除
		elseif _num == 1 then
			SetModeEX ( _ctrlID , EM_SetModeType_Show , false ); --隱藏
		elseif _num == 2 then
			SetModeEX ( _ctrlID , EM_SetModeType_Show , true ); --秀出
		end
	end
	
	if _type == 0 then
		
	elseif _type == 1 then
		Lua_OneYear_Ctrl_P1_Start();--P1
	elseif _type == 2 then
		Lua_OneYear_Ctrl_P2_Start();--P2
	elseif _type == 3 then
		Lua_OneYear_Ctrl_Duplicate_Start();--P3&副本
	end
end

function Lua_OneYear_P1_Start()
	local _ctrlID = OwnerID();
	local _money;
	local _boolean = lua_ACuseRealZoneID( _ctrlID ); --是否在分流 true 否   false 是
		
	RunningMsgEx( _ctrlID , 2 , 3 , "[SC_AC2_PHASE_1]" );--跑馬燈 1 = 區域 2 = 所有玩家
	while true do
		Sleep(10);
		if GetWorldVar( "OneYear_AC_Type" ) == 1 then
			if _boolean then Lua_OneYear_P1_PayMoney( 100 ) end; -- 每秒增加100
			_money = GetWorldVar( "OneYear_AC_Money" );
			if _money < 67000000 then --67000000
				SetWorldVar( "OneYear_AC_Money_Type" , 1 );--第一階段
			elseif _money >= 67000000 and _money < 134000000 then --134000000
				SetWorldVar( "OneYear_AC_Money_Type" , 2 );--第二階段
			elseif _money >= 134000000 and _money < 200000000 then --200000000
				SetWorldVar( "OneYear_AC_Money_Type" , 3 );--第三階段
			elseif _money >= 200000000 then
				SetWorldVar( "OneYear_AC_Money_Type" , 4 );--第四階段
				SetWorldVar( "OneYear_AC_Type" , 2 );--第二階段
				Lua_OneYear_Ctrl_P2_Start();
			end
		else
			break;
		end
	end
end

--增加金錢數量
--/gm ? pcall Lua_OneYear_P1_PayMoney()
function Lua_OneYear_P1_PayMoney( _quantity , _player )
	if GetWorldVar( "OneYear_AC_Type" ) == 1 then
		local _money = GetWorldVar( "OneYear_AC_Money");
		_money = _money + _quantity;
		SetWorldVar( "OneYear_AC_Money" , _money );
		DebugMsg(0,0,"_money=".._money);
		if _player ~= nil then
			local _moneyType = GetWorldVar( "OneYear_AC_Money_Type");
			local _buffID = 625608 + _moneyType;
--			DebugMsg(0,0,"_buffID=".._buffID);
			if CheckBuff( _player , _buffID ) == false then AddBuff( _player , _buffID ,  0 , -1 ) end;
		end
	else
		DebugMsg(0,0,"不在此階段 無法繳錢");
	end
end
--/gm ? pcall Lua_OneYear_P1_PayMoney_Test()
function Lua_OneYear_P1_PayMoney_Test( _quantity )
	local _player = OwnerID();
	Lua_OneYear_P1_PayMoney( _quantity , _player );
end

--檢查金錢數量  625609 625610 625611
function Lua_OneYear_Money_Set( _moneyType )
--	DebugMsg(0,0,"_moneyType=".._moneyType);
--	DebugMsg(0,0,"Lua_OneYear_Money_Set");
	local _player = OwnerID();
	local _money = GetWorldVar( "OneYear_AC_Money");
	DebugMsg(0,0,"_moneyType_money=".._money);
--	local _type = GetWorldVar( "OneYear_AC_Money_Type");
--	DebugMsg(0,0,"_type=".._type);
	if _money == 0 then
		CancelBuff( _player , 625609 );
		CancelBuff( _player , 625610 );
		CancelBuff( _player , 625611 );
	elseif _moneyType == 1 and _money  >= 67000000 then
		AddBuff( _player , 625641 ,  0 , -1 ); --取得第一階段長效BUFF
--		DebugMsg(0,0,"P1_取得第一階段長效BUFF");  -- 625641
		CancelBuff( _player , 625609 );
	elseif _moneyType == 2 and _money  >= 134000000 then
		AddBuff( _player , 625642 ,  0 , -1 ); --取得第二階段長效BUFF
--		DebugMsg(0,0,"P1_取得第二階段長效BUFF"); -- 625642
		CancelBuff( _player , 625610 );
	elseif _moneyType == 3 and _money  >= 200000000 then
		AddBuff( _player , 625643 ,  0 , -1 ); --取得第三階段長效BUFF
--		DebugMsg(0,0,"P1_取得第三階段長效BUFF"); -- 625643
		CancelBuff( _player , 625611 );
	end
end

function Lua_OneYear_P2_Start()
	RunningMsgEx( OwnerID() , 2 , 3 , "[SC_AC2_PHASE_2]" );--跑馬燈 1 = 區域 2 = 所有玩家
	local _material = GetWorldVar( "OneYear_AC_Material");
	if _material < 80000 then --8000
		SetWorldVar( "OneYear_AC_Material_Type" , 1 );--第一階段
	elseif _material >= 80000 and _material < 140000 then --14000
		SetWorldVar( "OneYear_AC_Material_Type" , 2 );--第二階段
	elseif _material >= 140000 and _material < 200000 then --20000
		SetWorldVar( "OneYear_AC_Material_Type" , 3 );--第三階段
	elseif _material >= 200000 then
		SetWorldVar( "OneYear_AC_Material_Type" , 4 );--第四階段
		SetWorldVar( "OneYear_AC_Type" , 3 );--第三階段&副本
		Lua_OneYear_Ctrl_Duplicate_Start();
	end
	
	while true do
--		Sleep(10);
		Sleep(600);
		if GetWorldVar( "OneYear_AC_Type" ) == 2 then
			Lua_OneYear_P2_PayMaterial( 100 ); -- 每分鐘增加100
		else
			break;
		end
	end
end
--分流
function Lua_OneYear_P2_Start_Bypass()
	local _material;
	while GetWorldVar( "OneYear_AC_Type" ) == 2 do
		_material = GetWorldVar( "OneYear_AC_Material");
		if _material >= 200000 then
			SetWorldVar( "OneYear_AC_Material_Type" , 4 );--第四階段
			SetWorldVar( "OneYear_AC_Type" , 3 );--第三階段&副本
			Lua_OneYear_Ctrl_Duplicate_Start();
		end
		Sleep(50);
	end
end

--增加材料數量
--/gm ? pcall Lua_OneYear_P2_PayMaterial()
function Lua_OneYear_P2_PayMaterial( _quantity , _player )
	if GetWorldVar( "OneYear_AC_Type" ) == 2 then
		local _material = GetWorldVar( "OneYear_AC_Material");
		_material = _material + _quantity;
		SetWorldVar( "OneYear_AC_Material" , _material );
		DebugMsg(0,0,"_material=".._material);
		
		if _player ~= nil then
			local _materialType = GetWorldVar( "OneYear_AC_Material_Type");
			local _buffID = 625616 + _materialType;
--			DebugMsg(0,0,"_buffID=".._buffID);
			if CheckBuff( _player , _buffID ) == false then AddBuff( _player , _buffID ,  0 , -1 ) end;
		end
		
		_material = GetWorldVar( "OneYear_AC_Material");
		if _material < 80000 then --8000
			SetWorldVar( "OneYear_AC_Material_Type" , 1 );--第一階段
		elseif _material >= 80000 and _material < 140000 then --14000
			SetWorldVar( "OneYear_AC_Material_Type" , 2 );--第二階段
		elseif _material >= 140000 and _material < 200000 then --20000
			SetWorldVar( "OneYear_AC_Material_Type" , 3 );--第三階段
		elseif _material >= 200000 then
			SetWorldVar( "OneYear_AC_Material_Type" , 4 );--第四階段
			SetWorldVar( "OneYear_AC_Type" , 3 );--第三階段&副本
			Lua_OneYear_Ctrl_Duplicate_Start();
		end
	else
		DebugMsg(0,0,"不在此階段 無法繳材料");
	end
end
--/gm ? pcall Lua_OneYear_P2_PayMaterial_Test()
function Lua_OneYear_P2_PayMaterial_Test( _quantity )
	local _player = OwnerID();
	Lua_OneYear_P2_PayMaterial( _quantity , _player );
end

--檢查材料數量  625617 625618 625619
function Lua_OneYear_Material_Set( _materialType )
--	DebugMsg(0,0,"_materialType=".._materialType);
--	DebugMsg(0,0,"Lua_OneYear_Material_Set");
	local _player = OwnerID();
	local _material = GetWorldVar( "OneYear_AC_Material");
--	DebugMsg(0,0,"_material=".._material);
--	local _type = GetWorldVar( "OneYear_AC_Material_Type");
--	DebugMsg(0,0,"_type=".._type);
	if _material == 0 then
		CancelBuff( _player , 625617 );
		CancelBuff( _player , 625618 );
		CancelBuff( _player , 625619 );
	elseif _materialType == 1 and _material  >= 80000 then 
		AddBuff( _player , 625641 ,  0 , -1 ); --取得第一階段長效BUFF
--		DebugMsg(0,0,"P2_取得第一階段長效BUFF"); -- 625641
		CancelBuff( _player , 625617 );
	elseif _materialType == 2 and _material  >= 140000 then
		AddBuff( _player , 625642 ,  0 , -1 ); --取得第二階段長效BUFF
--		DebugMsg(0,0,"P2_取得第二階段長效BUFF"); -- 625642
		CancelBuff( _player , 625618 );
	elseif _materialType == 3 and _material  >= 200000 then
		AddBuff( _player , 625643 ,  0 , -1 ); --取得第三階段長效BUFF
--		DebugMsg(0,0,"P2_取得第三階段長效BUFF"); -- 625643
		CancelBuff( _player , 625619 );
	end
end

--依照季節 開起副本
function Lua_OneYear_StartDuplicate( _seasonType )
	if _seasonType == 0 or _seasonType == 1 then
		DebugMsg(0,0,"第一季");
		Lua_OneYear_Create_NPC( 123650 , -1101 , 56 , 1095 , 0 );

		Lua_OneYear_CreateMonster_NPC( 781418 , 106218 , 106220 );
	elseif _seasonType == 2 then
		DebugMsg(0,0,"第二季");
		Lua_OneYear_Create_NPC( 123650 , -1101 , 56 , 1095 , 0 );
		Lua_OneYear_Create_NPC( 123651 , 1102 , 20 , 1104 , 0 );

		Lua_OneYear_CreateMonster_NPC( 781418 , 106218 , 106220 );
		Lua_OneYear_CreateMonster_NPC( 781419 , 106390 , 106534 );
	elseif _seasonType == 3 then
		DebugMsg(0,0,"第三季");
		Lua_OneYear_Create_NPC( 123650 , -1101 , 56 , 1095 , 0 );
		Lua_OneYear_Create_NPC( 123651 , 1102 , 20 , 1104 , 0 );
		Lua_OneYear_Create_NPC( 123652 , -1090 , 30 , -1082 , 0 );

		Lua_OneYear_CreateMonster_NPC( 781418 , 106218 , 106220 );
		Lua_OneYear_CreateMonster_NPC( 781419 , 106390 , 106534 );
		Lua_OneYear_CreateMonster_NPC( 781420 , 106552 , 106554 );
	elseif _seasonType == 4 then
		DebugMsg(0,0,"第四季");
		Lua_OneYear_Create_NPC( 123650 , -1101 , 56 , 1095 , 0 );
		Lua_OneYear_Create_NPC( 123651 , 1102 , 20 , 1104 , 0 );
		Lua_OneYear_Create_NPC( 123652 , -1090 , 30 , -1082 , 0 );
		Lua_OneYear_Create_NPC( 123653 , 1098 , 56 , -1102 , 0 );

		Lua_OneYear_CreateMonster_NPC( 781418 , 106218 , 106220 );
		Lua_OneYear_CreateMonster_NPC( 781419 , 106390 , 106534 );
		Lua_OneYear_CreateMonster_NPC( 781420 , 106552 , 106554 );
		Lua_OneYear_CreateMonster_NPC( 781421 , 108384 , 108386 );
	end
end

--副本計時   --祕法室專用
function Lua_OneYear_DuplicateSetTimer_Start()
	local _ownerID = OwnerID();	
--	DebugMsg(0,0,"_ownerID=".._ownerID);
	local _totalTimer = 0;--副本開啟總時間
	local _timer = GetWorldVar( "OneYear_AC_DuplicateSetTimer" );
	local _addTimer = 1;
	local _sleepTime = 50;--36000 一小時    18000 半小時
	local _boolean = lua_ACuseRealZoneID( _ownerID ); --是否在分流 true 否   false 是
	local _zoneID = ReadRoleValue( _ownerID , EM_RoleValue_ZoneID );
	local _getTimer = 0;
	local _setTimer = 720;
--	local _setTimer = 10;
	local _bool = false;
	DebugMsg(0,0,"_totalTimer="..GetWorldVar( "OneYear_AC_DuplicateTimer" ));	
	
	RunningMsgEx( _ownerID , 2 , 3 , "[SC_AC2_PHASE_3]" ); --跑馬燈 1 = 區域 2 = 所有玩家
	while true do
		Sleep( _sleepTime );
		if GetWorldVar( "OneYear_AC_Type" ) == 3 then
			_totalTimer = GetWorldVar( "OneYear_AC_DuplicateTimer" );
			_timer = GetWorldVar( "OneYear_AC_DuplicateSetTimer" );
			if _timer == ( _totalTimer - 3 ) and _bool then
				RunningMsgEx( _ownerID , 2 , 3 , "[SC_AC2_PHASE_5]" ); --跑馬燈 1 = 區域 2 = 所有玩家
--				_sleepTime = 5;--18000
				_setTimer = 360;
				_addTimer = 0.5;
			elseif _timer > ( _totalTimer - 3 ) and _timer < _totalTimer and _bool then
				RunningMsgEx( _ownerID , 2 , 3 , "[SC_AC2_PHASE_6]" ); --跑馬燈 1 = 區域 2 = 所有玩家
			elseif _timer >= _totalTimer then
				RunningMsgEx( _ownerID , 2 , 3 , "[SC_AC2_PHASE_4]" ); --跑馬燈 1 = 區域 2 = 所有玩家
				Lua_OneYear_DelMonster_NPC();
				Sleep(70);
				Lua_OneYear_Del_NPC();--刪除副本NPC入口 & 傳送玩家
				Sleep(80);
				Lua_OneYear_SetType(1);--設定&開始第一階段狀態 
				break;
			end
--			_timer = _timer + _addTimer;
			if _getTimer ~= _setTimer then
				_getTimer = _getTimer + 1 ;
				_bool = false;
			else
				_getTimer = 0;
				_timer = _timer + _addTimer;
				_bool = true;
			end
			if _boolean then SetWorldVar( "OneYear_AC_DuplicateSetTimer" , _timer ) end;
--			DebugMsg(0,0,"_timer=".._timer);
		else
			break;
		end
	end
end

--副本計時   --副本專用  --108937
function Lua_OneYear_DuplicateSetTimer_DuplicateStart()
--	DebugMsg(0,0,"Lua_OneYear_DuplicateSetTimer_DuplicateStart");
	local _ownerID = OwnerID();
	local _timer;
	local _totalTimer;--副本開啟總時間
	local _sleepTime;

	SetModeEX ( _ownerID , EM_SetModeType_Show , false );
	SetModeEx( _ownerID , EM_SetModeType_Mark , false );--不可點選
	SetModeEx( _ownerID , EM_SetModeType_HideName , false );--不顯示名稱
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , false );--不顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );--不會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , false );--不會移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , false );--不可攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );--不會索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );--無阻擋效果

	--刪除 隱藏 控制器
	--/gm ? pcall Lua_OneYear_DuplicateCtrl_DelObj()
	Lua_OneYear_DuplicateCtrl_DelObj = function( _num )
		if _num == 0 then
			DelObj( _ownerID ); --刪除
		elseif _num == 1 then
			SetModeEX ( _ownerID , EM_SetModeType_Show , false ); --隱藏
		elseif _num == 2 then
			SetModeEX ( _ownerID , EM_SetModeType_Show , true ); --秀出
		end
	end

	while true do
		_totalTimer = GetWorldVar( "OneYear_AC_DuplicateTimer" );
		_timer = GetWorldVar( "OneYear_AC_DuplicateSetTimer" );
		_sleepTime = 600;--600
		if _timer == ( _totalTimer - 3 ) then
			_sleepTime = 18000; --半小時 18000
		elseif _timer > ( _totalTimer - 3 ) and _timer < _totalTimer then
			_sleepTime = 18000; --半小時 18000
		elseif _timer == _totalTimer then
			Lua_OneYear_ChangeZonePlayer( _ownerID );--傳送玩家至Zone 2
			_sleepTime = 50;
		end
--		DebugMsg(0,0,"DuplicateTimer=".._timer);
		Sleep( _sleepTime );
	end
end

--傳送玩家至Zone 2 
function Lua_OneYear_ChangeZonePlayer( _ownerID )
--	DebugMsg(0,0,"_ownerID=".._ownerID);
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _playerNum = SetSearchAllPlayer( _roomID );
	local _current;
	for i = 1 , _playerNum , 1 do
		_current = GetSearchResult();
--		DebugMsg(0,0,"_player=".._current);
		ChangeZone( _current , 2 , 0 , 5138 ,50 ,-3370 , 75 );
	end
end

--讀取 1-->P1  2-->P2
--/gm ? pcall Lua_OneYear_GetZero
function Lua_OneYear_GetZero()
	DebugMsg( 0, 0, "Season="..GetWorldVar( "OneYear_AC_Season" ));
	DebugMsg(0,0,"Stage="..GetWorldVar( "OneYear_AC_Type" ));
	DebugMsg(0,0,"Money="..GetWorldVar( "OneYear_AC_Money"));
	DebugMsg(0,0,"Material="..GetWorldVar( "OneYear_AC_Material"));
	DebugMsg(0,0,"Duplicat="..GetWorldVar( "OneYear_AC_DuplicateSetTimer" ));	
	DebugMsg(0,0,"DuplicatTimer="..GetWorldVar( "OneYear_AC_DuplicateTimer" ));	
end

--歸零  1-->P1  2-->P2
--/gm ? pcall Lua_OneYear_SetZero()
function Lua_OneYear_SetZero( _type )
	if _type == 1 then
		SetWorldVar( "OneYear_AC_Money" , 0 );
	elseif _type == 2 then
		SetWorldVar( "OneYear_AC_Material" , 0 );
	end
end

-------------------------------------------------------------------------------------------------------------
--設定季節 1234
--/gm ? pcall Lua_OneYear_SetSeason(_seasonType)
function Lua_OneYear_SetSeason( _seasonType )
	SetWorldVar( "OneYear_AC_Season" , _seasonType );
end
--/gm ? pcall Lua_OneYear_GetSeason
function Lua_OneYear_GetSeason()
	DebugMsg( 0 , 0 , "Season="..GetWorldVar( "OneYear_AC_Season" ));
end

--設定階段 0123
--/gm ? pcall Lua_OneYear_SetType(_type)
function Lua_OneYear_SetType( _type )
	if _type == 0 then  --設定成初始狀態 --停止
		DebugMsg(0,0,"停止");
		SetWorldVar( "OneYear_AC_Type" , 0 );
		SetWorldVar( "OneYear_AC_Money" , 0 );
		SetWorldVar( "OneYear_AC_Material" , 0 );
		SetWorldVar( "OneYear_AC_DuplicateSetTimer" , 0 ); --副本累計時間歸零	
		Lua_OneYear_Del_NPC();--刪除副本NPC
		Lua_OneYear_DelMonster_NPC();
	elseif _type == 1 then  --設定&開始第一階段狀態 
		DebugMsg(0,0,"第一階段");
		SetWorldVar( "OneYear_AC_Type" , 1 );
		SetWorldVar( "OneYear_AC_Money" , 0 );
		SetWorldVar( "OneYear_AC_Material" , 0 );
		Lua_OneYear_Del_NPC();--刪除副本NPC
		Lua_OneYear_DelMonster_NPC();
		Lua_OneYear_Ctrl_P1_Start();
	elseif _type == 2 then --設定&開始第二階段狀態
		DebugMsg(0,0,"第二階段");
		SetWorldVar( "OneYear_AC_Type" , 2 );
		SetWorldVar( "OneYear_AC_Money" , 200000000 );
		SetWorldVar( "OneYear_AC_Material" , 0 );
		Lua_OneYear_Del_NPC();--刪除副本NPC
		Lua_OneYear_DelMonster_NPC();
		Lua_OneYear_Ctrl_P2_Start();
	elseif _type == 3 then --設定&開始第三階段&副本狀態 
		DebugMsg(0,0,"第三階段&副本");
		SetWorldVar( "OneYear_AC_Type" , 3 );
		SetWorldVar( "OneYear_AC_Money" , 200000000 );
		SetWorldVar( "OneYear_AC_Material" , 20000 );
		Lua_OneYear_Del_NPC();--刪除副本NPC
		Lua_OneYear_DelMonster_NPC();
		Lua_OneYear_Ctrl_Duplicate_Start();
	end
end

--設定副本開啟總時間(小時)
--/gm ? pcall Lua_OneYear_SetDuplicateTimer(_hour)
function Lua_OneYear_SetDuplicateTimer( _hour )
	SetWorldVar( "OneYear_AC_DuplicateTimer" , _hour );
end

--AC2 GM指令物品  243288
--207230   --701868  
--AC_INSTRUCTION_01
function Lua_OneYear_OrderObj()
	DebugMsg(0,0,"指令");
	local _ownerID = OwnerID();

	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0;
	end

	Beginplot( _ownerID ,"Lua_OneYear_OrderObj_Start", 0 )
end
function Lua_OneYear_OrderObj_Start()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);

	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_01]" );
	AddBuff( _ownerID , 501570 , 0 , -1 );
	local _transferSelect = {};
	_transferSelect[0] = { "[AC_INSTRUCTION_02]" }; -- 
	_transferSelect[1] = { "[AC_INSTRUCTION_03]" }; -- 
	_transferSelect[2] = { "[AC_INSTRUCTION_04]" }; -- 
	_transferSelect[3] = { "[AC_INSTRUCTION_05]" }; -- 
	_transferSelect[4] = { "[AC_INSTRUCTION_06]" }; -- 
	_transferSelect[5] = { "[AC_INSTRUCTION_07]" }; -- 
	_transferSelect[6] = { "[AC_INSTRUCTION_08]" }; -- 
	_transferSelect[7] = { "[AC_INSTRUCTION_09]" }; -- 
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
		elseif _dialogStatus == 0 then  --設定季節
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_OneYear_OrderObj_SetSeason", 0 );
			break;
		elseif _dialogStatus == 1 then -- 設定階段
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_OneYear_OrderObj_SetType", 0 );
			break;	
		elseif _dialogStatus == 2 then -- 設定副本時間
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_OneYear_OrderObj_SetDuplicateTimer", 0 );
			break;	
		elseif _dialogStatus == 3 then -- 增加金錢
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_OneYear_OrderObj_PayMoney", 0 );
			break;	
		elseif _dialogStatus == 4 then -- 增加材料
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_OneYear_OrderObj_PayMaterial", 0 );
			break;	
		elseif _dialogStatus == 5 then -- 給5階魔石
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			GiveBodyItem( _ownerID , 202844, 1 ); 
			break;
		elseif _dialogStatus == 6 then -- 給4階符文組合
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Beginplot( _ownerID ,"Lua_OneYear_OrderObj_Rune", 0 );
			break;
		elseif _dialogStatus == 7 then -- 飛活動座標
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			ChangeZone( _ownerID , 2 , 0 , 5058 , 50 , -3697 , 0 ); 
			break;			
		end
	end
end

function Lua_OneYear_OrderObj_SetSeason()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0;
	end
	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_01]" );
	AddBuff( _ownerID , 501570 , 0 , -1 );
	local _transferSelect = {};
	_transferSelect[0] = { "[AC_INSTRUCTION_02_1]"..": 1" }; -- 
	_transferSelect[1] = { "[AC_INSTRUCTION_02_1]"..": 2" }; --
	_transferSelect[2] = { "[AC_INSTRUCTION_02_1]"..": 3" }; --
	_transferSelect[3] = { "[AC_INSTRUCTION_02_1]"..": 4" }; --
	for i = 0, table.getn( _transferSelect ) do
		DialogSelectStr( _ownerID , _transferSelect[i][1] )
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
		elseif _dialogStatus == 0 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_Season" , 1 );
			DesignLog( _ownerID , 108902 , "SetSeason = "..1 ); --紀錄增加log
			break;
		elseif _dialogStatus == 1 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_Season" , 2 );
			DesignLog( _ownerID , 108902 , "SetSeason = "..2 ); --紀錄增加log
			break;
		elseif _dialogStatus == 2 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_Season" , 3 );
			DesignLog( _ownerID , 108902 , "SetSeason = "..3 ); --紀錄增加log
			break;
		elseif _dialogStatus == 3 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_Season" , 4 );
			DesignLog( _ownerID , 108902 , "SetSeason = "..4 ); --紀錄增加log
			break;
		end
	end	
end

function Lua_OneYear_OrderObj_SetType()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0;
	end
	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_01]" );
	AddBuff( _ownerID , 501570 , 0 , -1 );
	local _transferSelect = {};
	_transferSelect[0] = { "[AC_INSTRUCTION_03_2]" }; -- 	
	_transferSelect[1] = { "[AC_INSTRUCTION_03_1]"..": 1" }; --
	_transferSelect[2] = { "[AC_INSTRUCTION_03_1]"..": 2" }; --
	_transferSelect[3] = { "[AC_INSTRUCTION_03_1]"..": 3" }; --
	for i = 0, table.getn( _transferSelect ) do
		DialogSelectStr( _ownerID , _transferSelect[i][1] )
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
		elseif _dialogStatus == 0 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_OneYear_SetType( 0 );
			DesignLog( _ownerID , 108902 , "SetType = "..0 ); --紀錄增加log
			break;
		elseif _dialogStatus == 1 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_OneYear_SetType( 1 );
			DesignLog( _ownerID , 108902 , "SetType = "..1 ); --紀錄增加log
			break;
		elseif _dialogStatus == 2 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_OneYear_SetType( 2 );
			DesignLog( _ownerID , 108902 , "SetType = "..2 ); --紀錄增加log
			break;
		elseif _dialogStatus == 3 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_OneYear_SetType( 3 );
			DesignLog( _ownerID , 108902 , "SetType = "..3 ); --紀錄增加log
			break;
		end
	end		
end

function Lua_OneYear_OrderObj_SetDuplicateTimer()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0;
	end
	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_01]" );
	AddBuff( _ownerID , 501570 , 0 , -1 );
	local _transferSelect = {};
	_transferSelect[0] = { "24".."[SYS_HOUR]" }; -- 
	_transferSelect[1] = { "48".."[SYS_HOUR]" }; --
	_transferSelect[2] = { "72".."[SYS_HOUR]" }; --  
	_transferSelect[3] = { "96".."[SYS_HOUR]" }; -- 	
	_transferSelect[4] = { "120".."[SYS_HOUR]" }; -- 
	_transferSelect[5] = { "144".."[SYS_HOUR]" }; --
	_transferSelect[6] = { "168".."[SYS_HOUR]" }; -- 
	_transferSelect[7] = { "192".."[SYS_HOUR]" }; --
	for i = 0, table.getn( _transferSelect ) do
		DialogSelectStr( _ownerID , _transferSelect[i][1] )
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
		elseif _dialogStatus == 0 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_DuplicateTimer" , 24 );
			DesignLog( _ownerID , 108902 , "SetDuplicateTimer = "..24 ); --紀錄增加log
			break;
		elseif _dialogStatus == 1 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_DuplicateTimer" , 48 );
			DesignLog( _ownerID , 108902 , "SetDuplicateTimer = "..48 ); --紀錄增加log
			break;
		elseif _dialogStatus == 2 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_DuplicateTimer" , 72 );
			DesignLog( _ownerID , 108902 , "SetDuplicateTimer = "..72 ); --紀錄增加log
			break;
		elseif _dialogStatus == 3 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_DuplicateTimer" , 96 );
			DesignLog( _ownerID , 108902 , "SetDuplicateTimer = "..96 ); --紀錄增加log
			break;
		elseif _dialogStatus == 4 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_DuplicateTimer" , 120 );
			DesignLog( _ownerID , 108902 , "SetDuplicateTimer = "..120 ); --紀錄增加log
			break;
		elseif _dialogStatus == 5 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_DuplicateTimer" , 144 );
			DesignLog( _ownerID , 108902 , "SetDuplicateTimer = "..144 ); --紀錄增加log
			break;
		elseif _dialogStatus == 6 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_DuplicateTimer" , 168 );
			DesignLog( _ownerID , 108902 , "SetDuplicateTimer = "..168 ); --紀錄增加log
			break;
		elseif _dialogStatus == 7 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			SetWorldVar( "OneYear_AC_DuplicateTimer" , 192 );
			DesignLog( _ownerID , 108902 , "SetDuplicateTimer = "..192 ); --紀錄增加log
			break;
		end
	end	
end

function Lua_OneYear_OrderObj_PayMoney()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0;
	end
	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_01]" );
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
			Lua_OneYear_P1_PayMoney( 10000 );
			DesignLog( _ownerID , 108902 , "AddMoney = "..10000 ); --紀錄增加金錢log
			break;
		elseif _dialogStatus == 1 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_OneYear_P1_PayMoney( 100000 );
			DesignLog( _ownerID , 108902 , "AddMoney = "..100000 ); --紀錄增加金錢log
			break;
		elseif _dialogStatus == 2 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_OneYear_P1_PayMoney( 1000000 );
			DesignLog( _ownerID , 108902 , "AddMoney = "..1000000 ); --紀錄增加金錢log
			break;
		elseif _dialogStatus == 3 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_OneYear_P1_PayMoney( 10000000 );
			DesignLog( _ownerID , 108902 , "AddMoney = "..10000000 ); --紀錄增加金錢log
			break;
		elseif _dialogStatus == 4 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_OneYear_P1_PayMoney( 100000000 );
			DesignLog( _ownerID , 108902 , "AddMoney = "..100000000 ); --紀錄增加金錢log
			break;
		end
	end	
end

function Lua_OneYear_OrderObj_PayMaterial()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0;
	end
	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_01]" );
	AddBuff( _ownerID , 501570 , 0 , -1 );
	local _transferSelect = {};
	_transferSelect[0] = {  "[AC_INSTRUCTION_10]"..": 1000" }; -- 	
	_transferSelect[1] = {  "[AC_INSTRUCTION_10]"..": 10000" }; --
	_transferSelect[2] = {  "[AC_INSTRUCTION_10]"..": 100000" }; --
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
			Lua_OneYear_P2_PayMaterial( 1000 );
			DesignLog( _ownerID , 108902 , "AddMaterial = "..1000 ); --紀錄增加log
			break;
		elseif _dialogStatus == 1 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_OneYear_P2_PayMaterial( 10000 );
			DesignLog( _ownerID , 108902 , "AddMaterial = "..10000 ); --紀錄增加log
			break;
		elseif _dialogStatus == 2 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			Lua_OneYear_P2_PayMaterial( 100000 );
			DesignLog( _ownerID , 108902 , "AddMaterial = "..100000 ); --紀錄增加log
			break;
		end
	end	
end

function Lua_OneYear_OrderObj_Rune()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID ,EM_RoleValue_RoomID);
	if CheckBuff( _ownerID , 501570) == true then 
		ScriptMessage( _ownerID , _ownerID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return 0;
	end
	DialogCreate( _ownerID , EM_LuaDialogType_Select , "[AC_INSTRUCTION_01]" );
	AddBuff( _ownerID , 501570 , 0 , -1 );
	local _transferSelect = {};
	_transferSelect[0] = { "[AC_INSTRUCTION_08_1]"..": 1" }; -- 	
	_transferSelect[1] = { "[AC_INSTRUCTION_08_1]"..": 2" }; --
	_transferSelect[2] = { "[AC_INSTRUCTION_08_1]"..": 3" }; --
	_transferSelect[3] = { "[AC_INSTRUCTION_08_1]"..": 4" }; --
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
			ac2_test_rune( 1 );
			break;
		elseif _dialogStatus == 1 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			ac2_test_rune( 2 );
			break;
		elseif _dialogStatus == 2 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			ac2_test_rune( 3 );
			break;
		elseif _dialogStatus == 3 then  --
			DialogClose( _ownerID )
			CancelBuff( _ownerID, 501570 );--
			ac2_test_rune( 4 );
			break;
		end
	end		
end
-------------------------------------------------------------------------------------------------------------

function Lua_OneYear_SetPlot_Test()
	SetPlot( OwnerID(), "range" , "Lua_OneYear_SetPlot_Start" , 100 );
end
function Lua_OneYear_SetPlot_Start( _type )
	DebugMsg(0,0,"===============");
	if _type == 1 then
		SetWorldVar( "Z953_TEST_Q425839" , 123 );
	elseif _type == 2 then
		
	end
	DebugMsg(0,0,"Z953_TEST_Q425839="..GetWorldVar( "Z953_TEST_Q425839" ));
end

--/gm ? pcall Lua_OneYear_TestTest
function Lua_OneYear_TestTest( _type )
	DebugMsg(0,0,"-----------------------");
--	SC_BLACKWATER_P3_START_DOOR
	if _type == 1 then
		SetWorldVar( "SC_BLACKWATER_P3_START_DOOR" , 123 );
	end
	DebugMsg(0,0,"SC_BLACKWATER_P3_START_DOOR="..GetWorldVar( "SC_BLACKWATER_P3_START_DOOR" ));	
end

--Buff
--/gm ? pcall Lua_AddBuff_Test()     625608
function Lua_AddBuff_Test( _BuffID )
	DebugMsg(0,0,"_BuffID=".._BuffID);
	AddBuff( OwnerID() , _BuffID ,  0 , -1);
end

--/gm ? pcall Lua_CancelBuff_Test()     625608
function Lua_CancelBuff_Test( _BuffID )
	CancelBuff( OwnerID() , _BuffID );
end

--施法
--/gm ? pcall Lua_OneYear_CastSpell_Test()
function Lua_OneYear_CastSpell_Test( _magicID )
	CastSpell( OwnerID(), OwnerID(), _magicID );
end

--/gm ? pcall Lua_OneYear_Lacation_Test
function Lua_OneYear_Lacation_Test()
	local _ownerID = OwnerID();
	local _x , _y , _z , _dir=DW_Location( _ownerID );
	DebugMsg(0,0,"_x=".._x.."_y=".._y.."_z=".._z);
end

--/gm ? pcall Lua_OneYear_Lacation_TestTestTest
function Lua_OneYear_Lacation_TestTestTest()
	DebugMsg(0,0,"SC_BLACKWATER_P3_TIME = "..GetWorldVar( "SC_BLACKWATER_P3_TIME" ));
end

--/gm ? pcall Lua_OneYear_GiveMoney
function Lua_OneYear_GiveMoney()
	AddSpeicalCoin( OwnerID() , 0 , 0 , 100000 );
end

--/gm ? pcall Lua_OneYear_SetTimer
function Lua_OneYear_SetTimer( _timer )
	SetWorldVar( "OneYear_AC_DuplicateSetTimer" , _timer );
	DebugMsg(0,0,"_timer = "..GetWorldVar( "OneYear_AC_DuplicateSetTimer" ));
end

--123756
function Lua_OneYear_TestTestTestTestTest()
	local _type = GetWorldVar( "OneYear_AC_Type" ) --偵測階段
	if _type == 1 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_AC2_Q1_5]","AC2_Stage_1_quest_npcspeak_4",0) --捐錢選項
	end
end

--/gm ? pcall Lua_OneYear_TestTestTestTestTestTest
function Lua_OneYear_TestTestTestTestTestTest()
	local _x , _y , _z , _dir = 0;
	local _num = 0;
	while true do
		_x , _y , _z , _dir = DW_Location( 781418 , _num );
		if _x == 0 and _y == 0 and _z == 0 and _dir == 0 then
			break;
		else
			DebugMsg(0,0,"_x=".._x.."_y=".._y.."_z=".._z.."_dir=".._dir);
			_num = _num + 1;
		end
	end
end