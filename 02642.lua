

--425110 空襲警報
	
function LuaS_425110_ControlCenter()
	local Obj = OwnerID();
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[425110] = Global_DW_TempPlayerPool[425110] or {};
	Global_DW_TempPlayerPool[425110].Hoster = Obj;
	sleep(10);
	Global_DW_TempPlayerPool[425110].Ball = {};
	local NPCList = SearchRangeNPC ( Obj , 200 );
	for i=0,table.getn(NPCList),1 do
		local OrgID = ReadRoleValue(NPCList[i],EM_RoleValue_OrgID);
		if	OrgID == 120074	then
			local Index = ReadRoleValue(NPCList[i],EM_RoleValue_PID);
			Global_DW_TempPlayerPool[425110].Ball[Index]=NPCList[i];
		end
	end
	Global_DW_TempPlayerPool[425110].Progress = "Ready";
	local WarmSystem = Global_DW_TempPlayerPool[425110].Ball;
	local TheOne = 0;
	while true do
		sleep(20);
		local PlayerList = SearchRangePlayer ( Obj , 250 );
		if	table.getn(PlayerList)~=0	then
			TheOne = DW_Rand(table.getn(WarmSystem));
			if	Global_DW_TempPlayerPool[425110].Progress=="Ready"	then
				AddBuff(WarmSystem[TheOne],621709,0,-1);
				Global_DW_TempPlayerPool[425110].Progress = "Buffed";
				BeginPlot(WarmSystem[TheOne],"LuaS_425110_FunImprove",0)
			end
		end
	end
end

function LuaS_425110_FunImprove()
	local Obj = OwnerID()
	local IsBuffed,Number;
	CancelBuff(Obj,621814);
end

function LuaS_425110_Guard()
	local Obj = OwnerID();
	WriteRoleValue(Obj,EM_RoleValue_IsWalk,0);
	local InitialPos = ReadRoleValue(Obj,EM_RoleValue_PID);
	MoveToFlagEnabled(OwnerID(), false);
	local StringTable = {	"[SC_425110_1]","[SC_425110_2]","[SC_425110_3]","[SC_425110_4]",
				"[SC_425110_5]","[SC_425110_6]","[SC_425110_7]","[SC_425110_8]"	}
	sleep(20);
	local Hoster = Global_DW_TempPlayerPool[425110].Hoster;
	local FlagNum
	while	true	do
		FlagNum = InitialPos;
		while FlagNum<=InitialPos+1 do
			for i=InitialPos,InitialPos+1,1 do
				local TempID = Global_DW_TempPlayerPool[425110].Ball[i];
				local IsBuffed = CheckBuff(TempID,621709);
				if	IsBuffed==true	then
					while	(type(DW_Move("flag",Obj,780092 , i,10))~="number")	do
						sleep(5);
					end
					IsBuffed = CheckBuff(TempID,621709);
					if	IsBuffed==true	then
						AdjustFaceDir(Obj,TempID,0);
						sleep(5);
						IsBuffed = CheckBuff(TempID,621709);
						if	IsBuffed==true	then
							Global_DW_TempPlayerPool[425110].Progress="Execute"
							local String = "[SC_425110_A][$SETVAR1="..StringTable[i].."]";
							SetPlot(TempID,"touch","",0);
							LuaS_425110_TouchPlot(TempID,Obj);
						end
					end
					FlagNum = i;
					break
				end
			end
			FlagNum  = FlagNum + 1
		end
		sleep(10)
	end
end

function LuaS_425110_InitialPlot()
	local Obj = OwnerID();
	SetPlot(Obj,"touch","LuaS_425110_SwitchPlot",10)
end

function LuaS_425110_SwitchPlot()
	local Obj = OwnerID();
	local IsBuffed = CheckBuff(TargetID(),621709);
	local IsOwnQuest = DW_CheckQuestAccept("or",Obj,425110,425130,425150);
	local IsAllowCast = (ReadRoleValue(Obj,EM_RoleValue_Coldown_All )==0)
	if	(IsBuffed==true) and (IsOwnQuest==true) and (IsAllowCast==true)then
		Global_DW_TempPlayerPool[425110].Progress="Execute";
		SetPlot(TargetID(),"touch","",0);
		CallPlot(TargetID(),"LuaS_425110_TouchPlot",TargetID(),OwnerID());
	else
		ScriptMessage( Obj, Obj, 1, "[SC_425110_F]", 0 );
	end
