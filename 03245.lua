------------------------------------------------------------------
-- Z34�ƥ�
-- Boss 2
--��Ĭ�J��Ĳ
------------------------------------------------------------------

---------------------------------�����ܼƳ]�w---------------------------------
--NPC
local g_Boss_GUID = { 106193 , 109227 , 109155 };	--Boss��Ĭ�J��Ĳ
local g_Door_GUID = 106249	--���ת�����s��

local g_Skill = {}; 
g_Skill.Base = {};	--Boss��¦�k�N
g_Skill.Base.ID_A = 492395;	--���F���
g_Skill.Base.ID_B = 492648;	--���F�i��
g_Skill.Base.Range = 150;	--�P�_�Z��
g_Skill.Base.CD = 4;		--�N�o

g_Skill.Pace = {};	--�̹B�B��
g_Skill.Pace.BuffID = 503558;	--�̹B�B�� - ���A
g_Skill.Pace.SkillID = 492656;	--�̹B�B�� - �ˮ`�k�N
g_Skill.Pace.Time = 10;			--�̹B�B�� - �ĪG����ɶ�
g_Skill.Pace.CD = 30;			--�̹B�B�� - �N�o
g_Skill.Pace.ObjID = 101510;	--�̹B�B�� - �z���y����

g_Skill.Bomb = {};	--�������u
g_Skill.Bomb.SkillID = 505953;	--�������u - ���A
g_Skill.Bomb.CD = 20;			--�������u - �N�o

g_Skill.change = {}	--�묹�ഫ
g_Skill.change.BuffID_O = 501891;		--�묹�ഫ - ���A - ���b���a���W
g_Skill.change.BuffID_T = 504568;		--�묹�ഫ - ���A - ���bBoss���W
g_Skill.change.SkillID = 492651;	--�묹�ഫ - �ˮ`�k�N
g_Skill.change.CD = 45;				--�묹�ഫ - �N�o

g_Skill.Color = {}--�P�R�q��
g_Skill.Color.SkillID = { 491860 , 491861 , 491862 , 491863 , 491864 };	--�P�R�q�� - �k�N
g_Skill.Color.BuffID = { 509397 , 509398 , 509399 , 509400 , 509401 };	--�P�R�q�� - �S��
g_Skill.Color.ObjID = 100217;											--�P�R�q�� - �z���y����
g_Skill.Color.HP = { 75 , 50 , 25 };									--�P�R�q�� - �I�iHP����

--�g��
local g_FrenzyBuff = 503281;					--�g�ɪ��A
local g_FrenzyTime = { 480 , 360 , 9999999 };	--�g�ɮɶ�

--�㹳�X�l
local g_FlagID = {};
g_FlagID.FlagID = 781424;	--Z34_2���κX��
g_FlagID.Boss = 0;			--Boss�����I
g_FlagID.BeforeDoor = 1;	--�e�������I
g_FlagID.AfterDoor = 2;		--��������I
g_FlagID.Color = { 11 , 12 , 13 , 14 , 15 };	--�P�R�q�ò����I

--�����ΰѼ�
local g_Boss = {};			--����Boss����s��
local g_FightSwitch = {};	--�԰��}���P�_
local g_Difficulty = {};	--�����ƥ�����
local g_Color = {};			--�����P�R�q�÷�e��ܪ��C��
local g_ColorObj = {};		--�������W�P�R�q�ê�����
local g_Rebirth = {};		--����Boss�O�_�w���͹L
local g_ChangeTarget = {};	--�����묹�ഫ���ؼ�
local g_PaceObj = {};		--�����̹B�B�諸����

--�s���T��
local g_BossTalk = {};
g_BossTalk[ "FifhtBegin" ]	= "[LUA_106193_AI_FIGHTBEGIN]";				--�԰��}�l
g_BossTalk[ "BossWin" ]		= "[LUA_106193_AI_BOSSWIN]";				--�԰�����
g_BossTalk[ "BossDie" ]		= "[LUA_106193_AI_BOSSDEAD]";				--Boss���`
g_BossTalk[ "BossFrenzy" ]	= "[LUA_106193_AI_BOSSFRENZY]";				--Boss�g��
g_BossTalk[ "PaseCast" ]	= "[LUA_106193_AI_PACE_CAST][$SETVAR1=";	--�I�i�̹B�B��
g_BossTalk[ "PaseDead" ]	= "[LUA_106193_AI_PACE_DEAD][$SETVAR1=";	--�̹B�B��y�����a���`
g_BossTalk[ "BombCast" ]	= "[LUA_106193_AI_BOMB_CAST][$SETVAR1=";	--�I�i�������u
g_BossTalk[ "BombDead" ]	= "[LUA_106193_AI_BOMB_DEAD][$SETVAR1=";	--�������u�y�����a���`
g_BossTalk[ "ChangeCast" ]	= "[LUA_106193_AI_CHANGE_CAST][$SETVAR1=";	--�I�i�묹�ഫ
g_BossTalk[ "ChangeDead" ]	= "[LUA_106193_AI_CHANGE_DEAD][$SETVAR1=";	--�묹�ഫ�y�����a���`
g_BossTalk[ "ColorCast" ]	= "[LUA_106193_AI_COLOR_CAST][$SETVAR1=";	--�I�i�P�R�q��_�e�q
g_BossTalk[ "Color" ]		= {};
g_BossTalk[ "Color" ][ 1 ]	= "[LUA_106193_AI_COLOR_RED]";				--�P�R�q���C��ﶵ_����
g_BossTalk[ "Color" ][ 2 ]	= "[LUA_106193_AI_COLOR_GREEN]";			--�P�R�q���C��ﶵ_���
g_BossTalk[ "Color" ][ 3 ]	= "[LUA_106193_AI_COLOR_BLUE]";				--�P�R�q���C��ﶵ_�Ŧ�
g_BossTalk[ "Color" ][ 4 ]	= "[LUA_106193_AI_COLOR_BLACK]";			--�P�R�q���C��ﶵ_�¦�
g_BossTalk[ "Color" ][ 5 ]	= "[LUA_106193_AI_COLOR_YELLOW]";			--�P�R�q���C��ﶵ_����
g_BossTalk[ "ColorDead" ]	= "[LUA_106193_AI_COLOR_DEAD]";				--�P�R�q�óy�����a���`
g_BossTalk[ "BossRebirth" ]	= "[LUA_106193_AI_PLAY_REBIRTH]";			--�I�i�����޶B
g_BossTalk[ "SetVer2" ]		= "][$SETVAR2=";							--��2�Ӵ��N�ܼƮɨϥΪ��r��

---------------------------------������ - �����P���q�B�z---------------------------------
function Z34_BOSS2_CtrlCenter_Begin()	--��l�@��
	local CtrlCenter = OwnerID();	--������
	local RoomID = ReadRoleValue( CtrlCenter , EM_RoleValue_RoomID );
	CallPlot( CtrlCenter , "Z34_BOSS2_CtrlCenter_Stage" , CtrlCenter , RoomID );	--������ - �����P���q�B�z
end
function Z34_BOSS2_CtrlCenter_Stage( CtrlCenter , RoomID )
	--���קP�_
	local ZoneID = ReadRoleValue( CtrlCenter , EM_RoleValue_ZoneID );
	if ZoneID == 180 then
		g_Difficulty[ RoomID ] = 3;	--²��
	elseif ZoneID == 179 then
		g_Difficulty[ RoomID ] = 2;	--���q
	else
		g_Difficulty[ RoomID ] = 1;	--�x��
	end	

	local Boss;			--Boss
	local BeforeDoor;	--�e��
	local AfterDoor;	--���
	
	g_FightSwitch[ RoomID ] = false;	--�԰��}���P�_���]��false
	
	--�ͦ�Boss
	Boss = CreateObjByFlag( g_Boss_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID.FlagID , g_FlagID.Boss , 1 );
	SetModeEx( Boss , EM_SetModeType_Mark , true );			--�I��(�O)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); --�Y����(�O)
	SetModeEx( Boss , EM_SetModeType_Fight , true );		--���(�O)
	SetModeEx( Boss , EM_SetModeType_Strikback , true );	--����(�O)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true );	--����(�O)
	SetModeEx( Boss , EM_SetModeType_Move , true ); 		--����(�O)
	AddToPartition( Boss , RoomID );
	g_Boss[ RoomID ] = Boss;		--�NBoss�s���g�^�����ܼƤ�
	g_Rebirth[ RoomID ] = false;	--���mBoss�����ͬ���
	SetPlot( Boss , "dead" , "Z34_BOSS2_Boss_Dead" , 0 );	--Boss - ���`���ͧP�_�@��
	if Zone ~= 941 then	Hao_antiHacker_Init( 2 );	end	--���b�ȷs��A���b���󲣥ͼ@���A�᭱��JBoss����
	
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
		if HateListCount( Boss ) ~= 0 then	--������H
			if g_FightSwitch[ RoomID ] == false then	--�԰��}�����}
				g_FightSwitch[ RoomID ] = true;			--�N�԰��}�����}
				CallPlot( Boss , "Z34_BOSS2_Boss_Fight" , Boss , RoomID );	--Boss - �԰��@��
				ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "FifhtBegin" ] , 2 );	--�s��Boss�}��
				if Zone ~= 941 then	Hao_antiHacker_Fight( 2 , Boss );	end --���b�ȷs��A���b�԰��@���A�᭱��JBoss���ǡBBoss����s��
				--�ͦ��e��
				BeforeDoor = CreateObjByFlag( g_Door_GUID , g_FlagID , g_FlagNum_Door , 1 )
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
	
		if HateListCount( Boss ) == 0 and g_FightSwitch[ RoomID ] == true then	--�����S�H�A�԰��}���w�}
			if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 0 then	--BOSS�٦s��
				g_FightSwitch[ RoomID ] = false;	--�N�԰��}������
				DelObj( Boss );			--�R��BOSS
				Delobj( BeforeDoor );	--�R���e��
				ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossWin" ] , 2 );	--�s��Boss�ӧQ
				CallPlot( CtrlCenter , "Z34_BOSS2_CtrlCenter_Clear" , CtrlCenter , RoomID );	--������ - �M���@��
				sleep( 50 );
				
				--���mBoss
				Boss = CreateObjByFlag( g_Boss_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID.FlagID , g_FlagID.Boss , 1 );
				SetModeEx( Boss , EM_SetModeType_Mark , true );			--�I��(�O)
				SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); --�Y����(�O)
				SetModeEx( Boss , EM_SetModeType_Fight , true );		--���(�O)
				SetModeEx( Boss , EM_SetModeType_Strikback , true );	--����(�O)
				SetModeEx( Boss , EM_SetModeType_Searchenemy , true );	--����(�O)
				SetModeEx( Boss , EM_SetModeType_Move , true ); 		--����(�O)
				AddToPartition( Boss , RoomID );
				g_Boss[ RoomID ] = Boss;	--�NBoss�s���g�^�����ܼƤ�
				g_Rebirth[ RoomID ] = false;	--���mBoss�����ͬ���
				SetPlot( Boss , "dead" , "Z34_BOSS2_Boss_Dead" , 0 );	--Boss - ���`���ͧP�_�@��
				if Zone ~= 941 then	Hao_antiHacker_Init( 2 );	end	--���b�ȷs��A���b���󲣥ͼ@���A�᭱��JBoss����
			end
		end			
			
		if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 and g_Rebirth[ RoomID ] == true then	--BOSS�w���`�A�åB�w���͹L
			g_FightSwitch[ RoomID ] = false;	--�N�԰��}������
			DelObj( BeforeDoor );	--�R���e��
			Delobj( AfterDoor );	--�R�����
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossDie" ] , 2 );	--�s��Boss���`
			CallPlot( CtrlCenter , "Z34_BOSS2_CtrlCenter_Clear" , CtrlCenter , RoomID );	--������ - �M���@��
			if Zone ~= 941 then	Hao_antiHacker_Dead( 2 );	end	--���b�ȷs��A���b���`�@���A��JBoss����
			sleep( 50 );
			return	--�������禡
		end
	end
end

---------------------------------Boss - �԰��@��---------------------------------
function Z34_BOSS2_Boss_Fight( Boss , RoomID )
	local Clock = 0;	--�p�ɾ�
	local FrenzyRecord = false;		--�g�ɬI�i�L������
	local ColorRecord = { false , false , false };	--�P�R�q�ìI�i�L������
	local ColorScratch = 0;	--�Ȧs�C��A�s���T����
	g_Color[ RoomID ] = 0;	--�C����]��0
	
	while true do
		Sleep( 10 );	--�C1��]�@��
		Clock = Clock + 1;
		
		local NowTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID );
		local HateList = KS_GetHateList( Boss , 1 );	--���oBoss����M�椺�����a�A�̤��밪�C�Ƨ�
		
		--HP�P�_����
		for i = 1 , #ColorRecord do
			if Lua_PercentHP( Boss ) <= g_Skill.Color.HP[ i ] then
				ColorRecord[ i ] = true;
				g_Color[ RoomID ] = RandRange( 1 , 5 );	--�H���C��5��1
				while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
				CastSpellLV( Boss , Boss , g_Skill.Color.SkillID[ i ] , 0 );	--�I�i�P�R�q��
				CallPlot( Boss , "Z34_BOSS2_Color_Cast" , Boss , RoomID );		--Boss - �P�R�q�� - �k�N�I�i�@��
				ColorScratch = RandRange( 1 , 5 );	--�H���C��5��1 - �Ȧs�C��
				while g_Color[ RoomID ] == ColorScratch do	ColorScratch = RandRange( 1 , 5 );	end	--�p�G����C��ۦP�N����Ȧs�C��
				ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "ColorCast" ] .. g_BossTalk[ "Color" ][ g_Color[ RoomID ] ] .. g_BossTalk[ "SetVer2" ] .. g_BossTalk[ "Color" ][ ColorScratch ] .. "]" , 2 );	--�s��Boss�I�i�G�P�R�q��
			end
		end

		--��ƧP�_����
		if Clock % g_FrenzyTime[ g_Difficulty[ RoomID ] ] == 0 and FrenzyRecord == false then	--�g�ɬ�ƻP����P�_
			AddBuff( Boss , g_FrenzyBuff , 0 , -1 );	--�����ۨ�Buff�G�g��
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossFrenzy" ] , 2 );	--�s��Boss�g��
			FrenzyRecord = true;	--�����w�g��

		elseif Clock % g_Skill.change.CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
			local RandTarget = HateList[ RandRange( 1 , #HateList ) ];	--�q������H���D�@�H
			g_ChangeTarget[ RoomID ] = RandTarget;	--�����ܥ����ܼ�
			AddBuff( Boss , g_Skill.change.BuffID_O , 0 , -1 );			--�����ۨ����A�G�묹�ഫ
			AddBuff( RandTarget , g_Skill.change.BuffID_T , 0 , -1 );	--�����ؼЪ��A�G�묹�ഫ
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "ChangeCast" ] .. Getname( HateList[ RandNum ] ) .. "]" , 2 );	--�s��Boss�I�i�G�묹�ഫ
		
		elseif Clock % g_Skill.Pace.CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
			local RandTarget;
			if #HateList > 1 then	RandTarget = HateList[ RandRange( 2 , #HateList ) ];	--�q������H����@�H�A�ư��̰�����
			else					RandTarget = HateList[ 1 ];								--�����u���@�H�ɡA�~��̰������
			end
			AddBuff( RandTarget , g_Skill.Pace.BuffID , 0 , -1 );	--�����ؼЪ��A�G�̹B�B��
			CallPlot( RandTarget , "Z34_BOSS2_Pase_Run" , RandTarget , RoomID );	--�ؼ� - �̹B�B�� - �ĪG����@��
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "PaseCast" ] .. Getname( RandTarget ) .. "]" , 2 );	--�s��Boss�I�i�G�̹B�B��
		
		elseif Clock % g_Skill.Bomb.CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
			local RandTarget;
			if #HateList > 1 then	RandTarget = HateList[ RandRange( 2 , #HateList ) ];	--�q������H����@�H�A�ư��̰�����
			else					RandTarget = HateList[ 1 ];								--�����u���@�H�ɡA�~��̰������
			end
			AddBuff( RandTarget , g_Skill.Bomb.BuffID , 0 , -1 );	--�����ؼЪ��A�G�������u
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BombCast" ] .. Getname( RandTarget ) .. "]" , 2 );	--�s��Boss�I�i�G�������u
		
		elseif Clock % g_Skill.Base.CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
			if CheckDistance( Boss , NowTarget , g_Skill.Base.Range ) == true then	--�P�_��e�ؼжZ���O�_�ŦX
				CastSpellLV( Boss , NowTarget , g_Skill.Base.ID_A , 0 );	--�I�i�G���F���
			else
				CastSpellLV( Boss , NowTarget , g_Skill.Base.ID_B , 0 );	--�I�i�G���F�i��
			end
		end
	end
end

---------------------------------Player - �̹B�B�� - �ĪG����@��---------------------------------
function Z34_BOSS2_Pase_Run( Target , RoomID )
	for i = 1 , g_Skill.Pace.Time do
		local TargetPos = Vector_GetRolePos( Target );					--���X��e�y��
		local TargetDir = ReadRoleValue( Target , EM_RoleValue_Dir );	--���X��e���V
		if g_PaceObj[ RoomID ] == 0 then
			g_PaceObj[ RoomID ] = CreateObj( g_Skill.Pace.ObjID , TargetPos.x, TargetPos.y , TargetPos.z , TargetDir , 1 ); --�b��e��m�Ыؤ̹B�B�磌��
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_HideName , false );		--��ܦW��(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_NotShowHPMP , false );	--��ܦ��(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_ShowRoleHead , false );	--�Y����(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Mark , false );			--�I��(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Fight , false );		--���(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Strikback , false );	--����(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Searchenemy , false );	--����(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Move , false );			--����(�_)
			AddToPartition( g_PaceObj[ RoomID ] , RoomID );
		else
			if GetDistance( Target , g_PaceObj[ RoomID ] ) > 1 then
				CastSpellLV( Target , Target , g_Skill.Pace.SkillID , 0 );	--�I�i�G�̹B�B�� - �ˮ`�k�N
			end
			DelObj( g_PaceObj[ RoomID ] );	--�����W�����̹B�B�磌��
			g_PaceObj[ RoomID ] = CreateObj( g_Skill.Pace.ObjID , TargetPos.x, TargetPos.y , TargetPos.z , TargetDir , 1 ); --�b��e��m�Ыطs���̹B�B�磌��
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_HideName , false );		--��ܦW��(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_NotShowHPMP , false );	--��ܦ��(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_ShowRoleHead , false );	--�Y����(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Mark , false );			--�I��(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Fight , false );		--���(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Strikback , false );	--����(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Searchenemy , false );	--����(�_)
			SetModeEx( g_PaceObj[ RoomID ] , EM_SetModeType_Move , false );			--����(�_)
			AddToPartition( g_PaceObj[ RoomID ] , RoomID );
		end
		Sleep( 10 );
	end
	DelObj( g_PaceObj[ RoomID ] );	--���������̹B�B�磌��
	g_PaceObj[ RoomID ] = 0;	--������N�����ܼ��k�s
