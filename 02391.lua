--�Ч�ΤU���s���Ͳ��u��@���A�|�۰����A���ϥܳ�!

function DW_LiveSkillToll_InitPlot()	--�ª�
	local Obj = OwnerID()
	SetPlot(Obj,"touch","DW_LiveSkillToll_DoingPlot",40)
end

function DW_LiveSkillToll_DoingPlot()

--EM_ClientMenuType_BlackSmith		= Value; Value = Value + 1;	--�}�ҥ��K
--EM_ClientMenuType_Carpenter		= Value; Value = Value + 1;	--�}�Ҥ�u
--EM_ClientMenuType_MakeArmor		= Value; Value = Value + 1;	--�}�һs��
--EM_ClientMenuType_Tailor		= Value; Value = Value + 1;	--�}�ҵ��_
--EM_ClientMenuType_Cook		= Value; Value = Value + 1;	--�}�Ҳi��
--EM_ClientMenuType_Alchemy		= Value; Value = Value + 1;	--�}�ҷҪ�
--EM_ClientMenuType_Mining		= Value; Value = Value + 1;	--�}�ҫ��q
--EM_ClientMenuType_Lumbering		= Value; Value = Value + 1;	--�}�Ҭ��
--EM_ClientMenuType_Herblism		= Value; Value = Value + 1;	--�}�ұ���
--EM_ClientMenuType_Fishing		= Value; Value = Value + 1;	--�}�ҳ���
--EM_ClientMenuType_Plant		= Value; Value = Value + 1;	--�}�Һش�
	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)
	local LiveSkillIndex = {
					EM_RoleValue_Skill_BlackSmith,--1.���K
					EM_RoleValue_Skill_Carpenter ,--2.��u
					EM_RoleValue_Skill_MakeArmor ,--3.�s��
					EM_RoleValue_Skill_Tailor,    --4.���_
					EM_RoleValue_Skill_Cook	,     --5.�i��
					EM_RoleValue_Skill_Alchemy    --6.���
						}
	local LiveSkillType = {
					EM_ClientMenuType_BlackSmith	,--1.���K
					EM_ClientMenuType_Carpenter	,--2.��u
					EM_ClientMenuType_MakeArmor	,--3.�s��
					EM_ClientMenuType_Tailor	,--4.���_
					EM_ClientMenuType_Cook		,--5.�i��
					EM_ClientMenuType_Alchemy        --6.���
									}
	for index,value in pairs(LiveSkillType) do
		if	PID==index	then
			if	ReadRoleValue(Obj,LiveSkillIndex[PID])>0	then
				DeBugMSG(0,0,"index="..index)
				DeBugMSG(0,0,"value="..value)
				OpenClientMenu( OwnerID() , value )
			else
				ScriptMessage( Obj, Obj, 1, "[SYS_GAMEMSGEVENT_422]", 0 )
			end
			break
		end
	end
end


--2012/7/11�A���T�s�W�ϥ�BUFF�A���ΦA�B�~�˹ϥܤF�C

function RW_LiveSkillToll_InitPlot()	--�s��
	local Obj = OwnerID()
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID)
	local LiveSkillBuff  = {
					623294	,	--1.���K
					623295	,	--2.��u
					623296	,	--3.�s��
					623297	,	--4.���_
					623299	,	--5.�i��
					623298	,	--6.���
					}  
	for index,value in pairs(LiveSkillBuff) do
		if	PID==index	then
			AddBuff(  Obj , LiveSkillBuff[PID], 1, -1)  --���K
		end
	end
	SetPlot(Obj,"touch","RW_LiveSkillToll_DoingPlot",40)
end

function RW_LiveSkillToll_DoingPlot()

--EM_ClientMenuType_BlackSmith		= Value; Value = Value + 1;	--�}�ҥ��K
--EM_ClientMenuType_Carpenter		= Value; Value = Value + 1;	--�}�Ҥ�u
--EM_ClientMenuType_MakeArmor		= Value; Value = Value + 1;	--�}�һs��
--EM_ClientMenuType_Tailor		= Value; Value = Value + 1;	--�}�ҵ��_
--EM_ClientMenuType_Cook		= Value; Value = Value + 1;	--�}�Ҳi��
--EM_ClientMenuType_Alchemy		= Value; Value = Value + 1;	--�}�ҷҪ�
--EM_ClientMenuType_Mining		= Value; Value = Value + 1;	--�}�ҫ��q
--EM_ClientMenuType_Lumbering		= Value; Value = Value + 1;	--�}�Ҭ��
--EM_ClientMenuType_Herblism		= Value; Value = Value + 1;	--�}�ұ���
--EM_ClientMenuType_Fishing		= Value; Value = Value + 1;	--�}�ҳ���
--EM_ClientMenuType_Plant		= Value; Value = Value + 1;	--�}�Һش�
	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)
	local LiveSkillIndex = {
					EM_RoleValue_Skill_BlackSmith,--1.���K
					EM_RoleValue_Skill_Carpenter ,--2.��u
					EM_RoleValue_Skill_MakeArmor ,--3.�s��
					EM_RoleValue_Skill_Tailor,    --4.���_
					EM_RoleValue_Skill_Cook	,     --5.�i��
					EM_RoleValue_Skill_Alchemy    --6.���
						}
	local LiveSkillType = {
					EM_ClientMenuType_BlackSmith	,--1.���K
					EM_ClientMenuType_Carpenter	,--2.��u
					EM_ClientMenuType_MakeArmor	,--3.�s��
					EM_ClientMenuType_Tailor	,--4.���_
					EM_ClientMenuType_Cook		,--5.�i��
					EM_ClientMenuType_Alchemy        --6.���
									}
	for index,value in pairs(LiveSkillType) do
		if	PID==index	then
			if	ReadRoleValue(Obj,LiveSkillIndex[PID])>0	then
				DeBugMSG(0,0,"index="..index)
				DeBugMSG(0,0,"value="..value)
				OpenClientMenu( OwnerID() , value )
			else
				ScriptMessage( Obj, Obj, 1, "[SYS_GAMEMSGEVENT_422]", 0 )
			end
			break
		end
	end
end