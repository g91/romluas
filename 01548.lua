
---------------------------------------------------------------
function LuaS_102499_0() --�K���s���}�μ@��
---------------------------------------------------------------
--�ŧi�Ҧ��ܼƤγ]�w��
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local circle = 0  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
--��w�}�C��m
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--�]�w�Ǫ����
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102499,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102499,Matrix,3,2)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102499,Matrix,5,-1)
	for i=1,table.getn(ObjMatrix),1 do
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
		BeginPlot(ObjMatrix[i],"LuaS_102499_2",0)
	end
	sleep(20)
	for i=1,table.getn(ObjMatrix),1 do
		SetFightMode ( ObjMatrix[i],1,1,0,1 )
	end
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
	DelObj(OwnerID())
end
---------------------------------------------------------------
function LuaS_102499_1() --�K���s�����ʼ@��
---------------------------------------------------------------
--�ϥκX�l780092 �s�� all
	local FlagNum
	while	true	do
		FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
		if	FlagNum==GetMoveFlagCount(780092) 	then
			break
		end
		DW_MoveToFlag( OwnerID(), 780092 , FlagNum , 10,1 )
	end
	DelObj(OwnerID())
end
---------------------------------------------------------------
function LuaS_102499_2() --�K���s���˴��@��
---------------------------------------------------------------
	while	CheckID(TargetID())	do
		sleep(10)
	end
	DelObj(OwnerID())
end




---------------------------------------------------------------
function LuaS_102499_3() --�D�H�B��u���K���s���B�ɺt�@��
---------------------------------------------------------------
--�ϥκX�l 780093 �s�� all
	while	true	do
		Leader = Lua_DW_CreateObj("obj",102280,OwnerID(),0)
		Lua_DW_LeaderSet(Leader)
		AddToPartition(Leader,0)
		WriteRoleValue(Leader,EM_RoleValue_IsWalk,1)
		WriteRoleValue(Leader,EM_RoleValue_Register1,1)
		Hide(Leader)
		sleep(20)
		Show(Leader,0)
		BeginPlot(Leader,"LuaS_102499_4",0)
		BeginPlot(Leader,"LuaS_102499_5",0)
		while	CheckID(Leader)	do
			sleep(10)
		end
		Sleep(600)
	end
end
---------------------------------------------------------------
function LuaS_102499_4() --�D�H�B��u���K���s���}�μ@��
---------------------------------------------------------------
--�ŧi�Ҧ��ܼƤγ]�w��
	local dis = 20
	local count = 5 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local circle = 0  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
--��w�}�C��m
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--�]�w�Ǫ����
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102499,Matrix,1,0)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102499,Matrix,3,2)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102499,Matrix,5,-1)
	for i=1,table.getn(ObjMatrix),1 do
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
		BeginPlot(ObjMatrix[i],"LuaS_102499_2",0)
	end
	sleep(20)
	for i=1,table.getn(ObjMatrix),1 do
		SetFightMode ( ObjMatrix[i],1,1,0,1 )
	end
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
	DelObj(OwnerID())
end
---------------------------------------------------------------
function LuaS_102499_5() --�D�H�B��u���K���s�����ʼ@��
---------------------------------------------------------------
--�ϥκX�l780093 �s�� all
	local FlagNum
	while	true	do
		FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
		if	FlagNum==GetMoveFlagCount(780093) 	then
			break
		end
		DW_MoveToFlag( OwnerID(), 780093 , FlagNum , 10,1 )
	end
	DelObj(OwnerID())
end

---------------------------------------------------------------
function LuaS_102545_0() --�D�H�����۸˼@���� �ɺt�@��
---------------------------------------------------------------
	local Leader
	while	true	do
--�إ߱a�Y��
--���W�a���@��
--���W���ʼ@��d
		Leader = Lua_DW_CreateObj("obj",102280,OwnerID(),0)
		Lua_DW_LeaderSet(Leader)
		AddToPartition(Leader,0)
		BeginPlot(Leader,"LuaS_102545_1",0)
		sleep(20)
		BeginPlot(Leader,"LuaS_102545_2",0)
--�ˬd�O�_�n���s�}�l�t��
		while CheckID(Leader) do
			sleep(10)
		end
