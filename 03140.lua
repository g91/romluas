--Author : K.J. Aris
--Version : 14.02.12.
--Ignitor : 108895
--NPC : 108804--raid
--Script : 703140

local _Lua_703140_AI_GlobalVars = {};
--�ŧi�Ҧ��ޯण�P���׬I�񵥯�
local Skill = {}
Skill.Lv = {}
Skill.Lv[851685] = {0,0,0}
Skill.Lv[851681] = {0,0,0}
Skill.Lv[851682] = {0,0,0}
Skill.Lv[851683] = {0,0,0}
Skill.Lv[851690] = {0,0,0}
Skill.Lv[851687] = {0,0,0}
Skill.Lv[851688] = {0,0,0}
Skill.Lv[851686] = {0,0,0}
Skill.Lv[851695] = {0,0,0}
Skill.Lv[851693] = {0,0,0}
Skill.Lv[851694] = {0,0,0}
Skill.Lv[851692] = {0,0,0}
--�ŧi�Ҧ��ޯ�N�o
Skill.CD = {}
Skill.CD[851681] = 3
Skill.CD[851682] = 7
Skill.CD[851695] = 9
Skill.CD[851693] = 20

Skill.CD[851694] = 15
Skill.CD[851692] = 19

					


function Lua_703140_AI_Init( _inputCtrID )--controller  NPC 108895 --Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703140_AI_Init : NPC 108895       Z33-1B2  V140212 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --�H�����ư��� �N�즳����R��

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108895
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108804
	
	--this NPC is using as a controller
	SetModeEx( _ctrlID , EM_SetModeType_Show , false );	--���i�I��
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
	local _bossGUIDs = { 108804 , 108916 , 108921 };--���դ�
	local _healTotemGUIDs = { 108904 , 108917 , 108922 };--�������
	local _earthShatteringTotemGUIDs = { 108905 , 108918 , 108923 };--�a������
	local _curseTotemGUIDs = { 108906 , 108919 , 108924 };--�A�G����
	local _abandonedSpiritGUIDs = { 108907 , 108920 , 108925 };--���F���v


	--�ѼƳ]�w��
	
	_Lua_703140_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossGUID = _bossGUIDs[ _difficulty ] ,
					_healTotemGUID = _healTotemGUIDs[ _difficulty ] , --�������
					_earthShatteringTotemGUID = _earthShatteringTotemGUIDs[ _difficulty ] , --�a������
					_curseTotemGUID = _curseTotemGUIDs[ _difficulty ] , --�A�G����
					_abandonedSpiritGUID = _abandonedSpiritGUIDs[ _difficulty ] , --���F���v
					_ctrlGUID = 108705 ,--���ID
					_doorGUID = 106246 ,

					_flagGUID = 781405 , --781405 Z33-1_2���κX��
					_bossFlagPos = 1 , 
					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					--values
					--_maxCurseTotem = 2;--�A�G���˼ƶq
					_stage1CurseTotem = 2 ,--���q�@�A�G���˼ƶq
					_stage2CurseTotem = 4 ,--���q�G�A�G���˼ƶq

					--functions
					ExtObj = nil , 
					DelExtObjs = nil , 

					--tables
					_curseTotemIDs = nil , 

					_frenzyCD = _frenzyCD ,

					--stage 1
					_skillEearthTotemCD = 9 , --. �C9��G�b���W��W�H������ؼгB��m�a�����ˡC
					_skillCurseCD = 20 , --�C20��G�b���W�������I�H����m2�ڶA�G���ˡ����۬I�i�P�R�A�G�C

					--stage 2
					_skillAbandonSpiritCD = 17 , --�C17��G�۳���F���v�A����15�������C
					_skillHealTotemCD = 20 , --HP�C��25%�G�b�ۨ���m�I�������ˡA����C20��I��@���C

					};
	--��Ū��T
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];

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
end--function Lua_703140_AI_Init( _inputCtrID )

function Lua_703140_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	--Lua_703175_ClearAll( _roomID );
	Lua_703140_AI_Init();
end

