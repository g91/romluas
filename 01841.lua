
-------------------------------------------------------------
--�ˬd�@�� �S�������Ȫ��H���w��L
-------------------------------------------------------------
function LuaS_423257_DW_01()
	local AllPlayer = {}
	local AllPlayerAmount = 0
	local Monster = {}
	while true do
--�ˬd�Ӱϰ쪺�C�Ӫ��a
		AllPlayerAmount = SetSearchAllPlayer(0)
		for i=1,AllPlayerAmount,1 do
			AllPlayer[i] = GetSearchResult()
			if	DW_CheckMap(AllPlayer[i],825)		then
--�ˬd�X��
				if	CheckFlag(AllPlayer[i],543984)==false	and
					CheckBuff(AllPlayer[i],506708)==false	and
--�ˬd�٬���
					ReadRoleValue(AllPlayer[i],EM_RoleValue_IsDead)==0	then

--�T�w�Ǫ��ƥ��W�L�з�
					Monster = SearchRangeNPC ( AllPlayer[i] , 200 )
					if	table.getn(Monster)<12		then
						BeginPlot(AllPlayer[i],"LuaS_423257_DW_05",0)
					end
				end
			end
		end
		sleep(80)
	end
end

------------------------------------------------------------------
--�d��P�_
------------------------------------------------------------------
function LuaS_423257_DW_02()
--�إߴ���
	local Trick  = Lua_DW_CreateObj("obj",115438,OwnerID())
	DisableQuest(Trick,true)
--�d�򤺪����a�ݭnbuff
	local Player = {}
	while ReadRoleValue(OwnerID(),EM_RoleValue_PID)==1 do
		Player = SearchRangePlayer ( OwnerID() , 250 )
		for i=0,table.getn(Player)-1,1 do
			if	CheckAcceptQuest(Player[i],423257)==true	and
				CheckFlag(Player[i],544011)==false		then
				AddBuff(Player[i],506708,1,5)
			end
		end
		sleep(40)
	end
	DelObj(Trick)
	MoveToFlagEnabled(OwnerID(), true )
	DelFromPartition(OwnerID())
	ReSetNPCInfo( OwnerID() )
	AddToPartition(OwnerID(),0)
end
------------------------------------------------------------------
--npc���_�I
------------------------------------------------------------------
function LuaS_423257_DW_03()
	MoveToFlagEnabled(OwnerID(), false)
	DisableQuest(OwnerID(),false)
end


------------------------------------------------------------------
--npc�����I
------------------------------------------------------------------
function LuaS_423257_DW_04()
	LuaS_423257_7()
	local Player = {}
	Player = SearchRangePlayer ( OwnerID() , 250 )
	for i=0,table.getn(Player)-1,1 do
		if	CheckAcceptQuest(Player[i],423257)==true	and
			CheckFlag(Player[i],544011)==false		then
			SetFlag(Player[i],544011,1)
			SetFlag(Player[i],543984,1)
		end
	end
	MoveToFlagEnabled(OwnerID(), false)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
end

function LuaS_423257_DW_05()
	local Chepuray = {}
--�]4���o������
	Chepuray = Lua_Davis_BornByMultilateral( 103832 , 4 , 130 )
	for x=1,table.getn(Chepuray),1 do
--�o�������}�԰��N����
		SetPlot(Chepuray[x],"dead","LuaS_423257_DW_06",0)
		SetAttack(Chepuray[x],OwnerID())
		CallPlot(Chepuray[x],"LuaFunc_Obj_Suicide",30)
	end
end
function LuaS_423257_DW_06()
	DelObj(OwnerID())
	return false
end
------------------------------------------------------------------
--���d��@��
------------------------------------------------------------------
function LuaS_423257_DW_07()
	SetPlot(OwnerID(),"range","LuaS_423257_DW_08",100)
end

function LuaS_423257_DW_08()
	if	CheckAcceptQuest(OwnerID(),423257)==true	and
		CheckFlag(OwnerID(),544011)==false		then
		SetFlag(OwnerID(),544011,1)
		SetFlag(OwnerID(),543984,1)
	end
end
------------------------------------------------------------------
--423257	�M�ä����
------------------------------------------------------------------
function LuaS_423257_0()
	LoadQuestOption(OwnerID()) 
	if CheckAcceptQuest(OwnerID(),423257)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423257_0]","LuaS_423257_1",0)
		--�u�Чi�D�ڡA�A���|�b�o�̡H�v
	end
end

function LuaS_423257_1()
	SetSpeakDetail(OwnerID(),"[SC_423257_1]")
	--�]����P�i�D�ڡA�b�o�Ө��a�̡A���ڳ̴��D���_�áA�ҥH�ڨӤF�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423257_2]","LuaS_423257_2",0)
	--�u�A�P��P......�O�B�͡H�v
end

function LuaS_423257_2()
	SetSpeakDetail(OwnerID(),"[SC_423257_3]")
	--�ڭ̻{�ѡC
	--�A�ǳƶi���F�ܡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423257_4]","LuaS_423257_3",0)
	--�u���٬O�Q�ۤv�ոաC�v
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423257_5]","LuaS_423257_4",0)
	--�u�a�ڶi�h�a�C�v
end

function LuaS_423257_3()
	CloseSpeak(OwnerID())
end

function LuaS_423257_4()
--������
	DisableQuest(TargetID(),true)
--�t�ܶi�椤
	BeginPlot(TargetID(),"LuaS_423257_DW_02",0)
	WriteRoleValue(TargetID(),EM_RoleValue_PID,1)
--�����
	CloseSpeak(OwnerID())
--������ܲ��ʩ���
	SetDelayPatrolTime( TargetID(), 0 )
--�}�l����
	MoveToFlagEnabled(TargetID(), true)
	Say(TargetID(),"[SC_423256_0]")
end

function LuaS_423257_5()
	Say(OwnerID(),"[SC_423256_1]")
end

function LuaS_423257_6()
	Say(OwnerID(),"[SC_423256_2]")
end

function LuaS_423257_7()
	Say(OwnerID(),"[SC_423256_3]")
end