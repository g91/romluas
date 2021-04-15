-------------------------------------------------------------------------------------
--�������(��ܿﶵ���ǰe)
-------------------------------------------------------------------------------------
function LuaS_423016_0() --���bNPC���W����ܼ@��
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423016)==true	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423016_0]","LuaS_423016_1", 0 )
	end
	if	CheckCompleteQuest(OwnerID(),423016)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423016_2]","LuaS_423016_3", 0 )
	end
end
function LuaS_423016_1() -- LuaS_423016_0����ܿﶵ
	CloseSpeak(OwnerID())
	Say(TargetID(),"[SC_423016_1]")
	AddBuff(OwnerID(),505969,1,3)
end
function LuaS_423016_2() --BUFF�G505969�����ɶi��ǰe(�S�O�`�N�ۦ�h�ƪ����D)
	ChangeZone(TargetID(),9,0,-21427,1476,31347.5,174.7)
end
function LuaS_423016_3() -- LuaS_423016_0����ܿﶵ
	CloseSpeak(OwnerID())
	ChangeZone(OwnerID(),9,0,-21427,1476,31347.5,174.7)
end
-------------------------------------------------------------------------------------
--�L�����_��(��ܿﶵ���������ȺX��)(�������ȡ��ǰe�@��)
-------------------------------------------------------------------------------------
function LuaS_423017_0()--���bnpc���W����ܼ@��
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423017)==true	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423017_0]","LuaS_423017_1", 0 )
	end
end

function LuaS_423017_1()-- LuaS_423017_0����ܿﶵ
	SetSpeakDetail( OwnerID(),"[SC_423017_1]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423017_2]","LuaS_423017_2", 0 )
end

function LuaS_423017_2()-- LuaS_423017_1����ܿﶵ
	SetSpeakDetail( OwnerID(),"[SC_423017_3]")
	SetFlag(OwnerID(),543589,1)
end

function LuaS_423017_3()--�������Ȱ��檺�@��
	ChangeZone(TargetID(),15,0,19.5,193,5.4,59)
end
-------------------------------------------------------------------------------------
--�ϤH�n��(����������ةǱ������q�X�y�{�èϥΪ��~)
-------------------------------------------------------------------------------------
function LuaS_423020_0()--�I����������@��
	if	CountBodyItem(OwnerID(),202967)==0	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423020_1]", C_Red )
		return -1
	end
--���ȶi�װO��
	DW_QietKillOne(0,103307)
--�u�H����&�����e�O���h��
	WriteRoleValue(TargetID(),EM_RoleValue_PID,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
--�ͥX�s���u�H
	local NewWorker = Lua_DW_CreateObj("obj",ReadRoleValue(TargetID(),EM_RoleValue_OrgID)+173,TargetID())
	MoveToFlagEnabled(NewWorker , false)
	AdjustFaceDir(NewWorker,OwnerID(),0)
--�u�H��ܷP��
	Say(NewWorker,"[SC_423020_0]")
--���u�H����P�_
	CallPlot(TargetID(),"LuaS_423020_1",NewWorker)
--���@�Ӫ���
	DelBodyItem(OwnerID(),202967,1)
	return 1
end

function LuaS_423020_1(NewWorker) --�P�_�O�_�ͥX�s���ˤu�H������
	sleep(300)
	DelObj(NewWorker)
end
-------------------------------------------------------------------------------------
--���s�_��(��ܼ@��)
-------------------------------------------------------------------------------------
function LuaS_423022_0() --���s���骺��ܼ@��
	LoadQuestOption(OwnerID())
	if	CheckFlag(OwnerID(),543682)==false	and
		CheckCompleteQuest(OwnerID(),423022)==false	and
		CheckAcceptQuest(OwnerID(),423022)==true	then
--�i�H�ݨ�����J���X��
		SetFlag(OwnerID(),543682,1)
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423022_0]", C_Yellow )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423022_0]", C_Yellow )
	end
end
-------------------------------------------------------------------------------------
--�t�ѰϪ���ͱM�a(�t���@��)
-------------------------------------------------------------------------------------
function LuaS_423024_0()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
	DisableQuest(OwnerID(),true)
	AddBuff(TargetID(),506112,1,30)
	local Morack = Lua_DW_CreateObj("obj",114685,OwnerID())
	SetDefIdleMotion(Morack,ruFUSION_MIME_IDLE_STAND_02)
	local Night = Lua_DW_CreateObj("flag",114683,780082,1)
	sleep(20)
	Say(Night,"[SC_423024_0]")
	sleep(25)
	Say(Morack,"[SC_423024_1]")
	sleep(25)
	Say(Night,"[SC_423024_2]")
	CastSpell(Night,TargetID(),495198)
	sleep(15)
	Say(Morack,"[SC_423024_3]")
	sleep(20)
	Say(Night,"[SC_423024_4]")
	sleep(30)
	Say(Morack,"[SC_423024_5]")
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_423024_6]", C_Yellow )
	DelObj(Morack)
	DelObj(Night)
	CancelBuff(TargetID(),506112)
	DisableQuest(OwnerID(),false)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
end

function LuaS_423024_1()
	SetPlot(OwnerID(),"range","LuaS_423024_2",100)
end

function LuaS_423024_2()
	if	CheckCompleteQuest(OwnerID(),422976)==true	and
		CheckCompleteQuest(OwnerID(),422980)==false	then
		if	CheckAcceptQuest(OwnerID(),422977)==true	or
			CheckCompleteQuest(OwnerID(),422977)==true	then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423024_7]", C_Yellow )
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_423024_7]", C_Yellow )
		end
	end
end
--�U�⪺��ܼ@��
function LuaS_423024_3()
	SetSpeakDetail( OwnerID(),"[SC_423024_9]")
end
-------------------------------------------------------------------------------------
--�Q�o�T�����ѹ�(��ܼ@��+���~�ϥμ@��)
-------------------------------------------------------------------------------------
function LuaS_423025_0() --�s�]���󪺹�ܼ@��
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423025)==true	then
		if	CountBodyItem(OwnerID(),203461)==0		or
			CountBodyItem(OwnerID(),203462)==0		then
--(�߰ݳo�̦��S�����o�M���ѹ�)
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_423025_0]","LuaS_423025_1", 0 )
		end
	end
end

function LuaS_423025_1() --��ܼ@������
	SetSpeakDetail( OwnerID(),"[SC_423025_1]")
--(�I��)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423025_2]","LuaS_423025_2", 0 )
end

function LuaS_423025_2()
	CloseSpeak(OwnerID())
	AddRoleValue(OwnerID(),EM_RoleValue_Money,-1)
	GiveBodyItem(OwnerID(),203461,1)
	GiveBodyItem(OwnerID(),203462,1)
end

function LuaS_423025_3() --���~�ϥβ��ͪ��~�@��(�ϥΫ����)
	if	DW_CheckBackpage(OwnerID(),1)	then
		DelBodyItem(OwnerID(),203461,1)
		GiveBodyItem(OwnerID(),203463,1)
		UseItemDestroy()
	end
end


function LuaS_423025_4() --�������Ȫ���ܼ@��
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
	DisableQuest(OwnerID(),true)
	AddBuff(TargetID(),506113,1,30)
	local Morack = Lua_DW_CreateObj("obj",114686,OwnerID())
	SetDefIdleMotion(Morack,ruFUSION_MIME_IDLE_STAND_02)
	local Night = Lua_DW_CreateObj("flag",114684,780082,1)
	sleep(15)
	Say(Night,"[SC_423025_3]")
	sleep(15)
	Say(Morack,"[SC_423025_4]")
	sleep(25)
	Say(Night,"[SC_423025_5]")
	CastSpell(Night,Morack,495198)
	sleep(10)
	Say(Morack,"[SC_423025_6]")
	sleep(15)
	Say(Night,"[SC_423025_7]")
	sleep(30)
	DelObj(Morack)
	DelObj(Night)
	CancelBuff(TargetID(),506113)
	DisableQuest(OwnerID(),false)
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
end
-------------------------------------------------------------------------------------
--�Z��§����(��ܼ@��)
-------------------------------------------------------------------------------------
function LuaS_423053_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423053)==true	then
--(�M�ȬP���۩I)
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423053_0]","LuaS_423053_1", 0 )
	end
--�ݭn�����Ȥ]�����~�~��Ĳ�o
	if	CheckAcceptQuest(OwnerID(),423057)==true	and
		CountBodyItem(OwnerID(),203465)>0	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423057_0]","LuaS_423057_1", 0 )
	end
	if	CheckAcceptQuest(OwnerID(),423058)==true	and
		CheckFlag(OwnerID(),543684)==false		then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423058_0]","LuaS_423058_1", 0 )
	end
end
function LuaS_423053_1()
	SetSpeakDetail( OwnerID(),"[SC_423053_1]")
--(�߰ݨȯZ�կS�������ܸ�^
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423053_2]","LuaS_423053_2", 0 )
end
function LuaS_423053_2()
	SetSpeakDetail( OwnerID(),"[SC_423053_3]")
--(ť�U�h)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423053_4]","LuaS_423053_3", 0 )
end
function LuaS_423053_3()
	SetSpeakDetail( OwnerID(),"[SC_423053_5]")
--(�@�۩ʤlť�U�h)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423053_6]","LuaS_423053_4", 0 )
end
function LuaS_423053_4()
	SetSpeakDetail( OwnerID(),"[SC_423053_7]")
--......
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423053_8]","LuaS_423053_5", 0 )
end
function LuaS_423053_5()
	SetSpeakDetail( OwnerID(),"[SC_423053_9]")
	SetFlag(OwnerID(),543683,1)
end
-------------------------------------------------------------------------------------
--�Ӥl��G�I(��ܼ@��)
-------------------------------------------------------------------------------------
function LuaS_423053_6()
	SetSpeakDetail( OwnerID(),"[SC_423054_0]")
	if	CheckAcceptQuest(OwnerID(),423054)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423054_1]","LuaS_423053_7", 0 )
	end
end
function LuaS_423053_7()
	SetSpeakDetail( OwnerID(),"[SC_423054_2]")
	SetFlag(OwnerID(),543742,1)
	if	CountBodyItem(OwnerID(),206461)==true		then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423054_3]","LuaS_423053_8", 0 )
	end
end
function LuaS_423053_8()
	SetSpeakDetail( OwnerID(),"[SC_423054_4]")
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_DODGE)
end
function LuaS_423053_9()
	SetSpeakDetail( OwnerID(),"[SC_423054_5]")
	if	CheckAcceptQuest(OwnerID(),423054)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423054_1]","LuaS_423053_10", 0 )
	end
end
function LuaS_423053_10()
	SetSpeakDetail( OwnerID(),"[SC_423054_6]")
	if	CountBodyItem(OwnerID(),206461)==true		then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423054_3]","LuaS_423053_11", 0 )
	end
end
function LuaS_423053_11()
	SetSpeakDetail( OwnerID(),"[SC_423054_7]")
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_HURT_NORMAL)
end
-------------------------------------------------------------------------------------
--(��ܼ@��)
-------------------------------------------------------------------------------------
function LuaS_423056_0()
	if	CheckCompleteQuest(OwnerID(),423055)==false	then
		SetSpeakDetail( OwnerID(),"[SC_423056_0]")
		if	CheckAcceptQuest(OwnerID(),423055)==true	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_423056_2]","LuaS_423056_1", 0 )
		end
	else
		SetSpeakDetail( OwnerID(),"[SC_423056_1]")
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423056_3]","LuaS_423056_1", 0 )
	end
end
function LuaS_423056_1()
	LoadQuestOption(OwnerID())
end
-------------------------------------------------------------------------------------
--�_�S������(��ܼ@��)
-------------------------------------------------------------------------------------
function LuaS_423057_1()
	SetSpeakDetail( OwnerID(),"[SC_423057_1]")
	SetFlag(OwnerID(),543684,1)
end
function LuaS_423057_2()
	SetPlot(OwnerID(),"range","LuaS_423057_3",50)
end
function LuaS_423057_3()
	local Obj = OwnerID()
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	then
		ChangeZone(OwnerID(),15,0,-12149.6,-440,10079.6,337)
	else
		ScriptMessage( Obj, Obj, 1, "[SC_205426_1]", 0 )
	end
end
function LuaS_423057_4()
	SetPlot(OwnerID(),"range","LuaS_423057_5",50)
end

function LuaS_423057_5()
	local Obj = OwnerID()
	if	ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==0	then
		ChangeZone(OwnerID(),15,0,-9001.9,-630,1643.6,325)
	else
		ScriptMessage( Obj, Obj, 1, "[SC_205426_1]", 0 )
	end
end
-------------------------------------------------------------------------------------
--�קK�԰�����k(�t���@��)
-------------------------------------------------------------------------------------

function LuaS_423058_1()
--������ܵ���
	CloseSpeak(OwnerID())
	local Player = {}
	Player = SearchRangePlayer ( OwnerID() , 500 )
	for i=0,table.getn(Player)-1,1 do
		if	CheckAcceptQuest(Player[i],423058)	and
			CheckFlag(Player[i],543685)==false	then
			SetFlag(Player[i],543753,1)
			ScriptMessage( Player[i], Player[i], 2, "[SC_DW_0]", C_Yellow )
		end
	end
--�������e��
	DisableQuest(TargetID(),true)
	BeginPlot(TargetID(),"LuaS_423058_2",0)
end
function LuaS_423058_2()
--�إ߹L���Ϊ��ȬP&����J
	local Star = Lua_DW_CreateObj("obj",114659,OwnerID())
	local Morack = Lua_DW_CreateObj("flag",114640,780081,1)
	sleep(10)
	Say(Morack,"[SC_423058_1]")
	sleep(20)
	Say(Star,"[SC_423058_2]")
	sleep(25)
	Say(Morack,"[SC_423058_3]")
	sleep(30)
	Say(Star,"[SC_423058_4]")
--�إX�H���]�i��
	local Scout = Lua_DW_CreateObj("flag",114894,780081,2)
	WriteRoleValue(Scout,EM_RoleValue_IsWalk,0)
	Hide(Scout)
	Show(Scout,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	sleep(10)
	DW_MoveToFlag( Scout , 780081 , 3,0 , 1 )
	Say(Scout,"[SC_423058_5]")
	sleep(15)
	Say(Star,"[SC_423058_6]")
	CallPlot(OwnerID(),"DW_MoveToFlag",Star , 780081 , 4,0 , 1)
	sleep(10)
	SetDir( Morack, 106 )
	DW_MoveToFlag( Scout , 780081 , 5,0 , 1 )
	local Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423058)==true	then
			SetFlag(Player[i],543685,1)
			SetFlag(Player[i],543753,0)
		end
	end
	DelObj(Star)
	DelObj(Scout)
	DelObj(Morack)
	DisableQuest(OwnerID(),false)
end
function LuaS_423058_3()
	AddBuff(TargetID(),506173,1,-1)
end
-------------------------------------------------------------------------------------
--�p�k�w�s(�����ȫᵹbuff)
-------------------------------------------------------------------------------------
function LuaS_423059_0()
	AddBuff(TargetID(),505971,1,7200)
end

function LuaS_423059_1()
	CancelBuff(TargetID(),505971)
end
-------------------------------------------------------------------------------------
--�H������(�d����ļ@��)
-------------------------------------------------------------------------------------
function LuaS_423060_0()--���輯�����W���d��@��
	SetPlot(OwnerID(),"range","LuaS_423060_1",200)
end
function LuaS_423060_1()--Ĳ�o�d��@���b���a���W���檺
	if	CheckBuff(OwnerID(),505970)==false	and
		CheckBuff(OwnerID(),506181)==false	then
		SetAttack(TargetID(),OwnerID())
	else
		if	CheckAcceptQuest(OwnerID(),423060)==true	and
			CheckFlag(OwnerID(),543686)==false		then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423060_0]", C_Yellow )
			SetFlag(OwnerID(),543686,1)
		end
	end
end
function LuaS_423060_2()
	local NPC = SearchRangeNPC ( OwnerID() , 600 )
	local CheckOver = false
	for i=0,table.getn(NPC)-1,1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==103444	then
			CheckOver = true
			break
		end
	end
	if	CheckOver == true	then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423060_1]", C_Red )
		return false
	end
end
function LuaS_423060_3()
	AddBuff(OwnerID(),505970,1,30)
end
-------------------------------------------------------------------------------------
--�~��O���H(�ϥΪ��~)
-------------------------------------------------------------------------------------
function LuaS_423062_0()--�ϥΪ��~����
	if	DW_CheckMap(OwnerID(),762)	or
		DW_CheckMap(OwnerID(),769)	then
--�ܨ�buff(�ܨ�)
		if	CastSpell(OwnerID(),OwnerID(),495378)	then
--����buff(����)
			AddBuff(OwnerID(),506181,1,7200)
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423062_0]", 0 )
	end
end

function LuaS_423062_1()
	SetPlot(OwnerID(),"range","LuaS_423062_2",1000)
end

function LuaS_423062_2()
	if	CheckAcceptQuest(OwnerID(),423062)==true	and
		CheckFlag(OwnerID(),543758)==false		then
		SetFlag(OwnerID(),543758,1)
	end
end
--��ܼ@��
function LuaS_423062_3()
	if	CheckBuff(OwnerID(),505972)==true	then
		LoadQuestOption(OwnerID())
	else
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID(), 2 , "[SC_423062_1]", 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_423062_1]", C_Yellow )
	end
end
-------------------------------------------------------------------------------------
--���(��ܼ@��)
-------------------------------------------------------------------------------------
function LuaS_423063_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423063)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423063_0]","LuaS_423063_1", 0 )
	end
end
function LuaS_423063_1()
	SetSpeakDetail( OwnerID(),"[SC_423063_1]")
	SetFlag(OwnerID(),543711,1)
end
-------------------------------------------------------------------------------------
--��䤣�ƥX�䤣�N(��ܼ@��+�t��)
-------------------------------------------------------------------------------------
function LuaS_423064_0()--����J��ܼ@��
	if	CheckBuff(OwnerID(),505972)==true	then
		LoadQuestOption(OwnerID())
		if	CheckAcceptQuest(OwnerID(),423064)==true	and
			CheckFlag(OwnerID(),543712)==false		then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_423064_0]","LuaS_423064_1", 0 )
		end
	else
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID(), 2 , "[SC_423062_1]", 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_423062_1]", C_Yellow )
	end
end
function LuaS_423064_1()--�}�l�԰�
	DisableQuest(TargetID(),true)
	CloseSpeak(OwnerID())
	local MSGP = {}
	MSGP = SearchRangePlayer ( TargetID() , 200 )
	for i=0,table.getn(MSGP),1 do
		if	LuaS_423064_7(MSGP[i])			and
			CheckFlag(MSGP[i],543712)==false	then
			SetFlag(MSGP[i],543752,1)
			ScriptMessage( MSGP[i], MSGP[i], 0, "[SC_DW_0]", C_Yellow )
		end
	end
	local New = Lua_DW_CreateObj("obj",114644,TargetID())
	BeginPlot(New,"LuaS_423064_2",0)
	CallPlot(TargetID(),"LuaS_423064_3",New)
end
function LuaS_423064_2()
--�w���g�B���J�B�ȬP�B�H���ڥX��
	local Delany = Lua_DW_CreateObj("flag",114652,780552,1)
	local Locke = Lua_DW_CreateObj("flag",114792,780552,2)
	local Star = Lua_DW_CreateObj("flag",114650,780552,3)
	local horseman = {}
	for i=1,12,1 do
		horseman[i] = Lua_DW_CreateObj("flag",114748,780551,i)
		Hide(horseman[i])
		WriteRoleValue(horseman[i],EM_RoleValue_IsWalk,0)
	end
	Hide(Delany)
	Hide(Star)
	WriteRoleValue(Delany,EM_RoleValue_IsWalk,0)
	WriteRoleValue(Star,EM_RoleValue_IsWalk,0)
	Show(Delany,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	Show(Star,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	for i=1,12,1 do
		Show(horseman[i],ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	end
--�إߤ@��s���ȯZ�կS�س����M��s��
	local Army = {}
	local Research = {}
	for i=1,7,1 do
		Army[i] = Lua_DW_CreateObj("flag",114790,780553,i)
	end
	for i=1,3,1 do
		Research[i] = Lua_DW_CreateObj("flag",114791,780554,i)
	end
	local MSGP = {}
	MSGP = SearchRangePlayer ( OwnerID() , 300 )
--�H���ڪ��i�h�I�����I
	for i=0,table.getn(MSGP),1 do
		if	LuaS_423064_7(MSGP[i])	then
			ScriptMessage( MSGP[i], MSGP[i] , 2, "[SC_423064_1]", C_Yellow )
		end
	end
--�Ҧ����H��V
	for i=1,table.getn(Research),1 do
		SetDir( Research[i], 304 )
	end
	for i=1,table.getn(Army),1 do
		SetDir( Army[i], 304 )
	end
	SetDir( Locke, 304 )
	sleep(20)
--���J�G�ٮt�@�B�Ҧ��H����y�N�n�����A�~���b�d����I�H
	Yell(Locke,"[SC_423064_2]",3)
-- �ȬP&�H���ڶ}�l����
	for i=1,table.getn(horseman),1 do
		CallPlot(horseman[i],"DW_MoveToFlag", horseman[i] , 780556 , i+1,0 , 1)
	end
	DW_MoveToFlag(Star , 780556 , 1,0 , 1)
	AdjustFaceDir(Locke,Star,0)
	AdjustFaceDir(Star,Locke,0)
	for i=1,table.getn(Army),1 do
		AdjustFaceDir(Army[i],Star,0)
	end
	for i=1,table.getn(Research),1 do
		AdjustFaceDir(Research[i],Star,0)
	end
	sleep(20)
	for i=1,table.getn(horseman),1 do
		AdjustFaceDir(horseman[i],Locke,0)
	end

--���J�G��I��ӬO�ȬP���Ӧѳå�C�S���Y�A�ڦ��N���L�ǳƤF�S�O���`��......
	Yell(Locke,"[SC_423064_3]",3)
	sleep(20)
--���J�G�ޡI�A�I�⨺�ӤH���a�L�ӡI
	Yell(Locke,"[SC_423064_4]",3)
--�w���g���}�cŢ
	CallPlot(Delany,"DW_MoveToFlag", Delany , 780552 , 4,0 , 1)
	sleep(25)
