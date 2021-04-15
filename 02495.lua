--���ݭn�мw�꭫�s½Ķ�����e
--�򥻪k�N 504631~504636
--���~ 205894

--Server Script 701536 �n�Ъ������s��X�A�ΥH�����ª������s���ʪ��ﶵ

function FN_2011Beer_Main()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	for i=1,6 do 
		local TempObj = CreateObjByFlag( 113286, 781010, (i-1), 1 )
		AddToPartition(TempObj,RoomID)
		SetModeEx( TempObj, EM_SetModeType_Mark, false ) --�аO
	end
	--
	AddBuff( OwnerID(),  503217, 1, -1) 
end
--==NPC 110695 �u�j�s��v��J
function FN_2011Beer_NPC110695()
	local player = OwnerID()
	SetSpeakDetail( player, "[SC_BEER_2011_FN03]" )
	if CheckFlag(player,545751) == FALSE then
		AddSpeakOption( player, player, "[SC_BEER_2011_FN02]", "FN_2011Beer_GiveKeyItem", 0 )
	else
		LoadQuestOption(player)
	end
	if CheckFlag(player, 544059) == FALSE then
		AddSpeakOption(player,player, "[SC_BEER_2011_FN04]", "FN_2011Beer_GiveBeer", 0 )	--���s�ﶵ
	end
end

--==NPC 118200 �u�K�M�v��		Z15
function FN_2011Beer_NPC118200()
	local player = OwnerID()
	SetSpeakDetail( player, "[SC_BEER_2011_FN10]" )
	if CheckFlag(player,545751) == FALSE then
		AddSpeakOption( player, player, "[SC_BEER_2011_FN02]", "FN_2011Beer_GiveKeyItem", 0 )
	else
		LoadQuestOption(player)
	end
end

--==NPC 118199 �u�j�s��v�橸	Z15
function FN_2011Beer_NPC118199()
	local player = OwnerID()
	SetSpeakDetail( player, "[SC_BEER_2011_FN03]" )
	if CheckFlag(player, 544059) == FALSE then
		AddSpeakOption(player,player, "[SC_BEER_2011_FN04]", "FN_2011Beer_GiveBeer", 0 )	--���s�ﶵ
	end
end

function FN_2011Beer_GiveKeyItem()
	SetFlag(OwnerID(), 545746, 1)
	SetFlag(OwnerID(), 545747, 1)
	SetFlag(OwnerID(), 545748, 1)
	SetFlag(OwnerID(), 545749, 1)
	SetFlag(OwnerID(), 545751, 1)	--�C��P�_��
	CloseSpeak(OwnerID())
end

function FN_2011Beer_GiveBeer()	--�C�鮳�s
	local player = OwnerID()
	local table = {205894, 240063, 240064, 240065, 240078, 240079}
	local x = DW_Rand(6)
	
	GiveBodyItem(player, table[x], 10)
	SetFlag(player, 544059, 1)
	CloseSpeak(player)
end

function FN_2011Beer_NPC_LoadQuest()
	LoadQuestOption(OwnerID())
end
--==NPC 111365 �L�}�Ү�
function FN_2011Beer_NPC111365()
	local player = OwnerID()
	SetSpeakDetail( player, "[SC_BEER_2011_FN05]" )
	if CheckFlag(player,545751) == FALSE then
		AddSpeakOption( player, player, "[SC_BEER_2011_FN02]", "FN_2011Beer_GiveKeyItem", 0 )
	else
		LoadQuestOption(player)
	end
	if CheckFlag(player, 544060) == FALSE then
		AddSpeakOption(player,player, "[SC_BEER_2011_FN06]", "FN_2011Beer_GiveFood", 0 )	--�������ﶵ
	end
end

--==NPC 118201 ��ù�R
function FN_2011Beer_NPC118201()
	local player = OwnerID()
	SetSpeakDetail( player, "[SC_BEER_2011_FN05]" )
	if CheckFlag(player, 544060) == FALSE then
		AddSpeakOption(player,player, "[SC_BEER_2011_FN06]", "FN_2011Beer_GiveFood", 0 )	--�������ﶵ
	end
