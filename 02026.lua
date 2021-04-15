function Lua_Az130_Statue_Ctrl()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Flag={1,2,3,4}
	local Flags
	local FlagRND
	local Statue1						--第一根點了沒反應
	local Statue2						--第二根點了會走路
	local Statue3						--第三根點了生小怪
	local Statue4						--第四根靠近生小怪
	local Trap=CreateObjByFlag(104233,780717,9,1)
	SetModeEx(Trap,EM_SetModeType_Move,false)
	SetModeEx(Trap,EM_SetModeType_Fight,false)
	SetModeEx(Trap,EM_SetModeType_Searchenemy,false)
	SetModeEx(Trap,EM_SetModeType_Strikback,false)
	SetModeEx(Trap,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Trap,EM_SetModeType_Obstruct,true)
	AddToPartition(Trap,RoomID)	
	BeginPlot(Trap,"Lua_Az130_Statue_ATT",0)
	Flags=table.getn(Flag)
	FlagRND=DW_Rand(Flags)
	Statue1=CreateObjByFlag(104214,780717,Flag[FlagRND],1)
	SetModeEx(Statue1,EM_SetModeType_Move,false)
	SetModeEx(Statue1,EM_SetModeType_Fight,false)
	SetModeEx(Statue1,EM_SetModeType_Searchenemy,false)
	SetModeEx(Statue1,EM_SetModeType_Strikback,false)
	SetModeEx(Statue1,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Statue1,EM_SetModeType_Obstruct,true)
	AddToPartition(Statue1,RoomID)
	SetCursorType(Statue1,3)
	WriteRoleValue(Statue1,EM_RoleValue_PID,Flag[FlagRND])			--寫入flag編號
	--WriteRoleValue(Statue1,EM_RoleValue_register2,0)
	BeginPlot(Statue1,"Lua_Az130_Statue_NON",0)
	say(Statue1,"1")
	table.remove(Flag,FlagRND)
	Flags=table.getn(Flag)
	FlagRND=DW_Rand(Flags)
	Statue2=CreateObjByFlag(104214,780717,Flag[FlagRND],1)
	SetModeEx(Statue2,EM_SetModeType_Move,true)
	SetModeEx(Statue2,EM_SetModeType_Fight,false)
	SetModeEx(Statue2,EM_SetModeType_Searchenemy,false)
	SetModeEx(Statue2,EM_SetModeType_Strikback,false)
	SetModeEx(Statue2,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Statue2,EM_SetModeType_Obstruct,true)
	AddToPartition(Statue2,RoomID)
	SetCursorType(Statue2,3)
	WriteRoleValue(Statue2,EM_RoleValue_PID,Flag[FlagRND])			--寫入flag編號
	WriteRoleValue(Statue2,EM_RoleValue_register1,Trap)
	--WriteRoleValue(Statue2,EM_RoleValue_register2,0)
	BeginPlot(Statue2,"Lua_Az130_Statue_MOV",0)
	say(Statue2,"2")
	table.remove(Flag,FlagRND)
	Flags=table.getn(Flag)
	FlagRND=DW_Rand(Flags)
	Statue3=CreateObjByFlag(104214,780717,Flag[FlagRND],1)
	SetModeEx(Statue3,EM_SetModeType_Move,false)
	SetModeEx(Statue3,EM_SetModeType_Fight,false)
	SetModeEx(Statue3,EM_SetModeType_Searchenemy,false)
	SetModeEx(Statue3,EM_SetModeType_Strikback,false)
	SetModeEx(Statue3,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Statue3,EM_SetModeType_Obstruct,true)
	AddToPartition(Statue3,RoomID)
	SetCursorType(Statue3,3)
	WriteRoleValue(Statue3,EM_RoleValue_PID,Flag[FlagRND])			--寫入flag編號
	--WriteRoleValue(Statue3,EM_RoleValue_register2,0)
	BeginPlot(Statue3,"Lua_Az130_Statue_CLK",0)
	say(Statue3,"3")
	table.remove(Flag,FlagRND)
	Flags=table.getn(Flag)
	FlagRND=DW_Rand(Flags)
	Statue4=CreateObjByFlag(104214,780717,Flag[FlagRND],1)
	SetModeEx(Statue4,EM_SetModeType_Move,false)
	SetModeEx(Statue4,EM_SetModeType_Fight,false)
	SetModeEx(Statue4,EM_SetModeType_Searchenemy,false)
	SetModeEx(Statue4,EM_SetModeType_Strikback,false)
	SetModeEx(Statue4,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Statue4,EM_SetModeType_Obstruct,true)
	AddToPartition(Statue4,RoomID)
	SetCursorType(Statue4,3)
	WriteRoleValue(Statue4,EM_RoleValue_PID,Flag[FlagRND])			--寫入flag編號
	--WriteRoleValue(Statue4,EM_RoleValue_register2,0)
	BeginPlot(Statue4,"Lua_Az130_Statue_RNG",0)
	say(Statue4,"4")
	--寫死的
	local Statue15=CreateObjByFlag(104214,780717,15,1)
	SetModeEx(Statue15,EM_SetModeType_Move,false)
	SetModeEx(Statue15,EM_SetModeType_Fight,false)
	SetModeEx(Statue15,EM_SetModeType_Searchenemy,false)
	SetModeEx(Statue15,EM_SetModeType_Strikback,false)
	SetModeEx(Statue15,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Statue15,EM_SetModeType_Obstruct,true)
	AddToPartition(Statue15,RoomID)
	SetCursorType(Statue15,3)
	WriteRoleValue(Statue15,EM_RoleValue_PID,15)			--寫入flag編號
	--WriteRoleValue(Statue4,EM_RoleValue_register2,0)
	BeginPlot(Statue15,"Lua_Az130_Statue_15",0)
	local Statue10=CreateObjByFlag(104214,780717,10,1)
	SetModeEx(Statue10,EM_SetModeType_Move,true)
	SetModeEx(Statue10,EM_SetModeType_Fight,false)
	SetModeEx(Statue10,EM_SetModeType_Searchenemy,false)
	SetModeEx(Statue10,EM_SetModeType_Strikback,false)
	SetModeEx(Statue10,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Statue10,EM_SetModeType_Obstruct,true)
	AddToPartition(Statue10,RoomID)
	SetCursorType(Statue10,3)
	WriteRoleValue(Statue10,EM_RoleValue_PID,11)			--寫入flag編號
	--WriteRoleValue(Statue10,EM_RoleValue_register2,0)
	BeginPlot(Statue10,"Lua_Az130_Statue_10",0)
	local Statue12=CreateObjByFlag(104214,780717,12,1)
	SetModeEx(Statue12,EM_SetModeType_Move,true)
	SetModeEx(Statue12,EM_SetModeType_Fight,false)
	SetModeEx(Statue12,EM_SetModeType_Searchenemy,false)
	SetModeEx(Statue12,EM_SetModeType_Strikback,false)
	SetModeEx(Statue12,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Statue12,EM_SetModeType_Obstruct,true)
	AddToPartition(Statue12,RoomID)
	SetCursorType(Statue12,3)
	WriteRoleValue(Statue12,EM_RoleValue_PID,13)			--寫入flag編號
	--WriteRoleValue(Statue10,EM_RoleValue_register2,0)
	BeginPlot(Statue12,"Lua_Az130_Statue_12",0)
	local Statue16=CreateObjByFlag(104214,780717,16,1)
	SetModeEx(Statue16,EM_SetModeType_Move,false)
	SetModeEx(Statue16,EM_SetModeType_Fight,false)
	SetModeEx(Statue16,EM_SetModeType_Searchenemy,false)
	SetModeEx(Statue16,EM_SetModeType_Strikback,false)
	SetModeEx(Statue16,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Statue16,EM_SetModeType_Obstruct,true)
	AddToPartition(Statue16,RoomID)
	SetCursorType(Statue16,3)
	WriteRoleValue(Statue16,EM_RoleValue_PID,16)			--寫入flag編號
	--WriteRoleValue(Statue4,EM_RoleValue_register2,0)
	BeginPlot(Statue16,"Lua_Az130_Statue_16",0)
	local Statue14=CreateObjByFlag(104214,780717,14,1)
	SetModeEx(Statue14,EM_SetModeType_Move,false)
	SetModeEx(Statue14,EM_SetModeType_Fight,false)
	SetModeEx(Statue14,EM_SetModeType_Searchenemy,false)
	SetModeEx(Statue14,EM_SetModeType_Strikback,false)
	SetModeEx(Statue14,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Statue14,EM_SetModeType_Obstruct,true)
	AddToPartition(Statue14,RoomID)
	SetCursorType(Statue14,3)
	WriteRoleValue(Statue14,EM_RoleValue_PID,14)			--寫入flag編號
	--WriteRoleValue(Statue4,EM_RoleValue_register2,0)
	BeginPlot(Statue14,"Lua_Az130_Statue_14",0)
	local Statue17=CreateObjByFlag(104214,780717,17,1)
	SetModeEx(Statue17,EM_SetModeType_Move,false)
	SetModeEx(Statue17,EM_SetModeType_Fight,false)
	SetModeEx(Statue17,EM_SetModeType_Searchenemy,false)
	SetModeEx(Statue17,EM_SetModeType_Strikback,false)
	SetModeEx(Statue17,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Statue17,EM_SetModeType_Obstruct,true)
	AddToPartition(Statue17,RoomID)
	SetCursorType(Statue17,3)
	WriteRoleValue(Statue17,EM_RoleValue_PID,17)			--寫入flag編號
	--WriteRoleValue(Statue4,EM_RoleValue_register2,0)
	BeginPlot(Statue17,"Lua_Az130_Statue_17",0)
	local XYZ={200,400,-950}
	local cloud=Lua_DW_CreateObj("xyz",104178,XYZ,0,0,1)
	SetModeEx(cloud,EM_SetModeType_Gravity,false) 					--重力
	SetModeEx(cloud,EM_SetModeType_Move,false)
	SetModeEx(cloud,EM_SetModeType_Fight,false)
	SetModeEx(cloud,EM_SetModeType_Searchenemy,false)
	SetModeEx(cloud,EM_SetModeType_Strikback,false)
	SetModeEx(cloud,EM_SetModeType_Mark ,false)
	AddToPartition(cloud,RoomID)
	say(cloud,"111")
	beginplot(cloud,"Lua_Az130_LightingCould",0)
