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
      
      _corruptedShadowGUID = 108665 , --108665�G�ƪ��v�l
      
      _flagGUID = 781317 ,  --�X�нs��
      _doorGUID = 106249 ,  --���ת�����s��
      
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
      _meleeExploreGUID = 851062 , --851062�Z�F���z��
      --625390©���P��
      --625391���F���
      --625392�αs����
      --625395�I�ܮ�BUFF

      _soulImprisoningGUID = 851601, --851601�q���T
      _soulImprisoningCD = 100000 , --�q���TCD(sec)

      _downHillGUID = 851283 ,--851283����`�W
      _downHillCD = 100000 ,--����`�WCD Time set(sec)

      _darkBreachGUID = 851615, --�¦���f
      _darkBreachCD = 19 , --�¦���fCD(sec)

      _corruptionGUID = 851599 , --851599�G�ƨ�w
      _corruptionCD = 13 , --�G�ƨ�wCD(sec)

      _crushingSlayGUID = 851603, --�H����
      _crushingSlayCD = 11 , --�H����CD(sec)

      _evilSpikeGUID = 851282 ,--851282©������
      _evilSpikeCD = 7 ,--©������CD(sec)

      _exhaustionGUID = 851296 ,--851296�I�ܮ�
      _exhaustionCD = 2 ,--�I�ܮ�CD(sec)

      _furyGUID =  625441 --�ѫo�ռv(�g��)

    };--_Lua_703126_AI_SkillVars


  _Lua_703126_AI_SkillCD[ _roomID ] = {
      _downHillCD = _Lua_703126_AI_SkillConsts[ _roomID ]._downHillCD , --����`�WCD Timer
      _evilSpikeCD = _Lua_703126_AI_SkillConsts[ _roomID ]._evilSpikeCD , --©������CD
      _exhaustionCD = _Lua_703126_AI_SkillConsts[ _roomID ]._exhaustionCD , --�I�ܮ�CD
      _corruptionCD = _Lua_703126_AI_SkillConsts[ _roomID ]._corruptionCD , --�G�ƨ�wCD
      _soulImprisoningCD = _Lua_703126_AI_SkillConsts[ _roomID ]._soulImprisoningCD , --�q���TCD(sec)
      _crushingSlayCD = _Lua_703126_AI_SkillConsts[ _roomID ]._crushingSlayCD , --�}�H��CD(sec)
      _darkBreachCD = _Lua_703126_AI_SkillConsts[ _roomID ]._darkBreachCD , --�}�H��CD(sec)

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

  local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )  --�l�ͪ�(�B�z�۳ꪫ �� ���X�Ӫ��F��)
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
  local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
  local _zoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID );--OwnerID�b�o�̫�CTRLID
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

  -----------------------------------------�g�ɰѼ�
  local _fury_course = false;
  local _fury_CD = 9999999;

  if ( _zoneID == 169 ) then
    _fury_CD = 480;
  end

  if ( _zoneID == 170 ) then
    _fury_CD = 360;
  end
  --_Lua_703126_AI_SkillCD[ _roomID ]._fury_CD = _fury_CD;
  ----------------------------END----------�g�ɰѼ�

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


    -------------------------------------------------�԰���������
    if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss ���`�ɤ��_�԰��j��
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
    -------------------------------------END--------�԰���������


    -------------------------------------------------Timers
    if ( _GCD > 0 ) then _GCD = _GCD - _timeTick; end

    for _key , _value in pairs( _Lua_703126_AI_SkillCD[ _roomID ] ) do
      --DebugMsg( 0 , 0 , "-- : ".._key.." __ ".. _value );
      if ( _Lua_703126_AI_SkillCD[ _roomID ][ _key ] > 0 ) then _Lua_703126_AI_SkillCD[ _roomID ][ _key ] = _value - _timeTick; end
    end
    ---------------------------------------END-------Timers


    --�g�ɾ���
    if( _clock >= _fury_CD )and (fury_course == false) then
        fury_course=true;
        AddBuff( _bossID , 625441 , 0 , -1 );-- 625441 �ѫo�ռv
        ScriptMessage( _bossID , 0 , 2 , "[SC_108602_RAID]" , 0 );
        --lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_FURY]",0);--[107966]�P����_�ު��C��A�}�l���J�Y�غƨg���A�I
    end   


    ------------------------------------------------Skills
    for i = 1 , 1 , 1 do--switch case simulation  --���� switch case 

      if( _Lua_703126_AI_SkillCD[ _roomID ]._downHillCD <= 0 )then --�񭢲`�W  --�өۤ���GCD�v�T
        MagicInterrupt( _bossID );
        _GCD = 6;--�`�NGCD����(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._downHillCD = _Lua_703126_AI_SkillConsts[ _roomID ]._downHillCD;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        Sleep( 10 );
        DebugMsg( 0 , 0 , "-------casting �񭢲`�W" );
        local x,y,z,dir = DW_Location( _bossID );
        CastSpellPos( _bossID , x,y,z, _Lua_703126_AI_SkillConsts[ _roomID ]._downHillGUID , 1  );
        break;
      end--�񭢲`�W

      if ( _GCD > 0 ) then break; end --��GCD���ɤ�����  --GCD�ΨӨ���ۦ��Q�Y��
      --DebugMsg( 0 , 0 , "--GCD unlocked" );
      --CD�u�����y��e��  ���M�e������ޯ�Ƶ{
      
      if( _Lua_703126_AI_SkillCD[ _roomID ]._soulImprisoningCD <= 0 )then --�P���T
        _GCD = 6;--�`�NGCD����(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._soulImprisoningCD = _Lua_703126_AI_SkillConsts[ _roomID ]._soulImprisoningCD;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        DebugMsg( 0 , 0 , "-------casting �P���T" );
        local _targetList = Lua_RandomPlayerFromHateList( _bossID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ
        local _targetID = _targetList[ 1 ];
        if ( not _targetID ) then break; end
        CastSpell( _bossID , _targetID , _Lua_703126_AI_SkillConsts[ _roomID ]._soulImprisoningGUID );
        break;
      end--�P���T


      if( _Lua_703126_AI_SkillCD[ _roomID ]._darkBreachCD <= 0 )then --�¦���f
        _GCD = 12;--�`�NGCD����(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._darkBreachCD = _Lua_703126_AI_SkillConsts[ _roomID ]._darkBreachCD + _GCD;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        DebugMsg( 0 , 0 , "-------casting �¦���f" );
        local _targetList = Lua_RandomPlayerFromHateList( _bossID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ
        local _targetID = _targetList[ 1 ];
        if ( not _targetID ) then break; end
        local x,y,z,dir = DW_Location( _targetID );
        CastSpell( _bossID , _targetID , _Lua_703126_AI_SkillConsts[ _roomID ]._darkBreachGUID );
        break;
      end--�¦���f


      if( _Lua_703126_AI_SkillCD[ _roomID ]._corruptionCD <= 0 )then --�G�ƨ�w
        _GCD = 10;--�`�NGCD����(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._corruptionCD = _Lua_703126_AI_SkillConsts[ _roomID ]._corruptionCD + _GCD;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        DebugMsg( 0 , 0 , "-------casting �G�ƨ�w" );
        local _targetList = Lua_RandomPlayerFromHateList( _bossID , 1 , true );--(BossID,HowMuch,AntiTank) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ
        local _targetID = _targetList[ 1 ];
        if ( not _targetID ) then break; end
        CastSpell( _bossID , _targetID , _Lua_703126_AI_SkillConsts[ _roomID ]._corruptionGUID );
        break;
      end--�G�ƨ�w


      if( _Lua_703126_AI_SkillCD[ _roomID ]._crushingSlayCD <= 0 )then --�}�H��
        _GCD = 30;--�`�NGCD����(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._crushingSlayCD = _Lua_703126_AI_SkillConsts[ _roomID ]._crushingSlayCD + _GCD*2;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        DebugMsg( 0 , 0 , "-------casting �}�H��" );
        local _targetList = Lua_RandomPlayerFromHateList( _bossID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ
        local _targetID = _targetList[ 1 ];
        if ( not _targetID ) then break; end
        --_targetID = Lua_703126_CreateClone( DW_Location( _targetID ) );
        CastSpell( _bossID , _targetID , _Lua_703126_AI_SkillConsts[ _roomID ]._crushingSlayGUID );
        --CastSpell( _bossID , _targetID , 851626 );

--        local x,y,z,dir = DW_Location( _targetID );
--        CastSpellPos( _bossID , x,y,z , 851626 , 1 );

        break;
      end--�}�H��


      if( _Lua_703126_AI_SkillCD[ _roomID ]._evilSpikeCD <= 0 )then --©������
        _GCD = 10;--�`�NGCD����(dead lock)
        _Lua_703126_AI_SkillCD[ _roomID ]._evilSpikeCD = _Lua_703126_AI_SkillConsts[ _roomID ]._evilSpikeCD;
        --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
        DebugMsg( 0 , 0 , "-------casting ©������" );
        local _targetList = Lua_RandomPlayerFromHateList( _bossID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ
        local _targetID = _targetList[ 1 ];
        if ( not _targetID ) then break; end
        CastSpell( _bossID , _targetID , _Lua_703126_AI_SkillConsts[ _roomID ]._evilSpikeGUID );
        break;
      end--©������
  
        
    end--end for --switch case simulation


    if( _Lua_703126_AI_SkillCD[ _roomID ]._exhaustionCD <= 0 )then --�I�ܮ�--NO GCD
      _Lua_703126_AI_SkillCD[ _roomID ]._exhaustionCD = _Lua_703126_AI_SkillConsts[ _roomID ]._exhaustionCD;
      --^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^CD
      --DebugMsg( 0 , 0 , "-------casting �I�ܮ�" );
      local x,y,z,dir = DW_Location( _bossID );
      SysCastSpellLv_Pos( _bossID , x,y,z, _Lua_703126_AI_SkillConsts[ _roomID ]._exhaustionGUID , 1  );
    end--�I�ܮ�
    
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
  Delobj( _frontDoorID ); --�R���e��
  _gVars.DelExtObjs();--clear all extend items

  Sleep( 20 );
  
  DelFromPartition( _bossID );
  
  _Lua_703126_AI_GlobalVars[ _roomID ] = nil; --clear all values
  _Lua_703126_AI_GlobalConsts[ _roomID ] = nil; --clear all values
  _Lua_703126_AI_SkillConsts[ _roomID ] = nil;  --clear all values
  _Lua_703126_AI_SkillCD[ _roomID ] = nil;    --clear all values  

  Sleep( 50 );

  DW_UnFight( _bossID , false );
  --SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos ); --20150904 �h��:�����D �L�|�]��ܻ��B�~�^��
  SetPosByFlag( _bossID , 781317 , 2 ); --20150904 �ؤ@��s��
  AddToPartition( _bossID , _roomID );
end

function Lua_703126_AI_Conquered( _roomID )

  local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];--for read
  local _bossID = _Lua_703126_AI_GlobalConsts[ _roomID ]._bossID;

  ScriptMessage( _bossID , 0 , 2 , "[SC_108602_DEATH]" , 0 );

  Delobj( _gVars._frontDoorID );  --�R���e��
  --Delobj( _gVars._rearDoorID ); --�R�����

  sasa_ZoneDungeon_title_01(530997)  --Z32�ƥ����� 

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
  SetModeEx( _doorID , EM_SetModeType_Mark , false ); --���i�I��
  SetModeEx( _doorID , EM_SetModeType_HideName , false ); --����ܦW��
  SetModeEx( _doorID , EM_SetModeType_NotShowHPMP , false );  --����ܦ��
  SetModeEx( _doorID , EM_SetModeType_Strikback , false );  --���|����
  SetModeEx( _doorID , EM_SetModeType_Move , false ); --���|����
  SetModeEx( _doorID , EM_SetModeType_Fight , false );  --���i����
  SetModeEx( _doorID , EM_SetModeType_Searchenemy , false );  --���|����
  SetModeEx( _doorID , EM_SetModeType_Obstruct , true );  --�����׮ĪG
  AddToPartition( _doorID , _roomID );
  return _doorID;
end


function  Lua_703126_CreateClone( _roomID , x,y,z,dir , _liveTime )--����
  --local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  --local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];

  --local _bossID = _gConsts._bossID;

  local _cloneID = _Lua_703126_AI_GlobalConsts[ _roomID ]._cloneGUID;

  --local x,y,z,dir = DW_Location( _bossID );
  
  _cloneID = CreateObj( _cloneID , x , y , z , dir , 1 );
  --_Lua_703126_AI_GlobalVars[ _roomID ].ExtObj( _cloneID );

  --SetModeEx( _cloneID , EM_SetModeType_Mark , false );  --���i�I��
  --SetModeEx( _cloneID , EM_SetModeType_HideName , false );  --����ܦW��
  SetModeEx( _cloneID , EM_SetModeType_NotShowHPMP , true );  --����ܦ��
  --SetModeEx( _cloneID , EM_SetModeType_Strikback , false ); --���|����
  --SetModeEx( _cloneID , EM_SetModeType_Move , false );  --���|����
  --SetModeEx( _cloneID , EM_SetModeType_Fight , false ); --���i����
  --SetModeEx( _cloneID , EM_SetModeType_Searchenemy , false ); --���|����
  SetModeEx( _cloneID , EM_SetModeType_Obstruct , false );  --�L���׮ĪG
  SetModeEx( _cloneID , EM_SetModeType_Gravity , false );


  SetModeEx( _cloneID , EM_SetModeType_HideName , true );     ---�����Y�W�O�_��ܦW��
  SetModeEx( _cloneID , EM_SetModeType_HideMinimap , true );    ---����O�_�b�p�a�ϤW���
  SetModeEx( _cloneID , EM_SetModeType_Searchenemy , false );     --����
  SetModeEx( _cloneID , EM_SetModeType_Mark , false );      --�аO
  SetModeEx( _cloneID , EM_SetModeType_Fight , false );       --���
  SetModeEx( _cloneID , EM_SetModeType_Move , false );      --����
  SetModeEx( _cloneID , EM_SetModeType_ShowRoleHead , true );
  SetModeEx( _cloneID , EM_SetModeType_Strikback , false );   --����
  SetModeEx( _cloneID , EM_SetModeType_Show , true );
  --SetModeEx( _cloneID , EM_SetModeType_Show , false );  
  WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , _liveTime or 20 );

  --AddBuff( _cloneID , 507899 , 1 , 100 );--���i���z����
  AddToPartition( _cloneID , _Lua_703126_AI_GlobalConsts[ _roomID ]._roomID );
  
  _Lua_703126_AI_GlobalVars[ _roomID ]._cloneID = _cloneID;

  --DebugMsg( 0 , 0 , "--Lua_703126_CreateClone : ".._cloneID );

  return _cloneID;
