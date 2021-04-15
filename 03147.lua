--Author : K.J. Aris
--Version : 14.02.25.
--Ignitor : 108909
--NPC : 108909--raid
--Script : 703147

local _Lua_703147_AI_GlobalVars = {};

function Lua_703147_AI_Init( _inputCtrID )--controller  NPC 108909 --Note : this NPC is using as a ignitor
---	DebugMsg( 0 , 0 , "--Lua_703147_AI_Init : NPC 108909       Z33-2B2  V140225 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --�H�����ư��� �N�즳����R��

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108909
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
	local _bossCornowaGUIDs = { 108825 , 103769 , 103771 };--��ե�
	local _bossOsokenGUIDs = { 108826 , 103770 , 103772 };--������
	local _ballOfSoulGUIDs = { 109069 , 109070 , 109071 };--�F��y

	local _treasureBoxGUIDs = { 106289 , 108835 , 108836 };--������_

	--�ѼƳ]�w��	
	_Lua_703147_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossVOs = {
						_Osoken = {	-- ������
							_id = 0 ,
							_guid = _bossOsokenGUIDs[ _difficulty ] ,
							_flagPos = 1 , 
							IndiSpec = Lua_703147_AI_IndividualSpec_Osoken
							} , 

						_Cornowa = {	-- ��ե�
							_id = 0 ,
							_guid = _bossCornowaGUIDs[ _difficulty ] ,
							_flagPos = 2 , 
							IndiSpec = Lua_703147_AI_IndividualSpec_Cornowar
							} , 
						} , 

					_ballOfSoulGUID = _ballOfSoulGUIDs[ _difficulty ] ,	-- �F��y

					_ctrlGUID = 108705 ,--���ID
					_doorGUID = 106012 , 	-- ��ID
					_treasureBoxGUID = _treasureBoxGUIDs[ _difficulty ] ,--������_

					_phase2BuffGUID = 625553,	-- �����֤��� (625553)	�԰��ĤG���q���Х�BUFF

					_flagGUID = 781416 , --781416 Z33-2_2���κX��

					_frontDoorFlagPos = 3 , 
					_backDoorFlagPos = 4 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,
					};
	--��Ū��T
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];

	--���� Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703147_GenerateBoss( _bossVO , _roomID );
		_gConsts._bossVOs[_bossName]._id = _bossID;--_Cornowa
	end
	_gConsts._bossID = _bossID;--presiding boss 

	--���ͫ��
	_gConsts._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
---	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	--delete trigger
	DelObj( _ctrlID );

	return _roomID;
end--function Lua_703147_AI_Init( _inputCtrID )

function Lua_703147_ClearAll()--for test	�R���Ҧ��������� ( ��եˡB�����֡B�������B�e���B��� )
---	DebugMsg( 0 , 0 , "--Lua_703147_ClearAll : all values will be cleared , reinit this by redeploying NPC 108909" );--
	if ( _Lua_703147_AI_GlobalVars ~= nil ) then
		for _roomID , _valuePack in pairs( _Lua_703147_AI_GlobalVars ) do
			if ( _valuePack.DelExtObjs ~= nil ) then
				_valuePack.DelExtObjs();
			end

			for _bossName , _bossVO in pairs( _valuePack._bossVOs ) do
				DelObj( _bossVO._id );
			end
			DelObj( _valuePack._ctrlID );
			DelObj( _valuePack._frontDoorID );
			DelObj( _valuePack._backDoorID );
			_Lua_703147_AI_GlobalVars[ _roomID ] = nil;
		end
	end
end--function Lua_703147_ClearAll()

