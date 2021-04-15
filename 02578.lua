function Lua_kors_z22_Detector()
local OID = OwnerID()
local Room = ReadRoleValue( OID ,EM_RoleValue_RoomID)
local zone = ReadRoleValue(OID, EM_RoleValue_ZoneID)
local count  = SearchRangeNPC( OID,120 )

	for i = 1, #count  do
		local OrgID = ReadRoleValue( count[i],EM_RoleValue_OrgID )
		if OrgID == 119614  then			
			BeginPlot( OID , "Lua_kors_z22_DetectorSet",0)
			return
		end
	end	
	ScriptMessage(OID,OID,1,"[SC_KORS_Z22_DETECTOR00]",C_SYSTEM)
end

function Lua_kors_z22_DetectorSet()
local OID = OwnerID()
local Room = ReadRoleValue( OID , EM_RoleValue_RoomID )
local detector = 119615
local SetNpc
local flag = 546115
	ScriptMessage( OID , OID , 1 , "[SC_KORS_Z22_DETECTOR03]", C_SYSTEM)
	Sleep(10)
	DelBodyItem( OID , 240765 , 1 )
	GiveBodyItem( OID , 240766 , 1 )
end

function Lua_kors_z22_DetectorPos()
local OID = OwnerID()
local flag = 781067
local time = 0
	while TRUE do
		local num = RandRange(1,4)
			if time%380 == 0 then
			SetPosByFlag(OID,flag,num)
			end 
		time = time +1	
	Sleep(10)
	end
end
function lua_kors_zone22Event_S()
--local Npc = TargetID()
local Npc = OwnerID()
local time = 0
local Rtime = Rand(10)+20
	Say(ownerID(),"[SC_KORS_ZONE22_ENT1]")
	Hide(Npc)
	while TRUE do
		local monster = ReadRoleValue(Npc, EM_RoleValue_PID)
		if time >= Rtime then
			Show(Npc,0)
			break
		end
	Sleep(10)
	time = time + 1 	
	end
end