end
	
function Lua_Az130_Statue_NON()
	SetPlot(OwnerID(),"touch","Lua_Az130_Statue1",50)
end

function Lua_Az130_Statue_MOV()
	SetPlot(OwnerID(),"touch","Lua_Az130_Statue2",50)
end

function Lua_Az130_Statue_CLK()
	SetPlot(OwnerID(),"touch","Lua_Az130_Statue3",50)
end

function Lua_Az130_Statue_RNG()
	SetPlot(OwnerID(),"Range","Lua_Az130_Statue4",100)
end

function Lua_Az130_Statue_15()
	SetPlot(OwnerID(),"Range","Lua_Az130_Statue4",150)
end

function Lua_Az130_Statue_10()
	SetPlot(OwnerID(),"touch","Lua_Az130_StatueMove1",50)
end

function Lua_Az130_Statue_12()
	SetPlot(OwnerID(),"touch","Lua_Az130_StatueMove2",50)
end

function Lua_Az130_Statue_16()
	SetPlot(OwnerID(),"Range","Lua_Az130_Statue4",150)
end

function Lua_Az130_Statue_14()
	SetPlot(OwnerID(),"touch","Lua_Az130_Statue3",50)
end

function Lua_Az130_Statue_17()
	SetPlot(OwnerID(),"touch","Lua_Az130_Statue1",50)
