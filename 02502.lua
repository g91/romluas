
------------------------------------------------------------------------------------------
--避禍妙計 點擊物件後執行劇情

function LuaS_424202_ClickOver()
	local Obj = OwnerID()
	ScriptMessage( Obj, Obj, 0, "[SC_424202_1]", 0 )
	local NewMonster = DW_CreateObjEX("obj",106075,Obj,1,100)
	BeginPlot(NewMonster,"LuaS_424202_InitialPlot",0)
	SetAttack(NewMonster ,Obj)
	DW_QietKillOne(Obj,106151)
	return 1
end

function LuaS_424202_InitialPlot()
	local Obj = OwnerID()
	sleep(60)
	while true do
		sleep(10)
		if	HateListCount(Obj)==0	then
			DelObj(Obj)
		end
	end
end

------------------------------------------------------------------------------------------
--集思廣義 對話劇情

function LuaS_119400_0()
	local Obj = OwnerID()
	LoadQuestOption(Obj)

	if CheckAcceptQuest(Obj,424291)	then
		AddSpeakOption(Obj,Obj,"[SC_424291_1]","LuaS_424291_TalkingPlot(1)", 0 )
		AddSpeakOption(Obj,Obj,"[SC_424291_3]","LuaS_424291_TalkingPlot(2)", 0 )
		if	CheckFlag(Obj,545585)	then	AddSpeakOption(Obj,Obj,"[SC_424291_5]","LuaS_424291_TalkingPlot(3)", 0 )	end
		if	CheckFlag(Obj,545586)	then	AddSpeakOption(Obj,Obj,"[SC_424291_7]","LuaS_424291_TalkingPlot(4"..",".."545583)", 0 )	end
	end
end

function LuaS_119397_0()
	local Obj = OwnerID()
	
	if CheckAcceptQuest(Obj,424291)	then
		SetSpeakDetail( Obj,"[SC_424291_A]")
		AddSpeakOption(Obj,Obj,"[SC_424291_3]","LuaS_424291_TalkingPlot(5"..",".."545584)", 0 )
		if	CheckFlag(Obj,545585)	then	AddSpeakOption(Obj,Obj,"[SC_424291_5]","LuaS_424291_TalkingPlot(6"..",".."545586)", 0 )	end
	else
		LoadQuestOption(Obj)
	end
end


function LuaS_119396_0()
	local Obj = OwnerID()
	LoadQuestOption(Obj)
	if CheckAcceptQuest(Obj,424291)	then
		SetSpeakDetail( Obj,"[SC_424291_D]")
		AddSpeakOption(Obj,Obj,"[SC_424291_3]","LuaS_424291_TalkingPlot(7)", 0 )
		if	CheckFlag(Obj,545584)	then	AddSpeakOption(Obj,Obj,"[SC_424291_F]","LuaS_424291_TalkingPlot(8"..",".."545585)", 0 )	end
	else
		LoadQuestOption(Obj)
	end
end

function LuaS_424291_TalkingPlot(StringCode,Flag)
	local Obj = OwnerID()
	local Str_Array = {
						"[SC_424291_2]",
						"[SC_424291_4]",
						"[SC_424291_6]",
						"[SC_424291_8]",
						"[SC_424291_B]",
						"[SC_424291_C]",
						"[SC_424291_E]",
						"[SC_424291_G]",
						"[]",
						"[]",
						"[]",
						"[]"
							}
	SetSpeakDetail( Obj,Str_Array[StringCode])
	if	Flag~=nil	then
		SetFlag(Obj,Flag,1)
	end
end

--------------------------------------------
--解惑 對話劇情


function LuaS_119381_0()
	local Obj = OwnerID()
	local QuestTag = 0
	local Flag = 0
	for i=1,6,1	do
		Flag = 545586+i
		if CheckFlag(Obj,Flag )==false	then
			break
		end
		if	i==6	then
			QuestTag=1
		end
	end
	if	CheckAcceptQuest(Obj,424390) and QuestTag==0 	then
		SetSpeakDetail( Obj,"[SC_424390_1]")
		AddSpeakOption(Obj,Obj,"[SC_424390_2]","LuaS_424390_TalkPlot(1)", 0 )
		AddSpeakOption(Obj,Obj,"[SC_424390_4]","LuaS_424390_TalkPlot(2"..",".."545587)", 0 )
	else
		LoadQuestOption(Obj)
	end
end


function LuaS_119382_0()
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424390)	then
		SetSpeakDetail( Obj,"[SC_424390_6]")
		AddSpeakOption(Obj,Obj,"[SC_424390_7]","LuaS_424390_TalkPlot(3"..",".."545588)", 0 )
	else
		LoadQuestOption(Obj)
	end
end


function LuaS_119383_0()
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424390)	then
		SetSpeakDetail( Obj,"[SC_424390_9]")
		AddSpeakOption(Obj,Obj,"[SC_424390_A]","LuaS_424390_TalkPlot(4"..",".."545589)", 0 )
	else
		LoadQuestOption(Obj)
	end
end


function LuaS_119384_0()
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424390)	then
		SetSpeakDetail( Obj,"[SC_424390_F]")
		AddSpeakOption(Obj,Obj,"[SC_424390_G]","LuaS_424390_TalkPlot(6"..",".."545591)", 0 )
	else
		LoadQuestOption(Obj)
	end
end



function LuaS_119385_0()
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424390)	then
		SetSpeakDetail( Obj,"[SC_424390_C]")
		AddSpeakOption(Obj,Obj,"[SC_424390_D]","LuaS_424390_TalkPlot(5"..",".."545590)", 0 )
	else
		LoadQuestOption(Obj)
	end
end




function LuaS_119387_0()
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424390)	then
		SetSpeakDetail( Obj,"[SC_424390_I]")
		AddSpeakOption(Obj,Obj,"[SC_424390_J]","LuaS_424390_TalkPlot(7"..",".."545592)", 0 )
	else
		LoadQuestOption(Obj)
	end
end


function LuaS_119388_0()
	local Obj = OwnerID()
	if	CheckAcceptQuest(Obj,424390)	then
		SetSpeakDetail( Obj,"[SC_424390_L]")
	else
		LoadQuestOption(Obj)
	end
end

function LuaS_424390_TalkPlot(SpeakText,Flag)
	local Obj = OwnerID()
	local Str_Array = {
						"[SC_424390_3]",
						"[SC_424390_5]",
						"[SC_424390_8]",
						"[SC_424390_B]",
						"[SC_424390_E]",
						"[SC_424390_H]",
						"[SC_424390_K]",
						"[]",
						"[]",
						"[]",
						"[]"
							}
	SetSpeakDetail( Obj,Str_Array[SpeakText])
	if	Flag~=nil	then
		SetFlag(Obj,Flag,1)
	end
end

-------------------------------------------------------------------------
--黑色護盾
function LuaS_119402_Buff()
	local Obj = OwnerID()
	AddBuff(Obj,509999,0,-1)
end


--------------------------------------------------------
--賽西蒙德的法器

function LuaS_BackOfSismond()
	local Obj = OwnerID()
	AddBuff(Obj,620130,0,-1)
end