--Author : K.J. Aris
--Version : 14.02.25.
--Ignitor : 108908
--NPC : 108908--raid
--Script : 703146

local _Lua_703146_AI_GlobalVars = {};

function Lua_703146_AI_Init( _inputCtrID )--controller  NPC 108908 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703146_AI_Init : NPC 108908       Z33-2B1  V140225 " );

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108908
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
	local _bossKokarGUIDs = { 108818 , 103761 , 103765 };--�ĥd��
	local _bossTonaGUIDs = { 108819 , 103762 , 103766 };--����
	local _bossMarlocGUIDs = { 108820 , 103763 , 103767 };--�����J
	local _bossSchulizeGUIDs = { 108821 , 103764 , 103768 };--�Եܵ�

	local _treasureBoxGUIDs = { 108832 , 108833 , 108834 };--ĳ�|�p�ë~

	--�ѼƳ]�w��
	_Lua_703146_AI_GlobalVars[ _roomID ] = {	--non 
					_bossID = 0 ,--�H_Schulize���N��( ����L�禡�n�� _bossID)

					_bossVOs = {
						_Kokar = {
							_id = 0 ,					--ID
							_guid = _bossKokarGUIDs[ _difficulty ] ,		--GUID
							_flagPos = 1 , 					--�X�Ц�m
							_name = "[108818]" ,	--��ܥΦW��

							_defaultIdle = nil;--ruFUSION_MIME_EMOTE_STRETCH;--�w�]�ʧ@
							_debuffs = {};--�O���C�������t�����A   ��K�ޯ�M��(�B�H���D)
							IndiSpec = Lua_703146_AI_IndividualSpec_Kokar,	--function�ӧO���S��y�{
							} , 

						_Tona = {
							_id = 0 ,
							_guid = _bossTonaGUIDs[ _difficulty ] ,
							_flagPos = 3 , 
							_name = "[108819]" ,	--��ܥΦW��

							_defaultIdle = nil;--ruFUSION_MIME_EMOTE_CUTE2;--�w�]�ʧ@
							_debuffs = { 625537 };--625537���`�e��§��
							IndiSpec = Lua_703146_AI_IndividualSpec_Tona,--function�ӧO���S��y�{
							} , 

						_Marloc = {
							_id = 0 ,
							_guid = _bossMarlocGUIDs[ _difficulty ] ,
							_flagPos = 2 , 
							_name = "[108820]" ,	--��ܥΦW��

							_defaultIdle = nil;--ruFUSION_MIME_EMOTE_LAUGH;--�w�]�ʧ@
							_debuffs = { 625554 ,  };--625554���ĦL�O , 625640���뤧�L
							IndiSpec = Lua_703146_AI_IndividualSpec_Marloc,--function�ӧO���S��y�{
							} , 

						_Schulize = {
							_id = 0 ,
							_guid = _bossSchulizeGUIDs[ _difficulty ] ,
							_flagPos = 4 , 
							_name = "[108821]" ,	--��ܥΦW��

							_defaultIdle = ruFUSION_MIME_EMOTE_CRY;--�w�]�ʧ@
							_debuffs = { 625540 };--625540�s��Į�
							IndiSpec = Lua_703146_AI_IndividualSpec_Schulize,--function�ӧO���S��y�{
							} 
						},

					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_ctrlGUID = 108705 ,--���ID
					_doorGUID = 106012 , 
					_treasureBoxGUID = _treasureBoxGUIDs[ _difficulty ] ,--ĳ�|�p�ë~

					_flagGUID = 781415 , --781415 Z33-2_1���κX��

					_frontDoorFlagPos = 5 , 
					_backDoorFlagPos = 6 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					_bossReviveCD = 45 ,

					};
	--��Ū��T
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];

	--���� Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703146_GenerateBoss( _bossVO , _roomID );
		_gConsts._bossVOs[_bossName]._id = _bossID;--
	end
	_gConsts._bossID = _gConsts._bossVOs._Kokar._id;--presiding Boss --Kokar
	--Lua_703146_BossIndividualsSetting( _gConsts );

	--���ͫ��
	_gConsts._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	--delete trigger
	DelObj( _ctrlID );
		
	return _roomID;
end--function Lua_703146_AI_Init( _inputCtrID )

function Lua_703146_GenerateBoss( _bossVO , _roomID )
	Lua_DavisDelObj( _bossVO._guid );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	local _bossID = CreateObjByFlag( _bossVO._guid , _gConsts._flagGUID , _bossVO._flagPos , 1 );
	AddToPartition( _bossID , _roomID ); 

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false );
	SetModeEx( _bossID , EM_SetModeType_Fight , true );
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );

	if ( _bossVO._defaultIdle ~= nil ) then
		SetDefIdleMotion( _bossID , _bossVO._defaultIdle );--�w�]�ʧ@
	end

	return _bossID;
end--function Lua_703146_GenerateBoss( _bossVO )

function Lua_703146_KokarInitSetting()--on NPC 108818
	local _ownerID = OwnerID();
	Cl_Resist_HackersBossNum( _ownerID );--���b�Ⱦ���
	AddBuff( _ownerID , 625549 , 0 , -1 );--��MP SP�^�_
	WriteRoleValue( _ownerID , EM_RoleValue_MaxMP , 100 );
	WriteRoleValue( _ownerID , EM_RoleValue_MP , 0 );--SP�k0
end

function Lua_703146_ShulizeInitSetting()--on NPC 108821
	local _ownerID = OwnerID();
	WriteRoleValue( _ownerID , EM_RoleValue_Register1 , 0 );--�~�˿W�B���ʦ��ƭp�� �C����3���|�I��u�s��Į��v
	WriteRoleValue( _ownerID , EM_RoleValue_IsWalk , 1 );--�@�v�������Ҧ�
	AddBuff( _ownerID , 623976 , 0 , -1 );--�Եܵ��C�C��
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--����
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--����
	SetModeEx( _ownerID , EM_SetModeType_Move , true );
end

function Lua_703146_ClearAll()--for test
	DebugMsg( 0 , 0 , "--Lua_703146_ClearAll : all values will be cleared , reinit this by redeploying NPC 108908" );--
	if ( _Lua_703146_AI_GlobalVars ~= nil ) then
		for _roomID , _valuePack in pairs( _Lua_703146_AI_GlobalVars ) do
			if ( _valuePack.DelExtObjs ~= nil ) then
				_valuePack.DelExtObjs();
			end

			for _bossName , _bossVO in pairs( _valuePack._bossVOs ) do
				DelObj( _bossVO._id );
			end
			DelObj( _valuePack._ctrlID );
			DelObj( _valuePack._frontDoorID );
			DelObj( _valuePack._backDoorID );
			_Lua_703146_AI_GlobalVars[ _roomID ] = nil;
		end
	end
end--function Lua_703146_ClearAll()

function Lua_703146_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703146_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703146_ClearAll();
	Lua_703146_AI_Init();
end

function Lua_703146_AI_onFight()--��b_Kokar���W
	--�԰���l
	local _bossID = OwnerID();--_Kokar
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	Cl_Resist_HackersFightBegin( _ownerID );--���b�Ⱦ���
	DebugMsg( 0 , 0 , "--Lua_703146_AI_onFight ".._bossID.." RID : ".._roomID );
	
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703146_AI_reignite( _roomID ); return; end

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
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703146_AI_Engage" , 0 );--�Ұʾ԰��y�{

	ScriptMessage( _bossID , -1 , 2 , "[LUA_703146_AI_ONFIGHT]" , 0 );
	
end--function Lua_703146_AI_onFight()

function Lua_703146_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
	DebugMsg( 0 , _roomID , "--Lua_703146_AI_Engage" );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._ctrlID;--_gConsts._bossID;--take ctrl as boss , because there's no guarantee that presiding Boss is always alive
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
		_Kokar = -1 ,	--_gConsts._bossReviveCD
		_Tona = -1 ,	
		_Marloc = -1 ,	
		_Schulize = -1 ,	
		}

	--local _alivePlayers = 0;
	local _currentBossID = 0;

	DebugMsg( 0 , 0 , "--Start loop" );

	while true do 
		--------------------clock
		Sleep( _miniTimeTick );
		_clock = _clock + _timeTick;
		--DebugMsg( 0 , 0 , "--Clock : ".._clock );
		--------------END---clock
		

		-------------------------------------------------�԰���������
		_allBossAreDead = true;--���]�Ҧ�BOSS�Ұ}�`
		_engaging = false;--���]�Ҧ�BOSS�������԰�
		for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬdBoss���S���q�q���۶ø�
			_currentBossID = _bossVO._id;
			if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 ) then--�����@BOSS�s���� �N���٥�����
				_allBossAreDead = false;
				_bossVO.IndiSpec( _bossVO , _clock );--�X�٬��۪��ɭ�  ���K����ӧO���S��y�{
				if( ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) ~= 0 ) then--�����@BOSS���b�԰� �N���٦����a�s�� 
					_engaging = true;--�L�k�ѨMSchulize����Ī����D
				end	
			else
				--��BOSS���F  ���K�]�w�`�̴_��CD
				if ( _CD[_bossName] <= -1 ) then
					DebugMsg( 0 , _roomID , "------boss dead , set revive : ".._bossName );
					_CD[_bossName] = _gConsts._bossReviveCD;	--�@�s����  �S���������b �h�]�w�`�̴_��CD	
				end
			end
		end
		
		if ( _allBossAreDead == true ) then-- boss �������`�� �D�Ԧ��\
			DebugMsg( 0 , _roomID , "------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703146_AI_Conquered( _roomID );
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���

			local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 300 , true );--�T�{�P�D�s�����a  --�]��Schulize������
			if ( #_rangePlayers <= 0 ) then
				DebugMsg( 0 , _roomID , "--all players are gone , quit fighting "..tostring(_engaging) );
				--Lua_703146_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
				Lua_703146_AI_Reset( _roomID );
				break;
			end

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
				for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬdBoss���S���q�q���۶ø�
					_currentBossID = _bossVO._id;
					AddBuff( _currentBossID , 625849 , 0 , -1 );-- 625849 ����
				end
				DebugMsg( 0 , _roomID , "-----�g�g��----" );
				ScriptMessage( _bossID , -1 , 2 , "[LUA_703146_AI_FRENZY]" , 0 );
		end		
	
		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��
			
			for _bossName , _cdTime in pairs( _CD ) do--Boss����	�@�s����

				
				if ( _cdTime == 0 ) then
					_gConsts._bossVOs[_bossName]._id = Lua_703146_GenerateBoss( _bossVOs[_bossName] , _roomID );--���͹�����BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					ScriptMessage( _bossID , -1 , 2 , _gConsts._bossVOs[_bossName]._name.."[LUA_703146_AI_HASREVIVED]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--���ͭ˼ƴ���	�C10��
					ScriptMessage( _bossID , -1 , 2 , _gConsts._bossVOs[_bossName]._name.."[LUA_703146_AI_WILLREVIVEIN10SEC]" , 0 );
				end
			
			end
			
		end--for --switch case simulation

	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
end--function Lua_703146_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703146_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703146_AI_Reset" );

	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	
	local _bossVOs = _gConsts._bossVOs;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���
	ScriptMessage( _gConsts._ctrlID , -1 , 2 , "[$MUTE]".."[LUA_703146_AI_RESET]" , 0 );

	Delobj( _frontDoorID );	--�R���e��
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 10 );
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--�����԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , true );
		DelObj( _bossID );
	end
	Sleep( 10 );
	
	--_Lua_703146_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	for _bossName , _bossVO in pairs( _bossVOs ) do--�}�Ҿ԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703146_GenerateBoss( _bossVO , _roomID );--���͹�����BOSS
	end
	_gConsts._bossID = _gConsts._bossVOs._Kokar._id;--presiding Boss --Kokar

end--function Lua_703146_AI_Reset( _roomID )

function Lua_703146_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703146_AI_Conquered" );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];--for read
	
	if( _gConsts == nil ) then return; end
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���

	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����

	ScriptMessage( _gConsts._ctrlID , -1 , 2 , "[$MUTE]".."[LUA_703146_AI_CONQUERED]" , 0 );	
	
	--�_�c
	local x,y,z,dir = DW_Location( _gConsts._ctrlID );
	local _loot  = WY_Create_an_obj( _gConsts._treasureBoxGUID , x,y,z,dir );

	SetModeEx( _loot , EM_SetModeType_ShowRoleHead , false );
	
	SetModeEx( _loot , EM_SetModeType_Mark , true );	--���i�I��
	SetModeEx( _loot , EM_SetModeType_HideName , true );	--����ܦW��
	SetModeEx( _loot , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _loot , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _loot , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _loot , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _loot , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _loot , EM_SetModeType_Obstruct , true );	--�����׮ĪG

	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703146_AI_GlobalVars[ _roomID ] = nil;	--clear all values
end--function Lua_703146_AI_Conquered( _roomID )

function Lua_703146_AI_Dead()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	Cl_Resist_HackersBossDead( _ownerID );--���b�Ⱦ���

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
	DebugMsg( 0 , 0 , "--Lua_703146_AI_Dead : "..tostring( _allBossAreDead ) );

	if ( _allBossAreDead ) then
		Lua_703146_AI_Conquered( _roomID );
	end
	return true;
end
-----------------------------------sub functions

------------------------------------------------------------------------------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y
function Lua_703146_AI_IndividualSpec_Kokar( _bossKokarVO , _clock )--_Kokar
	local _bossID = _bossKokarVO._id;
	local _spRatio = ReadRoleValue( _bossID , EM_RoleValue_MP )/ReadRoleValue( _bossID , EM_RoleValue_MaxMP );
	--���O�ȶW�L50%�A�����O�N�o�촣�ɡC
	if ( _spRatio >= 0.5  ) then
		AddBuff( _bossID , 625543 , 0 , -1 );--625543�I�h�g��
	else
		CancelBuff( _bossID , 625543 );--625543�I�h�g��
	end

	--���O�ȶW�L100% �I�i �B�H���D--851882�B�H���D
	if ( _spRatio >= 1.0  ) then
		AddBuff( _bossID , 625550 , 0 , -1 );--625550�B�H���D�I��L�O
		return;
	end

	--�ݧԤ��x�եO --�d��75�X���S������ؼСA�h�|���w�H�����a�A�ñN��j��ʨ�ĥd�����e��A�P�ɩw��10��C
	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 75 , true );
	if( #_rangePlayerList <= 0 ) then
		AddBuff( _bossID , 625551 , 0 , -1 );--625551�ݧԤ��x�եO�I��L�O
		return
	end
end

function Lua_703146_AI_IndividualSpec_Tona( _bossTonaVO , _clock )--_Tona
	local _bossID = _bossTonaVO._id;
	SysCastSpellLv( _bossID , _bossID , 851877 , 0 );--851877�ӫǩ���
end

function Lua_703146_AI_IndividualSpec_Marloc( _bossMarlocVO , _clock )--_Marloc
	local _bossID = _bossMarlocVO._id;

	if ( _clock%7 == 0 ) then
		SysCastSpellLv( _bossID , _bossID , 851887 , 0 );--851887���뤧�L
		SysCastSpellLv( _bossID , _bossID , 851888 , 0 );--851888���뤧�L( �ˮ` )
	
		return;
	end

	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 75 , true );
	if( #_rangePlayerList <= 0 ) then--�p�G��Խd��75�X���S������ؼСA�h�|�����ˮ`�C
		SysCastSpellLv( _bossID , _bossID , 851884 , 0 );--851884�Z���ӱڱեO
		return;
	end	
end

function Lua_703146_AI_IndividualSpec_Schulize( _bossSchulizeVO , _clock )--_Schulize
	local _bossID = _bossSchulizeVO._id;

	SysCastSpellLv( _bossID , _bossID , 851874 , 0 );--851874�ܤ��F��
		
	if ( _clock%11 == 0 ) then --�~�˿W�B
		CallPlot( _bossID , "Lua_703146_Skill_WalkAlone_Walker" , _bossID );
	end
end
---------------------------------------------------------------------END------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y


------------------------------------------------------------------------------------------�H�U�O�ޯ�

------------------------------------------------------------------------------------------Marloc
function Lua_703146_Skill_HateMark()
	local _ownerID = TargetID();--���`��
	local _thisBuffGUID = 625640;--625640���뤧�L
	local _transBuffGUID = 625554;--625554���ĦL�O	

	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffGUID );
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_HateMark :".._ownerID.."  BLV : ".._currentBuffLv );
	if ( _currentBuffLv >= 4 and CheckBuff( _ownerID , _transBuffGUID ) == false ) then
		
		CancelBuff_NoEvent( _ownerID , _thisBuffGUID );
		AddBuff( _ownerID , _transBuffGUID , 0 , -1 );--���ĦL�O
		DebugMsg( 0 , 0 , "----Lua_703146_Skill_HateMark : ��Ƭ����ĦL�O : ".._ownerID );
		return false;
	elseif ( CheckBuff( _ownerID , _transBuffGUID ) == true ) then
		return false;
	end

	return true;
end

function Lua_703146_Skill_ShatterMyEnemy()--�ɷ��ڼ�
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	local _transBuffGUID = 625554;--625554���ĦL�O	
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_ShatterMyEnemy : �ɷ��ڼ� :".._ownerID.."    : ".._targetID );
	CancelBuff_NoEvent( _targetID , _transBuffGUID );--����ˮ`��M�����ĦL�O
end
-----------------------------------------------------------------------END----------------Marloc

-------------------------------------------------------------------------------------------Kokar
function Lua_703146_Skill_Execution()--851882�B�H���D	--625545
	local _ownerID = OwnerID();--Kokar
	local _targetID = TargetID();--���`��
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_Execution : �B�H���D :".._ownerID.."    : ".._targetID );
	--�k�N�ˮ`�A�åB�M�������a���W�Ҧ���L�`�Fĳ�|�����ҬI�񪺭t���ĪG�]���ĦL�O�B���뤧�L�B���`�e��§���B�s��Į��^�A�I�񧹳o�ۤ����O���k0�C
	CancelBuff( _ownerID , 625550 );--625550�B�H���D�I��L�O
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	local _bossVOs = _gConsts._bossVOs;

	local _currentBuffs = nil;--table
	for _bossName , _bossVO in pairs( _bossVOs ) do--������L�`�Fĳ�|�����ҬI�񪺭t���ĪG
		_currentBuffs = _bossVO._debuffs;
		for _index , _buffGUID in pairs( _currentBuffs ) do
			CancelBuff( _targetID , _buffGUID );
		end
	end
	WriteRoleValue( _ownerID , EM_RoleValue_MP , 0 );--Kokar  SP�k0
	ScriptMessage( _ownerID , -1 , 2 , "[LUA_703146_AI_KOKAR_EXECUTION]" , 0 );--
end

function Lua_703146_Skill_BrutalHit()--851881�ݭh����	--625547	--���z�ˮ`�A�C�ˮ`�@�Ӫ��a�A�i�H���ĥd����o10��O�C
	local _ownerID = OwnerID();--Kokar
	local _targetID = TargetID();--���`��
	local _currentSP = ReadRoleValue( _ownerID , EM_RoleValue_MP );
	_currentSP = _currentSP + ReadRoleValue( _ownerID , EM_RoleValue_MaxMP )*0.1;
	WriteRoleValue( _ownerID , EM_RoleValue_MP , _currentSP );
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_BrutalHit : ".._ownerID.."    : ".._targetID.."  SP : ".._currentSP );
end

function Lua_703146_Skill_Amnesty()--851880�ݧԤ��x�եO	--625548�ݧԤ��x�եO
	--�p�G��Խd��75�X���S������ؼСA�h�|���w�H�����a�A�ñN��j��ʨ�ĥd�����e��A�P�ɩw��10��C
	local _ownerID = OwnerID();--Kokar
	local _targetID = TargetID();--���`��
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_Amnesty : �ݧԤ��x�եO : ".._ownerID.."    : ".._targetID );
	CancelBuff( _ownerID , 625551 );--625551�ݧԤ��x�եO�I��L�O
end
-------------------------------------------------------------------------------END---------Kokar

------------------------------------------------------------------------------------------Schulize
function Lua_703146_AI_CryingQueen_OnFight() --Schulize�i�J�԰�
	local _ownerID = OwnerID();
	DebugMsg( 0 , 0 , "----Lua_703146_AI_CryingQueen_OnFight : ".._ownerID );
	WriteRoleValue( _ownerID , EM_RoleValue_Register1 , 0 );--�~�˿W�B���ʦ��ƭp�� �C����3���|�I��u�s��Į��v
	AddBuff( _ownerID , 625552 , 0 , -1 );
	SetDefIdleMotion( _ownerID , ruFUSION_MIME_EMOTE_CRY );--��Schulize�w�]���_�ʧ@
end

function Lua_703146_Skill_WalkAlone() 
	--�µ��H�����a��m���h�A�|�b���ʨ�Ӧ�m���ᰱ�U�A�άO�}�l���ʤ���2���U�A�C����3���|�I��u�s��Į��v�C
	local _ownerID = OwnerID();--Schulize
	local _targetID = TargetID();--���`��
	DebugMsg( 0 , 0 , "----Lua_703146_Skill_WalkAlone : ".._ownerID );
		
	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 500 , true );--�X�j�j�M�d��
	local _targetList = Lua_703146_RandomFromList( _rangePlayerList , 1 );
	
	CallPlot( _ownerID , "Lua_703146_Skill_WalkAlone_Walker" , _ownerID , _targetID );
	return;
