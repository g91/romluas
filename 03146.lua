--Author : K.J. Aris
--Version : 14.02.25.
--Ignitor : 108908
--NPC : 108908--raid
--Script : 703146

local _Lua_703146_AI_GlobalVars = {};

function Lua_703146_AI_Init( _inputCtrID )--controller  NPC 108908 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703146_AI_Init : NPC 108908       Z33-2B1  V140225 " );

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108908
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108814
	
	--this NPC is using as a controller
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _ctrlID , EM_SetModeType_HideName , false );	--不顯示名稱
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--無阻擋效果

	-------------------------------------------initialize settings
	local _zoneID = ReadRoleValue( _ctrlID , EM_RoleValue_ZoneID );

	local _difficulty = 1;
	local _frenzyCD = 480;--狂暴參數

	if ( _zoneID == 176 ) then
		_difficulty = 2;
		_frenzyCD = 360;
	end

	if ( _zoneID == 177 ) then
		_difficulty = 3;
		_frenzyCD = 9999999;
	end
	---------------------------------------

	----------------------------END----------狂暴參數
	--請依難易度順序放置
	local _bossKokarGUIDs = { 108818 , 103761 , 103765 };--勾卡爾
	local _bossTonaGUIDs = { 108819 , 103762 , 103766 };--托納
	local _bossMarlocGUIDs = { 108820 , 103763 , 103767 };--瑪洛克
	local _bossSchulizeGUIDs = { 108821 , 103764 , 103768 };--敘萊絲

	local _treasureBoxGUIDs = { 108832 , 108833 , 108834 };--議會私藏品

	--參數設定表
	_Lua_703146_AI_GlobalVars[ _roomID ] = {	--non 
					_bossID = 0 ,--以_Schulize做代表( 讓其他函式好找 _bossID)

					_bossVOs = {
						_Kokar = {
							_id = 0 ,					--ID
							_guid = _bossKokarGUIDs[ _difficulty ] ,		--GUID
							_flagPos = 1 , 					--旗標位置
							_name = "[108818]" ,	--顯示用名稱

							_defaultIdle = nil;--ruFUSION_MIME_EMOTE_STRETCH;--預設動作
							_debuffs = {};--記錄每隻王的負面狀態   方便技能清除(處以極刑)
							IndiSpec = Lua_703146_AI_IndividualSpec_Kokar,	--function個別的特殊流程
							} , 

						_Tona = {
							_id = 0 ,
							_guid = _bossTonaGUIDs[ _difficulty ] ,
							_flagPos = 3 , 
							_name = "[108819]" ,	--顯示用名稱

							_defaultIdle = nil;--ruFUSION_MIME_EMOTE_CUTE2;--預設動作
							_debuffs = { 625537 };--625537正常送客禮儀
							IndiSpec = Lua_703146_AI_IndividualSpec_Tona,--function個別的特殊流程
							} , 

						_Marloc = {
							_id = 0 ,
							_guid = _bossMarlocGUIDs[ _difficulty ] ,
							_flagPos = 2 , 
							_name = "[108820]" ,	--顯示用名稱

							_defaultIdle = nil;--ruFUSION_MIME_EMOTE_LAUGH;--預設動作
							_debuffs = { 625554 ,  };--625554仇敵印記 , 625640憎恨之印
							IndiSpec = Lua_703146_AI_IndividualSpec_Marloc,--function個別的特殊流程
							} , 

						_Schulize = {
							_id = 0 ,
							_guid = _bossSchulizeGUIDs[ _difficulty ] ,
							_flagPos = 4 , 
							_name = "[108821]" ,	--顯示用名稱

							_defaultIdle = ruFUSION_MIME_EMOTE_CRY;--預設動作
							_debuffs = { 625540 };--625540哀鳴嘆息
							IndiSpec = Lua_703146_AI_IndividualSpec_Schulize,--function個別的特殊流程
							} 
						},

					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_ctrlGUID = 108705 ,--控制器ID
					_doorGUID = 106012 , 
					_treasureBoxGUID = _treasureBoxGUIDs[ _difficulty ] ,--議會私藏品

					_flagGUID = 781415 , --781415 Z33-2_1王用旗標

					_frontDoorFlagPos = 5 , 
					_backDoorFlagPos = 6 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					_bossReviveCD = 45 ,

					};
	--唯讀資訊
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];

	--產生 Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703146_GenerateBoss( _bossVO , _roomID );
		_gConsts._bossVOs[_bossName]._id = _bossID;--
	end
	_gConsts._bossID = _gConsts._bossVOs._Kokar._id;--presiding Boss --Kokar
	--Lua_703146_BossIndividualsSetting( _gConsts );

	--產生後門
	_gConsts._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	--delete trigger
	DelObj( _ctrlID );
		
	return _roomID;
