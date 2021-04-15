-----------------------------------------------
--�E�P��q 423448
-----------------------------------------------
--���a�����ʧ@���ˬd
function LuaS_423448_0()
	local BuffPos
	local BuffPower
--�ˬd���a���S����������
	if	CheckAcceptQuest(TargetID(),423448)	and
		ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)==104005	then
--���ȡG�E�P��q
		AddBuff(TargetID(),507212,0,10)
		BuffPos = Lua_BuffPosSearch(TargetID(),507212)
		if	BuffPos~=-1	then
			BuffPower = BuffInfo(TargetID(),BuffPos,EM_BuffInfoType_Power)
DeBugMSG(0,0,"BuffPos="..BuffPos.."####BuffPower="..BuffPower)
--��3��������=>�ѵ�3
			if	BuffPower > 6		then
--�ŦX���󪺶��K��������
				if	CheckFlag(TargetID(),544026)==false		and
					CheckAcceptQuest(TargetID(),423448)==true	then
					SetFlag(TargetID(),544026,1)
				end
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_423448_2]", 0 )
				return
			end
--��2��������=>�ѵ�2
			if	BuffPower > 4		then
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_423448_1]", 0 )
				return
			end
--��1��������=>�ѵ�1
			if	BuffPower > 2		then
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_423448_0]", 0 )
				return
			end
		end
	end
--���ȡG�s��R�u��
	if	CheckAcceptQuest(TargetID(),423458)	and
		ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)==104146	then
		AddBuff(TargetID(),507212,0,10)
		BuffPos = Lua_BuffPosSearch(TargetID(),507212)
		if	BuffPos~=-1	then
			BuffPower = BuffInfo(TargetID(),BuffPos,EM_BuffInfoType_Power)
DeBugMSG(0,0,"BuffPos="..BuffPos.."####BuffPower="..BuffPower)
--�i�H��s�F�I
			if	BuffPower > 3		then
				ScriptMessage( TargetID(), TargetID(), 2, "[SC_423458_0]", 0 )
			end
		end
	end
	return
