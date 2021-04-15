--Author : K.J. Aris
--Version : 14.02.05.
--Ignitor : 108890
--NPC : 108800--raid
--Script : 703138

local _Lua_703138_AI_GlobalVars = {};

local Skill = {}
Skill.Lv = {}
Skill.Lv[851666] = {0,0,0}
Skill.Lv[851664] = {0,0,0}
Skill.Lv[851676] = {0,0,0}
Skill.Lv[851665] = {0,0,0}
Skill.Lv[851662] = {0,0,0}
Skill.Lv[851667] = {0,0,0}
Skill.Lv[851668] = {0,0,0}
Skill.Lv[851675] = {0,0,0}
Skill.Lv[851677] = {0,0,0}
Skill.Lv[851678] = {0,0,0}
Skill.Lv[851678] = {0,0,0}

--Skill.Lv[851666][Cl_GetDiff(172)]

function Lua_703138_AI_Init( _inputCtrID )--controller  NPC 108890	--Note : this NPC is using as a ignitor
	DebugMsg( 0 , 0 , "--Lua_703138_AI_Init : NPC 108890       Z33-1B1  V140205 " );

	--Lua_DavisDelObj( 108890 );--delete all kind , just incase --�H�����ư��� �N�즳����R��

	--basics
	local _ctrlID = _inputCtrID or OwnerID();--108890
	local _roomID = ReadRoleValue( _ctrlID , EM_RoleValue_RoomID );--108890
	
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
	local _bossGUIDs = { 108800 , 108912 , 108914 };
	local _electricityTotemGUIDs = { 108900 , 108913 , 108915 };

	--�ѼƳ]�w��
	
	_Lua_703138_AI_GlobalVars[ _roomID ] = {
					_bossID = 0 , 
					_roomID = _roomID ,
					_ctrlID = _ctrlID ,
					_frontDoorID = 0 , 
					_backDoorID = 0 , 

					_bossGUID = _bossGUIDs[ _difficulty ] ,
					_electricityTotemGUID = _electricityTotemGUIDs[ _difficulty ] ,
					_ctrlGUID = 108705 ,--���ID
					_doorGUID = 106246 , 

					_flagGUID = 781403 , --781403 Z33-1_1���κX��
					_bossFlagPos = 1 , 
					_frontDoorFlagPos = 2 , 
					_backDoorFlagPos = 3 ,

					_bladeGUID = 108899 , 

					ExtObj = nil , 
					DelExtObjs = nil , 

					_frenzyCD = _frenzyCD ,

					_skillAeCD = 30 , --�C30��|����W�Ҧ��H�I��t�����A�A��ƪ����a�I��u�Ŭr�x���v�B�Ƽƪ����a���u��v��¶�v
					_skillBladeCD = 15 , --�j�ۤj��MCD
					_skillIronBloodCD = 21 , --�K��g��CD
					_skillChargeCD = 10 , --�ľWCD
					_skillChaosConvolutionCD = 9 , --�ɶðj��CD

					_skillThrowCD = 20 , --�Ŭr����M  �q�y����CD
					};
	--��Ū��T
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];

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
end--function Lua_703138_AI_Init( _inputCtrID )

function Lua_703138_AI_reignite( _specRoomID )--for test
	DebugMsg( 0 , 0 , "--Lua_703175_AI_reignite " );
	local _roomID = _specRoomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	--Lua_703175_ClearAll( _roomID );
	Lua_703138_AI_Init();
end

