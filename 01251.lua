function LuaS_421951_0()
	if	CheckAcceptQuest( OwnerID(), 421951)==false	 then
		return false
	end
	local HideBall = Lua_DW_CreateObj("flag",112399,780090,1)
	local NPC = SearchRangeNPC ( OwnerID() , 350 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==101671 	then
			DelObj(HideBall )
			return false
		end
	end
	if	GetDistance( OwnerID(), HideBall ) > 150	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421951_0]", 0 )
		DelObj(HideBall)
		return false
	else
		if	GetDistance( OwnerID(), HideBall ) > 70	then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421951_1]", 0 )
			DelObj(HideBall)
			return false
		else
			DelObj(HideBall)
			for i=0,table.getn(NPC)-1 do
				if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==112399	then
					if	NPC[i]~=HideBall	then
						return false
					end
				end
			end
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421951_2]", 0 )
			return true
		end
	end
end

function LuaS_421951_1()
	local HideBall = Lua_DW_CreateObj("obj",112399,OwnerID(),0)
	Lua_ObjDontTouch(HideBall )
	AddToPartition(HideBall ,0)
	CastSpell(HideBall ,HideBall ,492677)
	BeginPlot(HideBall ,"LuaS_421951_2",0)
	return true
end

function LuaS_421951_2()
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_421951_3]", 0 )
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_421951_4]", 0 )
	local Monster = Lua_DW_CreateObj("flag" , 101671 , 780090 , 1)
	BeginPlot(Monster,"LuaS_Discowood_CheckPeace",0)
	DelObj(OwnerID())
end







function LuaS_421952_0()
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112386   	then
		if	CountBodyItem(OwnerID(),203985 )>0	then--
			return 1
		end 
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421952_4]", 0 )  
		return 0
	else
		return 1
	end
end

	
function LuaS_421952_1()
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)==112386   	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421952_1]", 0 )  
		BeginPlot(TargetID(),"LuaS_421952_2" , 0)
		DelBodyItem(OwnerID(),203985,1)
		return 1
	else
		DelObj(TargetID())
		GiveBodyItem(OwnerID(),203986,1)
		if	CountBodyItem(OwnerID(),203986  )<5	or
			CountBodyItem(OwnerID(),203986  )>5	then
			return 1
		end
		local Solayertom = {}
		Solayertom[1] = Lua_DW_CreateObj("flag" , 101674 , 780088 , 2)
		Solayertom[2] = Lua_DW_CreateObj("flag" , 101674 , 780088 , 3)
		Solayertom[3] = Lua_DW_CreateObj("flag" , 101674 , 780088 , 4)
		Solayertom[4] = Lua_DW_CreateObj("flag" , 101674 , 780088 , 5)
--		Solayertom[5] = Lua_DW_CreateObj("flag" , 101674 , 780088 , 6)
--		Solayertom[6] = Lua_DW_CreateObj("flag" , 101674 , 780088 , 7)
		for i=1,table.getn(Solayertom) do
			BeginPlot(Solayertom[i] , "LuaS_Discowood_CheckPeace" , 0)
			SetAttack(Solayertom[i] , OwnerID())
		end
		Say(Solayertom[1] , "[SC_421952_2]")
		BeginPlot(Solayertom[1],"LuaS_421952_3",0)
		return 1
	end
end


function LuaS_421952_2()
	CastSpell(OwnerID(),OwnerID(),492668)
	sleep(10)
	local Flower = Lua_DW_CreateObj("obj",112385 ,OwnerID())
	sleep(80)
	if	CheckID(Flower)		then
		GiveBodyItem(TargetiD(),203985,1)
		DelObj(Flower)
	end
end

function LuaS_421952_3()
	sleep(20)
	Say(OwnerID() , "[SC_421952_3]")
end









function LuaS_421953_0()
	if	CountBodyItem(OwnerID(),204015)>0	then
		DelBodyItem(OwnerID(),204015,1)
		BeginPlot(TargetID(),"LuaS_421953_1",0)--
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421953_1]", 0 )  
		return 1
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421953_6]", 0 )
		return 0
	end
end

function LuaS_421953_1()
	CastSpell(OwnerID(),OwnerID(),491248)
	local Robat = Lua_DW_CreateObj("obj",101673,OwnerID())--
	SetFightMode ( Robat,1, 0, 0,1 )
	BeginPlot(Robat  , "LuaS_421953_3" , 0)
	SetAttack(Robat , TargetID())
	SetPlot(Robat,"dead","LuaS_421953_4" ,0)
	DelObj(OwnerID())
end

function LuaS_421953_3()
	local sec = 0
	sleep(20)
	while 	sec < 8	do
		sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1 	then
			sec = 0
		else
			sec = sec +1
		end
	end
	local Ice = Lua_DW_CreateObj("flag" , 112399 , 780087 , 4,0)
	Lua_ObjDontTouch(Ice )
	AddToPartition(Ice ,0)
	BeginPlot(Ice,"LuaS_421953_2",0)
	DelObj(OwnerID())
