-- ���ʦ��Ĭ�
--/gm ? zone 219 0 -1982.0 466.3 70.6
local g_Msg = {};
g_Msg.BeginCastSafeArea = "[$MUTE]".."[SC_MIRRORWORLD_SARO_01]";	-- �K�I�ڭ̨Ӥ��ɽ֥��]��w���a�I�a�I
g_Msg.WinTheRace = "[$MUTE]".."[SC_MIRRORWORLD_SARO_02]";	-- �O...�O�o�N�A�o���O�����A��...
g_Msg.LostTheRace = "[$MUTE]".."[SC_MIRRORWORLD_SARO_03]";	-- �H��H�I�ڤ~���O�]���]Ĺ�F�Ӷ}�ߩO�C

local g_Magic = {};	-- �k�N���X�M��
-- ��ƳN
g_Magic.Thorns = {};
g_Magic.Thorns.WarningTime = 10;	-- �ˮ`�e���wĵ�ɶ�(���:0.1 ��)
g_Magic.Thorns.CastID = 852291;	-- �I�kID
g_Magic.Thorns.CastTime = 10;	-- �I�k�ɶ�(���:0.1��)
g_Magic.Thorns.AttackID = 852295;	-- �ˮ`ID
g_Magic.Thorns.TickCount = 5;	-- �C���I�񪺪i���`��
g_Magic.Thorns.TickDelayTime = 5;	-- �C�i�������j�ɶ�(���:0.1 ��)
g_Magic.Thorns.OffsetDis = 20;	-- �C�i���I��ɻP�ؼЦ�m�������q
g_Magic.Thorns.CD = 8;	-- �N�o�ɶ�(���:1 ��)

-- �D�r�N
g_Magic.SnakeBite = {};
g_Magic.SnakeBite.CastID = 852292;	-- �I�kID
g_Magic.SnakeBite.AttackID = 852293;	-- �ˮ`ID
g_Magic.SnakeBite.TickCount = 5;	-- �C���I��ɷ|�I��X�i��
g_Magic.SnakeBite.TickTime = 2;	-- �C�Ӫi�������j�ɶ�
g_Magic.SnakeBite.RandomDis = 25;	-- �C�өY���I���m�P SafeAreaObj �����j�Z��

-- �w���a�a
g_Magic.SafeArea = {};
g_Magic.SafeArea.GuideActID = 491160;	-- �ɤޯS�ġA�N����ު��a���ʦܦw���a�a

-- ���F��
g_Magic.SoundOfTheAncients = {};
g_Magic.SoundOfTheAncients.CastID = 852294;	-- �I�kID
g_Magic.SoundOfTheAncients.CastTime = 10;	-- �I�k�ɶ�(���:0.1��)
g_Magic.SoundOfTheAncients.TriggerRange = 10;	-- �I�k�ɶ�(���:0.1��)

