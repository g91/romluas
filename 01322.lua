function LuaS_MusicFestival_Mouse_Clock()	--�p�ɾ�
	MusicFestival_Mouse_KillCount1 = 0
	MusicFestival_Mouse_KillCount2 = 0
	MusicFestival_Mouse_DiffHour = 0--�ŧi�����ܼ�!!!!
	MusicFestival_Mouse_DiffMin = 0
	MusicFestival_Mouse_DiffSetp = "Close"
	MusicFestival_Mouse_DiffBoss = 0
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Step = "false"
	local hour = 0
	local min = 0
	local Array = {}
	local Wind = 0
	local Xtime = 0
	local Flag = 780304		--�X�l�s��
	local MonsterID = 0
	local BornString
	local Obj = Role:new( OwnerID() )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	
	local ZoneString
	if RealZoneID == 2 then
		ZoneString = "[SC_MOUSEBRON1]"
		MonsterID = 112593	--�����Ŧ��]�k�}
		BornString = "[SC_MOUSEBRON3]"
	elseif RealZoneID == 6 then
		ZoneString = "[SC_MOUSEBRON2]"
		MonsterID = 112594	--���ͬ����]�k�}
		BornString = "[SC_MOUSEBRON4]"
	end
------------------------------------------------
	while true do
----------------------------------------------�ɶ��B�z
		hour = GetSystime(1)
		min = GetSystime(2)

		if 	MusicFestival_Mouse_DiffHour ~= nil and
			MusicFestival_Mouse_DiffMin ~= nil then

			if 	MusicFestival_Mouse_DiffHour == 0 and
				MusicFestival_Mouse_DiffMin == 0 then
			else
				hour = GetSystime(1) + MusicFestival_Mouse_DiffHour
				min = GetSystime(2) + MusicFestival_Mouse_DiffMin

				if hour >23 then
					hour = hour - 24
				end

				if min > 59 then
					min = min - 60
				end
			end
		end
		--DebugMsg( 0, RoomID ,"MusicFestival_Mouse_DiffHour ="..MusicFestival_Mouse_DiffHour)
		if( hour == 14 or hour == 17 or hour == 20 ) and (min >= 0 ) then
			if  (Step == "false") then
				--DebugMsg( 0, RoomID ,"MusicFestival_Mouse_DiffSetp = Open")
				MusicFestival_Mouse_DiffSetp = "Open"
				MusicFestival_Mouse_DiffBoss = 0
				Step = "true"
				--�Ы��]�k�}
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsg( OwnerID() , 2 , ZoneString )
				end
				ScriptMessage( OwnerID(), 0, 2, BornString , 0 ) --/*�ͥX�Ǫ�
				Wind = CreateObjByFlag( MonsterID, Flag , 0 , 1 )
				AddToPartition(Wind ,0)
			else
				if MusicFestival_Mouse_DiffBoss >= 5 then
					sleep(600)
					if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
						RunningMsg( OwnerID() , 2 , "[SC_MOUSEBRON8]" )
					end
					--DebugMsg( 0, RoomID ,"MusicFestival_Mouse_DiffSetp = Close")
					MusicFestival_Mouse_DiffSetp = "Close"
					local T2Obj = SearchRangeNPC(OwnerID() , 1000)
					for i = 1 , table.getn( T2Obj ) do
						local ObjOrgID = ReadRoleValue( T2Obj[i] , EM_RoleValue_OrgID )
						local ObjRoomID = ReadRoleValue(T2Obj[i] , EM_RoleValue_RoomID)
						if ObjRoomID == RoomID then
							if (ObjOrgID == 101914) then
								DelObj(T2Obj[i])
							elseif (ObjOrgID == 101915) then
								DelObj(T2Obj[i])
							elseif (ObjOrgID == 101916) then
								DelObj(T2Obj[i])
							elseif (ObjOrgID == 101917) then
								DelObj(T2Obj[i])
							elseif (ObjOrgID == 101918) then
								DelObj(T2Obj[i])
							elseif (ObjOrgID == 101919) then
								DelObj(T2Obj[i])
							end
						end
					end
					--�R���]�k�}
					DelObj(Wind)
					MusicFestival_Mouse_KillCount1 = 0
					MusicFestival_Mouse_KillCount2 = 0
					MusicFestival_Mouse_DiffBoss = 0
				end
			end
		elseif (Step == "true") then
			if MusicFestival_Mouse_DiffSetp == "Open" then
				ScriptMessage( OwnerID(), 0, 2, "[SC_MOUSEBRON7]" , 0 )	--�]�k�}����q�H�ۮɶ������d�z�A�H���X�{���Ǫ��]���������L�v�L��
			end
			Step = "false"
			--DebugMsg( 0, RoomID ,"MusicFestival_Mouse_DiffSetp = Close")
			MusicFestival_Mouse_DiffSetp = "Close"
			local T2Obj = SearchRangeNPC(OwnerID() , 1000)
			for i = 1 , table.getn( T2Obj ) do
				local ObjOrgID = ReadRoleValue( T2Obj[i] , EM_RoleValue_OrgID )
				local ObjRoomID = ReadRoleValue(T2Obj[i] , EM_RoleValue_RoomID)
				if ObjRoomID == RoomID then
					if (ObjOrgID == 101914) then
						DelObj(T2Obj[i])
					elseif (ObjOrgID == 101915) then
						DelObj(T2Obj[i])
					elseif (ObjOrgID == 101916) then
						DelObj(T2Obj[i])
					elseif (ObjOrgID == 101917) then
						DelObj(T2Obj[i])
					elseif (ObjOrgID == 101918) then
						DelObj(T2Obj[i])
					elseif (ObjOrgID == 101919) then
						DelObj(T2Obj[i])

					end
				end
			end
			--�R���]�k�}
			DelObj(Wind)
			MusicFestival_Mouse_KillCount1 = 0
			MusicFestival_Mouse_KillCount2 = 0
		end
		--DebugMsg( 0, RoomID ,"MusicFestival_Mouse_KillCount1 = "..MusicFestival_Mouse_KillCount1.." MusicFestival_Mouse_KillCount2 = "..MusicFestival_Mouse_KillCount2)
		if Step == "true" and Xtime >= 60 and MusicFestival_Mouse_DiffSetp == "Open" then
			ScriptMessage( OwnerID(), 0, 2, "[SC_MOUSEBRON5][$SETVAR1="..MusicFestival_Mouse_KillCount1.."][$SETVAR2="..MusicFestival_Mouse_KillCount2.."]" , 0 )	--�s���Ǫ���
			Xtime = 0
		end
		--DebugMsg( 0, RoomID ,"Xtime = "..Xtime)
		Xtime = Xtime + 1
		sleep(20)
	end
end
--? runplot Refer_MusicFestival_Mouse_DiffTime �d�ߥثe�e�i�F�h�[���ɶ�
function Refer_MusicFestival_Mouse_DiffTime()
	Say(OwnerID(), MusicFestival_Mouse_DiffHour )
	Say(OwnerID(), MusicFestival_Mouse_DiffMin )
	ScriptMessage( OwnerID(), 0, 2, "[SC_MOUSEBRON5][$SETVAR1="..MusicFestival_Mouse_KillCount1.."][$SETVAR2="..MusicFestival_Mouse_KillCount2.."]" , 0 )	--�s���Ǫ���
end

--? runplot Reset_MusicFestival_Mouse_DiffTime �N�e�i���ɶ��k�s
function Reset_MusicFestival_Mouse_DiffTime()
	MusicFestival_Mouse_DiffHour = 0
	MusicFestival_Mouse_DiffMin = 0
end

--? pcall Set_MusicFestival_Mouse_DiffHour(hour) �u ( ) �v ����hour �N��A�Q�n�e�i���p�ɼƶq  �d��u��O0~23 �ó]���H��G�ۭt...
function Set_MusicFestival_Mouse_DiffHour(hour)
	if hour >= 48 then
	else
		if hour >= 24 then
		MusicFestival_Mouse_DiffHour = hour - 24
		else
		MusicFestival_Mouse_DiffHour = hour
		end
	end
end


-- �����b�����l�@�� �Ϫ��󦺤`�ᤣ�|�X�{���_��
function lua_mika_musicmouse_born()
	SetFlag(OwnerID(), 544801 , 1 )
end