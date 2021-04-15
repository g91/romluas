-----------------------------------------------------------424510:新的決策-------------------------------------------------------------------------------------------
function LuaS_dr119035_0()								--新的決策，螢火
	local own = OwnerID()
	local tar = TargetID()
	LoadQuestOption(own)
		if CheckAcceptQuest( own,  424510 )==true then
			AddSpeakOption(own,tar,"[SC_119035_1]","LuaS_dr119035_1",0)
		else
			LoadQuestOption(own)
		end
end

function LuaS_dr119035_1()	  							
	local own = OwnerID()
	local tar = TargetID()
	CloseSpeak(own)
	GiveBodyItem(own,545086,1)
	AddBuff(own,620662,0,7)
	BeginPlot(own,"LuaS_dr119035_2",0)
end

function LuaS_dr119035_2()	  							
	local dog = Lua_DW_CreateObj( "flag" , 119019 , 780998 , 0 , 1 , 1 )
	DW_MoveDirectToFlag( dog , 780998 , 1 , 1  )
	say(dog,"[SC_423493_0]")
	sleep(50)
	DelObj(dog)
end

function LuaS_dr119040_0()								--新的決策，蜜朵娜
	local own = OwnerID()
	local tar = TargetID()
	LoadQuestOption(own)
		if CheckAcceptQuest( own,  424510 )==true then
			AddSpeakOption(own,tar,"[SC_119035_1]","LuaS_dr119040_1",0)
		else
			LoadQuestOption(own)
		end
end

function LuaS_dr119040_1()	  							
	local own = OwnerID()
	local tar = TargetID()
	CloseSpeak(own)
	GiveBodyItem(own,545085,1)
	AddBuff(own,620662,0,7)
	BeginPlot(own,"LuaS_dr119040_2",0)
end

function LuaS_dr119040_2()	  							--
	local cat = Lua_DW_CreateObj( "flag" , 119018 , 780998 , 2 , 1 , 1 )
	DW_MoveDirectToFlag( cat , 780998 , 3 , 1  )
	say(cat,"[SC_423493_0]")
	sleep(50)
	DelObj(cat)
end
--------------------------------------------------------------------------------------------------------------------------------------
function LuaS_119027_0()								--薩爾多堡外3半龍人
	local own=OwnerID()
	local Tar=TargetID()
	LoadQuestOption(own)
end
--------------------------------------------------------------------------------------------------------------------------------------
function LuaS_dr424516_0()								--流落的王儲
	local own = OwnerID()
	local tar = TargetID()
	LoadQuestOption(own)
		if CheckAcceptQuest( own,  424516 )==true then
			AddSpeakOption(own,tar,"[SC_424516_00]","LuaS_dr424516_1",0)
		else
			LoadQuestOption(own)
		end
end

function LuaS_dr424516_1()	  							
	local own = OwnerID()
	local tar = TargetID()
	SetSpeakDetail( own, "[SC_424516_0]" )
	AddSpeakOption(own,tar,"[SC_424516_01]","LuaS_dr424516_2",0)
end

function LuaS_dr424516_2()	  							
	local own = OwnerID()
	local tar = TargetID()
	SetSpeakDetail( own, "[SC_424516_1]" )
	AddSpeakOption(own,tar,"[SC_424516_02]","LuaS_dr424516_3",0)
end

function LuaS_dr424516_3()	  							
	local own = OwnerID()
	local tar = TargetID()
	SetSpeakDetail( own, "[SC_424516_2]" )
	SetFlag(own,545518,1)
end
--------------------------------------------------------------------------------------------------------------------------------------
function LuaS_424514_bag0()								--籠中的海鷗
	local own=OwnerID()
	local tar = TargetID()						
	LoadQuestOption(own)
		if CheckAcceptQuest(own,424514)==true and
	   		CountBodyItem(own,240545)>=1 then
			AddSpeakOption(own,tar,"[SC_424514_0]","LuaS_424514_bag1",0)
		else
			LoadQuestOption(own)
		end	
end

function LuaS_424514_bag1()
	local own=OwnerID()
	local Tar=TargetID()
	CloseSpeak(own)
	SetFlag(Own,545500,1)
	SetFlag(Own,545499,1)
	AddBuff(Own,620662,0,-1)
	DelBodyItem(Own,240545,1)
	callPlot(Tar,"LuaS_424514_bag2",own,Tar)
end