end


-----------------------------------------------------------------------------------Skill functions
--NPC : 108602
function Lua_703126_MeleeExplode()--�Z�F���z��(Trigger)625387
  DebugMsg( 0 , 0 , "--Lua_703126_MeleeExplode" );
  local _ownerID = OwnerID();--Buff�֦���
  local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
  local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  --local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];

  if ( _gConsts == nil ) then return; end

  local _bossID = _gConsts._bossID;

  --local _cloneID = _gVars._cloneID;

  local x,y,z,dir = DW_Location( _ownerID );
  
  --SetPos( _cloneID , x,y,z,dir );
  --DebugMsg( 0 , 0 , "--Lua_703126_MeleeExplode : Caster :".._cloneID );
  --CastSpellPos( _cloneID , x , y , z , _gConsts._spid_meleeExplore , 1 );--�Z�F���z��
  SysCastSpellLv_Pos( _bossID , x , y , z , _Lua_703126_AI_SkillConsts[ _roomID ]._meleeExploreGUID , 1 );--�Z�F���z��

  --WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , 1 );
  
end

---------------------------------------625390©���P��
--�v���q���C50%�A����60��A��ɶ������|��ۨ��H�ΩP��100�X���H���@�H�A�I��@���B�~���u©���P�ơv�F
--�p�G�P��S������H�A�h�B�~�����ĪG�N�I��b�ۤv���W�C���󪱮a�u�n����3�ӡu©���P�ơv�ĪG�A�N�|�ƨ��������F��̡A
--�L�k�A�������v���ĪG�A�w�g�������F��̪����a�L�k�A����u©���P�ơv�C
function Lua_703126_EvilAssimilation_EffectCheck()
  local _ownerID = TargetID();--���`��
  local _corruptSpiritBuffID = 625391;--625391���F���
  if ( CheckBuff( _ownerID , _corruptSpiritBuffID ) ) then--625391���F���--�w�g�������F��̪����a�L�k�A����u©���P�ơv
    --DebugMsg( 0 , 0 , "���F��� already : ".._ownerID );
    return false;
  elseif ( CheckBuff( _ownerID , 625390 ) ) then --20150903 �h���� �����|���| �u�|���S�W���H�W�@�h
	local BuffLevel = ReadRoleValue( _ownerID, EM_RoleValue_Register5)
	WriteRoleValue( _ownerID, EM_RoleValue_Register5, BuffLevel+1)
	return true;
  else
	WriteRoleValue( _ownerID, EM_RoleValue_Register5, 1)
	return true;
  end
end


function Lua_703126_EvilAssimilation_Infection()--625390©���P��  �ǬV����
  -- local _ownerID = TargetID();--���`��
  local _ownerID = OwnerID();--���`��
  local _thisBuffID = 625390;--625390©���P��
  local _corruptSpiritBuffID = 625391;--625391���F���

  local _EffectiveRange = 100;  

  --local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffID );
  --AddBuff( _ownerID , _thisBuffID , _currentBuffLv + 1 , 60 );

  DebugMsg( 0 , 0 , "Contagious : ".._ownerID );

  local _RangePlayerTable = SearchRangePlayer( _ownerID , _EffectiveRange ); --����ۤv�Z��100���Ҧ����a
  DebugMsg(0, 0, '#_RangePlayerTable = '..#_RangePlayerTable)
  local _EffectivePlayerTable = {};
  
  local _currentPlayerID = 0;
  for i = 0 , #_RangePlayerTable - 1 , 1 do--�D��ǬV���Ī��a
    _currentPlayerID = _RangePlayerTable[ i ];
    DebugMsg(0, 0, '_RangePlayerTable['..i..'] = '.._RangePlayerTable[ i ])
    if  ( _currentPlayerID ~= _ownerID )  --�D���`�̥���
      and ( ReadRoleValue( _currentPlayerID , EM_RoleValue_IsDead ) ~= 1 ) --�٦s��
      and ( CheckBuff( _currentPlayerID , _corruptSpiritBuffID ) == false ) --�D625391���F���
      then
      table.insert( _EffectivePlayerTable , _currentPlayerID );--�������H�h�D�J�M��
    end
  end
  DebugMsg(0, 0, '#_EffectivePlayerTable = '..#_EffectivePlayerTable)

  if ( #_EffectivePlayerTable <= 0 ) then
    -- local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffID );
    this().register5 = this().register5 + 1
	
	CancelBuff_NoEvent( _ownerID , _thisBuffID );--����©���P��
    AddBuff( _ownerID , _thisBuffID , this().register5-1 , -1 );


    --DebugMsg( 0 , 1 , "There's no neighbor to infect: ".._ownerID );
	
	if ( this().register5 >= 4 ) then--����5�ӡu©���P�ơv�ĪG�A�N�|�ƨ��������F���

		AddBuff( _ownerID , _corruptSpiritBuffID , 0 , 60 );--�������F���
		CancelBuff_NoEvent( _ownerID , _thisBuffID );--����©���P��
		this().register5 = 0

		local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
		--625392�αs����
		--�C����W���@�Ӫ��a�������F��̡A�H�䩫�N�|�C2��^�_1%HP�A�åB�����ˮ`3%�A�i�|�[�C�]�̷ӱ��F��̼ƶq�P�_�^
		Lua_703126_AddLeadNimbus( _roomID );

		--625395�I�ܮ�BUFF
		--�t�v�k�N�ˮ`�A�C����W���@�Ӫ��a�������F��̡A���ˮ`�B�~����2%�C
		Lua_703126_GainExhaustionCount( _roomID );

		--DebugMsg( 0 , 0 , "become ���F��� : ".._ownerID );
	end
  else --�ǬV���O�H
    --DebugMsg( 0 , 1 , "There's neighbor to infect: ".._ownerID );

    _currentPlayerID = _EffectivePlayerTable[ RandRange( 1 , #_EffectivePlayerTable ) ];--�Ѧ��ĲM�椤�D��
	this().register5 = 0

    --_currentBuffLv = Lua_703107_Return_Buff_Lv( _currentPlayerID , _thisBuffID );--�P�V
    --AddBuff( _currentPlayerID , _thisBuffID , _currentBuffLv + 1 , 60 );--�P�V
	
	CancelBuff_NoEvent( _ownerID , _thisBuffID );--�����ۨ�©���P��
	
	if checkbuff(_currentPlayerID, _thisBuffID) then --�p�G��観�h���|
		local BuffLevel = ReadRoleValue( _currentPlayerID, EM_RoleValue_Register5)
		AddBuff( _currentPlayerID , _thisBuffID , 0 , -1 );--�P�V
		WriteRoleValue( _currentPlayerID, EM_RoleValue_Register5, BuffLevel+1)
	else --�S���h�q1�}�l
		AddBuff( _currentPlayerID , _thisBuffID , 0 , -1 );--�P�V
		WriteRoleValue( _currentPlayerID, EM_RoleValue_Register5, 1)
	end
	
	--_currentPlayerID.register5 = _currentPlayerID.register5 +1
	
	--yell( _currentPlayerID ,"V" , 1 )
  end

end
------------------------------END-----625390©���P��



----------------------------------------625392�αs����
--�C����W���@�Ӫ��a�������F��̡A�H�䩫�N�|�C2��^�_1%HP�A�åB�����ˮ`3%�A�i�|�[�C�]�̷ӱ��F��̼ƶq�P�_�^
function Lua_703126_AddLeadNimbus( _roomID )
  --local _ownerID = OwnerID();--���`��
  local _thisBuffID = 625392;--625392�αs����
  --local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  --local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];
  local _bossID = _Lua_703126_AI_GlobalConsts[ _roomID ]._bossID;

  --local _currentBuffLv = Lua_703107_Return_Buff_Lv( _bossID , _thisBuffID );
  --AddBuff( _bossID , _thisBuffID , _currentBuffLv + 1 , -1 );
  AddBuff( _bossID , _thisBuffID , 0 , -1 );
end
------------------------------END-------625392�αs����




-------------------------------------------851296�I�ܮ�
function Lua_703126_GainExhaustionCount( _roomID )--�W�[�I�ܮ𮧶ˮ`
  local _thisBuffID = 625395;--625395�I�ܮ�BUFF
  --local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
  --local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];
  local _bossID = _Lua_703126_AI_GlobalConsts[ _roomID ]._bossID;

  --local _currentBuffLv = Lua_703107_Return_Buff_Lv( _bossID , _thisBuffID );
  --AddBuff( _bossID , _thisBuffID , _currentBuffLv + 1 , -1 );
  AddBuff( _bossID , _thisBuffID , 0 , -1 );
