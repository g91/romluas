
--424961 更多的朋友
function LuaS_424961_EndPlot()
	local Player = TargetID();
	ChangeZone(Player,2,0,7312.3,63,-3054.8,53.5);
	return true;
end

--424962 賢者之眼加入
function LuaS_424962_TalkPlotSP()
	local Obj = OwnerID()
	if	CheckCompleteQuest(Obj,424961)==true	and
		CheckAcceptQuest(Obj,424963)==false	and 
		CheckCompleteQuest(Obj,424963)==false	then
		if	CheckFlag(Obj,545778)==false	then
			SetSpeakDetail( Obj,"[SC_424962_B]")
			AddSpeakOption(Obj,Obj,"[SC_424962_C]","LuaS_424962_Gap(1)", 0 )
			AddSpeakOption(Obj,Obj,"[SC_424962_D]","LuaS_424962_Gap(2)", 0 )
		else
			LoadQuestOption(Obj)
			AddSpeakOption(Obj,Obj,"[SO_BACKTALK]","LuaI_110167", 0 )--回到原對話
		end
	else
		LoadQuestOption(Obj);
		AddSpeakOption(Obj,Obj,"[SO_BACKTALK]","LuaI_110167", 0 )--回到原對話
	end
end

function LuaS_424962_Gap(Result)
	local Obj = OwnerID()
	if	Result==1	then 	--捐
		if	ReadRoleValue(Obj,EM_RoleValue_Money)>=50000	then
			AddRoleValue(Obj,EM_RoleValue_Money,-50000)
			SetFlag(Obj,545778,1)	--捐贈給冒險者協會
			SetSpeakDetail( Obj,"[SC_424962_E]")
			AddSpeakOption(Obj,Obj,"[SC_424962_G]","LoadQuestOption("..Obj..")", 0 )
			SetFlag(Obj,545777,1) --與達莉絲會面
		else
			SetSpeakDetail( Obj,"[SC_424962_H]")
		end
	elseif	Result==2	then	--不捐
		SetSpeakDetail( Obj,"[SC_424962_F]")
		SetFlag(Obj,545777,1) --與達莉絲會面
	end
end

function LuaS_424962_EndPlot()
	local Player = TargetID();
	ChangeZone(Player,15,0,-4478.3,220,8308.8,27.9);
	return true;
end

--424964 元素特性

function LuaS_424964_InitialPlot()		--Sleep Motion and Buff Effect
	local Obj = OwnerID();
	AddBuff(Obj,621811,0 ,-1);
	LuaP_Sleeping();
end

function LuaS_424964_TalkPlot()		--NPC Conversation
	local Obj = OwnerID();
	if	CheckBuff(Obj,621106)==false	then
		CancelBuff_NoEvent(Obj,620674)
	else
		CloseSpeak(Obj)
	end
	if	CheckAcceptQuest(Obj,424964)==true	then
		SetSpeakDetail( Obj,"[SC_424964_I]");
		AddSpeakOption(Obj,Obj,"[SC_424964_A]","LuaS_424964_TransEnforceObj("..TargetID()..")", 0 );
	else
		LoadQuestOption(Obj);
	end
end

function LuaS_424964_TransEnforceObj(NPC)	--Choose 
	--Need a gap to make sure player can join this show
	--Use PID value to check
	local Obj = OwnerID();
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[424964] = Global_DW_TempPlayerPool[424964] or {};	--table initial prograss
	local PIDTemp = Global_DW_TempPlayerPool[424964].EventState
	if	PIDTemp==nil	then
		--The Show is resting
		Global_DW_TempPlayerPool[424964].EventState = 1;
		BeginPlot(NPC,"LuaS_424964_Presentation",0);
		CallPlot(NPC,"LuaS_424964_JoinShow",Obj);
	elseif	PIDTemp==1	then
		--The Show is playing
		CallPlot(Obj,"DW_ChooseOneFromTwo",Obj,"[SC_QUESTEXECUTESURE_0]","LuaS_424964_JoinShow","LuaS_424964_WaitNext");
	end
	CloseSpeak(Obj);
end

function LuaS_424964_Presentation()
	local Hoster,Player = OwnerID(),TargetID();
	local CheckBuffID,QuestID = 621106,424964;
	--Warming: Global_DW_TempPlayerPool is a Global Table, Used be save the player list at single quest.
	--index of this table is classed with the DBID of quest
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[QuestID] = Global_DW_TempPlayerPool[QuestID] or {};	--table initial prograss
	local ActorNPC = {};
	local AudienceNum;
	Global_DW_TempPlayerPool[QuestID]["IsChangeType"] = Global_DW_TempPlayerPool[QuestID]["IsChangeType"] or 0
	ActorNPC = LuaS_424964_Phase(Global_DW_TempPlayerPool[QuestID]["IsChangeType"],ActorNPC,Hoster,CheckBuffID,QuestID);
	for Name,GUID in pairs(ActorNPC) do		--Clear all NPC
		if	CheckID(GUID)==true	then
			DelObj(GUID);
		end
	end
	Global_DW_TempPlayerPool[QuestID]=nil;
end