end


function LuaS_425110_TouchPlot(Obj,Member)
	CancelBuff_NoEvent(Member,621814);
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID);
	local StringTable = {	"[SC_425110_1]","[SC_425110_2]","[SC_425110_3]","[SC_425110_4]",
				"[SC_425110_5]","[SC_425110_6]","[SC_425110_7]","[SC_425110_8]"	}
	local String = "[SC_425110_G]".."[SC_425110_A][$SETVAR1="..StringTable[PID].."]";
	CastSpell(Member,Obj,499268);
	local IsBuffMaked,IsReset,IsMine = false,false,false
	while	true	do
		IsBuffMaked = CheckBuff(Obj,621814);
		IsMine = CheckBuff(Member,621814);
		if	(IsBuffMaked==true)and(IsMine==true)	then
			break;
		end
		sleep(5);
		IsBuffMaked = CheckBuff(Obj,621814);
		IsMine = CheckBuff(Member,621814);
		if	(IsBuffMaked==true)and(IsMine==true)	then
			break;
		end
		if	CheckID(Member)==false	then
			IsReset = true;
		end
		if	ReadRoleValue(Member,EM_RoleValue_SpellMagicID)~=499268	then
			IsReset = true;
		end
		if	CheckBuff(Obj,621709)==false	then
			IsReset = true;
		end
		if	CheckBuff(Member,622220)==true	or	CheckBuff(Member,622221)==true	then
			IsReset = true;
		end
		if	IsReset==true	then
			--Set any plot back
			SetPlot(Obj,"touch","LuaS_425110_SwitchPlot",10);
			CancelBuff_NoEvent(Member,621814);
			return false;
		end
	end
	CancelBuff_NoEvent(Obj,621709);
	CancelBuff_NoEvent(Member,621814);
	CancelBuff(Obj,621814);
	if	ReadRoleValue(Member,EM_RoleValue_IsPlayer)==1	then
		String = "[SC_425110_A][$SETVAR1="..StringTable[PID].."]";
		NPCSay(Member,String);
		DW_QietKillOne(Member,106502);
	else
		local PlayerList = SearchRangePlayer ( OwnerID() , 120 );
		local SPlayerID
		for i=0,table.getn(PlayerList),1 do
			SPlayerID = PlayerList[i]
			if	DW_CheckQuestAccept("or",SPlayerID,425110,425130,425150)==true	and
				CheckBuff(SPlayerID,621815)==false	then
				ScriptMessage( SPlayerID, SPlayerID, 2, "[SC_425110_H]", C_RED );
				AddBuff(SPlayerID,621815,0,30);
			end
		end
		ScriptMessage( Obj, 0, 1, String, C_YELLOW );
		PlayMotion(Member,ruFUSION_ACTORSTATE_EMOTE_SALUTE);
		sleep(20)
	end
	sleep(5);
	String = "[SC_425110_A][$SETVAR1="..StringTable[PID].."]";
	LuaS_425110_DefendManeuver(String);
	SetPlot(Obj,"touch","LuaS_425110_SwitchPlot",10);
	Global_DW_TempPlayerPool[425110].Progress = "Ready";
	return true
end

function LuaS_425110_LockSpecific()
	local Tar = TargetID();
	local IsCourier = (ReadRoleValue(Tar,EM_RoleValue_OrgID)==119949);
	if	IsCourier==false	then
		return false;
	else
		MagicInterrupt(Tar);
	end
end

function LuaS_425110_SignAlter()
	local Obj = OwnerID();
	local Tar = TargetID();
	if	CheckBuff(Tar,621709)==false	then
		return false
	else
		AddBuff(Obj,621814,0,-1);
		return AddBuff(Tar,621814,0,-1);
	end
end

