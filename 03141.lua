--Author : K.J. Aris
--Version : 14.02.12.
--Ignitor : 108896
--NPC : 108809--raid
--Script : 703141
local Skill = {}
Skill.Lv = {}
Skill.Lv[851701] = {0,0,0}
Skill.Lv[851702] = {0,0,0}
Skill.Lv[851703] = {0,0,0}
Skill.Lv[851704] = {0,0,0}
Skill.Lv[851705] = {0,0,0}

--�ŧi�Ҧ��ޯ�N�o
Skill.CD = {}
Skill.CD[851701] = -1
Skill.CD[851702] = 10
Skill.CD[851703] = 13
Skill.CD[851705] = 17
Skill.CD[851704] = 20

local _Lua_703141_AI_GlobalVars = {};

function Lua_703141_AI_Init( _inputCtrID )--controller  NPC 108896  --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703141_AI_Init : NPC 108896      Z33-1B3  V140212 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --�H�����ư��� �N�즳����R��

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108896
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108809
	
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
	local _frenzyCD = 480;

	if ( _zoneID == 173 ) then
		_difficulty = 2;
		_frenzyCD = 360;
	end

	if ( _zoneID == 174 ) then
		_difficulty = 3;
		_frenzyCD = 9999999;
	end
	
	--�Ш������׶��ǩ�m
	local _bossGUIDs = { 108809 , 109002 , 109006 };--�J��Ĭ
	local _toxicCorpseGUIDs = { 108926 , 109003 , 109007 };--�ͬr��
	local _puppetZombieGUIDs = { 108927 , 109004 , 109008 };--���L��
	local _skullTotemGUIDs = { 108928 , 109005 , 109009 };--���s����

	--�ѼƳ]�w��
	_Lua_703141_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossGUID = _bossGUIDs[ _difficulty ] ,--�J��Ĭ
					_toxicCorpseGUID = _toxicCorpseGUIDs[ _difficulty ] ,--�ͬr��
					_puppetZombieGUID = _puppetZombieGUIDs[ _difficulty ] ,--�ͬr��
					_skullTotemGUID = _skullTotemGUIDs[ _difficulty ] ,--���s����
					_ctrlGUID = 108705 ,--���ID
					_doorGUID = 106246 , 

					_flagGUID = 781406 , --781406 Z33-1_3���κX��
					_bossFlagPos = 1 , 
					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,
					_skullTotem_1_FlagPos = 4 ,

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD
					--_skillAeCD = 30 , --�C30��|����W�Ҧ��H�I��t�����A�A��ƪ����a�I��u�Ŭr�x���v�B�Ƽƪ����a���u��v��¶�v

					};
	--��Ū��T
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];

	--���� Boss
	--local x,y,z,dir = DW_Location( _gConsts._flagGUID , _gConsts._bossFlagPos );
	Lua_DavisDelObj( _gConsts._bossGUID );--kill reduplicated
	local _bossID = CreateObjByFlag( _gConsts._bossGUID , _gConsts._flagGUID , _gConsts._bossFlagPos , 1 );--108800
	_gConsts._bossID = _bossID;--
	AddToPartition( _bossID , _roomID ); 

	SetModeEx( _bossID , EM_SetModeType_Obstruct , false);
	SetModeEx( _bossID , EM_SetModeType_Fight , true );
	SetModeEx( _bossID , EM_SetModeType_Move , true );
	SetModeEx( _bossID , EM_SetModeType_Searchenemy , true);
	SetModeEx( _bossID , EM_SetModeType_Strikback , true);

	--���ͫ��
	_gConsts._backDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._backDoorFlagPos , _gConsts._roomID );
	DebugMsg( 0 , 0 , "--Back Door ID : ".._gConsts._backDoorID );

	--delete trigger
	DelObj( _ctrlID );

	return _roomID;
end--function Lua_703141_AI_Init( _inputCtrID )

function Lua_703141_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	--Lua_703175_ClearAll( _roomID );
	Lua_703141_AI_Init();
end

