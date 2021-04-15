--Author : K.J. Aris
--Version : 14.02.12.
--Ignitor : 108896
--NPC : 108809--raid
--Script : 703141
local Skill = {}
Skill.Lv = {}
Skill.Lv[851701] = {0,0,0}
Skill.Lv[851702] = {0,0,0}
Skill.Lv[851703] = {0,0,0}
Skill.Lv[851704] = {0,0,0}
Skill.Lv[851705] = {0,0,0}

--宣告所有技能冷卻
Skill.CD = {}
Skill.CD[851701] = -1
Skill.CD[851702] = 10
Skill.CD[851703] = 13
Skill.CD[851705] = 17
Skill.CD[851704] = 20

local _Lua_703141_AI_GlobalVars = {};

function Lua_703141_AI_Init( _inputCtrID )--controller  NPC 108896  --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703141_AI_Init : NPC 108896      Z33-1B3  V140212 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --以防重複執行 將原有控制器刪除

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108896
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108809
	
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
	local _bossGUIDs = { 108809 , 109002 , 109006 };--克勒蘇
	local _toxicCorpseGUIDs = { 108926 , 109003 , 109007 };--屍毒者
	local _puppetZombieGUIDs = { 108927 , 109004 , 109008 };--傀殭屍
	local _skullTotemGUIDs = { 108928 , 109005 , 109009 };--骨製圖騰

	--參數設定表
	_Lua_703141_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossGUID = _bossGUIDs[ _difficulty ] ,--克勒蘇
					_toxicCorpseGUID = _toxicCorpseGUIDs[ _difficulty ] ,--屍毒者
					_puppetZombieGUID = _puppetZombieGUIDs[ _difficulty ] ,--屍毒者
					_skullTotemGUID = _skullTotemGUIDs[ _difficulty ] ,--骨製圖騰
					_ctrlGUID = 108705 ,--控制器ID
					_doorGUID = 106246 , 

					_flagGUID = 781406 , --781406 Z33-1_3王用旗標
					_bossFlagPos = 1 , 
					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,
					_skullTotem_1_FlagPos = 4 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD
					--_skillAeCD = 30 , --每30秒會對場上所有人施放負面狀態，單數的玩家施放「巫毒漩渦」、複數的玩家為「闇影纏繞」

					};
	--唯讀資訊
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];

	--產生 Boss
	--local x,y,z,dir = DW_Location( _gConsts._flagGUID , _gConsts._bossFlagPos );
	Lua_DavisDelObj( _gConsts._bossGUID );--kill reduplicated
	local _bossID = CreateObjByFlag( _gConsts._bossGUID , _gConsts._flagGUID , _gConsts._bossFlagPos , 1 );--108800
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
end--function Lua_703141_AI_Init( _inputCtrID )

function Lua_703141_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	--Lua_703175_ClearAll( _roomID );
	Lua_703141_AI_Init();
end

function Lua_703141_AI_onFight()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	Cl_Resist_HackersFightBegin( _bossID )
	DebugMsg( 0 , 0 , "--Lua_703141_AI_onFight ".._bossID.." RID : ".._roomID );
	Lua_DavisDelObj( 108930 );--清除腐液灘 --先清場防止隱形物件過多 
	--唯讀資訊
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703141_AI_reignite( _roomID ); return; end

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


	--generate front door

	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );
	BeginPlot( _ctrlID , "Lua_703141_AI_Engage" , 0 );

	ScriptMessage(_bossID,0,2,"[LUA_703141_AI_ONFIGHT]",0);

	--啟動骨製圖騰
	Lua_703141_Item_CreateSkullTotemDualPair( _gConsts._flagGUID , _gConsts._skullTotem_1_FlagPos );
	CallPlot( _bossID , "Cl_703141_FightAI" )
	--CallPlot( _bossID , "Cl_Resist_HackersFightBegin" );
end--function Lua_703141_AI_onFight()