function LuaS_425110_DefendManeuver(String)
	local Dragon = Global_DW_TempPlayerPool[425110].Dragon;
	local DragonStatus = Global_DW_TempPlayerPool[425110].DragonStatus;
	local Hoster = Global_DW_TempPlayerPool[425110].Hoster;
	local IfWaiting
	local MotionType = DW_Rand(3)
	if	MotionType==1	then
		PlayMotion(Hoster,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD);
	elseif	MotionType==2	then
		PlayMotion(Hoster,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE);
	else
		PlayMotion(Hoster,ruFUSION_ACTORSTATE_EMOTE_SPEAK);
	end
	while	true	do
		sleep(5);
		DragonStatus = Global_DW_TempPlayerPool[425110].DragonStatus;
		if	DragonStatus =="Landing"	then
			if	IfWaiting~=true	then
				sleep(15);
				NPCSay(Hoster,"[SC_425110_B]");
				PlayMotion(Hoster,ruFUSION_ACTORSTATE_EMOTE_POINT);
				IfWaiting=true;
				sleep(20);
			end
		elseif	DragonStatus =="OnGround"	then
		--check dragon if landing
			NPCSay(Hoster,String);
			sleep(20);
			NPCSay(Hoster,"[SC_425110_C]");
			PlayMotion(Hoster,ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
			MoveToFlagEnabled(Dragon, true);
			DragonStatus = "Flying";
			sleep(20);
			return;
		else
			if	DW_Rand(2)==1	then
				ScriptMessage( Hoster, 0, 1, "[SC_425110_D]", C_YELLOW );
			else
				ScriptMessage( Hoster, 0, 1, "[SC_425110_E]", C_YELLOW );
			end
			sleep(20)
			return;
		end
	end
end

function LuaS_425110_DragonInitial()
	Global_DW_TempPlayerPool = Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[425110] = Global_DW_TempPlayerPool[425110] or {};
	local Obj = OwnerID();
	Global_DW_TempPlayerPool[425110].Dragon = Obj;
	Global_DW_TempPlayerPool[425110].DragonStatus = "OnGround";
	DW_Dragon_Initial();
end

function LuaS_425110_DragonUp()
	Global_DW_TempPlayerPool[425110].DragonStatus = "Flying";
	DW_Dragon_TakeOff();
end

function LuaS_425110_DragonLanding()
	Global_DW_TempPlayerPool[425110].DragonStatus = "Landing";
	DW_Dragon_HeavyRiseOrDown();
end

function LuaS_425110_DragonDown()
	DW_Dragon_Landing();
	Global_DW_TempPlayerPool[425110].DragonStatus = "OnGround";
	MoveToFlagEnabled(OwnerID(),false);
end

--425111 生命種子
	
function LuaS_425111_CheckToClick()
	local Obj = OwnerID();
	local IsOwnItem = (CountBodyItem(Obj,240906)>0);
	if	IsOwnItem==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425111_A]", 0 );
		return false;
	end
	return true;
end

function LuaS_425111_PlotAfterClick()
	local Obj = OwnerID();
	local Earth = TargetID();
	local Tree = DW_CreateObjEX("obj",119948,Earth);
	WriteRoleValue(Tree,EM_RoleValue_LiveTime,60);
	DW_QietKillOne(Obj,106503);
	DelBodyItem(Obj,240906,1);
	return true;
end




--425112 適可而止
	
function LuaS_425112_UseToCheck()
	local Obj = OwnerID();
	local IsOwnQuest = DW_CheckQuestAccept("or",Obj,425112,425132,425152);
	if	IsOwnQuest==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_A]", 0 );
		return false;
	end
	local IsNear = DW_CheckMap(Obj,214);
	if	IsNear==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425112_A]", 0 );
		return false;
	end
end

function LuaS_425112_Execute()
	local Obj = OwnerID();
	local NPCList = SearchRangeNPC ( Obj , 50 );
	for i=0,table.getn(NPCList),1 do
		local Temp = NPCList[i];
		local OrgID = ReadRoleValue(Temp,EM_RoleValue_OrgID);
		if	(OrgID==120058 or OrgID ==120059) and (CheckBuff(Temp,621750)==false)	then
			local IsBuffed = (ReadRoleValue(Temp,EM_RoleValue_PID)~=0);
			if	IsBuffed==false	then
				local RN = DW_Rand(100);
				WriteRoleValue(Temp,EM_RoleValue_PID,Obj);
				if	RN<83	then
					AddBuff(Temp,621711,0,-1); 
					ScriptMessage( Obj, Obj, 0, "[SC_425112_C]", 0 );
				else
					AddBuff(Temp,621710,0,10);
					ScriptMessage( Obj, Obj, 0, "[SC_425112_B]", 0 );
				end
				return true;
			end
		end
		if	i==table.getn(NPCList)	then
			ScriptMessage( Obj, Obj, 1, "[SC_425112_G]", 0 );
			return true;
		end
	end
end