--�إ߲ĤG�q�@�����a�Y��
--���ܲ��ʪ��A:��
		Leader = Lua_DW_CreateObj("flag",102280,780092,1,0)
		Lua_DW_LeaderSet(Leader)
		AddToPartition(Leader,0)
		WriteRoleValue(Leader,EM_RoleValue_IsWalk,1)
		WriteRoleValue(Leader,EM_RoleValue_Register1,1)
		Hide(Leader)
		sleep(20)
		Show(Leader,0)
		BeginPlot(Leader,"LuaS_102499_0",0)
		BeginPlot(Leader,"LuaS_102499_1",0)
		while	CheckID(Leader)	do
			sleep(10)
		end
	end
end


---------------------------------------------------------------
function LuaS_102545_1() --�}�μ@��
---------------------------------------------------------------
--�ŧi�Ҧ��ܼƤγ]�w��
	local dis = 15
	local count = 4 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local circle = 0  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
--��w�}�C��m
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--�]�w�Ǫ����
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,0)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,-1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,0)
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,1)
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(102545,Matrix,2,-2)
	for i=1,10,1 do
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	for i=1,10,1 do
		SetFightMode ( ObjMatrix[i],1,1,0,1 )
	end
--�j��R�O�Ǫ����H
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
end

---------------------------------------------------------------
function LuaS_102545_2() --���ʼ@������t�@�������ʼ@������t�@��
---------------------------------------------------------------
	local	StopPoint = 6 --���U�۸˪��I(�h1)
	local	FlagNum
	local 	ShowEnd = 1
	local	Team = {}
--�ϥκX�l 780090 �s�� all

--���x���Ҧ�������ID
	local	NPC = SearchRangeNPC ( OwnerID() , 100 )
	for i = 0,table.getn(NPC),1	do
		if	ReadRoleValue(NPC[i],EM_RoleValue_IsAttackMode)==0	and
			(ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==102544 or ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==102545)	then
			Team[table.getn(Team)+1] = NPC[i]
		end
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1)
	sleep(20)
--���ʼ@��(�Ĥ@�q)
	while	true	do
		FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
		if	FlagNum == StopPoint	then
			break
		end
		DW_MoveToFlag( OwnerID(), 780090 , FlagNum , 10,1 )
	end
	sleep(50)
--��t�@���G�۸�(�Ĥ@�q)
--�R���즳���D�H���s�ɺ�
	for i=1,table.getn(Team),1 do
		if	CheckID(Team[i])	then
			DelObj(Team[i])
		end
	end
	local dis = 15
	local count = 4 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local circle = 0  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	Team[1] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,-1)
	Team[2] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,0)
	Team[3] = LuaFunc_CreateNPCByMatrix(102544,Matrix,1,1)
	Team[4] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,-1)
	Team[5] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,0)
	Team[6] = LuaFunc_CreateNPCByMatrix(102544,Matrix,2,1)
	Team[7] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,-1)
	Team[8] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,0)
	Team[9] = LuaFunc_CreateNPCByMatrix(102544,Matrix,3,1)
	Team[10] = LuaFunc_CreateNPCByMatrix(102545,Matrix,2,-2)
--�ܫ��w��m�۸�
	for i=1,9,1 do
		WriteRoleValue(Team[i],EM_RoleValue_IsWalk,0)
		Hide(Team[i])
		CallPlot(Team[i],"LuaS_102545_3",i)
	end
	Say(Team[10],"[SC_102545_0]")
	for i=1,10,1 do
		sleep(10)
	end
	Say(Team[10],"[SC_102545_1]")
--���ݨ�Ҧ��D�H���٦ۤv�ǳƦn
	while	true	do
		sleep(25)
		while	ShowEnd<10 do
			if	ReadRoleValue(Team[ShowEnd],EM_RoleValue_Register1)==0	then
				ShowEnd=1
				break
			end
			ShowEnd = ShowEnd + 1
		end
		if	ShowEnd>=10	then
			break
		end
	end
	for i=1,10,1 do
		WriteRoleValue(Team[i],EM_RoleValue_IsWalk,1)
	end
	sleep(10)
	Say(Team[10],"[SC_102545_2]")
	sleep(10)
