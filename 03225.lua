-- �`������
local g_WaterPressureTickTime = 10;	-- �W�`�����������j�ɶ�( ��� 0.1 �� )
local g_WaterPressureBuffID = 626295;	-- Boss������Debuff - �`������
local g_WaterPressureMagicID = 852281;	-- �`����������t�S��

-- �������
local g_WaveObjID = 107071;	-- �z������
local g_WaveWarningBuffID = 626303;	-- �wĵ�S��
local g_WaveAttackMagicID = 852287;	-- �ˮ`�ĪG
local g_WaveWarningTime = 1;	-- �wĵ�ɶ�(���:1��)
local g_WaveAttackCount = 2;	--  ��������C���������i��
local g_WaveAttackTickTime = g_WaveWarningTime*10 + 5;	--  ��������C�������᪺���j�ɶ�(���:0.1 ��)
local g_WaveLiveTime = Math.ceil(( g_WaveAttackCount*g_WaveAttackTickTime )/10) + ( g_WaveAttackCount * g_WaveWarningTime )+1 ;	-- �ͦs�ɶ�(���:1��)�A�w�]�� + 1��
local g_WaveTickTime = 70;	--  �}����A��������C�����ͪ����j�ɶ�(���:0.1 ��)�A�w�]�� 70

-- �B�y�W
local g_IcePierceObjID = 107071;	-- �z������
local g_IcePierceWarningBuffID = 626300;	-- �wĵ�S��
local g_IcePierceActMagicID = 852285;	-- �ˮ`�S��
local g_IcePierceAttackMagicID = 852286;	-- �ˮ`�ĪG
local g_IcePierceWarningTime = 1;	-- �wĵ�ɶ�(���:1��)
local g_IcePierceLiveTime = 2;	-- �ͦs�ɶ�(���:1��)
local g_IcePierceTickTime = 120;	--  �}����A�B�y�W�C�����ͪ����j�ɶ�(���:0.1 ��)�A�w�]�� 120

-- ����
local g_ShellList = {};	-- ���ͭ�����m���y�вM��
local g_ShellID = 106959;	-- ����ID
local g_ShellLiveTime = 60;	-- �����ͦs�ɶ�(��� 1 ��)
local g_ShellStraightCount = 5;	-- ���ͭ��������Ƽƶq
local g_ShellTransverseCount = 5;	-- ���ͭ�������Ƽƶq
local g_ShellTotallyCount = g_ShellStraightCount * g_ShellTransverseCount;	-- ���ͭ�����m���̤j�ƶq
local g_ShellStraightDis = 30;	-- �C�ӭ������j�����ƶ��Z
local g_ShellTransverseDis = 30;	-- �C�ӭ������j����ƶ��Z
local g_ShellBuffID = 626294;	-- Ĳ�I��������o�� Buff
local g_ShellBuffTime = 15;	-- Buff ������ɶ�
local g_ShellMaxCount = 10;	-- ���W�������̤j�ƶq
local g_ShellDebutPos = { 5, 21, 25 };	-- �}���ɲ��ͭ������_�l�ƶq�P��m
local g_ShellBornTickTime = 150;		-- �}����A�����C�����ͪ����j�ɶ�( ��� 0.1 �� )�A�w�]�� 150
local g_ShellCloseMagicID = 852284;	-- ���񭵨��ɪ���t�S��

-- �ݦ�Q��
local g_BloodList = {};	-- �ݦ�Q�����`�q
local g_BloodID = 106960;	-- �ݦ�Q����ID
local g_BloodBornDis = 50;	-- �ݦ�Q�����ͮɻP Boss ���Z��
local g_BloodBornCount = 3;	-- �ݦ�Q���C�����ͪ��ƶq
local g_BloodMaxCount = 9;	-- ���W�ݦ�Q�����̤j�ƶq
local g_BloodBornTickTime = 100;	-- �}����A�ݦ�Q���C�����ͪ����j�ɶ�( ��� 0.1 �� )�A�w�]�� 100
local g_BloodDeadMagicID = 852283;	-- �ݦ�Q�����`�ɡA��Boss�y���ˮ`����t�S��

local g_UnHealHpAuto = 502707;	-- ���۰ʦ^��

local function CompDis( A, B )	-- �������A���Ѧ��s���� Script �P�_�Z����
	if A.Dis < B.Dis then
		return true;
	end
end

function MirrorWorld_104845_GetShellPos(Owner,Room)	-- �������ͦ�m

	-- �]�w�|��ΰ}�C�A�^�� Table ( �ѦҪ���B�_�l�Z���B���ਤ�סB���Ʀ�ơB��Ʀ�ơB���ƶ��Z�B��ƶ��Z )
	local PosList = Lua_SetQuadrangleFormation( Owner, 0, 0, g_ShellStraightCount, g_ShellTransverseCount, g_ShellStraightDis, g_ShellTransverseDis );

	for i = 1, #PosList do
		PosList[i].Guid = 0;	-- �P�_���I��m�O�_�i�ͦ������A0 ���i�ͦ��A�O���� Guid �ɬ����Ӧ�m�w�ͦ�
		table.insert( g_ShellList[Room], PosList[i] );
	end
	return g_ShellList[Room];
end

function MirrorWorld_104845_WaterPressure( Owner, Room )	-- �`�������@��

	local HateList = HateListCount( Owner );
	for i = 0, HateList-1 do
		local Target = HateListInfo( Owner, i, EM_HateListInfoType_GItemID );	-- ���o Boss ����C�����ؼ�
		if ReadRoleValue( Target, EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( Target, EM_RoleValue_IsDead ) == 0 then
			if not CheckBuff( Target, g_ShellBuffID ) then
				SysCastSpellLv( Owner, Target, g_WaterPressureMagicID, 0 );
				AddBuff( Target, g_WaterPressureBuffID, 0, -1 );
			end
		end
	end
end

function MirrorWorld_WaveCreate( Master, Player, Room )	-- ����������ͼ@��

	local PlayerPos = Vector_GetRolePos( Player );
	local Wave = CreateObj( g_WaveObjID, PlayerPos.X, PlayerPos.Y, PlayerPos.Z, 0, 1 );	-- �إ߳z������
	SetModeEx( Wave, EM_SetModeType_ShowRoleHead, false )	-- ���
	SetModeEx( Wave, EM_SetModeType_Move, false );	-- ����
	SetModeEx( Wave, EM_SetModeType_Fight, false );	-- ���
	SetModeEx( Wave, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( Wave, EM_SetModeType_Strikback, false );	-- ����
	WriteRoleValue( Wave, EM_RoleValue_LiveTime, g_WaveLiveTime );
	AddToPartition( Wave, Room );
	CallPlot( Wave, "MirrorWorld_WaveDmg", Wave, Master, Player );
end

function MirrorWorld_WaveDmg( Wave, Master, Player )	-- ��������ˮ`

	local WaveAttackCount = g_WaveAttackCount;

	while WaveAttackCount > 0 and ReadRoleValue( Master, EM_RoleValue_IsAttackMode ) == 1 do
		AddBuff( Wave, g_WaveWarningBuffID, 0, Math.ceil(g_WaveWarningTime) );
		Sleep( g_WaveWarningTime*10 );
		SysCastSpellLv( Master, Wave, g_WaveAttackMagicID, 0 );	-- �ˮ`
		WaveAttackCount = WaveAttackCount - 1;
		Sleep(g_WaveAttackTickTime);
		local PlayerPos = Vector_GetRolePos( Player );
		SetPos( Wave, PlayerPos.X, PlayerPos.Y, PlayerPos.Z, 0 );
	end
end

function MirrorWorld_626304_Check()	-- ��������ˬd�@��

	local Owner = OwnerID();	-- Boss
	local Target = TargetID();	-- ���a�έ���

	if ReadRoleValue( Target, EM_RoleValue_OrgID ) == g_ShellID then
		DelObj( Target );
	--	DebugMsg( 0, 0, "Del Shell" );
	end
	return true;
end

function MirrorWorld_PierceCreate( Master, Player, Room )	-- �B�y�W���ͼ@��

	local PlayerPos = Vector_GetRolePos( Player );
	local Dir = ReadRoleValue( Player, EM_RoleValue_Dir );
	local VecDir	-- �V�q
	local IcePierce	-- �B�y�W
	local IcePierceAngle = { 0, 45, 90, 135, 180, 225, 270, 315 };	-- �B�y�W�ͦ�������
	local Distance = GameObjInfo_Int( g_IcePierceAttackMagicID, "EffectRange" );	-- �C�ӦB�y�W�P���a���Z��
	local IcePiercePos
	table.remove( IcePierceAngle, Math.random(#IcePierceAngle) );	-- �s�y�@�ӯʤf�A�����a�k��

	for i = 1, #IcePierceAngle do
		VecDir = Vector_DirToVector( Dir + 90 + IcePierceAngle[i]  );
		IcePiercePos = PlayerPos + VecDir * (Distance-10);
		local IcePierce = CreateObj( g_IcePierceObjID, IcePiercePos.X, IcePiercePos.Y, IcePiercePos.Z, 0, 1 );	-- �إ߳z������
		AdjustFaceDir( IcePierce, Player, 0 );	-- ���V
		MoveToFlagEnabled( IcePierce, false );
		WriteRoleValue( IcePierce, EM_RoleValue_IsWalk, 0 );	-- �]�B
		SetModeEx( IcePierce, EM_SetModeType_ShowRoleHead, false )	-- ���
		SetModeEx( IcePierce, EM_SetModeType_Move, true );	-- ����
		SetModeEx( IcePierce, EM_SetModeType_Fight, false );	-- ���
		SetModeEx( IcePierce, EM_SetModeType_Searchenemy, false );	-- ����
		SetModeEx( IcePierce, EM_SetModeType_Strikback, false );	-- ����
		WriteRoleValue( IcePierce, EM_RoleValue_LiveTime, g_IcePierceLiveTime );
		AddBuff( IcePierce, g_IcePierceWarningBuffID, 0, Math.ceil(g_IcePierceWarningTime) );
		AddToPartition( IcePierce, Room );
		CallPlot( IcePierce, "MirrorWorld_PierceDmg", IcePierce, Master, Player, i );
	end
	DebugMsg( 0, 0, "-----------------------------------------------------" );
end

function MirrorWorld_PierceDmg( IcePierce, Master, Player, i )	-- �B�y�W�ˮ`( �B�W�B�B�W��m�BBoss�B���a�B���a��e��m�B���� )

	local IcePiercePos = Vector_GetRolePos( IcePierce );
	local PlayerPos = Vector_GetRolePos( Player );

	Sleep(g_IcePierceWarningTime*10);
	SysCastSpellLv( Master, IcePierce, g_IcePierceActMagicID, 0 );	-- ��t�S��

	local Sec = MoveDirect( IcePierce, PlayerPos.X, PlayerPos.Y, PlayerPos.Z );
	local NewPlayerPos = Vector_GetRolePos( Player );
	
	--�ˬd�ؼЬO�_�b���w���B�e�����u�d�򤺡A�_�^��Nil�B�O���ܦ^�ǥؼлP�_�I���Z�� ( �_�I�y�СB���I�y�СB�e�סB���סB�ؼЮy��)
	local Status = Vector_CheckShootObj( IcePiercePos, PlayerPos, 10, 60, NewPlayerPos );
	DebugMsg( 0, 0, "No. "..i.. ", Hit = "..tostring( Status ) );
	if Status then
		SysCastSpellLv( Master, Player, g_IcePierceAttackMagicID, 0 );	-- �ˮ`
	end
--	DebugMsg( 0, 0, "i = "..i..", Sec = "..Sec );
end

function MirrorWorld_104845_Shell( Owner, Room )	-- �������ͼ@��

	local List = {};	-- �z����W�|�����ͭ��������A�ñN�M�椤�w�������������i�M��
	for Index, Shell in ipairs(g_ShellList[Room]) do
		if not CheckID( g_ShellList[Room][Index].Guid ) then
			table.insert( List, Index );
		--	DebugMsg( Owner, Room, "Index = "..Index );
		end
	end

	if g_ShellTotallyCount - #List < g_ShellMaxCount then	-- ���W�Ҧ���� - ��e�Ѿl��� < �����̤j���ͼƶq��
		local Index = List[math.random( #List )];		-- ���W�|�����ͭ������`��ơA�q�o�Ǯ�l�����ͭ���
	--	DebugMsg( Owner, Room, "Index = "..List[Index].." Totally = "..#List );
		local Obj = MirrorWorld_106960_CreateLua( Room, Index );
	end
end

function MirrorWorld_106960_CreateLua( Room, Index )	-- �ͦ�����

	local Obj = CreateObj( g_ShellID, g_ShellList[Room][Index].X, g_ShellList[Room][Index].Y+2, g_ShellList[Room][Index].Z, 0, 1 );
	SetModeEx( Obj, EM_SetModeType_Gravity, false );	--���O
	SetModeEx( Obj, EM_SetModeType_ShowRoleHead, true );	--�Y����
	SetModeEx( Obj, EM_SetModeType_Fight, true );	-- �i���
	SetModeEx( Obj, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( Obj, EM_SetModeType_Strikback, false );	-- ����
	g_ShellList[Room][Index].Guid = Obj;
	WriteRoleValue( Obj, EM_RoleValue_LiveTime, g_ShellLiveTime );
	AddToPartition( Obj, Room );
	return Obj;
end

function MirrorWorld_106959_DeadLua()	-- �������`�@��

	DelObj( OwnerID() );
end

function MirrorWorld_104845_InitLua()	-- Boss �԰��@��

	local Owner = OwnerID();
	CallPlot( Owner, "MirrorWorld_104845_Fight", Owner );
	SetPlot( Owner, "Dead", "MirrorWorld_104845_LeaveFight", 0 );	-- ���`�@��
end

function MirrorWorld_104845_Fight( Owner )	-- Boss �԰��}�l�@��

	local Room = ReadRoleValuefloat( Owner, EM_RoleValue_RoomID );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );	-- ����

	g_ShellList = {};	-- ���m������m���y�вM��
	g_ShellList[Room] = {};
	g_BloodList = {};	-- ���m�ݦ�Q�����M��
	g_BloodList[Room] = {};

	g_ShellList[Room] = MirrorWorld_104845_GetShellPos(Owner,Room);

	for i = 1, #g_ShellDebutPos do	-- �C���}���ɡA���ͩT�w��쪺����
		local Obj = MirrorWorld_106960_CreateLua( Room, g_ShellDebutPos[i] );
	end

	local Counter = 0;

	-- �����B�ݦ�Q�����ͼ@��
	While true do

		Sleep(10);
		local Player = false;
		local HateList = HateListCount( Owner );
		for Pos = 0, HateList-1 do	-- �ˬd Boss �����
			local Guid = HateListInfo( Owner, Pos, EM_HateListInfoType_GItemID );
			if ReadRoleValue( Guid, EM_RoleValue_IsPlayer ) == 1 then	-- ����������@�ؼЬ����a�ɡA�קK�ȳѭ����ɡA�����X�԰��@�������D
				Player = Guid;
				break;
			end
		end

		if not Player then
			break;
		end

		Counter = Counter + 10;

		-- Boss�I��`������
		if Counter%g_WaterPressureTickTime == 0 then
		--	DebugMsg( 0, 0, "Counter = "..Counter );
			MirrorWorld_104845_WaterPressure( Owner, Room );
		end

		-- ���ͭ���
		if Counter%g_ShellBornTickTime == 0 then
		--	DebugMsg( 0, 0, "Counter = "..Counter );
			MirrorWorld_104845_Shell( Owner, Room );
		end

		-- ���Ͷݦ�Q��
		if Counter%g_BloodBornTickTime == 0 then
		--	DebugMsg( 0, 0, "Counter = "..Counter );
			MirrorWorld_104845_Blood( Owner, Room );
		end

		-- ��L�ޯ�
		if Counter%g_WaveTickTime == 0 then	-- Boss�I��������
			MirrorWorld_WaveCreate( Owner, Player, Room );
		elseif Counter%g_IcePierceTickTime == 0 then	-- Boss�I��B�y�W
			MirrorWorld_PierceCreate( Owner, Player, Room );
		end
	end
	MirrorWorld_104845_LeaveFight()
end

function MirrorWorld_104845_LeaveFight()	-- ����R���@��

	local Room = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );

	-- �R������
	for i = 1, #g_ShellList[Room] do
		if CheckID( g_ShellList[Room][i].Guid ) then
			DelObj( g_ShellList[Room][i].Guid );
		end
	end
	-- �R���ݦ�Q��
	for i = 1, #g_BloodList[Room] do
		if CheckID( g_BloodList[Room][i] ) then
			DelObj( g_BloodList[Room][i] );
		end
	end
end

function MirrorWorld_104845_Blood( Owner, Room )	-- �ݦ�Q�����ͼ@��

	local BloodCount = #g_BloodList[Room];
	DebugMsg( 0, Room, "Blood Totally = "..BloodCount );

	for i = BloodCount, 1, -1 do	-- �R���M�椤�L�Ī��ݦ�Q��
		if not CheckID( g_BloodList[Room][i] ) then
			table.remove( g_BloodList[Room], i );
		end
	end

	if BloodCount < g_BloodMaxCount then	-- �P�_�O�_�i�ͦ��ݦ�Q��
		local OwnerPos = Vector_GetRolePos( Owner );	-- �y��
		local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );	-- ����
		local BornCount = g_BloodMaxCount - BloodCount;	-- �����ͦ�����
	--	DebugMsg( Owner, Room, "Dir = "..Dir..", "..tostring( OwnerPos ) );

		if BornCount > g_BloodBornCount then
			BornCount = g_BloodBornCount;
		end
	--	DebugMsg( Owner, Room, "Blood This Born = "..BornCount );

		for i = 0, BornCount-1 do
			local VecDir = Vector_DirToVector( Dir + i * 360/BornCount );	-- ������V�q
			local TargetPos = OwnerPos + VecDir * g_BloodBornDis;
			local Obj = CreateObj( g_BloodID, TargetPos.X, TargetPos.Y, TargetPos.Z, 0, 1 );
			table.insert( g_BloodList[Room], Obj );
			MoveToFlagEnabled( Obj, false );	-- �������޼@��
		--	WriteRoleValue( Obj, EM_RoleValue_LiveTime, 60 );
			WriteRoleValue( Obj, EM_RoleValue_PID, Owner );	-- �N Boss �g�i�ݦ�Q���� PID ��
			AddToPartition( Obj, Room );
		--	AddBuff( Obj, g_UnHealHpAuto, 0, -1 );
			SetPlot( Obj, "Dead", "MirrorWorld_106960_Dead", 0 );
		end
	end
end

function MirrorWorld_106960_Dead()	-- �ݦ�Q�����`�@��

	local Owner = OwnerID();
	SetModeEx( Owner, EM_SetModeType_ShowRoleHead, false );	-- �����Y����
	SetModeEx( Owner, EM_SetModeType_Fight, false );	-- �������
	SetModeEx( Owner, EM_SetModeType_Searchenemy, false );	-- ��������
	SetModeEx( Owner, EM_SetModeType_Strikback, false );	-- ��������
	PlayMotionEx( Owner, 145, 146 );	-- ���񦺤`�ʧ@

	local Master = ReadRoleValue( Owner, EM_RoleValue_PID );	-- Boss
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Hp = ReadRoleValue( Master, EM_RoleValue_HP );
	local MaxHp = ReadRoleValue( Master, EM_RoleValue_MaxHP );
--	DebugMsg( 0, 0, "Hp Percent = "..Hp/MaxHp );
	if Hp / MaxHp > 0.01 then	-- �ݦ�Q�����`�ɡA�� Boss ���� 1% �ͩR
		WriteRoleValue( Master, EM_RoleValue_HP, Hp - (MaxHp*0.01) );
		SysCastSpellLv( Owner, Master, g_BloodDeadMagicID, 0 );	-- ��t�S��
		CallPlot( Owner, "MirrorWorld_106960_DelSelf", Owner );
	end
	return false;
