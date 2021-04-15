function LuaS_421917_0()
	local TempID
	for	i=0 , HateListCount( OwnerID() )-1 do
		TempID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest( TempID , 421917) 	then
			ScriptMessage( TempID, TempID, 2, "[SC_421917]", 0 ) 
			ScriptMessage( TempID, TempID, 0, "[SC_421917]", 0 ) 
			GiveBodyItem(TempID, 203912 , 1)
		end
	end	
	DelObj(OwnerID())
end

function LuaS_421917_1()
	BeginPlot(OwnerID(),"LuaS_Discowood_CheckPeace",0)
end

function LuaS_421917_2()
	local FireFly = Lua_DW_CreateObj("obj" , 101668, TargetID() )
	DelBodyItem(OwnerID(),203911,1)
	return 1
end


function LuaS_421918_0()
	SetFlag(TargetID(),542411,0)
	DisableQuest( OwnerID() , true )
	MoveToFlagEnabled( OwnerID(), true )--go
	SetDelayPatrolTime( OwnerID(), 0 )

end

function LuaS_421918_1()
	MoveToFlagEnabled( OwnerID(), false )--stop
	local tub = Lua_DW_CreateObj("flag" , 112408 , 780014 , 2 )
	sleep(10)
	Say(OwnerID() , "[SC_421918_6]" )
	sleep(20)
	Say(OwnerID() , "[SC_421918_7]" )
	local FireMonster =Lua_DW_CreateObj("flag" , 101669 , 780014 , 3 )
	SetAttack(OwnerID() , FireMonster )
	SetPlot(FireMonster,"dead","LuaS_421918_3" , 0)
	sleep(20)
	Say(FireMonster  , "[SC_421918_8]" )
	sleep(20)
	Say(OwnerID() , "[SC_421918_9]" )
	while true do
		sleep(20)
		local HP = ReadRoleValue(OwnerID() , EM_RoleValue_HP)/ReadRoleValue(OwnerID() , EM_RoleValue_MaxHP)
		local MHP = ReadRoleValue( FireMonster , EM_RoleValue_HP)/ReadRoleValue( FireMonster , EM_RoleValue_MaxHP)
		if	HP < 0.5	then
			break
		end
		if	MHP < 0.5	then
			break
		end
	end
	AddBuff(OwnerID(),502921,1,-1)
	local Friend = Lua_DW_CreateObj("flag" , 112344 , 780014 , 1 , 0)
	AddToPartition( Friend , 0 )
	while	GetDistance( Friend, FireMonster ) > 50	do
		SetAttack(Friend,FireMonster)	
		sleep(10)
	end
	Say(Friend,"[SC_421918]")
	sleep(20)	
	CastSpellLV(Friend,FireMonster,492287,20)
	Say(Friend,"[SC_421918_1]")
	sleep(30)
	Say(Friend,"[SC_421918_2]")
	sleep(10)
	Say(OwnerID(),"[SC_421918_3]")
	sleep(10)
	Say(Friend,"[SC_421918_4]")
	MoveToFlagEnabled( Friend, false )
	CastSpellLV(Friend,FireMonster,492662,100)
	sleep(30)
	DelObj(Friend)
	sleep(10)
	while CheckID(Friend) do
		sleep(10)
	end
	Say(OwnerID() , "[SC_421918_5]")
	DelObj(tub)

	MoveToFlagEnabled( OwnerID(), true )--go
end


function LuaS_421918_2()
	DisableQuest( OwnerID() , false )
	MoveToFlagEnabled( OwnerID(), false )--stop
end

function LuaS_421918_3()
	local TempID
	for	i=0 , HateListCount( OwnerID() )-1 do
		TempID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest( TempID , 421918) 	then
			SetFlag(TempID,542411,1)
		end
	end
	return true
end


--542411 重要物品


function LuaS_421919_0()
	DisableQuest( OwnerID() , true )
	Say(OwnerID() , "[SC_421919_0]")
	sleep(20)
	local NPC = SearchRangeNPC ( OwnerID() , 100 )
	local hory
	for i=0,table.getn(NPC) do
		if ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==112350 then
			hory = NPC[i]
			break
		end
	end
	sleep(20)
	Say(OwnerID() , "[SC_421919_1]" )
	sleep(20)
	Say(hory,"[SC_421919_2]" )
	DisableQuest( OwnerID() , false )
end


function LuaS_421920_0()
	DisableQuest( OwnerID() , true )
	Say(OwnerID() , "[SC_421920_4]")
	CastSpell(OwnerID(),OwnerID(),492664)
	sleep(50)
	Say(OwnerID() , "[SC_421920_5]")
	DisableQuest( OwnerID() , false )
end



function LuaS_421920_1()
	SetPlot( OwnerID() , "range" ,  "LuaS_421920_2" ,  50)
end

function LuaS_421920_2()
	if	CountBodyItem(OwnerID() , 203921) > 0	then
		SetPlot(TargetID() , "range" , "" ,  0 )
		BeginPlot(TargetID() , "LuaS_421920_3" , 0)
	end
end

function LuaS_421920_3()
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_421920]", 0 ) 
	local sec = 0
	local HideBall = Lua_DW_CreateObj("obj" , 112399, OwnerID())
	CastSpell(HideBall ,TargetID(),492681)
	while sec < 7 do

		if	CheckID(TargetID()) == false		then
			DelObj(HideBall )
			BeginPlot( OwnerID() , "LuaS_421920_1" , 1 )
			return
		end

		if	GetDistance( OwnerID(), TargetID() ) >80	or
			ReadRoleValue(TargetID(),EM_RoleValue_IsDead) == 1	 then
			AddBuff(TargetID(),502383,1,1)
			DelObj(HideBall )
			ScriptMessage( TargetID(), TargetID(), 2, "[SC_421920_3]", 0 )
			BeginPlot( OwnerID() , "LuaS_421920_1" , 1 )
			return
		end
		sec = sec + 1
		sleep(10)
	end
	AddBuff(HideBall,502383,1,1)
	DelObj(HideBall )
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_421920_1]", 0 ) 
--	local Monster = Lua_DW_CreateObj("flag" , 101676 , 780088 , 1)
	local kx,ky,kz,kdir=DW_Location(OwnerID());--根據物件位置
	local Monster=CreateObj(101676,kx,ky,kz,kdir,1);
	AddToPartition(Monster,0);
	WriteRoleValue( Monster , EM_RoleValue_PID , OwnerID())
	BeginPlot( Monster , "LuaS_Discowood_CheckPeace" , 0)
	SetPlot(Monster , "dead" , "LuaS_421920_4" , 0)
	SetAttack( Monster , TargetID())
	while CheckID(Monster) do
		sleep(10)
	end
	sleep(10)
	if	ReadRoleValue(OwnerID() , EM_RoleValue_PID )>0	then
		WriteRoleValue(OwnerID() , EM_RoleValue_PID , 0 )
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_421920_2]", 0 ) 
		GiveBodyItem(TargetID() , 203922 , 1)
		DelBodyItem(TargetID() , 203921 , 1 )
	end
	BeginPlot( OwnerID() , "LuaS_421920_1" , 1 )
end

function LuaS_421920_4()
	local Bar = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	WriteRoleValue(Bar , EM_RoleValue_PID , 1 )
end