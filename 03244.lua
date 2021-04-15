------------------------------------------------------------------
-- Z34�ƥ�
-- Boss 1
-- �׭^���h�p��
------------------------------------------------------------------

---------------------------------�����ܼƳ]�w---------------------------------
--NPC
local g_Door_GUID = 106249	--���ת�����s��
local g_Boss_GUID = {};
g_Boss_GUID[ 1 ] = { 106256 , 107353 , 107383 };		--�k����
g_Boss_GUID[ 2 ] = { 106257 , 107354 , 107384 };		--�����
g_Boss_GUID[ 3 ] = { 106258 , 107355 , 107385 };		--���ת�
local g_Treasure_GUID = { 101378 , 107352 , 107382 };	--�p���ԧQ�~
local g_RandFormat = { 1 , 3 };							--�H���}������ܽd��]��K���եΡ^

local g_FormationTime = 30;	--�}�������ɶ�
local g_RevivalTime = 30;	--���`�_���ɶ�

local g_Skill = {}; 
--�q�Ϊ��A
g_Skill.BuffID_LockHpBuff = 502707;	--����۰ʦ^��A�קK�������Ī�����ֳt�^��C
g_Skill.BuffID_Avengers = 503452;	--�_����
g_Skill.BuffID_Frenzy = 503281;		--�g�ɡG�����F��
g_Skill.FrenzyTime = { 480 , 360 , 9999999 };	--�g�ɮɶ�

--Boss��¦�k�N
g_Skill.Boss1 = {};	--�k����
g_Skill.Boss1.SkillID = 493181;			--�p���gŧ
g_Skill.Boss1.CD = 10;					--�p���gŧ - �k�N�N�o
g_Skill.Boss1.ObjID = 107349;			--�p���gŧ - �z���y����
g_Skill.Boss1.BuffID_Show = 509880;		--�p���gŧ - ��t�S��
g_Skill.Boss1.SkillID_Dmg = 493182;		--�p���gŧ - �ˮ`�k�N
g_Skill.Boss1.Interval = 0.2;			--�p���gŧ - �ˮ`�k�N�I�i���j
g_Skill.Boss1.DmgCount = 10;			--�p���gŧ - �ˮ`�k�N�I�i����
g_Skill.Boss1.SkillLv = { 2 , 1 , 0 };	--�p���gŧ - �k�N����


g_Skill.Boss2 = {};	--�����
g_Skill.Boss2.SkillID = 493228;			--���K�`��
g_Skill.Boss2.CD = 3;					--���K�`�� - �k�N�N�o
g_Skill.Boss2.SkillLv = { 2 , 1 , 0 };	--���K�`�� - �k�N����

g_Skill.Boss3 = {}	--���ת�
g_Skill.Boss3.SkillID = 495032;			--�_�a��
g_Skill.Boss3.CD = 7;					--�_�a�� - �k�N�N�o

--�}������
g_Skill.FormationA = {};	--���v�}
g_Skill.FormationA.SkillID_FlashDmg = 493335;		--���v�ϯ�
g_Skill.FormationA.SkillID_FlashCharge = 492352;	--���v�ľW
g_Skill.FormationA.CD = 3;							--���v�ľW - �k�N�N�o

g_Skill.FormationB = {};	--�H���}
g_Skill.FormationB.SkillID_Thunder = 494574;		--��p�O��
g_Skill.FormationB.SkillID_Fire = 495079;			--���K�Q�g
g_Skill.FormationB.ObjID_Thunder = 107350;			--��p�O�� - �z���y����
g_Skill.FormationB.ObjID_Fir = 107351;				--���K�Q�g - �z���y����
g_Skill.FormationB.BuffID_Thunder_Dmg = 500287;		--��p�O�� - ����s�y�ˮ`���A
g_Skill.FormationB.BuffID_Fire_Dmg = 503997;		--���K�Q�g - ����s�y�ˮ`���A
g_Skill.FormationB.Time_Thunder = 3;				--��p�O�� - ����ɶ�
g_Skill.FormationB.Time_Fire = 1;					--���K�Q�g - ����ɶ�
g_Skill.FormationB.SkillLv_Thunder = { 2 , 1 , 0 };	--��p�O�� - �k�N����
g_Skill.FormationB.SkillLv_Fire = { 2 , 1 , 0 };	--���K�Q�g - �k�N����

g_Skill.FormationC = {};	--�o�ް}
g_Skill.FormationC.BuffID_Shield = 503544;			--�o�޾��@
g_Skill.FormationC.SkillID_LineShow = 493325;		--���p�o�� - �R��
g_Skill.FormationC.SkillID_LineDmg = 493326;		--���p�o�� - �ˮ`
g_Skill.FormationC.CD = 6;							--���p�o�� - �k�N�N�o
g_Skill.FormationC.BuffID_Charged = 503543;			--�o�ޥR��
g_Skill.FormationC.ChargedMax = 10;					--�o�ޥR�ධ���񵵵K�I�Ҫ��h��
g_Skill.FormationC.SkillID_Burn = 495290;			--���K�I��
g_Skill.FormationC.SkillLv_LineDmg = { 2 , 1 , 0 };	--���p�o�� - �k�N����
g_Skill.FormationC.SkillLv_Burn = { 2 , 1 , 0 };	--���K�I�� - �k�N����

g_Skill.FormationD = {};	--�T���}
g_Skill.FormationD.BuffID_01 = 500865;			--�T���} - �k����
g_Skill.FormationD.BuffID_02 = 500866;			--�T���} - �����
g_Skill.FormationD.BuffID_03 = 500867;			--�T���} - ���ת�
g_Skill.FormationD.BuffID_Invincible = 500868;	--�L��
g_Skill.FormationD.BuffID_Hot = 500869;			--�A��
g_Skill.FormationD.SkillID_Fire = 495102;		--���K�j��
g_Skill.FormationD.SkillLv = { 2 , 1 , 0 };		--���K�j�� - �k�N����

--�g��
local g_FrenzyBuff = 503281;	--�g��Buff
local g_FrenzyTime = { 480 , 360 , 9999999 };		--�g�ɮɶ�

local g_FlagID = {};	--�㹳�X�l
g_FlagID.FlagID = 781423;		--Z34_1���κX��
g_FlagID.Boss = { 0 , 1 , 2 };	--Boss�����I
g_FlagID.Treasure = 3;			--�ԧQ�~�����I
g_FlagID.BeforeDoor = 11;		--�e�������I
g_FlagID.AfterDoor = 12;		--��������I
g_FlagID.FormationCenter = 100;	--�}�������I
g_FlagID.FormationList = { 101 , 102 , 103 , 104 , 105 , 106 , 107 , 108 , 109 , 110 , 111 , 112 };	--�}���I01~12

