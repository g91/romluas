function AI_AntQueen()
	SetPlot( OwnerID() , "dead" , "Lua_100160_deadlog_1" , 0 );
	local MonsterIDGroup = { 100679 , 100680 , 100681 , 100682 , 100683 , 100684 , 100685 , 100686 }	-- 卡托拉克蟻后分身群組
	local Monster3_4Number = 3	-- 呼叫 3 隻
	local Monster2_4Number = 4	-- 呼叫 4 隻
	local Monster1_4Number = 5	-- 呼叫 5 隻

	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- 一秒檢查一次
	local F3_4M = "NoCall"	-- 戰鬥狀態
	local F2_4M = "NoCall"	-- 戰鬥狀態
	local F1_4M = "NoCall"	-- 戰鬥狀態

	local TransferMark = false		-- 傳送旗標

	local Monster3_4Group = {}
	local Monster2_4Group = {}
	local Monster1_4Group = {}

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			--Say( OwnerID(), "Fighting! AttackTarget = "..AttackTarget.." n = "..n )

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			local RND =  Rand( 100 )+1	-- 產生亂數
			--Say( OwnerID() , RND )
			if ( RND > 95 ) then
				TransferMark = true
			end

			-- 血 3/4 叫怪
			if ( HPPercent <= 0.75 ) and ( F3_4M == "NoCall" ) then	F3_4M , Monster3_4Group = AntQueenKaGeBunSin( OwnerID() , Monster3_4Number , MonsterIDGroup , AttackTarget , GetString("MT_ANTQUEEN1") )	end
			-- 血 2/4 叫怪
			if ( HPPercent <= 0.50 ) and ( F2_4M == "NoCall" ) then	F2_4M , Monster2_4Group = AntQueenKaGeBunSin( OwnerID() , Monster2_4Number , MonsterIDGroup , AttackTarget , GetString("MT_ANTQUEEN1") )	end
			-- 血 2/4 開始傳送
			if ( HPPercent <= 0.50 ) and ( TransferMark == true ) then
				Say( OwnerID() , GetString("MT_ANTQUEEN2") )
				ChangeZone( AttackTarget , 105 , 0 , 1480 , 395 , 1209 , 270 )
				TransferMark = false
			end
			-- 血 1/4 叫怪
			if ( HPPercent <= 0.25 ) and ( F1_4M == "NoCall" ) then	F1_4M , Monster1_4Group = AntQueenKaGeBunSin( OwnerID() , Monster1_4Number , MonsterIDGroup , AttackTarget , GetString("MT_ANTQUEEN1") )	end

		else
			--Say( OwnerID(), "NoFight n = "..n )

			F3_4M = "NoCall"		-- 非戰鬥，歸零記號
			F2_4M = "NoCall"		-- 非戰鬥，歸零記號
			F1_4M = "NoCall"		-- 非戰鬥，歸零記號

			for i = 1, table.getn( Monster3_4Group ) do	-- 離開戰鬥時，刪除叫出來的蟻后分身
				if ( ( Monster3_4Group[i] ~= nil ) and ( CheckID( Monster3_4Group[i] ) == true ) ) then	DelObj( Monster3_4Group[i] )	end
			end
			for i = 1, table.getn( Monster2_4Group ) do	-- 離開戰鬥時，刪除叫出來的蟻后分身
				if ( ( Monster2_4Group[i] ~= nil ) and ( CheckID( Monster2_4Group[i] ) == true ) ) then	DelObj( Monster2_4Group[i] )	end
			end
			for i = 1, table.getn( Monster1_4Group ) do	-- 離開戰鬥時，刪除叫出來的蟻后分身
				if ( ( Monster1_4Group[i] ~= nil ) and ( CheckID( Monster1_4Group[i] ) == true ) ) then	DelObj( Monster1_4Group[i] )	end
			end

			if ( Monster3_4Group ~= nil ) then	Monster3_4Group = {}	end
			if ( Monster2_4Group ~= nil ) then	Monster2_4Group = {}	end
			if ( Monster1_4Group ~= nil ) then	Monster1_4Group = {}	end


		end

	Sleep( CheckTime )
	end

end

function AntQueenKaGeBunSin( Player , MonsterNumber , MonsterIDGroup , AttackTarget , MonsterTalk )
	local FTM = "NoCall"
	local MonsterGroup = {}

	for i = 1 , MonsterNumber do
		local RND =  Rand( table.getn( MonsterIDGroup ) )+1	-- 產生亂數
		MonsterGroup[i] = CreateMonsterByBOSSBatch( MonsterIDGroup[RND], Player , 0 , 0 )
	end
	FTM = "Called"			-- 作記號，讓怪只出現一次
	local MonsterAttack = SetMonsterAttack( MonsterGroup , AttackTarget )
	if ( MonsterTalk ~= nil ) then	Say( Player , MonsterTalk )	end

	return FTM , MonsterGroup
end

-- 蟻后巢穴進入傳送點
function LuaI_Enter_AntQueenNest()

	SetPlot( OwnerID() , "Range" , "Enter_AntQueenNest" ,  65 )

	--local OpenTime = 10 * 60 * 30	 -- 蟻后巢穴開放時間

	--while true do
	 	--if CheckFlag( OwnerID() , 540963 ) and CheckFlag( OwnerID() , 540964 ) then
			--local Name = GetName( TargetID() )
			--local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			--local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
			--if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				--RunningMsg( OwnerID() , 2 , GetString("MSG_ANTQUEEN_NEST_OPEN") )
			--end
			--Sleep( OpenTime )
			--SetFlag( OwnerID() , 540963 , 0 )
			--SetFlag( OwnerID() , 540964 , 0 )
			--local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			--local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
			--if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				--RunningMsg( OwnerID() , 2 , GetString("MSG_ANTQUEEN_NEST_CLOSE") )
			--end
		--end
		--Sleep( 10 )
	--end

