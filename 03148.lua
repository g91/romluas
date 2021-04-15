--Author : K.J. Aris
--Version : 14.02.25.
--Ignitor : 108910
--NPC : 108910--raid
--Script : 703148

local _Lua_703148_AI_GlobalVars = {};

function Lua_703148_AI_Init( _inputCtrID )--controller  NPC 108910 --Note : this NPC is using as a ignitor
---	DebugMsg( 0 , 0 , "--Lua_703148_AI_Init : NPC 108910       Z33-2B3  V140225 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --以防重複執行 將原有控制器刪除

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108910
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
	local _bossGUIDs = { 108830 , 108830 , 108830 };--梅希雅

	--參數設定表
	_Lua_703148_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossGUID = _bossGUIDs[ _difficulty ] ,
					_ctrlGUID = 108705 ,--控制器ID
					_doorGUID = 106012 , 

					_flagGUID = 781417 , --781417 Z33-2_3王用旗標
					_bossFlagPos = 1 , 
					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 99 ,
					_roomCenterFlagPos = 3 ,--場景中央標記

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,
					_phaseBuffGUIDs = { 625872 , 625873 , 625874 , 625875 } , --戰鬥階段Buff 依序 1.2.3.4.
					_phase4CycleCD = 7 , --第四階段 行為循環時間
					_targetFlagPosInfo = { 4 , 5 } ,--虛空幻境 傳送的FLAG位置  (清單長度同時代表目標數量)
					};
	--唯讀資訊
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];

	--產生 Boss
	Lua_DavisDelObj( _gConsts._bossGUID );
	local _bossID = CreateObjByFlag( _gConsts._bossGUID , _gConsts._flagGUID , _gConsts._bossFlagPos , 1 );--108800
	_gConsts._bossID = _bossID;
	SetModeEx( _bossID , EM_SetModeType_Obstruct , false);	-- 阻擋
	SetModeEx( _bossID , EM_SetModeType_Fight , true );	-- 砍殺
	SetModeEx( _bossID , EM_SetModeType_Move , true );	-- 移動
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true);	-- 索敵
	SetModeEx( _bossID , EM_SetModeType_Strikback , true);	-- 反擊
--	AddBuff( _bossID , 500226 , 0 , -1 );--梅希雅常駐特效
	AddToPartition( _bossID , _roomID ); 

	--產生後門
	_gConsts._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
---	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	--delete trigger
	DelObj( _ctrlID );
	CallPlot( _bossID , "Cl_Resist_HackersBossNum" );
	return _roomID;
end--function Lua_703148_AI_Init( _inputCtrID )

function Lua_703148_AI_reignite( _specRoomID )--for test
---	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	--Lua_703175_ClearAll( _roomID );
	Lua_703148_AI_Init();
end
---------------------------------------------------------------------------------
function Zone_175_Boss3_108830_Init()	-- 梅希雅起始劇情

	local Owner = OwnerID();
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local OwnerPos = Vector_GetRolePos( Owner );

	local AttachMeshyahObjs = {};	-- 與梅希雅聯結的物件
	AttachMeshyahObjs[106972] = { OwnerPoint = "p_top", TargetPoint = "p_top" };	-- 頭部特效
	AttachMeshyahObjs[106973] = { OwnerPoint = "p_down", TargetPoint = "p_down" };	-- 腿部特效;

	for index, objid in pairs(AttachMeshyahObjs) do
		local Obj = CreateObj( index, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
		SetModeEx( Obj, EM_SetModeType_Move, false );	-- 移動
		SetModeEx( Obj, EM_SetModeType_Mark, false );	-- 標記
		SetModeEx( Obj, EM_SetModeType_ShowRoleHead, false );	-- 頭像
		SetModeEx( Obj, EM_SetModeType_Searchenemy, false );	-- 索敵
		SetModeEx( Obj, EM_SetModeType_Fight, false );	-- 砍殺
		SetModeEx( Obj, EM_SetModeType_Strikback, false );	-- 反擊
		AddToPartition( Obj, Room );
		AttachObj( Obj, Owner, 4, objid.OwnerPoint, objid.TargetPoint );
		CallPlot( Obj, "Zone_175_Boss3_CheckDead", Obj, Owner )
	end
end

function Zone_175_Boss3_CheckDead( Owner, Target )

	while CheckID(Target) and ReadRoleValue( Target, EM_RoleValue_IsDead ) == 0 do
		Sleep(10);
	end
	DelObj(Owner);
end
---------------------------------------------------------------------------------
function Lua_703148_AI_onFight()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );

---	DebugMsg( 0 , 0 , "--Lua_703148_AI_onFight ".._bossID.." RID : ".._roomID );
	--唯讀資訊
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703148_AI_reignite( _roomID ); return; end

	--控制器與衍伸物件
	local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--衍生物(處理招喚物 或 長出來的東西)
		local x,y,z,dir = DW_Location( _bossID );
		local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
		_AddParasite( _objID );
		AddToPartition( _objID , _roomID );
		return _objID;
	end
	
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

---	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );

	--generate front door

	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703148_AI_Engage" , 0 );	-- 由中控器執行的戰鬥開始

	ScriptMessage(_bossID,0,2,"[LUA_703148_AI_ONFIGHT]",0);	-- 你驚覺眼前的怪物已經不再是那位熟悉的大祭司……

	CastSpell( _bossID , _bossID , 851918 );--忘卻血泡

	local _currentPhase = 1;
	WriteRoleValue( _bossID , EM_RoleValue_Register1 , _currentPhase );--戰鬥階段
	AddBuff( _bossID , _gConsts._phaseBuffGUIDs[ _currentPhase ] , 0 , -1 );	-- 戰鬥階段對應 Buff
	
--	CallPlot( ReadRoleValue( _bossID , EM_RoleValue_AttackTargetID ) , "Lua_703148_Skill_Clear" );--清除玩家技能感染數值
	CallPlot( _bossID , "Cl_Resist_HackersFightBegin" );
end--function Lua_703148_AI_onFight()

