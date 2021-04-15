--節慶活動 5月愛樂節  岩鼠大暴走
--建立時間: 2009/04/16
--修改日期: 2009/04/27
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--掛在 任務NPC  魔法陣
------------------------------------------------------------------------------
function LuaN_musicfes_magic() --紅色魔法陣生怪 
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Array = {}
	local HowMuch = 10
	local MonsterID1
	local MonsterID2
	local MonsterID3
	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )

	if ZoneID == 2 then
		MonsterID1 = 101914	--產生藍色岩鼠
		MonsterID2 = 101915	--產生藍色岩鼠士兵
		MonsterID3 = 101916	--產生藍色岩鼠將軍
	elseif ZoneID == 6 then
		MonsterID1 = 101917	--產生紅色岩鼠
		MonsterID2 = 101918	--產生紅色岩鼠士兵
		MonsterID3 = 101919	--產生紅色岩鼠將軍
	end

	while 1 do
		--宣告生存者變數
		local Survivor1 = 0  --
		local Survivor2 = 0
		--檢查剩幾隻怪
		local T2Obj
		local T2Count = SetSearchRangeInfo( OwnerID() , 400 )
		for i = 1 , T2Count , 1 do
			local T2ID = GetSearchResult()
			T2Obj = Role:New( T2ID )
			if T2Obj:RoomID() == RoomID and T2Obj ~= OwnerID() then
				local FlagOrgID = T2Obj:OrgID()
				if (FlagOrgID == MonsterID1) then  --
					--DebugMsg( 0, RoomID ,"**Survivor1 Add")
					Survivor1 = Survivor1 + 1
				elseif (FlagOrgID == MonsterID2) then  --
					--DebugMsg( 0, RoomID ,"**Survivor2 Add")
					Survivor2 = Survivor2 + 1
				end
			end
		end
		--DebugMsg( 0, RoomID ,"!!Survivor1 = "..Survivor1.." !!Survivor2 = "..Survivor2)
		--怪物是不是掛光了？
		if Survivor1 == 0 then
			for i = 1 , HowMuch , 1 do
				local Monster = CreateObjByFlag( MonsterID1, 780304 , 0 , 1 ) --岩鼠
				AddToPartition( Monster ,  RoomID )
				MoveToFlagEnabled(Monster , false )
				CallPlot( Monster , "LuaN_musicfes_magic_bronmouse1" , i )
				Array[i] = Monster
			end
		end
		if Survivor2 == 0 then
			for i = 1 , HowMuch , 1 do
				local Monster = CreateObjByFlag( MonsterID2, 780304 , 0 , 1 ) --岩鼠士兵
				AddToPartition( Monster ,  RoomID )
				MoveToFlagEnabled(Monster  , false )
    				CallPlot( Monster , "LuaN_musicfes_magic_bronmouse2" , i )
				Array[i] = Monster
			end
		end
		--當岩鼠和岩鼠士兵被殺各300隻時，出現王x5
		if MusicFestival_Mouse_KillCount1 >= 300 or MusicFestival_Mouse_KillCount2 >= 300 then
		-- 2013. 07.02 修改boss出現規則 當岩或岩鼠士兵被殺300隻時
			for i = 1 , 5 , 1 do
				local Monster = CreateObjByFlag( MonsterID3, 780304 , 0 , 1 ) --岩鼠將軍
				AddToPartition(Monster ,  RoomID ) --叫老鼠走到某旗標
				MoveToFlagEnabled(Monster  , false )
				Yell( Monster , "[SC_MOUSEBRON6]", 3 ) --/*你們這些人類竟敢這樣對待我的子民，你們會後悔的！！
    				CallPlot( Monster , "LuaN_musicfes_magic_bronmouse3" , i )
				Array[i] = Monster
			end
			break
		end
		Sleep(10)
	end
end
------------------------------------------------------------------------------
function LuaN_musicfes_mouse1dead()
	MusicFestival_Mouse_KillCount1 = MusicFestival_Mouse_KillCount1 + 1 --第一種老鼠殺死數量
	return true
end
------------------------------------------------------------------------------
function LuaN_musicfes_mouse2dead()
	MusicFestival_Mouse_KillCount2 = MusicFestival_Mouse_KillCount2 + 1 --第二種老鼠殺死數量
	return true
end
------------------------------------------------------------------------------
function LuaN_musicfes_magic_bronmouse1(i)
	SetPlot( OwnerID(),"Dead","LuaN_musicfes_mouse1dead",0 )
	if LuaFunc_MoveToFlagandWait(OwnerID() , 780332, i-1, 0) == true then     --叫老鼠走到某旗標
		SetRandMove( OwnerID(), 30 ,  20 , 30 )
	end
end
-------------------------------------------------------------------------------
function LuaN_musicfes_magic_bronmouse2(i)
	SetPlot( OwnerID(),"Dead","LuaN_musicfes_mouse2dead",0 )
	if LuaFunc_MoveToFlagandWait(OwnerID() , 780306, i-1, 0) == true then     --叫老鼠走到某旗標
		SetRandMove( OwnerID(), 30 ,  20 , 30 )
	end
end
function LuaN_musicfes_magic_bronmouse3(i)
	SetPlot(OwnerID() , "dead","LuaN_musicfes_mouse3dead",0)
	if LuaFunc_MoveToFlagandWait(OwnerID() , 780332, i-1, 0) == true then     --叫老鼠走到某旗標
		SetRandMove( OwnerID(), 30 ,  20 , 30 )
	end
end
------------------------------------------------------------------------------
function LuaN_musicfes_mouse3dead()
	MusicFestival_Mouse_DiffBoss = MusicFestival_Mouse_DiffBoss + 1
	return true
end