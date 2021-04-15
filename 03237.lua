
local g_ObjID = {};	-- �� Boss �~������M��
local g_MagicID = {};	-- �k�N���X�M��
local g_BuffID = {};	-- �򥻪k�N�M��
local g_Msg = {};	-- �T���M��
local g_FlagID_CreateObj = 781379;	-- ���󲣥ͺX��
local g_Control = {};	-- ������
local g_Switch = {};	-- �ϰ챱�
local g_Stage = {}; 	-- ���q���
local g_BossList = {};	-- Boss �M��
local g_HateList = {}	-- �O������C��
local g_Door = {};	-- �����
local g_MagicFlySpeed = 200; -- ���V�ؼЪ��w�]��t�A�߰ݲ��H��A�o�X���t�ιw�]��(�P�X�⩵��[�W�P�ؼжZ�����\��)�A�קK�׶}�ߪ��u�A�o�̵M�|�R�������D

g_MagicID.Act = 499223;	-- �@�Ϊ�t�S��

g_BuffID.Bind = 500467;	-- �����S�ġA�U����b���}�ԫe�M�ίS��
g_BuffID.Fury = 625217;	-- �d�F���� �g�ɤ�
g_BuffID.UnRecoverHp = 502707;	-- ����۰ʦ^��A�קK�������Ī�����ֳt�^��C
g_BuffID.Unstoppable = 508071;	-- ���b�Ⱦ���G���ѷ��a
g_BuffID.ForBoss1 = 500476;	-- �h�A���ذ_�l�ɱ�����Buff�A���h�A���جI����K�ľW��ݯd���p���]���A����P�_�O�_�n�v���h�A���ءC
g_BuffID.ForBoss3 = 500477;	-- �g���F�ΰ_�l�ɱ�����Buff�A���h�A���ت��]���R���A����P�_�O�_�n�j�Ƴg���F�ΡC
--g_BuffID.UnFight = 507899;	-- ���i�Ϊ��z�����A����t�Ϊ���ϥ�

g_Msg.StartFight = "[SC_108434_01]"	-- �}�ԡG[104492]�G�u��ǡK�A�̬O�֩O�H���D����O�J���ܡK�H�v
g_Msg.Fury = "[SC_108434_02]"	-- �g�ɡG[104492]�G�u�H�H�K���٦���h��h�ۦ��S�έ�A�Ү��K�ܡH�v
g_Msg.Reset = "[SC_108434_03]"	-- ���m�G[104492]�G�u�ڡK�H�N�u���o�ˤl�H�٥H���|�ܦn���K�I��K�v
g_Msg.Dead = "[SC_108434_04]"	-- ���`�G[104492]�Y���a�ݵۦۤv���W���˲��G�u���K���n���A���Q�K�K�v
g_Msg.Stage1 = "[SC_108434_05]"	-- �Ĥ@���q�}�l�G[104492]�G�u�h�ت����K�A�̤@�w�S��|�L�I���չL�F��U�N���Pı�ܡK�H�v
g_Msg.Stage2 = "[SC_108434_06]"	-- �ĤG���q�}�l�G[104492]�}�ߦa�ݵۤ@���G�u�z�A�o�өO�H���|�|�������F����q�n�F�I�v
g_Msg.Stage3 = "[SC_108434_07]"	-- �ĤT���q�}�l�G[104492]�G�u�Ƕ�K�F�Ϊ��@�r�ܥi�ȳ�I�v

g_Switch[166] = {}	-- �x���Ҧ�
g_Switch[166].Boss0 = 108434;	-- ���q�|�G��Ԩ��� 10%
g_Switch[166].Boss1 = 108437;	-- ���q�@�G�h�A����
g_Switch[166].Boss2 = 108435;	-- ���q�G�G�K���y�b��
g_Switch[166].Boss3 = 108436;	-- ���q�T�G�g���F��
g_Switch[166].furyTime = 480;	-- �g�ɮɶ�

g_Switch[167] = {}	-- ���q�Ҧ�
g_Switch[167].Boss0 = 103402;	-- ���q�|�G��Ԩ��� 10%
g_Switch[167].Boss1 = 103405;	-- ���q�@�G�h�A����
g_Switch[167].Boss2 = 103403;	-- ���q�G�G�K���y�b��
g_Switch[167].Boss3 = 103404;	-- ���q�T�G�g���F��
g_Switch[167].furyTime = 360;	-- �g�ɮɶ�

g_Switch[168] = {}	-- ²��Ҧ�
g_Switch[168].Boss0 = 103412;	-- ���q�|�G��Ԩ��� 10%
g_Switch[168].Boss1 = 103415;	-- ���q�@�G�h�A����
g_Switch[168].Boss2 = 103413;	-- ���q�G�G�K���y�b��
g_Switch[168].Boss3 = 103414;	-- ���q�T�G�g���F��
g_Switch[168].furyTime = 360;	-- �g�ɮɶ�

g_Switch[951] = {}	-- �x���Ҧ�
g_Switch[951].Boss0 = 106966;	-- ���q�|�G��Ԩ��� 10%
g_Switch[951].Boss1 = 106963;	-- ���q�@�G�h�A����
g_Switch[951].Boss2 = 106964;	-- ���q�G�G�K���y�b��
g_Switch[951].Boss3 = 106965;	-- ���q�T�G�g���F��
g_Switch[951].furyTime = 480;	-- �g�ɮɶ�

-- ���q�@�G�h�A���� --------------------------------------
g_MagicID.Steam = 499225;	-- �Q�]��
g_MagicID.SteamCD = 11;	-- �N�o�ɶ��G11��
g_MagicID.SteamCastTime = 10;	-- �k�N���X�����I�k�ɶ�(���:0.1��)

g_MagicID.FireCharge = 499227;	-- ���K�ľW�A��������ˮ`
g_MagicID.FireChargeCD = 19;	-- �N�o�ɶ��G19��(���:1��)
g_MagicID.FireChargeCastTime = 5;	-- �k�N���X�����I�k�ɶ�(���:0.1��)
g_MagicID.FireChargeObj = 107071;	-- ���K�ľW�A�z������
g_MagicID.FireChargeObjLiveTime = 10;	-- ���K�ľW�A�z������ͦs�ɶ�(���:1��)
g_MagicID.NightBlaze = 499229;	-- �]���R���A�ĤT���q�}�l��s�W�ޯ�
g_MagicID.NightBlazeCD = 3;	-- �N�o�ɶ��G3��(���:1��)
g_MagicID.NightBlazeCastTime = 0;	-- �k�N���X�����I�k�ɶ�(���:0.1��)