function Lua_703148_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
---	DebugMsg( 0 , 0 , "--Lua_703148_AI_Engage" );
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;--_captainID
	--local _roomID = _gConsts._roomID;
	local _ctrlID = _gConsts._ctrlID;

	--Routines Vars
	local _clock = 0;
	local _availableTargetPlayer = nil;--hash list
	local _engaging = true;
	--Routines Vars
		--Lua_RandomPlayerFromHateList
	
	local _timeTick = 1;--Time Speed
	local _miniTimeTick = _timeTick*10;--Time Speed for Sleep
	
	local _GCD = 5;
	local _CD = {
			_phase4Cycle = -1 , --第四階段 行為循環時間 先鎖起來 到第四階段才開啟
		}

	-----------------------------------------狂暴參數
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;
	----------------------------END----------狂暴參數

	-----------------------------------------階段轉換
	local _bossHpRatio = 0;
	local _phaseTransformPeriodRatio = 0.3;--HP每損耗30%轉換階段
	local _hpStepping = 1.0 - _phaseTransformPeriodRatio;--下一階段轉換比例
	----------------------------END----------階段轉換

	local _hateListCounter = 0;
	
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
		if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss 死亡時 挑戰成功
			DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
			Lua_703148_AI_Conquered( _roomID );
			break;
		end

		if ( not _engaging ) then--都沒有存活玩家時 任務失敗
			DebugMsg( 0 , 0 , "--quit fight" );
			--Lua_703148_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--清除區域玩家所有相關BUFF
			Lua_703148_AI_Reset( _roomID );
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
				AddBuff( _bossID , 625849 , 0 , -1 );-- 625849 神棄
				DebugMsg( 0 , 0 , "-----狂狂暴----" );
				ScriptMessage(_bossID,0,2,"[LUA_703148_AI_FRENZY]",0);	-- 油黑滑動的物質從腳下如同深色水窪延伸，虛空的力量即將釋出！
		end		
	
		-----------------------------------------------戰鬥階段轉換
		_bossHpRatio = ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP );--HP ratio
		if ( _bossHpRatio <= _hpStepping ) then--扣血超過30%觸發
			if ( _hpStepping > 0 ) then
				_hpStepping = _hpStepping - _phaseTransformPeriodRatio;--next transform ratio
				local _currentPhase = ReadRoleValue( _bossID , EM_RoleValue_Register1 );
				local _currentPhaseBuffGUID = _gConsts._phaseBuffGUIDs[ _currentPhase ] or 0;
				
				for _index , _phaseBuffGUID in pairs( _gConsts._phaseBuffGUIDs ) do--
					CancelBuff_NoEvent( _bossID , _phaseBuffGUID );--暫時解除所有階段的標記BUFF --防止卡招
				end
				
				_currentPhase = _currentPhase + 1;
				WriteRoleValue( _bossID , EM_RoleValue_Register1 , _currentPhase );

				if ( _currentPhase <= 3 ) then--2.3表演
					Lua_703148_PhaseSwitchPerformance( _bossID , _gConsts );--階段轉換表演
				else
					Lua_703148_FinalPhasePerformance( _bossID , _gConsts );--第四階段表演 --該段表演會拖時間
					_CD._phase4Cycle = _gConsts._phase4CycleCD;--開啟第四階段計時器
				end
		
				for _index , _phaseBuffGUID in pairs( _gConsts._phaseBuffGUIDs ) do--重新加上階段BUFF
					if ( _index > _currentPhase ) then break; end
					AddBuff( _bossID , _phaseBuffGUID , 0 , -1 );--加上該階段的BUFF
				end

				DebugMsg( 0 , 0 , "Switch to Phase : ".._currentPhase.."  , PhaseBuff : ".._currentPhaseBuffGUID.."  , Next Ratio : ".._hpStepping );
			end
		end
		-------------------------------------END-----戰鬥階段轉換
		
		--技能 機制
		for i = 1 , 1 , 1 do--switch case simulation	--模擬 switch case 
			if ( _GCD > 0 ) then break; end	--當GCD鎖住時不執行	--GCD用來防止招式被吃掉

			if( _CD._phase4Cycle == 0 )then
				DebugMsg( 0 , 0 , "--_timer2 release" );
				Lua_703148_FinalPhasePerformance( _bossID , _gConsts );--第四階段表演  --該段表演會使TIMER延遲
				_CD._phase4Cycle = _gConsts._phase4CycleCD;
				_GCD = 2;
				break;
			end
		end

	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703148_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703148_AI_Reset( _roomID )	-- 梅希雅 戰鬥結束
	DebugMsg( 0 , 0 , "--Lua_703148_AI_Reset" );

	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
	
	local _bossID = _gConsts._bossID;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703148_AI_RESET]",0);	-- 你終究敵不過這個將忘卻者能力運用自如的怪物……

	DW_UnFight( _bossID , true );
	Delobj( _frontDoorID );	--刪除前門
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 20 );

	DelFromPartition( _bossID );
	
	--_Lua_703148_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 50 );

	DW_UnFight( _bossID , false );
	SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos );
	AddToPartition( _bossID , _roomID );
	
end--function Lua_703148_AI_Reset( _roomID )

function Lua_703148_AI_Conquered( _roomID )	-- 梅希雅 死亡劇情
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703148_AI_Conquered" );
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];--for read

	if( _gConsts == nil ) then return; end
	Delobj( _gConsts._frontDoorID );	--刪除前門
	Delobj( _gConsts._backDoorID );	--刪除後門

	ScriptMessage(_gConsts._bossID,0,2,"[$MUTE]".."[LUA_703148_AI_CONQUERED]",0);	-- 對於這墮落的大祭司而言，這最後的死法令人不勝唏噓。

	sasa_ZoneDungeon_title_01(530999)  --Z33-2 尾王 渡鴉之心
	
	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703148_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	Cl_Resist_HackersBossDead();
end--function Lua_703148_AI_Conquered( _roomID )

-----------------------------------sub functions

