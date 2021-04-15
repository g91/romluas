function LuaQ_425069_icon()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 425069 , 1 ) )
	ShowBorder( OwnerID(),425069, str,"ScriptBorder_Texture_Paper" )
end

function LuaQ_425080_icon()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 425080 , 1 ) )
	ShowBorder( OwnerID(),425080, str,"ScriptBorder_Texture_Paper" )
end

function LuaQ_425068_Box()	--箱子的觸碰劇情
	local OID = OwnerID()
	local TID = TargetID()
	SetCursorType( OID , 13)
	SetPlot(OID,"touch","LuaQ_425068_Touch",30)
end

function LuaQ_425068_Touch()
	local OID = OwnerID()
	local TID = TargetID()
	if CheckAcceptQuest(OID,425068)==true and
		CheckFlag(OID,546162)==true and 
		CheckFlag(OID,546146)==false and
		ReadRoleValue(TID,EM_RoleValue_Register9)==0  then
			WriteRoleValue(TID,EM_RoleValue_Register9,9)
--		CallPlot(TID,"LuaQ_425068_Touched",TID,OID)
		if 	BeginCastBarEvent( OID, TID,"[SC_VALENTINE_2011_FN05]", 30, 148, 150, 0, "LuaQ_425068_Touched" ) ~= 1 then
				ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( OID, OID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	else 
		ScriptMessage( OID, OID, 0,"[SYS_GAMEMSGEVENT_422]", 0 )			--使用條件不符
		return
	end
end

function LuaQ_425068_Touched(ObjID, CheckStatus)
	local OID = OwnerID()
	local TID = TargetID()
	local OROOMID = ReadRoleValue(OID,EM_RoleValue_RoomID)
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then	
			WriteRoleValue(TID,EM_RoleValue_Register9,0)
			SetFlag(OID,546163,1)
			local badguy = CreateObj(106632,-2451,1311,2118,228.7,1)
			AddToPartition( badguy,OROOMID  ) 
			SetAttack(badguy,OID)
			EndCastBar( OID, CheckStatus )
		else
			WriteRoleValue(TID,EM_RoleValue_Register9,0)
			EndCastBar( OID, CheckStatus )
		end

	end
end

function LuaQ_425068_Checkfight()
	local Npc = OwnerID()
	while true do
		if  CheckID(Npc)~=0 or CheckID(Npc)~=nil then
			if HateListCount( Npc) == 0   then
			DelObj(Npc)
			end
		end
		sleep(30)
	end	
end

function LuaQ_425068_Death()
	local monsterlist= {}
	monsterlist = DW_HateRemain( 0 )
	for i=1,table.getn(monsterlist) do
		if CheckAcceptQuest(monsterlist[i],425068) == true then
			SetFlag(monsterlist[i],546146,1)
			SetFlag(monsterlist[i],546147,1)
		end
	end
end

function LuaQ_425072_CTRL()
	local Ctrl = OwnerID()
	local PROOM = ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local Ptable = {}
	local hammer
	local pliers
	local times = 0
	local num = 0
	while true do
		Sleep(20)
		Ptable = SearchRangePlayer(Ctrl,120)
		if times == 0 then
			for i=0,table.getn(Ptable) do
				CancelBuff(Ptable[i],621978)
			end
			if checkID(pliers)==true then
				DelObj(pliers)
			end
			hammer = CreateObj(120241,-364.0,1634.8,316.9,250.0,1)
			AddToPartition(hammer,PROOM)
			NPCSAY(Ctrl,"[SC_425072_0]")
			Sleep(20)
			NPCSAY(Ctrl,"[SC_425072_1]")
			times = times+1
		elseif times == 1 then
			for i=0,table.getn(Ptable) do
				CancelBuff(Ptable[i],621977)
			end
			if  checkID(hammer)==true then
				DelObj(hammer)
			end
			pliers = CreateObj(120242,-364.0,1634.8,316.9,250.0,1)
			AddToPartition(pliers,PROOM)
			NPCSAY(Ctrl,"[SC_425072_2]")
			Sleep(20)
			NPCSAY(Ctrl,"[SC_425072_3]")
			times = 0
		end
		Sleep(100)
	end
end

function LuaQ_425072_TOOL_0()
	SetPlot(OwnerID(),"touch","LuaQ_425072_TOOL_1",20)
end

function LuaQ_425072_TOOL_1()
	local OID = OwnerID()
	local TID = TargetID()

	DW_CancelTypeBuff(68,OID)

	if CheckAcceptQuest(OID,425072)==true then
		WriteRoleValue(TID,EM_RoleValue_Register9,9)
		if BeginCastBarEvent(OID,TID,"[SC_REPAIR_0]",20,135,136,0,"LuaQ_425072_TOOL_2")~=1 then
				ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( OID, OID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	else
		ScriptMessage( OID, OID, 0,"[SYS_GAMEMSGEVENT_422]", 0 )		--使用條件不符
		return
	end
end

function LuaQ_425072_TOOL_2(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
	EndCastBar( player, CheckStatus )
	WriteRoleValue(NPC,EM_RoleValue_Register9,0)
		Sleep(10)
		if( CheckStatus ~= 0 ) then
			if (CheckStatus > 0) then
				--ScriptMessage( player, player, 1,"[SC_COOKING_02]", 0 );
				if ReadRoleValue(NPC,EM_RoleValue_OrgID) == 120243 then
					DW_QietKillOne(0,106650)
				elseif ReadRoleValue(NPC,EM_RoleValue_OrgID) == 120388 then
					DW_QietKillOne(0,106651)
				end
			else
				--ScriptMessage( player, player, 1,"[SC_COOKING_04]", 0 );
				EndCastBar( player, CheckStatus )
			end

		end
end

function LuaQ_425072_COMPLETE()
	local TID = TargetID()
	CancelBuff(TID,621977)
	CancelBuff(TID,621978)
end


function LuaQ_425073_Ctrl_Main()	--危機四伏
	SetPlot(OwnerID(),"range","LuaQ_425073_Ctrl_Range",100)
end

function LuaQ_425073_Ctrl_Range()	--危機四伏
	if (CheckAcceptQuest(OwnerID(),425073)==true and CountBodyItem(OwnerID(),241364)<5) or 
		CheckAcceptQuest(OwnerID(),425020)==true  then
		SetPlot(TargetID(),"range","",0);

		CallPlot(TargetID(),"LuaQ_425073_Ctrl_Stage",OwnerID());

		beginPlot(TargetID(),"LuaQ_425073_Ctrl_Main",450);
	else
		return
	end
end

function LuaQ_425073_Ctrl_Stage(TID)	--危機四伏
	TID = TID or TargetID()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local shadow = Lua_CreateObjByDir( TID , 106561 , 80 , 0);
	AddToPartition(shadow,RoomID);
	SetAttack(shadow,TID)
	CallPlot(shadow,"LuaQ_425073_Monster_Ctrl",shadow)
end

function LuaQ_425073_Monster_Ctrl(OID)
	OID = OID or OwnerID()
	while true do
		if HateListCount(OID)==0 then
			DelObj(OID)
		end
	sleep(30)
	end
end

function LuaQ_425074_Ctrl()	--符文武裝
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID);
	local CtrlX = ReadRoleValue(Ctrl,EM_RoleValue_x);
	local CtrlY = ReadRoleValue(Ctrl,EM_RoleValue_Y);
	local CtrlZ = ReadRoleValue(Ctrl,EM_RoleValue_Z);
	local machine1 = CreateObj(  120246 , CtrlX+20,CtrlY,CtrlZ,0,1);	
	local machine2 = CreateObj(  120246 , CtrlX-20,CtrlY,CtrlZ,360,1);
	local machine3 = CreateObj(  120246 , CtrlX,CtrlY,CtrlZ+20,90,1);
	local machine4 = CreateObj(  120246 , CtrlX,CtrlY,CtrlZ-20,270,1);
	SetDefIdleMotion(Ctrl,ruFUSION_MIME_DEATH_LOOP)
	AddToPartition(machine1,RoomID);
	AddToPartition(machine2,RoomID);
	AddToPartition(machine3,RoomID);
	AddToPartition(machine4,RoomID);
	WriteRoleValue(Ctrl,EM_RoleValue_register9,machine1)
	WriteRoleValue(Ctrl,EM_RoleValue_register8,machine2)
	WriteRoleValue(Ctrl,EM_RoleValue_register7,machine3)
	WriteRoleValue(Ctrl,EM_RoleValue_register6,machine4)
end

function LuaQ_425074_ITEM()		--掛在充能器上
	SetPlot(OwnerID(),"touch","LuaQ_425074_ITEM_2",30)
end

function LuaQ_425074_ITEM_2()
	local Ctrl = TargetID()
	local player = OwnerID()
	if CheckAcceptQuest(player,425074) == true then
		AddBuff(OwnerID(),621975,0,5)
		CastSpell(player,player,850047)
		WriteRoleValue(Ctrl,EM_RoleValue_Register1,1)
		Hide(Ctrl)
		BeginPlot(Ctrl,"LuaQ_425074_ITEM_3",0)
	else
		ScriptMessage( player , player , 0,"[SYS_GAMEMSGEVENT_422]", 0 )
		return
	end
end

function LuaQ_425074_ITEM_3()
	Sleep(200)
	Show(OwnerID(),0)
end

function LuaQ_425074_ENERGY_CHECK()
	local player = OwnerID()
	local NPC = TargetID()
	local NpcOrg = ReadRoleValue(TargetID(),EM_RoleValue_OrgID) 
	if NpcOrg == 120247 then
		return true
	else
		ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
		return false
	end
end

function LuaQ_425074_ENERGY_BUFF()
	local player = OwnerID()
	local NPC = TargetID()
	local TBuffPos = Lua_BuffPosSearch( NPC , 621976 ) 
	local TBuffInfo = BuffInfo(NPC,TBuffPos, EM_BuffInfoType_Power )
	local Amachine = ReadRoleValue(NPC,EM_RoleValue_Register9)
	local Bmachine = ReadRoleValue(NPC,EM_RoleValue_Register8)
	local Cmachine = ReadRoleValue(NPC,EM_RoleValue_Register7)
	local Dmachine = ReadRoleValue(NPC,EM_RoleValue_Register6)
	if TBuffInfo>=8 then
		PlayMotion(NPC ,ruFUSION_ACTORSTATE_NORMAL)
		Sleep(10)		
		PlayMotion(NPC ,ruFUSION_ACTORSTATE_CAST_SP01)	
		DelObj(Amachine);DelObj(Bmachine);DelObj(Cmachine);DelObj(Dmachine);
		DW_QietKillOne(player,106713)
		CallPlot( NPC, "LuaFunc_ResetObj",NPC )
	end
end


function LuaQ_425074_DEBUFF()
	local player = OwnerID()
	local NPC = TargetID()
	local TBuffPos = Lua_BuffPosSearch( player , 622178 ) 
	local TBuffInfo = BuffInfo(player,TBuffPos, EM_BuffInfoType_Power )

	if TBuffInfo>=4 then
		AddBuff(player,622177,0,10)
		CancelBuff(player,622178)
	end
end

function LuaQ_425074_FINISH()
	CancelBuff(TargetID(),622178)
	local PlayerVoc = ReadRoleValue(TargetID(),EM_RoleValue_VOC)
	if PlayerVoc == 10 then
		Tell(TargetID(),OwnerID(),"[SC_425074_FINISH]")
	end
end

--===========================副本===============================--
function LuaQ_425089_ItemCheck()
	local player = OwnerID()
	local SearchNpc = {}
	local NpcOrgID
	local X = 0
	SearchNpc = SearchRangeNPC(player,80)
	if CheckAcceptQuest(player,425089)==true then
		for i=0, table.getn(SearchNpc),1 do
			NpcOrgID = ReadRoleValue(SearchNpc[i],EM_RoleValue_OrgID)
			if NpcOrgID == 120536 and checkbuff(SearchNpc[i],622240)==false then
				X = X+1
			end
	
		end
	end
	if X == 1 then
		return true
	else 
	 	ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
		return false
	end
end


function LuaQ_425089_ItemUse()
	local player = OwnerID()
	local NpcOrgID
	local TempPlayer={}
	local SearchNpc = {}
	TempPlayer = SearchRangePlayer(player,250)
	SearchNpc = SearchRangeNPC(player,80)
	CallPlot(player,"DW_QietKillOne",player ,106717)
	for i=0,table.getn(SearchNpc),1 do
		NpcOrgID = ReadRoleValue(SearchNpc[i],EM_RoleValue_OrgID)
		if NpcOrgID == 120536 then
			CastSpell(SearchNpc[i],SearchNpc[i],850029)
		end
	end
	for i=0,table.getn(TempPlayer),1 do
		if CheckAcceptQuest(TempPlayer[i],425089)==true then
			CallPlot(TempPlayer[i],"DW_QietKillOne",TempPlayer[i],106717)
		end
	end
end


function LuaQ_425081_Range()
	SetPlot(OwnerID(),"range","LuaQ_425081_Range_Keyitem",35)
end

function LuaQ_425081_Range_Keyitem()
	local OID = OwnerID()
	local TID = TargetID()
	if  CheckAcceptQuest(OID,425081)==true and CheckFlag(OID,546154)==false then
		SetFlag(OID,546154,1)
	elseif  CheckCompleteQuest(OID,425081)==true then
		return
	else
		return
	end
end

function LuaQ_425088_Speak()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425088)==true and 
	   CheckFlag(OwnerID(),546222)==false then
		SetFlag(OwnerID(),546222,1)
	end 
end

--=============覲見莫塔妮亞公主=====================--

function LuaQ_425086_Check()
	local player = OwnerID()
	local Npc = TargetID()
	local Atable = {}
	
	LoadQuestOption(player)
	if CheckAcceptQuest(player,425086)==true and CheckFlag(player,546156)==false then
		if ReadRoleValue(Npc,EM_RoleValue_Register9)==0 then
        			 Atable=SearchRangePlayer(Npc,80)
				for i=0,table.getn(Atable),1 do
					if CheckAcceptQuest(Atable[i],425086)==true then
					CloseSpeak(Atable[i])
					end
				end
			AddSpeakOption(Player,player,"[SC_423497_2]","LuaQ_425086_QuestStart",0)		--第一個開啟者
		elseif ReadRoleValue(Npc,EM_RoleValue_Register9)==9 then
			AddSpeakOption(Player,player,"[SC_423497_2]","LuaQ_425086_alreadyStart",0)	--任務已有人開始，詢問是否省略部分劇情
		end		
	end
	if CheckAcceptQuest(player,425188)==true and CheckFlag(player,546157)==false then
		if ReadRoleValue(Npc,EM_RoleValue_Register9)==0 then
        			 Atable=SearchRangePlayer(Npc,80)
				for i=0,table.getn(Atable),1 do
					if CheckAcceptQuest(Atable[i],425188)==true then
					CloseSpeak(Atable[i])
					end
				end
			AddSpeakOption(Player,player,"[SC_423180_6]","LuaQ_425188_QuestStart",0)		--第一個開啟者
		elseif ReadRoleValue(Npc,EM_RoleValue_Register9)==9 then
			AddSpeakOption(Player,player,"[SC_423180_6]","LuaQ_425188_alreadyStart",0)	--任務已有人開始，詢問是否省略部分劇情
		end		
	end
end

function LuaQ_425086_QuestStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	WriteRoleValue(Npc,EM_rolevalue_register9,9)
	Globle_An_TempPlayerPool = Globle_An_TempPlayerPool or {};
	Globle_An_TempPlayerPool[425086] = Globle_An_TempPlayerPool[425086] or {};
	Globle_An_TempPlayerPool[425086].playerID = {};
	Globle_An_TempPlayerPool[425086].npc = {};

	table.insert(Globle_An_TempPlayerPool[425086].playerID,player)

	CallPlot(player,"LuaQ_425086_Actor",player,npc)
end

function LuaQ_425086_Actor(player,Npc)
	AddBuff(player,622261,0,-1)
	local princess = LuaFunc_createObjByObj( 120539 , Npc )

	table.insert(Globle_An_TempPlayerPool[425086].npc,princess)

	CallPlot(princess,"LuaQ_425086_Show",princess,player,Npc)
end

function LuaQ_425086_Show(princess,player,Npc)
	sleep(10)
	NPCSAY(princess,"[SC_423497_2]")--走吧
	DW_MoveToFlag( princess , 781077, 5, 0, 1)
	NPCSAY(princess,"[SC_425086_01]")
	sleep(20)
	CallPlot(princess,"LuaQ_425086_PlayerCheck",princess,player,npc)
	DW_MoveToFlag( princess , 781077, 6, 0, 1)	
	NPCSAY(princess,"[SC_425086_02]")	
	sleep(40)
	CallPlot(princess,"LuaQ_425086_PlayerCheck",princess,player,npc)
	DW_MoveToFlag( princess , 781077, 7, 0, 1)	
	NPCSAY(princess,"[SC_425086_03]")
	sleep(40)
	CallPlot(princess,"LuaQ_425086_PlayerCheck",princess,player,npc)
	DW_MoveToFlag( princess , 781077, 8, 0, 1)	
	NPCSAY(princess,"[SC_425086_04]")
	sleep(40)
	CallPlot(princess,"LuaQ_425086_PlayerCheck",princess,player,npc)
	DW_MoveToFlag( princess , 781077, 9, 0, 1)	
	NPCSAY(princess,"[SC_425086_05]")	
	sleep(40)
	CallPlot(princess,"LuaQ_425086_PlayerCheck",princess,player,npc)
	DW_MoveToFlag( princess , 781077, 10, 0, 1)	
	NPCSAY(princess,"[SC_425086_06]")
	sleep(20)
	CallPlot(princess,"LuaQ_425086_PlayerCheck",princess,player,npc)
	NPCSAY(princess,"[SC_425086_07]")
	LuaQ_425086_PlayerReward()
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622261)
	CallPlot(princess,"LuaQ_425086_QuestEnd",princess,player,npc)
