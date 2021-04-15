--Author : K.J. Aris
--Version : 140528
--Ignitor : NPC 109086
--Script : 703177

local _Lua_703177_AI_GlobalVars = nil;

function Lua_703177_AI_Init( _inputCtrID )--controller  NPC 109086 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703177_AI_Init : NPC 109086       Z34  V 140528 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --以防重複執行 將原有控制器刪除

	--basics
	local _ctrlID = _inputCtrID or OwnerID() or 0;--109086
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
	local _bossZernatineGUIDs = { 109017 , 109165 , 109170 };--瑟娜汀
	local _corruptedEnergyGUIDs = { 109156 , 109166 , 109171 };--腐化能量
		--幻象請參考 Server Script 703187

	--local _treasureBoxGUIDs = { 108832 , 108833 , 108834 };--議會私藏品

	--參數設定表
	if ( _Lua_703177_AI_GlobalVars == nil ) then _Lua_703177_AI_GlobalVars = {}; end
	_Lua_703177_AI_GlobalVars[ _roomID ] = {	--non 
					_bossID = 0 ,--以_Schulize做代表( 讓其他函式好找 _bossID)

					_bossVOs = {
						_Zernatine = {
							_id = 0 ,					--ID
							_guid = _bossZernatineGUIDs[ _difficulty ] ,		--GUID
							_flagPos = 1 , 					--旗標位置

							--_defaultIdle = nil;--ruFUSION_MIME_EMOTE_STRETCH;--預設動作
							IndiSpec = nil ,	--function個別的特殊流程
							} , 
						},

					_corruptedEnergyGUID = _corruptedEnergyGUIDs[ _difficulty ] ,

					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_ctrlGUID = 108705 ,--控制器ID
					_doorGUID = 104171 , --106246
					--_treasureBoxGUID = _treasureBoxGUIDs[ _difficulty ] ,--議會私藏品

					_flagGUID = 781425 , --781425 Z34_3王用旗標

					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					_bossReviveCD = 45 ,

					_squads = nil ,--table 小隊的清單
					CreateSquad = nil ,--function 產小隊的FUNCTION

					};
	--唯讀資訊
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];

	--產生 Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703177_GenerateBoss( _bossVO , _roomID );
		_gConsts._bossVOs[_bossName]._id = _bossID;--
	end
	_gConsts._bossID = _gConsts._bossVOs._Zernatine._id;--presiding Boss --Zernatine
	--Lua_703177_BossIndividualsSetting( _gConsts );

	--產生後門
	_Lua_703177_AI_GlobalVars[ _roomID ]._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
	DebugMsg( 0 , 0 , "--Back Door ID : ".._Lua_703177_AI_GlobalVars[ _roomID ]._backDoorID );

	--delete trigger
	DelObj( _ctrlID );
		
	return _roomID;
end--function Lua_703177_AI_Init( _inputCtrID )

function Lua_703177_GenerateBoss( _bossVO , _roomID )
	Lua_DavisDelObj( _bossVO._guid );
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];
	local _bossID = CreateObjByFlag( _bossVO._guid , _gConsts._flagGUID , _bossVO._flagPos , 1 );
	AddToPartition( _bossID , _roomID ); 

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false );
	SetModeEx( _bossID , EM_SetModeType_Fight , true );
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );

	--[[
	if ( _bossVO._defaultIdle ~= nil ) then
		SetDefIdleMotion( _bossID , _bossVO._defaultIdle );--預設動作
	end
	]]--

	return _bossID;
end--function Lua_703177_GenerateBoss( _bossVO )

