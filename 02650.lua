--誕生之地支線

--425351 克敵制勝
	
function Lua_425351_NPCDead()	--參照02651的Lua_Z23_RageBrigade_AntInitialPlot
	local Ant,Killer = OwnerID(),TargetID();
	local x,y,z,dir=DW_Location(Ant);
	if CheckMapID( x,y,z, 361 )==false and CheckMapID( x,y,z, 362 )==false then
		local Ball=CreateObj(121106,x,y,z,dir,1);
		AddToPartition(Ball,0);
		SetModeEx(Ball,EM_SetModeType_Mark,false);
		DW_UnFight(Ball,true);--將戰鬥相關都關掉
		WriteRoleValue(Ball,EM_RoleValue_LiveTime,40);
		if DW_CheckQuestAccept("or",Killer,425351,425365,425379)==true then
			ScriptMessage( Killer, Killer, 2, "[SC_425351_A]", 0 )--中央訊息121106
		end
	end
	return true;
end

function Lua_425351_UseItemPlot()
	local User,Target = OwnerID(),TargetID();
	local x,y,z,dir=DW_Location(User);
	if CheckMapID(  x,y,z,361) or CheckMapID(  x,y,z,362) then
		ScriptMessage( User, User, 1, "[SC_425351_C]", 0 )--警告訊息：區域錯誤
		return false;
	end
	if DW_CheckQuestAccept("or",User,425351,425365,425379)==true then
		local SearchTable=SearchRangeNPC(User,50)
		local OrgID,IsHaveTarget,Ball
		for SN,GUID in pairs(SearchTable) do
			OrgID=ReadRoleValue(GUID,EM_RoleValue_OrgID);
			if OrgID==121106 then
				Ball=GUID;
				IsHaveTarget=true;
				break
			end
		end
		if IsHaveTarget==true then
			if ReadRoleValue(Ball,EM_RoleValue_Register1)==0 then
				WriteRoleValue(Ball,EM_RoleValue_Register1,User)
				ScriptMessage( User, User, 1, "[SC_425351_B]", C_YELLOW )--成功訊息
				DW_QietKillOne(User,107118);
			else
				ScriptMessage( User, User, 1, "[SC_425351_E]", 0 )--警告訊息：已散
				return false;
			end
		else
			ScriptMessage( User, User, 1, "[SC_425351_D]", 0 )--警告訊息：太遠
			return false;
		end
	end
end

--425354 以藤蔓為防禦之壁
	
function Lua_425354_UseItemPlot()	--209469 復育之籽
	local User = OwnerID();
	if DW_CheckQuestAccept("or",User,425354,425368,425382)==true then
		local SearchTable=SearchRangeNPC(User,100);
		local OrgID,Plant
		for SN,GUID in pairs(SearchTable) do
			OrgID=ReadRoleValue(GUID,EM_RoleValue_OrgID);
			if OrgID==106867 then
				if ReadRoleValue(GUID,EM_RoleValue_HP)<ReadRoleValue(GUID,EM_RoleValue_MaxHP) then
					Plant=GUID;
					break;
				end
			end
		end
		if Plant~=nil then
			table.insert(Z23_RageBrigade_ArchRival,User);
			--MagicInterrupt(User);
			CallPlot(User,"Lua_425354_QuestLoop",Plant); 
			return true;
		else
			ScriptMessage( User, User, 1, "[SC_425354_A]", 0 )--警告訊息：沒有
			return false
		end
	end
end
function Lua_425354_QuestLoop(Plant)
	local Player = OwnerID();
	local SuccessHeal=function(Player)
		ScriptMessage( Player, Player, 1, "[SC_425354_B]", C_YELLOW );--成功
		DW_QietKillOne(Player,107117);
	end
	if CastSpellLV(Player,Plant,499298,29)==false then
		DeBugMSG(0,0,"Cast Falled")
	end
	for Sec=1,5 do
		sleep(10)
		if ReadRoleValue(Plant,EM_RoleValue_HP)>=ReadRoleValue(Plant,EM_RoleValue_MaxHP) then
			SuccessHeal(Player);
			return;
		end
	end
end

--425359 重構防禦
	
function Lua_425359_UseItemPlot()
	local User = OwnerID();
	local SearchTable=SearchRangeNPC(User,100);
	local Reviver
	for SN,GUID in pairs(SearchTable) do
		if ReadRoleValue(GUID,EM_RoleValue_SpellMagicID)==499293 then
			Reviver=GUID;
			MagicInterrupt(GUID);
			WriteRoleValue(Reviver,EM_RoleValue_Register1,1);	--標記可以復活啦
			ScriptMessage( User, User, 1, "[SC_425359_A]", C_YELLOW )--成功
			DW_QietKillOne(User,101499);
			return;
		end
	end
	ScriptMessage( User, User, 1, "[SC_425359_B]", 0 )--失敗
	return false
end

--425360 切斷兵源
	
function Lua_425360_QuestObjInitial()
	local Potal=OwnerID();
	SetPlot(Potal,"dead","Lua_425360_DeadPlot",0)
end

