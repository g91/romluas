--Author : K.J. Aris
--Version : 140528
--Ignitor : none
--Script : 703189

local _Lua_703189_AI_GlobalVars = nil;

--Z34B3���۳�p��   ��ServerScript 703178�I�s
function Lua_703189_SquadCreater( _masterID )--It's a Closure
	local _squads = {};
	local _maxSquad = -1;
	local _masterID = _masterID or OwnerID();
	local function CreateSquad( _eggIDs )
		if ( #_squads < _maxSquad or _maxSquad <= -1 ) then
			DebugMsg( 0 , 0 , "--CreateSquad _squadNum : "..#_squads );	
			local _squad = Lua_703189_AI_Init( _masterID , #_squads , _eggIDs );
			table.insert( _squads , _squad );
		else
			DebugMsg( 0 , 0 , "--Squad Maxinum Reached : "..#_squads );
			return
		end	
	end

	return _squads , CreateSquad;
end

function Lua_703189_AI_Init( _masterID , _squadNum , _eggIDs )--controller  
	DebugMsg( 0 , 0 , "--Lua_703189_AI_Init : Z34B1_Squad      V 140606  MasterID : ".._masterID.." : ".._squadNum );
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
	local _bossRottenGUIDs = { 109189 , 109189 , 109189 };--�G�����F
	local _bossPusGUIDs = { 109190 , 109190 , 109190 };--�w�����F
	local _bossClawGUIDs = { 109191 , 109191 , 109191 };--�������F
	local _bossEyeGUIDs = { 109192 , 109192 , 109192 };--�Ų����F

	--�ѼƳ]�w��
	if ( _Lua_703189_AI_GlobalVars == nil ) then _Lua_703189_AI_GlobalVars = {}; end
	if ( _Lua_703189_AI_GlobalVars[ _roomID ] == nil ) then _Lua_703189_AI_GlobalVars[ _roomID ] = {}; end
	_Lua_703189_AI_GlobalVars[ _roomID ][ _squadNum ] = {	--non 
					_masterID = _masterID , 
					_bossID = 0 ,--�H_Rotten���N��( ����L�禡�n�� _bossID)

					_bossVOs = {
						_Rotten = {
							_id = 0,
							_guid = _bossRottenGUIDs[ _difficulty ] ,
							_flagPos = 5 , 					--�X�Ц�m
							_referanceEggID = 0 , --�ѦҪ��Znpc(�|���b�L����m)

							_masterID = _masterID ,
							_squadNum = _squadNum , 
							IndiSpec = nil ,	--function�ӧO���S��y�{
							},	
									
						_Pus = {
							_id = 0,
							_guid = _bossPusGUIDs[ _difficulty ] ,
							_flagPos = 6 , 					--�X�Ц�m
							_referanceEggID = 0 , --�ѦҪ��Znpc(�|���b�L����m)

							_masterID = _masterID ,
							_squadNum = _squadNum , 
							IndiSpec = nil ,	--function�ӧO���S��y�{
							},

						_Claw = {
							_id = 0,
							_guid = _bossClawGUIDs[ _difficulty ],
							_flagPos = 7 , 					--�X�Ц�m
							_referanceEggID = 0 , --�ѦҪ��Znpc(�|���b�L����m)

							_masterID = _masterID ,
							_squadNum = _squadNum , 
							IndiSpec = nil ,	--function�ӧO���S��y�{
							},

						_Eye = {
							_id = 0,
							_guid = _bossEyeGUIDs[ _difficulty ],
							_flagPos = 8 , 					--�X�Ц�m
							_referanceEggID = 0 , --�ѦҪ��Znpc(�|���b�L����m)

							_masterID = _masterID ,
							_squadNum = _squadNum , 
							IndiSpec = nil ,	--function�ӧO���S��y�{
							},
						},

					_roomID = _roomID ,
					_ctrlID = 0 ,
					_ctrlGUID = 108705 ,--���ID

					_flagGUID = 781426 , --781426 Z34_4���κX��

					ExtObj = nil , 
					DelExtObjs = nil , 

					};
	--��Ū��T
	local _gConsts = _Lua_703189_AI_GlobalVars[ _roomID ][ _squadNum ];

	--���� Boss
	local _masterHP = ReadRoleValue( _masterID , EM_RoleValue_HP );
	local _bossID = 0;
	local _eggIndex = 1;
	for _bossName , _bossVO in pairs( _gConsts._bossVOs ) do
		_bossVO._referanceEggID = _eggIDs[ _eggIndex ];
		DebugMsg( 0 , 0 , " EggID : "..tostring( _bossVO._referanceEggID ) );
		_bossID = Lua_703189_GenerateBoss( _bossVO , _roomID , _squadNum );
		_gConsts._bossVOs[ _bossName ]._id = _bossID;--

		_eggIndex = _eggIndex + 1;
	end

	_gConsts._bossID = _gConsts._bossVOs._Rotten._id;--presiding Boss --_Rotten
		
	return _gConsts._bossVOs;
end--function Lua_703189_AI_Init( _inputCtrID )

function Lua_703189_GenerateBoss( _bossVO , _roomID , _squadNum )
	--Lua_DavisDelObj( _bossVO._guid );
	local _gConsts = _Lua_703189_AI_GlobalVars[ _roomID ][ _squadNum ];
	local _bossID = 0;

	local _referanceEggID = _bossVO._referanceEggID;
	if ( _referanceEggID ~= nil and _referanceEggID ~= 0 ) then--��S�����w�]�ѷӦ�m�� �ιw�]Flag ��
		local x,y,z,dir = DW_Location( _referanceEggID );
		_bossID = CreateObj( _bossVO._guid , x,y,z,dir , 1 );
	else
		_bossID = CreateObjByFlag( _bossVO._guid , _gConsts._flagGUID , _bossVO._flagPos , 1 );
	end
	AddToPartition( _bossID , _roomID ); 

	--CastSpell( _bossID , _bossID , 851912 );
	PlayMotion( _bossID , ruFUSION_ACTORSTATE_EMOTE_IDLE2 );

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false );
	SetModeEx( _bossID , EM_SetModeType_Fight , true );
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true );
	SetModeEx( _bossID , EM_SetModeType_Strikback , true );

	WriteRoleValue( _bossID , EM_RoleValue_PID , _squadNum );--�N�p���s���g�JNPC���W �H��K����
	WriteRoleValue( _bossID , EM_RoleValue_Register1 , _bossVO._masterID );--�N�p���s���g�JNPC���W �H��K����

	Lua_703189_AI_Count( _gConsts._masterID , 1 );--�������W�p�Ǽƶq +1 -1

	--DebugMsg( 0 , 0 , "--NpcID : ".._bossID );
	
	return _bossID;
end--function Lua_703189_GenerateBoss( _bossVO )

function Lua_703189_ClearAll( _specRoomID )--for test
	if ( _Lua_703189_AI_GlobalVars ~= nil ) then
		--DebugMsg( 0 , 0 , "--Lua_703189_ClearAll : all values will be cleared , reinit this by redeploying IGNITOR" );--
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
			local _squadPack = _Lua_703189_AI_GlobalVars[ _specRoomID ];
			if ( _squadPack ~= nil ) then
				for _squadNum , _valuePack in pairs( _squadPack ) do--�M���C�@�Ӥp�����ƾڥ]
					ClearData( _valuePack );
				end
			end
			_Lua_703189_AI_GlobalVars[ _specRoomID ] = nil;
			return;
		end

		for _roomID , _squadPack in pairs( _Lua_703189_AI_GlobalVars ) do
			
			for _squadNum , _valuePack in pairs( _squadPack ) do--�M���C�@�Ӥp�����ƾڥ]
				ClearData( _valuePack );
			end

			_Lua_703189_AI_GlobalVars[ _roomID ] = nil;
		end
	end
end--function Lua_703189_ClearAll()

function Lua_703189_AI_reignite( _specRoomID , _masterID , _squadNum )--for test
	--DebugMsg( 0 , 0 , "--Lua_703189_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	Lua_703189_ClearAll( _roomID );
	Lua_703189_AI_Init( _masterID , _squadNum );
end


function Lua_703189_AI_onFight()--���h������ �u��b�䤤�@�����W  �ҪO�г]"�s��"
	--�԰���l
	local _bossID = OwnerID();--_Domisource
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local _squadNum = ReadRoleValue( _bossID , EM_RoleValue_PID );
	local _masterID = ReadRoleValue( _bossID , EM_RoleValue_Register1 );
	--DebugMsg( 0 , 0 , "--Lua_703189_AI_onFight ".._bossID.." RID : ".._roomID );

	if ( _Lua_703189_AI_GlobalVars == nil ) then Lua_703189_AI_reignite( _roomID , _masterID , _squadNum ); return; end

	local _gConsts = _Lua_703189_AI_GlobalVars[ _roomID ][ _squadNum ];

	if ( _gConsts == nil ) then Lua_703189_AI_reignite( _roomID ); return; end

	DebugMsg( 0 , 0 , "--Engage Msg : ".._roomID.." : ".._squadNum.." : ".._masterID );

	if ( CheckID( _gConsts._ctrlID ) == true and ( ReadRoleValue( _gConsts._ctrlID , EM_RoleValue_Register1 ) == 1) ) then--��W�@���`��������٦b�@�ʮɫh���ʧ@  (����_Shadow���ͮɭ���Ĳ�o�԰�)
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

	--��Ū��T

	CallPlot( _ctrlID , "Lua_703189_AI_Engage" , _roomID , _squadNum , _masterID );--�Ұʾ԰��y�{

	--ScriptMessage(_bossID,0,2,"[Lua_703189_AI_OnFight]",0);

end--function Lua_703189_AI_onFight()

function Lua_703189_AI_Engage( _roomID , _squadNum , _masterID )
	DebugMsg( 0 , _roomID , "--Lua_703189_AI_Engage : ".._roomID.." : ".._squadNum.." : ".._masterID );
	local _gConsts = _Lua_703189_AI_GlobalVars[ _roomID ][ _squadNum ];
	local _bossID = _gConsts._ctrlID;--_gConsts._bossID;--take ctrl as boss , because there's no guarantee that presiding Boss is always alive
	local _bossVOs = _gConsts._bossVOs;--there's 3 bosses in there
	local _ctrlID = _gConsts._ctrlID;
	
	--Routines Vars
	local _clock = 0;

	local _engaging = true;
	local _allBossAreDead = false;
	--Routines Vars
	
	local _timeTick = 1;--Time Speed
	local _miniTimeTick = _timeTick*10;--Time Speed for Sleep

	local _GCD = _gConsts._genuineBodySwitchCD;
	_GCD = 0;

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
				--��BOSS���F
				Lua_703189_AI_Count( _masterID , -1 );
			end
		end
		
		--DebugMsg(0,0,"--_allBossAreDead : "..tostring(_allBossAreDead).."   --_engaging : "..tostring(_engaging) );
		if ( _allBossAreDead == true ) then-- boss �������`�� �D�Ԧ��\
			DebugMsg( 0 , _roomID , "------Bosses are dead !!  "..tostring(_allBossAreDead) );
			--Lua_703189_AI_Conquered( _roomID , _squadNum );
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			--Lua_703189_AI_Conquered( _roomID , _squadNum );
			break;
		end
		-------------------------------------END--------�԰���������


		-------------------------------------------------Timers
		if ( _GCD > 0 ) then _GCD = _GCD - _timeTick; end
		---------------------------------------END-------Timers
	
		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��
			
		end--for --switch case simulation

	end--while

	DelObj( _ctrlID );

	DebugMsg( 0 , 0 , "--Out of loop" );
end--function Lua_703189_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values

-----------------------------------sub functions
function Lua_703189_AI_Count( _masterID , _addition )
	local _headCounter = ReadRoleValue( _masterID , EM_RoleValue_Register10 ) or 0;--�������W�p�Ǽƶq
	_headCounter = _headCounter + _addition;
	WriteRoleValue( _masterID , EM_RoleValue_Register10 , _headCounter );
end


------------------------------------------------------------------------------------------------�ӧO�����S��B�z�{��

---------------------------------------------------------------------END------------------------�ӧO�����S��B�z�{��	

------------------------------------------------------------------------------------------�H�U�O�ޯ