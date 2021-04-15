function Lua_Az134_BugRun()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Bug=CreateObjByFlag(104567,780764,0,1)
	local Door=CreateObjByFlag(104519,780764,5,1)
	SetModeEx(Bug,EM_SetModeType_Fight,false)
	SetPlot(Bug,"Range","Lua_Az134_Bug_1",50)
	SetModeEx(Door,EM_SetModeType_Mark,false)
	SetModeEx(Door,EM_SetModeType_HideName,true)
	SetModeEx(Door,EM_SetModeType_NotShowHPMP,true)
	SetModeEx(Door,EM_SetModeType_Strikback,false)
	SetModeEx(Door,EM_SetModeType_Move,false)
	SetModeEx(Door,EM_SetModeType_Fight,false)
	SetModeEx(Door,EM_SetModeType_Searchenemy,false)
	SetModeEx(Door,EM_SetModeType_Obstruct,true)
	SetModeEx(Door,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Bug,EM_SetModeType_Searchenemy,false)
	SetModeEx(Bug,EM_SetModeType_Fight,false)
	AddToPartition(Bug,RoomID)
	AddToPartition(Door,RoomID)
	WriteRoleValue(Bug,EM_RoleValue_PID,Door)
--	Func_rand_walker(Bug,50,30)
end

function Lua_Az134_Bug_1()
	local Bug=TargetID()
	SetPlot(Bug,"Range","Lua_Az130_Empty",0)
	ScriptMessage(Bug,-1,2,"[SC_104567_01]",2)
	MoveToFlagEnabled(Bug,false)
	LuaFunc_MoveToFlag(Bug,780764,1,0)
	sleep(20)
	SetPlot(Bug,"Range","Lua_Az134_Bug_2",50)
end

function Lua_Az134_Bug_2()
	local Bug=TargetID()
	SetPlot(Bug,"Range","Lua_Az130_Empty",0)
	ScriptMessage(Bug,-1,2,"[SC_104567_03]",2)
	MoveToFlagEnabled(Bug,false)
	LuaFunc_MoveToFlag(Bug,780764,2,0)
	sleep(20)
	SetPlot(Bug,"Range","Lua_Az134_Bug_3",50)
end

function Lua_Az134_Bug_3()
	local Bug=TargetID()
	SetPlot(Bug,"Range","Lua_Az130_Empty",0)
	ScriptMessage(Bug,-1,2,"[SC_104567_04]",2)
	MoveToFlagEnabled(Bug,false)
	LuaFunc_MoveToFlag(Bug,780764,3,0)
	sleep(20)
	SetPlot(Bug,"Range","Lua_Az134_Bug_5",50)
end

function Lua_Az134_Bug_5()
	local Bug=TargetID()
	SetPlot(Bug,"Range","Lua_Az130_Empty",0)
	SetModeEx(Bug,EM_SetModeType_Fight,true)
	AddBuff(Bug,507758,0,-1)
	ScriptMessage(Bug,-1,2,"[SC_104567_06]",2)
	SetPlot(Bug,"dead","Lua_Az134_BugDie",0)
	local ppls=SearchRangePlayer(Bug,70)
	SetModeEx(Bug,EM_SetModeType_Searchenemy,true)
	SetModeEx(Bug,EM_SetModeType_Fight,true)
	SetAttack(Bug,ppls[DW_Rand(table.getn(ppls))-1])
end
			
function Lua_Az134_BugDie()
	local Door=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	ScriptMessage(OwnerID(),-1,2,"[SC_104567_07]",2)
	DelObj(Door)
end

function Lua_Az134_BugControl()
	while true do
		sleep(30)
		if CheckBuff(OwnerID(),503805)==true then
			SetRoleCamp(OwnerID(),"Monster")
			CancelBuff(OwnerID(),503805)
		end
	end
end