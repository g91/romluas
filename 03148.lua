--Author : K.J. Aris
--Version : 14.02.25.
--Ignitor : 108910
--NPC : 108910--raid
--Script : 703148

local _Lua_703148_AI_GlobalVars = {};

function Lua_703148_AI_Init( _inputCtrID )--controller  NPC 108910 --Note : this NPC is using as a ignitor
---	DebugMsg( 0 , 0 , "--Lua_703148_AI_Init : NPC 108910       Z33-2B3  V140225 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --�H�����ư��� �N�즳����R��

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108910
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108814
	
	--this NPC is using as a controller
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _ctrlID , EM_SetModeType_HideName , false );	--����ܦW��
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG

	-------------------------------------------initialize settings
	local _zoneID = ReadRoleValue( _ctrlID , EM_RoleValue_ZoneID );

	local _difficulty = 1;
	local _frenzyCD = 480;--�g�ɰѼ�

	if ( _zoneID == 176 ) then
		_difficulty = 2;
		_frenzyCD = 360;
	end

	if ( _zoneID == 177 ) then
		_difficulty = 3;
		_frenzyCD = 9999999;
	end
	---------------------------------------

	----------------------------END----------�g�ɰѼ�
	
	--�Ш������׶��ǩ�m
	local _bossGUIDs = { 108830 , 108830 , 108830 };--���ƶ�

	--�ѼƳ]�w��
	_Lua_703148_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossGUID = _bossGUIDs[ _difficulty ] ,
					_ctrlGUID = 108705 ,--���ID
					_doorGUID = 106012 , 

					_flagGUID = 781417 , --781417 Z33-2_3���κX��
					_bossFlagPos = 1 , 
					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 99 ,
					_roomCenterFlagPos = 3 ,--���������аO

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,
					_phaseBuffGUIDs = { 625872 , 625873 , 625874 , 625875 } , --�԰����qBuff �̧� 1.2.3.4.
					_phase4CycleCD = 7 , --�ĥ|���q �欰�`���ɶ�
					_targetFlagPosInfo = { 4 , 5 } ,--��Ť۹� �ǰe��FLAG��m  (�M����צP�ɥN��ؼмƶq)
					};
	--��Ū��T
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];

	--���� Boss
	Lua_DavisDelObj( _gConsts._bossGUID );
	local _bossID = CreateObjByFlag( _gConsts._bossGUID , _gConsts._flagGUID , _gConsts._bossFlagPos , 1 );--108800
	_gConsts._bossID = _bossID;
	SetModeEx( _bossID , EM_SetModeType_Obstruct , false);	-- ����
	SetModeEx( _bossID , EM_SetModeType_Fight , true );	-- ���
	SetModeEx( _bossID , EM_SetModeType_Move , true );	-- ����
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true);	-- ����
	SetModeEx( _bossID , EM_SetModeType_Strikback , true);	-- ����
--	AddBuff( _bossID , 500226 , 0 , -1 );--���ƶ��`�n�S��
	AddToPartition( _bossID , _roomID ); 

	--���ͫ��
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
function Zone_175_Boss3_108830_Init()	-- ���ƶ��_�l�@��

	local Owner = OwnerID();
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local OwnerPos = Vector_GetRolePos( Owner );

	local AttachMeshyahObjs = {};	-- �P���ƶ��p��������
	AttachMeshyahObjs[106972] = { OwnerPoint = "p_top", TargetPoint = "p_top" };	-- �Y���S��
	AttachMeshyahObjs[106973] = { OwnerPoint = "p_down", TargetPoint = "p_down" };	-- �L���S��;

	for index, objid in pairs(AttachMeshyahObjs) do
		local Obj = CreateObj( index, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
		SetModeEx( Obj, EM_SetModeType_Move, false );	-- ����
		SetModeEx( Obj, EM_SetModeType_Mark, false );	-- �аO
		SetModeEx( Obj, EM_SetModeType_ShowRoleHead, false );	-- �Y��
		SetModeEx( Obj, EM_SetModeType_Searchenemy, false );	-- ����
		SetModeEx( Obj, EM_SetModeType_Fight, false );	-- ���
		SetModeEx( Obj, EM_SetModeType_Strikback, false );	-- ����
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
	--��Ū��T
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703148_AI_reignite( _roomID ); return; end

	--����P�l������
	local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--�l�ͪ�(�B�z�۳ꪫ �� ���X�Ӫ��F��)
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

	BeginPlot( _ctrlID , "Lua_703148_AI_Engage" , 0 );	-- �Ѥ��������檺�԰��}�l

	ScriptMessage(_bossID,0,2,"[LUA_703148_AI_ONFIGHT]",0);	-- �A��ı���e���Ǫ��w�g���A�O������x���j���q�K�K

	CastSpell( _bossID , _bossID , 851918 );--�ѫo��w

	local _currentPhase = 1;
	WriteRoleValue( _bossID , EM_RoleValue_Register1 , _currentPhase );--�԰����q
	AddBuff( _bossID , _gConsts._phaseBuffGUIDs[ _currentPhase ] , 0 , -1 );	-- �԰����q���� Buff
	
--	CallPlot( ReadRoleValue( _bossID , EM_RoleValue_AttackTargetID ) , "Lua_703148_Skill_Clear" );--�M�����a�ޯ�P�V�ƭ�
	CallPlot( _bossID , "Cl_Resist_HackersFightBegin" );
end--function Lua_703148_AI_onFight()

