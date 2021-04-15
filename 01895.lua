function Lua_Az190_ClockCount()
	local ReCount=3600
	SetPlot(OwnerID(),"Range","Lua_Az190_Clock",100)
	while true do
		sleep(10)
		Recount=Recount-1
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,Recount)
	end
end

function Lua_Az190_Clock()
	ClockOpen(OwnerID(),EM_ClockCheckValue_16,ReadRoleValue(TargetID(),EM_RoleValue_PID),ReadRoleValue(TargetID(),EM_RoleValue_PID),0,"Lua_Clockending","Lua_Clockending")
end