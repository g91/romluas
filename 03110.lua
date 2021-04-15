--Auther : K.J. Aris
--Version : 13.10.18.14.05

--Z166	Z167	Z168
--Z30 dungen Boss	No.1
--Script	703110
--NPC 108432

function AI_703110_Init()--NPC 108432
	--basics
	local _bossID = OwnerID();
	local _roomID = ReadRoleValue( _bossID , EM_RoleValue_RoomID );
	local x,y,z,dir = DW_Location( _bossID );

	--local _bossRole = Christine.Role:new( _bossID );

	-------------------------------------------initialize settings
		--------------------------------------------------------public functions
		local _AddParasite , _ctrlID = AssignParasiteHost( _bossID );

		local function CreateDerivativeOnBoss( _objOriID , _x , _y , _z , _dir )	--�l�ͪ�(�۳ꪫ �� ���X�Ӫ��F��)
			x,y,z,dir = DW_Location( _bossID );
			local _objID = CreateObj( _objOriID , _x or x , _y or y , _z or z , _dir or dir , 1 );
			_AddParasite( _objID );
			AddToPartition( _objID , _roomID );
			return _objID;
		end
		-----------------------------------------------END------public functions

		--------------------------------------------------------value object settings
		_Z30D_Boss1_VO = {};--value object --global oriented
		--public variables
		_Z30D_Boss1_VO._bossID = _bossID;
		_Z30D_Boss1_VO._roomID = _roomID;
		_Z30D_Boss1_VO._bunkerID = 0;
		--_Z30D_Boss1_VO._oriPos = { "_x" = x , "_y" = y , "_z" = z , "_dir" = dir };

		_Z30D_Boss1_VO._battlePhase = 0;	--�����԰����q	--0.�@��԰����q	
										--1.�ʧ@���q ( �i�J/�^�X Bunker )( �Ӷ��q�u����t�ʧ@   )		
										--2.Bunker�԰����q

		--_Z30D_Boss1_VO._one10thHP = ReadRoleValue( _bossID , EM_RoleValue_MaxHP )*0.1;
		_Z30D_Boss1_VO._ctrlID = _ctrlID;--������


		--public methods
		_Z30D_Boss1_VO.AddParasite = _AddParasite;	--�l�ͪ���
		_Z30D_Boss1_VO.CreateDerivativeOnBoss = CreateDerivativeOnBoss;	--�ֳt�bBOSS����гy����

		-----------------------------------------------END------value object settings
	---------------------------------END-------initialize settings

end--function AI_703110_Init

function ResetSequence( _bossID )--���m�y�{
	DW_UnFight( _bossID , true );
	Lua_ObjDontTouch( _bossID , true );
	--Lua_WaitToMoveFlag( _bossID , FlagID , FlagNum , 0 );	--repositioning	--need a flag on stage
	DelFromPartition( _bossID );
	Sleep( 50 );
	AddToPartition( _bossID , _Z30D_Boss1_VO._roomID );--
	DW_UnFight( _bossID , false );
	Lua_ObjDontTouch( _bossID , false );

	_Z30D_Boss1_VO._ctrlID = 0;--clear central controller
	_Z30D_Boss1_VO._battlePhase = 0;--reset battle phase
end--function ResetSequence


function AI_703110_Engage()--NPC 108432

	--if ( not _Z30D_Boss1_VO ) then	
	--	DebugMsg(0,0,"-------Initialize");
		AI_703110_Init();--�L�k��PLOT�b��l���q   �]���u�n�C�������_�l�ʧ@
	--end

	--_Z30D_Boss1_VO._bossID = OwnerID();

	local _bossID = _Z30D_Boss1_VO._bossID;
	local _roomID = _Z30D_Boss1_VO._roomID;
	local _ctrlID = _Z30D_Boss1_VO._ctrlID;
	local x,y,z,dir = DW_Location( _bossID );

	
	
	------ignition sequence
	--start fight
	BeginPlot( _ctrlID , "AI_703110_BattleLoop" , 0 );

	--���ת�
		--##

	--create bunker
	local _bunkerAvatarID = 108433;--�Z�˨��d

	local _bunkerID = _Z30D_Boss1_VO.CreateDerivativeOnBoss( _bunkerAvatarID , x , y , z , dir );
	DW_UnFight( _bunkerID , true );	--�@�}�l���԰�	for test
	Lua_ObjDontTouch( _bunkerID , true );	--�@�}�l���԰�	for test
		
	_Z30D_Boss1_VO._bunkerID = _bunkerID;

	--DW_UnFight( _Z30D_Boss1_VO._bunkerID , false );	--�}��BUNKER�԰�	(�����y�{)
	--Lua_ObjDontTouch( _Z30D_Boss1_VO._bunkerID , false );	

end--function AI_703110_Engage

function AI_703110_BattleLoop()--NPC 108432
	local _bossID = _Z30D_Boss1_VO._bossID;
	local _bunkerID = _Z30D_Boss1_VO._bunkerID;
	local _roomID = _Z30D_Boss1_VO._roomID;
	local _ctrlID = _Z30D_Boss1_VO._ctrlID;
	--------------variables
	local _bossHpRatio = 0;--�p��ثeHP���	(�C��10%��A�Q���i�i�|�i�J�Z�˨��d���i��԰��C)
	local _HpStepping = 0.9;

	local _clock = 0;
	--------------variables

	DebugMsg(0,0,"-----------Combat Loop Started");
	while true do 
		-------------------------------------------------�԰���������
		Sleep( 10 );
		if ( CheckID( _bossID ) == false ) or ( ReadRoleValue( _bossID , EM_RoleValue_IsDead ) == 1 ) then -- boss ���`�ɤ��_�԰��j��
			DebugMsg(0,0,"------Boss is dead !!  ".._bossID );
			break;
		end
		-------------------------------------END--------�԰���������

		
		
		--------------------------------------------------�@��԰����q	
		if ( _Z30D_Boss1_VO._battlePhase == 0 ) then	--0.�@��԰����q	1.�ʧ@���q ( �i�J/�^�X Bunker )	2.Bunker�԰����q
			--�ޯ�զX�@

			-----------------------------------------------�԰����q�ഫ
			_bossHpRatio = ReadRoleValue( _bossID , EM_RoleValue_HP )/ReadRoleValue( _bossID , EM_RoleValue_MaxHP );--HP ratio
			if ( _bossHpRatio <= _HpStepping ) then--����W�L10%Ĳ�o
				if ( _HpStepping > 0 ) then
					_HpStepping = _bossHpRatio - 0.1;
					DebugMsg( 0 , 0 , "Next Ratio : ".._HpStepping );
					BeginPlot( _ctrlID , "AI_703110_SwitchToBunkerFight" , 0 );--�i�J�ʧ@ �� ������BUNKER�԰�	
				end
			end
			-------------------------------------END-----�԰����q�ഫ
		end
		--------------------------------------END---------�@��԰����q




		--------------------------------------------------bunker�԰����q
		--in the bunker
		if ( _Z30D_Boss1_VO._battlePhase == 2 ) then	--0.�@��԰����q	1.�ʧ@���q ( �i�J/�^�X Bunker )	2.Bunker�԰����q
			--�ޯ�զX�G
			--do something bunker
			--DebugMsg(0,0,"----bunker fighting.");

			
			--reset to phase 1 after bumbing by 3 missiles 
			sleep( 50 );--����   5������L�^��@��԰����q
			BeginPlot( _ctrlID , "AI_703110_SwitchToOrdinaryFight" , 0 );--����   5������L�^��@��԰����q
			
		end
		--------------------------------------END---------bunker�԰����q

		_clock = _clock + 1;
	end--end while
	DebugMsg(0,0,"-----------Combat Loop End");
	--�R�����ת�
	ResetSequence( _bossID );

end--function AI_703110_BattleLoop




function AI_703110_SwitchToBunkerFight()--�i�JBUNKER�ʧ@
	DebugMsg(0,0,"----Switch to bunker fighting");
	_Z30D_Boss1_VO._battlePhase = 1; --�g���ʧ@���q
	--�i�JBUNKER�ʧ@
		--�]��bunker��m
		--hide	( Caution : player AE )	
		--lock HP
		--##
	--delay
		--##
	--������BUNKER�԰�(�L��)
	DW_UnFight( _Z30D_Boss1_VO._bunkerID , false );	--�}��BUNKER�԰�	for test
	Lua_ObjDontTouch( _Z30D_Boss1_VO._bunkerID , false );	
	_Z30D_Boss1_VO._battlePhase = 2;--bunker mode
end--function AI_703110_SwitchToBunkerFight

function AI_703110_SwitchToOrdinaryFight()--�^�XBUNKER�ʧ@
	DebugMsg(0,0,"----Switch to ordinary fighting");
	_Z30D_Boss1_VO._battlePhase = 1; --�g���ʧ@���q
	--�^�XBUNKER�ʧ@
		--##
	--delay
		--##
	--�������@��԰�
	DW_UnFight( _Z30D_Boss1_VO._bunkerID , true );	--����BUNKER�԰�	for test
	Lua_ObjDontTouch( _Z30D_Boss1_VO._bunkerID , true );	
	_Z30D_Boss1_VO._battlePhase = 0;--�@��԰�

end--function AI_703110_SwitchToOrdinaryFight