-- �G���N ( �缾�aĲ�o�ĪG���U�����v�g�� function �� )
g_Magic.CurseBind = {};
g_Magic.CurseBind.CastIDWithPlayer = 852305;	-- �缾�a���I�kID
g_Magic.CurseBind.CastIDWithSaro = 852306;	-- ���Ĭ����I�kID
g_Magic.CurseBind.AttackID = 852296;	-- �ˮ`ID(��׳N)

local g_Buff = {};	-- �򥻪k�N�M��
g_Buff.Thorns = {};
g_Buff.SafeArea = {};
g_Buff.CurseBind = {};

--g_Buff.UnRecoverHp = 502707;	-- ����۰ʦ^��A�קK�������Ī�����ֳt�^��C

g_Buff.Thorns.WarningActID = 623261;	-- ��ƳN�wĵID
g_Buff.SafeArea.CastID = 623262;	-- �w���a�aID
g_Buff.CurseBind.PowerLevel = 626296;	-- �G���N�h��
g_Buff.CurseBind.RegularlyCheck = 623235;	-- �G���N�w���ˬd&����
g_Buff.CurseBind.RootID = 626298;	-- ����N
g_Buff.CurseBind.RootTime = 2;	-- ����N����ɶ�( ���:1�� )
g_Buff.CurseBind.WeakID = 626299;	-- �L�O�N
g_Buff.CurseBind.WeakTime = 3;	-- �L�O�N����ɶ�( ���:1�� )

local g_LeaveFightTime = 6;	-- 6��W�h�A�����԰����ɶ�
local g_SaroIsRunning = {};	-- �O���U�h(Room)���Ĭ��O�_���b�b�]��
local g_SaroAttackTarget = {};	-- �O���U�h(Room)���Ĭ������ؼ�
local g_HateList = {};	-- �O���U�h(Room)���Ĭ������

local g_Obj = {};	-- ����M��
-- �Ĭ�
g_Obj.Saro = {};	-- �O���U�h(Room)���Ĭ�
g_Obj.Saro.Clone = {};
g_Obj.Saro.CloneID = 124323;	-- �Ĭ������A�Ѥ����Ӱ���b�]�ܦw���a�a���@���A�קK���a���Ƭݨ����}�԰��B�i�J�԰������ܰT��

-- �w���a�a
g_Obj.SafeArea = {};	-- �O���U�h(Room)���w���a�a
g_Obj.SafeArea.RunningDelayTime = 5;	-- �Ĭ������b�]�ܦw���a�a�e������ɶ��A�����a�m���b�]���ɶ�
g_Obj.SafeArea.LiveTime = 50;	-- �w���a�a���᪺ͫ�s���ɶ�
g_Obj.SafeArea.TriggerRange = 10;	-- �w���a�a��Ĳ�o�d��

-- ���F
g_Obj.Ancient = {};	-- ���F
g_Obj.Ancient.ID = 124320;	-- ����ID
g_Obj.Ancient.CreateCount = 5;	-- �C���l�ꪺ�ƶq
g_Obj.Ancient.NowCount = {};	-- �O���U�h��e����W���ƶq
g_Obj.Ancient.MaxCount = 25;	-- ���W�l�ꪺ�̤j�ƶq
g_Obj.Ancient.Dis = 25;	-- �l��ɻP�Ĭ������j�Z��
g_Obj.Ancient.MoveDelayTime = 10;	-- �l���}�l���ʫe������ɶ��A���F���ʫ�~�|���I�k�@��

local function GetAttackTarget( Saro, HateList )	-- ���o�Ĭ����������a�ؼ�

	local Target = false;
	for i = 0, HateListCount( Saro )-1 do
		local AttackTarget = HateListInfo( Saro, i, EM_HateListInfoType_GItemID );
		if ReadRoleValue( AttackTarget, EM_RoleValue_IsPlayer ) == 1 then
			Target = AttackTarget;
			break;
		end
	end
	return Target
end

local function GetRandomPos( Obj, Room )	-- �w���a�a���H���إߦ�m

	local ObjPos = Vector_GetRolePos( Obj );
	local CheckLineAngles = { 0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330 };	-- �N�ꨤ�ק����A�C�����u�ˬd������
	local MinDis =100;	-- �̪�Z��
	local MaxDis =150;	-- �̻��Z��
	local PosList = {};
	local CreatePos = ObjPos;

	for i = 1, #CheckLineAngles do	-- ���z�若�u�ˬd�q�L���I
		local VecDir = Vector_DirToVector( CheckLineAngles[i] );
		local TargetPos = ObjPos + VecDir * Math.Random( MinDis, MaxDis );
		TargetPos.Y = GetHeight( TargetPos.X, TargetPos.Y, TargetPos.Z );	-- Rom �������ˬd�A���X�k�ɷ|�^�ǭ��I
		if CheckLine( Obj, TargetPos.X, TargetPos.Y, TargetPos.Z ) then
			table.insert( PosList, TargetPos );
		end
	end

	if #PosList > 0 then
		CreatePos = PosList[ Math.random( #PosList ) ];
	end
	return CreatePos;
end

local function DelAllObj( Saro, Room )	-- �R���Ҧ�����A���Ĭ����͡B���`�P���}�԰��ɰ���

	-- �R�����W�J�����Ĭ�����
	if g_Obj.Saro.Clone[Room] and CheckID( g_Obj.Saro.Clone[Room] ) then	-- ���b�A�קK���W�]������]���Хͦ��Ĭ�����
		DelObj( g_Obj.Saro.Clone[Room] );
	end

	-- �R�����W�J�����w���a�a
	if g_Obj.SafeArea[Room] and CheckID(g_Obj.SafeArea[Room]) then
		DelObj( g_Obj.SafeArea[Room] );
	end
	
	-- �R�����W�J�������F
	if g_Obj.Ancient.NowCount[Room] and #g_Obj.Ancient.NowCount[Room] > 0 then
		for i = 1, #g_Obj.Ancient.NowCount[Room] do
			if CheckID( g_Obj.Ancient.NowCount[Room][i] ) then
				DelObj( g_Obj.Ancient.NowCount[Room][i] );
			end
		end
	end
	WriteRoleValue( Saro, EM_RoleValue_PID, 0 );