function Lua_703177_ClearAll( _specRoomID )--for test
	if ( _Lua_703177_AI_GlobalVars ~= nil ) then
		DebugMsg( 0 , 0 , "--Lua_703177_ClearAll : all values will be cleared , reinit this by redeploying NPC 109086" );--
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
			local _valuePack = _Lua_703177_AI_GlobalVars[ _specRoomID ];
			if ( _valuePack ~= nil ) then
				ClearData( _valuePack );
			end
			_Lua_703177_AI_GlobalVars[ _specRoomID ] = nil;
			return;
		end

		for _roomID , _valuePack in pairs( _Lua_703177_AI_GlobalVars ) do
			ClearData( _valuePack );
			_Lua_703177_AI_GlobalVars[ _roomID ] = nil;
		end
		
	end
	Lua_703187_ClearAll( _specRoomID );--消除幻影
end--function Lua_703177_ClearAll()

function Lua_703177_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703177_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703177_ClearAll( _roomID );
	Lua_703177_AI_Init();
end


function Lua_703177_AI_onFight()--當有多隻王時 只放在其中一隻身上  模板請設"群組"
	--戰鬥初始
	local _bossID = OwnerID();--_Zernatine
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703177_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703177_AI_GlobalVars == nil ) then Lua_703177_AI_reignite( _roomID ); return; end

	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then Lua_703177_AI_reignite( _roomID ); return; end

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
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	WriteRoleValue( _bossID , EM_RoleValue_Register1 , 0 );--腐化能量計數器

	--squads   幻影小隊
	local _squads , CreateSquad = Lua_703187_SquadCreater( _bossID );
	_gConsts._squads = _squads;
	_gConsts.CreateSquad = CreateSquad;

	BeginPlot( _ctrlID , "Lua_703177_AI_Engage" , 0 );--啟動戰鬥流程

	ScriptMessage(_bossID,0,2,"[Lua_703177_AI_OnFight]",0);

end--function Lua_703177_AI_onFight()