function Lua_703141_AI_onFight()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	Cl_Resist_HackersFightBegin( _bossID )
	DebugMsg( 0 , 0 , "--Lua_703141_AI_onFight ".._bossID.." RID : ".._roomID );
	Lua_DavisDelObj( 108930 );--�M���G�G�y --���M���������Ϊ���L�h 
	--��Ū��T
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703141_AI_reignite( _roomID ); return; end

	--����P�l������
	local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

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
	
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );


	--generate front door

	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );
	BeginPlot( _ctrlID , "Lua_703141_AI_Engage" , 0 );

	ScriptMessage(_bossID,0,2,"[LUA_703141_AI_ONFIGHT]",0);

	--�Ұʰ��s����
	Lua_703141_Item_CreateSkullTotemDualPair( _gConsts._flagGUID , _gConsts._skullTotem_1_FlagPos );
	CallPlot( _bossID , "Cl_703141_FightAI" )
	--CallPlot( _bossID , "Cl_Resist_HackersFightBegin" );
end--function Lua_703141_AI_onFight()

function Cl_703141_FightAI()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local time = 0
	local AttackTarget = 0
	local Diff = Cl_GetDiff(172)
	--say( _bossID , "["..tostring( 851701 ).."]" )
	SysCastSpellLv( _bossID , _bossID , 851701 , 0 ) 
	while ReadRoleValue( _bossID , EM_RoleValue_IsAttackMode ) == 1 do
		sleep( 10 )
		if ReadRoleValue( _bossID , EM_RoleValue_SpellMagicID ) == 0 then
			time = time + 1
			AttackTarget = ReadRoleValue( _bossID , EM_RoleValue_AttackTargetID )
			if time%Skill.CD[851705] == 0 and 
				( ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP ) ) <= 0.5 then
				
				
				--say( _bossID , "["..tostring( 851705 ).."]" )
				CastSpellLv( _bossID , AttackTarget , 851705 , Skill.Lv[851705][Diff] ) 
			
			elseif time%Skill.CD[851704] == 0 then
				--say( _bossID , "["..tostring( 851704 ).."]" )
				CastSpellLv( _bossID , AttackTarget , 851704 , Skill.Lv[851704][Diff] ) 
				
			elseif time%Skill.CD[851703] == 0 then
				--say( _bossID , "["..tostring( 851703 ).."]" )
				CastSpellLv( _bossID , _bossID , 851703 , Skill.Lv[851703][Diff] ) 
				
			elseif time%Skill.CD[851702] == 0 then
			--	say( _bossID , "["..tostring( 851702 ).."]" )
				CastSpellLv( _bossID , _bossID , 851702 , Skill.Lv[851702][Diff] ) 
				
			end
		end
	end
end

