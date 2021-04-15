
-------------------主線426311 異象------------------------
function LuaQ_426311_Speak()	--426311異像對話劇情，掛摩瑞克122651身上
	local player = OwnerID()
	local Npc = TargetID()
	LoadQuestOption(player )
	if CheckAcceptQuest(player ,426311)==true and 
		   CheckFlag(player ,548215)==false   then
		AddSpeakOption(player ,Npc,"[SC_426311_SPEAK]","LuaQ_426311_Ctrl",0)
	end
		LoadQuestOption(player )
end

function LuaQ_426311_Ctrl()	--產生一個中控器
	local player = OwnerID()
	local Npc = TargetID()	
	local RoomID = ReadRoleValue(Npc ,EM_RoleValue_RoomID)
	local Tplayer = SearchRangePlayer(Npc ,200)
	local ctrl = 0
	if    ReadRoleValue(Npc,EM_RoleValue_Register1)==0 then
		for i=0,#Tplayer do
			if CheckAcceptQuest(Tplayer[i] ,426311)==true then
				AddBuff(Tplayer[i],620001,0,2)
				Setflag(Tplayer[i],548196,1)
			end
		end
		WriteRoleValue(Npc,EM_RoleValue_Register1,1)
		ctrl = CreateObj_ByObjPoint(Npc,122689,"p_down") 
		SetModeEx(ctrl ,EM_SetModeType_Show,false)
		SetModeEx(ctrl ,EM_SetModeType_Mark,false)
		AddToPartition(ctrl ,RoomID)

		CallPlot(ctrl,"LuaQ_426311_Monster",ctrl,Npc,player )

		closespeak(player)
	else
		SetSpeakDetail(player ,"[SC_426311_STARTED]")
	end
end


function LuaQ_426311_Monster(ctrl,Npc,player )	--中控控制進度
	local RoomID = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
	local Monster = Lua_CreateObjByDir( ctrl , 107849 , 80 , 0)
	local Tplayer = 0
-------
	sleep(10)
	AddToPartition(Monster,RoomID)
	SetAttack( Monster , player ) 

--	CallPlot(Monster,"LuaS_Monster_die",Monster,npc,ctrl)	--怪物脫離戰鬥後刪除
-------	
	while true do
		--DebugMsg(0,0,"under while")
		if ReadRoleValue(Monster,EM_RoleValue_IsDead)==1 then
			--DebugMsg(0,0,"Monster IsDead")
			Tplayer = SearchRangePlayer(Monster ,250)
			for player=0,#Tplayer  do
				if CheckAcceptQuest(Tplayer[player],426311)==true and
				   CheckBuff(Tplayer[player],624546)==true then
					ScriptMessage(Tplayer[player],Tplayer[player],3,"[SC_426311_0]",0)
					sleep(10)
					CancelBuff(Tplayer[player],624546)
					SetFlag(Tplayer[player],548215,1)
					AddBuff(Tplayer[player],620001,0,4)
					DelObj(Monster)
				end	
			end
			WriteRoleValue(npc,EM_RoleValue_Register1,0)
			DelObj(ctrl)
		elseif CheckID(Monster)==false or ReadRoleValue(Monster,EM_RoleValue_IsAttackMode)==0  then
			Tplayer = SearchRangePlayer(Monster,200)
			for player=0,#Tplayer do
				if CheckAcceptQuest(Tplayer[player] ,426311)==true then
					AddBuff(Tplayer[player],620001,0,2)
				end
				Setflag(Tplayer[player],548196,0)
			end
				WriteRoleValue(npc,EM_RoleValue_Register1,0)
				DelObj(Monster)
				DelObj(ctrl)
		end
		sleep(30)
		--DebugMsg(0,0,"one cycle")
	end
end

function LuaQ_426311_Monster_dead()	--迷樣的巨型制裁者死亡劇情
	local playerlist= {}
	playerlist= DW_HateSequence(0)
	for i=1,#playerlist do
		if CheckAcceptQuest(playerlist[i],426311) == true then
			AddBuff(playerlist[i],624546,0,15)
		end
	end
end

