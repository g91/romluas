function Lua_mika_springfes_cast() 
	while true do
		local hour = GetSystime(1)
		local min = GetSystime(2)
		sleep(600)		
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域		
		if ZoneID <= 1000 then
			if hour == 10 and min == 50  then
				RunningMsg( OwnerID() , 2 , "[SC_DAN_SR_111700_1]") --活動即將在10分後開始【跑馬燈】。
			end
			if hour == 15 and min == 50  then
				RunningMsg( OwnerID() , 2 , "[SC_DAN_SR_111700_1]") --活動即將在10分後開始【跑馬燈】。
			end
			if hour == 19 and min == 50  then
				RunningMsg( OwnerID() , 2 , "[SC_DAN_SR_111700_1]") --活動即將在10分後開始【跑馬燈】。
			end
		end
	end
end

function Lua_mika_springfes_showtime() 
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	DebugMsg(OwnerID(),OwnerID(),month.."/"..day.." "..hour..":"..min)
end