--425101  標準流程
	
function LuaS_425101_Conversation()
	local Obj,Hoster = OwnerID(),TargetID();
	LoadQuestOption(Obj)
	if	DW_CheckQuestAccept("or",Obj,425101,425121,425141)==true	 and
		CheckFlag(Obj,545795)==false	then
		AddSpeakOption(Obj,Obj,"[SC_425101_A]","LuaS_425101_PassFunc("..Hoster..")", 0 );
	end
end

function LuaS_425101_PassFunc(Hoster)
	local PlayerID = OwnerID();
	CallPlot(PlayerID,"LuaS_425101_Gathering",Hoster);
	CloseSpeak(PlayerID);
end

function LuaS_425101_Gathering(Hoster)	--Execute at Player
	local PlayerID = OwnerID();
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[425101] = Global_DW_TempPlayerPool[425101] or {};
	Global_DW_TempPlayerPool[425101][PlayerID]=0;
	ScriptMessage( PlayerID, PlayerID, 2, "[SC_425101_B]", 0 );--Introduce rule
	ScriptMessage( PlayerID, PlayerID, 0, "[SC_425101_B]", C_YELLOW );
	--Round strat
	local StringTable = {[0]=5,"[SC_425101_C]","[SC_425101_D]","[SC_425101_E]","[SC_425101_F]","[SC_425101_G]"};
	local ItemTable = {"[240868]","[240869]","[240870]","[240871]","[240872]","[240873]","[240874]","[240875]"};
	local ItemDBIDTable = {240868,240869,240870,240871,240872,240873,240874,240875};
	local IfSuccessful = false
	for i=1,6,1 do
		IfSuccessful = false;
		local RandResult = DW_Rand(table.getn(ItemTable));
		local ThisTimeNum = ItemDBIDTable[RandResult];
		local TempItem = ItemTable[RandResult];
		local TempString = StringTable[DW_Rand(table.getn(StringTable))];
		local TempQuest = TempString.."[$SETVAR1="..TempItem.."]"
		ScriptMessage( PlayerID, PlayerID, 0, TempQuest, 0 )
		for Time=1,30,1 do
			sleep(5);
			if	CheckDistance(PlayerID,Hoster, 40)==true	then
				local TotalNum = CountBodyItem(PlayerID,ThisTimeNum);
				if	TotalNum>0	then
					DelBodyItem(PlayerID,ThisTimeNum,TotalNum);
					IfSuccessful=true;
					break
				end
			end
			if	Time==30	then	break;	end
		end
		if	(i==6 and IfSuccessful==true)	then
			SetFlag(PlayerID,545795,1);
			ScriptMessage( PlayerID, PlayerID, 2, "[SC_425101_H]", 0 );
			break;
		end
		if	IfSuccessful==false	then
			ScriptMessage( PlayerID, PlayerID, 2, "[SC_425101_I]", 0 );
			break;
		end
	end
	Global_DW_TempPlayerPool[425101][PlayerID]=nil;
end

function DW_CheckQuestAccept(Type,ObjID,...)
	if	Type=="or"	then
		for i=1,select("#",...),1 do
			local TempQuestID = select(i,...);
			if	CheckAcceptQuest(ObjID,TempQuestID)==true	then
				return true;
			end
		end
		return false;
	elseif	Type=="and"	then
		for i=1,select("#",...),1 do
			local TempQuestID = select(i,...);
			if	CheckAcceptQuest(ObjID,TempQuestID)==false	then
				return false;
			end
		end
		return true;
	end
	return nil;
end

function LuaS_425101_CheckAllDay()
	local Hoster = OwnerID();
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[425101] = Global_DW_TempPlayerPool[425101] or {};
	while	true	do
		for index,PlayerID in pairs(Global_DW_TempPlayerPool[425101]) do
			if	type(index)=="number"	then
				if	CheckID(PlayerID)==false	or
					CheckDistance(Hoster,PlayerID, 480)==false	or
					DW_CheckQuestAccept("or",PlayerID,425101,425121,425141)==false	then
					Global_DW_TempPlayerPool[425101].index=nil;
				end
			end
		end
		sleep(10);
	end
end

function LuaS_425101_ObjInitialPlot()
	SetPlot(OwnerID(),"touch","LuaS_425101_TouchPlot",40);
end

function LuaS_425101_TouchPlot()
	CallPlot(TargetID(),"LuaS_425101_ItemRewardFunc",OwnerID())
end