----------------------------------------------------------------------------performance階段轉換表演
function Lua_703148_PhaseSwitchPerformance( _bossID , _gConsts )
	--MagicInterrupt( _bossID );
	Sleep( 20 );
	local x,y,z,dir = DW_Location( _gConsts._flagGUID , _gConsts._roomCenterFlagPos );
	DebugMsg( 0 , 0 , "--Lua_703148_PhaseSwitchPerformance : Move Wait : ".._gConsts._flagGUID.." , ".._gConsts._roomCenterFlagPos.."  :  "..x.." , "..y.." , "..z.." , " );
	
	CastSpell( _bossID , _bossID , 851925 );--851925傳送
	--LuaFunc_MoveToFlag( _bossID , _gConsts._flagGUID , _gConsts._roomCenterFlagPos , 0 );
	--LuaFunc_WaitMoveTo( _bossID , x,y,z );
	--DebugMsg( 0 , 0 , "--Lua_703148_PhaseSwitchPerformance : Move Wait : ".._wait );
	Sleep( 40 );
	SetPos( _bossID , x,y,z,dir );
	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703148_AI_NEWPHASE]",0);	-- [108830]回到了中央實行下一波攻擊！
	--MagicInterrupt( _bossID );
	Sleep( 10 );
	DebugMsg( 0 , 0 , "--Lua_703148_PhaseSwitchPerformaWWnce : 虛空破碎" );
	CastSpell( _bossID , _bossID , 851920 );--851920虛空破碎
	BeginPlot( _bossID , "Lua_703148_Skill_TatteredSpace" , 20 );
	local _stunTime_miniSec = 0;
	while( _stunTime_miniSec < 50 ) do
		StopMove( _bossID , true );
		_stunTime_miniSec = _stunTime_miniSec + 1;
		sleep( 1 );
	end

	DebugMsg( 0 , 0 , "--Lua_703148_PhaseSwitchPerformance : 新階段" );
end

function Lua_703148_FinalPhasePerformance( _bossID , _gConsts )
	--MagicInterrupt( _bossID );
	Sleep( 20 );
	local _stunBuffGUID = 625878;--625878玩家癡呆5秒BUFF
	local x,y,z,dir = DW_Location( _gConsts._flagGUID , _gConsts._roomCenterFlagPos );
--	DebugMsg( 0 , 0 , "--Lua_703148_FinalPhasePerformance : Move Wait : ".._gConsts._flagGUID.." , ".._gConsts._roomCenterFlagPos.."  :  "..x.." , "..y.." , "..z.." , " );
	
	CastSpell( _bossID , _bossID , 851925 );--851925傳送

	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 700 , true );

	Sleep( 40 );
	SetPos( _bossID , x,y,z,dir );
	MagicInterrupt( _bossID );

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703148_AI_FINALPHASE]",0);	-- 考驗將至，[108830]即將施展最後的墮落魔法！

	for _index , _playerID in pairs( _rangePlayerList ) do
		AddBuff( _playerID , _stunBuffGUID , 0 , 6 );----625878玩家癡呆5秒BUFF
		WriteRoleValue( _playerID , EM_RoleValue_HP , 1 );--設定為1
	end

	local _stunTime_miniSec = 0;
	while( _stunTime_miniSec < 50 ) do
		StopMove( _bossID , true );
		_stunTime_miniSec = _stunTime_miniSec + 1;
		sleep( 1 );
	end

	DebugMsg( 0 , 0 , "--Lua_703148_FinalPhasePerformance : 最終階段 : 梅希雅之怒" );
	CastSpell( _bossID , _bossID , 851919 );--851919梅希雅之怒
end
------------------------------------------------------------END-------------performance階段轉換表演


