--土耳其廠商需求任務(4.0.6)
--Q.A
--NPC1 (Zone : 2 / Location: 49.2, 79.2 / 凡瑞娜絲城正門出口 Varanas Gate) / NPC Name: Spree (female)
--NPC2 (Zone : 2 / Location: 32.2, 22.4 / 凡瑞娜絲城入口 Varanas Entrance) / NPC Name: Havel (female)
--NPC3 (Zone : 2 / Location: 57.7, 80.8 / 行政區  Administration District) / NPC Name: Elbe (female)
--NPC4 (Zone : 2 / Location: 56.0, 73.3 / 毗爾斯敦農場 Peerston Farm) / NPC Name: Dahme (female)
--Q.B
--NPC1 (Zone : 2 / Location: 49.2, 79.2 / 凡瑞娜絲城正門出口 Varanas Gate) / NPC Name: Spree (female)

function Lua_Hao_Turkey_406_Quests_546992()
	SetFlag( TargetID() , 546992 , 1 )
end

function Lua_Hao_Turkey_406_Quests_546993()
	SetFlag( TargetID() , 546993 , 1 )
end

function Lua_Hao_Turkey_406_Quests_546994()
	SetFlag( TargetID() , 546994 , 1 )
end

function Lua_Hao_Turkey_406_Quests_546995()
	SetFlag( TargetID() , 546995 , 1 )
end

function Lua_Hao_Turkey_406_Quests_546997()
	SetFlag( TargetID() , 546997 , 1 )
end

function Lua_Hao_Turkey_406_Quests_Reset()

	local Player = OwnerID()
	local Key = { 546991 , 546992 , 546993 , 546994 , 546995 , 546996 , 546997 }
	
	for i = 1 , #Key , 1 do
		SetFlag( Player , Key[i] , 0 )
	end
end
	
function Lua_Hao_Turkey_406_Quests_1()

	local Player = OwnerID()
	local Npc = TargetID()
	local QuestID = { 425703 , 425707 }
	local Key = { 546991 , 546994 , 546995 , 546996 , 546997 }	-- 任務1_1指向Havel、任務1_4指向Spree、完成任務1_1~1_4、報名任務2、完成任務2。
	local Lv = ReadRoleValue( Player , EM_RoleValue_Lv )
	local States = {}
	States[1] = CheckFlag( Player , Key[1] ) -- 將任務1指向Havel
	States[2] = CheckFlag( Player , Key[2] ) -- 將任務1指向Spree的任務1_4
	States[3] = CheckFlag( Player , Key[3] ) -- 已完成任務1_1~1_4
	States[4] = CheckFlag( Player , Key[4] ) -- 報名任務2
	States[5] = CheckFlag( Player , Key[5] ) -- 完成任務2
	States[6] = CountBodyItem( Player , 240881 )
	AdjustFaceDir( Npc , Player , 0 ) --面向
	local Answer = {}
	local Note = ""
	for i = 1 , #States , 1 do
		if States[i] == true then 
			Answer[i] = 1
		elseif States[i] == false then
			Answer[i] = 0
		else
			Answer[i] = States[i]
		end
		Note = Note.."Key"..i.." = "..Answer[i].." ,"
	end
--	DebugMsg( Player , 0 , Note )
--	DebugMsg( Player , 0 , "Lv = "..Lv )
	if States[3] == true then
		if Lv < 12 then
			SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_001]" )
		else	-- 0 1 1 1 0 0 
		--	if States[4] == false then
			if States[5] == true then
				SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_002]" )
			elseif CheckQuest( Player , QuestID[2] , 0 ) == false or CheckQuest( Player , QuestID[2] , 0 ) == true then
				LoadQuestOption( Player )
			elseif States[4] == true and States[5] == false and States[6] == 0 then
				SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_003]" )
			else
		--		DebugMsg( Player , 0 , "Doesn't match" )
			end
		end
	else
		if Lv < 10 then
			SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_004]" )
		else
			if CheckQuest( Player , QuestID[1] , 0 ) == true then
				SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_006]" )
			elseif States[1] == false or States[1] == true or States[2] == true then
				LoadQuestOption( Player )
			elseif States[3] == true then
				SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_005]" )
			else
		--		DebugMsg( Player , 0 , "Doesn't match" )
			end
		end
	end
end
	
function Lua_Hao_Turkey_406_Quests_2()

	local Player = OwnerID()
	local Npc = TargetID()
	local QuestID = 425704
	local Key = { 546991 , 546992 , 546995 , 546993 }	-- 任務1_1指向Havel、任務1_2指向Elbe、完成任務1_1~1_4、任務1_3指向Dahme
	local States = {}
	States[1] = CheckFlag( Player , Key[1] ) 
	States[2] = CheckFlag( Player , Key[2] ) 
	States[3] = CheckFlag( Player , Key[3] ) 
	States[4] = CheckFlag( Player , Key[4] ) 
	AdjustFaceDir( Npc , Player , 0 ) --面向
	local Answer = {}
	local Note = ""
	for i = 1 , #States , 1 do
		if States[i] == true then 
			Answer[i] = 1
		else
			Answer[i] = 0
		end
		Note = Note.."Key"..i.." = "..Answer[i].." , "
	end