end

function Lua_Az130_LightingCould()
	while true do
		sleep(20)
		CastSpellLv(OwnerID(),OwnerID(),496046,0)
	end
end

function Lua_Az130_Statue_ATT()
	Setplot(OwnerID(),"Range","Lua_Az130_Trap",50)
	while true do
		sleep(10)
		CastSpellLv(OwnerID(),OwnerID(),496037,0)
	end
end

function Lua_Az130_StatueMove1()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local PlayerName=GetName(OwnerID())
	local MessageString="[SC_104217_01][$SETVAR1="..PlayerName.."]"
	local MsgStr="[SC_104217_03][$SETVAR1="..PlayerName.."]"
	local FlagNum=ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local NewStatue=CreateObjByFlag(104214,780717,FlagNum,1)
	ScriptMessage(TargetID(),-1,2,MessageString,2)
	sleep(20)
	ScriptMessage(TargetID(),-1,2,MsgStr,2)
	MoveToFlagEnabled (TargetID(),false)
	LuaFunc_MoveToFlag(TargetID(),780717,FlagNum,0)
	sleep(10)
	SetDir(TargetID(),270)
	sleep(10)
	SetModeEx(NewStatue,EM_SetModeType_Move,false)
	SetModeEx(NewStatue,EM_SetModeType_Fight,false)
	SetModeEx(NewStatue,EM_SetModeType_Searchenemy,false)
	SetModeEx(NewStatue,EM_SetModeType_Strikback,false)
	SetModeEx(NewStatue,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(NewStatue,EM_SetModeType_Obstruct,false)
	AddToPartition(NewStatue,RoomID)
	ScriptMessage(TargetID(),-1,2,"[SC_104217_09]",2)
	DelObj(TargetID())
end

function Lua_Az130_StatueMove2()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local PlayerName=GetName(OwnerID())
	local MessageString="[SC_104217_01][$SETVAR1="..PlayerName.."]"
	local MsgStr="[SC_104217_03][$SETVAR1="..PlayerName.."]"
	local FlagNum=ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local NewStatue=CreateObjByFlag(104214,780717,FlagNum,1)
	ScriptMessage(TargetID(),-1,2,MessageString,2)
	sleep(20)
	ScriptMessage(TargetID(),-1,2,MsgStr,2)
	MoveToFlagEnabled (TargetID(),false)
	LuaFunc_MoveToFlag(TargetID(),780717,FlagNum,0)
	sleep(10)
	SetDir(TargetID(),180)
	sleep(10)
	SetModeEx(NewStatue,EM_SetModeType_Move,false)
	SetModeEx(NewStatue,EM_SetModeType_Fight,false)
	SetModeEx(NewStatue,EM_SetModeType_Searchenemy,false)
	SetModeEx(NewStatue,EM_SetModeType_Strikback,false)
	SetModeEx(NewStatue,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(NewStatue,EM_SetModeType_Obstruct,false)
	AddToPartition(NewStatue,RoomID)
	ScriptMessage(TargetID(),-1,2,"[SC_104217_09]",2)
	DelObj(TargetID())
end

function Lua_Az130_Statue1()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local PlayerName=GetName(OwnerID())
	local MessageString="[SC_104217_01][$SETVAR1="..PlayerName.."]"
	local FlagNum=ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local NewStatue=CreateObjByFlag(104214,780717,FlagNum,1)
	ScriptMessage(TargetID(),-1,2,MessageString,2)
	sleep(20)
	SetModeEx(NewStatue,EM_SetModeType_Move,false)
	SetModeEx(NewStatue,EM_SetModeType_Fight,false)
	SetModeEx(NewStatue,EM_SetModeType_Searchenemy,false)
	SetModeEx(NewStatue,EM_SetModeType_Strikback,false)
	SetModeEx(NewStatue,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(NewStatue,EM_SetModeType_Obstruct,false)
	AddToPartition(NewStatue,RoomID)
	ScriptMessage(TargetID(),-1,2,"[SC_104217_02]",2)
	DelObj(TargetID())
end

function Lua_Az130_Statue2()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local PlayerName=GetName(OwnerID())
	local MessageString="[SC_104217_01][$SETVAR1="..PlayerName.."]"
	local MsgStr="[SC_104217_03][$SETVAR1="..PlayerName.."]"
	local FlagNum=ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local NewStatue=CreateObjByFlag(104214,780717,0,1)
	local Trap=ReadRoleValue(TargetID(),EM_RoleValue_register1)
	ScriptMessage(TargetID(),-1,2,MessageString,2)
	sleep(20)
	ScriptMessage(TargetID(),-1,2,MsgStr,2)
	MoveToFlagEnabled (TargetID(),false)
	LuaFunc_MoveToFlag(TargetID(),780717,FlagNum+4,0)
	sleep(10)
	LuaFunc_MoveToFlag(TargetID(),780717,0,0)
	sleep(30)
	SetDir(TargetID(),0)
	sleep(10)
	SetModeEx(NewStatue,EM_SetModeType_Move,false)
	SetModeEx(NewStatue,EM_SetModeType_Fight,false)
	SetModeEx(NewStatue,EM_SetModeType_Searchenemy,false)
	SetModeEx(NewStatue,EM_SetModeType_Strikback,false)
	SetModeEx(NewStatue,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(NewStatue,EM_SetModeType_Obstruct,false)
	AddToPartition(NewStatue,RoomID)
	ScriptMessage(TargetID(),-1,2,"[SC_104217_04]",2)
	DelObj(TargetID())
	DelObj(Trap)
end

function Lua_Az130_Statue3()
	local PlayerName=GetName(OwnerID())
	local MessageString="[SC_104217_01][$SETVAR1="..PlayerName.."]"
	local FlagNum=ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local Guard=CreateObjByFlag(104444,780717,FlagNum+4,1)
	local EmptyStatue=CreateObjByFlag(104215,780717,FlagNum,1)
	local RoomID=ReadRoleValue(TargetID(),EM_RoleValue_RoomID)
	ScriptMessage(OwnerID(),-1,2,MessageString,2)
	sleep(20)
	ScriptMessage(TargetID(),-1,2,"[SC_104217_05]",2)
	SetModeEx(EmptyStatue,EM_SetModeType_Move,false)
	SetModeEx(EmptyStatue,EM_SetModeType_Fight,false)
	SetModeEx(EmptyStatue,EM_SetModeType_Searchenemy,false)
	SetModeEx(EmptyStatue,EM_SetModeType_Strikback,false)
	SetModeEx(EmptyStatue,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(EmptyStatue,EM_SetModeType_Obstruct,false)
	sleep(20)
	local MsgStr="[SC_104217_07][$SETVAR1="..PlayerName.."]"
	ScriptMessage(TargetID(),-1,2,MsgStr,2)
	AddToPartition(Guard,RoomID)
	AddToPartition(EmptyStatue,RoomID)
	SetAttack(Guard,OwnerID())
	DelObj(TargetID())
end

function Lua_Az130_Statue4()
	setplot(TargetID(),"range","Lua_Az130_Empty",0)
	local PlayerName=GetName(OwnerID())
	local RoomID=ReadRoleValue(TargetID(),EM_RoleValue_RoomID)
	local MessageString="[SC_104217_06][$SETVAR1="..PlayerName.."]"
	local FlagNum=ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local Guard=CreateObjByFlag(104444,780717,FlagNum+4,1)
	local EmptyStatue=CreateObjByFlag(104215,780717,FlagNum,1)
	local MsgStr="[SC_104217_07][$SETVAR1="..PlayerName.."]"
	ScriptMessage(OwnerID(),-1,2,MessageString,2)
	sleep(100)
	--say(TargetID(),"FlagNum="..FlagNum)
	SetModeEx(EmptyStatue,EM_SetModeType_Move,false)
	SetModeEx(EmptyStatue,EM_SetModeType_Fight,false)
	SetModeEx(EmptyStatue,EM_SetModeType_Searchenemy,false)
	SetModeEx(EmptyStatue,EM_SetModeType_Strikback,false)
	SetModeEx(EmptyStatue,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(EmptyStatue,EM_SetModeType_Obstruct,false)
	ScriptMessage(TargetID(),-1,2,MsgStr,2)
	AddToPartition(Guard,RoomID)
	AddToPartition(EmptyStatue,RoomID)
	SetAttack(Guard,OwnerID())
	DelObj(TargetID())
end

function Lua_Az130_Empty()
end

function Lua_Az130_Trap()
	ScriptMessage(OwnerID(),-1,2,"[SC_104217_08]",2)
end

function Lua_Az130_Monkey()
	--say(OwnerID(),"111")
	--say(TargetID(),"222")
	local pos=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local MonkeyKing=CreateObjByFlag(104415,780718,pos,1)
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	AddToPartition(MonkeyKing,RoomID)
	SetAttack(MonkeyKing,TargetID())
	sleep(20)
	CastSpellLv(MonkeyKing,TargetID(),496055,0)
	ScriptMessage(OwnerID(),-1,2,"[SC_104217_31]",2)
end

function Lua_Az130_Monkey_0()
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	SetPlot(OwnerID(),"dead","Lua_Az130_Monkey",10)
end

function Lua_Az130_Monkey_1()
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
	SetPlot(OwnerID(),"dead","Lua_Az130_Monkey",10)
end

function Lua_Az130_Monkey_2()
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,2)
	SetPlot(OwnerID(),"dead","Lua_Az130_Monkey",10)
end

function Lua_Az130_Monkey_3()
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,3)
	SetPlot(OwnerID(),"dead","Lua_Az130_Monkey",10)
end

function Lua_Az130_FrenzyMonkey()
	local monkey=Lua_DW_CreateObj("obj",104424,OwnerID(),1,1)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,monkey)
	SetFollow(monkey,OwnerID())
	SetPlot(OwnerID(),"dead","Lua_Az130_MasterDie",0)
end

function Lua_Az130_MasterDie()
	local monkey=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	CastSpellLv(monkey,monkey,496064,1)									
	--ScriptMessage(OwnerID(),-1,2,"[SC_104217_]",2)
end

function Lua_Az130_Gate()
	AddBuff(OwnerID(),507528,0,-1)
	--setplot(OwnerID(),"range","Lua_Az130_GateGuard",100)
	setplot(OwnerID(),"dead","Lua_Az130_GateDead",0)
	while true do
		sleep(10)
		local HpMax=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)
		local HpNow=ReadRoleValue(OwnerID(),EM_RoleValue_HP)
		local Hp=HpNow/HpMax
		if Hp<=0.99 then
			beginplot(OwnerID(),"Lua_Az130_GateGuard",0)
			break
		end
	end
end

function Lua_Az130_GateGuard()
	setplot(TargetID(),"range","Lua_Az130_Empty",0)
--	setplot(OwnerID(),"dead","Lua_Az130_GateDead",0)
	local RoomID=ReadRoleValue(TargetID(),EM_RoleValue_RoomID)
	local HpMax=ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)
	local HpNow=ReadRoleValue(TargetID(),EM_RoleValue_HP)
	local Hp=HpNow/HpMax
	local Mob1=CreateObjByFlag(104442,780729,0,1)
	local Mob2=CreateObjByFlag(104440,780729,1,1)
	local Mob3=CreateOBjByFlag(104441,780729,2,1)
	local Mob4=CreateObjByFlag(104442,780729,3,1)
	local mobs={}
	--say(TargetID(),"111")
	SetModeEx(TargetID(),EM_SetModeType_Fight,true)
	SetModeEx(TargetID(),EM_SetModeType_Searchenemy,false)
	SetModeEx(TargetID(),EM_SetModeType_Strikback,false)
	SetModeEx(Mob1,EM_SetModeType_Move,false)
	SetModeEx(Mob1,EM_SetModeType_Fight,false)
	AddToPartition(Mob1,RoomID)
	table.insert(mobs,Mob1)
	ScriptMessage(Mob1,-1,2,"[SC_104217_21]",2)
	WriteRoleValue(TargetID(),EM_RoleValue_register1,mob1)
	local wave=0
	while true do
		sleep(10)
		local tgt = ReadRoleValue(mob1,EM_RoleValue_AttackTargetID)
		local HpMax=ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)
		local HpNow=ReadRoleValue(TargetID(),EM_RoleValue_HP)
		local Hp=HpNow/HpMax
		if Hp<=0.1 and wave<=8 then
