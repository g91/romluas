function Lua_ying_fairytale_119217tell() --���󲣥ͼ@��

	AddBuff(  TargetID(),  503217, 1, -1) 
	SetPlot( OwnerID() , "range" , "Lua_ying_fairytale_rangetalk" , 50 ) --�d��@��	-- �ˬd���a�O�_����d��50�H��
end
---------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_rangetalk()

	local Key = { 543898 , 543899 , 543900 , 545250 , 545524 , 545525 } --����key�B���駹��key
	local Step = 0

	for i = 1 , table.getn(Key) , 1 do
		if CheckFlag( OwnerID() , Key[i] ) == false then
			Step = Step + 1
		end
		if Step == 6 then
			tell( OwnerID() , TargetID() , "[SC_FAIRYTALE_2011_29]" ) --�K�I�o��_�I�̡A��_���U�A���}�B�H�ڻݭn�A����U�K
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_119217speak()

	local over = CheckFlag( OwnerID() , 545525 ) --��������
	local Key = { 543898 , 543899 , 543900 , 545250 , 545524 } --����key
	local Step = 0

	if over == true then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_30]" ) --�A�n�I�ڬO�����Űӷ|���p�N�ռw��
		return;
	end

	for i = 1 , table.getn(Key) , 1 do
		if CheckFlag( OwnerID() , Key[i] ) == true then
			LoadQuestOption( OwnerID() )
			return
		elseif CheckFlag( OwnerID() , Key[i] ) == false and over == false then	-- ���S�������A�]�S��
			Step = Step + 1
		end
		if Step == 5 then
			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_30]" ) --�A�n�I�ڬO�����Űӷ|���p�N�ռw��
			AddSpeakOption( OwnerID() , TargetID(), "[SC_111490_DIALOG7_2]" , "Lua_ying_fairytale_119217speak01" , 0 ) --�M��O�H
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_119217speak01()

	local Key = { 543898 , 543899 , 543900 , 545250 , 545524 } --����key
	local Random = Rand(5)+1 --1~5

	SetFlag( OwnerID() , Key[Random] , 1 )
	Lua_ying_fairytale_119217speak()
end
---------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_questover() --���ȧ���
--2014/09/12�ק�G��������BUFF�A�אּ�P�_USEITEM�A���a��������14���A�K�i��o�ٸ�
	local Owner = OwnerID()	-- Npc
	local Target = TargetID()	-- ���a
	local Key = { 543898 , 543899 , 543900 , 545250 , 545524 } --����key
--	local BuffLV = FN_CountBuffLevel( Target , 509578 ) --�P�_�����ĴX��BUFF --�䴩�@��
	local UI47 = ReadRoleValue( Target , EM_LuaValueFlag_UseItem47) --USEITEM47 �@���P�_�������ưO��
	local Count = CountBodyItem( Target , 530724 ) --�ٸ��G���ܼ@�Ϊ��n����
	
	for i = 1 , table.getn(Key) , 1 do
	--	if CheckFlag( Target , Key[i] ) == true then
			SetFlag( Target , Key[i] , 0 ) --�R������key
	--	end
	end

	SetFlag( Target , 545525 , 1 ) --������駹��key

	if Count == 1 then --�ٸ�
		return
	end
