--Author : K.J. Aris
--Version : 140528
--Ignitor : none
--Script : 703183

local _Lua_703183_AI_GlobalVars = nil;

--Z34B1���۳�p��   ��ServerScript 703175�I�s
function Lua_703183_SquadCreater( _masterID )--It's a Closure
	local _squads = {};
	local _maxSquad = -1;
	local _masterID = _masterID or OwnerID();
	local function CreateSquad()
		if ( #_squads < _maxSquad or _maxSquad <= -1 ) then
			DebugMsg( 0 , 0 , "--CreateSquad _squadNum : "..#_squads );	
			local _squad = Lua_703183_AI_Init( _masterID , #_squads );
			table.insert( _squads , _squad );
		else
			DebugMsg( 0 , 0 , "--Squad Maxinum Reached : "..#_squads );
			return
		end	
	end

	return _squads , CreateSquad;
end

function Lua_703183_AI_Init( _masterID , _squadNum )--controller  
	DebugMsg( 0 , 0 , "--Lua_703183_AI_Init : Z34B1_Squad      V 140606  MasterID : ".._masterID.." : ".._squadNum );
	local _ctrlID = _masterID;

	-------------------------------------------initialize settings
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );
	local _zoneID = ReadRoleValue( _ctrlID , EM_RoleValue_ZoneID );

	local _difficulty = 1;
	local _frenzyCD = 9999999;--�g�ɰѼ�

	if ( _zoneID == 179 ) then
		_difficulty = 2;
		_frenzyCD = 480;
	end

	if ( _zoneID == 180 ) then
		_difficulty = 3;
		_frenzyCD = 360;
	end
	---------------------------------------

	----------------------------END----------�g�ɰѼ�
	--�Ш������׶��ǩ�m
	local _bossManaGUIDs = { 109139 , 109148 , 109152 };--�k��
	local _bossFireGUIDs = { 109140 , 109149 , 109153 };--���t
	local _bossIceGUIDs = { 109141 , 109150 , 109154 };--�B�t

	--�ѼƳ]�w��
	if ( _Lua_703183_AI_GlobalVars == nil ) then _Lua_703183_AI_GlobalVars = {}; end
	if ( _Lua_703183_AI_GlobalVars[ _roomID ] == nil ) then _Lua_703183_AI_GlobalVars[ _roomID ] = {}; end
	_Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ] = {	--non 
					_masterID = _masterID , 
					_bossID = 0 ,--�H_Mana���N��( ����L�禡�n�� _bossID)

					_bossVOs = {
						_Mana = {
							_id = 0,
							_guid = _bossManaGUIDs[ _difficulty ] ,
							_flagPos = 4 , 					--�X�Ц�m

							_masterID = _masterID ,
							_squadNum = _squadNum , 
							IndiSpec = nil ,	--function�ӧO���S��y�{
							_defaultBuffGUID = 525929--�X�͹w�]BUFF
							},	
									
						_Fire = {
							_id = 0,
							_guid = _bossFireGUIDs[ _difficulty ] ,
							_flagPos = 5 , 					--�X�Ц�m

							_masterID = _masterID ,
							_squadNum = _squadNum , 
							IndiSpec = Lua_703183_Skill_Fire_Spec ,	--function�ӧO���S��y�{
							_defaultBuffGUID = 525930--�X�͹w�]BUFF
							},

						_Ice = {
							_id = 0,
							_guid = _bossIceGUIDs[ _difficulty ],
							_flagPos = 6 , 					--�X�Ц�m

							_masterID = _masterID ,
							_squadNum = _squadNum , 
							IndiSpec = Lua_703183_Skill_Ice_Spec ,	--function�ӧO���S��y�{
							_defaultBuffGUID = 525931--�X�͹w�]BUFF
							},
						},

					_roomID = _roomID ,
					_ctrlID = 0 ,
					_ctrlGUID = 108705 ,--���ID

					_flagGUID = 781423 , --781423 Z34_1���κX��

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					_bossReviveCD = 10 ,

					};
	--��Ū��T
	local _gConsts = _Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ];

	

	--���� Boss
	local _bossID = 0;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossID = Lua_703183_GenerateBoss( _bossVO , _roomID , _squadNum );
		_gConsts._bossVOs[ _bossName ]._id = _bossID;--
	end

	_gConsts._bossID = _gConsts._bossVOs._Mana._id;--presiding Boss --_Mana

	for _squadNum , _VO in pairs( _Lua_703183_AI_GlobalVars[ _roomID ] ) do
		DebugMsg( 0 , 0 , "---------------_squadNum : ".._squadNum.."  ,  ".._VO._bossID );
	end	
		
	return _gConsts._bossVOs;