end

function LuaQ_425086_QuestEnd(princess,player,npc)
	Globle_An_TempPlayerPool[425086].playerID =nil	
	Globle_An_TempPlayerPool[425086].npc =nil
	Globle_An_TempPlayerPool[425086] =nil
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622261)
	DelObj(princess)
end


function LuaQ_425086_PlayerCheck(princess,player,npc)
	local TempPlayerID = Globle_An_TempPlayerPool[425086].playerID
	local QuestTF = 0
	local DisTF = 0
	local PlayerID=0
	local playerNum = 0
	for key,value in pairs(TempPlayerID) do
		if CheckAcceptQuest(value,425086)==false then
			QuestTF = QuestTF +1
		end
		if CheckDistance(value,princess,100)==false then
			DisTF = DisTF +1
		end
		if QuestTF>=1 or DisTF>=1 or PlayerID>=1  then
			ScriptMessage( value, value, 0,"[SC_422974_FAILED]", 0 )
			ScriptMessage( value, value, 1,"[SC_422974_FAILED]", 0 )
			CancelBuff(value,622261)
			table.remove(TempPlayerID,key)
		end
		if CheckID(value)==0 then
			table.remove(TempPlayerID,key)
		end
	end
	
	for key,value in pairs(TempPlayerID) do
		if key ~= 0 then
			playerNum = playerNum + 1
		end
	end
	if playerNum == 0 then
		CallPlot(princess,"LuaQ_425086_QuestEnd",princess,player,npc)
	end