function LuaS_424514_bag2(own,Tar)
	local Man = Lua_DW_CreateObj("obj",118973 ,Tar)
	PlayMotion(Man,ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	sleep(10)
	AddBuff(Man,620029,0,5)
	sleep(10)
	DelObj(Man)
	sleep(10)
	local Man=Lua_DW_CreateObj( "flag" , 118973 , 781000 , 0 , 1 , 1 )
	WriteRoleValue(Man ,EM_RoleValue_IsWalk , 1 ) 
	DW_MoveDirectToFlag( Man, 781000 , 1 , 1  )
	PlayMotion(Man, ruFUSION_ACTORSTATE_BUFF_BEGIN )
	PlayMotion(Man, 101 )
	sleep(10)
	Say(Man,"[SC_424514_1]")
	sleep(20)
	DelObj(Man)
	CancelBuff(Own,620662)
end
-------------------------------------------------------------------------------------------------------------------------------
function LuaS_424515_guard()									--反抗軍的接見
	local player=OwnerID()
	local npc=TargetID()					
	LoadQuestOption(player)
		if (CheckAcceptQuest(player,424515)==true and CountBodyItem(player,240547)<=1 )then
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","LuaS_424515_Pass_1",0)
		elseif  CheckCompleteQuest(player,424515) == true then
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_rebel_say",0)
		else 
			LoadQuestOption(player)
		end	
end

function LuaS_424515_Pass_1()
	local player=OwnerID()
	local npc=TargetID()
	SetSpeakDetail(player,"[SC_SECRET_SIGN_02][SC_SECRET_SIGN_03]")
	AddSpeakOption(player,npc,"[SC_424515_SEE]","LuaS_424515_Pass_2",0)
end

function LuaS_424515_Pass_2()
	local player=OwnerID()
	local npc=TargetID()
	SetSpeakDetail(player,"[SC_424515_SEE_2]")
	SetFlag(player,545517,1)
end

-------------------------------------------------------------------------------------------------------------------------------
function NPCSAY_RAGEMANE()			--怒鬃族
	local monster = OwnerID()
	local sentence = {
			[1]="[SC_RAGEMANE_01]",
			[2]="[SC_RAGEMANE_02]",
			[3]="[SC_RAGEMANE_03]",
			[4]="[SC_RAGEMANE_04]",
			[5]="[SC_RAGEMANE_05]"
			}
	local sentenceRand = Rand(5)+1
	npcsay(monster,sentence[sentenceRand])
end

-------------------------------------------------------------------------------------------------------------------------------
function secret_people_start()				--村民對話劇情
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		if	CheckCompleteQuest(player,424515) == true then
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_people_say",0)
		else 
			LoadQuestOption(player)
		end
end

function secret_people_say()
	local player=OwnerID()
	local sentence = {
			[1]="[SC_SECRET_PEOPLE01]",
			[2]="[SC_SECRET_PEOPLE02]",
			[3]="[SC_SECRET_PEOPLE03]",
			[4]="[SC_SECRET_PEOPLE04]",
			[5]="[SC_SECRET_PEOPLE05]"
			}
	local sentenceRand = Rand(5)+1
	SetSpeakDetail(player,sentence[sentenceRand])
end
-------------------------------------------------------------------------------------------------------------------------------
function secret_rebel_start()--反抗軍對話劇情
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		if	CheckCompleteQuest(player,424515) == true then
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_rebel_say",0)
		else 
			LoadQuestOption(player)
		end
end

function secret_rebel_say()
	local player=OwnerID()
	local sentence = {
			[1]="[SC_SECRET_REBEL01]",
			[2]="[SC_SECRET_REBEL02]",
			[3]="[SC_SECRET_REBEL03]",
			[4]="[SC_SECRET_REBEL04]",
			[5]="[SC_SECRET_REBEL05]"
			}
	local sentenceRand = Rand(5)+1
	SetSpeakDetail(player,sentence[sentenceRand])
end
-------------------------------------------------------------------------------------------------------------------------------

function LuaQ_424513_ASKING()		--失蹤樵夫...村民對話劇情
	local player = OwnerID()
	local npc = TargetID()
	AddSpeakOption( player , npc , "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 ) --我想看看你賣的配方。
	LoadQuestOption(player)
		if	CheckAcceptQuest(player,424513) == true and 
			CheckCompleteQuest(player,424513) == false then 
			AddSpeakOption(player,npc,"[SC_424513_ASK]","LuaQ_424513_ANSWER",0)
		elseif 	CheckCompleteQuest(player,424515) == true then 
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_people_say",0)
		else 
			LoadQuestOption(player)
		end
end

function LuaQ_424513_ANSWER()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_424513_ANSWER]")
end

-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_424511_Message1_0()		--雷奇夫王國的近況，對話劇情
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		if	CheckAcceptQuest(player,424511) == true and 
			CheckCompleteQuest(player,424511) == false then 
			AddSpeakOption(player,npc,"[SC_424511_MESSAGE_Q1]","LuaQ_424511_Message1_1",0)
		elseif 	CheckCompleteQuest(player,424515) == true then 
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_people_say",0)
		else 
			LoadQuestOption(player)
		end
end

function LuaQ_424511_Message1_1()
	local player = OwnerID()
	local npc = TargetID()
	SetSpeakDetail(player,"[SC_424511_MESSAGE1_0]")
	AddSpeakOption(player,npc,"[SC_424511_MESSAGE_Q2]","LuaQ_424511_Message1_2",0)
end

function LuaQ_424511_Message1_2()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_424511_MESSAGE1_1]")
	SetFlag(player,545087,1)
