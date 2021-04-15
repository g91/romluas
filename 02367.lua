function LuaFA_105481_M_End()
	local Driver = OwnerID()
	local Goods = ReadRoleValue(Driver,EM_RoleValue_Register1)
	local Horse = ReadRoleValue(Driver,EM_RoleValue_Register2)
	FA_MoveToPathStop(Driver)
	CancelBuff(Driver,509261)
	SetModeEx( Driver , EM_SetModeType_Show, FALSE)--是否繪製出模型
	DelObj(Goods)
	DelObj(Horse)
	FA_SetPosByObj(Driver,Zone14_CarGo_fa)
	MoveToPathPoint(Driver,0)
	FA_MoveToPathGo(Driver)
end

function LuaFA_105481_M_GetHeight()
	local Driver = OwnerID()
	local Goods = ReadRoleValue(Driver,EM_RoleValue_Register1)
	local Horse = ReadRoleValue(Driver,EM_RoleValue_Register2)
--	FA_MoveToPathStop(Driver)
--	FA_SetPosByObj(Driver, Driver)
	FA_SetPosByObj(Goods, Driver)
--	SetPos(Goods,kg_GetRangePos(Driver, nil, 30, 180))
--	FA_MoveToPathGo(Driver)
--	Sleep(1)
	AttachObj( Horse , Driver , 2 ,"p_down","p_top" )--馬連玩家
	AttachObj( Goods , Horse , 0 ,"p_down","p_top" )--拉車連馬
end

function LuaFA_105481_M_Born()
	local Driver = OwnerID()
	local Goods = kg_GetRangePos(Driver, 105441, 30, 180)
	local Horse = kg_GetPos( Driver, 105481 )--產生隱形小白
	SetModeEx( Driver , EM_SetModeType_Show, TRUE)--是否繪製出模型
	Sleep(10)
	Show(Goods,0)
	Show(Horse,0)
	kg_InvisibleObjInit( Horse)
	WriteRoleValue(Driver,EM_RoleValue_Register1,Goods)
	WriteRoleValue(Driver,EM_RoleValue_Register2,Horse)
	AttachObj( Horse , Driver , 2 ,"p_down","p_top" )--馬連玩家
	AttachObj( Goods , Horse , 0 ,"p_down","p_top" )--拉車連馬
--	DebugMsg(0,0,"Buff: "..FA_BuffInfo(Driver,509258,2))
	CancelBuff(Driver,509261)
--	DebugMsg(0,0,"Buff: "..FA_BuffInfo(Driver,509258,2))
	AddBuff(Driver,509261,120,-1)
--	DebugMsg(0,0,"Buff: "..FA_BuffInfo(Driver,509258,2))
	AddBuff(Goods,509257,240,-1)
	AddBuff(Horse,509257,240,-1)
	Say(Driver,"[SC_422488_0]!!")
--	DebugMsg(0,0,"Buff: "..FA_BuffInfo(Driver,509258,3))
end

function LuaFA_105481_M_Point()
	Zone14_CarGo_fa = OwnerID()
end

--function testm14()
--	debugmsg(0,0,Zone14_CarGo_fa)
--end