-------------------------------------------------------------------------------------技能
--function Lua_703148_Skill_Clear()--for test
--	local _ownerID = OwnerID();
----	DebugMsg( 0 , 0 , "--Lua_703148_Skill_Clear : ".._ownerID.." : "..ReadRoleValue( _ownerID , EM_RoleValue_Register7 ).." : "..ReadRoleValue( _ownerID , EM_RoleValue_Register8 ) );
--	WriteRoleValue( _ownerID , EM_RoleValue_Register7 , 0 );
--	WriteRoleValue( _ownerID , EM_RoleValue_Register8 , 0 );
--	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 1500 , false );--尋找所有玩家 並清除預設
--	for _index , _playerID in pairs( _rangePlayerList ) do--
--	--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_Clear : ".._playerID.." : "..ReadRoleValue( _playerID , EM_RoleValue_Register7 ).." : "..ReadRoleValue( _playerID , EM_RoleValue_Register8 ) );
--		WriteRoleValue( _playerID , EM_RoleValue_Register7 , 0 );
--		WriteRoleValue( _playerID , EM_RoleValue_Register8 , 0 );
--	end
--end
--
--function Lua_703148_Skill_SpaceCorrosion()--傳染機制 虛幻腐蝕 結束時的 執行劇情
--	local _ownerID = OwnerID();
--	local _targetID = TargetID();
--	
--	local _thisBuffID = 625876;--625876虛幻腐蝕
--	local _maxBuffScale = 5;--最高級感染層數
--	
--	local _currentBuffScale = ReadRoleValue( _ownerID , EM_RoleValue_Register7 );--目前的傳染層數
--	local _nextBuffScale = 0;
----	DebugMsg( 0 , 0 , "--Lua_703148_Skill_SpaceCorrosion : ".._ownerID.." : ".._currentBuffScale..ReadRoleValue( _ownerID , EM_RoleValue_Register8 ) );
--
--		----sub functions
--		local function ClearInfectedData( _currentInfectedID )--清除感染途徑  --請用最後一個感染者的ID 當指標頭
--			local _prevInfectedID = ReadRoleValue( _currentInfectedID , EM_RoleValue_Register8 );
--			
--			--set default
--			WriteRoleValue( _currentInfectedID , EM_RoleValue_Register7 , 0 );
--			WriteRoleValue( _currentInfectedID , EM_RoleValue_Register8 , 0 );
--		--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_SpaceCorrosion : Clear Infection : ".._currentInfectedID );
--		
--			if ( _prevInfectedID ~= 0 ) then--當前傳染者存在時 則一併清除他的資料
--				ClearInfectedData( _prevInfectedID );
--			end
--
--			return;
--		end
--
--		--都沒有感染者存在的情況，則會依照剩餘傳染次數，給予BOSS對應層數的蝕幻狀態。
--		local function AddBossBuffLevel_And_ClearAllInfected()--清除感染途徑  並  給BOSS對應狀態
--			local _maxInfected = _maxBuffScale - _currentBuffScale + 1;--最高傳染層數
--			--給予BOSS對應層數的蝕幻狀態。
--			local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
--			local _bossID = _Lua_703148_AI_GlobalVars[ _roomID ]._bossID;
--			local _bossRewardBuffGUID = 625578;--625578蝕幻
--			local _currentBuffLv = Lua_703107_Return_Buff_Lv( _bossID , _bossRewardBuffGUID );
--			_currentBuffLv = _currentBuffLv + _maxInfected;
--			CancelBuff_NoEvent( _bossID , _bossRewardBuffGUID );
--			AddBuff( _bossID , _bossRewardBuffGUID , _currentBuffLv , -1 );
--
--		--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_SpaceCorrosion : the last" );
--			--清除所有感染者資料
--			ClearInfectedData( _ownerID );--用最後一個感染者的ID 當指標頭
--		end
--
--	if ( _currentBuffScale <= 0 ) then--當目前感染者的值為0時 則代表他 是第一帶原者  
--		_currentBuffScale = _maxBuffScale;--將目前感染者設為最高級感染
--		WriteRoleValue( _ownerID , EM_RoleValue_Register7 , _currentBuffScale );
--		WriteRoleValue( _ownerID , EM_RoleValue_Register8 , 0 );--沒有前感染者  此舉是為了確保link list斷尾
--	end
--
--	if ( _currentBuffScale == 1 ) then----當目前感染者的值為1時 則代表他是 最後的帶原者
--		AddBossBuffLevel_And_ClearAllInfected();--清除感染途徑  並  給BOSS對應狀態
--		return;--感染完成 直接中斷
--	end
--
--	_nextBuffScale = _currentBuffScale - 1;--下一個感染者的層數
--		
--	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 100 , true );--尋找下一個感染者
--	for _index , _playerID in pairs( _rangePlayerList ) do--在人群中尋覓
--		if ( _playerID ~= _ownerID and ReadRoleValue( _playerID , EM_RoleValue_Register7 ) == 0 and CheckBuff( _playerID , _thisBuffID ) == false ) then--Transmissible 當下一個感染者的值為0時 則代表他是 可感染對象 
--			--有效感染者存在的情況
--			WriteRoleValue( _playerID , EM_RoleValue_Register7 , _nextBuffScale );--將下一個感染者的 記值 寫為下一個感染階層
--			WriteRoleValue( _playerID , EM_RoleValue_Register8 , _ownerID );--將下一個感染者的 記值 寫為當前感染者的ID --回頭追蹤時的指標
--			AddBuff( _playerID , _thisBuffID , 0 , _nextBuffScale );--感染下一個感染者 並宣告為新的時間(_nextBuffScale)
--		--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_SpaceCorrosion : the next : ".._playerID.." : ".._nextBuffScale );
--			return;--感染完成 直接中斷
--		end
--	end
--
--	--若距離內無其他玩家   
--	AddBossBuffLevel_And_ClearAllInfected();--清除感染途徑  並  給BOSS對應狀態
--
--end

local function CompDis( A, B )	-- 比較遠近，提供此編號的 Script 判斷距離用

	if A.Dis < B.Dis then
		return true;
	end
end

function MagicBase_625877_Plot()	-- 虛幻腐蝕

	local Boss = OwnerID();
	local Player = TargetID();
	local Obj = Hao_CreateSpellObj( Player, 0, 60 );	-- 隱形物件，用以監控各虛幻腐蝕的獨立資料
	CallPlot( Obj, "MagicBase_625877_Plot2", Obj, Boss, Player );
end

function MagicBase_625877_Plot2( Obj, Boss, Player )

	local DebuffID = 625876;	-- 虛幻腐蝕ID，附加於玩家身上
	local BuffID = 625578;	-- 蝕幻ID，附加於 Boss 身上
	local BossActID = 490183;	-- 返回給Boss的特效
	local PlayerActID = 490182;	-- 傳染至玩家的特效
	local Count = 5;	-- 傳染次數
	local Time = 5;	-- 傳染秒數
	local AdjTime = 1;	-- 每次傳染後遞減的時間
	local Distance = 100;	-- 傳染半徑
	local HitUnit = {};	-- 已經被傳染過的目標
	
	for i = 1, Count do
		local NewCount = Count - i;
		AddBuff( Player, DebuffID, NewCount, Time );
		table.insert( HitUnit, Player );	-- 將被傳染的目標塞進命中清單中，避免重複傳染
		if i == Count then	-- 最後一次時，不再掃描周圍目標
			break;
		end
		Sleep( Time * 10 );
		if not CheckID( Player ) or ReadRoleValue( Player, EM_RoleValue_IsDead ) == 1 then
			AddBuff( Boss, BuffID, NewCount-1, -1 );	-- 給予 Boss 對應層數
			break;
		end

	--	local TargetList = SearchRangeNPC( Player, Distance );
		local TargetList = KS_GetHateList( Boss, 4 );	-- 仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4 過濾GM )
		local Targets = {};
		for j = 1, #TargetList do
			local Obj = {};
			local Dis = GetDistance( Player, TargetList[j] );
		--	if Dis < Distance and GetModeEx( TargetList[j], EM_SetModeType_Fight ) then
			if Dis < Distance then
				local insert = true;
				for k = 1, #HitUnit do
					if TargetList[j] == HitUnit[k] then	-- 目標已被傳染
						insert = false;
						break;
					end
				end
				if insert then	-- 符合傳染半徑內且沒有被傳染過的目標
					Obj.Guid = TargetList[j];
					Obj.Dis = Dis;
					table.insert( Targets, Obj );
				end
			end
		end

		if #Targets == 0 then	-- 當範圍內沒有符合的玩家時
			SysCastSpellLv( Player, Boss, BossActID, 0 );	-- 表演返回特效
			AddBuff( Boss, BuffID, NewCount-1, -1 );	-- 給予 Boss 對應層數
			break;
		end

		table.sort( Targets, CompDis );	-- 將仇恨表內的玩家依照距離由近至遠排序
		SysCastSpellLv( Player, Targets[1].Guid, PlayerActID, 0 );	-- 表演傳染特效
		Time = Time - AdjTime;
		Player = Targets[1].Guid;	-- 範圍內最近，且符合條件的目標
	end
	DelObj( Obj );
