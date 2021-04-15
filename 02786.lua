--=======================================
--425720 雪人，謎語，暖冬樹
---------------------------------------------------------------------------
function LuaPG_Snowman_Center_01()	--中控生雪人
	local Center = OwnerID()
	local CenterX,CenterY,CenterZ,dir=DW_Location(Center)
	local RoomID = ReadRoleValue(Center, EM_RoleValue_RoomID)
	local CenterPID = ReadRoleValue(Center, EM_RoleValue_PID)
	local Group01 = 121567
	local Group02 = 121573
	local MonsterX = {}
	local MonsterZ = {}
	local SnowGroup = {}
													--第一組雪人
	if CenterPID == 1	then									--看pid值分辨是第幾組
		for i = 1,3	do
			MonsterX[i] = CenterX- 35 * math.cos(math.pi*2*(i/3))
			MonsterZ[i] = CenterZ + 35 * math.sin(math.pi*2*(i/3))
			SnowGroup[i] = CreateObj(Group01+i, MonsterX[i], CenterY, MonsterZ[i], dir*i, 1 )	--生成雪人圍成圓形
			AddToPartition(SnowGroup[i], RoomID)
			AdjustFaceDir( SnowGroup[i] , Center, 0 )
			WriteRoleValue(SnowGroup[i],EM_RoleValue_Register3, Center )			--將中控寫入雪人
		end
	elseif CenterPID == 2	then									--第二組，陣形為直線
		for k =1,3 do	
			SnowGroup[k+3] = CreateObj( Group02+(k-1), CenterX+30*k-20, CenterY, CenterZ, dir, 1 )
			AddToPartition(SnowGroup[k+3], RoomID )
			WriteRoleValue(SnowGroup[k+3],EM_RoleValue_Register3, Center)
		end			
	end
end
---------------------------------------------------------------------------
--謎語設置
function LuaPG_Snowman_Group_01()
	local Player = OwnerID()
	local Snowman = TargetID()
	local OrgID = ReadRoleValue(Snowman, EM_RoleValue_OrgID)
	local Center = ReadRoleValue(Snowman, EM_RoleValue_Register3)
	local CenterPID = ReadRoleValue(Center, EM_RoleValue_PID)
	if CheckAcceptQuest(Player, 425720)==true	then						--判斷任務
		if CenterPID==1			and						--判斷PID決定謎語:第一謎語
		CountBodyItem(Player, 242023)==0	then						--判斷小襪
			for i=1,3				do
				if OrgID == 121567+i		then
					SetSpeakDetail(Player, "[SC_SNOWMAN_GROUP01_"..(i+1).."]")
					AddSpeakOption(Player,Snowman, "[SC_SNOWMAN_GROUP01_8]", "LuaPG_Snowman_Group_02("..i..")", 0 )	--雪人的對話選項
					AddSpeakOption(Player,Snowman, "[SC_SNOWMAN_GROUP01_1]", "LuaPG_Snowman_Group_02(4)", 0 )	--hint選項
					break
				end
			end
		elseif CenterPID==1 and	CountBodyItem(Player, 242023)==1	then
			LoadQuestOption(Player)
		end

		if CenterPID==2			and						--判斷PID決定謎語:第二謎語
		CountBodyItem(Player, 242024)==0	then						--判斷鈴鐺
			for k=1,3				do
				if OrgID == 121572+k		then
					SetSpeakDetail(Player, "[SC_SNOWMAN_GROUP02_"..(k+1).."]")
					AddSpeakOption(Player,Snowman, "[SC_SNOWMAN_GROUP02_5]", "LuaPG_Snowman_Group_02("..(k+4)..")", 0 )	--雪人的對話選項
					AddSpeakOption(Player,Snowman, "[SC_SNOWMAN_GROUP01_1]", "LuaPG_Snowman_Group_02(8)", 0 )		--hint選項
					break
				end
			end
		elseif CenterPID==2 and	CountBodyItem(Player, 242024)==1	then
			LoadQuestOption(Player)
		end

		if CenterPID==0			and						--判斷PID決定謎語:第三謎語
		CountBodyItem(Player, 242025)==0	then						--判斷星星
			for j=1,2				do
				if OrgID == 121575+j		then
					SetSpeakDetail(Player, "[SC_SNOWMAN_GROUP03_2]")
					AddSpeakOption(Player,Snowman, "[SC_SNOWMAN_GROUP03_3]", "LuaPG_Snowman_Group_02("..(j+8)..")", 0 )	--雪人的對話選項
					AddSpeakOption(Player,Snowman, "[SC_SNOWMAN_GROUP01_1]", "LuaPG_Snowman_Group_02(11)", 0 )		--hint選項
					break
				end
			end			
		elseif CenterPID==0 and	CountBodyItem(Player, 242025)==1	then
			LoadQuestOption(Player)
		end
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_Snowman_Group_02(Choice)
	local Player = OwnerID()
	local Snowman = TargetID()
	local Center = ReadRoleValue(Snowman, EM_RoleValue_Register3)
	local CenterPID = ReadRoleValue(Center, EM_RoleValue_PID)
	local MonoList = {}	
	MonoList[0] = 242025
	MonoList[1] = 242023
	MonoList[2] = 242024