function Lua_703148_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
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
			_phase4Cycle = -1 , --�ĥ|���q �欰�`���ɶ� ����_�� ��ĥ|���q�~�}��
		}

	-----------------------------------------�g�ɰѼ�
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;
	----------------------------END----------�g�ɰѼ�

	-----------------------------------------���q�ഫ
	local _bossHpRatio = 0;
	local _phaseTransformPeriodRatio = 0.3;--HP�C�l��30%�ഫ���q
	local _hpStepping = 1.0 - _phaseTransformPeriodRatio;--�U�@���q�ഫ���
	----------------------------END----------���q�ഫ

	local _hateListCounter = 0;
	
	DebugMsg( 0 , 0 , "--Start loop" );

	while true do 
		--------------------clock
		Sleep( _miniTimeTick );
		_clock = _clock + _timeTick;
		--------------END---clock
		--DebugMsg( 0 , 0 , "--Clock : ".._clock );
		
		--------------------Routines
		--_availableTargetPlayer = LUA_YOYO_RangePlayerNotGM_EX( _bossID , _gConsts._effectiveRange , true ); --����ۤv�Z��_effectiveRange���s�����a�A�ư�GM--702774
		--_engaging = #_availableTargetPlayer ~= 0;

		_hateListCounter = HateListCount( _bossID );
		_engaging = _hateListCounter ~= 0;

		--_currentCompletedGameLevel = ReadRoleValue( _bossID , EM_RoleValue_Register1 );
		--------------END---Routines

		-------------------------------------------------�԰���������
		if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss ���`�� �D�Ԧ��\
			DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
			Lua_703148_AI_Conquered( _roomID );
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			DebugMsg( 0 , 0 , "--quit fight" );
			--Lua_703148_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
			Lua_703148_AI_Reset( _roomID );
			break;
		end
		-------------------------------------END--------�԰���������

		-------------------------------------------------Timers
		if ( _GCD > 0 ) then _GCD = _GCD - _timeTick; end

		for _key , _value in pairs( _CD ) do
			--DebugMsg( 0 , 0 , "-- : ".._key.." __ ".. _value );
			if ( _CD[ _key ] > 0 ) then _CD[ _key ] = _value - _timeTick; end
		end
		---------------------------------------END-------Timers

		--�g�ɾ���
		if ( _clock >= _frenzyCD and (_isFrenzied == false) ) then
				_isFrenzied = true;
				AddBuff( _bossID , 625849 , 0 , -1 );-- 625849 ����
				DebugMsg( 0 , 0 , "-----�g�g��----" );
				ScriptMessage(_bossID,0,2,"[LUA_703148_AI_FRENZY]",0);	-- �o�·ưʪ�����q�}�U�p�P�`����ک����A��Ū��O�q�Y�N���X�I
		end		
	
		-----------------------------------------------�԰����q�ഫ
		_bossHpRatio = ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP );--HP ratio
		if ( _bossHpRatio <= _hpStepping ) then--����W�L30%Ĳ�o
			if ( _hpStepping > 0 ) then
				_hpStepping = _hpStepping - _phaseTransformPeriodRatio;--next transform ratio
				local _currentPhase = ReadRoleValue( _bossID , EM_RoleValue_Register1 );
				local _currentPhaseBuffGUID = _gConsts._phaseBuffGUIDs[ _currentPhase ] or 0;
				
				for _index , _phaseBuffGUID in pairs( _gConsts._phaseBuffGUIDs ) do--
					CancelBuff_NoEvent( _bossID , _phaseBuffGUID );--�ȮɸѰ��Ҧ����q���аOBUFF --����d��
				end
				
				_currentPhase = _currentPhase + 1;
				WriteRoleValue( _bossID , EM_RoleValue_Register1 , _currentPhase );

				if ( _currentPhase <= 3 ) then--2.3��t
					Lua_703148_PhaseSwitchPerformance( _bossID , _gConsts );--���q�ഫ��t
				else
					Lua_703148_FinalPhasePerformance( _bossID , _gConsts );--�ĥ|���q��t --�Ӭq��t�|��ɶ�
					_CD._phase4Cycle = _gConsts._phase4CycleCD;--�}�Ҳĥ|���q�p�ɾ�
				end
		
				for _index , _phaseBuffGUID in pairs( _gConsts._phaseBuffGUIDs ) do--���s�[�W���qBUFF
					if ( _index > _currentPhase ) then break; end
					AddBuff( _bossID , _phaseBuffGUID , 0 , -1 );--�[�W�Ӷ��q��BUFF
				end

				DebugMsg( 0 , 0 , "Switch to Phase : ".._currentPhase.."  , PhaseBuff : ".._currentPhaseBuffGUID.."  , Next Ratio : ".._hpStepping );
			end
		end
		-------------------------------------END-----�԰����q�ഫ
		
		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��

			if( _CD._phase4Cycle == 0 )then
				DebugMsg( 0 , 0 , "--_timer2 release" );
				Lua_703148_FinalPhasePerformance( _bossID , _gConsts );--�ĥ|���q��t  --�Ӭq��t�|��TIMER����
				_CD._phase4Cycle = _gConsts._phase4CycleCD;
				_GCD = 2;
				break;
			end
		end

	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703148_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703148_AI_Reset( _roomID )	-- ���ƶ� �԰�����
	DebugMsg( 0 , 0 , "--Lua_703148_AI_Reset" );

	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
	
	local _bossID = _gConsts._bossID;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703148_AI_RESET]",0);	-- �A�רs�Ĥ��L�o�ӱN�ѫo�̯�O�B�Φۦp���Ǫ��K�K

	DW_UnFight( _bossID , true );
	Delobj( _frontDoorID );	--�R���e��
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 20 );

	DelFromPartition( _bossID );
	
	--_Lua_703148_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 50 );

	DW_UnFight( _bossID , false );
	SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos );
	AddToPartition( _bossID , _roomID );
	
end--function Lua_703148_AI_Reset( _roomID )

function Lua_703148_AI_Conquered( _roomID )	-- ���ƶ� ���`�@��
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703148_AI_Conquered" );
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];--for read

	if( _gConsts == nil ) then return; end
	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����

	ScriptMessage(_gConsts._bossID,0,2,"[$MUTE]".."[LUA_703148_AI_CONQUERED]",0);	-- ���o�Z�����j���q�Ө��A�o�̫᪺���k�O�H���ӮD�N�C

	sasa_ZoneDungeon_title_01(530999)  --Z33-2 ���� ��~����
	
	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703148_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	Cl_Resist_HackersBossDead();
end--function Lua_703148_AI_Conquered( _roomID )

-----------------------------------sub functions

