--z30支線=======================================
--=====================================
--426975 冒牌貨
--=====================================
function LuaPG_426975_LetsFight()
	local Player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local NPCList = {}
	NPCList[123472]={548853,"[SC_Z30Q426975_2]"}
	NPCList[123473]={548854,"[SC_Z30Q426975_3]"}	
	if DW_CheckQuestAccept("or",Player,426975)==true		and
	CheckFlag(Player, NPCList[NPCOrgID][1])==false 		then
		LoadQuestOption(Player)
		AddSpeakOption(Player, NPC, "[SC_Z30Q426975_1]", "LuaPG_426975_LetsFight_01", 0)
	elseif CheckFlag(Player, NPCList[NPCOrgID][1])==true		or
	CheckCompleteQuest(Player, 426975)==true			then
		SetSpeakDetail(Player, NPCList[NPCOrgID][2])
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_426975_LetsFight_01()
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak(Player)
	if ReadRoleValue( NPC,EM_RoleValue_Register1 ) ==0 then	--判斷有沒有在戰鬥中的值，no.1
		WriteRoleValue( NPC,EM_RoleValue_Register1,1 )
		CallPlot(NPC,"LuaPG_426975_LetsFight_02",Player,NPC)
	end
end

--對話後攻擊
function LuaPG_426975_LetsFight_02( Player,NPC )
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local RoomID =ReadRoleValue( NPC, EM_RoleValue_RoomID )
	local NPCList = {}
	NPCList[123472]=108670
	NPCList[123473]=108671
	local x,y,z,dir = DW_Location( NPC )
	local Monster = CreateObj( NPCList[NPCOrgID],x,y,z,dir,1 )
--		SetRoleCampID( Obj,3 )
		WriteRoleValue( Monster,EM_RoleValue_Register2,NPC)		--把中控寫在怪上，no.2
		hide( NPC)
		AddToPartition( Monster,RoomID)
		SetAttack( Monster,Player )
end

--死亡觸發
function LuaPG_426975_Dead()
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
		CallPlot( NPC,"LuaPG_426975_FightOver",tmpID,Monster,NPC)
	end
	return false
end

function LuaPG_426975_FightOver(tmpID,Monster,NPC)
	Sleep(25)
	Say(Monster, "[SC_Z30Q426975_4]")
	Sleep(20)
	Say(Monster, "[SC_Z30Q426975_5]")	
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID)
	local NPCList = {}
	NPCList[123472]=548853
	NPCList[123473]=548854
	for i=1,#tmpID do
		SetFlag(tmpID[i],NPCList[NPCOrgID],1)
	end
	DelObj(Monster)
	WriteRoleValue(NPC, EM_RoleValue_Register1, 0)
	Show(NPC,0)
end


--=====================================
--426978 正當的生活
--=====================================
function LuaPG_426978_Talk()
	local Player = OwnerID()
	local NPC = TargetID()
	local Letter = 243172
	if DW_CheckQuestAccept("or",Player,426978)==true	and
	CountBodyItem(Player, Letter)==0		 	then
		SetSpeakDetail(Player, "[SC_Z30Q426978_1]")
		AddSpeakOption(Player, NPC, "[SC_Z30Q426978_2]", "LuaPG_426978_Talk_02("..Letter.." )", 0)
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_426978_Talk_02(Letter)
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, Letter,1)
end


--=======================================
--426984 阻止卡沙
--=======================================
function LuaPG_243163_Put_Check()		--使用偵查器的檢查
	local Player = OwnerID()
	local Place = SearchRangeNPC(Player, 15)
	local Num = table.getn(Place)
	local BuffCheck=Lua_BuffPosSearch( Player ,625434)				--找玩家身上判斷BUFF的位子
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )		--確認BUFF層數	
	local Got = 0
	local PutPlace

	if DW_CheckQuestAccept("or",Player,426984)==true		and		--有接任務
	ReadRoleValue(Player, EM_RoleValue_Register3)<8		and
	Place~=nil							then
		for i =0,Num do
			PutPlace = ReadRoleValue(Place[i], EM_RoleValue_OrgID)
				if PutPlace ==123474			then		--附近有指定地點物件
					Got=Got+1
					break
				else
					ScriptMessage( Player, Player, 1,"[SC_Z26Q426265_02]", 0 )	
					ScriptMessage( Player, Player, 0,"[SC_Z26Q426265_02]", 0 )					
					return false
				end
		end
	end
	
	if Got==1	then
		DW_CancelTypeBuff(68,Player)							--取消騎乘狀態
		return true
	end
