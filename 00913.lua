-----------------------------------------------------------------------------------
--? runplot Refer_Davis_DiffTime 查詢目前前進了多久的時間
-----------------------------------------------------------------------------------
function Refer_Davis_DiffTime()
	Say( OwnerID() , Davis_DiffHour )
	Say( OwnerID() , Davis_DiffMin )
end

-----------------------------------------------------------------------------------
--? runplot Reset_Davis_DiffTime 將前進的時間歸零
-----------------------------------------------------------------------------------
function Reset_Davis_DiffTime()
	Davis_DiffHour = 0
	Davis_DiffMin = 0
end

-----------------------------------------------------------------------------------
--? pcall Set_Davis_DiffHour(Hour) 輸入想要前進的小時數，範圍只能是 0 ~ 23
-----------------------------------------------------------------------------------
function Set_Davis_DiffHour( Hour )
	if Hour >= 48 then
	else
		if Hour >= 24 then	Davis_DiffHour = Hour - 24
		else 						Davis_DiffHour = Hour
		end
	end
end

-----------------------------------------------------------------------------------
--? pcall Set_Davis_DiffMin(Minute) 輸入想要前進的分鐘數，範圍只能是 0 ~ 59
-----------------------------------------------------------------------------------
function Set_Davis_DiffMin( Minute )
	if Minute >= 120 then
	else
		if Minute >= 60 then	Davis_DiffMin = Minute - 60
		else							Davis_DiffMin = Minute
		end
	end
end

-----------------------------------------------------------------------------------
--? runplot LuaS_DiffTellTime 查看目前zone302副本進行時間
-----------------------------------------------------------------------------------
function LuaS_DiffTellTime()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Say( OwnerID() , Ver_Zone302_TestTime[RoomID] )
end

-----------------------------------------------------------------------------------
--? pcall LuaS_DiffChangeTime(Time) 輸入zone302副本進行的時間
-----------------------------------------------------------------------------------
function LuaS_DiffChangeTime( Time )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Ver_Zone302_TestTime[ RoomID ] = Time
	Say( OwnerID() , Ver_Zone302_TestTime[RoomID] )
end