end

function MirrorWorld_109999_InitLua()	-- �Ĭ� ���󲣥ͼ@��

	local Saro = OwnerID();
	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );

	if g_Obj.Saro[Room] and CheckID( g_Obj.Saro[Room] ) then	-- ���b
		DelObj( g_Obj.Saro[Room] );
	end
	g_Obj.Saro[Room] = Saro;

	DelAllObj( Saro, Room );	-- ���b�A�R�����W�J������

	g_Obj.Saro.Clone[Room] = false;	-- �ŧi�Ĭ�����
	g_Obj.SafeArea[Room] = false;	-- �ŧi�w���a�a
end

function MirrorWorld_109999_Dead()	-- �Ĭ� ���`�@��

	local Saro = OwnerID();
	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );
	DelAllObj( Saro, Room );
	DebugMsg( 0, 0, "���`" );
end

function MirrorWorld_109999_LeaveFight()	-- �Ĭ� ���}�԰�

	local Saro = OwnerID();
	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );
	DelAllObj( Saro, Room );
--	CancelBuff_NoEvent( Saro, g_Buff.UnRecoverHp );	-- �R������۰ʦ^��
	DebugMsg( 0, 0, "�԰�����" );
end

function MirrorWorld_109999_BeginFight()	-- �Ĭ� �}�l�԰�

	local Saro = OwnerID();
	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );	
	g_SaroIsRunning[Room] = false;
	g_SaroAttackTarget[Room] = false;
	g_HateList[Room] = false;
	DebugMsg( 0, 0, "�԰��}�l" );

	if ReadRoleValue( Saro, EM_RoleValue_PID ) == 0 then	-- ���b�A�קK�ɶ]�ɦ]���жi�J�԰��A�ɭP Script Already Running �����D
	--	AddBuff( Saro, g_Buff.UnRecoverHp, 0, -1 );	-- ����۰ʦ^��
		if g_Obj.Ancient.NowCount[Room] and #g_Obj.Ancient.NowCount[Room] > 0 then	-- ���b�A�R���¦��s�b����W�����F
			for i = 1, #g_Obj.Ancient.NowCount[Room] do
				DelObj( g_Obj.Ancient.NowCount[Room][i] );
			end
		end
		g_Obj.Ancient.NowCount[Room] = {};
		WriteRoleValue( Saro, EM_RoleValue_PID, 1 );
		CallPlot( Saro, "MirrorWorld_109999_BeginFight_2", Saro, Room );
	end
end

function MirrorWorld_109999_BeginFight_2( Saro, Room )

--	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );
	local Counter = 0;	-- �԰��p�ƾ�
--	local LeaveFightTime = 0;

	while g_HateList[Room] ~= 0 do	-- �԰���
--	while LeaveFightTime < g_LeaveFightTime and ReadRoleValue( Saro, EM_RoleValue_IsDead ) == 0 do	-- ���Ĭ��S�����`�A�B�������԰���

		Counter = Counter + 1;

		-- �����԰��P�_
		g_HateList[Room] = HateListCount( Saro );
	--	if g_HateList[Room] == 0 and not g_SaroIsRunning[Room] then	-- ���Ĭ�������� 0 �H��
	--		LeaveFightTime = LeaveFightTime + 1;
	--		DebugMsg( 0, 0, "LeaveFightTime = "..LeaveFightTime );
	--	else
	--		LeaveFightTime = 0;	-- ��_�w�]�]�w
	--	end

		if not g_SaroAttackTarget[Room] then	-- ���o�������a�ؼ�
			g_SaroAttackTarget[Room] = GetAttackTarget( Saro );
		end

		-- ������ƳN���N�o�ɶ��A���Ĭ��]�����������a�ؼСB����H�� > 0 �Τ��b�b�]���A�U��
		if Counter%g_Magic.Thorns.CD == 0 and g_SaroAttackTarget[Room] and g_HateList[Room] > 0 and not g_SaroIsRunning[Room] then
		--	DebugMsg( 0, 0, "�I���ƳN" );
			CastSpellLV( Saro, g_SaroAttackTarget[Room], g_Magic.Thorns.CastID, 0 );
			Sleep(g_Magic.Thorns.CastTime);	-- �I�k��t�ɶ�
		end
		Sleep(10);
	end
end

function MagicBase_626310_Plot()	-- ��ƳN

	local Saro = OwnerID();	-- Boss
	local Target = TargetID();	-- �ؼЪ��a
	local Room = ReadRoleValue( Saro, EM_RoleValue_RoomID );

	local CtrlObj = Hao_CreateSpellObj( Target );	-- �b�ؼЦ�m�إߤ������A�åѤ������������@��
	CallPlot( CtrlObj, "MagicBase_626310_Plot2", CtrlObj, Saro, Target, Room );
end

function MagicBase_626310_Plot2( CtrlObj, Saro, Target, Room )	-- �إ߬I�k����

	local WaveCount = 0;	-- �ֿn�i��

	while WaveCount <= g_Magic.Thorns.TickCount do

		local TargetPos = Vector_GetRolePos( Target );	-- �ؼЦ�m
		local TargetDir = ReadRoleValue( Target, EM_RoleValue_Dir );
		local VecDir = Vector_DirToVector( TargetDir+Math.Random( 360) );	-- ������V�q
		TargetPos = TargetPos + VecDir * g_Magic.Thorns.OffsetDis;	-- �����q
		local CastObj = Hao_CreateSpellObjbyPos( TargetPos );	-- �b�ؼЦ�m�إ߬I�k����
		CallPlot( CastObj, "MagicBase_626310_Plot3", CastObj, Saro, Target, WaveCount, Room );
		WaveCount = WaveCount + 1;
		Sleep( g_Magic.Thorns.TickDelayTime );
	end
end

function MagicBase_626310_Plot3( CastObj, Saro, Target, WaveCount, Room )

--	Sleep(g_Magic.Thorns.TickDelayTime*WaveCount);
--	DebugMsg( 0, 0, "DelayTime = "..g_Magic.Thorns.TickDelayTime*WaveCount );
	AddBuff( CastObj, g_Buff.Thorns.WarningActID, 0, 1 );	-- �wĵ�S��
	Sleep( g_Magic.Thorns.WarningTime );
	SysCastSpellLv( Saro, CastObj, g_Magic.Thorns.AttackID, 0 );	-- �ˮ`

	if WaveCount == g_Magic.Thorns.TickCount and g_HateList[Room] > 0 then	-- �I�񧹯�ƳN��A�}�l�I��w���a�a
		local SafeAreaPos = GetRandomPos( Saro, Room );	-- �H���q�i�إߦw���a�a���ѷ��I����X�@�I
		local TargetPos = Vector_GetRolePos( Target );
		local Distance = (TargetPos - SafeAreaPos):Len();

	--	DebugMsg( 0, 0, "SafeAreaPos = "..tostring( SafeAreaPos ) );
		local SafeAreaObj = Hao_CreateSpellObjbyPos( SafeAreaPos, 0, 60 );	-- �b���I�إ߬I�k����( ��m�B���סB�ͦs�ɶ�( ���:1�� ) )

		if g_Obj.SafeArea[Room] and CheckID( g_Obj.SafeArea[Room] ) then	-- ���b�A�קK���W�]������]���Хͦ��w���a�a
			DelObj( g_Obj.SafeArea[Room] );
		end
		g_Obj.SafeArea[Room] = SafeAreaObj;

		local SaroPos = Vector_GetRolePos( Saro );
		local SaroDir = ReadRoleValue( Saro, EM_RoleValue_Dir );
		SaroDir = SaroDir + 180;	-- �ۤϭ��V
		if SaroDir > 360 then SaroDir = SaroDir - 360 end
		local CloneSaro = CreateObj( g_Obj.Saro.CloneID, SaroPos.X, SaroPos.Y, SaroPos.Z, SaroDir, 1 );
		SetModeEx( CloneSaro, EM_SetModeType_HideName, true );	-- ����ܦW��
		SetModeEx( CloneSaro, EM_SetModeType_Mark, false );	-- �аO
		AddToPartition( CloneSaro, Room );
		SysCastSpellLv( CloneSaro, SafeAreaObj, g_Magic.SafeArea.GuideActID, 0 );	-- �ɤޯS��
		SysCastSpellLv( Target, SafeAreaObj, g_Magic.SafeArea.GuideActID, 0 );	-- �ɤޯS��

		ScriptMessage( Saro, -1, 3, g_Msg.BeginCastSafeArea, 0 );

		local DelayAddBuffTime = Math.Ceil( Distance/200*10 );
	--	DebugMsg( 0, 0, "�w���a�a������ܯS�Ī��ɶ� = "..DelayAddBuffTime );
		Sleep( DelayAddBuffTime+5 );

		if g_HateList[Room] == 0 then
			DelAllObj( Saro, Room );
			return;
		end
		AddBuff( SafeAreaObj, g_Buff.SafeArea.CastID, 0, -1 );

		if g_Obj.Saro.Clone[Room] and CheckID( g_Obj.Saro.Clone[Room] ) then	-- ���b�A�קK���W�]������]���Хͦ��Ĭ�����
			DelObj( g_Obj.Saro.Clone[Room] );
		end
		g_Obj.Saro.Clone[Room] = CloneSaro;
		CallPlot( SafeAreaObj, "MirrorWorld_Saro_RuntoSafeArea", SafeAreaObj, SafeAreaPos, Saro, CloneSaro, Target, Room );
	end