--			say(TargetID(),"10%")
--			say(OwnerID(),"wave="..wave)
			wave=9
			Mob2=CreateObjByFlag(104440,780729,1,1)
			Mob3=CreateOBjByFlag(104441,780729,2,1)
			AddToPartition(Mob2,RoomID)
			AddToPartition(Mob3,RoomID)
			table.insert(mobs,Mob2)
			table.insert(mobs,Mob3)
			SetAttack(Mob2,tgt)
			SetAttack(Mob3,tgt)
			ScriptMessage(Mob4,-1,2,"[SC_104217_32]",2)
		elseif Hp<=0.2 and wave<=7 then
--			say(TargetID(),"20%")
--			say(OwnerID(),"wave="..wave)
			wave=8
			Mob2=CreateObjByFlag(104440,780729,2,1)
			Mob3=CreateOBjByFlag(104441,780729,1,1)
			AddToPartition(Mob2,RoomID)
			AddToPartition(Mob3,RoomID)
			table.insert(mobs,Mob2)
			table.insert(mobs,Mob3)
			SetAttack(Mob2,tgt)
			SetAttack(Mob3,tgt)
			ScriptMessage(Mob4,-1,2,"[SC_104217_29]",2)
		elseif Hp<=0.3 and wave<=6 then
--			say(TargetID(),"30%")
--			say(OwnerID(),"wave="..wave)
			wave=7
			Mob2=CreateObjByFlag(104440,780729,1,1)
			Mob3=CreateOBjByFlag(104441,780729,2,1)
			AddToPartition(Mob2,RoomID)
			AddToPartition(Mob3,RoomID)
			table.insert(mobs,Mob2)
			table.insert(mobs,Mob3)
			SetAttack(Mob2,tgt)
			SetAttack(Mob3,tgt)
			ScriptMessage(Mob4,-1,2,"[SC_104217_28]",2)
		elseif Hp<=0.4 and wave<=5 then