function Cl_703141_FightAI()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local time = 0
	local AttackTarget = 0
	local Diff = Cl_GetDiff(172)
	--say( _bossID , "["..tostring( 851701 ).."]" )
	SysCastSpellLv( _bossID , _bossID , 851701 , 0 ) 
	while ReadRoleValue( _bossID , EM_RoleValue_IsAttackMode ) == 1 do
		sleep( 10 )
		if ReadRoleValue( _bossID , EM_RoleValue_SpellMagicID ) == 0 then
			time = time + 1
			AttackTarget = ReadRoleValue( _bossID , EM_RoleValue_AttackTargetID )
			if time%Skill.CD[851705] == 0 and 
				( ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP ) ) <= 0.5 then
				
				
				--say( _bossID , "["..tostring( 851705 ).."]" )
				CastSpellLv( _bossID , AttackTarget , 851705 , Skill.Lv[851705][Diff] ) 
			
			elseif time%Skill.CD[851704] == 0 then
				--say( _bossID , "["..tostring( 851704 ).."]" )
				CastSpellLv( _bossID , AttackTarget , 851704 , Skill.Lv[851704][Diff] ) 
				
			elseif time%Skill.CD[851703] == 0 then
				--say( _bossID , "["..tostring( 851703 ).."]" )
				CastSpellLv( _bossID , _bossID , 851703 , Skill.Lv[851703][Diff] ) 
				
			elseif time%Skill.CD[851702] == 0 then
			--	say( _bossID , "["..tostring( 851702 ).."]" )
				CastSpellLv( _bossID , _bossID , 851702 , Skill.Lv[851702][Diff] ) 
				
			end
		end
	end
end

function Lua_703141_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
	DebugMsg( 0 , 0 , "--Lua_703141_AI_Engage" );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
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
	--local _GCD = 0;--int

	--local _isFrenzied = false;
	
	local _GCD = 5;
	local _CD = {
--		_skillAeCD = _gConsts._skillAeCD ,

		}

	-----------------------------------------狂暴參數
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;

	----------------------------END----------狂暴參數

	local _hateListCounter = 0;
	local _bossHpRatio = 100;
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

		_bossHpRatio = ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP );--HP ratio
		--------------END---Routines

		-------------------------------------------------戰鬥結束條件
		if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss 死亡時 挑戰成功
			DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
			Lua_703141_AI_Conquered( _roomID );
			Cl_Resist_HackersBossDead( _bossID )
			break;
		end

		if ( not _engaging ) then--都沒有存活玩家時 任務失敗
			DebugMsg( 0 , 0 , "--quit fight" );
			--Lua_703141_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--清除區域玩家所有相關BUFF
			Lua_703141_AI_Reset( _roomID );
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
				ScriptMessage(_bossID,0,2,"[LUA_703141_AI_FRENZY]",0);
		end		


		---------------------------------------------------階段轉換條件

		if ( _bossHpRatio > 0.5 ) then

			--_CD._skillAbandonSpiritCD = _gConsts._skillAbandonSpiritCD;--不讓他倒數( 階段一不施放 )
		end

		-------------------------------------END--------階段轉換條件
	
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

		--[[if _clock%10 then
			
		end]]--
	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703141_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703141_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703141_AI_Reset" );

	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	
	local _bossID = _gConsts._bossID;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703141_AI_RESET]",0);

	DW_UnFight( _bossID , true );

	Delobj( _frontDoorID );	--刪除前門
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 20 );

	DelFromPartition( _bossID );

	Sleep( 50 );

	DW_UnFight( _bossID , false );
	SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos );
	AddToPartition( _bossID , _roomID );
	
end--function Lua_703141_AI_Reset( _roomID )

function Lua_703141_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703141_AI_Conquered" );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];--for read

	if( _gConsts == nil ) then return; end
	Delobj( _gConsts._frontDoorID );	--刪除前門
	Delobj( _gConsts._backDoorID );	--刪除後門

	ScriptMessage(_gConsts._bossID,0,2,"[$MUTE]".."[LUA_703141_AI_CONQUERED]",0);	
	
	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703141_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	--Cl_Resist_HackersBossDead();
end--function Lua_703141_AI_Conquered( _roomID )


-----------------------------------sub functions



--------------------------------------------------------------------------------------------------skill functions below
-------------------------------------------------------------------屍毒者
function Lua_703141_Skill_BodyExplode()
	local _ownerID = OwnerID();

	KillID( _ownerID , _ownerID );

	return true;
end
------------------------------------------------------END----------屍毒者

--578658 FX_屍毒擴散
--model/fx/skill/boss_skill/istar/act_02_t_down_i.ros



-------------------------------------------------------------------------------------------------------------------------------------------------傀殭屍
function Lua_703141_NPC_PuppetZombie_Init()
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , true );		--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--有阻擋效果
	WriteRoleValue( _ownerID , EM_RoleValue_IsWalk , 1 );--走路吧
	--AddBuff( _ownerID , 625522 , 0 , -1 );--625522傀殭屍特效
	CallPlot( _ownerID , "Lua_703141_NPC_PuppetZombie_WalkAround" );
	CallPlot( _ownerID , "Lua_703141_NPC_PuppetZombie_RottenLiquid" );
	return true;
