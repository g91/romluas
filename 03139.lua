--z32主線=======================================
--=====================================
--426201 亡國謠言
--=====================================
function LuaPG_426201_Accept()	--悄悄話
	local Player = TargetID()
	local NPC = OwnerID()
	local Soldier = LuaFunc_SearchNPCbyOrgID( NPC, 123568, 200, 0 )
	Tell(Player ,Soldier ,"[SC_Z32Q426201_1]")
end

function LuaPG_123568_Rumour()
	local Player = OwnerID()
	local Soldier = TargetID()
	if DW_CheckQuestAccept("or",Player,426201)==true		and
	CheckFlag(Player, 548973) == false				then
		SetSpeakDetail(Player, "[SC_Z32Q426201_2]")
		AddSpeakOption(Player,Soldier, "[SC_Z32Q426201_AN_1]", "LuaPG_123568_Rumour_02(1)", 0 )
	end
end

function LuaPG_123568_Rumour_02(Option)
	local Player = OwnerID()
	local Soldier = TargetID()
	if Option == 1		then
		SetSpeakDetail(Player, "[SC_Z32Q426201_3]")
		AddSpeakOption(Player,Soldier, "[SC_Z32Q426201_AN_2]", "LuaPG_123568_Rumour_02(2)", 0 )		
	elseif Option ==2	then
		SetSpeakDetail(Player, "[SC_Z32Q426201_4]")
		AddSpeakOption(Player,Soldier, "[SC_Z32Q426201_AN_3]", "LuaPG_123568_Rumour_02(3)", 0 )	
	elseif Option == 3	then
		CloseSpeak(Player)
		SetFlag(Player, 548973, 1)
		ScriptMessage(Player, Player, 2, "[SC_Z32Q426201_5]", C_SYSTEM )
		Sleep(30)
		Tell(Player ,Soldier ,"[SC_Z32Q426201_6]")
		local Num = ReadRoleValue(Soldier, EM_RoleValue_Register5)
		if Num == 0	then	--演戲
			CallPlot(Soldier, "LuaPG_123568_Run", Soldier,Num,Player)
		end
	end
end

function LuaPG_123568_Run(Soldier,Num,Player)		--演戲
			--=========演員：123586 魯莫，123587 柏得溫
			--=========buff：625142
			--=========走位：781404  no.1～4
			WriteRoleValue(Soldier, EM_RoleValue_Register5,999)
			local CliBuff = 625142
			local WalkFlag = 781404
			AddBuff(Player, CliBuff, 0, 10)
			local Soldier_Player = CreateObjByFlag( 123586, WalkFlag, 1, 1)
			ks_ActSetMode( Soldier_Player)	
			WriteRoleValue(Soldier_Player  ,EM_RoleValue_IsWalk , 0 )
			DW_MoveToFlag( Soldier_Player, WalkFlag, 2, 0, 1)
			DelObj(Soldier_Player)
			local Subcolonel = CreateObjByFlag( 123587, WalkFlag, 3, 1)
			ks_ActSetMode( Subcolonel)
			DW_MoveToFlag( Subcolonel, WalkFlag, 4, 0, 1)
			DelObj(Subcolonel)
			CancelBuff( Player, CliBuff )
			WriteRoleValue(Soldier, EM_RoleValue_Register5,0)
end


--=====================================
--426202 外來的英雄
--=====================================
function LuaPG_426202_SayHi()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local NPCList = {}
	NPCList[123569] = {548971, "[SC_Z32Q426202_1]"}
	NPCList[123570] = {548972, "[SC_Z32Q426202_2]"}
	if DW_CheckQuestAccept("or",Player,426202)==true		and
	CheckFlag(Player, NPCList[NPCOrgID][1]) == false		then
		SetSpeakDetail(Player, NPCList[NPCOrgID][2])
		SetFlag(Player, NPCList[NPCOrgID][1], 1)
	else
		LoadQuestOption(Player)
	end
end


--=====================================
--426203 暗處殺機
--=====================================
function LuaPG_426203_Annunciator()
	SetPlot( OwnerID(), "range" , "LuaPG_426203_Annunciator_02" , 60 )
end

function LuaPG_426203_Annunciator_02()
	local Player = OwnerID()
	local Board = TargetID()
	local Num = ReadRoleValue(Board, EM_RoleValue_Register2)
	if Num==0						and
	CheckFlag(Player, 548974)==false			and
	DW_CheckQuestAccept("or",Player,426203)==true	then		
		CallPlot(Board,  "LuaPG_426203_Annunciator_03", Player, Board)
	end
end

