function Lua_apon_Zone122_TimerGate_AI_1() --前段
	local Check_String = 0 ---判斷重覆字串用
	while 1 do
		sleep(10)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1,0) ---目的用於重置
		WriteRoleValue( OwnerID(), EM_RoleValue_Register2,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register3,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register4,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register5,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register6,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register7,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register8,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register9,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_PID,0)
		
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Door = 103064 ----隱形門
		local TimerGate_Boss = 103056 ---中控AI
		
		--local Flag_Key_gate = 780524 ----紅藍色石柱用   
		local Flag_lastdoor = 780524 ---最後的阻擋門
		local Flag_Door = 780525 ----每一個隱形門
		--local Flag_TimerGate_Boss = 780526 ---中控AI 的旗標
		--local Flag_TimerGate_Keydoor = 780526
		local Flag_Fin_door = 780526 --- 最後的魔法門
		local Flag_Gate_Boss = 780527 ---- 中間的Boss 旗標 --- 1 = 第一隻 ＆ 2= 第二隻 
		local Flag_Gate_Boos_door = 780528 ---中間Boss 兩側的門 1 2 = 第一隻 ， 3 4 = 第二隻
		
		local Table_Door = {}
		-----1. 發現可疑人物！警戒 ！ 警戒 ！     2. 敵人入侵了！警戒！警戒！ 3. 敵人在哪？快把他找出來！  
		local All_String_1 = {"[SC_102969_12]","[SC_102969_13]","[SC_102969_14]"}
		
		for i = 1 , 7, 1 do ----生門的迴圈
			--say(OwnerID(),"i="..i)
			Table_Door[i] = CreateObjByFlag( Door , Flag_Door , i , 1 )
			WriteRoleValue( Table_Door[i], EM_RoleValue_PID,OwnerID())
			--WriteRoleValue( OwnerID(), EM_RoleValue_Register[i], Table_Door[i])
			SetModeEx(Table_Door[i] , EM_SetModeType_Strikback , false )--反擊
			--SetModeEx(Table_Door[i] , EM_SetModeType_Show , false )--秀出
			SetModeEx(Table_Door[i] , EM_SetModeType_Searchenemy , false )--索敵
			SetModeEx( Table_Door[i] , EM_SetModeType_Fight, false) ----可砍殺攻擊
			SetModeEx( Table_Door[i] , EM_SetModeType_Mark, false) ----標記
			SetModeEx( Table_Door[i] , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( Table_Door[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( Table_Door[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( Table_Door[i] , EM_SetModeType_Gravity, true) ----重力
			SetModeEx( Table_Door[i] , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
			SetModeEx( Table_Door[i] , EM_SetModeType_AlignToSurface, false) ----貼齊表面
			SetModeEx( Table_Door[i] , EM_SetModeType_Move, false) ----移動
			AddToPartition( Table_Door[i],roomid1 )
			--BeginPlot( Table_Door[i] , "Lua_apon_Zone122_TimerGate_1",5 )
			SetPlot( Table_Door[i] , "Collision" , "Lua_apon_Zone122_TimerGate_1_1" , 10 ) ----碰撞劇情，啟動隱形門生小怪
		end
		
		local Check_FinDoor = CreateObjByFlag( Door , Flag_Fin_door , 2 , 1 )
		SetModeEx(Check_FinDoor , EM_SetModeType_Strikback , false )--反擊
		SetModeEx(Check_FinDoor , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( Check_FinDoor , EM_SetModeType_Fight, false) ----可砍殺攻擊
		SetModeEx( Check_FinDoor , EM_SetModeType_Mark, false) ----標記
		SetModeEx( Check_FinDoor , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
		SetModeEx( Check_FinDoor , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( Check_FinDoor , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( Check_FinDoor , EM_SetModeType_Gravity, true) ----重力
		SetModeEx( Check_FinDoor , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
		SetModeEx( Check_FinDoor , EM_SetModeType_AlignToSurface, false) ----貼齊表面
		SetModeEx( Check_FinDoor , EM_SetModeType_Move, false) ----移動
		AddToPartition( Check_FinDoor,roomid1 )
		table.insert( Table_Door , Check_FinDoor )
		SetPlot( Check_FinDoor , "Collision" , "Lua_apon_Zone122_CheckFindoor" , 0 ) ----碰撞劇情，說明石柱上有機關
		BeginPlot( Check_FinDoor , "Lua_apon_Zone122_CheckFin",10 )
		
		local Boss_1 = CreateObjByFlag( 103088 , Flag_Gate_Boss , 1 , 1 )
		AddToPartition( Boss_1,roomid1 )
		BeginPlot( Boss_1 , "Lua_apon_Zone122_Gate_1_1",5 )
		SetPlot(Boss_1,"dead","Lua_apon_Zone122_Gate_Dead_1_1",10 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register3, Boss_1)
		
		local Boss_2 = CreateObjByFlag( 103089 , Flag_Gate_Boss , 2 , 1 )
		AddToPartition( Boss_2,roomid1 )
		BeginPlot( Boss_2 , "Lua_apon_Zone122_Gate_2_1",5 )
		SetPlot(Boss_2,"dead","Lua_apon_Zone122_Gate_Dead_1_1",10 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register4, Boss_2)
		
		local Gate_1 = CreateObj( 114342 , -2272 , 615 , 1723 , 358 ,1) ---藍色石柱
		SetModeEx(Gate_1 , EM_SetModeType_Strikback , false )--反擊
		SetModeEx(Gate_1 , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( Gate_1 , EM_SetModeType_Fight, false) ----可砍殺攻擊
		SetModeEx( Gate_1 , EM_SetModeType_Mark, true) ----標記
		SetModeEx( Gate_1 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
		SetModeEx( Gate_1 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( Gate_1 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( Gate_1 , EM_SetModeType_Gravity, false) ----重力
		SetModeEx( Gate_1 , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
		SetModeEx( Gate_1 , EM_SetModeType_AlignToSurface, false) ----貼齊表面
		SetModeEx( Gate_1 , EM_SetModeType_Move, false) ----移動
		AddToPartition( Gate_1,roomid1 )
		BeginPlot( Gate_1 , "Lua_apon_Runwar_3",10 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register5, Gate_1)
		WriteRoleValue( Gate_1, EM_RoleValue_Register1, OwnerID())
		
		local Gate_2 = CreateObj( 114343 , -2272 , 615 , 1659 , 358 ,1 ) ---紅色石柱
		SetModeEx(Gate_2 , EM_SetModeType_Strikback , false )--反擊
		SetModeEx(Gate_2 , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( Gate_2 , EM_SetModeType_Fight, false) ----可砍殺攻擊
		SetModeEx( Gate_2 , EM_SetModeType_Mark, true) ----標記
		SetModeEx( Gate_2 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
		SetModeEx( Gate_2 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( Gate_2 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( Gate_2 , EM_SetModeType_Gravity, false) ----重力
		SetModeEx( Gate_2 , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
		SetModeEx( Gate_2 , EM_SetModeType_AlignToSurface, false) ----貼齊表面
		SetModeEx( Gate_2 , EM_SetModeType_Move, false) ----移動
		AddToPartition( Gate_2,roomid1 )
		BeginPlot( Gate_2 , "Lua_apon_Runwar_4",10 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register6, Gate_2)
		WriteRoleValue( Gate_2, EM_RoleValue_Register1, OwnerID())
		
		local last_door = CreateObjByFlag( 103516 , Flag_lastdoor , 1 , 1 ) ---阻擋門
		SetModeEx(last_door , EM_SetModeType_Strikback , false )--反擊
		SetModeEx(last_door , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( last_door , EM_SetModeType_Fight, false) ----可砍殺攻擊
		SetModeEx( last_door , EM_SetModeType_Mark, false) ----標記
		SetModeEx( last_door , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
		SetModeEx( last_door , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( last_door , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( last_door , EM_SetModeType_Gravity, false) ----重力
		SetModeEx( last_door , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
		SetModeEx( last_door , EM_SetModeType_AlignToSurface, false) ----貼齊表面
		SetModeEx( last_door , EM_SetModeType_Move, false) ----移動
		SetModeEx( last_door   , EM_SetModeType_Obstruct, true )--阻擋
		AddToPartition( last_door,roomid1 )
		WriteRoleValue( OwnerID(), EM_RoleValue_Register9, last_door)
		--SetDefIdleMotion( last_door,ruFUSION_MIME_ACTIVATE_LOOP)------升上來	
		
		local Check_start = 0 ----一旦有玩家開啟碰撞劇情，則開始定時掃描
		local Check_Begin = 0 ----掃描開始
		local Check_Counter = 0
		local String_Counter = 0 ----字串的時間，按照時間的多寡來變換 string
		local String_Counter_1 = 0
		local String_key = 0 ---判斷要用哪一個等級的String
		local Door_op = 0
		local Check_ALL_OP = 0
		local Check_run_1 = 0 ---藍色石柱判斷用
		local Check_run_2 = 0 ---紅色石柱判斷用
		local Check_table_1 = {}
		while 1 do 
			sleep(10)
			Check_start = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			Check_Counter = Check_Counter + 1
			--say(OwnerID(),"Check_Counter =="..Check_Counter)
			--DeBugMsg(0,0,"Check_Counter =="..Check_Counter )	
			String_Counter = String_Counter + 1
			String_Counter_1 = String_Counter_1 + 1
			
			------------判斷終點門，是否要產生用的，終點門要用魔法門來呈現--------------------------------
			Check_run_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
			Check_run_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
			
			if Check_run_1 == 1 and Check_run_2 == 1 and Check_String == 0 then
				--if Check_String == 0 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_25]" , 1 )----忽然一股能量從兩旁的石柱中竄了出來 .....
					Check_String = 1
				--end
				for i = 1 , 8 , 1 do ---生出六個終止追兵的特效球
					local Over_Ball = CreateObjByFlag( 103056 , 780529 , i , 1 )
					SetModeEx(Over_Ball , EM_SetModeType_Strikback , false )--反擊
					SetModeEx(Over_Ball , EM_SetModeType_Searchenemy , false )--索敵
					SetModeEx( Over_Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					SetModeEx( Over_Ball , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Over_Ball , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
					SetModeEx( Over_Ball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Over_Ball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Over_Ball , EM_SetModeType_Gravity, false) ----重力
					SetModeEx( Over_Ball , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
					SetModeEx( Over_Ball , EM_SetModeType_AlignToSurface, false) ----貼齊表面
					SetModeEx( Over_Ball , EM_SetModeType_Move, false) ----移動
					SetModeEx( Over_Ball , EM_SetModeType_Obstruct, false) ----阻擋
					AddToPartition( Over_Ball,roomid1 )
					WriteRoleValue(Over_Ball, EM_RoleValue_Livetime,60)---魔法門在120秒後，則會消失
					BeginPlot( Over_Ball, "Lua_apon_Over_Ball_1", 0)
				end
				
				----------生出一道魔法門，阻擋追兵，門會不斷的施放範圍法術，如果中這個法術的怪物，則會停留在原地，並且30秒後，刪除。
				local Fin_Door = CreateObjByFlag( 102460 , Flag_Fin_door , 1 , 1 )
				SetModeEx(Fin_Door , EM_SetModeType_Strikback , false )--反擊
				SetModeEx(Fin_Door , EM_SetModeType_Searchenemy , false )--索敵
				SetModeEx( Fin_Door , EM_SetModeType_Fight, true) ----可砍殺攻擊
				SetModeEx( Fin_Door , EM_SetModeType_Mark, false) ----標記
				SetModeEx( Fin_Door , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
				SetModeEx( Fin_Door , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( Fin_Door , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( Fin_Door , EM_SetModeType_Gravity, true) ----重力
				SetModeEx( Fin_Door , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
				SetModeEx( Fin_Door , EM_SetModeType_AlignToSurface, false) ----貼齊表面
				SetModeEx( Fin_Door , EM_SetModeType_Move, false) ----移動
				SetModeEx( Fin_Door , EM_SetModeType_Obstruct, false) ----阻擋
				AddToPartition( Fin_Door,roomid1 )
				WriteRoleValue(Fin_Door, EM_RoleValue_Livetime,120)---魔法門在120秒後，則會消失
				--BeginPlot( Fin_Door, "Lua_apon_Runwar_findoor", 10)
				
				local Fin_Door_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
				--SetModeEx( Fin_Door_2   , EM_SetModeType_Obstruct, false )--阻擋
				--SetDefIdleMotion(Fin_Door_2,ruFUSION_MIME_IDLE_STAND)----下去
				Delobj(Fin_Door_2)

				for i = 1 , table.getn(Table_Door) , 1 do
					WriteRoleValue( Table_Door[i], EM_RoleValue_Register4, 1)
					local D1 = ReadRoleValue(Table_Door[i],EM_RoleValue_Register5)
					sleep(10)
					Delobj(D1)
				end
				local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
				local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )
				WriteRoleValue( D_1, EM_RoleValue_Register9, 1)
				WriteRoleValue( D_1, EM_RoleValue_Livetime, 5)
				WriteRoleValue( D_2, EM_RoleValue_Register9, 1)
				WriteRoleValue( D_2, EM_RoleValue_Livetime, 5)
				
				Delobj(OwnerID())
			end
			----------------------------------------------------------------------------------------------------------------------------
			
			if Check_start == 1 and Check_Begin == 0 then
				Check_Begin = 1
				Check_Counter = 0
				String_Counter = 0
				ScriptMessage( OwnerID() , -1 , 1 , All_String_1[1] , 1 )
			end
			
			if Check_Begin == 1 and String_Counter >= 30 then
				local String_luck = Rand(3)+1
				ScriptMessage( OwnerID() , -1 , 1 , All_String_1[String_luck] , 1 )
				String_Counter = 0
			end
			
			if Check_Begin == 1 and Check_Counter >= 15 then ----掃描各別門有沒有玩家
				Check_Counter = 0
				
				local Check_table = {} ---在該隱行門範圍的玩家
				local Check_num = 0
				local Check_all = {}
				
				for i = 1 , table.getn(Table_Door) , 1 do
					Check_table_1 = {}
					Check_table = SearchRangePlayer( Table_Door[i] , 400 )---距離要改成400
					for i = 0 , table.getn(Check_table)-1, 1 do ----因為 SearchRangePlayer 的索引值是從 0 開始跑，在最後面會再塞一個 [ -1 ] ！！所以再多一個新的Table
						if ReadRoleValue( Check_table[i] , EM_RoleValue_IsDead) ~= 1 then
							table.insert( Check_table_1 , Check_table[i] )
						end
					end
					
					--DeBugMsg(0,0,"Check_table_1  =="..table.getn(Check_table_1))
					
					for i = 1 , table.getn(Check_table_1), 1 do 
						if ReadRoleValue( Check_table_1[i] , EM_RoleValue_IsDead) == 1 and ReadRoleValue( Check_table_1[i] , EM_RoleValue_RoomID  ) == roomid1 then
							table.remove ( Check_table_1 , i)
							--say(Check_table_1[i],"1111111")
						elseif ReadRoleValue( Check_table_1[i], EM_RoleValue_VOC) == 0 and ReadRoleValue( Check_table_1[i] , EM_RoleValue_RoomID  ) == roomid1 then
							table.remove ( Check_table_1 , i)
							--say(Check_table_1[i],"22222222")
						end	
					end
					sleep(10)
					
					--DeBugMsg(0,0,"Check_table_1 _ 2 =="..table.getn(Check_table_1))
					Check_num = table.getn(Check_table_1)
					sleep(10)
					table.insert( Check_all , Check_num )
					Check_num = 0
				end
				
				--DeBugMsg(0,0,"Check_all =="..table.getn(Check_all))
				
				for i = 1 , table.getn(Check_all) , 1 do
					Door_op = Check_all[i]
					
					--DeBugMsg(0,0,"Door_op =="..Door_op)
					
					Check_ALL_OP = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
					local Add_op = Check_ALL_OP + Door_op
					--DeBugMsg(0,0,"Add_op =="..Add_op)
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Add_op)
					Check_ALL_OP = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
					--DeBugMsg(0,0,"Check_ALL_OP ="..Check_ALL_OP)
				end
				Check_ALL_OP = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if Check_ALL_OP <= 0 then ---重置機置
					for i = 1 , table.getn(Table_Door) , 1 do
						WriteRoleValue( Table_Door[i], EM_RoleValue_Register3,1)
					end
					
					local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
					local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register4 )
					local D_3 = ReadRoleValue( OwnerID() , EM_RoleValue_Register5 )
					local D_4 = ReadRoleValue( OwnerID() , EM_RoleValue_Register6 )
					local D_5 = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
					--Delobj(D_1)
					--Delobj(D_2)
					sleep(10)
					WriteRoleValue( D_1, EM_RoleValue_Register9, 1)
					WriteRoleValue( D_2, EM_RoleValue_Register9, 1)
					Delobj(D_3)
					Delobj(D_4)
					Delobj(D_5)
					sleep(50)
					--DeBugMsg(0,0,"Return Start !!!!")
					break ----等同於重跑這個funtion 重置了 
					--Delobj(OwnerID())
				elseif Check_ALL_OP > 0 then
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
				end
			end
		end
	end
end

function Lua_apon_Zone122_Gate_1_1() ---小 Boos 一號
	--SetPlot(OwnerID(),"dead","Lua_apon_Zone122_TimerGate_Boss_Dead_1",10 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag_Gate_Boos_door = 780528 ---中間Boss 兩側的門 1 2 = 第一隻 ， 3 4 = 第二隻
	local Door = 102460
	local Start_war = 0 
	local Counter_1 = 0
	local Counter_2 = 0
	local Counter_3 = 0
	local Counter_4 = 0
	local Check_Re = 0 ---重置用
	while 1 do 
		sleep(10)
		Check_Re = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
		if Check_Re == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
			local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
			Delobj(D_1)
			Delobj(D_2)
			--WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
			Delobj(OwnerID())
		end
		
		if HateListCount( OwnerID() ) ~= 0 then
			Counter_1 = Counter_1 + 1 
			Counter_2 = Counter_2 + 1
			Counter_3 = Counter_3 + 1
			Counter_4 = Counter_4 + 1
			
			if Start_war == 0 then ----將兩側的門產生出來
				Start_war = 1
				local Door_1 = CreateObjByFlag( Door , Flag_Gate_Boos_door , 1 , 1 )
				SetModeEx(Door_1 , EM_SetModeType_Strikback , false )--反擊
				SetModeEx(Door_1 , EM_SetModeType_Searchenemy , false )--索敵
				SetModeEx( Door_1 , EM_SetModeType_Fight, false) ----可砍殺攻擊
				SetModeEx( Door_1 , EM_SetModeType_Mark, false) ----標記
				SetModeEx( Door_1 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
				SetModeEx( Door_1 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( Door_1 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( Door_1 , EM_SetModeType_Gravity, true) ----重力
				SetModeEx( Door_1 , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
				SetModeEx( Door_1 , EM_SetModeType_AlignToSurface, false) ----貼齊表面
				SetModeEx( Door_1 , EM_SetModeType_Move, false) ----移動
				SetModeEx( Door_1 , EM_SetModeType_Obstruct, true) ----阻擋
				AddToPartition( Door_1,roomid1 )
				WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Door_1)
				
				local Door_2 = CreateObjByFlag( Door , Flag_Gate_Boos_door , 2 , 1 )
				SetModeEx(Door_2 , EM_SetModeType_Strikback , false )--反擊
				SetModeEx(Door_2 , EM_SetModeType_Searchenemy , false )--索敵
				SetModeEx( Door_2 , EM_SetModeType_Fight, false) ----可砍殺攻擊
				SetModeEx( Door_2 , EM_SetModeType_Mark, false) ----標記
				SetModeEx( Door_2 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
				SetModeEx( Door_2 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( Door_2 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( Door_2 , EM_SetModeType_Gravity, true) ----重力
				SetModeEx( Door_2 , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
				SetModeEx( Door_2 , EM_SetModeType_AlignToSurface, false) ----貼齊表面
				SetModeEx( Door_2 , EM_SetModeType_Move, false) ----移動
				SetModeEx( Door_2 , EM_SetModeType_Obstruct, true) ----阻擋
				AddToPartition( Door_2,roomid1 )
				WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Door_2)
				
			end
			
		else 
			if Start_war == 1 then
				--say(OwnerID(),"OVER_1")
				local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
				local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
				Delobj(D_1)
				Delobj(D_2)
				--WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
				Delobj(OwnerID())
			end
		end
	end
end

function Lua_apon_Zone122_Gate_2_1() ---小 Boos 二號
	--SetPlot(OwnerID(),"dead","Lua_apon_Zone122_TimerGate_Boss_Dead_1",10 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag_Gate_Boos_door = 780528 ---中間Boss 兩側的門 1 2 = 第一隻 ， 3 4 = 第二隻
	local Door = 102460
	local Start_war = 0 
	local Counter_1 = 0
	local Counter_2 = 0
	local Counter_3 = 0
	local Counter_4 = 0
	local Check_Re --- 重置用
	while 1 do 
		sleep(10)
		Check_Re = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )
		if Check_Re == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
			local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
			Delobj(D_1)
			Delobj(D_2)
			--WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
			Delobj(OwnerID())
		end
		
		if HateListCount( OwnerID() ) ~= 0 then
			Counter_1 = Counter_1 + 1 
			Counter_2 = Counter_2 + 1
			Counter_3 = Counter_3 + 1
			Counter_4 = Counter_4 + 1
			
			if Start_war == 0 then ----將兩側的門產生出來
				Start_war = 1
				local Door_1 = CreateObjByFlag( Door , Flag_Gate_Boos_door , 3 , 1 )
				SetModeEx(Door_1 , EM_SetModeType_Strikback , false )--反擊
				SetModeEx(Door_1 , EM_SetModeType_Searchenemy , false )--索敵
				SetModeEx( Door_1 , EM_SetModeType_Fight, false) ----可砍殺攻擊
				SetModeEx( Door_1 , EM_SetModeType_Mark, false) ----標記
				SetModeEx( Door_1 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
				SetModeEx( Door_1 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( Door_1 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( Door_1 , EM_SetModeType_Gravity, true) ----重力
				SetModeEx( Door_1 , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
				SetModeEx( Door_1 , EM_SetModeType_AlignToSurface, false) ----貼齊表面
				SetModeEx( Door_1 , EM_SetModeType_Move, false) ----移動
				SetModeEx( Door_1 , EM_SetModeType_Obstruct, true) ----阻擋
				AddToPartition( Door_1,roomid1 )
				WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Door_1)
				
				local Door_2 = CreateObjByFlag( Door , Flag_Gate_Boos_door , 4 , 1 )
				SetModeEx(Door_2 , EM_SetModeType_Strikback , false )--反擊
				SetModeEx(Door_2 , EM_SetModeType_Searchenemy , false )--索敵
				SetModeEx( Door_2 , EM_SetModeType_Fight, false) ----可砍殺攻擊
				SetModeEx( Door_2 , EM_SetModeType_Mark, false) ----標記
				SetModeEx( Door_2 , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
				SetModeEx( Door_2 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( Door_2 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( Door_2 , EM_SetModeType_Gravity, true) ----重力
				SetModeEx( Door_2 , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
				SetModeEx( Door_2 , EM_SetModeType_AlignToSurface, false) ----貼齊表面
				SetModeEx( Door_2 , EM_SetModeType_Move, false) ----移動
				SetModeEx( Door_2 , EM_SetModeType_Obstruct, true) ----阻擋
				AddToPartition( Door_2,roomid1 )
				WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Door_2)
			end
			
		else 
			if Start_war == 1 then
				--say(OwnerID(),"OVER_2")
				local D_1 = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
				local D_2 = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
				Delobj(D_1)
				Delobj(D_2)
				--WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
				Delobj(OwnerID())
			end
		end
	end
end


function Lua_apon_Zone122_Gate_Dead_1_1() ---區間小Boss 的死亡劇情
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ball = star_CreateObj( OwnerID() , 103056 , 0 , 0 , 0 , roomid1 , 0) ---生出一個特效球，記得換成特效球的ID:102924
	-------------特效球專用-----------------------------------------------------------------------------------------------------------------
	SetModeEx(Ball , EM_SetModeType_Strikback , false )--反擊
	SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--索敵
	SetModeEx( Ball , EM_SetModeType_Fight, false) ----可砍殺攻擊
	SetModeEx( Ball , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Ball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Ball , EM_SetModeType_Gravity, false) ----重力
	SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----貼齊表面
	SetModeEx( Ball , EM_SetModeType_Move, false) ----移動
	Hide(Ball)
	Show(Ball,roomid1)
	WriteRoleValue(Ball, EM_RoleValue_Livetime,10)
	WriteRoleValue( Ball, EM_RoleValue_Register1, OwnerID())
	BeginPlot(Ball,"Lua_apon_Zone122_Gate_Dead_2_1",5)
end

function Lua_apon_Zone122_Gate_Dead_2_1()	
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_20]" , 1 )
	local Door_1 = ReadRoleValue(Boss,EM_RoleValue_Register1)
	local Door_2 = ReadRoleValue(Boss,EM_RoleValue_Register2)
	Delobj(Door_1)
	Delobj(Door_2)
end



-----玩家 = owner
------門 = target
function Lua_apon_Zone122_TimerGate_1_1()
	SetPlot( TargetID() , "Collision" , "" , 0 )
	local TimerGate_AI = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	
	if ReadRoleValue( OwnerID(), EM_RoleValue_VOC) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "GM can`t start this`s game !!" , 1 )
	elseif ReadRoleValue( OwnerID(), EM_RoleValue_VOC) ~= 0 then	
		WriteRoleValue( TimerGate_AI, EM_RoleValue_Register1,1)
		BeginPlot( TargetID() , "Lua_apon_Zone122_TimerGate_2_1",0 )
	end
end


-----門 -- owner
------玩家 -- Target
-------EM_RoleValue_Register3 = 重置用
-------EM_RoleValue_Register4 = 刪除傳送門終結用
-------EM_RoleValue_Register5 = 傳送門
---------一個門最多會在場上產生 15 個物件

function Lua_apon_Zone122_TimerGate_2_1() ----目的在於生小怪
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local TimerGate_Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Luck_string = Rand(3)+1
	local Mob_1 = 103068 
	local Mob_2 = 103084
	local Table_mob = {}
	local Counter_mob = 0
	local STEP = 0
	local Door_Return = 0 ----重置用
	local Door_over = 0 --- 最後門開啟時，將傳送門刪除用
	local Door_Seed = 0
	local Mob_Num = 0 ----計算這個門現在有產生幾隻怪
	while 1 do
		sleep(10)
		Door_Return = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		Door_over = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
		--DeBugMsg(0,0,"Door_over ="..Door_over)
		Counter_mob = Counter_mob + 1
		if Door_Return == 1 then
			for i = 1 , table.getn(Table_mob) , 1 do
				Delobj(Table_mob[i])
			end
			Delobj(OwnerID())
		end
		
		if Door_over == 1 then
			for i = 1 , table.getn(Table_mob) , 1 do
				WriteRoleValue(Table_mob[i], EM_RoleValue_Livetime,30)
			end
			Delobj(OwnerID())
		end
		
		-----------------------將已死亡的怪物從table中移除-----------------------------------
		for i = 1 , table.getn(Table_mob), 1 do
			if Table_mob[i] ~= nil and ReadRoleValue( Table_mob[i] , EM_RoleValue_IsDead) == 1 then
				table.remove ( Table_mob , i)
			end	
		end
		-------------------------------------------------------------------------------------------------------
		Mob_Num = table.getn(Table_mob)

		
		if Counter_mob >= 6 and Door_Seed == 0 then
			Door_Seed = 1
			local Seed_Door = star_CreateObj( OwnerID() , 103065 , 0 , 10 , 0 , roomid1 , 0)
			SetModeEx(Seed_Door , EM_SetModeType_Strikback , false )--反擊
			SetModeEx(Seed_Door , EM_SetModeType_Searchenemy , false )--索敵
			SetModeEx( Seed_Door , EM_SetModeType_Fight, false) ----可砍殺攻擊
			SetModeEx( Seed_Door , EM_SetModeType_Mark, false) ----標記
			SetModeEx( Seed_Door , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( Seed_Door , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( Seed_Door , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( Seed_Door , EM_SetModeType_Gravity, false) ----重力
			SetModeEx( Seed_Door , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
			SetModeEx( Seed_Door , EM_SetModeType_AlignToSurface, false) ----貼齊表面
			SetModeEx( Seed_Door , EM_SetModeType_Move, false) ----移動
			Hide(Seed_Door)
			Show(Seed_Door,roomid1)
			table.insert( Table_mob , Seed_Door )
			WriteRoleValue( OwnerID(), EM_RoleValue_Register5, Seed_Door)
		end
		
		if Counter_mob >= 10 and STEP == 0 and Mob_Num <= 10 then
			STEP = 1
			for i = 1 , 2 , 1 do
				local Mob_1 = star_CreateObj( OwnerID() , Mob_1 , 0 , 0 , 0 , roomid1 , 0)
				BeginPlot( Mob_1 , "Lua_apon_Runwar_mob_1",10 )
				table.insert( Table_mob , Mob_1 )
			end
		
		elseif Counter_mob >= 35 and STEP == 1 and Mob_Num <= 10 then
			STEP = 0
			local Mob_2 = star_CreateObj( OwnerID() , Mob_2 , 0 , 0 , 0 , roomid1 , 0)
			BeginPlot( Mob_2 , "Lua_apon_Runwar_mob_1",10 )
			table.insert( Table_mob , Mob_2 )
			Counter_mob = 0
		end
	end
end

----206725 : 藍色符石
-----206726 : 紅色符石
-------114342 : 藍色石柱
--------114343 : 紅色石柱

function Lua_apon_Runwar_3() ---藍色符石柱檢查用
	SetPlot( OwnerID() , "touch" , "Lua_apon_Runwar_3_1" , 20 )
end

----Own = 玩家
----Tar = 符石
function Lua_apon_Runwar_3_1()
	if CheckBuff(TargetID(),505626) == true then
		--say(OwnerID(),"It is Over")
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_21]" , 1 )---石柱上的機關已被啟動了 ！ 
		
	else
		if CountBodyItem( OwnerID(), 206725 ) >= 1 then
				SetPlot( OwnerID() , "touch" , "" , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_22]" , 1 )-------你慢慢的將手中的符石嵌進石柱之中 ....
				BeginPlot( TargetID() , "Lua_apon_Runwar_3_2",0 )
				--say(OwnerID(),"Check_1")
		elseif CountBodyItem( OwnerID(), 206726 ) >= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_23]" , 1 )----------你試著將手中符石嵌進石柱中 ......  但是形狀似乎不太一樣
		else
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_24]" , 1 )-------你仔細的觸摸著石柱，似乎有個凹槽可以放進某個物品......
		end
	end
end

------Own = 符石
---------Tar = 玩家
function Lua_apon_Runwar_3_2()
	local Gate_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	AddBuff (OwnerID() , 505626 , 0 , -1)---判斷用
	DelBodyItem( TargetID(), 206725, 1 )
	WriteRoleValue( Gate_AI, EM_RoleValue_Register7, 1)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 1) ----之後玩家再點選，則會告訴玩家，此石柱已經被啟動了
end

-------------------------------------------------------------------------------------------------------------------------------
function Lua_apon_Runwar_4() ---紅色符石柱檢查用
	SetPlot( OwnerID() , "touch" , "Lua_apon_Runwar_2_4_1" , 20 )
end

----Own = 玩家
----Tar = 符石
function Lua_apon_Runwar_2_4_1()
	if CheckBuff(TargetID(),505626) == true then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_21]" , 1 )---石柱上的機關已被啟動了 ！ 
		
	else
		if CountBodyItem( OwnerID(), 206726 ) >= 1 then
				SetPlot( OwnerID() , "touch" , "" , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_22]" , 1 )-------你慢慢的將手中的符石嵌進石柱之中 ....
				BeginPlot( TargetID() , "Lua_apon_Runwar_4_2",0 )
		elseif CountBodyItem( OwnerID(), 206725 ) >= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_23]" , 1 )----------你試著將手中符石嵌進石柱中 ......  但是形狀似乎不太一樣
		else
			ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_102969_24]" , 1 )-------你仔細的觸摸著石柱，似乎有個凹槽可以放進某個物品......
		end
	end
end

------Own = 符石
---------Tar = 玩家
function Lua_apon_Runwar_4_2()
	local Gate_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	AddBuff (OwnerID() , 505626 , 0 , -1)---判斷用
	DelBodyItem( TargetID(), 206726, 1 )
	WriteRoleValue( Gate_AI, EM_RoleValue_Register8, 1)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 1) ----之後玩家再點選，則會告訴玩家，此石柱已經被啟動了
end


function Lua_apon_Runwar_mob_1() ----隱形門，所產生的怪物使用
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local All_String_1 = {"[SC_102969_26]","[SC_102969_27]","[SC_102969_28]"} ----被阻擋的怪物叫囂用的
	local Begin = 0
	local Time = 0
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do  
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  
			and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 and CheckDistance( OwnerID(), ID, 800 ) == true then
			SetAttack( OwnerID() , ID )
			break
		end	
	end
	
	while 1 do
		sleep(10)
		Time = Time + 1
		if CheckBuff(OwnerID(),505669) == true and Begin == 0 then
			Begin = 1
			SetFightMode ( OwnerID(),0,0,0,0 )
			SetModeEx(OwnerID() , EM_SetModeType_Strikback , false )--反擊
			SetModeEx(OwnerID() , EM_SetModeType_Searchenemy , false )--索敵
			SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ----可砍殺攻擊
			Hide(OwnerID())
			Show(OwnerID(),roomid1)
			sleep(10)
			WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
			local String_luck = Rand(3)+1
			Yell( OwnerID() , All_String_1[String_luck] , 5)
		end
		if Time >= 15 and CheckBuff(OwnerID(),505669) == true then
			Time = 0
			local String_luck = Rand(3)+1
			Yell( OwnerID() , All_String_1[String_luck] , 5)
		end
	end
end

function Lua_apon_Runwar_findoor_1()-----最後的魔法門用的，不斷的施放法術，影響所有的怪物
	while 1 do
		sleep(10)
		CastSpellLV( OwnerID() , OwnerID() , 494737 , 0 )
	end
end

function Lua_apon_Over_Ball_1()
	while 1 do
		sleep(5)
		CastSpellLV( OwnerID() , OwnerID() , 494737 , 0 )
	end
end

function Lua_apon_Zone122_CheckFindoor()
	SetPlot( TargetID() , "Collision" , "" , 0 )
	local roomid1 = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	if ReadRoleValue( OwnerID(), EM_RoleValue_VOC) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "GM can`t start this`s game !!" , 1 )
	elseif ReadRoleValue( OwnerID(), EM_RoleValue_VOC) ~= 0 then	
		local Ball = star_CreateObj( TargetID() , 103056 , 0 , 0 , 0 , roomid1 , 0) 
		-------------特效球專用-----------------------------------------------------------------------------------------------------------------
		SetModeEx(Ball , EM_SetModeType_Strikback , false )--反擊
		SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--索敵
		SetModeEx( Ball , EM_SetModeType_Fight, false) ----可砍殺攻擊
		SetModeEx( Ball , EM_SetModeType_Mark, false) ----標記
		SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
		SetModeEx( Ball , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( Ball , EM_SetModeType_Gravity, false) ----重力
		SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
		SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----貼齊表面
		SetModeEx( Ball , EM_SetModeType_Move, false) ----移動
		Hide(Ball)
		Show(Ball,roomid1)
		WriteRoleValue(Ball, EM_RoleValue_Livetime,5)
		BeginPlot( Ball , "Lua_apon_Zone122_CheckFindoor_1",0 )
	end
end

function Lua_apon_Zone122_CheckFindoor_1()
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102969_19]" , 1 ) ----一絲絲的符文能量從兩旁的石柱中散發出來........
end

function Lua_apon_Zone122_CheckFin()
	local Door_over = 0
	while 1 do
		sleep(10)
		Door_over = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if Door_over == 1 then
			Delobj(OwnerID())
		end
	end
end

function Lua_apon_Zone122_checkpet() ---判斷時間追逐戰結束後可以影響到的怪物ID
	local Mob_ID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if Mob_ID == 103068 or Mob_ID == 103083 or Mob_ID == 103084 or Mob_ID == 103087 then
		return true
	else
		return false
	end	
end