end

function LuaPG_243163_Put()			--使用後產生的效果
	local Player = OwnerID()
	local Place = LuaFunc_SearchNPCbyOrgID( Player, 123474, 50, 0 )
	local Num = ReadRoleValue(Player, EM_RoleValue_Register3)

	BeginPlot(Player,"LuaPG_426265_Act",10)						--玩家放置動作
	Num = Num+1
	WriteRoleValue(Player, EM_RoleValue_Register3, Num)
--	AddBuff(Player, 625434, 0, -1)								--堆疊計數用BUFF
	DW_QietKillOne(0,108669)								--靜靜的殺死怪，前者殺死後者，0代表為玩家
	BeginPlot(Place, "luaPG_426265_HideandShow", 0 )					-- 擺放記號HIDE，經過一定秒數出現
end

function LuaPG_426984_Retake()
	local Player = OwnerID()
	local NPC = TargetID()
	local Mono = 243163
	local Num = ReadRoleValue(Player, EM_RoleValue_Register3)
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426984)==true		and
	Num<10							and
	CountBodyItem(Player, Mono)==0				then
		AddSpeakOption(Player,NPC, "[SC_Z30Q426984_1]", "LuaPG_426984_Retake_02("..Mono..")", 0 )
	end
end

function LuaPG_426984_Retake_02(Mono)
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, Mono, 10)
end


--=====================================
--426980 牢籠之鎖
--=====================================
--===============完成任務後的表演
--CliBuff:625142
--WalkFlag:781381 no.30~33
function LuaPG_426980_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local CliBuff = 624532
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then								----如果暫存值為0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)			
		local WalkFlag = 781381
		AddBuff( Player,CliBuff,0, 10)
		local Jaeger = CreateObjByFlag( 123479, WalkFlag, 30, 1)		----生成演戲Naive
		local Barrit = CreateObjByFlag( 123484, WalkFlag, 31, 1)		----生成演戲Barki
		ks_ActSetMode( Jaeger)
		ks_ActSetMode( Barrit)
		WriteRoleValue(Jaeger, EM_RoleValue_IsWalk , 0 )
		WriteRoleValue(Barrit, EM_RoleValue_IsWalk , 0 )
		DW_MoveDirectToFlag(Jaeger , WalkFlag, 32, 0, 1)
		DW_MoveToFlag( Barrit, WalkFlag, 33, 0, 1)
		DelObj(Jaeger)
		DelObj(Barrit)
		CancelBuff(Player, CliBuff)
		WriteRoleValue(NPC, EM_RoleValue_Register1,0)
	end
end

--=====================================
--426982 不得不離去＋426979 騙子的回禮(接下任務後表演)
--=====================================
--===============完成任務後的表演
--CliBuff:509332
--WalkFlag:781381 no.34~37
function LuaPG_426982_Complete()
	local Player = TargetID()
	local NPC = OwnerID()
	local NPCOrgID = ReadRoleValue( NPC, EM_RoleValue_OrgID )
	local NPCList = {}
	NPCList[123468] = {509332,123479,34,35}		--426982
	NPCList[123483] = {623966,123482,36,37}		--426979
	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
	if Num == 0	then									----如果暫存值為0
		WriteRoleValue(NPC, EM_RoleValue_Register1,999)
		local WalkFlag = 781381		
		AddBuff( Player,NPCList[NPCOrgID][1],0, 10)
		----生成演戲Actor
		local Actor = CreateObjByFlag(NPCList[NPCOrgID][2], WalkFlag, NPCList[NPCOrgID][3], 1)
		ks_ActSetMode( Actor)
		DW_MoveToFlag( Actor, WalkFlag, NPCList[NPCOrgID][4], 0, 1)
		DelObj(Actor)
		CancelBuff(Player, NPCList[NPCOrgID][1])
		WriteRoleValue(NPC, EM_RoleValue_Register1,0)
	end
end