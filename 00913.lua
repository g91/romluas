-----------------------------------------------------------------------------------
--? runplot Refer_Davis_DiffTime �d�ߥثe�e�i�F�h�[���ɶ�
-----------------------------------------------------------------------------------
function Refer_Davis_DiffTime()
	Say( OwnerID() , Davis_DiffHour )
	Say( OwnerID() , Davis_DiffMin )
end

-----------------------------------------------------------------------------------
--? runplot Reset_Davis_DiffTime �N�e�i���ɶ��k�s
-----------------------------------------------------------------------------------
function Reset_Davis_DiffTime()
	Davis_DiffHour = 0
	Davis_DiffMin = 0
end

-----------------------------------------------------------------------------------
--? pcall Set_Davis_DiffHour(Hour) ��J�Q�n�e�i���p�ɼơA�d��u��O 0 ~ 23
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
--? pcall Set_Davis_DiffMin(Minute) ��J�Q�n�e�i�������ơA�d��u��O 0 ~ 59
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
--? runplot LuaS_DiffTellTime �d�ݥثezone302�ƥ��i��ɶ�
-----------------------------------------------------------------------------------
function LuaS_DiffTellTime()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Say( OwnerID() , Ver_Zone302_TestTime[RoomID] )
end

-----------------------------------------------------------------------------------
--? pcall LuaS_DiffChangeTime(Time) ��Jzone302�ƥ��i�檺�ɶ�
-----------------------------------------------------------------------------------
function LuaS_DiffChangeTime( Time )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Ver_Zone302_TestTime[ RoomID ] = Time
	Say( OwnerID() , Ver_Zone302_TestTime[RoomID] )
end