local g_FightSwitch = {};	--�԰��}���P�_
local g_Difficulty = {};	--�����ƥ�����
local g_Formation = {};		--�����ϥΤ����}��
--0�]�L�^
--1�]���v�}�^
--2�]�H���}�^
--3�]�o�ް}�^
--4�]�T���}�^
--5�]�}���ഫ���q�^
local g_RandFlagPos = {}	--�����}���I�g�üƱƧǫ᪺����
local g_Boss = {};			--����Boss������s��
g_Boss[ 1 ] = {};	--�k����
g_Boss[ 2 ] = {};	--�����
g_Boss[ 3 ] = {};	--���ת�
local g_BossAlive = {};	--�ΨӰO���T��Boss�O�_����
g_BossAlive[ 1 ] = {};	--�k����
g_BossAlive[ 2 ] = {};	--�����
g_BossAlive[ 3 ] = {};	--���ת�
local g_BossNowPos = {};	--�ΨӰO���T��Boss��e�ǰe���X�Ц�m
g_BossNowPos[ 1 ] = {};	--�k����
g_BossNowPos[ 2 ] = {};	--�����
g_BossNowPos[ 3 ] = {};	--���ת�
local g_HaveCast = {};	--�ΨӧP�_���v�ľW�B���p�o�ެO�_�w�I�i
g_HaveCast[ 1 ] = {};	--�k����
g_HaveCast[ 2 ] = {};	--�����
g_HaveCast[ 3 ] = {};	--���ת�
local g_LineDmg = {};	--�ΨӧP�_���p�o�ު��ˮ`�O�_���@��
g_LineDmg[ 1 ] = {};	--�k����
g_LineDmg[ 2 ] = {};	--�����
g_LineDmg[ 3 ] = {};	--���ת�

--�s���T��
local g_BossTalk = {};
g_BossTalk[ "FifhtBegin" ]	= "[LUA_106256_AI_FIGHTBEGIN]";				--�԰��}�l
g_BossTalk[ "BossWin" ]		= "[LUA_106256_AI_BOSSWIN]";				--�԰�����
g_BossTalk[ "BossDie" ]		= "[LUA_106256_AI_BOSSDEAD]";				--Boss���`
g_BossTalk[ "BossFrenzy" ]	= "[LUA_106256_AI_BOSSFRENZY]";				--Boss�g��
g_BossTalk[ "BossReBirth" ]	= "[LUA_106256_AI_BOSSREBIRTH][$SETVAR1=";	--Boss����
g_BossTalk[ "Formation1" ]	= "[LUA_106256_AI_FORMATION_1]";			--�Ұ����v�}
g_BossTalk[ "Formation2" ]	= "[LUA_106256_AI_FORMATION_2]";			--�ҰʸH���}
g_BossTalk[ "Formation3" ]	= "[LUA_106256_AI_FORMATION_3]";			--�Ұʲo�ް}
g_BossTalk[ "Formation4" ]	= "[LUA_106256_AI_FORMATION_4]";			--�ҰʤT���}

---------------------------------������ - �����P���q�B�z---------------------------------
function Z34_BOSS1_CtrlCenter_Begin()	--��l�@��
	local CtrlCenter = OwnerID();	--������
	local RoomID = ReadRoleValue( CtrlCenter , EM_RoleValue_RoomID );
	CallPlot( CtrlCenter , "Z34_BOSS1_CtrlCenter_Stage" , CtrlCenter , RoomID );	--������ - �����P���q�B�z
