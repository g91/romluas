-------------------------------------------------------------------
--�q�D�H�⤤�m�U����		�ϥ�780089  1~3(�D�H�X�ͪ��I)
-------------------------------------------------------------------

function LuaS_422574_0() --��l�d��@��
	SetPlot(OwnerID(),"range","LuaS_422574_1",130)
--�ŧi�����ܼ�
	TotalCtrl = 0
--���������a�I��������
	local Another = Lua_DW_CreateObj("obj",113251,OwnerID())
	BeginPlot(Another,"LuaP_DW_Dead",0)
	SetPlot(Another,"touch","LuaS_422574_3",50)
--���۰O�������C��ID ���F��CLIENT�Y�����
--	WriteRoleValue(Another,EM_RoleValue_PID,OwnerID())
--	WriteRoleValue(OwnerID(),EM_RoleValue_PID,Another)
end

function LuaS_422574_1()
	if	CheckAcceptQuest( OwnerID(), 422574 )		and--��������
		CheckFlag(OwnerID(),542903)==false		then
		BeginPlot(TargetID(),"LuaS_422574_2",0)
		return true
	end
	return false
end

function LuaS_422574_2()
	local SnakeNum = 3
--�N�d��@������
	SetPlot(OwnerID(),"range","",0)
	local Snake = {}
--���X�t�@�Ӫ�ID
	local Another = ReadRoleValue(OwnerID(),EM_RoleValue_PID)

--���m�Ǫ����`�ƶq
	TotalCtrl = 0

	for i = 1,SnakeNum,1 do
--�إX�D�H
		Snake[i] = Lua_DW_CreateObj("flag",102262,780089,i)
--�����԰�
		SetFightMode ( Snake[i],0,1,0,0)
	end
--�}�l����®
	Say(Snake[1],"[SC_422574_1]")
	sleep(20)
	Say(Snake[2],"[SC_422574_2]")
	sleep(20)
	Say(Snake[3],"[SC_422574_3]")
	sleep(20)
	Say(Snake[1],"[SC_422574_4]")
--TO WAR~~~~~
	for i =1,table.getn(Snake),1	do
		SetPlot(Snake[i],"dead","LuaS_422574_6",0)--���D�H���W���`�@��
		SetFightMode ( Snake[i],1,1,0,1)--�԰����A
		SetAttack(Snake[i],TargetID())--�����ؼ�
		BeginPlot(Snake[i],"LuaS_Discowood_CheckPeace",0)--���}�԰�����
	end
--�����ˬd�T�ӳD�H�O�_����
	local Pass = 0
	while Pass == 0 do
		sleep(10)
		for i = 1,table.getn(Snake),1	do
			if	CheckID(Snake[i])	then
				break
			end
			if	i == table.getn(Snake)	then
				Pass = 1
			end
		end
	end
--�p�G�T���D�H�Q����
	if	TotalCtrl == SnakeNum	then
--�d��350���������Ȫ����a������橹�U�@�Ӷ��q�i��
		local Player = SearchRangePlayer ( OwnerID() , 350 )
		for i=0,table.getn(Player)-1 do
			if	CheckAcceptQuest( Player[i], 422574 )	then
				SetFlag(Player[i],542903,1)
			end
		end
--�� client script ���s����
--		Hide(Another)
--		Show(Another,0)
--		Hide(OwnerID())
--		Show(OwnerID(),0)
		sleep(60) --6���m�ɶ�
	end
	SetPlot(OwnerID(),"range","LuaS_422574_1",130)
end

function LuaS_422574_3() --Ĳ�I�@�������
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_422574_6]" )
	ShowBorder( OwnerID(), 0, "[SC_422574_5]" , "ScriptBorder_Texture_Paper" )

	sleep(10)
	GiveBodyItem(OwnerID(),204892,1)
	SetFlag(OwnerID(),542902,1)
--	Hide(ReadRoleValue(OwnerID(),EM_RoleValue_PID))
--	Show(ReadRoleValue(OwnerID(),EM_RoleValue_PID),0)
--	Hide(TargetID())
--	Show(TargetID(),0)
end


