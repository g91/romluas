--lua進階題目1：在玩家前方每50距離建立1個箱子共10個箱子，在箱子上面坐10個不一樣的npc，每次執行上面的npc隨機分配
function YoYo_LuaHomework2()
	local Player = OwnerID()
	local BoxID = 110987
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local PlayerX , PlayerY , PlayerZ , PlayerDir = DW_Location(Player) --取出自己目前的座標與面向
	local BoxNumber = 10
	local BoxRange = 50
	
	local BoxTable = {}
	for Count = 1 , BoxNumber do --將BoxTable的第1~10個位置宣告成Table
		BoxTable[Count] = {}
	end
	--BoxTable [X] [1] = GUID
	--BoxTable [X] [2] = X座標
	--BoxTable [X] [3] = Y座標
	--BoxTable [X] [4] = Z座標
	--BoxTable [X] [5] = 方向
	
	local NpcTable = {
	114719 , --湯尼
	114770 , --葬儀社助手
	114776 , --艾瑞娜．凱因斯
	114383 , --皇家傳送師
	114780 , --巴克斯．傑諾瑞
	114869 , --西蒙．提巴克
	114928 , --約翰．霍夫曼
	114952 , --達拉尼斯引導員
	118472 , --卡布歐．甘迺迪
	114722 , --晨星
	}
	--從NpcTable亂數抽出一個值丟到最後面，作100次
	for Count = 1 , 100 do
		local RandNum = DW_Rand(10) --隨機十選一
		local MoveNum = table.remove( NpcTable , RandNum )
		table.insert( NpcTable , MoveNum )
	end
	
	BoxTable[1][1] = Lua_CreateObjByDir( Player , BoxID , BoxRange , PlayerDir ) --創造第一個箱子
	SetModeEx( BoxTable[1][1] , EM_SetModeType_Gravity , false) --無重力
	SetModeEx( BoxTable[1][1] , EM_SetModeType_Move , false) --不可移動
	SetModeEx( BoxTable[1][1] , EM_SetModeType_Obstruct , true) --有阻擋效果
	AdjustFaceDir( BoxTable[1][1] , Player , 180 ) --設定箱子背對自己
	AddtoPartition( BoxTable[1][1] , RoomID )
	BoxTable[1][2] , BoxTable[1][3] , BoxTable[1][4] , BoxTable[1][5] = DW_Location(BoxTable[1][1]) --取得箱子的位置與面向
	
	local NpcTemporary = {} --Npc GUID的暫存空間
	NpcTemporary[1] = CreateObj( NpcTable[1] , BoxTable[1][2] , BoxTable[1][3] + 50 , BoxTable[1][4] , BoxTable[1][5] , 1 ) --創造NPC在箱子正上方50的地方
	SetDefIdleMotion ( NpcTemporary[1] , ruFUSION_MIME_SIT_CHAIR_LOOP) --改以坐下動作替代idle
	AddtoPartition( NpcTemporary[1] , RoomID )
	
	for Count = 2 , BoxNumber do
		BoxTable[Count][1] = Lua_CreateObjByDir( BoxTable[Count - 1][1] , BoxID , BoxRange , BoxTable[Count - 1][5] )
		SetModeEx( BoxTable[Count][1] , EM_SetModeType_Gravity , false) --無重力
		SetModeEx( BoxTable[Count][1],EM_SetModeType_Move , false) --不可移動
		SetModeEx( BoxTable[Count][1] , EM_SetModeType_Obstruct , true) --有阻擋效果
		AdjustFaceDir( BoxTable[Count][1] , Player , 180 ) --設定箱子背對自己
		AddtoPartition( BoxTable[Count][1] , RoomID )
		BoxTable[Count][2] , BoxTable[Count][3] , BoxTable[Count][4] , BoxTable[Count][5] = DW_Location(BoxTable[Count][1]) --取得箱子的位置與面向
		
		NpcTemporary[Count] = CreateObj( NpcTable[Count] , BoxTable[Count][2] , BoxTable[Count][3] + 30 , BoxTable[Count][4] , BoxTable[Count][5] , 1 ) --創造NPC在箱子上方
		SetDefIdleMotion (NpcTemporary[Count] , ruFUSION_MIME_SIT_CHAIR_LOOP) --改以坐下動作替代idle
		AddtoPartition( NpcTemporary[Count] , RoomID )
	end
	
	--在箱子的左右產生題目2要用的旗標
	local FlagObjID1 = 102331 --兔子旗標，去程行走路徑用
	local FlagObjID2 = 100186 --貓咪旗標，回程行走路徑用
	local FlagObjID3 = 100143 --小狗旗標，回中繼點用
	local FlagRange = 20 --旗子與箱子的距離
	local FlagAngle --箱子旋轉的角度
	local Flag1Table = {}
	local Flag2Table = {}
	local FlagObj3 = Lua_CreateObjByDir( BoxTable[BoxNumber][1] , FlagObjID3 , 30 , BoxTable[BoxNumber][5] ) --創造小狗旗標在最後一個箱子的後方
	AddtoPartition( FlagObj3 , RoomID )
	for Count = 1 , BoxNumber do --設定箱子面向旋轉90度，單數轉正，雙數轉負
		if Count % 2 == 0 then	FlagAngle = -90
		else	FlagAngle = 90
		end
		AdjustFaceDir( BoxTable[Count][1] , Player , FlagAngle) --箱子，向左向右轉！
		Flag1Table[Count] = Lua_CreateObjByDir( BoxTable[Count][1] , FlagObjID1 , FlagRange , BoxTable[Count][5] ) --產生兔子旗標於箱子的正前方
		AddtoPartition( Flag1Table[Count] , RoomID )
		
		AdjustFaceDir( BoxTable[Count][1] , Player , FlagAngle * -1 ) --箱子，向後轉！
		Flag2Table[Count] = Lua_CreateObjByDir( BoxTable[Count][1] , FlagObjID2 , FlagRange , BoxTable[Count][5] ) --產生貓咪旗標於箱子的正前方
		AddtoPartition( Flag2Table[Count] , RoomID )
	end	
