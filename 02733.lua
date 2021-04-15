function LuaS_Z24_NPC_SAY()	
	local Player = OwnerID()
	local Npc = TargetID()
	local Orgid = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	if CheckCompleteQuest(Player,425636) == false then
		SetSpeakDetail(Player,"[SC_"..Orgid.."_1]")
	elseif CheckCompleteQuest(Player,425636)==true and CheckCompleteQuest(Player,425638) == false then
		SetSpeakDetail(Player,"[SC_"..Orgid.."_2]")
	elseif CheckCompleteQuest(Player,425638)==true and CheckCompleteQuest(Player,425644) == false then
		SetSpeakDetail(Player,"[SC_"..Orgid.."_3]")
	elseif CheckCompleteQuest(Player,425644)==true then
		SetSpeakDetail(Player,"[SC_"..Orgid.."_4]")
	end
end

function LuaS_NPC_121008()	--村長
	local Player = OwnerID()
	local Npc = TargetID()
	LoadQuestOption(Player)
	if CheckCompleteQuest(Player,425636) == false then
		SetSpeakDetail(Player,"[SC_121008_1]")
		if CheckAcceptQuest(Player,425635) == true and 
			CountBodyItem(Player,241655)>0 and 
			CheckFlag(Player,546894)==true then
			AddSpeakOption(Player,Npc,"[SC_425635_G]","LuaS_NPC_425635_G",0)
		end
	elseif CheckCompleteQuest(Player,425636)==true and CheckCompleteQuest(Player,425638)==false then
		SetSpeakDetail(Player,"[SC_121008_2]")
	elseif CheckCompleteQuest(Player,425638)==true and CheckCompleteQuest(Player,425644)==false then
		SetSpeakDetail(Player,"[SC_121008_3]")
	elseif CheckCompleteQuest(Player,425644)==true  then
		SetSpeakDetail(Player,"[SC_121008_4]")
	end
	--副本任務選項
	if CheckAcceptQuest(Player,425682) == true and CheckFlag( Player,546897 )==false then
		AddSpeakOption(Player,Npc,"[SC_422633_1]","LuaS_Z24Q425682_1",0) 	-- 請告訴我吧
	end
	--425637 模糊的記憶
	if CheckAcceptQuest( Player,425637 )==true  and CheckFlag( Player,546896 )==false then
		local k = 2
		AddSpeakOption( Player,Player,"[SC_425637_1]","LuaS_Z24Q425637_1( "..k..")",0 )
	end
end
--425637 模糊的記憶 跟村長對話1
function LuaS_Z24Q425637_1(k)
	local x,y=k+1,k+2
	SetSpeakDetail( OwnerID(),"[SC_425637_"..k.."]");
	if k<6 then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_425637_"..x.."]","LuaS_Z24Q425637_1( "..y..")",0 );
	else
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_425637_"..x.."]","LuaS_Z24Q425637_2(1)",0 );
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_425637_"..y.."]","LuaS_Z24Q425637_2(11)",0 );
	end
end
--425637 模糊的記憶 跟村長對話2
function LuaS_Z24Q425637_2(k)
	--上段處理tell
	if k==1 then
		PlayMotion( TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		tell( OwnerID(),TargetID(),"[SC_425637_9]");
		CloseSpeak( OwnerID() );
		return
	elseif k==11 then
		PlayMotion( TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		tell( OwnerID(),TargetID(),"[SC_425637_10]");
	end
	--下段處理對話
	local x,y=k+1,k+2
	SetSpeakDetail( OwnerID(),"[SC_425637_"..k.."]");
	if k<21 then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_425637_"..x.."]","LuaS_Z24Q425637_2("..y..")",0 );
	else
		SetFlag( OwnerID(),546896,1 )
	end
end
--村長的副本深情表白
function LuaS_Z24Q425682_1()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_QUEST_425682_0]")
	AddSpeakOption(Player,Player,"[SC_111490_DIALOG7_2]","LuaS_Z24Q425682_2",0) 	-- 預言者？
end
function LuaS_Z24Q425682_2()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_QUEST_425682_1]")
	SetFlag( Player,546897,1 )
end
--南門守衛
function LuaS_NPC_121174()
	local Player = OwnerID()
	local Npc = TargetID()
	if CheckCompleteQuest(Player,425636) == false then
		SetSpeakDetail(Player,"[SC_121174_1]")
		if CheckAcceptQuest(Player,425635) == true and CountBodyItem(Player,241656)<1 then
			--LoadQuestOption(Player)
			SetSpeakDetail(Player,"[SC_121174_1]")
			AddSpeakOption(Player,Npc,"[SC_425635_A]","LuaS_NPC_425635_A",0)
		end
		if CheckAcceptQuest(Player,425636) == true and CountBodyItem(Player,241656)>0 then
			--LoadQuestOption(Player)
			SetSpeakDetail(Player,"[SC_121174_1]")
			AddSpeakOption(Player,Npc,"[SC_425636_A]","LuaS_NPC_425636_B",0)
		end
	elseif CheckCompleteQuest(Player,425636)==true and CheckCompleteQuest(Player,425638) == false then
		SetSpeakDetail(Player,"[SC_121174_2]")
	elseif CheckCompleteQuest(Player,425638)==true  and  CheckCompleteQuest(Player,425644) == false  then
		SetSpeakDetail(Player,"[SC_121174_3]")
	elseif CheckCompleteQuest(Player,425644)==true then
		SetSpeakDetail(Player,"[SC_121174_4]")
	end
