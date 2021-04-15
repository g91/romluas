--Author : K.J. Aris
--Version : 140528
--Ignitor : NPC 109088
--Script : 703179

local _Lua_703179_AI_GlobalVars = nil;

function Lua_703179_AI_Init( _inputCtrID )--controller  NPC 109088 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703179_AI_Init : NPC 109088       Z34  V 140528 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --�H�����ư��� �N�즳����R��

	--basics
	local _ctrlID = _inputCtrID or OwnerID() or 0;--109088
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
	local _bossKokarGUIDs = { 109015 , 109015 , 109015 };--�ĥd��
	local _bossTonaGUIDs = { 108819 , 103762 , 103766 };--����
	local _bossMarlocGUIDs = { 108820 , 103763 , 103767 };--�����J
	local _bossSchulizeGUIDs = { 108821 , 103764 , 103768 };--�Եܵ�

	local _treasureBoxGUIDs = { 108832 , 108833 , 108834 };--ĳ�|�p�ë~

	--�ѼƳ]�w��
	if ( _Lua_703179_AI_GlobalVars == nil ) then _Lua_703179_AI_GlobalVars = {}; end
	_Lua_703179_AI_GlobalVars[ _roomID ] = {	--non 
					_bossID = 0 ,--�H_Schulize���N��( ����L�禡�n�� _bossID)

					_bossVOs = {
						_Kokar = {
							_id = 0 ,					--ID
							_guid = _bossKokarGUIDs[ _difficulty ] ,		--GUID
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
					_treasureBoxGUID = _treasureBoxGUIDs[ _difficulty ] ,--ĳ�|�p�ë~

					_flagGUID = 781427 , --781427 Z34_5���κX��

					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					_bossReviveCD = 45 ,

					};
	--��Ū��T
	local _gConsts = _Lua_703179_AI_GlobalVars[ _roomID ];

	--���� Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703179_GenerateBoss( _bossVO , _roomID );
		_Lua_703179_AI_GlobalVars[ _roomID ]._bossVOs[_bossName]._id = _bossID;--
	end
	_Lua_703179_AI_GlobalVars[ _roomID ]._bossID = _gConsts._bossVOs._Kokar._id;--presiding Boss --Kokar
	--Lua_703179_BossIndividualsSetting( _gConsts );

	--���ͫ��
	_Lua_703179_AI_GlobalVars[ _roomID ]._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
	DebugMsg( 0 , 0 , "--Back Door ID : ".._Lua_703179_AI_GlobalVars[ _roomID ]._backDoorID );

	--delete trigger
	DelObj( _ctrlID );
		
	return _roomID;
end--function Lua_703179_AI_Init( _inputCtrID )

function Lua_703179_GenerateBoss( _bossVO , _roomID )
	Lua_DavisDelObj( _bossVO._guid );
	local _gConsts = _Lua_703179_AI_GlobalVars[ _roomID ];
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
end--function Lua_703179_GenerateBoss( _bossVO )

function Lua_703179_ClearAll( _specRoomID )--for test
	if ( _Lua_703179_AI_GlobalVars ~= nil ) then
		DebugMsg( 0 , 0 , "--Lua_703179_ClearAll : all values will be cleared , reinit this by redeploying NPC 109088" );--
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
			local _valuePack = _Lua_703179_AI_GlobalVars[ _specRoomID ];
			if ( _valuePack ~= nil ) then
				ClearData( _valuePack );
			end
			_Lua_703179_AI_GlobalVars[ _specRoomID ] = nil;
			return;
		end

		for _roomID , _valuePack in pairs( _Lua_703179_AI_GlobalVars ) do
			ClearData( _valuePack );
			_Lua_703179_AI_GlobalVars[ _roomID ] = nil;
		end
	end
end--function Lua_703179_ClearAll()

function Lua_703179_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703179_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703179_ClearAll( _roomID );
	Lua_703179_AI_Init();
end


function Lua_703179_AI_onFight()--���h������ �u��b�䤤�@�����W  �ҪO�г]"�s��"
	--�԰���l
	local _bossID = OwnerID();--_Kokar
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703179_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703179_AI_GlobalVars == nil ) then Lua_703179_AI_reignite( _roomID ); return; end

	local _gConsts = _Lua_703179_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then Lua_703179_AI_reignite( _roomID ); return; end

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
	_Lua_703179_AI_GlobalVars[ _roomID ]._ctrlID = _ctrlID;
	_Lua_703179_AI_GlobalVars[ _roomID ].ExtObj = CreateDerivativeOnBoss;
	_Lua_703179_AI_GlobalVars[ _roomID ].DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );
	--��Ū��T
	local _gConsts = _Lua_703179_AI_GlobalVars[ _roomID ];

	--generate front door
	_Lua_703179_AI_GlobalVars[ _roomID ]._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703179_AI_Engage" , 0 );--�Ұʾ԰��y�{

	ScriptMessage(_bossID,0,2,"[Lua_703179_AI_OnFight]",0);

