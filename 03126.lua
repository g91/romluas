--Author : K.J. Aris
--Version : 13.12.04.
--NPC : 108602
--Script : 703126

--model/character/creature/istar/act_istar.ros

local _Lua_703126_AI_GlobalConsts = {};
local _Lua_703126_AI_GlobalVars = {};

local _Lua_703126_AI_SkillConsts = {};
local _Lua_703126_AI_SkillCD = {};

function Lua_703126_AI_Setting( _bossID , _roomID )
  
  _Lua_703126_AI_GlobalConsts[ _roomID ] = {--never write
      _bossID = _bossID , 
      _roomID = _roomID ,

      _cloneGUID = 108653 ,
      
      _corruptedShadowGUID = 108665 , --108665腐化的影子
      
      _flagGUID = 781317 ,  --旗標編號
      _doorGUID = 106249 ,  --阻擋門物件編號
      
      _bossFlagPos = 0 ,
      _frontDoorFlagPos = 1,
      _rearDoorFlagPos = 2,

    };--_Lua_703126_AI_GlobalConsts[ _roomID ]


  --local _lastCache_ExtObj = _Lua_703126_AI_GlobalVars[ _roomID ].ExtObj or nil;
  --local _lastCache_DelExtObjs = _Lua_703126_AI_GlobalVars[ _roomID ].DelExtObjs or nil;

  _Lua_703126_AI_GlobalVars[ _roomID ] = {--_gVars for read --_Lua_703126_AI_GlobalVars[ _roomID ] for write
      _frontDoorID = 0 ,
      _rearDoorID = 0 , --Lua_703126_AddDoor( _Lua_703126_AI_GlobalConsts[ _roomID ]._rearDoorFlagPos ) , --generate rear door
      
      _ctrlID = 0 , --ctrl ID
      _cloneID = 0 ,

      --ExtObj = _lastCache_ExtObj , --function
      --DelExtObjs = _lastCache_DelExtObjs ,--function  
    };--_Lua_703126_AI_GlobalVars[ _roomID ]


  _Lua_703126_AI_SkillConsts[ _roomID ] = {
      _meleeExploreGUID = 851062 , --851062墮靈斬爆炸
      --625390穢邪同化
      --625391棄靈選者
      --625392統御光環
      --625395衰竭氣息BUFF

      _soulImprisoningGUID = 851601, --851601叛魂拘禁
      _soulImprisoningCD = 100000 , --叛魂拘禁CD(sec)

      _downHillGUID = 851283 ,--851283迫近深淵
      _downHillCD = 100000 ,--迫近深淵CD Time set(sec)

      _darkBreachGUID = 851615, --黑色裂口
      _darkBreachCD = 19 , --黑色裂口CD(sec)

      _corruptionGUID = 851599 , --851599腐化協定
      _corruptionCD = 13 , --腐化協定CD(sec)

      _crushingSlayGUID = 851603, --碎滅斬
      _crushingSlayCD = 11 , --碎滅斬CD(sec)

      _evilSpikeGUID = 851282 ,--851282穢邪刺擊
      _evilSpikeCD = 7 ,--穢邪刺擊CD(sec)

      _exhaustionGUID = 851296 ,--851296衰竭氣息
      _exhaustionCD = 2 ,--衰竭氣息CD(sec)

      _furyGUID =  625441 --忘卻幽影(狂暴)

    };--_Lua_703126_AI_SkillVars


  _Lua_703126_AI_SkillCD[ _roomID ] = {
      _downHillCD = _Lua_703126_AI_SkillConsts[ _roomID ]._downHillCD , --迫近深淵CD Timer
      _evilSpikeCD = _Lua_703126_AI_SkillConsts[ _roomID ]._evilSpikeCD , --穢邪刺擊CD
      _exhaustionCD = _Lua_703126_AI_SkillConsts[ _roomID ]._exhaustionCD , --衰竭氣息CD
      _corruptionCD = _Lua_703126_AI_SkillConsts[ _roomID ]._corruptionCD , --腐化協定CD
      _soulImprisoningCD = _Lua_703126_AI_SkillConsts[ _roomID ]._soulImprisoningCD , --叛魂拘禁CD(sec)
      _crushingSlayCD = _Lua_703126_AI_SkillConsts[ _roomID ]._crushingSlayCD , --破碎斬CD(sec)
      _darkBreachCD = _Lua_703126_AI_SkillConsts[ _roomID ]._darkBreachCD , --破碎斬CD(sec)

    };--_Lua_703126_AI_SkillVars
  
  return _roomID;
end


function Lua_703126_AI_Init( _inputBossID )
  DebugMsg( 0 , 0 , "--Lua_703126_AI_Init : NPC 108602       Z32B7 Istar" );
  --basics
  local _bossID = _inputBossID or OwnerID();
  local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
  Cl_Resist_HackersBossNum()
  --local x,y,z,dir = DW_Location( _bossID );

  --local _bossRole = Christine.Role:new( _bossID );

  -------------------------------------------initialize settings
  return Lua_703126_AI_Setting( _bossID , _roomID );
end