--			say(TargetID(),"40%")
--			say(OwnerID(),"wave="..wave)
			wave=6
			Mob2=CreateObjByFlag(104440,780729,2,1)
			Mob3=CreateOBjByFlag(104441,780729,1,1)
			AddToPartition(Mob2,RoomID)
			AddToPartition(Mob3,RoomID)
			table.insert(mobs,Mob2)
			table.insert(mobs,Mob3)
			SetAttack(Mob2,tgt)
			SetAttack(Mob3,tgt)
			ScriptMessage(Mob4,-1,2,"[SC_104217_27]",2)
		elseif Hp<=0.5 and wave<=4 then
--			say(TargetID(),"50%")
--			say(OwnerID(),"wave="..wave)
			wave=5
			Mob2=CreateObjByFlag(104440,780729,2,1)
			Mob3=CreateOBjByFlag(104441,780729,1,1)
			Mob4=CreateObjByFlag(104442,780729,3,1)
			SetModeEx(Mob4,EM_SetModeType_Fight,false)
			SetModeEx(Mob4,EM_SetModeType_Move,false)
			WriteRoleValue(TargetID(),EM_RoleValue_register2,mob4)
			AddToPartition(Mob2,RoomID)
			AddToPartition(Mob3,RoomID)
			AddToPartition(Mob4,RoomID)
			table.insert(mobs,Mob4)
			table.insert(mobs,Mob2)
			table.insert(mobs,Mob3)
			SetAttack(Mob2,tgt)
			SetAttack(Mob3,tgt)
			ScriptMessage(Mob1,-1,2,"[SC_104217_26]",2)
		elseif Hp<=0.6 and wave<=3 then