end

function LuaQ_425086_PlayerReward()
	
	for key,value in pairs(Globle_An_TempPlayerPool[425086].playerID) do
		if CheckAcceptQuest(value,425086)==true and
			CheckDistance(value,OwnerID(),100)==true and 
			Checkbuff(value,622261)==true then
			SetFlag(value,546156,1)
			CancelBuff(value,622261)
			table.remove(Globle_An_TempPlayerPool[425086].playerID,value)
		end
	end
end

function LuaQ_425086_alreadyStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	callplot(Player,"DW_ChooseOneFromTwo",player,"[SC_QUESTEXECUTESURE_0]","LuaQ_425086_Yes","LuaQ_425086_No")
end

function LuaQ_425086_Yes()
	local player = OwnerID()
	AddBuff(player,622261,0,-1)
	table.insert(Globle_An_TempPlayerPool[425086].playerID,player)	
	for key,value in pairs(Globle_An_TempPlayerPool[425086].npc) do
		if ReadRoleValue(value,EM_RoleValue_OrgID)==120539  then
		X=ReadRoleValue(value,EM_rolevalue_X)
		Y=ReadRoleValue(value,EM_rolevalue_Y)
		Z=ReadRoleValue(value,EM_rolevalue_Z)
		dir=ReadRoleValue(value,EM_rolevalue_dir)
		SetPos(player,x,y,z,dir)
		end
	end
