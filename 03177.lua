--Author : K.J. Aris
--Version : 140528
--Ignitor : NPC 109086
--Script : 703177

local _Lua_703177_AI_GlobalVars = nil;

function Lua_703177_AI_Init( _inputCtrID )--controller  NPC 109086 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703177_AI_Init : NPC 109086       Z34  V 140528 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --�H�����ư��� �N�즳����R��

	--basics
	local _ctrlID = _inputCtrID or OwnerID() or 0;--109086
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
	local _bossZernatineGUIDs = { 109017 , 109165 , 109170 };--��R��
	local _corruptedEnergyGUIDs = { 109156 , 109166 , 109171 };--�G�Ư�q
		--�۶H�аѦ� Server Script 703187

	--local _treasureBoxGUIDs = { 108832 , 108833 , 108834 };--ĳ�|�p�ë~

	--�ѼƳ]�w��
	if ( _Lua_703177_AI_GlobalVars == nil ) then _Lua_703177_AI_GlobalVars = {}; end
	_Lua_703177_AI_GlobalVars[ _roomID ] = {	--non 
					_bossID = 0 ,--�H_Schulize���N��( ����L�禡�n�� _bossID)

					_bossVOs = {
						_Zernatine = {
							_id = 0 ,					--ID
							_guid = _bossZernatineGUIDs[ _difficulty ] ,		--GUID
							_flagPos = 1 , 					--�X�Ц�m

							--_defaultIdle = nil;--ruFUSION_MIME_EMOTE_STRETCH;--�w�]�ʧ@
							IndiSpec = nil ,	--function�ӧO���S��y�{
							} , 
						},

					_corruptedEnergyGUID = _corruptedEnergyGUIDs[ _difficulty ] ,

					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_ctrlGUID = 108705 ,--���ID
					_doorGUID = 104171 , --106246
					--_treasureBoxGUID = _treasureBoxGUIDs[ _difficulty ] ,--ĳ�|�p�ë~

					_flagGUID = 781425 , --781425 Z34_3���κX��

					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					_bossReviveCD = 45 ,

					_squads = nil ,--table �p�����M��
					CreateSquad = nil ,--function ���p����FUNCTION

					};
	--��Ū��T
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];

	--���� Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703177_GenerateBoss( _bossVO , _roomID );
		_gConsts._bossVOs[_bossName]._id = _bossID;--
	end
	_gConsts._bossID = _gConsts._bossVOs._Zernatine._id;--presiding Boss --Zernatine
	--Lua_703177_BossIndividualsSetting( _gConsts );

	--���ͫ��
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
		SetDefIdleMotion( _bossID , _bossVO._defaultIdle );--�w�]�ʧ@
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
	Lua_703187_ClearAll( _specRoomID );--�����ۼv
end--function Lua_703177_ClearAll()

function Lua_703177_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703177_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703177_ClearAll( _roomID );
	Lua_703177_AI_Init();
end