end--function Lua_703146_AI_Init( _inputCtrID )

function Lua_703146_GenerateBoss( _bossVO , _roomID )
	Lua_DavisDelObj( _bossVO._guid );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	local _bossID = CreateObjByFlag( _bossVO._guid , _gConsts._flagGUID , _bossVO._flagPos , 1 );
	AddToPartition( _bossID , _roomID ); 

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false );
	SetModeEx( _bossID , EM_SetModeType_Fight , true );
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );

	if ( _bossVO._defaultIdle ~= nil ) then
		SetDefIdleMotion( _bossID , _bossVO._defaultIdle );--預設動作
	end

	return _bossID;
end--function Lua_703146_GenerateBoss( _bossVO )

function Lua_703146_KokarInitSetting()--on NPC 108818
	local _ownerID = OwnerID();
	Cl_Resist_HackersBossNum( _ownerID );--防駭客機制
	AddBuff( _ownerID , 625549 , 0 , -1 );--鎖MP SP回復
	WriteRoleValue( _ownerID , EM_RoleValue_MaxMP , 100 );
	WriteRoleValue( _ownerID , EM_RoleValue_MP , 0 );--SP歸0
end

function Lua_703146_ShulizeInitSetting()--on NPC 108821
	local _ownerID = OwnerID();
	WriteRoleValue( _ownerID , EM_RoleValue_Register1 , 0 );--憂傷獨步移動次數計數 每移動3次會施放「哀鳴嘆息」
	WriteRoleValue( _ownerID , EM_RoleValue_IsWalk , 1 );--一率為走路模式
	AddBuff( _ownerID , 623976 , 0 , -1 );--敘萊絲慢慢走
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--反擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Move , true );
end

function Lua_703146_ClearAll()--for test
	DebugMsg( 0 , 0 , "--Lua_703146_ClearAll : all values will be cleared , reinit this by redeploying NPC 108908" );--
	if ( _Lua_703146_AI_GlobalVars ~= nil ) then
		for _roomID , _valuePack in pairs( _Lua_703146_AI_GlobalVars ) do
			if ( _valuePack.DelExtObjs ~= nil ) then
				_valuePack.DelExtObjs();
			end

			for _bossName , _bossVO in pairs( _valuePack._bossVOs ) do
				DelObj( _bossVO._id );
			end
			DelObj( _valuePack._ctrlID );
			DelObj( _valuePack._frontDoorID );
			DelObj( _valuePack._backDoorID );
			_Lua_703146_AI_GlobalVars[ _roomID ] = nil;
		end
	end
end--function Lua_703146_ClearAll()

function Lua_703146_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703146_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703146_ClearAll();
	Lua_703146_AI_Init();
end