function Lua_703141_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
	DebugMsg( 0 , 0 , "--Lua_703141_AI_Engage" );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
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
	--local _GCD = 0;--int

	--local _isFrenzied = false;
	
	local _GCD = 5;
	local _CD = {
--		_skillAeCD = _gConsts._skillAeCD ,

		}

	-----------------------------------------�g�ɰѼ�
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;

	----------------------------END----------�g�ɰѼ�

	local _hateListCounter = 0;
	local _bossHpRatio = 100;
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

		_bossHpRatio = ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP );--HP ratio
		--------------END---Routines

		-------------------------------------------------�԰���������
		if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss ���`�� �D�Ԧ��\
			DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
			Lua_703141_AI_Conquered( _roomID );
			Cl_Resist_HackersBossDead( _bossID )
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			DebugMsg( 0 , 0 , "--quit fight" );
			--Lua_703141_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
			Lua_703141_AI_Reset( _roomID );
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
				AddBuff( _bossID , 625848 , 0 , -1 );-- 625848 �ɧg
				DebugMsg( 0 , 0 , "-----�g�g��----" );
				ScriptMessage(_bossID,0,2,"[LUA_703141_AI_FRENZY]",0);
		end		


		---------------------------------------------------���q�ഫ����

		if ( _bossHpRatio > 0.5 ) then

			--_CD._skillAbandonSpiritCD = _gConsts._skillAbandonSpiritCD;--�����L�˼�( ���q�@���I�� )
		end

		-------------------------------------END--------���q�ഫ����
	
		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��

			--[[
			if( _CD._timer2 <= 0 )then
				DebugMsg( 0 , 0 , "--_timer2 release" );
				_CD._timer2 = 15;
				_GCD = 2;
			end

			if( _CD._timer3 <= 0 )then
				DebugMsg( 0 , 0 , "--_timer3 release" );
				_CD._timer3 = 20;
				_GCD = 2;
			end

			if( _CD._timer4 <= 0 )then
				DebugMsg( 0 , 0 , "--_timer4 release" );
				_CD._timer4 = 25;
				_GCD = 2;
			end
			]]--
			
		end

		--[[if _clock%10 then
			
		end]]--
	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703141_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703141_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703141_AI_Reset" );

	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	
	local _bossID = _gConsts._bossID;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703141_AI_RESET]",0);

	DW_UnFight( _bossID , true );

	Delobj( _frontDoorID );	--�R���e��
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 20 );

	DelFromPartition( _bossID );

	Sleep( 50 );

	DW_UnFight( _bossID , false );
	SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos );
	AddToPartition( _bossID , _roomID );
	
end--function Lua_703141_AI_Reset( _roomID )

function Lua_703141_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703141_AI_Conquered" );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];--for read

	if( _gConsts == nil ) then return; end
	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����

	ScriptMessage(_gConsts._bossID,0,2,"[$MUTE]".."[LUA_703141_AI_CONQUERED]",0);	
	
	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703141_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	--Cl_Resist_HackersBossDead();
end--function Lua_703141_AI_Conquered( _roomID )


-----------------------------------sub functions



--------------------------------------------------------------------------------------------------skill functions below
-------------------------------------------------------------------�ͬr��
function Lua_703141_Skill_BodyExplode()
	local _ownerID = OwnerID();

	KillID( _ownerID , _ownerID );

	return true;
end
------------------------------------------------------END----------�ͬr��

--578658 FX_�ͬr�X��
--model/fx/skill/boss_skill/istar/act_02_t_down_i.ros



-------------------------------------------------------------------------------------------------------------------------------------------------���L��
function Lua_703141_NPC_PuppetZombie_Init()
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--��ܦW��
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--��ܦ��
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _ownerID , EM_SetModeType_Move , true );		--����
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--����
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--����
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--�����׮ĪG
	WriteRoleValue( _ownerID , EM_RoleValue_IsWalk , 1 );--�����a
	--AddBuff( _ownerID , 625522 , 0 , -1 );--625522���L�ͯS��
	CallPlot( _ownerID , "Lua_703141_NPC_PuppetZombie_WalkAround" );
	CallPlot( _ownerID , "Lua_703141_NPC_PuppetZombie_RottenLiquid" );
	return true;
end

function Lua_703141_NPC_PuppetZombie_WalkAround()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local x,y,z,dir = 0;
	local _time = 0;
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	local _flagGUID = _gConsts._flagGUID;
	local _flagPos = DW_Rand( 10 );
	local _changeDirTime = 10 + DW_Rand( 6 ) * 10;
	while ( true ) do
		LuaFunc_MoveToFlag( _ownerID , _flagGUID , _flagPos , 30 );
		Sleep( _changeDirTime );
		_flagPos = DW_Rand( 11 );
		_changeDirTime = 10 + DW_Rand( 6 ) * 10;
	end
end

function Lua_703141_NPC_PuppetZombie_RottenLiquid()
	DebugMsg( 0 , 0 , "----Lua_703141_NPC_PuppetZombie_RottenLiquid" );
	--108930
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local x,y,z,dir = 0;
	local _rottenLiquidGUID = 108930;--108930�G�G�u
	local _rottenLiquidEffectGUID = 625520;--625520�G�G�u
	local _rottenLiquidLiveTime = 15;--15sec
	local _objID = 0;
	while ( true ) do
		x,y,z,dir = DW_Location( _ownerID );
		_objID = CreateObj( _rottenLiquidGUID , x,y,z,dir , 1 );
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
		WriteRoleValue( _objID , EM_RoleValue_LiveTime , _rottenLiquidLiveTime );	
		AddBuff( _objID , _rottenLiquidEffectGUID , 0 , -1 );	
		--DebugMsg( 0 , 0 , "----rotten Liquid : ".._objID );
		CallPlot( _objID , "Lua_703141_NPC_PuppetZombie_RottenLiquid_Loop" , _ownerID );

		AddToPartition( _objID , _roomID );

		Sleep( 20 );
	end

end

function Lua_703141_NPC_PuppetZombie_RottenLiquid_Loop( _zombieID )
	--DebugMsg( 0 , 0 , "Lua_703141_NPC_PuppetZombie_RottenLiquid_Loop");
	local _ownerID = OwnerID();
	local x,y,z,dir = DW_Location( _ownerID );
	while ( true ) do
		--DebugMsg( 0 , 0 , "�G�G�u ����ˮ` : ".._ownerID );
		SysCastSpellLv_Pos( _zombieID , x,y,z , 851698 , 1 );--851698�G�G�u
	
		Sleep( 10 );
	end

