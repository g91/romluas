--請改用下面新的生產工具劇情，會自動幫你長圖示喔!

function DW_LiveSkillToll_InitPlot()	--舊的
	local Obj = OwnerID()
	SetPlot(Obj,"touch","DW_LiveSkillToll_DoingPlot",40)
end

function DW_LiveSkillToll_DoingPlot()

--EM_ClientMenuType_BlackSmith		= Value; Value = Value + 1;	--開啟打鐵
--EM_ClientMenuType_Carpenter		= Value; Value = Value + 1;	--開啟木工
--EM_ClientMenuType_MakeArmor		= Value; Value = Value + 1;	--開啟製甲
--EM_ClientMenuType_Tailor		= Value; Value = Value + 1;	--開啟裁縫
--EM_ClientMenuType_Cook		= Value; Value = Value + 1;	--開啟烹飪
--EM_ClientMenuType_Alchemy		= Value; Value = Value + 1;	--開啟煉金
--EM_ClientMenuType_Mining		= Value; Value = Value + 1;	--開啟挖礦
--EM_ClientMenuType_Lumbering		= Value; Value = Value + 1;	--開啟砍材
--EM_ClientMenuType_Herblism		= Value; Value = Value + 1;	--開啟採藥
--EM_ClientMenuType_Fishing		= Value; Value = Value + 1;	--開啟釣魚
--EM_ClientMenuType_Plant		= Value; Value = Value + 1;	--開啟種植
	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)
	local LiveSkillIndex = {
					EM_RoleValue_Skill_BlackSmith,--1.打鐵
					EM_RoleValue_Skill_Carpenter ,--2.木工
					EM_RoleValue_Skill_MakeArmor ,--3.製甲
					EM_RoleValue_Skill_Tailor,    --4.裁縫
					EM_RoleValue_Skill_Cook	,     --5.烹飪
					EM_RoleValue_Skill_Alchemy    --6.鍊金
						}
	local LiveSkillType = {
					EM_ClientMenuType_BlackSmith	,--1.打鐵
					EM_ClientMenuType_Carpenter	,--2.木工
					EM_ClientMenuType_MakeArmor	,--3.製甲
					EM_ClientMenuType_Tailor	,--4.裁縫
					EM_ClientMenuType_Cook		,--5.烹飪
					EM_ClientMenuType_Alchemy        --6.鍊金
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


--2012/7/11，阿俊新增圖示BUFF，不用再額外弄圖示了。

function RW_LiveSkillToll_InitPlot()	--新的
	local Obj = OwnerID()
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID)
	local LiveSkillBuff  = {
					623294	,	--1.打鐵
					623295	,	--2.木工
					623296	,	--3.製甲
					623297	,	--4.裁縫
					623299	,	--5.烹飪
					623298	,	--6.鍊金
					}  
	for index,value in pairs(LiveSkillBuff) do
		if	PID==index	then
			AddBuff(  Obj , LiveSkillBuff[PID], 1, -1)  --打鐵
		end
	end
	SetPlot(Obj,"touch","RW_LiveSkillToll_DoingPlot",40)
end

function RW_LiveSkillToll_DoingPlot()

--EM_ClientMenuType_BlackSmith		= Value; Value = Value + 1;	--開啟打鐵
--EM_ClientMenuType_Carpenter		= Value; Value = Value + 1;	--開啟木工
--EM_ClientMenuType_MakeArmor		= Value; Value = Value + 1;	--開啟製甲
--EM_ClientMenuType_Tailor		= Value; Value = Value + 1;	--開啟裁縫
--EM_ClientMenuType_Cook		= Value; Value = Value + 1;	--開啟烹飪
--EM_ClientMenuType_Alchemy		= Value; Value = Value + 1;	--開啟煉金
--EM_ClientMenuType_Mining		= Value; Value = Value + 1;	--開啟挖礦
--EM_ClientMenuType_Lumbering		= Value; Value = Value + 1;	--開啟砍材
--EM_ClientMenuType_Herblism		= Value; Value = Value + 1;	--開啟採藥
--EM_ClientMenuType_Fishing		= Value; Value = Value + 1;	--開啟釣魚
--EM_ClientMenuType_Plant		= Value; Value = Value + 1;	--開啟種植
	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)
	local LiveSkillIndex = {
					EM_RoleValue_Skill_BlackSmith,--1.打鐵
					EM_RoleValue_Skill_Carpenter ,--2.木工
					EM_RoleValue_Skill_MakeArmor ,--3.製甲
					EM_RoleValue_Skill_Tailor,    --4.裁縫
					EM_RoleValue_Skill_Cook	,     --5.烹飪
					EM_RoleValue_Skill_Alchemy    --6.鍊金
						}
	local LiveSkillType = {
					EM_ClientMenuType_BlackSmith	,--1.打鐵
					EM_ClientMenuType_Carpenter	,--2.木工
					EM_ClientMenuType_MakeArmor	,--3.製甲
					EM_ClientMenuType_Tailor	,--4.裁縫
					EM_ClientMenuType_Cook		,--5.烹飪
					EM_ClientMenuType_Alchemy        --6.鍊金
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