end

function Lua_703146_Skill_WalkAlone_Walker( _ownerID , _targetID ) 
	--���ʰʧ@
	local _targetID = _targetID or Lua_703146_RandomFromList( LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 500 , true ) , 1 )[ 1 ];

	if ( _targetID == nil ) then
		return;--�S���ؼдN���B�z   �H�K�]��_�Ǫ��a��h
	end

	DebugMsg( 0 , 0 , "----Lua_703146_Skill_WalkAlone_Walker : ".._ownerID.."  :  ".._targetID );	

	local _currentStep = ReadRoleValue( _ownerID , EM_RoleValue_Register1 );
	local x,y,z,dir = DW_Location( _targetID );
	--x = x + ( RandRange( 1 , 200 ) - 100 );
	--x = z + ( RandRange( 1 , 200 ) - 100 );
	
	local _waitMiniSec = Move( _ownerID , x,y,z );

	_currentStep = _currentStep + 1;
	WriteRoleValue( _ownerID , EM_RoleValue_Register1 , _currentStep );--�����B��

	local _stopOrNot = RandRange( 1 , 1000 );
 	if ( _stopOrNot < 500 ) then
		Sleep( RandRange( 20 , 30 ) );--2~3��ᰱ�U
		StopMove( _ownerID , false );--�פ��
	else
		Sleep( _waitMiniSec );--���ݲ���
		StopMove( _ownerID , true );--�פ��
	end

	if ( _currentStep >= 3 ) then--�C����3���|�I��u�s��Į��v�C
		CastSpell( _ownerID , _ownerID , 851875 );--�I��s��Į�
		Say( _ownerID , "[SC_112212_6]" );--�Į�
		_currentStep = 0;--�k�s
		WriteRoleValue( _ownerID , EM_RoleValue_Register1 , _currentStep );--�g�^0
		DebugMsg( 0 , 0 , "----Lua_703146_Skill_WalkAlone : ".."Schulize is crying so hard......" );
	else
		DebugMsg( 0 , 0 , "----Lua_703146_Skill_WalkAlone : ".."Schulize is still crying......" );
	end
	
	
	return;