end--function Lua_703183_AI_Init( _inputCtrID )

function Lua_703183_GenerateBoss( _bossVO , _roomID , _squadNum )
	--Lua_DavisDelObj( _bossVO._guid );
	local _gConsts = _Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ];
	--local _bossID = CreateObjByFlag( _bossVO._guid , _gConsts._flagGUID , _bossVO._flagPos , 1 );
	--AddToPartition( _bossID , _roomID ); 
	local x,y,z,dir = DW_Location( _gConsts._flagGUID , _bossVO._flagPos );
	local _bossID = _Lua_703175_AI_GlobalVars[ _roomID ].ExtObj( _bossVO._guid , x,y,z,dir );

	CastSpell( _bossID , _bossID , 851912 );

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false );
	SetModeEx( _bossID , EM_SetModeType_Fight , true );
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );

	WriteRoleValue( _bossID , EM_RoleValue_PID , _squadNum );--�N�p���s���g�JNPC���W �H��K����
	WriteRoleValue( _bossID , EM_RoleValue_Register1 , _bossVO._masterID );--�N�p���s���g�JNPC���W �H��K����

	Lua_703183_AI_Count( _gConsts._masterID , 1 );--�������W�p�Ǽƶq +1 -1

	DebugMsg( 0 , 0 , "--NpcID : ".._bossID.." : ".._bossVO._defaultBuffGUID );
	AddBuff( _bossID , _bossVO._defaultBuffGUID , 0 , -1 );
	
	return _bossID;
end--function Lua_703183_GenerateBoss( _bossVO )

function Lua_703183_ClearAll( _specRoomID )--for test
	if ( _Lua_703183_AI_GlobalVars ~= nil ) then
		--DebugMsg( 0 , 0 , "--Lua_703183_ClearAll : all values will be cleared , reinit this by redeploying NPC 109084" );--
		local function ClearData( _valuePack )
			if ( _valuePack.DelExtObjs ~= nil ) then
				_valuePack.DelExtObjs();
			end

			for _bossName , _bossVO in pairs( _valuePack._bossVOs ) do
				DelObj( _bossVO._id );
			end

			DelObj( _valuePack._ctrlID );
		end

		if ( _specRoomID ~= nil ) then
			local _squadPack = _Lua_703183_AI_GlobalVars[ _specRoomID ];
			if ( _squadPack ~= nil ) then
				for _squadNum , _valuePack in pairs( _squadPack ) do--�M���C�@�Ӥp�����ƾڥ]
					ClearData( _valuePack );
				end
			end
			_Lua_703183_AI_GlobalVars[ _specRoomID ] = nil;
			return;
		end

		for _roomID , _squadPack in pairs( _Lua_703183_AI_GlobalVars ) do
			
			for _squadNum , _valuePack in pairs( _squadPack ) do--�M���C�@�Ӥp�����ƾڥ]
				ClearData( _valuePack );
			end

			_Lua_703183_AI_GlobalVars[ _roomID ] = nil;
		end
	end
end--function Lua_703183_ClearAll()