g_ObjID.NightFire = 103937;	-- �]��
g_ObjID.NightFireLiveTime = 6;	-- �]���s�b����W���ɶ�(���1��)
g_MagicID.NightFireHeal = 499224;	-- �]���������ĪG�A�v���h�A���ءA�ñj�Ƴg���F��
g_MagicID.NightFireDmg = 499228;	-- �]�����t���ĪG�A�缾�a�y���ˮ`
g_MagicID.NightFireTickTime = 5;	-- �]���C���I��ˮ`(�v��)�᪺����ɶ�
g_MagicID.NightFireRange = 25;	-- �C�ө]�����ꪽ�|
g_BuffID.NightFire = 500466;	-- �]�� Buff (���K�U�N���S��)

-- ���q�G�G�K���y�b�� --------------------------------------
-- �F��� Npc �ĪG
g_MagicID.AuraBuff = {};
g_MagicID.AuraBuff[0] = 499231;	-- ��
g_MagicID.AuraBuff[1] = 0;	-- �a
g_MagicID.AuraBuff[2] = 499234;	-- ��

-- �F��缾�a�ĪG
g_MagicID.AuraDeBuff = {};
g_MagicID.AuraDeBuff[0] = 499222;	-- ��
g_MagicID.AuraDeBuff[1] = 499232;	-- �a
g_MagicID.AuraDeBuff[2] = 499221;	-- ��

-- �F��S��
g_BuffID.Aura = {};
g_BuffID.Aura[0] = 500508;	-- ���t���F
g_BuffID.Aura[1] = 500951;	-- �a�����F
g_BuffID.Aura[2] = 500953;	-- ���뤧�F

-- �N���w�ؼХl��ܭ��e
g_MagicID.ReCall = {};
g_MagicID.ReCall[0] = 499230;	-- ��
g_MagicID.ReCall[1] = 499233;	-- �a
g_MagicID.ReCall[2] = 499235;	-- ��

-- �N���w�ؼХl��ܭ��e���S��
g_BuffID.ReCall = {};
g_BuffID.ReCall[0] = 500624;	-- ���l��
g_BuffID.ReCall[1] = 500625;	-- �a�l��
g_BuffID.ReCall[2] = 500626;	-- ���l��

-- ���q�T�G�g���F�� --------------------------------------
g_MagicID.TerrorArrow = 499236;	-- ���߬r�b
g_MagicID.TerrorArrowCD = 11;	-- �N�o�ɶ��G11��(���:1��)
g_MagicID.TerrorArrowCastTime = 0;	-- �k�N���X�����I�k�ɶ�(���:0.1��)
g_MagicID.TerrorArrowTargetsCount = 2;	-- �C���I��ɪ��ؼмƶq

g_MagicID.Whirlwind = 499239;	-- �ۭ���
g_MagicID.WhirlwindCD = 13;	-- �N�o�ɶ��G13��(���:1��)
g_MagicID.WhirlwindCastTime = 0;	-- �k�N���X�����I�k�ɶ�(���:0.1��)

 --------------------------------------
local function HpPercent( ObjID )	-- �d�� HP%

	local Hp = ReadRoleValue( ObjID, EM_RoleValue_Hp );	-- ��e Hp
	local MaxHp = ReadRoleValue( ObjID, EM_RoleValue_MaxHp );	-- �̤j Hp
	return Hp/MaxHp;
end

local function Boss0CommonAct( Owner, Target )	-- Boss �q�Ϊ�t�P�}�Գ]�w

	SetModeEx( Owner, EM_SetModeType_Show, false );	-- ���
	SetModeEx( Owner, EM_SetModeType_Mark, false );	-- �аO
	SysCastSpellLv( Target, Target, g_MagicID.Act, 0 );	-- ��t�S��
	CancelBuff( Target, g_BuffID.Bind );	-- ���������S��
	SetModeEx( Target, EM_SetModeType_Move, true );	-- ����
	SetModeEx( Target, EM_SetModeType_Fight, true );	-- ���
	SetModeEx( Target, EM_SetModeType_Searchenemy, true );	-- ����
end

local function DelObjInit( Room )	-- �R�����W��������

	for i = 0, #g_BossList[Room], 1 do	-- �R�� Boss
		if type(g_BossList[Room][i]) == "table" then	-- �R�����q�G�G�K���y�b��
			for j = 0, #g_BossList[Room][i] do
				DelObj( g_BossList[Room][i][j] );
			end
		else
			DelObj( g_BossList[Room][i] );
		end
	end
	Lua_DavisDelObj( g_ObjID.NightFire );	-- �R���ݯd�]��
end

local function CheckObjFury( Room )	-- Boss �g�ɧP�_

	if g_BossList[Room][0] and not CheckBuff( g_BossList[Room][0], g_BuffID.Fury ) then	-- ���q�|�G��Ԩ�������
		AddBuff( g_BossList[Room][0], g_BuffID.Fury, 0, -1 );
	end

	if not g_BossList[Room].BossIsDead[1] and not CheckBuff( g_BossList[Room][1], g_BuffID.Fury ) then	-- ���q�@�G�h�A�h��
		AddBuff( g_BossList[Room][1], g_BuffID.Fury, 0, -1 );
		ScriptMessage( g_BossList[Room][1], -1, 2, g_Msg.Fury, 0 );
	end

	for i = 0, #g_BossList[Room][2], 1 do	-- ���q�G�G�K���y�b��
		if CheckID( g_BossList[Room][2][i] ) and not CheckBuff( g_BossList[Room][2][i], g_BuffID.Fury ) then
			AddBuff( g_BossList[Room][2][i], g_BuffID.Fury, 0, -1 );
		end
	end

	if not CheckBuff( g_BossList[Room][3], g_BuffID.Fury ) then	-- ���q�T�G�g���F��
		AddBuff( g_BossList[Room][3], g_BuffID.Fury, 0, -1 );
	end
