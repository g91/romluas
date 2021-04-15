------------------------------------------------
--zone302副本計時器
------------------------------------------------
function LuaS_Davis_Clock()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	Davis_DiffHour = 0	--宣告全域變數
	Davis_DiffMin = 0
	local Bron = 0
	local Train = 0
	local Train2 = 0
	local Step = "false"
	local StartTime1 = GetDBKeyValue( "TempestHeightTime_01" )	-- 取得 LogView 中  Special Event 指定的風野之靈開啟時間1
	local StartTime2 = GetDBKeyValue( "TempestHeightTime_02" )	-- 取得 LogView 中  Special Event 指定的風野之靈開啟時間2
	Train = CreateObj( 111457, 1266 , 685 , 1106 , 138 , 1 )	--回Zone6傳送點
	AddToPartition( Train , RoomID )
	SetPlot( Train , "range" , "LuaS_Davis_InstanceOut" , 20 )	--將玩家傳回Zone6風野之靈外

	while true do
		local Hour , Minute = Davis_GetSysTime()	--取得當前時間（包含使用測試指令修改後時間）
		
		if ( Hour == StartTime1 or Hour == StartTime2 ) and ( Minute >= 0 ) and ( Step == "false" ) then
			DelObj( Train2 )
			Bron = LuaFunc_CreateObjByObj ( 111457 , OwnerID() )
			BeginPlot ( Bron , "LuaS_Davis_FireInstance" , 0 )	--副本開始啟動
			Hide( Bron )
			Step = "true"
			
		elseif ( Hour ~= StartTime1 ) and ( Hour ~= StartTime2 ) and ( Step == "true" ) then
			sleep( 100 )
			local BB = LuaFunc_CreateObjByObj ( 111457 , Bron )
			BeginPlot( BB , "LuaS_Davis_DelChest" , 0 )	--刪寶箱
			Hide( BB )
			DelObj( Bron )
			Train2 = LuaFunc_CreateObjByObj ( 111457 , OwnerID() )
			BeginPlot ( Train2 , "LuaS_Davis_AllClearInstance" , 0 )	--清玩家
			Step = "false"
		end
		sleep(10)
	end
end

------------------------------------------------
--副本開始啟動
------------------------------------------------
function LuaS_Davis_FireInstance()
	local Temp = {}
	local Count = 1
	local BoxCount = 10
	Ver_Zone302_TestTime = {}
	local Pass = false	--紀錄回傳值
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	--取物件層數
	Ver_Zone302_TestTime[ RoomID ]=0	--宣告測試用的該層全域變數
	--紀錄副本開始跑動的時間
	local Original_Hour , Original_Min = Davis_GetSysTime()	--取得當前時間（包含使用測試指令修改後時間）

	local ReportTime = 55	--要開始廣播的流程
	local Array = {}	--創造怪物並紀錄ID

	local BossTable 	= { 
		100959 , 	--希蕊花兒之靈
		100957 , 	--阿迪斯之靈
		100955 , 	--荒神之靈
		100961 , 	--烈焰禿鷹王之靈
		100963 , 	--屍骸翼龍王之靈
		100953 , 	--阿耶羅之靈
		100965 , 	--燄叱甲蟲王之靈
		100969 , 	--波伊登之靈
		100967 , 	--陸戰龜王之靈
		100971 ,	--恐懼魔像之靈
		109241 , 	--尼普之靈
		109243 , 	--拜桑之靈
		109245 , 	--邦特姆之靈
		109247 , 	--蜘蛛女神之靈
		109249 , 	--巨猿王之靈
		109251 , 	--暴怒御風者
		109253 , 	--槐桑之靈
		109255 , 	--賽巴沃卡之靈
		109257 , 	--海德拉之靈
		109259 } 	--貝希摩斯之靈

	local MonsterTable = { 
		100960 , 	--花花仙人掌之靈
		100958 , 	--狂刃搜尋者之靈
		100956 , 	--荒野巨狼之靈
		100962 , 	--烈焰禿鷹之靈
		100964 , 	--寒怒翼龍之靈
		100954 , 	--彩翼羽妖之靈
		100966 , 	--虹叱甲蟲之靈
		100970 , 	--風野勇士之靈
		100968 , 	--歐蘇勒龜人之靈
		100972 , 	--遺跡劍士之靈
		109242 , 	--絕地沙蠍之靈
		109244 , 	--拉扣獸之靈
		109246 , 	--邦加巨獸之靈
		109248 , 	--鮮紅毒蛛之靈
		109250 , 	--強壯巨猿之靈
		109252 , 	--暴怒獅龍
		109254 , 	--狂怒亞龍之靈
		109256 , 	--莫斯托之靈
		109258 , 	--毒蟒之靈
		109260 } 	--斑斕巨獸之靈
	
	--產怪波次
	for i = 1 , table.getn( BossTable ) do
		Array = LuaS_Davis_InstanceMonster( BossTable[ i ] , 18 ,  MonsterTable[ i ] , RoomID )	--生怪物函式
		while true do
			Pass , ReportTime = LuaS_Davis_InstanceCheck( Array , Original_Hour , Original_Min , ReportTime , RoomID )	--檢查時間是否超過 & 怪物是否死光的函式
			if Pass == true then	break
			end
			Sleep(10)
		end
		Sleep(300)
	end

	--收尾動作
	while true do
		--計算已經經過的時間
		local Now_Hour , Now_Min = Davis_GetSysTime()	--取得當前時間（包含使用測試指令修改後時間）
		local Count_Hour = 0
		local Count_Min = 0

		if ( Now_Hour - Original_Hour ) < 0 then	Count_Hour = Now_Hour - Original_Hour + 24
		else														Count_Hour = Now_Hour - Original_Hour
		end

		Count_Min = Now_Min - Original_Min + ( Count_Hour * 60 ) + Ver_Zone302_TestTime[ RoomID ]
		--檢查是否進入倒數
		if 	Count_Min == ReportTime and
			ReportTime < 60 then
			local Time = ""
			Time = ReplaceString( GetString("SC_111284_9") , "LastTime" , 60 - ReportTime )
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 1 ,  Time )  --剩下x分鐘
			end
			ReportTime = ReportTime + 1
		end
		--如果時間超過就刪寶箱踢人
		if 	Count_Min >= 60 then
			--刪怪
			for i = 1 , table.getn( Array ) , 1 do
				DelObj( Array[ i ] )
			end

			--清玩家
			LuaS_Davis_ClearInstance( RoomID )
			break
		end
		Sleep( 10 )
	end
