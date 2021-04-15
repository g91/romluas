function LuaS_421928_0()
	if	CountBodyItem(OwnerID(),203950 )>0	then
		DelBodyItem(OwnerID(),203950 ,1)
		local CAP = Lua_DW_CreateObj("flag" , 112366 , 780088 , 1 )
		CastSpell( CAP , CAP , 491002 )
		AddBuff(OwnerID(),502925,1,2)
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_421928_1]", 0 ) 
		CallPlot(OwnerID() , "LuaS_421928_1" , CAP )
		return 1
	end
	return 0
end

function LuaS_421928_1(CAP )
	sleep(30)
	CastSpell( CAP , CAP , 491002 )
	AddBuff(TargetID(),502925,1,2)
	sleep(10)
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_421928_2]", 0 ) 
	DelObj(CAP )
	GiveBodyItem(OwnerID() , 204044  ,1)
end


function LuaS_421932_0()
	BeginPlot(TargetID() , "LuaS_421932_1" , 0)
	return true
end

function LuaS_421932_1()
	DelBodyItem(TargetID() , 203981 , 1)
	local GodItem = Lua_DW_CreateObj("flag" , 112407 , 780087 , 2 )
	sleep(10)
	local candle1 = Lua_DW_CreateObj("flag" , 112405 , 780087 , 3 )
	sleep(10)
	local candle2 = Lua_DW_CreateObj("flag" , 112405 , 780087 , 4 )
	sleep(10)
	local Elf = Lua_DW_CreateObj("flag" , 112403 , 780087 , 2 )
	sleep(20)
	Say(Elf , "[SC_421932]")
	sleep(20)
	Say(Elf , "[SC_421932_1]")
	sleep(20)
	Say(Elf , "[SC_421932_2]")
	sleep(20)
	Say(Elf , "[SC_421932_3]")
	sleep(20)
	SetFlag(TargetID() , 542407 , 1)
	DelObj(	Elf )
	DelObj(	candle1 )
	DelObj(	candle2 )
	DelObj(	GodItem )
end


function LuaS_421930_0()
	local Dis = 50
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z )
	local XYZ = { X+Dis*math.cos(math.pi/4) , Y+100 , Z+dis*math.sin(math.pi/4) }
	local Monster = Lua_DW_CreateObj( "xyz" , 101675, XYZ )
	SetPlot(Monster , "dead"  , "LuaS_421930_2" , 0)
	BeginPlot(Monster  , "LuaS_Discowood_CheckPeace" , 0 )
	SetAttack( Monster , OwnerID() )
	return true
end

function LuaS_421930_2()
	local TempID
	for	i=0 , HateListCount( OwnerID() )-1 do
		TempID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest( TempID , 421930) 	then
			ScriptMessage( TempID, TempID, 2, "[SC_421930_3]", 0 ) 
			ScriptMessage( TempID, TempID, 0, "[SC_421930_3]", 0 ) 
			GiveBodyItem(TempID, 204045 , 1)
		end
	end
end


function LuaS_421935_0()
	DisableQuest( OwnerID() , true )
	Say(OwnerID() , "[SC_421920_4]")
	CastSpell(OwnerID(),OwnerID(),491031)
	sleep(50)
	Say(OwnerID() , "[SC_421920_5]")
	DisableQuest( OwnerID() , false )
end