function Lua_703146_AI_onFight()--放在_Kokar身上
	--戰鬥初始
	local _bossID = OwnerID();--_Kokar
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	Cl_Resist_HackersFightBegin( _ownerID );--防駭客機制
	DebugMsg( 0 , 0 , "--Lua_703146_AI_onFight ".._bossID.." RID : ".._roomID );
	
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703146_AI_reignite( _roomID ); return; end

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--當上一次循環的控制器還在作動時則不動作  (防止_Schulize重生時重複觸發戰鬥)
		DebugMsg( 0 , _roomID , "--Combat Sequence Duplicated : New Sequence Rejected !!" );--presiding boss may revived or rejoin the fight while combat is not over yet
		return;
	end
	--控制器與衍伸物件
	local _ctrlID , _AddParasite , _RemoveParasites = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--衍生物(處理招喚物 或 長出來的東西)
		local x,y,z,dir = DW_Location( _bossID );
		local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
		_AddParasite( _objID );
		AddToPartition( _objID , _roomID );
		return _objID;
	end
	
	WriteRoleValue( _ctrlID , EM_RoleValue_Register1 , 1 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );
	--唯讀資訊
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703146_AI_Engage" , 0 );--啟動戰鬥流程

	ScriptMessage( _bossID , -1 , 2 , "[LUA_703146_AI_ONFIGHT]" , 0 );
	
end--function Lua_703146_AI_onFight()

function Lua_703146_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
	DebugMsg( 0 , _roomID , "--Lua_703146_AI_Engage" );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._ctrlID;--_gConsts._bossID;--take ctrl as boss , because there's no guarantee that presiding Boss is always alive
	local _bossVOs = _gConsts._bossVOs;--there's 4 bosses in there
	local _ctrlID = _gConsts._ctrlID;
	
	--Routines Vars
	local _clock = 0;
	--local _availableTargetPlayer = nil;--hash list
	local _engaging = true;
	local _allBossAreDead = false;
	--Routines Vars
		--Lua_RandomPlayerFromHateList
	
	local _timeTick = 1;--Time Speed
	local _miniTimeTick = _timeTick*10;--Time Speed for Sleep
	--local _GCD = 0;--int

	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;

	local _GCD = 5;
	local _CD = {--boss revive CD     --locked when start , unlocked when specific boss is dead by writing its relevant value  
		_Kokar = -1 ,	--_gConsts._bossReviveCD
		_Tona = -1 ,	
		_Marloc = -1 ,	
		_Schulize = -1 ,	
		}

	--local _alivePlayers = 0;
	local _currentBossID = 0;

	DebugMsg( 0 , 0 , "--Start loop" );

	while true do 
		--------------------clock
		Sleep( _miniTimeTick );
		_clock = _clock + _timeTick;
		--DebugMsg( 0 , 0 , "--Clock : ".._clock );
		--------------END---clock
		

		-------------------------------------------------戰鬥結束條件
		_allBossAreDead = true;--假設所有BOSS皆陣亡
		_engaging = false;--假設所有BOSS都脫離戰鬥
		for _bossName , _bossVO in pairs( _bossVOs ) do--檢查Boss有沒有通通活蹦亂跳
			_currentBossID = _bossVO._id;
			if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 ) then--當有任一BOSS存活時 代表還未全死
				_allBossAreDead = false;
				_bossVO.IndiSpec( _bossVO , _clock );--趁還活著的時候  順便執行個別的特殊流程
				if( ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) ~= 0 ) then--當有任一BOSS仍在戰鬥 代表還有玩家存活 
					_engaging = true;--無法解決Schulize不鎖敵的問題
				end	
			else
				--有BOSS死了  順便設定亡者復活CD
				if ( _CD[_bossName] <= -1 ) then
					DebugMsg( 0 , _roomID , "------boss dead , set revive : ".._bossName );
					_CD[_bossName] = _gConsts._bossReviveCD;	--共存不息  沒全部死乾淨 則設定亡者復活CD	
				end
			end
		end
		
		if ( _allBossAreDead == true ) then-- boss 全部死亡時 挑戰成功
			DebugMsg( 0 , _roomID , "------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703146_AI_Conquered( _roomID );
			break;
		end

		if ( not _engaging ) then--都沒有存活玩家時 任務失敗

			local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 300 , true );--確認周遭存活玩家  --因為Schulize不索敵
			if ( #_rangePlayers <= 0 ) then
				DebugMsg( 0 , _roomID , "--all players are gone , quit fighting "..tostring(_engaging) );
				--Lua_703146_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--清除區域玩家所有相關BUFF
				Lua_703146_AI_Reset( _roomID );
				break;
			end

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
				for _bossName , _bossVO in pairs( _bossVOs ) do--檢查Boss有沒有通通活蹦亂跳
					_currentBossID = _bossVO._id;
					AddBuff( _currentBossID , 625849 , 0 , -1 );-- 625849 神棄
				end
				DebugMsg( 0 , _roomID , "-----狂狂暴----" );
				ScriptMessage( _bossID , -1 , 2 , "[LUA_703146_AI_FRENZY]" , 0 );
		end		
	
		--技能 機制
		for i = 1 , 1 , 1 do--switch case simulation	--模擬 switch case 
			if ( _GCD > 0 ) then break; end	--當GCD鎖住時不執行	--GCD用來防止招式被吃掉
			
			for _bossName , _cdTime in pairs( _CD ) do--Boss重生	共存不息

				
				if ( _cdTime == 0 ) then
					_gConsts._bossVOs[_bossName]._id = Lua_703146_GenerateBoss( _bossVOs[_bossName] , _roomID );--重生對應的BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					ScriptMessage( _bossID , -1 , 2 , _gConsts._bossVOs[_bossName]._name.."[LUA_703146_AI_HASREVIVED]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--重生倒數提示	每10秒
					ScriptMessage( _bossID , -1 , 2 , _gConsts._bossVOs[_bossName]._name.."[LUA_703146_AI_WILLREVIVEIN10SEC]" , 0 );
				end
			
			end
			
		end--for --switch case simulation

	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
end--function Lua_703146_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703146_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703146_AI_Reset" );

	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	
	local _bossVOs = _gConsts._bossVOs;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中
	ScriptMessage( _gConsts._ctrlID , -1 , 2 , "[$MUTE]".."[LUA_703146_AI_RESET]" , 0 );

	Delobj( _frontDoorID );	--刪除前門
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 10 );
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--關閉戰鬥
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , true );
		DelObj( _bossID );
	end
	Sleep( 10 );
	
	--_Lua_703146_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	for _bossName , _bossVO in pairs( _bossVOs ) do--開啟戰鬥
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703146_GenerateBoss( _bossVO , _roomID );--重生對應的BOSS
	end
	_gConsts._bossID = _gConsts._bossVOs._Kokar._id;--presiding Boss --Kokar