function Lua_703138_AI_onFight()
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	--Cl_Resist_HackersFightBegin( _bossID )
	DebugMsg( 0 , 0 , "--Lua_703138_AI_onFight ".._bossID.." RID : ".._roomID );
	--��Ū��T
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];
	if ( _gConsts == nil ) then Lua_703138_AI_reignite( _roomID ); return; end

	--����P�l������
	local _ctrlID , _AddParasite , _RemoveParasites  = Lua_703182_ExtendObjectClosure( _bossID );

	local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--�l�ͪ�(�B�z�۳ꪫ �� ���X�Ӫ��F��)
		local x,y,z,dir = DW_Location( _bossID );
		local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
		_AddParasite( _objID );
		SetModeEx( _objID , EM_SetModeType_Mark , false );	--���i�I��
		SetModeEx( _objID , EM_SetModeType_HideName , false );	--����ܦW��
		SetModeEx( _objID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
		SetModeEx( _objID , EM_SetModeType_Strikback , false );	--���|����
		SetModeEx( _objID , EM_SetModeType_Move , false );	--���|����
		SetModeEx( _objID , EM_SetModeType_Fight , false );	--���i����
		SetModeEx( _objID , EM_SetModeType_Searchenemy , false );	--���|����
		SetModeEx( _objID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG
		AddToPartition( _objID , _roomID );
		return _objID;
	end
	
	_gConsts._ctrlID = _ctrlID;
	_gConsts.ExtObj = CreateDerivativeOnBoss;
	_gConsts.DelExtObjs = _RemoveParasites;

	DebugMsg( 0 , 0 , "--Ctrl ".._ctrlID );

	--generate front door

	_gConsts._frontDoorID = Lua_703182_AddDoor( _gConsts._doorGUID , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , _gConsts._roomID );

	BeginPlot( _ctrlID , "Lua_703138_AI_Engage" , 0 );

	ScriptMessage(_bossID,0,2,"[LUA_703138_AI_ONFIGHT]",0);

end--function Lua_703138_AI_onFight()


function Lua_703138_AI_Engage()
	local _roomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );--OwnerID�b�o�̫�CTRLID
	DebugMsg( 0 , 0 , "--Lua_703138_AI_Engage" );
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];
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
	
	local _GCD = 5;
	local _CD = {
		_skillAeCD = _gConsts._skillAeCD ,
		_skillBladeCD = _gConsts._skillBladeCD ,
		_skillChaosConvolutionCD = _gConsts._skillChaosConvolutionCD ,
		_skillChargeCD = _gConsts._skillChargeCD ,
		_skillIronBloodCD = _gConsts._skillIronBloodCD ,
		_skillThrowCD = _gConsts._skillThrowCD ,
		}

	-----------------------------------------�g�ɰѼ�
	local _isFrenzied = false;
	local _frenzyCD = _gConsts._frenzyCD;
	----------------------------END----------�g�ɰѼ�

	local _hateListCounter = 0;
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

		--_currentCompletedGameLevel = ReadRoleValue( _bossID , EM_RoleValue_Register1 );
		--------------END---Routines

		-------------------------------------------------�԰���������
		if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss ���`�� �D�Ԧ��\
			DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
			Lua_703138_AI_Conquered( _roomID );
			Cl_Resist_HackersBossDead( _bossID )
			break;
		end

		if ( not _engaging ) then--���S���s�����a�� ���ȥ���
			DebugMsg( 0 , 0 , "--quit fight" );
			--Lua_703138_SweepAllRelativeBuff( _bossID , _gConsts._effectiveRange + 1000 , _gConsts._keyBuffs );--�M���ϰ쪱�a�Ҧ�����BUFF
			Lua_703138_AI_Reset( _roomID );
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
				ScriptMessage(_bossID,0,2,"[LUA_703138_AI_FRENZY]",0);
		end		

	
		--�ޯ� ����
		for i = 1 , 1 , 1 do--switch case simulation	--���� switch case 
			if ( _GCD > 0 ) then break; end	--��GCD���ɤ�����	--GCD�ΨӨ���ۦ��Q�Y��
			
			if( _CD._skillAeCD <= 0 )then--BOSS�C30��|����W�Ҧ��H�I��t�����A�A��ƪ����a�I��u�Ŭr�x���v�B�Ƽƪ����a���u��v��¶�v�C
				DebugMsg( 0 , 0 , "--_skillAeCD release" );
				CastSpellLV( _bossID , _bossID , 851666 , Skill.Lv[851666][Cl_GetDiff(172)] );--851666�Ŭr�x��+��v��¶
				_CD._skillAeCD = _gConsts._skillAeCD;
				_GCD = 5;
				break;
			end

			
			if( _CD._skillIronBloodCD <= 0 )then--851664�K��g��
				DebugMsg( 0 , 0 , "--_skillIronBloodCD release" );--21sec
				CastSpellLV( _bossID , _bossID , 851664 , Skill.Lv[851664][Cl_GetDiff(172)] );--851664�K��g��
				_CD._skillIronBloodCD = _gConsts._skillIronBloodCD;
				_GCD = 5;
				break;
			end
			
			
			if( _CD._skillThrowCD <= 0 )then--851676�Ŭr����M�I��ʧ@  �C20��|���Y�u�Ŭr����M�v�H�Ρu�q�y���ˡv�b���W�H����m�A����ɶ�15��C
				DebugMsg( 0 , 0 , "--_skillThrowCD release" );--20sec
				CastSpellLV( _bossID , _bossID , 851676 , Skill.Lv[851676][Cl_GetDiff(172)]);--851676�Ŭr����M�I��ʧ@
				_CD._skillThrowCD = _gConsts._skillThrowCD;
				_GCD = 15;
				break;
			end
			
			
			if( _CD._skillBladeCD <= 0 )then--851665�j�ۤj��M
				DebugMsg( 0 , 0 , "--_skillBladeCD release" );--15sec
				CastSpellLV( _bossID , _bossID , 851665, Skill.Lv[851665][Cl_GetDiff(172)] );--851665�j�ۤj��M
				_CD._skillBladeCD = _gConsts._skillBladeCD;
				_GCD = 10;
				break;
			end
			
			
			if( _CD._skillChaosConvolutionCD <= 0 )then--851662�ɶðj��
				DebugMsg( 0 , 0 , "--_skillChaosConvolutionCD release" );--9sec
				CastSpellLV( _bossID , _bossID , 851662 , Skill.Lv[851662][Cl_GetDiff(172)] );--851663�ɶðj��
				_CD._skillChaosConvolutionCD = _gConsts._skillChaosConvolutionCD;
				_GCD = 5;
				break;
			end


			if( _CD._skillChargeCD <= 0 )then
				DebugMsg( 0 , 0 , "--_skillChargeCD release" );--1sec
				CallPlot( _bossID , "Lua_703138_Skill_Rush" );--851663�ľW
				_CD._skillChargeCD = _gConsts._skillChargeCD;
				_GCD = 5;
				break;
			end
			
		end


	end--while
	DebugMsg( 0 , 0 , "--Out of loop" );
	
end--function Lua_703138_AI_Engage()

--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++functions with shared values
function Lua_703138_AI_Reset( _roomID )
	DebugMsg( 0 , 0 , "--Lua_703138_AI_Reset" );

	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];
	
	local _bossID = _gConsts._bossID;
	local _roomID = _gConsts._roomID;
	--local _ctrlID = _gConsts._ctrlID;
	local _frontDoorID = _gConsts._frontDoorID;

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703138_AI_RESET]",0);

	DW_UnFight( _bossID , true );

	Delobj( _frontDoorID );	--�R���e��
	_gConsts.DelExtObjs();--clear all extend items

	Sleep( 20 );
	
	DelFromPartition( _bossID );

	Sleep( 50 );

	DW_UnFight( _bossID , false );
	SetPosByFlag( _bossID , _gConsts._flagGUID , _gConsts._bossFlagPos );
	AddToPartition( _bossID , _roomID );

end--function Lua_703138_AI_Reset( _roomID )

function Lua_703138_AI_Conquered( _roomID )
	_roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	DebugMsg( 0 , 0 , "--Lua_703138_AI_Conquered" );
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];--for read

	if( _gConsts == nil ) then return; end
	Delobj( _gConsts._frontDoorID );	--�R���e��
	Delobj( _gConsts._backDoorID );	--�R�����

	ScriptMessage(_gConsts._bossID,0,2,"[$MUTE]".."[LUA_703138_AI_CONQUERED]",0);	
	
	if( _gConsts.DelExtObjs ~= nil ) then _gConsts.DelExtObjs() end;	--clear all extend items
	_Lua_703138_AI_GlobalVars[ _roomID ] = nil;	--clear all values
	--Cl_Resist_HackersBossDead();
end--function Lua_703138_AI_Conquered( _roomID )


-------------------------------------------------------------------------------------skills functions below


---------------------------------------------------------------------------�Ŭr�x��+��v��¶
--�C3��|��d��75�X����L���a�y���ˮ`�A����15��A�d�򤺦��V�h�����A�����a�ɡA�ˮ`�|���|�C�ݥ���v��¶�Ѱ��A�Y�O���ɶ���۵M�Ѱ����ܡA�Ӫ��a���`�C
function Lua_703138_Skill_DarkTwining_And_VoodooEddy()
	local _bossID = OwnerID();
	local _targetList = KS_GetHateList( _bossID, 1 );
	--local _targetList = Lua_RandomPlayerFromHateList( _bossID ,  math.floor( _hateListCounter*0.5 )  , false ); 
	local _tickTock = RandRange( 0 , 100 );

	if ( _tickTock > 50 ) then
		_tickTock = 1;
	else
		_tickTock = -1;
	end

	for _index , _id in pairs( _targetList ) do
		DebugMsg( 0 , 0 , "--_targetList : ".._index.." : ".._id );
		if ( _tickTock == 1 ) then
			AddBuff( _id , 625478 , 0 ,  15 );--625478�Ŭr�x��
			CallPlot( _id , "Lua_703138_Skill_VoodooEddy_Loop" , 851667 );--851667�Ŭr�x���ˮ`
		else
			AddBuff( _id , 625479 , 0 ,  12 );--625479��v��¶
			CallPlot( _id , "Lua_703138_Skill_DarkTwining_Loop" , 851668 );--851668��v��¶�ˮ`
		end
		_tickTock = _tickTock * -1;
	end
