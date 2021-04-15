--Boss旗標&透明球旗標 780696
--阻擋門與牆旗標 780860 
--方型旗標 780877
--盒子旗標 780845
--標靶旗標 780859
--Boss編號 105200
--藍盒子編號 105201
--紅盒子編號 105202
--黃盒子編號 105203
--前後阻擋門編號 103044
--左右阻擋門編號 103085
function Dy_Z19_BOSS1_AIC()
	local roomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) --讀出物件在哪一層
	local madtime = 0
	local Fight --戰鬥判斷
	local Fight1 = 0--對話判斷
	local Q3 --方型傷害隨機
	local ALLP_2 = {}
	local blue = {} --靛藍之地 藍
	local purple = {} --震懾之地 紫
	local red = {} --黃昏之地 紅
	local Fwall = {} --四周阻擋牆 103044
	local dart_1 --標靶透明球1
	local dart_2 --標靶透明球2
	local BossDoor1 = 0 --前門
	local BossDoor2 --後門
	local Bossr
	local Boss = CreateObjByFlag( 105200 , 780696 , 1, 1 ) -- (BOSS編號  ,旗標編號 第N隻旗標 生出幾個怪)
		WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --將控制器寫入Boss
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --將Boss寫入控制器
		AddToPartition( Boss , roomID )
		setplot( Boss , "dead" , "Dy_Z19_BOSS1_DEAD", 0)
		BeginPlot( Boss, "Dy_Z19_BOSS1_AI", 10) ---Boss的戰鬥Function (  BOSS BOSS的LUA_AI  秒\每10=1秒)
		BossDoor2 = CreateObjByFlag( 105253 , 780860 , 1, 1 ) --後門旗標1
		
		SetModeEx( BossDoor2 , EM_SetModeType_Show, true) ----秀出
		SetModeEx( BossDoor2 , EM_SetModeType_Mark, false) ----標記
		SetModeEx( BossDoor2 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( BossDoor2 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( BossDoor2 , EM_SetModeType_Fight, false) ---可砍殺
		SetModeEx( BossDoor2 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
		SetModeEx( BossDoor2 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( BossDoor2 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( BossDoor2 , EM_SetModeType_Searchenemy, false)  ---索敵
		SetModeEx( BossDoor2   , EM_SetModeType_Obstruct, true )--阻擋
		AddToPartition( BossDoor2 , roomID )
		
		dart_1 = CreateObjByFlag( 105286 , 780696 , 2, 1 ) --標靶1
		WriteRoleValue( Boss, EM_RoleValue_Register3, dart_1)
		WriteRoleValue( dart_1, EM_RoleValue_Register3, Boss)
		
		SetModeEx( dart_1 , EM_SetModeType_Show, false) ----秀出
		SetModeEx( dart_1 , EM_SetModeType_Mark, false) ----標記
		SetModeEx( dart_1 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( dart_1 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( dart_1 , EM_SetModeType_Fight, true) ---可砍殺
		SetModeEx( dart_1 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
		SetModeEx( dart_1 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( dart_1 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( dart_1 , EM_SetModeType_Searchenemy, false)  ---索敵
		SetModeEx( dart_1   , EM_SetModeType_Obstruct, false )--阻擋
		AddToPartition( dart_1 , roomID )

		dart_2 = CreateObjByFlag( 105286 , 780696 , 3, 1 ) --標靶2
		WriteRoleValue( Boss, EM_RoleValue_Register4, dart_2)
		WriteRoleValue( dart_2, EM_RoleValue_Register4, Boss)
		
		SetModeEx( dart_2 , EM_SetModeType_Show, false) ----秀出
		SetModeEx( dart_2 , EM_SetModeType_Mark, false) ----標記
		SetModeEx( dart_2 , EM_SetModeType_Strikback, false) ---反擊
		SetModeEx( dart_2 , EM_SetModeType_Move, false) ---移動	
		SetModeEx( dart_2 , EM_SetModeType_Fight, true) ---可砍殺
		SetModeEx( dart_2 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
		SetModeEx( dart_2 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
		SetModeEx( dart_2 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
		SetModeEx( dart_2 , EM_SetModeType_Searchenemy, false)  ---索敵
		SetModeEx( dart_2   , EM_SetModeType_Obstruct, false )--阻擋
		AddToPartition( dart_2 , roomID )
		
		while 1 do
		sleep(10)
		Fight = ReadRoleValue(OwnerID(), EM_RoleValue_Register2) --戰鬥判斷
		--say(OwnerID() , "Fight = "..Fight)
		if Fight == 1 then --Boss戰鬥中
			madtime = madtime + 1
			--say (OwnerID() , "madtime = "..madtime)
			if madtime == 480  then
				ScriptMessage( Boss, -1 , 2 , "[SC_105200_07] " , 2 )
				sleep(10)
				AddBuff ( Boss, 507744  , 0 , -1 )
				
				madtime = 0 
			end
			if Fight1 == 0 then
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_00] " , 2 )
				--種出前門
				BossDoor1 = CreateObjByFlag( 105253 , 780860 , 2, 1 ) --前門旗標2
				
				SetModeEx( BossDoor1 , EM_SetModeType_Show, true) ----秀出
				SetModeEx( BossDoor1 , EM_SetModeType_Mark, false) ----標記
				SetModeEx( BossDoor1 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( BossDoor1 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( BossDoor1 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( BossDoor1 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
				SetModeEx( BossDoor1 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
				SetModeEx( BossDoor1 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( BossDoor1 , EM_SetModeType_Searchenemy, false)  ---索敵
				SetModeEx( BossDoor1   , EM_SetModeType_Obstruct, true )--阻擋
				AddToPartition( BossDoor1 , roomID )
				--種出四周阻擋牆 103044
				for i = 4 , 7 ,1 do 
					Fwall[i-3] = CreateObjByFlag( 103044 , 780860 , i, 1 ) --四周阻擋牆
					
					SetModeEx( Fwall[i-3] , EM_SetModeType_Show, true) ----秀出
					SetModeEx( Fwall[i-3] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Fwall[i-3] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Fwall[i-3] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Fwall[i-3] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( Fwall[i-3] , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
					SetModeEx( Fwall[i-3] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Fwall[i-3] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Fwall[i-3] , EM_SetModeType_Searchenemy, false)  ---索敵
					SetModeEx( Fwall[i-3]   , EM_SetModeType_Obstruct, true )--阻擋		
					AddToPartition( Fwall[i-3] , roomID )
				end
				
				--種出震懾之地 -紫
				for i = 1 , 3 ,1 do 
					purple[i] = CreateObjByFlag( 105286 , 780877 , i, 1 ) --藍色方形傷害
					
					SetModeEx( purple[i] , EM_SetModeType_Show, false) ----秀出
					SetModeEx( purple[i] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( purple[i] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( purple[i] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( purple[i] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( purple[i] , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
					SetModeEx( purple[i] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( purple[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( purple[i] , EM_SetModeType_Searchenemy, false)  ---索敵
					SetModeEx( purple[i]   , EM_SetModeType_Obstruct, false )--阻擋	
					AddToPartition( purple[i] , roomID )					
					AddBuff ( purple[i], 508613, 0, -1 )
				end
				
				--種出靛藍之地 -藍
				for i = 4 , 6 ,1 do 
					blue[i-3] = CreateObjByFlag( 105286 , 780877 , i, 1 ) --紫色方形傷害
					
					SetModeEx( blue[i-3] , EM_SetModeType_Show, false) ----秀出
					SetModeEx( blue[i-3] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( blue[i-3] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( blue[i-3] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( blue[i-3] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( blue[i-3] , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
					SetModeEx( blue[i-3] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( blue[i-3] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( blue[i-3] , EM_SetModeType_Searchenemy, false)  ---索敵
					SetModeEx( blue[i-3]   , EM_SetModeType_Obstruct, false )--阻擋
					AddToPartition( blue[i-3] , roomID )
					AddBuff ( blue[i-3] , 508611, 0, -1 )
					end
				
				--種出黃昏之地 -紅
				for i = 7 , 9 ,1 do
					red[i-6] = CreateObjByFlag( 105286 , 780877 , i, 1 ) --紅色方形傷害
					SetModeEx( red[i-6] , EM_SetModeType_Show, false) ----秀出
					SetModeEx( red[i-6] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( red[i-6] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( red[i-6] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( red[i-6] , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( red[i-6] , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
					SetModeEx( red[i-6] , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( red[i-6] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( red[i-6] , EM_SetModeType_Searchenemy, false)  ---索敵
					SetModeEx( red[i-6]   , EM_SetModeType_Obstruct, false )--阻擋
					AddToPartition( red[i-6] , roomID )
					AddBuff ( red[i-6] , 508925, 0, -1 )

				end
				
				--抓全部玩家
				local ALLP = SetSearchAllPlayer(RoomID ) --搜尋全部玩家
				for i = 1 , ALLP ,1 do --把玩家抓入九宮格區域
					local PID = GetSearchResult()
					if ReadRoleValue( PID , EM_RoleValue_IsDead ) ~= 1 and --沒死
					ReadRoleValue( PID, EM_RoleValue_VOC) ~= 0  and --不是GM
					ReadRoleValue( PID , EM_RoleValue_RoomID  ) == RoomID then --在同層
					SetPosByFlag( PID , 780877 , 2 ) --全抓到正中間
					end
				end
				Fight1 = 1 
			end

		elseif Fight == 2 then --玩家滅團
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_105200_09]" , 2 )
			DelObj ( Boss )
			DelObj ( BossDoor1 )
			DelObj ( dart_1 )
			DelObj ( dart_2 )
			for i = 1 , 3 , 1 do
				
				DelObj ( blue[i] )
				DelObj ( purple[i] )
				DelObj ( red[i] )
				
			end
			for i = 1 , 4 ,1 do
				DelObj (Fwall[i])
			end
			--say(OwnerID() , "Boss again")
			sleep(50)
			Boss =CreateObjByFlag( 105200 , 780696 , 1, 1 ) -- (BOSS編號  ,旗標編號 第N隻旗標 生出幾個怪)
			WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID()) --將控制器寫入Boss
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss) --將Boss寫入控制器
			AddToPartition( Boss , roomID )
			setplot( Boss , "dead" , "Dy_Z19_BOSS1_DEAD", 0) --死亡劇情
			BeginPlot( Boss, "Dy_Z19_BOSS1_AI", 10) ---Boss的戰鬥Function (  BOSS BOSS的LUA_AI  秒\每10=1秒)
			--say(Boss,"123")
			Fight = 0 
			Fight1 = 0
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Fight)
			
			dart_1 = CreateObjByFlag( 105286 , 780696 , 2, 1 ) --標靶1
			WriteRoleValue( Boss, EM_RoleValue_Register3, dart_1)
			WriteRoleValue( dart_1, EM_RoleValue_Register3, Boss)
			
			SetModeEx( dart_1 , EM_SetModeType_Show, false) ----秀出
			SetModeEx( dart_1 , EM_SetModeType_Mark, false) ----標記
			SetModeEx( dart_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( dart_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( dart_1 , EM_SetModeType_Fight, true) ---可砍殺
			SetModeEx( dart_1 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
			SetModeEx( dart_1 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( dart_1 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( dart_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			SetModeEx( dart_1   , EM_SetModeType_Obstruct, false )--阻擋
			AddToPartition( dart_1 , roomID )
			
			dart_2 = CreateObjByFlag( 105286 , 780696 , 3, 1 ) --標靶2
			WriteRoleValue( Boss, EM_RoleValue_Register4, dart_2)
			WriteRoleValue( dart_2, EM_RoleValue_Register4, Boss)
			
			SetModeEx( dart_2 , EM_SetModeType_Show, false) ----秀出
			SetModeEx( dart_2 , EM_SetModeType_Mark, false) ----標記
			SetModeEx( dart_2 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( dart_2 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( dart_2 , EM_SetModeType_Fight, true) ---可砍殺
			SetModeEx( dart_2 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
			SetModeEx( dart_2 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( dart_2 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( dart_2 , EM_SetModeType_Searchenemy, false)  ---索敵
			SetModeEx( dart_2   , EM_SetModeType_Obstruct, false )--阻擋
			AddToPartition( dart_2 , roomID )

				
			madtime = 0 
		elseif Fight == 3 then --Boss死亡
			--DeBugMSG(0,0,"測試1 = "..BossDoor1) 
			--DeBugMSG(0,0,"測試2 = "..dart_1)
			--DeBugMSG(0,0,"測試3 = "..dart_2)
			if checkID(BossDoor1) ~= nil then
				DelObj ( BossDoor1 )
				DelObj ( BossDoor2 )
			end
			
			if checkID(dart_1) ==true then
				DelObj ( dart_1 )
			end
			
			if checkID(dart_2) ==true then
				DelObj ( dart_2 )
			end
			--DeBugMSG(0,0,"哇靠...沒break掉是哪招")
			break
		elseif Fight == 4 then --換完區域的方形傷害隨機
			ScriptMessage( Boss, -1 , 2 , "[SC_105200_11] " , 2 )
			Q3 = Rand(4)
			if Q3 == 0 then --2
				--種出震懾之地 -紫 P-B 藍 B-C 紅 R-A
				for i = 1 , 3 ,1 do 
					AddBuff ( purple[i], 508613, 0, -1 )
					--刪除508613以外的Buff--
					if CheckBuff(purple[i],  508611 ) == true then
						CancelBuff( purple[i] ,  508611 ) --刪除藍色B-A
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( TargetID() ,  509171 ) == true then
						CancelBuff( TargetID() ,  509171 ) --刪除藍色B-B
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( purple[i] ,  509173 ) == true then
						CancelBuff( purple[i] ,  509173  ) --刪除藍色B-C
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff(purple[i] ,  509166 ) == true then
						CancelBuff( purple[i] ,  509166 ) --刪除紫色P-A
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( purple[i] ,  509168 ) == true then
						CancelBuff( purple[i] ,  509168 ) --刪除紫色P-C
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( purple[i] ,  509164 ) == true then
						CancelBuff( purple[i] ,  509164 ) --刪除黃昏R-A
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( purple[i] ,  509162 ) == true then
						CancelBuff( purple[i] ,  509162 ) --刪除黃昏R-B
						--say (TargetID() , "P_B")
					else
					
					end
					if CheckBuff( purple[i] ,  508925 ) == true then
						CancelBuff(purple[i] ,  508925 ) --刪除黃昏R-C
						--say (TargetID() , "P_B")
					else
					
					end
					--
					AddBuff ( blue[i] , 509173 , 0, -1 )
					--刪除509173以外的Buff--
					if CheckBuff( blue[i] ,  508611 ) == true then
						CancelBuff( blue[i] ,  508611 ) --刪除藍色B-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509171 ) == true then
						CancelBuff( blue[i] ,  509171 ) --刪除藍色B-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509166 ) == true then
						CancelBuff( blue[i] ,  509166 ) --刪除紫色P-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  508613 ) == true then
						CancelBuff( blue[i] ,  508613 ) --刪除紫色P-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509168 ) == true then
						CancelBuff( blue[i] ,  509168 ) --刪除紫色P-C
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509164 ) == true then
						CancelBuff( blue[i] ,  509164 ) --刪除黃昏R-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509162 ) == true then
						CancelBuff( blue[i],  509162 ) --刪除黃昏R-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  508925 ) == true then
						CancelBuff( blue[i] ,  508925 ) --刪除黃昏R-C
						--say (TargetID() , "B_C")
					else
					
					end					
					--
					AddBuff ( red[i] , 509164, 0, -1 )
					----刪除509164以外的Buff--
					if CheckBuff( red[i]  ,  508611 ) == true then
						CancelBuff( red[i] ,  508611 ) --刪除藍色B-A
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i] ,  509171 ) == true then
						CancelBuff( red[i]  ,  509171 ) --刪除藍色B-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509173 ) == true then
						CancelBuff( red[i]  ,  509173  ) --刪除藍色B-C
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509166 ) == true then
						CancelBuff( red[i]  ,  509166 ) --刪除紫色P-A
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  508613 ) == true then
						CancelBuff( red[i]  ,  508613 ) --刪除紫色P-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff(red[i]  ,  509168 ) == true then
						CancelBuff( red[i]  ,  509168 ) --刪除紫色P-C
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509162 ) == true then
						CancelBuff( red[i]  ,  509162 ) --刪除黃昏R-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  508925 ) == true then
						CancelBuff( red[i]  ,  508925 ) --刪除黃昏R-C
						--say (TargetID() , "R_A")
					else
					
					end					
					--
				end
				
			elseif Q3 == 1 then --4
				--種出震懾之地 -紫 P-A 藍 B-B 紅 R-C
				for i = 1 , 3 ,1 do 
					AddBuff ( purple[i], 509166, 0, -1 )
				--刪除509166以外的Buff--
					if CheckBuff( purple[i] ,  508611 ) == true then
						CancelBuff(purple[i] ,  508611 ) --刪除藍色B-A
						--say ( TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509171 ) == true then
						CancelBuff( purple[i] ,  509171 ) --刪除藍色B-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff(purple[i] ,  509173 ) == true then
						CancelBuff( purple[i] ,  509173  ) --刪除藍色B-C
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  508613 ) == true then
						CancelBuff( purple[i] ,  508613 ) --刪除紫色P-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509168 ) == true then
						CancelBuff( purple[i] ,  509168 ) --刪除紫色P-C
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509164 ) == true then
						CancelBuff( purple[i] ,  509164 ) --刪除黃昏R-A
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509162 ) == true then
						CancelBuff( purple[i] ,  509162 ) --刪除黃昏R-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  508925 ) == true then
						CancelBuff(purple[i] ,  508925 ) --刪除黃昏R-C
						--say (TargetID() , "P_A")
					else
					
					end
				--
					AddBuff ( blue[i] , 509171 , 0, -1 )
					--刪除509171以外的Buff--
						if CheckBuff( blue[i] ,  508611 ) == true then
							CancelBuff( blue[i] ,  508611 ) --刪除藍色B-A
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  509173 ) == true then
							CancelBuff( blue[i] ,  509173  ) --刪除藍色B-C
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  509166 ) == true then
							CancelBuff( blue[i] ,  509166 ) --刪除紫色P-A
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  508613 ) == true then
							CancelBuff( blue[i] ,  508613 ) --刪除紫色P-B
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  509168 ) == true then
							CancelBuff( blue[i] ,  509168 ) --刪除紫色P-C
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  509164 ) == true then
							CancelBuff( blue[i] ,  509164 ) --刪除黃昏R-A
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  509162 ) == true then
							CancelBuff( blue[i],  509162 ) --刪除黃昏R-B
							--say (TargetID() , "B_B")
						else
						
						end
						if CheckBuff( blue[i] ,  508925 ) == true then
							CancelBuff( blue[i] ,  508925 ) --刪除黃昏R-C
							--say (TargetID() , "B_B")
						else
						
						end
					--
					AddBuff ( red[i] , 508925, 0, -1 )
					--刪除508925以外的Buff--
						if CheckBuff( red[i] ,  508611 ) == true then
							CancelBuff( red[i] ,  508611 ) --刪除藍色B-A
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509171 ) == true then
							CancelBuff( red[i] ,  509171 ) --刪除藍色B-B
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509173 ) == true then
							CancelBuff( red[i] ,  509173  ) --刪除藍色B-C
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509166 ) == true then
							CancelBuff( red[i] ,  509166 ) --刪除紫色P-A
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  508613 ) == true then
							CancelBuff( red[i] ,  508613 ) --刪除紫色P-B
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509168 ) == true then
							CancelBuff( red[i] ,  509168 ) --刪除紫色P-C
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509164 ) == true then
							CancelBuff( red[i] ,  509164 ) --刪除黃昏R-A
							--say (TargetID() , "R_C")
						else
						
						end
						if CheckBuff( red[i] ,  509162 ) == true then
							CancelBuff( red[i] ,  509162 ) --刪除黃昏R-B
							--say (TargetID() , "R_C")
						else
						
						end
					--
				end
				
			elseif Q3 == 2 then --3
				--種出震懾之地 -紫 P-A 藍 B-C 紅 R-B
				for i = 1 , 3 ,1 do 
					AddBuff ( purple[i], 509166, 0, -1 )
				--刪除509166以外的Buff--
					if CheckBuff( purple[i] ,  508611 ) == true then
						CancelBuff(purple[i] ,  508611 ) --刪除藍色B-A
						--say ( TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509171 ) == true then
						CancelBuff( purple[i] ,  509171 ) --刪除藍色B-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff(purple[i] ,  509173 ) == true then
						CancelBuff( purple[i] ,  509173  ) --刪除藍色B-C
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  508613 ) == true then
						CancelBuff( purple[i] ,  508613 ) --刪除紫色P-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509168 ) == true then
						CancelBuff( purple[i] ,  509168 ) --刪除紫色P-C
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509164 ) == true then
						CancelBuff( purple[i] ,  509164 ) --刪除黃昏R-A
					--刪除509164以外的Buff--
						if CheckBuff( red[i]  ,  508611 ) == true then
							CancelBuff( red[i] ,  508611 ) --刪除藍色B-A
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i] ,  509171 ) == true then
							CancelBuff( red[i]  ,  509171 ) --刪除藍色B-B
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i]  ,  509173 ) == true then
							CancelBuff( red[i]  ,  509173  ) --刪除藍色B-C
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i]  ,  509166 ) == true then
							CancelBuff( red[i]  ,  509166 ) --刪除紫色P-A
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i]  ,  508613 ) == true then
							CancelBuff( red[i]  ,  508613 ) --刪除紫色P-B
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff(red[i]  ,  509168 ) == true then
							CancelBuff( red[i]  ,  509168 ) --刪除紫色P-C
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i]  ,  509162 ) == true then
							CancelBuff( red[i]  ,  509162 ) --刪除黃昏R-B
							--say (TargetID() , "R_A")
						else
						
						end
						if CheckBuff( red[i]  ,  508925 ) == true then
							CancelBuff( red[i]  ,  508925 ) --刪除黃昏R-C
							--say (TargetID() , "R_A")
						else
						
						end
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  509162 ) == true then
						CancelBuff( purple[i] ,  509162 ) --刪除黃昏R-B
						--say (TargetID() , "P_A")
					else
					
					end
					if CheckBuff( purple[i] ,  508925 ) == true then
						CancelBuff(purple[i] ,  508925 ) --刪除黃昏R-C
						--say (TargetID() , "P_A")
					else
					
					end
				--
					AddBuff ( blue[i] , 509173 , 0, -1 )
					--刪除509173以外的Buff--
					if CheckBuff( blue[i] ,  508611 ) == true then
						CancelBuff( blue[i] ,  508611 ) --刪除藍色B-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509171 ) == true then
						CancelBuff( blue[i] ,  509171 ) --刪除藍色B-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509166 ) == true then
						CancelBuff( blue[i] ,  509166 ) --刪除紫色P-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  508613 ) == true then
						CancelBuff( blue[i] ,  508613 ) --刪除紫色P-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509168 ) == true then
						CancelBuff( blue[i] ,  509168 ) --刪除紫色P-C
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509164 ) == true then
						CancelBuff( blue[i] ,  509164 ) --刪除黃昏R-A
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  509162 ) == true then
						CancelBuff( blue[i],  509162 ) --刪除黃昏R-B
						--say (TargetID() , "B_C")
					else
					
					end
					if CheckBuff( blue[i] ,  508925 ) == true then
						CancelBuff( blue[i] ,  508925 ) --刪除黃昏R-C
						--say (TargetID() , "B_C")
					else
					
					end					
					--
					AddBuff ( red[i] , 509162, 0, -1 )
					--刪除509162以外的Buff--
						if CheckBuff( red[i] ,  508611 ) == true then
							CancelBuff( red[i] ,  508611 ) --刪除藍色B-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509171 ) == true then
							CancelBuff( red[i] ,  509171 ) --刪除藍色B-B
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509173 ) == true then
							CancelBuff( red[i] ,  509173  ) --刪除藍色B-C
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509166 ) == true then
							CancelBuff( red[i] ,  509166 ) --刪除紫色P-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  508613 ) == true then
							CancelBuff( red[i] ,  508613 ) --刪除紫色P-B
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509168 ) == true then
							CancelBuff( red[i] ,  509168 ) --刪除紫色P-C
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509164 ) == true then
							CancelBuff( red[i] ,  509164 ) --刪除黃昏R-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  508925 ) == true then
							CancelBuff( red[i] ,  508925 ) --刪除黃昏R-C
							--say (TargetID() , "R_B")
						else
						
						end
					--
				end
				
			elseif Q3 == 3 then --5
				--種出震懾之地 -紫 P-C 藍 B-B 紅 R-A
				for i = 1 , 3 ,1 do 
					AddBuff ( purple[i], 509168, 0, -1 )
					--刪除509168以外的Buff--
						if CheckBuff( purple[i] ,  508611 ) == true then
							CancelBuff( purple[i] ,  508611 ) --刪除藍色B-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509171 ) == true then
							CancelBuff( purple[i] ,  509171 ) --刪除藍色B-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509173 ) == true then
							CancelBuff( purple[i] ,  509173  ) --刪除藍色B-C
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509166 ) == true then
							CancelBuff( purple[i] ,  509166 ) --刪除紫色P-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  508613 ) == true then
							CancelBuff( purple[i] ,  508613 ) --刪除紫色P-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509164 ) == true then
							CancelBuff( purple[i] ,  509164 ) --刪除黃昏R-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509162 ) == true then
							CancelBuff( purple[i] ,  509162 ) --刪除黃昏R-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  508925 ) == true then
							CancelBuff( purple[i] ,  508925 ) --刪除黃昏R-C
							--say (TargetID() , "P_C")
						else
						
						end
					--
					AddBuff ( blue[i] , 509171 , 0, -1 )
				--刪除509171以外的Buff--
					if CheckBuff( blue[i] ,  508611 ) == true then
						CancelBuff( blue[i] ,  508611 ) --刪除藍色B-A
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  509173 ) == true then
						CancelBuff( blue[i] ,  509173  ) --刪除藍色B-C
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  509166 ) == true then
						CancelBuff( blue[i] ,  509166 ) --刪除紫色P-A
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  508613 ) == true then
						CancelBuff( blue[i] ,  508613 ) --刪除紫色P-B
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  509168 ) == true then
						CancelBuff( blue[i] ,  509168 ) --刪除紫色P-C
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  509164 ) == true then
						CancelBuff( blue[i] ,  509164 ) --刪除黃昏R-A
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  509162 ) == true then
						CancelBuff( blue[i],  509162 ) --刪除黃昏R-B
						--say (TargetID() , "B_B")
					else
					
					end
					if CheckBuff( blue[i] ,  508925 ) == true then
						CancelBuff( blue[i] ,  508925 ) --刪除黃昏R-C
						--say (TargetID() , "B_B")
					else
					
					end
				--
					AddBuff ( red[i] , 509164, 0, -1 )
					----刪除509164以外的Buff--
					if CheckBuff( red[i]  ,  508611 ) == true then
						CancelBuff( red[i] ,  508611 ) --刪除藍色B-A
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i] ,  509171 ) == true then
						CancelBuff( red[i]  ,  509171 ) --刪除藍色B-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509173 ) == true then
						CancelBuff( red[i]  ,  509173  ) --刪除藍色B-C
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509166 ) == true then
						CancelBuff( red[i]  ,  509166 ) --刪除紫色P-A
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  508613 ) == true then
						CancelBuff( red[i]  ,  508613 ) --刪除紫色P-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff(red[i]  ,  509168 ) == true then
						CancelBuff( red[i]  ,  509168 ) --刪除紫色P-C
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  509162 ) == true then
						CancelBuff( red[i]  ,  509162 ) --刪除黃昏R-B
						--say (TargetID() , "R_A")
					else
					
					end
					if CheckBuff( red[i]  ,  508925 ) == true then
						CancelBuff( red[i]  ,  508925 ) --刪除黃昏R-C
						--say (TargetID() , "R_A")
					else
					
					end					
					--					
				end

			elseif Q3 == 4 then --6
				--種出震懾之地 -紫 P-C 藍B-A 紅R-B
				for i = 1 , 3 ,1 do 
					AddBuff ( purple[i], 509168, 0, -1 )
					--刪除509168以外的Buff--
						if CheckBuff( purple[i] ,  508611 ) == true then
							CancelBuff( purple[i] ,  508611 ) --刪除藍色B-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509171 ) == true then
							CancelBuff( purple[i] ,  509171 ) --刪除藍色B-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509173 ) == true then
							CancelBuff( purple[i] ,  509173  ) --刪除藍色B-C
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509166 ) == true then
							CancelBuff( purple[i] ,  509166 ) --刪除紫色P-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  508613 ) == true then
							CancelBuff( purple[i] ,  508613 ) --刪除紫色P-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509164 ) == true then
							CancelBuff( purple[i] ,  509164 ) --刪除黃昏R-A
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  509162 ) == true then
							CancelBuff( purple[i] ,  509162 ) --刪除黃昏R-B
							--say (TargetID() , "P_C")
						else
						
						end
						if CheckBuff( purple[i] ,  508925 ) == true then
							CancelBuff( purple[i] ,  508925 ) --刪除黃昏R-C
							--say (TargetID() , "P_C")
						else
						
						end
					--
					AddBuff ( blue[i] , 508611 , 0, -1 )
				--刪除508611以外的Buff--
					if CheckBuff( blue[i] ,  509171 ) == true then
						CancelBuff( blue[i] ,  509171 ) --刪除藍色B-B
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  509173 ) == true then
						CancelBuff( blue[i] ,  509173  ) --刪除藍色B-C
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  509166 ) == true then
						CancelBuff( blue[i] ,  509166 ) --刪除紫色P-A
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  508613 ) == true then
						CancelBuff( blue[i] ,  508613 ) --刪除紫色P-B
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  509168 ) == true then
						CancelBuff( blue[i] ,  509168 ) --刪除紫色P-C
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  509164 ) == true then
						CancelBuff( Tblue[i] ,  509164 ) --刪除黃昏R-A
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  509162 ) == true then
						CancelBuff( blue[i] ,  509162 ) --刪除黃昏R-B
						--say (TargetID() , "B_A")
					else
					
					end
					if CheckBuff( blue[i] ,  508925 ) == true then
						CancelBuff( blue[i],  508925 ) --刪除黃昏R-C
						--say (TargetID() , "B_A")
					else
					
					end
				--
					AddBuff ( red[i] , 509162, 0, -1 )
					--刪除509162以外的Buff--
						if CheckBuff( red[i] ,  508611 ) == true then
							CancelBuff( red[i] ,  508611 ) --刪除藍色B-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509171 ) == true then
							CancelBuff( red[i] ,  509171 ) --刪除藍色B-B
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509173 ) == true then
							CancelBuff( red[i] ,  509173  ) --刪除藍色B-C
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509166 ) == true then
							CancelBuff( red[i] ,  509166 ) --刪除紫色P-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  508613 ) == true then
							CancelBuff( red[i] ,  508613 ) --刪除紫色P-B
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509168 ) == true then
							CancelBuff( red[i] ,  509168 ) --刪除紫色P-C
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  509164 ) == true then
							CancelBuff( red[i] ,  509164 ) --刪除黃昏R-A
							--say (TargetID() , "R_B")
						else
						
						end
						if CheckBuff( red[i] ,  508925 ) == true then
							CancelBuff( red[i] ,  508925 ) --刪除黃昏R-C
							--say (TargetID() , "R_B")
						else
						
						end
					--
				end
			end
		end
	end
end




 	