end

function LuaQ_424511_Message2_0()		--王儲鬥爭，對話劇情
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
	AddSpeakOption( player , npc , "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 ) --我想看看你賣的配方。
		if	CheckAcceptQuest(player,424511) == true and 
			CheckCompleteQuest(player,424511) == false then 
			AddSpeakOption(player,npc,"[SC_424511_MESSAGE_Q1]","LuaQ_424511_Message2_1",0)
		elseif 	CheckCompleteQuest(player,424515) == true then 
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_people_say",0)
		else 
			LoadQuestOption(player)
		end
end

function LuaQ_424511_Message2_1()
	local player = OwnerID()
	local npc = TargetID()
	SetSpeakDetail(player,"[SC_424511_MESSAGE2_0]")
	AddSpeakOption(player,npc,"[SC_424511_MESSAGE_Q3]","LuaQ_424511_Message2_2",0)
end

function LuaQ_424511_Message2_2()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_424511_MESSAGE2_1]")
	SetFlag(player,545088,1)
end

function LuaQ_424511_Message3_0()		--王國軍與反抗軍，對話劇情
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		if	CheckAcceptQuest(player,424511) == true and 
			CheckCompleteQuest(player,424511) == false then 
			AddSpeakOption(player,npc,"[SC_424511_MESSAGE_Q1]","LuaQ_424511_Message3_1",0)
		elseif 	CheckCompleteQuest(player,424515) == true then 
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_people_say",0)
		else 
			LoadQuestOption(player)
		end
end

function LuaQ_424511_Message3_1()
	local player = OwnerID()
	local npc = TargetID()
	SetSpeakDetail(player,"[SC_424511_MESSAGE3_0]")
	AddSpeakOption(player,npc,"[SC_424511_MESSAGE_Q4]","LuaQ_424511_Message3_2",0)
end

function LuaQ_424511_Message3_2()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_424511_MESSAGE3_1]")
	SetFlag(player,545136,1)
end
-------------------------------------------------------------------------------------------------------------------------------
function LuaS_424466_food()	--配發補給
	local player = OwnerID()
	local npc = TargetID()
	local rebelOrgID = readrolevalue(npc,EM_RoleValue_OrgID)
	local rebels = {}
	rebels[119195] = 545532;
	rebels[119196] = 545533;
	rebels[119198] = 545534;
	rebels[119203] = 545535;
	LoadQuestOption(player)
	for key,value in pairs(rebels) do
		if	CheckAcceptQuest(player,424466) == true and 
			countbodyitem(player,240599)>0 and	
			checkflag(player,rebels[rebelOrgID])==false then
			AddSpeakOption(player,npc,"[SC_424466_GIVE]","LuaS_424466_rebel",0)
			break
		elseif 	CheckCompleteQuest(player,424515) == true then 
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_rebel_say",0)
			break
		else
			LoadQuestOption(player)
		end
	end
end

function LuaS_424466_rebel()
	local rebels = {}
	rebels[119195] = 545532;
	rebels[119196] = 545533;
	rebels[119198] = 545534;
	rebels[119203] = 545535;
	local player = OwnerID()
	local npc = TargetID()
	local rebelOrgID = readrolevalue(npc,EM_RoleValue_OrgID)
	for key,value in pairs(rebels) do
		if countbodyitem(player,rebels[rebelOrgID])<1 and
		countbodyitem(player,240599)>0 then	
			if rebelOrgID == key then
				delbodyitem(player,240599,1)
				setflag(player,rebels[rebelOrgID],1)
				CloseSpeak(Player)
			end			
		end
	end
end-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_424429_POPCORN01()		--爆米花大叔
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		if    	(CheckAcceptQuest(player,424429) == true or 
			CheckAcceptQuest(player,424430) == true) and 
			CountBodyItem(player,240604)>0 then 
			AddSpeakOption(player,npc,"[SC_424429_POPCORN01]","LuaQ_424429_POPCORN02",0)
		elseif	CheckCompleteQuest(player,424515) == true then 
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_people_say",0)
		else 
			LoadQuestOption(player)
		end
