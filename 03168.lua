--Author : K.J. Aris
--Version : 140528
--Ignitor : NPC 109085
--Script : 703168

local _Lua_703168_AI_GlobalVars = nil;

function Lua_703168_AI_Init( _inputCtrID )--controller  NPC 109197 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703168_AI_Init : NPC 109197       Z28  V 140728 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --以防重複執行 將原有控制器刪除

	--basics
	local _ctrlID = _inputCtrID or OwnerID() or 0;--109085
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108814
	
	--[[
	--this NPC is using as a controller
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _ctrlID , EM_SetModeType_HideName , false );	--不顯示名稱
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--無阻擋效果
	]]--


	-------------------------------------------initialize settings
	local _zoneID = ReadRoleValue( _ctrlID , EM_RoleValue_ZoneID );

	local _difficulty = 1;
	local _frenzyCD = 480;--狂暴參數

	if ( _zoneID == 161 ) then
		_difficulty = 2;
		_frenzyCD = 360;
	end

	if ( _zoneID == 162 ) then
		_difficulty = 3;
		_frenzyCD = 9999999;
	end
	---------------------------------------

	--local x,y,z,dir = 227.4 , 3539.1 , 1079.7 , 260.7;
	local x,y,z,dir = DW_Location( _ctrlID );
	----------------------------END----------狂暴參數
	--請依難易度順序放置
	--local _bossXestonGUIDs = { 109196 , 109196 , 109196 };--雪斯敦Remix

	--參數設定表
	if ( _Lua_703168_AI_GlobalVars == nil ) then _Lua_703168_AI_GlobalVars = {}; end
	_Lua_703168_AI_GlobalVars[ _roomID ] = {	--non 
					_bossID = 0 ,--以_Schulize做代表( 讓其他函式好找 _bossID)

					_bossVOs = {
						_Xeston = {
							_id = _ctrlID ,					--ID
							_guid = ReadRoleValue( _ctrlID , EM_RoleValue_OrgID ) , --_bossXestonGUIDs[ _difficulty ] ,		--GUID
							--_flagPos = 1 , 					--旗標位置

							--_defaultIdle = nil;--ruFUSION_MIME_EMOTE_STRETCH;--預設動作
							IndiSpec = nil ,	--function個別的特殊流程

							_oriX = x ,
							_oriY= y , 
							_oriZ = z ,
							_oriDir = dir ,

							} , 
						},

					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_ctrlGUID = 108705 ,--控制器ID
					_doorGUID = 106251 , 

					_flagGUID = 781429 , --781424 Z34_7王用旗標

					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					--CDs
					ranATK=7,      --隨機施放：single or triple tap
					aeDot=11,     --AE+DOT
					collectSoul=17,    --吸收靈魂
					fatal=20,	--大絕
					container=7,	--容器爆
					bell_move=10,

					_soulContainerList = nil,

					};
	--唯讀資訊
	local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];

	--產生 Boss
	--[[
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703168_GenerateBoss( _bossVO , _roomID , x,y,z,dir );
		_gConsts._bossVOs[_bossName]._id = _bossID;--
	end
	]]--

	_gConsts._bossID = _ctrlID;--_gConsts._bossVOs._Xeston._id;--presiding Boss --Xeston
	--Lua_703168_BossIndividualsSetting( _gConsts );

	--產生後門
	_gConsts._backDoorID = Lua_703168_AddDoor( _gConsts._doorGUID , 312.5 , 3542.1 , 856.1 , 80 , _gConsts._roomID );
	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	Cl_Resist_HackersBossNum();
	--delete trigger
	--DelObj( _ctrlID );
		
	return _roomID;
end--function Lua_703168_AI_Init( _inputCtrID )

function Lua_703168_GenerateBoss( _bossVO , _roomID , x,y,z,dir )
	Lua_DavisDelObj( _bossVO._guid );
	local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];
	--local _bossID = CreateObjByFlag( _bossVO._guid , _gConsts._flagGUID , _bossVO._flagPos , 1 );
	local _bossID = CreateObj( _bossVO._guid , x,y,z,dir , 1 );
	AddToPartition( _bossID , _roomID ); 

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false );
	SetModeEx( _bossID , EM_SetModeType_Fight , true );
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );

	return _bossID;