end

function Lua_703141_NPC_PuppetZombie_WalkAround()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local x,y,z,dir = 0;
	local _time = 0;
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	local _flagGUID = _gConsts._flagGUID;
	local _flagPos = DW_Rand( 10 );
	local _changeDirTime = 10 + DW_Rand( 6 ) * 10;
	while ( true ) do
		LuaFunc_MoveToFlag( _ownerID , _flagGUID , _flagPos , 30 );
		Sleep( _changeDirTime );
		_flagPos = DW_Rand( 11 );
		_changeDirTime = 10 + DW_Rand( 6 ) * 10;
	end
end

function Lua_703141_NPC_PuppetZombie_RottenLiquid()
	DebugMsg( 0 , 0 , "----Lua_703141_NPC_PuppetZombie_RottenLiquid" );
	--108930
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local x,y,z,dir = 0;
	local _rottenLiquidGUID = 108930;--108930腐液攤
	local _rottenLiquidEffectGUID = 625520;--625520腐液攤
	local _rottenLiquidLiveTime = 15;--15sec
	local _objID = 0;
	while ( true ) do
		x,y,z,dir = DW_Location( _ownerID );
		_objID = CreateObj( _rottenLiquidGUID , x,y,z,dir , 1 );
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
		WriteRoleValue( _objID , EM_RoleValue_LiveTime , _rottenLiquidLiveTime );	
		AddBuff( _objID , _rottenLiquidEffectGUID , 0 , -1 );	
		--DebugMsg( 0 , 0 , "----rotten Liquid : ".._objID );
		CallPlot( _objID , "Lua_703141_NPC_PuppetZombie_RottenLiquid_Loop" , _ownerID );

		AddToPartition( _objID , _roomID );

		Sleep( 20 );
	end

end

function Lua_703141_NPC_PuppetZombie_RottenLiquid_Loop( _zombieID )
	--DebugMsg( 0 , 0 , "Lua_703141_NPC_PuppetZombie_RottenLiquid_Loop");
	local _ownerID = OwnerID();
	local x,y,z,dir = DW_Location( _ownerID );
	while ( true ) do
		--DebugMsg( 0 , 0 , "腐液攤 持續傷害 : ".._ownerID );
		SysCastSpellLv_Pos( _zombieID , x,y,z , 851698 , 1 );--851698腐液攤
	
		Sleep( 10 );
	end

end
------------------------------------------------------------------------------------------------------------------------------------END----------傀殭屍

---------------------------------------------------------------------------------------------------------------------遊蕩的鬼魅
function Lua_703141_NPC_StrayGhost_Init()
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--顯示血條
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _ownerID , EM_SetModeType_Move , true );		--移動
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--攻擊
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--有阻擋效果

	CallPlot( _ownerID , "Lua_703141_NPC_PuppetZombie_WalkAround" );
	CallPlot( _ownerID , "Lua_703141_NPC_StrayGhost_Loop" );
	return true;
end

function Lua_703141_NPC_StrayGhost_Loop()
	DebugMsg( 0 , 0 , "Lua_703141_NPC_StrayGhost_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;
	local x,y,z,dir = DW_Location( _ownerID );
	while ( true ) do
		--DebugMsg( 0 , 0 , "魅影之傷 持續傷害 : ".._ownerID );
		CastSpell( _ownerID , _ownerID , 851697 );--851697魅影之傷
		Sleep( 40 );
	end
end

-------------------------------------------------------------------------------------------------END-----------------遊蕩的鬼魅

---------------------------------------------------------------------------------------------------------------------骨製圖騰
function Lua_703141_Item_CreateSkullTotemDualPair( _flagGUID , _flagPos )--_flagPos第一根圖騰位置  往後遞增
	DebugMsg( 0 , 0 , "Lua_703141_Item_CreateSkullTotemInPair");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];

	local _maxTotem = 4;
	local _currentTotemID = 0;
	
	local _totemList = {};
	local _duetList = nil;

	_flagGUID = 781406;--for test
	_flagPos = 4;--for test

	local _currentFlagPos = 0;
	for _i = 1 , _maxTotem , 1 do
		_currentFlagPos = _flagPos - 1 + _i;
		_currentTotemID = Lua_703141_Item_CreateSingleSkullTotem( _flagGUID , _currentFlagPos );
		
		table.insert( _totemList , _currentTotemID );
		
	end

	for _index , _totemID in pairs( _totemList ) do
		_duetList = {};--放射對應清單
		for _index2 , _totemID2 in pairs( _totemList ) do--排除自身的對應表
			if ( _totemID2 ~= _totemID ) then
				table.insert( _duetList , _totemID2 );
			end
		end
		CallPlot( _totemID , "Lua_703141_Item_SkullTotem_Loop" , _duetList );
	end