end--function Lua_703146_AI_Reset( _roomID )

function Lua_703146_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703146_AI_Conquered" );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];--for read
	
	if( _gConsts == nil ) then return; end
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中

	Delobj( _gConsts._frontDoorID );	--刪除前門
	Delobj( _gConsts._backDoorID );	--刪除後門

	ScriptMessage( _gConsts._ctrlID , -1 , 2 , "[$MUTE]".."[LUA_703146_AI_CONQUERED]" , 0 );	
	
	--寶箱
	local x,y,z,dir = DW_Location( _gConsts._ctrlID );
	local _loot  = WY_Create_an_obj( _gConsts._treasureBoxGUID , x,y,z,dir );

	SetModeEx( _loot , EM_SetModeType_ShowRoleHead , false );
	
	SetModeEx( _loot , EM_SetModeType_Mark , true );	--不可點選
	SetModeEx( _loot , EM_SetModeType_HideName , true );	--不顯示名稱
	SetModeEx( _loot , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _loot , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _loot , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _loot , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _loot , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _loot , EM_SetModeType_Obstruct , true );	--有阻擋效果

	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703146_AI_GlobalVars[ _roomID ] = nil;	--clear all values
end--function Lua_703146_AI_Conquered( _roomID )

function Lua_703146_AI_Dead()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	Cl_Resist_HackersBossDead( _ownerID );--防駭客機制

	if ( _gConsts == nil ) then return; end
	KillID( _ownerID , _ownerID );

	local _bossVOs = _gConsts._bossVOs;
	local _allBossAreDead = true;
	local _currentBossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--檢查Boss有沒有通通活蹦亂跳
		_currentBossID = _bossVO._id;
		if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 and _currentBossID ~= _ownerID ) then--當有任一BOSS存活時 代表還未全死
			_allBossAreDead = false;
		end
	end
	DebugMsg( 0 , 0 , "--Lua_703146_AI_Dead : "..tostring( _allBossAreDead ) );

	if ( _allBossAreDead ) then
		Lua_703146_AI_Conquered( _roomID );
	end
	return true;