end

local function CheckObjHackAction( Room )	-- ���b�Ⱦ���P�_ - ���������a�|�J����[ - Buff �d�F���㪺 Boss

	if CheckBuff( g_BossList[Room][0], g_BuffID.Unstoppable ) then	-- ��Ԩ���

		if not g_BossList[Room].BossIsDead[1] and not CheckBuff( g_BossList[Room][1], g_BuffID.Unstoppable ) then	-- ���q�@�G�h�A�h��
			AddBuff( g_BossList[Room][1], g_BuffID.Unstoppable, 0, -1 );
		end

		for i = 0, #g_BossList[Room][2], 1 do	-- ���q�G�G�K���y�b��
			if CheckID( g_BossList[Room][2][i] ) and not CheckBuff( g_BossList[Room][2][i], g_BuffID.Unstoppable ) then
				AddBuff( g_BossList[Room][2][i], g_BuffID.Unstoppable, 0, -1 );
			end
		end

		if not CheckBuff( g_BossList[Room][3], g_BuffID.Unstoppable ) then	-- ���q�T�G�g���F��
			AddBuff( g_BossList[Room][3], g_BuffID.Unstoppable, 0, -1 );
		end
	end
end

local function ObjDefaultStatus( ObjID, FlagNum, Zone, Room )	-- �U���q Boss ���ͮɪ��w�]���A

	local X, Y, Z, Dir = DW_Location( g_FlagID_CreateObj, FlagNum );	-- Ū�����w�X�Ы��w�s�����y��
	local Boss = CreateObj( ObjID, X, Y, Z, Dir, 1 );	-- �إߪ���

	if FlagNum == 0 then	-- ��Ԩ���
		SetModeEx( Boss, EM_SetModeType_Fight, false );	-- �������
		SetModeEx( Boss, EM_SetModeType_Searchenemy, true );	-- ����
		SetModeEx( Boss, EM_SetModeType_Move, true );	-- ��������
		WriteRoleValue( Boss, EM_RoleValue_IsWalk, 0 );	-- �]�w���]�B
		MoveToFlagEnabled( Boss, false );	-- �������޼@��
		AddToPartition( Boss, Room );
		return Boss;
	end

	if FlagNum == 1 then	-- �h�A����
		AddBuff( Boss, g_BuffID.ForBoss1, 0, -1 );
	elseif FlagNum == 3 then	-- �g���F��
		AddBuff( Boss, g_BuffID.ForBoss3, 0, -1 );
	end
	AddBuff( Boss, g_BuffID.Bind, 0, -1 );	-- �����S��
	SetModeEx( Boss, EM_SetModeType_Fight, false );	-- �������
	SetModeEx( Boss, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( Boss, EM_SetModeType_Move, false );	-- ��������
	AddToPartition( Boss, Room );
	return Boss;
end

local function CreateObjInit( Zone, Room )	-- ���󲣥ͼ@��

	g_Door[Room] = 0;	-- ���}���A 0 = �}�ҡB1 = ����

	g_BossList[Room] ={};	-- ���m�� Room �O���� Boss �M��
	g_BossList[Room][0] = ObjDefaultStatus( g_Switch[Zone].Boss0, 0, Zone, Room );	-- ��Ԩ�������
	g_BossList[Room][1] = ObjDefaultStatus( g_Switch[Zone].Boss1, 1, Zone, Room );	-- ���q�@�G�h�A����
	g_BossList[Room][2] = {}
	g_BossList[Room][2][0] = ObjDefaultStatus( g_Switch[Zone].Boss2, 2, Zone, Room );	-- ���q�G�G�K���y�b��
	g_BossList[Room][3] = ObjDefaultStatus( g_Switch[Zone].Boss3, 3, Zone, Room );	-- ���q�T�G�g���F��

	Cl_Resist_HackersBossNum( g_BossList[Room][0] );	-- ���b�Ⱦ���A�קK���a������
	SetPlot( g_BossList[Room][0], "Dead", "Zone_166_Boss2_Boss0_DeadPlot", 0 );	-- ��Ԩ������`�@��
	SetPlot( g_BossList[Room][1], "Dead", "Zone_166_Boss2_Boss1_DeadPlot", 0 );	-- �h�A���ئ��`�@��
	SetPlot( g_BossList[Room][3], "Dead", "Zone_166_Boss2_Boss3_DeadPlot", 0 );	-- �g���F�Φ��`�@��

	-- ���`���A
	g_BossList[Room].BossIsDead ={};	-- ���m�� Room �O���� Boss ���`���A
	g_BossList[Room].BossIsDead[0] = false;	-- ��Ԩ���
	g_BossList[Room].BossIsDead[1] = false;	-- �h�A����
--	g_BossList[Room].BossIsDead[2] = {};
--	g_BossList[Room].BossIsDead[2][0] = false;	-- �K���y�b�� 1
--	g_BossList[Room].BossIsDead[2][1] = false;	-- �K���y�b�� 2
--	g_BossList[Room].BossIsDead[2][2] = false;	-- �K���y�b�� 3
	g_BossList[Room].BossIsDead[3] = false;	-- �g���F��

	g_HateList[Room] = {};	-- ���m�� Room �O��������C��M�� ( ���q�@ - �T���h�A���بϥΡA���q�|����Ѧ�Ԩ����ϥ� )
	g_Stage[Room] = 0;	-- �N���q����m�� 0
end

function Zone_166_Boss2_Boss0_DeadPlot()	-- ��Ԩ������`�@��

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	g_BossList[Room].BossIsDead[0] = true;	-- ��Ԩ���
	g_Door[Room] = 2;	-- ��������}�Ұʧ@
	ScriptMessage( Owner, -1, 2, g_Msg.Dead, 0 );	-- ���`�T��
	Cl_Resist_HackersBossDead( Owner );	-- ���b�Ȧ��`�ɵ��U
end

function Zone_166_Boss2_Boss1_DeadPlot()	-- �h�A���ئ��`�@��

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	g_BossList[Room].BossIsDead[1] = true;
end

function Zone_166_Boss2_Boss3_DeadPlot()	-- �g���F�Φ��`�@��

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	g_BossList[Room].BossIsDead[3] = true;
end