end

function YoYo_LuaHomework2_DelBox() --刪除上面Box與NPC用的
	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local NpcTable = {
	110987 , --箱子
	
	114719 , --湯尼
	114770 , --葬儀社助手
	114776 , --艾瑞娜．凱因斯
	114383 , --皇家傳送師
	114780 , --巴克斯．傑諾瑞
	114869 , --西蒙．提巴克
	114928 , --約翰．霍夫曼
	114952 , --達拉尼斯引導員
	118472 , --卡布歐．甘迺迪
	114722 , --晨星
	
	102331 , --兔子旗標
	100186 , --貓咪旗標
	100143 --小狗旗標
	}
	
	local SearchTable = SearchRangeNPC( Player , 2000 ) --距離以內符合條件的都清掉
	for Count = 1 , #SearchTable do
		for Count2 = 1 , #NpcTable do
			if ReadRoleValue( SearchTable[Count] , EM_RoleValue_OrgID ) == NpcTable[Count2] then
				DelObj( SearchTable[Count] )
			end
		end
	end
end

--lua進階題目2：在玩家的位子建立一個npc，沿著箱子的間隔處，蛇形往前走到最後一個箱子，在走回來。
--進階題目2撰寫人：FN、阿元、小宏、阿浩、阿準
function YoYo_LuaHomework2_Plus()
	local Player = OwnerID()
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local PlayerX , PlayerY , PlayerZ , PlayerDir = DW_Location(Player) --取出自己目前的座標與面向
	local NpcID = 121597
	WalkNpc = CreateObj( NpcID , PlayerX , PlayerY , PlayerZ , PlayerDir , 1 ) --創造NPC在自身的位置
	SetModeEx( WalkNpc, EM_SetModeType_Fight, false ) --不可攻擊
	SetModeEx( WalkNpc, EM_SetModeType_Searchenemy, false ) --不會索敵
	SetModeEx( WalkNpc, EM_SetModeType_Strikback , false ) --不會反擊
	SetModeEx( WalkNpc, EM_SetModeType_Mark , true ) --可點選
	SetModeEx( WalkNpc, EM_SetModeType_NotShowHPMP, true ) --不顯示血條
	AddtoPartition( WalkNpc , RoomID )
	
	local FlagObjID1 = 102331 --兔子旗標，去程行走路徑用
	local FlagObjID2 = 100186 --貓咪旗標，回程行走路徑用
	local FlagObjID3 = 100143 --小狗旗標，回中繼點用
	local FlagTable1 = {} --去程路徑旗標清單
	local FlagTable2 = {} --回程路徑旗標清單
	local FlagObj3 --中繼點
	local DisTable1 = {} --距離清單
	local DisTable2 = {} --距離清單
	
	local SearchTable = SearchRangeNPC( Player , 1600 )
	local FlagCount1 = 1
	local FlagCount2 = 1
	for Count = 0 , #SearchTable do --抓出所有的旗標NPC
		if ReadRoleValue( SearchTable[Count] , EM_RoleValue_OrgID ) == FlagObjID1 then
			FlagTable1[FlagCount1] = SearchTable[Count]
			--DebugMsg( 0 , 0 , "Flag1 - " .. FlagCount1 .. " = " .. FlagTable1[FlagCount1] )
			FlagCount1 = FlagCount1 + 1
		elseif ReadRoleValue( SearchTable[Count] , EM_RoleValue_OrgID ) == FlagObjID2 then
			FlagTable2[FlagCount2] = SearchTable[Count]
			--DebugMsg( 0 , 0 , "Flag2 - " .. FlagCount2 .. " = " .. FlagTable2[FlagCount2] )
			FlagCount2 = FlagCount2 + 1
		elseif ReadRoleValue( SearchTable[Count] , EM_RoleValue_OrgID ) == FlagObjID3 then
			FlagObj3 = SearchTable[Count]
			--DebugMsg( 0 , 0 , "Flag3 = " .. FlagObj3 )
		end
	end

	for Count = 1 , #FlagTable1 do
		DisTable1[Count] = GetDistance( Player , FlagTable1[Count] ) --取出所有旗標的座標與面向
	end
	for Count = 1 , #FlagTable2 do
		DisTable2[Count] = GetDistance( Player , FlagTable2[Count] ) --取出所有旗標的座標與面向
	end
	
	local SortFlagTable1 , SortDisTable1 = LUA_YOYO_Sequence( FlagTable1 , DisTable1 , 0 ) --依距離遞增排序
	local SortFlagTable2 , SortDisTable2 = LUA_YOYO_Sequence( FlagTable2 , DisTable2 , 1 ) --依距離遞減排序

	for Count = 1 , #SortFlagTable1 do --去程
		local X , Y , Z , Dir = DW_Location(SortFlagTable1[Count]) --取出所有旗標的座標與面向
		while CheckDistance( WalkNpc , SortFlagTable1[Count] , 1 ) == false do --與旗標的距離>1就往旗標走
			Sleep(10)
			MoveDirect( WalkNpc , X , Y , Z )
		end
	end

	local MiddleX , MiddleY , MiddleZ , Dir = DW_Location(FlagObj3) --取出中繼旗標的座標與面向
	while CheckDistance( WalkNpc , FlagObj3 , 1 ) == false do --與旗標的距離>1就往中繼旗標走
		Sleep(10)
		MoveDirect( WalkNpc , MiddleX , MiddleY , MiddleZ )
	end
	
	for Count = 1 , #SortFlagTable2 do --回程
		local X , Y , Z , Dir = DW_Location(SortFlagTable2[Count]) --取出所有旗標的座標與面向
		while CheckDistance( WalkNpc , SortFlagTable2[Count] , 1 ) == false do --與旗標的距離>1就往旗標走
			Sleep(10)
			MoveDirect( WalkNpc , X , Y , Z )
		end
	end
	
	DelObj(WalkNpc) --Npc跑完自刪
end