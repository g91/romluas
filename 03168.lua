--Author : K.J. Aris
--Version : 140528
--Ignitor : NPC 109085
--Script : 703168

local _Lua_703168_AI_GlobalVars = nil;

function Lua_703168_AI_Init( _inputCtrID )--controller  NPC 109197 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703168_AI_Init : NPC 109197       Z28  V 140728 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --�H�����ư��� �N�즳����R��

	--basics
	local _ctrlID = _inputCtrID or OwnerID() or 0;--109085
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108814
	
	--[[
	--this NPC is using as a controller
	SetModeEx( _ctrlID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _ctrlID , EM_SetModeType_HideName , false );	--����ܦW��
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG
	]]--


	-------------------------------------------initialize settings
	local _zoneID = ReadRoleValue( _ctrlID , EM_RoleValue_ZoneID );

	local _difficulty = 1;
	local _frenzyCD = 480;--�g�ɰѼ�

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
	----------------------------END----------�g�ɰѼ�
	--�Ш������׶��ǩ�m
	--local _bossXestonGUIDs = { 109196 , 109196 , 109196 };--������Remix

	--�ѼƳ]�w��
	if ( _Lua_703168_AI_GlobalVars == nil ) then _Lua_703168_AI_GlobalVars = {}; end
	_Lua_703168_AI_GlobalVars[ _roomID ] = {	--non 
					_bossID = 0 ,--�H_Schulize���N��( ����L�禡�n�� _bossID)

					_bossVOs = {
						_Xeston = {
							_id = _ctrlID ,					--ID
							_guid = ReadRoleValue( _ctrlID , EM_RoleValue_OrgID ) , --_bossXestonGUIDs[ _difficulty ] ,		--GUID
							--_flagPos = 1 , 					--�X�Ц�m

							--_defaultIdle = nil;--ruFUSION_MIME_EMOTE_STRETCH;--�w�]�ʧ@
							IndiSpec = nil ,	--function�ӧO���S��y�{

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

					_ctrlGUID = 108705 ,--���ID
					_doorGUID = 106251 , 

					_flagGUID = 781429 , --781424 Z34_7���κX��

					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					--CDs
					ranATK=7,      --�H���I��Gsingle or triple tap
					aeDot=11,     --AE+DOT
					collectSoul=17,    --�l���F��
					fatal=20,	--�j��
					container=7,	--�e���z
					bell_move=10,

					_soulContainerList = nil,

					};
	--��Ū��T
	local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];

	--���� Boss
	--[[
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703168_GenerateBoss( _bossVO , _roomID , x,y,z,dir );
		_gConsts._bossVOs[_bossName]._id = _bossID;--
	end
	]]--

	_gConsts._bossID = _ctrlID;--_gConsts._bossVOs._Xeston._id;--presiding Boss --Xeston
	--Lua_703168_BossIndividualsSetting( _gConsts );

	--���ͫ��
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


function Lua_703168_AI_onFight()--���h������ �u��b�䤤�@�����W  �ҪO�г]"�s��"
	--�԰���l
	local _bossID = OwnerID();--_Xeston
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703168_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703168_AI_GlobalVars == nil ) then Lua_703168_AI_reignite( _roomID ); return; end

	Cl_Resist_HackersFightBegin()	--���b�Ⱦ���_�԰��}�l_BICO

	local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then Lua_703168_AI_reignite( _roomID ); return; end

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--��W�@���`��������٦b�@�ʮɫh���ʧ@  (����_Schulize���ͮɭ���Ĳ�o�԰�)
		DebugMsg( 0 , _roomID , "--Combat Sequence Duplicated : New Sequence Rejected !!" );--presiding boss may revived or rejoin the fight while combat is not over yet
		return;
	end
	--����P�l������
	local _ctrlID , _AddParasite , _RemoveParasites = Lua_703168_ExtendObjectClosure( _bossID );

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
	local _gConsts = _Lua_703168_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703168_AddDoor( _gConsts._doorGUID , 178.2 , 3539.1 , 1346.9 , 260 , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703168_AI_Engage" , 0 );--�Ұʾ԰��y�{

	ScriptMessage(_bossID,0,2,"[Lua_703168_AI_OnFight]",0);

	lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_START]",0);--�A���I�W�H��ݰ_�A�o�Ǭݦ��L�`���o����֩w���۵L�k�Q�����O�q�I