-- ���եΪ��� 106961
function Instacne_166_108329_InitLua()	-- �������_�l�@��

	local Control = OwnerID();
	local Room = ReadRoleValue( Control, EM_RoleValue_RoomID );
	local Zone = ReadRoleValue( Control, EM_RoleValue_ZoneID );
	g_Control[Room] = Control;

	CreateObjInit( Zone, Room );	-- ���ͦU���q�� Boss
end

function Zone_166_Boss2_FightPlot()	-- ��Ԩ����԰��@��

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Control = g_Control[Room];
	local AttackTarget

	local HateList = HateListCount( Owner );
	for i = 0, HateList-1 do	-- ����������ؼ�
		AttackTarget = HateListInfo( Owner, i, EM_HateListInfoType_GItemID );	-- ��������H�� 1 �W�ؼ�
		break;
	end

	if not g_BossList[Room].BossIsDead[1] then	-- ��h�A���بS����
		SetModeEx( Owner, EM_SetModeType_Fight, false );	-- �������
		SetModeEx( Owner, EM_SetModeType_Searchenemy, false );	-- ����
		SetStopAttack( Owner );	-- ����԰��A�òM�ž԰�
		CallPlot( Control, "Instacne_166_CheckStage", Control, AttackTarget );
		return
	end
end

function Instacne_166_CheckStage( Control, AttackTarget  )	--  �Ѥ���������

	local Zone = ReadRoleValue( Control, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Control, EM_RoleValue_RoomID );
	local Boss0 = g_BossList[Room][0];	-- ��Ԩ���
	local Boss1 = g_BossList[Room][1];	-- �h�A����
	local Boss2 = g_BossList[Room][2][0];	-- �K���y�b��
	local Boss3 = g_BossList[Room][3];	-- �g���F��

	g_Door[Room] = 1;	-- �i�J�԰���A������

	local Counter = 0;	-- �p�ƾ�
	local MoveTime = 0;	-- ��Ԩ������ʦܦUBoss���ɶ�
	local LeaveFightTime = 0;	-- ���}�԰��ֿn�ɶ�
	local DefaultLeaveFightTime = 6;	-- ������S������ؼЮɡA> 6 ���|���}�԰��A�í��m���Ӿ���
	local ActTime = 20;	-- ��Ԩ������ʦܦUBoss�᪺��t�ɶ�

	ScriptMessage( Boss0, -1, 2, g_Msg.StartFight, 0 );	-- �}�԰T��

	while true do
	--	DebugMsg( 0, Room, "Counter = "..Counter );

		-- �@�Τ���C��
		if not g_BossList[Room].BossIsDead[1] then	-- ��h�A���ئs���ɡA����C��H�h�A���ج���
			g_HateList[Room] = HateListCount( Boss1 );
		--	DebugMsg( 0, 0, "Boss1 , ".."LeaveFightTime = "..LeaveFightTime )
		elseif not g_BossList[Room].BossIsDead[3] then	-- ��h�A���ئ��`�ɡA�����H�g���F�ά���
			g_HateList[Room] = HateListCount( Boss3 );
		--	DebugMsg( 0, 0, "Boos3 , ".."LeaveFightTime = "..LeaveFightTime )
		else	-- ��h�A���ػP�g���F�Χ����`�ɡA�i�J�ĥ|���q�A�����h�H��Ԩ�������
			g_HateList[Room] = HateListCount( Boss0 );
		--	DebugMsg( 0, 0, "Boss0 , ".."LeaveFightTime = "..LeaveFightTime )
		end

		-- �����԰��P�_
		if g_HateList[Room] == 0 then
			LeaveFightTime = LeaveFightTime + 1;
		else
			LeaveFightTime = 0;	-- ��_�w�]�]�w
		end

		-- �ˬd�O�_�H�������𲤤覡�i������Boss���欰�A�O���ܵ����U Boss Buff - ���ѷ��a
		CheckObjHackAction( Room );

		-- �ˬd�O�_�g��
		if Counter >= g_Switch[Zone].furyTime then
			CheckObjFury( Room );
		end
	--	DebugMsg( 0, 0, "g_HateList = "..g_HateList[Room] );

		-- ��}�ԫᤳ��C���S���ؼЮɡA���m�԰�
		if not g_BossList[Room].BossIsDead[0] and LeaveFightTime > DefaultLeaveFightTime then

			g_Stage[Room] = 0;	-- �N���q�^�g�� 0
			local X, Y, Z, Dir = DW_Location( g_FlagID_CreateObj, 0 );	-- Ū�����w�X�Ы��w�s�����y��
			SetPos( Boss0, X, Y, Z, Dir );
    			SetModeEx( Boss0, EM_SetModeType_Show, true );	-- ���
			SetModeEx( Boss0, EM_SetModeType_Mark, true );	-- �аO
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_BEGIN );
			Sleep( ActTime );
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_END );
			ScriptMessage( Boss0, -1, 2, g_Msg.Reset, 0 );	-- ���m�T��
		--	Sleep( 10 );
			DelObjInit( Room );
			Sleep( 50 );	--  5 ����l��
			CreateObjInit( Zone, Room );	-- ���ͦU���q�� Boss
			break;
		end

		local Boss1_Hp = HpPercent( Boss1 );
	--	DebugMsg( 0, Room, "Hp percent = "..Boss1_Hp );

		if g_Stage[Room] == 0 then	-- �i�J�Ĥ@���q
			g_Stage[Room] = 1;
			LockHP( Boss1, ReadRoleValue( Boss1, EM_RoleValue_MaxHP)*0.65, "" );	-- �N Boss ����q��w�b 65%�A�קK�Q��������p�o�͡A�P�ϼ@�����_
			MoveTime = MoveTarget( Boss0, Boss1 );	-- ��Ԩ������h�A���ز���
			Sleep( MoveTime );
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_BEGIN );
			Sleep( ActTime );
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_END );
			ScriptMessage( Boss0, -1, 2, g_Msg.Stage1, 0 );	-- �Ĥ@���q�T��
			Boss0CommonAct( Boss0, Boss1 );
			SetAttack( Boss1, AttackTarget );
			CallPlot( Boss1, "Zone_166_Boss2_Stage1_Fight", Boss1, Boss0, Room );

		elseif g_Stage[Room] == 1 and Boss1_Hp < 0.7 then	-- �i�J�ĤG���q
			g_Stage[Room] = 2;
			LockHP( Boss1, ReadRoleValue( Boss1, EM_RoleValue_MaxHP)*0.35, "" );	-- �N Boss ����q��w�b 35%�A�קK�Q��������p�o�͡A�P�ϼ@�����_
			local Boss1Pos = Vector_GetRolePos( Boss1 );
			local Dir = ReadRoleValue( Boss1, EM_RoleValue_Dir );
			SetPos( Boss0, Boss1Pos.X, Boss1Pos.Y, Boss1Pos.Z, Dir );
    			SetModeEx( Boss0, EM_SetModeType_Show, true );	-- ���
			SetModeEx( Boss0, EM_SetModeType_Mark, true );	-- �аO
			MoveTime = MoveTarget( Boss0, Boss2 );	-- ��Ԩ������K���y�b�̲���
			Sleep( MoveTime );
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_BEGIN );
			Sleep( ActTime );
			PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_END );
			ScriptMessage( Boss0, -1, 2, g_Msg.Stage2, 0 );	-- �ĤG���q�T��
			Boss0CommonAct( Boss0, Boss2 );
			CallPlot( Boss2, "Zone_166_Boss2_Stage2_Fight", Boss2, Boss0, Boss1, Control, Zone, Room );

		elseif g_Stage[Room] == 2 and Boss1_Hp < 0.4 then	-- �i�J�ĤT���q
			local Boss2_Hp = {};
			local Count = 0;	-- �K���y�b��(����B����)��Hp�O�_�w�i�J 50%
			for i = 0, #g_BossList[Room][2] do	-- Boss 2
				Boss2_Hp[i] = HpPercent( g_BossList[Room][2][i] );
			--	DebugMsg( 0, Room, "Boss2["..i.."] Hp percent = "..Boss2_Hp[i] );
				if not CheckID(g_BossList[Room][2][i]) or Boss2_Hp[i] < 0.5 then	-- �ӥؼЬO�_�w���`�ΥͩR <  50%
					Count = Count + 1;
				end
			end
		--	DebugMsg( 0, Room, "Boss2 Stage2 LowHp(Dead) Count = "..Count );
			if Count == 3 then
				g_Stage[Room] = 3;
				LockHP( Boss1, -100, "" );	-- ���� Boss ����q��w

				local Boss1Pos = Vector_GetRolePos( Boss1 );
				local Dir = ReadRoleValue( Boss1, EM_RoleValue_Dir );
				SetPos( Boss0, Boss1Pos.X, Boss1Pos.Y, Boss1Pos.Z, Dir );
    				SetModeEx( Boss0, EM_SetModeType_Show, true );	-- ���
				SetModeEx( Boss0, EM_SetModeType_Mark, true );	-- �аO
				MoveTime = MoveTarget( Boss0, Boss3 );	-- ��Ԩ������g���F�β���
				Sleep( MoveTime );
				PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_BEGIN );
				Sleep( ActTime );
				PlayMotion( Boss0, ruFUSION_ACTORSTATE_BUFF_END );
				ScriptMessage( Boss0, -1, 2, g_Msg.Stage3, 0 );	-- �ĤT���q�T��
				Boss0CommonAct( Boss0, Boss3 );

				local HateList = {};
				for i = 0, g_HateList[Room]-1 do	-- ����������ؼ�
					local HateTarget = HateListInfo( Boss1, i, EM_HateListInfoType_GItemID );
					table.insert( HateList, HateTarget );
				end
				local Target = HateList[math.random(#HateList)];	-- ��������H�� 1 �W�ؼ�
				SetAttack( Boss3, Target );
				CallPlot( Boss3, "Zone_166_Boss2_Stage3_Fight", Boss3, Boss0, Boss1, Room );
			end

		elseif g_Stage[Room] == 3 then	-- �i�J�ĥ|���q
			-- ��h�A���ػP�g���F�Τ��s�b�γ����`�ɶi�J�ĥ|���q
		--	DebugMsg( 0, 0, "Boss1 = "..tostring(g_BossList[Room].BossIsDead[1]).." , Boss3 = "..tostring(g_BossList[Room].BossIsDead[3]) );
			if g_BossList[Room].BossIsDead[1] and g_BossList[Room].BossIsDead[3] then
		--	if ( not CheckID( Boss1 ) or ReadRoleValue( Boss1, EM_RoleValue_IsDead ) == 1 ) and ( not CheckID(Boss3) or ReadRoleValue( Boss3, EM_RoleValue_IsDead ) == 1 ) then
				g_Stage[Room] = 4;
				CallPlot( Boss0, "Zone_166_Boss2_Stage4_Fight", Boss0, Boss1, Boss3, Control, Room );
			end
		end
		Sleep(10);
		Counter = Counter + 1;
	end