end

function MirrorWorld_Saro_RuntoSafeArea( SafeAreaObj, SafeAreaPos, Saro, CloneSaro, Target, Room )

	local Distance = 0;
	local RunningTime = false;
	local Counter = 0;	-- �p�ƾ�

	while Counter < g_Obj.SafeArea.LiveTime do
		if Counter == g_Obj.SafeArea.RunningDelayTime then	-- �Ĭ������b�]�ܦw���a�a�e������ɶ�
			g_SaroIsRunning[Room] = true;
			RunningTime = MoveDirect( CloneSaro, SafeAreaPos.X, SafeAreaPos.Y, SafeAreaPos.Z );
		--	DebugMsg( 0, 0, "�b�]�ɶ� = "..RunningTime );
		end
		
	--	DebugMsg( 0, 0, "�b�]�@�� �ɶ� = "..Counter..", �Z�����a = "..GetDistance( SafeAreaObj, Target )..", �Z���Ĭ� = "..GetDistance( SafeAreaObj, CloneSaro ) );
		if CheckID( Target ) and GetDistance( SafeAreaObj, Target ) < g_Obj.SafeArea.TriggerRange then	-- �ؼЪ��a�s�b�A�B�b�w���a�a��Ĳ�o�d�򤺮�
		--	Say( Target, "I'm winner!" );
			return MirrorWorld_Saro_SnakeBite( SafeAreaObj, Target, Saro, CloneSaro, Room, 1 );
		elseif GetDistance( SafeAreaObj, CloneSaro ) < g_Obj.SafeArea.TriggerRange then
		--	Say( Saro, "I'm winner!" );
			return MirrorWorld_Saro_SnakeBite( SafeAreaObj, Target, Saro, CloneSaro, Room, 2 );
		end
		Sleep(1);
		Counter = Counter + 1;
	end