end
------------------------------END-------851296�I�ܮ�


-------------------------------------------------------------------------------�G�ƨ�w
function Lua_703126_CorruptionTimesUp()--�G�ƨ�w�ɶ���
  local _ownerID = TargetID();
  local _maxShadow = 1;
  DebugMsg( 0 , 0 , "Lua_703126_CorruptionTimesUp : ".._ownerID );
  for i = 1 , _maxShadow , 1 do
    Lua_703126_CreateCorruptedShadow( _ownerID );
  end
  
  return false;
end

function Lua_703126_CreateCorruptedShadow( _ownerID )--���ͻG�ƪ��v�l
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
  SetModeEx( _corruptedShadowID , EM_SetModeType_Mark , true ); --�I��
  SetModeEx( _corruptedShadowID , EM_SetModeType_HideName , true ); --��ܦW��
  SetModeEx( _corruptedShadowID , EM_SetModeType_NotShowHPMP , true );  --��ܦ��
  SetModeEx( _corruptedShadowID , EM_SetModeType_Strikback , false ); --�|����
  SetModeEx( _corruptedShadowID , EM_SetModeType_Move , true ); --����
  SetModeEx( _corruptedShadowID , EM_SetModeType_Fight , true );  --����
  SetModeEx( _corruptedShadowID , EM_SetModeType_Searchenemy , false ); --����
  SetModeEx( _corruptedShadowID , EM_SetModeType_Obstruct , false );  --�����׮ĪG
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
    if( ( GetDistance( _ownerID, _bossID ) ) <= _collideRange )then--��v�l�I��H�䩫�ɡA�|�Ϩ�I�i�u����`�W�v�C
      _Lua_703126_AI_SkillCD[ _roomID ]._downHillCD = 0;--�NCD�g��0;
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
-------------------------------------------------------------END---------------�G�ƨ�w




-----------------------------------------------------------------------�P���T
function Lua_703126_SoulCurse()
  
  local _ownerID = OwnerID();--�I�h��
  local _targetID = TargetID();--���`��
  local _thisBuffID = 625400;--625400�k��A�G
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
    --DebugMsg( 0 , 0 , "�k��A�G�ĪG�V�ӶV����F !! : ".._targetID.."   ".._thisBuffID.."    "..tostring( CheckBuff( _targetID , _thisBuffID ) ) );
    --ScriptMessage( _targetID , _targetID , 2 , " The curse is getting harder to bear , you can pass it to your team mate !!" , 0 );
    ScriptMessage( _targetID , _targetID , 2 , " [SC_108602_01]" , 0 );
    Sleep( 50 );
  end

  CancelBuff_NoEvent( _targetID , _thisBuffID );
  DebugMsg( 0 , 0 , "�k��A�G�ĪG�����F !! : ".._targetID );