end--function Lua_703168_GenerateBoss( _bossVO )

function Lua_703168_ClearAll( _specRoomID )--for test
	if ( _Lua_703168_AI_GlobalVars ~= nil ) then
		DebugMsg( 0 , 0 , "--Lua_703168_ClearAll : all values will be cleared , reinit this by redeploying NPC 109085" );--
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
			local _valuePack = _Lua_703168_AI_GlobalVars[ _specRoomID ];
			if ( _valuePack ~= nil ) then
				ClearData( _valuePack );
			end
			_Lua_703168_AI_GlobalVars[ _specRoomID ] = nil;
			return;
		end

		for _roomID , _valuePack in pairs( _Lua_703168_AI_GlobalVars ) do
			ClearData( _valuePack );
			_Lua_703168_AI_GlobalVars[ _roomID ] = nil;
		end
	end
end--function Lua_703168_ClearAll()

function Lua_703168_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703168_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703168_ClearAll( _roomID );
	Lua_703168_AI_Init( OwnerID() );
end


function Lua_703168_AI_onFight()--當有多隻王時 只放在其中一隻身上  模板請設"群組"
	--戰鬥初始
	local _bossID = OwnerID();--_Xeston
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703168_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703168_AI_GlobalVars == nil ) then Lua_703168_AI_reignite( _roomID ); return; end

	Cl_Resist_HackersFightBegin()	--防駭客機制_戰鬥開始_BICO

	local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then Lua_703168_AI_reignite( _roomID ); return; end

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--當上一次循環的控制器還在作動時則不動作  (防止_Schulize重生時重複觸發戰鬥)
		DebugMsg( 0 , _roomID , "--Combat Sequence Duplicated : New Sequence Rejected !!" );--presiding boss may revived or rejoin the fight while combat is not over yet
		return;
	end
	--控制器與衍伸物件
	local _ctrlID , _AddParasite , _RemoveParasites = Lua_703168_ExtendObjectClosure( _bossID );

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
	local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703168_AddDoor( _gConsts._doorGUID , 178.2 , 3539.1 , 1346.9 , 260 , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703168_AI_Engage" , 0 );--啟動戰鬥流程

	ScriptMessage(_bossID,0,2,"[Lua_703168_AI_OnFight]",0);

	lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_START]",0);--你的背上寒毛豎起，這些看似無害的發光體肯定有著無法想像的力量！

end--function Lua_703168_AI_onFight()