function LuaPG_426203_Annunciator_03(Player, Board)
	local Assassin = CreateObjByFlag( 108728, 781404, 5, 1)
	AddToPartition(Assassin, 0)
	WriteRoleValue(Assassin, EM_RoleValue_Register2, Board)	--把告示牌寫在怪上
	WriteRoleValue(Board, EM_RoleValue_Register2, Assassin)	--把怪寫在告示牌上
	SetAttack( Assassin,Player )
end

--死亡觸發
function LuaPG_426203_Dead()
	local Assassin = OwnerID()
	local PlayerTeam = HateListCount( Assassin )
	local Board = ReadRoleValue( Assassin,EM_RoleValue_Register2 )
	local tmpID={}
		for i = 0 , PlayerTeam-1, 1 do
			local ID = HateListInfo( Assassin ,i , EM_HateListInfoType_GItemID )
			table.insert(tmpID,ID)
		end
	for i=1,#tmpID do
		if DW_CheckQuestAccept("or",tmpID[i],426203)==true		then
			SetFlag(tmpID[i], 548974, 1)
		end
	end
	WriteRoleValue(Board, EM_RoleValue_Register2, 0)
end

function LuaPG_108728_DeleteItself()
	local Assassin = OwnerID()
	local Board = ReadRoleValue(Assassin, EM_RoleValue_Register2)
	BeginPlot( Assassin, "LuaPG_426799_HangingAround", 2)	
	while 1 do
		sleep(300)
		if HateListCount(Assassin)==0	then		--檢查仇很列表，沒有人的話
			WriteRoleValue(Board, EM_RoleValue_Register2, 0)	--寫回板子的值
			DelObj(Assassin)			--刪掉自己			
			break
		end
	end
end


--=====================================
--426320 封鎖現場
--=====================================
--===============接下任務後的表演
--buff：625142
--WalkFlag:781404
function LuaPG_426320_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local WalkFlag = 781404
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register5)
	if Num == 0	then								----如果暫存值為0
		WriteRoleValue(NPC, EM_RoleValue_Register5,999)			
		local WalkFlag = 781404
		AddBuff( Player,CliBuff,0, 10)
		local Subcolonel = CreateObjByFlag( 123587, WalkFlag, 4, 1)		----生成演戲Subcolonel
		ks_ActSetMode( Subcolonel)
		WriteRoleValue(Subcolonel, EM_RoleValue_IsWalk , 0 )
		DW_MoveToFlag( Subcolonel, WalkFlag, 2, 0, 1)
		DelObj(Subcolonel)
		CancelBuff(Player, CliBuff)
		WriteRoleValue(NPC, EM_RoleValue_Register5,0)
	end
end


--=====================================
--427094 人質與伏擊
--=====================================
function LuaPG_427094_Box()		--Box的初始劇情，裡面有個人
	local Box = OwnerID()
	WriteRoleValue(Box, EM_RoleValue_Register2, 0)
	WriteRoleValue(Box, EM_RoleValue_Register3, 0)
	PlayMotionEX( Box, ruFUSION_ACTORSTATE_ACTIVATE_END,ruFUSION_ACTORSTATE_ACTIVATE_END)
	local Num03 = ReadRoleValue(Box, EM_RoleValue_Register3)
	local Man = {123577,123578}
	local RandNum = Rand(2)+1
	local x,y,z,dir=DW_Location(Box)
	local  Hostage = CreateObj(Man[RandNum], x, y, z+5, dir, 1 )	--生成
	AddToPartition(Hostage, 0)	
	WriteRoleValue(Box, EM_RoleValue_Register2, Hostage)	--02用來紀錄人
end

--點擊後檢查牢籠的值，如果已經有人在救會有提示
function LuaPG_427094_Box_Touch()	--Box的觸碰劇情
	local Box = OwnerID()
	SetCursorType( Box , 23)					--改變點擊的圖示
	SetPlot( Box, "touch", "LuaPG_427094_Box_Touch_02", 45 )
end