function Lua_703140_AI_onFight()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	Cl_Resist_HackersFightBegin( _bossID )
	DebugMsg( 0 , 0 , "--Lua_703140_AI_onFight ".._bossID.." RID : ".._roomID );
	--��Ū��T
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703140_AI_reignite( _roomID ); return; end

	--����P�l������
	local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--�l�ͪ�(�B�z�۳ꪫ �� ���X�Ӫ��F��)
		local x,y,z,dir = DW_Location( _bossID );
		local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
		_AddParasite( _objID );
		AddToPartition( _objID , _roomID );
		return _objID;
	end
	
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );

	--_Lua_703140_AI_GlobalVars[ _roomID ]._maxCurseTotem = 2;--�j���s

	--generate front door

	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703140_AI_Engage" , 0 );
	CallPlot( _bossID , "Cl_703140_FightAI" );
	ScriptMessage(_bossID,0,2,"[LUA_703140_AI_ONFIGHT]",0);
	--CallPlot( _bossID , "Cl_Resist_HackersFightBegin" );
end--function Lua_703140_AI_onFight()

function Cl_703140_FightAI()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local time = 0
	local AttackTarget = 0
	local Diff = Cl_GetDiff(172)
	while ReadRoleValue( _bossID , EM_RoleValue_IsAttackMode ) == 1 do
		sleep( 10 )
		if ReadRoleValue( _bossID , EM_RoleValue_SpellMagicID ) == 0 then
			time = time + 1
			AttackTarget = ReadRoleValue( _bossID , EM_RoleValue_AttackTargetID )
			DebugMsg( 0 ,  0 ,"HP="..( ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP ) ) )
			if time%Skill.CD[851692] == 0 and
				( ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP ) ) <= 0.25 then
				--say( _bossID , "["..tostring(851692).."]" )
				CastSpellLv( _bossID , _bossID , 851692 , Skill.Lv[851692][Diff] ) 
			elseif time%Skill.CD[851694] == 0 and
				( ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP ) ) <= 0.5 then
				--say( _bossID , "["..tostring(851694).."]" )
				CastSpellLv( _bossID , _bossID , 851694 , Skill.Lv[851694][Diff] ) 
			elseif time%Skill.CD[851693] == 0 then
				--say( _bossID , "["..tostring(851693).."]" )
				CastSpellLv( _bossID , _bossID , 851693 , Skill.Lv[851693][Diff] ) 
			elseif time%Skill.CD[851695] == 0 then
				--say( _bossID , "["..tostring(851695).."]" )
				CastSpellLv( _bossID , _bossID , 851695 , Skill.Lv[851695][Diff] ) 
			elseif time%Skill.CD[851682] == 0 then
				--say( _bossID , "["..tostring(851682).."]" )
				CastSpellLv( _bossID , AttackTarget , 851682 , Skill.Lv[851682][Diff] ) 
			elseif time%Skill.CD[851681] == 0 then
				--say( _bossID , "["..tostring(851681).."]" )
				CastSpellLv( _bossID , AttackTarget , 851681 , Skill.Lv[851681][Diff] ) 
			end
		end
	end
end
function Lua_703140_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
	DebugMsg( 0 , 0 , "--Lua_703140_AI_Engage" );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
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

	--local __isFrenzied = false;
	--stage 1
		--_skillEearthTotemCD = 9 , --. �C9��G�b���W��W�H������ؼгB��m�a�����ˡC
		--_skillCurseCD = 20 , --�C20��G�b���W�������I�H����m2�ڶA�G���ˡ����۬I�i�P�R�A�G�C

	--stage 2
		--_skillAbandonSpiritCD = 17 , --�C17��G�۳���F���v�A����15�������C
		--_skillHealTotemCD = 20 , --HP�C��25%�G�b�ۨ���m�I�������ˡA����C20��I��@���C
	local _GCD = 5;
	local _CD = {
		--stage 1
		_skillEearthTotemCD = _gConsts._skillEearthTotemCD ,
		_skillCurseCD = _gConsts._skillCurseCD ,


		--stage 2
		_skillAbandonSpiritCD = _gConsts._skillAbandonSpiritCD ,

		--<25%>
		_skillHealTotemCD = _gConsts._skillHealTotemCD ,

		}

	----------------------------------------�ޯ�Ѽ�
	local _maxCurseTotem = _gConsts._maxCurseTotem;--�i�J�ĤG���q��A�A�G�����ܬ��@��4�ڡC
	
	-----------------------------END--------�ޯ�Ѽ�

	-----------------------------------------�g�ɰѼ�
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;
	----------------------------END----------�g�ɰѼ�

	local _hateListCounter = 0;
	local _bossHpRatio = 0;
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
			Lua_703140_AI_Conquered( _roomID );
			Cl_Resist_HackersBossDead( _bossID )
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			DebugMsg( 0 , 0 , "--quit fight" );
			--Lua_703140_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
			Lua_703140_AI_Reset( _roomID );
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
			ScriptMessage(_bossID,0,2,"[LUA_703140_AI_FRENZY]",0);
		end		


		---------------------------------------------------���q�ഫ����
--		if ( _bossHpRatio < 0.5 ) then--�Ĥ@���q��HP 50%~100%�A�ĤG���q��HP 0%~49%�C
--			--DebugMsg( 0 , 0 , "--Phase 2" );
--			_maxCurseTotem = 4;--�i�J�ĤG���q��A�A�G�����ܬ��@��4�ڡC
--			_Lua_703140_AI_GlobalVars[ _roomID ]._maxCurseTotem = _maxCurseTotem;
--		else
		if ( _bossHpRatio > 0.5 ) then
			--DebugMsg( 0 , 0 , "--Phase 1" );
			--_maxCurseTotem = 2;
			_CD._skillAbandonSpiritCD = _gConsts._skillAbandonSpiritCD;--�����L�˼�( ���q�@���I�� )
		end

		if ( _bossHpRatio > 0.25 ) then--HP�C��25%�G�b�ۨ���m�I�������ˡA����C20��I��@���C
			_CD._skillHealTotemCD = _gConsts._skillHealTotemCD;--�����L�˼�( >25%���I�� )
		end
		-------------------------------------END--------���q�ഫ����
		
		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��
			
		

			--[[
			if( _CD._skillHealTotemCD <= 0 )then--�������--20sec
				DebugMsg( 0 , 0 , "--_skillHealTotemCD release" );
				CastSpellLv( _bossID , _bossID , 851692 );--851692�������
				_CD._skillHealTotemCD = _gConsts._skillHealTotemCD;
				_GCD = 5;
			end

			if( _CD._skillCurseCD <= 0 )then--�A�G����--20sec
				DebugMsg( 0 , 0 , "--_skillCurseCD release" );
				CastSpellLv( _bossID , _bossID , 851693 );--851693�A�G����   ����Ĳ�o�P�R�A�G
				_CD._skillCurseCD = _gConsts._skillCurseCD;
				_GCD = 25;
				break;
			end

			if( _CD._skillAbandonSpiritCD <= 0 )then--���F���v--17sec
				DebugMsg( 0 , 0 , "--_skillAbandonSpiritCD release" );
				CastSpellLv( _bossID , _bossID , 851694 );--851694���F���v
				_CD._skillAbandonSpiritCD = _gConsts._skillAbandonSpiritCD;
				_GCD = 2;
			end
			
			if( _CD._skillEearthTotemCD <= 0 )then--���a����--9sec
				DebugMsg( 0 , 0 , "--_skillEearthTotemCD release" );
				CastSpellLv( _bossID , _bossID , 851695 );--851695���a����
				_CD._skillEearthTotemCD = _gConsts._skillEearthTotemCD;
				_GCD = 5;
			end



			if( _CD._timer4 <= 0 )then
				DebugMsg( 0 , 0 , "--_timer4 release" );
				_CD._timer4 = 25;
				_GCD = 2;
			end
			]]--
			
		end


	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703140_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703140_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703140_AI_Reset" );

	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	
	local _bossID = _gConsts._bossID;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703140_AI_RESET]",0);

	DW_UnFight( _bossID , true );

	Delobj( _frontDoorID );	--�R���e��
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 20 );

	DelFromPartition( _bossID );

	Sleep( 50 );

	DW_UnFight( _bossID , false );
	SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos );
	AddToPartition( _bossID , _roomID );
	
