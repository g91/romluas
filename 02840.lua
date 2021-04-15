function Hao_20130219_Buff()	-- 搜尋身上是否有變身效果

	local Player = OwnerID()
	local CountBuff = BuffCount( Player )	-- 讀取身上的Buff數量
	
	for Pos = 0 , CountBuff , 1 do
		local MagicID = BuffInfo( Player , Pos , EM_BuffInfoType_BuffID )	-- 讀取該Buff的ID
		local ChangeID	= GameObjInfo_Int( MagicID ,"ChangeID" )		-- 讀取該Buff的變身圖形ID
		DebugMsg( Player , 0 , "MagicID = "..ChangeID )
		if ChangeID ~= 0 then
			DebugMsg( Player , 0 , "return false" )
			break
		end
	end
end

function Hao_20130119_2_Test()

	local ObjID = OwnerID()
	local Room = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local MaxLv = ReadRoleValue( ObjID , EM_RoleValue_MaxLv )
	
	DebugMsg( 0 , Room , "MaxLv = "..MaxLv )
end

function Hao_Test_Random_PetLv(Zone)

	local Player = OwnerID()
	local PetLv = {	[1] = 0 ,
			[2] = 5 ,
			[3] = 10 ,
			[5] = 15 ,
			[10] = 20	}

	if PetLv[Zone] ~= nil then
		DebugMsg( Player , 0 , "PetLv = "..Rand(PetLv[Zone]) )
	else
		local MaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- 讀取該伺服器當前設定好的玩家最高等級
		PetEggLv = Math.random( Math.floor( MaxLv*(2/3) ) )	-- 寵物蛋等級 = (玩家最高等級*2/3)的整數
		DebugMsg( Player , 0 , "PetLv = "..Math.random( Math.floor(MaxLv*(2/3)) ) )
	end
end

function Hao_Test_Client_CountDown(Choise)

	local Player = OwnerID()
	StartClientCountDown ( Player , 10 , 0 , 0 , 0 , Choise , "[SC_1V1PVP_COUNTDOWN]" )	--玩家Client顯示倒數10秒
end

function Hao_Test_Coin_240181(Coin)

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	AddSpeicalCoin( Player , 11 , 11 , Coin )
	DebugMsg( Player , Room , "Coin = "..Coin )
	if CheckSpeicalCoin( Player , 11 , 1000 ) == true then	-- 查詢該角色的必爾汀圓貝數量是否達到 1000 個
		DebugMsg( Player , Room , "True" )
	else
		DebugMsg( Player , Room , "False" )
	end
end

function Hao_Recall_Zone_25_Npc(Clear)

	if Clear == nil then
		Clear = 0
	end

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- 取座標
	local Distance = 100			-- 每個箱子的間距
	local Npc = {}	
	local NpcList = {			-- Zone 25 野外小怪編號
				107125 ,
				107468 ,
				107469 ,
				107474 ,
				107475 ,
				107499 ,
				107500 ,
				107502 ,
				107503 ,
				107504 ,
				107505 ,
				107506 ,
				107511 ,
				107571 ,
				107127 ,
				107471 ,
				107472 ,
				107482 ,
				107501 ,
				107514 ,
				107470 ,
				107473 ,
				107483 ,
				107507 ,
				107508 ,
				107510 ,
				107512 ,
				107513 ,
				107645 ,
				107484 ,
				107563 ,
				107539 ,
				107486 ,
				107487 ,
				107488 ,
				107509 ,
				107489 ,
				107490 ,
				107491 ,
				107498 ,
				107669 ,
				107675 ,
				107572 ,
				107633 ,
				107640 ,
				107627 ,
				107672
						}

	if Clear == 0 then
		for Count = 1 , #NpcList , 1 do
			local Level = GameObjInfo_Int( NpcList[Count] , "Level" )	-- 讀取資料庫中設定的等級，不包含隨機區間部分
			Npc[Count] = Lua_CreateObjByDir( Player , NpcList[Count] , Count*Distance , 0 ) --參考物件，產生的物件id，距離 ，面向：0 的話是面向參考物件，180 的話是背向參考物件
			WriteRoleValue( Npc[Count] , EM_RoleValue_LV , Level )	-- 設定制式化的測試 Level
			SetModeEx( Npc[Count] , EM_SetModeType_Show , true )	-- 顯示
			SetModeEx( Npc[Count] , EM_SetModeType_Drag , true )		-- 水平
			SetModeEx( Npc[Count] , EM_SetModeType_Searchenemy , true )	-- 索敵
			SetModeEx( Npc[Count] , EM_SetModeType_Mark , true )		-- 標記
			SetModeEx( Npc[Count] , EM_SetModeType_Revive , true )	-- 重生
			SetModeEx( Npc[Count] , EM_SetModeType_Strikback , true )	-- 反擊
			SetModeEx( Npc[Count] , EM_SetModeType_Fight , true )		-- 砍殺
			SetModeEx( Npc[Count] , EM_SetModeType_Gravity , true )	-- 重力
			SetModeEx( Npc[Count] , EM_SetModeType_Move , true )	-- 移動
			SetModeEx( Npc[Count] , EM_SetModeType_ShowRoleHead , true )	-- 頭像框	
			AddToPartition( Npc[Count] , Room )
		end
	elseif Clear == 1 then
		local SearchNpc = SetSearchAllNPC( Room )
		for i = 1 , SearchNpc , 1 do
			local Result = GetSearchResult()
			local OrgID = ReadRoleValue( Result , EM_RoleValue_OrgID )
			for j = 1 , #NpcList , 1 do
				if OrgID == NpcList[j] then
					DelObj(Result)
					break
				end
			end
		end
	end
end

function Hao_Test_String_Eneu()

	local Player = OwnerID()
	local ChestMsg = "[SC_GOBLINARENA_43]"	-- 獲得開啟風鎔爐寶箱資格的挑戰者是：
	local PlayerName = { "Chaos" , "Snake" , "Herroyuy" }
	for i = 1 , #PlayerName , 1 do
		if i == #PlayerName then	-- 句末時不加、
			ChestMsg = ChestMsg..PlayerName[i]
		else	-- 未斷句時加入、
			ChestMsg = ChestMsg..PlayerName[i].."[SC_SEPARATEMARK]"
		end
	end
	ScriptMessage( Player , -1 , 0 , ChestMsg , C_SYSTEM )