function Lua_703168_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
	DebugMsg( 0 , _roomID , "--Lua_703168_AI_Engage" );
	local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];
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
		ranATK = _gConsts.ranATK ,      --隨機施放：single or triple tap
		aeDot = _gConsts.aeDot ,     --AE+DOT
		collectSoul = _gConsts.collectSoul ,    --吸收靈魂
		fatal = _gConsts.fatal ,	--大絕
		container = _gConsts.container ,	--容器爆
		bell_move = _gConsts.bell_move ,
		}

	--local _alivePlayers = 0;

		--副函式
				------------------------------------------------------------------------------
					local function rand_pick( _InputList ,  _InputNum )--隨機挑選num名玩家
						local playertable={};--index依序value玩家GUID
						local n = _InputNum;
						if( n >= #_InputList ) then n = #_InputList +1; end
						for i=1, n ,1 do
							table.insert( playertable , _InputList[ DW_Rand(#_InputList) ] );
							--DebugMsg( 0 , 0 , "挑了 "..i.." 個" );
						end
						
						return playertable;
					end

					local function rand_pick_FromZero( _InputList ,  _InputNum )--隨機挑選num名玩家  --Table Index 由0開始
						local _maxLength = 0;
						local _tempList ={};
						for _qq = 0 , #_InputList , 1 do --確認由0開始的TABLE的長度  並建立由1開始的TABLE (以方便後續統一操作)
							if( _InputList[ _qq ] == -1 ) then break; end
							_maxLength = _maxLength + 1;
							table.insert( _tempList , _InputList[ _qq ] );
						end

						_tempList = KJ_28BOSS3_SC_Hash_Shuffle( _tempList );--建立HASH表

						local _currentEfficaciousTargetList = {};--index依序value玩家GUID
						local n = _InputNum;
						local _currentTargetID = 0;
						if( n >= _maxLength ) then n = _maxLength; end
						for i=1, n ,1 do
							--_currentTargetID = _InputList[ RandRange( 0 , _maxLength ) ];
							_currentTargetID = _tempList[ i ];
							table.insert( _currentEfficaciousTargetList , _currentTargetID );--DW_Rand
							--DebugMsg( 0 , 0 , "挑了 "..i.." 個 --".._currentTargetID );
						end
						
						return _currentEfficaciousTargetList;
					end
				---------------------------------------------------------------------------
	------------靈魂容器
	local _targetList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 500 , true );--最多3個靈魂容器
	local _maxSoulContainer = #_targetList;

	if ( #_targetList > 3 ) then
		_maxSoulContainer = 3;
	end
	
	_gConsts._soulContainerList = {};
	for i=1,_maxSoulContainer,1 do
		local _containerID = Lua_703168_CreateSingleSoulContainer( _bossID );
		table.insert( _gConsts._soulContainerList , _containerID );
		DebugMsg(0,0,"靈魂容器 "..i.." 產生！")
	end
	------------靈魂容器



	local _currentBossID = 0;
	local _currentCollectedSoul = 0; --目前BOSS所蒐集的靈魂碎片
	local _currentPlayerSoul = 0;--目前所有玩家身上的靈魂碎片
	DebugMsg( 0 , 0 , "--Start loop" );
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
				]]--
			end
		end
		
		--DebugMsg(0,0,"--_allBossAreDead : "..tostring(_allBossAreDead).."   --_engaging : "..tostring(_engaging) );
		if ( _allBossAreDead == true ) then-- boss 全部死亡時 挑戰成功
			DebugMsg( 0 , _roomID , "------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703168_AI_Conquered( _roomID , _gConsts );
			break;
		end

		if ( not _engaging ) then--都沒有存活玩家時 任務失敗
			--[[
			local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 300 , true );--確認周遭存活玩家  --因為Schulize不索敵
			if ( #_rangePlayers <= 0 ) then
				DebugMsg( 0 , _roomID , "--all players are gone , quit fighting "..tostring(_engaging) );
				--Lua_703168_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--清除區域玩家所有相關BUFF
				Lua_703168_AI_Reset( _roomID );
				break;
			end
			]]--
			Lua_703168_AI_Reset( _roomID );
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
					AddBuff( _currentBossID , 624344 , 0 , -1 );-- 625849 神棄
				end
				DebugMsg( 0 , _roomID , "-----狂狂暴----" );
				--ScriptMessage(_bossID,0,2,"[SC_28IN_BOSS3_FURY]",0);

				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_FURY]",0);--[107966]感受到巢穴的低鳴，開始陷入某種瘋狂狀態！
		end		
	

		----當靈魂容器全毀時 將BOSS 身上的疊加效果移除 140225
		local _allContainersAreGone = true;
		local _containersRemain = 0;
		for _index , _SCID in pairs( _gConsts._soulContainerList ) do
			if _SCID ~= nil and CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 0 then
				_allContainersAreGone = false;
				_containersRemain = _containersRemain + 1;
			end
		end

		if ( _allContainersAreGone ) then
			CancelBuff( _bossID , 624817 );--當靈魂容器全毀時 將BOSS 身上的疊加效果移除 140225
			_CD.collectSoul = _gConsts.collectSoul;--都不見時  就不蒐集靈魂
		end

		--技能 機制
		for i = 1 , 1 , 1 do--switch case simulation	--模擬 switch case 


			--靈魂容器聖光傷害(Per 7 sec)
			if( _CD.container == 0 )then
				for _qq , _SCID in pairs( _gConsts._soulContainerList ) do
					if CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 0 then
						SysCastSpellLv( _SCID , _SCID , 851164 , 0 );--靈魂容器聖光傷害 + DOT
						DebugMsg( 0 , 0 , _SCID.."  靈魂容器聖光傷害 + DOT " );
					end
				end
				_CD.container = _gConsts.container;
			end
			----------------------------------END----------靈魂容器聖光傷害(Per 7 sec)

			--聖鐘產生共鳴(per 20 sec)
			if( _CD.fatal <= 0 )then
				--每20秒在玩家身上加一個"靈魂碎片"的DEBUFF
				--DebugMsg( 0 , 0 , boss.."  鐘聲響起來~~Boss更厲害 " );
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_PER20]",0);--[107966]「冷笑」了一聲

				------------------------boss actions
				PlayMotion( _bossID , ruFUSION_ACTORSTATE_BUFF_SP01 );

				--SetModeEx( _bossID , EM_SetModeType_Searchenemy , false );--搜敵
				--SetModeEx( _bossID , EM_SetModeType_Strikback , false );--反擊
				--DW_UnFight(boss,false);
				sleep( 20 );
				_clock = _clock + 2;
				--DW_UnFight(boss,true);
				--SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );--搜敵
				--SetModeEx( _bossID , EM_SetModeType_Strikback , true );--反擊

				AddBuff( _bossID , 624802 , 0 , -1 );--每次增強ATK、MATK、DEF、MDEF 5%
				--DebugMsg( 0 , 0 , "Boss Increse Level-------"..KJ_28BOSS3_CheckTargetBuffLevel( boss , 624802 ) );
				------------------------boss actions

				------------------------------soul containers actions
				--for _qq , _SCID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
				local _soulSaturation = false;
				--for _qq = _maxSoulContainer , 1 , -1 do
				local _alivePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 500 , true );--最多3個靈魂容器
				for _index , _SCID in pairs( _gConsts._soulContainerList ) do
					DebugMsg( 0 , 0 , "  靈魂容器 : ".._SCID );

					if( _SCID ~= nil and CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 0 )then--當靈魂容器尚存時才作動
						for i , player in pairs( _alivePlayerList ) do
							if( GetDistance( _SCID , player ) <= 75 ) then
								SysCastSpellLv( player , _SCID , 851169 , 1 );--特效
								--AddBuff( _SCID , 624779 , 0 , -1 );
							end
						end

						if( KJ_28BOSS3_CheckTargetBuffLevel( _SCID , 624779 ) >= 5 )then
							CancelBuff_NoEvent( _SCID , 624779 );
							_soulSaturation = true;
						end
						DebugMsg( 0 , 0 , _SCID.."  靈魂容器吸取生命 " );
					else
						------------------------------靈魂容器重生
						DebugMsg( 0 , 0 , _index.."  靈魂容器重生 " );
						_gConsts._soulContainerList[ _index ] = Lua_703168_CreateSingleSoulContainer( _bossID );
						------------------------------靈魂容器重生
					end
					
				end
				------------------------------soul containers actions

				------------------------players
				--在玩家身上加上靈魂碎片BUFF
				for _Index,_ID in pairs( _alivePlayerList ) do
					if( ReadRoleValue( _ID , EM_RoleValue_IsDead ) == 0 )then--未死才紀錄BUFF   --避免時間差  再做一次檢查
						AddBuff(  _ID , 624774 , 0 , -1);--聖鐘詛咒
						AddBuff(  _ID , 624758 , 0 , -1);--靈魂碎片BUFF
						_currentPlayerSoul = _currentPlayerSoul + 1;
					end
				end
				------------------------players

				if ( _soulSaturation == true ) then--當靈魂容器飽和時 施放 噬魂詛咒
					lua_28in_Boss5_broadcast( 2 , "[SC_28IN_BOSS3_LV5]" , C_Red );--[107966]從完全飽和的靈魂容器裡得到詛咒入侵者的能量
					Sleep( 10 );
					MagicInterrupt( _bossID );
					Sleep( 20 );
					--SysCastSpellLv(boss,boss,851140,0);
					CastSpell( _bossID , _bossID , 851140 );

					GCD = 6;
					_CD.aeDot = _gConsts.aeDot;
				end
				
				_CD.fatal = _gConsts.fatal;
				break;
			end--end --聖鐘產生共鳴(per 20 sec)




			if ( _GCD > 0 ) then break; end	--當GCD鎖住時不執行	--GCD用來防止招式被吃掉
			
			--[[
			for _bossName , _cdTime in pairs( _CD ) do--Boss重生	共存不息
				if ( _cdTime == 0 ) then
					_gConsts._bossVOs[_bossName]._id = Lua_703168_GenerateBoss( _bossVOs[_bossName] , _roomID );--重生對應的BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703168_AI_HasRevived]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--重生倒數提示	每10秒
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703168_AI_WillReviveIn10sec]" , 0 );
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

	
			--Boss attackings
			---------------------------------隨機攻擊招式
			if( _CD.ranATK == 0 )then
				-----------actions
				--DebugMsg( 0 , 0 , boss.."  打人拉 !! " );
				local _alivePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 500 , true );
				if RandRange( 1 , 2 ) == 1 then --random 兩招
					CallPlot( _bossID , "KJ_28BOSS3_SingleTap" , 851144 , rand_pick_FromZero( _alivePlayerList , 1 ) );--隨機打一
				else			
					DebugMsg( 0 , 0 , _bossID.."  打人拉 !! " );									
					--CallPlot( boss , "KJ_28BOSS3_TripleTap" , 851144 , rand_pick_FromZero( _alivePlayerList , 3 ) );--隨機打三
					CastSpell( _bossID , _bossID , 851281 );
				end
				-----------actions

				GCD = 2;
				_CD.ranATK = _gConsts.ranATK;
				break;
			end
			---------------------END--------隨機攻擊招式


			--------------------------------aeDot
			if ( _CD.aeDot == 0 ) then

				-----------actions
				CastSpell(  _bossID , _bossID , 851140 ) ;--AE+DOT，詛咒，持續時間8秒
				Sleep( 20 );
				--_clock = _clock + 2;
				--ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP
				--DebugMsg( 0 , 0 , boss.."  AE+DOT，詛咒，持續時間8秒 " );
				-----------actions
				GCD = 5;
				_CD.aeDot = _gConsts.aeDot;
				break;
			end
			-----------------------END------aeDot



			--------------------------------蒐集靈魂碎片
			if ( _CD.collectSoul == 0 ) then
				-----------actions
				--PlayMotion( boss , ruFUSION_ACTORSTATE_CAST_SP01 );
				--DebugMsg( 0 , 0 , boss.."  蒐集靈魂碎片 " );
				--SetModeEx( _bossID , EM_SetModeType_Searchenemy , false );--搜敵
				--SetModeEx( _bossID , EM_SetModeType_Strikback , false );--反擊
				sleep(20);
				MagicInterrupt( _bossID );
				sleep(20);
				CastSpell(  _bossID , _bossID , 851162 ) ;
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_GAINSOUL]",0);--[107966]催動[108119]的力量，靈魂被擾動的你感到極度痛苦！

				--DW_UnFight(boss,false);
				sleep( 30 );
				_clock = _clock + 5;
				--DW_UnFight(boss,true);
				--SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );--搜敵
				--SetModeEx( _bossID , EM_SetModeType_Strikback , true );--反擊
				-----------actions
				
				-----------Players actions
				local _alivePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 500 , true );
				for _Index , _ID in pairs( _alivePlayerList ) do
					if ( ReadRoleValue( _ID , EM_RoleValue_IsDead ) == 0 ) then--未死才紀錄BUFF  --避免時間差  再做一次檢查
						local _buffLevel = KJ_28BOSS3_CheckTargetBuffLevel( _ID , 624758 ) - 1;--紀錄玩家身上靈魂碎片數量--624758靈魂碎片
						
						DebugMsg( 0 , 0 , " Soul Fragments : "..tostring( _buffLevel ) );
						--Say( _ID , "my soul has been taken !!"  );
						for _qq , _SCID in pairs( _gConsts._soulContainerList ) do
							if( ReadRoleValue( _SCID , EM_RoleValue_IsDead ) ~= 1 ) then--未死的容器剔除
								--for i = 1 , _buffLevel , 1 do
								if ( _buffLevel > -1 ) then
									SysCastSpellLv( _ID , _SCID , 851163 , 0 );--播放靈魂碎片被吸收特效
									AddBuff( _SCID , 624803 , _buffLevel , -1 );--624803靈魂狀態_容器   --把玩家的靈魂層數疊上去
									AddBuff( _bossID , 624817 , _buffLevel , -1 );--624817靈魂狀態_Xeston  --把容器的靈魂層數疊上去
									AddBuff( _bossID , 624757 , 0 , -1 );--英魂滿盈
								end
								--end
							end
							--DebugMsg( 0 , 0 , _ID.."  蒐集靈魂碎片吸收特效 ".._SCID );
