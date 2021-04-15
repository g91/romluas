function LuaS_MusicFestival_Mouse_Clock()	--計時器
	MusicFestival_Mouse_KillCount1 = 0
	MusicFestival_Mouse_KillCount2 = 0
	MusicFestival_Mouse_DiffHour = 0--宣告全域變數!!!!
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
	local Flag = 780304		--旗子編號
	local MonsterID = 0
	local BornString
	local Obj = Role:new( OwnerID() )
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	
	local ZoneString
	if RealZoneID == 2 then
		ZoneString = "[SC_MOUSEBRON1]"
		MonsterID = 112593	--產生藍色魔法陣
		BornString = "[SC_MOUSEBRON3]"
	elseif RealZoneID == 6 then
		ZoneString = "[SC_MOUSEBRON2]"
		MonsterID = 112594	--產生紅色魔法陣
		BornString = "[SC_MOUSEBRON4]"
	end
------------------------------------------------
	while true do
----------------------------------------------時間處理
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
				--創建魔法陣
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 , ZoneString )
				end
				ScriptMessage( OwnerID(), 0, 2, BornString , 0 ) --/*生出怪物
				Wind = CreateObjByFlag( MonsterID, Flag , 0 , 1 )
				AddToPartition(Wind ,0)
			else
				if MusicFestival_Mouse_DiffBoss >= 5 then
					sleep(600)
					if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
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
					--刪除魔法陣
					DelObj(Wind)
					MusicFestival_Mouse_KillCount1 = 0
					MusicFestival_Mouse_KillCount2 = 0
					MusicFestival_Mouse_DiffBoss = 0
				end
			end
		elseif (Step == "true") then
			if MusicFestival_Mouse_DiffSetp == "Open" then
				ScriptMessage( OwnerID(), 0, 2, "[SC_MOUSEBRON7]" , 0 )	--魔法陣的能量隨著時間漸漸削弱，隨之出現的怪物也都消失的無影無蹤
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
			--刪除魔法陣
			DelObj(Wind)
			MusicFestival_Mouse_KillCount1 = 0
			MusicFestival_Mouse_KillCount2 = 0
		end
		--DebugMsg( 0, RoomID ,"MusicFestival_Mouse_KillCount1 = "..MusicFestival_Mouse_KillCount1.." MusicFestival_Mouse_KillCount2 = "..MusicFestival_Mouse_KillCount2)
		if Step == "true" and Xtime >= 60 and MusicFestival_Mouse_DiffSetp == "Open" then
			ScriptMessage( OwnerID(), 0, 2, "[SC_MOUSEBRON5][$SETVAR1="..MusicFestival_Mouse_KillCount1.."][$SETVAR2="..MusicFestival_Mouse_KillCount2.."]" , 0 )	--廣播怪物數
			Xtime = 0
		end
		--DebugMsg( 0, RoomID ,"Xtime = "..Xtime)
		Xtime = Xtime + 1
		sleep(20)
	end
end
--? runplot Refer_MusicFestival_Mouse_DiffTime 查詢目前前進了多久的時間
function Refer_MusicFestival_Mouse_DiffTime()
	Say(OwnerID(), MusicFestival_Mouse_DiffHour )
	Say(OwnerID(), MusicFestival_Mouse_DiffMin )
	ScriptMessage( OwnerID(), 0, 2, "[SC_MOUSEBRON5][$SETVAR1="..MusicFestival_Mouse_KillCount1.."][$SETVAR2="..MusicFestival_Mouse_KillCount2.."]" , 0 )	--廣播怪物數
end

--? runplot Reset_MusicFestival_Mouse_DiffTime 將前進的時間歸零
function Reset_MusicFestival_Mouse_DiffTime()
	MusicFestival_Mouse_DiffHour = 0
	MusicFestival_Mouse_DiffMin = 0
end

--? pcall Set_MusicFestival_Mouse_DiffHour(hour) 「 ( ) 」 內的hour 代表你想要前進的小時數量  範圍只能是0~23 亂設的人後果自負...
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


-- 掛載在物件初始劇情 使物件死亡後不會出現帕奇鼠
function lua_mika_musicmouse_born()
	SetFlag(OwnerID(), 544801 , 1 )
end