end

------------------------------------------------
--生怪物函式
------------------------------------------------
function LuaS_Davis_InstanceMonster( BossID , HowMuch ,  MonsterID , RoomID )
	local Array = {}
	local Boss = CreateObjByFlag( BossID , 780193 , 0 , 1 )
	AddToPartition( Boss , RoomID )
	SetPlot( Boss ,"dead" , "LuaS_Davis_Chest" , 0 )	--怪物死亡產生寶箱
	Array[ 0 ] = Boss
	for i = 1 , HowMuch , 1 do
		local Monster = CreateObjByFlag( MonsterID , 780193 , i , 1 )
		AddToPartition( Monster ,  RoomID )
		SetPlot( Monster ,"dead" , "LuaS_Davis_Chest" , 0 )	--怪物死亡產生寶箱
		SetRandMove( Monster , 30 ,  20 , 30 )
		Array[ i ] = Monster
	end
	return Array
end

--------------------------------------------------------------
--檢查時間是否超過 & 怪物是否死光的函式
--------------------------------------------------------------
function LuaS_Davis_InstanceCheck( Array , Original_Hour , Original_Min , ReportTime , RoomID )
	--計算已經經過的時間
	local Now_Hour , Now_Min = Davis_GetSysTime()	--取得當前時間（包含使用測試指令修改後時間）
	local Count_Hour = 0
	local Count_Min = 0
	
	if Now_Hour >= 24 then	Now_Hour = Now_Hour - 24
	end
	if Now_Min >= 60 then	Now_Min = Now_Min - 60
	end
	if ( Now_Hour - Original_Hour ) < 0 then	Count_Hour = Now_Hour - Original_Hour + 24
	else														Count_Hour = Now_Hour - Original_Hour
	end

	Count_Min = Now_Min - Original_Min + ( Count_Hour * 60 ) + Ver_Zone302_TestTime[ RoomID ]
	--檢查是否進入倒數
	if 	Count_Min == ReportTime and ReportTime < 60 then
		local Time = ""
		Time = "[SC_111284_9][$SETVAR1=" .. 60 - ReportTime .. "]"
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID() , 1 ,  Time )  --剩下x分鐘
		end
		ReportTime = ReportTime + 1
	end
	--檢查是不是要關閉副本、刪怪、踢玩家
	if 	Count_Min >= 60 then
		for i = 0 , table.getn( Array ) do
			if 	CheckID( Array[ i ] ) and
				ReadRoleValue( Array[ i ] , EM_RoleValue_RoomID ) == RoomID then
				DelObj( Array[ i ] )
			end
		end	
		LuaS_Davis_ClearInstance( RoomID )
		local Pass = false
		return Pass , ReportTime
	end
	--宣告生存者變數
	local Survivor = 0
	--檢查剩幾隻怪物
	for i = 0 , table.getn( Array ) do
		if 	CheckID( Array[ i ] ) and
			ReadRoleValue( Array[ i ] , EM_RoleValue_RoomID ) == RoomID and
			ReadRoleValue( Array[ i ] , EM_RoleValue_IsDead ) == 0 then
			Survivor = Survivor + 1
		end
	end
	--怪物是不是掛光了？
	if Survivor == 0 then
		local Pass = true
		return Pass , ReportTime
	else
		local Pass = false
		return Pass , ReportTime
	end