function LuaS_Monster_die()			--No target then delobj怪物脫離戰鬥後刪除
	local mahate = 0
	local Tplayer = SearchRangePlayer(OwnerID(),200)
		mahate = HateListCount(OwnerID())

	if ReadRoleValue(OwnerID(),EM_RoleValue_IsDead)==0 then
			if mahate == 0 then
				for i=0,#Tplayer do
					if CheckAcceptQuest(Tplayer[i] ,426311)==true then
						AddBuff(Tplayer[i],620001,0,2)
					end
					Setflag(Tplayer[i],548196,0)
				end
				DelObj(OwnerID())
			end
	else
		return

	end
end


----------------------------------------
function LuaQ_426312_Speak()	--122652威爾對話，任務426312危機
	local player = OwnerID()
	local Npc = TargetID()
		if CheckAcceptQuest(player,426312)==true and CheckFlag(player,548216)==false then
			AddSpeakOption(player,npc,"[SC_424532_1]","FN_Quest_Acting_plot(426312, 623824, \"Z26_FN_Q426312_Act_Main\")",0)
		end
	LoadQuestOption(player)	
end

--function LuaQ_426312_set_actor()

--end

----------------------------------------
function LuaQ_426313_Say()		--準備封印，掛在平衡神使122655上
	local player = OwnerID()
	local Npc = TargetID()
	if CheckAcceptQuest(player,426313)==true and CheckFlag(player,548217)==false then
		AddSpeakOption(player,Npc,"[SC_426313_0]","LuaQ_426313_0",0)		--摩瑞克會成為什麼?
	end	
	LoadQuestOption(player)
end

function LuaQ_426313_0()		
	local player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(player,"[SC_426313_1]")	
	AddSpeakOption(player,Npc,"[SC_426313_2]","LuaQ_426313_1",0)
end

function LuaQ_426313_1()		
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_426313_3]")	
	SetFlag(player,548217,1)
end

------------------------------------------
function LuaQ_426316_morrok_Say()	--封印儀式，掛在摩瑞克122728上
	local player = OwnerID()
	local Npc = TargetID()
	if CheckAcceptQuest(player,426316)==true and CheckFlag(player,548218)==false then
		AddSpeakOption(player,Npc,"[SC_Q426316_0]","LuaQ_426316_morrok_0",0)		
	end	
	LoadQuestOption(player)
end

function LuaQ_426316_morrok_0()		
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_Q426316_1]")	
	SetFlag(player,548218,1)
end


function LuaQ_426316_bank_Say()		--封印儀式，掛在平衡神使122657上
	local player = OwnerID()
	local Npc = TargetID()
	if CheckAcceptQuest(player,426316)==true and CheckFlag(player,548219)==false then
		AddSpeakOption(player,Npc,"[SC_Q426316_2]","LuaQ_426316_bank_0",0)
	elseif CheckAcceptQuest(player,426316)==true and CheckFlag(player,548219)==true and CheckFlag(player,548221)==false then	
		AddSpeakOption(player,Npc,"[SC_Q426316_2]","LuaQ_426316_bank_0",0)	
	end	
	LoadQuestOption(player)
end

function LuaQ_426316_bank_0()		
	local player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(player,"[SC_Q426316_3]")	
	AddSpeakOption( player , Npc , "[SC_Q426316_4]", "FN_Quest_Acting_plot(426316, 623824, \"Z26_FN_Q426316_Act_Main\")", 0 )
	SetFlag(player,548219,1)
end

--function LuaQ_426316_bank_1()		
	
--end

------------------------------------------
function LuaQ_426315_accpect()
	local ShowFlag = 780950		
	local Npc= OwnerID()
	local player  = TargetID()
	local mok = Lua_DW_CreateObj( "obj",122174,Npc ,1 , 1)
	AddBuff(player,622179,0,2)
	DW_Move("flag",mok ,ShowFlag,1)
	sleep(10)
	DelObj(mok )
end

function LuaQ_426316_accpect()
	local ShowFlag = 780950		
	local Npc= OwnerID()
	local player  = TargetID()
	local Jill = Lua_DW_CreateObj( "obj",122175,Npc ,1 , 1)
	AddBuff(player,622179,0,2)
	DW_Move("flag",Jill ,ShowFlag,2)
	sleep(10)
	DelObj(Jill )
end