end
-----------------------------------sub functions

------------------------------------------------------------------------------------------------個別王的特殊處理程序	在MAINLOOP執行時被掃描
function Lua_703146_AI_IndividualSpec_Kokar( _bossKokarVO , _clock )--_Kokar
	local _bossID = _bossKokarVO._id;
	local _spRatio = ReadRoleValue( _bossID , EM_RoleValue_MP )/ReadRoleValue( _bossID , EM_RoleValue_MaxMP );
	--當精力值超過50%，攻擊力將得到提升。
	if ( _spRatio >= 0.5  ) then
		AddBuff( _bossID , 625543 , 0 , -1 );--625543施虐狂喜
	else
		CancelBuff( _bossID , 625543 );--625543施虐狂喜
	end

	--當精力值超過100% 施展 處以極刑--851882處以極刑
	if ( _spRatio >= 1.0  ) then
		AddBuff( _bossID , 625550 , 0 , -1 );--625550處以極刑施放印記
		return;
	end

	--殘忍王儲敕令 --範圍75碼內沒有任何目標，則會指定隨機玩家，並將其強制移動到勾卡爾的前方，同時定身10秒。
	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 75 , true );
	if( #_rangePlayerList <= 0 ) then
		AddBuff( _bossID , 625551 , 0 , -1 );--625551殘忍王儲敕令施放印記
		return
	end
end

function Lua_703146_AI_IndividualSpec_Tona( _bossTonaVO , _clock )--_Tona
	local _bossID = _bossTonaVO._id;
	SysCastSpellLv( _bossID , _bossID , 851877 , 0 );--851877皇室忠犬
end

function Lua_703146_AI_IndividualSpec_Marloc( _bossMarlocVO , _clock )--_Marloc
	local _bossID = _bossMarlocVO._id;

	if ( _clock%7 == 0 ) then
		SysCastSpellLv( _bossID , _bossID , 851887 , 0 );--851887憎恨之印
		SysCastSpellLv( _bossID , _bossID , 851888 , 0 );--851888憎恨之印( 傷害 )
	
		return;
	end

	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 75 , true );
	if( #_rangePlayerList <= 0 ) then--如果近戰範圍75碼內沒有任何目標，則會給予傷害。
		SysCastSpellLv( _bossID , _bossID , 851884 , 0 );--851884墮落皇族敕令
		return;
	end	
end

function Lua_703146_AI_IndividualSpec_Schulize( _bossSchulizeVO , _clock )--_Schulize
	local _bossID = _bossSchulizeVO._id;

	SysCastSpellLv( _bossID , _bossID , 851874 , 0 );--851874竭心靈光
		
	if ( _clock%11 == 0 ) then --憂傷獨步
		CallPlot( _bossID , "Lua_703146_Skill_WalkAlone_Walker" , _bossID );
	end
end
---------------------------------------------------------------------END------------------------個別王的特殊處理程序	在MAINLOOP執行時被掃描


------------------------------------------------------------------------------------------以下是技能

------------------------------------------------------------------------------------------Marloc
function Lua_703146_Skill_HateMark()
	local _ownerID = TargetID();--受害者
	local _thisBuffGUID = 625640;--625640憎恨之印
	local _transBuffGUID = 625554;--625554仇敵印記	

	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffGUID );
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_HateMark :".._ownerID.."  BLV : ".._currentBuffLv );
	if ( _currentBuffLv >= 4 and CheckBuff( _ownerID , _transBuffGUID ) == false ) then
		
		CancelBuff_NoEvent( _ownerID , _thisBuffGUID );
		AddBuff( _ownerID , _transBuffGUID , 0 , -1 );--仇敵印記
		DebugMsg( 0 , 0 , "----Lua_703146_Skill_HateMark : 轉化為仇敵印記 : ".._ownerID );
		return false;
	elseif ( CheckBuff( _ownerID , _transBuffGUID ) == true ) then
		return false;
	end

	return true;
