--Author : K.J. Aris
--Version : 140528
--Ignitor : NPC 109087
--Script : 703178

local _Lua_703178_AI_GlobalVars = nil;

function Lua_703178_AI_Init( _inputCtrID )--controller  NPC 109087 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703178_AI_Init : NPC 109087       Z34  V 140528 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --�H�����ư��� �N�즳����R��

	--basics
	local _ctrlID = _inputCtrID or OwnerID() or 0;--109087
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
	local _bossUniwillGUIDs = { 109018 , 109018 , 109018 };--�j�s�N��

	--local _treasureBoxGUIDs = { 108832 , 108833 , 108834 };--ĳ�|�p�ë~

	--�ѼƳ]�w��
	if ( _Lua_703178_AI_GlobalVars == nil ) then _Lua_703178_AI_GlobalVars = {}; end
	_Lua_703178_AI_GlobalVars[ _roomID ] = {	--non 
					_bossID = 0 ,--�H_Schulize���N��( ����L�禡�n�� _bossID)

					_bossVOs = {
						_Uniwill = {
							_id = 0 ,					--ID
							_guid = _bossUniwillGUIDs[ _difficulty ] ,		--GUID
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
					_cloneGUID = 108899 , --��Z��NPC

					_flagGUID = 781426 , --781426 Z34_4���κX��

					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,
					_corruptionMucusFlagPos = 4 , --�G���H�G ��m

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					_bossPowerUpCD = 10 ,--�j��BUFFCD

					--squads
					_squads = nil ,
					CreateSquad = nil ,

					};
	--��Ū��T
	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];

	--���� Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703178_GenerateBoss( _bossVO , _roomID );
		_gConsts._bossVOs[_bossName]._id = _bossID;--
	end
	_gConsts._bossID = _gConsts._bossVOs._Uniwill._id;--presiding Boss --Uniwill
	--Lua_703178_BossIndividualsSetting( _gConsts );

	--���ͫ��
	_gConsts._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	--�]�m���� 
	Lua_DavisDelObj( 109142 );
	local _corruptionMucusID = CreateObjByFlag( 109142 , _gConsts._flagGUID , _gConsts._corruptionMucusFlagPos , 1 );--�G���H�G
	AddToPartition( _corruptionMucusID , _roomID ); 

	--delete trigger
	DelObj( _ctrlID );
		
	return _roomID;
end--function Lua_703178_AI_Init( _inputCtrID )

function Lua_703178_GenerateBoss( _bossVO , _roomID )
	Lua_DavisDelObj( _bossVO._guid );
	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];
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
end--function Lua_703178_GenerateBoss( _bossVO )

function Lua_703178_ClearAll( _specRoomID )--for test
	if ( _Lua_703178_AI_GlobalVars ~= nil ) then
		DebugMsg( 0 , 0 , "--Lua_703178_ClearAll : all values will be cleared , reinit this by redeploying NPC 109087" );--
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
			local _valuePack = _Lua_703178_AI_GlobalVars[ _specRoomID ];
			if ( _valuePack ~= nil ) then
				ClearData( _valuePack );
			end
			_Lua_703178_AI_GlobalVars[ _specRoomID ] = nil;
			return;
		end

		for _roomID , _valuePack in pairs( _Lua_703178_AI_GlobalVars ) do
			ClearData( _valuePack );
			_Lua_703178_AI_GlobalVars[ _roomID ] = nil;
		end
	end

	Lua_703189_ClearAll( _specRoomID );--�M���p��
end--function Lua_703178_ClearAll()

function Lua_703178_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703178_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703178_ClearAll( _roomID );
	Lua_703178_AI_Init();
end