function LuaS_424964_Phase(Phase,ActorNPC,Hoster,CheckBuffID,QuestID)
	ActorNPC.Lavare = DW_CreateObjEX("flag",119795,781043,1);
	ActorNPC.Bannaite = DW_CreateObjEX("flag",119797,781043,3);
	sleep(10);
	Say(ActorNPC.Lavare,"[SC_424964_B]");
	sleep(15);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	Global_DW_TempPlayerPool[QuestID]["IsChangeType"] = 1;
	for index,PlayerGUID in pairs(Global_DW_TempPlayerPool[424964]) do
		if type(index)=="number"	then
			AddBuff(PlayerGUID,620674,0,16);
		end
	end
	ScriptMessage( ActorNPC.Lavare, 0, 2, "[SC_424964_C]", C_YELLOW )
	ScriptMessage( ActorNPC.Lavare, 0, 0, "[SC_424964_L]", C_YELLOW )
	ActorNPC.WaterElement = DW_CreateObjEX("flag",119796,781043,2);
	sleep(15);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	CastSpell(ActorNPC.Lavare,ActorNPC.WaterElement,498509);
	sleep(30);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	KillID(ActorNPC.Lavare,ActorNPC.WaterElement);
	Say(ActorNPC.Lavare,"[SC_424964_D]");
	sleep(10);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	DelObj(ActorNPC.WaterElement);
	sleep(15);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	Say(ActorNPC.Lavare,"[SC_424964_E]");
	ActorNPC.WaterElement = DW_CreateObjEX("flag",119796,781043,2);
	sleep(25);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	Say(ActorNPC.Lavare,"[SC_424964_F]");
	sleep(25);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	Say(ActorNPC.Bannaite,"[SC_424964_G]");
	CastSpell(ActorNPC.Bannaite,ActorNPC.WaterElement,498510);
	sleep(10)		
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	ActorNPC.MagicCircle = DW_CreateObjEX("obj",119720,ActorNPC.WaterElement);
	sleep(20);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	DelObj(ActorNPC.WaterElement);
	sleep(10);
	ScriptMessage( ActorNPC.MagicCircle, 0, 0, "[SC_424964_K]", C_YELLOW )
	DelObj(ActorNPC.MagicCircle);
	for index,PlayerGUID in pairs(Global_DW_TempPlayerPool[424964]) do
		if	type(index)=="number"	then
			if	CheckID(PlayerGUID)==true	then
				if	CheckAcceptQuest(PlayerGUID,424964)==true	then
					if	CheckDistance(PlayerGUID,ActorNPC.Lavare, 480)	then
						SetFlag(PlayerGUID,545779,1);
						CancelBuff_NoEvent(PlayerGUID,621106);
						CancelBuff_NoEvent(PlayerGUID,620674);
					end
				end
			end
		end
	end
	return ActorNPC;
end

function DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID,IsJustCount,...)
	Global_DW_TempPlayerPool[QuestID] = Global_DW_TempPlayerPool[QuestID] or {};
	IsJustCount = IsJustCount or false;
	local IsAddValue;
	if	(...~=nil)	then
		IsAddValue=true;
	end
	local AudienceNum,ClearClass = 0,0;
	local IsSynchrony = false;
	for index,PlayerGUID in pairs(Global_DW_TempPlayerPool[QuestID]) do
		if	type(index)=="number"	then
			if	IsAddValue==true	then
				local TempQuestID;
				for Initial=1,select("#",...),1 do
					TempQuestID = select(Initial,...);
					if	CheckAcceptQuest(PlayerGUID,TempQuestID)==true	then
						IsSynchrony = true;
					end
				end
			end
			if	CheckID(PlayerGUID)==false	then
				ClearClass =1;
			elseif	CheckDistance(Hoster,PlayerGUID, 480)==false	then
				ClearClass =2;
			elseif	(CheckAcceptQuest(PlayerGUID,QuestID)==false and IsSynchrony==false)	then
				ClearClass =2;
			else
				AudienceNum = AudienceNum + 1;
			end
			if	IsJustCount==false	then
				if	ClearClass ==1	then
					table.remove(Global_DW_TempPlayerPool[QuestID],index)
				elseif	ClearClass ==2	then
					CancelBuff_NoEvent(PlayerGUID,CheckBuffID);
					table.remove(Global_DW_TempPlayerPool[QuestID],index)
				end
				ClearClass = 0
			end
		end
	end
	return AudienceNum;
end

function LuaS_424964_JoinShow(Player)		--Transfer Player to location
	if	Global_DW_TempPlayerPool[424964].EventState==1	then
		AddBuff(Player,621106,0,19);			--Be checked in client script
		table.insert(Global_DW_TempPlayerPool[424964],Player);
		if	Global_DW_TempPlayerPool[424964]["IsChangeType"]==1	then
			AddBuff(Player,620674,0,16)
		end
	end
end

function LuaS_424964_WaitNext(Player)
	--Please wait patiently
	ScriptMessage( Player, Player, 1, "[SC_424964_J]", 0 );--警告訊息：請耐心等候，任務很快就會重置。
end

function LuaS_424964_AfterQuest()
	local Obj = OwnerID();
	Say(Obj,"[SC_424964_H]");
	DisableQuest(Obj,false);
end


--424965 眾志成城

function LuaS_424965_AfterQuest()
	ChangeZone(TargetID(),22,0,-15715.3,880,-24253.4,121.6);
	return true;
end

--424966 掌握情勢

function LuaS_424966_TazPlot()
	local Obj = OwnerID()
	LoadQuestOption(Obj)
	if	CheckAcceptQuest(Obj,424966)==true	then
		AddSpeakOption(Obj,Obj,"[SC_424966_A]","LuaS_424966_ProceedPlot(1)", 0 )
	end
	if	DW_CheckQuestAccept("or",Obj,425104,425124,425144)==true	and
		CheckFlag(Obj,545792)==false	then
		AddSpeakOption(Obj,Obj,"[SC_425104_G]","LuaS_425104_ContextGoing", 0 );
	end
end