--			say(TargetID(),"60%")
--			say(OwnerID(),"wave="..wave)
			wave=4
			Mob2=CreateObjByFlag(104440,780729,1,1)
			Mob3=CreateOBjByFlag(104441,780729,2,1)
			AddToPartition(Mob2,RoomID)
			AddToPartition(Mob3,RoomID)
			table.insert(mobs,Mob2)
			table.insert(mobs,Mob3)
			SetAttack(Mob2,tgt)
			SetAttack(Mob3,tgt)
			ScriptMessage(Mob1,-1,2,"[SC_104217_25]",2)
		elseif Hp<=0.7 and wave<=2 then
--			say(TargetID(),"70%")
--			say(OwnerID(),"wave="..wave)
			wave=3
			Mob3=CreateOBjByFlag(104441,780729,1,1)
			table.insert(mobs,Mob3)
			AddToPartition(Mob3,RoomID)
			SetAttack(Mob3,tgt)
			ScriptMessage(Mob1,-1,2,"[SC_104217_24]",2)
		elseif Hp<=0.8 and wave<=1 then
--			say(TargetID(),"80%")
--			say(OwnerID(),"wave="..wave)
			wave=2
			Mob2=CreateObjByFlag(104440,780729,1,1)
			AddToPartition(Mob2,RoomID)
			table.insert(mobs,Mob2)
			SetAttack(Mob2,tgt)
			ScriptMessage(Mob1,-1,2,"[SC_104217_23]",2)
		elseif Hp<=0.9 and wave<=0 then