function Lua_703177_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
	DebugMsg( 0 , _roomID , "--Lua_703177_AI_Engage" );
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;--_gConsts._bossID;--take ctrl as boss , because there's no guarantee that presiding Boss is always alive
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

		}

	--local _alivePlayers = 0;
	local _currentBossID = 0;

	DebugMsg( 0 , 0 , "--Start loop" );

	-----------------------------------------階段轉換
	local _bossHpRatio = 0;
	local _phaseTransformPeriodRatio = 0.1;--HP每損耗10%轉換階段
	local _hpStepping = 1.0 - _phaseTransformPeriodRatio;--下一階段轉換比例
	local _currentPhase = 1;
	----------------------------END----------階段轉換

	--幻影招喚 與否
	local _summonPhantom = true;

	while true do 
		--------------------clock
		Sleep( _miniTimeTick );
		_clock = _clock + _timeTick;
		--DebugMsg( 0 , 0 , "--Clock : ".._clock );
		--------------END---clock
		
		--------------------Routines
		--------------END---Routines

		-------------------------------------------------戰鬥結束條件
		_allBossAreDead = true;--假設所有BOSS皆陣亡
		_engaging = false;--假設所有BOSS都脫離戰鬥
		for _bossName , _bossVO in pairs( _bossVOs ) do--檢查Boss有沒有通通活蹦亂跳
			_currentBossID = _bossVO._id;
			if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 ) then--當有任一BOSS存活時 代表還未全死
				_allBossAreDead = false;
				if ( _bossVO.IndiSpec ~= nil ) then _bossVO.IndiSpec( _bossVO , _clock ); end--趁還活著的時候  順便執行個別的特殊流程
				Lua_703177_CorruptedEnerge_Check( _bossID , _gConsts );
				if( ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) ~= 0 ) then--當有任一BOSS仍在戰鬥 代表還有玩家存活 
					--DebugMsg(0,0,_currentBossID.." 正在追殺玩家 : "..ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) );
					_engaging = true;--無法解決Schulize不鎖敵的問題
				end	
			else
				--DebugMsg( 0 , 0 , "------dead boss : ".._bossName );
				--有BOSS死了  順便設定亡者復活CD
				--[[
				if ( _CD[_bossName] <= -1 ) then
					DebugMsg( 0 , _roomID , "------boss dead , set revive : ".._bossName );
					_CD[_bossName] = _gConsts._bossReviveCD;	--共存不息  沒全部死乾淨 則設定亡者復活CD	
				end
				--]]
			end
		end
		
		--DebugMsg(0,0,"--_allBossAreDead : "..tostring(_allBossAreDead).."   --_engaging : "..tostring(_engaging) );
		if ( _allBossAreDead == true ) then-- boss 全部死亡時 挑戰成功
			DebugMsg( 0 , _roomID , "------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703177_AI_Conquered( _roomID );
			break;
		end

		if ( not _engaging ) then--都沒有存活玩家時 任務失敗
			--[[
			local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 300 , true );--確認周遭存活玩家  --因為Schulize不索敵
			if ( #_rangePlayers <= 0 ) then
				DebugMsg( 0 , _roomID , "--all players are gone , quit fighting "..tostring(_engaging) );
				--Lua_703177_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--清除區域玩家所有相關BUFF
				Lua_703177_AI_Reset( _roomID );
				break;
			end
			]]--
			Lua_703177_AI_Reset( _roomID );
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
				ScriptMessage(_bossID,0,2,"[Lua_703177_AI_Frenzy]",0);
		end	

		-----------------------------------------------戰鬥階段轉換
		_bossHpRatio = ReadRoleValue( _currentBossID , EM_RoleValue_HP )/ReadRoleValue( _currentBossID , EM_RoleValue_MaxHP );--HP ratio
		if ( _bossHpRatio <= _hpStepping ) then--扣血超過10%觸發
			if ( _hpStepping > 0 ) then
				_hpStepping = _hpStepping - _phaseTransformPeriodRatio;--next transform ratio
				
				_currentPhase = _currentPhase + 1;
				--WriteRoleValue( _bossID , EM_RoleValue_Register1 , _currentPhase );
				DebugMsg( 0 , 0 , "Switch to Phase : ".._currentPhase.."  , Next Ratio : ".._hpStepping );
				AddBuff( _currentBossID , 625962 , 0 , -1 );--625962邪力增幅施放印記

				--幻影
				if ( _bossHpRatio <= 0.2 and _summonPhantom == true ) then--低於20%觸發幻影
					_summonPhantom = false;--觸發過就不再觸發
					DebugMsg( 0 , 0 , "--20% Phantom : " );
					_gConsts.CreateSquad();--產生幻影
					AddBuff( _bossID , 625982 , 20 , -1 );--625982堅挺無比 --攻擊BOSS 無效
				end

			end
		end
		-------------------------------------END-----戰鬥階段轉換	
	
		--技能 機制
		for i = 1 , 1 , 1 do--switch case simulation	--模擬 switch case 
			if ( _GCD > 0 ) then break; end	--當GCD鎖住時不執行	--GCD用來防止招式被吃掉
			
			--循環招式  每秒施放
			SysCastSpellLv( _bossID , _bossID , 852031 , 0 );--852031邪力腐蝕

			--[[
			for _bossName , _cdTime in pairs( _CD ) do--Boss重生	共存不息
				if ( _cdTime == 0 ) then
					_Lua_703177_AI_GlobalVars[ _roomID ]._bossVOs[_bossName]._id = Lua_703177_GenerateBoss( _bossVOs[_bossName] , _roomID );--重生對應的BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703177_AI_HasRevived]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--重生倒數提示	每10秒
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703177_AI_WillReviveIn10sec]" , 0 );
				end
			
			end
			--]]

			--[[
			if( _CD._timer2 <= 0 )then
				DebugMsg( 0 , 0 , "--_timer2 release" );
				_CD._timer2 = 15;
				_GCD = 2;
			end
			--]]
			
		end--for --switch case simulation

	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