----------------------------------------------------------------------------performance���q�ഫ��t
function Lua_703148_PhaseSwitchPerformance( _bossID , _gConsts )
	--MagicInterrupt( _bossID );
	Sleep( 20 );
	local x,y,z,dir = DW_Location( _gConsts._flagGUID , _gConsts._roomCenterFlagPos );
	DebugMsg( 0 , 0 , "--Lua_703148_PhaseSwitchPerformance : Move Wait : ".._gConsts._flagGUID.." , ".._gConsts._roomCenterFlagPos.."  :  "..x.." , "..y.." , "..z.." , " );
	
	CastSpell( _bossID , _bossID , 851925 );--851925�ǰe
	--LuaFunc_MoveToFlag( _bossID , _gConsts._flagGUID , _gConsts._roomCenterFlagPos , 0 );
	--LuaFunc_WaitMoveTo( _bossID , x,y,z );
	--DebugMsg( 0 , 0 , "--Lua_703148_PhaseSwitchPerformance : Move Wait : ".._wait );
	Sleep( 40 );
	SetPos( _bossID , x,y,z,dir );
	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703148_AI_NEWPHASE]",0);	-- [108830]�^��F�������U�@�i�����I
	--MagicInterrupt( _bossID );
	Sleep( 10 );
	DebugMsg( 0 , 0 , "--Lua_703148_PhaseSwitchPerformaWWnce : ��ů}�H" );
	CastSpell( _bossID , _bossID , 851920 );--851920��ů}�H
	BeginPlot( _bossID , "Lua_703148_Skill_TatteredSpace" , 20 );
	local _stunTime_miniSec = 0;
	while( _stunTime_miniSec < 50 ) do
		StopMove( _bossID , true );
		_stunTime_miniSec = _stunTime_miniSec + 1;
		sleep( 1 );
	end

	DebugMsg( 0 , 0 , "--Lua_703148_PhaseSwitchPerformance : �s���q" );
end

function Lua_703148_FinalPhasePerformance( _bossID , _gConsts )
	--MagicInterrupt( _bossID );
	Sleep( 20 );
	local _stunBuffGUID = 625878;--625878���aè�b5��BUFF
	local x,y,z,dir = DW_Location( _gConsts._flagGUID , _gConsts._roomCenterFlagPos );
--	DebugMsg( 0 , 0 , "--Lua_703148_FinalPhasePerformance : Move Wait : ".._gConsts._flagGUID.." , ".._gConsts._roomCenterFlagPos.."  :  "..x.." , "..y.." , "..z.." , " );
	
	CastSpell( _bossID , _bossID , 851925 );--851925�ǰe

	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 700 , true );

	Sleep( 40 );
	SetPos( _bossID , x,y,z,dir );
	MagicInterrupt( _bossID );

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703148_AI_FINALPHASE]",0);	-- ����N�ܡA[108830]�Y�N�I�i�̫᪺�Z���]�k�I

	for _index , _playerID in pairs( _rangePlayerList ) do
		AddBuff( _playerID , _stunBuffGUID , 0 , 6 );----625878���aè�b5��BUFF
		WriteRoleValue( _playerID , EM_RoleValue_HP , 1 );--�]�w��1
	end

	local _stunTime_miniSec = 0;
	while( _stunTime_miniSec < 50 ) do
		StopMove( _bossID , true );
		_stunTime_miniSec = _stunTime_miniSec + 1;
		sleep( 1 );
	end

	DebugMsg( 0 , 0 , "--Lua_703148_FinalPhasePerformance : �̲׶��q : ���ƶ�����" );
	CastSpell( _bossID , _bossID , 851919 );--851919���ƶ�����
end
------------------------------------------------------------END-------------performance���q�ഫ��t