--			say(TargetID(),"90%")
--			say(OwnerID(),"wave="..wave)
			wave=1
			ScriptMessage(Mob1,-1,2,"[SC_104217_22]",2)
		end
		if checkid(mob1)==true and tgt==0 and wave>1 then
			local npcs=SearchRangeNPC(OwnerID(),500)
			for i=1,table.getn(mobs) do
--				say(OwnerID(),"mob="..mobs[i])
				DelObj(mobs[i])
--				for j=1,table.getn(npcs) do
--					say(OwnerID(),"npc="..npcs[j])
--					if mobs[i]==npcs[j] then
--						DelObj(mobs[i])
--						DelObj(npcs[j])
--					end
--				end
			end
			local gate=CreateObjByFlag(104443,780729,4,1)
			SetModeEx(gate,EM_SetModeType_Obstruct,true)
			SetModeEx(gate,EM_SetModeType_Move,false)
			SetModeEx(gate,EM_SetModeType_Searchenemy,false)
			SetModeEx(gate,EM_SetModeType_Drag,true)
			SetModeEx(gate,EM_SetModeType_DisableRotate,true)
			SetModeEx(gate,EM_SetModeType_Strikback,false)
			AddToPartition(gate,RoomID)
			BeginPlot(gate,"Lua_Az130_Gate",0)
			sleep(10)
			Delobj(OwnerID())
		end
			
	end