--���J�G�ޡI���Y�l�I�A�O�E�ʡI�ڭ̩��ѴN�|���}�I
	Yell(Locke,"[SC_423064_5]",3)
--����J�M�w���g�}�l����
	CallPlot(Delany,"DW_MoveToFlag", Delany , 780552 , 6,0 , 1)
	DW_MoveToFlag(OwnerID() , 780552 , 5, 0 , 1)
--���J�G�p�G�A�Ĩİt�X����ֳ����|���ˡI�_�h����......
	Yell(Locke,"[SC_423064_6]",3)
	sleep(20)
--�I����
	CastSpell(OwnerID(),Locke,495115)
	sleep(5)
--����J�G�_�h���ܧA�N�n�U�a���I
	Yell(OwnerID(),"[SC_423064_7]",3)
	sleep(10)
	AdjustFaceDir(Locke,OwnerID(),0)
--���J�G��I�A�H�I
	Yell(Locke,"[SC_423064_8]",3)
	sleep(5)
	PlayMotion(Locke,ruFUSION_ACTORSTATE_HURT_NORMAL)
	sleep(15)
--����J�G�o�M�O���F�ڪ��B�ͦӨ�I�A�������W���٤��u�o�ǡI......
	Yell(OwnerID(),"[SC_423064_9]",3)
	sleep(10)