function LuaS_424966_LodonsPlot()
	local Obj = OwnerID()
	LoadQuestOption(Obj)
	if	CheckAcceptQuest(Obj,424966)==true	then
		AddSpeakOption(Obj,Obj,"[SC_424966_A]","LuaS_424966_ProceedPlot(2)", 0 )
	end
	if	CheckAcceptQuest(Obj,425397)==true and	
		CountBodyItem( Obj, 241284 )==1 then
		AddSpeakOption( Obj, Obj, GetString("SC_425397_06"), "Z23_Quest425397_03", 0 )
	end
	if	CheckAcceptQuest(Obj,425587)==true and	
		CountBodyItem( Obj, 241284 )==1 then
		AddSpeakOption( Obj, Obj, GetString("SC_425397_06"), "Z23_Quest425397_03", 0 )
	end
	if	CheckAcceptQuest(Obj,425606)==true and	
		CountBodyItem( Obj, 241284 )==1 then
		AddSpeakOption( Obj, Obj, GetString("SC_425397_06"), "Z23_Quest425397_03", 0 )
	end
end

function LuaS_424966_TaleypofPlot()
	local Obj = OwnerID()
	LoadQuestOption(Obj)
	if	CheckAcceptQuest(Obj,424966)==true	then
		if	CheckFlag(Obj,545783)==false	then								--never talk with this NPC
			AddSpeakOption(Obj,Obj,"[SC_424966_A]","LuaS_424966_ProceedPlot(3)", 0 )
		else
			if	CheckFlag(Obj,545782)==false	then
				if	CheckCompleteQuest(Obj,424967)==false	then 				--not yet to help
					LoadQuestOption(Obj)
				else											--havd assist elf 
					AddSpeakOption(Obj,Obj,"[SC_424966_A]","LuaS_424966_ProceedPlot(5)", 0 )
				end
			else												--had complete
				LoadQuestOption(Obj)
			end
		end
	end
end

function LuaS_424966_ProceedPlot(Condition)
	local Obj = OwnerID()
	if	Condition==1	then
		SetSpeakDetail( Obj,"[SC_424966_B]")
		SetFlag(Obj,545780,1)
	elseif	Condition==2	then
		SetSpeakDetail( Obj,"[SC_424966_C]")
		SetFlag(Obj,545781,1)
	elseif	Condition==3	then
		SetSpeakDetail( Obj,"[SC_424966_D]")
		AddSpeakOption(Obj,Obj,"[SC_424966_E]","LuaS_424966_ProceedPlot(4)", 0 )
	elseif	Condition==4	then
		LoadQuestOption(Obj)
		SetFlag(Obj,545783,1)
	elseif	Condition==5	then
		SetSpeakDetail( Obj,"[SC_424966_F]")
		SetFlag(Obj,545782,1)
	end
end

--424967 聖王預言

function LuaS_424967_AfterUse()
	local Obj,Item = OwnerID(),TargetID()
	AddBuff(Obj,621106,0,2)
	local ClientFx = DW_CreateObjEX("obj",119814,Item)		--A limpid ball with client condition, only quest enforcer can see it.
	WriteRoleValue(ClientFx,EM_RoleValue_LiveTime,2)
	SysCastSpellLv(ClientFx,ClientFx,498513,0)
	return true
end


--424968 自告奮勇

function LuaS_119801_Conversation()
	local DisLoad,Obj = false,OwnerID()
	if	CheckAcceptQuest(Obj,424968)==true	and
		CountBodyItem(Obj,240866)==0	then
		SetSpeakDetail( Obj,"[SC_424968_A]")
		AddSpeakOption(Obj,Obj,"[SC_424968_B]","LuaS_424968_Conversation(1)", 0 )
		DisLoad=true
	end
	if	DisLoad==false	then	LoadQuestOption(Obj)	end
end

function LuaS_424968_Conversation(Phase)
	local Obj = OwnerID()
	if	Phase==1	then
		SetSpeakDetail( Obj,"[SC_424968_C]")
		AddSpeakOption(Obj,Obj,"[SC_424968_D]","LuaS_424968_Conversation(2)", 0 )
	elseif	Phase==2	then
		SetSpeakDetail( Obj,"[SC_424968_E]")
		AddSpeakOption(Obj,Obj,"[SC_424968_F]","LuaS_424968_Conversation(3)", 0 )
	elseif	Phase==3	then
		SetSpeakDetail( Obj,"[SC_424968_G]")
		GiveBodyItem(Obj,240866,1)
	end
end

--424969 一鳴驚人

function LuaS_424969_Conversation()
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424969)==true	and
		CheckFlag(Obj,545785)==false		then
		SetSpeakDetail( Obj,"[SC_424969_A]")
		AddSpeakOption(Obj,Obj,"[SC_424969_B]","LuaS_424969_SwitchPlot", 0 );
	else
		LoadQuestOption(Obj);
	end
end

function LuaS_424969_SwitchPlot()
	local Player = OwnerID();
	local Hoster = TargetID();
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[424969]=Global_DW_TempPlayerPool[424969] or {};
	local IsCasting = Global_DW_TempPlayerPool[424969].EventState
	if	IsCasting==nil	then
		local Leader = DW_CreateObjEX("flag",106459,780081,1)
		Global_DW_TempPlayerPool[424969].EventState = 1;
		Global_DW_TempPlayerPool[424969].Leader = Leader;
		CallPlot(Player,"LuaS_424969_SignUp",Player)
		BeginPlot(Hoster,"LuaS_424969_Showing",0);
	elseif	IsCasting~=0	then
		CallPlot(Player,"DW_ChooseOneFromTwo",Player,"[SC_QUESTEXECUTESURE_0]","LuaS_424969_SignUp","LuaS_424964_WaitNext");
	end
	CloseSpeak(Player)
end

function LuaS_424969_Showing()
	local Hoster = OwnerID();
	local QuestID = 424969;
	local Leader = Global_DW_TempPlayerPool[424969].Leader;
	local ActorNPC = {};
	table.insert(ActorNPC,leader);
	ActorNPC = LuaS_424969_Content(ActorNPC,Hoster,Leader);
	--Show if over
	LuaS_424969_EndShow(Leader,ActorNPC);