end
function Z34_BOSS1_CtrlCenter_Stage( CtrlCenter , RoomID )
	--���קP�_
	local ZoneID = ReadRoleValue( CtrlCenter , EM_RoleValue_ZoneID );
	if ZoneID == 180 then
		g_Difficulty[ RoomID ] = 3;	--²��
	elseif ZoneID == 179 then
		g_Difficulty[ RoomID ] = 2;	--���q
	else
		g_Difficulty[ RoomID ] = 1;	--�x��
	end	

	local Boss = { 0 , 0 , 0 };	
	local BeforeDoor;	--�e��
	local AfterDoor;	--���
	
	g_FightSwitch[ RoomID ] = false;	--�԰��}���P�_���]��false
	g_Formation[ RoomID ] = 0;			--�N�}���אּ�G0�]�L�^
	
	--�ͦ�Boss
	for i = 1 , 3 do
		Boss[ i ] = CreateObjByFlag( g_Boss_GUID[ i ][ g_Difficulty[ RoomID ] ] , g_FlagID.FlagID , g_FlagID.Boss[ i ] , 1 );
		SetModeEx( Boss[ i ] , EM_SetModeType_Mark , true );			--�I��(�O)
		SetModeEx( Boss[ i ] , EM_SetModeType_ShowRoleHead , true ); 	--�Y����(�O)
		SetModeEx( Boss[ i ] , EM_SetModeType_Fight , true );			--���(�O)
		SetModeEx( Boss[ i ] , EM_SetModeType_Strikback , true );		--����(�O)
		SetModeEx( Boss[ i ] , EM_SetModeType_Searchenemy , true );		--����(�O)
		SetModeEx( Boss[ i ] , EM_SetModeType_Move , true ); 			--����(�O)
		AddToPartition( Boss[ i ] , RoomID );
		g_Boss[ i ][ RoomID ] = Boss[ i ];	--�NBoss������s���g�^�����ܼƤ�
		g_BossAlive[ i ][ RoomID ] = true;		--�]�wBoss������
		SetPlot( Boss[ i ] , "dead" , "Z34_BOSS1_Boss_Dead" , 0 );			--Boss - ���`�������@��
	end
	if Zone ~= 941 then	Hao_antiHacker_Init( 1 );	end	--���b�ȷs��A���b���󲣥ͼ@���A�᭱��JBoss����
	
	--�ͦ����
	AfterDoor = CreateObjByFlag( g_Door_GUID , g_FlagID.FlagID , g_FlagID.AfterDoor , 1 )
	SetModeEx( AfterDoor , EM_SetModeType_HideName , false );		--��ܦW��(�_)
	SetModeEx( AfterDoor , EM_SetModeType_NotShowHPMP , false );	--��ܦ��(�_)
	SetModeEx( AfterDoor , EM_SetModeType_ShowRoleHead , false );	--�Y����(�_)
	SetModeEx( AfterDoor , EM_SetModeType_Mark , false );			--�I��(�_)
	SetModeEx( AfterDoor , EM_SetModeType_Fight , false );			--���(�_)
	SetModeEx( AfterDoor , EM_SetModeType_Strikback , false );		--����(�_)
	SetModeEx( AfterDoor , EM_SetModeType_Searchenemy , false );	--����(�_)
	SetModeEx( AfterDoor , EM_SetModeType_Move , false );			--����(�_)
	SetModeEx( AfterDoor , EM_SetModeType_Obstruct , true );		--����(�O)
	AddToPartition( AfterDoor , RoomID );
	
	while true do
	Sleep( 10 );
		if HateListCount( Boss[ 1 ] ) ~= 0 or HateListCount( Boss[ 2 ] ) ~= 0 or HateListCount( Boss[ 3 ] ) ~= 0 then	--����@��Boss��������H
			if g_FightSwitch[ RoomID ] == false then	--�԰��}�����}
				g_FightSwitch[ RoomID ] = true;			--�N�԰��}�����}
				CallPlot( CtrlCenter , "Z34_BOSS1_FormationCtrl" , CtrlCenter , RoomID );	--������ - �}������@��
				CallPlot( Boss[ 1 ] , "Z34_BOSS1_Boss_1_Fight" , Boss[ 1 ] , RoomID );		--�k���� - �԰��@��
				CallPlot( Boss[ 2 ] , "Z34_BOSS1_Boss_2_Fight" , Boss[ 2 ] , RoomID );		--����� - �԰��@��
				CallPlot( Boss[ 3 ] , "Z34_BOSS1_Boss_3_Fight" , Boss[ 3 ] , RoomID );		--���ת� - �԰��@��
				ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "FifhtBegin" ] , 2 );	--�s��Boss�}��
				for i = 1 , 3 do	AddBuff( Boss[ i ] , g_Skill.BuffID_LockHpBuff , 0 , -1 );	end	--���Ҧ�Boss����۰ʦ^HP�����A
				--1���԰��}�l���α����b��
				
				--�ͦ��e��
				BeforeDoor = CreateObjByFlag( g_Door_GUID , g_FlagID.FlagID , g_FlagID.BeforeDoor , 1 )
				SetModeEx( BeforeDoor , EM_SetModeType_HideName , false );		--��ܦW��(�_)
				SetModeEx( BeforeDoor , EM_SetModeType_NotShowHPMP , false );	--��ܦ��(�_)
				SetModeEx( BeforeDoor , EM_SetModeType_ShowRoleHead , false );	--�Y����(�_)
				SetModeEx( BeforeDoor , EM_SetModeType_Mark , false );			--�I��(�_)
				SetModeEx( BeforeDoor , EM_SetModeType_Fight , false );			--���(�_)
				SetModeEx( BeforeDoor , EM_SetModeType_Strikback , false );		--����(�_)
				SetModeEx( BeforeDoor , EM_SetModeType_Searchenemy , false );	--����(�_)
				SetModeEx( BeforeDoor , EM_SetModeType_Move , false );			--����(�_)
				SetModeEx( BeforeDoor , EM_SetModeType_Obstruct , true );		--����(�O)
				AddToPartition( BeforeDoor , RoomID );
			end
		end
	
		if HateListCount( Boss[ 1 ] ) == 0 and HateListCount( Boss[ 2 ] ) == 0 and HateListCount( Boss[ 3 ] ) == 0	--�Ҧ�Boss�������S�H
		and g_Formation[ RoomID ] ~= 5 and g_FightSwitch[ RoomID ] == true then	--�}�����O�b 5�]�}���ഫ���q�^�A�԰��}���w�}
			sleep( 10 );
			--����1���A���P�_�A�קK��n�J�W�}�����������٨S�W������
			if HateListCount( Boss[ 1 ] ) == 0 and HateListCount( Boss[ 2 ] ) == 0 and HateListCount( Boss[ 3 ] ) == 0	--�Ҧ�Boss�������S�H
			and g_Formation[ RoomID ] ~= 5 and g_FightSwitch[ RoomID ] == true then	--�}�����O�b 5�]�}���ഫ���q�^�A�԰��}���w�}
				if g_BossAlive[ 1 ][ RoomID ] == true or g_BossAlive[ 2 ][ RoomID ] == true or g_BossAlive[ 3 ][ RoomID ] == true then	--����@��BOSS�٦s��
					g_FightSwitch[ RoomID ] = false;	--�N�԰��}������
					Delobj( BeforeDoor );	--�R���e��
					ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "BossWin" ] , 2 );	--�s��Boss�ӧQ
					CallPlot( CtrlCenter , "Z34_BOSS1_CtrlCenter_Clear" , CtrlCenter , RoomID );	--������ - �M���@��
					sleep( 50 );
					
					--���mBoss
					for i = 1 , 3 do
						Boss[ i ] = CreateObjByFlag( g_Boss_GUID[ i ][ g_Difficulty[ RoomID ] ] , g_FlagID.FlagID , g_FlagID.Boss[ i ] , 1 );
						SetModeEx( Boss[ i ] , EM_SetModeType_Mark , true );			--�I��(�O)
						SetModeEx( Boss[ i ] , EM_SetModeType_ShowRoleHead , true ); 	--�Y����(�O)
						SetModeEx( Boss[ i ] , EM_SetModeType_Fight , true );			--���(�O)
						SetModeEx( Boss[ i ] , EM_SetModeType_Strikback , true );		--����(�O)
						SetModeEx( Boss[ i ] , EM_SetModeType_Searchenemy , true );		--����(�O)
						SetModeEx( Boss[ i ] , EM_SetModeType_Move , true ); 			--����(�O)
						AddToPartition( Boss[ i ] , RoomID );
						g_Boss[ i ][ RoomID ] = Boss[ i ];	--�NBoss������s���g�^�����ܼƤ�
						g_BossAlive[ i ][ RoomID ] = true;		--�]�wBoss������
						SetPlot( Boss[ i ] , "dead" , "Z34_BOSS1_Boss_Dead" , 0 );			--Boss - ���`�������@��
					end
					if Zone ~= 941 then	Hao_antiHacker_Init( 1 );	end	--���b�ȷs��A���b���󲣥ͼ@���A�᭱��JBoss����
				end
			end
		end			
			
		if g_BossAlive[ 1 ][ RoomID ] == false and g_BossAlive[ 2 ][ RoomID ] == false and g_BossAlive[ 3 ][ RoomID ] == false then	--BOSS�Ҥw���`
			g_FightSwitch[ RoomID ] = false;	--�N�԰��}������
			Delobj( BeforeDoor );	--�R���e��
			Delobj( AfterDoor );	--�R�����
			ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "BossDie" ] , 2 );	--�s��Boss���`
			CallPlot( CtrlCenter , "Z34_BOSS1_CtrlCenter_Clear" , CtrlCenter , RoomID );	--������ - �M���@��
			local Treasure = CreateObjByFlag( g_Treasure_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID.FlagID , g_FlagID.Treasure , 1 );	--�ͦ��ԧQ�~
			SetModeEx( Treasure , EM_SetModeType_HideName , false );		--��ܦW��(�_)
			SetModeEx( Treasure , EM_SetModeType_NotShowHPMP , false );		--��ܦ��(�_)
			SetModeEx( Treasure , EM_SetModeType_Mark , true );				--�I��(�O)
			SetModeEx( Treasure , EM_SetModeType_ShowRoleHead , true ); 	--�Y����(�O)
			SetModeEx( Treasure , EM_SetModeType_Fight , false );			--���(�_)
			SetModeEx( Treasure , EM_SetModeType_Strikback , false );		--����(�_)
			SetModeEx( Treasure , EM_SetModeType_Searchenemy , false );		--����(�_)
			SetModeEx( Treasure , EM_SetModeType_Move , false ); 			--����(�_)
			SetModeEx( Treasure , EM_SetModeType_Obstruct , true );			--����(�O)
			AddToPartition( Treasure , RoomID );
			if Zone ~= 941 then	Hao_antiHacker_Dead( 1 );	end	--���b�ȷs��A���b���`�@���A��JBoss����
			sleep( 50 );
			return	--�������禡
		end
	end
end

---------------------------------������ - �M���@��---------------------------------
function Z34_BOSS1_CtrlCenter_Clear( CtrlCenter , RoomID )
	for i = 1 , 3 do
		DelObj( g_Boss[ i ][ RoomID ] );		--�R��Boss
		g_BossAlive[ i ][ RoomID ] = false;		--�]�w��Boss�������`
	end	--�R��BOSS
end