--	if BuffLV == 12 then --14��
	if UI47 >= 13 then --������14��
		GiveBodyItem( Target , 530724 , 1 ) --�ٸ��G���ܼ@�Ϊ��n����
	--	CancelBuff( Target , 509578 )
	else
		WriteRoleValue( Target , EM_LuaValueFlag_UseItem47 , UI47+1)
		local NEWUI47 = ReadRoleValue( Target , EM_LuaValueFlag_UseItem47)
		ScriptMessage( Owner, Owner, 3, "[SC_FAIRYTALE_2015_MES01]"..NEWUI47, 0 )  --20140912�W�[���ܰT��
	--	AddBuff( Target ,  509578 , 0 ,  129600 ) --�P�_�����ĴX��BUFF --�䴩�@��
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2015.09.01 ���E : �󵣸ܸ`���� - �u�g�����T�S�̡v �[�J�ʱ��@���A�קK�j�_�B�G�_�B�p�_�]������]�ɭP���;���L�k�@�Ϊ����D�C
-- 2015.09.01 ���E : �󵣸ܸ`���� - �u�g�����T�S�̡v- �j�_�B�G�_�B�p�_���ͮɥ[�J�d��@���A�[�J���ܰT���A�קK���a�j�M����j�_�B�G�_�B�p�_�����D�C
local g_PlayfulBoy = {};	-- �ȨѦ� Script �s���ϥΪ������ܼơA�O������
g_PlayfulBoy[119219] = 0;	-- �j�_
g_PlayfulBoy[119220] = 0;	-- �G�_
g_PlayfulBoy[119221] = 0;	-- �p�_

local g_KeyItem = {};	-- �ȨѦ� Script �s���ϥΪ������ܼơA�O�����������n���~
g_KeyItem[119219] = 545529;	-- �w���j�_
g_KeyItem[119220] = 545530;	-- �w���G�_
g_KeyItem[119221] = 545531;	-- �w���p�_

local g_Flag = 780773;	-- �ȨѦ� Script �s���ϥΪ������ܼơA�O���������X�нs��

local g_FlagNum = {};	-- �ȨѦ� Script �s���ϥΪ������ܼơA�O���������X�нd��
g_FlagNum[119219] = { 0, 4 };	-- �j�_
g_FlagNum[119220] = { 5, 9 };	-- �G�_
g_FlagNum[119221] = { 10, 14 };	-- �p�_

function Hao_Fairytale_422913_Accept()	-- �C�����a���������ȮɡA�ˬd�j�_�B�G�_�B�p�_�O�_�s�b�A���s�b�h���歫�͡C���b�A�קK������]�ɭP������������D�C

	local Owner = OwnerID();	-- Npc
	local Target = TargetID();	-- ���a

	for Index, Value in pairs(g_PlayfulBoy) do
		if not CheckID( g_PlayfulBoy[Index] ) then
		--	DebugMsg( 0, 0, "PlayfulBoy["..Index.."] not found!" );
			Hao_Fairytale_PlayfulBoy_Reborn( Index );
		else
		--	DebugMsg( 0, 0, "PlayfulBoy["..Index.."] check ok!" );
		end
	end
end

function Hao_Fairytale_PlayfulBoy_Reborn( Index )	-- �j�_�B�G�_�B�p�_���;���

	local Owner = OwnerID();
	local Random = Math.random( g_FlagNum[Index][1], g_FlagNum[Index][2] );
	local Obj = CreateObjByFlag( Index, g_Flag, Random , 1 );	-- �ѷӫ��w�X�l����m�Ӳ��ͪ���( ����s���B�X�l�N���B�ĴX���X�l�B����ƶq )
	AddToPartition( Obj, 0 );
	BeginPlot( Obj, "Hao_Fairytale_PlayfulBoy_Init", 0 );
end

function Hao_Fairytale_PlayfulBoy_Init()	-- �g�����T�S�� ���󲣥ͼ@��

	local Owner = OwnerID();	-- Npc
	local OrgID = ReadRoleValue( Owner, EM_RoleValue_OrgID );
	g_PlayfulBoy[OrgID] = Owner;	-- �b���ͮɱN�ۤv�C�J�ȨѦ� Script �s���ϥΪ�����
	SetModeEx( Owner, EM_SetModeType_SearchenemyIgnore, false );	-- ���i�Q�j�M
	SetModeEx( Owner, EM_SetModeType_Move, false );	-- ��������
	SetPlot( Owner, "range", "Hao_Fairytale_PlayfulBoy_Plot", 100 );	-- ���ʦܥؼ� 100 �H���ɡA��������
end

function Hao_Fairytale_PlayfulBoy_Plot()	-- �d��@��

	local Owner = OwnerID();	-- ���a
	local Target = TargetID();	-- Npc

	if CheckAcceptQuest( Owner, 422913 ) then	--���a���������ȡG�g�����T�S�̮�
		local OrgID = ReadRoleValue( Target, EM_RoleValue_OrgID );	-- �d�� Npc �� ObjID
		if not CheckFlag( Owner, g_KeyItem[OrgID] ) then	-- ���a�|�����ӥؼЮ�
			Tell( Owner, Target, "[SC_113348_1]" );	-- �N~���C�n���A�L�ӳo��I
		end
	end
end

function Hao_Fairytale_PlayfulBoy_Speak()	-- �j�_�B�G�_�B�p�_�A�@�ι�ܼ@��

	local Owner = OwnerID();	-- ���a
	local Target = TargetID();	-- Npc
	local OrgID = ReadRoleValue( Target, EM_RoleValue_OrgID );
	local Quest = CheckAcceptQuest( Owner, 422913 ); --���ȡG�g�����T�S��

	if CheckAcceptQuest( Owner, 422913 ) then	-- ���������� - �g�����T�S��
		if not CheckFlag( Owner, g_KeyItem[OrgID] ) then
			LoadQuestOption( Owner );
			AddSpeakOption( Owner, Target, "[SC_FAIRYTALE_2011_01]" , "Hao_Fairytale_PlayfulBoy_Speak2" , 0 ); --��ӧA�b�o�̡K
		else	
			SetSpeakDetail( Owner, "[SC_FAIRYTALE_2011_02]" ); --��������i�p�N�ռw�A�ګݷ|�N�|�^�h�F��	
		end
	else
		LoadQuestOption( Owner );
	end		
end

function Hao_Fairytale_PlayfulBoy_Speak2()	-- �P�T�_��ܫ᪺�����ܼ@��

	local Owner = OwnerID();	-- ���a
	local Target = TargetID();	-- Npc

	if CheckAcceptQuest( Owner, 422913 ) then --���ȡG�g�����T�S��
		local PID = ReadRoleValue( Owner, EM_RoleValue_PID );	-- �קK�ƼƥH�W�������Ȫ����a�P�ɻP Npc ��ܮɡA�|�� already running �����D�C
		if PID == 1 then
			SetSpeakDetail( Owner, "[SAY_NPC_BUSY]" ); -- �ؼЦ��L��
		else
			local OrgID = ReadRoleValue( Target, EM_RoleValue_OrgID );
			WriteRoleValue( Target, EM_RoleValue_PID, 1 );
			CloseSpeak( Owner );
			SetFlag( Owner, g_KeyItem[OrgID], 1 ) --�����w�T�_
			ScriptMessage( Owner, Owner, 0 , "[SC_FAIRYTALE_2011_03][$SETVAR1=".."["..OrgID.."]".."]" , C_SYSTEM ) --�A���\��^�F���w�T�_�I
			Hide( Target ) --������NPC
			BeginPlot( Target, "Hao_PlayfulBoy_SetPos", 50 )	-- 5 ���ǰe Npc �ܫ��w�X�Ъ��H���s��
		end
	else
		SetSpeakDetail( Owner, "[SC_FAIRYTALE_2011_04]" ) --�A�O�֡K�H
	end
end

function Hao_PlayfulBoy_SetPos()

	local Owner = OwnerID();
	local OrgID = ReadRoleValue( Owner, EM_RoleValue_OrgID );
	local RandomNum = Math.random( g_FlagNum[OrgID][1], g_FlagNum[OrgID][2] );	-- �C���H����ܮɪ���m
--	DebugMsg( 0, 0, "RandomNum = "..RandomNum );
	WriteRoleValue( Owner, EM_RoleValue_PID, 0 );
	SetPosByFlag( Owner, g_Flag, RandomNum );
	Show( Owner, 0 );
end
------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bowspeak01() --�j�_��ܼ@��
--
--	local Quest = CheckAcceptQuest( OwnerID() , 422913 ) --���ȡG�g�����T�S��
--	local Key = CheckFlag( OwnerID() , 545529 ) --���j�_
--
--	if Quest == true then --������
--		if Key == false then
--			LoadQuestOption( OwnerID() )
--			AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_01]" , "Lua_ying_fairytale_bow01" , 0 ) --��ӧA�b�o�̡K
--		else
--			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_02]" ) --��������i�p�N�ռw�A�ګݷ|�N�|�^�h�F��	
--		end
--	else
--		LoadQuestOption( OwnerID() )
--	end
--end
------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bow01()
--
--	local Owner = OwnerID();	-- ���a
--	local Target = TargetID();	-- Npc
--
--	if CheckAcceptQuest( Owner, 422913 ) then --���ȡG�g�����T�S��
--		local PID = ReadRoleValue( Owner, EM_RoleValue_PID );	-- �קK�ƼƥH�W�������Ȫ����a�P�ɻP Npc ��ܮɡA�|�� already running �����D�C
--		if PID == 1 then
--			SetSpeakDetail( Owner, "[SAY_NPC_BUSY]" ); -- �ؼЦ��L��
--		else
--			WriteRoleValue( Target, EM_RoleValue_PID, 1 );
--			CloseSpeak( Owner );
--			SetFlag( Owner, 545529 , 1 ) --���j�_
--			ScriptMessage( Owner, Owner, 0 , "[SC_FAIRYTALE_2011_03][$SETVAR1=".."[".."119219".."]".."]" , C_SYSTEM ) --�A���\��^�F�j�_�I
--			Hide( Target ) --������NPC
--			BeginPlot( Target, "Hao_Fairytale_PlayfulBoy_SetPos", 50 )	-- 5 ���ǰe Npc �ܫ��w�X�Ъ��H���s��
--		--	BeginPlot( Target, "Lua_ying_fairytale_add01" , 100 ) --10���~����إ߷sNPC
--		--	BeginPlot( Target, "Lua_ying_fairytale_del" , 0 ) --�R���즳���äj�_
--		end
--	else
--		SetSpeakDetail( Owner, "[SC_FAIRYTALE_2011_04]" ) --�A�O�֡K�H
--	end
--end
---------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_add01()
--
--	local Random = Math.random( 0, 4 );	--0~4
--	local NPC = CreateObjByFlag( 119219 , 780773 , Random , 1 )  --�ѷӫ��w�X�l����m�Ӳ��ͪ���(NPC�s���B�X�l�N���B�ĴX���X�l�B����ƶq )
--
--	SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore , false ) --���i�Q�j�M
--	AddToPartition( NPC , 0 )
--	DelObj(OwnerID());
--end
------------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bowspeak02() --�G�_��ܼ@��
--
--	local Quest = CheckAcceptQuest( OwnerID() , 422913 ) --���ȡG�g�����T�S��
--	local Key = CheckFlag( OwnerID() , 545530 ) --���G�_
--
--	if Quest == true then --������
--		if Key == false then
--			LoadQuestOption( OwnerID() )
--			AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_01]" , "Lua_ying_fairytale_bow02" , 0 ) --��ӧA�b�o�̡K
--		else
--			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_02]" ) --��������i�p�N�ռw�A�ګݷ|�N�|�^�h�F��
--		end
--	else
--		LoadQuestOption( OwnerID() )
--	end
--end
------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bow02()
--
--	local Quest = CheckAcceptQuest( OwnerID() , 422913 ) --���ȡG�g�����T�S��
--
--	if Quest == true then
--		CloseSpeak( OwnerID() )
--		SetFlag( OwnerID() , 545530 , 1 ) --���G�_
--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_FAIRYTALE_2011_03][$SETVAR1=".."[".."119220".."]".."]" , C_SYSTEM ) --�A���\��^�F�G�_�I
--		Hide( TargetID() ) --������NPC
--		BeginPlot( TargetID() , "Lua_ying_fairytale_add02" , 100 ) --10���~����إ߷sNPC
--		BeginPlot( TargetID() , "Lua_ying_fairytale_del" , 0 ) --�R���즳���äG�_
--	else
--		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_04]" ) --�A�O�֡K�H
--	end
--end
---------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_add02()
--
--	local Random = Math.random( 5, 9 ); --5~9
--	local NPC = CreateObjByFlag( 119220 , 780773 , Random , 1 )  --�ѷӫ��w�X�l����m�Ӳ��ͪ���(NPC�s���B�X�l�N���B�ĴX���X�l�B����ƶq )
--
--	SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore , false ) --���i�Q�j�M
--	AddToPartition( NPC , 0 )
--	DelObj(OwnerID());
--end
------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bowspeak03() --�p�_��ܼ@��
--
--	local Quest = CheckAcceptQuest( OwnerID() , 422913 ) --���ȡG�g�����T�S��
--	local Key = CheckFlag( OwnerID() , 545531 ) --���p�_
--
--	if Quest == true then --������
--		if Key == false then
--			LoadQuestOption( OwnerID() )
--			AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_01]" , "Lua_ying_fairytale_bow03" , 0 ) --��ӧA�b�o�̡K
--		else
--			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_02]" ) --��������i�p�N�ռw�A�ګݷ|�N�|�^�h�F��	
--		end
--	else
--		LoadQuestOption( OwnerID() )
--	end
--end
------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bow03()
--
--	local Quest = CheckAcceptQuest( OwnerID() , 422913 ) --���ȡG�g�����T�S��
--
--	if Quest == true then
--		CloseSpeak( OwnerID() )
--		SetFlag( OwnerID() , 545531 , 1 ) --���p�_
--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_FAIRYTALE_2011_03][$SETVAR1=".."[".."119221".."]".."]" , C_SYSTEM ) --�A���\��^�F�p�_�I
--		Hide( TargetID() ) --������NPC
--		BeginPlot( TargetID() , "Lua_ying_fairytale_add03" , 100 ) --10���~����إ߷sNPC
--		BeginPlot( TargetID() , "Lua_ying_fairytale_del" , 0 ) --�R���즳���äp�_
--	else
--		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_04]" ) --�A�O�֡K�H
--	end
--end
---------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_add03()
--
--	local Random = Math.random( 10, 14 ); --10~14
--	local NPC = CreateObjByFlag( 119221 , 780773 , Random , 1 )  --�ѷӫ��w�X�l����m�Ӳ��ͪ���(NPC�s���B�X�l�N���B�ĴX���X�l�B����ƶq )
--
--	SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore , false ) --���i�Q�j�M
--	AddToPartition( NPC , 0 )
--	DelObj(OwnerID());
--end
----------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_del()
--
--	Sleep(130)
--	DelObj( OwnerID())
--end
-----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_usecheck() --����Ţ�A�ϥ��ˬdlua
--	Say(TargetID(), "Target") --= NPC
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) --Ū���ؼЪ�orgid
	local Dis = GetDistance( OwnerID(), TargetID() ) --���o���a�P�ؼЪ��Z��

	DW_CancelTypeBuff( 68 , OwnerID()) --�M�����M�ɡA�I���U��

	if NPC == 106107 then --�p����
		if Dis <= 30 then
				return true --�i�ϥ�
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FAIRYTALE_2011_05][$SETVAR1=".."[".."106107".."]".."]" , 0 ) --�A�P�p���޶Z���ӻ��A�����A�a��@�I�~�i�ϥΡI
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
		return false
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_Motion() --�ϥ��ˬdLUA
	CallPlot( OwnerID(), "PlayMotion", OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_use()
	local pig = TargetID()
	local player = OwnerID()
	local PID = ReadRoleValue( pig , EM_RoleValue_PID ) --Ū������PID

	if PID == 1 then --�w�Q���
		ScriptMessage( player , player , 1 , "[SC_MAGICSTRING_9]" , 0 ) --�ޯ�ؼЦ����D
	else	
		if Rand(100) < 50 then
			GiveBodyItem( player , 240056 , 1 ) --�����˵۳��ު�Ţ�l
			--UseitemDestroy()
			DelBodyItem( player , 240055 , 1 ) --�R������Ţ
		else --����
			ScriptMessage( player, player , 1 , "[SC_FAIRYTALE_2011_06]" , C_SYSTEM ) --�p���ޱò�FŢ�l�A�@�ȷϪ��]���F��
		end
		WriteRoleValue( pig , EM_RoleValue_PID , 1 ) --�����PID�g�J1
		Hide( pig )
		BeginPlot( pig , "Lua_ying_fairytale_shownpc" , 0 )
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_shownpc()

	Sleep(300) --30��
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) --�����PID�g�J0
	Show( OwnerID() , 0 )