--	DebugMsg( 0, 0, "�w���a�a�۰ʮ���" );
	return MirrorWorld_Saro_SnakeBite( SafeAreaObj, Target, Saro, CloneSaro, Room, 3 );
end

function MirrorWorld_Saro_SnakeBite( SafeAreaObj, Target, Saro, CloneSaro, Room, Mode )

	StopMove( CloneSaro, false );
	CancelBuff_NoEvent( SafeAreaObj, g_Buff.SafeArea.CastID );

	local AttackTarget
	local Lv = 4;	-- �w�]������ 5% �ͩR

	if Mode == 1 then	-- ���aĹ
		DebugMsg( 0, 0, "���a�m���ܦw���a�a�A�����Ĭ�" );
		AttackTarget = Saro;
		Lv = 1;
		AdjustFaceDir( CloneSaro, Saro, 0 );
		ScriptMessage( Saro, -1, 3, g_Msg.WinTheRace, 0 );
	elseif Mode == 2 then	-- �Ĭ�Ĺ
		DebugMsg( 0, 0, "�Ĭ��m���ܦw���a�a�A�������a" );
		AttackTarget = Target;
		AdjustFaceDir( CloneSaro, AttackTarget, 0 );
		ScriptMessage( Saro, -1, 3, g_Msg.LostTheRace, 0 );
	elseif Mode == 3 then	-- �ɭ����S�H�]�ܦw���a�a�N�������a
		DebugMsg( 0, 0, "�ɭ������S�H�]�ܦw���a�a�A�������a" );
		AttackTarget = Target;
		AdjustFaceDir( CloneSaro, AttackTarget, 0 );
		ScriptMessage( Saro, -1, 3, g_Msg.LostTheRace, 0 );
	end

	Sleep(5);	-- ��V�ɶ�
	PlayMotion( CloneSaro, ruFUSION_ACTORSTATE_CAST_SP01 );
	Sleep(10);	-- ��t�ʧ@�ɶ�
	WriteRoleValue( SafeAreaObj, EM_RoleValue_PID, Lv );	-- ��I�k���żg�J�z������
	DelObj( CloneSaro );

	if CheckID(Target) then
		g_SaroIsRunning[Room] = false;
	end

	-- �I��D�r�N
	if g_HateList[Room] == 0 then	-- �I��e�ˬd
		return
	end

	local SafeAreaObjPos = Vector_GetRolePos( SafeAreaObj );
	for i = 1, g_Magic.SnakeBite.TickCount do
		Sleep(g_Magic.SnakeBite.TickTime);
		local VecDir = Vector_DirToVector( Math.Random( 360 *  i/g_Magic.SnakeBite.TickCount ) );
		local TargetPos = SafeAreaObjPos + VecDir * g_Magic.SnakeBite.RandomDis ;
		SetPos( SafeAreaObj, TargetPos.X, TargetPos.Y, TargetPos.Z, 0 );	-- �s�y�D�s�q�|����«�ӨӪ��ĪG
	--	DebugMsg( 0, 0, "No,"..i..", �I��D�r�N" );
		SysCastSpellLv( SafeAreaObj, AttackTarget, g_Magic.SnakeBite.CastID, 0 );	-- �ѳz������I�񭸦�S�ġA�A�� Boss ����ˮ`
	end
	CallPlot( Saro, "MirrorWorld_Saro_SoundOfTheAncients", Saro, Room );	-- �}�l�I���F��

	Sleep(100);	-- 10 ���R���w���a�a
	DelObj( SafeAreaObj );
end

function MirrorWorld_Saro_SoundOfTheAncients( Saro, Room )	-- ���F��

	CastSpellLV( Saro, Saro, g_Magic.SoundOfTheAncients.CastID, 0 );
	Sleep( g_Magic.SoundOfTheAncients.CastTime+5 );	-- ����t�h���@�|

	if g_HateList[Room] == 0 then
		return false;
	end

	if #g_Obj.Ancient.NowCount[Room] > 0 then	-- �C���I���F���ɡA���㯪�F�M�椤�A�R���L�Ī����F�C
		for i = #g_Obj.Ancient.NowCount[Room], 1, -1 do
			if not CheckID(g_Obj.Ancient.NowCount[Room][i]) then
				table.remove( g_Obj.Ancient.NowCount[Room], i );
			end
		end
	end

	local SaroPos = Vector_GetRolePos( Saro );
	local SaroDir = ReadRoleValue( Saro, EM_RoleValue_Dir );

	-- �l�ꯪ�F
	for i = 1, g_Obj.Ancient.CreateCount do
		if #g_Obj.Ancient.NowCount[Room] >= g_Obj.Ancient.MaxCount then
			local FirstAncient = table.remove( g_Obj.Ancient.NowCount[Room], 1 );		-- �̦��X�{�����F
			DelObj( FirstAncient );
		end
		local AncientDir = SaroDir + 360 * ( i/g_Obj.Ancient.CreateCount ) ;
		local SaroVecDir = Vector_DirToVector( AncientDir + 90 );
		local AncientPos = SaroPos + SaroVecDir * g_Obj.Ancient.Dis;
		local Ancient = CreateObj( g_Obj.Ancient.ID, AncientPos.X, AncientPos.Y+10, AncientPos.Z, AncientDir, 1 );
		MoveToFlagEnabled( Ancient, false );
		SetModeEx( Ancient, EM_SetModeType_Gravity, false );
		SetModeEx( Ancient, EM_SetModeType_Fight, false );
		SetModeEx( Ancient, EM_SetModeType_Searchenemy, false );
		SetModeEx( Ancient, EM_SetModeType_Strikback, false );
		SetModeEx( Ancient, EM_SetModeType_Mark, false );
		AddToPartition( Ancient, Room );
		table.insert( g_Obj.Ancient.NowCount[Room], Ancient );
		CallPlot( Ancient, "MirrorWorld_Saro_Ancient_Init", Ancient, Saro, Room );
	end
	DebugMsg( 0, 0, "���F�`�� = "..#g_Obj.Ancient.NowCount[Room] );
