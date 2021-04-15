--z27支線=======================================
--=======================================
--426478 巨蜥喬揚
--=======================================
function LuaPG_426478_Check()
	local Player = OwnerID()
	if CountBodyItem(Player, 242986)>0	then
		ScriptMessage( Player, Player, 1,"[SC_Z27Q426478_01]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_Z27Q426478_01]", 0 )	
		return false
	end
	return true	
end

function LuaPG_426478_Summon()
	local Player = OwnerID()
	--加上音樂特效
	local x,y,z,dir = DW_Location(Player)
	local Lizard = CreateObj(122892, x+40, y, z+40 , dir, 1 )
	AddToPartition(Lizard, 0)
		ScriptMessage( Player, Player, 1,"[SC_Z27Q426478_02]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_Z27Q426478_02]", 0 )
	WriteRoleValue(Lizard, EM_RoleValue_Register1, Player)
end

function LuaPG_426478_Summon_Delete()
	local NPC = OwnerID()
	local Player=ReadRoleValue(NPC, EM_RoleValue_Register1)
	Sleep(150)
	if NPC~=nil	then
		local Num = ReadRoleValue(NPC, EM_RoleValue_Register2)
		if Num==0 then
			ScriptMessage( Player, Player, 1,"[SC_Z27Q426478_03]", 0 )
			ScriptMessage( Player, Player, 0,"[SC_Z27Q426478_03]", 0 )
		end
	end
	DelObj(NPC)
end

function LuaPG_426478_Click_After()
	WriteRoleValue(TargetID(), EM_RoleValue_Register2, 1)
	return 1	
end

function LuaPG_426478_Retake()
	local Player = OwnerID()
	local NPC = TargetID()	
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426478)==true		and
	CountBodyItem(Player, 242986)==0				and
	CountBodyItem(Player, 242951)==0				then
		AddSpeakOption(Player,NPC, "[SC_Z27Q426478_04]", "LuaPG_426478_Retake_02", 0 )	
	end
end

function LuaPG_426478_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242951, 1)
end


--=======================================
--426479 水源問題
--=======================================
----到範圍後才能使用的範圍劇情
function LuaPG_426479_242952_Check()
	local Player = OwnerID()
	local NPC = SearchRangeNPC ( Player , 250 )
	local NPCOrgID 
	local CheckOver = false 					 ----判斷關上
	say(Player, "00")
	if CountBodyItem(Player, 242985)>=10	then
		ScriptMessage( Player, Player, 1,"[SC_Z27Q426479_02]", 0 )	
		ScriptMessage( Player, Player, 0,"[SC_Z27Q426479_02]", 0 )	
		return false
	end
	for i=0,table.getn(NPC)-1,1 do
		NPCOrgID=ReadRoleValue(NPC[i],EM_RoleValue_OrgID)
		if NPCOrgID==122896		then		----用隱形怪122896為基準點
			CheckOver = true				----打開判斷
			say(Player, "11")
			break
		end
	end
	if CheckOver == true	then
		return true
	else
		ScriptMessage( Player, Player, 1, "[SC_Z27Q426479_01]", C_Red )
		ScriptMessage( Player, Player, 0, "[SC_Z27Q426479_01]", C_Red )
		return false
	end
end

function LuaPG_426479_242952_Use()
	local Player = OwnerID()
	say(Player, "12")
	BeginPlot(Player,"LuaPG_426265_Act",10)			--玩家放置動作
	GiveBodyItem(Player, 242985, 1)
end

function LuaPG_426479_Retake()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242952, 1)
end

--=======================================
--426480 換得符文
--=======================================
function LuaPG_426480_Exchange_Aborigine()
	local Player = OwnerID()
	local NPC = TargetID()	
	if DW_CheckQuestAccept("or",Player,426480,426485,426547)==true		and
	CountBodyItem(Player, 242953)==0						and
	CountBodyItem(Player, 242984)>0						then
		SetSpeakDetail(Player, "[SC_Z27Q426480_02]")
		AddSpeakOption(Player,NPC, "[SC_Z27Q426480_01]", "LuaPG_426480_Exchange_Aborigine_02", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_426480_Exchange_Aborigine_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	DelBodyItem(Player, 242984, 1)
	GiveBodyItem(Player, 242953, 1)
end

function LuaPG_426480_Exchange_Eric()
	local Player = OwnerID()
	local NPC = TargetID()	
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426480,426485,426547)==true		and
	CountBodyItem(Player, 242953)==0						and
	CountBodyItem(Player, 242984)==0						then
		AddSpeakOption(Player,NPC, "[SC_Z27Q426480_03]", "LuaPG_426480_Exchange_Eric_02", 0 )
--	elseif DW_CheckQuestAccept("or",Player,426479)==true	and
--	CountBodyItem(Player, 242952)==0				and	
--	CountBodyItem(Player, 242985)==0				then
--		AddSpeakOption(Player,NPC, "[SC_Z27Q426479_03]", "LuaPG_426479_Retake", 0 )
	end
end

function LuaPG_426480_Exchange_Eric_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242984, 1)
end