end

function LuaS_424969_Content(ActorNPC,Hoster,Leader)
	local LeaderPos = { 	X=ReadRoleValue(Leader,EM_RoleValue_X),
				Y=ReadRoleValue(Leader,EM_RoleValue_Y),
				Z=ReadRoleValue(Leader,EM_RoleValue_Z)	}
	local VitualPos = {};
	local  Var= {	Dis = 15, Angle = 0, Dir = ReadRoleValue(Leader,EM_RoleValue_Dir), ATemp = 0 , MathPi = 2*math.Pi,
			Aspect={130,180,230}, FinalFlag = GetMoveFlagCount(780081)-1};
	--Create obj and make them move to right pos.
	for i=1,3,1 do
		Var.ATemp = -1*(Var.Dir+Var.Aspect[i])+360
		ActorNPC[100+i]=DW_CreateObjEX("obj",106460,Leader,0,40);
		WriteRoleValue(ActorNPC[100+i],EM_RoleValue_IsWalk,0);
		AddToPartition(ActorNPC[100+i],0);
		VitualPos[i] = {};
		VitualPos[i].X = LeaderPos.X + Var.Dis*math.cos( Var.ATemp/360*Var.MathPi);
		VitualPos[i].Z = LeaderPos.Z + Var.Dis*math.sin( Var.ATemp/360*Var.MathPi);
		VitualPos[i].Y = GetHeight( VitualPos[i].X , LeaderPos.Y , VitualPos[i].Z);
		MoveToFlagEnabled(ActorNPC[100+i], false);
		MoveDirect( ActorNPC[100+i], VitualPos[i].X , VitualPos[i].Y , VitualPos[i].Z )
	end
	--Cast show about story
	--loop to check move position , and  check about fight target
	Var.TarFlag = 1
	Var.Drama = {	[1]=function(Leader,ActorNPC,LeaderPos,VitualPos,Var)
				Say(Hoster,"[SC_424969_C]");
			end,
			[Var.FinalFlag-1]=function(Leader,ActorNPC,LeaderPos,VitualPos,Var)
				Say(Leader,"[SC_424969_D]");
			end,
			[Var.FinalFlag]=function(Leader,ActorNPC,LeaderPos,VitualPos,Var)
				ScriptMessage( Leader, 0, 2, "[SC_424969_E]", 0 );
				ScriptMessage( Leader, 0, 0, "[SC_424969_E]", C_YELLOW );
				for i=1,4,1 do
					for j=0,1,1 do
						ActorNPC[1000+(i*2-j)]=DW_CreateObjEX("flag",106481+j,780084,i,1,50);
						if	i~=4	then
							SetAttack(ActorNPC[1000+(i*2-j)],ActorNPC[100+i]);
						else
							SetAttack(ActorNPC[1000+(i*2-j)],Leader);
						end
					end
				end
				if	DW_QuestBreakCondition(Leader,0,424969)==0	then	return;	end
				sleep(50)
				ActorNPC.Jill = DW_CreateObjEX("flag",106483,780084,5);
				MoveToFlagEnabled(ActorNPC.Jill, false);
				for i=1,4,1 do
					ActorNPC[2000+i]=DW_CreateObjEX("flag",106460,780084,i,1,50);
					MoveToFlagEnabled(ActorNPC[2000+i], false);
				end
				if	DW_QuestBreakCondition(ActorNPC.Jill,0,424969)==0	then	return;	end
				Yell(ActorNPC.Jill,"[SC_424969_F]",2)
				sleep(20)
				if	DW_QuestBreakCondition(ActorNPC.Jill,0,424969)==0	then	return;	end
				for i=1,8,1 do
					for j=1,3,1 do
						SysCastSpellLv(ActorNPC[1000+i],ActorNPC[100+j],495751,1);
						SysCastSpellLv(ActorNPC[100+j],ActorNPC[1000+j],495751,1);
					end
					for j=1,4,1 do
						SysCastSpellLv(ActorNPC[2000+j],ActorNPC[1000+i],495751,1);
						SysCastSpellLv(ActorNPC[1000+i],ActorNPC[2000+j],495751,1);
					end
					SysCastSpellLv(ActorNPC.Jill,ActorNPC[1000+i],495751,1);
					SysCastSpellLv(Leader,ActorNPC[1000+i],495751,1);
					SysCastSpellLv(ActorNPC[1000+i],ActorNPC.Jill,495751,1);
					SysCastSpellLv(ActorNPC[1000+i],Leader,495751,1);
				end
				sleep(20)
				while	true	do
					if	CheckID(ActorNPC.Jill)==false	or
						ReadRoleValue(ActorNPC.Jill,EM_RoleValue_IsDead)==1	then
						return;
					end
					if	HateListCount(ActorNPC.Jill)==0	then
						Yell(ActorNPC.Jill,"[SC_424969_G]",2)
						for index,PlayerGUID in pairs(Global_DW_TempPlayerPool[424969])	do
							if	type(index)=="number"	then
								if	CheckID(PlayerGUID)==true				and
									CheckAcceptQuest(PlayerGUID,424969)==true		and
									CheckDistance(ActorNPC.Jill,PlayerGUID, 500)			and
									ReadRoleValue(PlayerGUID,EM_RoleValue_IsDead)==0	then
									SetFlag(PlayerGUID,545785,1);
								end
							end
						end
						return;
					end
					if	DW_QuestBreakCondition(ActorNPC.Jill,0,424969)==0	then
						return;
					end
					sleep(10)
				end
			end
					}
	Var.Recording = {	[1]=false,	[Var.FinalFlag-1]=false,	[Var.FinalFlag]=false	};
	while true do
		if	DW_QuestBreakCondition(Leader,0,424969)==0	then
			return ActorNPC;
		end
		if	HateListCount(Leader)==0	and		--off combat
			ReadRoleValue(Leader,EM_RoleValue_AttackTargetID)==0		then
			if	DW_CheckDis(Leader,780081,Var.TarFlag,50)==true	then
				if	Var.Recording[Var.TarFlag]==false	then
					Var.Drama[Var.TarFlag](Leader,ActorNPC,LeaderPos,VitualPos,Var);	--Cast the Drama in that flag
					Var.Recording[Var.TarFlag]=true;					--Show finish, and turn off
				end
				Var.TarFlag = Var.TarFlag +1;
			else
				DW_MoveDirectToFlag( Leader , 780081 , Var.TarFlag );
			end

			--follow plot 
			for i=1,3,1 do
				LuaS_424969_FollowPlot(i,Leader,ActorNPC,LeaderPos,VitualPos,Var);
			end
		end
		if	Var.TarFlag > Var.FinalFlag	then
			return ActorNPC;
		end
		sleep(10);
	end
	--In show, create Jill and army to be actor