end

function LuaS_421953_4()
	local Player
	local HaveOne = 0
	local Solayertom = {}
	local Array = {}
	for i=0,HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest( Player , 421953) 	then 
			GiveBodyItem(Player,204033 ,1) 
			if	CountBodyItem(Player,204017 )>0	then --
				DelBodyItem(Player,204017 ,1) --
				HaveOne = HaveOne + 1
				ScriptMessage( Player, Player, 1, "[SC_421953_5]", 0 )  --
				Array = {
						ReadRoleValue(Player,EM_RoleValue_X)-30*math.cos(math.pi/4),
						ReadRoleValue(Player,EM_RoleValue_Y)+20,
						ReadRoleValue(Player,EM_RoleValue_Z)-30*math.sin(math.pi/4)
					}
				Solayertom[HaveOne] = Lua_DW_CreateObj("xyz" , 101683 , Array , 0)
				NPCAttackFlag(Solayertom[i+1])
				AddToPartition(Solayertom[i+1],0)
				CastSpell(Solayertom[i+1],Player,492184)
				AddBuff(Player,502925,1,7)
				BeginPlot(Solayertom[i+1],"LuaS_421953_5",0)
			else
				ScriptMessage( Player, Player, 1, "[SC_421953_4]", 0 )  --
			end
		end
	end
	if	HaveOne > 0	then
		local Bottle = Lua_DW_CreateObj("flag" , 112411, 780087 , 1)  --
		BeginPlot(Bottle ,"LuaS_421953_8" , 0)
		

		Solayertom[table.getn(Solayertom)+1] = Lua_DW_CreateObj("flag" , 101683, 780087 , 2,0)  --	
		NPCAttackFlag(Solayertom[table.getn(Solayertom)])
		AddToPartition(Solayertom[table.getn(Solayertom)],0)
		FaceObj(Solayertom[table.getn(Solayertom)],Bottle)
		BeginPlot(Solayertom[table.getn(Solayertom)],"LuaS_421953_6",0)

		Solayertom[table.getn(Solayertom)+1] = Lua_DW_CreateObj("flag" , 101683, 780087 , 3,0)  --
		NPCAttackFlag(Solayertom[table.getn(Solayertom)])
		AddToPartition(Solayertom[table.getn(Solayertom)],0)
		BeginPlot(Solayertom[table.getn(Solayertom)],"LuaS_421953_7",0)
	else
		local Ice = Lua_DW_CreateObj("flag" , 112399 , 780087 , 4,0)
		Lua_ObjDontTouch(Ice )
		AddToPartition(Ice ,0)
		BeginPlot(Ice,"LuaS_421953_2",0)
	end
	return true
end

function LuaS_421953_5()
	sleep(60)
	DelObj(OwnerID())
end

function LuaS_421953_6()
	sleep(30)
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	Say(OwnerID(),"[SC_421953_3]")
	sleep(20)
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END)
	DelObj(OwnerID())
end

function LuaS_421953_7()
	Say(OwnerID(),"[SC_421953_2]")
	sleep(50)
	local Ice = Lua_DW_CreateObj("flag" , 112399 , 780087 , 4,0)
	Lua_ObjDontTouch(Ice )
	AddToPartition(Ice ,0)
	BeginPlot(Ice,"LuaS_421953_2",0)
	DelObj(OwnerID())
end

function LuaS_421953_8()
	sleep(40)
	DelObj(OwnerID())
end

function LuaS_421953_2()
	sleep(60)
	local Ice = Lua_DW_CreateObj("flag" , 112389 , 780087 , 4)
end

function NPCAttackFlag(GItemID)
	SetModeEx( GItemID , EM_SetModeType_Fight , false ) 
	SetModeEx( GItemID , EM_SetModeType_Strikback, false ) 
	SetModeEx( GItemID , EM_SetModeType_Searchenemy , false ) 
end









