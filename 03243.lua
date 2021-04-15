
local g_Msg = {};
g_Msg.BeginFight = "[$MUTE]".."[SC_30_DUPLICATION_1_1]";	-- �Q���i�i�G�u�x�A�~�M���H�����i�ڴx�ު��j�U���H�v
g_Msg.LeaveFight = "[$MUTE]".."[SC_30_DUPLICATION_1_2]";	-- �Q���i�i�o�N�a���ۡG�u�ګ����K�G�M�b�ڪ��ݦu�U�O���i�঳�H���\���J���I�v
g_Msg.MumuIsDead = "[$MUTE]".."[SC_30_DUPLICATION_1_3]";	-- �Q���i�i�G�u�L���K�L���I�K�K�A�̤��i�ଡ�ۨ��X�o�̡K�v
g_Msg.MumuCombineBanka = "[$MUTE]".."[SC_30_DUPLICATION_1_4]";	-- �Q���i�i�G�u�ݧڶi��ڥi�R�����d�����z�A�̡K�����K�v
g_Msg.MumuDetachBanka = "[$MUTE]".."[SC_30_DUPLICATION_1_5]";	-- �Q���i�i�G�u���r�I���I�ڪ����d�I�I�v
g_Msg.BeginFury = "[$MUTE]".."[SC_30_DUPLICATION_1_6]";	-- �Q���i�i�P�즳�Ƿ��������G�u�u�O�S���ڤF�A�S���ڤF�I�I�v

local g_Magic = {};	-- �k�N���X�M��
g_Magic.HateMaker = 495751;	-- �j����ؼ� 1 �I����A�b�C���X��ɡA�������Z�˨��d�~�ӧQ���i�i������M��A�Τ�������ؼй�Z�˨��d�I��o�Ӥ覡�~�ӡC

-------------- �Q���i�i --------------
-- ���줧��
g_Magic.ChainNet = {};
g_Magic.ChainNet.ActID = 852299;	-- �I�k��tID
g_Magic.ChainNet.CastID = 852297;	-- �I�kID
g_Magic.ChainNet.AttackID = 851253;	-- �ˮ`ID
g_Magic.ChainNet.TransportDis = 25;	-- �ǰe�ؼлP Boss �����j�Z��
g_Magic.ChainNet.CD = 8;	-- �N�o�ɶ�( ���:1 �� )
g_Magic.ChainNet.Targets = 2;	-- �ؼФH��

-- �g�k���h
g_Magic.Rejection = {};
g_Magic.Rejection.ActID = 852298;	-- �I�k��tID
g_Magic.Rejection.AttackID = 851450;	-- �ˮ`ID
g_Magic.Rejection.Range = 90;	-- �g�k���h�����Įg�{
g_Magic.Rejection.CD = 10;	-- �N�o�ɶ�( ���:1 �� )
g_Magic.Rejection.CastCount = 3;	-- �C���I��ɪ�����
g_Magic.Rejection.CastDelayTime = 5;	-- �C���I��᪺����ɶ�( ���: 0.1 �� )
g_Magic.Rejection.Spacing = 30;	-- �C���I��ɪ����j�Z��

-- �Z�˨I��
g_Magic.DeepStrike = {};
g_Magic.DeepStrike.RunLuaID = 851451;	-- �I�kID
g_Magic.DeepStrike.BonusAttackID = 851481;	-- �Z�˨I��.�}���A��ؼШ��W�� DeBuff - �g�ϦL�O(625234)�ɪ��l�[�ˮ`
g_Magic.DeepStrike.CD = 17;	-- �N�o�ɶ�( ���:1 �� )

-- ������D ( �I��ɦ]��t�|��ɶ��A�G�b�C�Ӧ]��t�ө��𪺮ɶ��I���n�T�{ Mumu �O�_�w�ŦX�X�����A�O���ܫh������t�P�ˮ` )
g_Magic.ChainJump = {};
g_Magic.ChainJump.ActID = 851473;	-- �I�k��tID
g_Magic.ChainJump.TauntID = 852300;	-- �D�]ID�A�ѥؼй�Boss����D�]�A��Boss��w�����ؼ�(���]����ȧ��ܥؼ�)
g_Magic.ChainJump.AttackID = 852301;	-- �ˮ`ID�ABoss��F�ؼЭ��e�ɤ~����ˮ`�C
g_Magic.ChainJump.TransportDis = 15;	-- Boss �ǰe�ܥؼЭ��e�h�֪����j�Z��
g_Magic.ChainJump.CD = 19;	-- �N�o�ɶ�( ���:1�� )

-------------- �Z�˨��d --------------
-- ��g�u
g_Magic.ThrowingBomb = {};
g_Magic.ThrowingBomb.ActID = 852302;	--�I�k��tID
g_Magic.ThrowingBomb.AttackID = 851474;	--�ˮ`ID
g_Magic.ThrowingBomb.CD = 9;	-- �N�o�ɶ�( ���:1�� )

-- �Ԥ��g��
g_Magic.CombatFog = {};
g_Magic.CombatFog.NpcID = 124310;	-- ���u����ID
g_Magic.CombatFog.Dis = 300;	-- ���Įg�{
g_Magic.CombatFog.Width = 15;	-- ���ļe��(�b�|��15)
g_Magic.CombatFog.Height = 60;	-- ���İ���(�W�U)
g_Magic.CombatFog.FlySpeed = 15;	-- �ޯ�t��(���:0.1��)�A�P���Ī��׻ݾ㰣�A���� Npc (109318) 1/10 �����ʳt��
g_Magic.CombatFog.ActID = 852303;	-- �I�kID
g_Magic.CombatFog.AttackID = 851475;	-- �ˮ`ID
g_Magic.CombatFog.CD = 11;	-- �N�o�ɶ�( ���:1�� )
g_Magic.CombatFog.TickTime = 30;	-- �C�i���u�����j�ɶ�( ���:0.1�� )
g_Magic.CombatFog.DelayTime = 10;	-- �C�i���u���ͫ�A�}�l���沾�ʪ��ɶ�( ���:0.1 ��)�����n�����ɶ��A����b��ͦ��������沾�ʷ|���ǡA�����n���� 1 �����沾�ʦ�m�~��...
g_Magic.CombatFog.Spacing = 0;	-- �C�i���u���ͮɡA�P���d���j���Z��
g_Magic.CombatFog.ShootDir = {}	-- �C�o���u���ͮɪ�����
g_Magic.CombatFog.ShootDir[1] = { -45, -30, -15, 0, 15, 30, 45 };	-- ��1�i���u(60��) 0 �׬����V������
g_Magic.CombatFog.ShootDir[2] = { -90, -67.5, -45, -22.5, 0, 22.5, 45, 67.5, 90 };	-- ��2�i���u(180��)
g_Magic.CombatFog.ShootDir[3] = { -135, -108, -81, -54, -27, 0, 27, 54, 81, 108, 135 };	-- �ĤT�i�A���O��3�i���u(360��)
g_Magic.CombatFog.HitUnits = {};	-- �Ԥ��g�������M��A�קK�Ƽƭ��u�P�ɹ��@�ؼгy���ˮ`�ɭP�ؼгQ��������p�o��

-------------- �Q���i�i�P�Z�˨��d�X�� --------------
-- �y�F�u
g_Magic.QuicksandBomb = {};
g_Magic.QuicksandBomb.RunLuaID = 851476;	-- ����Lua
g_Magic.QuicksandBomb.AttackID = 851480;	-- �a�����y�F�S�ĻP�ˮ`
g_Magic.QuicksandBomb.ActID = 852290;	-- �I�k�S�� ( ���d�P�y�F�@�� )
g_Magic.QuicksandBomb.HitUnits = {};	-- �y�F�����M��A�קK�ƼƬy�F�P�ɹ��@�ؼгy���ˮ`�ɭP�ؼгQ��������p�o��
g_Magic.QuicksandBomb.Range = 15;	-- �ˮ`�d��(��b�|)
g_Magic.QuicksandBomb.CD = 4;	-- �N�o�ɶ�( ���:1�� )
g_Magic.QuicksandBomb.Count = 6;	-- �C���I�񪺪i��
g_Magic.QuicksandBomb.TickTime = 5;	-- �C���I��ɪ��i�����j�ɶ�
g_Magic.QuicksandBomb.ContinuousCastTickTime = 10;	-- �y�F�u�C���I�k�ɪ����j�ɶ�( ���:0.1�� )
g_Magic.QuicksandBomb.LiveTime = 15;	-- �y�F�b�a�W�s�����ɶ�

-- �a�Ծɼu
g_Magic.GroundMissile = {};
g_Magic.GroundMissile.ActID = 851504;	-- �I�k��tID
g_Magic.GroundMissile.ContinuousActID = 852304;	-- �a�Ծɼu����I�kID�A�N��a�Ծɼu���~�[
g_Magic.GroundMissile.ContinuousCastTickTime = 5;	-- �a�Ծɼu�C���I�k�ɪ����j�ɶ�( ���:0.1�� )
g_Magic.GroundMissile.AttackID = 851483;	-- �ˮ`ID
g_Magic.GroundMissile.CD = 10;	-- �N�o�ɶ�( ���:1�� )
g_Magic.GroundMissile.Count = 3;	-- �C���I��ɪ��̤j�i��( �ؼФH�Ƥ֩� 3 �H�ɡA�ȬI��Ѿl�H�ƪ����� )
g_Magic.GroundMissile.TickTime = 5;	-- �C�i�a�Ծɼu�����j�ɶ�( ���:0.1�� )
g_Magic.GroundMissile.ReadyTime = 50;	-- �a�Ծɼu�b���ͫ�A�}�l�@�Ϋe���ǳƮɶ��A�קK�@�}�l�N��ۤv�Ϊ��a�y���ˮ`�����D ( ���:0.1�� )
g_Magic.GroundMissile.HitBanka = {};	-- �a�Ծɼu�O�_�w�R�����d�A�קK�ƼƦa�Ծɼu�P�ɩR�����d�ɡA�]�禡����Ĳ�o�ӾɭP�@�����_�����D
g_Magic.GroundMissile.List = {};	-- �����Ӱϰ줺���a�ԩҦ��ɼu�A����@�a�Ծɼu�������d�ɡA�R�����W��L���a�Ծɼu
g_Magic.GroundMissile.BankaTriggerRange = 50;	-- �a�Ծɼu�塀�d��Ĳ�o�d��( ���d����n���j�󪱮a�A�GĲ�o�d��n���t�� )
g_Magic.GroundMissile.PlayerTriggerRange = 25;	-- �a�Ծɼu�缾�a��Ĳ�o�d��

-- ��q��
g_Magic.EngryWeb = {};
g_Magic.EngryWeb.ActID = 851482;	-- �I�k��tID
g_Magic.EngryWeb.ActCastTime = 60;	-- �I�k��tID���I�k�ɶ�( ���:0.1��)
g_Magic.EngryWeb.ContinuousActID = 851477;-- ��q������I�kID�A�N���q�����~�[�P�����ؼд��ܤw�Q��w�� Buff
g_Magic.EngryWeb.ContinuousCastTickTime = 5;-- ��q������I�k�ɪ����j�ɶ�( ���:0.1�� )
g_Magic.EngryWeb.CD = 6;	-- �N�o�ɶ�( ���:1�� )
g_Magic.EngryWeb.Count = 10;	-- �C���I��ɪ��ƶq
g_Magic.EngryWeb.TickTime = 0;	-- �C�ӯ�q�������j�ɶ�( ���:0.1�� )
g_Magic.EngryWeb.ReadyTime = 5;	-- ��q���b���ͫ�A�}�l�@�Ϋe���ǳƮɶ��A�קK�@�}�l�N�缾�a�y���ĪG( ���:0.1�� )
g_Magic.EngryWeb.MiniRange = 30;	-- ��q�����̤p���Įg�{
g_Magic.EngryWeb.MaxRange = 120;	-- ��q�����̤j���Įg�{

-- ��q��
g_Magic.EnergizedCannonShot = {};
g_Magic.EnergizedCannonShot.AttackID = 851478;	-- �ˮ`ID
g_Magic.EnergizedCannonShot.ActCastTime = 20;	-- �I�k��tID���I�k�ɶ�( ���:0.1��)

------------------
local g_BuffID = {};	-- �򥻪k�N�M��
g_BuffID.UnRecoverHp = 502707;	-- ����۰ʦ^��A�קK�������Ī�����ֳt�^��C
g_BuffID.MistImprint = 625234;	-- �g�ϦL�O
g_BuffID.MumuInvincible = 626313;	-- �Q���i�i���W���L��Buff ( �S��A
g_BuffID.BankaInvincible = 625231;	-- �Z�˨��d���W���L��Buff ( �S��B
g_BuffID.Driving = 625242;	-- �N��Q���i�i�r�p�Z�˨��d��
g_BuffID.QuicksandBombWarning = 507881;	-- �y�F�u�wĵ�ĪG
g_BuffID.Fury = 625217;	-- �g��
g_BuffID.EnergyMark = 625238;	-- ��q�аO

local g_Combination = {};	-- �O���X�骬�A�ATrue ���X�餤�Afalse �����X��
local g_CombinationSetHpPercent = 0.1;	-- �Q���i�i�C��� _ %�ͩR��P�Z�˨��d�X�� ( ��� 0.01 = 1% )
local g_CombinationCount = {};	-- �Q���i�i�ܨ�������
local g_CombinationActOver = {};	-- �X���t�O�_�w����

local g_HateList = {};	-- �����
local g_LeaveFightTime = 6;	-- 6��W�h�A�����԰����ɶ�

local g_Mumu = {};	-- �Q���i�i
g_Mumu.NpcID = {};	-- ����ID
g_Mumu.NpcID[951] = 106978;
g_Mumu.NpcID[166] = 108432;	-- �x���ƥ�
g_Mumu.NpcID[167] = 108634;	-- ���q�ƥ�
g_Mumu.NpcID[168] = 108644;	-- ²��ƥ�

local g_Banka = {};	-- �Z�˨��d
g_Banka.FollowRange = 750;	-- ��Ʈw�����l�v�Z��
g_Banka.NpcID = {};	-- ����ID
g_Banka.NpcID[951] = 106979;
g_Banka.NpcID[166] = 108433;	-- �x���ƥ�
g_Banka.NpcID[167] = 108635;	-- ���q�ƥ�
g_Banka.NpcID[168] = 108645;	-- ²��ƥ�

local g_CtrlObj = {};	-- ������
g_CtrlObj.NpcID = 124311;	-- ����ID
g_CtrlObj.ResetCounter = {};	-- 	-- �C���X��}�l�P�Ѵ��X��ɡA�ݭn���m�p�ƾ��A�ޯ�I�񪺮ɾ��~�|�ǽT

local g_FuryTime = {};	-- �g�ɮɶ�( ���:1�� )
g_FuryTime[951] = 60;
g_FuryTime[166] = 480;
g_FuryTime[167] = 360;
g_FuryTime[168] = nil;	-- ���g��

local g_Door = {};
g_Door.FrontDoor = {};	-- �e��
g_Door.FrontDoor.NpcID = 108510;	-- ����ID
--g_Door.FrontDoor.Pos = { X = -135, Y = -257.2, Z = -400.5, Dir = 270 };	-- Zone 951 ���հϮy��
g_Door.FrontDoor.Pos = { X = 818, Y = 3156, Z = -1793, Dir = 270 };	-- �y��

g_Door.RearDoor = {};	-- ���
g_Door.RearDoor.NpcID = 108510;	-- ����ID
--g_Door.RearDoor.Pos = { X = -304, Y = -257.2, Z = -409.2, Dir = 90 };	-- Zone 951 ���հϮy��
g_Door.RearDoor.Pos = { X = 405, Y = 3156, Z = -1497, Dir = 90 };	-- �y��

local function CompDis( A, B )	-- �������A�Ѫ�ܻ��̧ǱƧǡA���Ѧ��s���� Script �P�_�Z����

	if A.Dis < B.Dis then
		return true;
	end
end

local function CompHatePoint( A, B )	-- ��Ӥ����I�ơA�Ѱ��ܧC�̧ǱƧǡA���Ѧ��s���� Script �P�_�����

	if A.HatePoint > B.HatePoint then
		return true;
	end
end

local function GetHateList( ObjID, Haters )	-- ���ѦҪ��󪺤����A��z Guid�B�Z���B�����I�ƫ�^�� Table�A���Ѧ��s���� Script �P�_��T��

	local HateList = {};
	for i = 0, Haters-1 do	-- ����������ؼ�
		local Targets = {};
		local Player = HateListInfo( ObjID, i, EM_HateListInfoType_GItemID );
		if ReadRoleValue( Player, EM_RoleValue_Voc ) ~= 0 then	-- �DGM
			Targets.Guid = Player;
			Targets.Dis = GetDistance( ObjID, Player );
			Targets.HatePoint = HateListInfo( ObjID, i, EM_HateListInfoType_HatePoint );
		--	DebugMsg( 0, Room, Getname( Targets.Guid )..", Dis = "..Targets.Dis..", HatePoint = "..Targets.HatePoint );
			table.insert( HateList, Targets );
		end
	end
	return HateList;
end

function Instance_Z30_Boss1_Combination()	-- �X��}�l

	local Mumu = OwnerID();	-- �Q���i�i
	local Room = ReadRoleValue( Mumu, EM_RoleValue_RoomID );
	local Banka = g_Banka[Room];	-- �Z�˨��d
	local CtrlObj = g_CtrlObj[Room];	-- ������
	g_CombinationCount[Room] = g_CombinationCount[Room] + 1;

	if not g_Combination[Room] then
		DebugMsg( 0, 0, "�X��}�l, Combination = "..tostring(g_Combination[Room])..", CombinationCount = "..g_CombinationCount[Room] );
		g_Combination[Room] = true;	-- �X��}�l
		g_CombinationActOver[Room] = false;	-- �ŧi�X���t�}�l
		CallPlot( Mumu, "Instance_Z30_Boss1_Combination_2", Mumu, Banka, CtrlObj, Room )
	end
end

function Instance_Z30_Boss1_Combination_2( Mumu, Banka, CtrlObj, Room )

	local HateList = GetHateList( Mumu, g_HateList[Room] );
	DebugMsg( 0, 0, "�X��}�l��i�i������H�� = "..tostring(#HateList) );
	local Caster = {};

	table.sort( HateList, CompHatePoint );	-- �N�Q���i�i����������a�̷Ӥ���Ѱ��ܧC�Ƨ�
	SetAttack( Banka, HateList[1].Guid );	-- �I�s���d���������1���ؼ�

	ScriptMessage( Mumu, -1, 3, g_Msg.MumuCombineBanka, 0 );
	StopMove( Mumu, false );	-- ����Q���i�i����
	StopMove( Banka, false );	-- ����Z�˨��d����
	SetModeEx( Banka, EM_SetModeType_Move, false );	-- �����Z�˨��d�����ʡA���X�鶶�Q���
	SetModeEx( Mumu, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( Mumu, EM_SetModeType_Strikback, false );	-- ����
	SetModeEx( Mumu, EM_SetModeType_ShowRoleHead, false );	-- �Y�ۮ�
	SetModeEx( Mumu, EM_SetModeType_Mark, false );	-- �аO

	LockHP( Mumu, -100, "" );	-- �N Boss ����q��w�Ѱ�
	AddBuff( Mumu, g_BuffID.MumuInvincible, 0, -1 );	-- �����Q���i�i�L��

	WriteRoleValue( Mumu, EM_RoleValue_IsWalk, 0 );	-- �]�B
	SetDefIdleMotion( Mumu, ruFUSION_MIME_RUN_FORWARD );	-- �N�ʧ@�ܧ󬰶]�B��
	local BankaPos = Vector_GetRolePos( Banka );
	MoveDirect( Mumu, BankaPos.X, BankaPos.Y, BankaPos.Z );
	DebugMsg( 0, 0, "�Q���i�i�P�Z�˨��d���Z����"..(Vector_GetRolePos(Mumu)-BankaPos):Len() );
	SetStopAttack( Mumu );	-- ��������B���}�԰��òM�Ť���
	Sleep(5);	-- ��t�ɶ�
	Sleep(DelayTime);	-- ��t�ɶ�
	SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_UP );	-- �N�ʧ@�ܧ󬰶}�l���D
	Sleep(4);	-- ��t�ɶ�
	SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_LOOP );	-- �N�ʧ@�ܧ󬰸��D��
	Sleep(4);	-- ��t�ɶ�
--	BankaPos = Vector_GetRolePos( Banka );	-- �����@���Z�˨��d��m
	local BankaDir = ReadRoleValue( Banka, EM_RoleValue_Dir );
	local VecDir = Vector_DirToVector( BankaDir + 90 );
	local TransferPos = BankaPos + VecDir * 15	-- �N�Q���i�i�ǰe�ܪZ�˨��d���V���e���m
	SetPos( Mumu, TransferPos.X, TransferPos.Y+50, TransferPos.Z, BankaDir-180 );
	SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_DOWN );	-- �N�ʧ@�ܧ󬰸��D���U
	Sleep(4);	-- ��t�ɶ�
	SetDefIdleMotion( Mumu, ruFUSION_MIME_IDLE_STAND );	-- �N�ʧ@�ܧ󬰯���
	g_CtrlObj.ResetCounter[Room] = true;	-- ���m�p�ƾ�

	SetModeEx( Mumu, EM_SetModeType_Show, false );	-- ���
	SetModeEx( Mumu, EM_SetModeType_Move, false );	-- ����
	SetModeEx( Banka, EM_SetModeType_Move, true );	-- ���s�}�ҪZ�˨��d������
	SetModeEx( Mumu, EM_SetModeType_Gravity, false );	-- �������O
	AddBuff( Banka, g_BuffID.Driving, 0, -1 );	-- �Q���i�i�r�p�Z�˨��d��
	g_CombinationActOver[Room] = true;	-- �ŧi�X���t����
	Sleep(4);	-- ��t�ɶ�
	SetPos( Mumu, TransferPos.X, TransferPos.Y+200, TransferPos.Z, 0 );	-- �N�Q���i�i����m�԰��A�קKAE�k�N����Ӧ�m�ɸ��X�K�̴��ܪ����D
end

function Instance_Z30_Boss1_Detach( Banka, Mumu, Room )	-- �Ѱ��X��

	-- �Q���i�i�P�Z�˨��d�����A�Ѱ��X��
	local BankaPos = Vector_GetRolePos( Banka );
	local BankaDir = ReadRoleValue( Banka, EM_RoleValue_Dir );
	ScriptMessage( Mumu, -1, 3, g_Msg.MumuDetachBanka, 0 );
	SetPos( Mumu, BankaPos.X, BankaPos.Y, BankaPos.Z, BankaDir );

	CancelBuff_NoEvent( Mumu, g_BuffID.MumuInvincible );
	CancelBuff_NoEvent( Banka, g_BuffID.Driving );

	SetModeEx( Mumu, EM_SetModeType_Gravity, true );	-- ���O
	SetModeEx( Mumu, EM_SetModeType_ShowRoleHead, true );	-- �Y�ۮ�
	SetModeEx( Mumu, EM_SetModeType_Show, true );	-- ���
	SetModeEx( Mumu, EM_SetModeType_Move, true );	-- ����
	SetModeEx( Mumu, EM_SetModeType_Searchenemy, true );	-- ����
	SetModeEx( Mumu, EM_SetModeType_Mark, true );	-- �аO
	SetModeEx( Mumu, EM_SetModeType_Strikback, true );	-- ����
--	SetModeEx( Mumu, EM_SetModeType_Fight, true );	-- ���
	g_Combination[Room] = false;	-- �Ѱ��X��
end

function Instance_Z30_Mumu_Init()	-- �Q���i�i ���󲣥ͼ@��

	local Mumu = OwnerID();
	local Zone = ReadRoleValue( Mumu, EM_RoleValue_ZoneID );

	if Zone ~= 951 then	-- �קK����հϴ��ծɳ����A�P�ϼ@�����_
		Cl_Resist_HackersBossNum( Mumu );	-- ���b�Ⱦ��� ���󪫥󲣥�
	end

	local Room = ReadRoleValue( Mumu, EM_RoleValue_RoomID );
	local MumuPos = Vector_GetRolePos(Mumu);
	local MumuDir = ReadRoleValue( Mumu, EM_RoleValue_Dir );
	local VecDir = Vector_DirToVector( MumuDir + 90 + 180 );
	local BankaPos = MumuPos + VecDir * 100;	-- ���d��� Mumu ����� 100 ����m
	local Banka = CreateObj( g_Banka.NpcID[Zone], BankaPos.X, BankaPos.Y, BankaPos.Z, MumuDir, 1 );
	AddToPartition( Banka, Room );
	CallPlot( Banka, "Instance_Z30_Banka_Init", Banka, Room, Zone );	-- ���d���󲣥ͼ@��
--	DebugMsg( 0, 0, "Room = "..Room..", Zone = "..Zone );

	AddBuff( Mumu, g_BuffID.UnRecoverHp, 0, -1 );

	if g_Mumu[Room] and CheckID( g_Mumu[Room] ) then	-- ���b�A��l�ƧQ���i�i
		DelObj( g_Mumu[Room] );
		DebugMsg( 0, 0, "�R���¦��Q���i�i" );
	end

	if g_Banka[Room] and CheckID( g_Banka[Room] ) then	-- ���b�A��l�ƪZ�˨��d
		DelObj( g_Banka[Room] );
		DebugMsg( 0, 0, "�R���¦��Z�˨��d" );
	end

	-- ������l��
	g_HateList[Room] = {};	-- �����

	-- �X�骬�A��l��
	g_Combination[Room] = false;	-- �ܨ����A
	g_CombinationCount[Room] = 0;	-- �ܨ�����

	-- �ŧi�Q���i�i�P�Z�˨��d�A��K��Lfunction�ϥ�
	g_Mumu[Room] = Mumu;
	g_Banka[Room] = Banka;

	if g_CtrlObj[Room] and CheckID( g_CtrlObj[Room] ) then	-- ���b�A��l�Ƥ�����
		DelObj( g_CtrlObj[Room]) ;
		DebugMsg( 0, 0, "�R���¦�������" );
	end
	local CtrlObj = CreateObj( g_CtrlObj.NpcID, MumuPos.X, MumuPos.Y, MumuPos.Z, MumuDir, 1 );	-- �إߦ��ϰ쪺������
	AddToPartition( CtrlObj, Room );
	g_CtrlObj[Room] = CtrlObj;
	SetModeEx( CtrlObj, EM_SetModeType_Show, false );	-- ���
	SetModeEx( CtrlObj, EM_SetModeType_Mark, false );	-- �аO
	SetModeEx( CtrlObj, EM_SetModeType_Move, false );	-- ����
	SetModeEx( CtrlObj, EM_SetModeType_HideName, true );	-- �W��
	DebugMsg( 0, 0, "�إߤ�����" );

	-- �إ߫e��
	if g_Door.FrontDoor[Room] and CheckID( g_Door.FrontDoor[Room] ) then	-- ���b
		DelObj( g_Door.FrontDoor[Room] );
		DebugMsg( 0, 0, "�R���¦��e��" );
	end
	local FrontDoor = CreateObj( g_Door.FrontDoor.NpcID, g_Door.FrontDoor.Pos.X, g_Door.FrontDoor.Pos.Y, g_Door.FrontDoor.Pos.Z, g_Door.FrontDoor.Pos.Dir, 1 );
	SetModeEx( FrontDoor, EM_SetModeType_Gravity, false );	-- ���O
	SetModeEx( FrontDoor, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( FrontDoor, EM_SetModeType_Strikback, false );	-- ����
	SetModeEx( FrontDoor, EM_SetModeType_Fight, false );	-- ���
	SetModeEx( FrontDoor, EM_SetModeType_Move, false );	-- ����
	SetModeEx( FrontDoor, EM_SetModeType_Obstruct, false );	-- ����
	SetModeEx( FrontDoor, EM_SetModeType_HideName, true );	-- �W��
	SetModeEx( FrontDoor, EM_SetModeType_Mark, false );	-- �аO
	SetModeEx( FrontDoor, EM_SetModeType_Show, false );	-- ���
	AddToPartition( FrontDoor, Room );
	g_Door.FrontDoor[Room] = FrontDoor;
	DebugMsg( 0, 0, "�إ߫e��" );

	-- �إ߫��
	if g_Door.RearDoor[Room] and CheckID( g_Door.RearDoor[Room] ) then	-- ���b
		DelObj( g_Door.RearDoor[Room] );
		DebugMsg( 0, 0, "�R���¦����" );
	end
	local RearDoor = CreateObj( g_Door.RearDoor.NpcID, g_Door.RearDoor.Pos.X, g_Door.RearDoor.Pos.Y, g_Door.RearDoor.Pos.Z, g_Door.RearDoor.Pos.Dir, 1 );
	SetModeEx( RearDoor, EM_SetModeType_Gravity, false );	-- ���O
	SetModeEx( RearDoor, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( RearDoor, EM_SetModeType_Strikback, false );	-- ����
	SetModeEx( RearDoor, EM_SetModeType_Fight, false );	-- ���
	SetModeEx( RearDoor, EM_SetModeType_Move, false );	-- ����
	SetModeEx( RearDoor, EM_SetModeType_Obstruct, true );	-- ����
	SetModeEx( RearDoor, EM_SetModeType_HideName, true );	-- �W��
	SetModeEx( RearDoor, EM_SetModeType_Mark, false );	-- �аO
	AddToPartition( RearDoor, Room );
	g_Door.RearDoor[Room] = RearDoor;
	DebugMsg( 0, 0, "�إ߫��" );
end

function Instance_Z30_Banka_Init( Banka, Room, Zone )	-- �Z�˨��d ���󲣥ͼ@��

	AddBuff( Banka, g_BuffID.UnRecoverHp, 0, -1 );
	AddBuff( Banka, g_BuffID.BankaInvincible, 0, -1 );	-- �����Z�˨��d�L��
end

function Instance_Z30_Mumu_LeaveFight()	-- �Q���i�i ���}�԰�

	local Mumu = OwnerID();
	DebugMsg( 0, 0, "�Q���i�i�����԰�" );
end

function Instance_Z30_Mumu_OnDead()	-- �Q���i�i ���`�@��
	
	local Mumu = OwnerID();
	local Zone = ReadRoleValue( Mumu, EM_RoleValue_ZoneID );

	if Zone ~= 951 then	-- �קK����հϴ��ծɳ����A�P�ϼ@�����_
		Cl_Resist_HackersBossDead( Mumu );	-- ���b�Ⱦ��� ���󪫥󦺤`
	end

	local Room = ReadRoleValue( Mumu, EM_RoleValue_RoomID );
	ScriptMessage( Mumu, -1, 3, g_Msg.MumuIsDead, 0 );
	SetStopAttack( g_Banka[Room] );	-- ��������B���}�԰��òM�Ť���
	KillID( g_Banka[Room], g_Banka[Room] );

	PlayMotion( g_Door.FrontDoor[Room], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN );	-- �}�ҫe��
	SetDefIdleMotion( g_Door.FrontDoor[Room], ruFUSION_MIME_ACTIVATE_BEGIN );
	SetIdleMotion( g_Door.FrontDoor[Room], ruFUSION_MIME_ACTIVATE_LOOP );

	PlayMotion( g_Door.RearDoor[Room], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN );	-- �}�ҫ��
	SetDefIdleMotion( g_Door.RearDoor[Room], ruFUSION_MIME_ACTIVATE_BEGIN );
	SetIdleMotion( g_Door.RearDoor[Room], ruFUSION_MIME_ACTIVATE_LOOP );

	CallPlot( g_CtrlObj[Room], "Instance_Z30_Mumu_OnDead2", Room );
end

function Instance_Z30_Mumu_OnDead2( Room )

	Sleep(70);	-- ����}�����ɶ�
	DelObj( g_Door.FrontDoor[Room] );	-- �R���e��
	DelObj( g_Door.RearDoor[Room] );	-- �R�����
	DelObj( g_CtrlObj[Room] );	-- �R���������ۤv
end

function Instance_Z30_Mumu_BeginFight()	-- �Q���i�i �԰��}�l

	local Mumu = OwnerID();
	local Zone = ReadRoleValue( Mumu, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Mumu, EM_RoleValue_RoomID );
--	Yell( g_Mumu[Room], "Mumu", 3 );	-- �Q���i�i
--	Yell( g_Banka[Room], "Banka", 3 );	-- ���d

	if ReadRoleValue( g_CtrlObj[Room], EM_RoleValue_PID ) == 0 then	-- �קK Already Running �����D

		local Target = ReadRoleValue( g_Mumu[Room], EM_RoleValue_AttackTargetID );
		SetAttack( g_Banka[Room], Target );	-- �I�s���d�����Q���i�i�������ؼСASetAttack�b���� 6.5.0 �e�ȳB�z�����A����ɤ��|�뤳�뵹�ؼ�
		SysCastSpellLv( Target, g_Banka[Room], g_Magic.HateMaker, 100 );	-- �w�뤳��ȵ����d

		local PartyNum = GetPartyID( Target, -1 );	-- �N�Q���i�i�����ؼЪ�������A�]�P�B���Z�˨��d�A�קK�Z�˨��d�]�L�Ħӥu��w 1 �W�ؼСA��ӥؼЦ��`��|���}�԰������D�C
		if PartyNum > 0 then
			for Index = 1, PartyNum do
				if Index == 1 then
					DebugMsg( 0, 0, "����H�� = "..tostring(PartyNum) );
				end
				local Partner = GetPartyID( Target, Index );	-- ������P���d���Z�� < �l�v�Z���B�b�s����
				if Partner ~= Target and GetDistance( g_Banka[Room], Partner ) < g_Banka.FollowRange and CheckID( Partner ) and ReadRoleValue( Partner, EM_RoleValue_IsDead ) == 0 then
				--	Yell( Partner, "Hit Banka", 3 );
					SysCastSpellLv( Partner, g_Banka[Room], g_Magic.HateMaker, 100 );
				end
			end
		end

		-- �إ߫e��
		SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Obstruct, true );	-- ����
		SetModeEx( g_Door.FrontDoor[Room], EM_SetModeType_Show, true );	-- ���
		DebugMsg( 0, 0, "�Q���i�i�i�J�԰��A�����e��" );

		ScriptMessage( g_Mumu[Room], -1, 3, g_Msg.BeginFight, 0 );
		CallPlot( g_CtrlObj[Room], "Instance_Z30_Boss1_BeginFight", g_CtrlObj[Room], g_Mumu[Room], g_Banka[Room], Zone, Room );
		WriteRoleValue( g_CtrlObj[Room], EM_RoleValue_PID, 1 );
	end