--							if( ReadRoleValue( _SCID , EM_RoleValue_IsDead ) == 0 ) then--順便將已死的容器剔除
--								table.remove( KJ_28BOSS3_soulContainerList[room] , _qq );
--							end
						end

						CancelBuff_NoEvent(  _ID , 624758 );--靈魂碎片BUFF  --被吸走 --取消碎片BUFF
						
					end
				end

				_currentCollectedSoul = _currentCollectedSoul + _currentPlayerSoul;--蒐集玩家靈魂	
				--Say( boss , "I have ".._currentCollectedSoul.." souls , ".._currentPlayerSoul.." more !!" );								
				_currentPlayerSoul = 0;--被蒐集後歸零
				-----------Players actions

				GCD = 7;--注意GCD打結(dead lock)
				_CD.collectSoul = _gConsts.collectSoul;
				break;
			end
		end--for --switch case simulation

	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
end--function Lua_703168_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703168_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703168_AI_Reset" );

	local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];
	
	local _bossVOs = _gConsts._bossVOs;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中
	--ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703168_AI_Reset]",0);
	lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_FAIL]",0);--[107966]喳巴喳巴的，似乎在稱讚你強大靈魂的美味，一副非常滿意的模樣。

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
	
	--_Lua_703168_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	local x,y,z,dir = _bossVOs._Xeston._oriX , _bossVOs._Xeston._oriY , _bossVOs._Xeston._oriZ , _bossVOs._Xeston._oriDir;
	for _bossName , _bossVO in pairs( _bossVOs ) do--開啟戰鬥
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703168_GenerateBoss( _bossVO , _roomID , x,y,z,dir );--重生對應的BOSS
	end
	_gConsts._bossID = _gConsts._bossVOs._Xeston._id;--presiding Boss --Xeston
	--Lua_703168_BossIndividualsSetting( _gConsts );
	--SetDefIdleMotion( _gConsts._bossVOs._Schulize._id , ruFUSION_MIME_EMOTE_CRY );--讓Schulize哭