---------------------------------Boss - ���`�������@��---------------------------------
function Z34_BOSS1_Boss_Dead()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	MagicInterrupt( Boss );	--���_�k�N�۩G
	PlayMotionEX( Boss, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP );	--���񦺤`�ʧ@
	SetModeEx( Boss , EM_SetModeType_Mark , false );		--�I��(�_)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , false ); --�Y����(�_)
	SetModeEx( Boss , EM_SetModeType_Fight , false );		--���(�_)
	SetModeEx( Boss , EM_SetModeType_Strikback , false );	--����(�_)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , false );	--����(�_)
	SetModeEx( Boss , EM_SetModeType_Move , false );		--����(�_)
	ClearHateList( Boss , -1 );	--�M�Ť���
	for i = 1 , 3 do
		if ReadRoleValue( Boss , EM_RoleValue_OrgID ) == g_Boss_GUID[ i ][ g_Difficulty[ RoomID ] ] then
			g_BossAlive[ i ][ RoomID ] = false;	--�]�w��Boss�����`
			CallPlot( Boss , "Z34_BOSS1_Boss_Rebirth" , Boss , RoomID , i );	--BOSS - ���ͼ@��
		end
	end
	return false
end

---------------------------------BOSS - ���ͼ@��---------------------------------
function Z34_BOSS1_Boss_Rebirth( Boss , RoomID , i )
	Sleep( g_RevivalTime * 10 );
	PlayMotion( Boss, ruFUSION_ACTORSTATE_ACTIVATE_END );	--����_���ʧ@
	WriteRoleValue( Boss , EM_RoleValue_HP , ReadRoleValue( Boss , EM_RoleValue_MaxHP ));	--�^���ͩR
	SetModeEx( Boss , EM_SetModeType_Mark , true );			--�I��(�O)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); --�Y����(�O)
	SetModeEx( Boss , EM_SetModeType_Fight , true );		--���(�O)
	SetModeEx( Boss , EM_SetModeType_Strikback , true );	--����(�O)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true );	--����(�O)
	SetModeEx( Boss , EM_SetModeType_Move , true );			--����(�O)
	AddBuff( Boss , g_Skill.BuffID_Avengers , 0 , -1 );		--�����@�h�_���̪��A
	g_BossAlive[ i ][ RoomID ] = true;		--�]�wBoss������
	local BossName = Getname( Boss );	--�ؼЦW��
	ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossReBirth" ] .. BossName .. "]" , 2 );	--�s��Boss����
end

---------------------------------������ - �}������@��---------------------------------
function Z34_BOSS1_FormationCtrl( CtrlCenter , RoomID )
	local Clock = 0;	--��ƭp�ƾ�
	local Count = 0;	--�}���Ұʭp�ƾ�
	local FrenzyRecord = false;	--�g�ɬI�i�L������
	
	while true do
		Sleep( 10 );	--�C1�����@��
		Clock = Clock + 1;
		
		--�g�ɬ�ƻP����P�_
		if Clock % g_FrenzyTime[ g_Difficulty[ RoomID ] ] == 0 and FrenzyRecord == false then
			for i = 1 , 3 do	AddBuff( g_Boss[ 1 ][ RoomID ] , g_FrenzyBuff , 0 , -1 );	end	--����Boss�g�ɪ��A
			ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "BossFrenzy" ] , 2 );	--�s��Boss�g��
			FrenzyRecord = true;	--�����w�g��
		end
		
		if g_FightSwitch[ RoomID ] == false then	--�԰��}���w��
			g_Formation[ RoomID ] = 0;	--�N�}���אּ�G0�]�L�^
			return						--���������
			
		elseif Clock % g_FormationTime == 0 then	--�ŦX�}�������ɶ�
			Count = Count + 1;
			
			--�C�������}���ɡA�N�N�}���I���s�~�P
			g_RandFlagPos[ RoomID ] = g_FlagID.FormationList
			for i = 1 , 999 do --�~�P�A�H���M�椤������999���A�h�~�X���קK�Ӿ��
				local j = RandRange( 1 , #g_RandFlagPos[ RoomID ] );
				local k = RandRange( 1 , #g_RandFlagPos[ RoomID ] );
				local temp = g_RandFlagPos[ RoomID ][ k ];
				g_RandFlagPos[ RoomID ][ k ] = g_RandFlagPos[ RoomID ][ j ];
				g_RandFlagPos[ RoomID ][ j ] = temp;
			end
			
			local RandNumber = RandRange( g_RandFormat[ 1 ] , g_RandFormat[ 2 ] );
			if Count % 3 == 0 then	--3�����Ʀ��ഫ�A�@���ର�T���}
				g_Formation[ RoomID ] = 5;	--�N�}���אּ�G5�]�}���ഫ���q�^
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--������ - �}���ഫ
				ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "Formation4" ] , 2 );	--�s���ҰʤT���}
				g_BossNowPos[ 1 ][ RoomID ] = 104;	--�k����
				g_BossNowPos[ 2 ][ RoomID ] = 108;	--�����
				g_BossNowPos[ 3 ][ RoomID ] = 112;	--���ת�
				for i = 1 , 3 do	SetPosByFlag( g_Boss[ i ][ RoomID ] , g_FlagID.FlagID , g_BossNowPos[ i ][ RoomID ] );	end	--������w�}���I
				Sleep( 20 );
				g_Formation[ RoomID ] = 4;	--�N�}���אּ�G4�]�T���}�^
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--������ - �}���ഫ
				if g_BossAlive[ 1 ][ RoomID ] == true then	--�Y�k���̬���
					SetModeEx( g_Boss[ 1 ][ RoomID ] , EM_SetModeType_Move , true );			--�k���̡G����(�O)
					AddBuff( g_Boss[ 1 ][ RoomID ] , g_Skill.FormationD.BuffID_01 , 0 , -1 );	--���W�T���}�P�_���A
				end
				if g_BossAlive[ 2 ][ RoomID ] == true then	--�Y����̬���
					SetModeEx( g_Boss[ 2 ][ RoomID ] , EM_SetModeType_Move , true );			--����̡G����(�O)
					AddBuff( g_Boss[ 2 ][ RoomID ] , g_Skill.FormationD.BuffID_02 , 0 , -1 );	--���W�T���}�P�_���A
				end
				if g_BossAlive[ 3 ][ RoomID ] == true then	--�Y���ת̬���
					SetModeEx( g_Boss[ 3 ][ RoomID ] , EM_SetModeType_Move , true );			--���ת̡G����(�O)
					AddBuff( g_Boss[ 3 ][ RoomID ] , g_Skill.FormationD.BuffID_03 , 0 , -1 );	--���W�T���}�P�_���A
				end
				
			elseif RandNumber == 1 then		--�ǳ��ର���v�}
				g_Formation[ RoomID ] = 5;	--�N�}���אּ�G5�]�}���ഫ���q�^
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--������ - �}���ഫ
				ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "Formation1" ] , 2 );	--�s���Ұ����v�}
				g_BossNowPos[ 1 ][ RoomID ] = g_FlagID.FormationCenter;		--�k���̡G�}�������I
				g_BossNowPos[ 2 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 1 ];	--����̡G�H���}���I1
				g_BossNowPos[ 3 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 2 ];	--���ת̡G�H���}���I2
				for i = 1 , 3 do	SetPosByFlag( g_Boss[ i ][ RoomID ] , g_FlagID.FlagID , g_BossNowPos[ i ][ RoomID ] );	end	--������w�}���I
				Sleep( 20 );
				g_Formation[ RoomID ] = 1;	--�N�}���אּ�G1�]���v�}�^
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--������ - �}���ഫ
				if g_BossAlive[ 1 ][ RoomID ] == true then	--�Y�k���̬���
					SetModeEx( g_Boss[ 1 ][ RoomID ] , EM_SetModeType_Move , true );			--�k���̡G����(�O)
				end
				
			elseif RandNumber == 2 then		--�ǳ��ର�H���}
				g_Formation[ RoomID ] = 5;	--�N�}���אּ�G5�]�}���ഫ���q�^
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--������ - �}���ഫ
				ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "Formation2" ] , 2 );	--�s���ҰʸH���}
				g_BossNowPos[ 1 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 1 ];	--�k���̡G�H���}���I1
				g_BossNowPos[ 2 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 2 ];	--����̡G�H���}���I2
				g_BossNowPos[ 3 ][ RoomID ] = g_FlagID.FormationCenter;		--���ת̡G�}�������I
				for i = 1 , 3 do	SetPosByFlag( g_Boss[ i ][ RoomID ] , g_FlagID.FlagID , g_BossNowPos[ i ][ RoomID ] );	end	--������w�}���I
				Sleep( 20 );
				g_Formation[ RoomID ] = 2;	--�N�}���אּ�G2�]�H���}�^
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--������ - �}���ഫ
				if g_BossAlive[ 3 ][ RoomID ] == true then	--�Y���ת̬���
					SetModeEx( g_Boss[ 3 ][ RoomID ] , EM_SetModeType_Move , true );			--���ת̡G����(�O)
				end
				
			else							--�ǳ��ର�o�ް}
				g_Formation[ RoomID ] = 5;	--�N�}���אּ�G5�]�}���ഫ���q�^
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--������ - �}���ഫ
				ScriptMessage( CtrlCenter , -1 , 2 , g_BossTalk[ "Formation3" ] , 2 );	--�s���Ұʲo�ް}
				g_BossNowPos[ 1 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 1 ];	--�k���̡G�H���}���I1
				g_BossNowPos[ 2 ][ RoomID ] = g_FlagID.FormationCenter;		--����̡G�}�������I
				g_BossNowPos[ 3 ][ RoomID ] = g_RandFlagPos[ RoomID ][ 2 ];	--���ת̡G�H���}���I2
				for i = 1 , 3 do	SetPosByFlag( g_Boss[ i ][ RoomID ] , g_FlagID.FlagID , g_BossNowPos[ i ][ RoomID ] );	end	--������w�}���I
				Sleep( 20 );
				g_Formation[ RoomID ] = 3;	--�N�}���אּ�G3�]�o�ް}�^
				CallPlot( CtrlCenter , "Z34_BOSS1_Boss_FormationChange" , CtrlCenter , RoomID );	--������ - �}���ഫ
				if g_BossAlive[ 2 ][ RoomID ] == true then	--�Y����̬���
					SetModeEx( g_Boss[ 2 ][ RoomID ] , EM_SetModeType_Move , true );			--����̡G����(�O)
				end
				
			end
		end
	end
end

---------------------------------������ - �}���ഫ---------------------------------
function Z34_BOSS1_Boss_FormationChange( CtrlCenter , RoomID )
	if g_Formation[ RoomID ] == 5 then	--�}���ഫ���q
		for i = 1 , 3 do
			if g_BossAlive[ i ][ RoomID ] == true then		--�YBoss����
				StopMove( g_Boss[ i ][ RoomID ] , false );	--����Boss����
				MagicInterrupt( g_Boss[ i ][ RoomID ] );	--���_�k�N�۩G
				SetModeEx( g_Boss[ i ][ RoomID ] , EM_SetModeType_Strikback , false );		--����(�_)
				SetModeEx( g_Boss[ i ][ RoomID ] , EM_SetModeType_Searchenemy , false );	--����(�_)
				SetModeEx( g_Boss[ i ][ RoomID ] , EM_SetModeType_Move , false );			--����(�_)
				SetStopAttack( g_Boss[ i ][ RoomID ] );     --��������B���}�԰��òM�Ť���
				g_HaveCast[ i ][ RoomID ] = false;			--���m�S�w�k�N���I�i�P�_
				g_LineDmg[ i ][ RoomID ] = false;			--���m���p�o�ު��ˮ`�P�_
				PlayMotion( g_Boss[ i ][ RoomID ], ruFUSION_ACTORSTATE_CAST_SP01 );	--����ʧ@
			end
		end
		CancelBuff( g_Boss[ 1 ][ RoomID ] , g_Skill.FormationD.BuffID_01 );			--�k���̡G�����T���}���A
		CancelBuff( g_Boss[ 2 ][ RoomID ] , g_Skill.FormationD.BuffID_02 );			--����̡G�����T���}���A
		CancelBuff( g_Boss[ 3 ][ RoomID ] , g_Skill.FormationD.BuffID_03 );			--���ת̡G�����T���}���A
		CancelBuff( g_Boss[ 1 ][ RoomID ] , g_Skill.FormationD.BuffID_Hot );		--�k���̡G�����A�ͪ��A
		CancelBuff( g_Boss[ 3 ][ RoomID ] , g_Skill.FormationD.BuffID_Invincible );	--���ת̡G�����L�Ī��A
		CancelBuff( g_Boss[ 1 ][ RoomID ] , g_Skill.FormationC.BuffID_Shield );		--�k���̡G�����o�޾��@���A
		CancelBuff( g_Boss[ 2 ][ RoomID ] , g_Skill.FormationC.BuffID_Charged );	--����̡G�����o�ޥR�બ�A
		CancelBuff( g_Boss[ 3 ][ RoomID ] , g_Skill.FormationC.BuffID_Shield );		--���ת̡G�����o�޾��@���A

	else
		for i = 1 , 3 do
			if g_BossAlive[ i ][ RoomID ] == true then	--�YBoss����
				SetModeEx( g_Boss[ i ][ RoomID ] , EM_SetModeType_Strikback , true );	--����(�O)
				SetModeEx( g_Boss[ i ][ RoomID ] , EM_SetModeType_Searchenemy , true );	--����(�O)
				local Boss_RangePlayer = LUA_YOYO_RangePlayerNotGM( g_Boss[ i ][ RoomID ] , 1000 ) --���Boss�d��1000�����a�A�ư�GM
				if #Boss_RangePlayer >= 1 then	--�Y����쪱�a
					Setattack( g_Boss[ i ][ RoomID ] , Boss_RangePlayer[ 1 ] );	--�R�O�h���̪񪺪��a
				end
			end
		end
	end