function Lua_703126_AI_onFight()
  local _bossID = OwnerID();
  local _roomID = Lua_703126_AI_Init( _bossID );

  local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];--for read
  --local _bossID = _gConsts._bossID;
  --local _roomID = _gConsts._roomID;
  Cl_Resist_HackersFightBegin()
  DebugMsg( 0 , 0 , "--Lua_703126_AI_onFight ".._bossID.." RID : ".._roomID );

  local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

  local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )  --衍生物(處理招喚物 或 長出來的東西)
    local x,y,z,dir = DW_Location( _bossID );
    local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
    _AddParasite( _objID );
    AddToPartition( _objID , _roomID );
    return _objID;
  end
  
  _Lua_703126_AI_GlobalVars[ _roomID ]._ctrlID = _ctrlID;
  _Lua_703126_AI_GlobalVars[ _roomID ].ExtObj = CreateDerivativeOnBoss;
  _Lua_703126_AI_GlobalVars[ _roomID ].DelExtObjs = _RemoveParasites;
  --generate front door

  _Lua_703126_AI_GlobalVars[ _roomID ]._frontDoorID = Lua_703126_AddDoor( _gConsts._frontDoorFlagPos , _gConsts._roomID );
  --_Lua_703126_AI_GlobalVars[ _roomID ]._cloneID = Lua_703126_CreateClone();

  BeginPlot( _ctrlID , "Lua_703126_AI_Engage" , 0 );
  --"[$MUTE]".."[SC_27IN_BOSS1_START]"
  ScriptMessage( _bossID , 0 , 2 , "[$MUTE]".."[SC_108602_ENGAGE]" , 0 );

end