end--function Lua_703168_AI_Reset( _roomID )

function Lua_703168_AI_Conquered( _roomID , _gConsts )
	DebugMsg( 0 , 0 , "--Lua_703168_AI_Conquered : ".._roomID);
	--if ( _gConsts == nil ) then DebugMsg( 0 , 0 , "--Lua_703168_AI_Conquered : Encounter nil"); return; end
	local _gConsts = _gConsts or _Lua_703168_AI_GlobalVars[ _roomID ];--for read
	DebugMsg( 0 , 0 , "--Lua_703168_AI_Conquered : "..tostring( _gConsts ) );	

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--控制器戰鬥MARK	0 = 非戰鬥 , 1 = 戰鬥中

	Delobj( _gConsts._frontDoorID );	--刪除前門
	Delobj( _gConsts._backDoorID );	--刪除後門

	--ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703168_AI_Conquered]",0);	
	lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_END]",0);--[107966]倒下後，那恍若所失的不適才漸漸消失，你的靈魂已重歸於一處，仿彿什麼事都不曾發生

	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs(); end	--clear all extend items
	_Lua_703168_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	sasa_ZoneDungeon_title_01(530927)
--	防駭解除
	Cl_Resist_HackersBossDead()

end--function Lua_703168_AI_Conquered( _roomID )