end

function LuaQ_425086_No()
	local player = OwnerID()
	return
end
--==============================
function LuaQ_425188_QuestStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	WriteRoleValue(Npc,EM_rolevalue_register9,9)
	Globle_An_TempPlayerPool = Globle_An_TempPlayerPool or {};
	Globle_An_TempPlayerPool[425188] = Globle_An_TempPlayerPool[425188] or {};
	Globle_An_TempPlayerPool[425188].playerID = {};
	Globle_An_TempPlayerPool[425188].npc = {};

	table.insert(Globle_An_TempPlayerPool[425188].playerID,player)

	CallPlot(player,"LuaQ_425188_Actor",player,npc)
end

function LuaQ_425188_Actor(player,Npc)
	AddBuff(player,622262,0,-1)
	local princess = LuaFunc_createObjByObj( 120540 , Npc )
	table.insert(Globle_An_TempPlayerPool[425188].npc,princess)
	CallPlot(princess,"LuaQ_425188_Show",princess,player,Npc)
end

function LuaQ_425188_ActorMove(obj,Flag,Num)
	obj = obj or  OwnerID()
	if Flag == nil then
		return
	end
	DW_MoveToFlag( obj , Flag, Num, 0, 1)
end

function LuaQ_425188_Show(princess,player,Npc)
	sleep(30)
	local NpcRoomID = ReadRoleValue(princess,EM_RoleValue_RoomID)
	local Flag = 781077
	local playerName = GetName(Globle_An_TempPlayerPool[425188].playerID[1])
	local ActorTable = {}
	local ActorPool = {}
		ActorPool[120635] =17	--key:Actor_OrgID;value:Flag_Num
		ActorPool[120636] =18
		ActorPool[120637] =19
		ActorPool[120638] =20
		ActorPool[120639] =21
		ActorPool[120640] =22

	NPCSAY(princess,"[SC_425087_05]")
	Sleep(10)

	for key,value in pairs(ActorPool) do
		ActorTable[value-16] = CreateObjByFlag( key,Flag ,value-6 ,1 );
		AddToPartition(ActorTable[value-16] ,NpcRoomID)
		CallPlot(ActorTable[value-16],"LuaQ_425188_ActorMove",ActorTable[value-16],Flag,value)
	end

	sleep(50)
	CallPlot(princess,"LuaQ_425188_PlayerCheck",princess,player,npc,ActorTable)
	sleep(20)
	NPCSAY(princess,"[SC_425087_01][$SETVAR1="..GetName(Globle_An_TempPlayerPool[425188].playerID[1]).."]")
	CallPlot(princess,"LuaQ_425188_PlayerCheck",princess,player,npc,ActorTable)
	sleep(20)
	NPCSAY(princess,"[SC_425087_02]")
	CallPlot(princess,"LuaQ_425188_PlayerCheck",princess,player,npc,ActorTable)
	sleep(30)
	PlayMotion(princess,112)
	sleep(30)
	PlayMotion(princess,166)
	sleep(20)	

	for i=1,6 do 
		PlayMotion(ActorTable[i],149)
	end

	PlayMotion(princess,167)
	NPCSAY(princess,"[SC_425087_03]")
	CallPlot(princess,"LuaQ_425188_PlayerCheck",princess,player,npc,ActorTable)
	sleep(20)	
	PlayMotion(princess,83)
	NPCSAY(princess,"[SC_425087_04]")
	sleep(20)	
	for i=1,6 do 
	NPCSAY(ActorTable[i],"[SC_425087_04]")
		PlayMotion(ActorTable[i],150)
	end
	sleep(20)
	CallPlot(princess,"LuaQ_425188_PlayerCheck",princess,player,npc,ActorTable)
	NPCSAY(princess,"[SC_425087_06]")
	sleep(20)
	LuaQ_425188_PlayerReward()

	for i=1,6 do 
		CallPlot(ActorTable[i],"LuaQ_425188_ActorMove",ActorTable[i],Flag,10+i)
	end
	sleep(20)

	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622262)
	CallPlot(princess,"LuaQ_425188_QuestEnd",princess,player,npc,ActorTable)