end
------------------------------------------
--�����x�������`�@��
function LuaS_423448_1()
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
	return false
end


-------------------------------------------
--�����x������ܼ@��1
function LuaS_423448_2()
	LoadQuestOption(OwnerID())

	if	CheckAcceptQuest(OwnerID(),423448)==true	and
		CheckFlag(OwnerID(),544026)==false		and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423448_3]","LuaS_423448_3", 0 )
	end
end

-------------------------------------------
--�����x������ܼ@��2(�԰��e�����H�@�� �F�]�W��)
function LuaS_423448_3()
	DisableQuest(TargetID(),true)
	CloseSpeak(OwnerID())
	local NewGuy = Lua_DW_CreateObj("obj",104005,TargetID(),0)
--������ ������
	SetModeEx(NewGuy,EM_SetModeType_Strikback,false) 
	SetModeEx(NewGuy,EM_SetModeType_Move,false) 
	AddToPartition(NewGuy,0)
	SetPlot(NewGuy,"dead","LuaS_423448_1",0)
	AddBuff(NewGuy,507210,0,-1)
	CallPlot(NewGuy,"LuaS_423448_4",TargetID())
	Say(NewGuy,"[SC_423448_4]")
	local BodyGuard = SearchRangeNPC ( OwnerID() , 150 )
	for i=0,table.getn(BodyGuard),1 do
		if	ReadRoleValue(BodyGuard[i],EM_RoleValue_OrgID)==104004	then
			SetAttack(BodyGuard[i],OwnerID())
		end
	end

	DelFromPartition(TargetID())
	DisableQuest(TargetID(),false)
end

-------------------------------------------
--�԰��������H�@��
function LuaS_423448_4(Tar)
	local TempHP = ReadRoleValue(OwnerID(),EM_RoleValue_HP)
DeBugMSG(0,0,"TempHP="..TempHP)
--10���o�b��
	sleep(100)
--�P�_�O�_�٦b�԰�����
	while	TempHP>ReadRoleValue(OwnerID(),EM_RoleValue_HP)	do
		TempHP = ReadRoleValue(OwnerID(),EM_RoleValue_HP)
DeBugMSG(0,0,"TempHP="..TempHP)
		if	DW_Rand(2) ==2	then
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SURRENDER)			
		else
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BEG)
		end
		sleep(30)
		if	DW_Rand(2) ==2	then
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SURRENDER)			
		else
			PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_BEG)
		end
		sleep(30)
	end
--���}�ԱN�쥻���x���ئ^��
	AddToPartition(Tar,0)
	DelObj(OwnerID())
end

-----------------------------------------------
--�s��R�u�� 423458
-----------------------------------------------
--�ϥΪ��~���ˬd�@��
function LuaS_423458_0()
DeBugMSG(0,0,"1")
--�X�F�w�g�Q����
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==115945	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423458_2]", 0 )
		return false
	end
--�ؼп��~
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)~=104146	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_421101_0]", 0 )
		return false
	end
--�T�{�Z��
	if	CheckDistance(OwnerID(),TargetID(), 40)==false	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_102623_17]", 0 )
		return false
	end
--�T�{�i��
	local BuffPos,BuffPower
	BuffPos = Lua_BuffPosSearch(OwnerID(),507212)
	if	BuffPos~=-1	then
		BuffPower = BuffInfo(OwnerID(),BuffPos,EM_BuffInfoType_Power)
		if	BuffPower > 3	then
			return true
		else
--���o�٤���
			PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_ROFL)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423458_1]", 0 )
			return false
		end
	else
--���o�٤���
		PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_ROFL)
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423458_1]", 0 )
		return false
	end
end

-----------------------------------------------
--�ϥΪ��~������@��
function LuaS_423458_1()
DeBugMSG(0,0,"2")
	DelFromPartition(TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_423458_3]", 0 )
	local NewGuy = Lua_DW_CreateObj("obj",115945,TargetID())
	CallPlot(NewGuy,"LuaS_423458_3",TargetID())
end


-----------------------------------------------
--�X�F�D��J��  104146  ����l�@��
function LuaS_423458_2()
--�ɥΩx���������@��
	SetPlot(OwnerID(),"dead","LuaS_423448_1",0)
--�[�W�ϼu��buff�T�w�i��
	AddBuff(OwnerID(),507210,0,-1)
end


-----------------------------------------------
--�۹ꪺ�X�F�D��J��  115945  ����l�@��
function LuaS_423458_3(Tar)
	AddBuff(OwnerID(),507212,0,60)
	while CheckBuff(OwnerID(),507212)	do
		sleep(20)
	end
	AddToPartition(Tar,0)
	DelObj(OwnerID())
end

-----------------------------------------------
--�۹ꪺ�X�F�D��J��  115945  ����ܼ@��
function LuaS_423458_4()
	AddBuff(TargetID(),507212,0,60)
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423458)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423458_4]","LuaS_423458_5", 0 )
	end
end

function LuaS_423458_5()
	AddBuff(TargetID(),507212,0,60)
	SetSpeakDetail( OwnerID(),"[SC_423458_5]")
	if	CheckAcceptQuest(OwnerID(),423458)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423458_6]","LuaS_423458_6", 0 )
	end
end

function LuaS_423458_6()
	AddBuff(TargetID(),507212,0,60)
	SetSpeakDetail( OwnerID(),"[SC_423458_7]")
	if	CheckAcceptQuest(OwnerID(),423458)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423458_8]","LuaS_423458_7", 0 )
	end
end

function LuaS_423458_7()
	AddBuff(TargetID(),507212,0,60)
	SetSpeakDetail( OwnerID(),"[SC_423458_9]")
	if	CheckAcceptQuest(OwnerID(),423458)	then
		SetFlag(OwnerID(),544295,1)
	end
end

function LuaS_423458_8()
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
end

-----------------------------------------------
--�H���Ϥ� 423459
-----------------------------------------------
--���~�ˬd�@��
function LuaS_423459_0()
	local NPC = SearchRangeNPC ( OwnerID() , 200 )
	local Morek
--���ˬd�O�_�w�g���H�I��
	for i=0,table.getn(NPC)-1,1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==115947	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423459_2]", 0 )
			return false
		end
	end
--�A�ˬd����J���Z���O�_�A��
DeBugMSG(0,0,"table.getn"..table.getn(NPC))
	for i=0,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==115946	then
			Morek = NPC[i]
			if	CheckDistance(OwnerID(),Morek, 150)	then
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423459_1]", 0 )
				return false
			else
				return true
			end
		end
--���S�H�N�ԭˡI
DeBugMSG(0,0,"i="..i)
		if	i==table.getn(NPC)	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423459_0]", 0 )
			return false
		end
	end
end

--���~�ϥμ@��
function LuaS_423459_1()
	local Fire = {}
	local Director
--���ˬd�O�_�w�g���H�I��
	local NPC = SearchRangeNPC ( OwnerID() , 200 )
	local Morek
	for i=0,table.getn(NPC)-1,1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==115947	then
			return false
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==115946	then
			Morek =  NPC[i]
		end
--���S�H�N�}�l�t
		if	i==table.getn(NPC)-1	then
			DisableQuest(Morek,true)
			Director = Lua_DW_CreateObj("flag",115947,780081,1)
--�إ����βy
			Fire[1] = Lua_CreateObjByDir( OwnerID() , 115978 , 25 , 0) 
			Fire[2] = Lua_DW_CreateObj("flag",115978,780081,1)
			Fire[3] = Lua_CreateObjByDir( OwnerID() , 115978 , 25 , 0) 
			Fire[4] = Lua_DW_CreateObj("flag",115978,780081,1)
			AddToPartition(Fire[1],0)
			AddToPartition(Fire[3],0)
--�����аO���]�w
			for i=1,4,1 do
				SetModeEx(Fire[i],EM_SetModeType_Mark,false) 
				SetModeEx(Fire[i],EM_SetModeType_ShowRoleHead,false) 
				SetModeEx(Fire[i],EM_SetModeType_HideName,true) 
				SetModeEx(Fire[i],EM_SetModeType_Gravity,false) 
				SetModeEx(Fire[i],EM_SetModeType_Move,false) 
				WriteRoleValue(Fire[i],EM_RoleValue_LiveTime,4)
			end
--�԰���m
			SetPos(Fire[3] , ReadRoleValue(Fire[1],EM_RoleValue_X), ReadRoleValue(Fire[1],EM_RoleValue_Y)+300, ReadRoleValue(Fire[1],EM_RoleValue_Z) , ReadRoleValue(Fire[1],EM_RoleValue_Dir))
			SetPos(Fire[4] , ReadRoleValue(Fire[2],EM_RoleValue_X), ReadRoleValue(Fire[2],EM_RoleValue_Y)+300, ReadRoleValue(Fire[2],EM_RoleValue_Z) , ReadRoleValue(Fire[2],EM_RoleValue_Dir))
			CallPlot(Director,"LuaS_423459_2",Morek,Fire[1],Fire[2],Fire[3],Fire[4])
		end
	end
end


--���Ȫ�t�@��
function LuaS_423459_2(QuestNPC,Fire1,Fire2,Fire3,Fire4)
	local xyz = {5337,600,31037}
	local Morek
	local NPC = QuestNPC

	sleep(10)

--��Ϥ�
	CastSpell(Fire1 ,Fire3 ,494400)
	CastSpell(Fire2 ,Fire4 ,494400)

	sleep(20)
--���ͦN��
	local Morek = Lua_DW_CreateObj("flag",115977,780081,2)
	SetDefIdleMotion(Morek,ruFUSION_MIME_IDLE_STAND_02)
	SetDefIdleMotion(QuestNPC,ruFUSION_MIME_IDLE_STAND_02)
	local Jill = Lua_DW_CreateObj("xyz",115948,xyz)
	AddBuff( Jill, 506984, 4, -1 )
	SetModeEx(Jill,EM_SetModeType_Gravity,false) 
	SetDefIdleMotion(Jill,ruFUSION_MIME_RUN_FORWARD)
	MoveDirect( Jill, 5197 , 400 , 30860 )

	while CheckDistance(Jill,Morek, 100)==false	do
		sleep(2)
	end

--	SetDefIdleMotion(Jill,ruFUSION_MIME_IDLE_COMBAT_UNARMED)

--	sleep(5)
--���a
--	PlayMotion( Jill, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
--	sleep(3)
	PlayMotion( Jill, ruFUSION_ACTORSTATE_CAST_SP01 )
	SetDefIdleMotion(Jill,ruFUSION_MIME_IDLE_STAND)

	sleep(30)
	Say(Jill,"[SC_423459_3]")
	PlayMotion(Jill,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)
	Say(Morek,"[SC_423459_4]")
	sleep(20)
	Say(Jill,"[SC_423459_5]")
	PlayMotion(Jill,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(30)
	Say(Morek,"[SC_423459_6]")
	PlayMotion(Jill,ruFUSION_ACTORSTATE_EMOTE_CRY)
	sleep(30)
	Say(Morek,"[SC_423459_7]")
	sleep(20)
	Say(Jill,"[SC_423459_8]")
	PlayMotion(Jill,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(35)
	Say(Morek,"[SC_423459_9]")
	PlayMotion(Jill,ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(30)
	Say(Jill,"[SC_423459_10]")
--�_��
	PlayMotion(Jill,ruFUSION_MIME_JUMP_UP)
	sleep(5)
	SetDefIdleMotion(Jill,ruFUSION_MIME_IDLE_COMBAT_UNARMED)

	sleep(10)
	MoveDirect( Jill, 5337,600,31037 )
	SetDefIdleMotion(Jill,ruFUSION_MIME_RUN_FORWARD)

	local Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423459)==true	and
			CheckFlag(Player[i],544296)==false	then
			SetFlag(Player[i],544296,1)
		end
	end
	while CheckDistance(Jill,Morek, 200)	do
		sleep(10)
	end
--�M��
	DelObj(Jill)
--�����ȺX��
	local Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423459)==true	and
			CheckFlag(Player[i],544296)==false	then
			SetFlag(Player[i],544296,1)
		end
	end
	DelObj(Morek)
	DisableQuest(NPC,false)
	DelObj(OwnerID())
end
-----------------------------------------------
--�s�u�� 423460
-----------------------------------------------
function LuaS_423460_0()
	SetPlot(OwnerID(),"range","LuaS_423460_1",130)
end

function LuaS_423460_1()
	if	CheckAcceptQuest(OwnerID(),423460)==true	and
		CheckFlag(OwnerID(),544303)==false		then
		SetFlag(OwnerID(),544303,1)
	end
end
-----------------------------------------------
--�u�z���� 423461
-----------------------------------------------
--�ϥΪ��~�ˬd�԰�
function LuaS_423461_0()
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205953_1]", 0 )
		return false
	end
--�����M��
	DW_CancelTypeBuff(68)
end
--���~����Wbuff
function LuaS_423461_1()
	AddBuff(OwnerID(),507213,1,1800)
end
--�d��@��
function LuaS_423461_2()
	SetPlot(OwnerID(),"range","LuaS_423461_3",70)
end

function LuaS_423461_3()
	if	CheckBuff(OwnerID(),507213)==false	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423461_5]", 0 )
	end
end
--�g�媺���
function LuaS_423461_4()
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_423461_1]" )
	AddBorderPage( OwnerID(), "[SC_423461_2]" )
	AddBorderPage( OwnerID(), "[SC_423461_3]" )
	ShowBorder( OwnerID(), 0, "[SC_423461_0]" , "ScriptBorder_Texture_Paper" )
end
--���Ĳ�I�@��
function LuaS_423461_5()
	SetPlot(OwnerID(),"touch","LuaS_423461_6",50)
end

function LuaS_423461_6()
	if	CountBodyItem(OwnerID(),207753)>0	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423461_4]", 0 )
	else
		GiveBodyItem(OwnerID(),207753,1)
	end
end

function LuaS_423461_7()
	SetPlot(OwnerID(),"touch","LuaS_423461_8",50)
end

function LuaS_423461_8()
	if	CountBodyItem(OwnerID(),207752)>0	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423461_6]", 0 )
	else
		GiveBodyItem(OwnerID(),207752,1)
	end
end

function LuaS_423461_9()
	CancelBuff(TargetID(),507213)
end
-----------------------------------------------
--�J�� 423462
-----------------------------------------------
--��ܼ@��
function LuaS_423462_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423462)==true	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_423462_0]","LuaS_423462_1", 0 )
	end
end

function LuaS_423462_1()
	DisableQuest(TargetID(),true)
	BeginPlot(TargetID(),"LuaS_423462_2",0)
	CloseSpeak(OwnerID())
end

function LuaS_423462_2()
	MoveToFlagEnabled(OwnerID(), false)
	local Mob = {}

	local Boss
	local Jason
	local xyz = {4965,500,37104}
	local Jill,Lobo


	Say(OwnerID(),"[SC_423462_1]")
	sleep(10)
	ScriptMessage( OwnerID(), 0, 2, "[SC_423462_2]", 0 )
	sleep(10)
--�إߩǪ�
	for i=1,6,1 do
		Mob[i] = Lua_DW_CreateObj("flag",116043,780082,i)
	end
	Boss = Lua_DW_CreateObj("flag",116044,780082,7)
--����J��k�N
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	Say(OwnerID(),"[SC_423462_3]")
	CastSpell(OwnerID(),OwnerID(),494221)
	AddBuff(OwnerID(),507234,1000,-1)

	sleep(20)
--�}��
	for i=1,6,1 do
		SetModeEx(Mob[i],EM_SetModeType_Fight,true) 
		SetModeEx(Mob[i],EM_SetModeType_Strikback,true) 
		SetModeEx(Mob[i],EM_SetModeType_HideName,false) 
		SetModeEx(Mob[i],EM_SetModeType_ShowRoleHead,true) 
		SetAttack(Mob[i],OwnerID())
	end
	SetModeEx(Boss,EM_SetModeType_Fight,true) 
	SetModeEx(Boss,EM_SetModeType_Strikback,true) 
	SetModeEx(Boss,EM_SetModeType_HideName,false) 
	SetModeEx(Boss,EM_SetModeType_ShowRoleHead,true) 
	SetAttack(Boss,OwnerID())

	sleep(30)
--�N��B�ҧB�n��
	Jill = Lua_DW_CreateObj("xyz",116042,xyz)
	xyz[1] = xyz[1] + 10
	xyz[3] = xyz[3] + 10
	Lobo = Lua_DW_CreateObj("xyz",116041,xyz)

	AddBuff( Jill, 506984, 6, -1 )
	AddBuff( Lobo, 506984, 6, -1 )

	SetModeEx(Jill,EM_SetModeType_Gravity,false) 
	SetModeEx(Lobo,EM_SetModeType_Gravity,false) 

	SetDefIdleMotion(Jill,ruFUSION_MIME_RUN_FORWARD)
	SetDefIdleMotion(Lobo,ruFUSION_MIME_RUN_FORWARD)


	MoveDirect( Jill, 4993.2 , -21 , 37400 )
	MoveDirect( Lobo, 5026.6 , -24.8 , 37392.8 )
	MoveToFlagEnabled(Jill, false)
	MoveToFlagEnabled(Lobo, false)
	
	while true do
		sleep(2)
		if	ReadRoleValue(jill,EM_RoleValue_Y)<0	then
			break
		end
	end
--���a
	Say(Jill,"[SC_423462_4]")
	PlayMotion( Jill, ruFUSION_ACTORSTATE_CAST_SP01 )
	SetDefIdleMotion(Jill,ruFUSION_MIME_IDLE_COMBAT_UNARMED)
	PlayMotion( Lobo, ruFUSION_ACTORSTATE_CROUCH_END )
	SetDefIdleMotion(Lobo,ruFUSION_MIME_IDLE_STAND)
	SetModeEx(Lobo,EM_SetModeType_Fight,true) 
	SetModeEx(Lobo,EM_SetModeType_Searchenemy,true) 
	SetModeEx(Lobo,EM_SetModeType_Strikback,true) 
	SetModeEx(Lobo,EM_SetModeType_HideName,false) 
	SetAttack(Lobo,ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID))
	Say(OwnerID(),"[SC_423462_12]")
	sleep(10)
--�j�˵n��
	Jason = Lua_DW_CreateObj("flag",116045,780082,8)
	SetModeEx(Jason,EM_SetModeType_Fight,false) 
	SetModeEx(Jason,EM_SetModeType_Searchenemy,false) 
	SetModeEx(Jason,EM_SetModeType_HideName,true) 
	WriteRoleValue(Jason,EM_RoleValue_IsWalk,1)
	Hide(Jason)
	Show(Jason,0)
--�j�˲���
	DW_MoveToFlag( Jason,780082 ,9,0 )
	sleep(10)
	Say(Jill,"[SC_423462_5]")
	sleep(20)
--�Ǵ˪��L�y�ݻa��
	Say(Jason,"[SC_422713_6]")
	SetModeEx(Jason,EM_SetModeType_HideName,false) 
	SetDefIdleMotion(Jason,ruFUSION_MIME_IDLE_COMBAT_2H)
	sleep(10)
--�j�˧����N��{��
	CastSpell(Jason,Jill,495927)
	sleep(20)
	Say(Jill,"[SC_423462_6]")
	sleep(10)
	Say(OwnerID(),"[SC_423462_13]")
	sleep(10)
--�j�ˤ@��ko�N��
	CastSpell(Jason,Jill,495928)

	SetModeEx(Jason,EM_SetModeType_Fight,true) 
	SetModeEx(Jason,EM_SetModeType_Searchenemy,true) 

	SetModeEx(Jill,EM_SetModeType_Fight,false) 
	SetModeEx(Jill,EM_SetModeType_Searchenemy,false) 
	sleep(20)
	Say(OwnerID(),"[SC_423462_7]")
	Say(Lobo,"[SC_423462_8]")
	AdjustFaceDir(Lobo,Jill,0)
--����J�z���ܨ�
	CastSpell(OwnerID(),OwnerID(),495929)
	sleep(10)
--�W���sbuff
	AddBuff(OwnerID(),507232,1,-1)
	CancelBuff(OwnerID(),507234)
	AddBuff(OwnerID(),507235,1000,-1)
	sleep(10)
--����J�ľW�j��
	Say(OwnerID(),"[SC_423462_14]")
	SysCastSpellLv(OwnerID(),OwnerID(),494389,30)
	if	CastSpellLV(OwnerID(),Jason,495934,200)==false	then
		SysCastSpellLv(OwnerID(),Jason,495934,200)
		SysCastSpellLv(OwnerID(),Jason,495933,200)
	end
	local z=0
	while z==0 do
		sleep(10)
--�P�_�p�L
		for i=1,table.getn(Mob),1 do
			if	CheckID(Mob[i])	then
				if	ReadRoleValue(Mob[i],EM_RoleValue_IsDead)==0	then
					break
				end
			end
			if	i==table.getn(Mob)	then
				z=1
			end
		end
--�P�_����
		if	z==1	then
			if	CheckID(Boss)		then
				if	ReadRoleValue(Boss,EM_RoleValue_IsDead)==0	then
					z=0
				end
			end
		end
--�P�_�j��
		if	z==1	then
			if	CheckID(Jason)	then
				if	ReadRoleValue(Jason,EM_RoleValue_IsDead)==0	then
					z=0
				end
			end
		end
	end
	sleep(30)
--���ʦ�m
	DW_MoveToFlag( OwnerID() , 780082 , 10 ,0  )
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_STAND)
	AdjustFaceDir(OwnerID(),Jill,0)
	AdjustFaceDir(Lobo,Jill,0)
	sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(15)
	Say(OwnerID(),"[SC_423462_9]")
	sleep(20)
	Say(OwnerID(),"[SC_423462_10]")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(10)
	SetDefIdleMotion(Lobo,ruFUSION_MIME_RUN_FORWARD)
	MoveDirect( Lobo, 5213 , 75 , 37230 )
	sleep(20)
	DelObj(Lobo)
	Say(OwnerID(),"[SC_423462_15]")
	sleep(20)
--���ȧ��� 250�H�� 
	local Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player),1 do
		if	CheckAcceptQuest(Player[i],423462)	and
			CheckFlag(Player[i],544300)==false	then
			SetFlag(Player[i],544300,1)
		end
	end
--�M�����m
	DelObj(Jill)
	DelObj(Boss)
	Hide(OwnerID())
	for i=1,table.getn(Mob),1 do
		DelObj(Mob[i])
	end
	CancelBuff(OwnerID(),507232)
	sleep(5)
	DelFromPartition(OwnerID())
	ReSetNPCInfo( OwnerID())
	sleep(20)
	AddToPartition(OwnerID(),0)
end

--�ؼм��{��
function LuaS_423462_3()
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_DODGE)
end
--�ؼм����`
function LuaS_423462_4()
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_DYING)
	SetDefIdleMotion(TargetID(),ruFUSION_MIME_DEATH_LOOP)