end--function Lua_703140_AI_Reset( _roomID )

function Lua_703140_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703140_AI_Conquered" );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];--for read

	if( _gConsts == nil ) then return; end
	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����

	ScriptMessage(_gConsts._bossID,0,2,"[$MUTE]".."[LUA_703140_AI_CONQUERED]",0);	
	
	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703140_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	--Cl_Resist_HackersBossDead();
end--function Lua_703140_AI_Conquered( _roomID )



-----------------------------------sub functions


--------------------------------------------------------------------------------skills functions below

function  Lua_703140_Item_TotemInit()
	DebugMsg( 0 , 0 , "Lua_703140_Item_TotemInit" );
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--��ܦW��
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--��ܦ��
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _ownerID , EM_SetModeType_Move , false );		--����
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--����
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , true );	--����
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , true );	--�����׮ĪG
	
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	--local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];

	return;
end

--------------------------------------------------------------------------------------------------------�������
function Lua_703140_Skill_HealTotem()
	DebugMsg( 0 , 0 , "Lua_703140_Skill_HealTotem" );
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	local _maxTarget = 2;


	local _healTotemGUID = _gConsts._healTotemGUID;

	--local x,y,z,dir = 0;
	--x = x + ( RandRange( 1 , 100 ) - 50 );
	--z = z + ( RandRange( 1 , 100 ) - 50 );
	local x,y,z,dir = DW_Location( _ownerID );
	_gConsts.ExtObj( _healTotemGUID , x,y,z,dir );

end

function Lua_703140_Item_HealTotemInit()--�������
	DebugMsg( 0 , 0 , "Lua_703140_Item_HealTotemInit" );
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--��ܦW��
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--��ܦ��
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _ownerID , EM_SetModeType_Move , false );		--����
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--����
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--����
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--�����׮ĪG

	WriteRoleValue( _ownerID , EM_RoleValue_LiveTime , 11 );--������˷|�����BOSS��_HP�A����10��A������|�ۤv�����C

	CallPlot( _ownerID , "Lua_703140_Item_HealTotem_Loop" );
end

function Lua_703140_Item_HealTotem_Loop()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703140_AI_GlobalVars[ _roomID ]._bossID;
	while ( CheckID( _bossID ) and ReadRoleValue( _bossID , EM_RoleValue_IsDead ) ~= 1 ) do
		CastSpellLv( _ownerID , _bossID , 851685 ,Skill.Lv[851685][Cl_GetDiff(172)]);--851685��ͯ�q
		sleep( 10 );
	end

end

-----------------------------------------------------------------------------------------------------------
function Lua_703140_Skill_Cure()
	DebugMsg( 0 , 0 , "Lua_703140_Skill_Cure" );
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	DebugMsg( 0 , 0 , "-----> Totem : ".._ownerID.."   ------> Boss : ".._targetID );
	return true;
end
-----------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------END-----------------------�������


----------------------------------------------------------------------------------------------------------�t�y�|�g
function Lua_703140_Skill_DarkSplash()
	DebugMsg( 0 , 0 , "Lua_703140_Skill_DarkSplash" );
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	local _spellID = 851683;--�t�y�|�g����
	local _effectSpellID = 851690;--�t�y�|�g���ƭ���S��

	DebugMsg( 0 , 0 , "-----> Attacker : ".._ownerID.."   ------> Victim : ".._targetID );
	local _maxSplashes = 4;--�̦h�|�H
	local _maxRange = 50;--yard
	local _victims = LUA_YOYO_RangePlayerNotGM_EX( _targetID , _maxRange , true );
	local _currentVictimID = _targetID;
	SysCastSpellLv( _ownerID , _currentVictimID , _spellID , Skill.Lv[_spellID][Cl_GetDiff(172)] );
	for _i = 1 , _maxSplashes , 1 do
		_currentVictimID = _victims[ _i ];
		if ( _currentVictimID == nil or CheckID( _currentVictimID ) == false ) then
			_currentVictimID = _targetID;
		end
		CastSpellLv( _targetID , _currentVictimID , _effectSpellID , Skill.Lv[_effectSpellID][Cl_GetDiff(172)] );--�q�ؼХ|�q�X�h
		SysCastSpellLv( _ownerID , _currentVictimID , _spellID , Skill.Lv[_spellID][Cl_GetDiff(172)] );
		DebugMsg( 0 , 0 , "-----> DarkSplash to : ".._currentVictimID );
	end

