---------------- 一王  104787  cl_762_190001AI  register2

---------------- 三王  104665  lua_sasa_WorldBoss_Counter    register3
---------------- 四王  104623 ic_104622_01  register3
-----start  register2 做成後門
function bk_warone_count()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ownerid()---------------中控器本身
	local opentime=ReadRoleValue(start,EM_RoleValue_register2)----------------------------------控制
	local wartime=3600
	local playcount= 0 ---------------這個zone的副本玩家數量
	local op1 = 0
	local boss1=0 ---王控制器
	local boss2=0 ---王控制器
	local boss3=0 ---王控制器
	local boss4=0 ---王控制器
	local b10=0   ---王控制器讀取的資料
	local b20=0   ---王控制器讀取的資料
	local b30=0   ---王控制器讀取的資料
	local b40=0   ---王控制器讀取的資料
	local mob=0
	local d1 = 0 
	local d2 = 0 
	local d3 = 0 
	local d4 = 0 
	local d5 = 0 
	local d6 = 0 
	local d7 = 0 
	local d8 = 0 
	local d9 = 0 
	local d10 = 0 
	local d11 = 0 
	local d12 = 0 
	local d13 = 0
	local d14 = 0 
	local d15 = 0
	local d16 = 0 
	local gt1=0
	local gt2=0
	local m301=0
	local m302=0
	local m401=0
	local m402=0
	local m501=0
	local m502=0	
	local mm301,mm302,mm401,mm402,mm501,mm502
	local mmm301,mmm302,mmm401,mmm402,mmm501,mmm502
	local b1pid,b2pid,b1op,b2op
	local mcar=0
	local carcount = 0
	local lastdd = 0
	local tx1 = 3600 -----時間計時1hr 
	local tx2 = 300  -----時間計時5分鐘
	local tx3 = 60 -------記時間60秒
	local ggtime = 5
	local ggtalk=0
	while 1 do 
	sleep(10)
		opentime=ReadRoleValue(start,EM_RoleValue_register2)----------------------------------控制改變值
	-------	ClockOpen( OwnerID() , EM_ClockCheckValue_17 ,3600 , 3600 , 0 ,"bk_WAR1_TIMEOVER","bk_war1_tg1") 
		---ScriptMessage( OwnerID() , -1 , 1 , "opentime" , 1 )-------------------------------------攻破了
		if opentime == 1 then  -----戰場關閉 時間到
			if ggtalk == 0 then 
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_190_8]" , 1 )-------------------------------------攻破了
				ggtalk=1
			end
			gt1=gt1+1 
		---	DebugMsg( 0 ,0, "gt1"..gt1 )  
			if gt1>= 3 then 
			----	EndBattleGround( RoomID, -1 )------戰場平手
				playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
					local NpcGID = GetSearchResult()
					if ReadRoleValue( NpcGID , EM_RoleValue_IsDead) == 1 then 
						Revive( NpcGID, 190 , 2364, -8, -2351, 0 )
						AddBuff(NpcGID,508862,0,-1)
					elseif  ReadRoleValue( NpcGID , EM_RoleValue_IsDead) == 0 then 
						AddBuff(NpcGID,508862,0,-1)
						ChangeZone( NpcGID , 190 , RoomID , 2364 , -8, -2351 , 0 )
					end
					ClockClose( NpcGID )
					Lua_bk_warplayerpoint( NpcGID , 55 )
				end 
				sleep(30)
				star_WorldBattle_ScoreCal( 0 , 1 )		--IsWin  回傳勝負條件( 0表示輸，1表示贏 )，MapNumber 回傳是幾號戰場
				CloseBattleGround(RoomID) 
				opentime=9
				WriteRoleValue(start,EM_RoleValue_register2,opentime) ------------寫進去	
			end
			  
		elseif opentime == 2 then   -----戰場關閉 王死光了
			if ggtalk == 0 then 
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_190_7]" , 1 )
			sleep(30)
			ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_190_9]" , 1 )
			ggtalk = 1 
			end
			gt2=gt2+1  
			if gt2>= 30 then   -------------------------------------------------分數計算完離開區域填寫時間
				playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
					local NpcGID = GetSearchResult()
					if ReadRoleValue( NpcGID , EM_RoleValue_IsDead) == 1 then 
						Revive( NpcGID, 190 , 2364, -8, -2351, 0 )
						AddBuff(NpcGID,508862,0,-1)
					elseif  ReadRoleValue( NpcGID , EM_RoleValue_IsDead) == 0 then 
						AddBuff(NpcGID,508862,0,-1)
						ChangeZone( NpcGID , 190 , RoomID , 2364 , -8, -2351 , 0 )
					end
					ClockClose( NpcGID )
					Lua_bk_warplayerpoint( NpcGID , 165 )
				end 
				sleep(30)
				star_WorldBattle_ScoreCal( 1 , 1 )		--IsWin  回傳勝負條件( 0表示輸，1表示贏 )，MapNumber 回傳是幾號戰場
				CloseBattleGround(RoomID) 
				opentime = 9
				WriteRoleValue(start,EM_RoleValue_register2,opentime) ------------寫進去	
			end
		elseif opentime == 0 then  -----戰場打開
			wartime = wartime -1
			ggtime = ggtime - 1 
		------------	yell( OwnerID() ,"wartime="..wartime , 5 )
		---	DebugMsg( 0 ,0, "wartime"..wartime)  
		---	DebugMsg( 0 ,0, "ggtime"..ggtime)  
			if ggtime == 0 then 
				playcount = SetSearchAllPlayer(RoomID)
				for i=1 , playcount do
				local NpcGID = GetSearchResult()
				ClockOpen( NpcGID , EM_ClockCheckValue_18 ,wartime ,wartime , 0 ,"bk_WAR1_TIMEOVER","bk_war1_tg1") 
				---SAY(NpcGID,"123")
				end
				ggtime=10
			end
			if  wartime == 0   then 
				opentime=1
				WriteRoleValue(start,EM_RoleValue_register2,opentime) ------------寫進去	
			end
			if op1 == 0 then --------------------------------戰場開啟旗標把所有的玩家傳出這個副本
				cotime = CreateObjByFlag(105030,780812,9,1)----門一
				SetModeEx( cotime , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( cotime , EM_SetModeType_Mark, false)
				SetModeEx( cotime , EM_SetModeType_HideName, false)
				SetModeEx( cotime , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( cotime , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( cotime , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( cotime , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( cotime , EM_SetModeType_Move, false) ---移動	
				SetModeEx( cotime , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( cotime , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( cotime , EM_SetModeType_Searchenemy, false)
				SetModeEx( cotime , EM_SetModeType_Show, false)
				AddToPartition( cotime , RoomID )
				WriteRoleValue( cotime ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				-----------------------BeginPlot( cotime ,"bk_war1_car0",0)
				
				carcount = CreateObjByFlag(105030,780812,9,1)----門一
				SetModeEx( carcount , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( carcount , EM_SetModeType_Mark, false)
				SetModeEx( carcount , EM_SetModeType_HideName, false)
				SetModeEx( carcount , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( carcount , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( carcount , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( carcount , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( carcount , EM_SetModeType_Move, false) ---移動	
				SetModeEx( carcount , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( carcount , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( carcount , EM_SetModeType_Searchenemy, false)
				SetModeEx( carcount , EM_SetModeType_Show, false)
				AddToPartition( carcount , RoomID )
				WriteRoleValue( carcount ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( carcount ,"bk_war1_car0",0)
				
				d1 = CreateObjByFlag(104774,780812,1,1)----門一
				SetModeEx( d1 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d1 , EM_SetModeType_Mark, true)
				SetModeEx( d1 , EM_SetModeType_HideName, true)
				SetModeEx( d1 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d1 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d1 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d1 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d1 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d1 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( d1 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d1 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d1 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d1 , EM_SetModeType_Show, true)
				AddToPartition( d1 , RoomID )
				---AddBuff(d1,508120,1,-1)
				AddBuff(d1,508111,1,-1)
				AddBuff(d1,508298,0,-1)
				WriteRoleValue( d1 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				SetPlot( d1 , "dead" , "bk_war1_d01_dead" , 0 )
								
				d2 = CreateObjByFlag(104774,780776,1,1)----門二   -----這個門死 出3王
				SetModeEx( d2 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d2 , EM_SetModeType_Mark, true)
				SetModeEx( d2 , EM_SetModeType_HideName, false)
				SetModeEx( d2 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d2 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d2 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d2 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d2 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d2 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d2 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d2 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d2 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d2 , EM_SetModeType_Show, true)
				AddToPartition( d2 , RoomID )
				WriteRoleValue( d2 ,EM_RoleValue_PID,780776)	---- 在王身上放入控制器id
				WriteRoleValue( d2 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( d2 ,"Un_190_AllDoor_1",0)
				SetPlot( d2 , "dead" , "Un_190_AllDoordead_boss3" , 0 )
				---AddBuff(d2,508120,1,-1)
				AddBuff(d2,508111,1,-1)
				
				d3 = CreateObjByFlag(104774,780781,1,1)----野外boss開場就出來
				SetModeEx( d3 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d3 , EM_SetModeType_Mark, true)
				SetModeEx( d3 , EM_SetModeType_HideName, false)
				SetModeEx( d3 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d3 , EM_SetModeType_NotShowHPMP,true)
				SetModeEx( d3 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d3 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d3 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d3 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d3 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d3 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d3 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d3 , EM_SetModeType_Show, true)
				AddToPartition( d3 , RoomID )
				WriteRoleValue( d3 ,EM_RoleValue_PID,780781)	---- 在王身上放入控制器id
				WriteRoleValue( d3 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( d3 ,"Un_190_AllDoor_1",0)
				SetPlot( d3 , "dead" , "Un_190_AllDoordead" , 0 )
			---	AddBuff(d3,508120,1,-1)
				AddBuff(d3,508111,1,-1)
				
				d4 = CreateObjByFlag(104774,780780,1,1)----野外boss開場就出來
				SetModeEx( d4 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d4 , EM_SetModeType_Mark, true)
				SetModeEx( d4 , EM_SetModeType_HideName, false)
				SetModeEx( d4 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d4 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d4 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d4 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d4 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d4 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d4 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d4 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d4 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d4 , EM_SetModeType_Show, true)
				AddToPartition( d4 , RoomID )
				WriteRoleValue( d4 ,EM_RoleValue_PID,780780)	---- 在王身上放入控制器id
				WriteRoleValue( d4 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( d4 ,"Un_190_AllDoor_1",0)
				SetPlot( d4 , "dead" , "Un_190_AllDoordead" , 0 )
			---	AddBuff(d4,508120,1,-1)
				AddBuff(d4,508111,1,-1)
				
				d5 = CreateObjByFlag(104774,780783,1,1)----野外boss開場就出來
				SetModeEx( d5 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d5 , EM_SetModeType_Mark, true)
				SetModeEx( d5 , EM_SetModeType_HideName, false)
				SetModeEx( d5 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d5 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d5 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d5 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d5 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d5 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d5 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d5 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d5 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d5 , EM_SetModeType_Show, true)
				AddToPartition( d5 , RoomID )
				WriteRoleValue( d5 ,EM_RoleValue_PID,780783)	---- 在王身上放入控制器id
				WriteRoleValue( d5 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( d5 ,"Un_190_AllDoor_1",0)
				SetPlot( d5 , "dead" , "Un_190_AllDoordead" , 0 )
			---	AddBuff(d5,508120,1,-1)
				AddBuff(d5,508111,1,-1)
				
				d6 = CreateObjByFlag(104774,780786,1,1)----這個門死衝車不在出
				SetModeEx( d6 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d6 , EM_SetModeType_Mark, true)
				SetModeEx( d6 , EM_SetModeType_HideName, false)
				SetModeEx( d6 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d6 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d6 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d6 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d6 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d6 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d6 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d6 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d6 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d6 , EM_SetModeType_Show, true)
				AddToPartition( d6 , RoomID )
				WriteRoleValue( d6 ,EM_RoleValue_PID,780786)	---- 在王身上放入控制器id
				WriteRoleValue( d6 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( d6 ,"Un_190_AllDoor_1",0)
				SetPlot( d6 , "dead" , "bk_war1_door0" , 0 )
			---	AddBuff(d6,508120,1,-1)
				AddBuff(d6,508111,1,-1)
				
				
				d7 = CreateObjByFlag(104774,780785,1,1)----野外boss開場就出來
				SetModeEx( d7 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d7 , EM_SetModeType_Mark, true)
				SetModeEx( d7 , EM_SetModeType_HideName, false)
				SetModeEx( d7 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d7 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d7 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d7 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d7 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d7 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d7 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d7 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d7 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d7 , EM_SetModeType_Show, true)
				AddToPartition( d7 , RoomID )
				WriteRoleValue( d7 ,EM_RoleValue_PID,780785)	---- 在王身上放入控制器id
				WriteRoleValue( d7 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( d7 ,"Un_190_AllDoor_1",0)
				SetPlot( d7, "dead" , "bk_war1_door0" , 0 )
			---	AddBuff(d7,508120,1,-1)
				AddBuff(d7,508111,1,-1)
				
				d8 = CreateObjByFlag(104774,780784,1,1)----野外boss開場就出來
				SetModeEx( d8 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d8 , EM_SetModeType_Mark, true)
				SetModeEx( d8 , EM_SetModeType_HideName, false)
				SetModeEx( d8 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d8 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d8 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d8 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d8 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d8 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d8 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d8 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d8 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d8 , EM_SetModeType_Show, true)
				AddToPartition( d8 , RoomID )
				WriteRoleValue( d8 ,EM_RoleValue_PID,780784)	---- 在王身上放入控制器id
				WriteRoleValue( d8 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( d8 ,"Un_190_AllDoor_1",0)
				SetPlot( d8 , "dead" , "Un_190_AllDoordead" , 0 )
				---AddBuff(d8,508120,1,-1)
				AddBuff(d8,508111,1,-1)
				
				d9 = CreateObjByFlag(104774,780782,1,1)----野外boss開場就出來
				SetModeEx( d9 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d9 , EM_SetModeType_Mark, true)
				SetModeEx( d9 , EM_SetModeType_HideName, false)
				SetModeEx( d9 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d9 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d9 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d9 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d9 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d9 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d9 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d9 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d9 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d9 , EM_SetModeType_Show, true)
				AddToPartition( d9 , RoomID )
				WriteRoleValue( d9 ,EM_RoleValue_PID,780782)	---- 在王身上放入控制器id
				WriteRoleValue( d9 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( d9 ,"Un_190_AllDoor_1",0)
				SetPlot( d9 , "dead" , "Un_190_AllDoordead" , 0 )
				---AddBuff(d9,508120,1,-1)
				AddBuff(d9,508111,1,-1)
				
				d10 = CreateObjByFlag(104774,780778,1,1)----門出出2王
				SetModeEx( d10 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d10 , EM_SetModeType_Mark, true)
				SetModeEx( d10 , EM_SetModeType_HideName, false)
				SetModeEx( d10 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d10 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d10 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d10 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d10 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d10 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d10 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d10 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d10 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d10 , EM_SetModeType_Show, true)
				AddToPartition( d10 , RoomID )
				WriteRoleValue( d10 ,EM_RoleValue_PID,780778)	---- 在王身上放入控制器id
				WriteRoleValue( d10 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( d10 ,"Un_190_AllDoor_1",0)
				SetPlot( d10 , "dead" , "Un_190_AllDoordead_boss2" , 0 )
				---AddBuff(d10,508120,1,-1)
				AddBuff(d10,508111,1,-1)
				
				d11 = CreateObjByFlag(104774,780779,1,1)----野外boss開場就出來
				SetModeEx( d11 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d11 , EM_SetModeType_Mark, true)
				SetModeEx( d11 , EM_SetModeType_HideName, false)
				SetModeEx( d11 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d11 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d11 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d11 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d11 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d11 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d11 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d11 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d11 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d11 , EM_SetModeType_Show, true)
				AddToPartition( d11 , RoomID )
				WriteRoleValue( d11 ,EM_RoleValue_PID,780779)	---- 在王身上放入控制器id
				WriteRoleValue( d11 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				BeginPlot( d11 ,"Un_190_AllDoor_1",0)
				SetPlot( d11 , "dead" , "Un_190_AllDoordead" , 0 )
				---AddBuff(d11,508120,1,-1)
				AddBuff(d11,508111,1,-1)
				
				
				d12 = CreateObjByFlag(104774,780812,2,1)----野外boss開場就出來
				SetModeEx( d12 , EM_SetModeType_Gravity, false) ---重力
				SetModeEx( d12 , EM_SetModeType_Mark, true)
				SetModeEx( d12 , EM_SetModeType_HideName, true)
				SetModeEx( d12 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( d12 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( d12 , EM_SetModeType_Obstruct, true)   -----重力
				SetModeEx( d12 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d12 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d12 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( d12 , EM_SetModeType_DisableRotate, true )--轉向
				SetModeEx( d12 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d12 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d12 , EM_SetModeType_Show, true)
				AddToPartition( d12 , RoomID )
				---AddBuff(d12,508120,1,-1)
				AddBuff(d12,508111,1,-1)
				AddBuff(d12,508298,0,-1)
				WriteRoleValue( d12 ,EM_RoleValue_register1,start)	---- 在王身上放入控制器id
				SetPlot( d12 , "dead" , "bk_war1_d12_dead" , 0 )
															
				boss1 = CreateObjByFlag(104787,780812,3,1)----
				SetModeEx( boss1 , EM_SetModeType_Mark, false)
				SetModeEx( boss1 , EM_SetModeType_HideName, false)
				SetModeEx( boss1 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( boss1 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( boss1 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( boss1 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( boss1 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( boss1 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( boss1 , EM_SetModeType_Searchenemy, false)
				SetModeEx( boss1 , EM_SetModeType_Show, false)
				AddToPartition( boss1 , RoomID )
				BeginPlot( boss1 ,"cl_762_190001AI",0)
							
			    m301 = CreateObjByFlag(117097,780812,12,1)----
				SetModeEx( m301 , EM_SetModeType_Mark, true)
				SetModeEx( m301 , EM_SetModeType_HideName, false)
				SetModeEx( m301 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( m301 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( m301 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( m301 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( m301 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( m301 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( m301 , EM_SetModeType_Searchenemy, false)
				SetModeEx( m301 , EM_SetModeType_Show, true)
				AddToPartition( m301 , RoomID )
				WriteRoleValue(m301,EM_RoleValue_PID,ownerid())
				
				m302 = CreateObjByFlag(117098,780812,13,1)----
				SetModeEx( m302 , EM_SetModeType_Mark, true)
				SetModeEx( m302 , EM_SetModeType_HideName, false)
				SetModeEx( m302 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( m302 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( m302 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( m302 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( m302 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( m302 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( m302 , EM_SetModeType_Searchenemy, false)
				SetModeEx( m302 , EM_SetModeType_Show, true)
				AddToPartition( m302 , RoomID )
				WriteRoleValue(m302,EM_RoleValue_PID,ownerid())
				
				m401 = CreateObjByFlag(117099,780812,14,1)----
				SetModeEx( m401 , EM_SetModeType_Mark, true)
				SetModeEx( m401 , EM_SetModeType_HideName, false)
				SetModeEx( m401 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( m401 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( m401 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( m401 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( m401 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( m401 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( m401 , EM_SetModeType_Searchenemy, false)
				SetModeEx( m401 , EM_SetModeType_Show, true)
				AddToPartition( m401 , RoomID )
				WriteRoleValue(m401,EM_RoleValue_PID,ownerid())
				
				m402 = CreateObjByFlag(117100,780812,15,1)----
				SetModeEx( m402 , EM_SetModeType_Mark, true)
				SetModeEx( m402 , EM_SetModeType_HideName, false)
				SetModeEx( m402 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( m402 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( m402 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( m402 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( m402 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( m402 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( m402 , EM_SetModeType_Searchenemy, false)
				SetModeEx( m402 , EM_SetModeType_Show, true)
				AddToPartition( m402 , RoomID )
				WriteRoleValue(m402,EM_RoleValue_PID,ownerid())
				
				m501 = CreateObjByFlag(117101,780812,16,1)----
				SetModeEx( m501 , EM_SetModeType_Mark, true)
				SetModeEx( m501 , EM_SetModeType_HideName, false)
				SetModeEx( m501 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( m501 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( m501 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( m501 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( m501 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( m501 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( m501 , EM_SetModeType_Searchenemy, false)
				SetModeEx( m501 , EM_SetModeType_Show, true)
				AddToPartition( m501 , RoomID )
				WriteRoleValue(m501,EM_RoleValue_PID,ownerid())
				
				m502 = CreateObjByFlag(117102,780812,17,1)----
				SetModeEx( m502 , EM_SetModeType_Mark, true)
				SetModeEx( m502 , EM_SetModeType_HideName, false)
				SetModeEx( m502 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( m502 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( m502 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( m502 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( m502 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( m502 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( m502 , EM_SetModeType_Searchenemy, false)
				SetModeEx( m502 , EM_SetModeType_Show, true)
				AddToPartition( m502 , RoomID )
				WriteRoleValue(m502,EM_RoleValue_PID,ownerid())
				
				--[[mm301 = CreateObjByFlag(105011,780812,18,1)----
				SetModeEx( mm301 , EM_SetModeType_Mark, true)
				SetModeEx( mm301 , EM_SetModeType_HideName, false)
				SetModeEx( mm301 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mm301 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mm301 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mm301 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mm301 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mm301 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mm301 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mm301 , EM_SetModeType_Show, true)
				AddToPartition( mm301 , RoomID )
				
				mm302 = CreateObjByFlag(105011,780812,19,1)----
				SetModeEx( mm302 , EM_SetModeType_Mark, true)
				SetModeEx( mm302 , EM_SetModeType_HideName, false)
				SetModeEx( mm302 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mm302 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mm302 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mm302 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mm302 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mm302 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mm302 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mm302 , EM_SetModeType_Show, true)
				AddToPartition( mm302 , RoomID )
				
				mm401 = CreateObjByFlag(105011,780812,20,1)----
				SetModeEx( mm401 , EM_SetModeType_Mark, true)
				SetModeEx( mm401 , EM_SetModeType_HideName, false)
				SetModeEx( mm401 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mm401 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mm401 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mm401 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mm401 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mm401 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mm401 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mm401 , EM_SetModeType_Show, true)
				AddToPartition( mm401 , RoomID )
				
				mm402 = CreateObjByFlag(105011,780812,21,1)----
				SetModeEx( mm402 , EM_SetModeType_Mark, true)
				SetModeEx( mm402 , EM_SetModeType_HideName, false)
				SetModeEx( mm402 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mm402 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mm402 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mm402 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mm402 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mm402 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mm402 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mm402 , EM_SetModeType_Show, true)
				AddToPartition( mm402 , RoomID )
				
				mm501 = CreateObjByFlag(105011,780812,22,1)----
				SetModeEx( mm501 , EM_SetModeType_Mark, true)
				SetModeEx( mm501 , EM_SetModeType_HideName, false)
				SetModeEx( mm501 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mm501 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mm501 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mm501 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mm501 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mm501 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mm501 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mm501 , EM_SetModeType_Show, true)
				AddToPartition( mm501 , RoomID )
				
				mm502 = CreateObjByFlag(105011,780812,23,1)----
				SetModeEx( mm502 , EM_SetModeType_Mark, true)
				SetModeEx( mm502 , EM_SetModeType_HideName, false)
				SetModeEx( mm502 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mm502 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mm502 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mm502 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mm502 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mm502 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mm502 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mm502 , EM_SetModeType_Show, true)
				AddToPartition( mm502 , RoomID )
				
				mmm301 = CreateObjByFlag(116948,780812,24,1)----
				SetModeEx( mmm301 , EM_SetModeType_Mark, true)
				SetModeEx( mmm301 , EM_SetModeType_HideName, false)
				SetModeEx( mmm301 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mmm301 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mmm301 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mmm301 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mmm301 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mmm301 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mmm301 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mmm301 , EM_SetModeType_Show, true)
				AddToPartition( mmm301 , RoomID )
				
				mmm302 = CreateObjByFlag(116948,780812,25,1)----
				SetModeEx( mmm302 , EM_SetModeType_Mark, true)
				SetModeEx( mmm302 , EM_SetModeType_HideName, false)
				SetModeEx( mmm302 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mmm302 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mmm302 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mmm302 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mmm302 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mmm302 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mmm302 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mmm302 , EM_SetModeType_Show, true)
				AddToPartition( mmm302 , RoomID )
				
				mmm401 = CreateObjByFlag(116948,780812,26,1)----
				SetModeEx( mmm401 , EM_SetModeType_Mark, true)
				SetModeEx( mmm401 , EM_SetModeType_HideName, false)
				SetModeEx( mmm401 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mmm401 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mmm401 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mmm401 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mmm401 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mmm401 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mmm401 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mmm401 , EM_SetModeType_Show, true)
				AddToPartition( mmm401 , RoomID )
				
				mmm402 = CreateObjByFlag(116948,780812,27,1)----
				SetModeEx( mmm402 , EM_SetModeType_Mark, true)
				SetModeEx( mmm402 , EM_SetModeType_HideName, false)
				SetModeEx( mmm402 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mmm402 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mmm402 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mmm402 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mmm402 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mmm402 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mmm402 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mmm402 , EM_SetModeType_Show, true)
				AddToPartition( mmm402 , RoomID )
				
				mmm501 = CreateObjByFlag(116948,780812,28,1)----
				SetModeEx( mmm501 , EM_SetModeType_Mark, true)
				SetModeEx( mmm501 , EM_SetModeType_HideName, false)
				SetModeEx( mmm501 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mmm501 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mmm501 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mmm501 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mmm501 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mmm501 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mmm501 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mmm501 , EM_SetModeType_Show, true)
				AddToPartition( mmm501 , RoomID )
				
				mmm502 = CreateObjByFlag(116948,780812,29,1)----
				SetModeEx( mmm502 , EM_SetModeType_Mark, true)
				SetModeEx( mmm502 , EM_SetModeType_HideName, false)
				SetModeEx( mmm502 , EM_SetModeType_ShowRoleHead, true)
				SetModeEx( mmm502 , EM_SetModeType_NotShowHPMP, true)
				SetModeEx( mmm502 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mmm502 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mmm502 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mmm502 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mmm502 , EM_SetModeType_Searchenemy, false)
				SetModeEx( mmm502 , EM_SetModeType_Show, true)
				AddToPartition( mmm502 , RoomID )]]--
				
				mcar = CreateObjByFlag(105012,780831,0,1)----
				SetModeEx( mcar , EM_SetModeType_Mark, false)
				SetModeEx( mcar , EM_SetModeType_HideName, false)
				SetModeEx( mcar , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( mcar , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( mcar , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mcar , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mcar , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mcar , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( mcar , EM_SetModeType_Searchenemy, false)
				SetModeEx( mcar , EM_SetModeType_Show, false)
				AddToPartition( mcar , RoomID )
				BeginPlot( mcar ,"un_zone190_care6",0)
				
				op1= 1 
			elseif op1== 1 then 	
				---戰場開始了記時時間結束
				b1pid= ReadRoleValue(boss2,EM_RoleValue_register1)-----------------
				b2pid= ReadRoleValue(boss3,EM_RoleValue_register7)-----------------
				p1op=  ReadRoleValue(boss2,EM_RoleValue_register5)-----------------
				b2op=  ReadRoleValue(boss3,EM_RoleValue_register6)-----------------
				WriteRoleValue(mcar,EM_RoleValue_register1,b1pid) ------------寫進去
				WriteRoleValue(mcar,EM_RoleValue_register2,b2pid) ------------寫進去	
				b10=ReadRoleValue(boss1,EM_RoleValue_register2)-----------------
				b20=ReadRoleValue(boss2,EM_RoleValue_register3)-----------------
				b30=ReadRoleValue(boss3,EM_RoleValue_register3)-----------------
				b40=ReadRoleValue(boss4,EM_RoleValue_register3)-----------------
				mob=ReadRoleValue(start,EM_RoleValue_register1)-----------------記錄階段
			--	DebugMsg( 0 ,0, "b10="..b10 )  
			--	DebugMsg( 0 ,0, "b20="..b20 )  
			--DebugMsg( 0 ,0, "b30="..b30 )  
			--	DebugMsg( 0 ,0, "b40="..b40 )  
			---	DebugMsg( 0 ,0, "mob="..mob )  
				if b10 == 1 then ---一王死亡我需要開門
					if mob > 3 then 
						local bossopen1 = CreateObjByFlag(102678,780812,7,1)----野外boss開場就出來
						SetModeEx( bossopen1 , EM_SetModeType_Mark, false)
						SetModeEx( bossopen1 , EM_SetModeType_HideName, false)
						SetModeEx( bossopen1 , EM_SetModeType_ShowRoleHead, false)
						SetModeEx( bossopen1 , EM_SetModeType_NotShowHPMP, false)
						SetModeEx( bossopen1 , EM_SetModeType_Strikback, false) ---反擊
						SetModeEx( bossopen1 , EM_SetModeType_Move, false) ---移動	
						SetModeEx( bossopen1 , EM_SetModeType_Fight, false) ---可砍殺
						SetModeEx( bossopen1 , EM_SetModeType_SearchenemyIgnore, false) 
						SetModeEx( bossopen1 , EM_SetModeType_Searchenemy, false)
						SetModeEx( bossopen1 , EM_SetModeType_Show, false)
						AddToPartition( bossopen1 , RoomID )
						BeginPlot( bossopen1 ,"bk_war_boss1_open",0)
						WriteRoleValue(boss1,EM_RoleValue_register2,3) ------------時間結束告訴王該結束刪除了
					elseif mob < 3 then 
					WriteRoleValue(start,EM_RoleValue_register1,3) ------------時間結束告訴王該結束刪除了		
					WriteRoleValue(boss1,EM_RoleValue_register2,3) ------------時間結束告訴王該結束刪除了	
					end
				end
				if b20 == 1 and b30 == 1 then ---- 二王三王死亡把門打開
					WriteRoleValue(start,EM_RoleValue_register1,9) ------------時間結束告訴王該結束刪除了		
					WriteRoleValue(boss2,EM_RoleValue_register3,3) ------------時間結束告訴王該結束刪除了		
					WriteRoleValue(boss3,EM_RoleValue_register3,3) ------------時間結束告訴王該結束刪除了					
				end
				if b40 == 1 then 	----最後王死了重置
					WriteRoleValue(start,EM_RoleValue_register1,13) ------------時間結束告訴王該結束刪除了	
					WriteRoleValue(boss4,EM_RoleValue_register3,3) ------------時間結束告訴王該結束刪除了
					opentime= 2
					WriteRoleValue(start,EM_RoleValue_register2,opentime) ------------寫進去	
				end
				if 	mob==1 then ------------------------------門開了
					-----------------------------把衝車關掉
					WriteRoleValue(start,EM_RoleValue_register1,2)
					ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_190_1]" , 1 )-------------------------------------攻破了
				elseif mob == 2 then 
				------------衝車關掉下一階段
				elseif mob == 3  then 
				------------1王死出現門
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_190_2]" , 1 )-------------------------------------攻破了
				WriteRoleValue(start,EM_RoleValue_register1,4) ------------
				d13 = CreateObjByFlag(102678,780812,7,1)----野外boss開場就出來
				SetModeEx( d13 , EM_SetModeType_Mark, false)
				SetModeEx( d13 , EM_SetModeType_HideName, false)
				SetModeEx( d13 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( d13 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( d13 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d13 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d13 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( d13 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d13 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d13 , EM_SetModeType_Show, false)
				AddToPartition( d13 , RoomID )
				SetPlot( d13 , "Collision" , "bk_war1_door13_out" , 0 )
				
				d14 = CreateObjByFlag(102678,780812,8,1)----野外boss開場就出來
				SetModeEx( d14 , EM_SetModeType_Mark, false)
				SetModeEx( d14 , EM_SetModeType_HideName, false)
				SetModeEx( d14 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( d14 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( d14 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d14 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d14 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( d14 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d14 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d14 , EM_SetModeType_Show, false)
				AddToPartition( d14 , RoomID )
				SetPlot( d14 , "Collision" , "bk_war1_door13_enter" , 0 )
				
				d15=CreateObj( 112224 ,-6510.8, 112 , -2967.6, 334 , 1)
			---	d15 = CreateObjByFlag(112224,780812,7,1)----野外boss開場就出來
				SetModeEx( d15 , EM_SetModeType_Mark, false)
				SetModeEx( d15 , EM_SetModeType_HideName, true)
				SetModeEx( d15 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( d15 , EM_SetModeType_Gravity, false)
				SetModeEx( d15 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( d15 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d15 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d15 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( d15 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d15 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d15 , EM_SetModeType_Show, true)
				AddToPartition( d15 , RoomID )
				
				d16=CreateObj( 112224 ,2169.3, 10 , -2595.8, 207 , 1)
			---	d16 = CreateObjByFlag(112224,780812,8,1)----野外boss開場就出來
				SetModeEx( d16 , EM_SetModeType_Mark, false)
				SetModeEx( d16 , EM_SetModeType_HideName, true)
				SetModeEx( d16 , EM_SetModeType_Gravity, false)
				SetModeEx( d16 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( d16 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( d16 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( d16 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( d16 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( d16 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( d16 , EM_SetModeType_Searchenemy, false)
				SetModeEx( d16 , EM_SetModeType_Show, true)
				AddToPartition( d16 , RoomID )
							
				elseif mob == 4 then 
				------------1王的傳送門已經開出來
				
				elseif mob == 5 then 
				------------門2打開出現2王
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_190_3]" , 1 )-------------------------------------攻破了
				boss2 = CreateObjByFlag(104902,780812,4,1)----
				SetModeEx( boss2 , EM_SetModeType_Mark, false)
				SetModeEx( boss2 , EM_SetModeType_HideName, false)
				SetModeEx( boss2 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( boss2 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( boss2 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( boss2 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( boss2 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( boss2 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( boss2 , EM_SetModeType_Searchenemy, false)
				SetModeEx( boss2 , EM_SetModeType_Show, false)
				AddToPartition( boss2 , RoomID )
				BeginPlot( boss2 ,"lua_Dy_Z190_WWBOSSAIC",0)
				WriteRoleValue(start,EM_RoleValue_register1,6) ------------時間結束告訴王該結束刪除了	
				elseif mob == 6 then 
				------------2王出現中
				elseif mob == 7 then 
				------------門10打開出現3王
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_190_4]" , 1 )-------------------------------------攻破了
				boss3 = CreateObjByFlag(104665,780812,5,1)----
				SetModeEx( boss3 , EM_SetModeType_Mark, false)
				SetModeEx( boss3 , EM_SetModeType_HideName, false)
				SetModeEx( boss3 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( boss3 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( boss3 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( boss3 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( boss3 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( boss3 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( boss3 , EM_SetModeType_Searchenemy, false)
				SetModeEx( boss3 , EM_SetModeType_Show, false)
				AddToPartition( boss3 , RoomID )
				BeginPlot( boss3 ,"lua_sasa_WorldBoss_Counter",0)
				WriteRoleValue(start,EM_RoleValue_register1,8) ------------時間結束告訴王該結束刪除了	
				elseif mob == 8 then 
				------------3王出現中
				elseif mob == 9 then 
				------------2王死亡和3王死亡門1和門12可以被攻擊
				WriteRoleValue(start,EM_RoleValue_register1,10) ------------時間結束告訴王該結束刪除了	
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_190_5]" , 1 )-------------------------------------攻破了
				elseif mob == 10 then 
				------------門1跟門12可以被攻擊中
				SetModeEx( d12 , EM_SetModeType_Fight, true) ---可砍殺
				SetModeEx( d1 , EM_SetModeType_Fight, true) ---可砍殺
				CancelBuff( d1 ,  508298)
				CancelBuff( d12 ,  508298 )
				lastdd=ReadRoleValue(start,EM_RoleValue_register9)-----------------
				----DebugMsg( 0 ,0, "lastdd="..lastdd )  
					if lastdd >= 1 then 
						WriteRoleValue(start,EM_RoleValue_register1,11) ------------時間結束告訴王該結束刪除了	
					end		
				elseif mob == 11 then 
				------------4王出現
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_190_6]" , 1 )-------------------------------------攻破了
				boss4 = CreateObjByFlag(104623,780812,6,1)----
				SetModeEx( boss4 , EM_SetModeType_Mark, false)
				SetModeEx( boss4 , EM_SetModeType_HideName, false)
				SetModeEx( boss4 , EM_SetModeType_ShowRoleHead, false)
				SetModeEx( boss4 , EM_SetModeType_NotShowHPMP, false)
				SetModeEx( boss4 , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( boss4 , EM_SetModeType_Move, false) ---移動	
				SetModeEx( boss4 , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( boss4 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( boss4 , EM_SetModeType_Searchenemy, false)
				SetModeEx( boss4 , EM_SetModeType_Show, false)
				AddToPartition( boss4 , RoomID )
				BeginPlot( boss4 ,"ic_104622_01",0)
				WriteRoleValue(start,EM_RoleValue_register1,12) ------------時間結束告訴王該結束刪除了	
				elseif mob == 12 then 
				------------4王出現中	
				end
			end
		elseif optimo == 9 then 
		
		end
	end
end