end

function Lua_703148_Skill_TatteredSpace()--虛空破碎
	local _ownerID = OwnerID();
	local _targetID = TargetID();
--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_TatteredSpace : ".._ownerID.." : ".._targetID );

	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];

	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 600 , false );--尋找玩家 

	local _spaceGhostID = 0;--虛空魔靈
	local x,y,z,dir = DW_Location( _ownerID );
	for _index , _playerID in pairs( _rangePlayerList ) do--
		_spaceGhostID = _gConsts.ExtObj( 109076 , x,y,z,dir );--109076虛空魔靈
		WriteRoleValue( _spaceGhostID , EM_RoleValue_PID , _playerID );--每人對應一隻
	end
	return true;
end

function Lua_703148_AI_SpaceGhost_Init()--109076虛空魔靈
	local _ownerID = OwnerID();
	local _targetID = TargetID();
--	DebugMsg( 0 , 0 , "--Lua_703148_AI_SpaceGhost_Init : ".._ownerID.." : ".._targetID );
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , true );		--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , false );		--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	WriteRoleValue( _ownerID , EM_RoleValue_IsWalk , 1 );
	
	CallPlot( _ownerID , "Lua_703148_AI_SpaceGhost_OnFight" , _ownerID );
end

function Lua_703148_AI_SpaceGhost_OnFight( _ownerID )--109076虛空魔靈
	--local _ownerID = OwnerID();
	Sleep( 50 );
	local _targetID = ReadRoleValue( _ownerID , EM_RoleValue_PID );
--	DebugMsg( 0 , 0 , "--Lua_703148_AI_SpaceGhost_OnFight : ".._ownerID.." : ".._targetID );

	local x,y,z,dir = 0;
	local _clock = 0;
	while ( _clock < 20 ) do
		x,y,z,dir = DW_Location( _targetID );
		Move( _ownerID , x,y,z );
		SysCastSpellLv( _ownerID , _targetID , 851909 , 0 );--連線特效
		if ( CheckDistance( _ownerID , _targetID , 15 ) ) then
			SysCastSpellLv( _ownerID , _targetID , 851923 , 0 );
		end

		_clock = _clock + 1;
		--DebugMsg( 0 , 0 , "--e04su3su;6el3gk6ak7 : ".._clock );
		Sleep( 5 );
	end
--	DebugMsg( 0 , 0 , "--Lua_703148_AI_SpaceGhost_OnFight : Time's up" );
	--851923自體毀滅
	SysCastSpellLv( _ownerID , _ownerID , 851923 , 0 );
end

function Lua_703148_AI_SpaceGhost_OnDead()--109076虛空魔靈
	local _ownerID = OwnerID();
	local _targetID = TargetID();
--	DebugMsg( 0 , 0 , "--Lua_703148_AI_SpaceGhost_OnDead : ".._ownerID.." : ".._targetID );
end

--------------------------------------------------------------------------------------------------------忘卻血泡
function Lua_703148_Skill_BloodBubble()--忘卻血泡執行劇情
	local _ownerID = OwnerID();
	local _targetID = TargetID();