--	DebugMsg( Player , 0 , Note )
	if States[1] == false and States[2] == true and States[3] == false and States[4] == true then
		SetSpeakDetail( Player , "[Sys121161_szquestnpctext]" )
		AddSpeakOption( Player , Npc , "[SC_TURKEY_QUESTS_007]" , "Lua_Hao_Turkey_406_Quests_2_1", 0 )
	elseif States[3] == true then
		SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_005]" )
		AddSpeakOption( Player , Npc , "[SC_TURKEY_QUESTS_007]" , "Lua_Hao_Turkey_406_Quests_2_1", 0 )
	elseif States[1] == false and States[2] == false then
		SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_008]" )
	elseif CheckQuest( Player , QuestID , 0 ) == true then
		SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_006]" )
		AddSpeakOption( Player , Npc , "[SC_TURKEY_QUESTS_007]" , "Lua_Hao_Turkey_406_Quests_2_1", 0 )
	elseif States[1] == true and States[2] == false or States[2] == true then
		LoadQuestOption( Player )
	else
--		DebugMsg( Player , 0 , "Doesn't match" )
	end
end

function Lua_Hao_Turkey_406_Quests_2_1()
	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_011]" )
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Lua_Hao_Turkey_406_Quests_2", 0 )
end

function Lua_Hao_Turkey_406_Quests_3()
	
	local Player = OwnerID()
	local Npc = TargetID()
	local QuestID = 425705
	local Key = { 546992 , 546993 , 546995 , 546994 }	-- 任務1_2指向Elbe、任務1_3指向Dahme、完成任務1_1~1_4、任務1_4指向Spree
	local States = {}
	States[1] = CheckFlag( Player , Key[1] ) 
	States[2] = CheckFlag( Player , Key[2] ) 
	States[3] = CheckFlag( Player , Key[3] ) 
	States[4] = CheckFlag( Player , Key[4] ) 
	AdjustFaceDir( Npc , Player , 0 ) --面向
	local Answer = {}
	local Note = ""
	for i = 1 , #States , 1 do
		if States[i] == true then 
			Answer[i] = 1
		else
			Answer[i] = 0
		end
		Note = Note.."Key"..i.." = "..Answer[i].." , "
	end
--	DebugMsg( Player , 0 , Note )

	if States[1] == true and States[2] == true and States[3] == false and States[4] == true then
		SetSpeakDetail( Player , "[Sys121162_szquestnpctext]" )
		AddSpeakOption( Player , Npc , "[SC_TURKEY_QUESTS_007]" , "Lua_Hao_Turkey_406_Quests_3_1", 0 )	
	elseif CheckQuest( Player , QuestID , 0 ) == true then
		SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_006]" )
		AddSpeakOption( Player , Npc , "[SC_TURKEY_QUESTS_007]" , "Lua_Hao_Turkey_406_Quests_3_1", 0 )
	elseif States[3] == true then
		SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_005]" )
		AddSpeakOption( Player , Npc , "[SC_TURKEY_QUESTS_007]" , "Lua_Hao_Turkey_406_Quests_3_1", 0 )
	elseif States[1] == false then
		SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_009]" )
	elseif States[1] == true and States[2] == false or States[2] == true then
		LoadQuestOption( Player )
	else
--		DebugMsg( Player , 0 , "Doesn't match" )
	end
end

function Lua_Hao_Turkey_406_Quests_3_1()

	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_012]" )
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Lua_Hao_Turkey_406_Quests_3", 0 )
end

function Lua_Hao_Turkey_406_Quests_4()

	local Player = OwnerID()
	local Npc = TargetID()
	local QuestID = 425706
	local Key = { 546993 , 546994 , 546995 }	-- 任務1_3指向Dahme、任務1_4指向Spree、完成任務1_1~1_4
	local States = {}
	States[1] = CheckFlag( Player , Key[1] ) 
	States[2] = CheckFlag( Player , Key[2] ) 
	States[3] = CheckFlag( Player , Key[3] ) 
	AdjustFaceDir( Npc , Player , 0 ) --面向
	local Answer = {}
	local Note = ""
	for i = 1 , #States , 1 do
		if States[i] == true then 
			Answer[i] = 1
		else
			Answer[i] = 0
		end
		Note = Note.."Key"..i.." = "..Answer[i].." , "
	end
--	DebugMsg( Player , 0 , Note )

	if States[3] == true then
		SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_005]" )
		AddSpeakOption( Player , Npc , "[SC_TURKEY_QUESTS_007]" , "Lua_Hao_Turkey_406_Quests_4_1", 0 )
	elseif States[1] == false then
		SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_010]" )
	elseif CheckQuest( Player , QuestID , 0 ) == true then
		SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_006]" )	
		AddSpeakOption( Player , Npc , "[SC_TURKEY_QUESTS_007]" , "Lua_Hao_Turkey_406_Quests_4_1", 0 )
	elseif States[1] == true and States[2] == false or States[2] == true then
		LoadQuestOption( Player )
	else
--		DebugMsg( Player , 0 , "Doesn't match" )
	end
end

function Lua_Hao_Turkey_406_Quests_4_1()

	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_TURKEY_QUESTS_013]" )
	AddSpeakOption( Player , Player , "[SO_BACK]" , "Lua_Hao_Turkey_406_Quests_4", 0 )
end