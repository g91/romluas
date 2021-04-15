--Author : K.J. Aris
--Version : 14.02.12.
--Ignitor : 108897
--NPC : 108814--raid
--Script : 703142

local _Lua_703142_AI_GlobalVars = {};

function Lua_703142_AI_Init( _inputCtrID )--controller  NPC 108897 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703142_AI_Init : NPC 108897       Z33-1B4  V140212 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --以防重複執行 將原有控制器刪除

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108897
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108814
	
	--this NPC is using as a controller
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _ctrlID , EM_SetModeType_HideName , true );	--不顯示名稱
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--無阻擋效果


	-------------------------------------------initialize settings
	local _zoneID = ReadRoleValue( _ctrlID , EM_RoleValue_ZoneID );
	local _difficulty = 1;
	local _frenzyCD = 480;

	if ( _zoneID == 173 ) then
		_difficulty = 2;
		_frenzyCD = 360;
	end

	if ( _zoneID == 174 ) then
		_difficulty = 3;
		_frenzyCD = 9999999;
	end
	
	--請依難易度順序放置
	local _bossGUIDs = { 108814 , 108814 , 108814 };--莫戈瑪古
	local _bossShadowGUIDs = { 108831 , 108831 , 108831 };--莫戈瑪古幻影

	--參數設定表
	_Lua_703142_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_cloneID = 0 ,
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossGUID = _bossGUIDs[ _difficulty ] ,--莫戈瑪古
					_cloneGUID = _bossShadowGUIDs[ _difficulty ] , --莫戈瑪古幻影
					_ctrlGUID = 108705 ,--控制器ID
					_doorGUID = 106246 , 

					_flagGUID = 781407 , --781407 Z33-1_4王用旗標
					_bossFlagPos = 1 , 
					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					ExtObj = nil , 
					DelExtObjs = nil , 
					ShiftTo = nil ,

					_frenzyCD = _frenzyCD ,
					_skillCD = 0 ,
					};
	--唯讀資訊
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];

	--產生 Boss
	--local x,y,z,dir = DW_Location( _gConsts._flagGUID , _gConsts._bossFlagPos );
	Lua_DavisDelObj( _gConsts._bossGUID );--kill reduplicated
	
	local _bossID = CreateObjByFlag( _gConsts._bossGUID , _gConsts._flagGUID , _gConsts._bossFlagPos , 1 );--108800
	--say( _bossID , "["..tostring(_gConsts._bossGUID).."]" )
	_gConsts._bossID = _bossID;--
	AddToPartition( _bossID , _roomID ); 

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false);
	SetModeEx( _bossID , EM_SetModeType_Fight , true );
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true);
	SetModeEx( _bossID , EM_SetModeType_Strikback , true);

	--產生後門
	_gConsts._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	--delete trigger
	DelObj( _ctrlID );

	return _roomID;
end--function Lua_703142_AI_Init( _inputCtrID )

function Lua_703142_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	--Lua_703175_ClearAll( _roomID );
	Lua_703142_AI_Init();
end