end

function Zone_166_Boss2_Stage1_Fight( Boss1, Boss0, Room )	--  ���q�@�G�Ѫh�A���ذ���

	local Counter = 0;	-- �p�ƾ�
	local Systime = GetSystime(0);

	Cl_Resist_HackersFightBegin( Boss0 );	-- ������԰��}�l�����b�Ⱦ���
	while true do
		Counter = Counter + 1;
		local NowSystime = GetSystime(0) - Systime;
	--	DebugMsg( 0, Room, "Counter = "..Counter..", Fighting time = "..NowSystime );
		if g_HateList[Room] > 0 then	-- ����������@�ؼЮ�
			if Counter%g_MagicID.FireChargeCD == 0 then	-- ���K�ľW
				Zone_166_Boss2_Stage1_FireCharge( Boss1, Room );
			elseif Counter%g_MagicID.SteamCD == 0 then	-- �Q�]��
				CastSpell( Boss1, Boss1, g_MagicID.Steam );
				Sleep( g_MagicID.SteamCastTime );
			elseif g_Stage[Room] == 3 and Counter%g_MagicID.NightBlazeCD == 0 then	-- ���q�T��A�[�J�]���R��
				Zone_166_Boss2_Stage1_NightBlaze( Boss1, Room );
			end
		end
		Sleep(10);
	end
end

function Zone_166_Boss2_Stage1_FireCharge( Boss1, Room )	-- ���K�ľW

	local HateList = {};
