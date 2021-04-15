--Author : K.J. Aris
--Version : 140528
--Ignitor : NPC 109084
--Script : 703175

_Lua_703175_AI_GlobalVars = nil;

function Lua_703175_AI_Init( _inputCtrID )--controller  NPC 109084 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703175_AI_Init : NPC 109084       Z34  V 140528 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --以防重複執行 將原有控制器刪除

	--basics
	local _ctrlID = _inputCtrID or OwnerID() or 0;--109084
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

	if ( _zoneID == 179 ) then
		_difficulty = 2;
		_frenzyCD = 360;
	end

	if ( _zoneID == 180 ) then
		_difficulty = 3;
		_frenzyCD = 9999999;
	end
	---------------------------------------

	----------------------------END----------狂暴參數
	--請依難易度順序放置
	local _bossDomisourceGUIDs = { 109015 , 109147 , 109151 };--支配原體
		--該王所招喚的小隊請參照 ServerScript  703183
	--local _treasureBoxGUIDs = { 108832 , 108833 , 108834 };--議會私藏品

	--參數設定表
	if ( _Lua_703175_AI_GlobalVars == nil ) then _Lua_703175_AI_GlobalVars = {}; end
	_Lua_703175_AI_GlobalVars[ _roomID ] = {	--non 
					_bossID = 0 ,--以_Ice做代表( 讓其他函式好找 _bossID)

					_bossVOs = {
						_Domisource = {
							_id = 0 ,					--ID
							_guid = _bossDomisourceGUIDs[ _difficulty ] ,		--GUID
							_flagPos = 1 , 					--旗標位置

							--_defaultIdle = nil;--ruFUSION_MIME_EMOTE_STRETCH;--預設動作
							IndiSpec = nil ,	--function個別的特殊流程
							} , 
						},

					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_ctrlGUID = 108705 ,--控制器ID
					_doorGUID = 106246 , 
					--_treasureBoxGUID = _treasureBoxGUIDs[ _difficulty ] ,--議會私藏品

					_flagGUID = 781423 , --781423 Z34_1王用旗標

					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					--squads
					_squads = nil ,
					CreateSquad = nil ,

					--_bossReviveCD = 20 , 
					};
	--唯讀資訊
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];

	--產生 Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703175_GenerateBoss( _bossVO , _roomID );
		_gConsts._bossVOs[_bossName]._id = _bossID;--
	end
	_gConsts._bossID = _gConsts._bossVOs._Domisource._id;--presiding Boss --Domisource
	--Lua_703175_BossIndividualsSetting( _gConsts );

	--產生後門
	_gConsts._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	--delete trigger
	DelObj( _ctrlID );
		
	return _roomID;
end--function Lua_703175_AI_Init( _inputCtrID )

function Lua_703175_GenerateBoss( _bossVO , _roomID )
	Lua_DavisDelObj( _bossVO._guid );
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];
	local _bossID = CreateObjByFlag( _bossVO._guid , _gConsts._flagGUID , _bossVO._flagPos , 1 );
	AddToPartition( _bossID , _roomID ); 

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false );
	SetModeEx( _bossID , EM_SetModeType_Fight , false );--支配原體一開始無法被攻擊但會不斷施放技能。
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );

	--[[
	if ( _bossVO._defaultIdle ~= nil ) then
		SetDefIdleMotion( _bossID , _bossVO._defaultIdle );--預設動作
	end
	]]--

	return _bossID;
end--function Lua_703175_GenerateBoss( _bossVO )