end--function Lua_703177_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703177_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703177_AI_Reset" );

	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];
	
	local _bossVOs = _gConsts._bossVOs;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中
	ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703177_AI_Reset]",0);

	Delobj( _frontDoorID );	--刪除前門
	_gConsts.DelExtObjs();--clear all extend items
	Lua_703187_ClearAll( _roomID );--消除幻影

	Sleep( 10 );
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--關閉戰鬥
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , true );
		DelObj( _bossID );
	end
	Sleep( 10 );
	
	--_Lua_703177_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	for _bossName , _bossVO in pairs( _bossVOs ) do--開啟戰鬥
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703177_GenerateBoss( _bossVO , _roomID );--重生對應的BOSS
	end
	_gConsts._bossID = _gConsts._bossVOs._Zernatine._id;--presiding Boss --Zernatine
	--Lua_703177_BossIndividualsSetting( _gConsts );
	--SetDefIdleMotion( _gConsts._bossVOs._Schulize._id , ruFUSION_MIME_EMOTE_CRY );--讓Schulize哭

end--function Lua_703177_AI_Reset( _roomID )

function Lua_703177_AI_Conquered( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703177_AI_Conquered" );
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];--for read
	
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中

	Delobj( _gConsts._frontDoorID );	--刪除前門
	Delobj( _gConsts._backDoorID );	--刪除後門

	Lua_703187_ClearAll( _roomID );--消除幻影

	ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703177_AI_Conquered]",0);	

	_gConsts.DelExtObjs();	--clear all extend items
	_Lua_703177_AI_GlobalVars[ _roomID ] = nil;	--clear all values
end--function Lua_703177_AI_Conquered( _roomID )

function Lua_703177_AI_Dead()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];

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
	DebugMsg( 0 , 0 , "--Lua_703177_AI_Dead : "..tostring( _allBossAreDead ) );

	if ( _allBossAreDead ) then
		Lua_703177_AI_Conquered( _roomID );
	end

	return true;
end
-----------------------------------sub functions



------------------------------------------------------------------------------------------------個別王的特殊處理程序	在MAINLOOP執行時被掃描
function Lua_703177_CorruptedEnerge_Check( _bossID , _gConsts )

	if ( ReadRoleValue( _bossID , EM_RoleValue_Register1 ) >= 10 ) then--累積超過10顆
		local _rangeNpcs = SearchRangeNPC( _bossID , 800 );
	
		for _index , _npcID in pairs( _rangeNpcs ) do
			if ( ReadRoleValue( _npcID , EM_RoleValue_OrgID ) == _gConsts._corruptedEnergyGUID ) then
				DebugMsg( 0 , 0 , "--CorruptedEnerge_Explode : ".._index.." : ".._npcID );
				SysCastSpellLv( _npcID , _npcID , 852041 , 0 );--852041能量爆發
			end
			
		end
	end

end

---------------------------------------------------------------------END------------------------個別王的特殊處理程序	在MAINLOOP執行時被掃描