--	Say(Player, Choice)
	if Choice==1 or Choice==7 or Choice==9	then					--第一謎語，如果按對，給東西
		ScriptMessage( Player, Player, 1,"[SC_SNOWMAN_GROUP01_9]", "0xffffff80" )	--黃字
		GiveBodyItem(Player, MonoList[CenterPID], 1)
		if Choice==9	then
			AddBuff(Player, 623754, 1, 300)
			ScriptMessage( Player, Player, 1,"[SC_SNOWMAN_GROUP03_5]", "0xffbf0b2b" )
		end
		CallPlot(Player, "LuaPG_Snowman_Group_03", Player,Choice)

	elseif Choice==2 or Choice==3 or Choice==5 or Choice==6 or Choice==10	then	--如果按錯
		ScriptMessage( Player, Player, 1,"[SC_SNOWMAN_GROUP01_7]", "0xffffff80" )
		CallPlot(Player, "LuaPG_Snowman_Group_03", Player,Choice)

	elseif Choice==4				then					--第一謎語hint
		SetSpeakDetail(Player, "[SC_SNOWMAN_GROUP01_5]")

	elseif Choice==8	then								--第二謎語hint
		SetSpeakDetail(Player, "[SC_SNOWMAN_GROUP02_1]")
		
	elseif Choice==11	then								--第三謎語hint
		SetSpeakDetail(Player, "[SC_SNOWMAN_GROUP03_1]")
	end
end

function LuaPG_Snowman_Group_03( Player,Choice,CenterPID)
	CloseSpeak(Player)
	Sleep(25)
	AddBuff(Player, 623755, 1, 15)								--給BUFF讓玩家看不見雪人
	ScriptMessage( Player, Player, 1,"[SC_SNOWMAN_GROUP01_6]", "0xffbf0b2b" )		--紅字，雪人藏起來的提示
end
---------------------------------------------------------------------------
--星星的buff
function LuaPG_Star_Light()
	local Player = OwnerID()
	CancelBuff(Player, 623754)
end

---------------------------------------------------------------------------
--重置活動
function LuaPG_Snow_Reset()
	local Player = OwnerID()
	for i=0,2 do			--刪除物品
		DelBodyItem(Player, 242023+i, 1)
	end
	CancelBuff(Player,623754)	--刪除計時用buff
	CancelBuff(Player,623755)	--刪除看不見雪人的buff
	SetFlag(Player,547231,1)
end

---------------------------------------------------------------------------
function LuaPG_Snow_Complete()
	local Player = TargetID()
	local Lv = ReadRoleValue( Player, EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Player, EM_RoleValue_LV_SUB )
	DesignLog( Player, 121571 , "MissionComplete" )
	SetFlag(Player,547231,0)
	SetFlag( player, 547327, 1 )	--FN添加的全勤獎判斷旗標
end