--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_BloodBubble : ".._ownerID.." : ".._targetID );
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
	
	local _maxBubble = 2;
	local _allBloodBuff = 625579;--625579鮮血滿身

	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 600 , false );--尋找所有玩家 並清除預設
	local _effectiveTarget = {};--有效目標清單
	for _index , _playerID in pairs( _rangePlayerList ) do--
		if ( CheckBuff( _playerID , _allBloodBuff ) and #_effectiveTarget < _maxBubble ) then
			table.insert( _effectiveTarget , _playerID );
		end
		CancelBuff_NoEvent( _playerID , _allBloodBuff );
	end

	local _bloodBubbleID = 0;
	local x,y,z,dir = 0;
	
	for _index , _playerID in pairs( _effectiveTarget ) do--血泡直接出生在身上有 鮮血滿身的人
		x,y,z,dir = DW_Location( _playerID );
		_bloodBubbleID = _gConsts.ExtObj( 109081 ,x,y,z,dir );--109081血泡
		_maxBubble = _maxBubble - 1;--為了計數未完的
		WriteRoleValue( _bloodBubbleID, EM_RoleValue_PID, _ownerID );
	end

	if ( _maxBubble <= 0 ) then return; end--當人數夠了 便不再補
	
	x,y,z,dir = DW_Location( _ownerID );--不足的出現在BOSS附近
	local _x,_z = 0;
	for _i = 1 , _maxBubble , 1 do--血泡出生在BOSS附近
		--109081
		_x = x + ( RandRange( 1 , 100 ) - 50 );
		_z = z + ( RandRange( 1 , 100 ) - 50 );
		_bloodBubbleID = _gConsts.ExtObj( 109081 ,_x,y,_z,dir );--109081血泡
		WriteRoleValue( _bloodBubbleID, EM_RoleValue_PID, _ownerID );
		--625883
	end
end

function Lua_703148_Item_BloodBubble_Init()--NPC 109081血泡

	local _ownerID = OwnerID();
	SetModeEx( _ownerID, EM_SetModeType_HideName , false );	-- 顯示名稱
	SetModeEx( _ownerID, EM_SetModeType_NotShowHPMP , false );	-- 顯示血條
	SetModeEx( _ownerID, EM_SetModeType_Strikback , false );	-- 會反擊
	SetModeEx( _ownerID, EM_SetModeType_Move , false );	-- 移動
	SetModeEx( _ownerID, EM_SetModeType_Fight , true );	-- 攻擊
	SetModeEx( _ownerID, EM_SetModeType_Searchenemy , false );	-- 索敵
	SetModeEx( _ownerID, EM_SetModeType_Obstruct , false );	-- 阻擋
	WriteRoleValue( _ownerID, EM_RoleValue_LiveTime , 30 );
	CallPlot( _ownerID , "Lua_703148_Item_BloodBubble_OnFight" , _ownerID );
--	AddBuff( _ownerID , 625883 , 0 , -1 );--effect 625883血泡特效

	-- 掛載血泡特效，避免以 AddBuff 直接掛載時，當游標點擊至該目標後，目標身上的特效會全泛白光的問題
	local OwnerPos = Vector_GetRolePos( _ownerID );
	local Dir = ReadRoleValue( _ownerID, EM_RoleValue_Dir );
	local Room = ReadRoleValue( _ownerID, EM_RoleValue_RoomID );
	local Obj = CreateObj( 106973, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
	SetModeEx( Obj, EM_SetModeType_Move, false );	-- 移動
	SetModeEx( Obj, EM_SetModeType_Mark, false );	-- 標記
	SetModeEx( Obj, EM_SetModeType_ShowRoleHead, false );	-- 頭像
	SetModeEx( Obj, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( Obj, EM_SetModeType_Fight, false );	-- 砍殺
	SetModeEx( Obj, EM_SetModeType_Strikback, false );	-- 反擊
	AddToPartition( Obj, Room );
	AttachObj( Obj, _ownerID, 4, "p_down", "p_down" );
	CallPlot( Obj, "Zone_175_Boss3_CheckDead", Obj, _ownerID );
end

function Lua_703148_Item_BloodBubble_OnFight( _ownerID )----NPC 109081血泡

	local Target
	local Boss = ReadRoleValue( _ownerID, EM_RoleValue_PID );	-- 梅希雅
	if Boss ~= 0 then
		Target = Boss;
	else
		Target = _ownerID;
	end
	local TargetPos = Vector_GetRolePos( _ownerID );

	while true do
		SysCastSpellLv_Pos( Target, TargetPos.x, TargetPos.y, TargetPos.z, 851922, 0 );	-- 血泡
		Sleep(5);
	end
end

function Lua_703148_Item_BloodBubble_OnDead()----NPC 109081血泡
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
--	DebugMsg( 0 , 0 , "--Lua_703148_Item_BloodBubble_OnDead : ".._ownerID.." : ".._targetID );
	AddBuff( _targetID , 625579 , 0 , -1 );
	--local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
end
----------------------------------------------------------------------------------END-------------------忘卻血泡

-----------------------------------------------------------------------------------------------虛空幻境
function Lua_703148_Skill_SpaceIllusion()--虛空幻境執行劇情

	local _ownerID = OwnerID();
--	local _targetFlagPosInfo = { 4 , 5 };	-- 目標被傳送位置的對應資訊( 清單長度同時指出最大數量 )
	local _targetFlagPosInfo = { 4 };	-- 目標被傳送位置的對應資訊( 清單長度同時指出最大數量 )
	local _hateList = KS_GetHateList( _ownerID, 1 );	-- 仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4 過濾GM )

	if # _hateList < #_targetFlagPosInfo+1 then	-- 玩家不足則不執行
		DebugMsg( 0, 0, "hatelist = "..#_hateList );
		return false;
	end

--	local _targetID = TargetID();
--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_SpaceIllusion : ".._ownerID.." : ".._targetID );

	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];	-- 呼叫中控器
	local _flagGUID = _gConsts._flagGUID;

	for _index , _flagPos in pairs( _targetFlagPosInfo ) do

		local _currentPlayerID = _hateList[ #_hateList - _index + 1 ];	--取表尾

		if GetDistance( _ownerID, _currentPlayerID ) < 500 then	-- 當 Boss 與目標距離 500 以內時才執行傳送
			local PlayerPos = Vector_GetRolePos( _currentPlayerID );	--傳送前的玩家座標
			local PlayerDir = ReadRoleValue(  _currentPlayerID, EM_RoleValue_Dir );	-- Dir
			local x,y,z,dir = DW_Location(  _flagGUID , _flagPos );
			AddBuff( _currentPlayerID, 625882, 0, -1 );	-- 625882虛空幻境定身BUFF
			SetPos( _currentPlayerID, x,y,z,dir );	--傳送玩家到對應位置
			CancelBuff_NoEvent( _currentPlayerID, 625882 );
		
			local VecDir = Vector_GetRoleDir( dir );	-- 角度轉向量
			local FlagPos = CVector:new( x,y,z );	-- 將座標變數轉 Matatable，方便向量運算
			local VoidPos = FlagPos + VecDir * 50;	-- 距離玩家前方 50 的位置
			local VoidDir = dir + 180;	-- 讓虛空行者面對玩家
			if VoidDir > 360 then
				VoidDir = dir - 360;
			end
		
			local VoidTraveler = CreateObj( 109077, VoidPos.x, VoidPos.y, VoidPos.z, VoidDir, 1 );	--109077 虛空行者
			SetModeEx( VoidTraveler, EM_SetModeType_Strikback, true );	-- 反擊
			SetModeEx( VoidTraveler, EM_SetModeType_Move, true );	-- 移動
			SetModeEx( VoidTraveler, EM_SetModeType_Fight, true );	-- 攻擊
			SetModeEx( VoidTraveler, EM_SetModeType_Searchenemy, true );	-- 索敵
			AddToPartition( VoidTraveler, _roomID );
			ScriptMessage( VoidTraveler, _currentPlayerID, 1, "[LUA_703148_AI_KILLAGENTIN20SEC]", 0);--你必須在20秒內擊殺虛空行者
			WriteRoleValue( VoidTraveler, EM_RoleValue_PID, _currentPlayerID );--紀錄對應目標的ID
			WriteRoleValue( VoidTraveler, EM_RoleValue_Register1, PlayerPos.x );--紀錄對應目標的位置
			WriteRoleValue( VoidTraveler, EM_RoleValue_Register2, PlayerPos.y );--紀錄對應目標的位置
			WriteRoleValue( VoidTraveler, EM_RoleValue_Register3, PlayerPos.z );--紀錄對應目標的位置
			WriteRoleValue( VoidTraveler, EM_RoleValue_Register4, PlayerDir );--紀錄對應目標的位置
			CallPlot( VoidTraveler, "Zone_175_Boss3_109077_Init", VoidTraveler, _currentPlayerID, PlayerPos, PlayerDir );
			SetPlot( VoidTraveler, "Dead", "Zone_175_Boss3_109077_Dead", 0 );
		end
	end
end

function Zone_175_Boss3_109077_Dead()

	local Owner = OwnerID();
	local Player = ReadRoleValue( Owner, EM_RoleValue_PID );
	SetPlot( Owner, "Dead", "", 0 );
	ScriptMessage( Owner, Player, 1, "[LUA_703148_AI_AGENTKILLED]", 0 );	-- 你已經擊殺虛空行者
	SetModeEx( Owner, EM_SetModeType_Move, false );	-- 移動
	PlayMotionEx( Owner, 145, 146 );	-- 播放死亡動作
	BeginPlot( Owner, "Zone_175_Boss3_109077_Dead2", 0 );
	return false;
end

function Zone_175_Boss3_109077_Dead2()

	local Owner = OwnerID();
	local Player = ReadRoleValue( Owner, EM_RoleValue_PID );
	local PlayerPos = {};
	PlayerPos.x = ReadRoleValue( Owner, EM_RoleValue_Register1 );
	PlayerPos.y = ReadRoleValue( Owner, EM_RoleValue_Register2 );
	PlayerPos.z = ReadRoleValue( Owner, EM_RoleValue_Register3 );
	local PlayerDir = ReadRoleValue( Owner, EM_RoleValue_Register4 );
	local Root = 625882;	-- 定身

	Sleep( 10 );
--	ScriptMessage( Owner, Player, 1, "[LUA_703148_AI_AGENTKILLED]", 0 );	-- 你已經擊殺虛空行者
	AddBuff( Player, Root, 0, -1 );
	Sleep( 10 );
	SetPos( Player, PlayerPos.x, PlayerPos.y, PlayerPos.z, PlayerDir );	-- 傳送玩家回家
	CancelBuff_NoEvent( Player, Root );
	DelObj( Owner );
end

function Zone_175_Boss3_109077_Init( Owner, Player, PlayerPos, PlayerDir )	-- 虛空行者起始劇情

	local Counter = 0;
	local LimitTime = 20;	-- 20 秒內必須要殺死虛空行者

	while Counter < LimitTime and CheckID( Player ) and ReadRoleValue( Player, EM_RoleValue_IsDead ) == 0 do
		SetAttack( Owner, Player );	--指定攻擊目標
		Counter = Counter + 1;
		Sleep(10);
	end

	if Counter == LimitTime then
		CastSpell( Owner, Player, 851921 );	-- 幻境裂痕 扣除100%生命
	end
	Sleep( 20 );
	SetPos( Player, PlayerPos.x, PlayerPos.y, PlayerPos.z, PlayerDir );	-- 傳送玩家的屍體回原始位置
	Sleep( 10 );
	DelObj( Owner );
end
--------------------------------------------------------------------------END------------------虛空幻境

-------------------------------------------------------------------------------------------------幻滅魔沼
--function Lua_703148_Skill_DevilSwamp()--幻滅魔沼執行劇情
--	local _ownerID = OwnerID();
----	local _targetID = TargetID();
----	DebugMsg( 0 , 0 , "--Lua_703148_Skill_DevilSwamp : ".._ownerID.." : ".._targetID );
--	--每間隔一秒產生約範圍50碼的黑色液體，2秒後爆炸劇烈傷害，爆炸效果持續2秒後消失，共出現10個。
--	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
--	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
--	CallPlot( _ownerID , "Lua_703148_Skill_DevilSwamp_Execute" , _ownerID , _gConsts , _roomID );
--end
--
--function Lua_703148_Skill_DevilSwamp_Execute( _ownerID , _gConsts , _roomID )--幻滅魔沼執行劇情
--	local x,y,z,dir = DW_Location( _gConsts._flagGUID , _gConsts._roomCenterFlagPos );--以場景中央為圓心
--	local _puddleNpcGUID = 109078;--109078黑色液體
--	
--	local _maxPuddle = 30;
--	local _x,_z = 0;
--	local _puddleNpcID = 0;
--	for _i = 1 , _maxPuddle , 1 do
--		--產生黑色液體
--		_x = x + ( RandRange( 1 , 600 ) - 300 );
--		_z = z + ( RandRange( 1 , 600 ) - 300 );
--		_puddleNpcID = CreateObj( _puddleNpcGUID , _x,y,_z,dir , 1 );
--		AddToPartition( _puddleNpcID , _roomID );
--		Sleep( 5 );
--	end
--	
--	return;
--end

function MagicBase_625570_Plot()	-- 幻滅魔沼

	local Boss = OwnerID();
	CallPlot( Boss, "MagicBase_625570_Plot2", Boss );
end

function MagicBase_625570_Plot2( Boss )

	local TargetList = KS_GetHateList( Boss, 4 );	-- 仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4 過濾GM )

	if #TargetList == 0 then	-- 當仇恨表內沒有玩家時
		return false;
	end

	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local ObjID = 109078;	-- 黑色液體
	local CreateObjCount = 10;	-- 每次產生的總數量

	while CreateObjCount > 0 do
		local Targets = {};
		for i = 1, #TargetList do
			if GetDistance( Boss, TargetList[i] ) < 300 then	-- 距離小於 300 以內時才列入目標
				table.insert( Targets, TargetList[i] );
			end
		end

		if #Targets ~= 0 then	-- 有符合的目標時
			local Target = Targets[Math.Random( #Targets )];	-- 仇恨表內隨機一名玩家
		--	local Obj = Hao_CreateSpellObj( Target, 0, 10 ); 
			local TargetPos = Vector_GetRolePos( Target );	-- 目標座標
			local Obj = CreateObj( ObjID, TargetPos.X, TargetPos.Y, TargetPos.Z, 0, 1 );
			AddToPartition( Obj, Room );
			CreateObjCount = CreateObjCount - 1;
		--	DebugMsg( 0, Room, "Disillusion "..CreateObjCount );
		end
		Sleep(10);
	end
end

function Lua_703148_Item_DarkPuddle_Init()--NPC 109078幻滅魔沼
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ownerID, EM_SetModeType_Mark, false );	-- 不顯示標記
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , false );	--顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , false );		--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , false );		--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--有阻擋效果
	local _liquidEffectGUID = 625881;--625881幻滅魔沼特效
	AddBuff( _ownerID , _liquidEffectGUID , 0 , -1 );--effect
	CallPlot( _ownerID , "Lua_703148_Item_DarkPuddle_Plot", _ownerID );
