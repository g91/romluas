----計時器
--function LuaS_Davis_Clock_Xmas()
--	Davis_XmasHour = 0--宣告全域變數!!!!
--	Davis_XmasMin = 0
--	local Step = 0
--	local hour = 0
--	local min = 0
--	local Array = {}
--	local BronID = 100292	--產生怪物ID
--	local Flag = 780224		--旗子編號
--	local Monster = 0
------------------------------------------------
--	while true do
----------------------------------------------時間處理
--		hour = GetSystime(1)
--		min = GetSystime(2)
--
--		if 	Davis_XmasHour ~= nil and
--			Davis_XmasMin ~= nil then
--
--			if 	Davis_XmasHour == 0 and
--				Davis_XmasMin == 0 then
--			else
--				hour = GetSystime(1) + Davis_XmasHour
--				min = GetSystime(2) + Davis_XmasMin
--
--				if hour >23 then
--					hour = hour - 24
--				end
--
--				if min > 59 then
--					min = min - 60
--				end
--			end
--		end
--		--Say(OwnerID(), "hour = "..hour.."min = "..min )
--		--Say(OwnerID(), Step )
--		if Step ~= hour then
--			if CheckID(Monster) == true then
--				DelObj(Monster)
--			end
--			local XXXX = rand(3)
--			local YYYY = rand(3)
--			local ZZZZ= rand(4)
--			local XYZ = XXXX + YYYY + ZZZZ
--			--Say(OwnerID(), XYZ )
--			if XYZ >3 then
--				Monster = CreateObjByFlag( BronID, Flag , rand((GetMoveFlagCount(Flag)-1)) , 1 )
--				SetModeEx( Monster    , EM_SetModeType_Fight , false )--可砍殺攻擊
--				SetModeEx( Monster    , EM_SetModeType_Strikback, false )--反擊
--				SetModeEx( Monster    , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
--				SetModeEx( Monster    , EM_SetModeType_Obstruct, false )--阻擋
--				SetModeEx( Monster    , EM_SetModeType_Gravity, false )--重力
--				SetModeEx( Monster    , EM_SetModeType_Move, false )--移動
--				SetModeEx( Monster   , EM_SetModeType_ShowRoleHead, false )--頭像框
--				SetModeEx( Monster    , EM_SetModeType_Searchenemy, false )--索敵
--				SetModeEx( Monster   , EM_SetModeType_Show , false ) --不顯示
--				AddToPartition( Monster ,  0 )
--				BeginPlot(Monster , "LuaN_Xmas_SnowManBron",0)
--			end
--			Step = hour
--		end
--		sleep(100)
--	end
--end
--
----? runplot Refer_Davis_DiffTime 查詢目前前進了多久的時間
----function Refer_Davis_XmasTime()
--	--Say(OwnerID(), Davis_XmasHour )
--	--Say(OwnerID(), Davis_XmasMin )
----end
--
----? runplot Reset_Davis_DiffTime 將前進的時間歸零
--function Reset_Davis_XmasTime()
--	Davis_XmasHour = 0
--	Davis_XmasMin = 0
--end
--
----? pcall Set_Davis_XmasHour(hour) 「 ( ) 」 內的hour 代表你想要前進的小時數量  範圍只能是0~23 亂設的人後果自負...
--function Set_Davis_XmasHour(hour)
--	if hour >= 48 then
--	else
--		if hour >= 24 then
--		Davis_XmasHour = hour - 24
--		else
--		Davis_XmasHour = hour
--		end
--	end
--end
--
----? pcall Set_Davis_XmasMin(min) 「 ( ) 」 內的min 代表你想要前進的分鐘數量  範圍只能是0~59 亂設的人後果自負...
--function Set_Davis_XmasMin(min)
--	if min >= 120 then
--	else
--		if min >= 60 then
--		Davis_XmasMin = min - 60
--		else
--		Davis_XmasMin = min
--		end
--	end
--end
--
----生雪人劇情
--function LuaN_Xmas_SnowManBron()
--	local Obj = Role:new( OwnerID() )
--	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
--	if ZoneID == 1 then
--	RunningMsg( OwnerID() , 2 , "[SC_SNOWMANZONE1]" ) --一群雪人出現在嚎叫山麓的某處
--	elseif ZoneID == 2 then
--	RunningMsg( OwnerID() , 2 , "[SC_SNOWMANZONE2]" ) --一群雪人出現在銀湧之野的某處
--	elseif ZoneID == 4 then
--	RunningMsg( OwnerID() , 2 , "[SC_SNOWMANZONE4]" ) --一群雪人出現在艾索蘭斜谷的某處
--	elseif ZoneID == 5 then
--	RunningMsg( OwnerID() , 2 , "[SC_SNOWMANZONE5]" ) --一群雪人出現在海波拉高原的某處
--	elseif ZoneID == 6 then
--	RunningMsg( OwnerID() , 2 , "[SC_SNOWMANZONE6]" ) --一群雪人出現在塵荒峽谷的某處
--	end
--	local dis = 100	--雪人圍成的半徑
--	local BaseX = Obj :X()
--	local BaseY = Obj :Y()
--	local BaseZ = Obj :Z()
--	local BaseDir = Obj:Dir()
--	local MonsterGroup = {}
--	MonsterGroup[0] =CreateObj( 101448, BaseX,BaseY,BaseZ,BaseDir, 1 )
--	MonsterGroup[1] =CreateObj( 101447, BaseX+dis*math.cos(math.pi/8),BaseY,BaseZ+dis*math.sin(math.pi/8),BaseDir, 1 )
--	MonsterGroup[2] =CreateObj( 101447, BaseX+dis*math.cos(math.pi/8),BaseY,BaseZ-dis*math.sin(math.pi/8),BaseDir, 1 )
--	MonsterGroup[3] =CreateObj( 101447, BaseX-dis*math.cos(math.pi/8),BaseY,BaseZ+dis*math.sin(math.pi/8),BaseDir, 1 )
--	MonsterGroup[4] =CreateObj( 101447, BaseX-dis*math.cos(math.pi/8),BaseY,BaseZ-dis*math.sin(math.pi/8),BaseDir, 1 )
--	MonsterGroup[5] =CreateObj( 101447, BaseX+dis*math.cos(math.pi/4),BaseY,BaseZ+dis*math.sin(math.pi/4),BaseDir, 1 )
--	MonsterGroup[6] =CreateObj( 101447, BaseX+dis*math.cos(math.pi/4),BaseY,BaseZ-dis*math.sin(math.pi/4),BaseDir, 1 )
--	MonsterGroup[7] =CreateObj( 101447, BaseX-dis*math.cos(math.pi/4),BaseY,BaseZ+dis*math.sin(math.pi/4),BaseDir, 1 )
--	MonsterGroup[8] =CreateObj( 101447, BaseX-dis*math.cos(math.pi/4),BaseY,BaseZ-dis*math.sin(math.pi/4),BaseDir, 1 )
--	MonsterGroup[9] =CreateObj( 101447, BaseX+dis*math.cos(math.pi*3/8),BaseY,BaseZ+dis*math.sin(math.pi*3/8),BaseDir, 1 )
--	MonsterGroup[10] =CreateObj( 101447, BaseX+dis*math.cos(math.pi*3/8),BaseY,BaseZ-dis*math.sin(math.pi*3/8),BaseDir, 1 )
--	MonsterGroup[11] =CreateObj( 101447, BaseX-dis*math.cos(math.pi*3/8),BaseY,BaseZ+dis*math.sin(math.pi*3/8),BaseDir, 1 )
--	MonsterGroup[12] =CreateObj( 101447, BaseX-dis*math.cos(math.pi*3/8),BaseY,BaseZ-dis*math.sin(math.pi*3/8),BaseDir, 1 )
--	MonsterGroup[13] =CreateObj( 101447, BaseX+dis,BaseY,BaseZ,BaseDir, 1 )
--	MonsterGroup[14] =CreateObj( 101447, BaseX,BaseY,BaseZ-dis,BaseDir, 1 )
--	MonsterGroup[15] =CreateObj( 101447, BaseX-dis,BaseY,BaseZ,BaseDir, 1 )
--	MonsterGroup[16] =CreateObj( 101447, BaseX,BaseY,BaseZ+dis,BaseDir, 1 )
--	for i = 0, table.getn(MonsterGroup) do
--		AddToPartition(MonsterGroup[i],0)
--		SetRandMove( MonsterGroup[i] , 30 ,  20 , 30 )
--	end
--	Sleep(18000)
--	for i = 0, table.getn(MonsterGroup) do
--		DelObj( MonsterGroup[i])
--	end
--	if ZoneID == 1 then
--	RunningMsg( OwnerID() , 2 , "[SC_SNOWMANLEAVE1]" ) --在嚎叫山麓的某處的雪人們悄悄的離開了
--	elseif ZoneID == 2 then
--	RunningMsg( OwnerID() , 2 , "[SC_SNOWMANLEAVE2]" ) --在銀湧之野的某處的雪人們悄悄的離開了
--	elseif ZoneID == 4 then
--	RunningMsg( OwnerID() , 2 , "[SC_SNOWMANLEAVE4]" ) --在艾索蘭斜谷的某處的雪人們悄悄的離開了
--	elseif ZoneID == 5 then
--	RunningMsg( OwnerID() , 2 , "[SC_SNOWMANLEAVE5]" ) --在海波拉高原的某處的雪人們悄悄的離開了
--	elseif ZoneID == 6 then
--	RunningMsg( OwnerID() , 2 , "[SC_SNOWMANLEAVE6]" ) --在塵荒峽谷的某處的雪人們悄悄的離開了
--	end
--	DelObj( OwnerID())
--end