function LuaS_425101_ItemRewardFunc(PlayerID)
	local PID = ReadRoleValue(OwnerID(),EM_RoleValue_PID);
	local ObjDBIDTable = {240868,240869,240870,240871,240872,240873,240874,240875};
	if	CountBodyItem(PlayerID,ObjDBIDTable[PID])==0	then
		GiveBodyItem(PlayerID,ObjDBIDTable[PID],1);
	end
	if	DW_CheckQuestAccept("or",PlayerID,425101,425121,425141)==true	then
		if	CheckBuff(PlayerID,621812)==false	then
			AddBuff(PlayerID,621812,0,-1);
		end
	end
end

function LuaS_425101_AutomaticalDel()
	local 	Obj = OwnerID();
	local	QuestTable = {425101,425121,425141};
	for i=1,3,1 do
		if	CheckAcceptQuest(Obj,QuestTable[i])==true	then
			return;
		end
	end
	local	ItemTable = {240868,240869,240870,240871,240872,240873,240874,240875};
	local 	Temp
	for i=1,table.getn(ItemTable),1 do
		Temp = CountBodyItem(Obj,ItemTable[i]);
		DelBodyItem(Obj,ItemTable[i],Temp);
	end
	CancelBuff(Obj,621812);
	return true;
end

--425102 使命必達

	
function LuaS_425102_AcceptQuestPlot()
	local TotalFlagNum = 6
	local Obj = TargetID();
	CloseSpeak(Obj);
	local KeyItemBottom = 546069;
	local FlagNum = 0
	for i=1,TotalFlagNum,1 do
		if	CheckFlag(Obj,KeyItemBottom+i)==true	then
			FlagNum = FlagNum + 1;
		end
	end
	if	FlagNum==0	then
		SetFlag(Obj,KeyItemBottom+DW_Rand(TotalFlagNum),1);
		return;
	end
end

function LuaS_425102_DeliveryPlot()
	local Obj = OwnerID();
	local KeyItemBottom = 546069;
	local PID = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	if	DW_CheckQuestAccept("or",Obj,425102,425122,425142) ==true	then
		if	CheckFlag(Obj,KeyItemBottom+PID)==true	and
			CountBodyItem(Obj,240901)>0		then
			SetSpeakDetail( Obj,"[SC_425102_A]");
			DelBodyItem(Obj,240901,1);
			SetFlag(Obj,KeyItemBottom+PID,0);
			SetFlag(Obj,545791,1);
			return;
		end
	end
	local KeyItemBottom2 = 546103;
	if	DW_CheckQuestAccept("or",Obj,425107,425127,425147) ==true	then
		if	CheckFlag(Obj,KeyItemBottom2+PID)==true	and
			CountBodyItem(Obj,240968)>0		then
			SetSpeakDetail( Obj,"[SC_425107_A]");
			DelBodyItem(Obj,240968,1);
			SetFlag(Obj,KeyItemBottom2+PID,0);
			SetFlag(Obj,545794,1);
			return;
		end
	end
	LoadQuestOption(Obj);
end

function LuaS_425102_UseItem()
	local TotalFlagNum = 6
	local Obj = OwnerID();
	CloseSpeak(Obj);
	local KeyItemBottom = 546069;
	local NPCBottom=120043
	local FlagNum = 0
	local Mark
	local AreaStringTable = {
					"[ZONE_COMMAND_CENTER]",
					"[ZONE_REST_BLOCK]",
					"[ZONE_LOGGING_AREA]",
					"[ZONE_CENTRAL_KITCHEN]",
					"[SC_425102_D]",
					"[ZONE_RESEARCH_CENTER]"
						};
	for i=1,TotalFlagNum,1 do
		if	CheckFlag(Obj,KeyItemBottom+i)==true	then
			Mark = KeyItemBottom+i;
			FlagNum = FlagNum + 1;
		end
	end
	if	FlagNum==0	then
		Mark = KeyItemBottom+DW_Rand(TotalFlagNum)
		SetFlag(Obj,Mark,1);
	end
	local StringTable = {};
	for i=1,TotalFlagNum,1 do
		StringTable[KeyItemBottom+i]=NPCBottom+i;
	end
	local String ="[SC_425102_B][$SETVAR1="..GameObjInfo_Str( StringTable[Mark] ,"Name").."][$SETVAR2="..AreaStringTable[Mark-KeyItemBottom].."]";
	ClearBorder(Obj);
	AddBorderPage( Obj, String);
	ShowBorder(Obj,0,"[SC_425102_C]","ScriptBorder_Texture_Paper");
end

