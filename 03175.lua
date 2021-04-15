--Author : K.J. Aris
--Version : 140528
--Ignitor : NPC 109084
--Script : 703175

_Lua_703175_AI_GlobalVars = nil;

function Lua_703175_AI_Init( _inputCtrID )--controller  NPC 109084 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703175_AI_Init : NPC 109084       Z34  V 140528 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --�H�����ư��� �N�즳����R��

	--basics
	local _ctrlID = _inputCtrID or OwnerID() or 0;--109084
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

	if ( _zoneID == 179 ) then
		_difficulty = 2;
		_frenzyCD = 360;
	end

	if ( _zoneID == 180 ) then
		_difficulty = 3;
		_frenzyCD = 9999999;
	end
	---------------------------------------

	----------------------------END----------�g�ɰѼ�
	--�Ш������׶��ǩ�m
	local _bossDomisourceGUIDs = { 109015 , 109147 , 109151 };--��t����
		--�Ӥ��ҩ۳ꪺ�p���аѷ� ServerScript  703183
	--local _treasureBoxGUIDs = { 108832 , 108833 , 108834 };--ĳ�|�p�ë~

	--�ѼƳ]�w��
	if ( _Lua_703175_AI_GlobalVars == nil ) then _Lua_703175_AI_GlobalVars = {}; end
	_Lua_703175_AI_GlobalVars[ _roomID ] = {	--non 
					_bossID = 0 ,--�H_Ice���N��( ����L�禡�n�� _bossID)

					_bossVOs = {
						_Domisource = {
							_id = 0 ,					--ID
							_guid = _bossDomisourceGUIDs[ _difficulty ] ,		--GUID
							_flagPos = 1 , 					--�X�Ц�m

							--_defaultIdle = nil;--ruFUSION_MIME_EMOTE_STRETCH;--�w�]�ʧ@
							IndiSpec = nil ,	--function�ӧO���S��y�{
							} , 
						},

					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_ctrlGUID = 108705 ,--���ID
					_doorGUID = 106246 , 
					--_treasureBoxGUID = _treasureBoxGUIDs[ _difficulty ] ,--ĳ�|�p�ë~

					_flagGUID = 781423 , --781423 Z34_1���κX��

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
	--��Ū��T
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];

	--���� Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703175_GenerateBoss( _bossVO , _roomID );
		_gConsts._bossVOs[_bossName]._id = _bossID;--
	end
	_gConsts._bossID = _gConsts._bossVOs._Domisource._id;--presiding Boss --Domisource
	--Lua_703175_BossIndividualsSetting( _gConsts );

	--���ͫ��
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
	SetModeEx( _bossID , EM_SetModeType_Fight , false );--��t����@�}�l�L�k�Q�������|���_�I��ޯ�C
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );

	--[[
	if ( _bossVO._defaultIdle ~= nil ) then
		SetDefIdleMotion( _bossID , _bossVO._defaultIdle );--�w�]�ʧ@
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
	Lua_703183_ClearAll( _specRoomID );--���K�M���p�����ƭ�
end--function Lua_703175_ClearAll()

function Lua_703175_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703175_ClearAll( _roomID );
	Lua_703175_AI_Init();
end


function Lua_703175_AI_onFight()--���h������ �u��b�䤤�@�����W  �ҪO�г]"�s��"
	--�԰���l
	local _bossID = OwnerID();--_Domisource
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703175_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703175_AI_GlobalVars == nil ) then Lua_703175_AI_reignite( _roomID ); return; end

	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then Lua_703175_AI_reignite( _roomID ); return; end

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--��W�@���`��������٦b�@�ʮɫh���ʧ@  (����_Ice���ͮɭ���Ĳ�o�԰�)
		DebugMsg( 0 , _roomID , "--Combat Sequence Duplicated : New Sequence Rejected !!" );--presiding boss may revived or rejoin the fight while combat is not over yet
		return;
	end
	--����P�l������
	local _ctrlID , _AddParasite , _RemoveParasites = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir , _isVisible )	--�l�ͪ�(�B�z�۳ꪫ �� ���X�Ӫ��F��)
		local x,y,z,dir = DW_Location( _bossID );
		local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
		_AddParasite( _objID );
		_isVisible = _isVisible or true;
		if ( _isVisible == false ) then
			SetModeEx( _objID , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
			SetModeEx( _objID , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
			SetModeEx( _objID , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
			SetModeEx( _objID , EM_SetModeType_Searchenemy , false );   	--����
			SetModeEx( _objID , EM_SetModeType_Mark , false );			--�аO
			SetModeEx( _objID , EM_SetModeType_Fight , false ); 			--���
			SetModeEx( _objID , EM_SetModeType_Move , false );			--����
			SetModeEx( _objID , EM_SetModeType_ShowRoleHead , true );
			SetModeEx( _objID , EM_SetModeType_Strikback , false );		--����
			SetModeEx( _objID , EM_SetModeType_Show , true );
			DebugMsg( 0 , 0 , "invisible item : ".._objID );
		end
		AddToPartition( _objID , _roomID );
		return _objID;
	end
	
	WriteRoleValue( _ctrlID , EM_RoleValue_Register1 , 1 );--����԰�MARK	0 = �D�԰� , 1 = �԰���
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );
	--��Ū��T
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	--squads
	local _squads , CreateSquad = Lua_703183_SquadCreater( _gConsts._bossVOs._Domisource._id );
	_gConsts._squads = _squads;
	_gConsts.CreateSquad = CreateSquad;

	--men counter
	WriteRoleValue( _bossID , EM_RoleValue_Register10 , 0 );--�������W�p�Ǽƶq

	BeginPlot( _ctrlID , "Lua_703175_AI_Engage" , 0 );--�Ұʾ԰��y�{

	ScriptMessage(_bossID,0,2,"[Lua_703175_AI_OnFight]",0);

end--function Lua_703175_AI_onFight()

function Lua_703175_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
	DebugMsg( 0 , _roomID , "--Lua_703175_AI_Engage" );
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;--_gConsts._bossID;--single boss
	local _bossVOs = _gConsts._bossVOs;--
	local _ctrlID = _gConsts._ctrlID;
	
	--squads
	local _squads = _gConsts._squads;
	local CreateSquad = _gConsts.CreateSquad;

	--counter
	local _headCounter = 0;--ReadRoleValue( _bossID , EM_RoleValue_Register10 );--�������W�p�Ǽƶq

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

	-----------------------------------------���q�ഫ
	local _bossHpRatio = 0;
	local _phaseTransformPeriodRatio = 0.599;--HP�C�l��60%�ഫ���q
	local _hpStepping = 1.0 - _phaseTransformPeriodRatio;--�U�@���q�ഫ���
	local _currentPhase = 1;
	----------------------------END----------���q�ഫ

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
		_headCounter = ReadRoleValue( _bossID , EM_RoleValue_Register10 );--�������W�p�Ǽƶq
		--------------END---Routines

		-------------------------------------------------�԰���������
		_allBossAreDead = true;--���]�Ҧ�BOSS�Ұ}�`
		_engaging = false;--���]�Ҧ�BOSS�������԰�
		for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬdBoss���S���q�q���۶ø�
			_currentBossID = _bossVO._id;
			if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 ) then--�����@BOSS�s���� �N���٥�����
				_allBossAreDead = false;
				if ( _bossVO.IndiSpec ~= nil ) then _bossVO.IndiSpec( _bossVO , _clock ); end--�X�٬��۪��ɭ�  ���K����ӧO���S��y�{
				if( ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) ~= 0 ) then--�����@BOSS���b�԰� �N���٦����a�s�� 
					--DebugMsg(0,0,_currentBossID.." ���b�l�����a : "..ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) );
					_engaging = true;--�L�k�ѨMIce����Ī����D
				end	
			else
				--[[
				--DebugMsg( 0 , 0 , "------dead boss : ".._bossName );
				--��BOSS���F  ���K�]�w�`�̴_��CD
				if ( _CD[_bossName] <= -1 ) then
					DebugMsg( 0 , _roomID , "------boss dead , set revive : ".._bossName );
					--_CD[_bossName] = _gConsts._bossReviveCD;	--�@�s����  �S���������b �h�]�w�`�̴_��CD	
				end
				]]--
			end
		end
		
		--DebugMsg(0,0,"--_allBossAreDead : "..tostring(_allBossAreDead).."   --_engaging : "..tostring(_engaging) );
		if ( _allBossAreDead == true ) then-- boss �������`�� �D�Ԧ��\
			DebugMsg( 0 , _roomID , "------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703175_AI_Conquered( _roomID );
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			--[[
			local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 300 , true );--�T�{�P�D�s�����a  --�]��Ice������
			if ( #_rangePlayers <= 0 ) then
				DebugMsg( 0 , _roomID , "--all players are gone , quit fighting "..tostring(_engaging) );
				--Lua_703175_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
				Lua_703175_AI_Reset( _roomID );
				break;
			end
			]]--
			Lua_703175_AI_Reset( _roomID );
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
		if ( _clock >= _frenzyCD and ( _isFrenzied == false ) ) then
				_isFrenzied = true;
				for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬdBoss���S���q�q���۶ø�
					_currentBossID = _bossVO._id;
					AddBuff( _currentBossID , 625849 , 0 , -1 );-- 625849 ����
				end
				DebugMsg( 0 , _roomID , "-----�g�g��----" );
				ScriptMessage(_bossID,0,2,"[Lua_703175_AI_Frenzy]",0);
		end		
	

		-----------------------------------------------�԰����q�ഫ
		_bossHpRatio = ReadRoleValue( _currentBossID , EM_RoleValue_HP )/ReadRoleValue( _currentBossID , EM_RoleValue_MaxHP );--HP ratio
		if ( _bossHpRatio <= _hpStepping ) then--����W�L60%Ĳ�o
			if ( _hpStepping > 0 ) then
				_hpStepping = _hpStepping - _phaseTransformPeriodRatio;--next transform ratio
				
				_currentPhase = _currentPhase + 1;
				--WriteRoleValue( _bossID , EM_RoleValue_Register1 , _currentPhase );
				--DebugMsg( 0 , 0 , "Switch to Phase : ".._currentPhase.."  , PhaseBuff : ".._currentPhaseBuffGUID.."  , Next Ratio : ".._hpStepping );
				DebugMsg( 0 , 0 , "Switch to Phase : ".._currentPhase.."  , Next Ratio : ".._hpStepping );
				SetModeEx( _currentBossID , EM_SetModeType_Fight , true );--��t����@�}�l�L�k�Q�������|���_�I��ޯ�C
				AddBuff( _currentBossID , 625913 , 0 , -1 );--625913�ĤG���q
			end
		end
		-------------------------------------END-----�԰����q�ഫ


		if ( _headCounter >= 10 ) then--����W�p�Ǽƶq�j��10��
			SysCastSpellLv( _bossID , _bossID , 852018 , 0 );--����ˮ`
			DebugMsg( 0 , _roomID , "soldier over 10" );
			ScriptMessage( _bossID , 0 , 2 , "[Lua_703175_AI_OverTen]" , 0 );
		end

		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��
			
			--[[
			for _bossName , _cdTime in pairs( _CD ) do--Boss����	�@�s����
				if ( _cdTime == 0 ) then
					_gConsts._bossVOs[_bossName]._id = Lua_703175_GenerateBoss( _bossVOs[_bossName] , _roomID );--���͹�����BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703175_AI_HasRevived]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--���ͭ˼ƴ���	�C10��
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

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���
	ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703175_AI_Reset]",0);

	Delobj( _frontDoorID );	--�R���e��
	_gConsts.DelExtObjs();--clear all extend items
	Lua_703183_ClearAll( _roomID );
	Lua_703175_AI_DeleteConstObj();

	Sleep( 10 );
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--�����԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , true );
		DelObj( _bossID );
	end
	Sleep( 10 );
	
	--_Lua_703175_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	for _bossName , _bossVO in pairs( _bossVOs ) do--�}�Ҿ԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703175_GenerateBoss( _bossVO , _roomID );--���͹�����BOSS
	end
	_gConsts._bossID = _gConsts._bossVOs._Domisource._id;--presiding Boss --Domisource
	--Lua_703175_BossIndividualsSetting( _gConsts );
	--SetDefIdleMotion( _gConsts._bossVOs._Ice._id , ruFUSION_MIME_EMOTE_CRY );--��Ice��

end--function Lua_703175_AI_Reset( _roomID )

function Lua_703175_AI_Conquered( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703175_AI_Conquered" );
	local _gConsts = _Lua_703175_AI_GlobalVars[ _roomID ];--for read
	
	if ( _gConsts == nil ) then return; end
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���

	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����

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
	for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬdBoss���S���q�q���۶ø�
		_currentBossID = _bossVO._id;
		if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 and _currentBossID ~= _ownerID ) then--�����@BOSS�s���� �N���٥�����
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
	Lua_DavisDelObj( 109144 );--109144���|
	Lua_DavisDelObj( 109146 );--109146���K
	Lua_DavisDelObj( 109145 );--109145���B
end

------------------------------------------------------------------------------------------�H�U�O�ޯ�
function Lua_703175_Skill_SummonSoldiers()
	DebugMsg( 0 , 0 , "--Lua_703175_Skill_SummonSoldiers" );
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _summonFunction = _Lua_703175_AI_GlobalVars[ _roomID ].CreateSquad;
	_summonFunction();
	return;
end



function Lua_703175_Skill_ControlWave()--����q�i
	DebugMsg( 0 , 0 , "--Lua_703175_Skill_ControlWave" );
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	DebugMsg( 0 , 0 , "--Lua_703175_Skill_ControlWave" );
	ScriptMessage( _ownerID,0,2,GetName( _ownerID ).."[Lua_703175_Skill_ControlWave]"..GetName( _targetID ) ,0 );--��t���� ������q�i���� XXX
	Sleep( 15 );
	SysCastSpellLv( _ownerID , _targetID , 851913 , 0 );--851913����q�i�ˮ`
	CancelBuff_NoEvent( _targetID , 625917 );--������
	return true
end

function Lua_703175_Skill_Laserwave()--�p�g�q�i
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
		SysCastSpellLv( _ownerID , _dummyID , 851927 , 0 );--851913�p�g�q�i�ˮ`
	end
	
	return true;