function Lua_703142_AI_onFight()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	Cl_Resist_HackersFightBegin( _bossID )
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];
	DebugMsg( 0 , 0 , "--Lua_703142_AI_onFight ".._bossID.." RID : ".._roomID );
	--唯讀資訊
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703142_AI_reignite( _roomID ); return; end

	--控制器與衍伸物件
	local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir , _isVisible )	--衍生物(處理招喚物 或 長出來的東西)
		local x,y,z,dir = DW_Location( _bossID );
		local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
		_AddParasite( _objID );
		_isVisible = _isVisible or true;
		if ( _isVisible == false ) then
			SetModeEx( _objID , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
			SetModeEx( _objID , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
			SetModeEx( _objID , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
			SetModeEx( _objID , EM_SetModeType_Searchenemy , false );   	--索敵
			SetModeEx( _objID , EM_SetModeType_Mark , false );			--標記
			SetModeEx( _objID , EM_SetModeType_Fight , false ); 			--砍殺
			SetModeEx( _objID , EM_SetModeType_Move , false );			--移動
			SetModeEx( _objID , EM_SetModeType_ShowRoleHead , true );
			SetModeEx( _objID , EM_SetModeType_Strikback , false );		--反擊
			SetModeEx( _objID , EM_SetModeType_Show , true );
			DebugMsg( 0 , 0 , "invisible item : ".._objID );
		end
		AddToPartition( _objID , _roomID );
		return _objID;
	end
	
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );

	AddBuff( _bossID , 625621 , 0 , -1 );--虐殺之域	--BOSS辨識BUFF

	--generate front door
	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	--產生 Boss 幻影
	local x,y,z,dir = DW_Location( _bossID );
	local _cloneID = _gConsts.ExtObj( _gConsts._cloneGUID , x,y,z,dir );--108831
	--say( _cloneID , "_cloneID["..tostring(_gConsts._cloneGUID).."]" )
	_gConsts._cloneID = _cloneID;--

	SetModeEx( _cloneID , EM_SetModeType_Obstruct , false);
	SetModeEx( _cloneID , EM_SetModeType_Fight , true );
	SetModeEx( _cloneID , EM_SetModeType_Move , true );
	SetModeEx( _cloneID , EM_SetModeType_Searchenemy , true);
	SetModeEx( _cloneID , EM_SetModeType_Strikback , true);

	AddBuff( _cloneID , 625622 , 0 , -1 );--巫蝕之域

	_gConsts.ShiftTo = Lua_703142_Boss_ShiftProcess_Init( _gConsts._bossID , _gConsts._cloneID );

	BeginPlot( _ctrlID , "Lua_703142_AI_Engage" , 0 );

	ScriptMessage(_bossID,0,2,"[LUA_703142_AI_ONFIGHT]",0);
	--CallPlot( _bossID , "Cl_Resist_HackersFightBegin" );
end--function Lua_703142_AI_onFight()


function Lua_703142_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
	DebugMsg( 0 , 0 , "--Lua_703142_AI_Engage" );
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;--_captainID
	--local _roomID = _gConsts._roomID;
	local _ctrlID = _gConsts._ctrlID;
	local _cloneID = _gConsts._cloneID;

	--Routines Vars
	local _clock = 0;
	local _availableTargetPlayer = nil;--hash list
	local _engaging = true;
	--Routines Vars

	local _timeTick = 1;--Time Speed
	local _miniTimeTick = _timeTick*10;--Time Speed for Sleep

	local _GCD = 5;
	local _CD = {
		}
	-----------------------------------------狂暴參數
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;
	----------------------------END----------狂暴參數

	local _hateListCounter = 0;
	local _bossHpRatio = 0;
	local _cloneHpRatio = 0;
	local _bossHpStepping = 0.95;
	local _cloneHpStepping = 0.95;
	DebugMsg( 0 , 0 , "--Start loop" );

	while true do 
		--------------------clock
		Sleep( _miniTimeTick );
		_clock = _clock + _timeTick;
		--------------END---clock
		--DebugMsg( 0 , 0 , "--Clock : ".._clock );

		--------------------Routines
		--_availableTargetPlayer = LUA_YOYO_RangePlayerNotGM_EX( _bossID , _gConsts._effectiveRange , true ); --抓取自己距離_effectiveRange的存活玩家，排除GM--702774
		--_engaging = #_availableTargetPlayer ~= 0;

		_hateListCounter = HateListCount( _bossID );
		_engaging = _hateListCounter ~= 0;

		--_currentCompletedGameLevel = ReadRoleValue( _bossID , EM_RoleValue_Register1 );
		--------------END---Routines

		-------------------------------------------------戰鬥結束條件
		if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) or
			( CheckID( _cloneID ) == false ) or ( ReadRoleValue( _cloneID , EM_RoleValue_IsDead ) == 1 ) then -- boss 死亡時 挑戰成功
			DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
			Lua_703142_AI_Conquered( _roomID );
			Cl_Resist_HackersBossDead( _bossID )
			break;
		end

		if ( not _engaging ) then--都沒有存活玩家時 任務失敗
			DebugMsg( 0 , 0 , "--quit fight" );
			--Lua_703142_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--清除區域玩家所有相關BUFF
			Lua_703142_AI_Reset( _roomID );
			break;
		end
		-------------------------------------END--------戰鬥結束條件


		-------------------------------------------------Timers
		if ( _GCD > 0 ) then _GCD = _GCD - _timeTick; end

		for _key , _value in pairs( _CD ) do
			--DebugMsg( 0 , 0 , "-- : ".._key.." __ ".. _value );
			if ( _CD[ _key ] > 0 ) then _CD[ _key ] = _value - _timeTick; end
		end
		---------------------------------------END-------Timers

		--狂暴機制
		if ( _clock >= _frenzyCD and (_isFrenzied == false) ) then
				_isFrenzied = true;
				AddBuff( _bossID , 625848 , 0 , -1 );-- 625848 暴君
				DebugMsg( 0 , 0 , "-----狂狂暴----" );
				ScriptMessage(_bossID,0,2,"[LUA_703142_AI_FRENZY]",0);
		end		


		-----------------------------------------------戰鬥階段轉換
		--boss
		_bossHpRatio = ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP );--HP ratio
		if ( _bossHpRatio <= _bossHpStepping ) then--扣血超過15%觸發
			if ( _bossHpStepping > 0 ) then
				_bossHpStepping = _bossHpRatio - 0.15;
				DebugMsg( 0 , 0 , "Boss Next Ratio : ".._bossHpStepping );
				--BeginPlot( _ctrlID , "AI_703110_SwitchToBunkerFight" , 0 );	
				_gConsts.ShiftTo( 2 );--切換至CLONE
			end
		end

		--clone
		_cloneHpRatio = ReadRoleValue( _cloneID , EM_RoleValue_HP )/ReadRoleValue( _cloneID , EM_RoleValue_MaxHP );--HP ratio
		if ( _cloneHpRatio <= _cloneHpStepping ) then--扣血超過15%觸發
			if ( _cloneHpStepping > 0 ) then
				_cloneHpStepping = _cloneHpRatio - 0.15;
				
				--BeginPlot( _ctrlID , "AI_703110_SwitchToBunkerFight" , 0 );	
				--_gConsts.ShiftTo( 1 );--切換至BOSS
				AddBuff( _cloneID , 625629 , 0 , -1 );--851742
				AddBuff( _cloneID , 625634 , 0 , -1 );--觸發851742
				DebugMsg( 0 , 0 , "Clone Next Ratio : ".._cloneHpStepping.." ---Buff : "..tostring( CheckBuff( _cloneID , 625634 ) ) );
			end
		end

		if ( CheckBuff( _cloneID , 625634 ) == true and CheckBuff( _cloneID , 625629 ) == false ) then--當無棄靈之鎧則切回BOSS
			DebugMsg( 0 , 0 , "--無棄靈之鎧 : 轉回1" );
			CancelBuff_NoEvent( _cloneID , 625634 );--625634
			_gConsts.ShiftTo( 1 );--切換至BOSS
		end
		-------------------------------------END-----戰鬥階段轉換
	
		--技能 機制
		for i = 1 , 1 , 1 do--switch case simulation	--模擬 switch case 
			if ( _GCD > 0 ) then break; end	--當GCD鎖住時不執行	--GCD用來防止招式被吃掉


			--[[
			if( _CD._timer2 <= 0 )then
				DebugMsg( 0 , 0 , "--_timer2 release" );
				_CD._timer2 = 15;
				_GCD = 2;
			end

			if( _CD._timer3 <= 0 )then
				DebugMsg( 0 , 0 , "--_timer3 release" );
				_CD._timer3 = 20;
				_GCD = 2;
			end

			if( _CD._timer4 <= 0 )then
				DebugMsg( 0 , 0 , "--_timer4 release" );
				_CD._timer4 = 25;
				_GCD = 2;
			end
			]]--
			
		end


	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703142_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703142_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703142_AI_Reset" );

	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];
	
	local _bossID = _gConsts._bossID;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703142_AI_RESET]",0);
	DW_UnFight( _bossID , true );

	Delobj( _frontDoorID );	--刪除前門
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 20 );

	DelFromPartition( _bossID );

	Sleep( 50 );

	DW_UnFight( _bossID , false );
	SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos );
	AddToPartition( _bossID , _roomID );
	SetModeEx( _bossID , EM_SetModeType_Show , true );--hide other gears
	SetModeEx( _bossID , EM_SetModeType_Fight , true );--hide other gears
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );--hide other gears
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );--hide other gears
	MagicInterrupt( _bossID );----終止施法	木頭人

