
------------------------------------------------------
--���������ϩR   ��ܨ��o���n�X��
----------------------------------------------------
function LuaS_422499_0()
	LoadQuestOption(OwnerID())
--�����ȴN�ݱo��
	if	CheckAcceptQuest(OwnerID(),422499)	then
		AddSpeakOption(  OwnerID(), OwnerID(), "[SC_422499_0]",  "LuaS_422499_1",  0 )
	end
end

function LuaS_422499_1()
	SetSpeakDetail( OwnerID(), "[SC_422499_1]")
--�ݰT���P�ɵ����ȺX��
	SetFlag(OwnerID(),542947,1)
end


------------------------------------------------
--�ƨg���	��ܫ�i�J�԰�
------------------------------------------------

function LuaS_422502_0() --��ܼ@��
	LoadQuestOption(OwnerID())
--�����ȴN�ݱo��
	if	CheckAcceptQuest(OwnerID(),422502)	and
		CheckFlag(OwnerID(),542948)==false	then
		AddSpeakOption(  OwnerID(), OwnerID(), "[SC_422502_0]",  "LuaS_422502_1",  0 )
	end
end

function LuaS_422502_1()
	BeginPlot(TargetID(),"LuaS_422502_2",0)
end

function LuaS_422502_2() --�������ȫ�	Ĳ�o�@��
--�������a����
	DisableQuest(OwnerID(),true)
--���å��L
	Hide(OwnerID())
--�إ߾԰��δ��� &����԰���d�s�����D &���w�ؼ� &��������
	local StandIn = Lua_DW_CreateObj("obj",102401,OwnerID())
	SetPlot(StandIn,"dead","LuaS_422502_3",0)
	Say(StandIn,"[SC_422502_1]")
	BeginPlot(StandIn,"LuaS_Discowood_CheckPeace",0)
	SetAttack(StandIn,TargetID())
--�ˬd��ɵ���
	while	CheckID(StandIn)	do
		sleep(10)
	end
--�{�X���L	&���Ҥ���
	Show(OwnerID(),0)
	DisableQuest(OwnerID(),false)
end

function LuaS_422502_3() --���`�@�� �������X��
	local Tar
	for i=0,HateListCount(OwnerID()),1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(Tar,422502)	and
			CheckFlag(Tar,542948)==false	then
			SetFlag(Tar,542948,1)
		end
	end
	DelObj(OwnerID())
	return true
end


-----------------------------------------------------------------------

-----------------------------------------------------------------------