end
------------------------------------------------------------------------------------------------------------------------------------END----------���L��

---------------------------------------------------------------------------------------------------------------------�C�������y
function Lua_703141_NPC_StrayGhost_Init()
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--��ܦW��
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--��ܦ��
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _ownerID , EM_SetModeType_Move , true );		--����
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--����
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--����
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--�����׮ĪG

	CallPlot( _ownerID , "Lua_703141_NPC_PuppetZombie_WalkAround" );
	CallPlot( _ownerID , "Lua_703141_NPC_StrayGhost_Loop" );
	return true;
end

function Lua_703141_NPC_StrayGhost_Loop()
	DebugMsg( 0 , 0 , "Lua_703141_NPC_StrayGhost_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;
	local x,y,z,dir = DW_Location( _ownerID );
	while ( true ) do
		--DebugMsg( 0 , 0 , "�y�v���� ����ˮ` : ".._ownerID );
		CastSpell( _ownerID , _ownerID , 851697 );--851697�y�v����
		Sleep( 40 );
	end
end

-------------------------------------------------------------------------------------------------END-----------------�C�������y

---------------------------------------------------------------------------------------------------------------------���s����
function Lua_703141_Item_CreateSkullTotemDualPair( _flagGUID , _flagPos )--_flagPos�Ĥ@�ڹ��˦�m  ���Ỽ�W
	DebugMsg( 0 , 0 , "Lua_703141_Item_CreateSkullTotemInPair");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];

	local _maxTotem = 4;
	local _currentTotemID = 0;
	
	local _totemList = {};
	local _duetList = nil;

	_flagGUID = 781406;--for test
	_flagPos = 4;--for test

	local _currentFlagPos = 0;
	for _i = 1 , _maxTotem , 1 do
		_currentFlagPos = _flagPos - 1 + _i;
		_currentTotemID = Lua_703141_Item_CreateSingleSkullTotem( _flagGUID , _currentFlagPos );
		
		table.insert( _totemList , _currentTotemID );
		
	end

	for _index , _totemID in pairs( _totemList ) do
		_duetList = {};--��g�����M��
		for _index2 , _totemID2 in pairs( _totemList ) do--�ư��ۨ���������
			if ( _totemID2 ~= _totemID ) then
				table.insert( _duetList , _totemID2 );
			end
		end
		CallPlot( _totemID , "Lua_703141_Item_SkullTotem_Loop" , _duetList );
	end
end

function Lua_703141_Item_CreateSingleSkullTotem( _flagGUID , _flagPos )
	DebugMsg( 0 , 0 , "Lua_703141_Item_CreateSingleSkullTotem");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];

	local _skullTotemGUID = _gConsts._skullTotemGUID;
	local x,y,z,dir = DW_Location( _flagGUID , _flagPos );
	local _skullTotemID = _gConsts.ExtObj( _skullTotemGUID , x,y,z,dir );

	SetModeEx( _skullTotemID , EM_SetModeType_HideName , true );	--��ܦW��
	SetModeEx( _skullTotemID , EM_SetModeType_NotShowHPMP , true ); --��ܦ��
	SetModeEx( _skullTotemID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _skullTotemID , EM_SetModeType_Move , false );	--����
	SetModeEx( _skullTotemID , EM_SetModeType_Fight , false );	--����
	SetModeEx( _skullTotemID , EM_SetModeType_Searchenemy , false );	--����
	SetModeEx( _skullTotemID , EM_SetModeType_Obstruct , false );	--�����׮ĪG

	return _skullTotemID;
