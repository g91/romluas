--=======================決裂=======================--
function LuaQ_425424_Check()
	local player = OwnerID()
	local Npc = TargetID()
	local Atable = {}
	
	LoadQuestOption(player)
	if CheckAcceptQuest(player,425424)==true 
		and CheckFlag(player,546525)==false then

		if ReadRoleValue(Npc,EM_RoleValue_Register9)==0 then
			Lua_AND_RANGEPLAYER(player,Npc,425424)	--用來關閉同時間開啟對話視窗的玩家
			AddSpeakOption(Player,player,"[SC_425424_0]","LuaQ_425424_QuestStart",0)		--第一個開啟者
		elseif ReadRoleValue(Npc,EM_RoleValue_Register9)<5 then
			AddSpeakOption(Player,player,"[SC_425424_0]","LuaQ_425424_alreadyStart",0)	--任務已有人開始，詢問是否省略部分劇情
		end		
	end
end

function LuaQ_425424_QuestStart()		--
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	WriteRoleValue(Npc,EM_rolevalue_register9,1)
	Globle_An_TempPlayerPool = Globle_An_TempPlayerPool or {};
	Globle_An_TempPlayerPool[425424] = Globle_An_TempPlayerPool[425424] or {};
	Globle_An_TempPlayerPool[425424].playerID = {};
	Globle_An_TempPlayerPool[425424].npc = {};
	Globle_An_TempPlayerPool[425424].music = {};

	table.insert(Globle_An_TempPlayerPool[425424].playerID,player)

	CallPlot(player,"LuaQ_425424_Actor",player,npc)
end

function LuaQ_425424_Actor(player,Npc)
--CreateObjByFlag( Int ObjID, Int FlagObjID, Int FlagID, Int count )
	AddBuff(player,622179,0,-1)
	local XRoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local FlagNum = 781154
	local ActorPool = {}
	local ActorNum = {}
	ActorNum[120921]	=9
	ActorNum[121081]	=13

		for index,value in pairs(ActorNum) do
		ActorPool[value]=CreateObjByFlag(index,FlagNum,value,1 )
		table.insert(Globle_An_TempPlayerPool[425424].npc,ActorPool[value])
		AddToPartition(ActorPool[value],XRoomID)
		end

	CallPlot(ActorPool[9],"LuaQ_425424_Show",player,Npc,ActorPool)
end

