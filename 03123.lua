--z29支線=======================================
--=======================================
--426787 食人植物的施肥者
--=======================================
function LuaPG_426787_Click_Before()
	local Player = OwnerID()
	local NPC = TargetID()
	if CountBodyItem(Player, 243135)==0	then
		ScriptMessage( Player, Player, 1, "[SC_Z29Q426787_1]", C_Red )
		ScriptMessage( Player, Player, 0, "[SC_Z29Q426787_1]", C_Red )		
		return false
	end
		return true
end

function LuaPG_426787_Click_After()
	local Player = OwnerID()
	DelBodyItem(Player, 243135, 1)
	DW_QietKillOne(Player,108570)			 --靜靜的殺死怪，前者殺死後者，0代表為玩家
	return 1	
end

function LuaPG_123388_Talk()
	local Player = OwnerID()
	local NPC = TargetID()

	if DW_CheckQuestAccept("or",Player,426787,426929,426941)==true		and
	CountBodyItem(Player, 243135)==0						then
		LoadQuestOption(Player)
		AddSpeakOption(Player,NPC, "[SC_Z29Q426787_2]", "LuaPG_123388_Retake", 0 )
	elseif DW_CheckQuestAccept("or",Player,426788)==true			and
	CheckFlag(Player, 548831)==false						then
		SetSpeakDetail(Player, "[SC_Z29Q426788_1]")
		AddSpeakOption(Player,NPC, "[SC_Z29Q426788_2]", "LuaPG_426788_Talk(1)", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_123388_Retake()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 243135, 10)
end


--=======================================
--426790 格達多羅的信使
--=======================================
function LuaPG_426789_Complete()
	local Player = TargetID()
	SetFlag(Player, 548839, 1)
	SetFlag(Player, 548841, 1)
end


--=======================================
--426788 刺棘血藤
--=======================================
function LuaPG_426788_Talk(Option)
	local Player = OwnerID()
	local NPC = TargetID()
	if Option==1	then
		SetSpeakDetail(Player, "[SC_Z29Q426788_3]")
		AddSpeakOption(Player,NPC, "[SC_Z29Q426788_4]", "LuaPG_426788_Talk(2)", 0 )		
	elseif Option==2	then
		SetSpeakDetail(Player, "[SC_Z29Q426788_5]")
		SetFlag(Player, 548831, 1)			
	end
end


--=======================================
--426790 格達多羅的信使
--=======================================
--盧克會出現在3個地方，利用中控讀取不同的時間和PID值去生出
function LuaPG_426790_CreateALuke()
	local Center = OwnerID()
	local Time = GetSystime(2)						--抓取現在時間（時）
	local RoomID = ReadRoleValue( Center, EM_RoleValue_RoomID )
	local CenterPID = ReadRoleValue( Center , EM_RoleValue_PID )
	local Num = ReadRoleValue(Center, EM_RoleValue_Register2)		--現在有沒有盧克的值，no2
	local Luke
	local x,y,z,dir=DW_Location(Center)
	local TimeList = {}