end
-------------------------------------------------------------------------------END------------------------�t�y�|�g





-------------------------------------------------------------------------------------------------------------�A�G����
function Lua_703140_Skill_CurseTotem()--�A�G����
	--�C20��G�b���W�������I�H����m2�ڶA�G���ˡ����۬I�i�P�R�A�G�C
	
	local _ownerID = OwnerID();--boss
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	local _maxCurseTotem = _gConsts._stage1CurseTotem;

	if ( ReadRoleValue( _ownerID , EM_RoleValue_HP )/ReadRoleValue( _ownerID , EM_RoleValue_MaxHP ) < 0.5 ) then
		_maxCurseTotem = _gConsts._stage2CurseTotem;
	end

	DebugMsg( 0 , 0 , "Lua_703140_Skill_CurseTotem , max : ".._maxCurseTotem );
	local _curseTotemGUID = _gConsts._curseTotemGUID;

	local _curseTotemIDs = _gConsts._curseTotemIDs;

	local x,y,z,dir = DW_Location( _ownerID );

	if ( _curseTotemIDs ~= nil ) then
		for _index , _totemID in pairs( _curseTotemIDs ) do--��m�A�G���ˮɭY�������������ˡA�|�����ޱ��ª����s���C
			DelObj( _totemID );
		end
	end

	_curseTotemIDs = {};
	local _targetX , _targetZ = 0;
	for _step = 1 , _maxCurseTotem , 1 do
		_targetX = x + ( RandRange( 1 , 300 ) - 150 );
		_targetZ = z + ( RandRange( 1 , 300 ) - 150 );
		
		table.insert( _curseTotemIDs , _gConsts.ExtObj( _curseTotemGUID , _targetX,y,_targetZ,dir ) );
	end
	_Lua_703140_AI_GlobalVars[ _roomID ]._curseTotemIDs = _curseTotemIDs;

	--�I�i�P�R�A�G --�I�i�ɶ�10��

	--CastSpellLv( _ownerID , _ownerID , 851684 );

end

--PS : �A�G���� �|Ĳ�o �P�R�A�G
function Lua_703140_Item_CurseTotemInit()--�A�G����
	DebugMsg( 0 , 0 , "Lua_703140_Item_CurseTotemInit" );
	local _ownerID = OwnerID();
	--SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--��ܦW��
	--SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true );	--��ܦ��
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _ownerID , EM_SetModeType_Move , false );		--����
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--����
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--����
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--�����׮ĪG

	WriteRoleValue( _ownerID , EM_RoleValue_LiveTime , 11 );--�A�G���˦s���ɶ�

	CallPlot( _ownerID , "Lua_703140_Item_CurseTotem_Loop" );
end

function Lua_703140_Item_CurseTotem_Loop()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703140_AI_GlobalVars[ _roomID ]._bossID;
	while ( CheckID( _bossID ) and ReadRoleValue( _bossID , EM_RoleValue_IsDead ) ~= 1 ) do
		SysCastSpellLv( _ownerID , _ownerID , 851687 , Skill.Lv[851687][Cl_GetDiff(172)] );--851687���O
		SysCastSpellLv( _ownerID , _ownerID , 851688 , 0 );--851688�A�G
		sleep( 20 );
	end

end