--425103 獨特環境

	
function LuaS_425103_UseItem_Check()
	local Obj,Player = TargetID(),OwnerID();
	local IsAcceptQuest = DW_CheckQuestAccept("or",Player,425103,425123,425143);
	if	IsAcceptQuest==false	then
		ScriptMessage( Player, Player, 1, "[SC_425105_A]", 0 );
		return false;
	end
	if	CheckDistance(Obj,Player, 150)==false	then
		ScriptMessage( Player, Player, 1, "[SC_425103_F]", 0 )--Warming Message;
		return false;
	end
	local ZoneID = ReadRoleValue(Obj,EM_RoleValue_ZoneID);
	if	ZoneID<=21	or 	ZoneID>26	and ZoneID~=45 then
		ScriptMessage( Player, Player, 1, "[SC_425103_A]", 0 )--Warming Message;
		return false;
	end
	local OrgID = ReadRoleValue(Obj,EM_RoleValue_OrgID);
	local RaceType = GameObjInfo_Int(OrgID,"Race");
	if	RaceType~=4	then
		ScriptMessage( Player, Player, 1, "[SC_425103_B]", 0 )--Warming Message;
		return false;
	end
	local HP = ReadRoleValue(Obj,EM_RoleValue_HP);
	local MaxHP = ReadRoleValue(Obj,EM_RoleValue_MaxHP);
	if	HP>=MaxHP	then
		ScriptMessage( Player, Player, 1, "[SC_425103_C]", 0 )--Warming Message;
		return	false;
	end
	local CheckResult = CheckBuff(Obj,621109)
	if	CheckResult==true	then
		ScriptMessage( Player, Player, 1, "[SC_425103_D]", 0 )--Warming Message;
		return false;
	end
	local IsLived=ReadRoleValue(Obj,EM_RoleValue_IsDead);
	if	IsLived==1	then
		ScriptMessage( Player, Player, 1, "[SC_425103_E]", 0 )--Warming Message;
		return false;
	end
	return true;
end

function LuaS_425103_UseItem_Execute()
	local Obj,Player = TargetID(),OwnerID();
	AddBuff(Obj,621109,0,-1);
	DW_QietKillOne(Player,106478);
end

--425104 示範戰鬥

	
function LuaS_425104_ContextGoing()
	local Obj = OwnerID();
	CloseSpeak(Obj);
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[425104] = Global_DW_TempPlayerPool[425104] or {};
	table.insert(Global_DW_TempPlayerPool[425104],Obj);
	if	Global_DW_TempPlayerPool[425104].Status~="underway"	then
		CallPlot(TargetID(),"LuaS_425104_Showing",Obj);
		Global_DW_TempPlayerPool[425104].Status="underway";
	end
end

function LuaS_425104_Showing(Obj)
	local Hoster = OwnerID();
	local Actor = {};
	Actor = LuaS_425104_Content(Actor,Hoster,Obj);
	LuaS_425104_EndShow(Actor);
end

function LuaS_425104_Content(Actor,Hoster,Player)
	local Var = {};
	Var.MobTable = {106474,106475,106476};
	Var.RandResult = DW_Rand(table.getn(Var.MobTable));
	Actor.Monster = DW_CreateObjEX("flag",Var.MobTable[Var.RandResult],780089,1);
	SetPlot(Actor.Monster,"dead","LuaS_425104_DeadPlot",0)
	DW_UnFight(Actor.Monster,true);
	Var.StringTable = {"[SC_425104_A]","[SC_425104_B]","[SC_425104_C]"};
	Yell(Hoster,Var.StringTable[Var.RandResult],1)
	sleep(10);
	DW_UnFight(Actor.Monster,false);
	sleep(10)
	Yell(Hoster,"[SC_425104_D]",1);
	if	CheckID(Player)==true	then
		SetAttack(Actor.Monster,Player);
	end
	while true do
		sleep(10);
		if	ReadRoleValue(Actor.Monster,EM_RoleValue_IsDead)==1	then
			Yell(Hoster,"[SC_425104_E]",1);
			return Actor;
		end
		local PlayerNum = DW_QuestBreakCondition(Actor.Monster,0,425104,false,425124,425144);
		if	PlayerNum==0	or
			HateListCount(Actor.Monster)==0	then
			Yell(Hoster,"[SC_425104_F]",1);
			return Actor;
		end
	end
end

function LuaS_425104_DeadPlot()
	local Obj = OwnerID();
	local HateNum = HateListCount(Obj);
	local TempHate;
	for i=0,HateNum,1 do
		TempHate = HateListInfo(Obj,i , EM_HateListInfoType_GItemID);
		if	DW_CheckQuestAccept("or",TempHate,425104,425124,425144)==true	and
			ReadRoleValue(TempHate,EM_RoleValue_IsDead)==0	then
			SetFlag(TempHate,545792,1);
		end
	end
end


function LuaS_425104_EndShow(Actor)
	for index,GUID in pairs(Actor) do
		if	CheckID(GUID)==true	then
			DelObj(GUID);
		end
	end
	Global_DW_TempPlayerPool[425104]=nil;