function Lua_703178_AI_onFight()--���h������ �u��b�䤤�@�����W  �ҪO�г]"�s��"
	--�԰���l
	local _bossID = OwnerID();--_Uniwill
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703178_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703178_AI_GlobalVars == nil ) then Lua_703178_AI_reignite( _roomID ); return; end

	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then Lua_703178_AI_reignite( _roomID ); return; end

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--��W�@���`��������٦b�@�ʮɫh���ʧ@  (����_Schulize���ͮɭ���Ĳ�o�԰�)
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
	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	--squads
	local _squads , CreateSquad = Lua_703189_SquadCreater( _bossID );
	_gConsts._squads = _squads;
	_gConsts.CreateSquad = CreateSquad;

	--men counter
	WriteRoleValue( _bossID , EM_RoleValue_Register10 , 0 );--�������W�p�Ǽƶq

	BeginPlot( _ctrlID , "Lua_703178_AI_Engage" , 0 );--�Ұʾ԰��y�{

	ScriptMessage(_bossID,0,2,"[Lua_703178_AI_OnFight]",0);

end--function Lua_703178_AI_onFight()

function Lua_703178_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
	DebugMsg( 0 , _roomID , "--Lua_703178_AI_Engage" );
	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];
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
		_bossPowerUpCD = _gConsts._bossPowerUpCD;	
		}

	--local _alivePlayers = 0;
	local _currentBossID = 0;

	DebugMsg( 0 , 0 , "--Start loop" );

	-----------------------------------------���q�ഫ
	local _bossHpRatio = 0;
	local _phaseTransformPeriodRatio = 0.3;--HP�C�l��30%�ഫ���q
	local _hpStepping = 1.0 - _phaseTransformPeriodRatio;--�U�@���q�ഫ���
	----------------------------END----------���q�ഫ

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
			Lua_703178_AI_Conquered( _roomID );
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			--[[
			local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 300 , true );--�T�{�P�D�s�����a  --�]��Schulize������
			if ( #_rangePlayers <= 0 ) then
				DebugMsg( 0 , _roomID , "--all players are gone , quit fighting "..tostring(_engaging) );
				--Lua_703178_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
				Lua_703178_AI_Reset( _roomID );
				break;
			end
			]]--
			Lua_703178_AI_Reset( _roomID );
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
				ScriptMessage(_bossID,0,2,"[Lua_703178_AI_Frenzy]",0);
		end		
	
		-----------------------------------------------�԰����q�ഫ
		_bossHpRatio = ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP );--HP ratio
		if ( _bossHpRatio <= _hpStepping ) then--����W�L50%Ĳ�o
			if ( _hpStepping > 0 ) then
				_hpStepping = _hpStepping - _phaseTransformPeriodRatio;--next transform ratio

				AddBuff( _bossID , 625996 , 0 , -1 );--�[�W�Ӷ��q��BUFF  --625996�ĤG���q�аO(�I��k�N�|�{�o�ӼаO)

				DebugMsg( 0 , 0 , "Switch to Phase : 2" );
			end
		end
		-------------------------------------END-----�԰����q�ഫ




		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 

			if( _CD._bossPowerUpCD <= 0 )then
				AddBuff( _bossID , 625991 , 0 , -1 );--625991�N�Ӫ@��
				DebugMsg( 0 , 0 , "--Boss Power Up !!" );
				_CD._bossPowerUpCD = _gConsts._bossPowerUpCD;
				--_GCD = 2;
			end

			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��
			
			--[[
			for _bossName , _cdTime in pairs( _CD ) do--Boss����	�@�s����
				if ( _cdTime == 0 ) then
					_gConsts._bossVOs[_bossName]._id = Lua_703178_GenerateBoss( _bossVOs[_bossName] , _roomID );--���͹�����BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703178_AI_HasRevived]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--���ͭ˼ƴ���	�C10��
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703178_AI_WillReviveIn10sec]" , 0 );
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
end--function Lua_703178_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703178_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703178_AI_Reset" );

	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];
	
	local _bossVOs = _gConsts._bossVOs;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���
	ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703178_AI_Reset]",0);

	Delobj( _frontDoorID );	--�R���e��
	_gConsts.DelExtObjs();--clear all extend items
	Lua_703189_ClearAll( _roomID );--�M���p��

	Sleep( 10 );
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--�����԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , true );
		DetachObj( _bossID );
		DelObj( _bossID );
	end
	Sleep( 10 );
	
	--_Lua_703178_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	for _bossName , _bossVO in pairs( _bossVOs ) do--�}�Ҿ԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703178_GenerateBoss( _bossVO , _roomID );--���͹�����BOSS
	end
	_gConsts._bossID = _gConsts._bossVOs._Uniwill._id;--presiding Boss --Uniwill
	--Lua_703178_BossIndividualsSetting( _gConsts );
	--SetDefIdleMotion( _gConsts._bossVOs._Schulize._id , ruFUSION_MIME_EMOTE_CRY );--��Schulize��

end--function Lua_703178_AI_Reset( _roomID )

function Lua_703178_AI_Conquered( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703178_AI_Conquered" );
	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];--for read
	
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���

	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����
	Lua_703189_ClearAll( _roomID );--�M���p��

	ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703178_AI_Conquered]",0);	
	
	DetachObj( _gConsts._bossID );
	--[[
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
	]]--

	_gConsts.DelExtObjs();	--clear all extend items
	_Lua_703178_AI_GlobalVars[ _roomID ] = nil;	--clear all values
end--function Lua_703178_AI_Conquered( _roomID )

function Lua_703178_AI_Dead()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];

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
	DebugMsg( 0 , 0 , "--Lua_703178_AI_Dead : "..tostring( _allBossAreDead ) );

	if ( _allBossAreDead ) then
		Lua_703178_AI_Conquered( _roomID );
	end

	return true;
end
-----------------------------------sub functions

--���� --�G���H�G
function Lua_703178_Scene_Mucus_Init()
	DebugMsg( 0 , 0 , "--Lua_703178_Scene_Mucus_Init" );
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_Mark , true );	--���i�I��
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--����ܦW��
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--����ܦ��
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _ownerID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _ownerID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--�����׮ĪG

	CallPlot( _ownerID , "Lua_703178_Scene_Mucus_Loop" , _ownerID );
	
end

--�����H�G
function Lua_703178_Scene_Mucus_Loop( _ownerID )
	DebugMsg( 0 , 0 , "--Lua_703178_Scene_Mucus_Loop" );
	while true do
		--DebugMsg( 0 , 0 , "--Lua_703178_Scene_Mucus_Loop--Sticky" );
		SysCastSpellLv( _ownerID , _ownerID , 852049 , 0 );--852049�G���H�G
		Sleep(10);
	end
end

function Lua_703178_Buff_Mucus_Sticky_Check()--625984�G���H�G
	local _ownerID = OwnerID();
	local _targetID = TargetID();--victim
	
	if ( CheckBuff( _targetID , 626008 ) == false ) then
		local _thisBuffGUID = 625984;
		local _currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _thisBuffGUID );
		--DebugMsg( 0 , 0 , "--Lua_703178_Buff_Mucus_Sticky_Check : ".._currentBuffLv );
		if ( _currentBuffLv > 3 ) then--�|��5�h��A�|�Q�w���B���g�B�L�k�i�����ʧ@�C
			CancelBuff( _targetID , _thisBuffGUID );
			AddBuff( _targetID , 626008 , 0 , -1 );--626008�ʼu���o
			DebugMsg( 0 , 0 , "--Lua_703178_Buff_Mucus_Sticky_Check : can't move : ".._targetID );
			return false;
		end
		return true;
	end

	--DebugMsg( 0 , 0 , "--Lua_703178_Buff_Mucus_Sticky_Check : already sticked : ".._targetID );
	return false;

end
--�����H�G

------------------------------------------------------------------------------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y
function Lua_703178_AI_UniwillIndeSpec( _bossVO , _clock )
	

end

---------------------------------------------------------------------END------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y

------------------------------------------------------------------------------------------�H�U�O�ޯ�
function Lua_703178_Skill_EggSpread()--��Z �ͤp�L
	local _ownerID = OwnerID();--boss
	local _targetID = TargetID();--victim

	DebugMsg( 0 , 0 , "--Lua_703178_Skill_EggSpread : ".._ownerID );
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then return end;
	if ( ReadRoleValue( _ownerID , EM_RoleValue_Register10 ) >= 16 ) then return; end--�̦h16���p��
	-- �ͩǮɥ���Z���H�����a��m�A3����ơC
	local _eggIDs = {};--�O���Z��ID

	local _maxTarget = 4;--�̤j�ؼмƶq
	local _maxRange = 200;--�̤j�d��
	local _targetList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , _maxRange , true );--�b�d�򪱮a���j�M
	_targetList = Lua_703182_RandomFromList( _targetList , _maxTarget );--�q���D��4�H(�|�����������p)

	local x,y,z,dir = 0;
	local _currentTargetID = 0;

	local _cloneGUID = 108899; --��Z��NPC
	local _cloneID = 0;

	local _eggGUID = 109193;--�Z
	local _eggID = 0;
	for _index = 1 , _maxTarget , 1 do--��4���Z
		--���I
		x,y,z,dir = DW_Location( _ownerID );--�b�쥻��m���ͥ�Z��NPC
		_cloneID = _gConsts.ExtObj( _cloneGUID , x,y,z,dir , false );
		WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , 4 );
		
		--�ؼ��I
		_currentTargetID = _targetList[ _index ];--
		if ( _currentTargetID ~= nil ) then--��ؼЦ��Į� �h�N�Z���o��
			x,y,z,dir = DW_Location( _currentTargetID );
		else--��S�����ĥؼЮ�(�ؼмƶq����) �h�N�Z�H�K�� ((��  �Ӥ��t�d���F�a !!
			x,y,z,dir = DW_Location( _ownerID );
			x = x + ( RandRange( 1 , 2*_maxRange ) - _maxRange );
			z = z + ( RandRange( 1 , 2*_maxRange ) - _maxRange );
		end

		CastSpellPos( _cloneID , x , y , z , 852061 , 1 );--���Z�S��


		_eggID = _gConsts.ExtObj( _eggGUID , x,y,z,dir );
		--local _eggID = CreateObj( _eggGUID , x,y,z,dir , 1 );
		DebugMsg( 0 , 0 , "--Lua_703178_Skill_CreateEgg : ".._eggID.."  :  "..tostring(_gConsts) );
		WriteRoleValue( _eggID , EM_RoleValue_LiveTime , 4 );
		SetModeEx( _eggID , EM_SetModeType_Mark , true );	--���i�I��
		SetModeEx( _eggID , EM_SetModeType_HideName , false );	--����ܦW��
		SetModeEx( _eggID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
		SetModeEx( _eggID , EM_SetModeType_Strikback , false );	--���|����
		SetModeEx( _eggID , EM_SetModeType_Move , false );	--���|����
		SetModeEx( _eggID , EM_SetModeType_Fight , false );	--���i����
		SetModeEx( _eggID , EM_SetModeType_Searchenemy , false );	--���|����
		SetModeEx( _eggID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG
		table.insert( _eggIDs , _eggID );

		CallPlot( _cloneID , "Lua_703178_Skill_CreateEgg" , _eggID , _roomID );

	end

	--�T�����
	CallPlot( _cloneID , "Lua_703178_Skill_EggHatched" ,  _eggIDs , _roomID );

end

function Lua_703178_Skill_CreateEgg( _eggID , _roomID )
	Sleep( 10 );
	
	AddToPartition(  _eggID , _roomID );
	return;
end

function Lua_703178_Skill_EggHatched( _eggIDs , _roomID )
	Sleep( 40 );
	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];
	DebugMsg( 0 , 0 , "--Lua_703178_Skill_EggHatched : ".."  :  "..tostring(_eggIDs) );

	_gConsts.CreateSquad( _eggIDs );
	return;
end

-------------------------------------------------------------------------------------------------�ƨg�٭�
function Lua_703178_Skill_CrazyBite_Start()--�ƨg�٭�����@��_�}�l
	local _ownerID = OwnerID();
	local _targetID = TargetID();--victim

	DebugMsg( 0 , 0 , "--Lua_703178_Skill_CrazyBite_Start :  ".._ownerID.." : ".._targetID );
	--SetModeEx( _ownerID , EM_SetModeType_Gravity , false );
	SetModeEx( _targetID , EM_SetModeType_Gravity , false );
	--AttachObj( _ownerID , _targetID , 1 , "p_left_hand" , "p_hit_point01" );
	--AttachObj( _targetID , _ownerID , 1 , "p_hit_point01" , "p_left_hand" );
	AddBuff( _ownerID , 625986 , 0 , 10 );
	
	local x,y,z,dir = DW_Location( _ownerID );
	local _height = y+50;
	local _dir = (ReadRoleValue( _ownerID , EM_RoleValue_Dir )/180 )*math.pi;
	DebugMsg( 0 , 0 , "--Raidus :  ".._ownerID.." : ".._targetID );
	local _distance = 60;
	local _x = x + _distance*math.cos( _dir );
	local _z = z + _distance*math.sin( _dir );
	SetPos( _targetID , _x, _height ,_z,-dir );
	DebugMsg( 0 , 0 , "--Victim : ".._targetID.."  height : "..y.."  _ :".._height );
	SetModeEx( _targetID , EM_SetModeType_Gravity , false );

	--PlayMotionEX( _ownerID , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_LOOP );
	PlayMotion( _ownerID , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );

	DebugMsg( 0 , 0 , "--Lua_703178_Skill_CrazyBite_Start :  "..tostring( CheckBuff( _ownerID , 625986 ) ) );
	CallPlot( _ownerID , "Lua_703178_Skill_CrazyBite_Loop" , _ownerID , _targetID );
end

function Lua_703178_Skill_CrazyBite_Loop( _ownerID , _targetID )--�ƨg�٭�����@��
	DebugMsg( 0 , 0 , "--Lua_703178_Skill_CrazyBite_Loop :  ".._ownerID.." : ".._targetID );
	Sleep( 10 );
	PlayMotion( _ownerID , ruFUSION_ACTORSTATE_CRAFTING_LOOP );
	while CheckBuff( _ownerID , 625986 ) do
		--SysCastSpellLv( _ownerID , _targetID , 852052 , 0 );
		Sleep( 10 );
	end
	
	return;
end


function Lua_703178_Skill_CrazyBite_End()--�ƨg�٭�����@��_�}�l
	local _ownerID = OwnerID();
	local _targetID = TargetID();--victim

	DebugMsg( 0 , 0 , "--Lua_703178_Skill_CrazyBite_End :  ".._ownerID.." : ".._targetID );

	MagicInterrupt( _ownerID );
	MagicInterrupt( _targetID );
	DetachObj( _ownerID );
	DetachObj( _targetID );
	SetModeEx( _ownerID , EM_SetModeType_Gravity , true );
	SetModeEx( _targetID , EM_SetModeType_Gravity , true );
	
	--PlayMotionEX( _ownerID , ruFUSION_ACTORSTATE_CRAFTING_END , 0 );
	PlayMotion( _ownerID , ruFUSION_ACTORSTATE_CRAFTING_END );
end
---------------------------------------------------------------------------------END-------------�ƨg�٭�




-------------------------------------------------------------------------------------------------�a���p��
function Lua_703178_Skill_CrackSpike()--�a���p�����@��
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	DebugMsg( 0 , 0 , "--Lua_703178_Skill_CrackSpike : ".._ownerID.." : ".._targetID );
	
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703178_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then return end;
	CallPlot( _ownerID , "Lua_703178_Skill_CrackSpike_Execute" , _ownerID , _gConsts , _roomID );
end

function Lua_703178_Skill_CrackSpike_Execute( _ownerID , _gConsts , _roomID )--�a���p�����@��
	local x,y,z,dir = DW_Location( _ownerID );--�HBoss�����
	local _spikeNpcGUID = 107854;--107854�z���y
	DebugMsg( 0 , 0 , "--Lua_703178_Skill_CrackSpike_Execute : ".._ownerID.." : " );
	local _maxSpike = 30;--�̦h�X��
	local _eachStab = 5;--�C�Ө�X�U
	local _x,_z = 0;
	local _spikeNpcID = 0;
	for _i = 1 , _maxSpike , 1 do
		--���ͦa��
		_x = x + ( RandRange( 1 , 300 ) - 150 );
		_z = z + ( RandRange( 1 , 300 ) - 150 );
		_spikeNpcID = CreateObj( _spikeNpcGUID , _x,y,_z,dir , 1 );
		WriteRoleValue( _spikeNpcID , EM_RoleValue_LiveTime , 5 );
		SetRoleCampID( _spikeNpcID , ReadRoleValue( _ownerID , EM_RoleValue_CampID ) );
		
		SetModeEx( _spikeNpcID , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
		SetModeEx( _spikeNpcID , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
		SetModeEx( _spikeNpcID , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
		SetModeEx( _spikeNpcID , EM_SetModeType_Searchenemy , false );   	--����
		SetModeEx( _spikeNpcID , EM_SetModeType_Mark , false );			--�аO
		SetModeEx( _spikeNpcID , EM_SetModeType_Fight , false ); 			--���
		SetModeEx( _spikeNpcID , EM_SetModeType_Move , false );			--����
		SetModeEx( _spikeNpcID , EM_SetModeType_ShowRoleHead , true );
		SetModeEx( _spikeNpcID , EM_SetModeType_Strikback , false );		--����
		SetModeEx( _spikeNpcID , EM_SetModeType_Show , true );

		LockHP( _spikeNpcID , 100 , "" );--�קK�Q����

		AddToPartition( _spikeNpcID , _roomID );
		--CallPlot( _spikeNpcID , "Lua_703178_Skill_CrackSpike_Stab" , _ownerID , _spikeNpcID , _eachStab );
		SysCastSpellLv( _ownerID , _spikeNpcID , 852058 , 0 );--852058�a���p��_�ˮ`
		--DebugMsg( 0 , 0 , "--Lua_703178_Skill_CrackSpike_Execute : Pos :".._spikeNpcID.." : " );
		Sleep( 2 );
	end
	
	return;