-------------------------------------------------------------------------------------�ޯ�
--function Lua_703148_Skill_Clear()--for test
--	local _ownerID = OwnerID();
----	DebugMsg( 0 , 0 , "--Lua_703148_Skill_Clear : ".._ownerID.." : "..ReadRoleValue( _ownerID , EM_RoleValue_Register7 ).." : "..ReadRoleValue( _ownerID , EM_RoleValue_Register8 ) );
--	WriteRoleValue( _ownerID , EM_RoleValue_Register7 , 0 );
--	WriteRoleValue( _ownerID , EM_RoleValue_Register8 , 0 );
--	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 1500 , false );--�M��Ҧ����a �òM���w�]
--	for _index , _playerID in pairs( _rangePlayerList ) do--
--	--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_Clear : ".._playerID.." : "..ReadRoleValue( _playerID , EM_RoleValue_Register7 ).." : "..ReadRoleValue( _playerID , EM_RoleValue_Register8 ) );
--		WriteRoleValue( _playerID , EM_RoleValue_Register7 , 0 );
--		WriteRoleValue( _playerID , EM_RoleValue_Register8 , 0 );
--	end
--end
--
--function Lua_703148_Skill_SpaceCorrosion()--�ǬV���� ��ۻG�k �����ɪ� ����@��
--	local _ownerID = OwnerID();
--	local _targetID = TargetID();
--	
--	local _thisBuffID = 625876;--625876��ۻG�k
--	local _maxBuffScale = 5;--�̰��ŷP�V�h��
--	
--	local _currentBuffScale = ReadRoleValue( _ownerID , EM_RoleValue_Register7 );--�ثe���ǬV�h��
--	local _nextBuffScale = 0;
----	DebugMsg( 0 , 0 , "--Lua_703148_Skill_SpaceCorrosion : ".._ownerID.." : ".._currentBuffScale..ReadRoleValue( _ownerID , EM_RoleValue_Register8 ) );
--
--		----sub functions
--		local function ClearInfectedData( _currentInfectedID )--�M���P�V�~�|  --�Хγ̫�@�ӷP�V�̪�ID ������Y
--			local _prevInfectedID = ReadRoleValue( _currentInfectedID , EM_RoleValue_Register8 );
--			
--			--set default
--			WriteRoleValue( _currentInfectedID , EM_RoleValue_Register7 , 0 );
--			WriteRoleValue( _currentInfectedID , EM_RoleValue_Register8 , 0 );
--		--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_SpaceCorrosion : Clear Infection : ".._currentInfectedID );
--		
--			if ( _prevInfectedID ~= 0 ) then--��e�ǬV�̦s�b�� �h�@�ֲM���L�����
--				ClearInfectedData( _prevInfectedID );
--			end
--
--			return;
--		end
--
--		--���S���P�V�̦s�b�����p�A�h�|�̷ӳѾl�ǬV���ơA����BOSS�����h�ƪ��k�۪��A�C
--		local function AddBossBuffLevel_And_ClearAllInfected()--�M���P�V�~�|  ��  ��BOSS�������A
--			local _maxInfected = _maxBuffScale - _currentBuffScale + 1;--�̰��ǬV�h��
--			--����BOSS�����h�ƪ��k�۪��A�C
--			local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
--			local _bossID = _Lua_703148_AI_GlobalVars[ _roomID ]._bossID;
--			local _bossRewardBuffGUID = 625578;--625578�k��
--			local _currentBuffLv = Lua_703107_Return_Buff_Lv( _bossID , _bossRewardBuffGUID );
--			_currentBuffLv = _currentBuffLv + _maxInfected;
--			CancelBuff_NoEvent( _bossID , _bossRewardBuffGUID );
--			AddBuff( _bossID , _bossRewardBuffGUID , _currentBuffLv , -1 );
--
--		--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_SpaceCorrosion : the last" );
--			--�M���Ҧ��P�V�̸��
--			ClearInfectedData( _ownerID );--�γ̫�@�ӷP�V�̪�ID ������Y
--		end
--
--	if ( _currentBuffScale <= 0 ) then--��ثe�P�V�̪��Ȭ�0�� �h�N��L �O�Ĥ@�a���  
--		_currentBuffScale = _maxBuffScale;--�N�ثe�P�V�̳]���̰��ŷP�V
--		WriteRoleValue( _ownerID , EM_RoleValue_Register7 , _currentBuffScale );
--		WriteRoleValue( _ownerID , EM_RoleValue_Register8 , 0 );--�S���e�P�V��  ���|�O���F�T�Olink list�_��
--	end
--
--	if ( _currentBuffScale == 1 ) then----��ثe�P�V�̪��Ȭ�1�� �h�N��L�O �̫᪺�a���
--		AddBossBuffLevel_And_ClearAllInfected();--�M���P�V�~�|  ��  ��BOSS�������A
--		return;--�P�V���� �������_
--	end
--
--	_nextBuffScale = _currentBuffScale - 1;--�U�@�ӷP�V�̪��h��
--		
--	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 100 , true );--�M��U�@�ӷP�V��
--	for _index , _playerID in pairs( _rangePlayerList ) do--�b�H�s���M�V
--		if ( _playerID ~= _ownerID and ReadRoleValue( _playerID , EM_RoleValue_Register7 ) == 0 and CheckBuff( _playerID , _thisBuffID ) == false ) then--Transmissible ��U�@�ӷP�V�̪��Ȭ�0�� �h�N��L�O �i�P�V��H 
--			--���ķP�V�̦s�b�����p
--			WriteRoleValue( _playerID , EM_RoleValue_Register7 , _nextBuffScale );--�N�U�@�ӷP�V�̪� �O�� �g���U�@�ӷP�V���h
--			WriteRoleValue( _playerID , EM_RoleValue_Register8 , _ownerID );--�N�U�@�ӷP�V�̪� �O�� �g����e�P�V�̪�ID --�^�Y�l�ܮɪ�����
--			AddBuff( _playerID , _thisBuffID , 0 , _nextBuffScale );--�P�V�U�@�ӷP�V�� �ëŧi���s���ɶ�(_nextBuffScale)
--		--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_SpaceCorrosion : the next : ".._playerID.." : ".._nextBuffScale );
--			return;--�P�V���� �������_
--		end
--	end
--
--	--�Y�Z�����L��L���a   
--	AddBossBuffLevel_And_ClearAllInfected();--�M���P�V�~�|  ��  ��BOSS�������A
--
--end

local function CompDis( A, B )	-- �������A���Ѧ��s���� Script �P�_�Z����

	if A.Dis < B.Dis then
		return true;
	end
end

function MagicBase_625877_Plot()	-- ��ۻG�k

	local Boss = OwnerID();
	local Player = TargetID();
	local Obj = Hao_CreateSpellObj( Player, 0, 60 );	-- ���Ϊ���A�ΥH�ʱ��U��ۻG�k���W�߸��
	CallPlot( Obj, "MagicBase_625877_Plot2", Obj, Boss, Player );
end

function MagicBase_625877_Plot2( Obj, Boss, Player )

	local DebuffID = 625876;	-- ��ۻG�kID�A���[�󪱮a���W
	local BuffID = 625578;	-- �k��ID�A���[�� Boss ���W
	local BossActID = 490183;	-- ��^��Boss���S��
	local PlayerActID = 490182;	-- �ǬV�ܪ��a���S��
	local Count = 5;	-- �ǬV����
	local Time = 5;	-- �ǬV���
	local AdjTime = 1;	-- �C���ǬV�Ỽ��ɶ�
	local Distance = 100;	-- �ǬV�b�|
	local HitUnit = {};	-- �w�g�Q�ǬV�L���ؼ�
	
	for i = 1, Count do
		local NewCount = Count - i;
		AddBuff( Player, DebuffID, NewCount, Time );
		table.insert( HitUnit, Player );	-- �N�Q�ǬV���ؼж�i�R���M�椤�A�קK���ƶǬV
		if i == Count then	-- �̫�@���ɡA���A���y�P��ؼ�
			break;
		end
		Sleep( Time * 10 );
		if not CheckID( Player ) or ReadRoleValue( Player, EM_RoleValue_IsDead ) == 1 then
			AddBuff( Boss, BuffID, NewCount-1, -1 );	-- ���� Boss �����h��
			break;
		end

	--	local TargetList = SearchRangeNPC( Player, Distance );
		local TargetList = KS_GetHateList( Boss, 4 );	-- �����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4 �L�oGM )
		local Targets = {};
		for j = 1, #TargetList do
			local Obj = {};
			local Dis = GetDistance( Player, TargetList[j] );
		--	if Dis < Distance and GetModeEx( TargetList[j], EM_SetModeType_Fight ) then
			if Dis < Distance then
				local insert = true;
				for k = 1, #HitUnit do
					if TargetList[j] == HitUnit[k] then	-- �ؼФw�Q�ǬV
						insert = false;
						break;
					end
				end
				if insert then	-- �ŦX�ǬV�b�|���B�S���Q�ǬV�L���ؼ�
					Obj.Guid = TargetList[j];
					Obj.Dis = Dis;
					table.insert( Targets, Obj );
				end
			end
		end

		if #Targets == 0 then	-- ��d�򤺨S���ŦX�����a��
			SysCastSpellLv( Player, Boss, BossActID, 0 );	-- ��t��^�S��
			AddBuff( Boss, BuffID, NewCount-1, -1 );	-- ���� Boss �����h��
			break;
		end

		table.sort( Targets, CompDis );	-- �N����������a�̷ӶZ���Ѫ�ܻ��Ƨ�
		SysCastSpellLv( Player, Targets[1].Guid, PlayerActID, 0 );	-- ��t�ǬV�S��
		Time = Time - AdjTime;
		Player = Targets[1].Guid;	-- �d�򤺳̪�A�B�ŦX���󪺥ؼ�
	end
	DelObj( Obj );
end

function Lua_703148_Skill_TatteredSpace()--��ů}�H
	local _ownerID = OwnerID();
	local _targetID = TargetID();