end

function Lua_703141_Item_CreateSingleSkullTotem( _flagGUID , _flagPos )
	DebugMsg( 0 , 0 , "Lua_703141_Item_CreateSingleSkullTotem");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];

	local _skullTotemGUID = _gConsts._skullTotemGUID;
	local x,y,z,dir = DW_Location( _flagGUID , _flagPos );
	local _skullTotemID = _gConsts.ExtObj( _skullTotemGUID , x,y,z,dir );

	SetModeEx( _skullTotemID , EM_SetModeType_HideName , true );	--顯示名稱
	SetModeEx( _skullTotemID , EM_SetModeType_NotShowHPMP , true ); --顯示血條
	SetModeEx( _skullTotemID , EM_SetModeType_Strikback , false );	--會反擊
	SetModeEx( _skullTotemID , EM_SetModeType_Move , false );	--移動
	SetModeEx( _skullTotemID , EM_SetModeType_Fight , false );	--攻擊
	SetModeEx( _skullTotemID , EM_SetModeType_Searchenemy , false );	--索敵
	SetModeEx( _skullTotemID , EM_SetModeType_Obstruct , false );	--有阻擋效果

	return _skullTotemID;
end

function Lua_703141_Item_SkullTotem_Loop( _duetList )
	DebugMsg( 0 , 0 , "Lua_703141_Item_SkullTotem_Loop");
	sleep( 10 )
	local _owner = OwnerID();
	local _oppositeTotemID = 0;
	local _spellGUID = 851700;--邪術荒流
	local _effectSpellGUID = 851699;--邪術荒流
	local x,y,z,dir = 0;
	while ( true ) do
		_oppositeTotemID = _duetList[ RandRange( 1 , #_duetList ) ];
		x,y,z,dir = DW_Location( _oppositeTotemID );
		--CastSpellPos( _owner , x,y,z, _spellGUID , 0 );
		--DebugMsg( 0 , 0 , "_owner : ".._owner.."  Target : ".._oppositeTotemID );
		CastSpell( _owner , _oppositeTotemID , _effectSpellGUID );--特效法術
		SysCastSpellLv_Pos( _owner , x,y,z, _spellGUID , 0 );--傷害髮束
		sleep( 100 );--每十秒隨機找對應對象放招
	end
end
-------------------------------------------------------------------------------------------------END-----------------骨製圖騰


---------------------------------------------------------------------------------------------------------------------散播者
function Lua_703141_Skill_Spread_Check()
	DebugMsg( 0 , 0 , "Lua_703141_Skill_Spread_Check");
	local _ownerID = OwnerID();
	local _basicBuffGUID = 625519;
	if ( CheckBuff( _ownerID , _basicBuffGUID ) ) then
		CallPlot( _ownerID , "Lua_703141_Skill_Spread_Loop" );
		return true;
	end
	return false;
end

function Lua_703141_Skill_Spread_Loop()
	DebugMsg( 0 , 0 , "Lua_703141_Skill_Spread_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;

	local _thisBuffGUID = 625533;--625533散播者

	local _rangeNPCs = nil; 
	local _infectRange = 50;--yard
	local _infectionSkillID = 851734;--851734屍毒傳染
	local _infectNpcGUID = 108927;--108927傀殭屍
	local x,y,z,dir = 0;

	local _currentNpcID = 0;
	local _currentNpcGUID = 0;
	while ( CheckBuff( _ownerID , _thisBuffGUID ) ) do 
		--屍毒傳染
		x,y,z,dir = DW_Location( _ownerID );--已被感染的玩家為中心點
		SysCastSpellLv_Pos( _bossID , x,y,z , _infectionSkillID , 0 );--851734屍毒傳染(由BOSS施放)

		--散播者傳染  --只傳給 傀殭屍
		_rangeNPCs = SearchRangeNPC( _ownerID , _infectRange );
		for _i = 0 , #_rangeNPCs , 1 do
			_currentNpcID = _rangeNPCs[ _i ];
			if( _currentNpcID ~= nil ) then
				_currentNpcGUID = ReadRoleValue( _currentNpcID , EM_RoleValue_OrgID );
				DebugMsg( 0 , 0 , "_currentNpcID : ".._currentNpcID.."  , _i : ".._i.."  _GUID : ".._currentNpcGUID );
				if ( CheckID( _currentNpcID ) and _currentNpcGUID == _infectNpcGUID ) then
					AddBuff( _currentNpcID , 625534 , 0 , -1 );--625534散播者(傀殭屍)
					Lua_703141_Skill_Spread_PuppetZombie_Check( _currentNpcID );
					CancelBuff_noEvent( _ownerID , _thisBuffGUID );--625533散播者(玩家)
					break;
				end
			else
				DebugMsg( 0 , 0 , "----------is nil _i : ".._i );
			end
		end

		Sleep( 10 );
	end

	return;

end

function Lua_703141_Skill_Spread_PuppetZombie_Check( _targetID )
	
	local _ownerID = _targetID or OwnerID();
	local _thisBuffGUID = 625534;--625534散播者
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffGUID ) + 1;
	DebugMsg( 0 , 0 , "Lua_703141_Skill_Spread_PuppetZombie_Check : ".._currentBuffLv );
	if _currentBuffLv >= 3 then--超過3曾殺死目標
		KillID( _ownerID , _ownerID );
	end
end
-------------------------------------------------------------------------------------------------END-----------------散播者

---------------------------------------------------------------------------------------------------------------------喚魔術
function Lua_703141_Skill_RaiseTheDead()
	DebugMsg( 0 , 0 , "Lua_703141_Skill_RaiseTheDead");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;

	local _summonList = {	_gConsts._puppetZombieGUID ,--招喚清單
				_gConsts._toxicCorpseGUID
				};


	local x,y,z,dir = DW_Location( _bossID );
	local _targetX , _targetZ = 0;

	for _index , _guid in pairs( _summonList ) do
		_targetX = x + ( RandRange( 1 , 300 ) - 150 );
		_targetZ = z + ( RandRange( 1 , 300 ) - 150 );
		_gConsts.ExtObj( _guid , x , y , z , dir );
	end
	

end
-------------------------------------------------------------------------------------------------END-----------------喚魔術

---------------------------------------------------------------------------------------------------------------------亡靈啃蝕--邪術荒流
function Lua_703141_Skill_BittingDead()--減一層巫咬
	DebugMsg( 0 , 0 , "Lua_703141_Skill_BittingDead");
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	--say( _targetID , "Hit" )
	local _targetBuff = 625526;
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _targetBuff );--625526巫咬
	DebugMsg( 0 , 0 , "_currentBuffLv : ".._currentBuffLv);
	CancelBuff_noEvent( _targetID , _targetBuff );
	_currentBuffLv = _currentBuffLv - 1;
	if ( _currentBuffLv >= 0 ) then
		AddBuff( _targetID , _targetBuff , _currentBuffLv , -1 );--
	end

	--CallPlot( _targetID , "Lua_703141_Skill_WoodooBite_Check" );
	Lua_703141_Skill_WoodooBite_Check( _targetID );
end
-------------------------------------------------------------------------------------------------END-----------------亡靈啃蝕--邪術荒流

---------------------------------------------------------------------------------------------------------------------巫咬
function Lua_703141_Skill_WoodooBite()
	DebugMsg( 0 , 0 , "Lua_703141_Skill_WoodooBite");
	local _ownerID = OwnerID();
	local _targetID = TargetID();	
	--CancelBuff_noEvent( _targetID , 625526 );
	AddBuff( _targetID , 625526 , 2 , -1 );--
	
	--CallPlot( _targetID , "Lua_703141_Skill_WoodooBite_Check_Loop" );
end

function Lua_703141_Skill_WoodooBite_Check( _inputOwnerID )
	local _ownerID = _inputOwnerID or OwnerID();
	DebugMsg( 0 , 0 , "Lua_703141_Skill_WoodooBite_Check : ".._ownerID );
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;

	if ( CheckBuff( _ownerID , 625526 ) ) then--625526巫咬
		return;
	end
	--提示字串 BUFF沒了
	DebugMsg( 0 , 0 , "提示字串 BUFF沒了 : ".._ownerID );
	
	--if ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == false ) then--未脫離戰鬥狀態
		--CastSpell( _ownerID , _ownerID , 850461 );--850461自殺爆彈
		DebugMsg( 0 , 0 , "###_WoodooBite_KilledHost : ".._ownerID );
		local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
		local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
		local x,y,z,dir = DW_Location( _ownerID );

		--Sleep( 15 );
		_gConsts.ExtObj( 108929 , x , y , z , dir );--遊蕩的鬼魅
		KillID( _ownerID , _ownerID );
	--else
		--return;
	--end
end

-------------------------------------------------------------------------------------------------END-----------------巫咬