------------------------------------------------------------------------------------------以下是技能
function Lua_703177_Skill_EvilEnhance()--625961增幅時刻      625962增幅時刻施放印記
	local _ownerID = OwnerID();--boss
	DebugMsg( 0 , 0 , "--Lua_703177_Skill_EvilEnhance " );
	CancelBuff( _ownerID , 625962 );--625962增幅時刻施放印記

	--計算BUFF時間
	--增幅時刻 秒數計算由玩家身上的邪力腐蝕換算，EX：12名玩家，堆疊了20層邪力腐蝕，增幅時刻的存在時間將會是（12*20/10=24秒）。
	local _buffGUID = 625961;--625961增幅時刻 
	local _referanceBuffGUID = 625959; --625959邪力腐蝕
	local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 600 , true );
	local _effectivePersonalNum = 0;
	local _effectiveLv = 0;
	local _currentPlayerBuffLv = 0;
	for _index , _playerID in pairs( _rangePlayers ) do
		if ( CheckBuff( _playerID , _referanceBuffGUID ) == true ) then --625959邪力腐蝕
			_effectivePersonalNum = _effectivePersonalNum + 1;--計算人頭
			_currentPlayerBuffLv = Lua_703107_Return_Buff_Lv( _playerID , _referanceBuffGUID );--625959邪力腐蝕 層數
			_effectiveLv = _effectiveLv + _currentPlayerBuffLv;--計算層數
			SysCastSpellLv( _playerID , _ownerID , 852032 , 0 );--852032邪力腐蝕吸收特效
			CancelBuff_NoEvent( _playerID , _referanceBuffGUID );--吸收收 邪力腐蝕
		end
	end
	local _buffTime = ( _effectivePersonalNum*_effectiveLv )*0.1;
	AddBuff( _ownerID , _buffGUID , 0 , _buffTime );--加上增幅時刻
	DebugMsg( 0 , 0 , "--_buffTime : ".._buffTime );

	--※ 血量低。產生數量為「增幅時刻」秒數的四分之一。EX：24/4=6顆，採用無條件捨去法，EX：23/4=5.75=5顆。
	local _maxCorruptedEnergy = math.floor( _buffTime*0.25 );--腐化能量 數量
	DebugMsg( 0 , 0 , "--_maxCorruptedEnergy : ".._maxCorruptedEnergy );
	if ( _maxCorruptedEnergy <= 0 ) then--剩不到0個就甭做了
		return;
	end

	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];
	for _i = 1 , _maxCorruptedEnergy , 1 do
		Lua_703177_CreateCorruptedEnerge( _gConsts );
	end
	
	return true;
end

function Lua_703177_Skill_Despise()--鄙視
	local _ownerID = OwnerID();--boss
	local _targetID = TargetID();--victim
	DebugMsg( 0 , 0 , "--Lua_703177_Skill_Despise " );
	--將玩家傳送至BOSS周圍200碼的任一點，並且給予邪力禁錮。
	local _range = 200;
	local x,y,z,dir = DW_Location( _ownerID );
	local _x , _z = 0;
	_x = x + ( RandRange( 1 , 2*_range ) - _range );
	_z = z + ( RandRange( 1 , 2*_range ) - _range );

	AddBuff( _targetID , 625965 , 0 , 5 );--625965邪力禁錮

	if ( CheckDistance( _ownerID , _targetID , _range  ) == false ) then
		SetPos( _targetID , _x,y,_z , dir );
	end
	
	CallPlot( _ownerID , "Lua_703177_Skill_EvilBurst" , _ownerID , _targetID );
	return;
end

function Lua_703177_Skill_EvilBurst( _ownerID , _targetID )--邪力共享
	Sleep( 55 );
	CallPlot( _ownerID , "Lua_703177_Skill_EvilBurst2" , _ownerID , _targetID );
	return;
end

function Lua_703177_Skill_EvilBurst2( _ownerID , _targetID )--邪力共享
	SysCastSpellLv( _ownerID , _targetID , 852035 , 0 );--邪力共享
	return;
end



function Lua_703177_Skill_Seduce()--魅惑 BUFF
	local _ownerID = OwnerID();--boss
	local _targetID = TargetID();--victim
	local _thisBuffGUID = 625968;--625968魅惑
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _thisBuffGUID );
	DebugMsg( 0 , 0 , "--Lua_703177_Skill_Seduce : ".._currentBuffLv );
	if ( _currentBuffLv >= 3 ) then--疊滿5層後，會被定身、昏迷、無法進行任何動作。
		AddBuff( _targetID , 625969 , 0 , -1 );--625969魅惑強化版

		--[[
		local x,y,z,dir = DW_Location( _ownerID );

		local _x = x + ( RandRange( 1 , 2*_range ) - _range );
		local _z = z + ( RandRange( 1 , 2*_range ) - _range );

		SetPos( _targetID , _x,y,_z , dir );
		]]--
		SetAttack( _ownerID , _targetID );
		AddBuff( _ownerID , 625968 , 0 , -1 );--625968魅惑
		DebugMsg( 0 , 0 , "--Lua_703177_Skill_Seduce : Ready to give a deadly kiss !!! : ".._ownerID );
	end

	return true;