end

function Lua_703175_Skill_Laserwave_Hit()--�p�g�q�i ����
	local _ownerID = OwnerID();--boss
	local _targetID = TargetID();--victim
	DebugMsg( 0 , 0 , "--Lua_703175_Skill_Laserwave_Hit" );
	--local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location( _ownerID );

	SetPos( _targetID , x,y,z,dir );
	return true;
end


function  Lua_703175_CreateClone( _roomID , x,y,z,dir , _liveTime )--����
	--local _gConsts = _Lua_703126_AI_GlobalConsts[ _roomID ];
	--local _gVars = _Lua_703126_AI_GlobalVars[ _roomID ];

	--local _bossID = _gConsts._bossID;

	local _cloneID = 108653;--_Lua_703126_AI_GlobalConsts[ _roomID ]._cloneGUID;

	--local x,y,z,dir = DW_Location( _bossID );
	
	_cloneID = CreateObj( _cloneID , x , y , z , dir , 1 );
	--_Lua_703126_AI_GlobalVars[ _roomID ].ExtObj( _cloneID );

	SetModeEx( _cloneID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _cloneID , EM_SetModeType_HideName , true );	--����ܦW��
	SetModeEx( _cloneID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _cloneID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _cloneID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _cloneID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _cloneID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _cloneID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG
	SetModeEx( _cloneID , EM_SetModeType_Gravity , false );
	--SetModeEx( _cloneID , EM_SetModeType_Show , false );	
	WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , _liveTime or 20 );

	--AddBuff( _cloneID , 507899 , 1 , 100 );--���i���z����
	AddToPartition( _cloneID , _roomID );
	
	DebugMsg( 0 , 0 , "--Lua_703175_CreateClone : ".._cloneID );

	return _cloneID;
end