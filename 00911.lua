--以下為zone6風靈之野副本外的劇情
-----------------------------------------------------------------------------------
--傳送柱計時器
-----------------------------------------------------------------------------------
function LuaS_Davis_Clock_out()
	Davis_DiffHour = 0	--宣告全域變數
	Davis_DiffMin = 0
	local Step = "false"
	local Array = {}
	local MonsterID = 100449	--產生怪物ID
	local Flag = 780196		--旗子編號
	local HowMuch = 10	--產生數量
	local Evil = 0
	local Train = 0
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	local StartTime1 = GetDBKeyValue( "TempestHeightTime_01" )	-- 取得 LogView 中  Special Event 指定的風野之靈開啟時間1
	local StartTime2 = GetDBKeyValue( "TempestHeightTime_02" )	-- 取得 LogView 中  Special Event 指定的風野之靈開啟時間2

	while true do
		local Hour , Minute = Davis_GetSysTime()	--取得當前時間（包含使用測試指令修改後時間）
		if ( Hour == StartTime1 or Hour == StartTime2 ) and ( Minute >= 0 ) then
			if ( Step == "false" ) then
				--出怪物
				Hide( OwnerID() )
				Evil = LuaFunc_CreateObjByObj ( 111390 , OwnerID() )
				for i = 0 , HowMuch do
					local Monster = CreateObjByFlag( MonsterID, Flag , i , 1 )
					AddToPartition( Monster ,  0 )
					SetRandMove( Monster , 30 ,  20 , 30 )
					Array[ i ] = Monster
				end
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 ,  GetString("SC_WIND_EVIL") ) --黑曜石要塞後門外的風野傳送陣被邪惡的力量汙染了，聚集了一群[100449]。
				end
				Step = "One"	--圖騰柱被汙染階段
				
			elseif ( Step == "One" ) then
				if LuaS_Davis_CheckAlive( Array ) == true then	Step = "Two"	--傳送階段
				end
				
			elseif ( Step == "Two" ) then
				--打開傳送陣
				Hide( Evil )
				DelObj( Evil )
				Train = LuaFunc_CreateObjByObj ( 111391 , OwnerID() )
				SetPlot( Train , "range" , "Lua_Davis_DiffTrin_Open" , 50 )	--設定傳送劇情
				if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
					RunningMsg( OwnerID() , 2 ,  GetString("SC_WIND_CLEAR") ) --風野傳送陣旁邊的邪惡力量清除完畢，風野傳送陣周邊出現了未知的空間力場。
				end
				Step = "Three"
			end
		elseif ( Hour ~= StartTime1 ) and ( Hour ~= StartTime2 ) and Step ~= "false" then
			for i = 0 , table.getn( Array ) do
				delobj( Array[ i ] )
			end
			DelObj( Evil )
			DelObj( Train )
			Step = "false"
			--圖騰柱恢復原樣
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsg( OwnerID() , 2 ,  GetString( "SC_WIND_NOMAL" ) ) --風野傳送陣周邊的的空間力場漸漸削弱，恢復了原本的樣子。
			end
			Show( OwnerID() , 0 )
		end
		Sleep( 100 )
	end
end

------------------------------------------------
--取得當前時間（包含使用測試指令修改後時間）
------------------------------------------------
function Davis_GetSysTime()
	local Hour = GetSystime( 1 )
	local Minute = GetSystime( 2 )
	
	if 	Davis_DiffHour ~= nil then	Hour = Hour + Davis_DiffHour
		if Hour >23 then	Hour = Hour - 24
		end
	end
	
	if 	Davis_DiffMin ~= nil then	Minute = Minute + Davis_DiffMin
		if Minute > 59 then	Minute = Minute - 60
		end
	end
	
	return Hour , Minute
end

-----------------------------------------------------------------------------------
--檢查怪物清除狀況
-----------------------------------------------------------------------------------
function LuaS_Davis_CheckAlive( Array )
	while true do
		local Survivor = 0	--宣告生存者變數
		
		--檢查剩幾隻怪物
		for i = 0 , table.getn( Array ) do
			if 	CheckID( Array[ i ] ) and
				ReadRoleValue( Array[ i ] , EM_RoleValue_IsDead ) == 0 then
				Survivor = Survivor + 1
			end
		end
		
		--怪物是不是掛光了？
		if Survivor == 0 then	break
		end
		
		Sleep( 10 )
	end
	return true
end

-----------------------------------------------------------------------------------
--傳送劇情
-----------------------------------------------------------------------------------
function Lua_Davis_DiffTrin_Open()
	if CastSpell( OwnerID(),OwnerID(),491916) then
		if ChangeZone( OwnerID() , 302 , 0 , 1261 , 685 , 1223 , 268 ) == true then
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	--取得玩家等級
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )	--取得玩家副職等級
			DesignLog( OwnerID() , 302 , "last enter Player Lv is " .. PlayerLV .. " and SubLv is " .. PlayerSUBLV )	--紀錄進入人次
		end
	end
end