end--function Lua_703168_AI_onFight()

function Lua_703168_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
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
		ranATK = _gConsts.ranATK ,      --�H���I��Gsingle or triple tap
		aeDot = _gConsts.aeDot ,     --AE+DOT
		collectSoul = _gConsts.collectSoul ,    --�l���F��
		fatal = _gConsts.fatal ,	--�j��
		container = _gConsts.container ,	--�e���z
		bell_move = _gConsts.bell_move ,
		}

	--local _alivePlayers = 0;

		--�ƨ禡
				------------------------------------------------------------------------------
					local function rand_pick( _InputList ,  _InputNum )--�H���D��num�W���a
						local playertable={};--index�̧�value���aGUID
						local n = _InputNum;
						if( n >= #_InputList ) then n = #_InputList +1; end
						for i=1, n ,1 do
							table.insert( playertable , _InputList[ DW_Rand(#_InputList) ] );
							--DebugMsg( 0 , 0 , "�D�F "..i.." ��" );
						end
						
						return playertable;
					end

					local function rand_pick_FromZero( _InputList ,  _InputNum )--�H���D��num�W���a  --Table Index ��0�}�l
						local _maxLength = 0;
						local _tempList ={};
						for _qq = 0 , #_InputList , 1 do --�T�{��0�}�l��TABLE������  �ëإߥ�1�}�l��TABLE (�H��K����Τ@�ާ@)
							if( _InputList[ _qq ] == -1 ) then break; end
							_maxLength = _maxLength + 1;
							table.insert( _tempList , _InputList[ _qq ] );
						end

						_tempList = KJ_28BOSS3_SC_Hash_Shuffle( _tempList );--�إ�HASH��

						local _currentEfficaciousTargetList = {};--index�̧�value���aGUID
						local n = _InputNum;
						local _currentTargetID = 0;
						if( n >= _maxLength ) then n = _maxLength; end
						for i=1, n ,1 do
							--_currentTargetID = _InputList[ RandRange( 0 , _maxLength ) ];
							_currentTargetID = _tempList[ i ];
							table.insert( _currentEfficaciousTargetList , _currentTargetID );--DW_Rand
							--DebugMsg( 0 , 0 , "�D�F "..i.." �� --".._currentTargetID );
						end
						
						return _currentEfficaciousTargetList;
					end
				---------------------------------------------------------------------------
	------------�F��e��
	local _targetList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 500 , true );--�̦h3���F��e��
	local _maxSoulContainer = #_targetList;

	if ( #_targetList > 3 ) then
		_maxSoulContainer = 3;
	end
	
	_gConsts._soulContainerList = {};
	for i=1,_maxSoulContainer,1 do
		local _containerID = Lua_703168_CreateSingleSoulContainer( _bossID );
		table.insert( _gConsts._soulContainerList , _containerID );
		DebugMsg(0,0,"�F��e�� "..i.." ���͡I")
	end
	------------�F��e��



	local _currentBossID = 0;
	local _currentCollectedSoul = 0; --�ثeBOSS�һ`�����F��H��
	local _currentPlayerSoul = 0;--�ثe�Ҧ����a���W���F��H��
	DebugMsg( 0 , 0 , "--Start loop" );
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
				]]--
			end
		end
		
		--DebugMsg(0,0,"--_allBossAreDead : "..tostring(_allBossAreDead).."   --_engaging : "..tostring(_engaging) );
		if ( _allBossAreDead == true ) then-- boss �������`�� �D�Ԧ��\
			DebugMsg( 0 , _roomID , "------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703168_AI_Conquered( _roomID , _gConsts );
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			--[[
			local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 300 , true );--�T�{�P�D�s�����a  --�]��Schulize������
			if ( #_rangePlayers <= 0 ) then
				DebugMsg( 0 , _roomID , "--all players are gone , quit fighting "..tostring(_engaging) );
				--Lua_703168_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
				Lua_703168_AI_Reset( _roomID );
				break;
			end
			]]--
			Lua_703168_AI_Reset( _roomID );
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
					AddBuff( _currentBossID , 624344 , 0 , -1 );-- 625849 ����
				end
				DebugMsg( 0 , _roomID , "-----�g�g��----" );
				--ScriptMessage(_bossID,0,2,"[SC_28IN_BOSS3_FURY]",0);

				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_FURY]",0);--[107966]�P����_�ު��C��A�}�l���J�Y�غƨg���A�I
		end		
	

		----���F��e�������� �NBOSS ���W���|�[�ĪG���� 140225
		local _allContainersAreGone = true;
		local _containersRemain = 0;
		for _index , _SCID in pairs( _gConsts._soulContainerList ) do
			if _SCID ~= nil and CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 0 then
				_allContainersAreGone = false;
				_containersRemain = _containersRemain + 1;
			end
		end

		if ( _allContainersAreGone ) then
			CancelBuff( _bossID , 624817 );--���F��e�������� �NBOSS ���W���|�[�ĪG���� 140225
			_CD.collectSoul = _gConsts.collectSoul;--��������  �N���`���F��
		end

		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 


			--�F��e���t���ˮ`(Per 7 sec)
			if( _CD.container == 0 )then
				for _qq , _SCID in pairs( _gConsts._soulContainerList ) do
					if CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 0 then
						SysCastSpellLv( _SCID , _SCID , 851164 , 0 );--�F��e���t���ˮ` + DOT
						DebugMsg( 0 , 0 , _SCID.."  �F��e���t���ˮ` + DOT " );
					end
				end
				_CD.container = _gConsts.container;
			end
			----------------------------------END----------�F��e���t���ˮ`(Per 7 sec)

			--�t�����ͦ@��(per 20 sec)
			if( _CD.fatal <= 0 )then
				--�C20��b���a���W�[�@��"�F��H��"��DEBUFF
				--DebugMsg( 0 , 0 , boss.."  ���n�T�_��~~Boss��F�` " );
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_PER20]",0);--[107966]�u�N���v�F�@�n

				------------------------boss actions
				PlayMotion( _bossID , ruFUSION_ACTORSTATE_BUFF_SP01 );

				--SetModeEx( _bossID , EM_SetModeType_Searchenemy , false );--�j��
				--SetModeEx( _bossID , EM_SetModeType_Strikback , false );--����
				--DW_UnFight(boss,false);
				sleep( 20 );
				_clock = _clock + 2;
				--DW_UnFight(boss,true);
				--SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );--�j��
				--SetModeEx( _bossID , EM_SetModeType_Strikback , true );--����

				AddBuff( _bossID , 624802 , 0 , -1 );--�C���W�jATK�BMATK�BDEF�BMDEF 5%
				--DebugMsg( 0 , 0 , "Boss Increse Level-------"..KJ_28BOSS3_CheckTargetBuffLevel( boss , 624802 ) );
				------------------------boss actions

				------------------------------soul containers actions
				--for _qq , _SCID in pairs( KJ_28BOSS3_soulContainerList[room] ) do
				local _soulSaturation = false;
				--for _qq = _maxSoulContainer , 1 , -1 do
				local _alivePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 500 , true );--�̦h3���F��e��
				for _index , _SCID in pairs( _gConsts._soulContainerList ) do
					DebugMsg( 0 , 0 , "  �F��e�� : ".._SCID );

					if( _SCID ~= nil and CheckID(_SCID) and ReadRoleValue(_SCID,EM_RoleValue_IsDead) == 0 )then--���F��e���|�s�ɤ~�@��
						for i , player in pairs( _alivePlayerList ) do
							if( GetDistance( _SCID , player ) <= 75 ) then
								SysCastSpellLv( player , _SCID , 851169 , 1 );--�S��
								--AddBuff( _SCID , 624779 , 0 , -1 );
							end
						end

						if( KJ_28BOSS3_CheckTargetBuffLevel( _SCID , 624779 ) >= 5 )then
							CancelBuff_NoEvent( _SCID , 624779 );
							_soulSaturation = true;
						end
						DebugMsg( 0 , 0 , _SCID.."  �F��e���l���ͩR " );
					else
						------------------------------�F��e������
						DebugMsg( 0 , 0 , _index.."  �F��e������ " );
						_gConsts._soulContainerList[ _index ] = Lua_703168_CreateSingleSoulContainer( _bossID );
						------------------------------�F��e������
					end
					
				end
				------------------------------soul containers actions

				------------------------players
				--�b���a���W�[�W�F��H��BUFF
				for _Index,_ID in pairs( _alivePlayerList ) do
					if( ReadRoleValue( _ID , EM_RoleValue_IsDead ) == 0 )then--�����~����BUFF   --�קK�ɶ��t  �A���@���ˬd
						AddBuff(  _ID , 624774 , 0 , -1);--�t���A�G
						AddBuff(  _ID , 624758 , 0 , -1);--�F��H��BUFF
						_currentPlayerSoul = _currentPlayerSoul + 1;
					end
				end
				------------------------players

				if ( _soulSaturation == true ) then--���F��e�����M�� �I�� ����A�G
					lua_28in_Boss5_broadcast( 2 , "[SC_28IN_BOSS3_LV5]" , C_Red );--[107966]�q�������M���F��e���̱o��A�G�J�I�̪���q
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
			end--end --�t�����ͦ@��(per 20 sec)




			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��
			
			--[[
			for _bossName , _cdTime in pairs( _CD ) do--Boss����	�@�s����
				if ( _cdTime == 0 ) then
					_gConsts._bossVOs[_bossName]._id = Lua_703168_GenerateBoss( _bossVOs[_bossName] , _roomID );--���͹�����BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703168_AI_HasRevived]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--���ͭ˼ƴ���	�C10��
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
			---------------------------------�H�������ۦ�
			if( _CD.ranATK == 0 )then
				-----------actions
				--DebugMsg( 0 , 0 , boss.."  ���H�� !! " );
				local _alivePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 500 , true );
				if RandRange( 1 , 2 ) == 1 then --random ���
					CallPlot( _bossID , "KJ_28BOSS3_SingleTap" , 851144 , rand_pick_FromZero( _alivePlayerList , 1 ) );--�H�����@
				else			
					DebugMsg( 0 , 0 , _bossID.."  ���H�� !! " );									
					--CallPlot( boss , "KJ_28BOSS3_TripleTap" , 851144 , rand_pick_FromZero( _alivePlayerList , 3 ) );--�H�����T
					CastSpell( _bossID , _bossID , 851281 );
				end
				-----------actions

				GCD = 2;
				_CD.ranATK = _gConsts.ranATK;
				break;
			end
			---------------------END--------�H�������ۦ�


			--------------------------------aeDot
			if ( _CD.aeDot == 0 ) then

				-----------actions
				CastSpell(  _bossID , _bossID , 851140 ) ;--AE+DOT�A�A�G�A����ɶ�8��
				Sleep( 20 );
				--_clock = _clock + 2;
				--ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP
				--DebugMsg( 0 , 0 , boss.."  AE+DOT�A�A�G�A����ɶ�8�� " );
				-----------actions
				GCD = 5;
				_CD.aeDot = _gConsts.aeDot;
				break;
			end
			-----------------------END------aeDot



			--------------------------------�`���F��H��
			if ( _CD.collectSoul == 0 ) then
				-----------actions
				--PlayMotion( boss , ruFUSION_ACTORSTATE_CAST_SP01 );
				--DebugMsg( 0 , 0 , boss.."  �`���F��H�� " );
				--SetModeEx( _bossID , EM_SetModeType_Searchenemy , false );--�j��
				--SetModeEx( _bossID , EM_SetModeType_Strikback , false );--����
				sleep(20);
				MagicInterrupt( _bossID );
				sleep(20);
				CastSpell(  _bossID , _bossID , 851162 ) ;
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_GAINSOUL]",0);--[107966]�ʰ�[108119]���O�q�A�F��Q�Z�ʪ��A�P�췥�׵h�W�I

				--DW_UnFight(boss,false);
				sleep( 30 );
				_clock = _clock + 5;
				--DW_UnFight(boss,true);
				--SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );--�j��
				--SetModeEx( _bossID , EM_SetModeType_Strikback , true );--����
				-----------actions
				
				-----------Players actions
				local _alivePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 500 , true );
				for _Index , _ID in pairs( _alivePlayerList ) do
					if ( ReadRoleValue( _ID , EM_RoleValue_IsDead ) == 0 ) then--�����~����BUFF  --�קK�ɶ��t  �A���@���ˬd
						local _buffLevel = KJ_28BOSS3_CheckTargetBuffLevel( _ID , 624758 ) - 1;--�������a���W�F��H���ƶq--624758�F��H��
						
						DebugMsg( 0 , 0 , " Soul Fragments : "..tostring( _buffLevel ) );
						--Say( _ID , "my soul has been taken !!"  );
						for _qq , _SCID in pairs( _gConsts._soulContainerList ) do
							if( ReadRoleValue( _SCID , EM_RoleValue_IsDead ) ~= 1 ) then--�������e���簣
								--for i = 1 , _buffLevel , 1 do
								if ( _buffLevel > -1 ) then
									SysCastSpellLv( _ID , _SCID , 851163 , 0 );--�����F��H���Q�l���S��
									AddBuff( _SCID , 624803 , _buffLevel , -1 );--624803�F��A_�e��   --�⪱�a���F��h���|�W�h
									AddBuff( _bossID , 624817 , _buffLevel , -1 );--624817�F��A_Xeston  --��e�����F��h���|�W�h
									AddBuff( _bossID , 624757 , 0 , -1 );--�^���
								end
								--end
							end
							--DebugMsg( 0 , 0 , _ID.."  �`���F��H���l���S�� ".._SCID );
