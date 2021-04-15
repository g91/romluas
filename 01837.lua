function LuaS_TurnFace_DW_00(QuestID,KeyitemID,InitalScript,EndScript)
--�`�N!!!!!!!!!!!!!!!!
--��function�|�ϥΨ�npc��PID&Register
--QuestID  �O���ӥ��ȭn�Ϊ�
--KeyitemID  ����npc�n�����ӭ��n���~
--InitalScript  �}���e�i�H���Ӱʧ@�t����
--EndScript	����F�]�i�H�t���� ���y��

--����npc������
	DisableQuest(OwnerID(),true)
--�}���e���ʧ@
	if	InitalScript ~= nil	then
		BeginPlot(OwnerID(),InitalScript,0)
	end
--���}��
	DelFromPartition(OwnerID())
	SetRoleCamp(OwnerID(),"Monster")
	AddToPartition(OwnerID(),ReadRoleValue(TargetID(),EM_RoleValue_RoomID))

	WriteRoleValue(OwnerID(),EM_RoleValue_PID,QuestID)
	if	KeyitemID == nil	then
		WriteRoleValue(OwnerID(),EM_RoleValue_Register,123456)
	else
		WriteRoleValue(OwnerID(),EM_RoleValue_Register,KeyitemID)
	end
	SetPlot(OwnerID(),"dead","LuaS_TurnFace_DW_01",0)
	BeginPlot(OwnerID(),"LuaS_TurnFace_DW_02",0)
--�i�}�԰�
	SetAttack(OwnerID(),TargetID())
--���ܹC��
	SetCursorType(OwnerID(),12)
	if	EndScript~=nil	then
		while ReadRoleValue(OwnerID(),EM_RoleValue_PID)~=0	do
			sleep(2)
			if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==1	then
				return
			end
		end
		BeginPlot(OwnerID(),EndScript,0)
	end
end


function LuaS_TurnFace_DW_01()
--���������Ȫ����a��������
--�S���񪺴N����( 123456 )
	if	ReadRoleValue(OwnerID(),EM_RoleValue_Register)~=123456	then
		local Player
		for i=0,HateListCount( OwnerID())-1,1 do
			Player = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID)
			if	ReadRoleValue(Player,EM_RoleValue_IsPlayer)==1	then
				if	CheckAcceptQuest(Player,ReadRoleValue(OwnerID(),EM_RoleValue_PID) )	then
					SetFlag(TargetID(),ReadRoleValue(OwnerID(),EM_RoleValue_Register),1)
				end
			end
		end
	end
--���ͩR����
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
--��^�}��
	SetRoleCamp(OwnerID(),"Visitor")
--�Npid �� register ���m  �P�ɰ����H��
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register,0)
--�}�ҥ���
	DisableQuest(OwnerID(),false)
--���ܹC��
	SetCursorType(OwnerID(),15)
	BeginPlot(TargetID(),"LuaS_TurnFace_DW_03",0)
	return false
end

function LuaS_TurnFace_DW_02()
	sleep(20)
	local xyz = {}
	while true do
		sleep(10)
		if	HateListCount( OwnerID())==0	then
			if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)~=0	then
				DelFromPartition(OwnerID())
--��^�}��
				SetRoleCamp(OwnerID(),"Visitor")
				AddToPartition(OwnerID(),ReadRoleValue(TargetID(),EM_RoleValue_RoomID))

--�Npid �� register ���m  �P�ɰ����H��
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register,1)
--�}�ҥ���
				DisableQuest(OwnerID(),false)
--���ͩR����
				WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
--���ܹC��
				SetCursorType(OwnerID(),15)
				xyz = {ReadRoleValue(OwnerID(),EM_RoleValue_X),ReadRoleValue(OwnerID(),EM_RoleValue_Y)+2000,ReadRoleValue(OwnerID(),EM_RoleValue_Z)}
				BeginPlot(Lua_DW_CreateObj("xyz",114040,xyz,005),"LuaS_TurnFace_DW_03",0)
				return
			end
		end
	end
end


function LuaS_TurnFace_DW_03()
	DelFromPartition(TargetID())
	ReSetNPCInfo( TargetID() )
	AddToPartition(TargetID(),0)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsPlayer)==0	then
		DelObj(OwnerID())
	end
end