function Lua_703177_AI_onFight()--���h������ �u��b�䤤�@�����W  �ҪO�г]"�s��"
	--�԰���l
	local _bossID = OwnerID();--_Zernatine
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703177_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703177_AI_GlobalVars == nil ) then Lua_703177_AI_reignite( _roomID ); return; end

	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then Lua_703177_AI_reignite( _roomID ); return; end

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--��W�@���`��������٦b�@�ʮɫh���ʧ@  (����_Schulize���ͮɭ���Ĳ�o�԰�)
		DebugMsg( 0 , _roomID , "--Combat Sequence Duplicated : New Sequence Rejected !!" );--presiding boss may revived or rejoin the fight while combat is not over yet
		return;
	end
	--����P�l������
	local _ctrlID , _AddParasite , _RemoveParasites = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--�l�ͪ�(�B�z�۳ꪫ �� ���X�Ӫ��F��)
		local x,y,z,dir = DW_Location( _bossID );
		local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
		_AddParasite( _objID );
		AddToPartition( _objID , _roomID );
		return _objID;
	end
	
	WriteRoleValue( _ctrlID , EM_RoleValue_Register1 , 1 );--����԰�MARK	0 = �D�԰� , 1 = �԰���
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );
	--��Ū��T
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	WriteRoleValue( _bossID , EM_RoleValue_Register1 , 0 );--�G�Ư�q�p�ƾ�

	--squads   �ۼv�p��
	local _squads , CreateSquad = Lua_703187_SquadCreater( _bossID );
	_gConsts._squads = _squads;
	_gConsts.CreateSquad = CreateSquad;

	BeginPlot( _ctrlID , "Lua_703177_AI_Engage" , 0 );--�Ұʾ԰��y�{

	ScriptMessage(_bossID,0,2,"[Lua_703177_AI_OnFight]",0);

end--function Lua_703177_AI_onFight()

function Lua_703177_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
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

	-----------------------------------------���q�ഫ
	local _bossHpRatio = 0;
	local _phaseTransformPeriodRatio = 0.1;--HP�C�l��10%�ഫ���q
	local _hpStepping = 1.0 - _phaseTransformPeriodRatio;--�U�@���q�ഫ���
	local _currentPhase = 1;
	----------------------------END----------���q�ഫ

	--�ۼv�۳� �P�_
	local _summonPhantom = true;

	while true do 
		--------------------clock
		Sleep( _miniTimeTick );
		_clock = _clock + _timeTick;
		--DebugMsg( 0 , 0 , "--Clock : ".._clock );
		--------------END---clock
		
		--------------------Routines
		--------------END---Routines

		-------------------------------------------------�԰���������
		_allBossAreDead = true;--���]�Ҧ�BOSS�Ұ}�`
		_engaging = false;--���]�Ҧ�BOSS�������԰�
		for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬdBoss���S���q�q���۶ø�
			_currentBossID = _bossVO._id;
			if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 ) then--�����@BOSS�s���� �N���٥�����
				_allBossAreDead = false;
				if ( _bossVO.IndiSpec ~= nil ) then _bossVO.IndiSpec( _bossVO , _clock ); end--�X�٬��۪��ɭ�  ���K����ӧO���S��y�{
				Lua_703177_CorruptedEnerge_Check( _bossID , _gConsts );
				if( ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) ~= 0 ) then--�����@BOSS���b�԰� �N���٦����a�s�� 
					--DebugMsg(0,0,_currentBossID.." ���b�l�����a : "..ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) );
					_engaging = true;--�L�k�ѨMSchulize����Ī����D
				end	
			else
				--DebugMsg( 0 , 0 , "------dead boss : ".._bossName );
				--��BOSS���F  ���K�]�w�`�̴_��CD
				--[[
				if ( _CD[_bossName] <= -1 ) then
					DebugMsg( 0 , _roomID , "------boss dead , set revive : ".._bossName );
					_CD[_bossName] = _gConsts._bossReviveCD;	--�@�s����  �S���������b �h�]�w�`�̴_��CD	
				end
				--]]
			end
		end
		
		--DebugMsg(0,0,"--_allBossAreDead : "..tostring(_allBossAreDead).."   --_engaging : "..tostring(_engaging) );
		if ( _allBossAreDead == true ) then-- boss �������`�� �D�Ԧ��\
			DebugMsg( 0 , _roomID , "------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703177_AI_Conquered( _roomID );
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			--[[
			local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 300 , true );--�T�{�P�D�s�����a  --�]��Schulize������
			if ( #_rangePlayers <= 0 ) then
				DebugMsg( 0 , _roomID , "--all players are gone , quit fighting "..tostring(_engaging) );
				--Lua_703177_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
				Lua_703177_AI_Reset( _roomID );
				break;
			end
			]]--
			Lua_703177_AI_Reset( _roomID );
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
				ScriptMessage(_bossID,0,2,"[Lua_703177_AI_Frenzy]",0);
		end	

		-----------------------------------------------�԰����q�ഫ
		_bossHpRatio = ReadRoleValue( _currentBossID , EM_RoleValue_HP )/ReadRoleValue( _currentBossID , EM_RoleValue_MaxHP );--HP ratio
		if ( _bossHpRatio <= _hpStepping ) then--����W�L10%Ĳ�o
			if ( _hpStepping > 0 ) then
				_hpStepping = _hpStepping - _phaseTransformPeriodRatio;--next transform ratio
				
				_currentPhase = _currentPhase + 1;
				--WriteRoleValue( _bossID , EM_RoleValue_Register1 , _currentPhase );
				DebugMsg( 0 , 0 , "Switch to Phase : ".._currentPhase.."  , Next Ratio : ".._hpStepping );
				AddBuff( _currentBossID , 625962 , 0 , -1 );--625962���O�W�T�I��L�O

				--�ۼv
				if ( _bossHpRatio <= 0.2 and _summonPhantom == true ) then--�C��20%Ĳ�o�ۼv
					_summonPhantom = false;--Ĳ�o�L�N���AĲ�o
					DebugMsg( 0 , 0 , "--20% Phantom : " );
					_gConsts.CreateSquad();--���ͤۼv
					AddBuff( _bossID , 625982 , 20 , -1 );--625982���L�� --����BOSS �L��
				end

			end
		end
		-------------------------------------END-----�԰����q�ഫ	
	
		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��
			
			--�`���ۦ�  �C��I��
			SysCastSpellLv( _bossID , _bossID , 852031 , 0 );--852031���O�G�k

			--[[
			for _bossName , _cdTime in pairs( _CD ) do--Boss����	�@�s����
				if ( _cdTime == 0 ) then
					_Lua_703177_AI_GlobalVars[ _roomID ]._bossVOs[_bossName]._id = Lua_703177_GenerateBoss( _bossVOs[_bossName] , _roomID );--���͹�����BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703177_AI_HasRevived]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--���ͭ˼ƴ���	�C10��
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

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���
	ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703177_AI_Reset]",0);

	Delobj( _frontDoorID );	--�R���e��
	_gConsts.DelExtObjs();--clear all extend items
	Lua_703187_ClearAll( _roomID );--�����ۼv

	Sleep( 10 );
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--�����԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , true );
		DelObj( _bossID );
	end
	Sleep( 10 );
	
	--_Lua_703177_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	for _bossName , _bossVO in pairs( _bossVOs ) do--�}�Ҿ԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703177_GenerateBoss( _bossVO , _roomID );--���͹�����BOSS
	end
	_gConsts._bossID = _gConsts._bossVOs._Zernatine._id;--presiding Boss --Zernatine
	--Lua_703177_BossIndividualsSetting( _gConsts );
	--SetDefIdleMotion( _gConsts._bossVOs._Schulize._id , ruFUSION_MIME_EMOTE_CRY );--��Schulize��

end--function Lua_703177_AI_Reset( _roomID )

function Lua_703177_AI_Conquered( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703177_AI_Conquered" );
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];--for read
	
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���

	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����

	Lua_703187_ClearAll( _roomID );--�����ۼv

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
	for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬdBoss���S���q�q���۶ø�
		_currentBossID = _bossVO._id;
		if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 and _currentBossID ~= _ownerID ) then--�����@BOSS�s���� �N���٥�����
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



------------------------------------------------------------------------------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y
function Lua_703177_CorruptedEnerge_Check( _bossID , _gConsts )

	if ( ReadRoleValue( _bossID , EM_RoleValue_Register1 ) >= 10 ) then--�ֿn�W�L10��
		local _rangeNpcs = SearchRangeNPC( _bossID , 800 );
	
		for _index , _npcID in pairs( _rangeNpcs ) do
			if ( ReadRoleValue( _npcID , EM_RoleValue_OrgID ) == _gConsts._corruptedEnergyGUID ) then
				DebugMsg( 0 , 0 , "--CorruptedEnerge_Explode : ".._index.." : ".._npcID );
				SysCastSpellLv( _npcID , _npcID , 852041 , 0 );--852041��q�z�o
			end
			
		end
	end

end

---------------------------------------------------------------------END------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y