function Lua_703183_AI_reignite( _specRoomID , _masterID , _squadNum )--for test
	--DebugMsg( 0 , 0 , "--Lua_703183_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703183_ClearAll( _roomID );
	Lua_703183_AI_Init( _masterID , _squadNum );
end


function Lua_703183_AI_onFight()--���h������ �u��b�䤤�@�����W  �ҪO�г]"�s��"
	--�԰���l
	local _bossID = OwnerID();--_Domisource
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local _squadNum = ReadRoleValue( _bossID , EM_RoleValue_PID );
	local _masterID = ReadRoleValue( _bossID , EM_RoleValue_Register1 );
	--DebugMsg( 0 , 0 , "--Lua_703183_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703183_AI_GlobalVars == nil ) then Lua_703183_AI_reignite( _roomID , _masterID , _squadNum ); return; end

	local _gConsts = _Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ];

	if ( _gConsts == nil ) then Lua_703183_AI_reignite( _roomID , _masterID , _squadNum ); return; end

	DebugMsg( 0 , 0 , "--Engage Msg : ".._roomID.." : ".._squadNum.." : ".._masterID );

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--��W�@���`��������٦b�@�ʮɫh���ʧ@  (����_Ice���ͮɭ���Ĳ�o�԰�)
		DebugMsg( 0 , _roomID , "--Combat Sequence Duplicated : New Sequence Rejected !!" );--presiding boss may revived or rejoin the fight while combat is not over yet
		return;
	end
	--����P�l������
	local _ctrlID , _AddParasite , _RemoveParasites = Lua_703182_ExtendObjectClosure( _masterID );

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

	
	--��Ū��T

	CallPlot( _ctrlID , "Lua_703183_AI_Engage" , _roomID , _squadNum , _masterID );--�Ұʾ԰��y�{

	--ScriptMessage(_bossID,0,2,"[Lua_703183_AI_OnFight]",0);

end--function Lua_703183_AI_onFight()

function Lua_703183_AI_Engage( _roomID , _squadNum , _masterID )
	--local _ownerID = OwnerID();
	--local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
	--local _squadNum = ReadRoleValue( _ownerID , EM_RoleValue_PID );
	--local _masterID = ReadRoleValue( _ownerID , EM_RoleValue_Register1 );
	DebugMsg( 0 , _roomID , "--Lua_703183_AI_Engage : ".._roomID.." : ".._squadNum.." : ".._masterID );
	local _gConsts = _Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ];
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
		_Mana = -1 ,
		_Fire = -1 ,
		_Ice = -1 
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
			--DebugMsg( 0 , 0 , "--boss : "..tostring(CheckID( _currentBossID )).." : "..tostring( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ) );
			if ( CheckID( _currentBossID ) == true ) and ( ReadRoleValue( _currentBossID , EM_RoleValue_IsDead ) ~= 1 ) then--�����@BOSS�s���� �N���٥�����
				_allBossAreDead = false;
				if ( _bossVO.IndiSpec ~= nil ) then _bossVO.IndiSpec( _bossVO , _clock ); end--�X�٬��۪��ɭ�  ���K����ӧO���S��y�{
				if( ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) ~= 0 ) then--�����@BOSS���b�԰� �N���٦����a�s�� 
					--DebugMsg(0,0,_currentBossID.." ���b�l�����a : "..ReadRoleValue( _currentBossID , EM_RoleValue_AttackTargetID ) );
					_engaging = true;--
				end	
			else
				--DebugMsg( 0 , 0 , "------dead boss : ".._bossName );
				--��BOSS���F  ���K�]�w�`�̴_��CD
				if ( _CD[_bossName] <= -1 ) then
					DebugMsg( 0 , _roomID , "------boss dead , set revive : ".._bossName );
					_CD[_bossName] = _gConsts._bossReviveCD;	--�@�s����  �S���������b �h�]�w�`�̴_��CD	
				
					Lua_703183_AI_Count( _masterID , -1 );
				end
			end
		end
		
		--DebugMsg(0,0,"--_allBossAreDead : "..tostring(_allBossAreDead).."   --_engaging : "..tostring(_engaging) );
		if ( _allBossAreDead == true ) then-- boss �������`�� �D�Ԧ��\
			DebugMsg( 0 , _roomID , "------Bosses are dead !!  "..tostring(_allBossAreDead) );
			Lua_703183_AI_BurstDamageToMaster( _masterID );
			Lua_703183_AI_Conquered( _roomID , _squadNum );
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			Lua_703183_AI_Conquered( _roomID , _squadNum );
			--Lua_703183_AI_Reset( _roomID );
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

		--[[
		--�g�ɾ���
		if ( _clock >= _frenzyCD and ( _isFrenzied == false ) ) then
				_isFrenzied = true;
				for _bossName , _bossVO in pairs( _bossVOs ) do--�ˬdBoss���S���q�q���۶ø�
					_currentBossID = _bossVO._id;
					AddBuff( _currentBossID , 625849 , 0 , -1 );-- 625849 ����
				end
				DebugMsg( 0 , _roomID , "-----�g�g��----" );
				--ScriptMessage(_bossID,0,2,"[Lua_703183_AI_Frenzy]",0);
		end
		]]--		
	
		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��
			
			
			for _bossName , _cdTime in pairs( _CD ) do--Boss����	�@�s����
				if ( _cdTime == 0 ) then
					_gConsts._bossVOs[_bossName]._id = Lua_703183_GenerateBoss( _bossVOs[_bossName] , _roomID , _squadNum );--���͹�����BOSS
					DebugMsg( 0 , _roomID , "--revive : ".._bossName );
					--ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703183_AI_HasRevived]" , 0 );
					_CD[_bossName] = -1;--lock up after revived , unlock till the next cycle( when somebody dead ) 
					_GCD = 2;
					--break;
				end

				if ( _cdTime > 0 and _cdTime == 10 ) then--���ͭ˼ƴ���	�C10��
					--ScriptMessage( _bossID , 0 , 2 , tostring(_bossName).."[Lua_703183_AI_WillReviveIn10sec]" , 0 );
				end
			
			end
			

			--[[
			if( _CD._timer2 <= 0 )then
				DebugMsg( 0 , 0 , "--_timer2 release" );
				_CD._timer2 = 15;
				_GCD = 2;
			end
			--]]
			
		end--for --switch case simulation

	end--while
	DebugMsg( 0 , 0 , "--Lua_703183--Out of loop" );