function LuaS_425112_SpeakPlot()
	local Obj = TargetID();
	local PPL = OwnerID();
	LoadQuestOption(PPL);
	local IsBuffed,PID
	IsBuffed = CheckBuff(Obj,621710) or CheckBuff(Obj,621711);
	PID = ReadRoleValue(Obj,EM_RoleValue_PID);
	if	PID==PPL	then
		if	IsBuffed==true	then
			if	CheckBuff(Obj,621711)	then
				AddSpeakOption(PPL,PPL,"[SC_425112_E]","LuaS_425112_Processing(621711)", 0 );
			else
				AddSpeakOption(PPL,PPL,"[SC_425112_D]","LuaS_425112_Processing(621710)", 0 );
			end
		else
			WriteRoleValue(Obj,EM_RoleValue_PID,0);
		end
	end
	local IsOwnQuest = DW_CheckQuestAccept("or",PPL,425113,425133,425153);
	if	IsOwnQuest == true	then
		if	CountBodyItem(PPL,240908)>0	then
			IsBuffed = CheckBuff(Obj,621712);
			if	IsBuffed==false	then
				AddSpeakOption(PPL,PPL,"[SC_425113_A]","LuaS_425113_Processing", 0 );
			end
		end
	end
end


function LuaS_425112_Processing(BuffID)
	local Obj = OwnerID();
	CloseSpeak(Obj);
	local Worker = TargetID();
	local IsBuffed,PID
	IsBuffed = CheckBuff(Worker,621710) or CheckBuff(Worker,621711);
	PID = ReadRoleValue(Worker,EM_RoleValue_PID);
	if	PID==Obj	then
		if	IsBuffed==true	then
			AddBuff(Worker,621750,0,180);
			CancelBuff_NoEvent(Worker,BuffID);
			WriteRoleValue(Worker,EM_RoleValue_PID,0);
			ScriptMessage( Worker, Obj, 0, "[SC_425112_F]", 0 );
			DW_QietKillOne(Obj,106504);
		end
	end
end

function LuaS_425112_Initial()
	local Obj = OwnerID();
	local IsBuffed,PID
	while true do
		IsBuffed = CheckBuff(Obj,621710) or CheckBuff(Obj,621711);
		PID = ReadRoleValue(Obj,EM_RoleValue_PID);
		if	PID~=0 and IsBuffed==false	then
			WriteRoleValue(Obj,EM_RoleValue_PID,0);
		end
		sleep(10);
	end
end

--425113 祝福之水
	


function LuaS_425113_Processing()
	local Obj = OwnerID();
	CloseSpeak(Obj);
	if	(CountBodyItem(Obj,240908)>0)and(CheckBuff(TargetID(),621712)==false)	then
		if	CountBodyItem(Obj,240909)<20	then
			AddBuff(TargetID(),621712,0,70);
			DelBodyItem(Obj,240908,1);
			GiveBodyItem(Obj,240909,1);
			NPCSay(TargetID(),"[SC_425113_B]");
		end
	else	
		ScriptMessage( Obj, Obj, 1 , "[SC_425113_C]", 0 );
	end
end

--425114 營地安全
	
function LuaS_425114_CheckToUse()
	local Obj = OwnerID();
	local Tar = TargetID();
	local IsOwnQuest = DW_CheckQuestAccept("or",Obj,425114,425134,425154);
	if	IsOwnQuest==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_A]", 0 );--警告訊息：你沒有相關任務
		return false;
	end
	local IsLive = (ReadRoleValue(Obj,EM_RoleValue_IsDead)==0);
	if	IsLive==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425114_B]", 0 );--警告訊息：死亡狀態下無法使用！
		return false;
	end
	local IsTarLive = ( ReadRoleValue(Tar,EM_RoleValue_IsDead)==0);
	if	IsTarLive==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_422565_2]", 0 )--警告訊息：目標已死亡
		return false;
	end
	local OrgID = ReadRoleValue(Tar,EM_RoleValue_OrgID)
	local IsRightType = (OrgID==106463);
	if	IsRightType==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_204592_1]", 0 );--警告訊息：目標不正確
		return false;
	end
	local IsNear = CheckDistance(Obj,Tar, 250);
	if	IsNear==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425109_A]", 0 );--警告訊息：你需要再靠近一點！
		return false;
	end
	local IsBuffed = CheckBuff(Tar,621108);
	if	IsBuffed==true	then
		ScriptMessage( Obj, Obj, 1, "[SC_204592_1]", 0 );--警告訊息：目標不正確
		return false;
	end
	local HP = ReadRoleValue(Tar,EM_RoleValue_HP);
	local MaxHP = ReadRoleValue(Tar,EM_RoleValue_MaxHP);
	if	HP>=MaxHP	then
		ScriptMessage( Obj, Obj, 1, "[SC_425114_A]", 0 );
		return false;
	end
	return true;