end

------------------------------------------------
--怪物死亡產生寶箱
------------------------------------------------
function LuaS_Davis_Chest()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local MonsterID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local BossTable 	= { 
		100959 , 	--希蕊花兒之靈
		100957 , 	--阿迪斯之靈
		100955 , 	--荒神之靈
		100961 , 	--烈焰禿鷹王之靈
		100963 , 	--屍骸翼龍王之靈
		100953 , 	--阿耶羅之靈
		100965 , 	--燄叱甲蟲王之靈
		100969 , 	--波伊登之靈
		100967 , 	--陸戰龜王之靈
		100971 ,	--恐懼魔像之靈
		109241 , 	--尼普之靈
		109243 , 	--拜桑之靈
		109245 , 	--邦特姆之靈
		109247 , 	--蜘蛛女神之靈
		109249 , 	--巨猿王之靈
		109251 , 	--暴怒御風者
		109253 , 	--槐桑之靈
		109255 , 	--賽巴沃卡之靈
		109257 , 	--海德拉之靈
		109259 } 	--貝希摩斯之靈

	local MonsterTable = { 
		100960 , 	--花花仙人掌之靈
		100958 , 	--狂刃搜尋者之靈
		100956 , 	--荒野巨狼之靈
		100962 , 	--烈焰禿鷹之靈
		100964 , 	--寒怒翼龍之靈
		100954 , 	--彩翼羽妖之靈
		100966 , 	--虹叱甲蟲之靈
		100970 , 	--風野勇士之靈
		100968 , 	--歐蘇勒龜人之靈
		100972 , 	--遺跡劍士之靈
		109242 , 	--絕地沙蠍之靈
		109244 , 	--拉扣獸之靈
		109246 , 	--邦加巨獸之靈
		109248 , 	--鮮紅毒蛛之靈
		109250 , 	--強壯巨猿之靈
		109252 , 	--暴怒獅龍
		109254 , 	--狂怒亞龍之靈
		109256 , 	--莫斯托之靈
		109258 , 	--毒蟒之靈
		109260 } 	--斑斕巨獸之靈
		
	local ChestID 	= { 
		101302 , 101303 , 101304 , 101305 , 101306 , 101307 , 101308 , 101309 , 101310 , 101311 ,	--NPC：古老寶箱 I ~ X
		109261 , 109262 , 109263 , 109264 , 109265 , 109266 , 109267 , 109268 , 109269 , 109270 } 	--NPC：古老寶箱 XI ~ XX
	local ChestID2 = { 
		101312 , 101313 , 101314 , 101315 , 101316 , 101317 , 101318 , 101319 , 101320 , 101321 ,	--NPC：神秘寶箱 I ~ X
		109271 , 109272 , 109273 , 109274 , 109275 , 109276 , 109277 , 109278 , 109279 , 109280 } 	--NPC：神秘寶箱 XI ~ XX
	local ChestN = { 4 , 4 , 8 , 8 , 12 , 12 , 16 , 16 , 20 , 20 , 24 , 24 , 28 , 28 , 32 , 32 , 36 , 36 , 40 , 40 }	--寶箱數量
	local LiveTime = { 60 , 60 , 60 , 60 , 60 , 60 , 60 , 60 , 120 , 120 , 120 , 120 , 120 , 120 , 120 , 120 , 180 , 180 , 180 , 180 }	--生存時間

	local Step = 1
	for i = 1 , table.getn( BossTable ) do
		if MonsterID == BossTable[ i ] or MonsterID == MonsterTable[ i ]  then	Step = i
		end
	end
	
	local Chest = Lua_Davis_BornByMultilateral2( ChestID[ Step ] , ChestID2[ Step ] , ChestN[ Step ] , 30 , 0 )	--在周圍dis 用MonsterID 圍成 X 角形
	for i = 1 , table.getn( Chest ) , 1 do
		BeginPlot( Chest[ i ] , "LuaS_Davis_InstanceChest" , 0 )
		CallPlot( Chest[ i ] , "Lua_ObjLifeTime" , LiveTime[ Step ] )
		DebugMsg( 0 , RoomID , "i= " .. i .. " LiveTime = " .. LiveTime[ Step ] )
	end
	return Chest
end