--							if( ReadRoleValue( _SCID , EM_RoleValue_IsDead ) == 0 ) then--���K�N�w�����e���簣
--								table.remove( KJ_28BOSS3_soulContainerList[room] , _qq );
--							end
						end

						CancelBuff_NoEvent(  _ID , 624758 );--�F��H��BUFF  --�Q�l�� --�����H��BUFF
						
					end
				end

				_currentCollectedSoul = _currentCollectedSoul + _currentPlayerSoul;--�`�����a�F��	
				--Say( boss , "I have ".._currentCollectedSoul.." souls , ".._currentPlayerSoul.." more !!" );								
				_currentPlayerSoul = 0;--�Q�`�����k�s
				-----------Players actions

				GCD = 7;--�`�NGCD����(dead lock)
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

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���
	--ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703168_AI_Reset]",0);
	lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_FAIL]",0);--[107966]��ڳ�ڪ��A���G�b���g�A�j�j�F������A�@�ƫD�`���N���ҼˡC

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
	
	--_Lua_703168_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	local x,y,z,dir = _bossVOs._Xeston._oriX , _bossVOs._Xeston._oriY , _bossVOs._Xeston._oriZ , _bossVOs._Xeston._oriDir;
	for _bossName , _bossVO in pairs( _bossVOs ) do--�}�Ҿ԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703168_GenerateBoss( _bossVO , _roomID , x,y,z,dir );--���͹�����BOSS
	end
	_gConsts._bossID = _gConsts._bossVOs._Xeston._id;--presiding Boss --Xeston
	--Lua_703168_BossIndividualsSetting( _gConsts );
	--SetDefIdleMotion( _gConsts._bossVOs._Schulize._id , ruFUSION_MIME_EMOTE_CRY );--��Schulize��

end--function Lua_703168_AI_Reset( _roomID )

function Lua_703168_AI_Conquered( _roomID , _gConsts )
	DebugMsg( 0 , 0 , "--Lua_703168_AI_Conquered : ".._roomID);
	--if ( _gConsts == nil ) then DebugMsg( 0 , 0 , "--Lua_703168_AI_Conquered : Encounter nil"); return; end
	local _gConsts = _gConsts or _Lua_703168_AI_GlobalVars[ _roomID ];--for read
	DebugMsg( 0 , 0 , "--Lua_703168_AI_Conquered : "..tostring( _gConsts ) );	

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���

	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����

	--ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703168_AI_Conquered]",0);	
	lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS3_END]",0);--[107966]�ˤU��A����Y�ҥ������A�~���������A�A���F��w���k��@�B�A�驻����Ƴ������o��

	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs(); end	--clear all extend items
	_Lua_703168_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	sasa_ZoneDungeon_title_01(530927)
--	���b�Ѱ�
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
	for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬdBoss���S���q�q���۶ø�
		_currentBossID = _bossVO._id;
		if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 and _currentBossID ~= _ownerID ) then--�����@BOSS�s���� �N���٥�����
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
function Lua_703168_AddDoor( _doorGUID , x,y,z,dir , _roomID )--�bZ32~Z34�Τ@
	--DebugMsg(0,0,"--Lua_703168_AddDoor  ".._flagPos.." : ".._roomID.." : ".._doorGUID );
	--local _doorID = CreateObjByFlag( _doorGUID , _flagGUID , _flagPos , 1 );
	local _doorID = CreateObj( _doorGUID , x,y,z,dir , 1 );
	SetModeEx( _doorID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _doorID , EM_SetModeType_HideName , true );	--����ܦW��
	SetModeEx( _doorID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _doorID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _doorID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _doorID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _doorID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _doorID , EM_SetModeType_Obstruct , true );	--�����׮ĪG
	SetRoleCampID( _doorID , 1 );--�קK���Q����
	LockHP( _doorID , 100 , "" );--�קK���Q����
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

	SetModeEx( _ctrlID , EM_SetModeType_HideName , true );	--��ܦW��
	SetModeEx( _ctrlID , EM_SetModeType_NotShowHPMP , false );	--��ܦ��
	SetModeEx( _ctrlID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _ctrlID , EM_SetModeType_Move , false );		--����
	SetModeEx( _ctrlID , EM_SetModeType_Fight , false );	--����
	SetModeEx( _ctrlID , EM_SetModeType_Searchenemy , false );	--����
	SetModeEx( _ctrlID , EM_SetModeType_Obstruct , false );	--�����׮ĪG
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

		local _objectID = _fellowsGUIDs[ _difficulty ];--�F��e��

		local _targetList = Lua_RandomPlayerFromHateList( _InputReferenceTargetID , 1 , false );--(BossID,HowMuch,AntiTank) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ
		local _targetID = _targetList[ 1 ];
		local x,y,z,dir = DW_Location( _targetID );
		DebugMsg(0,0,"_targetID=".._targetID);

		--local _currentMonster = CreateObj(  _objectID , x , y , z , dir , 1 );
		local _currentMonster = _gConsts.ExtObj( _objectID , x , y , z , dir );

		SetModeEx( _currentMonster , EM_SetModeType_Searchenemy , false );--�j��
		SetModeEx( _currentMonster , EM_SetModeType_Strikback , false );--����
		MoveToFlagEnabled( _currentMonster , false );--�������޲���	

		--AddToPartition( _currentMonster , _roomID );
		AddBuff( _currentMonster , 505653 , 0 , -1 );--505653���^��
		--CallPlot( _currentMonster ,"KJ_28BOSS3_tokenRULE", _InputReferenceTargetID );--auto destroy

		return _currentMonster;
	end


------------------------------------------------------------------------------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y


---------------------------------------------------------------------END------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y





------------------------------------------------------------------------------------------�H�U�O�ޯ�
--107966