end

--425105 另一個戰場

	
function LuaS_425105_InitialPlot()
	local Chief = OwnerID();
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[425105] = Global_DW_TempPlayerPool[425105] or {};
	Global_DW_TempPlayerPool[425105].Customer = {};
	local TempTable = SearchRangeNPC ( Chief , 90 );
	for i=0,table.getn(TempTable),1 do
		local TempOrgID = ReadRoleValue(TempTable[i],EM_RoleValue_OrgID);
		if	TempOrgID<=120032		and
			TempOrgID>=119998		then
			table.insert(Global_DW_TempPlayerPool[425105].Customer,TempTable[i]);
		end
	end

	for i=1,table.getn(Global_DW_TempPlayerPool[425105].Customer),1 do
		BeginPlot(Global_DW_TempPlayerPool[425105].Customer[i],"LuaS_425105_Customer",0);
	end
	Global_DW_TempPlayerPool[425105].Standard = 1;
	Global_DW_TempPlayerPool[425105].PassTime = Global_DW_TempPlayerPool[425105].Standard;
end

function LuaS_425105_Customer()
	local Chief = TargetID();
	local Customer = OwnerID();
	local NumLimit = 50;
	local InitialRand  = DW_Rand(NumLimit);
	WriteRoleValue(Customer,EM_RoleValue_PID,InitialRand);

	local EmptyPlot = {
				[1] = {"[SC_120070_A]",120070,"[SC_120070_B]"},
				[2] = {"[SC_119862_A]",119862,"[SC_119862_B]"},
				[3] = {"[SC_119862_C]",119862,"[SC_119862_D]"},
				[4] = {"[SC_119862_E]",119862,"[SC_119862_F]"},
				[5] = {"[SC_119862_G]",119862,"[SC_119862_H]"},
				[6] = {"[SC_119862_I]",119862,"[SC_119862_J]"},
				[7] = {"[SC_119862_K]",119862,"[SC_119862_L]"}
					}
	local FullPlot = {
				[1] = {"[SC_119862_M]",119862,"[SC_119862_N]"},
				[2] = {"[SC_120070_C]",120070,"[SC_120070_D]"},
				[3] = {"[SC_120070_E]",120070,"[SC_120070_F]"},
				[4] = {"[SC_120070_G]",120070,"[SC_120070_H]"},
				[5] = {"[SC_120070_I]",120070,"[SC_120070_J]"},
				[6] = {"[SC_120070_K]",120070,"[SC_120070_L]"}
					}

	local NormalChat = { "[SC_425106_Q]","[SC_425106_R]","[SC_425106_S]" }

	local IsShow = false;
	local Statu,IsChange = "Normal";
	local PID,PT;
	while	true	do
		PID = ReadRoleValue(Customer,EM_RoleValue_PID);
		if	PID>NumLimit*0.7	then
			if	Statu~="Empty"	then
				Statu="Empty";
				IsChange="Empty";
				AddBuff(Customer,621113,0,-1);
			end
		elseif	PID<NumLimit*0.3	then
			if	Statu~="Full"	then
				Statu="Full";
				IsChange="Full";
				AddBuff(Customer,621112,0,-1);
			end
		else
			if	Statu~="Normal"	then
				Statu="Normal";
				IsChange="Normal";
				CancelBuff_NoEvent(Customer,621112);
				CancelBuff_NoEvent(Customer,621113);
			end
		end
		PT = Global_DW_TempPlayerPool[425105].PassTime;
		if	IsChange=="Empty"	then
			if	PT==0	then
				PT=Global_DW_TempPlayerPool[425105].Standard;
				Global_DW_TempPlayerPool[425105].PassTime = PT;
				local Num = table.getn(EmptyPlot);
				local Temp = DW_Rand(Num*3);
				if	Temp<=Num	then
					NPCSay(Customer,EmptyPlot[Temp][1]);
					sleep(25);
					if	EmptyPlot[Temp][2]==120070	then
						CallPlot(Customer,"NPCSay",Global_DW_TempPlayerPool[425105].Waitress,EmptyPlot[Temp][3]);
					else
						CallPlot(Customer,"NPCSay",Chief,EmptyPlot[Temp][3]);
					end
				end
			else
				PT = PT -1;
			end
			IsChange = nil;
		elseif	IsChange=="Full"	then
			if	PT==0	then
				PT=Global_DW_TempPlayerPool[425105].Standard;
				Global_DW_TempPlayerPool[425105].PassTime = PT;
				local Num = table.getn(FullPlot);
				local Temp = DW_Rand(Num*3)
				if	Temp<=Num	then
					NPCSay(Customer,FullPlot[Temp][1]);
					sleep(25);
					if	FullPlot[Temp][2]==120070	then
						CallPlot(Customer,"NPCSay",Global_DW_TempPlayerPool[425105].Waitress,FullPlot[Temp][3]);
					else
						CallPlot(Customer,"NPCSay",Chief,FullPlot[Temp][3]);
					end
				end
			else
				PT = PT -1;
			end
			IsChange = nil;
		elseif	IsChange == "Normal"	then
			sleep(20+DW_Rand(60));
			local Num = table.getn(NormalChat);
			local Temp = DW_Rand(Num*3);
			if	Temp<=Num	then
				NPCSay(Customer,NormalChat[Temp]);
			end
			IsChange = nil;
		end
		Global_DW_TempPlayerPool[425105].PassTime = PT;
		if	PID < 50	then	WriteRoleValue(Customer,EM_RoleValue_PID,PID+DW_Rand(4))	end;
		sleep(10)
	end