------------------------------------------------
--寶箱的初始劇情
------------------------------------------------
function LuaS_Davis_InstanceChest()
	SetCursorType( OwnerID() ,eCursor_Locked )
	SetPlot( OwnerID() , "touch" , "LuaS_Davis_KillChest" , 40 )
end

------------------------------------------------
--寶箱的觸碰劇情
------------------------------------------------
function LuaS_Davis_KillChest()
	SetPlot( TargetID() , "touch" , "" , 0 )
	local ChestID = { 
		101302 , 101303 , 101304 , 101305 , 101306 , 101307 , 101308 , 101309 , 101310 , 101311 , 	--NPC：古老寶箱 I ~ X
		109261 , 109262 , 109263 , 109264 , 109265 , 109266 , 109267 , 109268 , 109269 , 109270 , 	--NPC：古老寶箱 XI ~ XX
		101312 , 101313 , 101314 , 101315 , 101316 , 101317 , 101318 , 101319 , 101320 , 101321 , 	--NPC：神秘寶箱 I ~ X
		109271 , 109272 , 109273 , 109274 , 109275 , 109276 , 109277 , 109278 , 109279 , 109280 } 	--NPC：神秘寶箱 XI ~ XX
	local GiveItem = { 
		203246 , 203247 , 203248 , 203249 , 203250 , 203251 , 203252 , 203253 , 203254 , 203255 , 	--物品：古老寶箱 I ~ X
		208351 , 208352 , 208353 , 208354 , 208355 , 208356 , 208357 , 208358 , 208359 , 208360 , 	--物品：古老寶箱 XI ~ XX
		203256 , 203257 , 203258 , 203259 , 203260 , 203261 , 203262 , 203263 , 203264 , 203265 , 	--物品：神秘寶箱 I ~ X
		208361 , 208362 , 208363 , 208364 , 208365 , 208366 , 208367 , 208368 , 208369 , 208370 } 	--物品：神秘寶箱 XI ~ XX
	local NM 
	for i = 1, table.getn( ChestID ) do
		if ReadRoleValue( TargetID() , EM_RoleValue_OrgID) == ChestID[ i ] then
			NM = i
		end
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_AUCTION_WAIT_NEXT]" , 0 )	--忙碌中，請稍候再試。
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )

	if BeginCastBar( OwnerID() , "[SC_KILL_CHEST]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then
		while 1 do
			sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then
				if ( CastBarStatus > 0 ) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break
				end
			end
		end
		if ( result == "OKOK" ) then
			GiveBodyItem ( OwnerID() , GiveItem[ NM ] , 1 )
			DelObj( TargetID() )
		elseif ( result == "DAME" ) then
			SetPlot( TargetID() , "touch" , "LuaS_Davis_KillChest" , 40 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end

------------------------------------------------
--清玩家函式
------------------------------------------------
function LuaS_Davis_ClearInstance( RoomID )
	local Obj
	local Count = SetSearchAllPlayer( RoomID )
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				BeginPlot(  ID , "LuaS_Davis_InstanceOut" , 0 )
			end
		end	
	end
end

------------------------------------------------
--清玩家
------------------------------------------------
function LuaS_Davis_AllClearInstance()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	While 1 do
		local Obj
		local Count = SetSearchAllPlayer(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
				Obj = Role:New( ID )
				local Class = ReadRoleValue( ID , EM_RoleValue_VOC )
				if Obj:IsPlayer() == true and Class ~= 0 then
					BeginPlot(  ID , "LuaS_Davis_InstanceOut" , 0 )
				end
			end	
		end
		Sleep(50)
	end
end

------------------------------------------------
--刪寶箱
------------------------------------------------
function LuaS_Davis_DelChest()
	local ChestID = { 
		101302 , 101303 , 101304 , 101305 , 101306 , 101307 , 101308 , 101309 , 101310 , 101311 , 	--NPC：古老寶箱 I ~ X
		109261 , 109262 , 109263 , 109264 , 109265 , 109266 , 109267 , 109268 , 109269 , 109270 , 	--NPC：古老寶箱 XI ~ XX
		101312 , 101313 , 101314 , 101315 , 101316 , 101317 , 101318 , 101319 , 101320 , 101321 , 	--NPC：神秘寶箱 I ~ X
		109271 , 109272 , 109273 , 109274 , 109275 , 109276 , 109277 , 109278 , 109279 , 109280 } 	--NPC：神秘寶箱 XI ~ XX
	Lua_DavisDelObj( ChestID );
	DelObj(OwnerID())
end

------------------------------------------------
--將玩家傳回Zone6風野之靈外
------------------------------------------------
function LuaS_Davis_InstanceOut()
	ChangeZone( OwnerID() , 6 , 0 , -23794 , -168 , 1419 , 107 )
end