--	TimeList[1] = {0,8}
--	TimeList[2] = {8,16}
--	TimeList[3] = {16,23}

	TimeList[1] = {10,20}
	TimeList[2] = {20,30}
	TimeList[3] = {0,10}

	if Time>=TimeList[CenterPID][1] and Time<TimeList[CenterPID][2]	then
		if Num==0				then
			Luke = CreateObj(123393, x, y, z , dir, 1 )
			AddToPartition( Luke,  RoomID)
			WriteRoleValue(Center, EM_RoleValue_Register1, Luke)	--把盧克記在中控上，no1
			WriteRoleValue(Luke, EM_RoleValue_Register1, Center)	--把中控記在盧克上，no1
			WriteRoleValue(Center, EM_RoleValue_Register2, 1)
			--Sleep(36000)							--1小時檢查一次
			Sleep(600)
			BeginPlot( Center, "LuaPG_426790_CreateALuke_02" , 0 )
		end
	end

	if  CenterPID<3	then
		if (Time>=TimeList[CenterPID][2] or Time<TimeList[CenterPID][1])
		 and Num>0							then
			Luke = ReadRoleValue(Center, EM_RoleValue_Register1)
			DelObj(Luke)
			--Sleep(36000)							--1小時檢查一次
			Sleep(600)
			WriteRoleValue(Center, EM_RoleValue_Register2, 0)		--歸零
			BeginPlot( Center, "LuaPG_426790_CreateALuke_02" , 0 )
		end
	end

	if CenterPID==3	then
		if Time<10 and Time>=0 and Num>0				then
		--if Time<16 and Time>=0 and Num>0				then
			Luke = ReadRoleValue(Center, EM_RoleValue_Register1)
			DelObj(Luke)
			--Sleep(36000)							--1小時檢查一次
			Sleep(600)
			WriteRoleValue(Center, EM_RoleValue_Register2, 0)		--歸零
			BeginPlot( Center, "LuaPG_426790_CreateALuke_02" , 0 )
		end
	end
end

function LuaPG_426790_CreateALuke_02()
	BeginPlot( OwnerID(), "LuaPG_426790_CreateALuke" , 0 )
end

function LuaPG_426790_Talk()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426790,426931,426943)==true		and
	CheckFlag(Player, 548832)==false						then
		AddSpeakOption(Player,NPC, "[SC_Z29Q426790_1]", "LuaPG_426790_Talk_02", 0 )
	end
end

function LuaPG_426790_Talk_02()
	local Player = OwnerID()
	CloseSpeak(Player)
	SetFlag(Player, 548832, 1)
end


--=======================================
--426905 墜船與基德傳說
--=======================================
function LuaPG_426905_Talk()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426905)==true		and
	CheckFlag(Player, 548835)==false				and
	NPCOrgID == 123398					then
		AddSpeakOption(Player,NPC, "[SC_Z29Q426905_AN_1]", "LuaPG_426905_Talk_02(1)", 0 )

	elseif DW_CheckQuestAccept("or",Player,426906)==true	and
	CheckFlag(Player, 548836)==false				and
	NPCOrgID == 123402					then
		AddSpeakOption(Player,NPC, "[SC_Z29Q426906_1]", "LuaPG_426905_Talk_02(4)", 0 )
	end
end

function LuaPG_426905_Talk_02(Option)
	local Player = OwnerID()
	local NPC = TargetID()

	if Option==1		then
		SetSpeakDetail(Player, "[SC_Z29Q426905_1]")
		AddSpeakOption(Player,NPC, "[SC_Z29Q426905_AN_2]", "LuaPG_426905_Talk_02(2)", 0 )		
	elseif Option==2	then
		SetSpeakDetail(Player, "[SC_Z29Q426905_2]")
		AddSpeakOption(Player,NPC, "[SC_Z29Q426905_AN_3]", "LuaPG_426905_Talk_02(3)", 0 )
	elseif Option==3	then
		SetSpeakDetail(Player, "[SC_Z29Q426905_3]")
		SetFlag(Player, 548835, 1)			
	elseif Option==4	then
		CloseSpeak(Player)
		SetFlag(Player, 548836, 1)
	end
end


--=======================================
--426908 患難之交
--=======================================
--===============完成任務後的表演
--CliBuff:624532
--WalkFlag:781337 no.50~53
function LuaPG_426908_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 625142
	local WalkFlag = 781337
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----如果暫存值為0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		AddBuff( Player,CliBuff,0, 10)
		local Naive = CreateObjByFlag( 123408, WalkFlag, 50, 1)			----生成演戲Naive
		local Barki = CreateObjByFlag( 123409, WalkFlag, 51, 1)			----生成演戲Barki
		ks_ActSetMode( Naive)
		ks_ActSetMode( Barki)
		NPCSAY(Naive,"[SC_Z29Q426908_1]")
		WriteRoleValue(Naive, EM_RoleValue_IsWalk , 0 )
		WriteRoleValue(Barki, EM_RoleValue_IsWalk , 0 )
		DW_MoveDirectToFlag(Naive , WalkFlag, 53, 0, 1)
		DW_MoveToFlag( Barki, WalkFlag, 52, 0, 1)
		DelObj(Naive)
		DelObj(Barki)
		CancelBuff(Player, CliBuff)
		WriteRoleValue(NPC, EM_RoleValue_Register1,0)
	end	
