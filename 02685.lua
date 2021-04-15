function Lua_AND_NPCMOTION(OBJ1,OBJ2,NUM)--數字1是說話，二是指，三是生氣
	if OBJ1 ~= nil and OBJ2 ~=nil then
		AdjustFaceDir(OBJ1,OBJ2, 0 )
	end

	if Num == nil or 1 then
		PlayMotion(OBJ1, ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	elseif Num == 2 then
		PlayMotion(OBJ1, ruFUSION_ACTORSTATE_EMOTE_POINT)
	elseif Num == 3 then
		PlayMotion(OBJ1, ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	elseif Num == 4 then
		PlayMotion(OBJ1, ruFUSION_ACTORSTATE_NORMAL)
	end
end
--====================初次聚首_Q425421====================--
function LuaQ_425421_SPEAK_JILL()
	local player = OwnerID()
	local Npc = TargetID()
	
	LoadQuestOption(player)
	if CheckAcceptQuest(player,425421)==true and CheckFlag(player,546521)==false then
		AddSpeakOption(Player,player,"[SC_425421_JILL_0]","LuaQ_425421_SPEAK_JILL_2",0)	
	end

end

function LuaQ_425421_SPEAK_JILL_2()
	local player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(player,"[SC_425421_JILL_1]")
	GiveBodyItem(player,546521,1)
end

function LuaQ_425421_SPEAK_HUMANKING_2()
	local player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(player,"[SC_425421_HUMANKING_1]")
	GiveBodyItem(player,546522,1)
end

function LuaQ_425421_Check()
	local player = OwnerID()
	local Npc = TargetID()
	
	LoadQuestOption(player)
	if CheckAcceptQuest(player,425421)==true 
		and CheckFlag(player,546521)==true
		and CheckFlag(player,546522)==true
		and CheckFlag(player,546523)==false then

		if ReadRoleValue(Npc,EM_RoleValue_Register9)==0 then
			Lua_AND_RANGEPLAYER(player,Npc,425421)	--用來關閉同時間開啟對話視窗的玩家
			AddSpeakOption(Player,player,"[SC_425421_0]","LuaQ_425421_QuestStart",0)		--第一個開啟者
		elseif ReadRoleValue(Npc,EM_RoleValue_Register9)<5 then
			AddSpeakOption(Player,player,"[SC_425421_0]","LuaQ_425421_alreadyStart",0)	--任務已有人開始，詢問是否省略部分劇情
		end		
	end
end

function LuaQ_425421_QuestStart()
	local player = OwnerID();
	local Npc = TargetID();
	CloseSpeak(player)
	WriteRoleValue(Npc,EM_rolevalue_register9,1)
	Globle_An_TempPlayerPool = Globle_An_TempPlayerPool or {};
	Globle_An_TempPlayerPool[425421] = Globle_An_TempPlayerPool[425421] or {};
	Globle_An_TempPlayerPool[425421].playerID = {};
	Globle_An_TempPlayerPool[425421].npc = {};
	Globle_An_TempPlayerPool[425421].music = {};
	table.insert(Globle_An_TempPlayerPool[425421].playerID,player)

	CallPlot(player,"LuaQ_425421_Actor",player,npc)
end

function LuaQ_425421_Actor(player,Npc)	--產生演員
--CreateObjByFlag( Int ObjID, Int FlagObjID, Int FlagID, Int count )
	AddBuff(player,622080,0,-1)
	local XRoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local FlagNum = 781154
	local ActorPool = {}
	local ActorNum = {}
	ActorNum[120813]	=0
	ActorNum[120814]	=1
	ActorNum[120815]	=2
	ActorNum[120816]	=3
	ActorNum[120817]	=4
	ActorNum[120818]	=5
	ActorNum[120819]	=6
	for i=0,6 do
		ActorPool[i]=CreateObjByFlag( 120813+i,FlagNum,i,1 )
		table.insert(Globle_An_TempPlayerPool[425421].npc,ActorPool[i])
	end
	for i=1,5 do
		AddToPartition(ActorPool[i],XRoomID)
	end

	CallPlot(ActorPool[1],"LuaQ_425421_Show",player,Npc,ActorPool)
end

function LuaQ_425421_ActorMove(obj,Flag,Num)
	obj = obj or  OwnerID()
	if Flag == nil then
		return
	end
	DW_MoveToFlag( obj , Flag, Num, 0, 1)
end

function LuaQ_425421_Show(player,Npc,ActorPool)
	Lua_StopBGM(player)
	local XRoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local TempPlayerID = Globle_An_TempPlayerPool[425421].playerID
	local playerName = GetName(Globle_An_TempPlayerPool[425421].playerID[1])
	local SoundID = PlaySoundToPlayer(player,"music/GuildWar/epic_tales_01_APF_chaos.mp3", false )
	Globle_An_TempPlayerPool[425421].music[SoundID] = player
	sleep(10)
	AddToPartition(ActorPool[6],XRoomID)
	luaQ_425421_ActorMove(ActorPool[6],781154,7)
	NPCSAY(ActorPool[6],"[SC_425421_1]")
	PlayMotion(ActorPool[6], ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	Sleep(20)
	NPCSAY(ActorPool[2],"[SC_425421_2]")
	Lua_AND_NPCMOTION(ActorPool[2],ActorPool[6],1)	--數字1是說話，二是指，三是生氣
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[1],"[SC_425421_3]")
	Lua_AND_NPCMOTION(ActorPool[1],ActorPool[6],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[2],"[SC_425421_4]")
	Lua_AND_NPCMOTION(ActorPool[2],ActorPool[6],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[6],"[SC_425421_5]")
	PlayMotion(ActorPool[6], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[6],"[SC_425421_6]")
--	Lua_AND_NPCMOTION(ActorPool[6],ActorPool[1],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(30)
	NPCSAY(ActorPool[6],"[SC_425421_7]")
--	Lua_AND_NPCMOTION(ActorPool[6],ActorPool[1],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[6],"[SC_425421_8]")
--	Lua_AND_NPCMOTION(ActorPool[6],ActorPool[1],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[1],"[SC_425421_9]")
	Lua_AND_NPCMOTION(ActorPool[1],ActorPool[6],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[1],"[SC_425421_10]")
	Lua_AND_NPCMOTION(ActorPool[1],ActorPool[6],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[1],"[SC_425421_11]")
	Lua_AND_NPCMOTION(ActorPool[1],ActorPool[6],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[6],"[SC_425421_12]")
--	Lua_AND_NPCMOTION(ActorPool[6],ActorPool[1],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[6],"[SC_425421_13]")
--	Lua_AND_NPCMOTION(ActorPool[6],ActorPool[1],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	WriteRoleValue(Npc,EM_rolevalue_register9,6)
	sleep(20)	
	NPCSAY(ActorPool[1],"[SC_425421_14]")
	Lua_AND_NPCMOTION(ActorPool[1],ActorPool[6],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[1],"[SC_425421_15]")
	Lua_AND_NPCMOTION(ActorPool[1],ActorPool[6],2)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[1],"[SC_425421_16]")
	Lua_AND_NPCMOTION(ActorPool[1],ActorPool[6],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[2],"[SC_425421_17]")
	Lua_AND_NPCMOTION(ActorPool[2],ActorPool[3],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[3],"[SC_425421_18]")
	Lua_AND_NPCMOTION(ActorPool[3],ActorPool[1],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[6],"[SC_425421_19]")
	Lua_AND_NPCMOTION(ActorPool[6],ActorPool[3],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[1],"[SC_425421_20]")
	Lua_AND_NPCMOTION(ActorPool[1],ActorPool[3],1)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)
	AddToPartition(ActorPool[0],XRoomID)
	luaQ_425421_ActorMove(ActorPool[0],781154,8)
	NPCSAY(ActorPool[0],"[SC_425421_21]")
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(20)
	for i=1,2 do
		NPCSAY(ActorPool[i],"[SC_425421_22]")
		Lua_AND_NPCMOTION(ActorPool[i],ActorPool[0],4)
	end
		NPCSAY(ActorPool[4],"[SC_425421_22]")
		Lua_AND_NPCMOTION(ActorPool[4],ActorPool[0],4)
		NPCSAY(ActorPool[6],"[SC_425421_22]")
		Lua_AND_NPCMOTION(ActorPool[6],ActorPool[0],4)
	CallPlot(ActorPool[1],"LuaQ_425421_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	for key,value in pairs(TempPlayerID) do
		SetFlag(value,546530,1)
		SetFlag(value,546271,1)
	end
	LuaQ_425421_PlayerReward()
	CancelBuff(player,622080)
	CallPlot(ActorPool[1],"LuaQ_425421_QuestEnd",ActorPool[1],player,npc,ActorPool)
end

function LuaQ_425421_QuestEnd(Actor1,player,npc,ActorPool)
	local Atable = {}
	local TempPlayerID = Globle_An_TempPlayerPool[425421].playerID
	for key,value in pairs(TempPlayerID) do
		Lua_PlayBGM(value)
		CancelBuff(value,622080)
	end
	for index,value in pairs(Globle_An_TempPlayerPool[425421].music) do
		StopSound(value,index)
	end
	Globle_An_TempPlayerPool[425421].music = nil
	Globle_An_TempPlayerPool[425421].playerID =nil	
	Globle_An_TempPlayerPool[425421].npc =nil
	Globle_An_TempPlayerPool[425421] =nil
	WriteRoleValue(Npc,EM_rolevalue_register9,0)

	for key,value in pairs(ActorPool) do
		DelObj(value)
	end
        	 Atable=SearchRangePlayer(Npc,80)
		for i=0,table.getn(Atable),1 do
			if CheckBuff(Atable[i],501570)==true then
				CancelBuff(Atable[i],501570)
			end
		end
	DelObj(Actor1)
end


function LuaQ_425421_PlayerCheck(Actor1,player,npc,ActorPool)
	if Globle_An_TempPlayerPool == nil then
		return
	else
		if Globle_An_TempPlayerPool[425421] == nil then
			return
		else
			if Globle_An_TempPlayerPool[425421].playerID == nil then
				return
			end
		end
	end
	local TempPlayerID = Globle_An_TempPlayerPool[425421].playerID
	local QuestTF = 0
	local DisTF = 0
	local playerNum = 0
	for key,value in pairs(TempPlayerID) do
		if CheckAcceptQuest(value,425421)==false then
			QuestTF = QuestTF +1
		end
		if CheckDistance(value,Actor1,100)==false then
			DisTF = DisTF +1
		end
		if QuestTF>=1 or DisTF>=1 then
			ScriptMessage( value, value, 0,"[SC_422974_FAILED]", 0 )
			ScriptMessage( value, value, 1,"[SC_422974_FAILED]", 0 )
			CancelBuff(value,622080)
			table.remove(TempPlayerID,key)
		end
	end
	
	for key,value in pairs(TempPlayerID) do
		if key ~= 0 then
			playerNum = playerNum + 1
		end
	end
	if playerNum == 0 then
		CallPlot(Actor1,"LuaQ_425421_QuestEnd",Actor1,player,npc,ActorPool)
	end
end

function LuaQ_425421_PlayerReward()
	for index,value in pairs(Globle_An_TempPlayerPool[425421].music) do
		StopSound(value,index)
	end
	for key,value in pairs(Globle_An_TempPlayerPool[425421].playerID) do
		Lua_PlayBGM(value)
		if CheckAcceptQuest(value,425421)==true and
			CheckDistance(value,OwnerID(),250)==true and 
			CheckBuff(value,622080)==true then
			SetFlag(value,546523,1)
			CancelBuff(value,622080)
			table.remove(Globle_An_TempPlayerPool[425421].playerID,value)
		end
	end
end

function LuaQ_425421_alreadyStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	callplot(Player,"DW_ChooseOneFromTwo",player,"[SC_QUESTEXECUTESURE_0]","LuaQ_425421_Yes","LuaQ_425421_No")
end

function LuaQ_425421_Yes()
	local player = OwnerID()
	AddBuff(player,622080,0,-1)
	local SoundID = PlaySoundToPlayer(player,"music/GuildWar/epic_tales_01_APF_chaos.mp3", false )
	Globle_An_TempPlayerPool[425421].music[SoundID] = player
	table.insert(Globle_An_TempPlayerPool[425421].playerID,player)
		
end

function LuaQ_425421_No()
	return
end
--====================巨龍之聲Q425422====================--
function LuaQ_425422_Check()
	local player = OwnerID()
	local Npc = TargetID()
	LoadQuestOption(player)

	if CheckAcceptQuest(player,425421)==true and CheckFlag(player,546521)==true and CheckFlag(player,546522)==false  then
		AddSpeakOption(Player,player,"[SC_425421_HUMANKING_0]","LuaQ_425421_SPEAK_HUMANKING_2",0)	
	end

	if CheckAcceptQuest(player,425422)==true 
		and CheckFlag(player,546524)==false then

		if ReadRoleValue(Npc,EM_RoleValue_Register9)==0 then
			Lua_AND_RANGEPLAYER(player,Npc,425422)	--用來關閉同時間開啟對話視窗的玩家
			AddSpeakOption(Player,player,"[SC_425422_0]","LuaQ_425422_QuestStart",0)		--第一個開啟者
		elseif ReadRoleValue(Npc,EM_RoleValue_Register9)<5 then
			AddSpeakOption(Player,player,"[SC_425422_0]","LuaQ_425422_alreadyStart",0)	--任務已有人開始，詢問是否省略部分劇情
		end		
	end

end

function LuaQ_425422_QuestStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	WriteRoleValue(Npc,EM_rolevalue_register9,1)
	Globle_An_TempPlayerPool = Globle_An_TempPlayerPool or {};
	Globle_An_TempPlayerPool[425422] = Globle_An_TempPlayerPool[425422] or {};
	Globle_An_TempPlayerPool[425422].playerID = {};
	Globle_An_TempPlayerPool[425422].npc = {};
	Globle_An_TempPlayerPool[425422].music = {};

	table.insert(Globle_An_TempPlayerPool[425422].playerID,player)

	CallPlot(player,"LuaQ_425422_Actor",player,npc)
end

function LuaQ_425422_Actor(player,Npc)
--CreateObjByFlag( Int ObjID, Int FlagObjID, Int FlagID, Int count )
	AddBuff(player,622081,0,-1)
	local XRoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local FlagNum = 781155
	local ActorPool = {}
	local ActorNum = {}
	ActorNum[120869]	=0
	ActorNum[120870]	=1
	ActorNum[120871]	=2
	ActorNum[120872]	=3
	ActorNum[120873]	=4
	ActorNum[120874]	=5
	ActorNum[120875]	=6
	for i=0,6 do
		ActorPool[i]=CreateObjByFlag( 120869+i,FlagNum,i,1 )
		AddToPartition(ActorPool[i],XRoomID)
		table.insert(Globle_An_TempPlayerPool[425422].npc,ActorPool[i])
	end
	CallPlot(ActorPool[1],"LuaQ_425422_Show",player,Npc,ActorPool)
end

function LuaQ_425422_Show(player,Npc,ActorPool)
	local TempPlayerID = Globle_An_TempPlayerPool[425422].playerID
	local SoundID = PlaySoundToPlayer(player,"music/GuildWar/epic_tales_02_JFL_hellwars.mp3", false )
	Globle_An_TempPlayerPool[425422].music[SoundID] = player
	sleep(10)
	NPCSAY(ActorPool[0],"[SC_425422_2]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	Sleep(20)
	NPCSAY(ActorPool[0],"[SC_425422_3]")
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[6],"[SC_425422_4]")
	PlayMotion(ActorPool[6], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[0],"[SC_425422_5]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[0],"[SC_425422_6]")
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[0],"[SC_425422_7]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(30)
	NPCSAY(ActorPool[0],"[SC_425422_8]")
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[0],"[SC_425422_9]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	WriteRoleValue(Npc,EM_rolevalue_register9,6)
	sleep(20)	
	NPCSAY(ActorPool[0],"[SC_425422_1]")
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[0],"[SC_425422_10]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[3],"[SC_425422_11]")
	Lua_AND_NPCMOTION(ActorPool[3],ActorPool[0],1)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[0],"[SC_425422_12]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[0],"[SC_425422_13]")
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[3],"[SC_425422_14]")
	PlayMotion(ActorPool[3], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[3],"[SC_425422_15]")
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[0],"[SC_425422_16]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[0],"[SC_425422_17]")
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[0],"[SC_425422_18]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[1],"[SC_425422_19]")
	Lua_AND_NPCMOTION(ActorPool[1],ActorPool[0],1)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[2],"[SC_425422_20]")
	Lua_AND_NPCMOTION(ActorPool[2],ActorPool[0],1)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[6],"[SC_425422_21]")
	PlayMotion(ActorPool[6], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[0],"[SC_425422_22]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[0],"[SC_425422_23]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	PlayMotion(ActorPool[0],149)
	for i=1,6 do
		NPCSAY(ActorPool[i],"[SC_425421_22]")
	end
	for key,value in pairs(TempPlayerID) do
		SetFlag(value,546271,0)
	end
	CallPlot(ActorPool[0],"LuaQ_425422_PlayerCheck",ActorPool[1],player,npc,ActorPool)
	sleep(10)
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	LuaQ_425422_PlayerReward()
	CancelBuff(player,622081)
	CallPlot(ActorPool[0],"LuaQ_425422_QuestEnd",ActorPool[0],player,npc,ActorPool)
end

function LuaQ_425422_QuestEnd(Actor0,player,npc,ActorPool)
	local Atable = {}
	for index,value in pairs(Globle_An_TempPlayerPool[425422].music) do
		StopSound(value,index)
	end	
	Globle_An_TempPlayerPool[425422].playerID =nil	
	Globle_An_TempPlayerPool[425422].npc =nil
	Globle_An_TempPlayerPool[425422].music =nil
	Globle_An_TempPlayerPool[425422] =nil
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622081)
	for key,value in pairs(ActorPool) do
		DelObj(value)
	end
       	 Atable=SearchRangePlayer(Npc,80)
		for i=0,table.getn(Atable),1 do
			if CheckBuff(Atable[i],501570)==true then
				CancelBuff(Atable[i],501570)
			end
		end
	DelObj(Actor0)
end


function LuaQ_425422_PlayerCheck(Actor0,player,npc,ActorPool)
	if Globle_An_TempPlayerPool == nil then
		return
	else
		if Globle_An_TempPlayerPool[425422] == nil then
			return
		else
			if Globle_An_TempPlayerPool[425422].playerID == nil then
				return
			end
		end
	end
	local TempPlayerID = Globle_An_TempPlayerPool[425422].playerID
	local QuestTF = 0
	local DisTF = 0
	local playerNum = 0
	for key,value in pairs(TempPlayerID) do
		if CheckAcceptQuest(value,425422)==false then
			QuestTF = QuestTF +1
		end
		if CheckDistance(value,Actor0,100)==false then
			DisTF = DisTF +1
		end
		if QuestTF>=1 or DisTF>=1 then
			ScriptMessage( value, value, 0,"[SC_422974_FAILED]", 0 )
			ScriptMessage( value, value, 1,"[SC_422974_FAILED]", 0 )
			CancelBuff(value,622081)
			table.remove(TempPlayerID,key)
		end
	end
	
	for key,value in pairs(TempPlayerID) do
		if key ~= 0 then
			playerNum = playerNum + 1
		end
	end
	if playerNum == 0 then
		CallPlot(Actor0,"LuaQ_425422_QuestEnd",Actor0,player,npc,ActorPool)
	end
end

function LuaQ_425422_PlayerReward()
	for index,value in pairs(Globle_An_TempPlayerPool[425422].music) do
		StopSound(value,index)
	end
	for key,value in pairs(Globle_An_TempPlayerPool[425422].playerID) do
		if CheckAcceptQuest(value,425422)==true and
			CheckDistance(value,OwnerID(),100)==true and 
			CheckBuff(value,622081)==true then
			SetFlag(value,546524,1)
			CancelBuff(value,622081)
			table.remove(Globle_An_TempPlayerPool[425422].playerID,value)
		end
	end
end

function LuaQ_425422_alreadyStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	callplot(Player,"DW_ChooseOneFromTwo",player,"[SC_QUESTEXECUTESURE_0]","LuaQ_425422_Yes","LuaQ_425422_No")
end

function LuaQ_425422_Yes()
	local player = OwnerID()
	AddBuff(player,622081,0,-1)
	local SoundID = PlaySoundToPlayer(player,"music/GuildWar/epic_tales_02_JFL_hellwars.mp3", false )
	Globle_An_TempPlayerPool[425422].music[SoundID] = player
	table.insert(Globle_An_TempPlayerPool[425422].playerID,player)	
end

function LuaQ_425422_No()
	return
end

 function Lua_AND_RANGEPLAYER(OBJ,NPC,QUESTNUM)	--關閉同時間開啟任務對話視窗的其他玩家
	local objtable = {}
	obj = obj or OwnerID()
	Npc = Npc or TargetID() 
       	 objtable=SearchRangePlayer(Npc,60)
		for i=0,table.getn(objtable),1 do
			if CheckAcceptQuest(objtable[i],QUESTNUM)==true then
				CloseSpeak(objtable[i])
			end
		end
end

--====================Q425423====================--
function LuaQ_425423_Check()
	local player = OwnerID()
	local Npc = TargetID()
	local Atable = {}
	
	LoadQuestOption(player)
	if CheckAcceptQuest(player,425423)==true 
		and CheckFlag(player,546525)==false then

		if ReadRoleValue(Npc,EM_RoleValue_Register9)==0 then
			Lua_AND_RANGEPLAYER(player,Npc,425423)	--用來關閉同時間開啟對話視窗的玩家
			AddSpeakOption(Player,player,"[SC_425423_0]","LuaQ_425423_QuestStart",0)		--第一個開啟者
		elseif ReadRoleValue(Npc,EM_RoleValue_Register9)<5 then
			AddSpeakOption(Player,player,"[SC_425423_0]","LuaQ_425423_alreadyStart",0)	--任務已有人開始，詢問是否省略部分劇情
		end		
	end
end

function LuaQ_425423_QuestStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	WriteRoleValue(Npc,EM_rolevalue_register9,1)
	Globle_An_TempPlayerPool = Globle_An_TempPlayerPool or {};
	Globle_An_TempPlayerPool[425423] = Globle_An_TempPlayerPool[425423] or {};
	Globle_An_TempPlayerPool[425423].playerID = {};
	Globle_An_TempPlayerPool[425423].npc = {};
	Globle_An_TempPlayerPool[425423].music = {};

	table.insert(Globle_An_TempPlayerPool[425423].playerID,player)

	CallPlot(player,"LuaQ_425423_Actor",player,npc)
end

function LuaQ_425423_Actor(player,Npc)
--CreateObjByFlag( Int ObjID, Int FlagObjID, Int FlagID, Int count )
	AddBuff(player,622082,0,-1)
	local XRoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local FlagNum = 781156
	local ActorPool = {}
	local ActorNum = {}
	ActorNum[120862]	=0
	ActorNum[120863]	=1
	ActorNum[120864]	=2
	ActorNum[120865]	=3
	ActorNum[120866]	=4
	ActorNum[120867]	=5
	ActorNum[120868]	=6
	for i=0,6 do
		ActorPool[i]=CreateObjByFlag( 120862+i,FlagNum,i,1 )
		table.insert(Globle_An_TempPlayerPool[425423].npc,ActorPool[i])
	end
	for i=1,6 do
		AddToPartition(ActorPool[i],XRoomID)
	end
	CallPlot(ActorPool[1],"LuaQ_425423_Show",player,Npc,ActorPool)
end

function LuaQ_425423_Show(player,Npc,ActorPool)
	local XRoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local SoundID = PlaySoundToPlayer( player, "music/zone/019/Village/sacral_spheres_02_DG2_old_monastery.mp3", false )
	Globle_An_TempPlayerPool[425423].music[SoundID] = player
	PlayMotion(ActorPool[0],148)
	sleep(10)
	AddToPartition(ActorPool[0],XRoomID)
	sleep(10)
	NPCSAY(ActorPool[0],"[SC_425423_1]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	Sleep(20)
	NPCSAY(ActorPool[1],"[SC_425423_2]")
	PlayMotion(ActorPool[1], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[1],"[SC_425423_3]")
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[6],"[SC_425423_4]")
	PlayMotion(ActorPool[6], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[1],"[SC_425423_5]")
	Lua_AND_NPCMOTION(ActorPool[1],ActorPool[6],1)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[6],"[SC_425423_6]")
	PlayMotion(ActorPool[6], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(30)
	NPCSAY(ActorPool[6],"[SC_425423_7]")
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[6],"[SC_425423_8]")
	PlayMotion(ActorPool[6], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[0],"[SC_425423_9]")
	PlayMotion(ActorPool[0], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[0],"[SC_425423_11]")
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[5],"[SC_425423_12]")
	Lua_AND_NPCMOTION(ActorPool[5],ActorPool[0],1)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[6],"[SC_425423_13]")
	Lua_AND_NPCMOTION(ActorPool[6],ActorPool[5],2)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	WriteRoleValue(Npc,EM_rolevalue_register9,6)
	sleep(20)	
	NPCSAY(ActorPool[5],"[SC_425423_14]")
	PlayMotion(ActorPool[5], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[5],"[SC_425423_15]")
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[6],"[SC_425423_16]")
	PlayMotion(ActorPool[6], ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[6],"[SC_425423_17]")
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	Lua_AND_NPCMOTION(ActorPool[5],ActorPool[6],2)
	NPCSAY(ActorPool[5],"[SC_425423_18]")
	sleep(5)
	Lua_AND_NPCMOTION(ActorPool[5],ActorPool[0],1)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[4],"[SC_425423_19]")
	Lua_AND_NPCMOTION(ActorPool[4],ActorPool[5],1)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[3],"[SC_425423_20]")
	Lua_AND_NPCMOTION(ActorPool[3],ActorPool[5],1)
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[6],"[SC_425423_21]")
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[0],"[SC_425423_22]")
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[0],"[SC_425423_23]")
	CallPlot(ActorPool[0],"LuaQ_425423_PlayerCheck",ActorPool[0],player,npc,ActorPool)
	sleep(10)