end

function LuaS_425114_Execute()
	local Obj = OwnerID();
	local Tar = TargetID();
	AddBuff(Tar,621108,0,-1);
	DW_QietKillOne(Obj,106505);
	BeginPlot(Tar,"LuaS_425114_SwitchPlot",0)
	return true;
end

function LuaS_425114_SwitchPlot()
	local Obj = OwnerID();
	local Tar = TargetID();
	DW_UnFight(Obj,true);
	SetStopAttack(Obj);
	SetStopAttack(Tar);
	ClearHateList(Obj,-1);
	MoveToFlagEnabled(OwnerID(), false);
	DW_MoveDirectToFlag( Obj , 780094 , 1 );
	sleep(30)
	MoveToFlagEnabled(Tar, true);
	DW_UnFight(Obj,false);
	CallPlot(Obj,"LuaFunc_ResetObj",Obj); 
end

--425115 困獸之鬥
	
function LuaS_425115_AfterClickPlot()
	local Obj = OwnerID();
	local Tar = TargetID();
	local IsOwnItem = (CountBodyItem(Obj,240911)>0);
	if	IsOwnItem==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425115_A]", 0 );
		return false;
	end
	return true;
end

--425116 下一次會更好
	


--425117 畫地為牢
	
function LuaS_425117_Behavior()
	local Plant  = OwnerID();
	William_GiveFlag544801()				--no mouse
	AddBuff(Plant,502707,0,-1);				--stop restore
	AddBuff(Plant,621110,0,-1)
	SetModeEx(Plant,EM_SetModeType_Strikback,false);
	SetModeEx(Plant,EM_SetModeType_Searchenemy,false);
	SetPlot(Plant,"dead","LuaS_425117_DeadPlot",0)
	local Var = {};
	Var.AttackedSituation = false;
	Var.RestTime = 15;
	Var.CountTime = 0
	Var.UpdateTime = 0;
	Var.HP = ReadRoleValue(Plant,EM_RoleValue_MaxHP);
	local TempHP = 0
	local IsMobExist,IsMobDead
	while	true	do
		TempHP = ReadRoleValue(Plant,EM_RoleValue_HP);
		if	CheckBuff(Plant,621110)==true	then
			Var.UpdateTime = 0;
			if	Var.CountTime>Var.RestTime	then
				Var.Monster = Lua_CreateObjByDir( Plant , 106479 , 100+DW_Rand(100) , 0);
				AddToPartition(Var.Monster,0);
				SetAttack(Var.Monster,Plant);
				Var.CountTime = -1;
			end
			Var.CountTime = Var.CountTime + 1;
		else
			Var.CountTime = 0;
			if	Var.HP<=TempHP	then
				if	Var.Monster~=nil	then
					IsMobExist = CheckID(Var.Monster);
					if	IsMobExist==true	then
						IsMobDead = (ReadRoleValue(Var.Monster,EM_RoleValue_IsDead)==1);
						if	IsMobDead==true	then
							AddBuff(Plant,621110,0,-1);
						end
					end
				end
				Var.UpdateTime = Var.UpdateTime + 1
			else
				Var.UpdateTime = 0;
			end
			if	Var.UpdateTime>=4	then
				AddBuff(Plant,621110,0,-1);
			end
			Var.HP = TempHP;
		end
		sleep(15);
	end
end


function LuaS_425117_DeadPlot()
	local Plant = OwnerID();
	local Ball = DW_CreateObjEX("obj",119875,Plant);
	Lua_ObjDontTouch( Ball );
	SysCastSpellLv(Ball,Ball,492608,1);
	WriteRoleValue(Ball,EM_RoleValue_LiveTime,2);

	local OrgID;
	local MonsterTable =  SearchRangeNPC ( Plant , 100 );
	for i=0,table.getn(MonsterTable),1 do
		OrgID = ReadRoleValue(MonsterTable[i],EM_RoleValue_OrgID);
		if	OrgID==106479	then
			KillID(Plant,MonsterTable[i]);
		end
		if	OrgID>=106498	and
			OrgID<=106500	then
			AddBuff(MonsterTable[i],621111,0,15)
		end
	end
	ScriptMessage( Plant, 0, 0, "[SC_425117_A]", C_YELLOW );