end


--=======================================
--426667 當個好巫醫
--=======================================
function LuaPG_426667_ClickBefore()
	local Player = OwnerID()
	local Plant = TargetID()
--	Say(Plant, "OHYA")
	if CountBodyItem(Player, 243146)<5	then
		return true
	else
		ScriptMessage( Player, Player, 1,"[SC_Z29Q426667_1]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z29Q426667_1]", 0 )
		return false
	end
end

function LuaPG_426667_ClickAfter()
	local Player = OwnerID()
	local Plant = TargetID()
	local Num = DW_Rand(20)
--	Say(Plant, Num)
	if Num<=8	then
		GiveBodyItem(Player, 243146,1)
	else
		ScriptMessage( Player, Player, 1,"[SC_Z29Q426667_2]", 0 )
		ScriptMessage( Player, Player, 0,"[SC_Z29Q426667_2]", 0 )
	end
	return 1
end


--=======================================
--426792 武藝指導
--=======================================
function LuaPG_426792_LetsFight()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local NPCList = {}
	NPCList[123386]=548833
	NPCList[123387]=548834
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426792,426933,426945)==true		and
	CheckFlag(Player, NPCList[NPCOrgID])==false 				then
		AddSpeakOption(Player, NPC, "[SC_Z29Q426792_1]", "LuaPG_426792_LetsFight_01", 0)
	end
end

function LuaPG_426792_LetsFight_01()
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak(Player)
	if ReadRoleValue( NPC,EM_RoleValue_Register1 ) ==0 then	--判斷有沒有在戰鬥中的值，no.1
		WriteRoleValue( NPC,EM_RoleValue_Register1,1 )
		CallPlot(NPC,"LuaPG_426792_LetsFight_02",Player,NPC)		
	end
end

--對話後攻擊
function LuaPG_426792_LetsFight_02( Player,NPC )
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local RoomID =ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local NPCList = {}
	NPCList[123386]=108650
	NPCList[123387]=108651
	local x,y,z,dir = DW_Location( NPC )
	local Monster = CreateObj( NPCList[NPCOrgID],x,y,z,dir,1 )
--		SetRoleCampID( Obj,3 )
		WriteRoleValue( Monster,EM_RoleValue_Register2,NPC)		--把中控寫在怪上，no.2
--		SetPlot( Obj,"dead","LuaPG_426792_Dead",0 )
		hide( NPC)
		AddToPartition( Monster,RoomID)
		SetAttack( Monster,Player )
end

--死亡觸發
function LuaPG_426792_Dead()
	local Monster = OwnerID()
	local PlayerTeam = HateListCount( Monster )
	local NPC = ReadRoleValue( Monster,EM_RoleValue_Register2 )
	WriteRoleValue( Monster,EM_RoleValue_Register1,1)
	local tmpID={}
		for i = 0 , PlayerTeam-1, 1 do
			local ID = HateListInfo( Monster ,i , EM_HateListInfoType_GItemID )
			table.insert(tmpID,ID)
		end
	if ReadRoleValue( Monster,EM_RoleValue_Register1)==1 then
		SetFightMode( Monster,0,0,0,0 )
		CallPlot( NPC,"LuaPG_426792_FightOver",tmpID,Monster,NPC)
	end
	return false
end