function Lua_703168_AI_Dead()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then DebugMsg( 0 , 0 , "--Lua_703168_AI_Dead : Encounter nil"); return; end
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
	DebugMsg( 0 , 0 , "--Lua_703168_AI_Dead : "..tostring( _allBossAreDead ) );

	if ( _allBossAreDead ) then
		Lua_703168_AI_Conquered( _roomID , _gConsts );
	end

	return true;
end
-----------------------------------sub functions
-------------------------------public functions
function Lua_703168_AddDoor( _doorGUID , x,y,z,dir , _roomID )--在Z32~Z34統一
	--DebugMsg(0,0,"--Lua_703168_AddDoor  ".._flagPos.." : ".._roomID.." : ".._doorGUID );
	--local _doorID = CreateObjByFlag( _doorGUID , _flagGUID , _flagPos , 1 );
	local _doorID = CreateObj( _doorGUID , x,y,z,dir , 1 );
	SetModeEx( _doorID , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( _doorID , EM_SetModeType_HideName , true );	--不顯示名稱
	SetModeEx( _doorID , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
	SetModeEx( _doorID , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( _doorID , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( _doorID , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( _doorID , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( _doorID , EM_SetModeType_Obstruct , true );	--有阻擋效果
	SetRoleCampID( _doorID , 1 );--避免門被打到
	LockHP( _doorID , 100 , "" );--避免門被打到
	AddToPartition( _doorID , _roomID );
	Lua_703168_DelDuplicateDoor( _doorID , _doorGUID );
	return _doorID;
end--function Lua_703168_AddDoor( _flagPos , _roomID )

function Lua_703168_DelDuplicateDoor( _doorID , _doorGUID )
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
function Lua_703168_ExtendObjectClosure( _hostID )--Caution : this is a closure pack !!
	DebugMsg( 0 , 0 , "----Lua_703168_ExtendObjectClosure : ".._hostID );
	local _parasitesList = {};
	local _deleteAll = false;

	local _roomID = ReadRoleValue( _hostID , EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location( _hostID );

	local _ctrlID = CreateObj( 110987 , x , y , z , dir , 1 );
	SetModeEx( _ctrlID , EM_SetModeType_Show , false );
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );
	SetModeEx( _ctrlID , EM_SetModeType_ShowRoleHead , false );

	SetModeEx( _ctrlID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--顯示血條
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );		--移動
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--攻擊
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--有阻擋效果
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
end--Lua_703168_ExtendObjectClosure( _hostID )
----------------------------------------------------------------------------------------END-----------Extend Objects

function Lua_703168_CreateSingleSoulContainer( _InputReferenceTargetID )
		DebugMsg(0,0,"---Lua_703168_CreateSingleSoulContainer");
		local _roomID = ReadRoleValue( _InputReferenceTargetID , EM_RoleValue_RoomID );
		local _zoneID = ReadRoleValue( _InputReferenceTargetID , EM_RoleValue_ZoneID );
		local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];
		local _difficulty = 1;--Z160 default
		local _fellowsGUIDs = {108119 , 108299 , 108300 };

		if ( _zoneID == 161 ) then
			_difficulty = 2;
		end

		if ( _zoneID == 162 ) then
			_difficulty = 3;
		end

		local _objectID = _fellowsGUIDs[ _difficulty ];--靈魂容器

		local _targetList = Lua_RandomPlayerFromHateList( _InputReferenceTargetID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦
		local _targetID = _targetList[ 1 ];
		local x,y,z,dir = DW_Location( _targetID );
		DebugMsg(0,0,"_targetID=".._targetID);

		--local _currentMonster = CreateObj(  _objectID , x , y , z , dir , 1 );
		local _currentMonster = _gConsts.ExtObj( _objectID , x , y , z , dir );

		SetModeEx( _currentMonster , EM_SetModeType_Searchenemy , false );--搜敵
		SetModeEx( _currentMonster , EM_SetModeType_Strikback , false );--反擊
		MoveToFlagEnabled( _currentMonster , false );--關閉巡邏移動	

		--AddToPartition( _currentMonster , _roomID );
		AddBuff( _currentMonster , 505653 , 0 , -1 );--505653不回血
		--CallPlot( _currentMonster ,"KJ_28BOSS3_tokenRULE", _InputReferenceTargetID );--auto destroy

		return _currentMonster;
	end


------------------------------------------------------------------------------------------------個別王的特殊處理程序	在MAINLOOP執行時被掃描


---------------------------------------------------------------------END------------------------個別王的特殊處理程序	在MAINLOOP執行時被掃描





------------------------------------------------------------------------------------------以下是技能
--107966