end

function LuaS_424969_FollowPlot(i,Leader,ActorNPC,LeaderPos,VitualPos,Var)
	if	HateListCount(ActorNPC[100+i])==0	and
		ReadRoleValue(ActorNPC[100+i],EM_RoleValue_AttackTargetID)==0	then
		LeaderPos.X = ReadRoleValue(Leader,EM_RoleValue_X);
		LeaderPos.Y = ReadRoleValue(Leader,EM_RoleValue_Y);
		LeaderPos.Z = ReadRoleValue(Leader,EM_RoleValue_Z);
		Var.Dir = ReadRoleValue(Leader,EM_RoleValue_Dir);
		Var.ATemp = -1*(Var.Dir+Var.Aspect[i])+360;
		VitualPos[i].X = LeaderPos.X + Var.Dis*math.cos( Var.ATemp/360*Var.MathPi);
		VitualPos[i].Z = LeaderPos.Z + Var.Dis*math.sin( Var.ATemp/360*Var.MathPi);
		VitualPos[i].Y = GetHeight( VitualPos[i].X , LeaderPos.Y , VitualPos[i].Z);
		--if This guy is too far to reach Leader , execute move order to get there.
		if	(VitualPos[i].X-ReadRoleValue(ActorNPC[100+i],EM_RoleValue_X))^2+
			(VitualPos[i].X-ReadRoleValue(ActorNPC[100+i],EM_RoleValue_X))^2>(5^2)	then
			MoveDirect( ActorNPC[100+i], VitualPos[i].X , VitualPos[i].Y , VitualPos[i].Z );
		else
			SetDir( ActorNPC[100+i], Var.Dir )
		end
	end
end

function LuaS_424969_EndShow(Leader,ActorNPC)
	for index,value in pairs(ActorNPC) do
		DelObj(value);
	end
	Global_DW_TempPlayerPool[424969]=nil;
end

function LuaS_424969_SignUp(Player)
	local Leader = Global_DW_TempPlayerPool[424969].Leader
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[424969]=Global_DW_TempPlayerPool[424969] or {};
	table.insert(Global_DW_TempPlayerPool[424969],Player);
	if	Global_DW_TempPlayerPool[424969].EventState~=1	then
		AddBuff(Player,620001,0,2)
		local x = ReadRoleValue(Leader,EM_RoleValue_X);
		local y = ReadRoleValue(Leader,EM_RoleValue_Y);
		local z = ReadRoleValue(Leader,EM_RoleValue_Z);
		ChangeZone(Player,ReadRoleValue(Leader,EM_RoleValue_ZoneID),0,x,y,z,0);
	end
end



--424972 元素領主

function LuaS_424972_Dialog()
	local Obj = OwnerID();
	local Npc = TargetID();
	local IsQuestDone = ( CheckCompleteQuest(Obj,424971) or CheckAcceptQuest(Obj,424971) );
	local OrgID,String;
	if IsQuestDone==true	then
		OrgID = ReadRoleValue(Npc,EM_RoleValue_OrgID);
		if OrgID==119807 then
			if CheckAcceptQuest(Obj,424978)==true then
				LoadQuestOption(Obj);
				return;
			end
		end
		String = "[SC_424972_"..OrgID.."]";
		SetSpeakDetail( Obj,String);
	else
		LoadQuestOption(Obj);
	end
end

function LuaS_424972_Conversation()	--King of Water Dragon
	local Obj,Hoster = OwnerID(),TargetID()
	if	(CheckAcceptQuest(Obj,424972)==false and CheckCompleteQuest(Obj,424972)==false)	then
		SetSpeakDetail( Obj,"[SC_424972_A]");
		return;
	elseif	(CheckAcceptQuest(Obj,424972)==true and CheckFlag(Obj,545786)==false)			then
		SetSpeakDetail( Obj,"[SC_424972_B]");
		AddSpeakOption(Obj,Obj,"[SC_424972_C]","LuaS_424972_SwitchPlot("..Hoster..")", 0 );
		return;
	elseif	CheckAcceptQuest(Obj,424974)==true	then
		if	CheckFlag(Obj,545788)==false	then
			SetSpeakDetail( Obj,"[SC_424974_D]");
			AddSpeakOption(Obj,Obj,"[SC_424974_E]","LuaS_424974_NextStep(2)", 0 )
			return;
		elseif	CheckFlag(Obj,545788)==true	then
			if	CheckFlag(Obj,545789)==true	then
				SetSpeakDetail( Obj,"[SC_424974_G]");
				SetFlag(Obj,545790,1);
				return;
			end
		end
	end
	LoadQuestOption(Obj);
end