end

function MirrorWorld_Saro_Ancient_Init( Ancient, Saro, Room )	-- ���F��

	Sleep( g_Obj.Ancient.MoveDelayTime );	-- �l���}�l���ʫe������ɶ��A���F���ʫ�~�|���I�k�@��

	local Player = g_SaroAttackTarget[Room]	-- �Ĭ��������ؼЪ��a
	local MoveToNextPos = false;
	local VecDir
	local TargetPos

	while true do
		if not MoveToNextPos then
			MoveToNextPos = true;
			local SaroPos = Vector_GetRolePos( Saro );
			SaroPos.Y = SaroPos.Y + 10;
			VecDir = Vector_DirToVector( Math.Random(360) );
			TargetPos = SaroPos + VecDir * Math.Random( 0, 150 );
		--	Move( Ancient, TargetPos.X, TargetPos.Y, TargetPos.Z );
			MoveDirect( Ancient, TargetPos.X, TargetPos.Y, TargetPos.Z );
		else
			local AncientPos = Vector_GetRolePos( Ancient );
		--	DebugMsg( 0, 0, "Ancient Pos = "..tostring( AncientPos ) );
			if ( AncientPos - TargetPos ):Len() < 5 then
				MoveToNextPos = false;
			end
		end
		-- �ŦXĲ�o����ɡA�u���P�_�Ĭ�
		if GetDistance( Ancient, Saro ) < g_Magic.SoundOfTheAncients.TriggerRange then
			DebugMsg( 0, 0, "���F, �a���Ĭ� = "..GetDistance( Ancient, Saro ) );
			SysCastSpellLv( Saro, Saro, g_Magic.CurseBind.CastIDWithSaro, 0 );
		--	Say( Saro, "Hit Saro" );
			break;
		elseif GetDistance( Ancient, Player ) < g_Magic.SoundOfTheAncients.TriggerRange then
			DebugMsg( 0, 0, "���F, �a�񪱮a = "..GetDistance( Ancient, Player ) );
			SysCastSpellLv( Saro, Player, g_Magic.CurseBind.CastIDWithPlayer, 0 );
		--	Say( Player, "Hit Me" );
			break;
		end
		Sleep(2);
	end
	DelObj( Ancient );