end
---------------------------------Player - �̹B�B�� - �ˮ`�ˬd�@��---------------------------------
function Z34_BOSS2_Pase_Check()
	if OwnerID() == TargetID() then return false	--���|�ˮ`�ۤv
	else return true
	end
end
---------------------------------Player - �̹B�B�� - �ˮ`�����@��---------------------------------
function Z34_BOSS2_Pase_End()
	local Player = OwnerID();
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID );
	if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 then	--�ӥؼЪ��a�w���`
		ScriptMessage( g_Boss[ RoomID ] , -1 , 2 , g_BossTalk[ "PaseDead" ] .. Getname( Player ) .. "]" , 2 );	--�s���̹B�B��y�����a���`�T��
	end
end

---------------------------------Boss - �������u - �ˮ`�ˬd�@��---------------------------------
function Z34_BOSS2_Bomb_Check()
	if OwnerID() == TargetID() then return false	--���|�ˮ`�ۤv
	else return true
	end
end
---------------------------------Boss - �������u - �ˮ`�����@��---------------------------------
function Z34_BOSS2_Bomb_End()
	local Player = OwnerID();
	local Target = TargetID();
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID );
	if ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 then	--�ӥؼЪ��a�w���`
		ScriptMessage( g_Boss[ RoomID ] , -1 , 2 , g_BossTalk[ "BombDead" ] .. Getname( Player ) .. g_BossTalk[ "SetVer2" ] .. Getname( Target ) .. "]" , 2 );	--�s���������u�y�����a���`�T��
	end
end

---------------------------------Boss - �묹�ഫ - �ˮ`�ഫ�@��---------------------------------
function Z34_BOSS2_change_Run()
	local Boss = OwnerID();
	local Target = TargetID();
	local LastDamage = math.abs( ReadRoleValue( Boss, EM_RoleValue_LastDHp ) );			--��̫᪺�ˮ`�A�������
	local LastAttackOwner = ReadRoleValue( Boss, EM_RoleValue_LastAttackOwnerID );		--��̫�@��������(����) 
	SysCastSpellLv( LastAttackOwner , g_ChangeTarget[ RoomID ] , g_Skill.change.SkillID , LastDamage );
end
---------------------------------Boss - �묹�ഫ - �ˮ`�����@��---------------------------------
function Z34_BOSS2_change_End()
	local Target = TargetID();
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID );
	if ReadRoleValue( Target , EM_RoleValue_IsDead ) == 1 then	--�ӥؼЪ��a�w���`
		ScriptMessage( g_Boss[ RoomID ] , -1 , 2 , g_BossTalk[ "ChangeDead" ] .. Getname( Target ) .. "]" , 2 );	--�s���묹�ഫ�y�����a���`�T��
	end
end

---------------------------------Boss - �P�R�q�� - �k�N�I�i�@��---------------------------------
function Z34_BOSS2_Color_Cast( Boss , RoomID )
	local RandColorFlag = g_FlagID.Color;	--�ǳƮ��Ӭ~�P���X�Ц�m
	for i = 1 , 99 do --�~�P�A�H���M�椤������99��
		local j = RandRange( 1 , #RandColorFlag );
		local k = RandRange( 1 , #RandColorFlag );
		local temp = RandColorFlag[ k ];
		RandColorFlag[ k ] = RandColorFlag[ j ];
		RandColorFlag[ j ] = temp;
	end
	
	g_ColorObj[ Room ] = {};
	for i = 1 , #RandColorFlag do
		g_ColorObj[ Room ][ i ] = CreateObjByFlag( g_Skill.Color.ObjID , g_FlagID.FlagID , RandColorFlag[ i ] , 1 );	--���ͭP�R�q�ê���
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_HideName , false );		--��ܦW��(�_)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_NotShowHPMP , false );	--��ܦ��(�_)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_ShowRoleHead , false );	--�Y����(�_)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_Mark , false );			--�I��(�_)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_Fight , false );		--���(�_)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_Strikback , false );	--����(�_)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_Searchenemy , false );	--����(�_)
		SetModeEx( g_ColorObj[ Room ][ i ] , EM_SetModeType_Move , false );			--����(�_)
		AddToPartition( g_ColorObj[ Room ][ i ] , RoomID );
		AddBuff( g_ColorObj[ Room ][ i ] , g_Skill.Color.BuffID[ i ] , 0 , -1 );	--���W��ܯS��
	end
end

local g_Color = {};			--�����P�R�q�÷�e��ܪ��C��

---------------------------------Boss - �P�R�q�� - �ˮ`�ˬd�@��---------------------------------
function Z34_BOSS2_Color_Check()
	local Target = TargetID();
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID );
	if CheckDistance( Target , g_ColorObj[ Room ][ g_Color[ RoomID ] ] , 100 ) == true then	return false
	else	return true
	end
end

---------------------------------Boss - �P�R�q�� - �ˮ`�����@��---------------------------------
function Z34_BOSS2_Color_End()
	local Target = TargetID();
	local RoomID = ReadRoleValue( Target , EM_RoleValue_RoomID );
	if ReadRoleValue( Target , EM_RoleValue_IsDead ) == 1 then	--�ӥؼЪ��a�w���`
		ScriptMessage( g_Boss[ RoomID ] , -1 , 2 , g_BossTalk[ "ColorDead" ] , 2 );	--�s���P�R�q�óy�����a���`�T��
	end
end

---------------------------------Boss - ���`���ͧP�_�@��---------------------------------
function Z34_BOSS2_Boss_Dead()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	if g_Rebirth[ RoomID ] == false then
		g_Rebirth[ RoomID ] = true;
		MagicInterrupt( Boss );	--���_�k�N�۩G
		PlayMotionEX( Boss, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP );	--���񦺤`�ʧ@
		SetModeEx( Boss , EM_SetModeType_Mark , false );		--�I��(�_)
		SetModeEx( Boss , EM_SetModeType_ShowRoleHead , false ); --�Y����(�_)
		SetModeEx( Boss , EM_SetModeType_Fight , false );		--���(�_)
		SetModeEx( Boss , EM_SetModeType_Strikback , false );	--����(�_)
		SetModeEx( Boss , EM_SetModeType_Searchenemy , false );	--����(�_)
		SetModeEx( Boss , EM_SetModeType_Move , false );		--����(�_)
		ClearHateList( Boss , -1 );	--�M�Ť���
		CallPlot( Boss , "Z34_BOSS2_Boss_Rebirth" , Boss , RoomID );	--Boss - ���ͼ@��
		return false
	end
end
---------------------------------Boss - ���ͼ@��---------------------------------
function Z34_BOSS2_Boss_Rebirth( Boss , RoomID )
	Sleep( 30 );
	PlayMotion( Boss, ruFUSION_ACTORSTATE_ACTIVATE_END );	--����_���ʧ@
	WriteRoleValue( Boss , EM_RoleValue_HP , ReadRoleValue( Boss , EM_RoleValue_MaxHP ) / 2 );	--�^���@�bHP
	SetModeEx( Boss , EM_SetModeType_Mark , true );			--�I��(�O)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); --�Y����(�O)
	SetModeEx( Boss , EM_SetModeType_Fight , true );		--���(�O)
	SetModeEx( Boss , EM_SetModeType_Strikback , true );	--����(�O)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true );	--����(�O)
	SetModeEx( Boss , EM_SetModeType_Move , true );			--����(�O)
	g_Skill.Color.HP[ 3 ] = false;							--�N�P�R�q��25%���I�iHP����]�����I�i
	ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossRebirth" ] , 2 );	--�s��Boss���ͰT��
end

---------------------------------������ - �M���@��---------------------------------
function Z34_BOSS2_CtrlCenter_Clear( CtrlCenter , RoomID )
	
end


---------------------------------���ի��O - ��ʲM��---------------------------------
function Z34_BOSS2_Test_Clear()
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID );
	CallPlot( Owner , "Z34_BOSS2_CtrlCenter_Clear" , Owner , RoomID );	--������ - �M���@��
	local DoorList = LUA_YOYO_GetSpecificNPC( RoomID , g_Door_GUID ) --���X���W�Ҧ������ת�����
	for i = 1 , #DoorList do
		DelObj( DoorList[ i ] ) --�M�����ת�
	end
end