function Lua_425360_DeadPlot()
	local Potal=OwnerID();
	local x,y,z,dir=DW_Location(Potal);
	local Broken=CreateObj(121103,x,y,z,dir,1);
	local Ball=CreateObj(112307,x,y,z,dir,1);
	WriteRoleValue(Potal,EM_RoleValue_Register1,Broken)
	AddToPartition(Broken,0);
	AddToPartition(Ball,0);
	SetModeEx(Ball,EM_SetModeType_Mark,false) 
	SetModeEx(Ball,EM_SetModeType_ShowRoleHead,false) 
	WriteRoleValue(Ball,EM_RoleValue_LiveTime,3)
	SysCastSpellLv(Ball,Ball,499628,1)	--碰!
	CallPlot(Broken,"Lua_425360_WaitRevive",6); 
	DelObj(Potal);
	return false;
end

function Lua_425360_WaitRevive(Sec)
	local Broken = OwnerID()
	local WaitingTime=(Sec-5+DW_Rand(10))
	sleep(WaitingTime*10)
	local x,y,z,dir=DW_Location(Broken);
	local Potal=CreateObj(121102,x,y,z,dir,1);
	AddToPartition(Potal,0);
	DelObj(Broken);
end

function Lua_425360_ClickQuestObj()
	local Player,QuestObj = OwnerID(),TargetID();
	KillID(Player,QuestObj);
	DW_QietKillOne(Player,101299);
	ScriptMessage( Player, Player, 1, "[SC_425360_A]", C_YELLOW )--成功訊息
	return 1;
end

--425363 犧牲者(E級特殊任務)
	
function Lua_425363_AcceptQuest()
	local QuestNPC,Player = OwnerID(),TargetID();
	if DelBodyItem(Player,209472,1) then
		BeginPlot(Player,"Lua_425363_DelayTime",10)
	else
		return false;
	end
	return true;
end

function Lua_425363_DelayTime()
	local Player = OwnerID()
	DW_QietKillOne(Player,106887);
end

function Lua_425363_WatchControl()
	Z23_EClassQuestHack_BP=false;
	local Controller=OwnerID();
	local Duration=1080;	--單位：秒(測試暫定值)
	local SearchTable={};
	local FlagID=781043
	local FlagMax=GetMoveFlagCount(FlagID)-1
	local IsEmpty={};
	for FlagSN=1,FlagMax do
		IsEmpty[FlagSN]=true;
	end
	while true do
		for Sec=0,Duration,1 do
			if Z23_EClassQuestHack_BP==true then
				Z23_EClassQuestHack_BP=false;
				break;
			end
			sleep(10);
		end
		local LocateFlag=0
		while true do
			local TotalPlayer=SetSearchAllPlayer(0);
			for SN=1,TotalPlayer do
				SearchTable[SN]=GetSearchResult();
			end
			local x,y,z,dir,Dis;
			for SN,Player in pairs(SearchTable) do	--剔除非該區域的玩家
				x,y,z,dir=DW_Location(Player);
				if FindMapID(x,y,z)==370 or FindMapID(x,y,z)==372 then
					for FlagSN=1,FlagMax do
						x,y,z,dir=DW_Location(FlagID,FlagSN);
						Dis=DW_GetDistance(Player,x,y,z);
						if Dis<400 then
							Dis=nil;
							IsEmpty[FlagSN]=false;
						end
					end
				end
			end
			for FlagSN=1,FlagMax do
				if IsEmpty[FlagSN]==true then
					LocateFlag=FlagSN;
					if DW_Rand(100)>70 then
						break;
					end
				else
					IsEmpty[FlagSN]=true;
				end
			end
			if LocateFlag~=0 then
				break;
			end
			sleep(100);
		end
		local x,y,z,dir=DW_Location(FlagID,LocateFlag);
		local Dragon=CreateObj(121107,x,y,z,dir,1);
		AddToPartition(Dragon,0);
		local AntTotal=0;
		local AntTeam={};
		for AntSN=1,3 do
			AntTeam[AntSN]=CreateObj(106721,x,y,z,dir,1);
			AddToPartition(AntTeam[AntSN],0);
			MoveToFlagEnabled(AntTeam[AntSN], false);
			CallPlot(AntTeam[AntSN],"LuaFunc_Obj_Suicide",150);--只存在15秒
		end
		local Player=0;
		local AntCombatSate={};
		local RemoveTable={};
		for AntSN=1,3,1 do
			AntCombatSate[AntSN]=false;
			x,y,z,dir=DW_Location(Dragon);
			x,y,z,dir=DW_NewLocation(DW_Rand(360),70,x,y,z,dir);
			Move(AntTeam[AntSN],x,y,z);
		end
		while true do
			for AntSN=1,table.getn(AntTeam) do
				local Ant=AntTeam[AntSN];
				if CheckID(Ant)==true then
					if ReadRoleValue(Ant,EM_RoleValue_IsDead)==0 then
						AntTotal=AntTotal+1;
						if HateListCount(Ant)==0 or ReadRoleValue(Ant,EM_RoleValue_AttackTargetID)==0 then
							AntCombatSate[AntSN]=false;
						else
							AntCombatSate[AntSN]=true;
						end
					else
						table.insert(RemoveTable,AntSN);
					end
				else
					table.insert(RemoveTable,AntSN);
				end
			end
			if AntTotal==0 then
				if CheckID(Player) and ReadRoleValue(Player,EM_RoleValue_IsPlayer)==1 then
					x,y,z,dir=DW_Location(Dragon);
					if DW_GetDistance(Player,x,y,z)<300 then
						ScriptMessage(Dragon,Player,0,"[SC_425363_B]",C_YELLOW);
						ScriptMessage(Dragon,Player,1,"[SC_425363_B]",C_YELLOW);
						GiveBodyItem(Player,209472,1);
					end
				end
				break;
			else
				if RemoveTable[1]~=nil then
					for SN=1,table.getn(RemoveTable),1 do
						table.remove(AntTeam,RemoveTable[SN]);
					end
				end
				RemoveTable={};
				local Num_AntInCombat=0;
				local NumTotalAnt=table.getn(AntTeam);
				for AntSN=1,NumTotalAnt,1 do
					local Ant=AntTeam[AntSN];
					if AntCombatSate[AntSN]==true then
						Num_AntInCombat=Num_AntInCombat+1;
						Player=ReadRoleValue(Ant,EM_RoleValue_AttackTargetID);
					end
				end
				if Num_AntInCombat>0 and Num_AntInCombat~=NumTotalAnt then
					ScriptMessage( Player, Player, 1, "[SC_425363_A]", 0 )--警告
					for AntSN=1,NumTotalAnt,1 do
						if AntCombatSate[AntSN]==false then
							SetAttack(AntTeam[AntSN],Player);
						end
					end
				elseif Num_AntInCombat==0 then
					for AntSN=1,NumTotalAnt,1 do
						if ReadRoleValue(AntTeam[AntSN],EM_RoleValue_NpcOnMove)==0 then
							x,y,z,dir=DW_Location(AntTeam[AntSN]);
							x,y,z,dir=DW_NewLocation(DW_Rand(360),50,x,y,z,dir);
							Move(AntTeam[AntSN],x,y,z);
						end
					end
				end
			end
			AntTotal=0
			sleep(20);
		end
		WriteRoleValue(Dragon,EM_RoleValue_LiveTime,20);
	end