end

function FN_2011Beer_GiveFood()	--�C�鮳����
	local player = OwnerID()
	local table = {208209, 208210, 240249, 240250, 240251, 240276, 240277, 240278, 240279}
	local x = DW_Rand(9)
	
	GiveBodyItem(player, table[x], 10)
	SetFlag(player, 544060, 1)
	CloseSpeak(player)
end
--==��s�ŶǤH��
function Beer_QItem_209957()	--��s�ŶǤH�����Ȫ��~
	local keyID = {545720,545721,545722,545723,545724,545725}
	
	for i=1,table.getn(keyID) do
		if KS_GetFlagDistance( OwnerID(), 781010, (i-1) ) <= 150 then
			SetFlag(OwnerID(), keyID[i], 1)
		end
	end
	Yell(OwnerID(),"[SC_BEER_2011_FN01]",2)
end

function Beer_Q_422914_get()
	SetFlag(TargetID(), 542969, 1)
end

function Beer_Q_422914_finish()
	local player = TargetID()
	SetFlag(player, 545746, 0)
	SetFlag(player, 542969, 0)
 	Lua_Festival_09_All(player)
	DisableQuest(player, false) 
end
--==�s�~�ճ�
function Beer_QItem_209958_check()
	if CheckBuff(TargetID(), 620783) == TRUE or OwnerID() == TargetID() then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_BEER_2011_FN09]", 0 )
		return FALSE
	else
		return TRUE
	end
end
function Beer_QItem_209958()	--�s�~��s
	DW_QietKillOne(OwnerID(), 103004)
	AddBuff(TargetID(),620783,0,25)
end

function Beer_Q_422915_finish()
	local player = TargetID()
	SetFlag(player, 545747, 0)
	Lua_Festival_09_All(player)
	DisableQuest(player, false) 	
end
--==�O�����Y��
function Beer_QItem_209959_check()
	if CheckBuff(TargetID(), 620785) == TRUE then
		return FALSE
	else
		return TRUE
	end
end

function Beer_QItem_209959()
	local NPCTable = {106063, 106064, 119379, 119380}
	for i=1,table.getn(NPCTable) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == NPCTable[i] then
			DW_QietKillOne(OwnerID(), 103005)
			AddBuff(TargetID(), 620785, 0, 25)
			return
		end
	end
end

function Beer_Q_422916_finish()
	local player = TargetID()
	SetFlag(player, 545748, 0)
	Lua_Festival_09_All(player)
	DisableQuest(player, false) 	
end
--==�@�P�ɥά��s�a
--FN_addbuff(IDtype,BuffID,MagicLv,EffectTime,iMotionID) --IDtype��0�N�OOwner  ��1�N�OTarget
--FN_addbuff(0,504631,0,3600,118)
function FN_Beer_addbuff(BuffID,MagicLv,EffectTime,iMotionID,Keyitem) --IDtype��0�N�OOwner  ��1�N�OTarget
	local Keytable = {545740,545741,545742,545743,545744,545745}

	PlayMotion ( OwnerID(),iMotionID)
	AddBuff( OwnerID() ,BuffID,MagicLv ,EffectTime)

	if CheckFlag(OwnerID(), Keyitem) == FALSE then
		SetFlag(OwnerID(),Keyitem,1)
	end

	for i=1,table.getn(Keytable) do
		if CheckFlag(OwnerID(), Keytable[i]) == FALSE then
			return
		end
	end
	GiveBodyItem(OwnerID(),530726,1)
end
--==��s�ֻ�
function Beer_QItem_240506()	--�g�b���s
	PlayMotion ( OwnerID(),118)
	AddBuff(OwnerID(),620787,0,5)
	if FN_CountBuffLevel(OwnerID(), 620787) == 9 then
		CancelBuff(OwnerID(), 620787)
		AddBuff(OwnerID(), 620788, 0, 8)
	end