function LuaS_424972_SwitchPlot(Hoster)
	local Player = OwnerID()
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[424972]=Global_DW_TempPlayerPool[424972] or {};
	local Obj = OwnerID()
	if	Global_DW_TempPlayerPool[424972].EventState==nil	then
		Global_DW_TempPlayerPool[424972].EventState = 1				--make that "It's show time!"
		LuaS_424972_SignUp(Obj);
		CallPlot(Hoster,"LuaS_424972_Showing",Hoster)
	else
		CallPlot(Player,"DW_ChooseOneFromTwo",Player,"[SC_QUESTEXECUTESURE_0]","LuaS_424972_SignUp","LuaS_424964_WaitNext");
	end
	CloseSpeak(Obj);
end

function LuaS_424972_Showing(Hoster)
	local ActorNPC = {};
	ActorNPC = LuaS_424972_Content(ActorNPC,Hoster);
	--Show if over
	LuaS_424972_EndShow(ActorNPC);
end

function LuaS_424972_Content(ActorNPC,Hoster)
	local CheckBuffID,QuestID = 621108,424972;

	ActorNPC.Lojence = DW_CreateObjEX("obj",119865,Hoster);
	SetModeEx(ActorNPC.Lojence,EM_SetModeType_Move,false) 
	ActorNPC.Maderoth = DW_CreateObjEX("flag",119864,780085,1,0);
	WriteRoleValue(ActorNPC.Maderoth,EM_RoleValue_Y,ReadRoleValue(ActorNPC.Maderoth,EM_RoleValue_Y)+20);
	SetModeEx(ActorNPC.Maderoth,EM_SetModeType_Gravity,false);
	SetModeEx(ActorNPC.Maderoth,EM_SetModeType_Drag,false);
	AddToPartition(ActorNPC.Maderoth,0);
	BeginPlot(ActorNPC.Maderoth,"ic_mansoren_buff",0)
	ScriptMessage( ActorNPC.Lojence, 0 , 2, "[SC_424972_D]", 0 );
	ScriptMessage( ActorNPC.Maderoth, 0 , 2, "[SC_424972_D]", 0 );
	AddBuff(ActorNPC.Maderoth,503604,0,-1);
	AddBuff(ActorNPC.Maderoth,504098,0,-1);
	AddBuff(ActorNPC.Maderoth,508176,50,-1);
	sleep(20);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	ScriptMessage( ActorNPC.Lojence, 0 , 2, "[SC_424972_F]", 0 );
	ScriptMessage( ActorNPC.Maderoth, 0 , 2, "[SC_424972_F]", 0 );
	PlayMotion(ActorNPC.Maderoth,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE);
	sleep(20);
	NPCSAY(ActorNPC.Lojence,"[SC_424972_G]");
	sleep(5);
	--spell time
	PlayMotion(ActorNPC.Lojence,ruFUSION_ACTORSTATE_CAST_INSTANT);
	SysCastSpellLv(ActorNPC.Lojence,ActorNPC.Maderoth,498518,0);
	PlayMotion(ActorNPC.Maderoth,ruFUSION_ACTORSTATE_CAST_INSTANT);
	AddBuff(ActorNPC.Maderoth,502831,0,-1);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	sleep(25);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	ScriptMessage( ActorNPC.Lojence, 0 , 2, "[SC_424972_H]", 0 );
	ScriptMessage( ActorNPC.Maderoth, 0 , 2, "[SC_424972_H]", 0 );
	PlayMotion(ActorNPC.Maderoth,ruFUSION_ACTORSTATE_EMOTE_LAUGH);
	sleep(25);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	ScriptMessage( ActorNPC.Lojence, 0 , 2, "[SC_424972_I]", 0 );
	ScriptMessage( ActorNPC.Maderoth, 0 , 2, "[SC_424972_I]", 0 );
	PlayMotion(ActorNPC.Maderoth,ruFUSION_ACTORSTATE_EMOTE_POINT);
	sleep(30);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	ScriptMessage( ActorNPC.Lojence, 0 , 2, "[SC_424972_J]", 0 );
	ScriptMessage( ActorNPC.Maderoth, 0 , 2, "[SC_424972_J]", 0 );
	PlayMotion(ActorNPC.Maderoth,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD);
	DW_UnFight(ActorNPC.Lojence,false)
	sleep(20);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	ScriptMessage( ActorNPC.Lojence, 0 , 2, "[SC_424972_K]", C_YELLOW );
	ScriptMessage( ActorNPC.Maderoth, 0 , 2, "[SC_424972_K]", C_YELLOW );
	AdjustFaceDir(ActorNPC.Maderoth,ActorNPC.Lojence,0);
	PlayMotion(ActorNPC.Maderoth,ruFUSION_ACTORSTATE_EMOTE_POINT);

	for i=1,3,1 do
		ActorNPC[100+i]=DW_CreateObjEX("flag",106479,780085,i+1);
		AddBuff(ActorNPC[100+i],507898,0,-1);
		SetAttack(ActorNPC[100+i],ActorNPC.Lojence);
	end
	sleep(10);
	if	DW_QuestBreakCondition(Hoster,CheckBuffID,QuestID)==0	then	return	ActorNPC	end
	MoveDirect( ActorNPC.Maderoth, ReadRoleValue(ActorNPC.Maderoth,EM_RoleValue_X)+90 , ReadRoleValue(ActorNPC.Maderoth,EM_RoleValue_Y)+300 , ReadRoleValue(ActorNPC.Maderoth,EM_RoleValue_Z)+90 );
	SetDefIdleMotion(ActorNPC.Maderoth,ruFUSION_MIME_RUN_FORWARD);
	sleep(15)
	AdjustFaceDir(ActorNPC.Lojence,ActorNPC[102],0);
	SysCastSpellLv(ActorNPC.Lojence,ActorNPC[101],498518,1);
	SysCastSpellLv(ActorNPC.Lojence,ActorNPC[103],498518,1);
	CastSpell(ActorNPC.Lojence,ActorNPC[102],498518);
	sleep(5)
	for i=1,3,1 do
		SysCastSpellLv(ActorNPC[100+i],ActorNPC[100+i],492393,1);
		KillID(ActorNPC.Lojence,ActorNPC[100+i]);
	end
	for index,PlayerGUID in pairs(Global_DW_TempPlayerPool[QuestID]) do
		if	type(index)=="number"	then
			if	CheckID(PlayerGUID)==true			and
				CheckAcceptQuest(PlayerGUID,QuestID)==true	and
				CheckDistance(PlayerGUID,ActorNPC.Lojence, 500)==true	and
				ReadRoleValue(PlayerGUID,EM_RoleValue_IsDead)==0	then
				SetFlag(PlayerGUID,545786,1);
				CancelBuff_NoEvent(PlayerGUID,CheckBuffID);
			end
		end
	end
	DelObj(ActorNPC.Maderoth);
	return ActorNPC;