end

function Lua_425363_DeadDragon()
	local Dragon = OwnerID();
	SetDefIdleMotion(Dragon,ruFUSION_MIME_IDLE_DEAD);
end

--血腥戰場
	
function Lua_Z23_BloodyBF_Initial()--戰場初始化
	Lua_Z23_BloodyBF_Clear();
	local BattleSpot=780093;	--蟻和戰士交戰的位置
	Z23_BF_AntTable=nil;
	Z23_BF_AntTable={};
	local Total=GetMoveFlagCount(BattleSpot);
	for SN=1,Total,1 do
		Z23_BF_AntTable[SN]={};
	end

	local TotalNum=GetMoveFlagCount(BattleSpot)-1;
	for i=1,TotalNum do
		local x,y,z,dir=DW_Location(BattleSpot,i);
		local Ball=Lua_Z23_BloodyBF_NewBall(x,y,z,dir);
		WriteRoleValue(Ball,EM_RoleValue_Register+8,BattleSpot);
		WriteRoleValue(Ball,EM_RoleValue_Register+9,i);
		BeginPlot(Ball,"Lua_Z23_BloodyBF_FirstCreate",0);
	end
	
	local x,y,z,dir=DW_Location(BattleSpot,1);--搬運蟻
	local Ball=Lua_Z23_BloodyBF_NewBall(x,y,z,dir);
	BeginPlot(Ball,"Lua_425308_CreateAnt",0);

	sleep(60);
	local Ball=Lua_Z23_BloodyBF_NewBall(x,y,z,dir);--搬運蟻2
	BeginPlot(Ball,"Lua_425308_CreateAnt",0);
end

function Lua_Z23_BloodyBF_Clear()--清除戰場
	local BloodyBF_ClearList={}
	table.insert(BloodyBF_ClearList,114040);
	local Ant={106774,106775};
	for SN,OrgID in pairs(Ant) do
		table.insert(BloodyBF_ClearList,OrgID);
	end
	local Fighter={106776,106777,106778,106779,106780,106781};
	for SN,OrgID in pairs(Fighter) do
		table.insert(BloodyBF_ClearList,OrgID);
	end
	Lua_DavisDelObj(BloodyBF_ClearList);
end

function Lua_Z23_BloodyBF_FirstCreate()--首次產生，同時生螞蟻和聯盟戰士
	local Fighter=Lua_Z23_BloodyBF_CreateFighter();
	local Ant=Lua_Z23_BloodyBF_CreateAnt();
	SetAttack(Ant,Fighter);
end