--�����T���G����J���G�Pı�줰�򲧼ˡI�~�Y�ǨӨ��輯������q�n�I
	MSGP = {}
	MSGP = SearchRangePlayer ( OwnerID() , 400 )
	for i=0,table.getn(MSGP),1 do
		if	LuaS_423064_7(MSGP[i])	then
			ScriptMessage( MSGP[i] , MSGP[i] , 0, "[SC_423064_10]", C_Red )
			ScriptMessage( MSGP[i], MSGP[i] , 2, "[SC_423064_10]", C_Red )
		end
	end
	sleep(15)
--����J�G�x�H�o���i�઺......������|���o��h���������O���o�̨ӡI�H
	Yell(OwnerID(),"[SC_423064_11]",3)
--���ͨ��s
	local dragan = {}
	local xyz = {-11619,-615,4373}
	for i=1,10,1 do
		if	i%2 ==0	then
			xyz[1] = xyz[1]+10
		else
			xyz[3] = xyz[3] +10
		end
		dragan[i] = Lua_DW_CreateObj("xyz",114751,xyz)
		Hide(dragan[i])
		WriteRoleValue(dragan[i],EM_RoleValue_IsWalk,0)
		Show(dragan[i],0)
--��������
		SetModeEx(dragan[i],EM_SetModeType_Searchenemy,false) 