end

function Lua_703141_Item_SkullTotem_Loop( _duetList )
	DebugMsg( 0 , 0 , "Lua_703141_Item_SkullTotem_Loop");
	sleep( 10 )
	local _owner = OwnerID();
	local _oppositeTotemID = 0;
	local _spellGUID = 851700;--���N��y
	local _effectSpellGUID = 851699;--���N��y
	local x,y,z,dir = 0;
	while ( true ) do
		_oppositeTotemID = _duetList[ RandRange( 1 , #_duetList ) ];
		x,y,z,dir = DW_Location( _oppositeTotemID );
		--CastSpellPos( _owner , x,y,z, _spellGUID , 0 );
		--DebugMsg( 0 , 0 , "_owner : ".._owner.."  Target : ".._oppositeTotemID );
		CastSpell( _owner , _oppositeTotemID , _effectSpellGUID );--�S�Īk�N
		SysCastSpellLv_Pos( _owner , x,y,z, _spellGUID , 0 );--�ˮ`�v��
		sleep( 100 );--�C�Q���H���������H���
	end
end
-------------------------------------------------------------------------------------------------END-----------------���s����


---------------------------------------------------------------------------------------------------------------------������
function Lua_703141_Skill_Spread_Check()
	DebugMsg( 0 , 0 , "Lua_703141_Skill_Spread_Check");
	local _ownerID = OwnerID();
	local _basicBuffGUID = 625519;
	if ( CheckBuff( _ownerID , _basicBuffGUID ) ) then
		CallPlot( _ownerID , "Lua_703141_Skill_Spread_Loop" );
		return true;
	end
	return false;
end

function Lua_703141_Skill_Spread_Loop()
	DebugMsg( 0 , 0 , "Lua_703141_Skill_Spread_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;

	local _thisBuffGUID = 625533;--625533������

	local _rangeNPCs = nil; 
	local _infectRange = 50;--yard
	local _infectionSkillID = 851734;--851734�ͬr�ǬV
	local _infectNpcGUID = 108927;--108927���L��
	local x,y,z,dir = 0;

	local _currentNpcID = 0;
	local _currentNpcGUID = 0;
	while ( CheckBuff( _ownerID , _thisBuffGUID ) ) do 
		--�ͬr�ǬV
		x,y,z,dir = DW_Location( _ownerID );--�w�Q�P�V�����a�������I
		SysCastSpellLv_Pos( _bossID , x,y,z , _infectionSkillID , 0 );--851734�ͬr�ǬV(��BOSS�I��)

		--�����̶ǬV  --�u�ǵ� ���L��
		_rangeNPCs = SearchRangeNPC( _ownerID , _infectRange );
		for _i = 0 , #_rangeNPCs , 1 do
			_currentNpcID = _rangeNPCs[ _i ];
			if( _currentNpcID ~= nil ) then
				_currentNpcGUID = ReadRoleValue( _currentNpcID , EM_RoleValue_OrgID );
				DebugMsg( 0 , 0 , "_currentNpcID : ".._currentNpcID.."  , _i : ".._i.."  _GUID : ".._currentNpcGUID );
				if ( CheckID( _currentNpcID ) and _currentNpcGUID == _infectNpcGUID ) then
					AddBuff( _currentNpcID , 625534 , 0 , -1 );--625534������(���L��)
					Lua_703141_Skill_Spread_PuppetZombie_Check( _currentNpcID );
					CancelBuff_noEvent( _ownerID , _thisBuffGUID );--625533������(���a)
					break;
				end
			else
				DebugMsg( 0 , 0 , "----------is nil _i : ".._i );
			end
		end

		Sleep( 10 );
	end

	return;

end

function Lua_703141_Skill_Spread_PuppetZombie_Check( _targetID )
	
	local _ownerID = _targetID or OwnerID();
	local _thisBuffGUID = 625534;--625534������
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffGUID ) + 1;
	DebugMsg( 0 , 0 , "Lua_703141_Skill_Spread_PuppetZombie_Check : ".._currentBuffLv );
	if _currentBuffLv >= 3 then--�W�L3�������ؼ�
		KillID( _ownerID , _ownerID );
	end
end
-------------------------------------------------------------------------------------------------END-----------------������

---------------------------------------------------------------------------------------------------------------------���]�N
function Lua_703141_Skill_RaiseTheDead()
	DebugMsg( 0 , 0 , "Lua_703141_Skill_RaiseTheDead");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;

	local _summonList = {	_gConsts._puppetZombieGUID ,--�۳�M��
				_gConsts._toxicCorpseGUID
				};


	local x,y,z,dir = DW_Location( _bossID );
	local _targetX , _targetZ = 0;

	for _index , _guid in pairs( _summonList ) do
		_targetX = x + ( RandRange( 1 , 300 ) - 150 );
		_targetZ = z + ( RandRange( 1 , 300 ) - 150 );
		_gConsts.ExtObj( _guid , x , y , z , dir );
	end
	

end
-------------------------------------------------------------------------------------------------END-----------------���]�N

---------------------------------------------------------------------------------------------------------------------�`�F�ٻk--���N��y
function Lua_703141_Skill_BittingDead()--��@�h�ūr
	DebugMsg( 0 , 0 , "Lua_703141_Skill_BittingDead");
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	--say( _targetID , "Hit" )
	local _targetBuff = 625526;
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _targetBuff );--625526�ūr
	DebugMsg( 0 , 0 , "_currentBuffLv : ".._currentBuffLv);
	CancelBuff_noEvent( _targetID , _targetBuff );
	_currentBuffLv = _currentBuffLv - 1;
	if ( _currentBuffLv >= 0 ) then
		AddBuff( _targetID , _targetBuff , _currentBuffLv , -1 );--
	end

	--CallPlot( _targetID , "Lua_703141_Skill_WoodooBite_Check" );
	Lua_703141_Skill_WoodooBite_Check( _targetID );
end
-------------------------------------------------------------------------------------------------END-----------------�`�F�ٻk--���N��y

---------------------------------------------------------------------------------------------------------------------�ūr
function Lua_703141_Skill_WoodooBite()
	DebugMsg( 0 , 0 , "Lua_703141_Skill_WoodooBite");
	local _ownerID = OwnerID();
	local _targetID = TargetID();	
	--CancelBuff_noEvent( _targetID , 625526 );
	AddBuff( _targetID , 625526 , 2 , -1 );--
	
	--CallPlot( _targetID , "Lua_703141_Skill_WoodooBite_Check_Loop" );
end

function Lua_703141_Skill_WoodooBite_Check( _inputOwnerID )
	local _ownerID = _inputOwnerID or OwnerID();
	DebugMsg( 0 , 0 , "Lua_703141_Skill_WoodooBite_Check : ".._ownerID );
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;

	if ( CheckBuff( _ownerID , 625526 ) ) then--625526�ūr
		return;
	end
	--���ܦr�� BUFF�S�F
	DebugMsg( 0 , 0 , "���ܦr�� BUFF�S�F : ".._ownerID );
	
	--if ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == false ) then--�������԰����A
		--CastSpell( _ownerID , _ownerID , 850461 );--850461�۱��z�u
		DebugMsg( 0 , 0 , "###_WoodooBite_KilledHost : ".._ownerID );
		local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
		local _gConsts = _Lua_703141_AI_GlobalVars[ _roomID ];
		local x,y,z,dir = DW_Location( _ownerID );

		--Sleep( 15 );
		_gConsts.ExtObj( 108929 , x , y , z , dir );--�C�������y
		KillID( _ownerID , _ownerID );
	--else
		--return;
	--end
end

-------------------------------------------------------------------------------------------------END-----------------�ūr