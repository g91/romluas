function Lua_RevivalStone()
	local Npc = OwnerID()
	AddBuff(Npc,621733,0,-1)
end

--村民用
function Z24_resident_buff()
	local Obj = OwnerID()
	local OPid = ReadRoleValue(Obj,EM_RoleValue_PID)
	if OPid == 1 then
		AddBuff(obj,622850,0,-1)	--blue
	elseif OPid == 2 then
		AddBuff(obj,622859,0,-1)	--yellow
	else 
		AddBuff(obj,622852,0,-1)	--red
	end
end



function LuaQ_425232_OBJ()
	local obj = OwnerID()
	local ObjX = ReadRoleValue(obj,EM_rolevalue_X)
	local ObjY = ReadRoleValue(obj,EM_rolevalue_Y)
	local ObjZ = ReadRoleValue(obj,EM_rolevalue_Z)
	local objRoom = ReadRoleValue(obj,EM_RoleValue_RoomID)
	local ball = CreateObj(121231,ObjX,ObjY+60,ObjZ,0,1)
	SetModeEx( ball , EM_SetModeType_Gravity , false )
	SetModeEx( ball , EM_SetModeType_move , false )	
	AddToPartition(ball,objRoom)
end

function LuaQ_Z24_GHOST()
	local TRoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Ghost = {121426,121427}
	local GhostNpc
	local Ran = 0

	while true do
		Ran = DW_rand(2)
		GhostNpc = LuaFunc_CreateObjByObj ( Ghost[Ran] , OwnerID() ) 
		AddToPartition(GhostNpc,TRoomID)
		Sleep(20)
		DelObj(GhostNpc)
		Sleep(150)
		Ran = 0
	end
end

function LuaQ_425640_Check()	--實話與謊言，與威爾對話後開啟的表演
	local player = OwnerID()
	local Npc = TargetID()
	local Atable = {}
	
	LoadQuestOption(player)
	if CheckCompleteQuest(Player,425639)==true and 
	   CheckFlag(Player,547353)==false and 
	   CheckAcceptQuest(Player,425640)==false then

		if ReadRoleValue(Npc,EM_RoleValue_Register9)==0 then
			Lua_AND_RANGEPLAYER(player,Npc,425424)	--用來關閉同時間開啟對話視窗的玩家
			AddSpeakOption(Player,player,"[SC_422575]".."[SC_CLICK_START_SHOW]","LuaQ_425640_QuestStart",0)	--第一個開啟者
		elseif ReadRoleValue(Npc,EM_RoleValue_Register9)<5 then
			AddSpeakOption(Player,player,"[SC_422575]".."[SC_CLICK_START_SHOW]","LuaQ_425640_alreadyStart",0)	--任務已有人開始，詢問是否省略部分劇情
		end		
	end
end

function LuaQ_425640_QuestStart()		--
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	WriteRoleValue(Npc,EM_rolevalue_register9,1)
	Globle_An_TempPlayerPool = Globle_An_TempPlayerPool or {};
	Globle_An_TempPlayerPool[425640] = Globle_An_TempPlayerPool[425640] or {};
	Globle_An_TempPlayerPool[425640].playerID = {};
	Globle_An_TempPlayerPool[425640].npc = {};
	Globle_An_TempPlayerPool[425640].music = {};

	table.insert(Globle_An_TempPlayerPool[425640].playerID,player)

	CallPlot(player,"LuaQ_425640_Actor",player,npc)
end

function LuaQ_425640_Actor(player,Npc)
--CreateObjByFlag( Int ObjID, Int FlagObjID, Int FlagID, Int count )
	AddBuff(player,623823,0,-1)
	local XRoomID = ReadRoleValue(npc,EM_RoleValue_RoomID)
	local FlagNum = 781248
	local ActorPool = {}
	local ActorNum = {}
	ActorNum[121680]	=4
	ActorNum[121681]	=5

		for index,value in pairs(ActorNum) do
		ActorPool[value]=CreateObjByFlag(index,FlagNum,value,1 )
		table.insert(Globle_An_TempPlayerPool[425640].npc,ActorPool[value])
		AddToPartition(ActorPool[value],XRoomID)
		end

	CallPlot(ActorPool[4],"LuaQ_425640_Show",player,Npc,ActorPool)
end