end

function LuaS_425105_WaitressInitial()
	local Obj = OwnerID();
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[425105] = Global_DW_TempPlayerPool[425105] or {};
	Global_DW_TempPlayerPool[425105].Waitress = Obj;
	local PX,PZ,NX,XZ,Dis2
	PX=ReadRoleValue(Obj,EM_RoleValue_X);
	PZ=ReadRoleValue(Obj,EM_RoleValue_Z);
	while	true	do
		local TotalDis = 0
		for i=1,10,1 do
			sleep(50);
			NX=ReadRoleValue(Obj,EM_RoleValue_X);
			NZ=ReadRoleValue(Obj,EM_RoleValue_Z);
			Dis2 = (PX-NX)^2+(PZ-NZ)^2;
			TotalDis = TotalDis + Dis2
			PX = NX;
			PZ = NZ;
		end
		if	TotalDis<100	then
			MoveToFlagEnabled(Obj, true);
			SetPos( Obj, -17579.8, 610, -24180.8 , 0);--for safe
		end
	end
end

function LuaS_425105_Waitress()
	local Waitress = OwnerID();
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	if	Global_DW_TempPlayerPool[425105]~=nil	then
		for i=1,table.getn(Global_DW_TempPlayerPool[425105].Customer),1 do
			local TempID = Global_DW_TempPlayerPool[425105].Customer[i];
			if	CheckDistance(TempID,Waitress, 30)	then
				if	CheckBuff(TempID,621113)==true	then
					MoveToFlagEnabled(Waitress, false);
					AdjustFaceDir(Waitress,TempID,0)
					sleep(10);
					CancelBuff_NoEvent(TempID,621113);
					AddBuff(TempID,621112,0,-1);
					WriteRoleValue(TempID,EM_RoleValue_PID,8);
					sleep(10);
				end
			end
		end
	end

	MoveToFlagEnabled(Waitress, true);
end

function LuaS_425105_CheckToUse()
	local Obj = OwnerID();
	local IsAcceptQuest = DW_CheckQuestAccept("or",Obj,425105,425125,425145);
	if	IsAcceptQuest==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_A]", 0 );
		return false;
	end
	local DistanceData = DW_CheckDis(Obj,780090,1,150);
	if	DistanceData==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_B]", 0 );
		return false;
	end
	local OrgID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if	OrgID>120032	or
		OrgID<119998	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_C]", 0 );
		return false;
	end
	local IsBuffed = CheckBuff(TargetID(),621113)
	if	IsBuffed==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_D]", 0 );
		return false;
	end
	local IsNear = CheckDistance(Obj,TargetID(), 40);
	if	IsNear==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_E]", 0 );
		return false;
	end
	return true;
end


function LuaS_425105_Execute()
	local Obj,NPC = OwnerID(),TargetID();
	CancelBuff_NoEvent(NPC,621113);
	AddBuff(NPC,621112,0,-1);
	WriteRoleValue(NPC,EM_RoleValue_PID,8);
	DW_QietKillOne(Obj,106423);
end

--425106 最真實的情況

	
function LuaS_425106_Conversation()
	local Obj = OwnerID();
	LoadQuestOption(Obj);
	if	DW_CheckQuestAccept("or",Obj,425106,425126,425146)==true	and
		CheckFlag(Obj,545793)==false	and
		CheckBuff(Obj,621704)==false		then
		AddSpeakOption(Obj,Obj,"[SC_425106_I]","LuaS_425106_NextStep", 0 )
	end
end