function Lua_Z23_BloodyBF_NewBall(x,y,z,dir)--無感隱形球產生
	local Source=OwnerID();
	local RoomID;
	if CheckID(Source)==true then
		RoomID=ReadRoleValue(Source,EM_RoleValue_RoomID);
	else
		RoomID=0;
	end
	local Ball=CreateObj(114040,x,y,z,dir,1);
	SetModeEx(Ball,EM_SetModeType_Mark,false);
	SetModeEx(Ball,EM_SetModeType_Show,false);
	SetModeEx(Ball,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(Ball,EM_SetModeType_HideName,false);
	AddToPartition(Ball,RoomID);
	return Ball;
end

function Lua_Z23_BloodyBF_Identify(ID)--確認編號種類
	local Target_OrgID=ReadRoleValue(ID,EM_RoleValue_OrgID);
	local Ant={106774,106775};	--螞蟻種類
	local Fighter={106776,106777,106778,106779,106780,106781};	--聯盟戰士種類
	for SN,OrgID in pairs(Ant) do
		if Target_OrgID==OrgID then
			return "Ant";
		end
	end
	for SN,OrgID in pairs(Fighter) do
		if Target_OrgID==OrgID then
			return "Fighter";
		end
	end
	return "Other";
end

function Lua_Z23_BloodyBF_CreateAnt(WaitingTime)--生螞蟻
	if WaitingTime~=nil then
		sleep(WaitingTime);
	end
	local Ball=OwnerID();
	local AntType={106774,106775};	--螞蟻種類
	local BattleSpot=ReadRoleValue(Ball,EM_RoleValue_Register+8);
	local SN=ReadRoleValue(Ball,EM_RoleValue_Register+9);
	local x,y,z,dir=DW_Location(Ball);
	local Ant,Fighter=CreateObj(AntType[DW_Rand(#AntType)],x,y,z,dir,1),Z23_BF_AntTable[SN]["Fighter"];
	AddToPartition(Ant,0);
	Z23_BF_AntTable[SN]["Ant"]=Ant;--註冊
	AddBuff(Ant,502707,0,-1);--停止回血
	WriteRoleValue(Ant,EM_RoleValue_Register+8,BattleSpot);
	WriteRoleValue(Ant,EM_RoleValue_Register+9,SN);
	SetFlag(Ant,544801,1);
	LockHP(Ant,1,"Lua_Z23_BloodyBF_AntDead");
	WriteRoleValue(Ball,EM_RoleValue_LiveTime,3);
	--配對建立仇恨
	if Fighter~=nil then
		SysCastSpellLv(Fighter,Ant,499110,1);
	end
	return Ant;
end
function Lua_Z23_BloodyBF_AntDead()--螞蟻死亡劇情
	local Ant,Killer = OwnerID(),TargetID();
	LockHP(Ant,-100,"");
	local BattleSpot=ReadRoleValue(Ant,EM_RoleValue_Register+8);
	local SN=ReadRoleValue(Ant,EM_RoleValue_Register+9);
	if SN~=0 then
		Z23_BF_AntTable[SN]["Ant"]=nil;
	end
	local x,y,z,dir=DW_Location(BattleSpot,SN);
	if BattleSpot~=0 then
		local Ball
		Ball=Lua_Z23_BloodyBF_NewBall(x+Lua_RandLoc(60),y,z+Lua_RandLoc(60),dir);
		WriteRoleValue(Ball,EM_RoleValue_Register+8,BattleSpot);
		WriteRoleValue(Ball,EM_RoleValue_Register+9,SN);
		CallPlot(Ball,"Lua_Z23_BloodyBF_CreateAnt",50);
	end
	Lua_PG_CancelAntBuff();--Peggy噴上氣味的function
	local IsFighterHere,FirstPlayer=false;
	local RetreatFlag,Soldier=780091;
	for Pos=0,HateListCount(Ant) do
		local GUID=HateListInfo(Ant,Pos ,EM_HateListInfoType_GItemID);
		if FirstPlayer==nil then
			if ReadRoleValue(GUID,EM_RoleValue_IsPlayer)==1 then
				FirstPlayer=GUID;
			end
		end
		if Soldier==nil then
			if Lua_Z23_BloodyBF_Identify(GUID)=="Fighter" then
				IsFighterHere=true;
				Soldier=GUID;
			end
		end
	end
	if FirstPlayer~=nil then
		DW_QietKillOne(FirstPlayer,101242);--殺死戰場上的庫勒奇蟻
		DW_QietKillOne(FirstPlayer,106860);--激勵士兵
		if IsFighterHere==true then
			DW_QietKillOne(FirstPlayer,101243);--救出聯盟戰士
			if HateListCount(Soldier)==1 then
				CallPlot(Soldier,"Lua_425316_SoldierRetreat", Soldier ,RetreatFlag,FirstPlayer);
			end
		end
	end
	KillID(Killer,Ant);
end

function Lua_Z23_BloodyBF_CreateFighter(WaitingTime)--生聯盟戰士
	if WaitingTime~=nil then
		sleep(WaitingTime);
	end
	local Ball=OwnerID();
	local FighterType={106776,106777,106778,106779,106780,106781};	--聯盟戰士種類
	local BattleSpot=ReadRoleValue(Ball,EM_RoleValue_Register+8);
	local SN=ReadRoleValue(Ball,EM_RoleValue_Register+9);
	local x,y,z,dir=DW_Location(Ball);
	local Fighter,Ant=CreateObj(FighterType[DW_Rand(#FighterType)],x,y,z,dir,1),Z23_BF_AntTable[SN]["Ant"];
	AddToPartition(Fighter,0);
	Z23_BF_AntTable[SN]["Fighter"]=Fighter;--註冊
	AddBuff(Fighter,502707,0,-1);--停止回血
	SetDefIdleMotion(Fighter,ruFUSION_MIME_IDLE_COMBAT_1H);
	WriteRoleValue(Fighter,EM_RoleValue_Register+8,BattleSpot);
	WriteRoleValue(Fighter,EM_RoleValue_Register+9,SN);
	SetFlag(Fighter,544801,1);
	LockHP(Fighter,1,"Lua_Z23_BloodyBF_FighterDead");
	WriteRoleValue(Ball,EM_RoleValue_LiveTime,3);
	--配對建立仇恨
	if Ant~=nil then
		for Pos=0,HateListCount(Ant)-1,1 do
			local ID=HateListInfo(Ant,Pos , EM_HateListInfoType_GItemID);
			if ReadRoleValue(ID,EM_RoleValue_IsPlayer)==1 then
				break;
			end
			if Pos==HateListCount(Ant)-1 then
				ClearHateList(Ant,-1);
			end
		end
		SysCastSpellLv(Ant,Fighter,499110,1);
		SetAttack(Ant,Fighter);
	end
	return Fighter;
end
function Lua_Z23_BloodyBF_FighterDead()--聯盟戰士死亡劇情
	local Fighter,Killer = OwnerID(),TargetID();
	LockHP(Fighter,-100,"");
	local BattleSpot=ReadRoleValue(Fighter,EM_RoleValue_Register+8);
	local SN=ReadRoleValue(Fighter,EM_RoleValue_Register+9);
	if SN~=0 then
		Z23_BF_AntTable[SN]["Fighter"]=nil;
	end
	local x,y,z,dir=DW_Location(BattleSpot,SN);
	local Ball=Lua_Z23_BloodyBF_NewBall(x,y,z,dir);
	WriteRoleValue(Ball,EM_RoleValue_Register+8,BattleSpot);
	WriteRoleValue(Ball,EM_RoleValue_Register+9,SN);
	CallPlot(Ball,"Lua_Z23_BloodyBF_CreateFighter",50);
	if Fighter==Killer then
		DelObj(Fighter);
	else
		KillID(Killer,Fighter);
	end
end

--425308 陣亡者的尊嚴
	
function Lua_425308_CreateAnt()--種出搬屍螞蟻
	local CorpsePocision=780094;--屍體旁會有一隻旗標
	local RandPocision=DW_Rand(GetMoveFlagCount(CorpsePocision)-1)
	local x,y,z,dir=DW_Location(CorpsePocision,RandPocision);
	local Ant=CreateObj(106728,x,y,z,dir,1);
	AddToPartition(Ant,0);
	WriteRoleValue(Ant,EM_RoleValue_IsWalk,0);
	Hide(Ant);
	sleep(10);
	Show(Ant,0)
	MoveToFlagEnabled(Ant, false);
	LockHP(Ant,1,"Lua_425308_AntDead");
	CallPlot(Ant,"Lua_425308_CarryMotion",120498);--搬運動作
	BeginPlot(Ant,"Lua_425308_GotoEnd",20);--前往目標
	DelObj(OwnerID());
end

function Lua_425308_CarryMotion(CorpseOrgID)--搬運動作
	local Ant=OwnerID();
	local x,y,z,dir=DW_Location(Ant);
	local Corpse=CreateObj(CorpseOrgID,x,y,z,dir,1);
	SetDefIdleMotion(Corpse,ruFUSION_MIME_IDLE_DEAD);
	PlayMotionEX(Corpse, ruFUSION_ACTORSTATE_DEAD , ruFUSION_ACTORSTATE_DEAD);
	AddToPartition(Corpse,0);
	DW_UnFight(Corpse,true);
	SetModeEx(Corpse,EM_SetModeType_Mark,false);
	SetModeEx(Corpse,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(Corpse,EM_SetModeType_HideName,true);
	MoveToFlagEnabled(Corpse,false);
	BeginPlot(Corpse,"Lua_425308_CorpseAssurance",0);
	sleep(10);
	WriteRoleValue(Ant,EM_RoleValue_Register10,Corpse);
	WriteRoleValue(Ant,EM_RoleValue_Register2,CorpseOrgID);
	AttachObj( Corpse , Ant ,4 ,"p_left_foot","p_left_weapon");
	SetDir( Corpse, dir+95 );
	AddBuff(Ant,622690,0,-1);
	SetDefIdleMotion(Ant,ruFUSION_MIME_CARRY_LOOP);
end
function Lua_425308_BuffDismiss(State)--Buff消失觸發
	local Ant=OwnerID();
	local Corpse=ReadRoleValue(Ant,EM_RoleValue_Register10);
	CancelBuff_NoEvent(Ant,622690);
	SetDefIdleMotion(Ant,ruFUSION_MIME_IDLE_STAND);
	if State=="Drop" then--指定不進行後續處理
		DetachObj(Corpse);
		DelObj(Corpse);
		return;
	end
	if CheckID(Corpse) then
		DetachObj(Corpse);
		BeginPlot(Corpse,"Lua_425308_WaitRecarry",0)--等待重新撿起
	end
end
function Lua_425308_WaitRecarry()--等待重新撿起
	local Ant,Corpse=TargetID(),OwnerID();
	while true do
		if CheckID(Ant)==false or ReadRoleValue(Ant,EM_RoleValue_IsDead)==1 then
			DelObj(Corpse);
		end
		if HateListCount(Ant)==0 and ReadRoleValue(Ant,EM_RoleValue_NpcOnMove)==0 then
			local x,y,z,dir=DW_Location(Corpse);
			local WaitingTime=Move(Ant,x,y,z);
			sleep(WaitingTime)
			StopMove(Ant,false);
			CallPlot(Ant,"Lua_425308_CarryMotion",ReadRoleValue(Ant,EM_RoleValue_Register2)); --搬運動作
			if ReadRoleValue(Corpse,EM_RoleValue_OrgID)==120498 then
				BeginPlot(Ant,"Lua_425308_GotoEnd",20);--前往目標
			end
			DelObj(Corpse);
		end
		sleep(10);
	end
end
function Lua_425308_CorpseAssurance()--屍體必定消失的保險迴圈
	local Corpse,Ant=OwnerID(),TargetID();
	while true do
		if CheckID(Ant)==false or ReadRoleValue(Ant,EM_RoleValue_IsDead)==1 then
			DelObj(Corpse);
		end
		sleep(20);
	end
end
function Lua_425308_GotoEnd()--前往目標
	local Ant=OwnerID();
	local BattleSpot=780093;	--蟻和戰士交戰的位置
	local Corpse=ReadRoleValue(Ant,EM_RoleValue_Register1);
	local Total=GetMoveFlagCount(780093)-1;
	ReCalculate(Ant);
	local x,y,z,dir=DW_Location(BattleSpot,Total);
	local WaitingTime=math.floor(Move(Ant,x+50,y,z+50)/10);
	for i=1,WaitingTime+1 do
		if HateListCount(Ant)~=0 then
			return;
		else
			dir=ReadRoleValue(Ant,EM_RoleValue_Dir);
			SetDir( Corpse, dir+95 );
		end
		sleep(10);
	end
	StopMove(Ant,false);
	Lua_425308_BuffDismiss()--Buff消失觸發
	Lua_425308_AntDead()--搬屍螞蟻的死亡劇情;
	DelObj(Ant);
end
function Lua_425308_AntDead()--搬屍螞蟻的死亡劇情
	local Killer,Ant=TargetID(),OwnerID();
	LockHP(Ant,-100,"");
	Global_BloodyBF_CarryAnt=nil;
	local x,y,z,dir=DW_Location(Ant);
	local Ball=Lua_Z23_BloodyBF_NewBall(x,y,z,dir);
	BeginPlot(Ball,"Lua_425308_CreateAnt",0);
	local IsFighterHere,FirstPlayer=false;
	local RetreatFlag,Soldier=780091;
	local HateTotal=HateListCount(Ant);
	if HateTotal~=0 then
		for Pos=0,HateTotal-1 do
			local GUID=HateListInfo(Ant,Pos ,EM_HateListInfoType_GItemID);
			if FirstPlayer==nil then
				if ReadRoleValue(GUID,EM_RoleValue_IsPlayer)==1 then
					FirstPlayer=GUID
				end
			end
			if IsFighterHere==false then
				if Lua_Z23_BloodyBF_Identify(GUID)=="Fighter" then
					IsFighterHere=true;
					Soldier=GUID;
				end
			end
		end
		if FirstPlayer~=nil then
			if IsFighterHere==true then
				DW_QietKillOne(FirstPlayer,101243);--救出聯盟戰士
				if DW_CheckQuestAccept("or",FirstPlayer,425316,425330,425344)==true then
					CallPlot(Soldier,"Lua_425316_SoldierRetreat", Soldier ,RetreatFlag,FirstPlayer);
				end
			end
			DW_QietKillOne(FirstPlayer,101242);--殺死戰場上的庫勒奇蟻
			DW_QietKillOne(FirstPlayer,101244);--殺死搬運屍體的螞蟻
			DW_QietKillOne(FirstPlayer,106860);--激勵士兵
		end
		KillID(Killer,Ant);
	else
		DelObj(Ant);
	end

end
--425329 密集性打擊
	
function Lua_425315_BuffTrigger()--Buff定時觸發
	local Player=OwnerID();
	if DW_CheckQuestAccept("or",Player,425315,425343,425329)==false then	--沒任何相關任務
		CancelBuff(Player,622305);
	end
end
function Lua_425315_BuffCancel()--Buff消失時觸發
	local Player = OwnerID()
	DeleteQuest(Player,425315);
	DeleteQuest(Player,425343);
	DeleteQuest(Player,425329);
	ScriptMessage( Player, Player, 0, "[SC_425315_B]", C_YELLOW )--失敗訊息
	ScriptMessage( Player, Player, 1, "[SC_425315_B]", C_YELLOW )--失敗訊息
end
function Lua_425315_AcceptQuest()--接取任務時觸發
	local QuestNPC,Player = OwnerID(),TargetID();
	if CheckBuff(Player,622305)==false then
		AddBuff(Player,622305,0,-1);--依模版設定
		ScriptMessage( QuestNPC, Player, 1, "[SC_425315_A]", C_YELLOW );--警告訊息：計時開始
		ScriptMessage( QuestNPC, Player, 0, "[SC_425315_A]", C_YELLOW );--警告訊息：計時開始
	end
	return true;
end
function Lua_425315_CompleteQuest(OpenFlag,CloseFlag,PEScore)--完成任務時
	local QuestNPC,Player = OwnerID(),TargetID();
	CancelBuff_NoEvent(Player,622305);
	if OpenFlag~=nil then
		DW_CycleQuestEnd(OpenFlag,CloseFlag);--循環任務的flag給予
	end
	if PEScore~=nil then
		Lua_ZonePE_3th_GetScore(PEScore);--公眾任務的積分
	end
	return true;
end
--425316 保持戰力的手段
	
function Lua_425316_SoldierRetreat(Soldier,RetreatFlag,FirstPlayer)--戰士撤退&執行死亡劇情(視同死亡
	DW_UnFight(Soldier,true);
	SetStopAttack(Soldier);
	ClearHateList(Soldier,-1)
	sleep(10);
	while ReadRoleValue(Soldier,EM_RoleValue_NpcOnMove)==1 do
		sleep(10);
	end
	AdjustFaceDir(Soldier,FirstPlayer,0);
	NPCSay(Soldier,"[SC_Z23_Q425294_01]");--謝謝你的支援，自己小心一點........
	PlayMotion(Soldier,ruFUSION_ACTORSTATE_EMOTE_SALUTE);
	sleep(30);
	local x,y,z,dir=DW_Location(RetreatFlag,4);--這旗子在生死之界裡
	Move(Soldier,x,y,z);
	WriteRoleValue(Soldier,EM_RoleValue_LiveTime,3);
	BeginPlot(Soldier,"Lua_Z23_BloodyBF_FighterDead",0);
end
--425320 庫勒奇蟻襲擊的真相？(E級特殊任務)
	
function Lua_425320_EClassQuestHack()--E級任務的後門測試，立刻生怪
	Z23_EClassQuestHack_BF=true;
	Z23_EClassQuestHack_BP=true;
end
function Lua_425320_WatchControl()--中控器劇情
	Z23_EClassQuestHack_BF=false;
	local Controller=OwnerID();
	local Duration=1080;	--單位：秒
	local SearchTable={};
	local FlagID=780300;--預計出現監護者的位置
	local FlagMax=GetMoveFlagCount(FlagID)-1
	local IsEmpty={};
	for i=1,FlagMax do
		IsEmpty[i]=true;
	end
	while true do
		for Sec=0,Duration,1 do
			if Z23_EClassQuestHack_BF==true then
				Z23_EClassQuestHack_BF=false;
				break;
			end
			sleep(10);
		end
		local LocateFlag=0
		while true do
			local TotalPlayer=SetSearchAllPlayer(0);
			for i=1,TotalPlayer do
				SearchTable[i]=GetSearchResult()
			end
			local x,y,z,dir
			local Dis
			for SN,Player in pairs(SearchTable) do	--剔除非該區域的玩家
				x,y,z,dir=DW_Location(Player);
				if FindMapID(x,y,z)==353 then
					for FlagSN=1,FlagMax do
						x,y,z,dir=DW_Location(FlagID,FlagSN);
						Dis=DW_GetDistance(Player,x,y,z);
						if Dis<400 then
							Dis=nil;
							IsEmpty[FlagSN]=false;
						end
					end
				end
			end
			for FlagSN=1,FlagMax do
				if IsEmpty[FlagSN]==true then
					LocateFlag=FlagSN;
					break;
				else
					IsEmpty[FlagSN]=true;
				end
			end
			if LocateFlag~=0 then
				break;
			end
			sleep(20)
		end
		local x,y,z,dir=DW_Location(FlagID,LocateFlag);
		local Gardian=CreateObj(106874,x,y,z,dir,1);
		AddToPartition(Gardian,0);
		LockHP( Gardian , 1 , "lua_cantbekilled_1" )
		MoveToFlagEnabled(Gardian, false);
		CallPlot(Gardian,"LuaFunc_Obj_Suicide",150);
		local Player=0;
		local IsSurvival=1;
		local WarmingPlayer=function (Gardian)
			local Player
			for Pos=0,HateListCount(Gardian)-1,1 do
				local ID=HateListInfo(Gardian,Pos , EM_HateListInfoType_GItemID);
				if ReadRoleValue(ID,EM_RoleValue_IsPlayer)==1 then
					player=ID;
					break;
				end
			end
			if Player==nil or Player==0 then
				player=0;
			else
				ScriptMessage( Player, Player, 1, "[SC_425320_A]", 0 )--警告
			end
			return Player;
		end
		while true do
			if CheckID(Gardian)==true then
				if ReadRoleValue(Gardian,EM_RoleValue_IsDead)==0 then
				--	if ReadRoleValue(Gardian,EM_RoleValue_NpcOnMove)==0 then
						if HateListCount(Gardian)==0 then
							Move(Gardian,x-70+DW_Rand(140),y,z-70+DW_Rand(140));
							Player=0;
						else
							if Player==0 then
								Player=WarmingPlayer(Gardian);
							else
								if CheckID(Player)==false then
									Player=WarmingPlayer(Gardian);
								else
									if CheckDistance(Player,Gardian,300)==false or
										ReadRoleValue(Player,EM_RoleValue_Y)>900 then
										Player=0;
									end

								end
							end
						end
				--		DebugMsg(0,0,"step2")
				--	end
				else
					IsSurvival=0;
				end
			else
				IsSurvival=0;
			end
			--DebugMsg(0,0,"Player="..Player)
			--DebugMsg(0,0,"IsSurvival="..IsSurvival)
			if IsSurvival==0 and Player~=0 then

				ScriptMessage(Gardian,Player,2,"[SC_425320_B]",0);
				ScriptMessage(Gardian,Player,0,"[SC_425320_B]",C_YELLOW);
				GiveBodyItem(Player,209467,1)
				break;
			elseif IsSurvival==0 then
				break;
			end
			sleep(10)
		end
	end
end

function Lua_425320_AcceptQuest()--接受任務後給旗標刪物品
	local QuestNPC,Player = OwnerID(),TargetID();
	if DelBodyItem(Player,209467,1) then
		BeginPlot(Player,"Lua_425320_DelayTime",10)
	else
		return false;
	end
	return true;
end

function Lua_425320_DelayTime()
	local Player = OwnerID()
	DW_QietKillOne(Player,107202);
end
--地怒突擊營的劇情
	
function Lua_RageBrigade_MovingNote(FlagID,FlagNum)--在旗子處產生隱形球，並有觸碰劇情
	local x,y,z,dir=DW_Location(FlagID,FlagNum);
	local MarkID;
	if FlagID==780089 then
		MarkID=120609;
	else
		MarkID=120610;
	end
	local Box=CreateObj(MarkID,x,y,z,dir,1);
	AddToPartition(Box,0);
	SetPlot(Box,"touch","Lua_RageBrigade_NoteWord",100)
	SetCursorType(Box,eCursor_inspect);
	return Box;
end
function Lua_RageBrigade_NoteWord()--告訴觸碰者文字
	local Toucher,Box = OwnerID(),TargetID();
	ScriptMessage(Toucher,Toucher,1,"[SC_RAGE_BRIGADE_A]",C_YELLOW);
end
function Lua_RageBrigade_AttackDrama(MaleElf,FemaleElf,Teleporter)--從準備位置到戰鬥位置的表演
	NPCSay(FemaleElf,"[SC_RAGE_BRIGADE_B]")--看來時機成熟了......
	sleep(20);
	NPCSay(MaleElf,"[SC_RAGE_BRIGADE_C]")--那麼我們就給那些虛假的石頭一點顏色瞧瞧吧！
	sleep(30)
	NPCSay(FemaleElf,"[SC_RAGE_BRIGADE_D]")--艾力克的朋友，麻煩你了！
	sleep(20)
	NPCSay(Teleporter,"[SC_RAGE_BRIGADE_E]")--沒問題，深深吸口氣吧......
end
function Lua_RageBrigade_RetreatDrama(DragonGuard,MaleElf,FemaleElf,Teleporter)--從戰鬥位置到準備位置的表演
	NPCSay(DragonGuard,"[SC_RAGE_BRIGADE_F]")--[119111]，我建議先暫時撤離吧，再這樣下去太危險了！
	sleep(25);
	NPCSay(MaleElf,"[SC_RAGE_BRIGADE_G]")--可惡，如果能再多一點時間......
	sleep(25)
	NPCSay(FemaleElf,"[SC_RAGE_BRIGADE_H]")--不要冒險，我們總是還有機會的！
	sleep(20)
	NPCSay(Teleporter,"[SC_RAGE_BRIGADE_I]")--那我就動手傳送了！
end
function Lua_RageBrigade_Prepare(FemaleElf,ElfGuard)--剛到準備位置的表演
	NPCSay(FemaleElf,"[SC_RAGE_BRIGADE_J]")--打起精神！我們要儘快組織再次的突擊！
	sleep(20)
	for GuardSN=1,#ElfGuard do
		NPCSay(ElfGuard[GuardSN],"[SC_RAGE_BRIGADE_K]");--是！
	end
end
function Lua_RageBrigade_Attack(DragonGuard,MaleElf)--剛到攻擊位置的表演
	NPCSay(MaleElf,"[SC_RAGE_BRIGADE_L]")--讓我們來大鬧一場吧！
	sleep(20)
	NPCSay(DragonGuard,"[SC_RAGE_BRIGADE_M]")--我隨時都能出發
end
function lua_cantbekilled_1()
	BeginPlot(OwnerID(),"lua_cantbekilled_2",20)
end
function lua_cantbekilled_2()
	LockHP( OwnerID() , -100 , "" )
end