end


function LuaS_425117_CheckToUse()
	local Obj = OwnerID();
	local Tar = TargetID();

	local IsOwnQuest = DW_CheckQuestAccept("or",Obj,425117,425137,425157);
	if	IsOwnQuest==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425105_A]", 0 )--警告訊息：你沒有相關的任務！
		return false;
	end
	local OrgID = ReadRoleValue(Tar,EM_RoleValue_OrgID);
	local IsRightTar = ( OrgID==120138 or OrgID==120139 or OrgID==120140 );
	if	IsRightTar==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425117_D]", 0 )--警告訊息：物品使用失敗
		return false;
	end

	local IsNear = CheckDistance(Obj,Tar, 40);
	if	IsNear==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425109_A]", 0 );--警告訊息：你需要再靠近一點！
		return false
	end
	local IsOutFighting = CheckBuff(Tar,621110);
	if	IsOutFighting==false	then
		ScriptMessage( Obj, Obj, 1, "[SC_425117_C]", 0 )--警告訊息：這株守護者樹藤正在遭受攻擊！
		return false;
	end

	local IsBuffed = CheckBuff(Tar,621093);
	if	IsBuffed==true	then
		ScriptMessage( Obj, Obj, 1, "[SC_425117_D]", 0 );--警告訊息：物品使用失敗
		return false
	end

	return true;
end

function LuaS_425117_AfterClickPlot()
	local Obj = OwnerID();
	local Tar = TargetID();

	AddBuff(Tar,621093,0,90);
	AddBuff(Tar,621111,0,15);

	DW_QietKillOne(Obj,106506);
	ScriptMessage( Obj, Obj, 1, "[SC_425117_E]", C_YELLOW );
	return true;
end


--425118 自食其力
	

function LuaS_425118_InitialSetting()
	local Obj = OwnerID();
	SetPlot(Obj,"dead","LuaS_425118_DeadPlot",0);
	local OrgID=ReadRoleValue(Obj,EM_RoleValue_OrgID);
	if	OrgID==106461 or OrgID==106462	then
		Z22killedbuff_01();
	elseif	OrgID==106391	then
		Lua_ying_Q424874_reset();
	end
end

function LuaS_425118_DeadPlot()
	local Obj = OwnerID();
	local Tar = TargetID();
	local ArrivalQuestAsk = (CountBodyItem(Tar,240967)>=10);
	if	ArrivalQuestAsk==false	then
		GiveBodyItem(Tar,240967,1);
		NPCSay(Tar,"[SC_425118_A]")
	end
	return true;
end


--佈置劇情
	
function LuaS_DW_PlacementIn22_A()--法陣火焰
	local Obj = OwnerID();
	SysCastSpellLv(Obj,Obj,494422,0);
end

function LuaS_DW_PlacementIn22_B()--守衛
	local Obj = OwnerID();
	SetDefIdleMotion(Obj,ruFUSION_MIME_IDLE_COMBAT_1H);
end


function LuaS_DW_PlacementIn22_C()
	local Obj = OwnerID();
	local Mob = Lua_CreateObjByDir( Obj , 106479 , 90 , 0);
	AddToPartition(Mob,ReadRoleValue(Obj,EM_RoleValue_RoomID));
	SetModeEx(Obj,EM_SetModeType_Move,false)
	SetAttack(Mob,Obj);
	BeginPlot(Mob,"LuaS_DW_PlacementIn22_D",0)
	sleep(20)
	SetModeEx(Obj,EM_SetModeType_Move,true)
end

function LuaS_DW_PlacementIn22_D()
	local Obj = OwnerID();
	local AtTar = ReadRoleValue(Obj,EM_RoleValue_AttackTargetID);
	while	not (HateListCount(Obj)==0 and AtTar==0)	do
		sleep(10);
	end
	DelObj(Obj);
end

function LuaS_DW_PlacementIn22_E()
	LuaP_SittingChair();
	Lua_DW_ClearMyWeapan();
end

function LuaS_DW_PlacementIn22_F()
	LuaP_Sitting();
	Lua_DW_ClearMyWeapan();
end


function LuaS_DW_PlacementIn22_G()
	WriteRoleValue(TargetID(),EM_RoleValue_MoveDelay ,25);
