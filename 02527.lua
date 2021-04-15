
function LuaS_498486_EnforcePlot()
	local Target,User = TargetID(),OwnerID()
	SysCastSpellLv(Target,User,498487,0)		--Just image effect
	local SoulTable = Lua_CreateObjToRandownPos(User,106401,10,150,true)
	for index,SoulGUID in pairs(SoulTable) do
		SetRoleCampID(SoulGUID,GetRoleCampID(Target))
		WriteRoleValue(SoulGUID,EM_RoleValue_LiveTime,4)
	end
end

function LuaS_498486_SoulInitialPlot()
	local Obj = OwnerID()
	SetPlot(Obj,"dead","LuaS_498486_DeadPlot",0)
end

function LuaS_498486_DeadPlot()
	local Player = TargetID()
	local Time = BuffInfo(Player,Lua_BuffPosSearch( Player , 621097 ),EM_BuffInfoType_Time)
	AddBuff(Player ,621097,0 ,Time+3)
	return true
end

function LuaS_498486_EnergyAdd()
	local Obj = OwnerID()
	SysCastSpellLv(Obj,Obj,498515,2)
	SysCastSpellLv(Obj,Obj,498516,9)
	SysCastSpellLv(Obj,Obj,498517,9)
	SysCastSpellLv(Obj,Obj,498518,9)
end