end
---------------------------------�k���� - �԰��@��---------------------------------
function Z34_BOSS1_Boss_1_Fight( Boss , RoomID )
	local Clock = 0;	--��ƭp�ƾ�
	while true do
		Sleep( 10 );
		if g_BossAlive[ 1 ][ RoomID ] == true then
			Clock = Clock + 1;
			if g_Formation[ RoomID ] == 1 then	--���v�}
				if Clock % g_Skill.Boss1.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CastSpellLV( Boss , Boss , g_Skill.Boss1.SkillID , 0 );	--�I�i�G�p���gŧ
				end
				
			elseif g_Formation[ RoomID ] == 2 then	--�H���}
				while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
				CastSpellLV( Boss , Boss , g_Skill.FormationB.SkillID_Thunder , 0 );	--�I�i�G��p�O��
				
			elseif g_Formation[ RoomID ] == 3 then	--�o�ް}
				if g_HaveCast[ 1 ][ RoomID ] == false then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CallPlot( Boss , "Z34_BOSS1_Boss_ChangePos" , Boss , RoomID , 1 );		--Boss - �����}���I
					g_HaveCast[ 1 ][ RoomID ] = true;
					AddBuff( Boss , g_Skill.FormationC.BuffID_Shield , 0 , -1 );			--�����ۨ��o�޾��@�����A
					CastSpellLV( Boss , g_Boss[ 2 ][ RoomID ] , g_Skill.FormationC.SkillID_LineShow , 0 );	--�ﺶ��̬I�i�G���p�o�� - �R��
					g_LineDmg[ 1 ][ RoomID ] = true;
					CallPlot( Boss , "Z34_BOSS1_Boss_LineDmg" , Boss , RoomID , 1 );		--Boss - ���p�o�޶ˮ`�@��
				else
					if Clock % g_Skill.FormationC.CD == 0 then
						g_HaveCast[ 1 ][ RoomID ] = false;
						g_LineDmg[ 1 ][ RoomID ] = false;
					end
				end
				
			elseif g_Formation[ RoomID ] == 4 or g_Formation[ RoomID ] == 0 then	--�T���}�εL�}��
				if Clock % g_Skill.Boss1.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CastSpellLV( Boss , Boss , g_Skill.Boss1.SkillID , 0 );	--�I�i�G�p���gŧ
				end
			
			else	Clock = 0;	--�����}���ɭ��s�p�ƾ��ɶ�
			end
		end
	end
end

---------------------------------����� - �԰��@��---------------------------------
function Z34_BOSS1_Boss_2_Fight( Boss , RoomID )
	local Clock = 0;	--��ƭp�ƾ�
	while true do
		Sleep( 10 );
		if g_BossAlive[ 2 ][ RoomID ] == true then
			Clock = Clock + 1;
			if g_Formation[ RoomID ] == 1 then	--���v�}
				if g_HaveCast[ 2 ][ RoomID ] == false then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CallPlot( Boss , "Z34_BOSS1_Boss_ChangePos" , Boss , RoomID , 2 );				--Boss - �����}���I
					g_HaveCast[ 2 ][ RoomID ] = true;
					local PlayerList = LUA_YOYO_RangePlayerNotGM( Boss , 2000 ); 					--���Boss�d��2000�����a�A�ư�GM
					if #PlayerList >= 1 then
						CastSpellLV( Boss , PlayerList[ #PlayerList ] , g_Skill.FormationA.SkillID_FlashCharge , 0 );	--���v�ľW
					end
				else
					if Clock % g_Skill.FormationA.CD == 0 then	g_HaveCast[ 2 ][ RoomID ] = false;	end
				end
				
			elseif g_Formation[ RoomID ] == 2 then	--�H���}
				while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
				CastSpellLV( Boss , Boss , g_Skill.FormationB.SkillID_Fire , 0 );	--�I�i�G���K�Q�g
				
			elseif g_Formation[ RoomID ] == 3 then	--�o�ް}
				if FN_CountBuffLevel( Boss , g_Skill.FormationC.BuffID_Charged ) >= g_Skill.FormationC.ChargedMax - 1 then	--�Y�o�ޥR���|��10�h
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CastSpellLV( Boss , Boss , g_Skill.FormationC.SkillID_Burn , g_Skill.FormationC.SkillLv_Burn[ g_Difficulty[ RoomID ] ] );	--�I�i�G���K�I��
					CancelBuff( Boss , g_Skill.FormationC.BuffID_Charged );							--�����o�ޥR�બ�A
				end
				if Clock % g_Skill.Boss2.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CastSpellLV( Boss , Boss , g_Skill.Boss2.SkillID , g_Skill.Boss2.SkillLv[ g_Difficulty[ RoomID ] ] );	--�I�i�G���K�`��
				end
				
			elseif g_Formation[ RoomID ] == 4 or g_Formation[ RoomID ] == 0 then	--�T���}�εL�}��
				if Clock % g_Skill.Boss2.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CastSpellLV( Boss , Boss , g_Skill.Boss2.SkillID , g_Skill.Boss2.SkillLv[ g_Difficulty[ RoomID ] ] );	--�I�i�G���K�`��
				end
			
			else	Clock = 0;	--�����}���ɭ��s�p�ƾ��ɶ�
			end
		end
	end
end

---------------------------------���ת� - �԰��@��---------------------------------
function Z34_BOSS1_Boss_3_Fight( Boss , RoomID )
	local Clock = 0;	--��ƭp�ƾ�
	while true do
		Sleep( 10 );
		if g_BossAlive[ 3 ][ RoomID ] == true then
			Clock = Clock + 1;
			if g_Formation[ RoomID ] == 1 then	--���v�}
				if g_HaveCast[ 3 ][ RoomID ] == false then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CallPlot( Boss , "Z34_BOSS1_Boss_ChangePos" , Boss , RoomID , 3 );				--Boss - �����}���I
					g_HaveCast[ 3 ][ RoomID ] = true;
					local PlayerList = LUA_YOYO_RangePlayerNotGM( Boss , 2000 ); 					--���Boss�d��2000�����a�A�ư�GM
					if #PlayerList >= 1 then
						CastSpellLV( Boss , PlayerList[ #PlayerList ] , g_Skill.FormationA.SkillID_FlashCharge , 0 );	--���v�ľW
					end

				else
					if Clock % g_Skill.FormationA.CD == 0 then	g_HaveCast[ 3 ][ RoomID ] = false;	end
				end
				
			elseif g_Formation[ RoomID ] == 2 then	--�H���}
				if Clock % g_Skill.Boss3.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CastSpellLV( Boss , Boss , g_Skill.Boss3.SkillID , 0 );	--�I�i�G�_�a��
				end
				
			elseif g_Formation[ RoomID ] == 3 then	--�o�ް}
				if g_HaveCast[ 3 ][ RoomID ] == false then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CallPlot( Boss , "Z34_BOSS1_Boss_ChangePos" , Boss , RoomID , 3 );		--Boss - �����}���I
					g_HaveCast[ 3 ][ RoomID ] = true;
					AddBuff( Boss , g_Skill.FormationC.BuffID_Shield , 0 , -1 );			--�����ۨ��o�޾��@�����A
					CastSpellLV( Boss , g_Boss[ 2 ][ RoomID ] , g_Skill.FormationC.SkillID_LineShow , 0 );	--�ﺶ��̬I�i�G���p�o�� - �R��
					g_LineDmg[ 3 ][ RoomID ] = true;
					CallPlot( Boss , "Z34_BOSS1_Boss_LineDmg" , Boss , RoomID , 3 );		--Boss - ���p�o�޶ˮ`�@��
				else
					if Clock % g_Skill.FormationC.CD == 0 then
						g_HaveCast[ 3 ][ RoomID ] = false;
						g_LineDmg[ 3 ][ RoomID ] = false;
					end
				end

			elseif g_Formation[ RoomID ] == 4 or g_Formation[ RoomID ] == 0 then	--�T���}�εL�}��
				if Clock % g_Skill.Boss3.CD == 0 then
					while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do Sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
					CastSpellLV( Boss , Boss , g_Skill.Boss3.SkillID , 0 );	--�I�i�G�_�a��
				end
			
			else	Clock = 0;	--�����}���ɭ��s�p�ƾ��ɶ�
			end
		end
	end