--失蹤的統帥
	if CheckAcceptQuest(Player,425639) == true then
		SetSpeakDetail(Player,"[SC_121174_3]")
		AddSpeakOption(Player,Npc,"[SC_425639_ASK_1]","LuaS_425639_A_1",0)
	end
end

function LuaS_NPC_121222()	--北門守衛
	local Player = OwnerID()
	local Npc = TargetID()
	if CheckCompleteQuest(Player,425636) == false then
		SetSpeakDetail(Player,"[SC_121222_1]")
		if CheckAcceptQuest(Player,425636) == true and CountBodyItem(Player,241656)>0 then
			--LoadQuestOption(Player)
			SetSpeakDetail(Player,"[SC_121222_1]")
			AddSpeakOption(Player,Npc,"[SC_425636_A]","LuaS_NPC_425636_C",0)
		end
	elseif CheckCompleteQuest(Player,425636)==true and CheckCompleteQuest(Player,425638) == false then
		SetSpeakDetail(Player,"[SC_121222_2]")
	elseif CheckCompleteQuest(Player,425638)==true and CheckCompleteQuest(Player,425644) == false then
		SetSpeakDetail(Player,"[SC_121222_3]")
	elseif CheckCompleteQuest(Player,425644)==true then
		SetSpeakDetail(Player,"[SC_121222_4]")
	end
end

function LuaS_NPC_425635_A()
	local Player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(Player,"[SC_425635_B]")
		AddSpeakOption(Player,Npc,"[SC_425635_C]","LuaS_NPC_425635_C",0)
	if CountBodyItem(Player,241655)>0 then
		AddSpeakOption(Player,Npc,"[SC_425635_E]","LuaS_NPC_425635_E",0)
	end
end
function LuaS_NPC_425635_C()
	local Player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(Player,"[SC_425635_D]")
	AddSpeakOption(Player,Npc,"[SC_425635_A]","LuaS_NPC_425635_A",0)
	if CountBodyItem(Player,241655)>0 then
		AddSpeakOption(Player,Npc,"[SC_425635_E]","LuaS_NPC_425635_E",0)
	end
end
function LuaS_NPC_425635_E()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_425635_F]")
	SetFlag(Player,546894,1)
end
function LuaS_NPC_425635_G()
	local Player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(Player,"[SC_425635_H]")
	AddSpeakOption(Player,Npc,"[SC_425635_I]","LuaS_NPC_425635_I",0)
end
function LuaS_NPC_425635_I()
	local Player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(Player,"[SC_425635_J]")
	AddSpeakOption(Player,Npc,"[SC_425635_K]","LuaS_NPC_425635_K",0)
end
function LuaS_NPC_425635_K()
	local Player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(Player,"[SC_425635_L]")
	SetFlag(Player,546895,1)
	DelBodyItem(Player,241655,1)
end

function LuaS_NPC_425636_B()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_425636_B]")
	SetFlag(Player,546891,1)
end

function LuaS_NPC_425636_C()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_425636_C]")
	SetFlag(Player,546892,1)
end

function LuaS_425639_A_0()
	local Player = OwnerID()
	local Npc = TargetID()
		if CheckAcceptQuest(Player,425639) == true then
			AddSpeakOption(Player,Npc,"[SC_425639_ASK_1]","LuaS_425639_A_1",0)
		end
	LoadQuestOption(Player)
end


function LuaS_425639_A_1()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_425639_ANS_1]")
	SetFlag(Player,547340,1)
end

function LuaS_425639_B_0()
	local Player = OwnerID()
	local Npc = TargetID()
		if CheckAcceptQuest(Player,425639) == true then
			AddSpeakOption(Player,Npc,"[SC_425639_ASK_2]","LuaS_425639_B_1",0)
		end
	LoadQuestOption(Player)
end


function LuaS_425639_B_1()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_425639_ANS_2]")
	SetFlag(Player,547341,1)
end



function LuaS_425639_C_0()
	local Player = OwnerID()
	local Npc = TargetID()
		if CheckAcceptQuest(Player,425639) == true then
			AddSpeakOption(Player,Npc,"[SC_425639_ASK_2]","LuaS_425639_C_1",0)
		end
	LoadQuestOption(Player)
end

function LuaS_425639_C_1()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_425639_ANS_3]")
	SetFlag(Player,547342,1)
end