end

function Lua_Az130_GateDead()
	local Mob1=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	local Mob4=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	ScriptMessage(Mob4,-1,2,"[SC_104217_30]",2)
	DelObj(Mob1)
	DelObj(Mob4)
	DelObj(OwnerID())
		--say(TargetID(),"die")
end

function Lua_Az130_TouchStone0()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone0",50)
end
function Lua_Az130_Stone0()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_10]",2)
end

function Lua_Az130_TouchStone1()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone1",50)
end
function Lua_Az130_Stone1()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_11]",2)
end

function Lua_Az130_TouchStone2()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone2",50)
end
function Lua_Az130_Stone2()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_12]",2)
end

function Lua_Az130_TouchStone3()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone3",50)
end
function Lua_Az130_Stone3()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_13]",2)
end

function Lua_Az130_TouchStone4()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone4",50)
end
function Lua_Az130_Stone4()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_14]",2)
end

function Lua_Az130_TouchStone5()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone5",50)
end
function Lua_Az130_Stone5()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_15]",2)
end

function Lua_Az130_TouchStone6()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone6",50)
end
function Lua_Az130_Stone6()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_16]",2)
end

function Lua_Az130_TouchStone7()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone7",50)
end
function Lua_Az130_Stone7()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_17]",2)
end

function Lua_Az130_TouchStone8()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone8",50)
end
function Lua_Az130_Stone8()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_18]",2)
end

function Lua_Az130_TouchStone9()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone9",50)
end
function Lua_Az130_Stone9()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_19]",2)
end

function Lua_Az130_TouchStone10()
	SetCursorType(OwnerID(),3)
	SetPlot(OwnerID(),"touch","Lua_Az130_Stone10",50)
end
function Lua_Az130_Stone10()
	ScriptMessage(TargetID(),OwnerID(),2,"[SC_104217_20]",2)
end