end
------------------------------------------------------------------------------END---------Schulize

--function LUA_YOYO_RangePlayerNotGM_EX( CenterID , Range , DeathPreclude )
--function Lua_RandomPlayerFromHateList(BossID,HowMuch,AntiTank) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ

--------------------------------------------------------------------------------------------Tona
function Lua_703146_Skill_OrdinaryGreeting()--���`����§���I��
	DebugMsg( 0 , 0 , "--Lua_703146_Skill_OrdinaryGreeting" );
	local _ownerID = OwnerID();--Tona
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703146_AI_GlobalVars[ _roomID ];
	local _bossVOs = _gConsts._bossVOs;

	local _guestList = {};
	
	local _myEnemyNumber = HateListCount( _ownerID );
	local _currentGuests = Lua_RandomPlayerFromHateList( _ownerID , _myEnemyNumber , true );
	
	local _maxGreeting = 1;--�C���۩I���ؼмƶq�W��

	local _currentBossID = 0;
	local _tankExclude = false;
	local _myEnemyNumber = 0;
	local _currentGuests = nil;
	for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬd�Ҧ�Boss������C��
		_currentBossID = _bossVO._id;
		_tankExclude = ( _currentBossID == _bossVOs._Marloc._id or _currentBossID == _bossVOs._Kokar._id );--�ư������J�M�ĥd�����Z
		_myEnemyNumber = HateListCount( _currentBossID );--�T�{�ؼЪ��Q���H��
		_currentGuests = Lua_RandomPlayerFromHateList( _currentBossID , _myEnemyNumber , _tankExclude );--�T�{�Q���M��
		_guestList = Lua_703146_TableMerge( _guestList , _currentGuests , 1 );--�X�� �� �ư����Ƥ��e
	end

	_currentGuests = Lua_703146_RandomFromList( _guestList , _maxGreeting );--

	for _index , _playerID in pairs( _currentGuests ) do
		--���`����§��
		--�|���ŧi�A����3��{�{��Ӫ��a�����䵹���ˮ`�A�P����w��H����10��A�����ᵹ�����`�e��§���C
		AddBuff( _playerID , 625517 , 0 , -1 );--���`����§���аO
		ScriptMessage( _ownerID , _playerID , 2 , "[LUA_703146_AI_TONA_GREETING]" , 0 );--�y��A���ǥ��ǳƩ۫ݱz......
		CallPlot( _ownerID , "Lua_703146_Skill_OrdinaryTreating" , _ownerID , _playerID );	
		break;
	end

end

function Lua_703146_Skill_OrdinaryTreating( _ownerID , _targetID )--���`����§��
	--�{�{��Ӫ��a�����䵹���ˮ`�A�P����w��H����10��A�����ᵹ�����`�e��§���C
	Sleep( 30 );
	DebugMsg( 0 , 0 , "--Lua_703146_Skill_OrdinaryTreating : ".._ownerID.."  : ".._targetID );
	CancelBuff( _targetID , 625517 );--���`����§���аO
	CastSpell( _ownerID , _targetID , 851883 );--���`����§��
	AddBuff( _ownerID , 623363 , 0 , 10 );--���`����§���]���Y����^
	SetAttack( _ownerID , _targetID );--��w�Q��
	WriteRoleValue( _ownerID , EM_RoleValue_Register1 , _targetID );--�������ݥؼ�
	return;
end

function Lua_703146_Skill_OrdinaryFarewell()
	local _ownerID = OwnerID();--Tona
	local _targetID = ReadRoleValue( _ownerID , EM_RoleValue_Register1 );--���ݮɬ������ؼ�
	SysCastSpellLv( _ownerID , _targetID , 851756 , 0 );--���`�e��§���]����DOT�^
	DebugMsg( 0 , 0 , "--Lua_703146_Skill_OrdinaryFarewell : ".._targetID.." Bye ~" );
	WriteRoleValue( _ownerID , EM_RoleValue_Register1 , 0 );--�M�����ݥؼ�
end
---------------------------------------------------------------------END------------------Tona

---------------------------------------------------------------------------------------------public functions
function Lua_703146_TableMerge( _oriTable , _extTable , _duplicateCheck )
	--_duplicateCheck = 0 : ���B�z   , = 1 : �ư����Ƥ��e( �^��index�� )    = 2 : �ư����Ƥ��e( �^��hash�� ) 	--�u��B�z²���ƫ��O String Number
	_duplicateCheck = _duplicateCheck or 0;

	--�ư����Ƥ��e
	if ( _duplicateCheck ~= 0 ) then
		local _mergedList = {};--�X�ֲM��
		for _index , _content in pairs( _oriTable ) do--�˵���M�椺�e
			_mergedList[ _content ] = _content;
		end

		for _index , _content in pairs( _extTable ) do--�˵��s�M�椺�e
			_mergedList[ _content ] = _content;--�ۦP�����e�|�Q�мg
		end

		if ( _duplicateCheck == 1 ) then--�^��index��
			local _result = {};
			for _index , _content in pairs( _mergedList ) do--��z�X�ֲM�椺�e
				table.insert( _result , _content );--
			end
			return _result;
		end

		return _mergedList;--�^��hash��
	end

	--�������Ʊư�
	for _index , _content in pairs( _extTable ) do
		table.insert( _oriTable , _content );
	end
	return _oriTable;
end

function Lua_703146_RandomFromList( _table , _maxNumber )
	_maxNumber = _maxNumber or #_table;

	if _maxNumber < #_table then
		local _targetList = {};
		local _randomIndex = 0;
		for _i = 1, _maxNumber , 1 do
			_randomIndex = RandRange( 1 , #_table );
			table.insert( _targetList , _table[ _randomIndex ] );
		end

		return _targetList;
	else
		return _table
	end

end