end--function Lua_703183_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values

function Lua_703183_AI_Conquered( _roomID , _squadNum )
	DebugMsg( 0 , 0 , "--Lua_703183_AI_Conquered" );
	local _gConsts = _Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ];--for read
	local _bossVOs = _gConsts._bossVOs;

	if ( _gConsts == nil ) then return; end
	WriteRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 , 0 );--����԰�MARK	0 = �D�԰� , 1 = �԰���

	--Delobj( _gConsts._frontDoorID );	--�R���e��
	--Delobj( _gConsts._backDoorID );	--�R�����

	--ScriptMessage(_gConsts._ctrlID,0,2,"[$MUTE]".."[Lua_703183_AI_Conquered]",0);	

	local _bossID = 0;
	for _bossName , _bossVO in pairs( _bossVOs ) do--�����԰�
		_bossID = _bossVO._id;
		--DW_UnFight( _bossID , true );
		DelObj( _bossID );
	end

	_gConsts.DelExtObjs();	--clear all extend items
	_Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ] = nil;	--clear all values
	--Lua_703183_ClearAll( _roomID );
	

end--function Lua_703183_AI_Conquered( _roomID )

-----------------------------------sub functions
function Lua_703183_AI_BurstDamageToMaster( _masterID )--�C�����@�ӳ��]3���^��t����|��HP 5%�C
	--��-5%�ޯ�
	local _maxHP = ReadRoleValue( _masterID , EM_RoleValue_MaxHP );
	local _currentHP = ReadRoleValue( _masterID , EM_RoleValue_HP );
	WriteRoleValue( _masterID , EM_RoleValue_HP , _currentHP - _maxHP*0.05 );
end