end--function Lua_703142_AI_Reset( _roomID )

function Lua_703142_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703142_AI_Conquered" );
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];--for read

	if( _gConsts == nil ) then return; end
	Delobj( _gConsts._frontDoorID );	--刪除前門
	Delobj( _gConsts._backDoorID );	--刪除後門

	sasa_ZoneDungeon_title_01(530998 ) --Z33-1 尾王 巨魔之巢 

	ScriptMessage(_gConsts._bossID,0,2,"[$MUTE]".."[LUA_703142_AI_CONQUERED]",0);	
	
	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703142_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	--Cl_Resist_HackersBossDead();
end--function Lua_703142_AI_Conquered( _roomID )

-----------------------------------sub functions


function Lua_703142_NPC_BossClone_Init( )
	DebugMsg( 0 , 0 , "--Lua_703142_NPC_BossClone_Init" );
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];--for read
	local _bossID = _gConsts._bossID;
	
	CallPlot( _ownerID , "Lua_703142_NPC_BossClone_SyncPos" , _bossID );

end

function Lua_703142_NPC_BossClone_SyncPos( _bossID )
	DebugMsg( 0 , 0 , "--Lua_703142_NPC_BossClone_SyncPos" );
	local _ownerID = OwnerID();	

	local x,y,z,dir = 0;
	--while ( true ) do
		x,y,z,dir = DW_Location( _bossID );
		SetPos( _ownerID , x,y,z,dir );
		--Sleep( 10 );
	--end
	