--���O���a�Y�̪�id
--�R�O�Ҧ��H�ǳƲĤG�q��t
	for i=1,table.getn(Team),1 do
		WriteRoleValue(Team[i],EM_RoleValue_Register1,OwnerID())
		BeginPlot(Team[i],"LuaS_102545_5",0)
	end
--�~��e�i
	BeginPlot(OwnerID(),"LuaS_102545_4",0)
	LuaFunc_NPCWalkByMatrix( Team , Matrix , dis , count , checktime , circle )
end


---------------------------------------------------------------
function LuaS_102545_3(Flag) --�۸˼@��
---------------------------------------------------------------
	sleep(20)
	Show(OwnerID(),0)
--�N�ƭ��k�s
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
--�ϥκX�l 780091 �s�� 1 2 3 4 5 6 7 8 9 
	local X,Y,Z
	X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
	Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	DW_MoveToFlag( OwnerID() , 780091 , Flag,0 , 1  )
	sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_INSTANT)
	sleep(15)
	sleep(5)
	AddBuff(OwnerID(),504311,1,-1)
--���ʦ^���w��m
	DW_WaitMoveTo( OwnerID() , X , Y, Z)
	DW_WaitMoveTo( OwnerID() , X-10 , Y, Z)
--�i�D���Y�̦ۤv�w�g�ǳƧ���
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1)
end

---------------------------------------------------------------
function LuaS_102545_4() --�ĤG�q�����ʼ@��
---------------------------------------------------------------
	while	true	do
		DW_MoveToFlag( OwnerID(), 780090 , ReadRoleValue(OwnerID(),EM_RoleValue_Register1) , 10 )
		FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
		if	GetMoveFlagCount(780090) == FlagNum	then
			break
		end
	end
	DelObj(OwnerID())
end

---------------------------------------------------------------
function LuaS_102545_5()--�ĤG�q����t�@��
---------------------------------------------------------------
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	while CheckID(Master)	do
		sleep(20)
	end
	if	ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)==102545		then
		Say(OwnerID(),"[SC_102545_3]")
	end
	sleep(20)
	DelObj(OwnerID())
end

---------------------------------------------------------------
function LuaS_102650_0() -- �T������D�H�J��@�� ���ɺt�@��
---------------------------------------------------------------
	local Leader
	while	true	do
		sleep(50)
--�إ߱a�Y��
		Leader = Lua_DW_CreateObj("obj",102280,OwnerID(),0)
		Lua_DW_LeaderSet(Leader)
		AddToPartition(Leader,0)
		Hide(Leader)
		WriteRoleValue(Leader,EM_RoleValue_IsWalk,1)
--�ᤩ�a�����@��
		BeginPlot(Leader,"LuaS_102650_1",0)
		sleep(20)
--�t�X���ʪ��@��
--���W���ʱ���@��
		Show(Leader,0)
		BeginPlot(Leader,"LuaS_102650_2",0)
--�ˬd�O�_�t������
--�z�Lcheckid�ӧP�_
		while	CheckID(Leader)	do
			sleep(20)
		end
	end
end

---------------------------------------------------------------
function LuaS_102650_1() -- �T������}�μ@��
---------------------------------------------------------------
--�ŧi�Ҧ��ܼƤγ]�w��
	local dis = 12
	local count = 2 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = -1  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 0  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
--��w�}�C��m
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--�]�w�Ǫ����
--�L�� ���ܨ������A
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102650,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102650,Matrix,1,1)
	for i =1,2,1 do
		DelFromPartition(ObjMatrix[i])
		SetModeEx(ObjMatrix[i],EM_SetModeType_ShowRoleHead,false) 
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
		AddToPartition(ObjMatrix[i],0)
	end
	sleep(30)
--�j��R�O�Ǫ����H
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
end


---------------------------------------------------------------
function LuaS_102650_2() -- �a���P�����t���@��
---------------------------------------------------------------
	local NPC
	local Team = {}
	local Sula = {}