end

function LuaS_424972_SignUp(Player)
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[424972]=Global_DW_TempPlayerPool[424972] or {};
	table.insert(Global_DW_TempPlayerPool[424972],Player);
	AddBuff(Player,621108,0,30);
end

function LuaS_424972_EndShow(ActorNPC)
	for index,value in pairs(ActorNPC) do
		DelObj(value);
	end
	Global_DW_TempPlayerPool[424972]=nil;
end

--424973 永續影響


function LuaS_424973_Conversation()	--Colonel
	local Player,Hoster = OwnerID(),TargetID();
	local IsEventMode = false
	if	DW_CheckQuestAccept("or",Player,424973,424784,425184,425180)==true	and
		CheckFlag(Player,545787)==false		then
		SetSpeakDetail( Player,"[SC_424973_A]");
		AddSpeakOption(Player,Hoster,"[SC_424973_B]","LuaS_424973_NextPlot", 0 );
		IsEventMode = true
	end
	if	CheckAcceptQuest(Player,424974)==true	then
		if	CheckFlag(Player,545789)==false		and
			CheckFlag(Player,545790)==false		then
			if	CheckFlag(Player,545788)==true	then
				SetSpeakDetail( Player,"[SC_424974_A]");
				AddSpeakOption(Player,Hoster,"[SC_424974_B]","LuaS_424974_NextStep(1)", 0 );
				IsEventMode = true;
			end
		end
	end
	if	IsEventMode == false	then
		LoadQuestOption(Player);
	end
end

function LuaS_424973_NextPlot()
	local Player,Hoster = OwnerID(),TargetID();
	SetSpeakDetail( Player,"[SC_424973_C]");
	AddSpeakOption(Player,Player,"[SC_424973_D]","LuaS_424973_SwitchPlot("..Hoster..")", 0 );
end

function LuaS_424973_SwitchPlot(Hoster)
	local Obj = OwnerID()
	CloseSpeak(Obj);
	Global_DW_TempPlayerPool=Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[424973] = Global_DW_TempPlayerPool[424973] or {};
	if	Global_DW_TempPlayerPool[424973].EventState==nil	then
		Global_DW_TempPlayerPool[424973].EventState = 1;				--make that "It's show time!"
		BeginPlot(Hoster,"LuaS_424973_Showing",0);
		LuaS_424973_SignUp(Obj);
	else
		CallPlot(Player,"DW_ChooseOneFromTwo",Player,"[SC_QUESTEXECUTESURE_0]","LuaS_424973_SignUp","LuaS_424964_WaitNext");
	end
end

function LuaS_424973_SignUp(Player)
	AddBuff(Player,620001,0,2);
	Global_DW_TempPlayerPool=Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[424973]=Global_DW_TempPlayerPool[424973] or {};
	table.insert(Global_DW_TempPlayerPool[424973],Player);
	DW_ChangeWithFlag(Player,780087,4,40);	-- Change position of player
	sleep(40);
	ScriptMessage( Player, Player, 0, "[SC_424973_E]", C_YELLOW );
end

function LuaS_424973_Showing()
	local Hoster = OwnerID();
	local ActorNPC = {};
	ActorNPC = LuaS_424973_Content(ActorNPC);
	LuaS_424973_EndShow(ActorNPC);
end