function LuaPG_426792_FightOver(tmpID,Monster,NPC)
	Sleep(25)
	Say(Monster, "[SC_Z29Q426792_2]")
	Sleep(20)
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local NPCList = {}
	NPCList[123386]=548833
	NPCList[123387]=548834
	for i=1,#tmpID do
		SetFlag(tmpID[i],NPCList[NPCOrgID],1)
	end
	DelObj(Monster)
	WriteRoleValue(NPC, EM_RoleValue_Register1, 0)
	Show(NPC,0)
end

function LuaPG_426792_DeleteItself()		--怪物的產生劇情
	--Say(OwnerID(), "DeleteItself")
	local CreateMon = OwnerID()
	while 1 do
		sleep(300)
		if HateListCount(CreateMon)==0	then				--檢查仇很列表，沒有人的話
			local NPC = ReadRoleValue( CreateMon,EM_RoleValue_Register2)
			local x,y,z,dir = DW_Location( CreateMon )
			local time = Move( NPC,x,y,z )
			Sleep( time*10 )
			WriteRoleValue( NPC,EM_RoleValue_Register1,0 )		--中控重製
			Show ( NPC,0)
			DelObj(CreateMon)						--刪掉自己		
			break
		end
	end
end


--=======================================
--------佈置
--=======================================
----沒解過主線的話，會被基德之子攻擊
function LuaPG_108655_GetOut()
	LuaS_PG_NowToHide()
	AddBuff( OwnerID(), 623132, 0, -1 )
	SetPlot( OwnerID(),"range","LuaPG_108654_GetOut_02",150 ) 
end

function LuaPG_108654_GetOut()
	MoveToFlagEnabled( OwnerID(), false )
	SetPlot( OwnerID(),"range","LuaPG_108654_GetOut_02",300 ) 
end

function LuaPG_108654_GetOut_02()
	local Player = OwnerID()
	local NPC = TargetID()
	local PlayerJob = ReadRoleValue( Player, EM_RoleValue_VOC)
	if PlayerJob==0		then			--排除GM
		return
	end
	if CheckCompleteQuest( Player,421653 ) ==true	then
		return
	end
	SetAttack(NPC,Player)
end

function LuaPG_bow_01()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_BOW_BEGIN,ruFUSION_ACTORSTATE_ATTACK_BOW_LOOP)
end

function LuaPG_BUFF_SP01()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
end

function LuaPG_Stop_Moveing_Z29()
	AddBuff( OwnerID(), 623132, 0, -1 )
end

--==============邊走邊說話
function LuaPG_z29_decorate_01()
--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 20
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 100  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108248,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108249,Matrix,2,1 )
	BeginPlot( ObjMatrix[1] , "LuaPG_z29_decorate_03" , 0 );	
	BeginPlot( ObjMatrix[2] , "LuaPG_z29_decorate_04" , 0 );
	WriteRoleValue(ObjMatrix[1], EM_RoleValue_Register2, ObjMatrix[2])
	WriteRoleValue(ObjMatrix[2], EM_RoleValue_Register2, ObjMatrix[1])

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaPG_z29_decorate_02" , 0 );
end

function LuaPG_z29_decorate_02()
	BeginPlot( OwnerID() , "LuaPG_z29_decorate_01" , 2 );
end

function LuaPG_z29_decorate_03()
	local NPC = OwnerID()
	local Speak={}
	local Other = ReadRoleValue(NPC,EM_RoleValue_Register2)
	local Motion
	Speak[0] = ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD -- 1/5 機率做出點頭動作
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
	Speak[4] = ruFUSION_ACTORSTATE_EMOTE_SPEAK

	while 1 do 
		local i = rand(5)
		Motion = Speak[i]
		AdjustFaceDir( NPC, Other, 0 )
		PlayMotion( NPC,Motion )
		sleep(30)
	end
end

function LuaPG_z29_decorate_04()
	local NPC = OwnerID()
	local Other = ReadRoleValue(NPC,EM_RoleValue_Register2)
	While 1  do 
		AdjustFaceDir( NPC, Other, 0 )
		PlayMotion( NPC,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(30+Rand(20))
	end
end