function Lua_703175_ClearAll( _specRoomID )--for test
	if ( _Lua_703175_AI_GlobalVars ~= nil ) then
		DebugMsg( 0 , 0 , "--Lua_703175_ClearAll : all values will be cleared , reinit this by redeploying NPC 109084" );--
		local function ClearData( _valuePack )
			if ( _valuePack.DelExtObjs ~= nil ) then
				_valuePack.DelExtObjs();
			end

			for _bossName , _bossVO in pairs( _valuePack._bossVOs ) do
				DelObj( _bossVO._id );
			end

			DelObj( _valuePack._ctrlID );
			DelObj( _valuePack._frontDoorID );
			DelObj( _valuePack._backDoorID );
		end

		if ( _specRoomID ~= nil ) then
			local _valuePack = _Lua_703175_AI_GlobalVars[ _specRoomID ];
			if ( _valuePack ~= nil ) then
				ClearData( _valuePack );
			end
			_Lua_703175_AI_GlobalVars[ _specRoomID ] = nil;
			return;
		end

		for _roomID , _valuePack in pairs( _Lua_703175_AI_GlobalVars ) do
			ClearData( _valuePack );
			_Lua_703175_AI_GlobalVars[ _roomID ] = nil;
		end
	end
	Lua_703183_ClearAll( _specRoomID );--順便清除小隊的數值
end--function Lua_703175_ClearAll()

function Lua_703175_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703175_ClearAll( _roomID );
	Lua_703175_AI_Init();
end


function Lua_703175_AI_onFight()--當有多隻王時 只放在其中一隻身上  模板請設"群組"
	--戰鬥初始
	local _bossID = OwnerID();--_Domisource
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703175_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703175_AI_GlobalVars == nil ) then Lua_703175_AI_reignite( _roomID ); return; end

	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then Lua_703175_AI_reignite( _roomID ); return; end

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--當上一次循環的控制器還在作動時則不動作  (防止_Ice重生時重複觸發戰鬥)
		DebugMsg( 0 , _roomID , "--Combat Sequence Duplicated : New Sequence Rejected !!" );--presiding boss may revived or rejoin the fight while combat is not over yet
		return;
	end
	--控制器與衍伸物件
	local _ctrlID , _AddParasite , _RemoveParasites = Lua_703182_ExtendObjectClosure( _bossID );

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
	
	WriteRoleValue( _ctrlID , EM_RoleValue_Register1 , 1 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );
	--唯讀資訊
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	--squads
	local _squads , CreateSquad = Lua_703183_SquadCreater( _gConsts._bossVOs._Domisource._id );
	_gConsts._squads = _squads;
	_gConsts.CreateSquad = CreateSquad;

	--men counter
	WriteRoleValue( _bossID , EM_RoleValue_Register10 , 0 );--紀錄場上小怪數量

	BeginPlot( _ctrlID , "Lua_703175_AI_Engage" , 0 );--啟動戰鬥流程

	ScriptMessage(_bossID,0,2,"[Lua_703175_AI_OnFight]",0);

end--function Lua_703175_AI_onFight()

