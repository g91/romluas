function LuaP_CastBersark()
	MoveToFlagEnabled( OwnerID(), false );
	sleep( 30 )
	CastSpell( OwnerID() , OwnerID() , 491028 )
	sleep( 10 )
	MoveToFlagEnabled( OwnerID(), true );
end

function LuaI_Follow_A()
--���ܦ樫�t��
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1)
	Hide(OwnerID())
--���w���ʺX��
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1)
	BeginPlot(OwnerID(),"LuaI_Follow_A_1",0)
--����гy�}��
--���ݬ��
	sleep(20)
	Show(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	CallPlot(OwnerID(),"LuaI_Follow_A_0",780014)
end

function LuaI_Follow_B()
--���ܦ樫�t��
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1)
	Hide(OwnerID())
--���w���ʺX��
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1)
	BeginPlot(OwnerID(),"LuaI_Follow_A_1",0)
--����гy�}��
--���ݬ��
	sleep(20)
	Show(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	CallPlot(OwnerID(),"LuaI_Follow_A_0",780068)
end

function LuaI_Follow_C()
--���ܦ樫�t��
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,1)
	Hide(OwnerID())
--���w���ʺX��
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1)
	BeginPlot(OwnerID(),"LuaI_Follow_A_1",0)
--����гy�}��
--���ݬ��
	sleep(20)
	Show(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	CallPlot(OwnerID(),"LuaI_Follow_A_0",780069)
end




function LuaI_Follow_A_0(Flag)
--�ϥκX�l 780014 �s�� all
	local FlagNum
	while	true	do
		while	true	do
			FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			DW_MoveToFlag( OwnerID(), Flag , FlagNum , 10,1 )
			FlagNum = FlagNum + 1
			WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
			if	FlagNum==GetMoveFlagCount(Flag) 	then
				break
			end
		end
		while	true	do
			FlagNum = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			FlagNum = FlagNum - 1
			if	FlagNum==0	then
				break
			end
			WriteRoleValue(OwnerID(),EM_RoleValue_Register1,FlagNum)
			DW_MoveToFlag( OwnerID(), Flag , FlagNum , 10,1 )
		end
	end
end


function LuaI_Follow_A_1()
--�ŧi�Ҧ��ܼƤγ]�w��
	local dis = 8
	local count = 2 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local circle = 0  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
--��w�}�C��m
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--�]�w�Ǫ����
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100653,Matrix,1,-1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100393,Matrix,1,1)
	for i=1,table.getn(ObjMatrix),1 do
		WriteRoleValue(ObjMatrix[i],EM_RoleValue_IsWalk,1)
	end
	sleep(20)
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle )
end