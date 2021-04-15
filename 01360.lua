function LuaS_422328()  --讓他明白規矩是什麼
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422328)==true)and( Checkflag( OwnerID() , 542657) == false)and CountBodyItem(OwnerID(),204641)>0	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422328_0]","LuaS_422328_1",0)	
	end
	if	CheckAcceptQuest(OwnerID(),422332)	then
		if	CountBodyItem(OwnerID(),204643)>0		and
			CheckFlag(OwnerID(),542664)==false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422332_1]","LuaS_422332_3",0)
			return
		end
		if	CountBodyItem(OwnerID(),204720)<1			and
			CheckFlag(OwnerID(),542664)==false		then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422332_0]","LuaS_422332_4",0)
		end
	end
end

function LuaS_422328_1()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_422328_2", 0 )	
end

function LuaS_422328_2()
	say(OwnerID() , "[SC_422328_1]")
	sleep(20)
	say(TargetID() , "[SC_422328_2]")
	sleep(20)
	say(OwnerID() , "[SC_422328_3]")
	sleep(20)
	say(TargetID() , "[SC_422328_4]")
	sleep(20)
	say(OwnerID() , "[SC_422328_5]")
	sleep(30)
	say(TargetID() , "[SC_422328_6]")
	sleep(20)
	say(OwnerID() , "[SC_422328_7]")
	setflag(TargetID(),542657,1)
	DelBodyItem( TargetID(), 204641, 1 )
end

function LuaS_422117()  --不能被遺忘的
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422117)==true)and( CheckFlag( OwnerID(), 542641 ) == false) then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422117_0]","LuaS_422117_1",0)	
	end
end

function LuaS_422117_1()
	SetSpeakDetail(OwnerID(),"[SC_422117_1]")
	Setflag(OwnerID(),542641, 1)
end

function LuaS_204661()
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_204661]" )
	ShowBorder( OwnerID(), 0, "[204661]", "ScriptBorder_Texture_Paper" )	
End


function LuaS_204640()
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_204640]" )
	ShowBorder( OwnerID(), 0, "[204640]", "ScriptBorder_Texture_Paper" )	
End



function LuaS_422221_2()  --扶風
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422221)==true)and( CheckFlag( OwnerID(), 542693 ) == false)and (CountBodyItem( OwnerID(), 204836 )>0) then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_0]","LuaS_422221_6",0)	
	end
end

function LuaS_422221_6()
	SetSpeakDetail(OwnerID(),"[SC_422221_1]")
	DelBodyItem( OwnerID(), 204836, 1 )
	Setflag(OwnerID(),542693, 1)
end

function LuaS_422221_3()  --納亞
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422221)==true)and( CheckFlag( OwnerID(), 542695 ) == false)and (CountBodyItem( OwnerID(), 204836 )>0) then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_0]","LuaS_422221_7",0)	
	end
end

function LuaS_422221_7()
	SetSpeakDetail(OwnerID(),"[SC_422221_4]")
	DelBodyItem( OwnerID(), 204836, 1 )
	Setflag(OwnerID(),542695, 1)
end

function LuaS_422340()--點擊淨化水晶
	if (CheckAcceptQuest(OwnerID(),422340)==true)and(CountBodyItem( OwnerID(),204839) >0)and (CountBodyItem( OwnerID(), 204840 ) < 1)	then

		DelBodyItem( OwnerID(), 204839, 1 )
		GiveBodyItem( OwnerID(), 204840, 1 )
	return true
	End 
	return false
end



function LuaS_422221_10()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==false) and (CheckFlag( OwnerID(), 542693 )==false) and (CheckFlag( OwnerID(),542695)==false)and (CountBodyItem( OwnerID(),204836) ==0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_11",0)	
	end

	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==false) and (CheckFlag( OwnerID(), 542693 )==false) and (CheckFlag( OwnerID(),542695)==false)and (CountBodyItem( OwnerID(),204836) ==1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_12",0)
	end

	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==false) and (CheckFlag( OwnerID(), 542693 )==false) and (CheckFlag( OwnerID(),542695)==false)and (CountBodyItem( OwnerID(),204836) ==2)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_13",0)
	end

	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==true) and (CheckFlag( OwnerID(), 542693 )==false) and (CheckFlag( OwnerID(),542695)==false)and (CountBodyItem( OwnerID(),204836) ==0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_14",0)
	end

	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==true) and (CheckFlag( OwnerID(), 542693 )==false) and (CheckFlag( OwnerID(),542695)==false)and (CountBodyItem( OwnerID(),204836) ==1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_15",0)
	End

	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==false) and (CheckFlag( OwnerID(), 542693 )==true) and (CheckFlag( OwnerID(),542695)==false)and (CountBodyItem( OwnerID(),204836) ==0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_16",0)
	End

	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==false) and (CheckFlag( OwnerID(), 542693 )==true) and (CheckFlag( OwnerID(),542695)==false)and (CountBodyItem( OwnerID(),204836) ==1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_17",0)
	End

	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==false) and (CheckFlag( OwnerID(), 542693 )==false) and (CheckFlag( OwnerID(),542695)==true)and (CountBodyItem( OwnerID(),204836) ==0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_18",0)
	end


	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==false) and (CheckFlag( OwnerID(), 542693 )==false) and (CheckFlag( OwnerID(),542695)==true)and (CountBodyItem( OwnerID(),204836) ==1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_19",0)
	End

	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==true) and (CheckFlag( OwnerID(), 542693 )==true) and (CheckFlag( OwnerID(),542695)==false)and (CountBodyItem( OwnerID(),204836) ==0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_20",0)
	End

	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==true) and (CheckFlag( OwnerID(), 542693 )==false) and (CheckFlag( OwnerID(),542695)==true)and (CountBodyItem( OwnerID(),204836) ==0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_21",0)
	End

	if (CheckAcceptQuest(OwnerID(),422221)==true)and (CheckFlag( OwnerID(), 542692 )==false) and (CheckFlag( OwnerID(), 542693 )==true) and (CheckFlag( OwnerID(),542695)==true)and (CountBodyItem( OwnerID(),204836) ==0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422221_5]","LuaS_422221_22",0)
	End
end


function LuaS_422221_11()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
giveBodyItem( OwnerID(), 204836, 3 )
end



function LuaS_422221_12()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
giveBodyItem( OwnerID(), 204836, 2 )
end


function LuaS_422221_13()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
giveBodyItem( OwnerID(), 204836, 1 )
end

function LuaS_422221_14()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
giveBodyItem( OwnerID(), 204836, 2 )
end


function LuaS_422221_15()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
giveBodyItem( OwnerID(), 204836, 1 )
end

function LuaS_422221_16()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
giveBodyItem( OwnerID(), 204836, 2 )
end


function LuaS_422221_17()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
giveBodyItem( OwnerID(), 204836, 1 )
end

function LuaS_422221_18()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
	giveBodyItem( OwnerID(), 204836, 2 )
end

function LuaS_422221_19()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
	giveBodyItem( OwnerID(), 204836, 1 )
end

function LuaS_422221_20()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
giveBodyItem( OwnerID(), 204836, 1 )
end

function LuaS_422221_21()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
giveBodyItem( OwnerID(), 204836, 1)
end


function LuaS_422221_22()
	SetSpeakDetail(OwnerID(),"[SC_422221_6]")
giveBodyItem( OwnerID(), 204836, 1 )
end