function LuaQ_425424_Show(player,Npc,ActorPool)
	local SoundID = PlaySoundToPlayer( player, "music/zone/004/zone004_music_reliquary_crater.mp3", false ); 
	Globle_An_TempPlayerPool[425424].music[SoundID] = player
	sleep(10)
	NPCSAY(ActorPool[9],"[SC_425424_1]")
	PlayMotion(ActorPool[9],ruFUSION_ACTORSTATE_EMOTE_CRY)
	CallPlot(ActorPool[9],"LuaQ_425424_PlayerCheck",ActorPool[9],player,npc,ActorPool)
	Sleep(20)
	NPCSAY(ActorPool[9],"[SC_425424_2]")
	AdjustFaceDir(ActorPool[9],player, 0 )
	PlayMotion(ActorPool[9],ruFUSION_ACTORSTATE_EMOTE_POINT)
	CallPlot(ActorPool[9],"LuaQ_425424_PlayerCheck",ActorPool[9],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[9],"[SC_425424_3]")
	PlayMotion(ActorPool[9],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	CallPlot(ActorPool[9],"LuaQ_425424_PlayerCheck",ActorPool[9],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[9],"[SC_425424_4]")
	CallPlot(ActorPool[9],"LuaQ_425424_PlayerCheck",ActorPool[9],player,npc,ActorPool)
	sleep(20)
	NPCSAY(ActorPool[9],"[SC_425424_5]")
	PlayMotion(ActorPool[9],ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
	CallPlot(ActorPool[9],"LuaQ_425424_PlayerCheck",ActorPool[9],player,npc,ActorPool)
	sleep(20)
	WriteRoleValue(Npc,EM_rolevalue_register9,6)
	NPCSAY(ActorPool[9],"[SC_425424_6]")
	PlayMotion(ActorPool[9],ruFUSION_ACTORSTATE_EMOTE_TIRED)
	CallPlot(ActorPool[9],"LuaQ_425424_PlayerCheck",ActorPool[9],player,npc,ActorPool)
	sleep(30)
	NPCSAY(ActorPool[9],"[SC_425424_7]")
	PlayMotion(ActorPool[9],ruFUSION_ACTORSTATE_EMOTE_POINT)
	CallPlot(ActorPool[9],"LuaQ_425424_PlayerCheck",ActorPool[9],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[9],"[SC_425424_8]")
	PlayMotion(ActorPool[9],ruFUSION_ACTORSTATE_EMOTE_TIRED)
	CallPlot(ActorPool[9],"LuaQ_425424_PlayerCheck",ActorPool[9],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[9],"[SC_425424_9]")
	PlayMotion(ActorPool[9],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	CallPlot(ActorPool[9],"LuaQ_425424_PlayerCheck",ActorPool[9],player,npc,ActorPool)
	sleep(20)	
	NPCSAY(ActorPool[9],"[SC_425424_10]")
	CallPlot(ActorPool[9],"LuaQ_425424_PlayerCheck",ActorPool[9],player,npc,ActorPool)
	DW_MoveToFlag(ActorPool[9],781154,12,0, 1)
	sleep(5)
	NPCSAY(ActorPool[13],"[SC_425424_11]")
	sleep(10)
	LuaQ_425424_PlayerReward()
	sleep(10)	
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622179)
	CallPlot(ActorPool[13],"LuaQ_425424_QuestEnd",ActorPool[9],player,npc,ActorPool)
end

function LuaQ_425424_QuestEnd(Actor,player,npc,ActorPool)
	local Atable = {}
	local TempPlayerID = Globle_An_TempPlayerPool[425424].playerID
	for key,value in pairs(TempPlayerID) do
		Lua_PlayBGM(value)
		CancelBuff(value,622179)
	end
	for index,value in pairs(Globle_An_TempPlayerPool[425424].music) do
		StopSound(value,index)
	end
	Globle_An_TempPlayerPool[425424].playerID =nil	
	Globle_An_TempPlayerPool[425424].npc =nil
	Globle_An_TempPlayerPool[425424].music =nil
	Globle_An_TempPlayerPool[425424] =nil
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622179)
	for key,value in pairs(ActorPool) do
		DelObj(value)
	end
       	 Atable=SearchRangePlayer(Npc,80)
		for i=0,table.getn(Atable),1 do
			if CheckBuff(Atable[i],501570)==true then
				CancelBuff(Atable[i],501570)
			end
		end
	DelObj(Actor)
end


function LuaQ_425424_PlayerCheck(Actor0,player,npc,ActorPool)
	if Globle_An_TempPlayerPool == nil then
		return
	else
		if Globle_An_TempPlayerPool[425424] == nil then
			return
		else
			if Globle_An_TempPlayerPool[425424].playerID == nil then
				return
			end
		end
	end
	local TempPlayerID = Globle_An_TempPlayerPool[425424].playerID
	local QuestTF = 0
	local DisTF = 0
	local playerNum = 0
	for key,value in pairs(TempPlayerID) do
		if CheckAcceptQuest(value,425424)==false then
			QuestTF = QuestTF +1
		end
		if CheckDistance(value,Actor0,100)==false then
			DisTF = DisTF +1
		end
		if QuestTF>=1 or DisTF>=1 then
			ScriptMessage( value, value, 0,"[SC_422974_FAILED]", 0 )
			ScriptMessage( value, value, 1,"[SC_422974_FAILED]", 0 )
			CancelBuff(value,622179)
			table.remove(TempPlayerID,key)
		end
	end
	
	for key,value in pairs(TempPlayerID) do
		if key ~= 0 then
			playerNum = playerNum + 1
		end
	end
	if playerNum == 0 then
		CallPlot(Actor0,"LuaQ_425424_QuestEnd",Actor0,player,npc,ActorPool)
	end
end

function LuaQ_425424_PlayerReward()
	for index,value in pairs(Globle_An_TempPlayerPool[425424].music) do
		StopSound(value,index)
	end	
	for key,value in pairs(Globle_An_TempPlayerPool[425424].playerID) do
		if CheckAcceptQuest(value,425424)==true and
			CheckDistance(value,OwnerID(),100)==true and 
			CheckBuff(value,622179)==true then
			SetFlag(value,546526,1)
			CancelBuff(value,622179)
			table.remove(Globle_An_TempPlayerPool[425424].playerID,value)
		end
	end
end

function LuaQ_425424_alreadyStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	callplot(Player,"DW_ChooseOneFromTwo",player,"[SC_QUESTEXECUTESURE_0]","LuaQ_425424_Yes","LuaQ_425424_No")
end

function LuaQ_425424_Yes()
	local player = OwnerID()
	AddBuff(player,622179,0,-1)
	local SoundID = PlaySoundToPlayer( player, "music/zone/004/zone004_music_reliquary_crater.mp3", false ); 
	Globle_An_TempPlayerPool[425424].music[SoundID] = player
	table.insert(Globle_An_TempPlayerPool[425424].playerID,player)	
end

function LuaQ_425424_No()
	return
end

--==================

function LuaQ_425015_ACCEPT()
	local Npc = OwnerID()
	local player = TargetID()
	local  Actor
	local NpcCtrl = ReadRoleValue(Npc,EM_RoleValue_Register9)
	if NpcCtrl == 0 then
		Actor=CreateObjByFlag( 119344,781154,10,1 )
		CallPlot(Actor,"LuaQ_425015_Drama",Actor,player,Npc)
	elseif NpcCtrl == 9 then
		AddBuff(player,622080,0,5)
		return	
	end
end


function LuaQ_425015_Drama(ctrl,player,Npc)
		local playerpool = SearchRangePlayer(npc,200)
		WriteRoleValue(Npc,EM_RoleValue_Register9,9)
		local XRoomID = ReadRoleValue(player ,EM_RoleValue_RoomID)
		AddBuff(player,622080,0,5)
		local  Actor0=CreateObjByFlag( 120818,781154,10,1 )
		SetModeEx(Actor0,EM_SetModeType_HideName,false)        
		AddToPartition(Actor0,XRoomID)
		sleep(5)
		luaQ_425421_ActorMove(Actor0,781154,11)
		SetRoleCampID(Actor0,3) 
		sleep(5)
		DelObj(Actor0)
		WriteRoleValue(Npc,EM_RoleValue_Register9,0)
		DelObj(ctrl)
end

function LuaQ_425015_SPEAK()
	local player = OwnerID()
	local Npc = TargetID()
	local TOrgID= ReadRoleValue(Npc,EM_RoleValue_OrgID)

	LoadQuestOption(player)
	if CheckAcceptQuest(player,425015)==true then
		if TOrgID==120860 then
			AddSpeakOption(Player,player,"[SC_425015_0]","LuaQ_425015_SPEAK_2(1)",0)	
		elseif TOrgID==120923 then
			AddSpeakOption(Player,player,"[SC_425015_0]","LuaQ_425015_SPEAK_2(2)",0)
		elseif TOrgID==120922 then
			AddSpeakOption(Player,player,"[SC_425015_0]","LuaQ_425015_SPEAK_2(3)",0)
		end
	end
	LoadQuestOption(player)
end

function LuaQ_425015_SPEAK_2(Num)
	local player = OwnerID()
	local Npc = TargetID()
	if Num==1 then
		SetSpeakDetail(player,"[SC_425015_1]")
		SetFlag(player,546529,1)
	elseif Num==2 then
		SetSpeakDetail(player,"[SC_425015_2]")
		SetFlag(player,546528,1)
	elseif Num==3 then
		SetSpeakDetail(player,"[SC_425015_3]")
		SetFlag(player,546527,1)
	end
end