end

function Lua_703138_Skill_VoodooEddy()--625478�Ŭr�x�� ����ˮ`
	DebugMsg( 0 , 0 , "Lua_703138_Skill_VoodooEddy");
	local _ownerID = OwnerID();--�I�k��
	local _targetID = TargetID();--���`��

	local _voodooEddyGUID = 851667;--�Ŭr�x�� �ˮ`
	
	--CallPlot( _targetID , "Lua_703138_Skill_VoodooEddy_Loop" , 851667 );
	CallPlot( _targetID , "Lua_703138_Skill_VoodooEddy_Loop" , _voodooEddyGUID );

	return true;
end

function Lua_703138_Skill_VoodooEddy_Loop( _voodooEddyGUID )--�Ŭr�x�� ����ˮ`
	DebugMsg( 0 , 0 , "Lua_703138_Skill_VoodooEddy_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703138_AI_GlobalVars[ _roomID ]._bossID;

	local x,y,z,dir = DW_Location( _ownerID );

	ScriptMessage(_bossID,0,2,"[$MUTE]".."[LUA_703138_AI_FINDCOVER]",0);--�b �Ŭr�x�� �z�����e ��� ��v��¶ �����ͥH�Ѱ�
	while ( CheckBuff( _ownerID , 625478 ) ) do
		DebugMsg( 0 , 0 , "�Ŭr�x�� ����ˮ` : ".._ownerID );
		SysCastSpellLv_Pos( _bossID , x,y,z , _voodooEddyGUID , Skill.Lv[_voodooEddyGUID][Cl_GetDiff(172)] );--851625�t��q�i
		
		Sleep( 30 );
	end
end

function Lua_703138_Skill_VoodooEddy_End()--�Ŭr�x�� ����
	DebugMsg( 0 , 0 , "Lua_703138_Skill_VoodooEddy_End");
	
	return true;
end

--�C3��|��d��75�X����L���a�y���ˮ`�A����12��A�ɶ���H��|�Ѱ��d��75�X�����Ŭr�x���C
function Lua_703138_Skill_DarkTwining()--625479��v��¶

	local _ownerID = OwnerID();--�I�k��
	local _targetID = TargetID();--���`��

	DebugMsg( 0 , 0 , "Lua_703138_Skill_DarkTwining : ".._ownerID.."  : ".._targetID);

	local _darkTwiningGUID = 851668;--��v��¶ �ˮ`
	
	--CallPlot( _targetID , "Lua_703138_Skill_DarkTwining_Loop" , 851668 );
	CallPlot( _targetID , "Lua_703138_Skill_DarkTwining_Loop" , _darkTwiningGUID );

	return true;
	
end

function Lua_703138_Skill_DarkTwining_Loop( _darkTwiningGUID )--��v��¶ ����ˮ`
	DebugMsg( 0 , 0 , "Lua_703138_Skill_DarkTwining_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703138_AI_GlobalVars[ _roomID ]._bossID;

	local x,y,z,dir = DW_Location( _ownerID );
	while ( CheckBuff( _ownerID , 625479 ) ) do
		DebugMsg( 0 , 0 , "��v��¶ ����ˮ` : ".._ownerID );
		SysCastSpellLv_Pos( _bossID , x,y,z , _darkTwiningGUID , Skill.Lv[_darkTwiningGUID][Cl_GetDiff(172)] );--851625��v��¶
	
		Sleep( 30 );
	end
	
end

function Lua_703138_Skill_DarkTwining_End()--��v��¶ ����	--�ɶ���H��|�Ѱ��d��75�X�����Ŭr�x���C
	DebugMsg( 0 , 0 , "Lua_703138_Skill_DarkTwining_End");
	local _ownerID = OwnerID();
	local _effectiveRange = 75;
	local _rangePlayerList = SearchRangePlayer( _ownerID , _effectiveRange );

	for _index , _playerID in pairs( _rangePlayerList ) do
		CancelBuff_NoEvent( _playerID , 625478 );--625478�Ŭr�x��
	end
	
end
-----------------------------------------------------END---------------�Ŭr�x��+��v��¶


-----------------------------------------------------------------------�j�ۤj��M
function Lua_703138_Skill_BigBlade()
	DebugMsg( 0 , 0 , "Lua_703138_Skill_BigBlade");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;
	local _bigBladeDamageSkillGUID = 851675;--851675 �j�ۤj��M�ˮ`�ޯ�

	local _maxTarget = 2;
	local _availableTargetPlayer = Lua_RandomPlayerFromHateList( _bossID , _maxTarget , false ); --HowMuch��J�h�ִN�O���h�֭Ӫ��a�AAntiTank��TRUE�N�O�n�ƩZ

	local x,y,z,dir = 0;
	local _cloneGUID = _gConsts._bladeGUID;--108899 �j�ۤj��M
	local _cloneID = 0;

	for _index , _playerID in pairs( _availableTargetPlayer ) do--�bBoss��m�гy��M��NPC
		x,y,z,dir = DW_Location( _bossID );
		_cloneID = _gConsts.ExtObj( _cloneGUID , x,y,z,dir );
		WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , 16 );

		x,y,z,dir = DW_Location( _playerID );
		CastSpellPos( _cloneID , x , y , z , 851680 , 1 );--���M�S��
		CallPlot( _cloneID , "Lua_703138_Skill_CreateSpinningBlade" , _bigBladeDamageSkillGUID , _cloneGUID ,x,y,z , _roomID );
		DebugMsg( 0 , 0 , "--BossClone : ".._index);
	end

end

function Lua_703138_Skill_CreateSpinningBlade( _bigBladeDamageSkillGUID , _bladeGUID , x,y,z , _roomID )
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];

	Sleep( 20 );

	local _bladeID = _gConsts.ExtObj( _bladeGUID , x,y,z,dir );
	WriteRoleValue( _bladeID , EM_RoleValue_LiveTime , 16 );
	SetModeEx( _bladeID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _bladeID , EM_SetModeType_HideName , false );	--����ܦW��
	SetModeEx( _bladeID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _bladeID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _bladeID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _bladeID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _bladeID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _bladeID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG

	AddBuff( _bladeID , 625486 , 0 , -1 );--�j��M�S��
	CallPlot( _bladeID , "Lua_703138_Skill_BigBlade_Loop" , _bigBladeDamageSkillGUID );
	DebugMsg( 0 , 0 , "--�j��M : " );

end

function Lua_703138_Skill_BigBlade_Loop( _bigBladeDamageSkillGUID )
	DebugMsg( 0 , 0 , "Lua_703138_Skill_BigBlade_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703138_AI_GlobalVars[ _roomID ]._bossID;

	local x,y,z,dir = DW_Location( _ownerID );
	local _maxTime = 30;--�I��15��
	local _currentTime = 1;
	while ( _currentTime <= _maxTime ) do
		--DebugMsg( 0 , 0 , "�j�ۤj��M ����ˮ` : ".._ownerID );
		SysCastSpellLv_Pos( _bossID , x,y,z , _bigBladeDamageSkillGUID , Skill.Lv[_bigBladeDamageSkillGUID][Cl_GetDiff(172)] );--108899�j�ۤj��M
		
		Sleep( 5 );
	end
	DelObj( _ownerID );
	
end
--------------------------------------------------------END------------�j�ۤj��M


-----------------------------------------------------------------------�ľW
function Lua_703138_Skill_Rush()
	DebugMsg( 0 , 0 , "Lua_703138_Skill_Rush");
	local _bossID = OwnerID();
	local _maxTarget = 2;
	local _availableTargetPlayer = Lua_RandomPlayerFromHateList( _bossID , _maxTarget , false );

	for _index , _playerID in pairs( _availableTargetPlayer ) do
		CastSpellLV( _bossID , _playerID , 851663 , 0 );--851663�ľW
	end
	return;
end

--------------------------------------------------------END------------�ľW


--------------------------------------------------------------------------�Ŭr����M
--�C20��|���Y�u�Ŭr����M�v�H�Ρu�q�y���ˡv�b���W�H����m�A����ɶ�15��C
function Lua_703138_Skill_ThrowWoodooBlade()
	DebugMsg( 0 , 0 , "Lua_703138_Skill_ThrowWoodooBlade");
	
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];
	local _bossID = _gConsts._bossID;
	local _woodooBladeDamageSkillGUID = 851677;--851677�Ŭr����M�ˮ`�ޯ�
	local _electricityTotemSkillGUID = 851678;--851678�q�y���˶ˮ`�ޯ�

	local x,y,z,dir = DW_Location( _bossID );
	local _cloneGUID = _gConsts._bladeGUID;--108899�z���y
	local _cloneID = 0;

	local _skills = { 	[_woodooBladeDamageSkillGUID] = "Lua_703138_Skill_CreateSpinningWoodooBlade",
 			[_electricityTotemSkillGUID] = "Lua_703138_Skill_CreateElectricityTotem"
		};

	local _targetX , _targetZ = 0;
	for _skillGUID , _functionName in pairs( _skills ) do--�bBoss��m�гy��M��NPC
		--��MNPC
		_cloneID = _gConsts.ExtObj( _cloneGUID , x,y,z,dir );--�bBoss��m�гy��M��NPC
		WriteRoleValue( _cloneID , EM_RoleValue_LiveTime , 16 );
		SetModeEx( _cloneID , EM_SetModeType_Mark , false );	--���i�I��
		SetModeEx( _cloneID , EM_SetModeType_HideName , false );	--����ܦW��
		SetModeEx( _cloneID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
		SetModeEx( _cloneID , EM_SetModeType_Strikback , false );	--���|����
		SetModeEx( _cloneID , EM_SetModeType_Move , false );	--���|����
		SetModeEx( _cloneID , EM_SetModeType_Fight , false );	--���i����
		SetModeEx( _cloneID , EM_SetModeType_Searchenemy , false );	--���|����
		SetModeEx( _cloneID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG

		_targetX = x + ( RandRange( 1 , 300 ) - 150 );
		_targetZ = z + ( RandRange( 1 , 300 ) - 150 );

		CastSpellPos( _cloneID , x , y , z , 851680 , 1 );--���M�S��
		DebugMsg( 0 , 0 , "--BossClone : ".._skillGUID );
		CallPlot( _cloneID , _functionName , _skillGUID , _cloneGUID ,_targetX,y,_targetZ , _roomID );
	end

	return;
end

function Lua_703138_Skill_CreateSpinningWoodooBlade( _woodooBladeDamageSkillGUID , _bladeGUID ,x,y,z , _roomID )
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];

	Sleep( 20 );

	local _bladeID = _gConsts.ExtObj( _bladeGUID , x,y,z,dir );--�Ŭr����M
	WriteRoleValue( _bladeID , EM_RoleValue_LiveTime , 11 );
	SetModeEx( _bladeID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _bladeID , EM_SetModeType_HideName , false );	--����ܦW��
	SetModeEx( _bladeID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _bladeID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _bladeID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _bladeID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _bladeID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _bladeID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG

	AddBuff( _bladeID , 625486 , 0 , -1 );--625486�j��(�Ŭr)�j��M�S��BUFF
	CallPlot( _bladeID , "Lua_703138_Skill_WoodooBlade_Loop" , _woodooBladeDamageSkillGUID );
	DebugMsg( 0 , 0 , "--�Ŭr����M : ");
end

function Lua_703138_Skill_CreateElectricityTotem( _electricityTotemSkillGUID , _bladeGUID ,x,y,z , _roomID )
	local _gConsts = _Lua_703138_AI_GlobalVars[ _roomID ];

	Sleep( 20 );

	local _totemID = _gConsts.ExtObj( _gConsts._electricityTotemGUID , x,y,z,dir );--�q�y����
	WriteRoleValue( _totemID , EM_RoleValue_LiveTime , 11 );
	SetModeEx( _totemID , EM_SetModeType_Mark , false );	--���i�I��
	SetModeEx( _totemID , EM_SetModeType_HideName , false );	--����ܦW��
	SetModeEx( _totemID , EM_SetModeType_NotShowHPMP , false );	--����ܦ��
	SetModeEx( _totemID , EM_SetModeType_Strikback , false );	--���|����
	SetModeEx( _totemID , EM_SetModeType_Move , false );	--���|����
	SetModeEx( _totemID , EM_SetModeType_Fight , false );	--���i����
	SetModeEx( _totemID , EM_SetModeType_Searchenemy , false );	--���|����
	SetModeEx( _totemID , EM_SetModeType_Obstruct , false );	--�L���׮ĪG

	AddBuff( _totemID , 625495 , 0 , -1 );--625495�q�y���˯S��
	CallPlot( _totemID , "Lua_703138_Skill_ElectricityTotem_Loop" , _electricityTotemSkillGUID );
	DebugMsg( 0 , 0 , "--�q�y���� : ");
end



function Lua_703138_Skill_WoodooBlade_Loop( _woodooBladeDamageSkillGUID )
	DebugMsg( 0 , 0 , "Lua_703138_Skill_WoodooBlade_Loop");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703138_AI_GlobalVars[ _roomID ]._bossID;

	local x,y,z,dir = DW_Location( _ownerID );
	while ( true ) do
		--DebugMsg( 0 , 0 , "�Ŭr�j��M ����ˮ` : ".._ownerID );
		SysCastSpellLv_Pos( _bossID , x,y,z , _woodooBladeDamageSkillGUID , Skill.Lv[_woodooBladeDamageSkillGUID][Cl_GetDiff(172)] );--851677�Ŭr����M�ˮ`�ޯ�
		Sleep( 5 );
	end

end

function Lua_703138_Skill_ElectricityTotem_Loop( _electricityTotemSkillGUID )
	DebugMsg( 0 , 0 , "Lua_703138_Skill_ThrowWoodooBlade");
	local _ownerID = OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	local _bossID = _Lua_703138_AI_GlobalVars[ _roomID ]._bossID;
	local _effectiveRange = 75;

	--local _rangePlayerList = SearchRangePlayer( _ownerID , _effectiveRange );
	local x,y,z,dir = DW_Location( _ownerID );
	while ( true ) do
		--if ( #_rangePlayerList > 0 ) then
			DebugMsg( 0 , 0 , "�q�y���� ����ˮ` : ".._ownerID );
			--SysCastSpellLv_Pos( _bossID , x,y,z , _electricityTotemSkillGUID , 1 );--851678�q�y����
			CastSpellLV( _ownerID , _ownerID , _electricityTotemSkillGUID ,Skill.Lv[_electricityTotemSkillGUID][Cl_GetDiff(172)]);--851678�q�y����
		--end
		Sleep( 30 );
	end
end

function Lua_703138_Skill_ElectricityTotem_Hit()
	DebugMsg( 0 , 0 , "Lua_703138_Skill_ElectricityTotem_Hit");--������BOSS�� �N--625481�K��g�ƨ���
	local _ownerID = OwnerID();--�I�k��
	local _targetID = TargetID();--���`��

	CancelBuff_NoEvent( _ownerID , 625481 );--625481�K��g��
	CancelBuff_NoEvent( _targetID , 625481 );--625481�K��g��

	return true;
end

function Lua_703138_Skill_KillSelf()
	local OwnerID = OwnerID()
	KillID( OwnerID , OwnerID )
end

--------------------------------------------------------END------------�Ŭr����M