function LuaS_425106_NextStep()
	local Obj = OwnerID();
	CloseSpeak(Obj);
	if	CheckBuff(Obj,621705)==false	then
		BeginPlot(Obj,"LuaS_425106_PlayerPlot",0);
	end
	Tell(Obj,TargetID(),"[SC_425106_G]");
	if	CountBodyItem(Obj,240904)==0	then
		GiveBodyItem(Obj,240904,1);
	end
end


function LuaS_425106_CheckToUse()
	local Obj = OwnerID();
	local IsOwnQuest = DW_CheckQuestAccept("or",Obj,425106,425126,425146);
	if	IsOwnQuest==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_A]", 0 );
		return false;
	end
	local IsPosition = DW_CheckDis(Obj,780090,1,150);
	if	IsPosition==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425106_J]", 0 );
		return false;
	end
	local IsFull = CheckBuff(Obj,621704);
	if	IsFull==true	then
		ScriptMessage( Obj, Obj, 1, "[SC_425106_K]", 0 );
		return false;
	end
	local IsEating = CheckBuff(Obj,621114);
	if	IsEating==true	then
		ScriptMessage( Obj, Obj, 1, "[SC_425106_L]", 0 );
		return false;
	end
	return true;
end


function LuaS_425106_Execute()
	local Obj = OwnerID();
	local IsBuffed = CheckBuff(Obj,621703);
	if	IsBuffed == true	then
		local Pos = Lua_BuffPosSearch( Obj , 621703 );
		if	BuffInfo(Obj,Pos,EM_BuffInfoType_Power)<=4	then
			AddBuff(Obj,621114,0,15);
			AddBuff(Obj,621703,0,60);
		else
			CancelBuff_NoEvent(Obj,621703);
			AddBuff(Obj,621704,0,120);
		end
	else
		AddBuff(Obj,621114,0,15);
		AddBuff(Obj,621703,0,60);
	end
end

function LuaS_425106_PlayerPlot()
	local Obj = OwnerID();
	AddBuff(Obj,621705,0,-1)
	local IsNearArea
	while true do
		sleep(10);
		for i=1,8,1 do
			IsNearArea = DW_CheckDis(Obj,780091,i,40);
			if	IsNearArea==true	then
				if	LuaS_425106_LoopCheckPlot()=="End"	then
					CancelBuff_NoEvent(Obj,621705);
					return;
				end
			end
		end
	end
end

function LuaS_425106_LoopCheckPlot()
	local Obj = OwnerID();
	local TempTable = Global_DW_TempPlayerPool[425105].Customer;
	local StringTable = {};
	StringTable.Text = {
					[0]="[SC_425106_A]",
					[5]="[SC_425106_B]",
					[10]="[SC_425106_C]"
						};
	local Score,WValue=0,0;
	local IsBuffed,IsOwnDish
	local BuffID = 621114;
	local DishID = 240904;
	local FinalString;
	while	true	do
		if	CheckFlag(Obj,545793)==true	then
			return "End";
		end
		local IsNear,IsWarming
		for i=1,table.getn(TempTable),1 do
			IsNear = CheckDistance(Obj,TempTable[i], 30);
			if	IsNear==true	then

				IsWarming = CheckBuff(TempTable[i],621115);
				if	IsWarming==true	then
					AddBuff(TempTable[i],621115,0,3);
					ScriptMessage( Obj, Obj, 1, "[SC_425106_F]", 0 );
					break;
				else
					local IsFull = CheckBuff(TempTable[i],621112);
					local IsEmpty = CheckBuff(TempTable[i],621113);
					if	IsFull==true	then
						if	FinalString=="[SC_425106_M]" or FinalString==nil	then
							FinalString = "[SC_425106_N]";
						end
					elseif	IsEmpty==true	then
						if	FinalString=="[SC_425106_N]" or FinalString==nil	then
							FinalString = "[SC_425106_M]";
						end
					elseif	IsFull==false and IsEmpty==false	then
						Score = Score + 1;
						if	Score==14	then
							SetFlag(Obj,545793,1);
							CancelBuff_NoEvent(Obj,BuffID);
							return "End";
						end
						if	Score%5==0	then
							NPCSay(TempTable[i],"[SC_425106_P]");
							FinalString = StringTable.Text[Score];
						else
							FinalString = " ";
						end
					end
					IsBuffed = CheckBuff(Obj,BuffID);
					if	IsBuffed~=true	then
						IsOwnDish = (CountBodyItem(Obj,DishID)~=0)
						if	IsOwnDish ==false	then
							ScriptMessage( Obj, Obj, 0, "[SC_425106_E]", C_Red );
							AddBuff(TempTable[i],621115,0,3);
							return "End";
						end
						WValue = WValue +1;
						if	WValue==6	then
							AddBuff(TempTable[i],621115,0,3);
							return "Keep";
						end
						if	WValue%2==0	then
							ScriptMessage( Obj, Obj, 1, "[SC_425106_D]", C_Red );
							break;
						end
						break;
					end
				end
			end
			if	i==8 and Score==0	then
				return "Keep";
			end
		end
		if	FinalString~=" " and FinalString~=nil	then	ScriptMessage( Obj, Obj, 2, FinalString, C_Pink );	end
		FinalString = nil;
		sleep(10);
	end
end

function LuaS_425106_BuffEnd()
	local Obj = OwnerID();
	if	CheckFlag(Obj,545793)==false	then
		ScriptMessage( Obj, Obj, 2, "[SC_425106_O]", C_Pink );
	end
	return true
end

--425107 廢寢忘食
	
function LuaS_425107_AcceptQuestPlot()
	local TotalFlagNum = 6
	local Obj = TargetID();
	CloseSpeak(Obj);
	local KeyItemBottom = 546103;
	local FlagNum = 0
	for i=1,TotalFlagNum,1 do
		if	CheckFlag(Obj,KeyItemBottom+i)==true	then
			FlagNum = FlagNum + 1;
		end
	end
	if	FlagNum==0	then
		SetFlag(Obj,KeyItemBottom+DW_Rand(TotalFlagNum),1);
		return;
	end
end


function LuaS_425107_UseItem()
	local TotalFlagNum = 6
	local Obj = OwnerID();
	CloseSpeak(Obj);
	local KeyItemBottom = 546103;
	local NPCBottom=120043
	local FlagNum = 0
	local Mark
	local AreaStringTable = {
					"[ZONE_COMMAND_CENTER]",
					"[ZONE_REST_BLOCK]",
					"[ZONE_LOGGING_AREA]",
					"[ZONE_CENTRAL_KITCHEN]",
					"[SC_425102_D]",
					"[ZONE_RESEARCH_CENTER]"
						};
	for i=1,TotalFlagNum,1 do
		if	CheckFlag(Obj,KeyItemBottom+i)==true	then
			Mark = KeyItemBottom+i;
			FlagNum = FlagNum + 1;
		end
	end
	if	FlagNum==0	then
		Mark = KeyItemBottom+DW_Rand(TotalFlagNum)
		SetFlag(Obj,Mark,1);
	end
	local StringTable = {};
	for i=1,TotalFlagNum,1 do
		StringTable[KeyItemBottom+i]=NPCBottom+i;
	end
	local String ="[SC_425107_B][$SETVAR1="..GameObjInfo_Str( StringTable[Mark] ,"Name").."][$SETVAR2="..AreaStringTable[Mark-KeyItemBottom].."]";
	ClearBorder(Obj);
	AddBorderPage( Obj, String);
	ShowBorder(Obj,0,"[SC_425102_C]","ScriptBorder_Texture_Paper");
end
--425108 火焰大挑戰
	
function LuaS_425108_UseToCheck()
	local Obj = OwnerID();
	local IsOwnQuest = DW_CheckQuestAccept("or",Obj,425108,425128,425148);
	if	IsOwnQuest==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_A]", 0 );
		return false;
	end
	local IsNearArea = DW_CheckDis(Obj,780090,2,300);
	if	IsNearArea==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425108_A]", 0 );
		return false;
	end
	return true;
end

function LuaS_425108_Execute()
	local Obj = OwnerID();
	local NPCTable = SearchRangeNPC ( Obj , 20 );
	local TempID,OrgID,IsWorking
	IsWorking = 0
	for i=0,table.getn(NPCTable),1 do
		TempID = NPCTable[i];
		OrgID = ReadRoleValue(TempID,EM_RoleValue_OrgID);
		if	OrgID==119866	then
			CallPlot(TempID,"LuaFunc_ResetObj",TempID); 
			DW_QietKillOne(Obj,106424);
			IsWorking = IsWorking + 1;
		end
		if	i==table.getn(NPCTable)	and	IsWorking==0	then
			ScriptMessage( Obj, Obj, 1, "[SC_425108_B]", 0 )
		end
	end
end

--425109 悉心照料
	