------------------------------------------------------------------------------------------�H�U�O�ޯ�
function Lua_703177_Skill_EvilEnhance()--625961�W�T�ɨ�      625962�W�T�ɨ�I��L�O
	local _ownerID = OwnerID();--boss
	DebugMsg( 0 , 0 , "--Lua_703177_Skill_EvilEnhance " );
	CancelBuff( _ownerID , 625962 );--625962�W�T�ɨ�I��L�O

	--�p��BUFF�ɶ�
	--�W�T�ɨ� ��ƭp��Ѫ��a���W�����O�G�k����AEX�G12�W���a�A���|�F20�h���O�G�k�A�W�T�ɨ誺�s�b�ɶ��N�|�O�]12*20/10=24��^�C
	local _buffGUID = 625961;--625961�W�T�ɨ� 
	local _referanceBuffGUID = 625959; --625959���O�G�k
	local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 600 , true );
	local _effectivePersonalNum = 0;
	local _effectiveLv = 0;
	local _currentPlayerBuffLv = 0;
	for _index , _playerID in pairs( _rangePlayers ) do
		if ( CheckBuff( _playerID , _referanceBuffGUID ) == true ) then --625959���O�G�k
			_effectivePersonalNum = _effectivePersonalNum + 1;--�p��H�Y
			_currentPlayerBuffLv = Lua_703107_Return_Buff_Lv( _playerID , _referanceBuffGUID );--625959���O�G�k �h��
			_effectiveLv = _effectiveLv + _currentPlayerBuffLv;--�p��h��
			SysCastSpellLv( _playerID , _ownerID , 852032 , 0 );--852032���O�G�k�l���S��
			CancelBuff_NoEvent( _playerID , _referanceBuffGUID );--�l���� ���O�G�k
		end
	end
	local _buffTime = ( _effectivePersonalNum*_effectiveLv )*0.1;
	AddBuff( _ownerID , _buffGUID , 0 , _buffTime );--�[�W�W�T�ɨ�
	DebugMsg( 0 , 0 , "--_buffTime : ".._buffTime );

	--�� ��q�C�C���ͼƶq���u�W�T�ɨ�v��ƪ��|�����@�CEX�G24/4=6���A�ĥεL����˥h�k�AEX�G23/4=5.75=5���C
	local _maxCorruptedEnergy = math.floor( _buffTime*0.25 );--�G�Ư�q �ƶq
	DebugMsg( 0 , 0 , "--_maxCorruptedEnergy : ".._maxCorruptedEnergy );
	if ( _maxCorruptedEnergy <= 0 ) then--�Ѥ���0�ӴN�ǰ��F
		return;
	end

	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703177_AI_GlobalVars[ _roomID ];
	for _i = 1 , _maxCorruptedEnergy , 1 do
		Lua_703177_CreateCorruptedEnerge( _gConsts );
	end
	
	return true;
end

function Lua_703177_Skill_Despise()--����
	local _ownerID = OwnerID();--boss
	local _targetID = TargetID();--victim
	DebugMsg( 0 , 0 , "--Lua_703177_Skill_Despise " );
	--�N���a�ǰe��BOSS�P��200�X�����@�I�A�åB�������O�T�D�C
	local _range = 200;
	local x,y,z,dir = DW_Location( _ownerID );
	local _x , _z = 0;
	_x = x + ( RandRange( 1 , 2*_range ) - _range );
	_z = z + ( RandRange( 1 , 2*_range ) - _range );

	AddBuff( _targetID , 625965 , 0 , 5 );--625965���O�T�D

	if ( CheckDistance( _ownerID , _targetID , _range  ) == false ) then
		SetPos( _targetID , _x,y,_z , dir );
	end
	
	CallPlot( _ownerID , "Lua_703177_Skill_EvilBurst" , _ownerID , _targetID );
	return;
end

function Lua_703177_Skill_EvilBurst( _ownerID , _targetID )--���O�@��
	Sleep( 55 );
	CallPlot( _ownerID , "Lua_703177_Skill_EvilBurst2" , _ownerID , _targetID );
	return;
end

function Lua_703177_Skill_EvilBurst2( _ownerID , _targetID )--���O�@��
	SysCastSpellLv( _ownerID , _targetID , 852035 , 0 );--���O�@��
	return;
end



function Lua_703177_Skill_Seduce()--�y�b BUFF
	local _ownerID = OwnerID();--boss
	local _targetID = TargetID();--victim
	local _thisBuffGUID = 625968;--625968�y�b
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _thisBuffGUID );
	DebugMsg( 0 , 0 , "--Lua_703177_Skill_Seduce : ".._currentBuffLv );
	if ( _currentBuffLv >= 3 ) then--�|��5�h��A�|�Q�w���B���g�B�L�k�i�����ʧ@�C
		AddBuff( _targetID , 625969 , 0 , -1 );--625969�y�b�j�ƪ�

		--[[
		local x,y,z,dir = DW_Location( _ownerID );

		local _x = x + ( RandRange( 1 , 2*_range ) - _range );
		local _z = z + ( RandRange( 1 , 2*_range ) - _range );

		SetPos( _targetID , _x,y,_z , dir );
		]]--
		SetAttack( _ownerID , _targetID );
		AddBuff( _ownerID , 625968 , 0 , -1 );--625968�y�b
		DebugMsg( 0 , 0 , "--Lua_703177_Skill_Seduce : Ready to give a deadly kiss !!! : ".._ownerID );
	end

	return true;