end

function MirrorWorld_106960_DelSelf( Owner )	-- �R���ۤv

	Sleep(10);
	DelObj( Owner );
end

function MirrorWorld_106960_InitLua()	-- �ݦ�Q���_�l�@��

	local Owner = OwnerID();
	SetModeEx( Owner, EM_SetModeType_Fight, true );	-- �i���
	SetModeEx( Owner, EM_SetModeType_Strikback, false );	-- ����
	SetModeEx( Owner, EM_SetModeType_Searchenemy, false );	-- ����
	MoveToFlagEnabled( Owner, false );	-- �������޼@��
	CallPlot( Owner, "MirrorWorld_106960_Fight", Owner );
end

function MirrorWorld_106960_Fight( Owner )	-- �ݦ�Q���԰��@��

	local Master = ReadRoleValue( Owner, EM_RoleValue_PID );	-- Boss
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local AttackShell = 0;	-- ��e�����ؼ�

	while true do	-- �C 0.5 ��T�{���W�O�_�������A�������u�������̪񪺭����A�_�h�N�������a�C

		local ShellCount = {};	-- �����M��
		for i = 1, #g_ShellList[Room] do
			if CheckID( g_ShellList[Room][i].Guid ) then	-- �N�s�b��������J�����M�椤
				table.insert( ShellCount, g_ShellList[Room][i].Guid );
			end
		end

		if #ShellCount == 0 then	-- ����W�S�����󭵨���
			Target = HateListInfo( Master, 0, EM_HateListInfoType_GItemID );	-- ���o Boss ����C���Ĥ@�W���ؼ�
			SetAttack( Owner, Target );
		--	DebugMsg( 0, Room, "ShellCount = "..#ShellCount );

		elseif AttackShell == 0 then	-- ����W�������A�|���]�w����������
			local OwnerPos = Vector_GetRolePos(Owner);
			local RangeList = {};	-- �Z���M��
			for i = 1, #g_ShellList[Room] do	-- �����M��
				if CheckID( g_ShellList[Room][i].Guid ) and ReadRoleValue( g_ShellList[Room][i].Guid, EM_RoleValue_IsDead ) == 0 then
					local ShellPos = Vector_GetRolePos( g_ShellList[Room][i].Guid );
					local Dis = ( OwnerPos - ShellPos ):Len();
					local Obj = {};
					Obj.Guid = g_ShellList[Room][i].Guid;
					Obj.Dis = Dis;
					table.insert( RangeList, Obj );
				end
			end
		--	DebugMsg( 0, Room, "ShellCount = "..#RangeList );
			if #RangeList > 0 then
				table.sort( RangeList, CompDis )	-- �N�M�椺�������̷ӶZ���Ѫ�ܻ��Ƨ�
				AttackShell = RangeList[1].Guid;
				SetStopAttack( Owner );	-- �������
				SetAttack( Owner, AttackShell );
			end

		elseif not CheckID( AttackShell ) or ReadRoleValue( AttackShell, EM_RoleValue_IsDead ) == 1 then	-- ��������������s�b�Φ��`��
			AttackShell = 0;	-- �N��e�����ؼЭ��m
		--	DebugMsg( 0, Room, "Reset Target" );
		end
		Sleep(5);
	end	
end

function MirrorWorld_106959_InitLua()	-- �����_�l�@��

	local Owner = OwnerID();
	CallPlot( Owner, "MirrorWorld_106959_Range", Owner );
end

function MirrorWorld_106959_Range( Owner )	-- ���񭵨��ɵ������aBuff�A�òM�����a���W���`������

	Sleep(10);	-- 1���˸m�N��

	while true do
		local Count = SetSearchRangeInfo( Owner, 10 );
		if Count > 0 then	-- �u�缾�a���ġA������L����
			for i = 1, Count, 1 do
				local Guid = GetSearchResult();
				if ReadRoleValue( Guid, EM_RoleValue_IsPlayer ) == 1 then
					SetModeEx( Owner, EM_SetModeType_Fight, false );
					WriteRoleValue( Owner, EM_RoleValue_IsWalk, 0 );	-- �]�B
					local OwnerPos = Vector_GetRolePos( Owner );
					local Sec = MoveDirect( Owner, OwnerPos.X, OwnerPos.Y+25, OwnerPos.Z );
					SysCastSpellLv( Guid, Guid, g_ShellCloseMagicID, 0 );
					AddBuff( Guid, g_ShellBuffID, 0, g_ShellBuffTime );
					if CheckBuff( Guid, g_WaterPressureBuffID ) then
						local BuffLv = Lua_Hao_Return_Buff_Lv( Guid, g_WaterPressureBuffID ) - 5;
						CancelBuff_NoEvent( Guid, g_WaterPressureBuffID );
						if BuffLv > -1 then
							AddBuff( Guid, g_WaterPressureBuffID, BuffLv, -1 );
						end
					end
					Sleep(25);
					DelObj( Owner );
				end
			end
		end
		Sleep(1);
	end
end