end
------------------------------------------------------END--------------�P���T


-----------------------------------------------------------------------�¦���f


function Lua_703126_DarkBreach()--�¦���f
  DebugMsg( 0 , 0 , "Lua_703126_DarkBreach");
  local _ownerID = TargetID();
  local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
  local _effectiveRange = 70;

  local x,y,z,dir = DW_Location( _ownerID );
  local _darkBreachID = CreateObj( 108676 , x,y,z,dir , 1 );
  MoveToFlagEnabled( _darkBreachID , false );

  SetModeEx( _darkBreachID , EM_SetModeType_NotShowHPMP , true ); --����ܦ��
  SetModeEx( _darkBreachID , EM_SetModeType_Obstruct , false ); --�L���׮ĪG
  SetModeEx( _darkBreachID , EM_SetModeType_Gravity , false );

  SetModeEx( _darkBreachID , EM_SetModeType_HideName , true );      ---�����Y�W�O�_��ܦW��
  SetModeEx( _darkBreachID , EM_SetModeType_HideMinimap , true );   ---����O�_�b�p�a�ϤW���
  SetModeEx( _darkBreachID , EM_SetModeType_Searchenemy , false );    --����
  SetModeEx( _darkBreachID , EM_SetModeType_Mark , false );     --�аO
  SetModeEx( _darkBreachID , EM_SetModeType_Fight , false );      --���
  SetModeEx( _darkBreachID , EM_SetModeType_Move , false );     --����
  SetModeEx( _darkBreachID , EM_SetModeType_ShowRoleHead , false );
  SetModeEx( _darkBreachID , EM_SetModeType_Strikback , false );    --����
  SetModeEx( _darkBreachID , EM_SetModeType_Show , true );


  WriteRoleValue( _darkBreachID , EM_RoleValue_LiveTime , 12 );
  AddToPartition( _darkBreachID , _Lua_703126_AI_GlobalConsts[ _roomID ]._roomID );

  _Lua_703126_AI_GlobalVars[ _roomID ].ExtObj( _darkBreachID );

  CallPlot( _darkBreachID , "Lua_703126_DarkBreach_Behavior_Loop" , _darkBreachID , _effectiveRange );
  
  return false;
end

function Lua_703126_DarkBreach_Behavior_Loop( _ownerID , _effectiveRange )--�¦���f
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
      --DebugMsg( 0 , 0 , "Lua_703126_DarkBreach_Behavior_Loop___Galop----Casting == �t��q�i");
      CastSpellPos( _ownerID , x,y,z , 851625 , 1 );--851625�t��q�i
    end
    Sleep( 5 );
  end

end
-----------------------------------------------------END---------------�¦���f


-----------------------------------------------------------------------�H����
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
-----------------------------------------------------END---------------�H����

------------------------------------------------------------------------END--------Skill functions