function Lua_703175_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
	DebugMsg( 0 , _roomID , "--Lua_703175_AI_Engage" );
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;--_gConsts._bossID;--single boss
	local _bossVOs = _gConsts._bossVOs;--
	local _ctrlID = _gConsts._ctrlID;
	
	--squads
	local _squads = _gConsts._squads;
	local CreateSquad = _gConsts.CreateSquad;

	--counter
	local _headCounter = 0;--ReadRoleValue( _bossID , EM_RoleValue_Register10 );--紀錄場上小怪數量

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

	local _GCD = 0;
	local _CD = {--boss revive CD     --locked when start , unlocked when specific boss is dead by writing its relevant value  
		--_timer2 = 0 ,
		}

	-----------------------------------------階段轉換
	local _bossHpRatio = 0;
	local _phaseTransformPeriodRatio = 0.599;--HP每損耗60%轉換階段
	local _hpStepping = 1.0 - _phaseTransformPeriodRatio;--下一階段轉換比例
	local _currentPhase = 1;
	----------------------------END----------階段轉換

	--local _alivePlayers = 0;
	local _currentBossID = 0;

	DebugMsg( 0 , 0 , "--Start loop" );

	while true do 
		--------------------clock
		Sleep( _miniTimeTick );
		_clock = _clock + _timeTick;
		--DebugMsg( 0 , 0 , "--Clock : ".._clock );
		--------------END---clock
		
		--------------------Routines
		_headCounter = ReadRoleValue( _bossID , EM_RoleValue_Register10 );--紀錄場上小怪數量
		--------------END---Routines

		-------------------------------------------------戰鬥結束條件
		_allBossAreDead = true;--假設所有BOSS皆陣亡
		_engaging = false;--假設所有BOSS都脫離戰鬥
		for _bossName , _bossVO in pairs( _bossVOs ) do--檢查Boss有沒有通通活蹦亂跳
			_currentBossID = _bossVO._id;
			if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 ) then--當有任一BOSS存活時 代表還未全死
				_allBossAreDead = false;
				if ( _bossVO.IndiSpec ~= nil ) then _bossVO.IndiSpec( _bossVO , _clock ); end--趁還活著的時候  順便執行個別的特殊流程
				if( ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) ~= 0 ) then--當有任一BOSS仍在戰鬥 代表還有玩家存活 
					--DebugMsg(0,0,_currentBossID.." 正在追殺玩家 : "..ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) );
					_engaging = true;--無法解決Ice不鎖敵的問題
				end	
			else
				--[[
				--DebugMsg( 0 , 0 , "------dead boss : ".._bossName );
				--有BOSS死了  順便設定亡者復活CD
				if ( _CD[_bossName] <= -1 ) then
					DebugMsg( 0 , _roomID , "------boss dead , set revive : ".._bossName );
					--_CD[_bossName] = _gConsts._bossReviveCD;	--共存不息  沒全部死乾淨 則設定亡者復活CD	
				end
				]]--
			end
		end
		
		--DebugMsg(0,0,"--_allBossAreDead : "..tostring(_allBossAreDead).."   --_engaging : "..tostring(_engaging) );
		if ( _allBossAreDead == true ) then-- boss 全部死亡時 挑戰成功
			DebugMsg( 0 , _roomID , "------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703175_AI_Conquered( _roomID );
			break;
		end

		if ( not _engaging ) then--都沒有存活玩家時 任務失敗
			--[[
			local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 300 , true );--確認周遭存活玩家  --因為Ice不索敵
			if ( #_rangePlayers <= 0 ) then
				DebugMsg( 0 , _roomID , "--all players are gone , quit fighting "..tostring(_engaging) );
				--Lua_703175_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--清除區域玩家所有相關BUFF
				Lua_703175_AI_Reset( _roomID );
				break;
			end
			]]--
			Lua_703175_AI_Reset( _roomID );
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
		if ( _clock >= _frenzyCD and ( _isFrenzied == false ) ) then
				_isFrenzied = true;
				for _bossName , _bossVO in pairs( _bossVOs ) do--檢查Boss有沒有通通活蹦亂跳
					_currentBossID = _bossVO._id;
					AddBuff( _currentBossID , 625849 , 0 , -1 );-- 625849 神棄
				end
				DebugMsg( 0 , _roomID , "-----狂狂暴----" );
				ScriptMessage(_bossID,0,2,"[Lua_703175_AI_Frenzy]",0);
		end		
	

		-----------------------------------------------戰鬥階段轉換
		_bossHpRatio = ReadRoleValue( _currentBossID , EM_RoleValue_HP )/ReadRoleValue( _currentBossID , EM_RoleValue_MaxHP );--HP ratio
		if ( _bossHpRatio <= _hpStepping ) then--扣血超過60%觸發
			if ( _hpStepping > 0 ) then
				_hpStepping = _hpStepping - _phaseTransformPeriodRatio;--next transform ratio
				
				_currentPhase = _currentPhase + 1;
				--WriteRoleValue( _bossID , EM_RoleValue_Register1 , _currentPhase );
				--DebugMsg( 0 , 0 , "Switch to Phase : ".._currentPhase.."  , PhaseBuff : ".._currentPhaseBuffGUID.."  , Next Ratio : ".._hpStepping );
				DebugMsg( 0 , 0 , "Switch to Phase : ".._currentPhase.."  , Next Ratio : ".._hpStepping );
				SetModeEx( _currentBossID , EM_SetModeType_Fight , true );--支配原體一開始無法被攻擊但會不斷施放技能。
				AddBuff( _currentBossID , 625913 , 0 , -1 );--625913第二階段
			end
		end
		-------------------------------------END-----戰鬥階段轉換


		if ( _headCounter >= 10 ) then--當場上小怪數量大於10時
			SysCastSpellLv( _bossID , _bossID , 852018 , 0 );--全體傷害
			DebugMsg( 0 , _roomID , "soldier over 10" );
			ScriptMessage( _bossID , 0 , 2 , "[Lua_703175_AI_OverTen]" , 0 );
		end

		--技能 機制
		for i = 1 , 1 , 1 do--switch case simulation	--模擬 switch case 
			if ( _GCD > 0 ) then break; end	--當GCD鎖住時不執行	--GCD用來防止招式被吃掉
			
			--[[
			for _bossName , _cdTime in pairs( _CD ) do--Boss重生	共存不息
				if ( _cdTime == 0 ) then
					_gConsts._bossVOs[_bossName]._id = Lua_703175_GenerateBoss( _bossVOs[_bossName] , _roomID );--重生對應的BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703175_AI_HasRevived]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--重生倒數提示	每10秒
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703175_AI_WillReviveIn10sec]" , 0 );
				end
			
			end
			]]--

			--[[
			if( _CD._timer2 == 0 )then
				DebugMsg( 0 , 0 , "--_timer2 release" );
				CreateSquad();
				_CD._timer2 = _gConsts._bossReviveCD;--_gConsts._bossReviveCD;
				_GCD = 2;
			end
			]]--
			
			
		end--for --switch case simulation

	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
