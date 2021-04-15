------------------------------------------------------------------
-- Z34�ƥ�
-- Boss 5
--�u�����̡v������
------------------------------------------------------------------

---------------------------------�����ܼƳ]�w---------------------------------
--NPC
local g_Door_GUID = 106249	--���ת�����s��
local g_Boss_GUID = { 106210 , 109996 , 107356 };	--Boss������
local g_MobA_GUID = { 106268 , 106286 , 107813 };	--�l���]����
local g_MobB_GUID = { 106269 , 106287 , 107814 };	--�G�Ƨ]����
local g_MobC_GUID = { 106270 , 106288 , 107844 };	--�g���]����

--�k�N���X
local g_Skill_Usually_A_ID = 491582;		--��������
local g_Skill_Usually_B_ID = 491583;		--�ѫo�h�d
local g_Skill_Usually_B_Lv = { 2 , 1 , 0 };	--�ѫo�h�d - �k�N����
local g_Skill_Usually_CD = 3;

local g_Skill_DarkFear_ID = 491580;		--�º�����
local g_Skill_DarkFear_CD = 15;

local g_Skill_BigSkill_A_ID = 491584;			--�ѫo����
local g_Skill_BigSkill_A_Lv = { 2 , 1 , 0 };	--�ѫo���� - �k�N����
local g_Skill_BigSkill_B_ID = 491585;			--�������q
local g_Skill_BigSkill_C_ID = 500769;			--�l���]����
local g_Skill_BigSkill_CD = 30;

local g_skill_Vampire_ID = 491656;			--�V���ͩR
local g_skill_Vampire_Casting_ID = 491657	--�V���ͩR�I�k��t

local g_Skill_Swallow_ID = 491634;			--�]���D����
local g_Skill_Swallow_Lv = { 2 , 1 , 0 };	--�]���D���� - �k�N����

--�򥻪k�N
local g_Buff_Vampire_A_ID = 502004;		--�V���ͩR
local g_Buff_Vampire_B_ID = 502119;		--�w�t
local g_Buff_Vampire_HP_1 = 60;			--�V���ͩR�I�iHP����1
local g_Buff_Vampire_HP_2 = 30;			--�V���ͩR�I�iHP����2

local g_Buff_MobFollow_ID_A = 500374;	--�ؼ���w
local g_Buff_MobFollow_ID_B = 502913;	--�l���H��

local g_Buff_Spread_ID = 623035;		--�G���X��

--�㹳�X�l
local g_FlagID = 781427;	--Z34_5���κX��
local g_FlagNum_Boss = 0;	--Boss�����I
local g_FlagNum_Door = 1;	--���ת������I
local g_FlagNum_Mob_1 = 2;	--�p�ǥX���I1
local g_FlagNum_Mob_2 = 3;	--�p�ǥX���I2

--�g��
local g_FrenzyBuff = 503281;	--�g��Buff
local g_FrenzyTime = { 480 , 360 , 9999999 };		--�g�ɮɶ�

--�����ΰѼ�
local g_FightSwitch = {};	--�԰��}���P�_
local g_Difficulty = {};	--�����ƥ�����
local g_Boss = {};			--����Boss����s��
local g_VampireTarget = {};	--�����V���ͩR�ɥؼЪ��s��
local g_Mob = {};			--�����l��p�Ǫ�����s��
g_Mob[ g_FlagNum_Mob_1 ] = {};
g_Mob[ g_FlagNum_Mob_2 ] = {};

--�s���T��
local g_BossTalk = {};
g_BossTalk[ "FifhtBegin" ]	= "[LUA_106210_AI_FIGHTBEGIN]";	--�԰��}�l
g_BossTalk[ "BossWin" ]		= "[LUA_106210_AI_BOSSWIN]";	--�԰�����
g_BossTalk[ "BossDie" ]		= "[LUA_106210_AI_BOSSDEAD]";	--Boss���`
g_BossTalk[ "BossFrenzy" ]	= "[LUA_106210_AI_BOSSFRENZY]";	--Boss�g��
g_BossTalk[ "BossVampire" ]	= "[LUA_106210_AI_VAMPIRE]";	--Boss�I�i�V���ͩR
g_BossTalk[ "Interrupt" ]	= "[LUA_106210_AI_INTERRUPT]";	--Boss�������q�Q���_
g_BossTalk[ "CallMobA" ]	= "[LUA_106210_AI_CALLMOBA]";	--Boss�l��l���]����
g_BossTalk[ "CallMobB" ]	= "[LUA_106210_AI_CALLMOBB]";	--Boss�l��G�Ƨ]����
g_BossTalk[ "MobMerge" ]	= "[LUA_106210_AI_MOBMERGE]";	--�]���̦X�֬��g���]����
g_BossTalk[ "MobCSplit" ]	= "[LUA_106210_AI_MOBCSPLIT][$SETVAR1=";	--�g���]���̦Y�H�����

---------------------------------������ - �����P���q�B�z---------------------------------
function Z34_BOSS5_CtrlCenter_Begin()	--��l�@��
	local CtrlCenter = OwnerID();	--������
	local RoomID = ReadRoleValue( CtrlCenter , EM_RoleValue_RoomID );
	CallPlot( CtrlCenter , "Z34_BOSS5_CtrlCenter_Stage" , CtrlCenter , RoomID );	--������ - �����P���q�B�z
end
function Z34_BOSS5_CtrlCenter_Stage( CtrlCenter , RoomID )
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
	local WingEffect = {};
	
	g_FightSwitch[ RoomID ] = false;	--�԰��}���P�_���]��false
	
	--�ͦ�Boss
	Boss = CreateObjByFlag( g_Boss_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID , g_FlagNum_Boss , 1 );
	SetModeEx( Boss , EM_SetModeType_Mark , true );				--�I��(�O)
	SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); 	--�Y����(�O)
	SetModeEx( Boss , EM_SetModeType_Fight , true );			--���(�O)
	SetModeEx( Boss , EM_SetModeType_Strikback , true );		--����(�O)
	SetModeEx( Boss , EM_SetModeType_Searchenemy , true );		--����(�O)
	SetModeEx( Boss , EM_SetModeType_Move , true ); 			--����(�O)
	AddToPartition( Boss , RoomID );
	CallPlot( Boss , "Z34_BOSS5_Boss_Init" , Boss , RoomID );	--Boss - �_�l�ͻH�S�ĥ[���@��
	g_Boss[ RoomID ] = Boss;	--�NBoss�s���g�^�����ܼƤ�
	if Zone ~= 941 then	Hao_antiHacker_Init( 5 );	end	--���b�ȷs��A���b���󲣥ͼ@���A�᭱��JBoss����
	
	while true do
	Sleep( 10 );
		if HateListCount( Boss ) ~= 0 then	--������H
			if g_FightSwitch[ RoomID ] == false then	--�԰��}�����}
				g_FightSwitch[ RoomID ] = true;			--�N�԰��}�����}
				CallPlot( Boss , "Z34_BOSS5_Boss_Fight" , Boss , RoomID );	--Boss - �԰��@��
				ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "FifhtBegin" ] , 2 );	--�s��Boss�}��
				if Zone ~= 941 then	Hao_antiHacker_Fight( 5 , Boss );	end --���b�ȷs��A���b�԰��@���A�᭱��JBoss���ǡBBoss����s��
				--�ͦ����ת�
				Door = CreateObjByFlag( g_Door_GUID , g_FlagID , g_FlagNum_Door , 1 )
				SetModeEx( Door , EM_SetModeType_HideName , false );		--��ܦW��(�_)
				SetModeEx( Door , EM_SetModeType_NotShowHPMP , false );		--��ܦ��(�_)
				SetModeEx( Door , EM_SetModeType_ShowRoleHead , false );	--�Y����(�_)
				SetModeEx( Door , EM_SetModeType_Mark , false );			--�I��(�_)
				SetModeEx( Door , EM_SetModeType_Fight , false );			--���(�_)
				SetModeEx( Door , EM_SetModeType_Strikback , false );		--����(�_)
				SetModeEx( Door , EM_SetModeType_Searchenemy , false );		--����(�_)
				SetModeEx( Door , EM_SetModeType_Move , false );			--����(�_)
				SetModeEx( Door , EM_SetModeType_Obstruct , true );			--����(�O)
				AddToPartition( Door , RoomID );
			end
		end
	
		if HateListCount( Boss ) == 0 and g_FightSwitch[ RoomID ] == true then	--�����S�H�A�԰��}���w�}
			if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 0 then	--BOSS�٦s��
				g_FightSwitch[ RoomID ] = false;	--�N�԰��}������
				DelObj( Boss );	--�R��BOSS
				Delobj( Door );	--�R�����ת�
				ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossWin" ] , 2 );	--�s��Boss�ӧQ
				CallPlot( CtrlCenter , "Z34_BOSS5_CtrlCenter_Clear" , CtrlCenter , RoomID );	--������ - �M���@��
				sleep( 50 );
				
				--���mBoss
				Boss = CreateObjByFlag( g_Boss_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID , g_FlagNum_Boss , 1 );
				SetModeEx( Boss , EM_SetModeType_Mark , true );				--�I��(�O)
				SetModeEx( Boss , EM_SetModeType_ShowRoleHead , true ); 	--�Y����(�O)
				SetModeEx( Boss , EM_SetModeType_Fight , true );			--���(�O)
				SetModeEx( Boss , EM_SetModeType_Strikback , true );		--����(�O)
				SetModeEx( Boss , EM_SetModeType_Searchenemy , true );		--����(�O)
				SetModeEx( Boss , EM_SetModeType_Move , true ); 			--����(�O)
				AddToPartition( Boss , RoomID );
				CallPlot( Boss , "Z34_BOSS5_Boss_Init" , Boss , RoomID );	--Boss - �_�l�ͻH�S�ĥ[���@��
				g_Boss[ RoomID ] = Boss;	--�NBoss�s���g�^�����ܼƤ�
				if Zone ~= 941 then	Hao_antiHacker_Init( 5 );	end	--���b�ȷs��A���b���󲣥ͼ@���A�᭱��JBoss����
			end
		end			
			
		if ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 1 then	--BOSS�w���`
			g_FightSwitch[ RoomID ] = false;	--�N�԰��}������
			Delobj( Door );	--�R�����ת�
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossDie" ] , 2 );	--�s��Boss���`
			CallPlot( CtrlCenter , "Z34_BOSS5_CtrlCenter_Clear" , CtrlCenter , RoomID );	--������ - �M���@��
			if Zone ~= 941 then	Hao_antiHacker_Dead( 5 );	end	--���b�ȷs��A���b���`�@���A��JBoss����
			sleep( 50 );
			return	--�������禡
		end
	end
end

---------------------------------Boss - �_�l�ͻH�S�ĥ[���@��---------------------------------
function Z34_BOSS5_Boss_Init( Boss , RoomID )
	local Dir = ReadRoleValue( Boss, EM_RoleValue_Dir );
	local Pos = Vector_GetRolePos( Boss );

	local WingEffect = {};	--Boss���ͻH�S�Ī���
	WingEffect[ 1 ] = { ID = 106271 , ReferencePoint = "p_left_foot" };		--����S��
	WingEffect[ 2 ] = { ID = 106271 , ReferencePoint = "p_right_foot" };	--�k��S��

	for i = 1 , 2 do
		local Wing = CreateObj( WingEffect[ i ].ID , Pos.x , Pos.y , Pos.z , Dir , 1 );
		SetModeEx( Wing , EM_SetModeType_Move , false );			--����(�_)
		SetModeEx( Wing , EM_SetModeType_Mark , false );			--�аO(�_)
		SetModeEx( Wing , EM_SetModeType_ShowRoleHead , false );	--�Y��(�_)
		SetModeEx( Wing , EM_SetModeType_Searchenemy , false );		--����(�_)
		SetModeEx( Wing , EM_SetModeType_Fight , false );			--���(�_)
		SetModeEx( Wing , EM_SetModeType_Strikback , false );		--����(�_)
		AddToPartition( Wing , RoomID );
		AttachObj( Wing , Boss , 4 , WingEffect[ i ].ReferencePoint , WingEffect[ i ].ReferencePoint );
		CallPlot( Wing , "Z34_BOSS5_Boss_ObjCheckDead" , Wing , Boss );	--�ͻH�S�Ī��󰻴����`��ۧڧR��
	end
end
function Z34_BOSS5_Boss_ObjCheckDead( Wing , Boss )
	while CheckID( Boss ) and ReadRoleValue( Boss , EM_RoleValue_IsDead ) == 0 do Sleep( 10 ); end
	DelObj( Wing );
end

---------------------------------Boss - �԰��@��---------------------------------
function Z34_BOSS5_Boss_Fight( Boss , RoomID )
	local FightClock = 0;	--�p�ɾ�
	local FrenzyRecord = false;	--�g�ɬI�i�L������
	
	--�V���ͩR�I�i�L������	
	local VampireRecordA = false;
	local VampireRecordB = false;
	
	while true do
		Sleep( 10 );	--�C1��]�@��
		FightClock = FightClock + 1;
		
		local NowTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID );
		local HateList = KS_GetHateList( Boss , 1 );	--���oBoss����M�椺�����a�A�̤��밪�C�Ƨ�
		
		--HP�P�_����
		if Lua_PercentHP( Boss ) <= g_Buff_Vampire_HP_2 and VampireRecordB == false then
			g_VampireTarget[ RoomID ] = HateList[ 1 ];							--�N����̰��ؼмg�i�V���ͩR�����������ܼƤ�
			CallPlot( Boss , "Z34_BOSS5_Boss_Vampire" , RoomID );				--Boss - �V���ͩR - �I�i�@��
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossVampire" ] , 2 );	--�s��Boss�I�i�V���ͩR
			VampireRecordB = true;	--�����w�I�i�L
			while CheckBuff( Boss , g_Buff_Vampire_A_ID ) == true do sleep( 5 ) end	--�Y�V���ͩR�����A�٦b�A�h����0.5��
			
		elseif Lua_PercentHP( Boss ) <= g_Buff_Vampire_HP_1 and VampireRecordA == false then
			g_VampireTarget[ RoomID ] = HateList[ 1 ];							--�N����̰��ؼмg�i�V���ͩR�����������ܼƤ�
			CallPlot( Boss , "Z34_BOSS5_Boss_Vampire" , RoomID );				--Boss - �V���ͩR - �I�i�@��
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossVampire" ] , 2 );	--�s��Boss�I�i�V���ͩR
			VampireRecordA = true;	--�����w�I�i�L
			while CheckBuff( Boss , g_Buff_Vampire_A_ID ) == true do sleep( 5 ) end	--�Y�V���ͩR�����A�٦b�A�h����0.5��
		end
		
		--��ƧP�_����
		if FightClock % g_FrenzyTime[ g_Difficulty[ RoomID ] ] == 0 and FrenzyRecord == false then	--�g�ɬ�ƻP����P�_
			AddBuff( Boss , g_FrenzyBuff , 0 , -1 );	--�����ۨ�Buff�G�g��
			ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "BossFrenzy" ] , 2 );	--�s��Boss�g��
			FrenzyRecord = true;	--�����w�g��
			
		elseif FightClock % g_Skill_BigSkill_CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
			CallPlot( Boss , "Z34_BOSS5_Boss_BigSkill" , Boss , RoomID , HateList );	--Boss - ���۬I�i�@��
			
		elseif FightClock % g_Skill_DarkFear_CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
			CastSpellLV( Boss , Boss , g_Skill_DarkFear_ID , 0 );	--�I�i�G�º�����
			
		elseif FightClock % g_Skill_Usually_CD == 0 then
			while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
			if RandRange( 1 , 2 ) == 1 then	--�H���G��@
				CastSpellLV( Boss , Boss , g_Skill_Usually_A_ID , 0 );	--�I�i�G��������
			else
				if #HateList > 1 then	CastSpellLV( Boss , HateList[ 2 ] , g_Skill_Usually_B_ID , g_Skill_Usually_B_Lv[ g_Difficulty[ RoomID ] ] );	--�隸������̬I�i�G�ѫo�h�d
				else					CastSpellLV( Boss , HateList[ 1 ] , g_Skill_Usually_B_ID , g_Skill_Usually_B_Lv[ g_Difficulty[ RoomID ] ] );	--��̰�����̬I�i�G�ѫo�h�d
				end
			end
		end
	end	
end

---------------------------------Boss - ���۬I�i�@��---------------------------------
function Z34_BOSS5_Boss_BigSkill( Boss , RoomID , HateList )
	local MobList = {};
	MobList[ 1 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobA_GUID[ g_Difficulty[ RoomID ] ] );	--���X���W�Ҧ����l���]����
	MobList[ 2 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobB_GUID[ g_Difficulty[ RoomID ] ] );	--���X���W�Ҧ����G�Ƨ]����
	MobList[ 3 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobC_GUID[ g_Difficulty[ RoomID ] ] );	--���X���W�Ҧ����g���]����
	local MobCount = #MobList[ 1 ] + #MobList[ 2 ] + #MobList[ 3 ];
	
	if MobCount > 0 then	SysCastSpellLV( Boss , Boss , g_Skill_BigSkill_C_ID , MobCount - 1 );	end	--�I�i�G�l���]����
	
	--�M���|�b���W���]����
	for i = 1 , #MobList do
		if #MobList[ i ] > 0 then
			for j = 1 , #MobList[ i ] do
				DelObj( MobList[ i ][ j ] );
			end
		end
	end
	
	--�l��s���]���̻P�I�i�k�N
	if RandRange( 1 , 2 ) == 1 then	--�H���G��@
		for i = g_FlagNum_Mob_1 , g_FlagNum_Mob_2 , 1 do
			local Mob = CreateObjByFlag( g_MobA_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID , i , 1 );	--�l���]����
			SetModeEx( Mob , EM_SetModeType_Mark , true );			--�I��(�O)
			SetModeEx( Mob , EM_SetModeType_ShowRoleHead , true ); 	--�Y����(�O)
			SetModeEx( Mob , EM_SetModeType_Fight , true );			--���(�O)
			SetModeEx( Mob , EM_SetModeType_Strikback , true );		--����(�O)
			SetModeEx( Mob , EM_SetModeType_Searchenemy , true );	--����(�O)
			SetModeEx( Mob , EM_SetModeType_Move , true ); 			--����(�O)
			AddToPartition( Mob , RoomID );
			g_Mob[ i ][ RoomID ] = Mob;	--�N�p�ǽs���g�i�����ܼƤ�
			CallPlot( Mob , "Z34_BOSS5_MobA_Fight" , Mob , RoomID );	--�l���]���� - �԰��@��
		end
		CallPlot( g_Mob[ g_FlagNum_Mob_1 ][ RoomID ] , "Z34_BOSS5_Mob_Assembly" , RoomID );	--�]���� - �P�_�Z���X��@��
		CastSpellLV( Boss , HateList[ 1 ] , g_Skill_BigSkill_A_ID , g_Skill_BigSkill_A_Lv[ g_Skill_Usually_B_Lv[ g_Difficulty[ RoomID ] ] ] );	--��̰�����̬I�i�G�ѫo����
		ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "CallMobA" ] , 2 );	--�s���l��l���]����
	else
		for i = g_FlagNum_Mob_1 , g_FlagNum_Mob_2 , 1 do
			local Mob = CreateObjByFlag( g_MobB_GUID[ g_Difficulty[ RoomID ] ] , g_FlagID , i , 1 );	--�G�Ƨ]����
			SetModeEx( Mob , EM_SetModeType_Mark , true );			--�I��(�O)
			SetModeEx( Mob , EM_SetModeType_ShowRoleHead , true ); 	--�Y����(�O)
			SetModeEx( Mob , EM_SetModeType_Fight , true );			--���(�O)
			SetModeEx( Mob , EM_SetModeType_Strikback , false );	--����(�_)
			SetModeEx( Mob , EM_SetModeType_Searchenemy , false );	--����(�_)
			SetModeEx( Mob , EM_SetModeType_Move , true ); 			--����(�O)
			AddToPartition( Mob , RoomID );
			g_Mob[ i ][ RoomID ] = Mob;	--�N�p�ǽs���g�i�����ܼƤ�
			CallPlot( Mob , "Z34_BOSS5_MobB_Fight" , Mob , RoomID );	--�G�Ƨ]���� - �԰��@��
		end
		CallPlot( g_Mob[ g_FlagNum_Mob_1 ][ RoomID ] , "Z34_BOSS5_Mob_Assembly" , RoomID );	--�]���� - �P�_�Z���X��@��
		CastSpellLV( Boss , Boss , g_Skill_BigSkill_B_ID , 0 );	--�I�i�G�������q
		ScriptMessage( Boss , -1 , 2 , g_BossTalk[ "CallMobB" ] , 2 );	--�s���l��G�Ƨ]����
	end
end

---------------------------------Boss - �V���ͩR�����@��---------------------------------
function Z34_BOSS5_Boss_Vampire( RoomID )	--Boss - �V���ͩR - �I�i�@��
	local Boss = g_Boss[ RoomID ];	--Boss
	AddBuff( Boss , g_Buff_Vampire_A_ID , 0 , -1 );				--�����ۨ�Buff�G�V���ͩR
	AddBuff( g_VampireTarget[ RoomID ] , g_Buff_Vampire_B_ID , 0 , -1 );	--�����ؼ�Buff�G�w�t
	while ReadRoleValue( Boss , EM_RoleValue_SpellMagicID ) ~= 0 do sleep( 2 ) end	--�Y�٦��ޯ�b�I�i���h����0.2��
	local TargetPos = Vector_GetRolePos( g_VampireTarget[ RoomID ] );	--���X�ؼЪ��y��
	local Dir = ReadRoleValue( Boss , EM_RoleValue_Dir );				--���X�ۨ����V
	SetPos( Boss , TargetPos.x , TargetPos.y , TargetPos.z , Dir );		--�ǦܥؼЪ���m
	CastSpellLV( Boss , Boss , g_skill_Vampire_Casting_ID , 0 );	--�I�i�G�V���ͩR - ��t�άI�k
end

function Z34_BOSS5_Boss_Vampire_Spell()	--Boss - �V���ͩR - �C��I��@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	SysCastSpellLV( g_Boss[ RoomID ] , g_VampireTarget[ RoomID ] , g_skill_Vampire_ID , 0 );	--�I�i�G�V���ͩR
end

function Z34_BOSS5_Boss_Vampire_TimeOut()	--Boss - �V���ͩR - ���A�ɶ���@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	for i = 1 , HateListCount( g_Boss[ RoomID ] ) do
		if HateListInfo( g_Boss[ RoomID ] , i , EM_HateListInfoType_GItemID ) == g_VampireTarget[ RoomID ] then
			SetHateListPoint( g_Boss[ RoomID ] , i , 1 );	--�N�ؼФ���ȭ���1�I
		end
	end
end

function Z34_BOSS5_Boss_Vampire_End()	--Boss - �V���ͩR - ���A�����@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	if ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID ) == g_skill_Vampire_Casting_ID then
		MagicInterrupt( OwnerID() );	--���_�۩G��t
	end
	CancelBuff( g_VampireTarget[ RoomID ] , g_Buff_Vampire_B_ID );	--�Ѱ��ؼ�Buff�G�w�t
	g_VampireTarget[ RoomID ] = 0;	--�M�Ŭ����Ϊ������ܼ�
end

---------------------------------�l���]���� - �԰��@��---------------------------------
function Z34_BOSS5_MobA_Fight( Mob , RoomID )
	AddBuff( Mob , g_Buff_MobFollow_ID_A , 0 , -1 );	--�����ۨ�Buff�G�ؼ���w
	local LuckyGuy = 0;	--�ݷ|�n�Q�����H�|��o
	
	while LuckyGuy == 0 or ReadRoleValue( LuckyGuy , EM_RoleValue_IsDead ) == 1 do	--�S�ؼЩάO�ؼФw���`�A�N����ؼ�
		Sleep( 10 );
		local PlayerList = LUA_YOYO_RangePlayerNotGM( Mob , 2000 ); --����ۤv�Z��2000���Ҧ����a�A�ư�GM
		if #PlayerList == 0 then
			return
		elseif #PlayerList == 1 then
			LuckyGuy = PlayerList[ 1 ];	--�u���@�H�����p
		else
			while LuckyGuy == 0 do
				local LuckyNumber = RandRange( 1 , #PlayerList );
				if PlayerList[ LuckyNumber ] == ReadRoleValue( g_Boss[ RoomID ] , EM_RoleValue_AttackTargetID ) then
					table.remove( PlayerList , LuckyNumber );	--�ؼЭY���Z�h�q�M�沾��
				else LuckyGuy = PlayerList[ LuckyNumber ];
				end
			end
		end
		SetAttack( Mob , LuckyGuy );	--�R�O�l���]���̥��H
		AddBuff( LuckyGuy , g_Buff_MobFollow_ID_B , 0 , -1 );	--�����ؼ�Buff�G�l���H��
	end
end

---------------------------------�G�Ƨ]���� - �԰��@��---------------------------------
function Z34_BOSS5_MobB_Fight( Mob , RoomID )
	AddBuff( Mob , g_Buff_Spread_ID , 0 , -1 );	--�����ۨ�Buff�G�G���X��
	--���Ⱖ�G�Ƨ]���̤��۩��ﭱ�X�l����
	if Mob == g_Mob[ g_FlagNum_Mob_1 ][ RoomID ] then
		LuaFunc_MoveToFlag( Mob , g_FlagID , g_FlagNum_Mob_2 , 0 );
	elseif Mob == g_Mob[ g_FlagNum_Mob_2 ][ RoomID ] then
		LuaFunc_MoveToFlag( Mob , g_FlagID , g_FlagNum_Mob_1 , 0 );
	end
end

---------------------------------�G�Ƨ]���� - �G���X�� - �ˬd�ؼЬO�_�����a---------------------------------
function Z34_BOSS5_Skill_CheckPlayer()
	if OwnerID() == TargetID() then return false	--���|�ǬV���ۤv
	elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then return true
	else return false
	end
end

---------------------------------�G�Ƨ]���� - �G�Ƥz�Z - �ˬd�ؼЬO�_��BOSS---------------------------------
function Z34_BOSS5_Skill_CheckBoss()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == g_Boss_GUID[ 1 ]
	or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == g_Boss_GUID[ 2 ]
	or ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == g_Boss_GUID[ 3 ] then
		if ReadRoleValue( TargetID() , EM_RoleValue_SpellMagicID ) == g_Skill_BigSkill_B_ID then	--Boss���b�I�i�������q
			MagicInterrupt( TargetID() );	--���_�۩G
			ScriptMessage( TargetID() , -1 , 2 , g_BossTalk[ "Interrupt" ] , 2 );	--�s���������q�Q���_
		end
		return true
	else return false
	end
end
---------------------------------�]���� - �P�_�Z���X��@��---------------------------------
function Z34_BOSS5_Mob_Assembly( RoomID )
	while true do
		Sleep( 5 );
		local Pos = Vector_GetRolePos( OwnerID() );					--���X�ۨ����y��
		local Dir = ReadRoleValue( OwnerID(), EM_RoleValue_Dir );	--���X�ۨ����V
		if CheckDistance( g_Mob[ g_FlagNum_Mob_1 ][ RoomID ] , g_Mob[ g_FlagNum_Mob_2 ][ RoomID ] , 25 ) == true then
			local MobC = CreateObj( g_MobC_GUID[ g_Difficulty[ RoomID ] ] , Pos.x , Pos.y , Pos.z , Dir , 1 );	--�g���]����
			SetModeEx( MobC , EM_SetModeType_Mark , true );			--�I��(�O)
			SetModeEx( MobC , EM_SetModeType_ShowRoleHead , true ); --�Y����(�O)
			SetModeEx( MobC , EM_SetModeType_Fight , true );		--���(�O)
			SetModeEx( MobC , EM_SetModeType_Strikback , true );	--����(�O)
			SetModeEx( MobC , EM_SetModeType_Searchenemy , true );	--����(�O)
			SetModeEx( MobC , EM_SetModeType_Move , true ); 		--����(�O)
			AddToPartition( MobC , RoomID );
			--�R���X��e���p��
			DelObj( g_Mob[ g_FlagNum_Mob_1 ][ RoomID ] );	
			DelObj( g_Mob[ g_FlagNum_Mob_2 ][ RoomID ] );
			ScriptMessage( MobC , -1 , 2 , g_BossTalk[ "MobMerge" ] , 2 );	--�s���Ⱖ�]���̦X�馨�g���]����
		end
	end
end
---------------------------------�g���]���� - �]���D�����@��---------------------------------
function Z34_BOSS5_MobC_Split()	--���b502035�����GLUA
	local TargetName = Getname( TargetID() );	--�ؼЦW��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local Pos = Vector_GetRolePos( TargetID() );				--���X�ؼЪ��y��
	local Dir = ReadRoleValue( TargetID(), EM_RoleValue_Dir );	--���X�ؼЭ��V
	local NewMobC = CreateObj( g_MobC_GUID[ g_Difficulty[ RoomID ] ] , Pos.x , Pos.y , Pos.z , Dir , 1 );
	SetModeEx( NewMobC , EM_SetModeType_Mark , true );			--�I��(�O)
	SetModeEx( NewMobC , EM_SetModeType_ShowRoleHead , true ); 	--�Y����(�O)
	SetModeEx( NewMobC , EM_SetModeType_Fight , true );			--���(�O)
	SetModeEx( NewMobC , EM_SetModeType_Strikback , true );		--����(�O)
	SetModeEx( NewMobC , EM_SetModeType_Searchenemy , true );	--����(�O)
	SetModeEx( NewMobC , EM_SetModeType_Move , true ); 			--����(�O)
	AddToPartition( NewMobC , RoomID );
	ScriptMessage( NewMobC , -1 , 2 , g_BossTalk[ "MobCSplit" ] .. TargetName .. "]" , 2 );	--�s���g���]���̤���
end

---------------------------------������ - �M���@��---------------------------------
function Z34_BOSS5_CtrlCenter_Clear( CtrlCenter , RoomID )
	local MobList = {};
	MobList[ 1 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobA_GUID[ g_Difficulty[ RoomID ] ] );	--���X���W�Ҧ����l���]����
	MobList[ 2 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobB_GUID[ g_Difficulty[ RoomID ] ] );	--���X���W�Ҧ����G�Ƨ]����
	MobList[ 3 ] = LUA_YOYO_GetSpecificNPC( RoomID , g_MobC_GUID[ g_Difficulty[ RoomID ] ] );	--���X���W�Ҧ����g���]����
	
	--�M���|�b���W���]����
	for i = 1 , #MobList do
		if #MobList[ i ] > 0 then
			for j = 1 , #MobList[ i ] do
				DelObj( MobList[ i ][ j ] );
			end
		end
	end
end