--�����J����m�]�L�h
		CallPlot(dragan[i],"DW_MoveToFlag",dragan[i] , 780552 , 2,50 , 1  )
	end
--���J�G�ާA���򤸯����O�A������ŧ�ڡI���ڥh���a�I
	Yell(Locke,"[SC_423064_12]",3)
--�I�k�G�Щ��N
	CastSpell(OwnerID(),OwnerID(),495116)
	sleep(10)
--����J�G�Щ��N�I
	Yell(OwnerID(),"[SC_423064_13]",3)


	local stone = {}
	local Player = SearchRangePlayer ( OwnerID() , 500 )
--�����л\������
	BeginPlot(Star,"LuaS_423064_4",0)
	BeginPlot(Delany,"LuaS_423064_4",0)
	BeginPlot(OwnerID(),"LuaS_423064_4",0)
	for i=4,table.getn(horseman)+3,1 do
		BeginPlot(horseman[i-3],"LuaS_423064_4",0)
	end
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423064)==true	and
			CheckFlag(Player[i],543712)==false	then
			BeginPlot(Player[i],"LuaS_423064_4",0)
		end
	end
--�b�Ҧ����H���W���Wbuff
	AddBuff(OwnerID(),506075,1,-1)
	AddBuff(Star,506075,1,-1)
	AddBuff(Delany,506075,1,-1)
	for i=4,table.getn(horseman)+3,1 do
		AddBuff(horseman[i-3],506075,1,-1)
	end
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423064)==true	and
			CheckFlag(Player[i],543712)==false	then
			AddBuff(Player[i],506075,1,-1)
			AddBuff(Player[i],506277,1,30)
		end
	end
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND_02)
	SetDefIdleMotion(Star,ruFUSION_MIME_IDLE_STAND_02)
	SetDefIdleMotion(Delany,ruFUSION_MIME_IDLE_STAND_02)
	for i=4,table.getn(horseman)+3,1 do
		SetDefIdleMotion(horseman[i-3],ruFUSION_MIME_IDLE_STAND_02)
	end
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423064)==true	and
			CheckFlag(Player[i],543712)==false	then
			SetDefIdleMotion(Player[i],ruFUSION_MIME_IDLE_STAND_02)
		end
	end

