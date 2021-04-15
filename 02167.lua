function cl_762_19105AI() -------->娜塔莎控制器  Register1 Register2 Register3 Register4 Register5 780767
    local AI = OwnerID() ------->命名控制器叫做AI
    local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local go = 0   ---血球老闆的變數
	local open = 0 ---生門的變數
	local door2	---宣告一個前門
	local door3 ---前前門
	local b_door
	local b_door2
	local carzy_time = 0
	local bt ---宣告血球的控制器
	local a = 0 --104975確認該NPC是否還存活著
	---local lock = 0 ---檢查BOSS是否有偷偷跑出去
	local lock2 = {}
	local IDnpc
	local ID
	local ID2
	local ch_door = 0
	local a105114 = 0
	local kide_time = 0
	local ch_door_flag = 0
	local boss = CreateObjByFlag( 104984 , 780816 , 1 , 1 )   -------用控制器將王生在這個旗標的位置
	SetModeEx( boss , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( boss , EM_SetModeType_Move, false) ---移動	(否)
	AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作喔
	WriteRoleValue ( boss , EM_RoleValue_PID, AI )  -----在王的PID身上寫入這個值,告訴王誰是控制器
	BeginPlot( boss,"cl_19105boss", 10 ) ---------王的戰鬥
	WriteRoleValue ( AI , EM_RoleValue_Register1, boss ) ---傳遞值給所有人告訴她BOSS是誰~統一記錄在中控器的Register1讓所有物件去讀取
	local door1 = CreateObjByFlag( 105117 , 780820 , 7 , 1 )  ----後門
	SetModeEx ( door1 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
	SetModeEx( door1 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( door1 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( door1 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( door1 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( door1 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( door1 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition( door1 , RoomID ) ----使物件出現在場景上
	while 1 do  ----從這裡開始跑回圈
		sleep ( 10 )
		local p = ReadRoleValue( AI , EM_RoleValue_Register2 ) ---p=控制器每一秒讀取Register2內的值
		if p == 1 then -----王進入戰鬥後回傳1這個值來
			carzy_time = carzy_time + 1
			if carzy_time >= 480 then
				Addbuff (  boss , 508659 , 0 , -1 )
			end
			if open == 0 then  ---如果進入戰鬥後讀取到open等於0就會產生前門將玩家關起來
				door2 = CreateObjByFlag( 105117 , 780820 , 6 , 1 )  ----前門
				SetModeEx ( door2 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				SetModeEx( door2 , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( door2 , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( door2 , EM_SetModeType_Searchenemy, false)--索敵(否)
				SetModeEx( door2 , EM_SetModeType_Mark, false)			---可點選(是)
				SetModeEx( door2 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
				SetModeEx( door2 , EM_SetModeType_Fight, false) ---可砍殺(是)
				SetModeEx( door2 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
				AddToPartition( door2 , RoomID ) ----使物件出現在場景上
				door3 = CreateObjByFlag( 105117 , 780820 , 8 , 1 )  ----大前門
				SetModeEx ( door3 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				SetModeEx( door3 , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( door3 , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( door3 , EM_SetModeType_Searchenemy, false)--索敵(否)
				SetModeEx( door3 , EM_SetModeType_Mark, false)			---可點選(是)
				SetModeEx( door3 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
				SetModeEx( door3 , EM_SetModeType_Fight, false) ---可砍殺(是)
				SetModeEx( door3 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
				AddToPartition( door3 , RoomID ) ----使物件出現在場景上
				for i = 1 , 5 , 1 do ---取出來多少數量就做多少次
					local lock = CreateObjByFlag( 105219 , 780855 , i , 1 )  ----後門
					SetModeEx( lock , EM_SetModeType_Show, false) ----秀出
					SetModeEx ( lock , EM_SetModeType_Obstruct, false) 		---阻擋(是)
					SetModeEx( lock , EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( lock , EM_SetModeType_Move, false) ---移動	(否)
					SetModeEx( lock , EM_SetModeType_Searchenemy, false)--索敵(否)
					SetModeEx( lock , EM_SetModeType_Mark, false)			---可點選(是)
					SetModeEx( lock , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
					SetModeEx( lock , EM_SetModeType_Fight, false) ---可砍殺(是)
					SetModeEx( lock , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
					AddToPartition( lock , RoomID ) ----使物件出現在場景上
					WriteRoleValue ( lock , EM_RoleValue_Register1, boss )
					BeginPlot( lock,"cl_191_104988", 10 ) ---------王的戰鬥
					table.insert( lock2 , lock )
					sleep ( 1 )
				end
				open = 1 ---當門產生後必須將open 寫成0否則會不斷產生門
			end
			local MaxHP = ReadRoleValue( boss , EM_RoleValue_MaxHP )					--讀取BOSS總血量
			local NowHP = ReadRoleValue( boss , EM_RoleValue_HP )						--讀取BOSS當前血量
			local HPPercent = ( NowHP / MaxHP )*100	
			if HPPercent <= 80 and go == 0 then   -----當HP低於60%以及go=0的時候~要開始生血球中控器 
				bt = CreateObjByFlag( 104988 , 780816 , 1 , 1 )  ----生血球中控器用的
				SetModeEx( bt , EM_SetModeType_Show, false) ----秀出
				SetModeEx( bt , EM_SetModeType_Mark, false) ----標記
				SetModeEx( bt , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( bt , EM_SetModeType_Move, false) ---移動	
				SetModeEx( bt , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( bt , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
				SetModeEx( bt , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( bt , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( bt , EM_SetModeType_Searchenemy, false)  ---鎖敵
				AddToPartition( bt , RoomID ) ----使物件出現在場景上
				WriteRoleValue ( bt , EM_RoleValue_PID, AI )   -----在血球老大的PID寫進中控器
				WriteRoleValue ( bt , EM_RoleValue_Register1, boss )  ----在血球老大的Register1寫進BOSS
				BeginPlot( bt,"cl_762BT_BALL", 10 )  -----------將王的scpipt塞進去王身上,讓王執行
				local kk = SetSearchAllNPC(RoomID )---掃區域找NPC
				--ID=GetSearchResult()  ---將掃到的物件都存入這個值
				--local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) ---再去讀取職內的資料庫號碼
				for i = 0 , kk do ---kk等於讀取到的數量代表要做幾次
					ID=GetSearchResult() 
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2 == 104975 then ---如果讀取到的數量內有這支NPC
						if a105114 == 0 then
							a105114 = 1
						end
					end
				end ---跳出這個迴圈往下做其他事情
				if a105114 == 1 then ----當a=1的時候
					b_door = CreateObjByFlag( 105115 , 780820 , 4 , 1 ) --i = 傳送們
					SetModeEx( b_door , EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( b_door , EM_SetModeType_Move, false) ---移動	(否)
					SetModeEx( b_door , EM_SetModeType_Searchenemy, false)--索敵(否)
					SetModeEx( b_door , EM_SetModeType_Mark, false)			---可點選(是)
					SetModeEx( b_door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
					SetModeEx( b_door , EM_SetModeType_Fight, false) ---可砍殺(是)
					SetModeEx( b_door , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
					AddToPartition( b_door , RoomID )
					WriteRoleValue ( b_door , EM_RoleValue_PID, AI )
					WriteRoleValue ( b_door , EM_RoleValue_Register1, boss )
					BeginPlot( b_door,"cl_105114", 10 )
					b_door2 = CreateObjByFlag( 105115 , 780820 , 5 , 1 ) --i = 傳送們
					SetModeEx( b_door2 , EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( b_door2 , EM_SetModeType_Move, false) ---移動	(否)
					SetModeEx( b_door2 , EM_SetModeType_Searchenemy, false)--索敵(否)
					SetModeEx( b_door2 , EM_SetModeType_Mark, false)			---可點選(是)
					SetModeEx( b_door2 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
					SetModeEx( b_door2 , EM_SetModeType_Fight, false) ---可砍殺(是)
					SetModeEx( b_door2 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
					AddToPartition( b_door2 , RoomID )
					WriteRoleValue ( b_door , EM_RoleValue_Register2, b_door2 )
				elseif a105114 == 0 then ----若a不等於1的話
					b_door = CreateObjByFlag( 105115 , 780820 , 4 , 1 ) --i = 傳送們
					SetModeEx( b_door , EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( b_door , EM_SetModeType_Move, false) ---移動	(否)
					SetModeEx( b_door , EM_SetModeType_Searchenemy, false)--索敵(否)
					SetModeEx( b_door , EM_SetModeType_Mark, false)			---可點選(是)
					SetModeEx( b_door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
					SetModeEx( b_door , EM_SetModeType_Fight, false) ---可砍殺(是)
					SetModeEx( b_door , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
					AddToPartition( b_door , RoomID )
					WriteRoleValue ( b_door , EM_RoleValue_PID, AI )
					WriteRoleValue ( b_door , EM_RoleValue_Register1, boss )
					BeginPlot( b_door,"cl_105113", 10 )
					b_door2 = CreateObjByFlag( 105115 , 780820 , 5 , 1 ) --i = 傳送們
					SetModeEx( b_door2 , EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( b_door2 , EM_SetModeType_Move, false) ---移動	(否)
					SetModeEx( b_door2 , EM_SetModeType_Searchenemy, false)--索敵(否)
					SetModeEx( b_door2 , EM_SetModeType_Mark, false)			---可點選(是)
					SetModeEx( b_door2 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
					SetModeEx( b_door2 , EM_SetModeType_Fight, false) ---可砍殺(是)
					SetModeEx( b_door2 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
					AddToPartition( b_door2 , RoomID )
					WriteRoleValue ( b_door , EM_RoleValue_Register2, b_door2 )
				end
				go = 1 ---將go寫成0不然控制器會一直生
			end
		elseif p == 2 then -----當讀取到P=2的話就是BOSS已經死亡~要將場上的所有不該出現的東西都刪除
			DelObj(door1) ---刪除後門
			DelObj(door2) ---刪除前門
			DelObj( door3 )
			kide_time = kide_time + 1
			go = 0 ---要將GO寫回去0
			carzy_time = 0
			for i = 0 , table.getn(lock2) , 1 do
				if lock2[i] ~= nil then
					DelObj ( lock2[i] )
				end
			end
			if ch_door_flag == 0 then
				ch_door_flag = 1
			end
			if ch_door_flag == 1 then
				ch_door=CreateObjByFlag(105040,780816,1,1)
				SetModeEx( ch_door , EM_SetModeType_Mark, false)
				SetModeEx( ch_door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( ch_door , EM_SetModeType_Obstruct, true) 
				SetModeEx( ch_door , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( ch_door , EM_SetModeType_Move, false) ---移動	
				SetModeEx( ch_door , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( ch_door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( ch_door , EM_SetModeType_Searchenemy, false)
				AddToPartition(ch_door,RoomID)
				SetPlot( ch_door,"collision","cl_780796_playfly_",30 )
				ch_door_flag = 2
			end
			--Lua_Un191_Clocktest_1()       --直接複製貼上  會把戰場時間變成5分鐘   玩家身上的時鐘也會變
			if kide_time >= 240 then
				local playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
					local NpcGID = GetSearchResult()					
					--Lua_bk_warplayerpoint( NpcGID , 363 )
					addbuff ( NpcGID , 508480 , 0 , -1 )
					if ReadRoleValue( NpcGID , EM_RoleValue_IsDead)==1 then
						Revive( NpcGID, 2 , 2690, 54, -966, 0 )
					else
						ChangeZone( NpcGID , 2 , 0, 2690 , 54 , -966 , 240 )
					end	
				end
				kide_time = 230
			end
			--WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 ) ----Register2要寫回去0重置
		elseif p == 3 then  -----------當讀取到P=3的話就是BOSS已經離開戰鬥了~要將場上的所有不該出現的東西都刪除
			DelObj( door2 )
			DelObj( door3 )
			DelObj( boss )
			for i = 0 , table.getn(lock2) , 1 do
				if lock2[i] ~= nil then
					DelObj ( lock2[i] )
				end
			end
			WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )
			go = 0
			open = 0
			a = 0
			a105114 = 0
			carzy_time = 0
			sleep ( 50 )
			boss = CreateObjByFlag( 104984 , 780816 , 1 , 1 )   -------用控制器將王生在這個旗標的位置
			SetModeEx( boss , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( boss , EM_SetModeType_Move, false) ---移動	(否)
			AddToPartition ( boss,RoomID )  ---------把物件加入場景內----要在這個地方產生一個新的東西都必須要做這個動作喔
			WriteRoleValue ( boss , EM_RoleValue_PID, AI )  -----在王的PID身上寫入這個值,告訴王誰是控制器
			BeginPlot( boss,"cl_19105boss", 10 ) ---------王的戰鬥
			WriteRoleValue ( AI , EM_RoleValue_Register1, boss ) ---傳遞值給所有人告訴她BOSS是誰~統一記錄在中控器的Register1讓所有物件去讀取
			WriteRoleValue ( AI , EM_RoleValue_Register5, 0 )
		end
	end
end
function cl_762BT_BALL() ---血球老闆
	local bt = OwnerID()
	local RoomID = ReadRoleValue( bt , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( bt , EM_RoleValue_PID )
	local boss = ReadRoleValue( bt , EM_RoleValue_Register1 )
	local fiag = 0
	local fiag2 = 0
	for i=1 , 5 , 1 do   ---BOSS進入戰鬥後開始生血魄,一共要生10科
		fiag = DW_Rand(254)
		local ball = CreateObjByFlag( 104985 ,780817 ,148, 1 ) --i = 旗標編號  
		SetModeEx(ball,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
		SetModeEx(ball,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
		SetModeEx(ball,EM_SetModeType_NotShowHPMP, false)--不顯示血條
		SetModeEx(ball,EM_SetModeType_Strikback, false)--反擊
		SetModeEx(ball,EM_SetModeType_Move, true)--移動
		SetModeEx(ball,EM_SetModeType_Fight, false)--可砍殺攻擊
		SetModeEx(ball,EM_SetModeType_Searchenemy, false)--搜尋敵人
		SetModeEx(ball,EM_SetModeType_Obstruct, false)--會阻擋(阻擋其他的物件)
		AddToPartition( ball, RoomID)
		WriteRoleValue ( ball , EM_RoleValue_PID, bt )
		WriteRoleValue ( ball , EM_RoleValue_Register1, boss )
		WriteRoleValue ( ball , EM_RoleValue_Register2, AI )
		--table.insert( ball_table , ball )
		fiag2 = DW_Rand(254)
		local ball2 = CreateObjByFlag( 105123 ,780817 ,163, 1 ) --i = 旗標編號  
		SetModeEx(ball2,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
		SetModeEx(ball2,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
		SetModeEx(ball2,EM_SetModeType_NotShowHPMP, false)--不顯示血條
		SetModeEx(ball2,EM_SetModeType_Strikback, false)--反擊
		SetModeEx(ball2,EM_SetModeType_Move, true)--移動
		SetModeEx(ball2,EM_SetModeType_Fight, false)--可砍殺攻擊
		SetModeEx(ball2,EM_SetModeType_Searchenemy, false)--搜尋敵人
		SetModeEx(ball2,EM_SetModeType_Obstruct, false)--會阻擋(阻擋其他的物件)
		AddToPartition( ball2, RoomID)
		WriteRoleValue (ball2 , EM_RoleValue_PID, bt )
		WriteRoleValue ( ball2 , EM_RoleValue_Register1, boss )
		WriteRoleValue ( ball2 , EM_RoleValue_Register2, AI )
		--table.insert( ball2_table , ball2 )
		BeginPlot(ball2 ,"cl_762_19205ball" , 0) --掛走旗標+撞到人的判斷
		sleep ( 2 )
		BeginPlot(ball ,"cl_762_19205ball" , 0) --掛走旗標+撞到人的判斷
	end
	while 1 do
		sleep ( 10 )
		local p = ReadRoleValue ( AI , EM_RoleValue_Register2 )
		if p ~= 1 then
			delobj ( bt )
		end
	end
end
function cl_762_104985() -------->血魄--走路移動
	local ball = OwnerID()
	local RoomID = ReadRoleValue( ball , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local bt = ReadRoleValue( ball , EM_RoleValue_PID )
	local fiag = 0
	Addbuff (  ball , 508123 , 0 , -1 )
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		sleep ( 5 )
		fiag = DW_Rand(254)
		if fiag ~= ( fiag >= 0 and fiag <= 54) or( fiag >=60 and fiag <= 76 ) or
		   ( fiag >= 91 and fiag <= 92 ) or ( fiag >= 107 and fiag <= 108 ) or
		   ( fiag >= 123 and fiag <= 124 ) or ( fiag >= 139 and fiag <= 140 ) or
		   ( fiag >= 155 and fiag <= 156 ) or ( fiag >= 171 and fiag <= 172 ) or
		   ( fiag >= 187 and fiag <= 188 ) or ( fiag >= 203 and fiag <= 204 ) or
		   ( fiag >= 219 and fiag <= 220 ) or ( fiag >= 236 and fiag <= 254 ) then      ------------>當隨機出來的值等於以上的亂數就施放第一招
			MoveToFlagEnabled(ball, false) ---系統內建的路徑關掉
			WriteRoleValue(  ball,EM_RoleValue_IsWalk,1)
			Hide(ball)
			Show(ball,RoomID)
			DW_MoveToFlag( ball , 780817 , fiag , 0 ) ----隨機Rand旗子走
		else
			fiag = DW_Rand(254)
		end
	end
end
function cl_762_105123() -------->血魄--走路移動
	local ball = OwnerID()
	local RoomID = ReadRoleValue( ball , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local bt = ReadRoleValue( ball , EM_RoleValue_PID )
	local fiag = 0
	Addbuff (  ball , 508123 , 0 , -1 )
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		sleep ( 5 )
		fiag = DW_Rand(254)
		if fiag == ( fiag >= 0 and fiag <= 54) or( fiag >=60 and fiag <= 76 ) or
		   ( fiag >= 91 and fiag <= 92 ) or ( fiag >= 107 and fiag <= 108 ) or
		   ( fiag >= 123 and fiag <= 124 ) or ( fiag >= 139 and fiag <= 140 ) or
		   ( fiag >= 155 and fiag <= 156 ) or ( fiag >= 171 and fiag <= 172 ) or
		   ( fiag >= 187 and fiag <= 188 ) or ( fiag >= 203 and fiag <= 204 ) or
		   ( fiag >= 219 and fiag <= 220 ) or ( fiag >= 236 and fiag <= 254 ) then
			MoveToFlagEnabled(ball, false) ---系統內建的路徑關掉
			WriteRoleValue( ball,EM_RoleValue_IsWalk,1)
			Hide(ball)
			Show(ball,RoomID)
			DW_MoveToFlag( ball , 780817 , fiag , 0 ) ----隨機Rand旗子走路
		else
			fiag = DW_Rand(254)
		end
	end
end
function cl_762_19205ball() -------->血魄--走路移動
	local ball = OwnerID()
	local RoomID = ReadRoleValue( ball , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local bt = ReadRoleValue( ball , EM_RoleValue_PID )
	local boss = ReadRoleValue( ball , EM_RoleValue_Register1 )
	local AI = ReadRoleValue( ball , EM_RoleValue_Register2 )
	SetPlot( ball, "range","cl_191ball_collision", 30 )
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		sleep ( 5 )
		local p = ReadRoleValue ( AI , EM_RoleValue_Register2 )
		if p == 1 then
			local oo = GetDistance( ball , boss );
			if oo <= 35 then
				StopMove(ball,false)
				SetModeEx(ball,EM_SetModeType_Move, false)--移動
				local MaxHP = ReadRoleValue( boss , EM_RoleValue_MaxHP )		--讀取BOSS總血量
				local NowHP = ReadRoleValue( boss , EM_RoleValue_HP )	
				local HPPercent = ( NowHP / MaxHP )*100	
				if HPPercent > 99 then
					CastSpelllv ( ball , boss , 496862 , 0 )	
				elseif HPPercent < 99 then
					if CheckBuff( boss , 508339 ) == true then
						local SK = Lua_BuffPosSearch( boss, 508339 )  ---讀取BOSS自己身上有幾層buff
						local SKX=0
						sleep(10)
						SK= Lua_BuffPosSearch( boss , 508339 )
						SKX=BuffInfo( boss, SK , EM_BuffInfoType_Power )---讀取技能等級
						CastSpelllv (ball , boss , 496579 , SKX+1 ) 
					else
						CastSpelllv (ball , boss , 496579 , 0 ) 
					end
				end				
				sleep ( 10 )
				killid ( ball , ball )
				DelObj(ball)
			end
			local most = {}
			local mostbon = {}
			most = SearchRangeNPC ( ball , 30 )
			local mostno = table.getn(most)
			for i=1 , mostno , 1 do
				if ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 105114 then
					CastSpelllv ( most[i] , most[i], 496772 , 0 )
					CastSpelllv ( ball , ball, 496568 , 0 )
					sleep ( 10 )
					killid ( most[i] , most[i])
					killid ( ball , ball)
					sleep ( 5 )
					delobj ( most[i] )
					DelObj ( ball )
				end
			end
		else
			DelObj ( ball )
		end
	end
end

function cl_762_19205B_dead() ----Boss 的死王劇情-
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue ( OwnerID() , EM_RoleValue_RoomID )
	WriteRoleValue ( AI , EM_RoleValue_Register2 , 2 )
	ScriptMessage( OwnerID() , -1 , 2 ,"[SC_1910505]" , 2 )--我需．．要更多的．．．血．．．
	star_WorldBattle_ScoreCal( 1 , 2 )
	local playcount = SetSearchAllPlayer(RoomID)
	for i=1 , playcount do
		local NpcGID = GetSearchResult()		
		Lua_bk_warplayerpoint( NpcGID , 363 )
		ScriptMessage( NpcGID , NpcGID , 0 ,"[SC_ZONE190_WIN05]" , 2 )--世界戰場2勝利字串(個人
	end
	--WriteRoleValue ( OwnerID()  , EM_RoleValue_Register3 , 0 )
	ScriptMessage( OwnerID() , -1 , 2 ,"[SC_ZONE190_WIN02]" , 2 )--世界戰場2勝利字串
end
function cl_191gokulo_dead() --骷髏死亡後在王的旁邊就要讀取他的BUFF層數然後刪掉一層
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local gokulo2 = ReadRoleValue( boss , EM_RoleValue_Register3 )
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	WriteRoleValue ( boss , EM_RoleValue_Register3 , gokulo2-1 )
	local oo = GetDistance( OwnerID(), boss );
	if oo <= 50 then
		local BUFF = Lua_BuffPosSearch( boss, 508339 )
		local BUFFX=1
		BUFF= Lua_BuffPosSearch( boss , 508339 )
		BUFFX=BuffInfo( boss, BUFF , EM_BuffInfoType_Power )---讀取技能等級
		CancelBuff(	boss, 508339 )
		BUFFXX = BUFFX-1
		if BUFFXX >= 0 then
			Addbuff ( boss  , 508339 , BUFFXX , -1 )
		end	
	end
	sleep ( 20 )
	DelObj ( OwnerID() )
end
function cl_191ball_collision() ---PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	local ball = TargetID()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local bt = ReadRoleValue( ball , EM_RoleValue_PID )
	local boss = ReadRoleValue( ball , EM_RoleValue_Register1 )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) ~=  1 then
			CastSpell ( ball , ball, 496568  )
			sleep ( 10 )
			killid ( ball , ball)
			sleep ( 5 )
			DelObj ( ball )
		end
	end
end
function cl_762_ball_dead() ----血球的死王劇情--要刪除掉場上的血球
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local bt = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local fiag = 0
	fiag = DW_Rand(254)
	local ball = CreateObjByFlag( 104985 ,780817 ,fiag, 1 ) --i = 旗標編號  
	SetModeEx(ball,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
	SetModeEx(ball,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
	SetModeEx(ball,EM_SetModeType_NotShowHPMP, false)--不顯示血條
	SetModeEx(ball,EM_SetModeType_Strikback, false)--反擊
	SetModeEx(ball,EM_SetModeType_Move, true)--移動
	SetModeEx(ball,EM_SetModeType_Fight, false)--可砍殺攻擊
	SetModeEx(ball,EM_SetModeType_Searchenemy, false)--搜尋敵人
	SetModeEx(ball,EM_SetModeType_Obstruct, false)--會阻擋(阻擋其他的物件)
	AddToPartition( ball, RoomID)
	WriteRoleValue ( ball , EM_RoleValue_PID, bt )
	WriteRoleValue ( ball , EM_RoleValue_Register1, boss )
	WriteRoleValue ( ball , EM_RoleValue_Register2, AI )
	BeginPlot(ball ,"cl_762_19205ball" , 0) --掛走旗標+撞到人的判斷
end
function cl_Randball_dead() ----血球的死王劇情--要刪除掉場上的血球
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local bt = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local fiag = 0
	fiag = DW_Rand(254)
	local ball = CreateObjByFlag( 105123 ,780817 ,fiag, 1 ) --i = 旗標編號
	SetModeEx(ball,EM_SetModeType_Mark, false)--可標記/點選(可以讓玩家點選)
	SetModeEx(ball,EM_SetModeType_HideName, false)--NPC 或物件頭上的名稱是否顯示
	SetModeEx(ball,EM_SetModeType_NotShowHPMP, false)--不顯示血條
	SetModeEx(ball,EM_SetModeType_Strikback, false)--反擊
	SetModeEx(ball,EM_SetModeType_Move, true)--移動
	SetModeEx(ball,EM_SetModeType_Fight, false)--可砍殺攻擊
	SetModeEx(ball,EM_SetModeType_Searchenemy, false)--搜尋敵人
	SetModeEx(ball,EM_SetModeType_Obstruct, false)--會阻擋(阻擋其他的物件)
	AddToPartition( ball, RoomID)
	WriteRoleValue ( ball , EM_RoleValue_PID, bt )
	WriteRoleValue ( ball , EM_RoleValue_Register1, boss )
	WriteRoleValue ( ball , EM_RoleValue_Register2, AI )
	BeginPlot(ball ,"cl_762_19205ball" , 0) --掛走旗標+撞到人的判斷
end
function cl_191gokulo() ----骷髏的戰鬥
	local kulo = OwnerID()
	local RoomID = ReadRoleValue( kulo , EM_RoleValue_RoomID )
	local boss = ReadRoleValue( kulo , EM_RoleValue_PID)
	local skill = 0
	local skill1 = 0
	local CombatBegin = 0
	local Attackplayer = Lua_AP_HateTargetID( boss )
	SetPlot( kulo,"dead","cl_191gokulo_dead", 0 )
	SetAttack( kulo , Attackplayer)
	CastSpell ( kulo , boss, 496734  )
	sleep ( 30 )
	Addbuff ( boss , 508339 , 0 , -1 )
	while 1 do
		sleep (10)
		local AttackTarget = ReadRoleValue( kulo , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		if HateListCount( boss ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				skill = skill + 1
				if skill >= 3 then ----每五秒施放一次技能(緩速用)
					CastSpelllv ( kulo , kulo , 496742 , 0 )
					sleep ( 10 )
					skill = 0
				end
				if skill1 >= 12 then
					Attackplayer = Lua_AP_HateTargetID( boss )
					SetAttack( kulo , Attackplayer)
					skill1 = 0
				end
				local MaxHP = ReadRoleValue( kulo , EM_RoleValue_MaxHP )					--讀取BOSS總血量
				local NowHP = ReadRoleValue( kulo , EM_RoleValue_HP )						--讀取BOSS當前血量
				local HPPercent = ( NowHP / MaxHP )*100	
				if HPPercent <= 50 then   -----當HP低於10%要出現反彈頓
					CastSpelllv ( kulo , kulo, 496740 , 0 )
					sleep ( 10 )
				end
			end
		elseif HateListCount ( boss ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				--delobj ( kulo )
			end
		end
	end
end
function cl_19105Bon() ----骷髏生出的透明求施放AE後刪掉自己
	local Bon = OwnerID()
	local RoomID = ReadRoleValue( Bon , EM_RoleValue_RoomID )
	CastSpell ( Bon , Bon, 496735  )
	sleep ( 20 )
	DelObj ( Bon )
end
function cl_19105boss() ----BOSS放招式的模式
	local boss = OwnerID()
	local RoomID = ReadRoleValue( boss , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( boss , EM_RoleValue_PID)
	local CombatBegin = 0
	local skill = 0
	local skill1 = 0
	local skill2 = 0
	local gokulo = 0
	local Flag_OP = 780839
	local cosl
	local kulo
	local kuio_table = {}
	local kuio_No = 0
	local Six_Table = {}
	local six = 0
	local ch_Table = {}
	local chin = 0
	SetPlot( boss,"dead","cl_762_19205B_dead", 10 )  ---王的死亡劇情
	while 1 do
		sleep (10)
		local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		local gokulo2 = ReadRoleValue ( boss , EM_RoleValue_Register3 )
		if HateListCount( boss ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 1 )
				local PPL = SetSearchAllPlayer(RoomID )
				local Flag = 1
				for i = 1 , PPL , 1 do ---把玩家抓入房間用 
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and 
						ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and 
						ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
						SetPosByFlag( ID , Flag_OP , Flag ) 
						Flag = Flag + 1
						if Flag > GetMoveFlagCount(Flag_OP) -1 then
							Flag = 1
						end
						sysCastSpelllv ( ID , boss , 496773 , 0 )
					end
				end
				ScriptMessage( boss , -1 , 2 ,"[SC_1910501]" , 2 ) ----你們竟然能到的了這裡，那就讓我好好地招待各位吧
				for i = 1 , 3 do   ---BOSS進入戰鬥後開始生骷髏,一共要生3之
					cosl = CreateObjByFlag( 105077 , 780820 , i , 1 ) --i = 旗標編號
					SetModeEx( cosl , EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( cosl , EM_SetModeType_Move, false) ---移動	(否)
					SetModeEx( cosl , EM_SetModeType_Searchenemy, false)--索敵(否)
					SetModeEx( cosl , EM_SetModeType_Mark, false)			---可點選(是)
					SetModeEx( cosl , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
					SetModeEx( cosl , EM_SetModeType_Fight, false) ---可砍殺(是)
					SetModeEx( cosl , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
					AddToPartition( cosl , RoomID )
					BeginPlot( cosl , "cl_cosl" , 10 )
				end
				sleep ( 20 )
				for i=1 , 3  do   ---BOSS進入戰鬥後開始生骷髏,一共要生3之 cl_bon
					kulo = CreateObjByFlag( 104986 , 780820 , i , 1 ) --i = 旗標編號
					AddToPartition( kulo , RoomID )
					WriteRoleValue ( kulo , EM_RoleValue_PID, boss )
					gokulo2 = ReadRoleValue ( boss , EM_RoleValue_Register3 )
					WriteRoleValue ( boss  , EM_RoleValue_Register3 , gokulo2+1 )
					BeginPlot( kulo , "cl_191gokulo" , 10 )
					table.insert( kuio_table , kulo )
					sleep ( 2 )
				end
				sleep ( 10 )
				SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( boss , EM_SetModeType_Move, true) ---移動	(否)
			end
			if CombatBegin == 1 then
				skill1 = skill1 + 1
				skill2 = skill2 + 1
				gokulo = gokulo + 1
				if skill >= 7 then
					Luck = DW_Rand(100)  ----->有100個亂數去隨機一個值出來
					if ( Luck >= 1 and Luck <= 10) or( Luck >=21 and Luck <= 30 ) or
					   ( Luck >= 41 and Luck <= 50 ) or ( Luck >= 61 and Luck <= 70 ) or
					   ( Luck >= 81 and Luck <= 90 ) then      ------------>當隨機出來的值等於以上的亂數就施放第一招
					   CastSpelllv ( boss , AttackTarget , 496738 , 0  )----對當前目標釋放一個巨大傷害
					   sleep ( 10 )   --------->放玩法術後整個迴圈停兩秒
					elseif ( Luck >= 11 and Luck <= 20 ) or( Luck >= 31 and Luck <= 40 ) or
					   ( Luck >= 51 and Luck <= 60 ) or( Luck >= 70 and Luck <= 80 ) or
					   ( Luck >= 91 and Luck <= 100 ) then   ------------>當隨機出來的值等於以上的亂數就施放第二招
					   CastSpelllv ( boss , boss , 496739 , 0 )----前方扇形
					   sleep ( 20 )
					end
					sleep ( 10 )
					skill = 0
				end
				if skill1 >= 9 then
					--sysCastSpelllv ( boss , boss , 496743 , 0 )----恐懼3名玩家
					Six_Table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
					six=table.getn(Six_Table) ----重整這個Table
					if six > 0 then
						for i = 1 , 3 , 1 do ---取出來多少數量就做多少次
							Rand_Num = DW_Rand(six)
							table.insert( ch_Table , Six_Table[Rand_Num] )
							table.remove ( Six_Table , Rand_Num )
							six=table.getn(Six_Table)
						end
					end
					chin=table.getn(ch_Table) ----重整這個Table
					if chin > 0 then
						for i = 1 , chin , 1 do
							Addbuff (  ch_Table[i] , 508352 , 0 , 10 ) ---
						end
					end
					sleep ( 10 )
					skill1 = 0
					ch_Table = {}
					Six_Table = {}
					chin = 0
					six = 0
				end
				if skill2 >= 15 then
					while 	ReadRoleValue( boss , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					ScriptMessage( boss , -1 , 2 ,"[SC_1910503]" , 2 ) ----向我貢獻你們的鮮血吧，那是多麼的滋養啊
					local MaxHP = ReadRoleValue( boss , EM_RoleValue_MaxHP )		--讀取BOSS總血量
					local NowHP = ReadRoleValue( boss , EM_RoleValue_HP )	
					local HPPercent = ( NowHP / MaxHP )*100	
					if HPPercent > 99 then
						CastSpelllv ( boss , boss , 496863 , 0 )	---施放假的補血術
						sleep ( 30 )
					elseif HPPercent < 99 then
						CastSpelllv ( boss , boss , 496736 , 0  )  ---讀到幾層就施放幾級的補血術
						sleep ( 30 )
					end
					sleep ( 10 )
					skill2 = 0
				end
				if gokulo >= 30 then
					if gokulo2 <= 2 then
						for i = 1 , 3 do   ---BOSS進入戰鬥後開始生骷髏,一共要生3之
							cosl = CreateObjByFlag( 105077 , 780820 , i , 1 ) --i = 旗標編號
							SetModeEx( cosl , EM_SetModeType_Strikback, false) ---反擊(否)
							SetModeEx( cosl , EM_SetModeType_Move, false) ---移動	(否)
							SetModeEx( cosl , EM_SetModeType_Searchenemy, false)--索敵(否)
							SetModeEx( cosl , EM_SetModeType_Mark, false)			---可點選(是)
							SetModeEx( cosl , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
							SetModeEx( cosl , EM_SetModeType_Fight, false) ---可砍殺(是)
							SetModeEx( cosl , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
							AddToPartition( cosl , RoomID )
							BeginPlot( cosl , "cl_cosl" , 10 )
							sleep ( 2 )
						end
						sleep ( 20 )
						for i=1 , 3  do   ---BOSS進入戰鬥後開始生骷髏,一共要生3之 cl_bon
							kulo = CreateObjByFlag( 104986 , 780820 , i , 1 ) --i = 旗標編號
							AddToPartition( kulo , RoomID )
							WriteRoleValue ( kulo , EM_RoleValue_PID, boss )
							gokulo2 = ReadRoleValue ( boss , EM_RoleValue_Register3 )
							WriteRoleValue ( boss  , EM_RoleValue_Register3 , gokulo2+1 )
							BeginPlot( kulo , "cl_191gokulo" , 10 )
							table.insert( kuio_table , kulo )
							sleep ( 2 )
						end
					end
					gokulo = 0
				end
			end
		elseif HateListCount ( boss ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				skill = 0
				skill1 = 0
				skill2 = 0
				for i = 0 , table.getn(kuio_table) , 1 do
					if kuio_table[i] ~= nil then
						DelObj ( kuio_table[i] )
					end
				end
				WriteRoleValue ( AI , EM_RoleValue_Register2 , 3 )
			end
		end
	end
end
function cl_chckbuff() ----骷髏死亡要升求施放技能
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local X1 = 0
	local Y1 = 0
	local Z1 = 0
	X1 = ReadRoleValue ( OwnerID(), EM_RoleValue_X)
	Y1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Y)
	Z1 = ReadRoleValue ( OwnerID(), EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
	local Bon = CreateObj( 105076 , X1, Y1 , Z1 , 0 , 1 )  ------------要生出透明求施放範圍100的AE
	SetModeEx( Bon , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Bon , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Bon , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( Bon , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( Bon , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( Bon , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( Bon , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition( Bon , RoomID )
	BeginPlot( Bon,"cl_19105Bon", 0 )
end
function cl_cosl() -----表演用球
	CastSpelllv ( OwnerID() , OwnerID() , 496764 , 0 )
	sleep ( 30 )
	DelObj ( OwnerID() )
end
function cl_105113() ----骷髏
	local boss_gg = OwnerID()
	local RoomID = ReadRoleValue( boss_gg , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( boss_gg , EM_RoleValue_PID)
	local boss = ReadRoleValue( boss_gg , EM_RoleValue_Register1 )
	local b_door2 = ReadRoleValue( boss_gg , EM_RoleValue_Register2 )
	local CombatBegin = 0
	local boo = 0
	local b_door
	local may
	local may2
	local may_table = {}
	local t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	may = CreateObjByFlag( 105113 , 780820 , 4 , 1 ) --i = 旗標編號
	AddToPartition( may , RoomID )
	WriteRoleValue ( may , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	table.insert( may_table , may )
	may2 = CreateObjByFlag( 105113 , 780820 , 5 , 1 ) --i = 旗標編號
	AddToPartition( may2 , RoomID )
	WriteRoleValue ( may2 , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may2 , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	table.insert( may_table , may2 )
	BeginPlot( may2 , "cl_105113attack" , 10 )
	sleep ( 2 )
	BeginPlot( may , "cl_105113attack" , 10 )
	while 1 do
		sleep (10)
		local p = ReadRoleValue ( AI , EM_RoleValue_Register2 )
		if p == 1 then
			t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
			boo = boo + 1
			if boo >= 40 then
				if t1 <= 1 then
					may = CreateObjByFlag( 105113 , 780820 , 4 , 1 ) --i = 旗標編號
					AddToPartition( may , RoomID )
					WriteRoleValue ( may , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					table.insert( may_table , may )
					may2 = CreateObjByFlag( 105113 , 780820 , 5 , 1 ) --i = 旗標編號
					AddToPartition( may2 , RoomID )
					WriteRoleValue ( may2 , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may2 , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					table.insert( may_table , may2 )
					BeginPlot( may2 , "cl_105113attack" , 10 )
					sleep ( 2 )
					BeginPlot( may , "cl_105113attack" , 10 )
				end
				boo = 0
			end
		elseif p ~= 1 then
			for i = 0 , table.getn(may_table) , 1 do
				if may_table[i] ~= nil then
					DelObj ( may_table[i] )
				end
			end
			delobj (boss_gg)
			delobj (b_door2)
		end
	end
end
function cl_105114() ----屍妖
	local boss_gg = OwnerID()
	local RoomID = ReadRoleValue( boss_gg , EM_RoleValue_RoomID )
	local AI = ReadRoleValue( boss_gg , EM_RoleValue_PID)
	local boss = ReadRoleValue( boss_gg , EM_RoleValue_Register1 )
	local b_door2 = ReadRoleValue( boss_gg , EM_RoleValue_Register2 )
	local CombatBegin = 0
	local boo = 0
	local b_door
	local may
	local may2
	local may_table = {}
	local t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	may = CreateObjByFlag( 105114 , 780820 , 4 , 1 ) --i = 旗標編號
	AddToPartition( may , RoomID )
	WriteRoleValue ( may , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	WriteRoleValue ( may  , EM_RoleValue_Register4 , AI )
	table.insert( may_table , may )
	may2 = CreateObjByFlag( 105114 , 780820 , 5 , 1 ) --i = 旗標編號
	AddToPartition( may2 , RoomID )
	WriteRoleValue ( may2 , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may2 , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	WriteRoleValue ( may2  , EM_RoleValue_Register4 , AI )
	table.insert( may_table , may2 )
	may3 = CreateObjByFlag( 105114 , 780820 , 4 , 1 ) --i = 旗標編號
	AddToPartition( may3 , RoomID )
	WriteRoleValue ( may3 , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may3 , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	WriteRoleValue ( may3  , EM_RoleValue_Register4 , AI )
	table.insert( may_table , may3 )
	may4 = CreateObjByFlag( 105114 , 780820 , 5 , 1 ) --i = 旗標編號
	AddToPartition( may4 , RoomID )
	WriteRoleValue ( may4 , EM_RoleValue_PID, boss_gg )
	WriteRoleValue ( may4 , EM_RoleValue_Register1, boss )
	t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
	WriteRoleValue ( may4  , EM_RoleValue_Register4 , AI )
	table.insert( may_table , may4 )
	BeginPlot( may2 , "cl_105114attack" , 10 )
	sleep ( 2 )
	BeginPlot( may , "cl_105114attack" , 10 )
	sleep ( 2 )
	BeginPlot( may3 , "cl_105114attack" , 10 )
	sleep ( 2 )
	BeginPlot( may4 , "cl_105114attack" , 10 )
	ScriptMessage( boss_gg , -1 , 2 ,"[SC_1910504]" , 2 )--我的僕從們，好好替我招待這些客人們
	while 1 do
		sleep (10)
		local p = ReadRoleValue ( AI , EM_RoleValue_Register2 )
		if p == 1 then
			t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
			boo = boo + 1
			if boo >= 40 then
				if t1 <= 3 then
					may = CreateObjByFlag( 105114 , 780820 , 4 , 1 ) --i = 旗標編號
					AddToPartition( may , RoomID )
					WriteRoleValue ( may , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					WriteRoleValue ( may  , EM_RoleValue_Register4 , AI )
					table.insert( may_table , may )
					may2 = CreateObjByFlag( 105114 , 780820 , 5 , 1 ) --i = 旗標編號
					AddToPartition( may2 , RoomID )
					WriteRoleValue ( may2 , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may2 , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					WriteRoleValue ( may2  , EM_RoleValue_Register4 , AI )
					table.insert( may_table , may2 )
					may3 = CreateObjByFlag( 105114 , 780820 , 4 , 1 ) --i = 旗標編號
					AddToPartition( may3 , RoomID )
					WriteRoleValue ( may3 , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may3 , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					WriteRoleValue ( may3  , EM_RoleValue_Register4 , AI )
					table.insert( may_table , may3 )
					may4 = CreateObjByFlag( 105114 , 780820 , 5 , 1 ) --i = 旗標編號
					AddToPartition( may4 , RoomID )
					WriteRoleValue ( may4 , EM_RoleValue_PID, boss_gg )
					WriteRoleValue ( may4 , EM_RoleValue_Register1, boss )
					t1 = ReadRoleValue ( boss_gg , EM_RoleValue_Register4 )
					WriteRoleValue ( boss_gg  , EM_RoleValue_Register4 , t1+1 )
					WriteRoleValue ( may4  , EM_RoleValue_Register4 , AI )
					table.insert( may_table , may4 )
					BeginPlot( may2 , "cl_105114attack" , 10 )
					sleep ( 2 )
					BeginPlot( may , "cl_105114attack" , 10 )
					sleep ( 2 )
					BeginPlot( may3 , "cl_105114attack" , 10 )
					sleep ( 2 )
					BeginPlot( may4 , "cl_105114attack" , 10 )
				end
				boo = 0
			end
		elseif p ~= 1 then
			for i = 0 , table.getn(may_table) , 1 do
				if may_table[i] ~= nil then
					DelObj ( may_table[i] )
				end
			end
			delobj ( boss_gg )
			delobj (b_door2)
		end
	end
end
function cl_105113_dead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local boss_gg = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	local t1 = ReadRoleValue( boss_gg , EM_RoleValue_Register4 )
	WriteRoleValue ( boss_gg , EM_RoleValue_Register4 , t1-1 )
	DelObj ( OwnerID() )
end
function cl_105113attack() ----骸骨衛兵的戰鬥
	local kulo = OwnerID()
	local RoomID = ReadRoleValue( kulo , EM_RoleValue_RoomID )
	local door = ReadRoleValue( kulo , EM_RoleValue_PID)
	local boss = ReadRoleValue( kulo , EM_RoleValue_Register1)
	local skill = 0
	local skill1 = 0
	local CombatBegin = 0
	local Attackplayer = Lua_AP_HateTargetID( boss )
	SetPlot( kulo,"dead","cl_105113_dead", 0 )
	SetAttack( kulo , Attackplayer)
	while 1 do
		sleep (10)
		local AttackTarget = ReadRoleValue( kulo , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		if HateListCount( kulo ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				skill1 = skill1+1
				skill = skill+1
				if skill1 >= 5 then
					Attackplayer = Lua_AP_HateTargetID( boss )
					SetAttack( kulo , Attackplayer)
					CastSpelllv ( kulo , Attackplayer , 496831 , 0 )
					skill1 = 0
				end
				if skill >= 9 then ----每五秒施放一次技能(緩速用)
					CastSpelllv ( kulo , kulo , 496832 , 0 )
					sleep ( 60 )
					skill = 0
				end
			end
		elseif HateListCount ( kulo ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				skill = 0
			end
		end
	end
end
function cl_105114attack() ----屍妖的戰鬥
	local kulo = OwnerID()
	local RoomID = ReadRoleValue( kulo , EM_RoleValue_RoomID )
	local door = ReadRoleValue( kulo , EM_RoleValue_PID)
	local boss = ReadRoleValue( kulo , EM_RoleValue_Register1)
	local skill = 0
	local skill1 = 0
	local CombatBegin = 0
	local Attackplayer = Lua_AP_HateTargetID( boss )
	SetPlot( kulo,"dead","cl_105113_dead", 0 )
	SetAttack( kulo , Attackplayer)
	while 1 do
		sleep (10)
		local AttackTarget = ReadRoleValue( kulo , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		if HateListCount( kulo ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
			end
			if CombatBegin == 1 then
				skill = skill + 1
				skill1 = skill1 + 1
				if skill >= 3 then ----每五秒施放一次技能(緩速用)
					CastSpelllv ( kulo , kulo , 496830 , 0 )
					sleep ( 10 )
					skill = 0
				end
				if skill1 >= 12 then
					Attackplayer = Lua_AP_HateTargetID( boss )
					SetAttack( kulo , Attackplayer)
					CastSpelllv ( kulo , Attackplayer , 496831 , 0 )
					skill1 = 0
				end
			end
		elseif HateListCount ( kulo ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				skill = 0
			end
		end
	end 
end
function cl_762_496870() ----判斷補血用496870
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )					--讀取BOSS總血量
	local NowHP = ReadRoleValue( TargetID() , EM_RoleValue_HP )						--讀取BOSS當前血量
	local HPPercent = ( NowHP / MaxHP )*100	
	if HPPercent > 99 then
		CastSpelllv ( OwnerID() , TargetID() , 496862 , 0 )
	elseif HPPercent < 99 then
		local SK = Lua_BuffPosSearch( TargetID(), 508339 )  ---讀取BOSS自己身上有幾層buff
		local SKX=0
		sleep(10)
		SK= Lua_BuffPosSearch( TargetID() , 508339 )
		SKX=BuffInfo( TargetID(), SK , EM_BuffInfoType_Power )---讀取技能等級
		CastSpelllv ( OwnerID() , TargetID() , 496579 , SKX )  ---讀到幾層就施放幾級的補血術
	end
end
function cl_191_104988()
	local luck = OwnerID() ----我叫做boss
	local RoomID = ReadRoleValue( luck , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local boss = ReadRoleValue( luck , EM_RoleValue_Register1)
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----每一秒都尋找王的攻擊目標
		local oo = GetDistance( luck , boss );
		if oo <= 25 then
			if ReadRoleValue( boss , EM_RoleValue_RoomID  ) == RoomID then
				SetPosByFlag( AttackTarget, 780839 , 1 )
				ScriptMessage( boss , -1 , 2 ,"[SC_1910502]" , 2 ) ----竟然來了就好好地待著吧
			end
		end
	end
end
function cl_496871()
	local SK = Lua_BuffPosSearch( OwnerID(), 508339 )  ---讀取BOSS自己身上有幾層buff
	local SKX=0
	if CheckBuff( OwnerID() , 508339 ) == true then
		SK = Lua_BuffPosSearch( OwnerID() , 508339 )
		SKX=BuffInfo( OwnerID(), SK , EM_BuffInfoType_Power )---讀取技能等級 
		sysCastSpelllv ( OwnerID() , OwnerID() , 496737 , SKX+1 )
	else
		sysCastSpelllv ( OwnerID() , OwnerID() , 496737 , 0 )
	end
end
function cl_780796_playfly_()  ---傳送門用
	addbuff ( OwnerID() , 508480 , 0 , -1 )
	ChangeZone( OwnerID() , 2 , 0, 2690 , 54 , -966 , 240 )
end