end--function Lua_703175_AI_Engage()


function Lua_703175_AI_Phase2()--for test
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;

	local _maxHP = ReadRoleValue( _bossID , EM_RoleValue_MaxHP );
	--local _currentHP = ReadRoleValue( _bossID , EM_RoleValue_HP );
	WriteRoleValue( _bossID , EM_RoleValue_HP , _maxHP*0.4 );
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703175_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703175_AI_Reset" );

	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];
	
	local _bossVOs = _gConsts._bossVOs;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中
	ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703175_AI_Reset]",0);

	Delobj( _frontDoorID );	--刪除前門
	_gConsts.DelExtObjs();--clear all extend items
	Lua_703183_ClearAll( _roomID );
	Lua_703175_AI_DeleteConstObj();

	Sleep( 10 );
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--關閉戰鬥
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , true );
		DelObj( _bossID );
	end
	Sleep( 10 );
	
	--_Lua_703175_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	for _bossName , _bossVO in pairs( _bossVOs ) do--開啟戰鬥
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703175_GenerateBoss( _bossVO , _roomID );--重生對應的BOSS
	end
	_gConsts._bossID = _gConsts._bossVOs._Domisource._id;--presiding Boss --Domisource
	--Lua_703175_BossIndividualsSetting( _gConsts );
	--SetDefIdleMotion( _gConsts._bossVOs._Ice._id , ruFUSION_MIME_EMOTE_CRY );--讓Ice哭

end--function Lua_703175_AI_Reset( _roomID )

function Lua_703175_AI_Conquered( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703175_AI_Conquered" );
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];--for read
	
	if ( _gConsts == nil ) then return; end
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中

	Delobj( _gConsts._frontDoorID );	--刪除前門
	Delobj( _gConsts._backDoorID );	--刪除後門

	Lua_703175_AI_DeleteConstObj();
	ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703175_AI_Conquered]",0);	
	
	Lua_703175_AI_KillAllSquads( _gConsts._squads );

	_gConsts.DelExtObjs();	--clear all extend items
	_Lua_703175_AI_GlobalVars[ _roomID ] = nil;	--clear all values
end--function Lua_703175_AI_Conquered( _roomID )

function Lua_703175_AI_Dead()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];

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
	DebugMsg( 0 , 0 , "--Lua_703175_AI_Dead : "..tostring( _allBossAreDead ) );

	if ( _allBossAreDead ) then
		Lua_703175_AI_Conquered( _roomID );
	end

	return true;
end