--�ϥκX�l 780088 �s�� all
--�ϥκX�l 780089 �s�� 1 2 3
--�]�����H���W���}�μ@��  �ҥH�qRegister1�}�l�ϥ�
	NPC = SearchRangeNPC ( OwnerID() , 100 )
	for i = 0,table.getn(NPC),1	do
		if	ReadRoleValue(NPC[i],EM_RoleValue_IsAttackMode)==0	and
			ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==102650	then
			Team[table.getn(Team)+1] = NPC[i]
		end
	end
	while	true	do
		local FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		FlagNum = FlagNum + 1
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
--����̫�@���I�ɭ�
--���X���ʰj�� �i�J��t�Ҧ�
		if	GetMoveFlagCount(780088) == FlagNum	then
			break
		end
		DW_MoveToFlag( OwnerID(), 780088 , FlagNum , 10 , 1 )
	end
	sleep(50)
--�R���Ⱖ�D�H���s�ɺ�
	DelObj(Team[1])
	DelObj(Team[2])
--��w�}�C��m
	local dis = 12
	local count = 2 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--�]�w�Ǫ����
	Team[1] = LuaFunc_CreateNPCByMatrix(102650,Matrix,1,-1)
	Team[2] = LuaFunc_CreateNPCByMatrix(102650,Matrix,1,1)
	SetPlot(Team[1],"dead","LuaS_102650_3",0)
	SetPlot(Team[2],"dead","LuaS_102650_3",0)
	SetFightMode ( Team[1],0,1,0,0 )
	SetFightMode ( Team[2],0,1,0,0 )
	sleep(10)
--��t�Ҧ�
--��J��I�񪺪k�N
	SysCastSpellLv(Team[1],Team[1],493894,75)
	SysCastSpellLv(Team[2],Team[2],493894,75)
--���ܰʧ@
	SetDefIdleMotion(Team[1],ruFUSION_MIME_IDLE_COMBAT_1H)
	SetDefIdleMotion(Team[2],ruFUSION_MIME_IDLE_COMBAT_1H)
	sleep(10)
--���ͮI�� ��b
	Sula[1] = Lua_DW_CreateObj("flag",102547,780089,1)
	Sula[2] = Lua_DW_CreateObj("flag",102547,780089,2)
	Sula[3] = Lua_DW_CreateObj("flag",102547,780089,3)
	SysCastSpellLv(Sula[1],Team[1],493914,15)
	SysCastSpellLv(Sula[2],Team[1],493914,15)
	SysCastSpellLv(Sula[3],Team[1],493914,15)
	sleep(10)
	SetFightMode ( Team[2],1,1,0,1 )
	sleep(10)
	PlayMotion(Team[2],ruFUSION_ACTORSTATE_BUFF_INSTANT)
	Say(Team[2],"[SC_102650_0]")
	for i=1,table.getn(Sula),1 do
		SetAttack(Sula[i],Team[2])
	end
	sleep(20)
	Say(Sula[1],"[SC_102650_1]")
	while true do
		sleep(10)
		if	ReadRoleValue(Team[2],EM_RoleValue_IsDead)==1	then
			break
		end
	end
	Say(Sula[1],"[SC_102650_2]")
	sleep(10)
	for i=1,table.getn(Sula),1 do
		DelObj(Sula[i])
	end
	for i=1,table.getn(Team),1 do
		DelObj(Team[i])
	end
	DelObj(OwnerID())
end


---------------------------------------------------------------
function LuaS_102650_3() --�p?�@�� �D�H���W�����`�@��
---------------------------------------------------------------
	local temp
--�P�_���`�� �����̪��H���S��������
	for i=0,HateListCount( OwnerID()),1 do
		temp = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID)
		if	CheckAcceptQuest(temp,422672)	then
			SetFlag(temp,543348,1)
		end
	end
end


---------------------------------------------------------------
function LuaS_102523_0()--�a�����޼@��
---------------------------------------------------------------
--�ŧi�Ҧ��ܼƤγ]�w��
	local dis = 20
	local count = 4 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local circle = 180  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
--��w�}�C��m
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--�]�w�Ǫ����
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102523,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102523,Matrix,1,0)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102523,Matrix,1,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102524,Matrix,2,-1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102524,Matrix,2,0)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102524,Matrix,2,1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102523,Matrix,3,-1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(102523,Matrix,3,0)
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(102523,Matrix,3,1)
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(102525,Matrix,2,-2)
	for i=1,10,1 do
		SetFightMode ( ObjMatrix[i],0,1,0,0 )
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	for i=1,10,1 do
		SetFightMode ( ObjMatrix[i],1,1,0,1 )
	end
--�j��R�O�Ǫ����H
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end