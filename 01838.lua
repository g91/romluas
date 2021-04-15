function LuaS_423232_DW_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423232)	and
		CheckFlag(OwnerID(),543971)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[ZONE16_K9]","LuaS_423232_DW_1", 0 )
	end
end

function LuaS_423232_DW_1()
	CloseSpeak(OwnerID())
	CallPlot(TargetID(),"LuaS_TurnFace_DW_00",423232,543971,nil,"LuaS_423232_DW_8")
end


function LuaS_423232_DW_2()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423233)	and
		CheckFlag(OwnerID(),543972)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[ZONE16_K10]","LuaS_423232_DW_3", 0 )
	end
end

function LuaS_423232_DW_3()
	CloseSpeak(OwnerID())
	CallPlot(TargetID(),"LuaS_TurnFace_DW_00",423233,543972)
end


function LuaS_423232_DW_4()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423234)	and
		CheckFlag(OwnerID(),543955)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[ZONE16_K11]","LuaS_423232_DW_5", 0 )
	end
end

function LuaS_423232_DW_5()
	CloseSpeak(OwnerID())
	CallPlot(TargetID(),"LuaS_TurnFace_DW_00",423234,543955,nil,"LuaS_423232_DW_9")
end


function LuaS_423232_DW_6()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423234)	and
		CheckFlag(OwnerID(),543978)==false	then
		AddSpeakOption(OwnerID(),OwnerID(),"[ZONE16_K12]","LuaS_423232_DW_7", 0 )
	end
end

function LuaS_423232_DW_7()
	CloseSpeak(OwnerID())
	CallPlot(TargetID(),"LuaS_TurnFace_DW_00",423234,543978,nil,"LuaS_423232_DW_10")
end


function LuaS_423232_DW_8()
	Say(OwnerID(),"[ZONE16_K13]")
end

function LuaS_423232_DW_9()
	Say(OwnerID(),"[ZONE16_K14]")
end

function LuaS_423232_DW_10()
	Say(OwnerID(),"[ZONE16_K15]")
end