end

---------------------------------Boss - �����}���I---------------------------------
function Z34_BOSS1_Boss_ChangePos( Boss , RoomID , BossNum )
	SetPosByFlag( Boss , g_FlagID.FlagID , g_BossNowPos[ BossNum ][ RoomID ] );	--�NBoss�Ǩ�}���U�@�Ӧ�m
	--DebugMsg( 0 , 0 , "Boss" .. BossNum .. " Pos is " .. g_BossNowPos[ BossNum ][ RoomID ] );
	if g_BossNowPos[ BossNum ][ RoomID ] == g_RandFlagPos[ RoomID ][ 11 ] then
		g_BossNowPos[ BossNum ][ RoomID ] = g_RandFlagPos[ RoomID ][ 1 ];
	elseif g_BossNowPos[ BossNum ][ RoomID ] == g_RandFlagPos[ RoomID ][ 12 ] then
		g_BossNowPos[ BossNum ][ RoomID ] = g_RandFlagPos[ RoomID ][ 2 ];
	else
		for i = 1 , #g_RandFlagPos[ RoomID ] do
			if g_BossNowPos[ BossNum ][ RoomID ] == g_RandFlagPos[ RoomID ][ i ] then
				g_BossNowPos[ BossNum ][ RoomID ] = g_RandFlagPos[ RoomID ][ i + 2 ];
				break
			end
		end
	end	