--���ݨ��s��F�w�w��m
	while	true	do
		sleep(1)
		if	CheckDistance(Locke,dragan[1], 100)	then
			for i=1,table.getn(Research),1 do
				SetModeEx(Research[i],EM_SetModeType_Fight,true) 
				SetModeEx(Research[i],EM_SetModeType_Strikback,true) 
			end
			for i=1,table.getn(Army),1 do
				SetModeEx(Army[i],EM_SetModeType_Fight,true) 
				SetModeEx(Army[i],EM_SetModeType_Strikback,true) 
			end
			SetModeEx(Locke,EM_SetModeType_Fight,true) 
			SetModeEx(Locke,EM_SetModeType_Strikback,true) 
			for i=1,table.getn(dragan),1 do
				StopMove(dragan[i],true)
--���}����
				SetModeEx(dragan[i],EM_SetModeType_Searchenemy,true) 
				SetModeEx(dragan[i],EM_SetModeType_Fight,true) 
				SetModeEx(dragan[i],EM_SetModeType_Strikback,true) 
			end
			break
		end
	end
--���s�ﬥ�J�ľW
--�԰������i�}
	for i=table.getn(Research)+1,table.getn(dragan),1 do
		for a=1,table.getn(Research),1 do
			SetAttack(dragan[a],Research[a])
		end
		SetAttack(dragan[i],Locke)
		CastSpell(dragan[i],Locke,495117)
	end
	for b=1,table.getn(Army),1 do
		SetAttack(Army[b],dragan[b])
	end
	local Pass = true
	while	Pass	do
		sleep(15)
		if	CheckID(Locke)==false	then
			for i=1,table.getn(Research),1 do
				if	CheckID(Research[i])==true	then
					break
				end
				if	i==table.getn(Research)	then
					for k=1,table.getn(Army),1 do
						if	CheckID(Army[i])==true	then
							break
						end
					end
					Pass =false
				end
			end
		end
	end