end

function Lua_703142_NPC_BossClone_Disable()
	DebugMsg( 0 , 0 , "--Lua_703142_NPC_BossClone_Disable" );
	local _ownerID = OwnerID();
	
end

------------------------------------------------------------------------------------------------------------切換分身
function Lua_703142_Boss_ShiftProcess_Init( _bossID , _cloneID )
	DebugMsg( 0 , 0 , "--Lua_703142_Boss_ShiftProcess_Init" );
	local _gears = { _bossID , _cloneID };
	local _currentGear = 2;--1 = Boss Status , 2 = Clone Status
	
	--sync pos
	local x,y,z,dir = DW_Location( _bossID );
	SetPos( _cloneID , x,y,z,dir );

	local function ShiftTo( _gearIndex )
		if ( _currentGear ~= _gearIndex and _gearIndex <= #_gears ) then--act only when asignment is different from now , plus available 
			local _activeGear = false;
			local _oldGearID = _gears[ _currentGear ];
			MagicInterrupt( _oldGearID );----中斷BOSS任何動作好接續切換
			_currentGear = _gearIndex;--shift record

			
			for _index , _currentTargetID in pairs( _gears ) do
				_activeGear = false;
				MagicInterrupt( _currentTargetID );----中斷其他NPC任何動作好接續切換
				--SetModeEx( _currentTargetID , EM_SetModeType_DiableAIProc , true );
				AddBuff( _currentTargetID , 625623 , 0 , -1 );--木頭人
				CastSpell(  _currentTargetID , _currentTargetID , 851737 );--木頭人
				if ( _index == _gearIndex ) then --show new gear
					_activeGear = true;
					--_currentTargetID do something
					--active
					CancelBuff( _currentTargetID , 625623 );--木頭人
					MagicInterrupt( _currentTargetID );----木頭人

					--sync pos
					x,y,z,dir = DW_Location( _oldGearID );
					SetPos( _currentTargetID , x,y,z,dir );
					
					--SetModeEx( _currentTargetID , EM_SetModeType_DiableAIProc , false );
				end
				
				SetModeEx( _currentTargetID , EM_SetModeType_Show , _activeGear );--hide other gears
				SetModeEx( _currentTargetID , EM_SetModeType_Fight , _activeGear );--hide other gears
				SetModeEx( _currentTargetID , EM_SetModeType_Searchenemy , _activeGear );--hide other gears
				SetModeEx( _currentTargetID , EM_SetModeType_Strikback , _activeGear );--hide other gears
				--SetModeEx( _currentTargetID , EM_SetModeType_Gravity , _activeGear );--hide other gears
				SetModeEx( _currentTargetID , EM_SetModeType_Move , _activeGear );--hide other gears
				--SetModeEx( _currentTargetID , EM_SetModeType_DisableAction , _activeGear );--hide other gears
				
				WriteRoleValue( _currentTargetID , EM_RoleValue_Register1 , _currentGear );	--1 = Boss Status , 2 = Clone Status
			end
			--BeginPlot( _oldGearID , "Lua_703142_SetPosToAir" , 15 );

		end
	end--function ShiftTo
	--ShiftTo( 2 );
	ShiftTo( 1 );

	return ShiftTo;
end

function Lua_703142_SetPosToAir()
	local _ownerID = OwnerID();
	DebugMsg( 0 , 0 , "--Lua_703142_SetPosToAir : ".._ownerID );
	local x,y,z,dir = DW_Location( _ownerID );
	SetPos( _ownerID , x, y + 100 ,z,dir );
end

---for test
function Lua_703142_ShiftTest()
	DebugMsg( 0 , 0 , "--Lua_703142_ShiftTest" );
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];--for read

	_Lua_703142_AI_GlobalVars[ _roomID ].ShiftTo = Lua_703142_Boss_ShiftProcess_Init( _gConsts._bossID , _gConsts._cloneID );