function Lua_703126_AI_Engage()
  local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID在這裡指CTRLID
  local _zoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID );--OwnerID在這裡指CTRLID
  DebugMsg( 0 , 0 , "--Lua_703126_AI_Engage" );
  local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  local _bossID = _gConsts._bossID;
  --local _roomID = _gConsts._roomID;
  local _ctrlID = _gConsts._ctrlID;

  local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];--for read
  --Routines Vars
  local _clock = 0;
  local _canCast = false;
  local _engaging = true;
  --Routines Vars
    --Lua_RandomPlayerFromHateList
  
  local _timeTick = 1;--Time Speed
  local _miniTimeTick = _timeTick*10;--Time Speed for Sleep
  local _GCD = 0;--int

  -----------------------------------------狂暴參數
  local _fury_course = false;
  local _fury_CD = 9999999;

  if ( _zoneID == 169 ) then
    _fury_CD = 480;
  end

  if ( _zoneID == 170 ) then
    _fury_CD = 360;
  end
  --_Lua_703126_AI_SkillCD[ _roomID ]._fury_CD = _fury_CD;
  ----------------------------END----------狂暴參數

  DebugMsg( 0 , 0 , "--Start loop" );
  
  _Lua_703126_AI_SkillCD[ _roomID ]._soulImprisoningCD = 0;--cast soul imprisoning at the begin
  
  while true do 
    --------------------clock
    Sleep( _miniTimeTick );
    _clock = _clock + _timeTick;
    --------------END---clock
    --DebugMsg( 0 , 0 , "--Clock : ".._clock );

    --------------------Routines
    --_gVars = _Lua_703126_AI_GlobalVars[ _roomID ];--update vars
    _canCast = ReadRoleValue( _bossID , EM_RoleValue_SpellMagicID ) ~= 0;
    _engaging = HateListCount( _bossID ) ~= 0;
    --------------END---Routines


    -------------------------------------------------戰鬥結束條件
    if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss 死亡時中斷戰鬥迴圈
      DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
      --BeginPlot( _ctrlID , "Lua_703126_AI_Conquered" , 0 );
      Lua_703126_AI_Conquered( _roomID );
      break;
    end

    if ( not _engaging ) then
      DebugMsg( 0 , 0 , "--quit fight" );
      --BeginPlot( _ctrlID , "Lua_703126_AI_Reset" , 0 );
      Lua_703126_AI_Reset( _roomID );
      break;
    end
    -------------------------------------END--------戰鬥結束條件


    -------------------------------------------------Timers
    if ( _GCD > 0 ) then _GCD = _GCD - _timeTick; end

    for _key , _value in pairs( _Lua_703126_AI_SkillCD[ _roomID ] ) do
      --DebugMsg( 0 , 0 , "-- : ".._key.." __ ".. _value );
      if ( _Lua_703126_AI_SkillCD[ _roomID ][ _key ] > 0 ) then _Lua_703126_AI_SkillCD[ _roomID ][ _key ] = _value - _timeTick; end
    end
    ---------------------------------------END-------Timers


    --狂暴機制
    if( _clock >= _fury_CD )and (fury_course == false) then
        fury_course=true;
        AddBuff( _bossID , 625441 , 0 , -1 );-- 625441 忘卻幽影
        ScriptMessage( _bossID , 0 , 2 , "[SC_108602_RAID]" , 0 );
        --lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_FURY]",0);--[107966]感受到巢穴的低鳴，開始陷入某種瘋狂狀態！
    end   


    ------------------------------------------------Skills
    for i = 1 , 1 , 1 do--switch case simulation  --模擬 switch case 

      if( _Lua_703126_AI_SkillCD[ _roomID ]._downHillCD <= 0 )then --近迫深淵  --該招不受GCD影響
        MagicInterrupt( _bossID );
        _GCD = 6;--注意GCD打結(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._downHillCD = _Lua_703126_AI_SkillConsts[ _roomID ]._downHillCD;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        Sleep( 10 );
        DebugMsg( 0 , 0 , "-------casting 近迫深淵" );
        local x,y,z,dir = DW_Location( _bossID );
        CastSpellPos( _bossID , x,y,z, _Lua_703126_AI_SkillConsts[ _roomID ]._downHillGUID , 1  );
        break;
      end--近迫深淵

      if ( _GCD > 0 ) then break; end --當GCD鎖住時不執行  --GCD用來防止招式被吃掉
      --DebugMsg( 0 , 0 , "--GCD unlocked" );
      --CD短的不宜放前面  不然容易佔住技能排程
      
      if( _Lua_703126_AI_SkillCD[ _roomID ]._soulImprisoningCD <= 0 )then --判魂拘禁
        _GCD = 6;--注意GCD打結(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._soulImprisoningCD = _Lua_703126_AI_SkillConsts[ _roomID ]._soulImprisoningCD;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        DebugMsg( 0 , 0 , "-------casting 判魂拘禁" );
        local _targetList = Lua_RandomPlayerFromHateList( _bossID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦
        local _targetID = _targetList[ 1 ];
        if ( not _targetID ) then break; end
        CastSpell( _bossID , _targetID , _Lua_703126_AI_SkillConsts[ _roomID ]._soulImprisoningGUID );
        break;
      end--判魂拘禁


      if( _Lua_703126_AI_SkillCD[ _roomID ]._darkBreachCD <= 0 )then --黑色裂口
        _GCD = 12;--注意GCD打結(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._darkBreachCD = _Lua_703126_AI_SkillConsts[ _roomID ]._darkBreachCD + _GCD;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        DebugMsg( 0 , 0 , "-------casting 黑色裂口" );
        local _targetList = Lua_RandomPlayerFromHateList( _bossID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦
        local _targetID = _targetList[ 1 ];
        if ( not _targetID ) then break; end
        local x,y,z,dir = DW_Location( _targetID );
        CastSpell( _bossID , _targetID , _Lua_703126_AI_SkillConsts[ _roomID ]._darkBreachGUID );
        break;
      end--黑色裂口


      if( _Lua_703126_AI_SkillCD[ _roomID ]._corruptionCD <= 0 )then --腐化協定
        _GCD = 10;--注意GCD打結(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._corruptionCD = _Lua_703126_AI_SkillConsts[ _roomID ]._corruptionCD + _GCD;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        DebugMsg( 0 , 0 , "-------casting 腐化協定" );
        local _targetList = Lua_RandomPlayerFromHateList( _bossID , 1 , true );--(BossID,HowMuch,AntiTank) --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦
        local _targetID = _targetList[ 1 ];
        if ( not _targetID ) then break; end
        CastSpell( _bossID , _targetID , _Lua_703126_AI_SkillConsts[ _roomID ]._corruptionGUID );
        break;
      end--腐化協定


      if( _Lua_703126_AI_SkillCD[ _roomID ]._crushingSlayCD <= 0 )then --破碎斬
        _GCD = 30;--注意GCD打結(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._crushingSlayCD = _Lua_703126_AI_SkillConsts[ _roomID ]._crushingSlayCD + _GCD*2;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        DebugMsg( 0 , 0 , "-------casting 破碎斬" );
        local _targetList = Lua_RandomPlayerFromHateList( _bossID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦
        local _targetID = _targetList[ 1 ];
        if ( not _targetID ) then break; end
        --_targetID = Lua_703126_CreateClone( DW_Location( _targetID ) );
        CastSpell( _bossID , _targetID , _Lua_703126_AI_SkillConsts[ _roomID ]._crushingSlayGUID );
        --CastSpell( _bossID , _targetID , 851626 );

--        local x,y,z,dir = DW_Location( _targetID );
--        CastSpellPos( _bossID , x,y,z , 851626 , 1 );

        break;
      end--破碎斬


      if( _Lua_703126_AI_SkillCD[ _roomID ]._evilSpikeCD <= 0 )then --穢邪刺擊
        _GCD = 10;--注意GCD打結(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._evilSpikeCD = _Lua_703126_AI_SkillConsts[ _roomID ]._evilSpikeCD;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        DebugMsg( 0 , 0 , "-------casting 穢邪刺擊" );
        local _targetList = Lua_RandomPlayerFromHateList( _bossID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦
        local _targetID = _targetList[ 1 ];
        if ( not _targetID ) then break; end
        CastSpell( _bossID , _targetID , _Lua_703126_AI_SkillConsts[ _roomID ]._evilSpikeGUID );
        break;
      end--穢邪刺擊
  
        
    end--end for --switch case simulation


    if( _Lua_703126_AI_SkillCD[ _roomID ]._exhaustionCD <= 0 )then --衰竭氣息--NO GCD
      _Lua_703126_AI_SkillCD[ _roomID ]._exhaustionCD = _Lua_703126_AI_SkillConsts[ _roomID ]._exhaustionCD;
      --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
      --DebugMsg( 0 , 0 , "-------casting 衰竭氣息" );
      local x,y,z,dir = DW_Location( _bossID );
      SysCastSpellLv_Pos( _bossID , x,y,z, _Lua_703126_AI_SkillConsts[ _roomID ]._exhaustionGUID , 1  );
    end--衰竭氣息
    
    -------------------------------------END--------Skills

  end
  DebugMsg( 0 , 0 , "--Out of loop" );
  --++++++++++++++++++++++++++++++++++++++++++++++++++END+++++functions with shared values
end

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703126_AI_Reset( _roomID )
  DebugMsg( 0 , 0 , "--Lua_703126_AI_Reset" );

  local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  
  local _bossID = _gConsts._bossID;
  local _roomID = _gConsts._roomID;
  local _ctrlID = _gConsts._ctrlID;

  local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];--for read
  local _frontDoorID = _gVars._frontDoorID;
  
  ScriptMessage( _bossID , 0 , 2 , "[SC_108602_RESET]" , 0 );

  DW_UnFight( _bossID , true );
  Delobj( _frontDoorID ); --刪除前門
  _gVars.DelExtObjs();--clear all extend items

  Sleep( 20 );
  
  DelFromPartition( _bossID );
  
  _Lua_703126_AI_GlobalVars[ _roomID ] = nil; --clear all values
  _Lua_703126_AI_GlobalConsts[ _roomID ] = nil; --clear all values
  _Lua_703126_AI_SkillConsts[ _roomID ] = nil;  --clear all values
  _Lua_703126_AI_SkillCD[ _roomID ] = nil;    --clear all values  

  Sleep( 50 );

  DW_UnFight( _bossID , false );
  --SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos ); --20150904 多洛:有問題 他會跑到很遠處才回來
  SetPosByFlag( _bossID , 781317 , 2 ); --20150904 種一支新的
  AddToPartition( _bossID , _roomID );
end

function Lua_703126_AI_Conquered( _roomID )

  local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];--for read
  local _bossID = _Lua_703126_AI_GlobalConsts[ _roomID ]._bossID;

  ScriptMessage( _bossID , 0 , 2 , "[SC_108602_DEATH]" , 0 );

  Delobj( _gVars._frontDoorID );  --刪除前門
  --Delobj( _gVars._rearDoorID ); --刪除後門

  sasa_ZoneDungeon_title_01(530997)  --Z32副本尾王 

  _gVars.DelExtObjs();--clear all extend items

  _Lua_703126_AI_GlobalVars[ _roomID ] = nil; --clear all values
  _Lua_703126_AI_GlobalConsts[ _roomID ] = nil; --clear all values
  _Lua_703126_AI_SkillConsts[ _roomID ] = nil;  --clear all values
  _Lua_703126_AI_SkillCD[ _roomID ] = nil;    --clear all values
end

-----------------------------------sub functions
function Lua_703126_AddDoor( _FlagPos , _roomID )
  local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];
  local _bossID = _gConsts._bossID;
  local _roomID = _gConsts._roomID;
  local _flagGUID = _gConsts._flagGUID;
  local _doorGUID = _gConsts._doorGUID;
  local _doorID = CreateObjByFlag( _doorGUID , _flagGUID , _FlagPos , 1 );
  SetModeEx( _doorID , EM_SetModeType_Mark , false ); --不可點選
  SetModeEx( _doorID , EM_SetModeType_HideName , false ); --不顯示名稱
  SetModeEx( _doorID , EM_SetModeType_NotShowHPMP , false );  --不顯示血條
  SetModeEx( _doorID , EM_SetModeType_Strikback , false );  --不會反擊
  SetModeEx( _doorID , EM_SetModeType_Move , false ); --不會移動
  SetModeEx( _doorID , EM_SetModeType_Fight , false );  --不可攻擊
  SetModeEx( _doorID , EM_SetModeType_Searchenemy , false );  --不會索敵
  SetModeEx( _doorID , EM_SetModeType_Obstruct , true );  --有阻擋效果
  AddToPartition( _doorID , _roomID );
  return _doorID;
end


function  Lua_703126_CreateClone( _roomID , x,y,z,dir , _liveTime )--分身
  --local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  --local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];

  --local _bossID = _gConsts._bossID;

  local _cloneID = _Lua_703126_AI_GlobalConsts[ _roomID ]._cloneGUID;

  --local x,y,z,dir = DW_Location( _bossID );
  
  _cloneID = CreateObj( _cloneID , x , y , z , dir , 1 );
  --_Lua_703126_AI_GlobalVars[ _roomID ].ExtObj( _cloneID );

  --SetModeEx( _cloneID , EM_SetModeType_Mark , false );  --不可點選
  --SetModeEx( _cloneID , EM_SetModeType_HideName , false );  --不顯示名稱
  SetModeEx( _cloneID , EM_SetModeType_NotShowHPMP , true );  --不顯示血條
  --SetModeEx( _cloneID , EM_SetModeType_Strikback , false ); --不會反擊
  --SetModeEx( _cloneID , EM_SetModeType_Move , false );  --不會移動
  --SetModeEx( _cloneID , EM_SetModeType_Fight , false ); --不可攻擊
  --SetModeEx( _cloneID , EM_SetModeType_Searchenemy , false ); --不會索敵
  SetModeEx( _cloneID , EM_SetModeType_Obstruct , false );  --無阻擋效果
  SetModeEx( _cloneID , EM_SetModeType_Gravity , false );


  SetModeEx( _cloneID , EM_SetModeType_HideName , true );     ---物件頭上是否顯示名稱
  SetModeEx( _cloneID , EM_SetModeType_HideMinimap , true );    ---物件是否在小地圖上顯示
  SetModeEx( _cloneID , EM_SetModeType_Searchenemy , false );     --索敵
  SetModeEx( _cloneID , EM_SetModeType_Mark , false );      --標記
  SetModeEx( _cloneID , EM_SetModeType_Fight , false );       --砍殺
  SetModeEx( _cloneID , EM_SetModeType_Move , false );      --移動
  SetModeEx( _cloneID , EM_SetModeType_ShowRoleHead , true );
  SetModeEx( _cloneID , EM_SetModeType_Strikback , false );   --反擊
  SetModeEx( _cloneID , EM_SetModeType_Show , true );
  --SetModeEx( _cloneID , EM_SetModeType_Show , false );  
  WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , _liveTime or 20 );

  --AddBuff( _cloneID , 507899 , 1 , 100 );--不可物理攻擊
  AddToPartition( _cloneID , _Lua_703126_AI_GlobalConsts[ _roomID ]._roomID );
  
  _Lua_703126_AI_GlobalVars[ _roomID ]._cloneID = _cloneID;

  --DebugMsg( 0 , 0 , "--Lua_703126_CreateClone : ".._cloneID );

  return _cloneID;
end


-----------------------------------------------------------------------------------Skill functions
--NPC : 108602
function Lua_703126_MeleeExplode()--墮靈斬爆炸(Trigger)625387
  DebugMsg( 0 , 0 , "--Lua_703126_MeleeExplode" );
  local _ownerID = OwnerID();--Buff擁有者
  local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
  local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  --local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];

  if ( _gConsts == nil ) then return; end

  local _bossID = _gConsts._bossID;

  --local _cloneID = _gVars._cloneID;

  local x,y,z,dir = DW_Location( _ownerID );
  
  --SetPos( _cloneID , x,y,z,dir );
  --DebugMsg( 0 , 0 , "--Lua_703126_MeleeExplode : Caster :".._cloneID );
  --CastSpellPos( _cloneID , x , y , z , _gConsts._spid_meleeExplore , 1 );--墮靈斬爆炸
  SysCastSpellLv_Pos( _bossID , x , y , z , _Lua_703126_AI_SkillConsts[ _roomID ]._meleeExploreGUID , 1 );--墮靈斬爆炸

  --WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , 1 );
  
end

---------------------------------------625390穢邪同化
--治療量降低50%，持續60秒，當時間結束會對自身以及周圍100碼的隨機一人再施放一次額外的「穢邪同化」；
--如果周圍沒有任何人，則額外那次效果將施放在自己身上。任何玩家只要受到3個「穢邪同化」效果，就會化身成為棄靈選者，
--無法再受到任何治療效果，已經成為棄靈選者的玩家無法再分擔「穢邪同化」。
function Lua_703126_EvilAssimilation_EffectCheck()
  local _ownerID = TargetID();--受害者
  local _corruptSpiritBuffID = 625391;--625391棄靈選者
  if ( CheckBuff( _ownerID , _corruptSpiritBuffID ) ) then--625391棄靈選者--已經成為棄靈選者的玩家無法再分擔「穢邪同化」
    --DebugMsg( 0 , 0 , "棄靈選者 already : ".._ownerID );
    return false;
  elseif ( CheckBuff( _ownerID , 625390 ) ) then --20150903 多洛改 王不會堆疊 只會幫沒上的人上一層
	local BuffLevel = ReadRoleValue( _ownerID, EM_RoleValue_Register5)
	WriteRoleValue( _ownerID, EM_RoleValue_Register5, BuffLevel+1)
	return true;
  else
	WriteRoleValue( _ownerID, EM_RoleValue_Register5, 1)
	return true;
  end
end


function Lua_703126_EvilAssimilation_Infection()--625390穢邪同化  傳染機制
  -- local _ownerID = TargetID();--受害者
  local _ownerID = OwnerID();--受害者
  local _thisBuffID = 625390;--625390穢邪同化
  local _corruptSpiritBuffID = 625391;--625391棄靈選者

  local _EffectiveRange = 100;  

  --local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffID );
  --AddBuff( _ownerID , _thisBuffID , _currentBuffLv + 1 , 60 );

  DebugMsg( 0 , 0 , "Contagious : ".._ownerID );

  local _RangePlayerTable = SearchRangePlayer( _ownerID , _EffectiveRange ); --抓取自己距離100的所有玩家
  DebugMsg(0, 0, '#_RangePlayerTable = '..#_RangePlayerTable)
  local _EffectivePlayerTable = {};
  
  local _currentPlayerID = 0;
  for i = 0 , #_RangePlayerTable - 1 , 1 do--挑選傳染有效玩家
    _currentPlayerID = _RangePlayerTable[ i ];
    DebugMsg(0, 0, '_RangePlayerTable['..i..'] = '.._RangePlayerTable[ i ])
    if  ( _currentPlayerID ~= _ownerID )  --非受害者本身
      and ( ReadRoleValue( _currentPlayerID , EM_RoleValue_IsDead ) ~= 1 ) --還存活
      and ( CheckBuff( _currentPlayerID , _corruptSpiritBuffID ) == false ) --非625391棄靈選者
      then
      table.insert( _EffectivePlayerTable , _currentPlayerID );--完美情人則挑入清單
    end
  end
  DebugMsg(0, 0, '#_EffectivePlayerTable = '..#_EffectivePlayerTable)

  if ( #_EffectivePlayerTable <= 0 ) then
    -- local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffID );
    this().register5 = this().register5 + 1
	
	CancelBuff_NoEvent( _ownerID , _thisBuffID );--移除穢邪同化
    AddBuff( _ownerID , _thisBuffID , this().register5-1 , -1 );


    --DebugMsg( 0 , 1 , "There's no neighbor to infect: ".._ownerID );
	
	if ( this().register5 >= 4 ) then--受到5個「穢邪同化」效果，就會化身成為棄靈選者

		AddBuff( _ownerID , _corruptSpiritBuffID , 0 , 60 );--成為棄靈選者
		CancelBuff_NoEvent( _ownerID , _thisBuffID );--移除穢邪同化
		this().register5 = 0

		local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
		--625392統御光環
		--每當場上有一個玩家成為棄靈選者，以思帖就會每2秒回復1%HP，並且提高傷害3%，可疊加。（依照棄靈選者數量判斷）
		Lua_703126_AddLeadNimbus( _roomID );

		--625395衰竭氣息BUFF
		--暗影法術傷害，每當場上有一個玩家成為棄靈選者，此傷害額外提高2%。
		Lua_703126_GainExhaustionCount( _roomID );

		--DebugMsg( 0 , 0 , "become 棄靈選者 : ".._ownerID );
	end
  else --傳染給別人
    --DebugMsg( 0 , 1 , "There's neighbor to infect: ".._ownerID );

    _currentPlayerID = _EffectivePlayerTable[ RandRange( 1 , #_EffectivePlayerTable ) ];--由有效清單中挑選
	this().register5 = 0

    --_currentBuffLv = Lua_703107_Return_Buff_Lv( _currentPlayerID , _thisBuffID );--感染
    --AddBuff( _currentPlayerID , _thisBuffID , _currentBuffLv + 1 , 60 );--感染
	
	CancelBuff_NoEvent( _ownerID , _thisBuffID );--移除自身穢邪同化
	
	if checkbuff(_currentPlayerID, _thisBuffID) then --如果對方有則堆疊
		local BuffLevel = ReadRoleValue( _currentPlayerID, EM_RoleValue_Register5)
		AddBuff( _currentPlayerID , _thisBuffID , 0 , -1 );--感染
		WriteRoleValue( _currentPlayerID, EM_RoleValue_Register5, BuffLevel+1)
	else --沒有則從1開始
		AddBuff( _currentPlayerID , _thisBuffID , 0 , -1 );--感染
		WriteRoleValue( _currentPlayerID, EM_RoleValue_Register5, 1)
	end
	
	--_currentPlayerID.register5 = _currentPlayerID.register5 +1
	
	--yell( _currentPlayerID ,"V" , 1 )
  end

end
------------------------------END-----625390穢邪同化



----------------------------------------625392統御光環
--每當場上有一個玩家成為棄靈選者，以思帖就會每2秒回復1%HP，並且提高傷害3%，可疊加。（依照棄靈選者數量判斷）
function Lua_703126_AddLeadNimbus( _roomID )
  --local _ownerID = OwnerID();--受害者
  local _thisBuffID = 625392;--625392統御光環
  --local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  --local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];
  local _bossID = _Lua_703126_AI_GlobalConsts[ _roomID ]._bossID;

  --local _currentBuffLv = Lua_703107_Return_Buff_Lv( _bossID , _thisBuffID );
  --AddBuff( _bossID , _thisBuffID , _currentBuffLv + 1 , -1 );
  AddBuff( _bossID , _thisBuffID , 0 , -1 );
end
------------------------------END-------625392統御光環




-------------------------------------------851296衰竭氣息
function Lua_703126_GainExhaustionCount( _roomID )--增加衰竭氣息傷害
  local _thisBuffID = 625395;--625395衰竭氣息BUFF
  --local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  --local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];
  local _bossID = _Lua_703126_AI_GlobalConsts[ _roomID ]._bossID;

  --local _currentBuffLv = Lua_703107_Return_Buff_Lv( _bossID , _thisBuffID );
  --AddBuff( _bossID , _thisBuffID , _currentBuffLv + 1 , -1 );
  AddBuff( _bossID , _thisBuffID , 0 , -1 );
end
------------------------------END-------851296衰竭氣息


-------------------------------------------------------------------------------腐化協定
function Lua_703126_CorruptionTimesUp()--腐化協定時間到
  local _ownerID = TargetID();
  local _maxShadow = 1;
  DebugMsg( 0 , 0 , "Lua_703126_CorruptionTimesUp : ".._ownerID );
  for i = 1 , _maxShadow , 1 do
    Lua_703126_CreateCorruptedShadow( _ownerID );
  end
  
  return false;
end

function Lua_703126_CreateCorruptedShadow( _ownerID )--產生腐化的影子
  DebugMsg( 0 , 0 , "Lua_703126_CreateCorruptedShadow" );
  local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
  local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  if not _gConsts then
    return 0
  end
  local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];
  local _bossID = _gConsts._bossID;
  local _roomID = _gConsts._roomID;
  local _flagGUID = _gConsts._flagGUID;
  local _corruptedShadowGUID = _gConsts._corruptedShadowGUID;

  local x,y,z,dir = DW_Location( _ownerID );

  local _corruptedShadowID = CreateObj( _corruptedShadowGUID , x , y , z , dir , 1 );
  
  MoveToFlagEnabled( _corruptedShadowID , false );
  SetModeEx( _corruptedShadowID , EM_SetModeType_Mark , true ); --點選
  SetModeEx( _corruptedShadowID , EM_SetModeType_HideName , true ); --顯示名稱
  SetModeEx( _corruptedShadowID , EM_SetModeType_NotShowHPMP , true );  --顯示血條
  SetModeEx( _corruptedShadowID , EM_SetModeType_Strikback , false ); --會反擊
  SetModeEx( _corruptedShadowID , EM_SetModeType_Move , true ); --移動
  SetModeEx( _corruptedShadowID , EM_SetModeType_Fight , true );  --攻擊
  SetModeEx( _corruptedShadowID , EM_SetModeType_Searchenemy , false ); --索敵
  SetModeEx( _corruptedShadowID , EM_SetModeType_Obstruct , false );  --有阻擋效果
  AddToPartition( _corruptedShadowID , _roomID );

  _gVars.ExtObj( _corruptedShadowID );

  SetFollow( _corruptedShadowID , _bossID );
  BeginPlot( _corruptedShadowID , "Lua_703126_CorruptedShadow_OnMoving" , 0 );

  return _corruptedShadowID;
end

function Lua_703126_CorruptedShadow_OnMoving()
  local _ownerID = OwnerID();
  local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
  local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  local _bossID = _gConsts._bossID;

  local _collideRange = 30;
  
  local x,y,z,dir = DW_Location( _bossID );
  while _Lua_703126_AI_SkillCD[ _roomID ] ~= nil do
    --SetFollow( _ownerID , _bossID );
    x,y,z,dir = DW_Location( _bossID );
    Move( _ownerID , x,y,z );
    if( ( GetDistance( _ownerID, _bossID ) ) <= _collideRange )then--當影子碰到以思帖時，會使其施展「迫近深淵」。
      _Lua_703126_AI_SkillCD[ _roomID ]._downHillCD = 0;--將CD寫為0;
      --KillID( _ownerID , _ownerID );
      DelObj( _ownerID );
      DebugMsg( 0 , 0 , "CorruptedShadow_Arrived" );
      --ScriptMessage( _bossID , 0 , 1 , " A corrupted shadow has been taken , Istar now can release powerful damage by comsuming it.  " , 0 );
      ScriptMessage( _bossID , 0 , 1 , "[SC_108602_02]" , 0 );
      break;
    end
    sleep( 10 );
  end
  
end
-------------------------------------------------------------END---------------腐化協定




-----------------------------------------------------------------------判魂拘禁
function Lua_703126_SoulCurse()
  
  local _ownerID = OwnerID();--施虐者
  local _targetID = TargetID();--受害者
  local _thisBuffID = 625400;--625400蝕魂詛咒
  --DebugMsg( 0 , 0 , "Lua_703126_SoulCurse".._ownerID.."  ,   ".._targetID );

  CancelBuff( _ownerID , _thisBuffID );
  CallPlot( _targetID , "Lua_703126_SoulCursing" , _targetID , _thisBuffID );
  
  --return true;
end

function Lua_703126_SoulCursing( _targetID , _thisBuffID )
  --DebugMsg( 0 , 0 , "Lua_703126_SoulCursing : ".._targetID.."  ,   ".._thisBuffID );
  --ScriptMessage( _targetID , _targetID , 2 , " you've got a curse from Istar" , 0 );
  ScriptMessage( _targetID , _targetID , 2 , "[SC_108602_03]" , 0 );
  --local _currentBuffLv = 0;
  Sleep( 50 );
  while CheckBuff( _targetID , _thisBuffID ) do
    --_currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _thisBuffID );
    --AddBuff( _targetID , _thisBuffID , _currentBuffLv + 1 , -1 );
    AddBuff( _targetID , _thisBuffID , 0 , -1 );
    --DebugMsg( 0 , 0 , "蝕魂詛咒效果越來越明顯了 !! : ".._targetID.."   ".._thisBuffID.."    "..tostring( CheckBuff( _targetID , _thisBuffID ) ) );
    --ScriptMessage( _targetID , _targetID , 2 , " The curse is getting harder to bear , you can pass it to your team mate !!" , 0 );
    ScriptMessage( _targetID , _targetID , 2 , " [SC_108602_01]" , 0 );
    Sleep( 50 );
  end

  CancelBuff_NoEvent( _targetID , _thisBuffID );
  DebugMsg( 0 , 0 , "蝕魂詛咒效果消失了 !! : ".._targetID );
end
------------------------------------------------------END--------------判魂拘禁


-----------------------------------------------------------------------黑色裂口


function Lua_703126_DarkBreach()--黑色裂口
  DebugMsg( 0 , 0 , "Lua_703126_DarkBreach");
  local _ownerID = TargetID();
  local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
  local _effectiveRange = 70;

  local x,y,z,dir = DW_Location( _ownerID );
  local _darkBreachID = CreateObj( 108676 , x,y,z,dir , 1 );
  MoveToFlagEnabled( _darkBreachID , false );

  SetModeEx( _darkBreachID , EM_SetModeType_NotShowHPMP , true ); --不顯示血條
  SetModeEx( _darkBreachID , EM_SetModeType_Obstruct , false ); --無阻擋效果
  SetModeEx( _darkBreachID , EM_SetModeType_Gravity , false );

  SetModeEx( _darkBreachID , EM_SetModeType_HideName , true );      ---物件頭上是否顯示名稱
  SetModeEx( _darkBreachID , EM_SetModeType_HideMinimap , true );   ---物件是否在小地圖上顯示
  SetModeEx( _darkBreachID , EM_SetModeType_Searchenemy , false );    --索敵
  SetModeEx( _darkBreachID , EM_SetModeType_Mark , false );     --標記
  SetModeEx( _darkBreachID , EM_SetModeType_Fight , false );      --砍殺
  SetModeEx( _darkBreachID , EM_SetModeType_Move , false );     --移動
  SetModeEx( _darkBreachID , EM_SetModeType_ShowRoleHead , false );
  SetModeEx( _darkBreachID , EM_SetModeType_Strikback , false );    --反擊
  SetModeEx( _darkBreachID , EM_SetModeType_Show , true );


  WriteRoleValue( _darkBreachID , EM_RoleValue_LiveTime , 12 );
  AddToPartition( _darkBreachID , _Lua_703126_AI_GlobalConsts[ _roomID ]._roomID );

  _Lua_703126_AI_GlobalVars[ _roomID ].ExtObj( _darkBreachID );

  CallPlot( _darkBreachID , "Lua_703126_DarkBreach_Behavior_Loop" , _darkBreachID , _effectiveRange );
  
  return false;
end

function Lua_703126_DarkBreach_Behavior_Loop( _ownerID , _effectiveRange )--黑色裂口
  DebugMsg( 0 , 0 , "Lua_703126_DarkBreach_Behavior_Loop");
  local _rangePlayerList = SearchRangePlayer( _ownerID , _effectiveRange );
  --local _rangeNpcList = SearchRangeNPC( _ownerID , _effectiveRange );
  local x,y,z,dir = DW_Location( _ownerID );
  while ( true ) do
    --DebugMsg( 0 , 0 , "Lua_703126_DarkBreach_Behavior_Loop___Galop----");
    _rangePlayerList = SearchRangePlayer( _ownerID , _effectiveRange );
    --_rangeNpcList = SearchRangeNPC( _ownerID , _effectiveRange ); 

    --if ( #_rangePlayerList > 0 or #_rangeNpcList > 0 ) then
    if ( #_rangePlayerList > 0 ) then
      --DebugMsg( 0 , 0 , "Lua_703126_DarkBreach_Behavior_Loop___Galop----Casting == 負能量波");
      CastSpellPos( _ownerID , x,y,z , 851625 , 1 );--851625負能量波
    end
    Sleep( 5 );
  end

end
-----------------------------------------------------END---------------黑色裂口


-----------------------------------------------------------------------碎滅斬
function Lua_703126_CrushingSlay()
  local _ownerID = OwnerID();--Boss
  local _targetID = TargetID();--Victim
  local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );    

  --DebugMsg( 0 , 0 , "Lua_703126_CrushingSlay Target : ".._targetID );

  local x,y,z,dir = DW_Location( _targetID );
  -- local _dummyID = Lua_703126_CreateClone( _roomID , x,y,z,dir , 1 );
  -- that( _dummyID ):addbuff( 502648 )

  local caster = this()
  local avatar = Christine.Npc:new()
  avatar:create( 108653, caster.x, caster.y, caster.z, caster.direction )
  avatar:property {
    search_enemy = false,
    strike_back = false,
    fight = false,
    movable = true,
    hide_from_mini_map = true,
    hide_hp_mp = true,
    hide_name = true,
    mark = false,
    show_role_head = false
  }
  avatar:addBuff( 502648 )
  avatar:addToPartition( _roomID )
  avatar:callPlot( 'Lua_703126_CrushingSlay_Execute', x, y, z )

  -- CallPlot( _dummyID , "Lua_703126_CrushingSlay_Execute" , Move( _dummyID, x, y, z ) );
  -- BeginPlot( _dummyID , "Lua_703126_CrushingSlay_Execute" , Move( _dummyID, x, y, z ) );
end

function Lua_703126_CrushingSlay_Execute( _x, _y, _z)
  --DebugMsg( 0 , 0 , "Lua_703126_CrushingSlay_Execute " );
  -- local _dummyID = OwnerID();
  -- local _roomID = ReadRoleValue( _dummyID , EM_RoleValue_RoomID );
  -- SysCastSpellLv( _Lua_703126_AI_GlobalConsts[ _roomID ]._bossID , _dummyID , 851626 , 1 );

  local this = this()
  local target = { x = _x, y = _y, z = _z }

  for i = 1, 60 do
    if this:distanceTo( target ) > 5 then
      this:move( _x, _y, _z, false)
    else
      break
    end
    sleep( 10 )
  end

  this:cancelBuff( 502648 ):delete()

end

function Lua_703126_SetdeadPlot()
	Lua703045_Z32D_BossKilled_Check()
	Cl_Resist_HackersBossDead()
end
-----------------------------------------------------END---------------碎滅斬

------------------------------------------------------------------------END--------Skill functions