end


---------------------------------------腐化能量
function Lua_703177_CreateCorruptedEnerge( _gConsts )--創造一個腐化能量
	DebugMsg( 0 , 0 , "--Lua_703177_CreateCorruptedEnerge " );
	local x,y,z,dir = DW_Location( _gConsts._bossID );
		x = x + ( RandRange( 1 , 300 ) - 150 );	
		z = z + ( RandRange( 1 , 300 ) - 150 );	

	--腐化能量
	local _corruptedEnergyID = _gConsts.ExtObj( _gConsts._corruptedEnergyGUID , x,y,z,dir );

	WriteRoleValue( _corruptedEnergyID , EM_RoleValue_PID , _gConsts._bossID );
	local _counter = ReadRoleValue( _gConsts._bossID , EM_RoleValue_Register1 );--腐化能量計數器
	_counter = _counter + 1;
	WriteRoleValue( _gConsts._bossID , EM_RoleValue_Register1 , _counter );--腐化能量計數器

	CallPlot( _corruptedEnergyID , "Lua_703177_CorruptedEnerge_Loop" , _corruptedEnergyID , _gConsts._bossID );
end

function Lua_703177_CorruptedEnerge_Loop( _corruptedEnergyID , _bossID )
	DebugMsg( 0 , 0 , "--Lua_703177_CorruptedEnerge_Loop : ".._corruptedEnergyID );
	local _active = true;
	local _lastStatus = false;
	while true do
		if ( _lastStatus ~= _active ) then
			DebugMsg( 0 , 0 , "--CorruptedEnerge Active : ".._corruptedEnergyID.." : "..tostring(_active) );
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Mark , _active );	--不可點選
			SetModeEx( _corruptedEnergyID , EM_SetModeType_HideName , not _active );	--不顯示名稱
			SetModeEx( _corruptedEnergyID , EM_SetModeType_NotShowHPMP , not _active );	--不顯示血條
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Strikback , false );	--不會反擊
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Move , false );	--不會移動
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Fight , _active );	--不可攻擊
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Searchenemy , false );	--不會索敵
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Obstruct , false );	--有阻擋效果
			_lastStatus = _active;
		end

		--CastSpell( _corruptedEnergyID , _corruptedEnergyID , 852040 );--852040能量襲擊 -- for test
		
		_active = ( CheckID( _bossID ) and CheckBuff( _bossID , 625961 ) );--625961增幅時刻 
		if ( _active ) then
			CastSpell( _corruptedEnergyID , _corruptedEnergyID , 852040 );--852040能量襲擊
		end

		Sleep( 30 );
	end

	return;
end


function Lua_703177_CorruptedEnerge_Ondead()
	DebugMsg( 0 , 0 , "--Lua_703177_CorruptedEnerge_Ondead : " );
	local _ownerID = OwnerID();
	local _bossID = ReadRoleValue( _ownerID , EM_RoleValue_PID );
	local _counter = ReadRoleValue( _bossID , EM_RoleValue_Register1 );--腐化能量計數器
	_counter = _counter - 1;
	WriteRoleValue( _bossID , EM_RoleValue_Register1 , _counter );--腐化能量計數器

	DelObj( _ownerID );
	return false;
end

function Lua_703177_Skill_DarkShadowArrow()--暗影箭
	local _ownerID = OwnerID();
	local _targetID = TargetID();

	SysCastSpellLv( _ownerID , _targetID , 852049 , 0 );--852049暗影箭飛行特效

	return true;
end