end

function Lua_703146_Skill_ShatterMyEnemy()--盡滅我敵
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	local _transBuffGUID = 625554;--625554仇敵印記	
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_ShatterMyEnemy : 盡滅我敵 :".._ownerID.."    : ".._targetID );
	CancelBuff_NoEvent( _targetID , _transBuffGUID );--受到傷害後清除仇敵印記
end
-----------------------------------------------------------------------END----------------Marloc

-------------------------------------------------------------------------------------------Kokar
function Lua_703146_Skill_Execution()--851882處以極刑	--625545
	local _ownerID = OwnerID();--Kokar
	local _targetID = TargetID();--受害者
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_Execution : 處以極刑 :".._ownerID.."    : ".._targetID );
	--法術傷害，並且清除掉玩家身上所有其他亡靈議會成員所施放的負面效果（仇敵印記、憎恨之印、正常送客禮儀、哀鳴嘆息），施放完這招之後精力值歸0。
	CancelBuff( _ownerID , 625550 );--625550處以極刑施放印記
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	local _bossVOs = _gConsts._bossVOs;

	local _currentBuffs = nil;--table
	for _bossName , _bossVO in pairs( _bossVOs ) do--消除其他亡靈議會成員所施放的負面效果
		_currentBuffs = _bossVO._debuffs;
		for _index , _buffGUID in pairs( _currentBuffs ) do
			CancelBuff( _targetID , _buffGUID );
		end
	end
	WriteRoleValue( _ownerID , EM_RoleValue_MP , 0 );--Kokar  SP歸0
	ScriptMessage( _ownerID , -1 , 2 , "[LUA_703146_AI_KOKAR_EXECUTION]" , 0 );--
end

function Lua_703146_Skill_BrutalHit()--851881殘虐打擊	--625547	--物理傷害，每傷害一個玩家，可以讓勾卡爾獲得10精力。
	local _ownerID = OwnerID();--Kokar
	local _targetID = TargetID();--受害者
	local _currentSP = ReadRoleValue( _ownerID , EM_RoleValue_MP );
	_currentSP = _currentSP + ReadRoleValue( _ownerID , EM_RoleValue_MaxMP )*0.1;
	WriteRoleValue( _ownerID , EM_RoleValue_MP , _currentSP );
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_BrutalHit : ".._ownerID.."    : ".._targetID.."  SP : ".._currentSP );
end

function Lua_703146_Skill_Amnesty()--851880殘忍王儲敕令	--625548殘忍王儲敕令
	--如果近戰範圍75碼內沒有任何目標，則會指定隨機玩家，並將其強制移動到勾卡爾的前方，同時定身10秒。
	local _ownerID = OwnerID();--Kokar
	local _targetID = TargetID();--受害者
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_Amnesty : 殘忍王儲敕令 : ".._ownerID.."    : ".._targetID );
	CancelBuff( _ownerID , 625551 );--625551殘忍王儲敕令施放印記
end
-------------------------------------------------------------------------------END---------Kokar