end
function Enter_AntQueenNest()

	if CheckFlag( TargetID() , 540963 ) then
		DebugMsg( 0 , 0 , "Door has 540963" )
		DebugLog( 2, "Door has 540963" )
	end
	if CheckFlag( TargetID() , 540964 ) then
		DebugMsg( 0 , 0 , "Door has 540964" )
		DebugLog( 2, "Door has 540964" )
	end
	if CheckFlag( TargetID() , 540963 ) == false and CheckFlag( TargetID() , 540964 ) == false then
		DebugMsg( 0 , 0 , "Door has flag !!" )
		DebugLog( 2, "Door has no flag !!" )
	end

	if ChangeZone( OwnerID() , 105, 0 , 1480 , 395 , 1209 , 270 ) then
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
		DesignLog(OwnerID(),105,"last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end

end

-- 蟻后巢穴出去傳送點
function LuaI_Outer_AntQueenNest()
	SetPlot( OwnerID() , "Range" , "Outer_AntQueenNest" ,  65 )
end

function Outer_AntQueenNest()
	ChangeZone( OwnerID() , 6 , 0 , -18550 , -1004 , 6437 , 320 )
end

function AI_AntAnstan()

	local Player = OwnerID()
	local NestDoorID = 110982
	local SearchRange = 500

	for i = 1 , 5  do
		local NestDoor = LuaFunc_SearchNPCbyOrgID( Player , NestDoorID , SearchRange )
		if CheckID( NestDoor ) == true then
			WriteRoleValue ( Player , EM_RoleValue_PID , NestDoor )
			--Say (Player , NestDoor )
			
			if ReadRoleValue ( Player , EM_RoleValue_PID ) == NestDoor then
				DebugMsg( 0 , 0 , "AntAnstan write("..i..") the Door = "..NestDoor )
				DebugLog( 2, "AntAnstan write("..i..") the Door = "..NestDoor )
			else
				DebugMsg( 0 , 0 , "AntAnstan write("..i..") Error !!" )
				DebugLog( 2, "AntAnstan write("..i..") Error !!" )
			end
		else
			DebugLog( 2, "AntAnstan cannot find the Door !!" )
		end
		Sleep( 20 )
	end

	SetPlot( Player ,"Dead" , "Dead_AntAnstan" , 0 )

end
function Dead_AntAnstan()

	--Say( NestDoor , "AntAnstan Dead")
	NestDoor = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	DebugMsg( 0 , 0 , "AntAnstan Dead !!" )
	DebugLog( 2, "AntAnstan Dead !!" )

	SetFlag( NestDoor , 540963 , 1 )	-- 進入蟻穴標記安斯坦
	--Say( NestDoor , "540963 is Open")
	if CheckFlag( NestDoor , 540963 ) then
		DebugMsg( 0 , 0 , "540963 check !!" )
		DebugLog( 2, "540963 check !!" )
	else
		DebugMsg( 0 , 0 , "540963 Error !!" )
		DebugLog( 2, "540963 Error !!" )
	end

	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100626,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
end

function AI_AntAnschee()

	local Player = OwnerID()
	local NestDoorID = 110982
	local SearchRange = 500

	for i = 1 , 5  do
		local NestDoor = LuaFunc_SearchNPCbyOrgID( Player , NestDoorID , SearchRange )
		if CheckID( NestDoor ) == true then
			WriteRoleValue ( Player , EM_RoleValue_PID , NestDoor )
			--Say (Player , NestDoor )
			if ReadRoleValue ( Player , EM_RoleValue_PID ) == NestDoor then
					DebugMsg( 0 , 0 , "AntAnschee write("..i..") the Door = "..NestDoor )
					DebugLog( 2, "AntAnschee write("..i..") the Door = "..NestDoor )
				else
					DebugMsg( 0 , 0 , "AntAnschee write("..i..") Error !!" )
					DebugLog( 2, "AntAnschee write("..i..") Error !!" )
			end
		else
			DebugLog( 2, "AntAnschee cannot find the Door !!" )
		end
		Sleep( 20 )
	end

	SetPlot( Player ,"Dead" , "Dead_AntAnschee" , 0 )

end
function Dead_AntAnschee()

	--Say( NestDoor , "AntAnstan Dead")
	NestDoor = ReadRoleValue ( OwnerID() , EM_RoleValue_PID )
	DebugMsg( 0 , 0 , "AntAnschee Dead !!" )
	DebugLog( 2, "AntAnschee Dead !!" )
	SetFlag( NestDoor , 540964 , 1 )	-- 進入蟻穴標記安斯奇
	--Say( NestDoor , "540964 is Open")
	if CheckFlag( NestDoor , 540964 ) then
		DebugMsg( 0 , 0 , "540964 check !!" )
		DebugLog( 2, "540964 check !!" )
	else
		DebugMsg( 0 , 0 , "540964 Error !!" )
		DebugLog( 2, "540964 Error !!" )
	end

	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100627,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
end