end

---------------------------------Boss - ���p�o�� - �ˮ`�@��---------------------------------
function Z34_BOSS1_Boss_LineDmg( Boss , RoomID , BossNum )
	while g_Formation[ RoomID ] == 3 and g_LineDmg[ BossNum ][ RoomID ] == true do
		local BossPos = Vector_GetRolePos( Boss );	--���X��eBoss���y��
		local Boss2Pos = Vector_GetRolePos( g_Boss[ 2 ][ RoomID ] );	--���X����̪��y��
		local BossDir = ReadRoleValue( Boss, EM_RoleValue_Dir ) + 90;	--���XBoss�ثe���V
		--�ˬd�ؼЬO�_�b���w���B�e�����u�d�򤺡A�_�^��Nil�B�O���ܦ^�ǥؼлP�_�I���Z�� ( �_�I�y�СB���I�y�СB�e�סB���סB�ؼЮy�� ) 
		local BossHateList = KS_GetHateList( Boss , 4 )	--�������M�椤�Ҧ����a�A��4���ư�GM
		for i = 1 , #BossHateList do
			local TargetPos = Vector_GetRolePos( BossHateList[ i ] );	--���X�ؼЪ��a���y��
			local Status = Vector_CheckShootObj( BossPos , Boss2Pos , 20 , 50 , TargetPos );
			if Status ~= nil then
				SysCastSpellLV( Boss , BossHateList[ i ] , g_Skill.FormationC.SkillID_LineDmg , g_Skill.FormationC.SkillLv_LineDmg[ g_Difficulty[ RoomID ] ] );	--��ؼЪ��a�I�i�G���p�o�� - �ˮ`�ĪG
			end
		end
		Sleep( 10 );
	end
end
---------------------------------���p�o�� - �ˬd�ؼЬO�_�����a---------------------------------
function Z34_BOSS1_Skill_CheckPlayer()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then return true	--�ؼЬ����a
	else return false
	end
end
---------------------------------�o�޾��@�Q���} - ���_�I�k---------------------------------
function Z34_BOSS1_MagicInterrupt()
	MagicInterrupt( OwnerID() );
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	for i = 1 , 3 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == g_Boss_GUID[ i ][ g_Difficulty[ RoomID ] ] then
			g_LineDmg[ i ][ RoomID ] = false;
		end
	end
end

---------------------------------Boss - �p���gŧ - �I��@��---------------------------------
function Z34_BOSS1_Skill_Electro()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	local BossPos = Vector_GetRolePos( Boss );     --���XBoss��e���y��
	local BossDir = ReadRoleValue( Boss, EM_RoleValue_Dir );	--���XBoss�ثe���V
	local ElectroObj = CreateObj( g_Skill.Boss1.ObjID , BossPos.x, BossPos.y , BossPos.z , BossDir , 1 ); --�bBoss��m�Ыعp������
	SetModeEx( ElectroObj , EM_SetModeType_HideName , false );		--��ܦW��(�_)
	SetModeEx( ElectroObj , EM_SetModeType_NotShowHPMP , false );	--��ܦ��(�_)
	SetModeEx( ElectroObj , EM_SetModeType_ShowRoleHead , false );	--�Y����(�_)
	SetModeEx( ElectroObj , EM_SetModeType_Mark , false );			--�I��(�_)
	SetModeEx( ElectroObj , EM_SetModeType_Fight , false );			--���(�_)
	SetModeEx( ElectroObj , EM_SetModeType_Strikback , false );		--����(�_)
	SetModeEx( ElectroObj , EM_SetModeType_Searchenemy , false );	--����(�_)
	SetModeEx( ElectroObj , EM_SetModeType_Move , false );			--����(�_)
	AddToPartition( ElectroObj, RoomID );
	AddBuff( ElectroObj , g_Skill.Boss1.BuffID_Show , 0 , -1 ); --���W�p���gŧ - ��t�S��
	CallPlot( ElectroObj , "Z34_BOSS1_Skill_Electro_Dmg" , ElectroObj , RoomID );	--�p���gŧ - �ˮ`�X���P�R���@��
end
---------------------------------�p���gŧ - �ˮ`�X���P�R���@��---------------------------------
function Z34_BOSS1_Skill_Electro_Dmg( ElectroObj , RoomID )
	for i = 1 , g_Skill.Boss1.DmgCount do
		SysCastSpellLV( ElectroObj , ElectroObj , g_Skill.Boss1.SkillID_Dmg , g_Skill.Boss1.SkillLv[ g_Difficulty[ RoomID ] ] );	--�I�i�p���gŧ - �ˮ`�k�N
		Sleep( g_Skill.Boss1.Interval * 10 );	--���涡�j
	end
	DelObj( ElectroObj )
end

---------------------------------Boss - ��p�O�� - �I��@��---------------------------------
function Z34_BOSS1_Skill_Thunder()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	local TargetPos = Vector_GetRolePos( g_Boss[ 3 ][ RoomID ] );   --���X���ת̷�e���y��
	local TargetDir = ReadRoleValue( g_Boss[ 3 ][ RoomID ], EM_RoleValue_Dir );	--���X���ת̷�e���V
	local ThunderObj = CreateObj( g_Skill.FormationB.ObjID_Thunder , TargetPos.x, TargetPos.y , TargetPos.z , TargetDir , 1 ); --�b�ؼЦ�m�Ы���p����
	SetModeEx( ThunderObj , EM_SetModeType_HideName , false );		--��ܦW��(�_)
	SetModeEx( ThunderObj , EM_SetModeType_NotShowHPMP , false );	--��ܦ��(�_)
	SetModeEx( ThunderObj , EM_SetModeType_ShowRoleHead , false );	--�Y����(�_)
	SetModeEx( ThunderObj , EM_SetModeType_Mark , false );			--�I��(�_)
	SetModeEx( ThunderObj , EM_SetModeType_Fight , false );			--���(�_)
	SetModeEx( ThunderObj , EM_SetModeType_Strikback , false );		--����(�_)
	SetModeEx( ThunderObj , EM_SetModeType_Searchenemy , false );	--����(�_)
	SetModeEx( ThunderObj , EM_SetModeType_Move , false );			--����(�_)
	AddToPartition( ThunderObj, RoomID )
	AddBuff( ThunderObj , g_Skill.FormationB.BuffID_Thunder_Dmg , g_Skill.FormationB.SkillLv_Thunder[ g_Difficulty[ RoomID ] ] , -1 ) --���W��p�O�� - ����s�y�ˮ`���A
	CallPlot( ThunderObj , "Z34_BOSS1_Skill_Thunder_Del" , ThunderObj , RoomID );	--��p�O�� - �R���@��
end
---------------------------------��p�O�� - �R���@��---------------------------------
function Z34_BOSS1_Skill_Thunder_Del( ThunderObj , RoomID )
	Sleep( g_Skill.FormationB.Time_Thunder * 10 );
	DelObj( ThunderObj )
end

---------------------------------Boss - ���K�Q�g - �I��@��---------------------------------
function Z34_BOSS1_Skill_Fire()
	local Boss = OwnerID();
	local RoomID = ReadRoleValuefloat( Boss , EM_RoleValue_RoomID );
	local FireNumber = 10;	--���K���󪺼ƶq
	local FireRange = 50;	--���K���󪺶��Z
	
	local PlayerList = LUA_YOYO_RangePlayerNotGM( Boss , 2000 ); --���Boss�d��2000�����a�A�ư�GM
	if #PlayerList >= 1 then
		AdjustFaceDir( Boss , PlayerList[ #PlayerList ] , 0 );	--��Boss���V�ؼ�
	end
	
	local BossPos = Vector_GetRolePos( Boss );     --���XBoss�ثe���y��
	local BossDir = ReadRoleValue( Boss, EM_RoleValue_Dir ) + 90;	--���XBoss�ثe���V
	local VecDir = Vector_DirToVector( BossDir );     -- ������V�q
	
	for i = 1 , FireNumber do
		local FirePos = BossPos + VecDir * FireRange * i;     --���W�����q�᪺�y��
		local FireObj = CreateObj( g_Skill.FormationB.ObjID_Fir , FirePos.x, FirePos.y , FirePos.z , BossDir , 1 ); --�b�y���I�Ыرۭ�����
		SetModeEx( FireObj , EM_SetModeType_HideName , false );		--��ܦW��(�_)
		SetModeEx( FireObj , EM_SetModeType_NotShowHPMP , false );	--��ܦ��(�_)
		SetModeEx( FireObj , EM_SetModeType_ShowRoleHead , false );	--�Y����(�_)
		SetModeEx( FireObj , EM_SetModeType_Mark , false );			--�I��(�_)
		SetModeEx( FireObj , EM_SetModeType_Fight , false );		--���(�_)
		SetModeEx( FireObj , EM_SetModeType_Strikback , false );	--����(�_)
		SetModeEx( FireObj , EM_SetModeType_Searchenemy , false );	--����(�_)
		SetModeEx( FireObj , EM_SetModeType_Move , false );			--����(�_)
		AddToPartition( FireObj, RoomID )
		AddBuff( FireObj , g_Skill.FormationB.BuffID_Fire_Dmg , g_Skill.FormationB.SkillLv_Fire[ g_Difficulty[ RoomID ] ] , -1 ) --���W���K�Q�g - ����s�y�ˮ`���A
		CallPlot( FireObj , "Z34_BOSS1_Skill_Fire_Del" , FireObj , RoomID );	--���K�Q�g - �R���@��
	end
end
---------------------------------���K�Q�g - �R���@��---------------------------------
function Z34_BOSS1_Skill_Fire_Del( FireObj , RoomID )
	Sleep( g_Skill.FormationB.Time_Fire * 10 );
	DelObj( FireObj )
end

---------------------------------Boss - �T���}�C��P�_�@��---------------------------------
function Z34_BOSS1_Skill_Triangle( BossNum )
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	if BossNum == 1 then		--Boss���k����
		if CheckDistance( Boss , g_Boss[ 2 ][ RoomID ] , 30 ) == true or CheckDistance( Boss , g_Boss[ 3 ][ RoomID ] , 30 ) == true then
			AddBuff( Boss , g_Skill.FormationD.BuffID_Hot , 0 , -1 );	--�����A�ͪ��A
		else CancelBuff( Boss , g_Skill.FormationD.BuffID_Hot );		--�����A�ͪ��A
		end
	elseif BossNum == 2 then	--Boss�������
		if CheckDistance( Boss , g_Boss[ 1 ][ RoomID ] , 30 ) == true or CheckDistance( Boss , g_Boss[ 3 ][ RoomID ] , 30 ) == true then
			SysCastSpellLV( Boss , Boss , g_Skill.FormationD.SkillID_Fire , g_Skill.FormationD.SkillLv[ g_Difficulty[ RoomID ] ] );	--�I�i���K�j��
		end
	else	--Boss�����ת�
		if CheckDistance( Boss , g_Boss[ 1 ][ RoomID ] , 30 ) == true or CheckDistance( Boss , g_Boss[ 2 ][ RoomID ] , 30 ) == true then
			AddBuff( Boss , g_Skill.FormationD.BuffID_Invincible , 0 , -1 );	--�����L�Ī��A
		else CancelBuff( Boss , g_Skill.FormationD.BuffID_Invincible );			--�����L�Ī��A
		end
	end
end

---------------------------------���ի��O - ��ʲM��---------------------------------
function Z34_BOSS1_Test_Clear()
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID );
	CallPlot( Owner , "Z34_BOSS1_CtrlCenter_Clear" , Owner , RoomID );	--������ - �M���@��
	local DoorList = LUA_YOYO_GetSpecificNPC( RoomID , g_Door_GUID ) --���X���W�Ҧ������ת�����
	for i = 1 , #DoorList do
		DelObj( DoorList[ i ] ) --�M�����ת�
	end
end
---------------------------------���ի��O - �˵����`�X��---------------------------------
function Z34_BOSS1_Test_ReadBossAlive()
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID );
	for i = 1 , 3 do
		if g_BossAlive[ i ][ RoomID ] == true then
			Say( Owner , "Boss " .. i .. " Alive = true" );
		else
			Say( Owner , "Boss " .. i .. " Alive = false" );
		end
	end

end