end

function Lua_703142_Shift2()
	DebugMsg( 0 , 0 , "--Lua_703142_Shift2 : " );
	local _gear = 2;
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];--for read

	_gConsts.ShiftTo( _gear );

end

function Lua_703142_Shift1()
	DebugMsg( 0 , 0 , "--Lua_703142_Shift1 : " );
	local _gear = 1;
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];--for read

	_gConsts.ShiftTo( _gear );

end
---------------------------------------------------------------------------------------------end------------切換分身

------------------------------------------------------------晶體暴發
function Lua_703142_Item_CrystalExplore()
	DebugMsg( 0 , 0 , "--Lua_703142_Item_CrystalExplore : " );
end
-------------------------------------------END-----------晶體暴發


-------------------------------------------------------------------------------閃現術
function Lua_703142_Skill_FlashMove()
	local _ownerID = OwnerID();
	DebugMsg( 0 , 0 , "--Lua_703142_Skill_FlashMove : ".._ownerID );
	local x,y,z,dir = DW_Location( _ownerID );
	x = x + ( RandRange( 1 , 300 ) - 150 );
	z = z + ( RandRange( 1 , 300 ) - 150 );
	SetPos( _ownerID , x,y,z,dir );

	return true
end
--------------------------------------------------------------END-----------閃現術

-------------------------------------------------------------------------------幻影晶體
function Lua_703142_NPC_IllusionCrystal_Init()--108995
	local _ownerID = OwnerID();
	DebugMsg( 0 , 0 , "--Lua_703142_NPC_IllusionCrystal_Init : ".._ownerID );
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , false );		--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--有阻擋效果
	--AddBuff( _ownerID , 625631 , 0 , -1 );--625631幻影晶體隱形BUFF --觸發851751晶體爆發
end