--����J�GTistainra Pean Roitei�I
	Yell(OwnerID(),"[SC_423064_14]",3)
	sleep(30)
--���s�̧C�q�����۳Q���ۥ]�Ъ�����J
	MSGP = {}
	MSGP = SearchRangePlayer ( OwnerID() , 400 )
	for i=0,table.getn(MSGP),1 do
		if	LuaS_423064_7(MSGP[i])	then
			ScriptMessage( MSGP[i] , MSGP[i] , 0, "[SC_423064_15]", C_Red )
		end
	end
	sleep(10)
	for i=1,table.getn(dragan),1 do
		CallPlot(dragan[i],"DW_MoveToFlag",dragan[i] , 780555 , i,0 , 1)
		WriteRoleValue(dragan[i],EM_RoleValue_LiveTime,3)
	end
	sleep(20)
	local Scout = Lua_DW_CreateObj("flag",114749,780551,3)
	Hide(Scout)
	WriteRoleValue(Scout,EM_RoleValue_IsWalk,0)
	Show(Scout,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
--����buff�òM������
	CancelBuff(OwnerID(),506075)
	CancelBuff(Star,506075)
	CancelBuff(Delany,506075)
	for i=4,table.getn(horseman)+3,1 do
		CancelBuff(horseman[i-3],506075)
	end
	local Rock = SearchRangeNPC ( OwnerID() , 500 )
	for i=0,table.getn(Rock),1 do
		if	ReadRoleValue(Rock[i],EM_RoleValue_OrgID)==114868	then
			DelObj(Rock[i])
		end
	end
--�����ܨ����۪�buff
	Player = SearchRangePlayer ( OwnerID() , 700 )
	for i=0,table.getn(Player)-1,1 do
		if	CheckBuff(Player[i],506075)==true	then
			CancelBuff(Player[i],506075)
		end
	end
--����J�G�I�I�t�I�����U�h......���̬O�q���̶]�X�Ӫ��I
	Yell(OwnerID(),"[SC_423064_16]",3)
