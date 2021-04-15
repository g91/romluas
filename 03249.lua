
local g_Flag = {};
g_Flag.ID = 781402;
g_Flag.CreateDoorNum = 0;	-- �������ͦ�m
g_Flag.CreateMonsterNum = 0;	-- �U���q�Ǫ������ͦ�m
g_Flag.CreateUnLockRuneNum = { Min = 6, Max = 30 };	-- ����Ť媺�üƲ��ͦ�m
g_Flag.CreateTreasureNum = 31;	-- �_�c�����ͦ�m

local g_Time = {};	-- �ɶ�
--g_Time.CreateUnLockRuneDelayTime = 1;	-- ���ե[�֥ΡG�C���q�}�l�X�{����Ť媺����ɶ�( ���:�� )
--g_Time.NextStepDelayTime = 1;	-- ���ե[�֥ΡG�C���q�i�J�U�@���q�e�X�Ǫ�����ɶ�( ���:�� )
g_Time.CreateUnLockRuneDelayTime = 20;	-- �C���q�}�l�X�{����Ť媺����ɶ�( ���:�� )
g_Time.NextStepDelayTime = 10;	-- �C���q�i�J�U�@���q�e�X�Ǫ�����ɶ�( ���:�� )
g_Time.CreateMonsterTickTime = 10;	-- �U���q�C���ͦ��Ǫ������j�ɶ�( ���:�� )

g_Time.KillCaptain = {};	-- �}�ԫ᪽�ܰ��Ĩ��Q�۱����ɶ�
g_Time.KillCaptain[951] = 300;
g_Time.KillCaptain[169] = 480;
g_Time.KillCaptain[170] = 360;
g_Time.KillCaptain[171] = nil;

local g_Msg = {};
g_Msg.OverPower = "[SC_108684_03]";	-- �A���[�ָ}�B�A�ĤH�N�|�V�ӶV�����I�I
g_Msg.TimeOut = "[$MUTE]".."[SC_108684_RAID]";	-- ��F�Ӥ[�ɶ��A[108684]�w�g�����U�h�F�K�K
g_Msg.MissionFail = "[SC_108684_RESET]";	-- ��ϥ��ѡI
g_Msg.MissionComplete = "[SC_108684_DEATH]";	-- ��Ϧ��\�I
g_Msg.KeyAppears = "[SC_108684_04]";	-- ���ꪺ�����_�ͥX�{�F�I
g_Msg.KeyUseComplete = "[$MUTE]".."[SC_108684_01]";	-- [$VAR1]�w�g�Ѷ}�F[$VAR2]������C
g_Msg.KeyUseFail = "[SC_108684_02]";	-- �S���۹������Ť�i�H�Ѷ}������
g_Msg.Saved = "[EM_421042_2]";	-- �ש�o�ϤF�A���§A�C

local g_Step = {};	-- �O���U�h��e�𲤪����q

local g_TouchRune = {};	-- �ʱ��O�_���ؼиIĲ����Ť�
g_TouchRune.CreateStatus = {};	-- �U�h��e�O�_�w�ͦ�����Ť�
g_TouchRune.Guid = {};	-- �U�h��e�IĲ����Ť媺���a
g_TouchRune.BuffID = {};	-- �U�h��e�IĲ����Ť����o���Ť�s��

local g_Buff = {};
g_Buff.RuneList = {};	-- �U�h��e�Ť� Buff ���M��
g_Buff.BindShelter = 500343;	-- �T�D���ɡA�����Ĳ��ͮɱ����� Buff
g_Buff.LockTarget = 622105;	-- ��w�ؼСA���]����Ȧӧ��ܥؼ�
g_Buff.Fury = 625468;	-- ����T���A�|�����w�f��o���j�ƮĪG
g_Buff.FuryEffectRange = 30;	-- ����T��Ĳ�o���d��

g_Buff.Rune = { 625443, 625444, 625445, 625446, 625447 };	-- ���a���W���Ť�Buff ( ���K�B�H�B�B���O�B��šB�ɥ� )
g_Buff.Shelter = { 625448, 625449, 625450, 625451, 625452 };	-- �Ť�������W���Ť�������� ( ���K�B�H�B�B���O�B��šB�ɥ� )