end--function Lua_703179_AI_onFight()

function Lua_703179_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
	DebugMsg( 0 , _roomID , "--Lua_703179_AI_Engage" );
	local _gConsts = _Lua_703179_AI_GlobalVars[ _roomID ];
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
			Lua_703179_AI_Conquered( _roomID );
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			--[[
			local _rangePlayers = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 300 , true );--�T�{�P�D�s�����a  --�]��Schulize������
			if ( #_rangePlayers <= 0 ) then
				DebugMsg( 0 , _roomID , "--all players are gone , quit fighting "..tostring(_engaging) );
				--Lua_703179_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
				Lua_703179_AI_Reset( _roomID );
				break;
			end
			]]--
			Lua_703179_AI_Reset( _roomID );
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
				ScriptMessage(_bossID,0,2,"[Lua_703179_AI_Frenzy]",0);
		end		
	
		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��
			
			--[[
			for _bossName , _cdTime in pairs( _CD ) do--Boss����	�@�s����
				if ( _cdTime == 0 ) then
					_Lua_703179_AI_GlobalVars[ _roomID ]._bossVOs[_bossName]._id = Lua_703179_GenerateBoss( _bossVOs[_bossName] , _roomID );--���͹�����BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703179_AI_HasRevived]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--���ͭ˼ƴ���	�C10��
					ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703179_AI_WillReviveIn10sec]" , 0 );
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
end--function Lua_703179_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703179_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703179_AI_Reset" );

	local _gConsts = _Lua_703179_AI_GlobalVars[ _roomID ];
	
	local _bossVOs = _gConsts._bossVOs;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���
	ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703179_AI_Reset]",0);

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
	
	--_Lua_703179_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	for _bossName , _bossVO in pairs( _bossVOs ) do--�}�Ҿ԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , false );
		_Lua_703179_AI_GlobalVars[ _roomID ]._bossVOs[_bossName]._id = Lua_703179_GenerateBoss( _bossVO , _roomID );--���͹�����BOSS
	end
	_Lua_703179_AI_GlobalVars[ _roomID ]._bossID = _gConsts._bossVOs._Kokar._id;--presiding Boss --Kokar
	--Lua_703179_BossIndividualsSetting( _gConsts );
	--SetDefIdleMotion( _gConsts._bossVOs._Schulize._id , ruFUSION_MIME_EMOTE_CRY );--��Schulize��

end--function Lua_703179_AI_Reset( _roomID )

function Lua_703179_AI_Conquered( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703179_AI_Conquered" );
	local _gConsts = _Lua_703179_AI_GlobalVars[ _roomID ];--for read
	
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���

	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����

	ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703179_AI_Conquered]",0);	
	
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
	_Lua_703179_AI_GlobalVars[ _roomID ] = nil;	--clear all values
end--function Lua_703179_AI_Conquered( _roomID )

function Lua_703179_AI_Dead()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703179_AI_GlobalVars[ _roomID ];

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
	DebugMsg( 0 , 0 , "--Lua_703179_AI_Dead : "..tostring( _allBossAreDead ) );

	if ( _allBossAreDead ) then
		Lua_703179_AI_Conquered( _roomID );
	end

	return true;
end
-----------------------------------sub functions



------------------------------------------------------------------------------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y


---------------------------------------------------------------------END------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y





------------------------------------------------------------------------------------------�H�U�O�ޯ�


