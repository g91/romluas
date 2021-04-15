-- 2015.09.03 ���E�G�ץ��|�v�T��y�{���s��覡�A�קK���s�γJ���|�Q���T���m�����D -- 
-- �ëإߥH�U�A�Ω� function �������ܼơA���B�w�q�ܼơA���v�T��L function  -- 
local g_CheckObj = {};		-- ���b����A���s�J�P���s���ͮɡA���U�i�����A�P�p�j����ܮɡA�|�T�{�U���q�����ͪ���O�_���`
g_CheckObj.DragonEgg = 0;
g_CheckObj.Dragon = 0;

local g_FightStatus = 0;	-- �D�԰����A�w�]��
-- g_FightStatus = 1 �ɬ��s�J�ͦ�
-- g_FightStatus = 2 �ɬ����s�ͦ�

local g_ObjID = {};	-- �y�{����M��A���s�J(121185)�B���s(107149)
g_ObjID.DragonEgg = 121185;	-- �s�J(Ĳ�I�@����)
g_ObjID.Dragon = 107149;	-- �s(�԰��@���P���y)

local g_CreateFlag = 781180;	-- �ͦ��s�J�P���s���X�нs��

local g_KeyItem = {};	-- ���n���~�M��
g_KeyItem.Fight = 546905;	-- ���ʶi�椤
g_KeyItem.Complete = 546907;	-- ���Ȥw����
g_KeyItem.KillDragon = 546910;	-- ���w�O�s
g_KeyItem.GiftLv = {};	-- ���y�϶�
g_KeyItem.GiftLv[1] = 546903;	-- �������Ĥ��� * 1�A���� 0 ��
g_KeyItem.GiftLv[2] = 546904;	-- �����I�ƨ� * 1�A���� 1 ~ 10 ��
g_KeyItem.GiftLv[3] = 546906;	-- �����I�ƨ� * 3�A���� 11 ~ 30 ��
g_KeyItem.GiftLv[4] = 546909;	-- �����I�ƨ� * 5�A���� 31 ���H�W

local g_Msg = {};
g_Msg[1] = "[SC_2012FAIRY_JOHN1]"	-- ��ܭ����G�G�ƮѸ̭������s�K�K�e�K�K�e�]�X�ӤF�I
g_Msg[2] = "[SC_2012FAIRY_JOHN2]"	-- ��ܦ����G�Ӧn�F�I�a��[623277]�a�I���s�X�{����A�A�N�|�ܦ����ܤ����i�̡G
g_Msg[3] = "[SC_2012FAIRY_JOHN3]"	-- �ڵ��ﶵ�G�Ʊ�A��A�Ҽ{�Ҽ{�A�n�ܡH
g_Msg[4] = "[SC_2012FAIRY_JOHN4]"	-- �԰����G�G�ƮѤ����i�̶}�l���s�j�ԤF�I�n�����I
g_Msg[5] = "[SC_2012FAIRY_JOHN5]"	-- �����ﶵ�G�A���W�ݯd�۬G�ƮѪ����D�A���ѵL�k�A���������ܭ^���F�I
g_Msg[6] = "[SC_2012FAIRY_JOHN9]"	-- �������ȫ�A����ܡG�Ʊ�A�i�H���Q�Q�泌�s�A�o�ˬG�ƮѤ��g���N�|�X�{�A���G�ƤF�I

g_Msg.Reward = {};
g_Msg.Reward["Fail"] = {};	-- ���Ѯɦr��
g_Msg.Reward["Success"] = {};	-- ���\�ɦr��
g_Msg.Reward["Fail"][1] = "[SC_2012FAIRY_JOHN6]"	-- �O�s���ѡA�O�s���� <= 30
g_Msg.Reward["Fail"][2] = "[SC_2012FAIRY_JOHN7]"	-- �O�s���ѡA�O�s���� > 30
g_Msg.Reward["Success"][1] = "[SC_2012FAIRY_JOHN8]"	-- �O�s���\�A�O�s���� < 30
g_Msg.Reward["Success"][2] = "[SC_2012FAIRY_JOHN10]"	-- �O�s���\�A�O�s���� => 30

local g_Ticket = 623277;	-- ���WBuff
local g_DragonHp = 623321;	-- ���s��O��
local g_PlayerHp = 623278;	-- ���a��O��

local g_BossBuff = {};	-- ���s��Buff(�N���F��)
g_BossBuff.ResMagic = 623279;	-- �l���]�k�F��A���a�H�]�k�������s�ɡA�|�v�����s 1 �I Hp
g_BossBuff.ResPhysical = 623280;	-- �l�����z�F��A���a�H���z�������s�ɡA�|�v�����s 1 �I Hp
g_BossBuff.UnDead = 623281;	-- �l�����z�P�]�k�F��A�Ȧ��v���i�y���ˮ`

-- �O���C��ѥ[���ʦ������o���A���N�¦��H���a���W�� Reg+1 �������ƪ��@�k�A�] Reg �ȥu���b���u�ɭ��m�A�G���ϡB���}���ʽd�򵥡A���|�ɭP��L�ϥ� Reg+1 �����ʤ޵o���������D
-- ��H DBID �O���o���A�C�Ө���b�гy��A�b ���A�� �ݳ��|���@�ӿW�@�L�G���T�w ID ���Ѭd�ߡA�o�� ID �N�O DBID
local g_HeroPoints;
---------------------------------------------------------------------------------------
function Lua_na_2012Fairy_LittleJohn()	-- �p�j��(121053) ���󲣥ͼ@��

	local LittleJohn = OwnerID();
	BeginPlot( LittleJohn , "LuaN_miyon_action02" , 0 );	-- �������ʬݪOBuff

	g_HeroPoints = {};

	while true do
		if g_FightStatus == 2 then	-- ���s���ͮ�
			PlayMotion( LittleJohn, 149 );	-- �ۤU
		else
			PlayMotion( LittleJohn, ruFUSION_ACTORSTATE_EMOTE_CRY );
			Sleep( 25 );
			PlayMotion( LittleJohn, ruFUSION_ACTORSTATE_EMOTE_CRY );
			Sleep( 25 );
		end
		sleep( 10 );
	end
end

function Lua_na_12fairy_JohnSPK()	-- �p�j��(121053) ��ܼ@��

	local Owner = OwnerID();	-- ���a
	local LittleJohn = TargetID();	-- �p�j��

	local Reward = {};	-- ���y
	Reward[1] = { 724509, 1 };	-- �������Ĥ��� * 1
	Reward[2] = { 240059, 1 };	-- �����I�ƨ� * 1
	Reward[3] = { 240059, 3 };	-- �����I�ƨ� * 3
	Reward[4] = { 240059, 5 };	-- �����I�ƨ� * 5

	-- ���b����A�קK������]�ɭP�s�J�B���s�Q�R���A�ө�����������D
	local IsDragonEggAlive = CheckID( g_CheckObj.DragonEgg );
	local IsDragonAlive = CheckID( g_CheckObj.Dragon );

	DebugMsg( Owner, 0, "Stage = "..g_FightStatus..", Dragon egg alive = "..tostring(IsDragonEggAlive)..", Dragon alive = "..tostring(IsDragonAlive) );
	if g_FightStatus == 1 and not IsDragonEggAlive then
		if CheckBuff( Owner, g_Ticket ) then
			CancelBuff_NoEvent( Owner, g_Ticket );
		end
		if IsDragonAlive then
			DelObj( g_CheckObj.Dragon );
		end
		g_FightStatus = 0;
	elseif g_FightStatus == 2 and not IsDragonAlive then
		if IsDragonEggAlive then
			DelObj( g_CheckObj.DragonEgg );
		end
		g_FightStatus = 0;
	end
	-- 

	if CheckFlag( Owner, g_KeyItem.Complete ) == true then	-- ���w��������

		local ReceiveGift = false;	-- ������y
		local IsValor = false;	-- �O�s���ƬO�_�W�L 30 

		for i = 1, #g_KeyItem.GiftLv do	-- �������y
			if CheckFlag( Owner, g_KeyItem.GiftLv[i] ) then	-- ���d�߲ŦX�����y�϶�
				DebugMsg( Owner, 0, "Reward Lv = "..i );	-- 	-- ���y�϶�
				if i == #g_KeyItem.GiftLv then	-- �O�s���� > 30
					IsValor = true;
				end
				ReceiveGift = true;	-- ���\������y
				SetFlag( Owner, g_KeyItem.GiftLv[i], 0 );	-- �����ŦX���y�϶������y
				GiveBodyItem( Owner, Reward[i][1], Reward[i][2] );	-- �������y
				Lua_Festival_08_All(Owner);	-- ���Լ��P�_
				break;
			end
		end

		if not ReceiveGift then	-- �w������y
			SetSpeakDetail( Owner ,g_Msg[5] );	-- �A���W�ݯd�۬G�ƮѪ��𮧡A���ѵL�k�A���������ܭ^���F�I
			return
		end
		DebugMsg( Owner, 0, "IsValor = "..tostring(IsValor) );
		if CheckFlag( Owner, g_KeyItem.KillDragon ) then	-- �O�����\
			if IsValor then	-- �O�s���� 31 �H�W
				SetSpeakDetail( Owner, g_Msg.Reward["Success"][2] );
			else	-- �O�s���� 0 ~ 30
				SetSpeakDetail( Owner, g_Msg.Reward["Success"][1] );
				end
			SetFlag( Owner, g_KeyItem.KillDragon, 0 );
		else	-- �O������
			if IsValor then	-- �O�s���� 31 �H�W
				SetSpeakDetail( Owner, g_Msg.Reward["Fail"][2] );
			else	-- �O�s���� 0 ~ 30
				SetSpeakDetail( Owner, g_Msg.Reward["Fail"][1] );
			end
		end

	elseif CheckBuff( Owner, g_Ticket ) then	-- ���ѥ[���ʪ� Buff ��
		SetSpeakDetail( Owner , g_Msg[6] );	-- �Ʊ�A�i�H���Q�Q�泌�s�A�o�ˬG�ƮѤ��g���N�|�X�{�A���G�ƤF�I
	else	-- ��饼��������
		if g_FightStatus == 2 then	-- ���s�J�B���s�w���ͮ�
			SetSpeakDetail( Owner, g_Msg[4] );	-- ���ܤ����i�̶}�l���s�j�ԤF�I�n�����I
			return
		end
		SetSpeakDetail( Owner, g_Msg[1] );	-- ��K�K��K�K�K�K�G�ƮѸ̭������s�K�K�e�K�K�e�]�X�ӤF�I
		AddSpeakOption( Owner, LittleJohn, "[SC_0908SEANSON_53]", "Lua_na_12fairy_John1", 0 );	-- �n�A���ڨ����A�a�I
		AddSpeakOption( Owner, LittleJohn, "[SO_GETVOC_NO]", "Lua_na_12fairy_No", 0 );
	end
end

function Lua_na_12fairy_No() --�ڵ�

	local Owner = OwnerID();	-- ���a
	SetSpeakDetail( Owner , g_Msg[3] );	-- �O��K�K
end

function Lua_na_12fairy_John1()

	local Owner = OwnerID();	-- ���a
	local LittleJohn = TargetID();	-- �p�j��

	if g_FightStatus == 2 then	-- ���s���ͮɡA�N�������a��������
		SetSpeakDetail( Owner , g_Msg[4] );	-- ���ܤ����i�̶}�l���s�j�ԤF�I�n�����I
		return
	end
	SetSpeakDetail( Owner, g_Msg[2] ); 	--�Ӧn�F�I���s�X�{����A�A�N�|�ܦ����ܤ����i�̡G�i���ܹC�C�h�j�Ρi�����]�Ův�j�C
	AddSpeakOption( Owner, LittleJohn, "[SC_TRAIN10_NPC_SPEAK04]", "Lua_na_12fairy_trans", 0 );	-- �ڷǳƦn�F
end

function Lua_na_12fairy_trans()

	local Owner = OwnerID();	-- ���a
	local LittleJohn = TargetID();	-- �p�j��

	CloseSpeak( Owner );
	AddBuff( Owner, g_Ticket, 0, -1 );	-- �������WBuff
	SetFlag( Owner, g_KeyItem.Fight, 1 );	-- ���ʶi�椤
	SysCastSpellLv( Owner, Owner, 499522, 0 );	-- �N���a�ǰe���s�J(���s)����

	if g_FightStatus == 0 then	-- �Ĥ@�Ӷi�J���ﶵ�����a�|�I�s�p�j�������s�J���@��
		g_FightStatus = 1;
		CallPlot( LittleJohn, "Hao_Fairy_CreateDragonEgg", LittleJohn );
	end
end

function Hao_Fairy_CreateDragonEgg( LittleJohn )	-- �Ѥp�j�����沣���s�J���@��

	local DragonEgg = CreateObjByFlag( g_ObjID.DragonEgg, g_CreateFlag, 0, 1 );	 -- �s�J
	SetModeEx( DragonEgg, EM_SetModeType_ShowRoleHead, true );	--�Y����
	SetModeEx( DragonEgg, EM_SetModeType_Move, false );	-- ����
	SetModeEx( DragonEgg, EM_SetModeType_SearchenemyIgnore, true );	-- �Q�j�M
	AddToPartition( DragonEgg , 0 ); -- �إߪ���

	g_CheckObj.DragonEgg = DragonEgg;	-- �N�s�J���U�i�ʱ��M�椤

	local NpcList = SearchRangeNPC( DragonEgg, 400 );
	local OrgID = 100938;	-- �Z��R����ĵ��

	for i = 0 , #NpcList do
		if ReadRoleValue( NpcList[i], EM_RoleValue_OrgID ) == OrgID then
			DelFromPartition( NpcList[i] );	-- �R���d�򤺪�ĵ�áA�קKĵ�ç����s
		end
	end
	SetPlot( DragonEgg, "touch", "Hao_Fairy_DragonEggPlot", 40 );	-- �s�J��Ĳ�I�@��
end

function Hao_Fairy_DragonEggPlot()	-- �s�J��Ĳ�I�@��

	local Owner = OwnerID();	-- �I���s�J�����a
	local DragonEgg = TargetID();	-- �s�J
	local PID = ReadRoleValue( DragonEgg, EM_RoleValue_PID );	-- �O�_�w�ͦ����s
	local HeroList = {};	-- �ѻP�������Q���s�����a�M��
	local Needs = 3;	-- ���ʻݨD�H��

	if PID == 1 then	-- �Ƽƪ��a�P���I���s�J��
		ScriptMessage( Owner, Owner, 2, "[SC_422804]", C_SYSTEM );	-- �ؼЦ��L��
		return
	end

	if not CheckBuff( Owner, g_Ticket ) or not CheckFlag( Owner, g_KeyItem.Fight ) then	-- ���ѥ[���ʪ����a�I���s�J��
		ScriptMessage( Owner,  Owner, 2, "[SC_2012FAIRY_DRAGON05]", C_SYSTEM );	--  �o�O�@�����j���J
		return
	end

	WriteRoleValue( DragonEgg, EM_RoleValue_PID, 1 );
	local Player = SearchRangePlayer( DragonEgg, 200 );	-- �j�M�s�J�P�� 200 �������a

	for i = 0 , #Player do
		DW_CancelTypeBuff( 68, Player[i] );	-- �������M���A
		if CheckBuff( Player[i], g_Ticket ) == true and CheckFlag( Player[i], g_KeyItem.Fight )== true then
			table.insert( HeroList, Player[i] );
		end
	end
--	DebugMsg( Owner, 0, "Now Heroes = "..#HeroList );

	if #HeroList < Needs then	-- �P��ѻP�����a�H�Ƥ�����
		ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON08]", 0 );	-- �b���s�J����A�S�������������ܫi�̪��_�I�̡C
		WriteRoleValue( DragonEgg, EM_RoleValue_PID, 0 );
		return
	end

	g_HeroPoints = {};	-- ���m�C��ѻP�������o��
	g_FightStatus = 2;	-- �԰����q�A�N���s�w�ͦ��A������L�����W�����a���W
	SetPlot( DragonEgg, "touch", "", 40 );	-- �����s�J��Ĳ�I�@��
	SetModeEx( DragonEgg, EM_SetModeType_Show, false );	-- �������
	SetModeEx( DragonEgg, EM_SetModeType_Mark, false );	-- �����аO
	SetModeEx( DragonEgg, EM_SetModeType_HideName, true );	-- ���æW��
	SetModeEx( DragonEgg, EM_SetModeType_ShowRoleHead, false );	-- �����Y����
	Hide( DragonEgg );

	for i = 1, #HeroList do

		local Player = HeroList[i];
		local DBID = ReadRoleValue( Player, EM_RoleValue_DBID );
		g_HeroPoints[DBID] = 0;	-- ���m�C��ѻP�������o��
		CancelBuff_NoEvent( Player, g_Ticket );	-- �R�����W Buff �A�õ�����O�ȻP¾�~
		AddBuff( Player, 623055, 0, 3 );	-- ����ܪ�BUFF�A�@���P�_�Z����
		AddBuff( Player, g_PlayerHp, 9, -1 );	-- �������a��O��
		if i%2 == 1 then
			AddBuff( Player, 623313, 0, -1 );	-- ��Ƭ����ܹC�C�h
		else
			AddBuff( Player, 623315, 0, -1 );	-- ���Ƭ������]�Ův
		end
	end

	local Dragon = CreateObjByFlag( g_ObjID.Dragon, g_CreateFlag, 0, 1 );	-- ���s
	SetModeEx( Dragon, EM_SetModeType_Move, true )	-- ����
	SetModeEx( Dragon, EM_SetModeType_Searchenemy, true )	-- ����
	SetModeEx( Dragon, EM_SetModeType_ShowRoleHead, true )	-- �Y����
	SetModeEx( Dragon, EM_SetModeType_Fight, true )	-- �i�������
	SetModeEx( Dragon, EM_SetModeType_Drag , false )	-- ���O
	AddToPartition( Dragon, 0 ) -- �إߪ���
	g_CheckObj.Dragon = Dragon;	-- �N���s���U�i�ʱ��M�椤

	CallPlot( Dragon, "Hao_Fairy_DragonFight", Dragon, DragonEgg, HeroList );
end

function Hao_Fairy_DragonFight( Dragon, DragonEgg, HeroList )	-- �ѥ��s���楨�s�����ͼ@�� ( ���s�B�s�J�B�ѻP�������ʪ����a�M�� )

	local Msg = {};
	Msg.Counter = {};
	Msg.Counter[1] = { 240, "[SC_2012FAIRY_DGMES1]" };	-- ���s���g�T�w�g������n�A���@�������ᥨ�s�N�|�����C
	Msg.Counter[2] = { 270, "[SC_2012FAIRY_DGMES2]" };	-- 30����A���s�N�|�����I
	Msg.Counter[3] = { 300, "[SC_2012FAIRY_DGMES3]" };	-- ���s���g�T�w�g�����A���ܥ��s�����F�I

	AddBuff( Dragon, g_DragonHp, 99, -1 );	-- ���s��O��
	Say( Dragon, "[SC_2012FAIRY_DRAGON_SAY1]" );	-- �O...��...��...��...��...��...��...��...��...��......
	PlayMotion( Dragon, ruFUSION_ACTORSTATE_BUFF_SP02 );	-- ����n���ʧ@

	local Counter = 0;	-- �p�ƾ�
	local OverTime = false;	-- �W�L 300 ��A���s�����C

	while true do

		Sleep(10);
		Counter = Counter + 1;
	--	DebugMsg( 0, 0, "Counter = "..Counter );

		if Counter > Msg.Counter[3][1] then	-- �W�L 300 ��
			OverTime = true;
		end

		for i = #HeroList, 1, -1 do
			local Player = HeroList[i];

			if not CheckID( Player ) then	-- ��ؼФ��s�b
			--	DebugMsg( 0, 0, "Remove player, miss target" );
				table.remove( HeroList, i );
			elseif not CheckFlag( Player, g_KeyItem.Fight ) then	-- ��ؼЫD�԰�����
			--	DebugMsg( 0, 0, "Remove player, out of combat" );
				table.remove( HeroList, i );
			elseif not CheckBuff( Player, g_PlayerHp ) then	-- ��ؼеL��O�Ȯ�
			--	DebugMsg( 0, 0, "Remove player, dead" );
				table.remove( HeroList, i );
			else	-- �Z���P�_�P�o�e�T��
				for j = 1, #Msg.Counter do	-- ���ʶi��ɶ��A�o�e�T��
					if CheckID( Player ) and Counter == Msg.Counter[j][1] then
						ScriptMessage( Player, Player, 1, Msg.Counter[j][2], 0 );
					end
				end

		 		local Distance = GetDistance( Player, DragonEgg );	-- �ʱ��Z��
				if Distance > 200 then
					CancelBuff( Player, g_PlayerHp );
					table.remove( HeroList, i );
				--	DebugMsg( 0, 0, "Remove player, out of range" );
				else
					AddBuff( Player, 623055, 0, 3 );	-- ����ܪ�BUFF�A�@���P�_�Z����
					if Distance > 150 then
						ScriptMessage( Player, Player, 1, " [SC_2012FAIRY_DRAGON06]", 0 );	-- ĵ�i�I�Z�����s�L���A���ܤH���g�����ĪG�N�|�����C
					end
				end
			end
		end

		if #HeroList == 0 or OverTime then	-- ��d�򤺨S���i�次�ʪ����a��
			
			if not OverTime then
				Yell( Dragon, "[SC_2012FAIRY_DRAGON_SAY2]", 2 );	--�����I����y���ܫi�̡z�I�u�O�@�s�x�p���A�s����ڪ��i�𳣨S���I
			--	Say( Dragon, "[SC_2012FAIRY_DRAGON_SAY2]" );	--�����I����y���ܫi�̡z�I�u�O�@�s�x�p���A�s����ڪ��i�𳣨S���I
			end
			SetModeEx( Dragon, EM_SetModeType_Fight, false );	-- �������
			g_FightStatus = 1;	-- �N���ʶ��q�g�� 1�A�N���s�J���͡A�������ͥ��s
			PlayMotionEX( Dragon, ruFUSION_ACTORSTATE_SLEEP_BEGIN, ruFUSION_ACTORSTATE_SLEEP_LOOP );	-- ���������ʧ@
			Sleep(25);
			Hide( Dragon );
			SetModeEx( Dragon, EM_SetModeType_Show, false );	-- �������
			SetModeEx( Dragon, EM_SetModeType_Mark, false );	-- �����аO
			SetModeEx( Dragon, EM_SetModeType_HideName, true );	-- ���æW��
			SetModeEx( Dragon, EM_SetModeType_ShowRoleHead, false );	-- �����Y����
			Sleep(25);
			Show( DragonEgg, 0 );
			SetPlot( DragonEgg, "touch", "Hao_Fairy_DragonEggPlot", 40 );	-- ���s�}���s�J��Ĳ�I�@��
			SetModeEx( DragonEgg, EM_SetModeType_Show, true );	-- ���
			SetModeEx( DragonEgg, EM_SetModeType_Mark, true );	-- �аO
			SetModeEx( DragonEgg, EM_SetModeType_HideName, false );	-- �����æW��
			SetModeEx( DragonEgg, EM_SetModeType_ShowRoleHead, true );	-- �Y����
			WriteRoleValue( DragonEgg, EM_RoleValue_PID, 0 );
			DelObj( Dragon );
			break;
		elseif not CheckBuff( Dragon, g_DragonHp ) then	-- ���s���`�ɡA�������y�A��{�u�������a�N�B�~��o���~ - �i�̪��s�֥]�q

			KillID( Dragon, Dragon );	-- ���񦺤`�@��

			for i = 1, #HeroList do
				local Player = HeroList[i];	-- ���ʶi�椤�����a
				local DBID = ReadRoleValue( Player, EM_RoleValue_DBID );
				SetFlag( Player, g_KeyItem.KillDragon, 1 );	-- �����O�s�ҩ�
			--	DebugMsg( Player, 0, "Dragon Dead, Point = "..g_HeroPoints[DBID] );
				if g_HeroPoints[DBID] > 29 then	-- ���T�I�k > 30 ��
					GiveBodyItem( Player, 241450 , 1 );	-- �������~ - �i�̪��s�֥]�q
				end
				local KillDragonCount = ReadRoleValue( Player, EM_LuaValueFlag_UseItem41 );	-- �ˬd���a�������s������
				WriteRoleValue( Player, EM_LuaValueFlag_UseItem41, KillDragonCount+1 );	-- �������s����+1
				if KillDragonCount + 1 > 9 then	-- ���� 10 ���H�W�����s��
					if CountBodyItem( Player, 530866 ) == 0 then	-- �ٸ� - �S���ڱ����˪��s
						GiveBodyItem( Player, 530866, 1 );
					end
					if CountBodyItem( Player, 530867 ) == 0 then	-- �ٸ� - �׵����s���i�� ( �קK�b��s�e�N�w�ֿn���� 10 ���H�W���s�����a��������� 1 �����ٸ�
						GiveBodyItem( Player, 530867, 1 );
					end
				else	-- ���� 1 ���H�W�����s��
					if CountBodyItem( Player, 530867 ) == 0 then	-- �ٸ� - �׵����s���i��
						GiveBodyItem( Player, 530867, 1 );
					end
				end
			end

			g_FightStatus = 0;	-- �N���ʶ��q�g�� 0�A�N���s�J�P���s���ͦ�
			Sleep(20);
			DelObj( Dragon );
		else
			if Counter%3 == 0 then	-- ���s�C 3 �����@������

				local RangeAttack = 850378;	-- �d��ˮ`
				local SingleAttack = 850377;	-- ����ˮ`
				local DragonBall = 121189;	-- �s���F
				local BuffTime = 10;	-- ����ɶ�(���:1��)
				local Random = Math.Random( 100 );

				if Counter%30 == 0 then	-- �C 30 ��I��@���F��
					if Random < 34 then
						Addbuff( Dragon, g_BossBuff.ResMagic, 0, BuffTime );	-- �l���]�k�t�ˮ`�A����Ƭ���O�ȡC
					elseif Random < 67 then
						Addbuff( Dragon, g_BossBuff.ResPhysical, 0, BuffTime );	-- �l�����z�t�ˮ`�A����Ƭ���O�ȡC
					else
						Addbuff( Dragon, g_BossBuff.UnDead, 0, BuffTime );	-- �l�������t���]�k�t����Ƭ���O�ȡA�ߦ��v���t�k�N�|�y���ˮ`�C
					end
				end

				if Counter%12 == 0 then	-- �C 12 ��i��@���d�����
					CastSpell( Dragon , Dragon , RangeAttack );	-- �d�����
				else	-- �C 3 ��i��@����������Ϋإ��s���F( 121189 )
					local Target = HeroList[DW_Rand( #HeroList )];	-- �H���쪺�ؼ�
					if Random < 61 then	-- 3/5 ���v
						CastSpell( Dragon, Target, SingleAttack )	-- �H���q�ѻP���ʪ����a����@�ӡA�i�����
					else	-- 2/5 ���v
						local TargetPos = Vector_GetRolePos( Target );
						local Room = ReadRoleValue( Target, EM_RoleValue_RoomID );
						local Ball = CreateObj( DragonBall, TargetPos.X, TargetPos.Y, TargetPos.Z, 0, 1 );	-- �b�ؼЦ�m�ͦ��s���F
						AddToPartition ( Ball, Room );
					end

					if Random < 6 then	-- 1/20 ���v
						Say( Dragon, "[SC_2012FAIRY_DRAGON_SAY4]" )	--�A�ٯ�Ө��h�֧����O......
					elseif Random < 11 then	-- 1/10 ���v
						Say( Dragon, "[SC_2012FAIRY_DRAGON_SAY5]" )	--�A�ݰ_�ӡA���i�f���O......
					end
				end
			end
		end
	end
end

function Lua_na_fairyplayer_DMG()	-- ���s�缾�a�ҬI�i���ˮ`�k�N(623310)

	local Owner = OwnerID();	-- ���s
	local Target = TargetID();	-- ���a
	local BuffX = FN_CountBuffLevel(Target,g_PlayerHp);

	if CheckFlag( Target, g_KeyItem.Fight ) == true and CheckBuff( Target, g_PlayerHp ) == true then	-- ���a���W�����W�����n���~�P�Ѿl��O�Ȯ�

		if CheckBuff( Target, 623318 ) == false then	-- �p�G���a���W�S���ۼv�@��
			CancelBuff( Target, g_PlayerHp );
			if BuffX > 0 then	-- ���Ѿl��O�Ȯ�
				AddBuff( Target, g_PlayerHp, BuffX-1, -1 );
			else
				CancelBuff( Target , 623313 );	-- �C�C�h
				CancelBuff( Target , 623315 );	-- �]�Ův
				SetFlag( Target, g_KeyItem.Fight, 0 );	-- �������a���b�i�次�ʪ��X��
			end
		else	-- ���a���W���ۼv�@�ޮɡA���� 1 �I���� 
			local DBID = ReadRoleValue( Target, EM_RoleValue_DBID );
			g_HeroPoints[DBID] = g_HeroPoints[DBID] + 1;
		--	DebugMsg( Target, 0, "Shield, Point = "..g_HeroPoints[DBID] );
		end
	end
end

function Lua_na_fairy_BossBall()	-- �s���F���󲣥ͼ@��

	local Owner = OwnerID();
	sleep(20);
	SysCastSpellLv( Owner, Owner, 499521, 0 );
	sleep(10);
	DelObj(Owner);
end
---------------------------------------------------------------------------------------
function Lua_na_fairy_checkboss()	-- �����b���p�N(499630)�B�j�C����(499631)���ϥ��ˬd Lua�A�Y�ؼШS�����s�L�ĳN(��ܫD���s)�ΫD���ʥؼЮɡA��ܥؼп��~

	local Target = TargetID();

	local IsPlayer = ReadRoleValue( Target, EM_RoleValue_IsPlayer );
	if IsPlayer == 1 then
		return false;
	end

	local OrgID = ReadRoleValue( Target, EM_RoleValue_OrgID );
	if OrgID ~= g_ObjID.Dragon then
		return false;
	end
	return true;
end

function Lua_na_fairy_checkTG()	-- �����b�v¡�N(499633)���ϥ��ˬd Lua�A�Y�ؼШS�����s�L�ĳN(��ܫD���s)�ΫD���ʥؼЮɡA��ܥؼп��~

	local Owner = OwnerID();
	local Target = TargetID();
	local PlayerHP = FN_CountBuffLevel( Target, g_PlayerHp );

	local IsPlayer = ReadRoleValue( Target, EM_RoleValue_IsPlayer );
	if IsPlayer == 1 then
		local PlayerHP = FN_CountBuffLevel( Target, g_PlayerHp );
		if PlayerHP > 8  then -- �ؼЬO�֦����ܽg�������a
			ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON01]", 0 );	 --�ؼе��ܭ^���ͩR�Ȥw�F�W��
			return false;
		end
		return true;
	end

	local OrgID = ReadRoleValue( Target, EM_RoleValue_OrgID );
	if OrgID ~= g_ObjID.Dragon then
		return false;
	end
	return true;
end

function Lua_na_fairyboss_DMG()	-- �j�C����(499631)�B���a�泌�s�����z�ˮ`

	local Owner = OwnerID();	-- ���a
	local Target = TargetID();	-- ���s
	local DragonHp = FN_CountBuffLevel( Target, g_DragonHp );	-- ���s��O��

	if CheckBuff( Target , 623280 ) == true then	-- �p�G�s����ܪ��z������BUFF
		ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON02]", 0 );	-- ���ܥ��s�l���F�j�C����������
		if DragonHp < 99 then
			CancelBuff( Target, g_DragonHp );
			AddBuff( Target, g_DragonHp, DragonHp+1, -1 );
		end
	elseif CheckBuff( Target , 623281 ) == true then	-- ���F�ơA�����|���s�ɦ�
		ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON04]", 0 );	-- ���s�e�{���F�ơI�Ҩ��������ˮ`�N��Ƭ���O�ɥR�C
		if DragonHp < 99 then
			CancelBuff( Target, g_DragonHp );
			AddBuff( Target, g_DragonHp, DragonHp+1, -1 );
		end
	else	-- ���a�泌�s�y���ˮ`��
		local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
		g_HeroPoints[DBID] = g_HeroPoints[DBID] + 1;
	--	DebugMsg( Owner, 0, "Physical, Point = "..g_HeroPoints[DBID] );
		CancelBuff( Target, g_DragonHp );
		if DragonHp > 0 then
			AddBuff( Target, g_DragonHp, DragonHp-1, -1 );
			PlayMotion( Target ,ruFUSION_ACTORSTATE_HURT_NORMAL );
		end
	end
end
---------------------------------------------------------------------------------------
function Lua_na_fairyboss_MDMG()	--���p�N(499630)�B���a�泌�s���]�k�ˮ`

	local Owner = OwnerID();	-- ���a
	local Target = TargetID();	-- ���s
	local DragonHp = FN_CountBuffLevel( Target, g_DragonHp );	-- ���s��O��

	if CheckBuff( Target , 623279 ) == true then	-- �p�G�s������]�k������BUFF
		ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON03]", 0 );
		if DragonHp < 99 then
			CancelBuff( Target, g_DragonHp );
			AddBuff( Target, g_DragonHp, DragonHp+1, -1 );
		end
	elseif CheckBuff( Target, 623281 ) == true then  --���F�ơA�����|���s�ɦ�
		ScriptMessage( Owner , Owner , 1 , "[SC_2012FAIRY_DRAGON04]" , 0 ) --���s�e�{���F�ơI�Ҩ��������ˮ`�N��Ƭ���O�ɥR�C
		if DragonHp < 99 then
			CancelBuff( Target, g_DragonHp );
			AddBuff( Target, g_DragonHp, DragonHp+1, -1 );
		end
	else	-- ���a�泌�s�y���ˮ`��
		local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
		g_HeroPoints[DBID] = g_HeroPoints[DBID] + 1;
	--	DebugMsg( Owner, 0, "Magic, Point = "..g_HeroPoints[DBID] );

		CancelBuff( Target, g_DragonHp );
		if DragonHp > 0 then
			AddBuff( Target, g_DragonHp, DragonHp-1, -1 );
			PlayMotion( Target, ruFUSION_ACTORSTATE_HURT_NORMAL );
		end
	end
end
---------------------------------------------------------------------------------------
function Lua_na_fairyboss_Heal()	-- �v¡�N(499633) ���a�缾�a�ι泌�s�ϥ�

	local Owner = OwnerID()	-- ���a
	local Target = TargetID()	-- �ؼ�

	if CheckBuff( Target , g_DragonHp ) == true then --�ؼЬO���s

		local DragonHp = FN_CountBuffLevel(Target,g_DragonHp);	-- ���s��O��

		if CheckBuff( Target , 623281 ) == true then --���F��

			local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
			g_HeroPoints[DBID] = g_HeroPoints[DBID] + 1;
		--	DebugMsg( Owner, 0, "Heal Dragon, Point = "..g_HeroPoints[DBID] );

			CancelBuff( Target, g_DragonHp );
			if DragonHp > 0 then
				AddBuff( Target, g_DragonHp, DragonHp-1, -1 );
				PlayMotion( Target, ruFUSION_ACTORSTATE_HURT_NORMAL );	-- ������˰ʧ@
			end
		else
			ScriptMessage( Owner, Owner, 1, "[SC_2012FAIRY_DRAGON07]", 0 );	-- �L�k�����ܥ��s�^�_��O�ȡC
		end
	elseif CheckBuff( Target , g_PlayerHp ) == true then -- �ؼЬO�֦����ܭ^�������a

		local PlayerHp = FN_CountBuffLevel(Target,g_PlayerHp);	-- �^������O��

		if PlayerHp < 9  then	-- �S�����ɮɡA�~��o����
			local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
			g_HeroPoints[DBID] = g_HeroPoints[DBID] + 1;
		--	DebugMsg( Owner, 0, "Heal, Point = "..g_HeroPoints[DBID] );

			CancelBuff( Target, g_PlayerHp );
			AddBuff( Target, g_PlayerHp, PlayerHp+1, -1 );
		end
	end
end
---------------------------------------------------------------------------------------
function Lua_na_12fairy_delbuff()	-- ���a�]�Z���L�������ɡA�ξ԰������ɰ���

	local Owner = OwnerID();
	local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
	local Lv = ReadRoleValue( Owner, EM_RoleValue_Lv );
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB );

	CancelBuff( Owner , g_PlayerHp );	-- ���ܭ^����O��
	CancelBuff( Owner , 623313 );	-- �C�C�h
	CancelBuff( Owner , 623315 );	-- �]�Ův

	if g_HeroPoints == nil then	-- �קK���a����A�������e�i��C���A���쭫�s�}�ҫ�~�n�J�A�ӷj�M���즹�Ȫ����D
		g_HeroPoints = {};
	end

	if g_HeroPoints[DBID] == nil then
		g_HeroPoints[DBID] = 0;
	end
--	DebugMsg( Owner, 0, "Reward Point = "..g_HeroPoints[DBID] );

	if g_HeroPoints[DBID] == 0 then	-- �϶�1
		SetFlag( Owner, g_KeyItem.GiftLv[1], 1 );
	elseif g_HeroPoints[DBID] < 11 then	-- �϶�2
		SetFlag( Owner, g_KeyItem.GiftLv[2], 1 );
	elseif g_HeroPoints[DBID] < 31 then	-- �϶�3
		SetFlag( Owner, g_KeyItem.GiftLv[3], 1 );
	else	-- �϶�4
		SetFlag( Owner, g_KeyItem.GiftLv[4], 1 );
	end

	SetFlag( Owner, g_KeyItem.Fight, 0 );	-- ���ʶi�椤
	SetFlag( Owner, g_KeyItem.Complete, 1 );	-- �����C�駹���X��
	ScriptMessage( Owner, Owner, 2, "[SC_2012FAIRY_REWARD1]", C_SYSTEM );	-- ���ܫi�̪��ĪG�w�����A�줤���s���V�p�j���^�����G�I
	ScriptMessage( Owner, Owner, 0, "[SC_2012FAIRY_REWARD1]", C_SYSTEM );
	DesignLog( Owner , 121052 , "Lv = "..Lv.." SubLv = "..SubLv ); 	-- �^�Ǭ��ʰѻP��
end

function LuaI_241450( Option )	-- ���~ - �i�̪��s�֥]�q

	local PlayerID = OwnerID()
	local PackageID = 241450
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 726138 , 1 )	
	end
end

function Lua_na_12fairy_delbuff2()	-- 623277 ���ܬG�ƤH���g��
	SetFlag( OwnerID() , g_KeyItem.Fight, 0 );
end

--�����եΫ��O
function Hao_Fairy_Dragon_SetScore(Num)	-- �ݭn�b Zone 2 �ϥΡA���Ȥ~�|���T�Q�C�J���y�n��

	local Owner = OwnerID();
	local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );

	if g_HeroPoints == nil then g_HeroPoints = {}; end
	if g_HeroPoints[DBID] == nil then g_HeroPoints[DBID] = 0; end

	g_HeroPoints[DBID] = Num;
	Say( Owner, "Your score = "..g_HeroPoints[DBID] );
end

function Lua_na_12fairy_addbuff2()	-- �ݭn�b Zone 2 �ϥΡA���Ȥ~�|���T�Q�]�w

--	local Owner = OwnerID()
--	WriteRoleValue( Owner , EM_RoleValue_Register1 , 30)
--	local Reg1 = ReadRoleValue( Owner , EM_RoleValue_Register1 )
--	Say( Owner , "REG 2 = " ..Reg1)

	local Owner = OwnerID();
	local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );

	if g_HeroPoints == nil then g_HeroPoints = {}; end
	if g_HeroPoints[DBID] == nil then g_HeroPoints[DBID] = 0; end

	g_HeroPoints[DBID] = 30;
	Say( Owner, "Your score = "..g_HeroPoints[DBID] );
end

function Lua_na_12fairy_Title0()
	local Owner = OwnerID()
	WriteRoleValue( Owner , EM_LuaValueFlag_UseItem41 , 0)
	local kill = ReadRoleValue( Owner ,EM_LuaValueFlag_UseItem41 )
	Say( Owner , "kill = " .. kill )
end

function Lua_na_12fairy_Title9()
	local Owner = OwnerID()
	WriteRoleValue( Owner , EM_LuaValueFlag_UseItem41 , 9)
	local kill = ReadRoleValue( Owner ,EM_LuaValueFlag_UseItem41 )
	Say( Owner , "kill = " .. kill )
end

function Lua_na_12fairy_SCORE()	-- �ݭn�b Zone 2 �ϥΡA���Ȥ~�|���T�QŪ��

--	local Owner = OwnerID();
--	Say( Owner , "Score = " ..ReadRoleValue( Owner , EM_RoleValue_Register1) )
	local Owner = OwnerID();
	local DBID = ReadRoleValue( Owner, EM_RoleValue_DBID );
	if g_HeroPoints == nil then g_HeroPoints = {}; end
	if g_HeroPoints[DBID] == nil then g_HeroPoints[DBID] = 0; end
	Say( Owner, "Your score = "..g_HeroPoints[DBID] );
end

function Lua_na_12fairy_HERO()
	local Owner = OwnerID()
	AddBuff( Owner,623277, 0 , -1 )
	SetFlag (Owner , 546905, 1 )
end

--���ʧP�_�������m
function Lua_na_2012Fairy_Reset() 
	local Owner = OwnerID() 
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 0 )
	CancelBuff( Owner, 623277)
	SetFlag( Owner , 546907 , 0 )	 --�C��
	SetFlag( Owner , 546903 , 0 )	--���y�϶�1
	SetFlag( Owner , 546904 , 0 )	--���y�϶�2
	SetFlag( Owner , 546906 , 0 )	--���y�϶�3		
	SetFlag( Owner , 546909 , 0 )	--���y�϶�4
	SetFlag( Owner , 546910 , 0 )	--�s���`
	SetFlag( Owner , 546905 , 0 )	 --�԰�
end