local g_Obj = {};
g_Obj.Ctrl = {};	-- �O���U�h��������
g_Obj.ShelterList = {};	-- �O���U�h���Ť�������A
g_Obj.UnlockList = {};	-- �O���U�h������Ť�
g_Obj.LockRune = 123511;	-- �Ť����
g_Obj.UnlockRune = 123515;	-- ����Ť�
g_Obj.DoorID = 106251;	-- ��
g_Obj.Door = {};	-- �O���U�h����

g_Obj.Treasure = {};	-- �_�c
g_Obj.Treasure[951] = 108616;
g_Obj.Treasure[169] = 108616;	-- �x��
g_Obj.Treasure[170] = 106154;	-- ���q
g_Obj.Treasure[171] = 106155;	-- ²��

g_Obj.Boss = {}	-- ���Ĩ�����
g_Obj.Boss[951] = 106984;
g_Obj.Boss[169] = 108684;	-- �x��
g_Obj.Boss[170] = 108880;	-- ���q
g_Obj.Boss[171] = 108886;	-- ²��

g_Obj.Captain = {};	-- �O���U�h�����Ĩ�����
g_Obj.Monster = {};	-- �O���U�h���X��Npc
g_Obj.Kobolds = {};	-- �ʱ����W���|���w�f�A���;���P�W�[�����O����C
g_Obj.Kobolds.MaxCount = 20;	-- ���W�|���w�f�����ͤW��

g_Obj.Step = {};	-- Npc�M��
g_Obj.Step[1] = {};	-- ���q 1 ���XNpc ( ���B������B�j�������� )
g_Obj.Step[1][951] = { 106985, 106986 };
g_Obj.Step[1][169] = { 108660, 108661 };	-- �x��
g_Obj.Step[1][170] = { 108875, 108876 };	-- ���q
g_Obj.Step[1][171] = { 108881, 108882 };	-- ²��

g_Obj.Step[2] = {}	-- ���q 2 ���XNpc ( �|�����w�f )
g_Obj.Step[2][951] = { 106987, 106987 };
g_Obj.Step[2][169] = { 108663, 108663 };	-- �x��
g_Obj.Step[2][170] = { 108878, 108878 };	-- ���q
g_Obj.Step[2][171] = { 108884, 108884 };	-- ²��

g_Obj.Step[3] = {}	-- ���q 3 ���XNpc ( �¨c���� )
g_Obj.Step[3][951] = { 106990 };
g_Obj.Step[3][169] = { 108662 };	-- �x��
g_Obj.Step[3][170] = { 108877 };	-- ���q
g_Obj.Step[3][171] = { 108883 };	-- ²��

g_Obj.Step[4] = {}	-- ���q 4 ���XNpc ( �¨c���ݪ� )
g_Obj.Step[4][951] = { 106988 };
g_Obj.Step[4][169] = { 108664 };	-- �x��
g_Obj.Step[4][170] = { 108879 };	-- ���q
g_Obj.Step[4][171] = { 108885 };	-- ²��

g_Obj.Step[5] = {}	-- ���q 5 ���XNpc ( ���q1 ~ ���q4 �C���Ǫ� )
g_Obj.Step[5][951] = { 106985, 106986, 106987, 106990, 106988 };
g_Obj.Step[5][169] = { 108660, 108661, 108663, 108662, 108664 };	-- �x��
g_Obj.Step[5][170] = { 108875, 108876, 108878, 108877, 108879 };	-- ���q
g_Obj.Step[5][171] = { 108881, 108882, 108884, 108883, 108885 };	-- ²��

local function DelAllObj( Ctrl, Captain, Room, StopDelMonster )	-- �R������@��

--	DebugMsg( 0, 0, "����R���@��" );
	-- �R�����a���W���Ť�Buff
	if g_TouchRune.Guid[Room] and CheckID( g_TouchRune.Guid[Room] ) then
		CancelBuff_NoEvent( g_TouchRune.Guid[Room], g_TouchRune.BuffID[Room] );
	end

	-- �R�����Ĩ�����
	if CheckID( g_Obj.Captain[Room] ) then
		DelObj( g_Obj.Captain[Room] );
	end

	-- �R���Ť����
	for i = 1, #g_Obj.ShelterList[Room] do
		if CheckID( g_Obj.ShelterList[Room][i] ) then
			DelObj( g_Obj.ShelterList[Room][i] );
		end
	end
	
	-- �R������Ť�
	if g_Obj.UnlockList[Room] and CheckID( g_Obj.UnlockList[Room] ) then
		DelObj( g_Obj.UnlockList[Room] );
	end

	-- �R���j��
	if g_Obj.Door[Room] and CheckID( g_Obj.Door[Room] ) then
		DelObj( g_Obj.Door[Room] );
	end

	-- �R���Ǫ�
	if StopDelMonster then
		return
	end

	for i = 1, #g_Obj.Monster[Room] do
		if CheckID( g_Obj.Monster[Room][i] ) then
			DelObj( g_Obj.Monster[Room][i] );
		end
	end
end

local function CreateAllObj( Ctrl, Zone, Room )	-- ���Ͱ��Ĩ������B�Ť�����B�ŧi�j��

--	DebugMsg( 0, 0, "���󲣥ͼ@��" );
	local CtrlPos = Vector_GetRolePos( Ctrl );
	local CtrlDir = ReadRoleValue( Ctrl, EM_RoleValue_Dir );
--	local VecDir = Vector_DirToVector( CtrlDir + 90 );
--	local CaptainPos = CtrlPos + VecDir * -25;

	-- �إ߰��Ĩ�����
--	local Captain = CreateObj( g_Obj.Boss[Zone], CaptainPos.X, CaptainPos.Y, CaptainPos.Z, CtrlDir, 1 );
	local Captain = CreateObj( g_Obj.Boss[Zone], CtrlPos.X, CtrlPos.Y, CtrlPos.Z, CtrlDir, 1 );
	SetModeEx( Captain, EM_SetModeType_Strikback, false );	-- ����
	SetModeEx( Captain, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( Captain, EM_SetModeType_Move, false );	-- ����
	AddBuff( Captain, g_Buff.BindShelter, 0, -1 );
	AddToPartition( Captain, Room );
	g_Obj.Captain[Room] = Captain;
	CallPlot( Captain, "Instance_32_Boss2_Init", Captain, Ctrl, Zone, Room );

	-- �إ߲Ť����
	g_Obj.ShelterList[Room] = {};
--	DebugMsg( 0, 0, "�Ť���� table = "..tostring(#g_Buff.Shelter) );
	for i = 1, #g_Buff.Shelter do
		local FlagPos = {};
		local FlagDir
		FlagPos.X, FlagPos.Y, FlagPos.Z, FlagDir = DW_Location( g_Flag.ID, i );
		local LockRune = CreateObj( g_Obj.LockRune, FlagPos.X, FlagPos.Y, FlagPos.Z, 0, 1 );
		SetModeEx( LockRune, EM_SetModeType_ShowRoleHead, true );	-- �Y����
		SetModeEx( LockRune, EM_SetModeType_NotShowHPMP, true );	-- ���
		SetModeEx( LockRune, EM_SetModeType_Obstruct, true );	-- ����
		AddBuff( LockRune, g_Buff.Shelter[i], 0, -1 );
		WriteRoleValue( LockRune, EM_RoleValue_PID, i );	-- ��K������ѥ�
		table.insert( g_Obj.ShelterList[Room], LockRune );	-- ���Ť�����b�}�ԫ�~�i�H�Q�I��
		AddToPartition( LockRune, Room );
	end

	-- �ŧi��
	g_Obj.Door[Room] = false;

	-- ���m�U�h�ƥ��Ǫ��M��
	g_Obj.Monster[Room] = {};
end

function Npc_108660_Init()	-- ���B������B�j�������� ���ͼ@��

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );

	if g_Obj.Captain[Room] and CheckID( g_Obj.Captain[Room] ) and ReadRoleValue( g_Obj.Captain[Room], EM_RoleValue_IsDead ) == 0 then
		AddBuff( Owner, g_Buff.LockTarget, 0, - 1 );
		SetAttack( Owner, g_Obj.Captain[Room] );
	end
end

function Npc_108663_Dead()	-- �|�����w�f ���`�@��

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );

	-- �N�ۤv�q�|�����w�f�M�椤����
	for i = #g_Obj.Kobolds[Room], 1, -1 do
		if g_Obj.Kobolds[Room][i] == Owner then
			table.remove( g_Obj.Kobolds[Room], i );
			break;
		end
	end
--	DebugMsg( 0, 0, "�w�f�s���ƶq = "..#g_Obj.Kobolds[Room] );
	if g_Step[Room] < 6 and CheckID( g_Obj.Captain[Room] ) and ReadRoleValue( g_Obj.Captain[Room], EM_RoleValue_IsDead ) == 0 then
	--	DebugMsg( 0, 0, "�w�f�`�� = "..#g_Obj.Kobolds[Room] );
		local ObjID = ReadRoleValue( Owner, EM_RoleValue_OrgID );
		local MonsterPos = {};
		local MonsterDir = 0;
		MonsterPos.X, MonsterPos.Y, MonsterPos.Z, MonsterDir = DW_Location( g_Flag.ID, g_Flag.CreateMonsterNum );
	--	DebugMsg( 0, 0, "�ͩǶ��q : "..g_Step[Room]..", ���X�s�w�f = "..ObjID );
		local Monster = CreateObj( ObjID, MonsterPos.X, MonsterPos.Y, MonsterPos.Z, MonsterDir, 1 );
		AddToPartition( Monster, Room );

		-- 20151130 ���E�G�s�����b�Ⱦ���A������԰��}�l
		Hao_antiHacker_Fight( 2, Monster );

		SetAttack( Monster, g_Obj.Captain[Room] );
		table.insert( g_Obj.Monster[Room], Monster );	-- �[�i�Ǫ��M��
	end
end

function Npc_108663_Init()	-- �|�����w�f ���ͼ@��

	local Owner = OwnerID();
	local Zone = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	table.insert( g_Obj.Kobolds[Room], Owner );	-- �[�i�|�����w�f�M�ݲM��

	CallPlot( Owner, "Npc_108663_CheckFury", Owner, Zone, Room );
end

function Npc_108663_CheckFury( Owner, Zone, Room )

	while true do
		Sleep(10);
		-- �塚���Z�� 30 �����w�f�I������T��
		for i = #g_Obj.Kobolds[Room], 1, -1 do
			if GetDistance( g_Obj.Kobolds[Room][i], Owner ) < g_Buff.FuryEffectRange then
				AddBuff( Owner, g_Buff.Fury, 0, -1 );
				break;
			end
		end
	end
end

function Instance_32_Boss2_CtrlObj_Init()	-- ������(104607)�_�l�@��

	local Ctrl = OwnerID();
	local Zone = ReadRoleValue( Ctrl, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Ctrl, EM_RoleValue_RoomID );
	g_Obj.Ctrl[Room] = Ctrl;
	CreateAllObj( Ctrl, Zone, Room );
end

function Instance_32_Boss2_Init( Captain, Ctrl, Zone, Room )	-- ���Ĩ����� ���ͼ@��

	-- ���m���w�h���
	g_Step[Room] = 1;	-- �𲤶��q
	g_TouchRune.Guid[Room] = false;	-- �O����e�IĲ����Ť媺���a
	g_TouchRune.BuffID[Room] = false;	-- �O����e�IĲ����Ť����o���Ť�s��
	g_TouchRune.CreateStatus[Room] = false;	-- �O���ثe������Ť�ͦ����A ( true = �ͦ��A false = ���ͦ� )
	g_Buff.RuneList[Room] = {};	-- �O����e�����ꪺ�Ť�M��
	g_Obj.Kobolds[Room] = {};	-- �O����e�ͦ����|�����w�f

	for i = 1, #g_Buff.Rune do
		table.insert( g_Buff.RuneList[Room], g_Buff.Rune[i] );
	end

	while true do
		local PlayerList = SearchRangePlayer( Captain, 100 );
		if #PlayerList ~= 0 then
			for i = 0, #PlayerList-1 do
				if ReadRoleValue( PlayerList[i], EM_RoleValue_IsDead ) == 0 then
					CallPlot( Ctrl, "Instance_32_Boss2_BeginFight", Ctrl, Captain, PlayerList[i], Zone, Room );
					return;
				end

			end
		end
		Sleep(10);
	end
--	SetPlot( Captain, "range", "Instance_32_Boss2_BeginFight", 100 );	-- �ϥ�Ĳ�I�@���ɡA�|���b�d�򤺵L�k���sĲ�o�����D
end

function Instance_32_Boss2_BeginFight( Ctrl, Captain, Player, Zone, Room )	-- �Ѥ���������԰��}�l�@��

	-- �}�ҩҦ��Ť������Ĳ�I�@��
	for i = 1, #g_Obj.ShelterList[Room] do
		SetPlot( g_Obj.ShelterList[Room][i], "touch", "Instance_32_LockRune_Plot", 30 );
	end

	local Counter = {};	-- �p�ƾ�
	Counter.GameTime = 0;	-- �C���ɶ�
	Counter.CreateMonster = 0;	-- �C���q�֭p�X�Ǫ��ɶ�
	Counter.CreateUnlockRune = 0;	-- �C���q�֭p���X����Ť�e���ɶ�
	Counter.NextStepDelayTime = 0;	-- �C���q�֭p���ܤU���q�e������ɶ�

	local Survivalers = {};	-- �ͦs�����a�ƶq
	local Step = g_Step[Room];	-- �O�����q�A�ΥH�ͩǧP�_

	-- �ͦ���
	local DoorPos = {};
	local DoorDir;
	DoorPos.X, DoorPos.Y, DoorPos.Z, DoorDir = DW_Location( g_Flag.ID, g_Flag.CreateDoorNum );
	g_Obj.Door[Room] = CreateObj( g_Obj.DoorID, DoorPos.X, DoorPos.Y, DoorPos.Z, DoorDir, 1 );
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Fight, false );	-- ���
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Strikback, false );	-- ����
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Searchenemy, false );	--����
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Move, false );	-- ����
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Mark, false );	-- �аO
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_ShowRoleHead, false );	-- �Y����
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_NotShowHPMP, true );	-- ���
	SetModeEx( g_Obj.Door[Room], EM_SetModeType_Obstruct, true );	-- ����
	AddToPartition( g_Obj.Door[Room], Room );

	while g_Step[Room] < 6 do

		Sleep(10);
		Counter.GameTime = Counter.GameTime + 1;

		-- �P�_�ͩ�
		if Step == g_Step[Room] then	-- �ͩ�
			Counter.CreateMonster = Counter.CreateMonster + 1;
			if Counter.CreateMonster%g_Time.CreateMonsterTickTime == 1 then
			--	DebugMsg( 0, 0, "�ͩǶ��q : "..g_Step[Room] );
				for i = 1, #g_Obj.Step[g_Step[Room]][Zone] do
					if ( Step == 2 or ( Step == 5 and i == 3 ) ) and #g_Obj.Kobolds[Room] >= g_Obj.Kobolds.MaxCount then	-- �ʱ����W���w�f�O�_�w�F�W��
						DebugMsg( 0, 0, "�|�����w�f�A��e�ƶq = "..#g_Obj.Kobolds[Room]..", �ͦ��W�� = "..g_Obj.Kobolds.MaxCount );
						-- ���i�����Ʊ�
					else
						local MonsterPos = {};
						local MonsterDir = 0;
						MonsterPos.X, MonsterPos.Y, MonsterPos.Z, MonsterDir = DW_Location( g_Flag.ID, g_Flag.CreateMonsterNum );
						DebugMsg( 0, 0, "���q : "..g_Step[Room]..", ��e���q�֭p�ɶ��G"..Counter.CreateMonster..", ���X�Ǫ��s���G"..g_Obj.Step[g_Step[Room]][Zone][i] );
						local Monster = CreateObj( g_Obj.Step[g_Step[Room]][Zone][i], MonsterPos.X, MonsterPos.Y, MonsterPos.Z, MonsterDir, 1 );
						AddToPartition( Monster, Room );

						-- 20151130 ���E�G�s�����b�Ⱦ���A������԰��}�l
						Hao_antiHacker_Fight( 2, Monster );

						SetAttack( Monster, Captain );
						table.insert( g_Obj.Monster[Room], Monster );
					end
					Sleep(1);
				end
			end
		else	-- �󴫶��q�A�Ȱ��ͩ�
			Counter.NextStepDelayTime = Counter.NextStepDelayTime + 1;
			DebugMsg( 0, 0, "�ܧ󶥬q�A�Ȱ��ͩǩ���ɶ� = "..Counter.NextStepDelayTime );
			if Counter.NextStepDelayTime%g_Time.NextStepDelayTime == 0 then
				Counter.CreateMonster = 0;
				Counter.NextStepDelayTime = 0;
				Step = g_Step[Room];
			end
		end

		-- �ɶ�����ɭ��m
		if g_Time.KillCaptain[Zone] and Counter.GameTime > g_Time.KillCaptain[Zone] then
			DebugMsg( 0, 0, "�ɶ��k�s, ����R���P���m" );
			ScriptMessage( Ctrl, -1, 2, g_Msg.TimeOut, 2 );
			KillID( Captain, Captain );
			Sleep(20);
			DelAllObj( Ctrl, Captain, Room );
			Sleep(50);
			CreateAllObj( Ctrl, Zone, Room );
			return
		end

		-- ���Ĩ��������`�ɭ��m
		if ReadRoleValue( Captain, EM_RoleValue_IsDead ) == 1 then
			DebugMsg( 0, 0, "�������`, ����R���P���m" )
			ScriptMessage( Ctrl, -1, 2, g_Msg.MissionFail, 2 );
			Sleep(20);
			DelAllObj( Ctrl, Captain, Room );
			Sleep(50);
			CreateAllObj( Ctrl, Zone, Room );
			return
		end

		-- �d�򤺨S�����a�ɭ��m
		local Players = SearchRangePlayer( Ctrl, 250 );
	--	DebugMsg( 0, 0, "Players = "..#Players );
		if #Players == 0 then
			DebugMsg( 0, 0, "�d�򤺪��a = 0, ����R���P���m" );
			DelAllObj( Ctrl, Captain, Room );
			Sleep(50);
			CreateAllObj( Ctrl, Zone, Room );
			return
		end

		Survivalers = {};
		for i = 0, #Players-1 do
			if ReadRoleValue( Players[i], EM_RoleValue_IsDead ) == 0 then
				table.insert( Survivalers, Players[i] );
			end
		end

		-- �d�򤺨S���ͦs�����a�ɭ��m
	--	DebugMsg( 0, 0, "Survivalers = "..#Survivalers );
		if #Survivalers == 0 then
			DebugMsg( 0, 0, "�d�򤺥ͦs���a = 0, ����R���P���m" )
			ScriptMessage( Ctrl, -1, 2, g_Msg.MissionFail, 2 );
			DelAllObj( Ctrl, Captain, Room );
			Sleep(50);
			CreateAllObj( Ctrl, Zone, Room );
			return
		end

		-- �����Ť�|�����ͮ�
		if not g_TouchRune.CreateStatus[Room] and Step == g_Step[Room] then
			Counter.CreateUnlockRune = Counter.CreateUnlockRune + 1
		--	DebugMsg( 0, 0, "UnlockRuneTime = "..Counter.CreateUnlockRune );
			if Counter.CreateUnlockRune%g_Time.CreateUnLockRuneDelayTime == 0 and #g_Buff.RuneList[Room] > 0 then
				Counter.CreateUnlockRune = 0;
				g_TouchRune.CreateStatus[Room] = true;
				g_TouchRune.BuffID[Room] = false;
				ScriptMessage( Ctrl, -1, 2, g_Msg.KeyAppears, 2 );
				CallPlot( Ctrl, "Instance_32_UnLockRune_Init", Ctrl, Zone, Room );	-- �ͦ�����Ť�
			end
		end

		-- �����Ť�w�QĲ�I�B�ӥؼФ��s�b�Φ��`��
		if g_TouchRune.Guid[Room] and ( not CheckID( g_TouchRune.Guid[Room] ) or ReadRoleValue( g_TouchRune.Guid[Room], EM_RoleValue_IsDead )  == 1 ) then
			DebugMsg( 0, 0, "�ؼФ��s�b�Φ��`" );
			g_TouchRune.Guid[Room] = false;
			CallPlot( Ctrl, "Instance_32_UnLockRune_Init", Ctrl, Zone, Room );	-- �ͦ�����Ť�
		end
	end

	ScriptMessage( Ctrl, -1, 2, g_Msg.MissionComplete, 2 );
	SetModeEx( Captain, EM_SetModeType_Fight, false );

	-- �I�s���W�Ҧ��]�����Ĩ������L�Ħӥ��h�ؼЪ��Ǫ��A�������W���@�s�������a
	local Players = SearchRangePlayer( Ctrl, 250 );

	for i = 1, #g_Obj.Monster[Room] do
		if CheckID( g_Obj.Monster[Room][i] ) then
			SetAttack( g_Obj.Monster[Room][i], Players[Math.Random(0,#Players-1)] );
		end
	end
	--

	Sleep( 10 );
	PlayMotion( Captain, ruFUSION_ACTORSTATE_BUFF_SP01 );	-- �����T�D
	CancelBuff_NoEvent( Captain, g_Buff.BindShelter );
	Sleep( 10 );
	PlayMotion( Captain, ruFUSION_ACTORSTATE_EMOTE_SALUTE );	-- �q§
	ScriptMessage( Ctrl, -1, 2, g_Msg.Saved, 2 );
	Sleep( 10 );

	local CaptainPos = Vector_GetRolePos( Captain );
	local CaptainDir = ReadRoleValue( Captain, EM_RoleValue_Dir );
	local VecDir = Vector_DirToVector( CaptainDir + 90 );

	local TreasurePos = CaptainPos + VecDir * 25;	-- �_�c��m�إߦb�����e�� 25 ��m�B
	local TreasureDir = CaptainDir + 180;
	if TreasureDir > 360 then TreasureDir = TreasureDir - 360 end
	TreasurePos.Y = GetHeight( TreasurePos.X, TreasurePos.Y, TreasurePos.Z );
	-- 2015.11.24 ���E:�] Zone 170�B171 �S���ͦ��_�c�ѷӪ� 31 ���X�СA�G������H���w��m�إ�
--	local TreasureDir
--	TreasurePos.X, TreasurePos.Y, TreasurePos.Z, TreasureDir = DW_Location( g_Flag.ID, g_Flag.CreateTreasureNum );
	local Treasure = CreateObj( g_Obj.Treasure[Zone], TreasurePos.X, TreasurePos.Y, TreasurePos.Z, TreasureDir, 1 );
	SetModeEx( Treasure, EM_SetModeType_Fight, false );
	SetModeEx( Treasure, EM_SetModeType_Searchenemy, false );
	SetModeEx( Treasure, EM_SetModeType_Strikback, false );
	SetModeEx( Treasure, EM_SetModeType_Move, false);	-- ����
	SetModeEx( Treasure, EM_SetModeType_Mark, true );	-- �аO
	SetModeEx( Treasure, EM_SetModeType_ShowRoleHead, false);	-- �Y����
	SetModeEx( Treasure, EM_SetModeType_NotShowHPMP, true );	-- ���
--	WriteRoleValue( Treasure, EM_RoleValue_LiveTime, 600 );	-- �_�c�ͦs�ɶ� 6 ����
	AddToPartition( Treasure, Room );

	for i = 1, #Survivalers do
		if CheckID( Survivalers[i]) then
			KilliD( Survivalers[i], Treasure );
			break;
		end
	end

	SetModeEx( Captain, EM_SetModeType_Move, true );
	WriteRoleValue( Captain, EM_RoleValue_IsWalk, 0 );	-- �]
	CaptainPos = CaptainPos + VecDir * 100;
	local DelayTime = MoveDirect( Captain, CaptainPos.X, CaptainPos.Y, CaptainPos.Z );
	Sleep( DelayTime );

	DelAllObj( Ctrl, Captain, Room, true );
--	DelObj( Captain );
end

function Instance_32_UnLockRune_Init( Ctrl, Zone, Room )	-- ����Ť�_�l�@��

	local CreatePos = Math.random( g_Flag.CreateUnLockRuneNum.Min, g_Flag.CreateUnLockRuneNum.Max );
	DebugMsg( 0, 0, "����Ť岣�ͦ�m = "..tostring(CreatePos) );

	local FlagPos = {};
	local FlagDir
	FlagPos.X, FlagPos.Y, FlagPos.Z, FlagDir = DW_Location( g_Flag.ID, CreatePos );
	local UnlockRune = CreateObj( g_Obj.UnlockRune, FlagPos.X, FlagPos.Y, FlagPos.Z, 0, 1 );
	AddToPartition( UnlockRune, Room );
	g_Obj.UnlockList[Room] = UnlockRune;
	SetPlot( UnlockRune, "touch", "Instance_32_UnLockRune_Plot", 30  );
end

function Instance_32_UnLockRune_Plot()	-- ����Ť�Ĳ�I�@��

	local Player = OwnerID();
	local UnlockRune = TargetID();
	local Room = ReadRoleValue( Player, EM_RoleValue_RoomID );

	SetPlot( UnlockRune, "touch", "", 0 );	-- ����Ĳ�I�@���A�קK�h�H�P���I���ɥi��o�ͪ��������D�C

	if not g_TouchRune.BuffID[Room] then
		g_TouchRune.BuffID[Room] = table.remove( g_Buff.RuneList[Room], Math.Random( #g_Buff.RuneList[Room] ) );
	end
	DebugMsg( 0, 0, "����Ť� ��o�Ť� = "..tostring(g_TouchRune.BuffID[Room]) );
	AddBuff( Player, g_TouchRune.BuffID[Room], 0, -1 );
	g_TouchRune.Guid[Room] = Player;
	DelObj( UnlockRune );
end

function Instance_32_LockRune_Plot()	-- �Ť����Ĳ�I�@��

	local Player = OwnerID();
	local LockRune = TargetID();
	local Room= ReadRoleValue( Player, EM_RoleValue_RoomID );

	SetPlot( LockRune, "touch", "", 0 );	-- ����Ĳ�I�@���A�קK�h�H�P���I���ɥi��o�ͪ��������D�C

	local Pos = ReadRoleValue( LockRune, EM_RoleValue_PID );
	if CheckBuff( Player, g_Buff.Rune[Pos] ) then
		g_TouchRune.CreateStatus[Room] = false;
		g_TouchRune.Guid[Room] = false;
		g_Obj.UnlockList[Room] = false;
		g_Step[Room] = g_Step[Room] + 1;

		local String = g_Msg.KeyUseComplete.."[$SETVAR1="..GetName( Player ).."][$SETVAR2=".."["..tostring( g_Buff.Rune[Pos] ).."]".."]"
		ScriptMessage( LockRune, -1, 2, String, 2 );
		DebugMsg( Player, 0, "��e���q "..g_Step[Room] );
		CancelBuff_NoEvent( Player, g_Buff.Rune[Pos] );
		g_TouchRune.BuffID[Room] = false;
		DelObj( LockRune );
		return
	end

--	DebugMsg( Player, 0, "�S������Buff :"..g_Buff.Rune[Pos] );
	ScriptMessage( LockRune, -1, 2, g_Msg.KeyUseFail, 2 );
	SetPlot( LockRune, "touch", "Instance_32_LockRune_Plot", 30 );
	return
end