------------------------------------------------------------------------------------------Schulize
function Lua_703146_AI_CryingQueen_OnFight() --Schulize進入戰鬥
	local _ownerID = OwnerID();
	DebugMsg( 0 , 0 , "----Lua_703146_AI_CryingQueen_OnFight : ".._ownerID );
	WriteRoleValue( _ownerID , EM_RoleValue_Register1 , 0 );--憂傷獨步移動次數計數 每移動3次會施放「哀鳴嘆息」
	AddBuff( _ownerID , 625552 , 0 , -1 );
	SetDefIdleMotion( _ownerID , ruFUSION_MIME_EMOTE_CRY );--讓Schulize預設哭泣動作
end

function Lua_703146_Skill_WalkAlone() 
	--朝著隨機玩家位置走去，會在移動到該位置之後停下，或是開始移動之後2秒停下，每移動3次會施放「哀鳴嘆息」。
	local _ownerID = OwnerID();--Schulize
	local _targetID = TargetID();--受害者
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_WalkAlone : ".._ownerID );
		
	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 500 , true );--擴大搜尋範圍
	local _targetList = Lua_703146_RandomFromList( _rangePlayerList , 1 );
	
	CallPlot( _ownerID , "Lua_703146_Skill_WalkAlone_Walker" , _ownerID , _targetID );
	return;
end

function Lua_703146_Skill_WalkAlone_Walker( _ownerID , _targetID ) 
	--移動動作
	local _targetID = _targetID or Lua_703146_RandomFromList( LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 500 , true ) , 1 )[ 1 ];

	if ( _targetID == nil ) then
		return;--沒有目標就不處理   以免跑到奇怪的地方去
	end

	DebugMsg( 0 , 0 , "----Lua_703146_Skill_WalkAlone_Walker : ".._ownerID.."  :  ".._targetID );	

	local _currentStep = ReadRoleValue( _ownerID , EM_RoleValue_Register1 );
	local x,y,z,dir = DW_Location( _targetID );
	--x = x + ( RandRange( 1 , 200 ) - 100 );
	--x = z + ( RandRange( 1 , 200 ) - 100 );
	
	local _waitMiniSec = Move( _ownerID , x,y,z );

	_currentStep = _currentStep + 1;
	WriteRoleValue( _ownerID , EM_RoleValue_Register1 , _currentStep );--紀錄步數

	local _stopOrNot = RandRange( 1 , 1000 );
 	if ( _stopOrNot < 500 ) then
		Sleep( RandRange( 20 , 30 ) );--2~3秒後停下
		StopMove( _ownerID , false );--終止移動
	else
		Sleep( _waitMiniSec );--等待移動
		StopMove( _ownerID , true );--終止移動
	end

	if ( _currentStep >= 3 ) then--每移動3次會施放「哀鳴嘆息」。
		CastSpell( _ownerID , _ownerID , 851875 );--施放哀鳴嘆息
		Say( _ownerID , "[SC_112212_6]" );--嘆氣
		_currentStep = 0;--歸零
		WriteRoleValue( _ownerID , EM_RoleValue_Register1 , _currentStep );--寫回0
		DebugMsg( 0 , 0 , "----Lua_703146_Skill_WalkAlone : ".."Schulize is crying so hard......" );
	else
		DebugMsg( 0 , 0 , "----Lua_703146_Skill_WalkAlone : ".."Schulize is still crying......" );
	end
	
	
	return;
end
------------------------------------------------------------------------------END---------Schulize

--function LUA_YOYO_RangePlayerNotGM_EX( CenterID , Range , DeathPreclude )
--function Lua_RandomPlayerFromHateList(BossID,HowMuch,AntiTank) --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦

--------------------------------------------------------------------------------------------Tona
function Lua_703146_Skill_OrdinaryGreeting()--正常接待禮儀施放
	DebugMsg( 0 , 0 , "--Lua_703146_Skill_OrdinaryGreeting" );
	local _ownerID = OwnerID();--Tona
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	local _bossVOs = _gConsts._bossVOs;

	local _guestList = {};
	
	local _myEnemyNumber = HateListCount( _ownerID );
	local _currentGuests = Lua_RandomPlayerFromHateList( _ownerID , _myEnemyNumber , true );
	
	local _maxGreeting = 1;--每次招呼的目標數量上限

	local _currentBossID = 0;
	local _tankExclude = false;
	local _myEnemyNumber = 0;
	local _currentGuests = nil;
	for _bossName , _bossVO in pairs( _bossVOs ) do--檢查所有Boss的仇恨列表
		_currentBossID = _bossVO._id;
		_tankExclude = ( _currentBossID == _bossVOs._Marloc._id or _currentBossID == _bossVOs._Kokar._id );--排除瑪洛克和勾卡爾的坦
		_myEnemyNumber = HateListCount( _currentBossID );--確認目標的貴賓人數
		_currentGuests = Lua_RandomPlayerFromHateList( _currentBossID , _myEnemyNumber , _tankExclude );--確認貴賓清單
		_guestList = Lua_703146_TableMerge( _guestList , _currentGuests , 1 );--合併 並 排除重複內容
	end

	_currentGuests = Lua_703146_RandomFromList( _guestList , _maxGreeting );--

	for _index , _playerID in pairs( _currentGuests ) do
		--正常接待禮儀
		--會先宣告，之後3秒閃現到該玩家的旁邊給予傷害，同時鎖定對象持續10秒，結束後給予正常送客禮儀。
		AddBuff( _playerID , 625517 , 0 , -1 );--正常接待禮儀標記
		ScriptMessage( _ownerID , _playerID , 2 , "[LUA_703146_AI_TONA_GREETING]" , 0 );--稍後，托納正準備招待您......
		CallPlot( _ownerID , "Lua_703146_Skill_OrdinaryTreating" , _ownerID , _playerID );	
		break;
	end

end

function Lua_703146_Skill_OrdinaryTreating( _ownerID , _targetID )--正常接待禮儀
	--閃現到該玩家的旁邊給予傷害，同時鎖定對象持續10秒，結束後給予正常送客禮儀。
	Sleep( 30 );
	DebugMsg( 0 , 0 , "--Lua_703146_Skill_OrdinaryTreating : ".._ownerID.."  : ".._targetID );
	CancelBuff( _targetID , 625517 );--正常接待禮儀標記
	CastSpell( _ownerID , _targetID , 851883 );--正常接待禮儀
	AddBuff( _ownerID , 623363 , 0 , 10 );--正常接待禮儀（不吃仇恨）
	SetAttack( _ownerID , _targetID );--鎖定貴賓
	WriteRoleValue( _ownerID , EM_RoleValue_Register1 , _targetID );--紀錄接待目標
	return;
end

function Lua_703146_Skill_OrdinaryFarewell()
	local _ownerID = OwnerID();--Tona
	local _targetID = ReadRoleValue( _ownerID , EM_RoleValue_Register1 );--接待時紀錄的目標
	SysCastSpellLv( _ownerID , _targetID , 851756 , 0 );--正常送客禮儀（給予DOT）
	DebugMsg( 0 , 0 , "--Lua_703146_Skill_OrdinaryFarewell : ".._targetID.." Bye ~" );
	WriteRoleValue( _ownerID , EM_RoleValue_Register1 , 0 );--清除接待目標
end
---------------------------------------------------------------------END------------------Tona

---------------------------------------------------------------------------------------------public functions
function Lua_703146_TableMerge( _oriTable , _extTable , _duplicateCheck )
	--_duplicateCheck = 0 : 不處理   , = 1 : 排除重複內容( 回傳index表 )    = 2 : 排除重複內容( 回傳hash表 ) 	--只能處理簡單資料型別 String Number
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

function Lua_703146_RandomFromList( _table , _maxNumber )
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