end

function Lua_703148_Item_DarkPuddle_Plot( Owner )--黑色液體

	local AttackTickCount = 5; 	-- 攻擊次數
	local AttackTickTime = 4;	-- 每次攻擊後的間隔時間(單位:0.1秒)
--	local LiveTime = Math.Ceil(AttackTickCount * AttackTickTime/10) + 1;
--	WriteRoleValue( Owner, EM_RoleValue_LiveTime, LiveTime );
	Sleep( 20 );
	SysCastSpellLv( Owner, Owner, 490177, 0 );	-- 2015.09.25 Hao：特效，該特效的 explode 為 2 秒週期，故與傷害拆分，避免特效無法播放完全的問題。
	for i = 1, AttackTickCount do	-- 傷害
		SysCastSpellLv( Owner, Owner, 851908, 0 );	-- 851908 劇烈爆炸
		Sleep(AttackTickTime);
	end
	KillID( Owner, Owner );
end
-----------------------------------------------------------------------------------END-----------幻滅魔沼
-------------------------------------------------------------------END---------------技能

local g_Attacked = {};	-- 複數虛空大道在同時間擊中同一目標時，只會執行一次傷害，避免重複命中

function MagicBase_500156_Plot()	-- 虛空大道

	local Boss = OwnerID();
	local Player = TargetID();
	local Stages = { 625872, 625873, 625874, 625875 };	-- 階段 1 ~ 4
	local Stage = 2;	-- 虛空大道每次施放時的道數，預設為階段 1 的 2 條

	for i = 1, #Stages do
		if CheckBuff( Boss, Stages[i] ) then
			Stage = i + 1;
		end
	end

