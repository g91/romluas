function LuaS_112232_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421805 ) == true then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112232_0]", "LuaS_112232_1", 0 ) 
	end
end

function LuaS_112232_1()
	SetSpeakDetail( OwnerID(), "[SC_112232_1]" )
	SetFlag( OwnerID() , 542371 , 1 )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]", "LuaS_112232_0", 0 ) 
end

function LuaS_112209_0()
	if CheckAcceptQuest( OwnerID() , 421813 ) == true and CheckFlag(OwnerID() , 542372 ) == false then
		SetSpeakDetail( OwnerID(), "[SC_112209_0]" )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112209_1]", "LuaS_112209_1", 0 ) 
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_112209_1()
	SetSpeakDetail( OwnerID(), "[SC_112209_2]" )
	SetFlag( OwnerID() , 542372 , 1 )
end

function LuaS_112222_0()
	if CheckAcceptQuest( OwnerID() , 421813 ) == true and CheckFlag(OwnerID() , 542373 ) == false then
		SetSpeakDetail( OwnerID(), "[SC_112222_0]" )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112222_1]", "LuaS_112222_1", 0 ) 
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_112222_1()
	SetSpeakDetail( OwnerID(), "[SC_112222_2]" )
	SetFlag( OwnerID() , 542373 , 1 )
end

function LuaS_112223_0()
	if CheckAcceptQuest( OwnerID() , 421813 ) == true and CheckFlag(OwnerID() , 542374 ) == false then
		SetSpeakDetail( OwnerID(), "[SC_112223_0]" )
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112223_1]", "LuaS_112223_1", 0 ) 
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaS_112223_1()
	SetSpeakDetail( OwnerID(), "[SC_112223_2]" )
	SetFlag( OwnerID() , 542374 , 1 )
end

function LuaQ_421813_Accept()
	local NPC =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,112209, 400 ) 
	if CheckID( NPC ) == true then
		tell( TargetID() , NPC , "[SC_112209_3]")
	end 
end

function LuaQ_421818_Complete()
	local NPC =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,112238, 400 ) 
	GiveBodyItem( TargetID() , 203750 , 1 )
	if CheckID( NPC ) == true then
		tell( TargetID() , NPC , "[SC_112238_0]")
	end 
end

function LuaS_112238_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421819 ) == true and CheckFlag(OwnerID() , 542375 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112238_1]", "LuaS_112238_1", 0 ) 
	end
end

function LuaS_112238_1()
	SetSpeakDetail( OwnerID(), "[SC_112238_2]" )
	SetFlag( OwnerID() , 542375 , 1 )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]", "LuaS_112238_0", 0 ) 
end

function LuaS_112241_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421828) == true and CheckFlag(OwnerID() , 542376 ) == false then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_112241_1]", "LuaS_112241_1", 0 ) 
	end
end

function LuaS_112241_1()
	SetSpeakDetail( OwnerID(), "[SC_112241_2]" )
	SetFlag( OwnerID() , 542376, 1 )
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]", "LuaS_112241_0", 0 ) 
end

function LuaQ_421829_OnClick()
	if CountBodyItem( OwnerID() , 203759 ) > 0 then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421829_0]" , 0 )
		return false
	end
end

function LuaQ_421829_AfterClick()
	if CountBodyItem( OwnerID() , 203759 ) > 0 then
		SetFlag( OwnerID() , 542377 , 1 )
		SetPlot( TargetID() , "touch" , "LuaFunc_Obj_BUSY" , 40 )
		BeginPlot( TargetID() , "LuaQ_421829_Play" , 0 )
		return true
	end
	return false
end

function LuaQ_421829_Play()
	local SeaDog = 0 
	SeaDog = LuaFunc_CreateObjByObj(112265 , OwnerID() )
	MoveToFlagEnabled( SeaDog , False )
	AdjustFaceDir( SeaDog , TargetID(), 0 ) 
	sleep( 300 )
	DelObj( SeaDog )
	SetPlot( OwnerID() , "touch" , "" , 0 )	
end

function LuaI_421806_Check()
	SetPlot( OwnerID() , "range" , "LuaI_421806_Check2" , 100 )
end

function LuaI_421806_Check2()
	if CheckFlag( OwnerID() , 542378 ) == false and CheckAcceptQuest( OwnerID() , 421806 ) == true then
		SetFlag( OwnerID() , 542378 , 1 )
	end
end

function LuaQ_421289_Complete()
	SetFlag( TargetID() , 542377 , 1 )
end

function LuaQ_421819_Accept()
	if CountBodyItem( TargetID() , 203750 ) > 0 then
		local Count = CountBodyItem( TargetID() , 203750 ) 
		DelBodyItem( TargetID() , 203750 , Count )
	end
end