end
------------------------------------------------------
--�X�ͼ@��
------------------------------------------------------
function LuaS_423462_5()
	sleep(5)
	MoveToFlagEnabled(OwnerID(), true)
	CancelBuff(OwnerID(),507232)
	SetPlot(OwnerID(),"range","LuaS_423460_1",130)
end


------------------------------------------------------
--�ҧB���\��ܼ@��
------------------------------------------------------

function LuaS_423462_6()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_423367_0]","LuaS_423462_7", 0 )
end

function LuaS_423462_7()
	SetFlag(OwnerID(),542318,1)
	ChangeZone(OwnerID(),17,0,5834,785,32839,56)
end


------------------------------------------------------
--�h��w���j�q
------------------------------------------------------
function LuaS_115976_0()
	if	CheckCompleteQuest(OwnerID(),423462)==true	then
		SetSpeakDetail( OwnerID(),"[SC_115976_00]")
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_01]","LuaS_115976_1", 0 )
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_115976_1()
	SetSpeakDetail( OwnerID(),"[SC_115976_02]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_03]","LuaS_115976_2", 0 )
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_04]","LuaS_115976_3", 0 )
end

function LuaS_115976_2()
	SetSpeakDetail( OwnerID(),"[SC_115976_05]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_07]","LuaS_115976_4", 0 )
