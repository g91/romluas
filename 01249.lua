function LuaS_421939_0()
	if	CheckFlag(OwnerID() , 542410)==false	and
		ReadRoleValue(OwnerID() , EM_RoleValue_Money) >= 5000	then

		AddRoleValue(OwnerID() , EM_RoleValue_Money , -5000)
		SetFlag(OwnerID(),542410,1)
		CloseSpeak( OwnerID() )
	else
		CloseSpeak( OwnerID() )
	end
end

function LuaS_421939_1()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID(), 421939 )	then
		if	CheckFlag(OwnerID() , 542410)==false	and
			ReadRoleValue(OwnerID() , EM_RoleValue_Money) >= 5000	then
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_421939]",  "LuaS_421939_0",  0 )
		end
	end
end


function LuaS_421940_0()
	BeginPlot(TargetID() , "LuaS_421940_1" , 0)
	SetFlag(OwnerID(),542414 ,1)
	return 1
end

function LuaS_421940_1()
	local Monster = {}
	Monster[1] = Lua_DW_CreateObj("flag" , 101679 , 780087 , 1 )
	Monster[2] = Lua_DW_CreateObj("flag" , 101679 , 780087 , 2 )
	Monster[3] = Lua_DW_CreateObj("flag" , 101679 , 780087 , 3 )
	Monster[4] = Lua_DW_CreateObj("flag" , 101679 , 780087 , 4 )

	for i = 1, table.getn(Monster) do
		SetAttack(Monster[i],TargetID() )
		BeginPlot(Monster[i] , "LuaS_Discowood_CheckPeace" , 0)
	end

	Say(Monster[1] , "[SC_101679]")
	sleep(10)
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_421940]", 0 ) 
end

function LuaS_421940_2()
	GiveBodyItem(OwnerID() , 204068 , 1)
--	AddRoleValue(OwnerID() , EM_RoleValue_Money , 3000)
	return true
end


function LuaS_421945_0()
	if	Lua_ExGetZone( OwnerID() ) == 5	then
		local tips = Lua_DW_CreateObj("obj" , 112399, OwnerID(),0)
		Lua_ObjDontTouch(tips)
		AddToPartition(tips,0)
		AddBuff(tips,502924,1,-1)
		BeginPlot(tips,"LuaS_421945_1",0)
		BeginPlot(tips,"LuaS_421945_2",0)
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_421945_9]", 0 ) 
		return false
	end
end

function LuaS_421945_1()
	LuaFunc_MoveToFlag( OwnerID() , 780088 , 1 ,0 )
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_421945_8]", 0 ) 
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_421945_8]", 0 ) 
end

function LuaS_421945_2()
	sleep(20)
	DelObj(OwnerID())
end



function LuaS_421945_3()
	local TIP = Lua_DW_CreateObj("flag" , 112399, 780088 , 1,0)
	Lua_ObjDontTouch(TIP)
	AddToPartition(TIP,0)
	if	GetDistance( OwnerID(), TIP )>70		then
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_421945_6]", 0 ) 
		DelObj(TIP)
		return false
	else
		if	GetDistance( OwnerID(), TIP )>50		then
			ScriptMessage( TargetID(), TargetID(), 2, "[SC_421945_7]", 0 ) 
			DelObj(TIP)
			return false
		else
			BeginPlot(TIP,"LuaS_421945_4",0)
			return true
		end
	end
end

function LuaS_421945_4()
	CastSpell(OwnerID() , OwnerID() , 492667)
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_421945_1]", 0 ) 
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_421945_2]", 0 ) 
	local Monster = Lua_DW_CreateObj("obj" , 101677 , OwnerID())
	SetAttack(Monster , TargetID())
	SetPlot(Monster , "dead" , "LuaS_421945_5" , 0)
	BeginPlot(Monster , "LuaS_Discowood_CheckPeace" , 0)
	local Solayertom = {}
	while CheckID(Monster) do
		if	ReadRoleValue(Monster,EM_RoleValue_IsDead)==1	then
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421945_4]", 0 ) 
			Solayertom[1] = Lua_DW_CreateObj("flag" , 101682, 780088 , 2)
			Solayertom[2] = Lua_DW_CreateObj("flag" , 101682, 780088 , 3)
			Solayertom[3] = Lua_DW_CreateObj("flag" , 101682, 780088 , 4)
			Solayertom[4] = Lua_DW_CreateObj("flag" , 101682, 780088 , 5)
			Solayertom[5] = Lua_DW_CreateObj("flag" , 101682, 780088 , 6)
			Solayertom[6] = Lua_DW_CreateObj("flag" , 101682, 780088 , 7)
			for i=1,table.getn(Solayertom) do
				BeginPlot(Solayertom[i] , "LuaS_Discowood_CheckPeace" , 0)
				SetAttack(Solayertom[i] , TargetID())
			end
			Say(Solayertom[1] , "[SC_421945_5]")
			break
		end
		sleep(10)
	end
end

function LuaS_421945_5()
	local TempID
	for	i=0 , HateListCount( OwnerID() )-1 do
		TempID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest( TempID , 421945) 	then
			GiveBodyItem(TempID, 203962 , 1)
			ScriptMessage( TempID, TempID, 2, "[SC_421945_3]", 0 ) 
			ScriptMessage( TempID, TempID, 0, "[SC_421945_3]", 0 ) 
		end
	end
	return true
end

function LuaS_421947_0()
	CloseSpeak( OwnerID() )
	BeginPlot(TargetID() , "LuaS_421947_1" , 0)
end

function LuaS_421947_1()
	DisableQuest( OwnerID() , true )
	Say(OwnerID() ,"[SC_421947_1]")
	sleep(20)
	local Ball = Lua_DW_CreateObj("flag" , 112413, 780014 , 1)
	Say(OwnerID() ,"[SC_421947_2]")
	sleep(20)
	Say(OwnerID() ,"[SC_421947_3]")
	sleep(30)
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_421947_5]", 0 ) 
	sleep(20)
	Say(OwnerID() ,"[SC_421947_4]")
	DelObj(Ball)
	local Player = SearchRangePlayer ( OwnerID() , 150 )
	for i = 0 , table.getn(Player) do
		if	CheckAcceptQuest( Player[i], 421947 )	then
			SetFlag(Player[i] , 542413 , 1 )
		end
	end
	DisableQuest( OwnerID() , false )
end

function LuaS_421947_2()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID(), 421947 )	and
		CountBodyItem(OwnerID() , 203962)>0	then
		if	not CheckFlag(OwnerID() , 542413)	then
			AddSpeakOption(  OwnerID(), TargetID( ), "[SC_421947]",  "LuaS_421947_0",  0 )
		end
	end
end


--把酒杯的任務弄到不能動