-----------------------------------sub functions
function Lua_703175_AI_KillAllSquads( _squads )
	for _squadNum , _squadVO in pairs( _squads ) do
		for _creatureName , _creatureVO in pairs( _squadVO ) do
			KillID( _creatureVO._id , _creatureVO._id );
		end
	end
end

function Lua_703175_AI_DeleteConstObj()
	Lua_DavisDelObj( 109144 );--109144火坑
	Lua_DavisDelObj( 109146 );--109146火焰
	Lua_DavisDelObj( 109145 );--109145絕冰
end

------------------------------------------------------------------------------------------以下是技能
function Lua_703175_Skill_SummonSoldiers()
	DebugMsg( 0 , 0 , "--Lua_703175_Skill_SummonSoldiers" );
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _summonFunction = _Lua_703175_AI_GlobalVars[ _roomID ].CreateSquad;
	_summonFunction();
	return;
end



function Lua_703175_Skill_ControlWave()--控制電波
	DebugMsg( 0 , 0 , "--Lua_703175_Skill_ControlWave" );
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	DebugMsg( 0 , 0 , "--Lua_703175_Skill_ControlWave" );
	ScriptMessage( _ownerID,0,2,GetName( _ownerID ).."[Lua_703175_Skill_ControlWave]"..GetName( _targetID ) ,0 );--支配原體 的控制電波打到 XXX
	Sleep( 15 );
	SysCastSpellLv( _ownerID , _targetID , 851913 , 0 );--851913控制電波傷害
	CancelBuff_NoEvent( _targetID , 625917 );--完全體
	return true
end

function Lua_703175_Skill_Laserwave()--雷射電波
	local _ownerID = OwnerID();--boss
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	--local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];
	DebugMsg( 0 , 0 , "--Lua_703175_Skill_Laserwave" );
	local x,y,z,dir = DW_Location( _ownerID );

	local _maxLine = 4;
	local _x,_z = 0;
	for _i = 1 , _maxLine , 1 do
		_x = x + ( RandRange( 1 , 600 ) - 300 );
		_z = z + ( RandRange( 1 , 600 ) - 300 );
		local _dummyID = Lua_703175_CreateClone( _roomID , _x,y,_z,dir , 1 );
		SysCastSpellLv( _ownerID , _dummyID , 851927 , 0 );--851913雷射電波傷害
	end
	
	return true;
end

function Lua_703175_Skill_Laserwave_Hit()--雷射電波 擊中
	local _ownerID = OwnerID();--boss
	local _targetID = TargetID();--victim
	DebugMsg( 0 , 0 , "--Lua_703175_Skill_Laserwave_Hit" );
	--local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location( _ownerID );

	SetPos( _targetID , x,y,z,dir );
	return true;
end


function  Lua_703175_CreateClone( _roomID , x,y,z,dir , _liveTime )--分身
	--local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
	--local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];

	--local _bossID = _gConsts._bossID;

	local _cloneID = 108653;--_Lua_703126_AI_GlobalConsts[ _roomID ]._cloneGUID;

	--local x,y,z,dir = DW_Location( _bossID );
	
	_cloneID = CreateObj( _cloneID , x , y , z , dir , 1 );
	--_Lua_703126_AI_GlobalVars[ _roomID ].ExtObj( _cloneID );

	SetModeEx( _cloneID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _cloneID , EM_SetModeType_HideName , true );	--不顯示名稱
	SetModeEx( _cloneID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _cloneID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _cloneID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _cloneID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _cloneID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _cloneID , EM_SetModeType_Obstruct , false );	--無阻擋效果
	SetModeEx( _cloneID , EM_SetModeType_Gravity , false );
	--SetModeEx( _cloneID , EM_SetModeType_Show , false );	
	WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , _liveTime or 20 );

	--AddBuff( _cloneID , 507899 , 1 , 100 );--不可物理攻擊
	AddToPartition( _cloneID , _roomID );
	
	DebugMsg( 0 , 0 , "--Lua_703175_CreateClone : ".._cloneID );

	return _cloneID;
end