--	luaQ_425421_ActorMove(ActorPool[0],781156,7)
	LuaQ_425423_PlayerReward()
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622082)
	CallPlot(ActorPool[0],"LuaQ_425423_QuestEnd",ActorPool[0],player,npc,ActorPool)
end

function LuaQ_425423_QuestEnd(Actor0,player,npc,ActorPool)
	local Atable ={}
	for index,value in pairs(Globle_An_TempPlayerPool[425423].music) do
		StopSound(value,index)
	end
	Globle_An_TempPlayerPool[425423].playerID =nil	
	Globle_An_TempPlayerPool[425423].npc =nil
	Globle_An_TempPlayerPool[425423].music =nil
	Globle_An_TempPlayerPool[425423] =nil
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622082)
	for key,value in pairs(ActorPool) do
		DelObj(value)
	end
       	 Atable=SearchRangePlayer(Npc,80)
		for i=0,table.getn(Atable),1 do
			if CheckBuff(Atable[i],501570)==true then
				CancelBuff(Atable[i],501570)
			end
		end
	DelObj(Actor0)
end


function LuaQ_425423_PlayerCheck(Actor0,player,npc,ActorPool)
	if Globle_An_TempPlayerPool == nil then
		return
	else
		if Globle_An_TempPlayerPool[425423] == nil then
			return
		else
			if Globle_An_TempPlayerPool[425423].playerID == nil then
				return
			end
		end
	end
	local TempPlayerID = Globle_An_TempPlayerPool[425423].playerID
	local QuestTF = 0
	local DisTF = 0
	local playerNum = 0
	for key,value in pairs(TempPlayerID) do
		if CheckAcceptQuest(value,425423)==false then
			QuestTF = QuestTF +1
		end
		if CheckDistance(value,Actor0,100)==false then
			DisTF = DisTF +1
		end
		if QuestTF>=1 or DisTF>=1 then
			ScriptMessage( value, value, 0,"[SC_422974_FAILED]", 0 )
			ScriptMessage( value, value, 1,"[SC_422974_FAILED]", 0 )
			CancelBuff(value,622082)
			table.remove(TempPlayerID,key)
		end
	end
	
	for key,value in pairs(TempPlayerID) do
		if key ~= 0 then
			playerNum = playerNum + 1
		end
	end
	if playerNum == 0 then
		CallPlot(Actor0,"LuaQ_425423_QuestEnd",Actor0,player,npc,ActorPool)
	end
end

function LuaQ_425423_PlayerReward()
	for index,value in pairs(Globle_An_TempPlayerPool[425423].music) do
		StopSound(value,index)
	end
	for key,value in pairs(Globle_An_TempPlayerPool[425423].playerID) do
		if CheckAcceptQuest(value,425423)==true and
			CheckDistance(value,OwnerID(),100)==true and 
			CheckBuff(value,622082)==true then
			SetFlag(value,546525,1)
			CancelBuff(value,622082)
			table.remove(Globle_An_TempPlayerPool[425423].playerID,value)
		end
	end
end

function LuaQ_425423_alreadyStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	callplot(Player,"DW_ChooseOneFromTwo",player,"[SC_QUESTEXECUTESURE_0]","LuaQ_425423_Yes","LuaQ_425423_No")
end

function LuaQ_425423_Yes()
	local player = OwnerID()
	AddBuff(player,622082,0,-1)
	local SoundID = PlaySoundToPlayer( player, "music/zone/019/Village/sacral_spheres_02_DG2_old_monastery.mp3", false )
	Globle_An_TempPlayerPool[425423].music[SoundID] = player
	table.insert(Globle_An_TempPlayerPool[425423].playerID,player)	
end

function LuaQ_425423_No()
	return
end