function LuaPG_427094_Box_Touch_02()	--Box的觸碰劇情
	local Player = OwnerID()
	local Box = TargetID()
	local Num02 = ReadRoleValue(Box, EM_RoleValue_Register2)
	local Num03 = ReadRoleValue(Box, EM_RoleValue_Register3)
	--Say(Player,Num02)
	if DW_CheckQuestAccept("or",Player,427094,427169)==true		and	--檢查任務
	Num02>0								then	--檢查是否有人質
		if Num03==0	then					--利用03怪物的產生判斷有沒有人用
			WriteRoleValue(Box, EM_RoleValue_Register3, 1)
			BeginCastBarEvent( Player, Box ,"[SC_Z32Q427094_3]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP, 0, "LuaPG_427094_Monster_Show" )		
		else
			ScriptMessage( Player, Player, 1,"[SC_Z32Q427094_2]", 0 )
		end
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", 0 )	--條件不合
	end
end

--生出一隻怪：108734 泥鰭伏擊者
function LuaPG_427094_Monster_Show(Player, CheckStatus)
	local Box = TargetID()
	EndCastBar( Player, CheckStatus)

	if CheckStatus>0	then
		local Monster = 108734
		local x,y,z,dir=DW_Location(Box)
		ScriptMessage( Player, Player, 1,"[SC_Z32Q427094_1]", 0 )
		Sleep(20)
		local CreateMon = CreateObj(Monster, x+30, y, z+30 , dir, 1 )	--生成
		AddToPartition(CreateMon, 0)	
		WriteRoleValue(CreateMon, EM_RoleValue_Register3, Box)	--把Box寫在怪上，03
		WriteRoleValue(Box, EM_RoleValue_Register3, CreateMon)	--把怪寫在Box上，03
		SetAttack( CreateMon,Player )
	else
	WriteRoleValue(Box, EM_RoleValue_Register3, 0)
	end
end

function LuaPG_427094_DeleteItself()
	local CreateMon = OwnerID()
	BeginPlot( CreateMon, "LuaPG_426799_HangingAround", 2)
	local Box = ReadRoleValue(CreateMon, EM_RoleValue_Register3)
	while 1 do
		sleep(100)
		if HateListCount(CreateMon)==0	then		--檢查仇很列表，沒有人的話
			WriteRoleValue(CreateMon, EM_RoleValue_Register3, 0)	--寫回原值
			DelObj(CreateMon)				--刪掉自己			
			break
		end
	end
end

--死亡觸發
--FLAG:781404  no.20~40
function LuaPG_427094_Dead()
	local Monster = OwnerID()
	local PlayerTeam = HateListCount( Monster )
	local Box = ReadRoleValue( Monster,EM_RoleValue_Register3 )
	local tmpID={}
		for i = 0 , PlayerTeam-1, 1 do
			local ID = HateListInfo( Monster ,i , EM_HateListInfoType_GItemID )
			table.insert(tmpID,ID)
		end
	for i=1,#tmpID do
		if DW_CheckQuestAccept("or",tmpID[i],427094,427169)==true	then
			DW_QietKillOne(tmpID[i],108894)		 --靜靜的殺死怪，前者殺死後者，0代表為玩家
		end
	end
	CallPlot(Box,  "LuaPG_427094_Hostage_Show", Box)
end

--人質表演
function LuaPG_427094_Hostage_Show(Box)
	Sleep(20)
	local Hostage = ReadRoleValue( Box,EM_RoleValue_Register2 )
	local FlagID = 781404
	local BoxPID = ReadRoleValue(Box, EM_RoleValue_PID)		--利用PID決定跑哪隻旗標
	PlayMotionEX( Box, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
	NPCSay(Hostage, "[SC_Z32Q427094_4]")
	--WriteRoleValue(Box, EM_RoleValue_Register2, 0)
	DW_MoveDirectToFlag(Hostage, FlagID, BoxPID, 0, 1) 
	Sleep(30)
	DelObj(Hostage)
	BeginPlot( Box, "LuaPG_427094_Box", 100 )			--重新生出人質
end

--===============完成任務後的表演
--buff：625142
--WalkFlag:781404  no.41~42
function LuaPG_426320_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local WalkFlag = 781404
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register5)
	if Num == 0	then								----如果暫存值為0
		WriteRoleValue(NPC, EM_RoleValue_Register5,999)			
		local WalkFlag = 781404
		AddBuff( Player,CliBuff,0, 10)
		local Subcolonel = CreateObjByFlag( 123587, WalkFlag, 41, 1)		----生成演戲Subcolonel
		ks_ActSetMode( Subcolonel)
		WriteRoleValue(Subcolonel, EM_RoleValue_IsWalk , 0 )
		DW_MoveToFlag( Subcolonel, WalkFlag, 42, 0, 1)
		DelObj(Subcolonel)
		CancelBuff(Player, CliBuff)
		WriteRoleValue(NPC, EM_RoleValue_Register5,0)
	end
end




--=====================================
--427095 潛入濕地
--=====================================
--function LuaPG_427095_Retake()
--	local Player = OwnerID()
--	local NPC = TargetID()
--	LoadQuestOption(Player)
--	if DW_CheckQuestAccept("or",Player,427095)==true		and
--	CountBodyItem(Player, 243206)==0				then
--		AddSpeakOption(Player,NPC, "[SC_Z32Q427095_2]", "LuaPG_427095_Retake_02", 0 )
--	end
--end

function LuaPG_427095_Retake_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 243206,10)
end