--	local Dir = ReadRoleValue( Boss, EM_RoleValue_Dir );
	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID );

--	local Stage = 4;
	local Divide = 360 / Stage	-- 將圓角度均分
	g_Attacked[Room] = {};	-- 每次施放時重置

	for i = 1, Stage do
		local Dir = Math.Random( Divide*(i-1), Divide*i );	-- 增加亂數
		local Obj = Hao_CreateSpellObj( Player, Dir ); 
		SysCastSpellLv( Obj, Obj, 490180, 0 );
		CallPlot( Obj, "MagicBase_500156_Plot2", Obj, Boss, Room, Dir );
	end
end

function MagicBase_500156_Plot2( Owner, Boss, Room, Dir )	-- 範圍判定由 Lua 進行，不使用法術集合，法術集合沒辦法以飛行道具的方式設定，也不能設定寬度

	-- 技能設定 (仿三專的法術盒子 )
	local Distance = 120;	-- 有效長度
	local Width = 15;	-- 有效寬度(半徑，總寬需*2)
	local Height = 60;	-- 有效高度
	local FlySpeed = 6;	-- 技能速度(單位:0.1秒)，建議與有效長度整除
	local FlyTime = Math.Ceil( Distance / FlySpeed );	-- 技能由起點飛行至終點的時間(單位:0.1秒)

	local OwnerPos = Vector_GetRolePos( Owner );
	local BeginPos = OwnerPos;	-- 每段區間的起點座標
	local VecDir = Vector_DirToVector(Dir+90);	-- 角度轉向量，計算ROM的角度時，要先轉 90 度角才會變為正確向量。
	local EndPos	-- 每段區間的終點座標
	local TargetList = KS_GetHateList( Boss, 4 );	-- 仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4 過濾GM )
--	DebugMsg( 0, 0, "Dir = "..tostring(Dir)..", VecDir = "..tostring(VecDir)..", FlyTime = "..FlyTime );

	while FlyTime > -1 do
		if not g_Attacked[Room][FlyTime] then	-- 當第 1 個虛空大道生成時才執行
			g_Attacked[Room][FlyTime] = {};
		--	DebugMsg( 0, 0, FlyTime..", Attacked FlyTime == nil" );
		end
		EndPos = OwnerPos + VecDir * FlySpeed;
		for i = 1, #TargetList do
			local Target = TargetList[i];
			local TargetPos = Vector_GetRolePos( Target );
			--檢查目標是否在指定長、寬的直線範圍內，否回傳Nil、是的話回傳目標與起點的距離 ( 起點座標、終點座標、寬度、高度、目標座標)
			local Status = Vector_CheckShootObj( OwnerPos, EndPos, Width, Height, TargetPos );
		--	DebugMsg( 0, 0, "No. "..i.. ", Hit = "..tostring( Status ) );
			if Status and ReadRoleValue( Target, EM_RoleValue_OrgID ) ~= 107071 and not g_Attacked[Room][FlyTime][Target] then	-- 避免其他隱形物件被刪除
				g_Attacked[Room][FlyTime][Target] = true;	-- 複數虛空大道在同時間擊中同一目標時，只會執行一次傷害，避免重複命中
			--	Say( Target, "Hit = "..tostring( Status )..", Begin:Target Distance = "..(BeginPos-TargetPos):Len() );
				SysCastSpellLv( Boss, Target, 490181, 0 );
			end
		end
		OwnerPos = EndPos;
		FlyTime = FlyTime - 1;
		Sleep(1)
	end
end