end

function Lua_703178_Skill_CrackSpike_Stab( _ownerID , _spikeNpcID , _eachStab )--�a���p�� �ˮ`
	for _i = 1 , _eachStab , 1 do
		--SysCastSpellLv_Pos( _ownerID , _x,y,_z , 852058 , 0 );--852058�a���p��_�ˮ`
		SysCastSpellLv( _ownerID , _spikeNpcID , 852058 , 0 );--852058�a���p��_�ˮ`
		Sleep( 3 );
	end
end



function Lua_703178_Test_Motion()
	local _ownerID = OwnerID();
	DebugMsg( 0 , 0 , "--Lua_703178_Test_Motion : ".._ownerID.." : " );
	PlayMotion( _ownerID , ruFUSION_ACTORSTATE_SLEEP_BEGIN );
	--PlayMotionEX( _ownerID , ruFUSION_MIME_CRAFTING_BEGIN , ruFUSION_MIME_CRAFTING_LOOP );
end

function Lua_703178_Test_Motion2( _motion1 , _motion2 )
	local _ownerID = OwnerID();
	DebugMsg( 0 , 0 , "--Lua_703178_Test_Motion : ".._ownerID.." : " );
	PlayMotion( _ownerID , _motion1 );
	--PlayMotionEX( _ownerID , ruFUSION_MIME_CRAFTING_BEGIN , ruFUSION_MIME_CRAFTING_LOOP );
end