end

function Hao_Test_AddMoney_return_Log(Choise)

	local Player =OwnerID()
	if Choise == 1 then
		AddMoneyEx_Account( Player ,  EM_ActionType_BUY_COOLSUITPAGE , 1000 , true )
	elseif Choise == 2 then
		AddMoney( Player , EM_ActionType_BUY_COOLSUITPAGE , 1000 )
	end
end

function Hao_Test_String_Newline()

	local Word = "Hello".."\n ".."World"
	Say( OwnerID() , Word )
end

function Hao_Test_Math_ceil(Number)	-- 測試無條件進位

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	for i = 1 , 40 , 1 do
		DebugMsg( OwnerID() , Room , i.." = "..math.ceil(i/10) )
	end
end

-- 做法2 以OwnerID獨特的ID自行建立阻擋線
function Hao_Test_GuildWar_Door_Block_2()

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player) -- 取得城門所在座標，測試時先以玩家代替
	local Door = CreateObj( 112064 , X , Y , Z , Dir , 1 )
	AddToPartition( Door , Room )
	local Dis = 100
	local LeftDir , RightDir	-- 左方角度、右方角度	
	local LeftCal , RightCal	-- 左方弧度、右方弧度
	
	-- 算出物件左方90度時的弧度
	LeftDir = Dir+90
	if LeftDir >= 360 then
		LeftDir = LeftDir - 360
	end
	LeftCal = (math.pi/180)*(LeftDir)	-- 左方弧度
--	DebugMsg( 0 , 0 , "LeftCal = "..LeftCal )

	-- 算出物件右方90度時的弧度
	RightDir = Dir-90
	if RightDir < 0 then
		RightDir = RightDir + 360
	end
	RightCal = (math.pi/180)*(RightDir)	-- 右方弧度
--	DebugMsg( 0 , 0 , "RightCal = "..RightCal )
	
	-- 當前面向的左方90度，向左Dis距離後的 X1 Z1 Y1 點
	local X1 = X-(Dis*math.cos(LeftCal))
	local Z1 = Z+(Dis*math.sin(LeftCal))
	local Y1 = GetHeight( X1 , Y , Z1 )	-- 取得該點的地表高度
	-- 當前面向的右方90度，向右Dis距離後的 X2 Z2 Y2 點
	local X2 = X-(Dis*math.cos(RightCal))
	local Z2 = Z+(Dis*math.sin(RightCal))
	local Y2 = GetHeight( X2 , Y , Z2 )	-- 取得該點的地表高度

	local Obj1 = CreateObj( 110987 , X1 , Y1 , Z1 , Dir , 1 )
	local Obj2 = CreateObj( 110987 , X2 , Y2 , Z2 , Dir , 1 )
	AddToPartition( Obj1 , Room )
	AddToPartition( Obj2 , Room )
	--AddLineBlock( Room , Door , X1 , Z1 , X2 , Z2 )	-- 建立城門的阻擋線
end

function Hao_Test_20130715_RandMove()

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player) -- 取得城門所在座標，測試時先以玩家代替local 
	local Chest = CreateObj( 122390 , X , Y , Z , Dir , 1 )
	AddToPartition( Chest , RoomID )
	CallPlot( Chest , "Hao_Test_20130715_RandMove_1" , Chest )
end	

function Hao_Test_20130715_RandMove_1(Chest)	-- 亂數移動

	local X , Y , Z , Dir =DW_Location( Chest )
	while true do
	--	DebugMsg( 0 , 0 , "X = "..X.." , Y = "..Y.." , Z = "..Z.." , Dir = "..Dir )
	--	Sleep(10)
	     	local X , Y , Z , Dir = DW_NewLocation( DW_Rand(360) , 5 , X , Y , Z , Dir )
	     	local Sec = Move( Chest , X , Y , Z )
		DebugMsg( 0 , 0 , "Sec = "..Sec.." , X = "..X.." , Y = "..Y.." , Z = "..Z.." , Dir = "..Dir )
	--	Sleep( Sec-10 )
 	    	Sleep( Sec+1 )
	end
end

function Hao_Test_GuildWar_Door_Block_3()

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player) -- 取得城門所在座標，測試時先以玩家代替
--	local Door = CreateObj( 112064 , X , Y , Z , Dir , 1 )
--	AddToPartition( Door , Room )
	local Dis = 100
	local LeftDir , RightDir	-- 左方角度、右方角度	
	local LeftCal , RightCal	-- 左方弧度、右方弧度
	
	-- 算出物件左方90度時的弧度
	LeftDir = Dir+90
	if LeftDir >= 360 then
		LeftDir = LeftDir - 360
	end
	LeftCal = (math.pi/180)*(LeftDir)	-- 左方弧度
	DebugMsg( 0 , 0 , "LeftDir = "..LeftDir.." , LeftCal = "..LeftCal )

	-- 算出物件右方90度時的弧度
	RightDir = Dir-90
	if RightDir < 0 then
		RightDir = RightDir + 360
	end
	RightCal = (math.pi/180)*(RightDir)	-- 右方弧度
	DebugMsg( 0 , 0 , "RightDir = "..RightDir.." , RightCal = "..RightCal )

	local BehindDir , BehindCal	-- 後方角度、後方弧度
	local BehindDis = 50
	-- 算出物件後方180度的弧度
	BehindDir = Dir + 180
	if BehindDir >= 360 then
		BehindDir = BehindDir - 360
	end
	BehindCal = (math.pi/180)*(BehindDir)	-- 後方弧度
	DebugMsg( 0 , 0 , "BehindDir = "..BehindDir.." , BehindCal = "..BehindCal )
	-- 當前面向的後方180度，向後Dis距離後的 X3 Z3 Y3 點
	local X3 = X+(BehindDis*math.cos(BehindCal))
	local Z3 = Z-(BehindDis*math.sin(BehindCal))
	local Y3 = GetHeight( X3 , Y , Z3 )	-- 取得該點的地表高度
	
	-- 當前面向的左方90度，向左Dis距離後的 X1 Z1 Y1 點
	local X1 = X3-(Dis*math.cos(LeftCal))
	local Z1 = Z3+(Dis*math.sin(LeftCal))
	local Y1 = GetHeight( X1 , Y , Z1 )	-- 取得該點的地表高度
	-- 當前面向的右方90度，向右Dis距離後的 X2 Z2 Y2 點
	local X2 = X3-(Dis*math.cos(RightCal))
	local Z2 = Z3+(Dis*math.sin(RightCal))
	local Y2 = GetHeight( X2 , Y , Z2 )	-- 取得該點的地表高度

	local Obj1 = CreateObj( 110987 , X1 , Y1 , Z1 , Dir , 1 )
	local Obj2 = CreateObj( 110987 , X2 , Y2 , Z2 , Dir , 1 )
	local Obj3 = CreateObj( 110987 , X3 , Y3 , Z3 , Dir , 1 )
	AddToPartition( Obj1 , Room )
	AddToPartition( Obj2 , Room )
	AddToPartition( Obj3 , Room )	
	Yell( Obj1 , "1" , 3 )
	Yell( Obj2 , "2" , 3 )
	Yell( Obj3 , "3" , 3 )
	--AddLineBlock( Room , Door , X1 , Z1 , X2 , Z2 )	-- 建立城門的阻擋線