function Lua_703147_GenerateBoss( _bossVO , _roomID )	-- �ͦ� Boss
	Lua_DavisDelObj( _bossVO._guid );	-- ���b�A�R���ϰ줺���w�s���� Npc
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];
	local _bossID = CreateObjByFlag( _bossVO._guid , _gConsts._flagGUID , _bossVO._flagPos , 1 );
	AddToPartition( _bossID , _roomID ); 

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false );	-- ����
	SetModeEx( _bossID , EM_SetModeType_Fight , true );	-- �԰�
	SetModeEx( _bossID , EM_SetModeType_Move , true );	-- ����
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );	-- ����
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );	-- ����

	return _bossID;
end--function Lua_703147_GenerateBoss( _bossVO )

function Lua_703147_CornowaInitSetting()--on NPC 108818	��ե� �_�l�@��
	local _ownerID = OwnerID();
---	DebugMsg( 0 , 0 , "--Lua_703147_CornowaInitSetting ".._ownerID );
	AddBuff( _ownerID , 625549 , 0 , -1 );--��MP SP�^�_
	WriteRoleValue( _ownerID , EM_RoleValue_MaxMP , 100 );
	WriteRoleValue( _ownerID , EM_RoleValue_MP , 0 );--SP�k0

	Cl_Resist_HackersBossNum();
end

function Lua_703147_AI_reignite( _specRoomID )--for test	�R���Ҧ�����B�í��s�إߩҦ�����
---	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703147_ClearAll();
	Lua_703147_AI_Init();
end

function Lua_703147_AI_onFight()--_Cornowa ��ե˾԰��@��
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );

---	DebugMsg( 0 , 0 , "--Lua_703147_AI_onFight ".._bossID.." RID : ".._roomID );

	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703147_AI_reignite( _roomID ); return; end

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--��W�@���`��������٦b�@�ʮɫh���ʧ@  (����_Schulize���ͮɭ���Ĳ�o�԰�)
---		DebugMsg( 0 , _roomID , "--Combat Sequence Duplicated : New Sequence Rejected !!" );--presiding boss may revived or rejoin the fight while combat is not over yet
		return;
	end
	--����P�l������
	local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

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

---	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );
	--��Ū��T
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];

	--generate front door
	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703147_AI_Engage" , 0 );

	ScriptMessage(_bossID,0,2,"[LUA_703147_AI_ONFIGHT]",0);	-- �]�k�Q�X���H���j���ۥ|�P�A�O�H���H�ӷX�C
	CallPlot( _bossID , "Cl_Resist_HackersFightBegin" );
end--function Lua_703147_AI_onFight()

function Lua_703147_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
---	DebugMsg( 0 , 0 , "--Lua_703147_AI_Engage" );
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._ctrlID;--_gConsts._bossID;--there's no guarantee that presiding boss is always alive
	local _bossVOs = _gConsts._bossVOs;--there's 2 bosses in there
	local _ctrlID = _gConsts._ctrlID;

	local _bossOsokenID = _bossVOs._Osoken._id;
	local _bossCornowaID = _bossVOs._Cornowa._id;

	local _phase2BuffGUID = _gConsts._phase2BuffGUID;
	--Routines Vars
	local _clock = 0;

	local _engaging = true;
	local _allBossAreDead = false;
	--Routines Vars
		--Lua_RandomPlayerFromHateList
	
	local _timeTick = 1;--Time Speed
	local _miniTimeTick = _timeTick*10;--Time Speed for Sleep
	
	local _GCD = 5;
	local _CD = {
--		_skillAeCD = _gConsts._skillAeCD ,
--		_skillBladeCD = _gConsts._skillBladeCD ,
--		_skillChaosConvolutionCD = _gConsts._skillChaosConvolutionCD ,
--		_skillChargeCD = _gConsts._skillChargeCD ,
--		_skillIronBloodCD = _gConsts._skillIronBloodCD ,
--		_skillThrowCD = _gConsts._skillThrowCD ,
		}

	-----------------------------------------�g�ɰѼ�
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;
	----------------------------END----------�g�ɰѼ�

---	DebugMsg( 0 , 0 , "--Start loop" );
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
				_bossVO.IndiSpec( _bossVO , _clock );--�X�٬��۪��ɭ�  ���K����ӧO���S��y�{
				if( ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) ~= 0 ) then--�����@BOSS���b�԰� �N���٦����a�s�� 
					--DebugMsg(0,0,_currentBossID.." ���b�l�����a : "..ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) );
					_engaging = true;
				end	
			else
				--DebugMsg( 0 , 0 , "------dead boss : ".._bossName );
				--��BOSS���F  ���K�]�w�`�̴_��CD

			end
		end

		if ( _allBossAreDead == true ) then-- boss �������`�� �D�Ԧ��\
---			DebugMsg(0,0,"------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703147_AI_Conquered( _roomID );	-- �ͦ��_�c�A�çR����������
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
---			DebugMsg( 0 , 0 , "--all players are gone , quit fighting "..tostring(_engaging) );
			--Lua_703147_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
			Lua_703147_AI_Reset( _roomID );
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
				for _bossName , _bossVO in pairs( _bossVOs ) do
					_currentBossID = _bossVO._id;
					AddBuff( _currentBossID , 625849 , 0 , -1 );-- 625849 ����
				end
				
			--	DebugMsg( 0 , 0 , "-----�g�g��----" );
				ScriptMessage( _bossID , 0 , 2 , "[LUA_703147_AI_FRENZY]" , 0 );	-- �����@�Ӥj���F�v�O���|���O����@����骺�A�{�b�L�N�����@���C
		end		

		---------------------------------------------------���q�ഫ
		-- ���ե˳Q�����άO������HP�C��40%�ɶi�J�ĤG���q�C
		if ( CheckBuff( _bossOsokenID , _phase2BuffGUID ) == false ) then--���i�J�ĤG���q�ɤ~�P�w
			local HpRatio = ReadRoleValue( _bossOsokenID, EM_RoleValue_HP ) / ReadRoleValue( _bossOsokenID, EM_RoleValue_MaxHP );
			if not CheckID( _bossCornowaID ) or ReadRoleValue( _bossCornowaID , EM_RoleValue_IsDead ) == 1 or ( CheckID( _bossOsokenID ) and HpRatio < 0.4 ) then
				--�[�W�ĤG���q��Buff
				AddBuff( _bossOsokenID , _phase2BuffGUID , 0 , -1 );
			--	DebugMsg( 0 , 0 , "--�ĤG���q" );
				if HpRatio > 0 then
					ScriptMessage( _bossID , 0 , 2 , "[LUA_703147_AI_PHASE2]" , 0 );	-- ���M���[108826]�G��o�Ӧa�B�A�ݨӥL�n�𬵤F�I
				end
			end
		end
		-------------------------------------END---------���q�ഫ
		
		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��


			--[[
			if( _CD._timer2 <= 0 )then
---				DebugMsg( 0 , 0 , "--_timer2 release" );
				_CD._timer2 = 15;
				_GCD = 2;
			end

			if( _CD._timer3 <= 0 )then
---				DebugMsg( 0 , 0 , "--_timer3 release" );
				_CD._timer3 = 20;
				_GCD = 2;
			end

			if( _CD._timer4 <= 0 )then
---				DebugMsg( 0 , 0 , "--_timer4 release" );
				_CD._timer4 = 25;
				_GCD = 2;
			end
			]]--
			
		end

	end--while
---	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703147_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703147_AI_Reset( _roomID )
---	DebugMsg( 0 , 0 , "--Lua_703147_AI_Reset" );

	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];
	local _bossVOs = _gConsts._bossVOs;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���

	local Osoken = _gConsts._bossVOs._Osoken._id;
	if CheckID( Osoken ) and ReadRoleValue( Osoken, EM_RoleValue_Hp ) > 0 then
		ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[LUA_703147_AI_RESET]",0);	-- �N��@���A[108826]�S�~��ۥL������u�@�C
	end

	Delobj( _frontDoorID );	--�R���e��
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 10 );
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--�����԰�
		_bossID = _bossVO._id;
		DW_UnFight( _bossID , true );
		DelObj( _bossID );
	end
	Sleep( 10 );

	Delobj( _frontDoorID );	--�R���e��
	
	--_Lua_703147_AI_GlobalVars[ _roomID ] = nil;	--clear all values

	Sleep( 30 );
	
	for _bossName , _bossVO in pairs( _bossVOs ) do--�}�Ҿ԰�
		_bossID = _bossVO._id;
		DW_UnFight( _bossID , false );
		_gConsts._bossVOs[_bossName]._id = Lua_703147_GenerateBoss( _bossVO , _roomID );--���͹�����BOSS
	end

end--function Lua_703147_AI_Reset( _roomID )

function Lua_703147_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
---	DebugMsg( 0 , 0 , "--Lua_703147_AI_Conquered" );
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];--for read
	
	if( _gConsts == nil ) then return; end
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���

	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����

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
	_Lua_703147_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	Cl_Resist_HackersBossDead();
end--function Lua_703147_AI_Conquered( _roomID )

function Lua_703147_AI_Dead(Select)
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];

	if ( _gConsts == nil ) then return; end
	KillID( _ownerID , _ownerID );

	if Select == 2 then
		ScriptMessage( _ownerID, 0 , 2 , "[$MUTE]".."[LUA_703147_AI_CONQUERED]" , 0 );	-- [108826]�����m�H�A���L�T��P����F�u���`�v�K�K
	end

	local _bossVOs = _gConsts._bossVOs;
	local _allBossAreDead = true;
	local _currentBossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬdBoss���S���q�q���۶ø�
		_currentBossID = _bossVO._id;
		if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 and _currentBossID ~= _ownerID ) then--�����@BOSS�s���� �N���٥�����
			_allBossAreDead = false;
		end
	end