end

function LuaQ_425188_QuestEnd(princess,player,npc,ActorTable)

	Globle_An_TempPlayerPool[425188].playerID =nil	
	Globle_An_TempPlayerPool[425188].npc =nil
	Globle_An_TempPlayerPool[425188] =nil
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622262)
	for key,value in pairs(ActorTable) do
		DelObj(value)
	end
	DelObj(princess)
end


function LuaQ_425188_PlayerCheck(princess,player,npc,ActorTable)
	local TempPlayerID = Globle_An_TempPlayerPool[425188].playerID
	local QuestTF = 0
	local DisTF = 0
	local playerNum = 0
	for key,value in pairs(TempPlayerID) do
		if CheckAcceptQuest(value,425188)==false then
			QuestTF = QuestTF +1
		end
		if CheckDistance(value,princess,100)==false then
			DisTF = DisTF +1
		end
		if QuestTF>=1 or DisTF>=1 then
			ScriptMessage( value, value, 0,"[SC_422974_FAILED]", 0 )
			ScriptMessage( value, value, 1,"[SC_422974_FAILED]", 0 )
			CancelBuff(value,622262)
			table.remove(TempPlayerID,key)
		end
	end
	
	for key,value in pairs(TempPlayerID) do
		if key ~= 0 then
			playerNum = playerNum + 1
		end
	end
	if playerNum == 0 then
		CallPlot(princess,"LuaQ_425188_QuestEnd",princess,player,npc,ActorTable)
	end