--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_TatteredSpace : ".._ownerID.." : ".._targetID );

	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];

	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 600 , false );--�M�䪱�a 

	local _spaceGhostID = 0;--����]�F
	local x,y,z,dir = DW_Location( _ownerID );
	for _index , _playerID in pairs( _rangePlayerList ) do--
		_spaceGhostID = _gConsts.ExtObj( 109076 , x,y,z,dir );--109076����]�F
		WriteRoleValue( _spaceGhostID , EM_RoleValue_PID , _playerID );--�C�H�����@��
	end
	return true;
end

function Lua_703148_AI_SpaceGhost_Init()--109076����]�F
	local _ownerID = OwnerID();
	local _targetID = TargetID();
--	DebugMsg( 0 , 0 , "--Lua_703148_AI_SpaceGhost_Init : ".._ownerID.." : ".._targetID );
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _ownerID , EM_SetModeType_Move , true );		--����
	SetModeEx( _ownerID , EM_SetModeType_Fight , false );		--����
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--����
	WriteRoleValue( _ownerID , EM_RoleValue_IsWalk , 1 );
	
	CallPlot( _ownerID , "Lua_703148_AI_SpaceGhost_OnFight" , _ownerID );
end

function Lua_703148_AI_SpaceGhost_OnFight( _ownerID )--109076����]�F
	--local _ownerID = OwnerID();
	Sleep( 50 );
	local _targetID = ReadRoleValue( _ownerID , EM_RoleValue_PID );
--	DebugMsg( 0 , 0 , "--Lua_703148_AI_SpaceGhost_OnFight : ".._ownerID.." : ".._targetID );

	local x,y,z,dir = 0;
	local _clock = 0;
	while ( _clock < 20 ) do
		x,y,z,dir = DW_Location( _targetID );
		Move( _ownerID , x,y,z );
		SysCastSpellLv( _ownerID , _targetID , 851909 , 0 );--�s�u�S��
		if ( CheckDistance( _ownerID , _targetID , 15 ) ) then
			SysCastSpellLv( _ownerID , _targetID , 851923 , 0 );
		end

		_clock = _clock + 1;
		--DebugMsg( 0 , 0 , "--e04su3su;6el3gk6ak7 : ".._clock );
		Sleep( 5 );
	end
--	DebugMsg( 0 , 0 , "--Lua_703148_AI_SpaceGhost_OnFight : Time's up" );
	--851923���鷴��
	SysCastSpellLv( _ownerID , _ownerID , 851923 , 0 );
end

function Lua_703148_AI_SpaceGhost_OnDead()--109076����]�F
	local _ownerID = OwnerID();
	local _targetID = TargetID();
--	DebugMsg( 0 , 0 , "--Lua_703148_AI_SpaceGhost_OnDead : ".._ownerID.." : ".._targetID );
end

--------------------------------------------------------------------------------------------------------�ѫo��w
function Lua_703148_Skill_BloodBubble()--�ѫo��w����@��
	local _ownerID = OwnerID();
	local _targetID = TargetID();