function Lua_703183_AI_Count( _masterID , _addition )
	local _headCounter = ReadRoleValue( _masterID , EM_RoleValue_Register10 ) or 0;--�������W�p�Ǽƶq
	_headCounter = _headCounter + _addition;
	WriteRoleValue( _masterID , EM_RoleValue_Register10 , _headCounter );
end

------------------------------------------------------------------------------------------------�ӧO�����S��B�z�{��
----------------------------------------------------------ice	
function Lua_703183_AI_Ice_Init()
	local _ownerID = OwnerID();
	--SetPlot( _ownerID , "range" , "Lua_703183_AI_Ice_Freeze" , 30 );--30�X���|�Q�ᵲ
	DebugMsg( 0 , 0 , "Lua_703182_AI_Ice_Init" );
	--CallPlot( _ownerID , "Lua_703183_Skill_Ice_Freeze" );
end

function Lua_703183_Skill_Ice_Spec( _bossVO , _clock )--caution : this function is in the loop
	local _ownerID = _bossVO._id;
	SysCastSpellLv( _ownerID , _ownerID , 851931 , 0 );--851931�ᾮ��
	
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _squadNum = ReadRoleValue( _ownerID , EM_RoleValue_PID );
	local _gConsts = _Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ];

	--��P���t�Z���Ӫ��
	local _npcIDs = SearchRangeNPC( _ownerID , 75 );
	for _index , _npcID in pairs( _npcIDs ) do
		
		if ( ReadRoleValue( _npcID , EM_RoleValue_OrgID ) == 109144 and CheckDistance( _ownerID , _npcID , 2 ) ) then--���|
			CancelBuff_NoEvent( _npcID , 625924 );--625924�������  --��B�t�Ǩ��L�|�����ĪG�óѤU���|�C
		end

		if ( ReadRoleValue( _npcID , EM_RoleValue_OrgID ) == _gConsts._bossVOs._Fire._guid ) then--109141���t
			SysCastSpellLv( _ownerID , _ownerID , 851932 , 0 );--851932�����۫g
			break;
		end
	end

end