end


---------------------------------------�G�Ư�q
function Lua_703177_CreateCorruptedEnerge( _gConsts )--�гy�@�ӻG�Ư�q
	DebugMsg( 0 , 0 , "--Lua_703177_CreateCorruptedEnerge " );
	local x,y,z,dir = DW_Location( _gConsts._bossID );
		x = x + ( RandRange( 1 , 300 ) - 150 );	
		z = z + ( RandRange( 1 , 300 ) - 150 );	

	--�G�Ư�q
	local _corruptedEnergyID = _gConsts.ExtObj( _gConsts._corruptedEnergyGUID , x,y,z,dir );

	WriteRoleValue( _corruptedEnergyID , EM_RoleValue_PID , _gConsts._bossID );
	local _counter = ReadRoleValue( _gConsts._bossID , EM_RoleValue_Register1 );--�G�Ư�q�p�ƾ�
	_counter = _counter + 1;
	WriteRoleValue( _gConsts._bossID , EM_RoleValue_Register1 , _counter );--�G�Ư�q�p�ƾ�

	CallPlot( _corruptedEnergyID , "Lua_703177_CorruptedEnerge_Loop" , _corruptedEnergyID , _gConsts._bossID );
end

function Lua_703177_CorruptedEnerge_Loop( _corruptedEnergyID , _bossID )
	DebugMsg( 0 , 0 , "--Lua_703177_CorruptedEnerge_Loop : ".._corruptedEnergyID );
	local _active = true;
	local _lastStatus = false;
	while true do
		if ( _lastStatus ~= _active ) then
			DebugMsg( 0 , 0 , "--CorruptedEnerge Active : ".._corruptedEnergyID.." : "..tostring(_active) );
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Mark , _active );	--���i�I��
			SetModeEx( _corruptedEnergyID , EM_SetModeType_HideName , not _active );	--����ܦW��
			SetModeEx( _corruptedEnergyID , EM_SetModeType_NotShowHPMP , not _active );	--����ܦ��
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Strikback , false );	--���|����
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Move , false );	--���|����
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Fight , _active );	--���i����
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Searchenemy , false );	--���|����
			SetModeEx( _corruptedEnergyID , EM_SetModeType_Obstruct , false );	--�����׮ĪG
			_lastStatus = _active;
		end

		--CastSpell( _corruptedEnergyID , _corruptedEnergyID , 852040 );--852040��qŧ�� -- for test
		
		_active = ( CheckID( _bossID ) and CheckBuff( _bossID , 625961 ) );--625961�W�T�ɨ� 
		if ( _active ) then
			CastSpell( _corruptedEnergyID , _corruptedEnergyID , 852040 );--852040��qŧ��
		end

		Sleep( 30 );
	end

	return;
end


function Lua_703177_CorruptedEnerge_Ondead()
	DebugMsg( 0 , 0 , "--Lua_703177_CorruptedEnerge_Ondead : " );
	local _ownerID = OwnerID();
	local _bossID = ReadRoleValue( _ownerID , EM_RoleValue_PID );
	local _counter = ReadRoleValue( _bossID , EM_RoleValue_Register1 );--�G�Ư�q�p�ƾ�
	_counter = _counter - 1;
	WriteRoleValue( _bossID , EM_RoleValue_Register1 , _counter );--�G�Ư�q�p�ƾ�

	DelObj( _ownerID );
	return false;
end

function Lua_703177_Skill_DarkShadowArrow()--�t�v�b
	local _ownerID = OwnerID();
	local _targetID = TargetID();

	SysCastSpellLv( _ownerID , _targetID , 852049 , 0 );--852049�t�v�b����S��

	return true;
end