function LuaS_425109_Wounder()
	local Obj = OwnerID();
	local PID = DW_Rand(90);
	local GetBadSpeed = 0;
	local BuffPos
	local BuffTable = {621706,621707,621708};
	WriteRoleValue(Obj,EM_RoleValue_PID,PID);
	while true do
		PID = ReadRoleValue(Obj,EM_RoleValue_PID);
		if	PID+GetBadSpeed>90	then
			local IsBuffed=false;
			for i=1,table.getn(BuffTable),1 do
				if	CheckBuff(Obj,BuffTable[i])==true	then
					IsBuffed=true;
				end
			end
			if	IsBuffed==false	then
				local BuffNum = DW_Rand(3);
				for i=1,BuffNum,1 do
					local SortNum = DW_Rand(table.getn(BuffTable));
					local PickOne =BuffTable[SortNum];
					AddBuff(Obj,PickOne,0,-1);
					table.remove(BuffTable,SortNum);
				end
				BuffTable = {621706,621707,621708};
			end
		else
			GetBadSpeed = DW_Rand(4);
			WriteRoleValue(Obj,EM_RoleValue_PID,PID+GetBadSpeed);
		end
		sleep(30);
	end
end



function LuaS_425109_CheckToUse()
	local Obj = OwnerID();
	local IsCheckQuest = DW_CheckQuestAccept("or",Obj,425109,425129,425149);
	if	IsCheckQuest==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_A]", 0 )--警告訊息：你沒有相關的任務！
		return false;
	end
	local IsNear = CheckDistance(Obj,TargetID(), 35);
	if	IsNear==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425109_A]", 0 );--警告訊息：你需要再靠近一點！
		return false;
	end
	local IsNearArea = DW_CheckMap(OwnerID(),216);
	if	IsNearArea==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425109_B]", 0 );--警告訊息：你不在指定區域之中！
		return false;
	end
	local ItemID = GetUseItemGUID(Obj);
	local BuffTable = {[240969]=621706,[240970]=621707,[240971]=621708};
	local IsRightBuff = CheckBuff(TargetID(),BuffTable[ItemID]);
	if	IsRightBuff==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425109_C]", 0 );
		return false;
	end
	return true;
end



function LuaS_425109_Execute()
	local Obj = OwnerID();
	local Wounder = TargetID();
	local ItemID = GetUseItemGUID(Obj);
	local BuffTable = {[240969]=621706,[240970]=621707,[240971]=621708};
	CancelBuff_NoEvent(Wounder,BuffTable[ItemID]);

	local BuffTable = {621706,621707,621708};
	local TillBuffed
	for i=1,table.getn(BuffTable),1 do
		if	CheckBuff(Wounder,BuffTable[i])==true	then
			TillBuffed=true;
			break;
		end
	end
	WriteRoleValue(Wounder,EM_RoleValue_PID,0)
	if	TillBuffed~=true	then
		DW_QietKillOne(Obj,106501);
		ScriptMessage( Obj, Obj, 0, "[SC_425109_D]", C_Pink )
	else
		ScriptMessage( Obj, Obj, 0, "[SC_425109_E]", 0 );
	end
	return true;
end

function LuaS_425109_Nurse_Initial()
	local Obj = OwnerID();
	local PX,PZ,NX,XZ,Dis2
	PX=ReadRoleValue(Obj,EM_RoleValue_X);
	PZ=ReadRoleValue(Obj,EM_RoleValue_Z);
	while	true	do
		local TotalDis = 0
		for i=1,10,1 do
			sleep(50);
			NX=ReadRoleValue(Obj,EM_RoleValue_X);
			NZ=ReadRoleValue(Obj,EM_RoleValue_Z);
			Dis2 = (PX-NX)^2+(PZ-NZ)^2;
			TotalDis = TotalDis + Dis2
			PX = NX;
			PZ = NZ;
		end
		if	TotalDis<100	then
			MoveToFlagEnabled(Obj, true);
			SetPos( Obj, -17340, 630, -23409.4 , 0);--for safe
		end
	end
end

function LuaS_425109_Nurse()
	local Obj = OwnerID();
	local NPCTable = SearchRangeNPC ( Obj , 35 );
	local TempID,IsInMotion,IsRightDir;
	local BuffTable = {621706,621707,621708};
	local NPCNum = table.getn(NPCTable);
	if	NPCNum~=0	then
		for i=1,NPCNum,1 do
			TempID = NPCTable[i];
			for AN=1,table.getn(BuffTable),1 do
				if	CheckBuff(TempID,BuffTable[AN])==true	then
					MoveToFlagEnabled(Obj, false);
					if	IsRightDir==nil	then
						AdjustFaceDir(Obj,TempID,0);
						IsRightDir=true;
					end
					sleep(10);
					if	IsInMotion==nil	then
						IsInMotion = true;
						Lua_DW_Craft();
					end
					sleep(20);
					CancelBuff_NoEvent(TempID,BuffTable[AN]);
					WriteRoleValue(TempID,EM_RoleValue_PID,DW_Rand(10));
					sleep(10)
				end
			end
			IsRightDir=nil;
			IsInMotion=nil;
		end
	end
	MoveToFlagEnabled(Obj, true);
end