function LuaS_422574_6() --�D�H���`�@��
	TotalCtrl = TotalCtrl + 1
	return true
end


function LuaS_422574_7() --���ȧ�������t�@��
	DisableQuest(OwnerID(),true)
	CloseSpeak(TargetID())
--�j��
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_CRY)
	sleep(10)
	Say(OwnerID(),"[SC_422574_7]")
	sleep(20)
	Say(OwnerID(),"[SC_422574_8]")
	sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
	sleep(10)
	Say(OwnerID(),"[SC_422574_9]")
	sleep(10)
	DisableQuest(OwnerID(),false)
end



--------------------------------------------------------------------------------------------------------------------------------------
--�i��D�H��a		�ϥ�780090  1~3(�D�H�X�ͪ��I)	4 (�^�ӯ��n���I)  7 (���ͪ��з��I)
--------------------------------------------------------------------------------------------------------------------------------------

function LuaS_422578_3() -- ��ܼ@��
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID(), 422578 )	and--�������� �åB �����٨S����
		(	CheckFlag(OwnerID(),542908)==false	or	CheckFlag(OwnerID(),542909)==false	)	then
		SetSpeakDetail( OwnerID(),"[SC_422578_0]")
		AddSpeakOption( OwnerID(), OwnerID( ),"[SC_422578_1]", "LuaS_422578_4", 0)--Yes
		AddSpeakOption( OwnerID(), OwnerID( ),"[SC_422578_2]", "LuaS_422578_6", 0)--NO
	end
	if	CheckAcceptQuest(OwnerID(),422575)	and
		CheckFlag(OwnerID(),542936)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422575]","LuaS_422575_1",0)
	end
end

function LuaS_422578_4()--�Ѷ}NPC�����ʭ���
	CloseSpeak(OwnerID())
--����NPC����
	DisableQuest(TargetID(),true)
--���}���ʼ@��
	MoveToFlagEnabled( TargetID(), true )
	Say(TargetID(),"[SC_422578_3]")
	WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
	SetDelayPatrolTime( TargetID(), 0 )
end

function LuaS_422578_5()--����԰��y�{
--�����
	MoveToFlagEnabled( OwnerID(), false )
--�}����
	Say(OwnerID(),"[SC_422578_4]")
	sleep(10)
--�X�{�D�H
	local Snake = {}
	local SnakeNum = 3 --�D�H�ƶq
	for i = 1,SnakeNum,1 do
		Snake[i] = Lua_DW_CreateObj("flag",102262,780090,i)
		SetPlot(Snake[i],"dead","LuaS_422578_7",0) --���`����������
		BeginPlot(Snake[i],"LuaS_Discowood_CheckPeace",0)--���}�԰�����
	end
	sleep(10)
--�D�H�}����&�}�Ҿ԰����A
	Say(Snake[1],"[SC_422578_5]")
	SetFightMode ( OwnerID(),1,1,0,1 )
--���ۥ[���H
	for i = 1,table.getn(Snake),1	do
		SetAttack(OwnerID(),Snake[i])
		SetAttack(Snake[i],OwnerID())
	end
--�T�w�O���O�T�ӳD�H�����F
	local Pass = true
	while	Pass	do
		for i=1,table.getn(Snake),1	do
			if	CheckID(Snake[i])				and
				ReadRoleValue(Snake[i],EM_RoleValue_IsDead)==0	then
				break
			end
			if	i==table.getn(Snake)	then
				Pass = false
			end
		end
		sleep(10)
	end
	Say(OwnerID(),"[SC_422578_6]")
--���o���n��m
	while	not DW_CheckDis(OwnerID(),780090,4,20)	do
		sleep(10)
	end
--�ˬd�d�򤺪����a ���������Ȫ��X��
	local Player = SearchRangePlayer ( OwnerID() , 350 )
	for i = 0,table.getn(Player)-1,1	do
--�������� �ӥB�������D�H�����a
		if	CheckAcceptQuest( Player[i],422578)	and
			CheckFlag(Player[i],542908)		then
			SetFlag(Player[i],542909,1)
		end
	end
--���m��
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())

end

function LuaS_422578_6()
	SetSpeakDetail( OwnerID(),"[SC_422578_7]")
end