end

function MagicBase_623263_Plot()	-- �D�r�N�ˮ`

	local Owner = OwnerID();	-- �z������
	local Target = TargetID();	-- ���a���Ĭ�
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Saro = g_Obj.Saro[Room];	-- �Ĭ�
	local Lv = ReadRoleValue( Owner, EM_RoleValue_PID );

--	DebugMsg( 0, 0, "�D�r���� = "..Lv+1 );
	if CheckID( Saro ) and ReadRoleValue( Saro, EM_RoleValue_IsDead ) == 0 then
		SysCastSpellLv( Saro, Target, g_Magic.SnakeBite.AttackID, Lv );	-- ��Boss����ˮ`
	end
end

function MagicBase_623236_Plot()	-- �G���N �w�ɰ���üƮĪG

	local Owner = OwnerID();

	if not CheckBuff( Owner, g_Buff.CurseBind.PowerLevel ) then	-- ���a���W�S���G���N���h�N�ɡA�R���w�ɰ���Buff�A�ô������X�ˬd
		CancelBuff_NoEvent( Owner, g_Buff.CurseBind.RegularlyCheck );
		return;
	end

	-- �U�ĪG���v�A�ѼƬ��ֶi���v
	local Odds = {};
	Odds.Attack = 500;	-- ��׳N
	Odds.Root = 750;	-- ����N
	Odds.Weak = 1000;	-- �L�O�N

	local Random = Math.Random( 0, 1000 ); 
	if Random <= 500 then	-- ��׳N
		local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
		local Saro = g_Obj.Saro[Room];	-- �Ĭ�
		SysCastSpellLv( Saro, Owner, g_Magic.CurseBind.AttackID, 0 );	-- �I�s�Ĭ��缾�a�I���׳N
	elseif Random <= 750 then	-- ����N
		AddBuff( Owner, g_Buff.CurseBind.RootID, 0, g_Buff.CurseBind.RootTime );
	else	-- �L�O�N
		AddBuff( Owner, g_Buff.CurseBind.WeakID, 0, g_Buff.CurseBind.WeakTime );
	end

	local BuffLv = Lua_Hao_Return_Buff_Lv( Owner, g_Buff.CurseBind.PowerLevel );	-- �G���N���h��
	CancelBuff_NoEvent( Owner, g_Buff.CurseBind.PowerLevel );
	if BuffLv > 0 then
		BuffLv = BuffLv - 1;
		AddBuff( Owner, g_Buff.CurseBind.PowerLevel, BuffLv, -1 );
	end
end