function LuaQ_425640_Show(player,Npc,ActorPool)
	local SoundID = PlaySoundToPlayer( player, "music/zone/004/zone004_music_reliquary_crater.mp3", false ); 
	Globle_An_TempPlayerPool[425640].music[SoundID] = player
	sleep(10)
	NPCSAY(ActorPool[4],"[SC_425640_SCMD_0]")
	PlayMotion(ActorPool[4],ruFUSION_ACTORSTATE_EMOTE_POINT)
	CallPlot(ActorPool[4],"LuaQ_425640_PlayerCheck",ActorPool[5],player,npc,ActorPool)
	Sleep(20)
	NPCSAY(ActorPool[4],"[SC_425640_SCMD_1]")
	PlayMotion(ActorPool[4],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	CallPlot(ActorPool[4],"LuaQ_425640_PlayerCheck",ActorPool[5],player,npc,ActorPool)
	Sleep(20)
	NPCSAY(ActorPool[4],"[SC_425640_SCMD_2]")
	CallPlot(ActorPool[4],"LuaQ_425640_PlayerCheck",ActorPool[5],player,npc,ActorPool)
	Sleep(20)
	WriteRoleValue(Npc,EM_rolevalue_register9,6)
	NPCSAY(ActorPool[4],"[SC_425640_SCMD_3]")
	CallPlot(ActorPool[4],"LuaQ_425640_PlayerCheck",ActorPool[5],player,npc,ActorPool)
	Sleep(20)
	NPCSAY(ActorPool[4],"[SC_425640_SCMD_4]")
	CallPlot(ActorPool[4],"LuaQ_425640_PlayerCheck",ActorPool[5],player,npc,ActorPool)
	Sleep(20)
	NPCSAY(ActorPool[4],"[SC_425640_SCMD_5]")
	CallPlot(ActorPool[4],"LuaQ_425640_PlayerCheck",ActorPool[5],player,npc,ActorPool)
	Sleep(20)
	NPCSAY(ActorPool[4],"[SC_425640_SCMD_6]")
	CallPlot(ActorPool[4],"LuaQ_425640_PlayerCheck",ActorPool[5],player,npc,ActorPool)
	Sleep(20)	
	LuaQ_425640_PlayerReward()
	sleep(10)	
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,622179)
	CallPlot(ActorPool[4],"LuaQ_425640_QuestEnd",ActorPool[4],player,npc,ActorPool)
end

function LuaQ_425640_QuestEnd(Actor,player,npc,ActorPool)
	local TempPlayerID = Globle_An_TempPlayerPool[425640].playerID
	for key,value in pairs(TempPlayerID) do
		Lua_PlayBGM(value)
		CancelBuff(value,623823)
	end
	for index,value in pairs(Globle_An_TempPlayerPool[425640].music) do
		StopSound(value,index)
	end
	Globle_An_TempPlayerPool[425640].playerID =nil	
	Globle_An_TempPlayerPool[425640].npc =nil
	Globle_An_TempPlayerPool[425640].music =nil
	Globle_An_TempPlayerPool[425640] =nil
	WriteRoleValue(Npc,EM_rolevalue_register9,0)
	CancelBuff(player,623823)
	for key,value in pairs(ActorPool) do
		DelObj(value)
	end
	DelObj(Actor)
end

function LuaQ_425640_PlayerCheck(Actor0,player,npc,ActorPool)
	local TempPlayerID = Globle_An_TempPlayerPool[425640].playerID
	local DisTF = 0
	local playerNum = 0
	for key,value in pairs(TempPlayerID) do
		if CheckDistance(value,Actor0,100)==false then
			DisTF = DisTF +1
		end
		if  DisTF>=1 then
			ScriptMessage( value, value, 0,"[SC_422974_FAILED]", 0 )
			ScriptMessage( value, value, 1,"[SC_422974_FAILED]", 0 )
			CancelBuff(value,623823)
			table.remove(TempPlayerID,key)
		end
	end
	
	for key,value in pairs(TempPlayerID) do
		if key ~= 0 then
			playerNum = playerNum + 1
		end
	end
	if playerNum == 0 then
		CallPlot(Actor0,"LuaQ_425640_QuestEnd",Actor0,player,npc,ActorPool)
	end
end

function LuaQ_425640_PlayerReward()
	for index,value in pairs(Globle_An_TempPlayerPool[425640].music) do
		StopSound(value,index)
	end	
	for key,value in pairs(Globle_An_TempPlayerPool[425640].playerID) do

	if CheckCompleteQuest(value,425639)==true and 
	   CheckFlag(value,547353)==false and 
	   CheckDistance(value,OwnerID(),100)==true and 
	   CheckBuff(value,623823)==true then
			SetFlag(value,547353,1)
			SetFlag(value,547343,1)
			CancelBuff(value,623823)
			table.remove(Globle_An_TempPlayerPool[425640].playerID,value)
		end
	end
end

function LuaQ_425640_alreadyStart()
	local player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	callplot(Player,"DW_ChooseOneFromTwo",player,"[SC_QUESTEXECUTESURE_0]","LuaQ_425640_Yes","LuaQ_425640_No")
end

function LuaQ_425640_Yes()
	local player = OwnerID()
	AddBuff(player,623823,0,-1)
	local SoundID = PlaySoundToPlayer( player, "music/zone/004/zone004_music_reliquary_crater.mp3", false ); 
	Globle_An_TempPlayerPool[425640].music[SoundID] = player
	table.insert(Globle_An_TempPlayerPool[425640].playerID,player)	
end

function LuaQ_425640_No()
	return
end