function Lua_703183_AI_Ice_Dead()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _squadNum = ReadRoleValue( _ownerID , EM_RoleValue_PID );
	local _gConsts = _Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ];
	
	local x,y,z,dir = DW_Location( _ownerID );
	--local _iceLagacyID = _gConsts.ExtObj( 109145 , x,y,z,dir );--109145���B
	local _iceLagacyID = CreateObj( 109145 , x,y,z,dir , 1 );--109145���B
	AddToPartition( _iceLagacyID , _roomID );
	SetModeEx( _iceLagacyID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _iceLagacyID , EM_SetModeType_HideName , true );	--����ܦW��
	SetModeEx( _iceLagacyID , EM_SetModeType_NotShowHPMP , true );	--����ܦ��
	SetModeEx( _iceLagacyID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _iceLagacyID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _iceLagacyID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _iceLagacyID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _iceLagacyID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG
	
	WriteRoleValue( _iceLagacyID , EM_RoleValue_LiveTime , 15 );--�w�w15�����
	CallPlot( _iceLagacyID , "Lua_703182_AI_IceLagacy_Loop" , _iceLagacyID  );

end

function Lua_703182_AI_IceLagacy_Loop( _iceLagacyID )
	while true do
		SysCastSpellLv( _iceLagacyID , _iceLagacyID , 851931 , 0 );--851931�ᾮ��
		Sleep( 10 );
	end
end
---------------------------------------------end----------ice

----------------------------------------------------------fire
function Lua_703183_Skill_Fire_Spec( _bossVO , _clock )--caution : this function is in the loop
	local _ownerID = _bossVO._id;
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _squadNum = ReadRoleValue( _ownerID , EM_RoleValue_PID );
	local _gConsts = _Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ];
	--�������B
	local x,y,z,dir = DW_Location( _ownerID );
	--local _footPrintID = _gConsts.ExtObj( 109146 , x,y,z,dir );--109146���K
	local _footPrintID = CreateObj( 109146 , x,y,z,dir , 1 );--109146���K
	
	SetModeEx( _footPrintID , EM_SetModeType_SearchenemyIgnore , true );---���󤣷|�Q�j�M
	SetModeEx( _footPrintID , EM_SetModeType_HideName , true );  		---�����Y�W�O�_��ܦW��
	SetModeEx( _footPrintID , EM_SetModeType_HideMinimap , true );		---����O�_�b�p�a�ϤW���
	SetModeEx( _footPrintID , EM_SetModeType_Searchenemy , false );   	--����
	SetModeEx( _footPrintID , EM_SetModeType_Mark , false );			--�аO
	SetModeEx( _footPrintID , EM_SetModeType_Fight , false ); 			--���
	SetModeEx( _footPrintID , EM_SetModeType_Move , false );			--����
	SetModeEx( _footPrintID , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( _footPrintID , EM_SetModeType_Strikback , false );		--����
	SetModeEx( _footPrintID , EM_SetModeType_Show , true );
	WriteRoleValue( _footPrintID , EM_RoleValue_LiveTime , 6 );

	AddToPartition( _footPrintID , _roomID );
	AddBuff( _footPrintID , 625927 , 0 , -1 );

	CallPlot( _footPrintID , "Lua_703183_Skill_Fire_FootPrint_Loop" , _footPrintID  );

end

function Lua_703183_Skill_Fire_FootPrint_Loop( _footPrintID )
	while true do
		SysCastSpellLv( _footPrintID , _footPrintID , 851933 , 0 );--851933�������B
		Sleep( 5 );
	end

end

function Lua_703183_Skill_HotZone_Cast()--�������I��
	local _ownerID = OwnerID();--���t
	local _targetID = TargetID();--Victim

	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _squadNum = ReadRoleValue( _ownerID , EM_RoleValue_PID );
	local _gConsts = _Lua_703183_AI_GlobalVars[ _roomID ][ _squadNum ];

	local x,y,z,dir = DW_Location( _targetID );

	local _vocanID = CreateObj( 109144 , x,y,z,dir , 1 );--109144���|   --�гy�@�Ӥ��|
	AddToPartition( _vocanID , _roomID );
	WriteRoleValue( _vocanID , EM_RoleValue_PID , _ownerID );--�������|���D�H  (�ѥD�H�I��ˮ`)
end

--���|
function Lua_703183_Item_Vocan_Init()
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );
	SetModeEx( _ownerID , EM_SetModeType_Move , false );
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );
	
	CallPlot( _ownerID , "Lua_703183_Item_Vocan_Loop" , _ownerID  );
end

function Lua_703183_Item_Vocan_Loop( _vocanID )--light it up every 20 sec
	while true do--20���U
		--SysCastSpellLv( _footPrintID , _footPrintID , 851933 , 0 );--851933�������B
		if ( CheckID( _vocanID ) and CheckBuff( _vocanID , 625924 ) == false ) then
			AddBuff( _vocanID , 625924 , 0 , -1 );--625924�������
			Lua_703183_Skill_HotZoneBuff_OnAdd( _vocanID );
		end
		Sleep( 200 );
	end

	return;
	
end

function Lua_703183_Skill_HotZoneBuff_OnAdd( _ownerID )
	local _masterID = ReadRoleValue( _ownerID , EM_RoleValue_PID );
	local x,y,z,dir = DW_Location( _ownerID );
	while CheckID( _ownerID ) and CheckBuff( _ownerID , 625924 ) do--�C��I��������
		SysCastSpellLv_Pos( _masterID , x,y,z , 852016 , 0 );--852016�������  --�����t�b���|��m�I��Ӷˮ`
		Sleep( 10 );
	end

	return;
end
---------------------------------------------end----------fire

---------------------------------------------------------------------END------------------------�ӧO�����S��B�z�{��	

------------------------------------------------------------------------------------------�H�U�O�ޯ�
function Lua_703183_Skill_IceDust()--�B��
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	CancelBuff_NoEvent( _targetID , 625922 );--625922�Ѱ� �������B
	return;
end