end

function LuaQ_424429_POPCORN02()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_424429_POPCORN02]")
	DelBodyItem(player,240604,1)
	GiveBodyItem(player,240549,3)
end

-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_424513_BIRD()		--休斯
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		if	CheckCompleteQuest(player,424513) == true and CheckCompleteQuest(player,424515) == true then
			AddSpeakOption(player,npc,"[SC_424513_BIRD01]","LuaQ_424513_BIRD01",0)
			AddSpeakOption(player,npc,"[SC_424513_BIRD03]","LuaQ_424513_BIRD02",0)
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_rebel_say",0)
		elseif	CheckCompleteQuest(player,424513) == true then 
			AddSpeakOption(player,npc,"[SC_424513_BIRD01]","LuaQ_424513_BIRD01",0)
			AddSpeakOption(player,npc,"[SC_424513_BIRD03]","LuaQ_424513_BIRD02",0)
		else
			LoadQuestOption(player)
		end
end

function LuaQ_424513_BIRD01()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_424513_BIRD02]")
end

function LuaQ_424513_BIRD02()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_424513_BIRD04]")
end
-------------------------------------------------------------------------------------------------------------------------------

function LuaQ_424442_STORY()		--石碑
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		if	CheckCompleteQuest(player,424442) == true then 
			AddSpeakOption(player,npc,"[SC_424442_STORY01]","LuaQ_424442_STORY02",0)
		else
			LoadQuestOption(player)
		end
end

function LuaQ_424442_STORY02()
	local player = OwnerID()
	local npc = TargetID()
	SetSpeakDetail(player,"[SC_424442_STORY02]")
	AddSpeakOption(player,npc,"[SC_424516_01]","LuaQ_424442_STORY03",0)
end

function LuaQ_424442_STORY03()
	local player = OwnerID()
	SetSpeakDetail(player,"[SC_424442_STORY03]")
end


function LuaQ_119200_SAY()		
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		AddSpeakOption( player , npc , "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 ) --我想看看你賣的配方。
		if 	CheckCompleteQuest(player,424515) == true then 
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_rebel_say",0)
		else 
			LoadQuestOption(player)
		end

end


function LuaQ_119201_SAY()		
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		AddSpeakOption( player , npc , "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 ) --我想看看你賣的配方。
		if 	CheckCompleteQuest(player,424515) == true then 
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_rebel_say",0)
		else 
			LoadQuestOption(player)
		end
end

function LuaQ_118981_SAY()
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		AddSpeakOption( player , npc , "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 ) --我想看看你賣的配方。
		if 	CheckCompleteQuest(player,424515) == true then 
			AddSpeakOption(player,npc,"[SC_SECRET_SIGN_01]","secret_people_say",0)
		else 
			LoadQuestOption(player)
		end
end

-------------------------------------------------------------------------------------------------------------------------------
function LuaS_Z21DR_NPCSAY01()
	local npc = OwnerID()
	local sentence = {
			[1]="[SC_Z21DR_NPC01]",
			[2]="[SC_Z21DR_NPC02]",
			[3]="[SC_Z21DR_NPC03]",
			[4]="[SC_Z21DR_NPC04]"
			}
	local sentenceRand = DW_Rand(4)
	NPCsay(npc,sentence[sentenceRand])
end

function LuaS_Z21DR_NPCSAY02()
	local npc = OwnerID()
	NPCsay(npc,"[SC_Z21DR_NPC05]")
end

function LuaS_Z21DR_NPCSAY03()
	local npc = OwnerID()
	NPCsay(npc,"[SC_Z21DR_NPC06]")
end

function LuaS_Z21DR_NPCSAY04()
	local npc = OwnerID()
	NPCsay(npc,"[SC_Z21DR_NPC07]")
end

-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_424441_finish01()				
	local player = OwnerID()
	local npc = TargetID()
	LoadQuestOption(player)
		if	CheckCompleteQuest(player,424441) == true and 
			CheckAcceptQuest(player,424440) == true and
			CountBodyItem(player,240557)==0  then
			AddSpeakOption(player,npc,"[SC_424441_01]","LuaQ_424441_finish02",0)
		else 
			LoadQuestOption(player)
		end
end

function LuaQ_424441_finish02()
	local player=OwnerID()
	SetSpeakDetail(player,"[SC_424441_02]")
	GiveBodyItem(player,240557,1)
end