function Lua_703142_NPC_IllusionCrystal_Dead()--108995
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	--local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];--for read
	DebugMsg( 0 , 0 , "--Lua_703142_NPC_IllusionCrystal_Dead : ".._ownerID );
	local _cloneGUID = ReadRoleValue( _ownerID , EM_RoleValue_OrgID );
	local x,y,z,dir = DW_Location( _ownerID );
	
	--_gConsts.ExtObj( _cloneGUID , x,y,z,dir );
	_ownerID = CreateObj( _cloneGUID , x,y,z,dir , 1 );
	AddToPartition( _ownerID , _roomID );

	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , false );	--顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , false );		--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , false );	--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--有阻擋效果

	WriteRoleValue( _ownerID , EM_RoleValue_LiveTime , 1 );
	CastSpell( _ownerID , _ownerID , 851746 );--851746晶體爆發
end

function Lua_703142_NPC_IllusionCrystal_MagicLinkToTarget( _crystalID , _targetID , _effectSpellGUID , _spellGUID )--108995
	local _ownerID = _crystalID or OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];--for read
	DebugMsg( 0 , 0 , "--Lua_703142_NPC_IllusionCrystal_MagicLinkToTarget : ".._ownerID );
	local x,y,z,dir = DW_Location( _ownerID );
	--local _cloneID = _gConsts.ExtObj( 103573 , x,y,z,dir );--103573特效透明球
	local _cloneID = CreateObj( 103573 , x,y,z,dir , 1 );--103573特效透明球
	AddToPartition( _cloneID , _roomID );
	SetModeEx( _cloneID , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
	SetModeEx( _cloneID , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
	SetModeEx( _cloneID , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
	SetModeEx( _cloneID , EM_SetModeType_Searchenemy , false );   	--索敵
	SetModeEx( _cloneID , EM_SetModeType_Mark , false );			--標記
	SetModeEx( _cloneID , EM_SetModeType_Fight , false ); 			--砍殺
	SetModeEx( _cloneID , EM_SetModeType_Move , false );			--移動
	SetModeEx( _cloneID , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( _cloneID , EM_SetModeType_Strikback , false );		--反擊
	SetModeEx( _cloneID , EM_SetModeType_Show , true );

	CallPlot( _cloneID , "Lua_703142_NPC_DieWithMaster" , _ownerID , _targetID , _spellGUID );
	--local _spellGUID = 851754;--急速鍊殺
	CastSpell( _cloneID , _targetID , _effectSpellGUID );--特效法術
	CastSpell( _targetID , _cloneID , _effectSpellGUID );--特效法術
	

end

function Lua_703142_NPC_DieWithMaster(master , _targetID , _spellGUID , _effectSpellGUID  )
--衍生物規則
	DebugMsg( 0 , 0 , OwnerID().."--Lua_703142_NPC_DieWithMaster : "..master );
	while true do
		sleep(10);
		if(CheckID(master)==false)or(ReadRoleValue(master,EM_RoleValue_IsDead)==1)then
			DelObj(OwnerID());
			DebugMsg( 0 , 0 , "--Lua_703142_NPC_DieWithMaster : "..master );
			return;
		end
		--CastSpell( _cloneID , _targetID , _effectSpellGUID );--特效法術
		--SysCastSpellLv( OwnerID() , _targetID , _spellGUID , 0 );--傷害法術
		SysCastSpellLv( _targetID , OwnerID() , _spellGUID , 0 );--傷害法術
		--SysCastSpellLv( _targetID , OwnerID() , _effectSpellGUID , 0 );--傷害法術--傷害法術
	end
end
--------------------------------------------------------------END-----------幻影晶體

-------------------------------------------------------------------------------揀選者
function Lua_703142_NPC_Chosens_Init()--108996
	local _ownerID = OwnerID();
	DebugMsg( 0 , 0 , "--Lua_703142_NPC_Chosens_Init : ".._ownerID );
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , true );		--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--有阻擋效果
	WriteRoleValue( _ownerID , EM_RoleValue_IsWalk , 1 );--走路吧

	AddBuff( _ownerID , 625636 , 0 , -1 );--625636反傷
	CallPlot( _ownerID , "Lua_703142_NPC_Chosens_WalkAround" );
	CallPlot( _ownerID , "Lua_703142_NPC_Chosens_StallDown" );

	local _effectSpellGUID = 851755;--急速鍊殺特效
	local _spellGUID = 851754;--急速鍊殺
	local _crystalIDs = SearchRangeNPC( _ownerID , 500 );--108995幻影晶體
	local _crystalID = 0;
	local x,y,z,dir = 0;
	DebugMsg( 0 , 0 , "--s : "..#_crystalIDs );
	for _i , _npcID in pairs( _crystalIDs ) do
		_crystalID = _npcID;
		DebugMsg( 0 , 0 , "-- : ".._crystalID );
		if ( ReadRoleValue( _crystalID , EM_RoleValue_OrgID ) == 108995 ) then--108995幻影晶體
			x,y,z,dir = DW_Location( _crystalID );
			DebugMsg( 0 , 0 , "--Link Target : ".._crystalID );
			--CastSpell( _crystalID , _ownerID , _effectSpellGUID );--特效法術
			--CallPlot( _crystalID , "Lua_703142_NPC_IllusionCrystal_MagicLinkToTarget" , _ownerID , _effectSpellGUID );
			Lua_703142_NPC_IllusionCrystal_MagicLinkToTarget( _crystalID , _ownerID , _effectSpellGUID , _spellGUID );
			--SysCastSpellLv( _ownerID , _crystalID , _spellGUID , 0 );--傷害法術
			--CastSpell( _ownerID , _crystalID , _spellGUID );--特效法術
			--SysCastSpellLv_Pos( _ownerID , x,y,z, _spellGUID , 0 );--傷害法術
			break;
		end
	end

end

function Lua_703142_NPC_Chosens_CastSpell( _chosenID , _crystalID )
	DebugMsg( 0 , 0 , "--Lua_703142_NPC_Chosens_CastSpell" );
end


function Lua_703142_NPC_Chosens_WalkAround()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703142_NPC_Chosens_WalkAround : ".._ownerID );
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];--for read
	local _changeDirTime = 0;

	local _flagGUID = _gConsts._flagGUID;
	local _flagPos = 0;--RandRange( 1 , 10 );
	local x,y,z,dir = 0;

	while ( true ) do
		_flagPos = RandRange( 1 , 10 );
		x,y,z,dir = DW_Location( _flagGUID , _flagPos );
		--x = x + ( RandRange( 1 , 300 ) - 150 );
		--z = z + ( RandRange( 1 , 300 ) - 150 );
		_changeDirTime = LuaFunc_WaitMoveTo( _ownerID , x , y , z );
		LuaFunc_MoveToFlag( _ownerID , _flagGUID , _flagPos , 30 );
		Sleep( _changeDirTime );
	end
end

function Lua_703142_NPC_Chosens_StallDown()
	local _ownerID = OwnerID();
	local _spellGUID = 851747;--851747範圍緩速
	DebugMsg( 0 , 0 , "--Lua_703142_NPC_Chosens_StallDown : ".._ownerID );
	while true do
		SysCastSpellLv( _ownerID , _ownerID , _spellGUID , 0 );
		Sleep( 10 );
	end
end
--------------------------------------------------------------END-----------揀選者

------------------------------------------------------------------------------招喚水晶與揀選者
function Lua_703142_AI_SummonCrystalAndChosens()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703142_AI_GlobalVars[ _roomID ];--for read
	DebugMsg( 0 , 0 , "--Lua_703142_AI_SummonCrystalAndChosens : ".._ownerID );

	local _summonList = { 108995 , 108995 , 108996 , 108996 , 108996 };--108995幻影晶體 --108996揀選者

	local _flagGUID = _gConsts._flagGUID;
	local _flagPos = 0;
	local x,y,z,dir = 0;
	for _index , _guid in pairs( _summonList ) do
		_flagPos = DW_Rand( 10 );
		x,y,z,dir = DW_Location( _flagGUID , _flagPos );
		_gConsts.ExtObj( _guid , x,y,z,dir );
		
	end
end
-----------------------------------------------------------END-------------招喚水晶與揀選者