--�H�����Ԧb�ȬP���Ǧջy�F�X�y�A�ȬP�y�W�����ܤF���ܡC
	DW_MoveToFlag( Scout  , 780552,7 , 0 , 1  )
	MSGP = {}
	MSGP = SearchRangePlayer ( OwnerID() , 400 )
	for i=0,table.getn(MSGP),1 do
		if	LuaS_423064_7(MSGP[i])	then
			ScriptMessage( MSGP[i] , MSGP[i] , 0, "[SC_423064_17]", C_Red )
		end
	end
	sleep(20)
--�ȬP�G����J�A���@�U�^��a����ڦ��I�Ƹ�A���A�ڥ��a�w���g�D�ȬP�^�h�C
	Yell(Star,"[SC_423064_18]",3)
--�M��
	CallPlot(Scout,"DW_MoveToFlag",Scout , 780555 , 1,0 , 1)
	CallPlot(star,"DW_MoveToFlag",star , 780555 , 2,0 , 1)
	CallPlot(Delany,"DW_MoveToFlag",Delany , 780555 , 3,0 , 1)
	for i=1,table.getn(horseman),1 do
		CallPlot(horseman[i],"DW_MoveToFlag",horseman[i] , 780555 , i+3,0 , 1)
		WriteRoleValue(horseman[i],EM_RoleValue_LiveTime,3)
	end
	WriteRoleValue(Scout,EM_RoleValue_LiveTime,3)
	WriteRoleValue(star,EM_RoleValue_LiveTime,3)
	WriteRoleValue(Delany,EM_RoleValue_LiveTime,3)
	for i=0,table.getn(Player)-1,1 do
		if	CheckBuff(Player[i],506277)==true	then
			CancelBuff(Player[i],506277)