end

function LuaS_115976_3()
	SetSpeakDetail( OwnerID(),"[SC_115976_06]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_08]","LuaS_115976_5", 0 )
end

function LuaS_115976_4()
	SetSpeakDetail( OwnerID(),"[SC_115976_09]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_11]","LuaS_115976_6", 0 )
end

function LuaS_115976_5()
	SetSpeakDetail( OwnerID(),"[SC_115976_10]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115976_12]","LuaS_115976_7", 0 )
end

function LuaS_115976_6()
	SetSpeakDetail( OwnerID(),"[SC_115976_13]")
end

function LuaS_115976_7()
	SetSpeakDetail( OwnerID(),"[SC_115976_14]")
end


------------------------------------------------------------------------------------------
--��O�J�K�O�ǰe
------------------------------------------------------------------------------------------
function LuaS_115741_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115741_0]","LuaS_115741_1", 0 )
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115741_2]","LuaS_115741_2", 0 )
end

function LuaS_115741_1()
	SetSpeakDetail( OwnerID(),"[SC_115741_1]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115741_2]","LuaS_115741_2", 0 )
end

function LuaS_115741_2()
	CloseSpeak(OwnerID())
	ChangeZone(OwnerID(),16,0,1425,-290,23229,203.6)
end

function LuaS_115742_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115742_0]","LuaS_115742_1", 0 )
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115742_2]","LuaS_115742_2", 0 )
end

function LuaS_115742_1()
	SetSpeakDetail( OwnerID(),"[SC_115742_1]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_115742_2]","LuaS_115742_2", 0 )
end

function LuaS_115742_2()
	CloseSpeak(OwnerID())
	ChangeZone(OwnerID(),16,0,-6038.8,-138,21658.6,26.9)
end