-----------------------------------------------------------------------------------------------------------�P�R�A�G
function Lua_703140_Skill_DeadlyCurse()--�P�R�A�G
	DebugMsg( 0 , 0 , "Lua_703140_Skill_DeadlyCurse" );
	local _ownerID = OwnerID();--Attacker
	local _targetID = TargetID();--Victim
	DebugMsg( 0 , 0 , "-----> Attacker : ".._ownerID.."   ------> Victim : ".._targetID );
	local _buffID = 625510;--625510�A�G���A
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _buffID ) + 1;
	local _spellID = 851691;--851691�P�R�A�G�ˮ`
	DebugMsg( 0 , 0 , "-----> buffLevel : ".._currentBuffLv );
	if _currentBuffLv >= 0 then
		SysCastSpellLv( _ownerID , _targetID , _spellID , _currentBuffLv );--Ū��h��Lv�N�Φh��Lv���k�N���ؼ�
		DebugMsg( 0 , 0 , "-----> Damage : ".._currentBuffLv.." *5% " );
	end
	CancelBuff( _targetID , _buffID );

end
-----------------------------------------------------------------------------END---------------------------�P�R�A�G
---------------------------------------------------------------------------------END-------------------------�A�G����


-------------------------------------------------------------------------------------------------------------�a������
function Lua_703140_Skill_EarthShatteringTotem()--�a������
	DebugMsg( 0 , 0 , "Lua_703140_Skill_EarthShatteringTotem" );
	-- �C9��G�b���W��W�H������ؼгB��m�a�����ˡC
	--Lua_RandomPlayerFromHateList(BossID,HowMuch,AntiTank) --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	local _maxTarget = 2;
	local _targets = Lua_RandomPlayerFromHateList( _ownerID , _maxTarget , false );

	local _earthShatteringTotemGUID = _gConsts._earthShatteringTotemGUID;

	local x,y,z,dir = 0;
	for _index , _playerID in pairs( _targets ) do
		x,y,z,dir = DW_Location( _playerID );
		_gConsts.ExtObj( _earthShatteringTotemGUID , x,y,z,dir );
	end
end

function Lua_703140_Item_EarthShatteringTotemInit()--�A�G����
	DebugMsg( 0 , 0 , "Lua_703140_Item_EarthShatteringTotemInit" );
	local _ownerID = OwnerID();
	SetModeEx( _ownerID , EM_SetModeType_HideName , true );	--��ܦW��
	SetModeEx( _ownerID , EM_SetModeType_NotShowHPMP , true ); --��ܦ��
	SetModeEx( _ownerID , EM_SetModeType_Strikback , false );	--�|����
	SetModeEx( _ownerID , EM_SetModeType_Move , false );	--����
	SetModeEx( _ownerID , EM_SetModeType_Fight , true );	--����
	SetModeEx( _ownerID , EM_SetModeType_Searchenemy , false );	--����
	SetModeEx( _ownerID , EM_SetModeType_Obstruct , false );	--�����׮ĪG

	WriteRoleValue( _ownerID , EM_RoleValue_LiveTime , 120 );--�A�G���˦s���ɶ�

	CallPlot( _ownerID , "Lua_703140_Item_EarthShatteringTotem_Loop" );
end

function Lua_703140_Item_EarthShatteringTotem_Loop()
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703140_AI_GlobalVars[ _roomID ]._bossID;
	while ( CheckID( _bossID ) and ReadRoleValue( _bossID , EM_RoleValue_IsDead ) ~= 1 ) do
		CastSpellLv( _ownerID , _ownerID , 851686 ,Skill.Lv[851686][Cl_GetDiff(172)]);--851686���a��q
		sleep( 10 );
	end

end
---------------------------------------------------------------------------------END-------------------------�a������



-------------------------------------------------------------------------------------------------------------���F���v
function Lua_703140_Skill_AbandonedSpirit()--���F���v
	DebugMsg( 0 , 0 , "Lua_703140_Skill_AbandonedSpirit" );
	--�i�J�ĤG���q��A�C17��G�۳���F���v�A����15�������C
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703140_AI_GlobalVars[ _roomID ];
	local _abandonedSpiritGUID = _gConsts._abandonedSpiritGUID;

	local x,y,z,dir = DW_Location( _ownerID );
	x = x + ( RandRange( 1 , 100 ) - 50 );
	z = z + ( RandRange( 1 , 100 ) - 50 );
	local _abandonedSpiritID = _gConsts.ExtObj( _abandonedSpiritGUID , x,y,z,dir );
	WriteRoleValue( _abandonedSpiritID , EM_RoleValue_LiveTime , 16 );--15��ͦs�ɶ�

	AddBuff( _abandonedSpiritID , 625507 , 0 , -1 );--625507���F���@

end

---------------------------------------------------------------------------------END-------------------------���F���v