end
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_pigdead() --�p���ަ��`�@��
--	Say( OwnerID() , "1" )	--����
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 ) --PID�g�J1
--	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
--		Say( OwnerID() , "PID ="..PID )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_pigborn() --�p���ު��󲣥ͼ@��

	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) --PID�g�J0
--	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
--		Say( OwnerID() , "PID ="..PID )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_119222talk() --npc �㺸�� ��ܼ@��

	local Quest = CheckAcceptQuest( OwnerID() ,  424042 ) --���ȡG��������u�氮
	local Count = CountBodyItem( OwnerID() , 240057 ) --�ˬd��u�氮�ƶq
	local OKKey =CheckFlag( OwnerID() , 545538 ) --�w�����p�C��key
	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --�P�_���a���WBUFF(����X��)�A�Y�S��BUFF�h��-1
	local Key = { 545459 , 545460 , 545461 } --�D��KEY

	if Quest == true then --������
		if OKKey == true then --�w����
			if Count < 10 then --0~9�ӻ氮
				LoadQuestOption( OwnerID() )
				AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_07]" , "Lua_ying_fairytale_cookiegive" , 0 ) --�ڧ˥�F��u�氮�K
			else
				SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_08]" ) --����N�����˪���u�氮�a�^���p�N�ռw�a��
			end
		else --������
			if CheckFlag( OwnerID() , Key[1] ) == true then
				Lua_ying_fairytale_select1()
			elseif CheckFlag( OwnerID() , Key[2] ) == true then
				Lua_ying_fairytale_select2()
			elseif CheckFlag( OwnerID() , Key[3] ) == true then
				Lua_ying_fairytale_select3()
			else
				if BuffLV == -1 then --�S����L
					LoadQuestOption( OwnerID() ) --�Q�n�s�@�X�������氮�A���F�������~��H�~�A�i���ɩ�J���������ᶶ�Ǥ]�ܭ��n�@��
					AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_09]" , "Lua_ying_fairytale_givekey" , 0 ) --�ڷQ�V�p�����@�Ǥ�u�氮�K
				end
			end
		end
	else --�S����
		LoadQuestOption( OwnerID() ) --�Q�n�s�@�X�������氮�A���F�������~��H�~�A�i���ɩ�J���������ᶶ�Ǥ]�ܭ��n�@��
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_givekey() --�ڷQ�V�p�����@�Ǥ�u�氮�K

	local Quest = CheckAcceptQuest( OwnerID() ,  424042 ) --���ȡG��������u�氮
	local Key = { 545459 , 545460 , 545461 } --�D��KEY
	local Random = Rand(3)+1 --1~3
	local Select = { "Lua_ying_fairytale_select1" , "Lua_ying_fairytale_select2" , "Lua_ying_fairytale_select3" }

	if Quest == true then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_10]" ) --��ӬO�p�N�ռw�ЧA�Ӫ��㤣�L�K�Q�n���o��u�氮�A�o���������T���^���کҰݪ����D�~��I
		for i = 1 , table.getn(Key) , 1 do
			if CheckFlag( OwnerID() , Key[1] ) == true then
				AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_11]" , "Lua_ying_fairytale_select1" , 0 ) --�n���I
				return
			elseif CheckFlag( OwnerID() , Key[2] ) == true then
				AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_11]" , "Lua_ying_fairytale_select2" , 0 ) --�n���I
				return
			elseif CheckFlag( OwnerID() , Key[3] ) == true then
				AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_11]" , "Lua_ying_fairytale_select3" , 0 ) --�n���I
				return
			else --�T��key��false
				SetFlag( OwnerID() , Key[Random] , 1 ) --�����D��key
				AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_11]" , Select[Random] , 0 ) --�n���I
				return
			end
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_12]" ) --�]�㺸�����M�ߪ��b���ۤv���ơK�^
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_select1()

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --�P�_���a���WBUFF(����X��)�A�Y�S��BUFF�h��-1

	if BuffLV == -1 then --�Sbuff
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_14]" ) --�ЧA�̷ӧڪ����ܡA�^���X���T���s�@�氮�y�{���}��i�i������A���������ѯ��ߩ�A��i�i�����e�o�����ѯ��A���o�̦���C
	elseif BuffLV == 3 then 
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_24]" ) --�̫��J�����ƬO�H
	elseif BuffLV == 0 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_25]" ) --���U�Ӹө�J������ƩO�H
	elseif BuffLV == 1 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_28]" ) --����F�A�A�Ӹө�J����O�H
	else --BuffLV= 2
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_31]" ) --�F�`��㱵�U�Ӹө�J����O�H
	end
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_17]" , "Lua_ying_fairytale_check1" , 0 ) --������
	AddSpeakOption( OwnerID() , TargetID(), "[".."203421".."]" , "Lua_ying_fairytale_check2" , 0 ) --�ѯ�
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_19]" , "Lua_ying_fairytale_check3" , 0 ) --�i�i��
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_20]" , "Lua_ying_fairytale_check4" , 0 ) --��}
	AddSpeakOption( OwnerID() , TargetID(), "[".."200782".."]" , "Lua_ying_fairytale_check5" , 0 ) --���o
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_select2()

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --�P�_���a���WBUFF(����X��)�A�Y�S��BUFF�h��-1

	if BuffLV == -1 then --�Sbuff
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_15]" ) --���o�����J����A�������}�ߩ�A�����J���e�o�����}�A�P�毻�̱ߩ�C
	elseif BuffLV == 3 then 
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_24]" ) --�̫��J�����ƬO�H
	elseif BuffLV == 0 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_25]" ) --���U�Ӹө�J������ƩO�H
	elseif BuffLV == 1 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_28]" ) --����F�A�A�Ӹө�J����O�H
	else --BuffLV= 2
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_31]" ) --�F�`��㱵�U�Ӹө�J����O�H
	end
	AddSpeakOption( OwnerID() , TargetID(), "[".."202983".."]" , "Lua_ying_fairytale_check6" , 0 ) --����
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_18]" , "Lua_ying_fairytale_check7" , 0 ) --�P�毻
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_20]" , "Lua_ying_fairytale_check4" , 0 ) --��}
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_21]" , "Lua_ying_fairytale_check8" , 0 ) --���J
	AddSpeakOption( OwnerID() , TargetID(), "[".."200782".."]" , "Lua_ying_fairytale_check5" , 0 ) --���o
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_select3()

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --�P�_���a���WBUFF(����X��)�A�Y�S��BUFF�h��-1

	if BuffLV == -1 then --�Sbuff
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_16]" ) --�񸲵尮���e���i�H�����J�A���ѯ����e���i�H��p���F�ޡA�����J���e�o������e�A�ѯ�����e�ߩ�C
	elseif BuffLV == 3 then 
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_24]" ) --�̫��J�����ƬO�H
	elseif BuffLV == 0 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_25]" ) --���U�Ӹө�J������ƩO�H
	elseif BuffLV == 1 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_28]" ) --����F�A�A�Ӹө�J����O�H
	else --BuffLV= 2
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_31]" ) --�F�`��㱵�U�Ӹө�J����O�H
	end
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_32]" , "Lua_ying_fairytale_check4" , 0 ) --���e
	AddSpeakOption( OwnerID() , TargetID(), "[".."203421".."]" , "Lua_ying_fairytale_check2" , 0 ) --�ѯ�
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_22]" , "Lua_ying_fairytale_check9" , 0 ) --�p���F��
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_23]" , "Lua_ying_fairytale_check5" , 0 ) --���尮
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_21]" , "Lua_ying_fairytale_check8" , 0 ) --���J
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check1()  --������
	
	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --�P�_���a���WBUFF(����X��)�A�Y�S��BUFF�h��-1

	if BuffLV == 3 then --�w����4��
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_26]" ) --�ӴΤF�A�A�^�����ܥ��T�A���ڴN���u�氮���A�o��
		CancelBuff( OwnerID() , 620630 )
		SetFlag( OwnerID() , 545538 , 1 ) --�����p�C��
		SetFlag( OwnerID() , 545459 , 0 ) --�R���D��1 KEY
		GiveBodyItem( OwnerID() , 240057 , 10 ) --����10�Ӥ�u�氮
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" ) --���ǿ��F���A�n���n�A��ҬݬݡH
		CancelBuff( OwnerID() , 620630 )
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check2() --�ѯ�

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )
	
	if CheckFlag( OwnerID() , 545459 ) == true then --�D��1
		if BuffLV == 1 then --�w����2��
			AddBuff( OwnerID() , 620630 , 0 , -1 )
			Lua_ying_fairytale_select1()
		else
			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" ) --���ǿ��F���A�n���n�A��ҬݬݡH
			CancelBuff( OwnerID() , 620630 )
		end
	else --�D��3
		if BuffLV == 2 then --�w����3��
			AddBuff( OwnerID() , 620630 , 0 , -1 )
			Lua_ying_fairytale_select3()
		else
			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
			CancelBuff( OwnerID() , 620630 )
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check3() --�i�i��

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == 2 then --�w����3��
		AddBuff( OwnerID() , 620630 , 0 , -1 )
		Lua_ying_fairytale_select1()
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check4() --��}�B���e

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == 0 then --�w����1��
		AddBuff( OwnerID() , 620630 , 0 , -1 )
		if CheckFlag( OwnerID() , 545459 ) == true then --�D��1
			Lua_ying_fairytale_select1()
		elseif CheckFlag( OwnerID() , 545460 ) == true then --�D��2
			Lua_ying_fairytale_select2()
		else --�D��3
			Lua_ying_fairytale_select3()	
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end	
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check5() --���o �B���尮

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == -1 then --���S����L
		AddBuff( OwnerID() , 620630 , 0 , -1 )
		if CheckFlag( OwnerID() , 545459 ) == true then --�D��1
			Lua_ying_fairytale_select1()
		elseif CheckFlag( OwnerID() , 545460 ) == true then --�D��2
			Lua_ying_fairytale_select2()
		else --�D��3
			Lua_ying_fairytale_select3()
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end	
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check6() --����

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == 2 then --�w����3��
		AddBuff( OwnerID() , 620630 , 0 , -1 )
		Lua_ying_fairytale_select2()
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end	
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check7() --�P�毻

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == 3 then --�w����4��
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_26]" ) --�ӴΤF�A�A�^�����ܥ��T�A���ڴN���u�氮���A�o��
		CancelBuff( OwnerID() , 620630 )
		SetFlag( OwnerID() , 545538 , 1 ) --�����p�C��
		SetFlag( OwnerID() , 545460 , 0 ) --�R���D��2 KEY
		GiveBodyItem( OwnerID() , 240057 , 10 ) --����10�Ӥ�u�氮
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end	
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check8() --���J

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == 1 then --�w����2��
		AddBuff( OwnerID() , 620630 , 0 , -1 )
		if CheckFlag( OwnerID() , 545460 ) == true then --�D��2
			Lua_ying_fairytale_select2()
		else --�D��3
			Lua_ying_fairytale_select3()
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check9()  --�p���F��
	
	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --�P�_���a���WBUFF(����X��)�A�Y�S��BUFF�h��-1

	if BuffLV == 3 then --�w����4��
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_26]" ) --�ӴΤF�A�A�^�����ܥ��T�A���ڴN���u�氮���A�o��
		CancelBuff( OwnerID() , 620630 )
		SetFlag( OwnerID() , 545538 , 1 ) --�����p�C��
		SetFlag( OwnerID() , 545461 , 0 ) --�R���D��3 KEY
		GiveBodyItem( OwnerID() , 240057 , 10 ) --����10�Ӥ�u�氮
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_cookiegive() --�ڧ˥�F��u�氮�K

	local Quest = CheckAcceptQuest( OwnerID() ,  424042 ) --���ȡG��������u�氮
	local Count = CountBodyItem( OwnerID() , 240057 ) --�ˬd��u�氮�ƶq

	if Quest == true then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_13]" ) --�Ӥ��|�O�A���Y�F��u�氮�a�H�I
		DelBodyItem( OwnerID() , 240057 , Count )
		GiveBodyItem( OwnerID() , 240057 , 10 )
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_12]" ) --�]�㺸�����M�ߪ��b���ۤv���ơK�^
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_q424042() --�������Ȯ�Ĳ�o

	CancelBuff( TargetID() , 620630 )
end

--��J�w�䴩���ʪ�����
function Lua_na_fairytale_complete13(Times)
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem47 , Times)
	Say( OwnerID(), Times.."times") 
end