--	local AttackTarget = ReadRoleValue( Boss1, EM_RoleValue_AttackTargetID );	-- �h�A���ت���e�ؼ�
	for i = 0, g_HateList[Room]-1 do	-- ����������ؼ�
		local HateTarget = HateListInfo( Boss1, i , EM_HateListInfoType_GItemID );
	--	if HateTarget ~= AttackTarget then	-- ��h�A���ط�e���ؼоױ�
			table.insert( HateList, HateTarget );
	--	end
	end

	local Target = HateList[math.random(#HateList)];	-- ��������H�� 1 �W�ؼ�
	local Boss1Pos = Vector_GetRolePos(Boss1);	-- Boss1 �y��
	local TargetPos = Vector_GetRolePos(Target);	-- Target �y��
	local Distance = (Boss1Pos - TargetPos):Len();	-- Owner �� Target ���Z��
	local Dir = Lua_GetAngle( Boss1Pos.X, Boss1Pos.Z, TargetPos.X, TargetPos.Z );	-- Owner �y���I�V Target �y���I�ݹL�h������
	local VecDir = Vector_DirToVector( Dir );	-- ������V�q

	local MinimunChargeDistance = g_MagicID.NightFireRange*4;	-- �̤p�ľW�Z��
	if Distance < MinimunChargeDistance then
		Distance = MinimunChargeDistance;
		local NewPos = Boss1Pos + VecDir * Distance;
		if CheckLine( Boss1, NewPos.X, NewPos.Y+15, NewPos.Z ) then	-- ��i���u�ɡA�̤p�ľW�Z���~���ߡA�קK Boss ����
			TargetPos = NewPos;
		end
	end

	local ChargeObj = CreateObj( g_MagicID.FireChargeObj, TargetPos.X, TargetPos.Y, TargetPos.Z, 0, 1 ); 	-- �ľW�z������
	SetModeEx( ChargeObj, EM_SetModeType_Show, false );	-- ���
	SetModeEx( ChargeObj, EM_SetModeType_Mark, false );	-- �аO
	SetModeEx( ChargeObj, EM_SetModeType_Strikback, false );	-- ����
	SetModeEx( ChargeObj, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( ChargeObj, EM_SetModeType_Move, false );	-- ��������
	WriteRoleValue( ChargeObj, EM_RoleValue_LiveTime, g_MagicID.FireChargeObjLiveTime );	-- �z������ͦs�ɶ�
	AddToPartition( ChargeObj, Room );

	CastSpell( Boss1, ChargeObj, g_MagicID.FireCharge );	-- �ľW
	Sleep( g_MagicID.FireChargeCastTime );	-- ���ݬI�k�ɶ�

	for i = 1, math.Ceil( Distance / g_MagicID.NightFireRange ) do
		local NightFirePos = Boss1Pos + VecDir * (g_MagicID.NightFireRange*i );	-- �C�ө]��(�z������)�إ߮ɪ��y��
		local NightFire = Zone_166_Boss2_Stage1_CreateNightFire( NightFirePos, Dir, Room );	-- �]��
		Sleep(2);
	end
	return true;
end

function Zone_166_Boss2_Stage1_NightBlaze( Boss1, Room )	-- �]���R��

	local HateList = {};
	for i = 0, g_HateList[Room]-1 do	-- ����������ؼ�
	--	local AttackTarget = ReadRoleValue( Boss1, EM_RoleValue_AttackTargetID );	-- �h�A���ت���e�ؼ�
		local HateTarget = HateListInfo( Boss1, i , EM_HateListInfoType_GItemID );
	--	if HateTarget ~= AttackTarget then	-- ��h�A���ط�e���ؼоױ�
		table.insert( HateList, HateTarget );
	--	end
	end

	local Target = HateList[Math.random(#HateList)];	-- ��������H�� 1 �W�ؼ�
	local Boss1Pos = Vector_GetRolePos( Boss1 );	--  �h�A���ط�e��m
	local TargetPos = Vector_GetRolePos( Target );	-- �ؼз�e��m
	local Dir = ReadRoleValue( Target, EM_RoleValue_Dir );
	local Distance = GetDistance( Boss1, Target );	-- �Z��
	local DelayTime = ( Distance / g_MagicFlySpeed )*10;
--	DebugMsg( 0, 0, "DelayTime = "..Math.ceil(DelayTime)..", Distance = "..Distance );
	CastSpellPos( Boss1, TargetPos.X, TargetPos.Y, TargetPos.Z, g_MagicID.NightBlaze, 0 );
	Sleep( DelayTime+12 );	-- �ߪ��u�D���u�A�_�I�ܲ��I�A�b�t�׬ۦP�����p�U�A�ߪ��u�|�����u�C��F�A�G�[�J 1.2 ���ʦ�����ɶ�
	CallPlot( Boss1, "Zone_166_Boss2_Stage1_CreateNightFire", TargetPos, Dir, Room );
	Sleep( g_MagicID.NightBlazeCastTime );	-- ����
	return true;
end

function Zone_166_Boss2_Stage1_CreateNightFire( NightFirePos, Dir, Room )	-- �ͦ��]��

	local NightFire = CreateObj( g_ObjID.NightFire, NightFirePos.X, NightFirePos.Y, NightFirePos.Z, Dir, 1 );	-- �إߩ]��(�z������)
	SetModeEx( NightFire, EM_SetModeType_Move, false );	-- ����
	SetModeEx( NightFire, EM_SetModeType_Fight, false );	-- ���
	SetModeEx( NightFire, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( NightFire, EM_SetModeType_Strikback, false );	-- ����
	WriteRoleValue( NightFire, EM_RoleValue_LiveTime, g_ObjID.NightFireLiveTime );
	AddBuff( NightFire, g_BuffID.NightFire, 0, -1 );
	AddToPartition( NightFire, Room );
	CallPlot( NightFire, "Zone_166_Boss2_Stage1_NightFire", NightFire );
	return NightFire;
end

function Zone_166_Boss2_Stage1_NightFire( NightFire )	-- �p���]���_�l�@��

	local Counter = 0;
	while true do
		Sleep(g_MagicID.NightFireTickTime);	-- g_MagicID.NightFireTickTime = 5
		Counter = Counter + 5;
		if Counter%5 == 0 then	-- �C 0.5 ��I��@���ˮ`
			SysCastSpellLv( NightFire, NightFire, g_MagicID.NightFireDmg, 0 );
		end
		if Counter%10 == 0 then	-- �C 1 ��I��@���v��
			SysCastSpellLv( NightFire, NightFire, g_MagicID.NightFireHeal, 0 );
		end
	end
end

function Zone_166_Boss2_Stage2_Fight( Boss2, Boss0, Boss1, Control, Zone, Room )	-- ���q�G�A�K���y�b�̾԰��@��

	local ControlPos = Vector_GetRolePos( Control );	-- ���������y��
	local Boss2Pos = Vector_GetRolePos( Boss2 )	-- �K���y�b�̪��y��
	local Dir = ReadRoleValue( Control, EM_RoleValue_Dir );	-- �����������V

	-- �I�����
	local AvatarCount = 2;	-- �����ƶq
	for i = 1, AvatarCount do	-- 0 ������A�G�q 1 �}�l
		g_BossList[Room][2][i] = CreateObj( g_Switch[Zone].Boss2, Boss2Pos.X, Boss2Pos.Y, Boss2Pos.Z, Dir, 1 );	-- �K���y�b��
		AddToPartition( g_BossList[Room][2][i], Room );
		CastSpell( g_BossList[Room][2][i], g_BossList[Room][2][i], g_MagicID.Act );	-- ��t�S��
	end

	for i = 0, #g_BossList[Room][2] do
		Addbuff( g_BossList[Room][2][i], g_BuffID.UnRecoverHp, 0, -1 );	-- �������۰ʦ^��
		AddBuff( g_BossList[Room][2][i], g_BuffID.Aura[i], 0, -1 );	-- �����F�� ���t�B�a���B���뤧�F
		SetModeEx( g_BossList[Room][2][i], EM_SetModeType_Searchenemy, false );	-- ����
		SetModeEx( g_BossList[Room][2][i], EM_SetModeType_Strikback, false );	-- ����
		CallPlot( g_BossList[Room][2][i], "Zone_166_Boss2_Stage2_Move", g_BossList[Room][2][i], ControlPos, Dir, Room );	-- �H������
		CallPlot( g_BossList[Room][2][i], "Zone_166_Boss2_Stage2_Cast", g_BossList[Room][2][i], Boss1, i, Room );	-- �I���F��B�H���ԤH
	end
end

function Zone_166_Boss2_Stage2_Move( Owner, ControlPos, Dir, Room )	-- �H������

	local Distance	-- �C���H�����ʪ��Z��
	local VecDir	-- �C���H�����ʪ��V�q
	local TargetPos	-- �C�����ʪ��ؼЦ�m

	while true do
		Distance = Math.random(50,150);
		VecDir = Vector_DirToVector( Dir + Math.random(360) );	-- ������V�q
		TargetPos = ControlPos + VecDir * Distance;	-- �ؼЦ�m
		Lua_WaitMoveto( Owner, TargetPos.X, TargetPos.Y, TargetPos.Z );	-- ���ʦܫ��w��m��~����U�@��
		Sleep(1);
	end
end

function Zone_166_Boss2_Stage2_Cast( Owner, Boss1, Select, Room )	-- �t�άI�k(�H���ԤH�B�I���F��)

	local Count = 0;
	local DelayTime = 10;	-- �ԤH�e������I�k�ɶ�

	while true do
		Count = Count + 1;

		if Count % 10 == 0 then	-- �C 10 ��I��@���H���l��
			local HateList = {};
			for i = 0, g_HateList[Room]-1 do	-- ����������ؼ�
			--	local AttackTarget = ReadRoleValue( Boss1, EM_RoleValue_AttackTargetID );	-- �h�A���ت���e�ؼ�
				local HateTarget = HateListInfo( Boss1, i , EM_HateListInfoType_GItemID );
			--	if HateTarget ~= AttackTarget then	-- ��h�A���ط�e���ؼоױ�
					table.insert( HateList, HateTarget );
			--	end
			end

			for i = 0, #g_BossList[Room][2] do
				local Count = #HateList
			--	DebugMsg( 0, 0, "Search Count = "..Count );
				if Count == 0 then
					break;
				end
				local Target = table.remove( HateList, math.random(#HateList) );	-- �H���ؼСA�èϳQ�ǰe�ؼФ����ơA���|���m
				AddBuff( Target, g_BuffID.ReCall[Select], 0, -1 );
				Sleep(DelayTime);
				SysCastSpellLv( Owner, Target, g_MagicID.ReCall[Select], 0 );
			end
		end

		if g_MagicID.AuraBuff[Select] ~= 0 then	-- �C 1 ��I��@���F��G�����ĪG(��Ǫ�)
        			SysCastSpellLv( Owner, Owner, g_MagicID.AuraBuff[Select], 0 );
		end
		-- �C 1 ��I��@���F��t���ĪG(�缾�a)
		SysCastSpellLv( Owner, Owner, g_MagicID.AuraDeBuff[Select], 0 );
		Sleep(10);
	end
end

function Zone_166_Boss2_Stage3_Fight( Boss3, Boss0, Boss1, Room )	-- ���q�T�A�g���F�ξ԰��@��

	local GetAuraObjList = { Boss1, Boss3 };	-- �~���F�𪺥ؼвM��G�h�A���ءB�g���F��

	for i = 0, #g_BossList[Room][2] do
		if CheckID( g_BossList[Room][2][i] ) and ReadRoleValue( g_BossList[Room][2][i], EM_RoleValue_IsDead ) == 0 then	-- ����W�|�����۪��K���y�b�̮ɡA�h�A���ةγg���F�η|�~�ӵK���y�b�̪���O
			local Count = #GetAuraObjList;
			if Count > 0 then
				local GetAuraObj = table.remove( GetAuraObjList, Math.random( #GetAuraObjList) );	-- �q�h�A���ػP�g���F�Τ��H����@
				AddBuff( GetAuraObj, g_BuffID.Aura[i], 0, -1 );	-- �����F�� ���t�B�a���B���뤧�F
				CallPlot( GetAuraObj, "Zone_166_Boss2_Stage2_Cast", GetAuraObj, Boss1, i, Room );	-- �I���F��B�H���ԤH
			end
			DelObj( g_BossList[Room][2][i] );	-- �N�K���y�b�̱q���W�l��^�X��
		end
	end

	local Counter = 0;

	while true do	-- �԰��@��
	--	DebugMsg( 0, 0, "Counter = "..Counter.." , HateCount = "..g_HateList[Room] );
		Counter = Counter + 1;
		if g_HateList[Room] > 0 then	-- ����������@�ؼЮ�
			if Counter%g_MagicID.TerrorArrowCD == 0 then	-- ���߬r�b
        				Zone_166_Boss2_Stage3_TerrorArrow( Boss3, Boss1, Room );
			elseif Counter%g_MagicID.WhirlwindCD == 0 then	-- �ۭ���
				local AttackTarget = ReadRoleValue( Boss3, EM_RoleValue_AttackTargetID );	-- �g���F�Ϊ���e�ؼ�
				CastSpell( Boss3, AttackTarget, g_MagicID.Whirlwind );
			end
		end
		Sleep(10);
	end
end

function Zone_166_Boss2_Stage3_TerrorArrow( Boss3, Boss1, Room )	-- ���߬r�b

	local HateList = {};
	for i = 0, g_HateList[Room]-1 do	-- ����������ؼ�
		local HateTarget
		local AttackTarget = ReadRoleValue( Boss3, EM_RoleValue_AttackTargetID );	-- �g���F�Ϊ���e�ؼ�
		if not g_BossList[Room].BossIsDead[1] then
	--	if ReadRoleValue( Boss1, EM_RoleValue_IsDead ) == 0 and CheckID( Boss1 ) then	-- ��h�A���ئs�b�ɡA����C��H�h�A���ج���
			HateTarget = HateListInfo( Boss1, i , EM_HateListInfoType_GItemID );
		else
			HateTarget = HateListInfo( Boss3, i , EM_HateListInfoType_GItemID );
		end
		if HateTarget ~= AttackTarget then	-- �ư��g���F�Ϊ���e�ؼ�
			table.insert( HateList, HateTarget );
		end 
	end

	for i = 1, g_MagicID.TerrorArrowTargetsCount do
		local Count = #HateList;
		if Count == 0 then
			break;
		end
	--	DebugMsg( 0, 0, "TargetsCount = "..Count );
		local Target = table.remove( HateList, math.random(#HateList) );	-- �H�� 2 �W�����ƪ��ؼ�
		SysCastSpellLv( Boss3, Target, g_MagicID.TerrorArrow, 0 );
	end
	return true;
end

function Zone_166_Boss2_Stage4_Fight( Boss0, Boss1, Boss3, Control, Room )	-- ���q�|

	local ShowPos	-- ��Ԩ����n����m
	local Dir

	if CheckID( Boss1 ) then	-- �q�h�A���ت���m�n��
		ShowPos = Vector_GetRolePos( Boss1 );
		Dir = ReadRoleValue( Boss1, EM_RoleValue_Dir );
		DebugMsg( 0, 0, "Stage4 Boss1 Pos" );
	elseif CheckID( Boss3 ) then	-- �q�g���F�Ϊ���m�n��
		ShowPos = Vector_GetRolePos( Boss3 );
		Dir = ReadRoleValue( Boss3, EM_RoleValue_Dir );
		DebugMsg( 0, 0, "Stage4 Boss3 Pos" );
	else	-- �q����������m���͡A���b
		ShowPos = Vector_GetRolePos( Control );
		Dir = ReadRoleValue( Control, EM_RoleValue_Dir );
		DebugMsg( 0, 0, "Stage4 Control Pos" );
	end

	local MaxHp = ReadRoleValue( Boss0, EM_RoleValue_MaxHP );
        	WriteRoleValue( Boss0, EM_RoleValue_HP, MaxHp/10 );	-- �N��Ԩ������ͩR�]�� 10%

	SetPos( Boss0, ShowPos.X, ShowPos.Y, ShowPos.Z, Dir );
	SetModeEx( Boss0, EM_SetModeType_Show, true );	-- ���
	SetModeEx( Boss0, EM_SetModeType_Mark, true );	-- �аO
	SetModeEx( Boss0, EM_SetModeType_Fight, true );	-- ���
	SetModeEx( Boss0, EM_SetModeType_Mark, true );	-- �аO
	SetModeEx( Boss0, EM_SetModeType_Move, true );	-- ����
	SetModeEx( Boss0, EM_SetModeType_Searchenemy, true );	-- ����
	SysCastSpellLv( Boss0, Boss0, g_MagicID.Act, 0 );	-- ��t�S��
end

function MagicBase_500488_CheckUse()	-- �N�ۤv�q�Q�]�𪺳s��������

	local Owner = OwnerID();
	local Target = TargetID();

	if Target == Owner then
	--	DebugMsg( 0, 0, "fasle" );
		return false;
	end
--	DebugMsg( 0, 0, "true" );
	return true;
end

function Zone_166_Boss2_FrontDoor()	-- �e��

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	SetDefIdleMotion( Owner, ruFUSION_MIME_IDLE_STAND );
	while true do
		Sleep(10);
		if g_Door[Room] == 0 then	-- ���}�԰�
			SetModeEx( Owner, EM_SetModeType_show, false );	-- ���
			SetModeEx( Owner, EM_SetModeType_Obstruct, false );	-- ����
		elseif g_Door[Room] == 1 then	-- �i�J�԰�
			SetModeEx( Owner, EM_SetModeType_show, true );
			SetModeEx( Owner, EM_SetModeType_Obstruct, true );
		elseif g_Door[Room] == 2 then	-- ������Ԩ�����A����}���C
			PlayMotionEX( Owner, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP );
		--	break;
		end
	end
end

function Zone_166_Boss2_BackDoor()	-- ���

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	SetDefIdleMotion( Owner, ruFUSION_MIME_IDLE_STAND );
	while true do
		sleep(10);
		if g_Door[Room] == 2 then	-- ������Ԩ�����A����}���C
			PlayMotionEX( Owner, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN, ruFUSION_ACTORSTATE_ACTIVATE_LOOP );
		--	break;
		end
	end
end