end

function Hao_Test_20130717()

	local Player = OwnerID()
	local WeaponID = GetItemInfo( Player , EM_ItemPacketType_EQ , 9 , EM_ItemValueType_OrgObjID )	-- 讀取彈藥欄位的ID
	local WeaponType = GameObjInfo_Int( WeaponID ,"WeaponType" )	-- 抓取資料庫中設定好的類型，箭為14，投擲類則為16
	
	if WeaponType == 16 then
		return true
	end
	return false
end

function Test_Build_GuildWar_Tower(Dis)	-- 2013.08.12 召喚塔測試劇情

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
--	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- 取得玩家當前座標
--	local PlayerCamp = GetRoleCampID( Player )	-- 取得玩家陣營
	local PlayerCamp = 8	-- 取得玩家陣營
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- 取得Server上 Global.ini 允許的玩家最高等級
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local TowerID = 102486

	if Dis == nil or Dis == 0 then
		Lua_Hao_NPCofAll_Clear(102486)
		Lua_Hao_NPCofAll_Clear(103141)
		Lua_Hao_NPCofAll_Clear(103142)		
		return
	end

	BeginPlot( Player , "Yuyu_GWar_Leader_skill_04" , 0 )

	for Distance = 0 , Dis , 25 do
		local Tower = Lua_CreateObjByDir( Player , TowerID , Distance , 0 )
		SetModeEx( Tower , EM_SetModeType_Mark , true )	-- 標記
		SetModeEx( Tower , EM_SetModeType_HideName , true )	-- 名稱
		SetModeEx( Tower , EM_SetModeType_ShowRoleHead , true )	-- 頭像框
		SetModeEx( Tower , EM_SetModeType_Fight , true )	-- 可砍殺攻擊
		SetModeEx( Tower , EM_SetModeType_Move , false )	-- 移動
		SetModeEx( Tower , EM_SetModeType_Obstruct , false )	-- 阻擋
	
		WriteRoleValue( Tower , EM_RoleValue_LV , ServerMaxLv )	-- 將最高等級寫入至塔中
		WriteRoleValue( Tower , EM_RoleValue_Register+1 , 38 )	-- 記錄為大型建築物，避免影行者的移形幻影可直接穿牆使用
		SetRoleCampID( Tower , PlayerCamp )--寫入陣營

		-- 2013.07.31 阿浩:修正公會城戰物品 - 召喚術：汲能塔(206664)，召喚出的汲能塔(102481)無法汲取能量的問題。(調整能量的函式無法由Npc執行，所以修改為玩家執行)
		if TowerID == 102481 then
			CallPlot( Tower , "Hao_GuildWar_Crystal_Extraction_Gem" , Player )	-- 將玩家代入由汲能塔執行的劇情中。
		end
		--
		SetPlot( Tower , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	-- 觸碰劇情
		SetPlot( Tower , "dead" , "Yuyu_GWB_Tower_dead" , 0 )	-- 死亡劇情
		
		-- 以下判斷玩家是否有學習防禦工程之科技
		local SetA = -1
		local Count = BuffCount(Player)
		for i = 0 , Count , 1 do
			local BuffID = BuffInfo( Player , i , EM_BuffInfoType_BuffID ) -- 基本法術ID
			if BuffID == 505314 then	-- 玩家習得的防禦工程等級
				local BuffLv = BuffInfo( Player , i , EM_BuffInfoType_Power )	--該建築第 j 個BUFF的等級
				SetA = BuffLv
				break
			end
		end
		
		if SetA > -1 then
			AddBuff( Tower , 505511 , SetA , -1 )	-- 建築物的防禦工程等級
		end
		AddBuff( Tower , 505921 , 84 , -1 )	-- 減少被玩家傷害量85%
		AddBuff( Tower , 502707 , 0 , -1 )	-- 停止自動回HP、SP、MP
		AddToPartition( Tower , Room )
	end
end

function Hao_Test_20130830()
	
	Hao_Test_SQUARE( OwnerID() , -100 , 50 , 50 )	-- 參考物件、後方垂直距離、左方水平距離、右方水平距離
end

function Hao_Test_SQUARE( Obj , BehindDis , LeftDis , RightDis )	-- 參考物件、後方垂直距離、左方水平距離、右方水平距離

	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local Pos , Dir , Cal = {} , {} , {}	-- 座標、角度、弧度
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"]  = Lua_Hao_Return_Coordinate(Obj) -- 取得Obj所在座標

	-- 算出物件後方180度的弧度
	Dir["Behind"] = Pos["Dir"] + 180
	if Dir["Behind"] >= 360 then
		Dir["Behind"] = Dir["Behind"] - 360
	end
	Cal["Behind"] = (math.pi/180)*(Dir["Behind"])	-- 後方弧度

	-- 算出物件左方90度時的弧度
	Dir["Left"] = Pos["Dir"]+90
	if Dir["Left"] >= 360 then
		Dir["Left"] = Dir["Left"] - 360
	end
	Cal["Left"] = (math.pi/180)*(Dir["Left"])	-- 左方弧度

	-- 算出物件右方90度時的弧度
	Dir["Right"] = Pos["Dir"]-90
	if Dir["Right"] < 0 then
		Dir["Right"] = Dir["Right"] + 360
	end
	Cal["Right"] = (math.pi/180)*(Dir["Right"])	-- 右方弧度

	-- 當前面向的後方180度，向後BehindDis距離後的 X Y Z 點
	Pos["BehindX"] = Pos["X"]+(BehindDis*math.cos(Cal["Behind"]))
	Pos["BehindZ"] = Pos["Z"]-(BehindDis*math.sin(Cal["Behind"]))
	Pos["BehindY"] = GetHeight( Pos["BehindX"] , Pos["Y"] , Pos["BehindZ"] )	-- 取得該點的地表高度
	
	-- 當前面向的左方90度，向左LeftDis距離後的 X Y Z 點
	Pos["LeftX"] = Pos["BehindX"]-(LeftDis*math.cos(Cal["Left"]))
	Pos["LeftZ"] = Pos["BehindZ"]+(LeftDis*math.sin(Cal["Left"]))
	Pos["LeftY"] = GetHeight( Pos["LeftX"] , Pos["Y"] , Pos["LeftZ"] )
	
	-- 當前面向的右方90度，向右RightDis距離後的 X Y Z 點
	Pos["RightX"] = Pos["BehindX"]-(RightDis*math.cos(Cal["Right"]))
	Pos["RightZ"] = Pos["BehindZ"]+(RightDis*math.sin(Cal["Right"]))
	Pos["RightY"] = GetHeight( Pos["RightX"] , Pos["Y"] , Pos["RightZ"] )

	local Obj1 = CreateObj( 110987 , Pos["LeftX"] , Pos["LeftY"] , Pos["LeftZ"] , Pos["Dir"] , 1 )
	local Obj2 = CreateObj( 110987 , Pos["RightX"] , Pos["RightY"] , Pos["RightZ"] , Pos["Dir"] , 1 )
	local Obj3 = CreateObj( 110987 , Pos["BehindX"] , Pos["BehindY"] , Pos["BehindZ"] , Pos["Dir"] , 1 )
	AddToPartition( Obj1 , Room )
	AddToPartition( Obj2 , Room )
	AddToPartition( Obj3 , Room )
--	return Pos["LeftX"] , Pos["LeftZ"] , Pos["RightX"] , Pos["RightZ"]	
end

function Hao_Test_Zone355_DogBug()

	local Player = OwnerID()
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- 取得玩家當前座標	
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local DogID = 101701
	local Dog = CreateObj( DogID , X , Y , Z , Dir , 1 )
	SetModeEx( Dog  , EM_SetModeType_Strikback, true )--反擊
	SetModeEx( Dog  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Dog  , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( Dog  , EM_SetModeType_Mark, true )--標記
	SetModeEx( Dog  , EM_SetModeType_Move, true )--移動
	SetModeEx( Dog  , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( Dog  , EM_SetModeType_HideName, false )--名稱
	SetModeEx( Dog , EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( Dog , EM_SetModeType_Fight , true )--可砍殺攻擊
	WriteRoleValue( Dog , EM_RoleValue_IsWalk , 1) --命令該角色都用走的(0跑;1走)
	MoveToFlagEnabled( Dog , false )   	       --開／關巡邏劇情
	AddToPartition( Dog, RoomID )	--讓物件產生
	AddBuff(Dog, 624276, 0 , -1 )  -- 抵擋玩家傷害buff  確定有用
	WriteRoleValue( Dog, EM_RoleValue_Register+1, Player )  --- 將玩家寫入狗R+1
	Callplot(Dog, "mika_test_dog_skill", 0 )  -- 亡靈狗的技能	
end

function Hao_Test_Zone355_DogBug_1()

	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
--	AddBuff( OwnerID() , 505961 , 0 , 6 )
--	Sleep(1)
	PlayMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
end

function Hao_20131001()

	local Owner = OwnerID()
	local Target = TargetID()
	local List = {}

	if Owner ~= Target then
		List = { Target , Owner }
	else
		List = { Owner }
	end

	local Value = {
			{ "Lv" ,  EM_RoleValue_LV		} ,	-- 等級
			{ " Hp" , EM_RoleValue_HP		} ,	-- HP
			{ 0 , EM_RoleValue_MaxHP		} ,	-- MaxHP
			{ "Sp" ,  EM_RoleValue_SP		} ,
			{ 0 , EM_RoleValue_MaxSP		} ,
			{ "Str" ,  EM_RoleValue_FinStr		} ,
			{ " Agi" ,  EM_RoleValue_FinAgi		} ,
			{ " Sta" ,  EM_RoleValue_FinSta		} ,
			{ " Int" , EM_RoleValue_FinInt		} ,
			{ " Mnd" , EM_RoleValue_FinMnd	}
		--	{ " MaxHp" , EM_RoleValue_Fin_MaxHP	} ,	-- MaxHP 
		--	{ " Ep" ,  EM_RoleValue_EP		} ,	-- EP
		--	{ 0 , EM_RoleValue_Fin_MaxEP		} ,	-- MaxEP
		--	武器傷害
		--	護甲點數
		--	{ "Mig" ,  EM_RoleValue_Fin_Mig	} ,	-- 威能
		--	{ " Brv" ,  EM_RoleValue_Fin_Brv		} ,	-- 英勇
		--	{ " Wil" ,  EM_RoleValue_Fin_Wil		} ,	-- 意志
		--	{ " Vig" , EM_RoleValue_Fin_Vig		} ,	-- 血脈
		--	{ " Foc" ,  EM_RoleValue_Fin_Foc	}	-- 專注	
										}							

	for Count = 1 , #List , 1 do
		local String = "Name="..GetName(List[Count]).." "
	--	ScriptMessage( List[Count] , Target , 0 , GetName(List[Count]) , C_SYSTEM )	-- ROM 顯示方式
	--	ScriptMessage( List[Count] , Owner , EM_ScriptMessageSendType_Target , EM_ClientMessage_Chat , GetName(List[Count]) , 0 )	-- DP 顯示方式
	--	DebugMsg( 0 , 0 , GetName(List[Count]) )
		for Fields = 1 , #Value , 1 do
			if Fields%6 == 0 then
			--	String = String.."\n [DEBUG] "	-- DEBUG訊息用
				String = String.."\n"	-- ScriptMessage訊息用
			end
			if Type(Value[Fields][1]) == "string" then
				String = String..Value[Fields][1].."="..ReadRoleValue( List[Count] , Value[Fields][2] )..""
			else
				String = String.."/"..ReadRoleValue( List[Count] , Value[Fields][2] ).." "
			end
		end
		ScriptMessage( List[Count] , Target , 0 , String , C_SYSTEM )
	--	DebugMsg( 0 , 0 , String )
	--	Say( List[Count] , String )
	end
end

function Hao_20131021(Dis_target)	-- 遞增、遞減、等差、等比傷害公式

	local Player = OwnerID()
	local Dps = 317	-- 原始DPS
	local Dps_per = 0.25	-- Dps每次變動的%

	local Dis_total = 125	-- 總距離
	local Dis_per = 25	-- 每次變動距離
--	local Dis_target = 50	-- 目標距離

	-- 遞增
--	local Add = Dps*(1+(math.floor((Dis_total-Dis_target)/Dis_per)*Dps_per))
	local Add = Dps*(1+(math.floor(Dis_target/Dis_per)*Dps_per))
	-- 遞減
--	local Reduce = Dps*(1-(math.floor((Dis_total-Dis_target)/Dis_per)*Dps_per))
	local Reduce = Dps*(1-(math.floor(Dis_target/Dis_per)*Dps_per))
	-- 等比
	local Geometric = Dps*(1+Dps_per)^math.floor(Dis_target/Dis_per)
--	local Geometric = Dps*(1+Dps_per)^(math.floor(Dis_target/Dis_per)*Dps_per)
	--local Geometric = 1000*(1+0.1)^math.floor((100-50)/10)
	-- 等差
	local Arithmetic = Dps*(1-Dps_per)^math.floor(Dis_target/Dis_per)
--	local Arithmetic = Dps*(1-Dps_per)^(math.floor(Dis_target/Dis_per)*Dps_per)
	--local Arithmetic = 1000*(1-0.1)^math.floor((100-50)/10)
	DebugMsg( Player , 0 , "Add = "..Add )
	DebugMsg( Player , 0 , "Reduce = "..Reduce )
	DebugMsg( Player , 0 , "Geometric = "..Geometric )
	DebugMsg( Player , 0 , "Arithmetic = "..Arithmetic )
end

function Hao_20131024()

	local BlockPointTable = { 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 }	--阻擋線旗標副編號Table，對應位置如下：
	for i = 0 , #BlockPointTable-1 do
		Say( OwnerID() , i )	
	end
end

function Hao_Test_20150727_1(Var)

	SetItemInfo( OwnerID(), EM_ItemPacketType_EQ, 0, EM_ItemValueType_MaxDurable, Var*100 );
end

function Hao_Test_20150806(Select,Value)

	local Owner = OwnerID();
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID );

	if Select == 0 then
		local Lv = ReadRoleValue( Owner, EM_RoleValue_Skill_Blade );	-- 等級
		DebugMsg( Owner, RoomID, "Lv = "..Lv );
	elseif Select == 1 then
		WriteRoleValue( Owner, EM_RoleValue_Skill_Blade, Value );
		local Lv = ReadRoleValue( Owner, EM_RoleValue_Skill_Blade );	-- 等級
		DebugMsg( Owner, RoomID, "Lv = "..Lv );
	elseif Select == 2 then
		AddSkillValue( Owner, EM_SkillValueType_Blade, Value );
		local Lv = ReadRoleValue( Owner, EM_RoleValue_Skill_Blade );	-- 等級
		DebugMsg( Owner, RoomID, "Lv = "..Lv );
	end
end

function Hao_Test_20150820()

	local Owner = OwnerID();
	local Zone = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local a = 10
	local b = 10

	DebugMsg( Owner, Room, "1.Zone = "..Zone..", Room = "..Room );

	local function Test_Slayer()
		a = a + 1
		b = b + 10
		DebugMsg( Owner, Room, "Zone = "..Zone..", Room = "..Room..", a = "..a..", b = "..b );
	end	

	function Test_Slayer2()
		a = a + 100
		b = b + 1000
		DebugMsg( Owner, Room, "Zone = "..Zone..", Room = "..Room..", a = "..a..", b = "..b );
	end

	DebugMsg( Owner, Room, "Msg" );
	Test_Slayer()
	Test_Slayer2()

--	CallPlot( Owner, "" )
end

function Hao_Test_20150825()

	local Owner = OwnerID();
	local Table = { 1, 2, 3 };

	BeginPlot( Owner, "Hao_Test_20150825_2(Owner,Table)", 10 )
end

function Hao_Test_20150825_2(Owner,Table)

	local Self = OwnerID();
	Say( Self, tostring(Owner) );
	Say( Self, tostring(Table) );
end

function Hao_Test_20150826(Target)

	local Owner = OwnerID();
	local Target =Target or TargetID();

	Say( Owner, "O" );
	Say( Target, "T" );
	local OwnerPos = Vector_GetRolePos(Owner);
	local TargetPos = Vector_GetRolePos(Target);
	-- Owner 座標點向 Target 座標點看過去的角度
	local Dir = Lua_GetAngle( OwnerPos.X, OwnerPos.Z, TargetPos.X, TargetPos.Z );
	Say( Owner, "Dir = "..Dir );
end

function Hao_Test_20150831()

	local Owner = OwnerID();
	CallPlot( Owner, "Hao_Test_20150831_2", Owner );
end

function Hao_Test_20150831_2( Owner )

	local A = true;
	local B = 0;

	while A do
		Say( Owner, B );
		A = false;
		Say( Owner, B+1 );
		Sleep(1)
	end
end

function Hao_Test_20150903()

	local DragonEgg = CreateObjByFlag( 121185, 781180, 0, 1 );	 -- 龍蛋
	AddToPartition( DragonEgg, 0 );
	Hide( DragonEgg );

	BeginPlot( DragonEgg, "Hao_Test_20150903_2", 0 );
end

function Hao_Test_20150903_2()

	Sleep(50);
	Show( OwnerID(), 0 )
	SetModeEx( OwnerID(), EM_SetModeType_HideName, false );	-- 隱藏名稱
end

function Hao_Test_20150908( Owner, Target )

	local Owner = Owner or OwnerID();
	local Target = Target or TargetID();
	CallPlot( Owner, "Hao_Test_20150908_2", Owner, Target );
end

function Hao_Test_20150908_2( Owner, Target )

	local Owner = Owner or OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Target = Target or TargetID();

	local OwnerPos = Vector_GetRolePos( Owner );
	local TargetPos = Vector_GetRolePos( Target );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Distance = GetDistance( Owner, Target );	-- 距離
	local DelayTime = ( Distance / 200 )*10;
	DebugMsg( 0, 0, "DelayTime = "..Math.ceil(DelayTime)..", Distance = "..Distance );
	CastSpellPos( Owner, TargetPos.X, TargetPos.Y, TargetPos.Z, 499229, 0 );
	Sleep( DelayTime+12 );
	CallPlot( Owner, "Zone_166_Boss2_Stage1_CreateNightFire", TargetPos, Dir, Room );
end

function Hao_Test_20150910()

	local Owner = OwnerID();
	local OwnerPos = Vector_GetRolePos( Owner );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Pos = {
			{ 106968, 60, 20, 60 },
			{ 106969, 60, 20, -60 },
			{ 106970, -60, 20, 60 },
			{ 106971, -60, 20, -60 }
						};
	for i = 1, #Pos do
		local ElementObj = CreateObj( Pos[i][1], OwnerPos.X+Pos[i][2], OwnerPos.Y+Pos[i][3], OwnerPos.Z+Pos[i][4], 0, 1 ); 	-- 衝鋒透明物件
		SetModeEx( ElementObj, EM_SetModeType_Show, true );	-- 顯示
		SetModeEx( ElementObj, EM_SetModeType_Mark, false );	-- 標記
		SetModeEx( ElementObj, EM_SetModeType_Strikback, false );	-- 反擊
		SetModeEx( ElementObj, EM_SetModeType_Searchenemy, false );	-- 索敵
		SetModeEx( ElementObj, EM_SetModeType_Move, false );	-- 關閉移動
		SetModeEx( ElementObj, EM_SetModeType_Gravity, false );	-- 取消重力
		WriteRoleValue( ElementObj, EM_RoleValue_LiveTime, 20 );	-- 透明物件生存時間
		AddToPartition( ElementObj, Room );
		BeginPlot( ElementObj, "Hao_Test_20150910_2", 0 );
	end
end

function Hao_Test_20150910_2()

	Sleep(50);
	SetModeEx( OwnerID(), EM_SetModeType_Show, false );	-- 顯示
	BeginPlot( OwnerID(), "Hao_Test_20150910_3", 0 );
end

function Hao_Test_20150910_3()

	Sleep(50);
	SetModeEx( OwnerID(), EM_SetModeType_Show, true );	-- 顯示
	BeginPlot( OwnerID(), "Hao_Test_20150910_2", 0 );
end


function Hao_Test_20150911()

	CallPlot( OwnerID(), "Hao_Test_20150911_2", 0 )
end

function Hao_Test_20150911_2( Count )

	while true do
		DebugMsg( 0, 0, "Counter = "..Count );
		Sleep(1);
		Count = Count + 1;
	end
end

function Hao_Test_20140916()

	local Owner = OwnerID()
	local Pos = Vector_GetRolePos( Owner );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );

	local Obj = CreateObj( 101405, Pos.x, Pos.y, Pos.z, 0, 1 );
	MoveToFlagEnabled( Obj, false );
	SetModeEx( Obj, EM_SetModeType_Fight, true );
	SetModeEx( Obj, EM_SetModeType_Searchenemy, true );
	SetModeEx( Obj, EM_SetModeType_Strikback, true );
	WriteRoleValue( Obj, EM_RoleValue_IsWalk, 1 );
	AddToPartition( Obj, Room );
	DebugMsg( 0, 0, "R" )
end

function Hao_Patch_6_4_1_Encyclopedias()

	local Owner = OwnerID();
	CallPlot( Owner, "Hao_Patch_6_4_1_Encyclopedias_2", Owner );
end

function Hao_Patch_6_4_1_Encyclopedias_2( Owner )

	local Books = {
			243304,	--7天戰鬥教練百科I
			243305,	--7天戰鬥教練百科II
			243306,	--7天戰鬥教練百科III
			243307,	--7天戰鬥教練百科IV
			243308,	--7天戰鬥教練百科V
			243309,	--7天戰鬥教練百科VI
			243310,	--7天戰鬥教練百科VII
			243311,	--7天技能修煉百科I
			243312,	--7天技能修煉百科II
			243313,	--7天技能修煉百科III
			243314,	--7天技能修煉百科IV
			243315,	--7天技能修煉百科V
			243316,	--7天技能修煉百科VI
			243317,	--7天技能修煉百科VII
			243318,	--1天採集全圖鑑
			243319,	--1天礦產大全
			243320,	--1天進階礦產大百科
			243321,	--1天終極礦產百科全書
			243322,	--1天伐木大全
			243323,	--1天進階木材大百科
			243324,	--1天終極伐木百科全書
			243325,	--1天藥草大全
			243326,	--1天進階藥草大百科
			243327,	--1天終極藥草百科全書
			243328,	--7天採集全圖鑑
			243329,	--7天礦產大全
			243330,	--7天進階礦產大百科
			243331,	--7天終極礦產百科全書
			243332,	--7天伐木大全
			243333,	--7天進階木材大百科
			243334,	--7天終極伐木百科全書
			243335,	--7天藥草大全
			243336,	--7天進階藥草大百科
			243337,	--7天終極藥草百科全書
			243338,	--1天製造大百科
			243339,	--1天你也可以學打鐵
			243340,	--1天史密斯先生的指導
			243341,	--1天打鐵救世界
			243342,	--1天精密打鐵秘技
			243343,	--1天至高打鐵傳承
			243344,	--1天簡單學木工
			243345,	--1天木工技巧研究
			243346,	--1天深入瞭解木工
			243347,	--1天大師談木工藝術
			243348,	--1天上古木工鑽研
			243349,	--1天製甲學概要
			243350,	--1天中等製甲學
			243351,	--1天高級製甲學
			243352,	--1天讓你成為製甲大師
			243353,	--1天無雙製甲學
			243354,	--1天如何學好裁縫
			243355,	--1天貴族裁縫指導
			243356,	--1天皇家裁縫指導
			243357,	--1天頂級織品輕鬆做
			243358,	--1天首席裁縫指導
			243359,	--1天愛上烹飪的第一步
			243360,	--1天抓住愛人的胃
			243361,	--1天烹飪精髓
			243362,	--1天料理達人的私房菜
			243363,	--1天極致料理全記錄
			243364,	--1天基礎煉金學
			243365,	--1天進階煉金術
			243366,	--1天深奧煉金術
			243367,	--1天賢者的鍊金秘術
			243368,	--1天浩瀚煉金手札
			243369,	--7天製造大百科
			243370,	--7天你也可以學打鐵
			243371,	--7天史密斯先生的指導
			243372,	--7天打鐵救世界
			243373,	--7天精密打鐵秘技
			243374,	--7天至高打鐵傳承
			243375,	--7天簡單學木工
			243376,	--7天木工技巧研究
			243377,	--7天深入瞭解木工
			243378,	--7天大師談木工藝術
			243379,	--7天上古木工鑽研
			243380,	--7天製甲學概要
			243381,	--7天中等製甲學
			243382,	--7天高級製甲學
			243383,	--7天讓你成為製甲大師
			243384,	--7天無雙製甲學
			243385,	--7天如何學好裁縫
			243386,	--7天貴族裁縫指導
			243387,	--7天皇家裁縫指導
			243388,	--7天頂級織品輕鬆做
			243389,	--7天首席裁縫指導
			243390,	--7天愛上烹飪的第一步
			243391,	--7天抓住愛人的胃
			243392,	--7天烹飪精髓
			243393,	--7天料理達人的私房菜
			243394,	--7天極致料理全記錄
			243395,	--7天基礎煉金學
			243396,	--7天進階煉金術
			243397,	--7天深奧煉金術
			243398,	--7天賢者的鍊金秘術
			243399,	--7天浩瀚煉金手札
			243400,	--1天武器應用通論
			243401,	--1天空手搏鬥技巧
			243402,	--1天單手劍學習教材
			243403,	--1天匕首學習教材
			243404,	--1天權杖學習教材
			243405,	--1天單手斧學習教材
			243406,	--1天單手鎚學習教材
			243407,	--1天雙手劍學習教材
			243408,	--1天雙手杖學習教材
			243409,	--1天雙手斧學習教材
			243410,	--1天雙手鎚學習教材
			243411,	--1天長柄武器百科
			243412,	--1天弓學習教材
			243413,	--1天弩學習教材
			243414,	--1天防禦心得
			243415,	--7天武器應用通論
			243416,	--7天空手搏鬥技巧
			243417,	--7天單手劍學習教材
			243418,	--7天匕首學習教材
			243419,	--7天權杖學習教材
			243420,	--7天單手斧學習教材
			243421,	--7天單手鎚學習教材
			243422,	--7天雙手劍學習教材
			243423,	--7天雙手杖學習教材
			243424,	--7天雙手斧學習教材
			243425,	--7天雙手鎚學習教材
			243426,	--7天長柄武器百科
			243427,	--7天弓學習教材
			243428,	--7天弩學習教材
			243429	--7天防禦心得
					}

	for i = 1, #Books do
		GiveBodyItem( Owner, Books[i], 1 );
		Sleep(5);
	end
end

function Hao_Test_20150922(CreateID,Select,Sec)

	local Owner = OwnerID();
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local OwnerPos = Vector_GetRolePos( Owner );

	if CreateID < 100000 then
		CreateID = 106967;
	end

	local Boss = CreateObj( CreateID, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
	WriteRoleValue( Boss, EM_RoleValue_LiveTime, Sec );

	if Select == 999 then
		AddBuff( Boss, 500226, 0, -1 );	-- 腿部
		AddBuff( Boss, 624219, 0, -1 );	-- 頭部
	else
		local DownObj = CreateObj( 106973, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
		SetModeEx( DownObj, EM_SetModeType_move, false );
		SetModeEx( DownObj, EM_SetModeType_Mark, false );
		SetModeEx( DownObj, EM_SetModeType_ShowRoleHead, false );
		SetModeEx( DownObj, EM_SetModeType_Searchenemy, false );
		SetModeEx( DownObj, EM_SetModeType_Fight, false );
		SetModeEx( DownObj, EM_SetModeType_Strikback, false );
		WriteRoleValue( DownObj, EM_RoleValue_LiveTime, Sec );
		AddBuff( DownObj, 500226, 0, -1 );
		AddToPartition( DownObj, Room );
		AttachObj( DownObj, Boss, Select, "p_down", "p_down" );
	
		local TopObj = CreateObj( 106972, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
		SetModeEx( TopObj, EM_SetModeType_move, false );
		SetModeEx( TopObj, EM_SetModeType_Mark, false );
		SetModeEx( TopObj, EM_SetModeType_ShowRoleHead, false );
		SetModeEx( TopObj, EM_SetModeType_Searchenemy, false );
		SetModeEx( TopObj, EM_SetModeType_Fight, false );
		SetModeEx( TopObj, EM_SetModeType_Strikback, false );
		WriteRoleValue( TopObj, EM_RoleValue_LiveTime, Sec );
		AddBuff( TopObj, 624219, 0, -1 );
		AddToPartition( TopObj, Room );
		AttachObj( TopObj, Boss, Select, "p_top", "p_top" );
	end
	AddToPartition( Boss, Room );
	DebugMsg( 0, 0, "Running" )
end

function Hao_Test_20150922_2(Select,Sec)

	local Owner = OwnerID();
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local OwnerPos = Vector_GetRolePos( Owner );
	local Boss = CreateObj( 106967, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
	WriteRoleValue( Boss, EM_RoleValue_LiveTime, Sec );
	AddToPartition( Boss, Room );

	local Obj = CreateObj( 107854, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
	SetModeEx( Obj, EM_SetModeType_Mark, false );
	SetModeEx( Obj, EM_SetModeType_ShowRoleHead, false );
	SetModeEx( Obj, EM_SetModeType_Searchenemy, false );
	SetModeEx( Obj, EM_SetModeType_Fight, false );
	SetModeEx( Obj, EM_SetModeType_Strikback, false );
	WriteRoleValue( Obj, EM_RoleValue_LiveTime, Sec );
	AddBuff( Obj, 500226, 0, -1 );
	AddToPartition( Obj, Room );
	CallPlot( Obj, "Hao_FollowBoss", Obj, Boss );
--	AttachObj( Obj, Boss, Select, "p_down", "p_down" );
end

function Hao_FollowBoss( Obj, Boss )

	while true do
		local BossPos = Vector_GetRolePos(Boss);
		MoveDirect( Obj, BossPos.x, BossPos.y, BossPos.z );
		Sleep(1);
	end
end

function Hao_Test_20150923()

	local Owner = OwnerID();
	local OwnerPos = Vector_GetRolePos( Owner );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local VecDir = Vector_DirToVector( Dir+90 );
	local TargetPos = OwnerPos + VecDir * 50;
	local TargetDir = Dir - 180;

	if TargetDir > 360 then
		TargetDir = TargetDir - 360;
	elseif TargetDir < 0 then
		TargetDir = TargetDir + 360;
	end

	DebugMsg( 0, 0, "Pos = "..tostring(OwnerPos)..", Dir = "..Dir..", TargetDir = "..TargetDir );
	local Npc = CreateObj( 106956, TargetPos.x, TargetPos.y, TargetPos.z, TargetDir, 1 );
	AddToPartition( Npc, 0 );
end

function Hao_Test_20150924()

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Distance = 120;	-- 法術集合中的有效範圍 = 有效長度
	local Width = 20;	-- 有效寬度
	local Height = 60;	-- 有效高度
	local FlySpeed = 6;	-- 技能速度(單位:0.1秒)，需與有效長度整除
	local FlyTime = Math.Ceil( Distance / FlySpeed );	-- 技能由起點飛行至終點的時間(單位:0.1秒)

	local OwnerPos = Vector_GetRolePos( Owner );
	local Obj = CreateObj( 107071, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
	SetModeEx( Obj, EM_SetModeType_Show, false );	-- 顯示
	SetModeEx( Obj, EM_SetModeType_Mark, false );	-- 標記
	SetModeEx( Obj, EM_SetModeType_Strikback, false );	-- 反擊
	SetModeEx( Obj, EM_SetModeType_Searchenemy, false );	-- 索敵
	SetModeEx( Obj, EM_SetModeType_Move, false );	-- 關閉移動
	WriteRoleValue( Obj, EM_RoleValue_LiveTime, 30 );	-- 透明物件生存時間
	AddToPartition( Obj, Room );
--	SysCastSpellLv( Owner, Obj, 851915, 0 );
	CallPlot( Obj, "Hao_Test_20150924_2", Obj, Dir, Width, Height, Distance, FlySpeed, FlyTime );
end

function Hao_Test_20150924_2( Owner, Dir, Width, Height, Distance, FlySpeed, FlyTime )

	local OwnerPos = Vector_GetRolePos( Owner );
	local BeginPos = OwnerPos;
	local VecDir = Vector_DirToVector(Dir+90);	-- 角度轉向量
	local EndPos
	DebugMsg( 0, 0, "Dir = "..tostring(Dir)..", VecDir = "..tostring(VecDir)..", FlyTime = "..FlyTime );

	while FlyTime > -1 do
		local TargetList = SetSearchRangeInfo( Owner, 150 );
		EndPos = OwnerPos + VecDir * FlySpeed;
		DebugMsg( 0, 0, "FlyTime = "..FlyTime );
	--	DebugMsg( 0, 0, "OwnerPos = "..tostring(OwnerPos) );
	--	DebugMsg( 0, 0, "EndPos = "..tostring(EndPos) );
	--	DebugMsg( 0, 0, "Distance = "..(OwnerPos-EndPos):Len() );
		for i = 1, TargetList do
			local Target = GetSearchResult();
			local TargetPos = Vector_GetRolePos( Target );
			--檢查目標是否在指定長、寬的直線範圍內，否回傳Nil、是的話回傳目標與起點的距離 ( 起點座標、終點座標、寬度、高度、目標座標)
			local Status = Vector_CheckShootObj( OwnerPos, EndPos, Width, Height, TargetPos );
		--	DebugMsg( 0, 0, "No. "..i.. ", Hit = "..tostring( Status ) );
			if Status then
				Say( Target, "Hit = "..tostring( Status )..", Begin:Target Distance = "..(BeginPos-TargetPos):Len() );
			--	SysCastSpellLv( Master, Player, g_IcePierceAttackMagicID, 0 );	-- 傷害
			end
		end
		OwnerPos = EndPos;
		FlyTime = FlyTime - 1;
		Sleep(1)
	end
end

function Hao_241910_UseItem_CheckUse( UseType, Pos )

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	DebugMsg( Owner, Room, "CheckUse, UseType = "..tostring(UseType)..", Pos = "..tostring(Pos) );
end

function Hao_241910_UseItem_ItemUseOK( UseType, Pos )

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	DebugMsg( Owner, Room, "UseOK, UseType = "..tostring(UseType)..", Pos = "..tostring(Pos) );
end