end

function Beer_Q_422917_get()	--���ȭ豵����Buff
	CancelBuff(TargetID(), 620789)
	AddBuff(TargetID(), 620789, 0, 330)
end

function Beer_Q_422917_finish()	--���ȵ����P�_�ɶ��������y
	local player = TargetID()

	local BuffTime = kg_CheckBuffTime( player, 620789 )
	local CostTime = {150, 90, 10} --�Ѿl�ɶ�
	local Gift = {5, 3, 1}
	--BuffTime = 300-BuffTime

	for i=1,3 do
		if BuffTime >= CostTime[i] then
			GiveBodyItem(player,205941,Gift[i])
			break
		end
	end
	--�M�����n���~
--	local keyID = {545726,545727,545728,545729,545730}
--	for i=1,table.getn(keyID) do
--		SetFlag(OwnerID(), keyID[i], 0)
--	end
	CancelBuff(player, 620789)
	SetFlag(player, 545749, 0)	
	Lua_Festival_09_All(player) 
	DisableQuest(player, false)
end

function Beer_Q_NPC119194()
	local player = OwnerID()
	local keyID = {545726,545727,545728,545729,545730}
	local KeyNum = ReadRoleValue(TargetID(), EM_RoleValue_PID)

	if CheckAcceptQuest( player, 422917 ) == TRUE and CountBodyItem(player, 240080) >= 1 then
		SetSpeakDetail(OwnerID(),"[SC_BEER_2011_FN08]")
		SetFlag(OwnerID(), keyID[KeyNum], 1)
	else
		SetSpeakDetail( player, "[SC_BEER_2011_FN07]")
	end
end

function Beer_Q_DeleteQuest422917()
	local player = OwnerID()
	local Keyitem = {545726, 545727, 545728, 545729, 545730}
	for i=1,table.getn(Keyitem) do
		SetFlag(player, Keyitem[i], 0)	
	end
	if CheckAcceptQuest( player, 422917 ) == false then
		CancelBuff(player, 620789)
	end


end
--==��i�L�����H
function FN_Beer_FoodAddBuff(BuffID,MagicLv,EffectTime,iMotionID,Keyitem) --IDtype��0�N�OOwner  ��1�N�OTarget
	local Keytable = {545731,545732,545733,545734,545735,545736,545737,545738,545739}

	PlayMotion ( OwnerID(),iMotionID)
	AddBuff( OwnerID() ,BuffID,MagicLv ,EffectTime)

	if CheckFlag(OwnerID(), Keyitem) == FALSE then
		SetFlag(OwnerID(),Keyitem,1)
	end

	for i=1,table.getn(Keytable) do
		if CheckFlag(OwnerID(), Keytable[i]) == FALSE then
			return
		end
	end
	GiveBodyItem(OwnerID(),530755,1)
end
--------------------------------------Client Script--------------------------------------

--function LuaClient_Q_113286()
--	if CheckQuest(422914) == 1 then	--1�O���� 2�O���� 0�O�S��
--		return FALSE	--����
--	else
--		return TRUE	--������
--	end
--end

--reloadcliscript

---���սX---
function BeerQ_1()
	local keyID = {545720,545721,545722,545723,545724,545725}
	for i=1,table.getn(keyID) do
		SetFlag(OwnerID(), keyID[i], 1)
	end
end

function BeerQ_2()
	for i=1,11 do
		SetFlag(OwnerID(), 545719+i, 0)
	end
	for j=1,4 do
		SetFlag(OwnerID(), 545745+j, 0)
	end
	SetFlag(OwnerID(), 545751, 0)
end

function BeerQ_3()
	local keyID = {545726,545727,545728,545729,545730}
	for i=1,table.getn(keyID) do
		SetFlag(OwnerID(), keyID[i], 1)
	end
end