function LuaS_421953_9()
	CloseSpeak( TargetID() );
	DisableQuest( OwnerID() , true )
	Say(OwnerID(), "[SC_421953_7]")
	sleep(10)
	local ByeByeTeam = {}
	for i = 1 , 8 do
		ByeByeTeam[i] = Lua_DW_CreateObj("flag" , 101683 , 780014 , i , 0)
		NPCAttackFlag(ByeByeTeam[i])
		AddToPartition( ByeByeTeam[i], 0)
		CastSpell(ByeByeTeam[i],OwnerID(),492184)
	end
	sleep(10)
	Say(ByeByeTeam[1],"[SC_421953_8]")
	sleep(20)
	Say(OwnerID(), "[SC_421953_9]")
	CastSpell(OwnerID(),OwnerID(),492669)
	sleep(10)
	for i = 1 , 8 do
		AddBuff(ByeByeTeam[i],502383,1,1)
		AddBuff(ByeByeTeam[i],502925,1,10)
	end
	FaceObj(OwnerID(),ByeByeTeam[1])
	sleep(20)
	Say(OwnerID(), "[SC_421953_10]")
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(20)
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END)
	Say(OwnerID(), "[SC_421953_11]")
	for i = 1 , 8 do
		CancelBuff(ByeByeTeam[i],502925)
	end
	sleep(20)
	Say(ByeByeTeam[1],"[SC_421953_12]")
	for i = 1 , 8 do
		BeginPlot(ByeByeTeam[i] , "LuaS_421953_10" , 0)
	end
	sleep(20)
	for i = 1 , 8 do
		DelObj(ByeByeTeam[i])
	end
	BeginPlot(OwnerID(),"LuaS_421953_11",0)
	DisableQuest( OwnerID() , false )
end

function LuaS_421953_10()
	LuaFunc_MoveToFlag( OwnerID() , 780014 , 9 ,0 )
end

function LuaS_421953_11()
	LuaFunc_MoveToFlag( OwnerID() , 780014 , 10 ,0 )
	LuaFunc_MoveToFlag( OwnerID() , 780014 , 11 ,0 )
end





function LuaS_421955_0()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest(OwnerID(),421955)	and
		not CheckFlag(OwnerID(),542412)		then
		AddSpeakOption( OwnerID(), OwnerID(), "[SC_421955_1]", "LuaS_421955_1", 0 )
	end
end

function LuaS_421955_1()
	CloseSpeak( OwnerID() );
	BeginPlot(TargetID(),"LuaS_421955_2",0)
end

function LuaS_421955_2()
	DisableQuest( OwnerID() , true )
	Say(OwnerID(), "[SC_421955_2]")
	local MagicBall = Lua_DW_CreateObj("flag" , 112413, 780096 , 1)  --
	BeginPlot(MagicBall,"LuaS_421955_3",0)
	CastSpell(OwnerID(), MagicBall , 492670)
	local Monster = {}
	for i = 1 , 4 do
		Monster[i] = Lua_DW_CreateObj("flag" , 101682, 780096 , i+2)  --
		SetAttack(Monster[i],OwnerID())
		BeginPlot(Monster[i] , "LuaS_Discowood_CheckPeace" , 0)
	end
	sleep(30)
	Say(OwnerID(), "[SC_421955_3]")
	sleep(100)
	for i = 5 , 7 do
		Monster[i] = Lua_DW_CreateObj("flag" , 101682, 780096 , i-2)  --
		SetAttack(Monster[i],OwnerID())
		BeginPlot(Monster[i] , "LuaS_Discowood_CheckPeace" , 0)
	end
	sleep(30)
	Say(OwnerID(), "[SC_421955_4]")
	sleep(100)
	for i = 8 , 11 do
		Monster[i] = Lua_DW_CreateObj("flag" , 101682, 780096 , i-5)  --
		SetAttack(Monster[i],OwnerID())
		BeginPlot(Monster[i] , "LuaS_Discowood_CheckPeace" , 0)
	end
	sleep(30)
	Say(OwnerID(), "[SC_421955_5]")
	sleep(80)
	for i = 1 , 11 do
		if	CheckID(Monster[i])	then
			Say(Monster[i], "[SC_421955_6]")
			break
		end
	end
	sleep(20)
	AddBuff(OwnerID(),502383,1,1)
	DelObj(MagicBall)
	for	i=1,11 do
		if	CheckID(Monster[i])	then	
			Say(OwnerID(), "[SC_421955_7]")
			sleep(20)
			CastSpell(OwnerID(),OwnerID(),492669)
			sleep(10)
			break
		end
	end
	for i = 1 , 11 do
		if	CheckID(Monster[i])	then
			AddBuff(Monster[i],502925,1,10)
			NPCDead(Monster[i] , Monster[i] )
		end
	end
	sleep(20)
	Say(OwnerID(), "[SC_421955_8]")
	local Player = SearchRangePlayer ( OwnerID() , 100 )
	for i = 0,table.getn(Player)-1 do
		if	CheckAcceptQuest(Player[i],421955)	then
			SetFlag(Player[i],542412,1)
		end
	end
	DisableQuest( OwnerID() , false )
end

function LuaS_421955_3()
	while ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==0	do
		sleep(10)
	end
	DelObj(OwnerID())
end

function LuaS_421955_4()
	LuaFunc_MoveToFlag( OwnerID() , 780096 , 2 ,0 )
	sleep(20)
	DelObj(OwnerID())
end

function LuaS_421955_5()
	Say(OwnerID(),"[SC_421955_9]")
end


function LuaS_421957_0()
	GiveBodyItem(TargetID(),203978,1)
	GiveBodyItem(TargetID(),203962,1)
end