function LuaS_422578_7() --�D�H�����`�@��	�t�d�e�X�M�z�D�H�������X��
	for i = 0 ,HateListCount(OwnerID())-1,1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
--�������Ȫ����a
		if	CheckAcceptQuest( Tar,422578)	then
			SetFlag(Tar,542908,1)
		end
	end
	return true
end


function LuaS_422578_8()--NPC��l�@��	�վ��m ���԰����A
	SetPlot( OwnerID() , "dead" , "LuaS_422579_8" , 0 )
	SetFightMode ( OwnerID(),0,1,0,0 )
	LuaS_421918_2()
end

function LuaS_422578_9()--�������ȲM�����n���~
	SetFlag(OwnerID(),542908,0)
	SetFlag(OwnerID(),542909,0)
	SetFlag(OwnerID(),542910,0)
end
--------------------------------------------------------------------------------------------------------------------------------------
--�u�q		�ϥ� 780090 5(��J���X���I)  6(��N�򨥪��I) 8(���ͪ��з��I)
--------------------------------------------------------------------------------------------------------------------------------------

function LuaS_422579_0()-- ��ܼ@��
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID(), 422579 )	and--�������� �åB �����٨S����
		CheckFlag(OwnerID(),542910)==false	then
		SetSpeakDetail( OwnerID(),"[SC_422579_0]")
		AddSpeakOption( OwnerID(), OwnerID( ),"[SC_422579_1]", "LuaS_422579_2", 0)--Yes
		AddSpeakOption( OwnerID(), OwnerID( ),"[SC_422579_2]", "LuaS_422579_1", 0)--NO
	end
end

function LuaS_422579_1() -- �_�w���^��
	SetSpeakDetail( OwnerID(),"[SC_422579_3]")
end

function LuaS_422579_2() -- �Ѷ}NPC�����ʭ���
--����NPC����
	DisableQuest(TargetID(),true)
--���}���ʼ@��
	MoveToFlagEnabled( TargetID(), true )
--�������
	CloseSpeak( OwnerID() )
--�x��
	Say(TargetID(),"[SC_422579_4]")
	SetDelayPatrolTime( TargetID(), 0 )
	WriteRoleValue( TargetID() , EM_RoleValue_Register , OwnerID() )
end

function LuaS_422579_3() -- �}�l�԰�
--�������ʼ@��
	MoveToFlagEnabled( OwnerID(), false )
--�إX��J��
	local Boss = Lua_DW_CreateObj("flag",102274,780090,5)
--���t�� �]�������԰�
	SetFightMode ( Boss,0,1,0,0)
	SetFightMode ( OwnerID(),0,1,0,0 )
--�x��
	Say(Boss,"[SC_422579_5]")
	sleep(15)
	Say(Boss,"[SC_422579_6]")
	sleep(15)
	Say(Boss,"[SC_422579_7]")
	sleep(15)
--�Ѷ}����  �}��
	SetFightMode ( OwnerID(),1,1,0,1 )
	SetFightMode ( Boss,1,1,0,1)
	SetAttack(OwnerID(),Boss)
	SetAttack(Boss,OwnerID())
	BeginPlot(Boss,"LuaS_Discowood_CheckPeace",0)--���}�԰�����
--�԰������P�_
	local Tar
	while	HateListCount( OwnerID() ) > 0	do
		sleep(10)
--�ˬd��������O��J������
		for i=0,HateListCount(OwnerID()),1 do
			Tar = HateListInfo(OwnerID(),i,EM_HateListInfoType_GItemID)
			if	ReadRoleValue(Tar,EM_RoleValue_OrgID) ~= 102274	then
--�R�O��J�������� �û��X�x��
				if	CastSpellLv(Boss,Tar,492662,100)	then
					Say(Boss,"[SC_422579_8]")
				end
			end
		end
--�ˬd��J������q �P�_�O�_��F�M�Ԯɨ�
		if	ReadRoleValue(Boss,EM_RoleValue_HP)/ReadRoleValue(Boss,EM_RoleValue_MaxHP) < 0.4	and
			ReadRoleValue(Boss,EM_RoleValue_IsDead) == 0						and
			ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID ) == 0				and
			ReadRoleValue(OwnerID() , EM_RoleValue_Coldown_All ) == 0				then
--�x�� �� �P�k���
			Say(OwnerID(),"[SC_422579_9]")
			CastSpellLv(OwnerID(),Boss,493685,101)
--������z���A
			sleep(10)
			Lua_CancelAllBuff(OwnerID())
			WriteRoleValue(OwnerID(),EM_RoleValue_HP,1)
			AddBuff(OwnerID(),502707,1,-1)
		end
	end
--�ˬd�O�_����w�I 
	while ReadRoleValue(OwnerID(),EM_RoleValue_NpcOnMove)==1 do
		sleep(20);
	end
	local FlagID,FlagNum=780090,6;
	local x,y,z=GetMoveFlagValue( FlagID,FlagNum,EM_RoleValue_X),GetMoveFlagValue( FlagID,FlagNum,EM_RoleValue_Y),GetMoveFlagValue( FlagID,FlagNum,EM_RoleValue_Z);
	sleep(Move(OwnerID(),x,y,z));
	sleep(10)
	local Player = SearchRangePlayer(OwnerID(),350)
	for i=0,table.getn(Player)-1,1 do
--�������� �B�٨S���������a ���L�̧����X��
		if	CheckAcceptQuest(Player[i],422579)	then
			SetFlag(Player[i],542910,1)
		end
	end
--���m
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end

function LuaS_422579_4() --�������ȡG�̫�ԧЫ� ���檺�@��
--�����
	DisableQuest(OwnerID(),true)
--�̫᪺�x��
	Say(OwnerID(),"[SC_422579_10]")
	sleep(15)
	Say(OwnerID(),"[SC_422579_11]")
	sleep(10)
--�y��
	CastSpell(OwnerID(),OwnerID(),492667)
	sleep(10)
--�۱��˦a
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DYING)
	sleep(50)
--��X�ШϨ�A�]���X�{
	SetFlag(TargetID(),542929,1)
--�}����
	DisableQuest(OwnerID(),false)
--���m
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end



function LuaS_422579_5() -- ������� ����l�Ƽ@��
--������z���A
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,1)
	AddBuff(OwnerID(),502707,1,-1)
end

function LuaS_422579_6() --�ĤG���q��l�@��	�ե���m �����԰�
	SetPlot( OwnerID() , "dead" , "LuaS_422579_8" , 0 )
	SetFightMode ( OwnerID(),0,1,0,0 )
	LuaS_421918_2()
end

function LuaS_422579_7()
	SetFightMode ( OwnerID(),1,1,0,1 )
end

function LuaS_422579_8()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	if CheckID( Player ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_421696]" , 0 )
		ScriptMessage( Player , Player , 0 , "[SC_421696]" , 0 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register  , 0)
	return true
end