end

function LuaQ_425188_PlayerReward()
	
	for key,value in pairs(Globle_An_TempPlayerPool[425188].playerID) do
		if CheckAcceptQuest(value,425188)==true and
			CheckDistance(value,OwnerID(),100)==true and 
			CheckBuff(value,622262)==true then
			SetFlag(value,546157,1)
			CancelBuff(value,622262)
			table.remove(Globle_An_TempPlayerPool[425188].playerID,key)
		end
	end
end

function LuaQ_425188_alreadyStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	callplot(Player,"DW_ChooseOneFromTwo",player,"[SC_QUESTEXECUTESURE_0]","LuaQ_425188_Yes","LuaQ_425188_No")
end

function LuaQ_425188_Yes()
	local player = OwnerID()
	AddBuff(player,622262,0,-1)
	table.insert(Globle_An_TempPlayerPool[425188].playerID,player)	
end

function LuaQ_425188_No()
	return
end

function LuaQ_425078_START()
	CallPlot(TargetID(),"LuaQ_425078_CARBUFF",0)
end

function LuaQ_425078_CARBUFF()
	local player = OwnerID()
	local RIDESTATE=Lua_Mounts_Copilot(player)
	CloseSpeak(player)
	if RIDESTATE==True then
		AddBuff(player ,622274,0,-1)		   
		local RoomID=ReadRoleValue(player,EM_RoleValue_RoomID)					   
		local car = LuaFunc_CreateObjByObj ( 105495 , player) 		--你要生出來的車，生再使用物品的人的座標
		SetModeEx(car,EM_SetModeType_AlignToSurface,false)  
		SetModeEx(car,EM_SetModeType_Mark,false)
		SetModeEx(car,EM_SetModeType_Strikback,false)      		--不反擊，被打不還手
		SetModeEx(car,EM_SetModeType_HideName,true)        		--物件頭上是否顯示名稱
		SetModeEx(car,EM_SetModeType_Searchenemy,false)   		--不鎖敵，不會去追怪
		SetModeEx(car,EM_SetModeType_Fight,false)			--可砍殺
		AddToPartition(car,RoomID)                        			--顯現出car再這個zone，配合LuaFunc_CreateObjByObj用
		WriteRoleValue(car,EM_RoleValue_register1,player)     		--把玩家寫入車的reg1(暫存值
		WriteRoleValue(player,EM_RoleValue_register1,car)  
		AttachObj( car , player, 0 ,"p_down","p_top" )
		CallPlot(car,"LuaQ_425078_CARSKILL",car,player) 
	else							 --基本法術的種類用"執行劇情"
			ScriptMessage( player , player , 0,"[SC_CRAFT_2011_08]", 0 )
			ScriptMessage( player , player , 1,"[SC_CRAFT_2011_08]", 0 )
	end
end


function LuaQ_425078_CARSKILL(car,player)
	local skilltime = 0
	local TempMonster = {}
	while true do
		skilltime = skilltime+1
		if skilltime%5 == 0 then
			AttachObj( car , player, 0 ,"p_down","p_top" )
			TempMonster = SearchRangeNPC ( car , 100 )             			
			for i=0 , table.getn(TempMonster) do
				if ReadRoleValue(TempMonster[i],EM_RoleValue_CampID )==3 then	
					sysCastSpellLv (player , TempMonster[i] ,498368, 0 )
				end
			end
		end
	if  CheckAcceptQuest( player, 425078 ) ==false 
		or checkid(player)==0 
		or ReadRoleValue( player, EM_RoleValue_IsDead )== 1 
		or CheckBuff(player,622274)==false then
		CancelBuff(player,622274)
		delobj(car)
	end
		Sleep(10)
	end
end

function LuaQ_425078_RANGE()
	Setplot(OwnerID(),"range","LuaQ_425078_RANGE_CHECK",80)	
end

function LuaQ_425078_RANGE_CHECK()
	local player = OwnerID()
	local car = readrolevalue(player ,EM_rolevalue_register1)
	if CheckAcceptQuest( player , 425078 ) ==true and
		 CheckBuff(player ,622274)==true then
		delobj(car)
		SetFlag(player ,546153,1)
		CancelBuff(player ,622274)
		WriteRoleValue(player,EM_RoleValue_register1,0) 
	end
end

function LuaQ_425084_SPEAK()
	local Player =OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(Player,"[SC_425084_4]")
	if CheckAcceptQuest(Player,425084)==true then
		AddSpeakOption(Player,Npc,"[SC_425084_5]","LuaQ_425084_SET",0)
	end
end

function LuaQ_425084_SET()
	local Player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(Player)
	CallPlot( NPC, "LuaQ_425084_SHOW",NPC,Player)
end

function LuaQ_425084_SHOW(NPC,Player)
	DW_QietKillOne(player,106771)
	NPCSAY(Npc,"[SC_119479_6]")
	move(Npc,2390,2981,-4213)
	sleep(20)
	CallPlot( NPC, "LuaFunc_ResetObj",NPC )
end