--===============接下任務後的表演
--buff：624532
--WalkFlag:781404  no.42~43
function LuaPG_Leave_Accept()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 624532
	local WalkFlag = 781404
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register5)
	if Num == 0	then								--如果暫存值為0
		local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
		FlagNum = {}
			FlagNum[123580] = {42, 43}
			FlagNum[123581] = {60, 61}
			FlagNum[123572] = {62, 63}
			FlagNum[123567] = {4, 3}
		WriteRoleValue(NPC, EM_RoleValue_Register5,999)			
		local WalkFlag = 781404
		AddBuff( Player,CliBuff,0, 10)
		local Subcolonel = CreateObjByFlag( 123587, WalkFlag, FlagNum[NPCOrgID][1], 1)		----生成演戲Subcolonel
		ks_ActSetMode( Subcolonel)
		WriteRoleValue(Subcolonel, EM_RoleValue_IsWalk , 0 )
		DW_MoveToFlag( Subcolonel, WalkFlag, FlagNum[NPCOrgID][2], 0, 1)
		DelObj(Subcolonel)
		CancelBuff(Player, CliBuff)
		WriteRoleValue(NPC, EM_RoleValue_Register5,0)
	end
end

--function LuaPG_427095_Put_Check()		--使用的檢查
--	local Player = OwnerID()
--	local PutPlace
--	local Place = SearchRangeNPC(Player, 15)	
--	Say(Place, "44") 

--	if DW_CheckQuestAccept("or",Player,427095)==true		then	--有接任務
--		Say(Player, "00")
--		if Place~=nil	then
--			for i = 0,#Place do
	--			Say(Player, "11")
--				PutPlace = ReadRoleValue(Place[i], EM_RoleValue_OrgID)
--				if PutPlace==123582	then
--					DW_CancelTypeBuff(68,Player)			--取消騎乘狀態
--					return true
--				end
--			end
--		else
--			Say(Player, "22")
--			ScriptMessage( Player, Player, 1,"[SC_Z32Q427095_1]", 0 )
--			ScriptMessage( Player, Player, 0,"[SC_Z32Q427095_1]", 0 )
--			return false
--		end
--	else
--		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", 0 )	--條件不合
--	end
--end

--function LuaPG_427095_Put()			--使用後產生的效果
--	local Player = OwnerID()
--	local PutPlace = 123582
--	local Place = LuaFunc_SearchNPCbyOrgID( Player, PutPlace, 30, 0 )
--	local Num = ReadRoleValue(Player, EM_RoleValue_Register3)

--	BeginPlot(Player,"LuaPG_426265_Act",10)				--玩家放置動作
--	DW_QietKillOne(0,108891)						--靜靜的殺死怪，前者殺死後者，0代表為玩家
--	BeginPlot(Place, "luaPG_426265_HideandShow", 0 )			-- 擺放記號HIDE
--end

function LuaPG_427095_Click_Before()
	local Player = OwnerID()
	if CountBodyItem(Player, 243206)==0	then
		ScriptMessage( Player, Player, 1,"[SC_Z32Q427095_3]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z32Q427095_3]", 0 )
		return false
	end
	return true
end

function LuaPG_427095_Click_After()
	local Player = OwnerID()
	DW_QietKillOne(0,108891)				--靜靜的殺死怪，前者殺死後者，0代表為玩家
	DelBodyItem(Player, 243206, 1)
	BeginPlot(Player,"LuaPG_426265_Act",10)				--玩家放置動作
	return 1
end


--=====================================
--427099 泥地大火
--=====================================
function LuaPG_427099_Click_After()
	local Player = OwnerID()
	local NPC = TargetID()
	local Fire = 115403
	local x,y,z,dir=DW_Location(NPC)
	DW_QietKillOne(0,108893)				--靜靜的殺死怪，前者殺死後者，0代表為玩家
	local CreateFire = CreateObj(Fire, x, y, z, dir, 1 )		--生成
	AddToPartition(CreateFire, 0)
	SetModeEx(CreateFire, EM_SetModeType_Mark,FALSE)
	SetModeEx(CreateFire, EM_SetModeType_Move,FALSE)
	CallPlot(NPC, "LuaPG_427099_Delete_Fire", CreateFire)
	return 1
end

function LuaPG_427099_Delete_Fire(CreateFire)
	Sleep(60)
	DelObj(CreateFire)
end


--=====================================
--427098 水中與陸地
--=====================================
function LuaPG_427098_Click_After()
	local Player = OwnerID()
	local Seafood = TargetID()
	local BuffMan = ReadRoleValue(Seafood, EM_RoleValue_Register3)
	CallPlot(Seafood, "LuaPG_427098_HideandShow", Seafood, BuffMan)
	AddBuff(Seafood,621170,0,10)
	DW_QietKillOne(Player,108892)		 --靜靜的殺死怪，前者殺死後者，0代表為玩家
	return 1
end

function LuaPG_427098_HideandShow(Seafood, BuffMan)
	Hide(BuffMan)
	Sleep(200)
	Show(BuffMan, 0)
end