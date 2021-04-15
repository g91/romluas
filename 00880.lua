
function LuaS_InstanceTellTime()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	Say(OwnerID() , Ver_Zone200_TestTime[RoomID] )
end

function LuaS_InstanceChangeTime(Time)
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	Ver_Zone200_TestTime[RoomID] = Time
	Say(OwnerID() , Ver_Zone200_TestTime[RoomID] )
end

function LuaS_Discowood_InstanceOnce()
	if CheckBuff( OwnerID() , 500669) then

	else
		if CountBodyItem(OwnerID() , 200392 ) > 0 then
			if	CastSpell( TargetID() , OwnerID() , 491284 ) then--施法
				DelBodyItem(OwnerID(),200392,1)
				sleep(10)
			end
		else
			BeginPlot(  OwnerID() , "LuaS_Discowood_InstanceOut" , 0 )
		end
	end
end

--玩家進入就觸碰範圍劇情執行條件
function LuaS_Discowood_FireInstance()
	--觸碰劇情
	SetPlot(OwnerID(),"range","LuaS_Discowood_InstanceOnce", 100)
	--紀錄回傳值
	local Pass = false
	--取物件層數
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	--宣告測試用的該層全域變數
	Ver_Zone200_TestTime[RoomID]=0
	--紀錄副本開的時間
	local Original_Hour = GetSystime(1)
	local Original_Min = GetSystime(2)
	--要開始廣播的流程
	local ReportTime = 55
	--創造怪物並紀錄ID
	local Array = {}
	--第1波
	Array = LuaS_Discowood_InstanceMonster(100377 , 18 ,  100376 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--第2波
	Array = LuaS_Discowood_InstanceMonster(100692 , 18 ,  100281 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--第3波
	Array = LuaS_Discowood_InstanceMonster(100097 , 18 ,  100131 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--第4波
	Array = LuaS_Discowood_InstanceMonster(100264 , 13 ,  100562 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--第5波
	Array = LuaS_Discowood_InstanceMonster(100236 , 13 ,  100228 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--第6波
	Array = LuaS_Discowood_InstanceMonster(100611 , 13 ,  100366 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--第7波
	Array = LuaS_Discowood_InstanceMonster(100625 , 10 ,  100370 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--第8波
	Array = LuaS_Discowood_InstanceMonster(100160 , 10 ,  100138 , RoomID)
	while true do
		Pass , ReportTime = LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
		if Pass == true then
			break
		end
		sleep(10)
	end
	--出寶箱
	local Chest = CreateObjByFlag( 100939 , 780087 , 0 , 1 )
	SetFightMode ( Chest,0,0,0,0 )
	AddToPartition(Chest,RoomID)
	BeginPlot( Chest , "LuaS_Discowood_InstanceChest" , 0 )
	SetPlot(OwnerID(),"range","", 0)
	while true do
		--計算已經經過的時間
		local Now_Hour = GetSystime(1)
		local Now_Min = GetSystime(2)	
		local Count_Hour = 0
		local Count_Min = 0
		if (Now_Hour-Original_Hour) < 0 then
			Count_Hour = Now_Hour - Original_Hour + 24
		else
			Count_Hour = Now_Hour - Original_Hour
		end

		Count_Min = Now_Min - Original_Min + (Count_Hour*60) + Ver_Zone200_TestTime[RoomID]
		--檢查是否進入倒數
		if 	Count_Min == ReportTime and
			ReportTime < 60 then
			local Time =""
			Time = ReplaceString( GetString("SC_111284_9") , "LastTime" , 60-ReportTime )
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 1 ,  Time )  --剩下x分鐘
			end
			ReportTime = ReportTime + 1
		end
		--如果時間超過就刪寶箱踢人
		if 	Count_Min >= 60 then
			if 	CheckID(Chest) and
				ReadRoleValue(Chest,EM_RoleValue_RoomID) == RoomID then
				DelObj(Chest)
			end	
			LuaS_Discowood_ClearInstance(RoomID)
		end
		sleep(10)
	end
end
--檢查時間是否超過&怪物是否死光的函式
function LuaS_Discowood_InstanceCheck(Array,Original_Hour,Original_Min,ReportTime,RoomID)
	--計算已經經過的時間
	local Now_Hour = GetSystime(1)
	local Now_Min = GetSystime(2)	
	local Count_Hour = 0
	local Count_Min = 0
	if (Now_Hour-Original_Hour) < 0 then
		Count_Hour = Now_Hour - Original_Hour + 24
	else
		Count_Hour = Now_Hour - Original_Hour
	end

	Count_Min = Now_Min - Original_Min + (Count_Hour*60) + Ver_Zone200_TestTime[RoomID]
	--檢查是否進入倒數
	if 	Count_Min == ReportTime and
		ReportTime < 60 then
		local Time =""
		Time = ReplaceString( GetString("SC_111284_9") , "LastTime" , 60-ReportTime )
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID() , 1 ,  Time )  --剩下x分鐘
		end
		ReportTime = ReportTime + 1
	end
	--檢查是不是要關閉副本、刪怪、踢玩家
	if 	Count_Min >= 60 then
		for i = 0 , table.getn(Array) do
			if 	CheckID(Array[i]) and
				ReadRoleValue(Array[i] , EM_RoleValue_RoomID) == RoomID then
				DelObj(Array[i])
			end
		end	
		LuaS_Discowood_ClearInstance(RoomID)
		return false , ReportTime
	end
	--宣告生存者變數
	local Survivor = 0
	--檢查剩幾隻怪物
	for i = 0 , table.getn(Array) do
		if 	CheckID(Array[i]) and
			ReadRoleValue(Array[i] , EM_RoleValue_RoomID) == RoomID and
			ReadRoleValue(Array[i] , EM_RoleValue_IsDead) == 0 then
			Survivor = Survivor + 1
		end
	end
	--怪物是不是掛光了？
	if Survivor == 0 then
		return true , ReportTime
	else
		return false , ReportTime
	end
end

--生怪物函式
function LuaS_Discowood_InstanceMonster(MonsterBoss , HowMuch ,  Monster1 , RoomID)
	local Array = {}
	local Boss = CreateObjByFlag( MonsterBoss, 780087 , 0 , 1 )
	AddToPartition( Boss ,   RoomID )
	Array[0] = Boss
	for i=1 , HowMuch do
		local Monster = CreateObjByFlag( Monster1, 780087 , i , 1 )
		AddToPartition( Monster ,  RoomID )
		Array[i] = Monster
	end

	return Array
end
--寶箱的初始劇情
function LuaS_Discowood_InstanceChest()
	SetPlot(OwnerID() , "touch" , "LuaS_Discowood_KillChest" , 40 )
end
--寶箱的觸碰劇情
function LuaS_Discowood_KillChest()
	NPCDead( TargetID() , OwnerID() )
	SetPlot(TargetID() , "touch" , "" ,  0 )
end
--清玩家函式
function LuaS_Discowood_ClearInstance(RoomID)
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == True then
				BeginPlot(  ID , "LuaS_Discowood_InstanceOut" , 0 )
			end
		end	
	end
end


function LuaS_Discowood_InstanceOut()
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	ChangeZone( OwnerID(), 2 , 0, 3905 , 49, -785, 240)
end