function LuaS_424973_Content(ActorNPC)
	local Var={};
	Var = {
		Time = 24,	CountTime=0,		HardLevel=18		};
	ActorNPC.Lojence = DW_CreateObjEX("flag",106480,780086,1);
	PlayMotionEX(ActorNPC.Lojence, ruFUSION_ACTORSTATE_SLEEP_LOOP ,ruFUSION_ACTORSTATE_SLEEP_LOOP );
	AddBuff(ActorNPC.Lojence,621811,0,-1)
	for i=1,30,1 do
		if	DW_QuestBreakCondition(ActorNPC.Lojence,0,424973,true,424784,425184,425180)>0	then
			break;
		end
		sleep(10);
	end
	for i=1,3,1 do
		ActorNPC[1000+i]=DW_CreateObjEX("flag",106460,780086,i+1,1,30);		--Our company
		ActorNPC[2000+i]=DW_CreateObjEX("flag",106479,780087,i,0,30);		--Enermy
		SetModeEx(ActorNPC[2000+i],EM_SetModeType_Searchenemy,false);
		AddToPartition(ActorNPC[2000+i],0);
		AddBuff(ActorNPC[2000+i],507898,0,-1);
		CallPlot(ActorNPC[2000+i],"DW_MobRandMove_outFight","flag",50,780087,i);	--run around
	end
	Var.Drama = {
			[0]=	function (ActorNPC)
					AddBuff(ActorNPC.Lojence,621107,Var.HardLevel,30);		-- resist 26 times attack.
					sleep(20);
				end,
			[4]=	function (ActorNPC)
					ScriptMessage( ActorNPC.Lojence, ActorNPC.Lojence, 0, "[SC_424973_F]", C_YELLOW );
					for i=1,3,1 do
						SysCastSpellLv(ActorNPC.Lojence,ActorNPC[2000+i],495751,1);
					end
				end,
			[8]=	function (ActorNPC)
					ScriptMessage( ActorNPC.Lojence, ActorNPC.Lojence, 0, "[SC_424973_G]", C_YELLOW );
					for i=1,2,1 do
						ActorNPC[4000+i]=DW_CreateObjEX("flag",106479,780087,i,1,50);
						AddBuff(ActorNPC[4000+i],507898,0,-1);
						SysCastSpellLv(ActorNPC.Lojence,ActorNPC[4000+i],495751,1);
					end
				end,
			[16]=	function (ActorNPC)
					ScriptMessage( ActorNPC.Lojence, ActorNPC.Lojence, 0, "[SC_424973_G]", C_YELLOW );
					for i=1,2,1 do
						ActorNPC[6000+i]=DW_CreateObjEX("flag",106479,780087,i,1,50);
						AddBuff(ActorNPC[6000+i],507898,0,-1);
						SysCastSpellLv(ActorNPC.Lojence,ActorNPC[6000+i],496266,1);
					end
				end
				};
	while	true	do
		if	Var.Drama[Var.CountTime]~=nil	then
			Var.Drama[Var.CountTime](ActorNPC);
		end
		if	Var.CountTime>Var.Time	then
			--show is over, and happy ending.
			SetModeEx(ActorNPC.Lojence,EM_SetModeType_Strikback,false);
			SetModeEx(ActorNPC.Lojence,EM_SetModeType_Move,false);
			ClearHateList(ActorNPC.Lojence,-1);
			CancelBuff_NoEvent(ActorNPC.Lojence,621107);
			CancelBuff_NoEvent(ActorNPC.Lojence,621811);
			PlayMotion(ActorNPC.Lojence,ruFUSION_ACTORSTATE_SLEEP_END);
			sleep(20);
			local TempBall = DW_CreateObjEX("obj",116755,ActorNPC.Lojence);
			WriteRoleValue(TempBall,EM_RoleValue_LiveTime,3)
			CastSpell(TempBall,TempBall,498579);
			CastSpell(ActorNPC.Lojence,TempBall,498579);
			sleep(10)
			for i=1,3,1 do
				if	i~=3	then
					KillID( ActorNPC.Lojence,ActorNPC[2000+i]);
					KillID( ActorNPC.Lojence,ActorNPC[4000+i]);
					KillID( ActorNPC.Lojence,ActorNPC[6000+i]);
				else
					KillID( ActorNPC.Lojence,ActorNPC[2000+i]);
				end
			end
			DW_QuestBreakCondition(ActorNPC.Lojence,0,424973,false,424784,425184,425180);
			for index,PlayerGUID in pairs(Global_DW_TempPlayerPool[424973]) do
				if	CheckID(PlayerGUID)==true				and
					CheckDistance(ActorNPC.Lojence,PlayerGUID, 500)==true	and
					ReadRoleValue(PlayerGUID,EM_RoleValue_IsDead)==0	then
					ScriptMessage( ActorNPC.Lojence, PlayerGUID, 2, "[SC_424973_H]", 0 );
					ScriptMessage( ActorNPC.Lojence, PlayerGUID, 0, "[SC_424973_H]", C_YELLOW );
					SetFlag(PlayerGUID,545787,1);
				end
			end
			sleep(10);
			return ActorNPC;
		end
		if	CheckBuff(ActorNPC.Lojence,621107)==false	then
			ClearHateList(ActorNPC.Lojence,-1);
			CancelBuff_NoEvent(ActorNPC.Lojence,509923);
			CancelBuff_NoEvent(ActorNPC.Lojence,621811);
			PlayMotion(ActorNPC.Lojence,ruFUSION_ACTORSTATE_SLEEP_END);
			sleep(20)
			ScriptMessage( ActorNPC.Lojence, 0, 2, "[SC_424973_I]", 0 );
			ScriptMessage( ActorNPC.Lojence, 0, 0, "[SC_424973_I]", C_YELLOW );
			sleep(20);
			return ActorNPC;
		end
		if	DW_QuestBreakCondition(ActorNPC.Lojence,0,424973,false,424784,425184,425180)==0	then
			return ActorNPC;
		end
		Var.CountTime = Var.CountTime +1
		sleep(10);
	end
end

function LuaS_424973_EndShow(ActorNPC)
	for index,value in pairs(ActorNPC) do
		DelObj(value);
	end
	Global_DW_TempPlayerPool[424973]=nil;
end

function LuaS_424974_NextStep(Phase)
	local Obj = OwnerID();
	if	Phase==1	then	--Colonel's answer
		SetSpeakDetail( Obj,"[SC_424974_C]");
	elseif	Phase==2	then
		SetSpeakDetail( Obj,"[SC_424974_F]");
		SetFlag(Obj,545788,1);
	elseif	Phase==3	then
		SetSpeakDetail( Obj,"[SC_424974_J]");
		SetFlag(Obj,545789,1);
	end
end

function LuaS_424974_Conversation()	--Researcher
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424974)==true		and
		CheckFlag(Obj,545789)==false			then
		if	CheckFlag(Obj,545788)==true	then
			SetSpeakDetail( Obj,"[SC_424974_H]");
			AddSpeakOption(Obj,TargetID(),"[SC_424974_I]","LuaS_424974_NextStep(3)", 0 );
			return;
		end
	end
	LoadQuestOption(Obj);
end