--���ŦX���󪺤H�����X��
			--say(Player[i], "GOT")
		end
			if	CheckAcceptQuest(Player[i],423064)==true	and
				CheckFlag(Player[i],543712)==false	then
				SetFlag(Player[i],543712,1)
			end
	end
	DelObj(OwnerID())
end

function LuaS_423064_3(Tar)
	while	CheckID(Tar)==true	do
		sleep(10)
	end
	DisableQuest(OwnerID(),false)
	return true
end

function LuaS_423064_4()
	local Rock = Lua_DW_CreateObj("obj",114868,OwnerID(),0)
	SetModeEx(Rock ,EM_SetModeType_Mark,false)
	SetModeEx(Rock,EM_SetModeType_Searchenemy,false)
	SetModeEx(Rock,EM_SetModeType_Fight,false)
	AddToPartition(Rock ,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --���J�P�h
	BeginPlot(Rock,"LuaS_423064_5",0)
	PlayMotion(Rock ,ruFUSION_ACTORSTATE_SPAWN_BEGIN)
end
function LuaS_423064_5()
	while CheckID(TargetID())==true	do
		sleep(10)
	end
	DelObj(OwnerID())
	return true
end

function LuaS_423064_6()
	local Man
	while true do
		sleep(50)
		Man = Lua_DW_CreateObj("flag",114746,780083,1)
		DW_MoveToFlag( Man , 780083 , 2,0 , 1  )
		SetDir( Man, 180 )
		CastSpell(Man,Man,495237)
		sleep(20)
		DelObj(Man)
	end
end

function LuaS_423064_7(obj)
	if	CheckAcceptQuest(obj,423064)==true	then
		if	CheckFlag(obj,543712)==false	then
			return true
		else
			return false
		end
	else
		return	false
	end
end

function LuaS_423064_8()
	SetPlot(OwnerID(),"range","LuaS_423064_9",700)
end

function LuaS_423064_9()
	if	CheckAcceptQuest(OwnerID(),423065)	then
		SetFlag(OwnerID(),543803,1)
	end
end

function LuaS_423065_0()
	CancelBuff(TargetID(),505972)
	return true
end

function LuaS_423066_0()
	Say(OwnerID(),"[SC_423066_0]")
	LuaS_Discowood_Motion_Beg()
end

function LuaS_423066_1()
	Say(OwnerID(),"[SC_423066_1]")
	LuaS_Discowood_Motion_Beg()
end