end

function LuaS_Z22_CityPortal_Speak()
	local Obj = OwnerID();
	local PID = ReadRoleValue(TargetID(),EM_RoleValue_PID);
	LoadQuestOption(Obj);
	local ZoneString = {
				"[ZONE_COMMAND_CENTER]",		--指揮中心
				"[SC_ZONE22_CAMPTRANS]",		--物流中心+鍛造區
				"[ZONE_SQUARE]",			--廣場區
				"[SC_ZONE22_CAMPPORTAL]",		--入口
				"[ZONE_LOGGING_AREA]",		--伐木區
				}
	local OriginString = "[SC_TRANSTO]"
	local String
	for i=1,table.getn(ZoneString),1 do
		if	i~=PID	then
			String = OriginString..ZoneString[i]
			AddSpeakOption(Obj,Obj,String,"LuaS_Z22_CityPortal_Convey("..i..")", 0 )
		end
	end
end

function LuaS_Z22_CityPortal_Convey(SortCode)
	local Obj = OwnerID();
	CloseSpeak(Obj);
	local XYZ = {
			{-16319.5,880,-23685,6},
			{-17193.6,750,-24476.4,70.6 },
			{-17676.3,560,-23561.3,175.5},
			{-18673.0,440,-23634.8,208.3},
			{-18411.4,510,-24270.6,325.3},
				}
	ChangeZone(Obj,22,0,XYZ[SortCode][1],XYZ[SortCode][2],XYZ[SortCode][3],XYZ[SortCode][4]);
end


function LuaS_119947_ChatPlot()
	local Obj = OwnerID();
	LoadQuestOption(Obj);
	AddSpeakOption(Obj,Obj,"[SC_119947_A]","LuaS_119947_NextPlot(1)", 0 )
end

function LuaS_119947_NextPlot(Step)
	local Obj = OwnerID();
	if	Step == 1	then
		SetSpeakDetail( Obj,"[SC_119947_B]");
		AddSpeakOption(Obj,Obj,"[SC_119947_C]","LuaS_119947_NextPlot(2)", 0 );
		AddSpeakOption(Obj,Obj,"[SC_119947_E]","LuaS_119947_NextPlot(3)", 0 );
	elseif	Step ==2	then
		SetSpeakDetail( Obj,"[SC_119947_D]")
		AddSpeakOption(Obj,Obj,"[SC_119947_E]","LuaS_119947_NextPlot(3)", 0 );
	elseif	Step ==3	then
		SetSpeakDetail( Obj,"[SC_119947_F]");
		AddSpeakOption(Obj,Obj,"[SC_119947_G]","LuaS_119947_NextPlot(4)", 0 )
		AddSpeakOption(Obj,Obj,"[SC_119947_J]","LuaS_119947_NextPlot(5)", 0 )
	elseif	Step ==4	then
		SetSpeakDetail( Obj,"[SC_119947_H]");
		AddSpeakOption(Obj,Obj,"[SC_119947_I]","LuaS_119947_ChatPlot", 0 )
	elseif	Step ==5	then
		SetSpeakDetail( Obj,"[SC_119947_K]");
		AddSpeakOption(Obj,Obj,"[SC_119947_L]","LuaS_119947_NextPlot(4)", 0 )
	end
	return true;
end

function LuaS_119868_ChatPlot()
	local Obj = OwnerID();
	LoadQuestOption(Obj);
	AddSpeakOption(Obj,Obj,"[SC_119868_A]","LuaS_119868_NextPlot(1)", 0 )
end

function LuaS_119868_NextPlot(State)
	local Obj = OwnerID();
	if	State==1	then
		SetSpeakDetail( Obj,"[SC_119868_B]");
		AddSpeakOption(Obj,Obj,"[SC_119868_C]","LuaS_119868_NextPlot(2)", 0 );
	elseif	State==2	then
		SetSpeakDetail( Obj,"[SC_119868_D]");
		AddSpeakOption(Obj,Obj,"[SC_119868_E]","LuaS_119868_NextPlot(3)", 0 );
	elseif	State==3	then
		SetSpeakDetail( Obj,"[SC_119868_F]");
		AddSpeakOption(Obj,Obj,"[SC_119868_G]","LuaS_119868_NextPlot(4)", 0 );
	elseif	State==4	then
		CloseSpeak(Obj);
	end
end