end

function Instance_Z30_Boss1_CheckFury( CtrlObj, Mumu, Banka, Zone, Room )	-- �T�{�Q���i�i�O�_�g��

	local FuryCounter = 0;	-- �g�ɭp�ƾ�
	while ReadRoleValue( Mumu, EM_RoleValue_IsDead ) == 0 do	-- ��i�i�S�����`
		if FuryCounter == g_FuryTime[Zone] then
			ScriptMessage( Mumu, -1, 3, g_Msg.BeginFury, 0 );
			AddBuff( Mumu, g_BuffID.Fury, 0, -1 );
			AddBuff( Banka, g_BuffID.Fury, 0, -1 );
			break;
		end
		DebugMsg( 0, 0, "�g�ɮɶ� = "..FuryCounter );
		Sleep(10);
		if not g_Combination[Room] then	-- ���X��ɡA�~�B�z�p�ƾ�
			FuryCounter = FuryCounter + 1;
		end
	end
end

function Instance_Z30_Boss1_BeginFight( CtrlObj, Mumu, Banka, Zone, Room )	-- �Ѥ���������԰�

	local CombinationSetHpPercent = g_CombinationSetHpPercent;	-- �ܨ�����
	local MumuHpRatio = 1;	-- Mumu ��q��v
	local Counter = 0;	-- �p�ƾ��A�Ω�έp�԰��ɶ�
	local LeaveFightTime = 0;	-- ���}�԰��ɶ�
	local HateSourcer = false;	-- ����ؼ�

	if g_FuryTime[Zone] then	-- �B�z�g��
		CallPlot( CtrlObj, "Instance_Z30_Boss1_CheckFury", CtrlObj, Mumu, Banka, Zone, Room )	-- �T�{�Q���i�i�O�_�g��
	end

	while LeaveFightTime < g_LeaveFightTime and ReadRoleValue( Mumu, EM_RoleValue_IsDead ) == 0 do	-- ��i�i�S�����`�A�B�������԰���

		--  �p�ƾ��P�_
		if g_CtrlObj.ResetCounter[Room] then	-- �C���X�駹���B�����X��ɻݭn���m�p�ƾ��A�H�ŦX�ޯ��ڪ��I��ɶ�
			Counter = 0;
			g_CtrlObj.ResetCounter[Room] = false;
		end
		Counter = Counter + 1;

		local MumuHateList = HateListCount( Mumu );	-- ���Q���i�i�������
		local BankaHateList = HateListCount( Banka );	-- ���Z�˨��d�������
		DebugMsg( 0, 0, "�Q���i�i����ƶq : "..MumuHateList );
		DebugMsg( 0, 0, "�Z�˨��d����ƶq : "..BankaHateList );

		-- �����԰��P�_
		if MumuHateList == 0 and BankaHateList == 0 then	-- ��Q���i�i�P�Z�˨��d��������� 0 �H��
			LeaveFightTime = LeaveFightTime + 1;
			DebugMsg( 0, 0, "LeaveFightTime = "..LeaveFightTime );
		else
			LeaveFightTime = 0;	-- ��_�w�]�]�w
		end

		-- �����ӷ�
		if not g_Combination[Room] then	-- �D�X��ɡA�H�Q���i�i��������ѷ�
			g_HateList[Room] = MumuHateList;	-- ���Q���i�i�������
			if HateSourcer ~= Mumu then
				HateSourcer = Mumu;
				DebugMsg( 0, 0, "�ѷӧQ���i�i�������" );
			end
		else	-- �X��ɡA�H�Z�˨��d��������ѷ�
			g_HateList[Room] = BankaHateList;	-- ���Z�˨��d�������
			if HateSourcer ~= Banka then
				HateSourcer = Banka;
				DebugMsg( 0, 0, "�ѷӪZ�˨��d�������" );
			end
		end

		-- �X��P�_
		local LockHpRatio = 1 - CombinationSetHpPercent*(g_CombinationCount[Room]+1);
	--	DebugMsg( 0, 0, "MumuHpRatio = "..MumuHpRatio..", LockHpRatio = "..LockHpRatio );
		if MumuHpRatio ~= LockHpRatio and LockHpRatio ~= 0 then	-- �C�� Mumu ��q�ŦX�ܨ�����A�B��w�ͩR������ 0 ��
			MumuHpRatio = LockHpRatio
		--	DebugMsg( 0, 0, "LockHpRatio = "..LockHpRatio );
			LockHP( Mumu, ReadRoleValue( Mumu, EM_RoleValue_MaxHP)*LockHpRatio, "Instance_Z30_Boss1_Combination" );	-- �N Boss ����q���A�קK�Q��������p�o�͡A�P�ϼ@�����_
		end

		-- �I��ޯ� - �Q���i�i
		if Counter%g_Magic.ChainNet.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- ���줧��
			DebugMsg( 0, 0, Counter..", �Q���i�i - ���줧��, ����ؼмƶq = "..g_HateList[Room] );
			CastSpellLv( Mumu, Mumu, g_Magic.ChainNet.ActID, 0 );
			Sleep(10);	-- �I�k��t������ɶ�
			local HateList = GetHateList( Mumu, g_HateList[Room] );
			table.sort( HateList, CompDis );	-- �N����������a�̷ӶZ���Ѫ�ܻ��Ƨ�
			for i = 1, g_Magic.ChainNet.Targets do
				if #HateList > 0 then
					local Targets = table.remove( HateList, #HateList );	-- ������̻����ؼвM�� ( �]�A Guid, Dis, HatePoint )
				--	DebugMsg( 0, Room, Counter..", �Q���i�i - ���줧�� Lock Target = "..Getname( Targets.Guid )..", �ؼлP�i�i�Z�� = "..Targets.Dis );
					SysCastSpellLv( Mumu, Targets.Guid, g_Magic.ChainNet.CastID, 0 );
				end
			end
		elseif Counter%g_Magic.Rejection.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- �g�k���h
			DebugMsg( 0, 0, Counter..", �Q���i�i - �g�k���h, ����ؼмƶq = "..g_HateList[Room] );
			local HateList = GetHateList( Mumu, g_HateList[Room] );
			table.sort( HateList, CompHatePoint );	-- �N����������a�̷Ӥ���Ѱ��ܧC�Ƨ�
			local Target = nil
			for i = 1, #HateList do
				if GetDistance( Mumu, HateList[i].Guid ) <= g_Magic.Rejection.Range then
					Target = HateList[i].Guid;
				--	DebugMsg( 0, Room, Counter..", �Q���i�i - �g�k���h Lock Target = "..Getname( HateList[i].Guid )..", HatePoint = "..HateList[i].HatePoint );
					break;
				end
			end
			if Target then	-- �d�򤺦��ŦX���󪺥ؼЮ�
				local MumuPos = Vector_GetRolePos( Mumu );
				local MumuDir = ReadRoleValue( Mumu, EM_RoleValue_Dir );
				local VecDir = Vector_DirToVector( MumuDir+90 );
				CastSpellLv( Mumu, Target, g_Magic.Rejection.ActID, 0 );	-- �I�k��t
				Sleep(10);	-- �I�k��t������ɶ�
				for i = 1, g_Magic.Rejection.CastCount do
					local TargetPos = MumuPos + VecDir *( i*g_Magic.Rejection.Spacing );
					local CastObj = Hao_CreateSpellObjbyPos( TargetPos );	-- �b�ؼЦ�m�إ߬I�k����
					CallPlot( CastObj, "MagicCol_851450", CastObj, Mumu, g_Magic.Rejection.CastDelayTime*i );
				end
			end
		elseif Counter%g_Magic.DeepStrike.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- �Z�˨I��
			DebugMsg( 0, 0, Counter..", �Q���i�i - �Z�˨I��, ����ؼмƶq = "..g_HateList[Room] );
			CastSpellLv( Mumu, Mumu, g_Magic.DeepStrike.RunLuaID, 0 );
		elseif Counter%g_Magic.ChainJump.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- ������D
			local HateList = GetHateList( Mumu, g_HateList[Room] );
			DebugMsg( 0, 0, Counter..", �Q���i�i - ������D, ����ؼмƶq = "..#HateList );
			table.sort( HateList, CompHatePoint );	-- �N����������a�̷Ӥ���Ѱ��ܧC�Ƨ�
			local Target = HateList[1].Guid;	-- ������� 1 ���몺���a
			if HateList[2] and GetDistance( Mumu, HateList[2].Guid ) < 200 then
				Target = HateList[2].Guid;	-- ������� 2 ���몺���a
			end
			SetDefIdleMotion( Mumu, ruFUSION_MIME_RUN_FORWARD );	-- �N�ʧ@�ܧ󬰲��ʤ�
			SysCastSpellLv( Target, Mumu, g_Magic.ChainJump.TauntID, 0 );	-- �ѥؼа���D�]�A�è�Boss��w�����ؼ�(���]����ȧ��ܥؼ�)
			SetAttack( Mumu, Target );	-- ���w�����ؼ�
			local TargetPos = Vector_GetRolePos( Target );
			MoveDirect( Mumu, TargetPos.X, TargetPos.Y, TargetPos.Z );
			Sleep(4);
		--	SysCastSpellLv( Mumu, Target, g_Magic.ChainJump.CastID, 0 );	-- �I�k��tID
			if not g_Combination[Room] then	-- �b�C�Ӧ� Sleep ���ɶ��I���n�ˬd�Q���i�i�O�_�w�ŦX�X�����A�O���ܫh������t�P�ˮ`
				CastSpellLv( Mumu, Target, g_Magic.ChainJump.ActID, 0 );	-- �I�k��tID
				Sleep(4);	-- �I�k��t�ɶ�
				SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_UP );	-- �N�ʧ@�ܧ󬰶}�l���D
			end
			if not g_Combination[Room] then
				Sleep(4);	-- �}�l���D����t�ɶ�
				SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_LOOP );	-- �N�ʧ@�ܧ󬰸��D��
			end
			if not g_Combination[Room] then
				Sleep(4);	-- ������t�ɶ�
				TargetPos = Vector_GetRolePos( Target );	-- �����s�����a��m
				local TargetDir = ReadRoleValue( Target, EM_RoleValue_Dir );
				local VecDir = Vector_DirToVector( TargetDir + 90 );
				local TransferPos = TargetPos + VecDir * g_Magic.ChainJump.TransportDis;	-- �ǰe�ܥؼЭ��V�e�� g_Magic.ChainJump.TransportDis �Z������m
				SetPos( Mumu, TransferPos.X, TransferPos.Y, TransferPos.Z, TargetDir-180 );
				SetDefIdleMotion( Mumu, ruFUSION_MIME_JUMP_DOWN );	-- �N�ʧ@�ܧ󬰸��D���U
			end

			if not g_Combination[Room] then
				Sleep(4);	-- ���D���U����t�ɶ�
				SetDefIdleMotion( Mumu, ruFUSION_MIME_IDLE_STAND );	-- �N�ʧ@�ܧ󬰯���
				SysCastSpellLv( Target, Mumu, g_Magic.ChainJump.TauntID, 0 );	-- �ѥؼа���D�]�A�è�Boss��w�����ؼ�(���]����ȧ��ܥؼ�)�A���s��s�@���A���ؼгQ�T�w��w 5 ��
				SysCastSpellLv( Mumu, Target, g_Magic.ChainJump.AttackID, 0 );	-- ����ˮ`
			end
		end

		-- ���d
		if Counter%g_Magic.CombatFog.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- �Ԥ��g��
			DebugMsg( 0, 0, Counter..", �Z�˨��d - �Ԥ��g��, ����ؼмƶq = "..g_HateList[Room] );
			Instance_Z30_Banka_CombatFog( Banka, Mumu, Room );	-- �������W���@����q�аO���ؼ�

		elseif Counter%g_Magic.ThrowingBomb.CD == 0 and g_HateList[Room] ~= 0 and not g_Combination[Room] then	-- ��g�u
			local HateList = GetHateList( Mumu, g_HateList[Room] );
			DebugMsg( 0, 0, Counter..", �Z�˨��d - ��g�u, ����ؼмƶq = "..#HateList );
			if #HateList > 0 then
				local Target = table.remove( HateList, Math.Random(#HateList) );	-- ����� 1 �W�H���ؼ� ( �]�A Guid, Dis, HatePoint )
				CastSpellLv( Banka, Target.Guid, g_Magic.ThrowingBomb.ActID, 0 );	-- �I�kID
			end

		else	-- �R�O���d�����Q���i�i�̤������ؼ�
			local HateList = GetHateList( Mumu, g_HateList[Room] );
			table.sort( HateList, CompHatePoint );	-- �N����������a�̷Ӥ���Ѱ��ܧC�Ƨ�
			if #HateList > 0 then
				SetAttack( Banka, HateList[1].Guid );
			end
		end

		-- �Q���i�i&���d
		if Counter%g_Magic.GroundMissile.CD == 0 and g_HateList[Room] ~= 0 and g_Combination[Room] and g_CombinationActOver[Room] then	-- �a�Ծɼu
			DebugMsg( 0, 0, Counter..", �Z�˨��d �X�� - �a�Ծɼu, ����ؼмƶq = "..g_HateList[Room] );
			 Instance_Z30_Banka_GroundMissile( Banka, Mumu, Room );
		elseif Counter%g_Magic.EngryWeb.CD == 0 and g_HateList[Room] ~= 0 and g_Combination[Room] and g_CombinationActOver[Room] then	-- ��q��
			DebugMsg( 0, 0, Counter..", �Z�˨��d �X�� - ��q��, ����ؼмƶq = "..g_HateList[Room] );
			StopMove( Banka, false );
			SetModeEx( Banka, EM_SetModeType_Move, false );
			CastSpellLv( Banka, Banka, g_Magic.EngryWeb.ActID, 0 );
			Sleep( g_Magic.EngryWeb.ActCastTime );
			SetModeEx( Banka, EM_SetModeType_Move, true );
			Instance_Z30_Banka_EngryWeb( Banka, Room );
		elseif Counter%g_Magic.QuicksandBomb.CD == 0 and g_HateList[Room] ~= 0 and g_Combination[Room] and g_CombinationActOver[Room] then	-- �y�F�u
			DebugMsg( 0, 0, Counter..", �Z�˨��d �X�� - �y�F�u, ����ؼмƶq = "..g_HateList[Room] );
			Instance_Z30_Banka_QuicksandBomb( Banka, Mumu, Room );
		elseif g_HateList[Room] ~= 0 and g_Combination[Room] and g_CombinationActOver[Room] then	-- ��q��
			DebugMsg( 0, 0, Counter..", �Z�˨��d �X�� - ��q���ˬd, ����ؼмƶq = "..g_HateList[Room] );
			if Instance_Z30_Banka_EnergizedCannonShot( Banka, Mumu, Room ) then	-- ���o�g��q����
				Sleep(g_Magic.EnergizedCannonShot.ActCastTime);	-- �I�k�ɶ�
			else	-- �]���Q���i�i�w�����԰��A�G�C���d�Ŷ���(�S���I��ޯ�)�A�R�O���d��������̰���
				local HateList = GetHateList( Banka, g_HateList[Room] );
				table.sort( HateList, CompHatePoint );	-- �N����������a�̷Ӥ���Ѱ��ܧC�Ƨ�
				if #HateList > 0 then
					SetAttack( Banka, HateList[1].Guid );
				end
			end
		end
	--	DebugMsg( 0, 0, Counter..", �X�骬�A = "..tostring(g_Combination[Room]) );
		Sleep(10);
	end

	if ReadRoleValue( Mumu, EM_RoleValue_IsDead ) == 0 then	-- ��Q���i�i�s���ɭ��m
		PlayMotion( Mumu, ruFUSION_ACTORSTATE_BUFF_SP02 );
		ScriptMessage( Mumu, -1, 3, g_Msg.LeaveFight, 0 );
		CallPlot( g_CtrlObj[Room], "Instance_Z30_Boss1_Reset", g_CtrlObj[Room], Mumu, Banka, Room );
	end
end

function Instance_Z30_Boss1_Reset( CtrlObj, Mumu, Banka, Room )	-- �Ѥ��������歫�m

	DelObj( Mumu );
	DelObj( Banka );
	DelObj( g_Door.FrontDoor[Room] );	-- �R���e��

	Sleep(50);
	WriteRoleValue( CtrlObj, EM_RoleValue_PID, 0 );
	local CtrlObjPos = Vector_GetRolePos( CtrlObj );
	local CtrlObjDir = ReadRoleValue( CtrlObj, EM_RoleValue_Dir );
	local Zone = ReadRoleValue( CtrlObj, EM_RoleValue_ZoneID );
	local NewMumu = CreateObj( g_Mumu.NpcID[Zone], CtrlObjPos.X, CtrlObjPos.Y, CtrlObjPos.Z, CtrlObjDir, 1 );
	AddToPartition( NewMumu, Room );
	DebugMsg( 0, 0, "���اQ���i�i" )
end
---------- �Q���i�i ----------
function MagicBase_626311_Plot()	-- ���줧��

	local Mumu = OwnerID();
	local Target = TargetID();	-- Player
	SysCastSpellLv( Mumu, Target, g_Magic.ChainNet.AttackID, 0 );	-- �ˮ`

	if GetDistance( Mumu, Target ) > g_Magic.ChainNet.TransportDis then
		local MumuPos = Vector_GetRolePos( Mumu );
		local MumuDir = ReadRoleValue( Mumu, EM_RoleValue_Dir );
		local VecDir = Vector_DirToVector( MumuDir+90 );	-- ��e���V
		local TargetDir = ReadRoleValue( Target, EM_RoleValue_Dir );
		local TargetPos = MumuPos + VecDir * g_Magic.ChainNet.TransportDis;
		SetPos( Target, TargetPos.X, TargetPos.Y, TargetPos.Z, TargetDir );
	end
end
----
function MagicBase_625223_Check()	-- �g�k���h�A�ˬd

	local Mumu = OwnerID();	-- Boss
	local Target = TargetID();	-- �ؼ�
	if not CheckRelation( Mumu, Target, EM_CheckRelationType_Enemy ) then	-- �D�Ĺ磌�󤣰���ˮ`
		return false;
	end
	return true;
end

function MagicCol_851450( CastObj, Mumu, DelayTime )	-- �g�k���h�ˮ`

	Sleep( DelayTime );
--	DebugMsg( 0, 0, "SysTime = "..GetSystime(0)..", DelayTime = "..DelayTime..", Dis = "..( Vector_GetRolePos(Mumu) - Vector_GetRolePos(CastObj) ):Len() );
	SysCastSpellLv( Mumu, CastObj, g_Magic.Rejection.AttackID, 0 );	-- �ˮ`
end
----
function MagicBase_625224_Check()	-- �Z�˨I���@�l�[�ˮ`

	local Mumu = OwnerID();
	local Target = TargetID();
	local BonusDmgLv = Lua_Hao_Return_Buff_Lv( Target, g_BuffID.MistImprint );	-- �d�ߥؼШ��W�g�ϦL�O������
--	DebugMsg( 0, 0, "�g�ϦL�O���� = "..BonusDmgLv );
	if BonusDmgLv > -1 then
		SysCastSpellLv( Mumu, Target, g_Magic.DeepStrike.BonusAttackID, BonusDmgLv );
	end
end

---------- �Z�˨��d ----------
function MagicBase_626312_Plot()	-- ��g�u �����ɰ���ˮ`

	local Banka = OwnerID();
	local Target = TargetID();	-- ���a
	CallPlot( Banka, "MagicBase_626312_Plot2", Banka, Target );
end

function MagicBase_626312_Plot2( Banka, Target )

	Sleep(5);	-- ����ɶ��A�������
	SysCastSpellLv( Banka, Target, g_Magic.ThrowingBomb.AttackID, 0 );
end
----
function Instance_Z30_Banka_CombatFog( Banka, Mumu, Room )	-- �Ԥ��g��

	local CastObj = Hao_CreateSpellObj( Banka, 0, 10 );	-- �� Banka ��m���ͳz���I�k����A�ʱ������Ԥ��g�Ϫ����u( �ѦҪ���B�ѦҨ��סB�ͦs�ɶ�( ���:1�� ) )
 	CallPlot( CastObj, "Instance_Z30_Banka_CombatFog2", CastObj, Banka, Mumu );
end

function Instance_Z30_Banka_CombatFog2( CastObj, Banka, Mumu )

	local Room = ReadRoleValue( Banka, EM_RoleValue_RoomID );
	local ShootDir = g_Magic.CombatFog.ShootDir;
	local DelayTime = g_Magic.CombatFog.DelayTime;
--	DebugMsg( 0, 0, "RandomShootDir = "..RandomShootDir );

	g_Magic.CombatFog.HitUnits[Room] = {};	-- ���m�Ԥ��g�Ϫ��R�����A

	for Wave = 1, #ShootDir do
		-- �X�餤�B�Q���i�i���`�B���d���}�԰��B����ؼ� = 0 �ɴ��e�h�X
		if g_Combination[Room] or ReadRoleValue( Mumu, EM_RoleValue_IsDead ) == 1 or ReadRoleValue( Banka, EM_RoleValue_IsAttackMode ) == 0 or g_HateList[Room] == 0 then
			break;
		end

		local HateList = GetHateList( Mumu, g_HateList[Room] );	-- ����������ؼ�
		local Haters = {};
		for i = 1, #HateList do
			local Player = HateList[i].Guid;
			if ReadRoleValue( Player, EM_RoleValue_Voc ) ~= 0 then	-- �DGM
				table.insert( Haters, Player );
			end
		end

		local BankaPos = Vector_GetRolePos( Banka );
		local BankaDir = ReadRoleValue( Banka, EM_RoleValue_Dir );
		StopMove( Banka, false );
		CastSpellLv( Banka, Banka, g_Magic.CombatFog.ActID, 0 );

		g_Magic.CombatFog.HitUnits[Room][Wave] = {};	-- �C���o�g���u�ɡA���m���u�i�����R�����A

		local RandomShootDir = Math.Random(360);	-- �ۥѮg��

		for j = 1, #ShootDir[Wave] do
			local MissileDir = BankaDir+ShootDir[Wave][j];
			if Wave ~= 1 then
				MissileDir = MissileDir + RandomShootDir;
			end
			local VecDir = Vector_DirToVector( MissileDir+90 );	-- ������V�q�ARom �ϥΨ�����V�q�ɥ��� + 90 �פ~�|�����󨤫�
			local MissilePos = BankaPos + VecDir * g_Magic.CombatFog.Spacing;
			if MissileDir > 360 then MissileDir = MissileDir - 360 end;
		--	DebugMsg( 0, 0, "MissileDir = "..MissileDir );
			local Missile = CreateObj( g_Magic.CombatFog.NpcID, MissilePos.X, MissilePos.Y+10, MissilePos.Z, MissileDir, 1 );
			WriteRoleValue( Missile, EM_RoleValue_LiveTime, 6 );	-- �w�]�ͦs�ɶ� 6 ��
			MoveToFlagEnabled( Missile, false );	-- �������޼@��
			WriteRoleValue( Missile, EM_RoleValue_IsWalk, 0 );	-- �]�B
			SetModeEx( Missile, EM_SetModeType_ShowRoleHead, false );	-- �Y�ۮ�
			SetModeEx( Missile, EM_SetModeType_Mark, false );	-- �аO
			SetModeEx( Missile, EM_SetModeType_Gravity, false );	-- ���O
			SetModeEx( Missile, EM_SetModeType_Fight, false );	-- ���
			SetModeEx( Missile, EM_SetModeType_Searchenemy, false );	-- ����
			SetModeEx( Missile, EM_SetModeType_Strikback, false );	-- ����
			AddToPartition( Missile, Room );
			CallPlot( Missile, "Instance_Z30_Banka_CombatFog3", Missile, Banka, Room, MissileDir, Haters, Wave );
		--	DelayTime = DelayTime + g_Magic.CombatFog.TickTime;
		end
		Sleep( g_Magic.CombatFog.TickTime );
	end
	DelObj( CastObj );
end

function Instance_Z30_Banka_CombatFog3( Owner, Banka, Room, MissileDir, Haters, Wave )	-- �d��P�w�� Lua �i��A���ϥΪk�N���X�A�k�N���X�S��k�H����D�㪺�覡�]�w�A�]����]�w�e��

	-- �ޯ�]�w (��T�M���k�N���l )
	local OwnerPos = Vector_GetRolePos( Owner );
	local FlyTime = Math.Ceil( g_Magic.CombatFog.Dis / g_Magic.CombatFog.FlySpeed );	-- �ޯ�Ѱ_�I����ܲ��I���ɶ�(���:0.1��)
	Sleep(g_Magic.CombatFog.DelayTime);

	local BeginPos = OwnerPos;	-- �C�q�϶����_�I�y��
	local VecDir = Vector_DirToVector( MissileDir+90 );	-- ������V�q�A�p��ROM�����׮ɡA�n���� 90 �ר��~�|�ܬ����T�V�q�C
	local EndPos	-- �C�q�϶������I�y��
	local HitUnits = {};	-- �C�T���u�W�۪��R�����A�A�קK��@�ؼгQ���ƩR��

	while FlyTime > -1 do

		if not g_Magic.CombatFog.HitUnits[Room][Wave][FlyTime] then
			g_Magic.CombatFog.HitUnits[Room][Wave][FlyTime] = {};
		end

		EndPos = BeginPos + VecDir * g_Magic.CombatFog.FlySpeed;
		MoveDirect( Owner, EndPos.X, EndPos.Y, EndPos.Z );
		Sleep(1);
		for i = 1, #Haters do
			local Target = Haters[i];
			local TargetPos = Vector_GetRolePos( Target );
			--�ˬd�ؼЬO�_�b���w���B�e�����u�d�򤺡A�_�^��Nil�B�O���ܦ^�ǥؼлP�_�I���Z�� ( �_�I�y�СB���I�y�СB�e�סB���סB�ؼЮy��)
			local Status = Vector_CheckShootObj( BeginPos, EndPos, g_Magic.CombatFog.Width, g_Magic.CombatFog.Height, TargetPos );
		--	if Status then
			--	DebugMsg( 0, 0, "No. "..i.. ", Hit = "..tostring( Status ) );
		--	end
			-- ��R�����ߡA�B�����u�|���R���ؼХH�Ψ�L���u�b���ˬd�I�]�|���R����
			if Status and not HitUnits[Target] and not g_Magic.CombatFog.HitUnits[Room][Wave][FlyTime][Target] then
				HitUnits[Target] = true; 
				g_Magic.CombatFog.HitUnits[Room][Wave][FlyTime][Target] = true;	-- �Ƽƭ��u�b�P�ɶ������P�@�ؼЮɡA�u�|����@���ˮ`�A�קK���ƩR��
				SysCastSpellLv( Banka, Target, g_Magic.CombatFog.AttackID, 0 );
				DebugMsg( 0, 0, "�Z�˨��d - �Ԥ��g��, �ؼлP���u�Z�� = "..String.format( "%.1f", tostring( Status ) )..", �ؼлP�o�g�_�I�Z�� = "..String.format( "%.1f", (OwnerPos-TargetPos):Len() ) );
			end
		end
		BeginPos = EndPos;
		FlyTime = FlyTime - 1;
	end
	DelObj( Owner );
end

-------------- �Q���i�i�P�Z�˨��d�X�� --------------
function Instance_Z30_Banka_QuicksandBomb( Banka, Mumu, Room )	-- �y�F�u

	local HateList = GetHateList( Banka, g_HateList[Room] );	-- ����������ؼ�
	StopMove( Banka, false );
	SetModeEx( Banka, EM_SetModeType_Move, false );
	CastSpellLv( Banka, Banka, g_Magic.QuicksandBomb.ActID, 0 );	-- �I�k�S��
	Sleep(10);
	
	for i = 1, g_Magic.QuicksandBomb.Count do
		if not g_Combination[Room] then	-- �]�����ɶ��t�A�G�b�C���I��ɡA���n���ˬd�O�_�b�M�骬�A�A�קK�X��Ѱ��ɡA�Z�˨��d�̵M�b�I��y�F�u�����D
			break;
		end
	--	DebugMsg( 0, 0, "�y�F�u "..i..", ����ؼмƶq = "..#HateList );
		local Targets = HateList[ Math.random( #HateList ) ];
		local CastObj = Hao_CreateSpellObj( Targets.Guid, 0, g_Magic.QuicksandBomb.LiveTime );	-- �󤳫�� 1 �W�H���ؼЦ�m���ͳz���I�k����( �ѦҪ���B�ѦҨ��סB�ͦs�ɶ�( ���:1�� ) )
		Addbuff( CastObj, g_BuffID.QuicksandBombWarning, 0, -1 );	-- �wĵ�ĪG
		SysCastSpellLv( Banka, CastObj, g_Magic.QuicksandBomb.RunLuaID, 0 );	-- ����S�� ( �I�k�S�ĻP����S�Ĥ��i���X... �ʧ@�L�C�ɡA�k�N�|�o���X��...
		Sleep( g_Magic.QuicksandBomb.TickTime );
	end
	SetModeEx( Banka, EM_SetModeType_Move, true );
end

function MagicBase_626308_Plot()	-- �y�F�u �����S�Ī����

	local Banka = OwnerID();	-- Boss
	local Target = TargetID();	-- �S�Ī���
	local Room = ReadRoleValue( Banka, EM_RoleValue_RoomID );
	local FlySpeed = 200;	-- ROM ������S�Ī�����t�ײΤ@����t 200
	local Distance = GetDistance( Banka, Target );
	local DelayTime = Math.Ceil( (Distance/FlySpeed)*10 );	-- ��F�ت��a�e������ɶ�
--	DebugMsg( 0, 0, "DelayTime = "..DelayTime );

	if not g_Magic.QuicksandBomb.HitUnits[Room] then
		g_Magic.QuicksandBomb.HitUnits[Room] = {};
	--	DebugMsg( 0, Room, "Create Room" );
	end
	CallPlot( Target, "MagicBase_626308_Plot2", Target, Banka, Room, DelayTime );
end

function MagicBase_626308_Plot2( Owner, Banka, Room, DelayTime )	-- �ѦU�S�Ī������A�קK Already running �����D

	Sleep(DelayTime);
	CancelBuff_NoEvent( Owner, 507881 );	-- �R���wĵ�S��

	local HateList = GetHateList( Banka, g_HateList[Room] );	-- ����������ؼ�
	local Haters = {};
	for i = 1, #HateList do
		local Player = HateList[i].Guid;
		if ReadRoleValue( Player, EM_RoleValue_Voc ) ~= 0 then	-- �DGM
			table.insert( Haters, Player );
		end
	end

	while true do
		SysCastSpellLv( Owner, Owner, g_Magic.QuicksandBomb.ActID, 0 );	-- �y�F�S��
		local Time = GetSystime(0);
		if not g_Magic.QuicksandBomb.HitUnits[Room][Time] then	-- �ƼƬy�F�P�ɶ��u��缾�a�y�� 1 ���ˮ` (�̤p���:1��A�H�j�骺 Sleep �ɶ�����)
			g_Magic.QuicksandBomb.HitUnits[Room][Time] = {};
		--	DebugMsg( 0, Room, "Create Time"..Time );
		end

		if #Haters > 0 then
			for i = 1, #Haters do
				local Target = Haters[i];
				if GetDistance( Owner, Target ) <= g_Magic.QuicksandBomb.Range and not g_Magic.QuicksandBomb.HitUnits[Room][Time][Target] then
					g_Magic.QuicksandBomb.HitUnits[Room][Time][Target] = true;
					SysCastSpellLv( Banka, Target, g_Magic.QuicksandBomb.AttackID, 0 );	-- �y�F������ˮ`&�w�t
				--	DebugMsg( 0, Room, "�y�F�u �����ɶ�:"..Time );
				end
			end
		end
		Sleep(g_Magic.QuicksandBomb.ContinuousCastTickTime);
	end
end
--------------
function Instance_Z30_Banka_GroundMissile( Banka, Mumu, Room )	-- �a�Ծɼu

	if g_Magic.GroundMissile.List[Room] == nil then
		g_Magic.GroundMissile.List[Room] = {};
	end
	g_Magic.GroundMissile.HitBanka[Room] = false;

	StopMove( Banka, false );
	CastSpellLv( Banka, Banka, g_Magic.GroundMissile.ActID, 0 );
	Sleep(10);	-- �I�k��t�ɶ�

	local HateList = GetHateList( Banka, g_HateList[Room] );
	for i = 1, g_Magic.GroundMissile.Count do
		if #HateList == 0 then
			break;
		end
		local BankaPos = Vector_GetRolePos( Banka );
		local BankaDir = ReadRoleValue( Banka, EM_RoleValue_Dir );
		BankaPos.Y = BankaPos.Y + 15;
		local GroundMissile = Hao_CreateSpellObjbyPos( BankaPos, BankaDir, 60 )	-- ���ͬI�k����( �ѦҦ�m�B�Ѧҭ��V�B�s�b�ɶ�( ���: 1�� ) )
		SetModeEx( GroundMissile, EM_SetModeType_Move, true );	-- �}�Ҳ���
		table.insert( g_Magic.GroundMissile.List[Room], GroundMissile );

		local Target = table.remove( HateList, Math.Random(#HateList) );	-- ����� 1 �W�H���ؼ�
		CallPlot( GroundMissile, "Instance_Z30_Banka_GroundMissile_2", GroundMissile, Banka, Mumu, Target.Guid, Room );
		Sleep( g_Magic.GroundMissile.TickTime );
	end
end

function Instance_Z30_Banka_GroundMissile_2( GroundMissile, Banka, Mumu, LockTarget, Room )

	local Counter = 0;
	local Target = LockTarget;

	while g_Combination[Room] and CheckID( Banka ) do	--  ��X�餤�ΪZ�˨��d�s�b��

		SysCastSpellLv( GroundMissile, GroundMissile, g_Magic.GroundMissile.ContinuousActID, 0 );

		if Counter > g_Magic.GroundMissile.ReadyTime then	-- ��ǳƮɶ�������A�~�}�l�j�M

			-- ���ˬd���a�A�ˬd�Z�˨��d�A�קK���a�K��Z�˨��d���ۤ��ʡA�a�Ծɼu�N�|�R���Z�˨��d�����D�C
			local HateList = GetHateList( Banka, g_HateList[Room] );
			for i = 1, #HateList do
				if GetDistance( GroundMissile, HateList[i].Guid ) <= g_Magic.GroundMissile.PlayerTriggerRange then
					DebugMsg( 0, 0, "�a�Ծɼu�P��w���a�Z�� = "..GetDistance( HateList[i].Guid, GroundMissile ) );
					SysCastSpellLv( Banka, HateList[i].Guid, g_Magic.GroundMissile.AttackID, 0 );
					DelObj( GroundMissile );
					return;
				end
			end

			if GetDistance( Banka, GroundMissile ) < g_Magic.GroundMissile.BankaTriggerRange and not g_Magic.GroundMissile.HitBanka[Room] then
				DebugMsg( 0, 0, "�a�Ծɼu�P�Z�˨��d�Z�� = "..GetDistance( Banka, GroundMissile ) );
				g_Magic.GroundMissile.HitBanka[Room] = true;
				SysCastSpellLv( Banka, Banka, g_Magic.GroundMissile.AttackID, 0 );
				break;
			end
		end

		if not CheckID(Target) or ReadRoleValue( Target, EM_RoleValue_IsDead ) == 1 then	-- ��l�ܳ~���ؼЦ��`�ή����ɡA���� 1 �W�H���ؼ�
			local HateList = GetHateList( Banka, g_HateList[Room] );
			if #HateList > 0 then
				local Targets = table.remove( HateList, Math.Random(#HateList) );
				Target = Targets.Guid;
			else	-- ������S������ؼЮ�
				break;
			end
		end
		local TargetPos = Vector_GetRolePos( Target );
	--	DebugMsg( 0, 0, "Target = "..tostring(Target.Guid) );
	--	Say( Target, "I'm here" );
		MoveDirect( GroundMissile, TargetPos.X, TargetPos.Y+15, TargetPos.Z );

		Sleep( g_Magic.GroundMissile.ContinuousCastTickTime );
		Counter = Counter + g_Magic.GroundMissile.ContinuousCastTickTime;
	end

	for i = 1, #g_Magic.GroundMissile.List[Room] do	-- �R�����W��L���a�Ծɼu�A���ư����ۤv
		if g_Magic.GroundMissile.List[Room][i] ~= GroundMissile and CheckID( g_Magic.GroundMissile.List[Room][i] ) then
			DelObj( g_Magic.GroundMissile.List[Room][i] );
		end
	end

	Instance_Z30_Boss1_Detach( Banka, Mumu, Room )
	DelObj( GroundMissile );
end

function MagicBase_625245_Check()	-- �a�Ծɼu �R���ˬd

	local Banka = OwnerID();	-- ���d
	local Target = TargetID();	-- �ؼ�
	if Target == Banka then
		return false;
	end
	return true;
end
--------------
function Instance_Z30_Banka_EngryWeb( Banka, Room )	-- ��q��

	if g_Combination[Room] and ReadRoleValue( Banka, EM_RoleValue_IsDead ) == 0 then	-- �P�_�O�_���X�餤�A�קK�]��t�ɶ����w�Ѱ��X��Ӥ޵o��������D�C
	--	DebugMsg( 0, 0, "���X��q��"..", SysTime = "..GetSystime(0) );
		local BankaPos = Vector_GetRolePos( Banka );
		for i = 1, g_Magic.EngryWeb.Count do
			local VecDir = Vector_DirToVector( Math.Random( 36*(i-1), 36*i-1 ) );	-- �C 1 �Ө���H�� 1 ���A�̫�������T�w�ϰ���H����m����
			local TargetPos = BankaPos + VecDir * Math.Random( g_Magic.EngryWeb.MiniRange, g_Magic.EngryWeb.MaxRange );
			local CastObj = Hao_CreateSpellObjbyPos( TargetPos );	-- �b�ؼЦ�m�إ߬I�k����
			CallPlot( CastObj, "Instance_Z30_Banka_EngryWeb_2", CastObj, Banka, Room );
			Sleep(g_Magic.EngryWeb.TickTime);
		end
	end
end

function Instance_Z30_Banka_EngryWeb_2( CastObj, Banka, Room )	-- ��q��

	Sleep( g_Magic.EngryWeb.ReadyTime );
	while g_Combination[Room] and ReadRoleValue( Banka, EM_RoleValue_IsDead ) == 0 do	-- �קK�]��t�ɶ����w�Ѱ��X��Ӥ޵o��������D�C
		SysCastSpellLv( CastObj, CastObj, g_Magic.EngryWeb.ContinuousActID, 0 );
		Sleep( g_Magic.EngryWeb.ContinuousCastTickTime );
	end
--	DebugMsg( 0, 0, "�R����q��" );
	DelObj( CastObj );
end

function Instance_Z30_Banka_EnergizedCannonShot( Banka, Mumu, Room )	-- ��q��

	local HateList = GetHateList( Banka, g_HateList[Room] );
	for i = #HateList, 1, -1 do
		local Targets = table.remove( HateList, Math.Random(#HateList) );	-- ����� 1 �W�H���ؼ� ( �]�A Guid, Dis, HatePoint )
		if CheckBuff( Targets.Guid, g_BuffID.EnergyMark ) then
			DebugMsg( 0, 0, ", �X�� - �I���q��" );
			StopMove( Banka, false );
			CastSpellLv( Banka, Targets.Guid, g_Magic.EnergizedCannonShot.AttackID, 0 );	-- �ˮ`ID
			return true;
		end
	end
	return false;
end

function MagicBase_625240_Check()	-- ��q���R���ˬd

	local Banka = OwnerID();
	local Target = TargetID();

	if CheckBuff( Target, g_BuffID.EnergyMark ) then	-- ������A�����ؼШ��W����q��Debuff
		CancelBuff_NoEvent( Target, g_BuffID.EnergyMark );
		return true;
	end
	return false;
end
--------------