--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_BloodBubble : ".._ownerID.." : ".._targetID );
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
	
	local _maxBubble = 2;
	local _allBloodBuff = 625579;--625579�A�庡��

	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 600 , false );--�M��Ҧ����a �òM���w�]
	local _effectiveTarget = {};--���ĥؼвM��
	for _index , _playerID in pairs( _rangePlayerList ) do--
		if ( CheckBuff( _playerID , _allBloodBuff ) and #_effectiveTarget < _maxBubble ) then
			table.insert( _effectiveTarget , _playerID );
		end
		CancelBuff_NoEvent( _playerID , _allBloodBuff );
	end

	local _bloodBubbleID = 0;
	local x,y,z,dir = 0;
	
	for _index , _playerID in pairs( _effectiveTarget ) do--��w�����X�ͦb���W�� �A�庡�����H
		x,y,z,dir = DW_Location( _playerID );
		_bloodBubbleID = _gConsts.ExtObj( 109081 ,x,y,z,dir );--109081��w
		_maxBubble = _maxBubble - 1;--���F�p�ƥ�����
		WriteRoleValue( _bloodBubbleID, EM_RoleValue_PID, _ownerID );
	end

	if ( _maxBubble <= 0 ) then return; end--��H�ư��F �K���A��
	
	x,y,z,dir = DW_Location( _ownerID );--�������X�{�bBOSS����
	local _x,_z = 0;
	for _i = 1 , _maxBubble , 1 do--��w�X�ͦbBOSS����
		--109081
		_x = x + ( RandRange( 1 , 100 ) - 50 );
		_z = z + ( RandRange( 1 , 100 ) - 50 );
		_bloodBubbleID = _gConsts.ExtObj( 109081 ,_x,y,_z,dir );--109081��w
		WriteRoleValue( _bloodBubbleID, EM_RoleValue_PID, _ownerID );
		--625883
	end
end

function Lua_703148_Item_BloodBubble_Init()--NPC 109081��w

	local _ownerID = OwnerID();
	SetModeEx( _ownerID, EM_SetModeType_HideName , false );	-- ��ܦW��
	SetModeEx( _ownerID, EM_SetModeType_NotShowHPMP , false );	-- ��ܦ��
	SetModeEx( _ownerID, EM_SetModeType_Strikback , false );	-- �|����
	SetModeEx( _ownerID, EM_SetModeType_Move , false );	-- ����
	SetModeEx( _ownerID, EM_SetModeType_Fight , true );	-- ����
	SetModeEx( _ownerID, EM_SetModeType_Searchenemy , false );	-- ����
	SetModeEx( _ownerID, EM_SetModeType_Obstruct , false );	-- ����
	WriteRoleValue( _ownerID, EM_RoleValue_LiveTime , 30 );
	CallPlot( _ownerID , "Lua_703148_Item_BloodBubble_OnFight" , _ownerID );
--	AddBuff( _ownerID , 625883 , 0 , -1 );--effect 625883��w�S��

	-- ������w�S�ġA�קK�H AddBuff ���������ɡA�����I���ܸӥؼЫ�A�ؼШ��W���S�ķ|���x�ե������D
	local OwnerPos = Vector_GetRolePos( _ownerID );
	local Dir = ReadRoleValue( _ownerID, EM_RoleValue_Dir );
	local Room = ReadRoleValue( _ownerID, EM_RoleValue_RoomID );
	local Obj = CreateObj( 106973, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
	SetModeEx( Obj, EM_SetModeType_Move, false );	-- ����
	SetModeEx( Obj, EM_SetModeType_Mark, false );	-- �аO
	SetModeEx( Obj, EM_SetModeType_ShowRoleHead, false );	-- �Y��
	SetModeEx( Obj, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( Obj, EM_SetModeType_Fight, false );	-- ���
	SetModeEx( Obj, EM_SetModeType_Strikback, false );	-- ����
	AddToPartition( Obj, Room );
	AttachObj( Obj, _ownerID, 4, "p_down", "p_down" );
	CallPlot( Obj, "Zone_175_Boss3_CheckDead", Obj, _ownerID );
end

function Lua_703148_Item_BloodBubble_OnFight( _ownerID )----NPC 109081��w

	local Target
	local Boss = ReadRoleValue( _ownerID, EM_RoleValue_PID );	-- ���ƶ�
	if Boss ~= 0 then
		Target = Boss;
	else
		Target = _ownerID;
	end
	local TargetPos = Vector_GetRolePos( _ownerID );

	while true do
		SysCastSpellLv_Pos( Target, TargetPos.x, TargetPos.y, TargetPos.z, 851922, 0 );	-- ��w
		Sleep(5);
	end
end

function Lua_703148_Item_BloodBubble_OnDead()----NPC 109081��w
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
--	DebugMsg( 0 , 0 , "--Lua_703148_Item_BloodBubble_OnDead : ".._ownerID.." : ".._targetID );
	AddBuff( _targetID , 625579 , 0 , -1 );
	--local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
end
----------------------------------------------------------------------------------END-------------------�ѫo��w

-----------------------------------------------------------------------------------------------��Ť۹�
function Lua_703148_Skill_SpaceIllusion()--��Ť۹Ұ���@��

	local _ownerID = OwnerID();
--	local _targetFlagPosInfo = { 4 , 5 };	-- �ؼгQ�ǰe��m��������T( �M����צP�ɫ��X�̤j�ƶq )
	local _targetFlagPosInfo = { 4 };	-- �ؼгQ�ǰe��m��������T( �M����צP�ɫ��X�̤j�ƶq )
	local _hateList = KS_GetHateList( _ownerID, 1 );	-- �����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4 �L�oGM )

	if # _hateList < #_targetFlagPosInfo+1 then	-- ���a�����h������
		DebugMsg( 0, 0, "hatelist = "..#_hateList );
		return false;
	end

--	local _targetID = TargetID();
--	DebugMsg( 0 , 0 , "--Lua_703148_Skill_SpaceIllusion : ".._ownerID.." : ".._targetID );

	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];	-- �I�s������
	local _flagGUID = _gConsts._flagGUID;

	for _index , _flagPos in pairs( _targetFlagPosInfo ) do

		local _currentPlayerID = _hateList[ #_hateList - _index + 1 ];	--�����

		if GetDistance( _ownerID, _currentPlayerID ) < 500 then	-- �� Boss �P�ؼжZ�� 500 �H���ɤ~����ǰe
			local PlayerPos = Vector_GetRolePos( _currentPlayerID );	--�ǰe�e�����a�y��
			local PlayerDir = ReadRoleValue(  _currentPlayerID, EM_RoleValue_Dir );	-- Dir
			local x,y,z,dir = DW_Location(  _flagGUID , _flagPos );
			AddBuff( _currentPlayerID, 625882, 0, -1 );	-- 625882��Ť۹ҩw��BUFF
			SetPos( _currentPlayerID, x,y,z,dir );	--�ǰe���a�������m
			CancelBuff_NoEvent( _currentPlayerID, 625882 );
		
			local VecDir = Vector_GetRoleDir( dir );	-- ������V�q
			local FlagPos = CVector:new( x,y,z );	-- �N�y���ܼ��� Matatable�A��K�V�q�B��
			local VoidPos = FlagPos + VecDir * 50;	-- �Z�����a�e�� 50 ����m
			local VoidDir = dir + 180;	-- ����Ŧ�̭��缾�a
			if VoidDir > 360 then
				VoidDir = dir - 360;
			end
		
			local VoidTraveler = CreateObj( 109077, VoidPos.x, VoidPos.y, VoidPos.z, VoidDir, 1 );	--109077 ��Ŧ��
			SetModeEx( VoidTraveler, EM_SetModeType_Strikback, true );	-- ����
			SetModeEx( VoidTraveler, EM_SetModeType_Move, true );	-- ����
			SetModeEx( VoidTraveler, EM_SetModeType_Fight, true );	-- ����
			SetModeEx( VoidTraveler, EM_SetModeType_Searchenemy, true );	-- ����
			AddToPartition( VoidTraveler, _roomID );
			ScriptMessage( VoidTraveler, _currentPlayerID, 1, "[LUA_703148_AI_KILLAGENTIN20SEC]", 0);--�A�����b20��������Ŧ��
			WriteRoleValue( VoidTraveler, EM_RoleValue_PID, _currentPlayerID );--���������ؼЪ�ID
			WriteRoleValue( VoidTraveler, EM_RoleValue_Register1, PlayerPos.x );--���������ؼЪ���m
			WriteRoleValue( VoidTraveler, EM_RoleValue_Register2, PlayerPos.y );--���������ؼЪ���m
			WriteRoleValue( VoidTraveler, EM_RoleValue_Register3, PlayerPos.z );--���������ؼЪ���m
			WriteRoleValue( VoidTraveler, EM_RoleValue_Register4, PlayerDir );--���������ؼЪ���m
			CallPlot( VoidTraveler, "Zone_175_Boss3_109077_Init", VoidTraveler, _currentPlayerID, PlayerPos, PlayerDir );
			SetPlot( VoidTraveler, "Dead", "Zone_175_Boss3_109077_Dead", 0 );
		end
	end
end

function Zone_175_Boss3_109077_Dead()

	local Owner = OwnerID();
	local Player = ReadRoleValue( Owner, EM_RoleValue_PID );
	SetPlot( Owner, "Dead", "", 0 );
	ScriptMessage( Owner, Player, 1, "[LUA_703148_AI_AGENTKILLED]", 0 );	-- �A�w�g������Ŧ��
	SetModeEx( Owner, EM_SetModeType_Move, false );	-- ����
	PlayMotionEx( Owner, 145, 146 );	-- ���񦺤`�ʧ@
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
	local Root = 625882;	-- �w��

	Sleep( 10 );
--	ScriptMessage( Owner, Player, 1, "[LUA_703148_AI_AGENTKILLED]", 0 );	-- �A�w�g������Ŧ��
	AddBuff( Player, Root, 0, -1 );
	Sleep( 10 );
	SetPos( Player, PlayerPos.x, PlayerPos.y, PlayerPos.z, PlayerDir );	-- �ǰe���a�^�a
	CancelBuff_NoEvent( Player, Root );
	DelObj( Owner );
end

function Zone_175_Boss3_109077_Init( Owner, Player, PlayerPos, PlayerDir )	-- ��Ŧ�̰_�l�@��

	local Counter = 0;
	local LimitTime = 20;	-- 20 �������n������Ŧ��

	while Counter < LimitTime and CheckID( Player ) and ReadRoleValue( Player, EM_RoleValue_IsDead ) == 0 do
		SetAttack( Owner, Player );	--���w�����ؼ�
		Counter = Counter + 1;
		Sleep(10);
	end

	if Counter == LimitTime then
		CastSpell( Owner, Player, 851921 );	-- �۹ҵ��� ����100%�ͩR
	end
	Sleep( 20 );
	SetPos( Player, PlayerPos.x, PlayerPos.y, PlayerPos.z, PlayerDir );	-- �ǰe���a������^��l��m
	Sleep( 10 );
	DelObj( Owner );
end
--------------------------------------------------------------------------END------------------��Ť۹�

-------------------------------------------------------------------------------------------------�۷��]�h
--function Lua_703148_Skill_DevilSwamp()--�۷��]�h����@��
--	local _ownerID = OwnerID();
----	local _targetID = TargetID();
----	DebugMsg( 0 , 0 , "--Lua_703148_Skill_DevilSwamp : ".._ownerID.." : ".._targetID );
--	--�C���j�@���ͬ��d��50�X���¦�G��A2����z���@�P�ˮ`�A�z���ĪG����2�������A�@�X�{10�ӡC
--	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
--	local _gConsts = _Lua_703148_AI_GlobalVars[ _roomID ];
--	CallPlot( _ownerID , "Lua_703148_Skill_DevilSwamp_Execute" , _ownerID , _gConsts , _roomID );
--end
--
--function Lua_703148_Skill_DevilSwamp_Execute( _ownerID , _gConsts , _roomID )--�۷��]�h����@��
--	local x,y,z,dir = DW_Location( _gConsts._flagGUID , _gConsts._roomCenterFlagPos );--�H�������������
--	local _puddleNpcGUID = 109078;--109078�¦�G��
--	
--	local _maxPuddle = 30;
--	local _x,_z = 0;
--	local _puddleNpcID = 0;
--	for _i = 1 , _maxPuddle , 1 do
--		--���Ͷ¦�G��
--		_x = x + ( RandRange( 1 , 600 ) - 300 );
--		_z = z + ( RandRange( 1 , 600 ) - 300 );
--		_puddleNpcID = CreateObj( _puddleNpcGUID , _x,y,_z,dir , 1 );
--		AddToPartition( _puddleNpcID , _roomID );
--		Sleep( 5 );
--	end
--	
--	return;
--end

function MagicBase_625570_Plot()	-- �۷��]�h

	local Boss = OwnerID();
	CallPlot( Boss, "MagicBase_625570_Plot2", Boss );
end

function MagicBase_625570_Plot2( Boss )

	local TargetList = KS_GetHateList( Boss, 4 );	-- �����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4 �L�oGM )

	if #TargetList == 0 then	-- ������S�����a��
		return false;
	end

	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local ObjID = 109078;	-- �¦�G��
	local CreateObjCount = 10;	-- �C�����ͪ��`�ƶq

	while CreateObjCount > 0 do
		local Targets = {};
		for i = 1, #TargetList do
			if GetDistance( Boss, TargetList[i] ) < 300 then	-- �Z���p�� 300 �H���ɤ~�C�J�ؼ�
				table.insert( Targets, TargetList[i] );
			end
		end

		if #Targets ~= 0 then	-- ���ŦX���ؼЮ�
			local Target = Targets[Math.Random( #Targets )];	-- ������H���@�W���a
		--	local Obj = Hao_CreateSpellObj( Target, 0, 10 ); 
			local TargetPos = Vector_GetRolePos( Target );	-- �ؼЮy��
			local Obj = CreateObj( ObjID, TargetPos.X, TargetPos.Y, TargetPos.Z, 0, 1 );
			AddToPartition( Obj, Room );
			CreateObjCount = CreateObjCount - 1;
		--	DebugMsg( 0, Room, "Disillusion "..CreateObjCount );
		end
		Sleep(10);
	end
end

function Lua_703148_Item_DarkPuddle_Init()--NPC 109078�۷��]�h
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--��ܦW��
	SetModeEx( _ownerID, EM_SetModeType_Mark, false );	-- ����ܼаO
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , false );	--��ܦ��
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _ownerID , EM_SetModeType_Move , false );		--����
	SetModeEx( _ownerID , EM_SetModeType_Fight , false );		--����
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--����
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--�����׮ĪG
	local _liquidEffectGUID = 625881;--625881�۷��]�h�S��
	AddBuff( _ownerID , _liquidEffectGUID , 0 , -1 );--effect
	CallPlot( _ownerID , "Lua_703148_Item_DarkPuddle_Plot", _ownerID );
end

function Lua_703148_Item_DarkPuddle_Plot( Owner )--�¦�G��

	local AttackTickCount = 5; 	-- ��������
	local AttackTickTime = 4;	-- �C�������᪺���j�ɶ�(���:0.1��)
--	local LiveTime = Math.Ceil(AttackTickCount * AttackTickTime/10) + 1;
--	WriteRoleValue( Owner, EM_RoleValue_LiveTime, LiveTime );
	Sleep( 20 );
	SysCastSpellLv( Owner, Owner, 490177, 0 );	-- 2015.09.25 Hao�G�S�ġA�ӯS�Ī� explode �� 2 ��g���A�G�P�ˮ`����A�קK�S�ĵL�k���񧹥������D�C
	for i = 1, AttackTickCount do	-- �ˮ`
		SysCastSpellLv( Owner, Owner, 851908, 0 );	-- 851908 �@�P�z��
		Sleep(AttackTickTime);
	end
	KillID( Owner, Owner );
end
-----------------------------------------------------------------------------------END-----------�۷��]�h
-------------------------------------------------------------------END---------------�ޯ�

local g_Attacked = {};	-- �ƼƵ�Ťj�D�b�P�ɶ������P�@�ؼЮɡA�u�|����@���ˮ`�A�קK���ƩR��

function MagicBase_500156_Plot()	-- ��Ťj�D

	local Boss = OwnerID();
	local Player = TargetID();
	local Stages = { 625872, 625873, 625874, 625875 };	-- ���q 1 ~ 4
	local Stage = 2;	-- ��Ťj�D�C���I��ɪ��D�ơA�w�]�����q 1 �� 2 ��

	for i = 1, #Stages do
		if CheckBuff( Boss, Stages[i] ) then
			Stage = i + 1;
		end
	end

--	local Dir = ReadRoleValue( Boss, EM_RoleValue_Dir );
	local Room = ReadRoleValue( Boss, EM_RoleValue_RoomID );

--	local Stage = 4;
	local Divide = 360 / Stage	-- �N�ꨤ�ק���
	g_Attacked[Room] = {};	-- �C���I��ɭ��m

	for i = 1, Stage do
		local Dir = Math.Random( Divide*(i-1), Divide*i );	-- �W�[�ü�
		local Obj = Hao_CreateSpellObj( Player, Dir ); 
		SysCastSpellLv( Obj, Obj, 490180, 0 );
		CallPlot( Obj, "MagicBase_500156_Plot2", Obj, Boss, Room, Dir );
	end
end

function MagicBase_500156_Plot2( Owner, Boss, Room, Dir )	-- �d��P�w�� Lua �i��A���ϥΪk�N���X�A�k�N���X�S��k�H����D�㪺�覡�]�w�A�]����]�w�e��

	-- �ޯ�]�w (��T�M���k�N���l )
	local Distance = 120;	-- ���Ī���
	local Width = 15;	-- ���ļe��(�b�|�A�`�e��*2)
	local Height = 60;	-- ���İ���
	local FlySpeed = 6;	-- �ޯ�t��(���:0.1��)�A��ĳ�P���Ī��׾㰣
	local FlyTime = Math.Ceil( Distance / FlySpeed );	-- �ޯ�Ѱ_�I����ܲ��I���ɶ�(���:0.1��)

	local OwnerPos = Vector_GetRolePos( Owner );
	local BeginPos = OwnerPos;	-- �C�q�϶����_�I�y��
	local VecDir = Vector_DirToVector(Dir+90);	-- ������V�q�A�p��ROM�����׮ɡA�n���� 90 �ר��~�|�ܬ����T�V�q�C
	local EndPos	-- �C�q�϶������I�y��
	local TargetList = KS_GetHateList( Boss, 4 );	-- �����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4 �L�oGM )
--	DebugMsg( 0, 0, "Dir = "..tostring(Dir)..", VecDir = "..tostring(VecDir)..", FlyTime = "..FlyTime );

	while FlyTime > -1 do
		if not g_Attacked[Room][FlyTime] then	-- ��� 1 �ӵ�Ťj�D�ͦ��ɤ~����
			g_Attacked[Room][FlyTime] = {};
		--	DebugMsg( 0, 0, FlyTime..", Attacked FlyTime == nil" );
		end
		EndPos = OwnerPos + VecDir * FlySpeed;
		for i = 1, #TargetList do
			local Target = TargetList[i];
			local TargetPos = Vector_GetRolePos( Target );
			--�ˬd�ؼЬO�_�b���w���B�e�����u�d�򤺡A�_�^��Nil�B�O���ܦ^�ǥؼлP�_�I���Z�� ( �_�I�y�СB���I�y�СB�e�סB���סB�ؼЮy��)
			local Status = Vector_CheckShootObj( OwnerPos, EndPos, Width, Height, TargetPos );
		--	DebugMsg( 0, 0, "No. "..i.. ", Hit = "..tostring( Status ) );
			if Status and ReadRoleValue( Target, EM_RoleValue_OrgID ) ~= 107071 and not g_Attacked[Room][FlyTime][Target] then	-- �קK��L���Ϊ���Q�R��
				g_Attacked[Room][FlyTime][Target] = true;	-- �ƼƵ�Ťj�D�b�P�ɶ������P�@�ؼЮɡA�u�|����@���ˮ`�A�קK���ƩR��
			--	Say( Target, "Hit = "..tostring( Status )..", Begin:Target Distance = "..(BeginPos-TargetPos):Len() );
				SysCastSpellLv( Boss, Target, 490181, 0 );
			end
		end
		OwnerPos = EndPos;
		FlyTime = FlyTime - 1;
		Sleep(1)
	end
end