---	DebugMsg( 0 , 0 , "--Lua_703147_AI_Dead : "..tostring( _allBossAreDead ) );

	if ( _allBossAreDead ) then
		Lua_703147_AI_Conquered( _roomID );
	end

	return true;
end
-----------------------------------sub functions


------------------------------------------------------------------------------------------------�ӧO�����S��B�z�{��	�bMAINLOOP����ɳQ���y
function Lua_703147_AI_IndividualSpec_Osoken( _bossOsokenVO , _clock )-- _Osoken ������
	--local _bossID = _bossOsokenVO._id;
end

function Lua_703147_AI_IndividualSpec_Cornowar( _bossCornowaVO , _clock )-- _Cornowa ��ե�	�C����� 1 ��
	local _bossID = _bossCornowaVO._id;
	local _spRatio = ReadRoleValue( _bossID , EM_RoleValue_MP )/ReadRoleValue( _bossID , EM_RoleValue_MaxMP );

	
	if ( _spRatio <= 0  ) then--��q����   
		local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
		local _gConsts = _Lua_703147_AI_GlobalVars[_roomID];
		local _osokenID = _gConsts._bossVOs._Osoken._id;
		AddBuff( _bossID , 625566 , 0 , -1 );--625566�R��ШD
		AddBuff( _osokenID , 625566 , 0 , -1 );--625566�R��ШD
	--	DebugMsg( 0, 0, "Hao ������Mp�k�s �ШD�R��" )
	end

	--���O�ȶW�L100% �I�i --851890�F�ȭ���
	if ( _spRatio >= 1.0  ) then
		AddBuff( _bossID , 625550 , 0 , -1 );--625550�B�H���D�I��L�O --�^���A�Q�ίu���O
		--return;
	end

	local _rangePlayer = LUA_YOYO_RangePlayerNotGM_EX( _bossID , 50 , true );--�ǤO�H��
	if ( #_rangePlayer >= 4 ) then--����E��4�ӡ]�t�^�H�W�����a�ɬI��A�k�N�ˮ`�A�åB����65��O�C
		AddBuff( _bossID , 625551 , 0 , -1 );--625551�ݧԤ��x�եO�I��L�O ----�^���A�Q�ίu���O
	end
end
------------------------------------------------------------------------------------END---------�ӧO�����S��B�z�{��


------------------------------------------------------------------------------------------�H�U�O�ޯ�
function Hao_IncreaseSpRatio( Obj, Ratio, String )	-- �վ� SP%�@�@�Ψ禡

	if String == nil or type(String) ~= "string" then
		String = "";
	end

	local Sp = ReadRoleValue( Obj, EM_RoleValue_MP );
	local MaxSp = ReadRoleValue( Obj, EM_RoleValue_MaxMP );
	local NowSpRatio = Sp / MaxSp;	-- ��e SP ��v
	local SetSpRatio = NowSpRatio + Ratio;	-- �W�[ SP ��v

	if SetSpRatio > 1 then
		SetSpRatio = 1;
	end

	local SetSp = MaxSp * SetSpRatio;
	DebugMsg( 0, 0, String..", NowSpRatio = "..string.format("%.2f", NowSpRatio)..", AddRatio = "..Ratio..", TotalSpRatio = "..string.format("%.2f", SetSpRatio) );
	WriteRoleValue( Obj, EM_RoleValue_MP, SetSp );
end
------------------------------------------------------------------------------Osoken
function Lua_703147_Skill_EnergyCharge()--�R��
	local _ownerID = OwnerID();-- _Osoken
	local _targetID = TargetID();--_Cornowa
---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_EnergyCharge : ".._ownerID.." : ".._targetID );

	if ReadRoleValue( _targetID, EM_RoleValue_IsDead ) == 1 or CheckID( _targetID ) then
		CancelBuff_NoEvent( _ownerID , 625566 );
		return true;
	end
	
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703147_AI_GlobalVars[_roomID];
	local _cornowaID = _gConsts._bossVOs._Cornowa._id;
	_targetID = _cornowaID;

	Hao_IncreaseSpRatio( _targetID, 0.5, "Energy Influx" )	-- ��_ ������ 50% ��O
	CancelBuff_NoEvent( _ownerID , 625566 );
	CancelBuff_NoEvent( _targetID , 625566 );
	ScriptMessage( _ownerID , 0 , 2 , "[$MUTE]".."[LUA_703147_AI_ENERGIZING]" , 0 );	-- ���Y�N�ɥR�����I	
	return true;
end

function Lua_703147_Skill_DeadSpiritImpact()--���F����
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	--DebugMsg( 0 , 0 , "--Lua_703147_Skill_DeadSpiritImpact : ".._targetID );
	local _roomID = ReadRoleValue( _targetID , EM_RoleValue_RoomID );
	
	local _targetGUID = ReadRoleValue( _targetID , EM_RoleValue_OrgID );

	local _gConsts = _Lua_703147_AI_GlobalVars[_roomID];
	if ( _targetGUID == _gConsts._bossVOs._Cornowa._guid ) then
		Hao_IncreaseSpRatio( _targetID, 0.2, "Death Strike" )	-- ��_ ������ 20% ��O
	end

	return true;
end

function Lua_703147_Skill_DarkShadow()--�t�v�ˮ`����@��
	local _ownerID = OwnerID();
	local _targetID = TargetID();
---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_DarkShadow : ".._ownerID.." : ".._targetID );
	local _roomID = ReadRoleValue( _targetID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703147_AI_GlobalVars[_roomID];

	local _bossOsokenID = _gConsts._bossVOs._Osoken._id;
	SysCastSpellLv( _bossOsokenID , _bossOsokenID , 851905 , 0 );--851905�t�v�ˮ`

end

function Lua_703147_Skill_EvilSoul()--�����ܾz����@��
	local _ownerID = OwnerID();	-- Boss
	local _targetID = TargetID();
---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_EvilSoul : ".._ownerID.." : ".._targetID );
	local _rangePlayerList = LUA_YOYO_RangePlayerNotGM_EX( _ownerID , 500 , true );
	local _maxTarget = 2;
	local _zoneID = ReadRoleValue( _ownerID , EM_RoleValue_ZoneID );
	if ( _zoneID == 175 ) then _maxTarget = 4; end--�H��4�W���a	���q�B²�����G2�W

	if #_rangePlayerList > 0 then
		local _targetList = {};
		for i = 1, _maxTarget do
			table.insert( _targetList, table.remove( _rangePlayerList, math.random( #_rangePlayerList) ) );
			if #_rangePlayerList == 0 then
				break;
			end
		end

		for _index , _playerID in pairs( _targetList ) do
	---		DebugMsg( 0 , 0 , "------vistim :  ".._playerID );
			AddBuff( _playerID , 625827 , 0 , -1 );--625827�����ܾz
		end
	end
--	local _targetList = Lua_703147_RandomFromList( _rangePlayerList , 4 );
end

function Lua_703147_Skill_DeadlyJudgement()--�_����M�E�f�P ����@��
	local _ownerID = OwnerID();
	local _targetID = TargetID();
---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_DeadlyJudgement : ".._ownerID.." : ".._targetID );
	local x,y,z,dir = DW_Location( _targetID );

	SysCastSpellLv_Pos( _ownerID , x,y,z , 851907 , 1 );--851907�_����M�E�f�P �ˮ`
	ScriptMessage( _ownerID , 0 , 2 , "[LUA_703147_AI_DEADLYJUDGEMENT]" , 0 );	-- �S��F�f�P���ɨ�A�o���|�O�֡H
end

function Lua_703147_Skill_SoulBall()--�F��y ����@��

	local _ownerID = OwnerID();--Osoken
	local _targetID = TargetID();-- ������H�� 1 �W���a

---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_SoulBall : ".._ownerID.." : ".._targetID );
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );

	--�s�y���y
	local _gConsts = _Lua_703147_AI_GlobalVars[ _roomID ];
	local _ballOfSoulGUID = _gConsts._ballOfSoulGUID;
	local x,y,z,dir = DW_Location( _targetID );
	local _ballOfSoulID = _gConsts.ExtObj( _ballOfSoulGUID , x,y,z,dir );
	SetModeEx( _ballOfSoulID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _ballOfSoulID , EM_SetModeType_HideName , false );	--����ܦW��
	SetModeEx( _ballOfSoulID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _ballOfSoulID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _ballOfSoulID , EM_SetModeType_Move , true );	--�i����
	SetModeEx( _ballOfSoulID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _ballOfSoulID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _ballOfSoulID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG
	MoveToFlagEnabled( _ballOfSoulID, false );	-- �������޼@��
	WriteRoleValue( _ballOfSoulID, EM_RoleValue_LiveTime, 30 );	-- 30��ͦs�ɶ�

	CallPlot( _ballOfSoulID , "Lua_703147_Item_SoulBall_Spec" , _ballOfSoulID, _ownerID, _targetID );
end

function Lua_703147_Item_SoulBall_Spec( _ballOfSoulID, _masterID, _playerID )--�F��y NPC --_masterID �y�֦���ID�B�l�ܪ��a

	sleep( 10 );

	while ReadRoleValue( _masterID, EM_RoleValue_IsDead ) == 0 do
		if CheckID( _playerID ) and ReadRoleValue( _playerID, EM_RoleValue_IsDead ) == 0 then
			local playerPos = Vector_GetRolePos( _playerID );
			MoveDirect( _ballOfSoulID, playerPos.x, playerPos.y, playerPos.z );
		end
		SysCastSpellLv( _masterID, _ballOfSoulID, 851903, 0 );
		sleep( 10 );
	end
	DelObj( _ballOfSoulID );
end
-----------------------------------------------------------------------------------Cornowa
function Lua_703147_Skill_SoulGravity_End()--�F�ȭ���
	local _ownerID = OwnerID();
--	DebugMsg( 0 , 0 , "--Lua_703147_Skill_SoulGravity_End : ".._ownerID );
	CancelBuff_NoEvent( _ownerID , 625550 );
	return true;
end

function Hao_625559_EndUseLua()	-- �F�ȭ����@���GLua

	local Owner = OwnerID();
	local nowSpRatio = ReadRoleValue( Owner, EM_RoleValue_Mp )/ReadRoleValue( Owner, EM_RoleValue_MaxMp );
--	DebugMsg( 0, 0, "Hao �F�ȭ��� AfterSpRatio = "..string.format( "%.2f" , nowSpRatio ) );
end

function Lua_703147_Skill_SoulSmash()--	_Cornowa --�ܾz����
	--���z�ˮ`�A�æ^�_10��O�A�Y�y���ˮ`���ؼХͩR�Ȱ���30%�A�h�C�h10%�A�h�^�_5��O�C
	local _ownerID = OwnerID();-- _Cornowa
	local _targetID = TargetID();--���`��
---	DebugMsg( 0 , 0 , "--Lua_703147_Skill_SoulSmash : ".._ownerID );
	local _targetHpRatio = ReadRoleValue( _targetID , EM_RoleValue_HP )/ReadRoleValue( _targetID , EM_RoleValue_MaxHP );
	if ( _targetHpRatio >= 0.4 ) then
		local bonusAddSp = Math.floor((_targetHpRatio-0.3)/0.1) * 0.05; 	-- �ؼШC�h 10% �ͩR�A�B�~�[�� 5 %��O
		Hao_IncreaseSpRatio( _ownerID, 0.1+bonusAddSp, " Seize Soul Attack" );
	end
	return true;
end

function Hao_851890_CheckUseScript()	-- �F�ȭ��� �ˬd�I��e�� Mp

	local Owner = OwnerID();
	local nowSpRatio = ReadRoleValue( Owner, EM_RoleValue_Mp )/ReadRoleValue( Owner, EM_RoleValue_MaxMp );
--	DebugMsg( 0, 0, "Hao �F�ȭ��� nowSpRatio = "..string.format( "%.2f" , nowSpRatio ) );
	return true;
end

function Hao_851893_CheckUseScript()	-- �ǤO�H�� �ˬd�I��e�� Mp

	local Owner = OwnerID();
	local nowSpRatio = ReadRoleValue( Owner, EM_RoleValue_Mp )/ReadRoleValue( Owner, EM_RoleValue_MaxMp );
--	DebugMsg( 0, 0, "Hao �ǤO�H�� nowSpRatio = "..string.format( "%.2f" , nowSpRatio ) );
	return true;
end

function Lua_703147_Skill_MonsterSmash_End()--�ǤO�H��
	local _ownerID = OwnerID();
	--DebugMsg( 0 , 0 , "--Lua_703147_Skill_MonsterSmash_End : ".._ownerID );
	CancelBuff_NoEvent( _ownerID , 625551 );

	local nowSpRatio = ReadRoleValue( _ownerID, EM_RoleValue_Mp )/ReadRoleValue( _ownerID, EM_RoleValue_MaxMp );
--	DebugMsg( 0, 0, "Hao �ǤO�H�� AfterSpRatio = "..string.format( "%.2f" , nowSpRatio ) );
	return true;
end

function Lua_703147_Skill_MonsterCharge()
	local _ownerID = OwnerID();-- _Cornowa
	local _targetID = TargetID();
	AddBuff( _targetID , 625564 , 0 , 2 );--625564�ǤO�����аO
	SetAttack( _ownerID , _targetID );
	ScriptMessage( _ownerID , 0 , 2 , "[LUA_703147_AI_MONSTERCHARGE]" , 0 );	-- [108825]�C�n��q�A�ǳ��H�B�ļ��I
end