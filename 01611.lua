function Lua_apon_102891_check() ---啟動蛇女王表演用
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		sleep(10)
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--將Boss的GID讀出來
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			local PPL = SetSearchAllPlayer(roomid1 )
			for i = 1 , PPL , 1 do ---對每一個玩家上一個「昏睡」
				local ID = GetSearchResult()
				if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 then
					AddBuff (ID , 505222 , 0 , 15)
				end
			end
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_1]" , 1 ) ----遠道而來的訪客啊！你們可曾做過美夢嗎？
			sleep(30)
			WriteRoleValue( Boss, EM_RoleValue_Register5, 1)
			Delobj(OwnerID())
		end
	end	
end

function Lua_apon_102683_Start()
	SetModeEx( OwnerID() , EM_SetModeType_Mark, false) ----標記
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( OwnerID() , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
	SetModeEx( OwnerID() , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( OwnerID() , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false)  ---索敵
	SetModeEx( OwnerID()   , EM_SetModeType_Obstruct, false )--阻擋

	local Step_1 = 1 ----種怪、囚犯
	local Step_2 = 0 ---拉人、關門
	local Step_3 = 0 --- 開始夢境Boss模式
	local Step_4 = 0 ---夢境Boss 之 二
	local Step_5 = 0
	local Step_6 = 0
	local Step_Over = 0
	local Step_Return = 0
	local Check_DK_Num = 0
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Table_jail = {} ----儲存八隻囚犯
	local DK_all = {} ----儲存變成DK的人數
	local DK_all_1 = 0 ---累計 DK 數量用
	local Door_all = {}
	local Table_Dream_show = {} ----儲存表演夢境的特效球
	local Step ---判斷Boss的階段
	local CombatBegin = 0	-------------戰鬥開始判斷
	local king_rebon = 0 -------Boss重置判斷
	
	local Flag_jailer = 780385 ---八隻囚犯用
	local Flag_Timer = 780386 --- 計時器使用
	local Flag_Door = 780387 ---前後門專用
	local Flag_King = 780388 ---Boss 專用
	local Flag_OP = 780389 ----把人拉進來的旗標
	local Flag_OP_die = 780393
	
	local All_jail = {102857,102858,102859,102860,102861,102862,102863,102864} ---八隻囚犯 
	local All_Dreamking = {102850,102851,102852,102853,102854,102855,102856} ---七隻夢境Boss
	local Check_dream = 0
	local dreamking_counter = 0 -----累計三隻夢境王
	local DK_chose = 0
	local JK_chose = 0
	local JA
	local RD_boss
	local SP_1 = 0
	local Over = 1
	local counter_p1_1 = 0   
	local counter_p1_2 = 0
	local counter_p1_3 = 0
	local counter_p1_4 = 0
	
	
	while 1 do 
		sleep(10)
		Step_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register5) ---判斷表演用的
		Step_Return = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ----本體離開戰鬥重置用
		Step_Over = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---Boss 死亡劇情
		
		if Checkbuff(OwnerID(),505228) == true then ----協助蛇女王放技能招分身
			while 1 do
				sleep(10)
				
				Step_Return = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ----本體離開戰鬥重置用
				Step_Over = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---Boss 死亡劇情
				
				if Step_Return == 1 or Step_Over == 1 then ---如果重置的話，要先跳出此迴圈
					break
				end
				
				if Checkbuff(OwnerID(),504826) == true then
					Cancelbuff(OwnerID(),504826)
					local Boss_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
					
					JA = table.getn(Table_jail)
					if JA >= 1 then
						JA = table.getn(Table_jail)
						RD_boss = Rand(JA)+1
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102683_8]" , 1 )---奉上你的肉體！給偉大的蛇女王韓絲翠吧！我的玩物！
						CastSpell( Boss_2 , Boss_2 , 494598) ----表演附體術
						sleep(30)
						local Ball = star_CreateObj( Boss_2 , 102924 , 0 , 0 , 0 , roomid1 , 0) ---生出一個特效球
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
						WriteRoleValue( Ball , EM_RoleValue_IsWalk , 0 )
						WriteRoleValue(Ball, EM_RoleValue_Livetime,5)	
						
						CastSpell( Ball , Table_jail[RD_boss] , 494554)----分身表演爆炸
						table.remove ( Table_jail , RD_boss)
					else
						if Over == 1 then
							Boss_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
							Over = 0
							-----------如果囚犯都死光了，就直接進入狂爆機制------------
							SetFightMode(OwnerID(),0,0,0,0)
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102683_01]" , 1 )---噢！不！我的玩物都被你們這些卑賤的螻蟻破壞了！！
							sleep(10)
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102683_02]" , 1 )--在恐懼之王希爾洛奧斯的凝視之下！
							sleep(10)
							AddBuff (Boss_2 , 505224 , 0 , 600)
							sleep(10)
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102683_03]" , 1 )----成為韓絲翠新的玩物吧！
							sleep(10)
							SetFightMode(OwnerID(),1, 1, 1,1 ) ---將所有的功能開啟
						end
					end
				end
			end
		end
		
		if Step_Over == 1 then
			local Door_end = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
			SetModeEx( Door_end   , EM_SetModeType_Obstruct, false )--阻擋
			SetDefIdleMotion(Door_end,ruFUSION_MIME_IDLE_STAND)----下去
			--PlayMotionEX( Door_end ,  ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop  )
			
			local timer = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
			Delobj(timer)
			
			for i = 1 , table.getn(Table_jail), 1 do
				if Table_jail[i] ~= nil and CheckID(Table_jail[i] ) == true then
					Delobj(Table_jail[i])
				end	
			end
			
			for i = 1 , table.getn(DK_all), 1 do
				if DK_all[i] ~= nil and CheckID(DK_all[i] ) == true then
					Delobj(DK_all[i])
				end	
			end
			
			for i = 1 , table.getn(Table_Dream_show), 1 do
				if Table_Dream_show[i] ~= nil and CheckID(Table_Dream_show[i] ) == true then
					Delobj(Table_Dream_show[i])
				end	
			end
			
			for i = 1 , table.getn(Door_all), 1 do
				if Door_all[i] ~= nil and CheckID(Door_all[i] ) == true then
					Delobj(Door_all[i])
				end	
			end
			sleep(30)
			Delobj(OwnerID())
		end
		
		if Step_Return == 1 then
			local Door_end = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
			SetModeEx( Door_end   , EM_SetModeType_Obstruct, false )--阻擋
			SetDefIdleMotion(Door_end,ruFUSION_MIME_IDLE_STAND)----下去
			--PlayMotionEX( Door_end ,  ruFUSION_ACTORSTATE_activate_end,ruFUSION_ACTORSTATE_activate_loop  )
			
			local timer = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) 
			Delobj(timer)
			local Boss_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			Delobj(Boss_1)
			local Boss_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
			Delobj(Boss_2)
			
			for i = 1 , table.getn(Table_jail), 1 do
				if Table_jail[i] ~= nil and CheckID(Table_jail[i] ) == true then
					Delobj(Table_jail[i])
				end	
			end
			
			for i = 1 , table.getn(DK_all), 1 do
				if DK_all[i] ~= nil and CheckID(DK_all[i] ) == true then
					Delobj(DK_all[i])
				end	
			end
			
			for i = 1 , table.getn(Table_Dream_show), 1 do
				if Table_Dream_show[i] ~= nil and CheckID(Table_Dream_show[i] ) == true then
					Delobj(Table_Dream_show[i])
				end	
			end
			
			for i = 1 , table.getn(Door_all), 1 do
				if Door_all[i] ~= nil and CheckID(Door_all[i] ) == true then
					Delobj(Door_all[i])
				end	
			end
			
			local Rebon_boss = star_CreateObj( OwnerID() , 102929 , 0 , 0 , 0 , roomid1 , 0)
			sleep(10)
			Delobj(OwnerID())
		end
		
		if Step_1 == 1 then ----AI 的準備工作
			Step_1 = 0
			
			local Door_1 = CreateObjByFlag( 102808 , Flag_Door , 1 , 1 ) ---種下前門，活動門
			SetModeEx( Door_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Door_1 , EM_SetModeType_Mark, false) ----標記
			SetModeEx( Door_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Door_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Door_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Door_1 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
			SetModeEx( Door_1 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( Door_1 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( Door_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			SetModeEx( Door_1   , EM_SetModeType_Obstruct, false )--阻擋
			AddToPartition( Door_1,roomid1 )
			Show(Door_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Door_1)
			table.insert( Door_all , Door_1 ) ----將門存入 table 中
			
			local Door_2 = CreateObjByFlag( 102930 , Flag_Door , 2 , 1 ) ---種下後門
			SetModeEx( Door_2 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Door_2 , EM_SetModeType_Mark, false) ----標記
			SetModeEx( Door_2 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Door_2 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Door_2 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Door_2 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
			SetModeEx( Door_2 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( Door_2 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( Door_2 , EM_SetModeType_Searchenemy, false)  ---索敵
			SetModeEx( Door_2   , EM_SetModeType_Obstruct, true )--阻擋
			AddToPartition( Door_2,roomid1 )
			Show(Door_2,roomid1)
			table.insert( Door_all , Door_2 ) ----將門存入 table 中
			
			for i = 1 , 8 , 1 do ---將八隻囚犯生出來
				Table_jail[i] = CreateObjByFlag( All_jail[i] , Flag_jailer , i , 1 )
				SetModeEx( Table_jail[i] , EM_SetModeType_Show, true)  ----秀出
				SetModeEx( Table_jail[i] , EM_SetModeType_Mark, true) ----標記
				SetModeEx( Table_jail[i] , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( Table_jail[i] , EM_SetModeType_Move, false) ---移動	
				SetModeEx( Table_jail[i] , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( Table_jail[i] , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
				SetModeEx( Table_jail[i] , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
				SetModeEx( Table_jail[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
				SetModeEx( Table_jail[i] , EM_SetModeType_Searchenemy, false)  ---索敵
				AddToPartition( Table_jail[i],roomid1 )
				Show(Table_jail[i],roomid1)
				WriteRoleValue( Table_jail[i], EM_RoleValue_PID, OwnerID()) ---將Boss 的 GID 寫入每一隻怪的 PID 中
			end
			
			local Check_show = star_CreateObj( OwnerID() , 102891 , 0 , 0 , 0 , roomid1 , 0) ----生出判斷表演的特校球
			SetModeEx( Check_show , EM_SetModeType_Mark, false) ----標記
			SetModeEx( Check_show , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
			SetModeEx( Check_show , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Check_show , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Check_show , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Check_show , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
			SetModeEx( Check_show , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( Check_show , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( Check_show , EM_SetModeType_Searchenemy, true)  ---索敵
			AddToPartition( Check_show,roomid1 )
			Show(Check_show,roomid1)
			WriteRoleValue( Check_show, EM_RoleValue_PID, OwnerID())
			
			local Boss_1 = CreateObjByFlag( 102683 , Flag_King , 1 , 1 ) ---觀賞用Boss
			SetModeEx( Boss_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Boss_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Boss_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			SetModeEx( Boss_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Boss_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Boss_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Boss_1   , EM_SetModeType_Obstruct, false )--阻擋
			AddToPartition( Boss_1,roomid1 )
			Show(Boss_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Boss_1)
			sleep(50)
			Step_1 = 0
		end
		
		if Step_2 == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register5, 0)
			Step_3 = 1
			local Boss_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_2]" , 1 ) ----就讓韓絲翠來為各位編織出『永生難忘的美夢』吧！！
			sleep(30)
			CastSpellLV( Boss_1 , Boss_1 , 494551 , 1 ) ---讓Boss呈現夢境模式	
			sleep(40)
			
			local PPL = SetSearchAllPlayer(roomid1 )
			local Flag = 1
			for i = 1 , PPL , 1 do ---把玩家抓入房間用 
				local ID = GetSearchResult()
				if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 then
					SetPosByFlag( ID , Flag_OP , Flag ) 
					Flag = Flag + 1
					if Flag > GetMoveFlagCount(Flag_OP) -1 then
						Flag = 1
					end
				end
			end
			
			----------將自動門加入阻擋，並且升上來-------------------------------------------------------------------
			local Door_start = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
			SetDefIdleMotion( Door_start,ruFUSION_MIME_ACTIVATE_LOOP)------起來
			--PlayMotionEX( Door_start ,  ruFUSION_ACTORSTATE_activate_begin,ruFUSION_ACTORSTATE_activate_loop  )
			SetModeEx( Door_start   , EM_SetModeType_Obstruct, true )--阻擋
		
			for i = 1 , table.getn(Table_jail), 1 do
				if Table_jail[i] ~= nil and CheckID(Table_jail[i] ) == true then
					Table_Dream_show[i] = star_CreateObj( Table_jail[i] , 102894 , 0 , 0 , 0 , roomid1 , 0)---在每一個囚犯的位置生一個透明球
					SetModeEx( Table_Dream_show[i] , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Table_Dream_show[i] , EM_SetModeType_Searchenemy, false)---索敵
					SetModeEx( Table_Dream_show[i] , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Table_Dream_show[i] , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Table_Dream_show[i] , EM_SetModeType_Fight, false) ---可砍殺
					AddBuff (Table_Dream_show[i] , 505130 , 0 , 200)---將每一個特效球上一個夢境特效
					Hide( Table_jail[i] )---將每一隻囚犯隱藏起來
				end	
			end
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_3]" , 1 ) ----好好的享受吧！！我這幾位可愛的小客人！！
			sleep(30)
			SetPosByFlag( Boss_1, 780388 , 3 )
			sleep(10)
		end
		
		if Step_3 == 1 then
			Step_3 = 0
			Step_4 = 1 
			Step_5 = 0
			for i = 1 , table.getn(All_Dreamking), 1 do ---此迴圈是用來從七個夢境Boss中選一個出來使用
				local Chose_DreamKing = Rand(table.getn( All_Dreamking ) ) + 1
				if All_Dreamking[Chose_DreamKing] ~= nil then
					DK_chose = Chose_DreamKing
					----yell(OwnerID(),"123456789"..DK_chose,5)
					break
				end
			end
			
			for i = 1 , table.getn(Table_jail), 1 do ---此迴圈是用來從八個囚犯中找一個來變成上一個迴圈的夢境Boss
				local Chose_jailer = Rand(table.getn( Table_jail ) ) + 1
				if Table_jail[Chose_jailer] ~= nil and CheckID(Table_jail[Chose_jailer] ) == true then
					JK_chose = Chose_jailer
					
					ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_12]" , 1 )----你！就決定是你了！來成為我們這幾位訪客的美夢吧！！
					sleep(25)
					ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_13]" , 1 )----一股詭異的魔力從牢房內瀰漫了出來
					sleep(35)
					----yell(OwnerID(),"123456789"..All_Dreamking[DK_chose],5)
					local DK = star_CreateObj( Table_jail[JK_chose] , All_Dreamking[DK_chose] , 0 , 0 , 0 , roomid1 , 0) ---在目標囚犯的位置生出夢境Boss
					--local DK = star_CreateObj( Table_jail[JK_chose] , 102851 , 0 , 0 , 0 , roomid1 , 0) ---在目標囚犯的位置生出夢境Boss
					dreamking_counter = dreamking_counter + 1
					--WriteRoleValue( DK, EM_RoleValue_PID, Table_jail[Chose_jailer]) ---把囚犯的GID 寫入該夢境Boss的 PID 中，以方便當夢境Boss死的時候，kill 囚犯
					WriteRoleValue( DK, EM_RoleValue_Register1, OwnerID()) -----把Boss的GID存入Register1
					table.insert( DK_all , DK ) ----將夢境王存入table中
					WriteRoleValue(Table_jail[JK_chose], EM_RoleValue_Livetime,5)----將被選中的犯人，5秒後，則會殺死自己
					DK_all_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)-----累計生出夢境Boss的數量  
					WriteRoleValue( OwnerID(), EM_RoleValue_Register6, DK_all_1+1)
					
					table.remove ( Table_jail , JK_chose)
					table.remove ( All_Dreamking , DK_chose)
					break
				end
			end
		end
		
		if Step_4 == 1 and Step_5 == 0 then
			for i = 1 ,185 , 1 do
				sleep(10)
				counter_p1_1 = counter_p1_1 + 1
				counter_p1_2 = counter_p1_2 + 1	
				counter_p1_3 = counter_p1_3 + 1	
				counter_p1_4 = counter_p1_4 + 1
				--say(OwnerID(),"counter_p1_3 == "..counter_p1_3)
				
				Step_Return = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ----本體離開戰鬥重置用
				Check_dream = ReadRoleValue(OwnerID(),EM_RoleValue_Register9) ---用來判斷夢境Boss死亡用
				
				--say(OwnerID(),"Step_Return ="..Step_Return)
				--say(OwnerID(),"Check_dream ="..Check_dream)
				
				if Step_Return == 1 or Step_Over == 1 then ---如果在夢境模式滅團，則跳出這個迴圈
					--say(OwnerID(),"Step_Return_111 ="..Step_Return)
					--say(OwnerID(),"Check_dream_222 ="..Check_dream)
					break
				end
				
				-----------防呆，防止玩家綁魂死後，Boss重置後，玩家一站起來，又馬上被秒殺，需要等待這個迴圈跑完的問題。---------------
				if counter_p1_4 == 25 then
					--say(OwnerID(),"Dai Dai !!")
					local ID = {}
					local ID_2 = {}
					local ID_2_all = 0
					local PPL = SetSearchAllPlayer(roomid1)
					local PPLX = 0
					
					if PPL==0 then
						Addbuff(OwnerID(),505140,0,600)
						Step_5 = 1
						break
					elseif PPL ~= 0 then
						for i = 1 , PPL , 1 do 
							ID[i] = GetSearchResult()
							if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------去檢查裡面的人是否是死人或者gm
								ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or 
								GetDistance( OwnerID(), ID[i]) >=1300 then 
								PPLX=PPLX+1
							else
								table.insert( ID_2 , ID[i] ) 
							end
						end
						Check_ID = table.getn(ID)	
					end
					if PPL<=PPLX then ---------都相等  等於裡面都是死人或者gm  所以重置
						Addbuff(OwnerID(),505140,0,600)
						Step_5 = 1
						break
					end
					counter_p1_4 = 0 
				end
				---------------------------------------------------------
				
				
				-----------做出一個防呆的機制------------
				DK_all_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)-----累計生出夢境Boss的數量  
				if DK_all_1 == 0 and dreamking_counter == 3 then
					Addbuff(OwnerID(),505140,0,600)
					Step_5 = 1
					break
				end
				--------------------------------------------------
				
				if Check_dream == 1 then
					--WriteRoleValue( OwnerID(), EM_RoleValue_Register9, 0)
					for i = 1 , table.getn(DK_all), 1 do ---重新計算場上有多少夢境王
						if DK_all[i] ~= nil and ReadRoleValue( DK_all[i] , EM_RoleValue_IsDead) == 1 then
							table.remove ( DK_all , i)
						end	
					end
					Check_DK_Num = table.getn(DK_all)
					sleep(10)
				end
				
				if Check_dream == 1 and Check_DK_Num == 0 then ---如果夢境Boss死亡 and 場上沒有任何一隻夢境Boss
					Check_dream = 0
					if dreamking_counter >= 3 then
						Addbuff(OwnerID(),505140,0,600)
						Step_5 = 1
						break
					end
					
					for i = 1 , table.getn(All_Dreamking), 1 do ---此迴圈是用來從七個夢境Boss中選一個出來使用
						local Chose_DreamKing = Rand(table.getn( All_Dreamking ) ) + 1
						if All_Dreamking[Chose_DreamKing] ~= nil then
							DK_chose = Chose_DreamKing
							break
						end
					end
					
					for i = 1 , table.getn(Table_jail), 1 do ---此迴圈是用來從八個囚犯中找一個來變成上一個迴圈的夢境Boss
						local Chose_jailer = Rand(table.getn( Table_jail ) ) + 1
						if Table_jail[Chose_jailer] ~= nil and CheckID(Table_jail[Chose_jailer] ) == true then
							JK_chose = Chose_jailer
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_17]" , 1 )---唉....又玩壞了一個....
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_14]" , 1 )----美夢的時刻總是容易消逝！
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_15]" , 1 )----不如，就讓韓絲翠再為各位編織一段吧！！
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_12]" , 1 )----你！就決定是你了！來成為我們這幾位訪客的美夢吧！！
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_13]" , 1 )----一股詭異的魔力從牢房內瀰漫了出來
							sleep(35)
							
							local DK = star_CreateObj( Table_jail[JK_chose] , All_Dreamking[DK_chose] , 0 , 0 , 0 , roomid1 , 0) ---在目標囚犯的位置生出夢境Boss 
							
							dreamking_counter = dreamking_counter + 1
							WriteRoleValue(Table_jail[JK_chose], EM_RoleValue_Livetime,5) ----將被選中的犯人，5秒後，則會殺死自己
							WriteRoleValue( DK, EM_RoleValue_Register1, OwnerID()) -----把Boss的GID存入Register1
							table.insert( DK_all , DK ) ----將夢境王存入table中
							
							DK_all_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)-----累計生出夢境Boss的數量  
							WriteRoleValue( OwnerID(), EM_RoleValue_Register6, DK_all_1+1)
							
							table.remove ( Table_jail , JK_chose)
							table.remove ( All_Dreamking , DK_chose)
							break
						end
					end
					
				elseif counter_p1_1 == 60 and dreamking_counter <= 2 then ---時間到，則再生一隻出場，原本60秒
					if dreamking_counter >= 3 then
						--WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 1) ----對Boss做出一個判斷開始進入戰鬥的Buff
						Addbuff(OwnerID(),505140,0,60)
						Step_5 = 1
						break
					end
					
					for i = 1 , table.getn(All_Dreamking), 1 do ---此迴圈是用來從七個夢境Boss中選一個出來使用
						local Chose_DreamKing = Rand(table.getn( All_Dreamking ) ) + 1
						if All_Dreamking[Chose_DreamKing] ~= nil then
							DK_chose = Chose_DreamKing
							break
						end
					end
					
					for i = 1 , table.getn(Table_jail), 1 do ---此迴圈是用來從八個囚犯中找一個來變成上一個迴圈的夢境Boss
						local Chose_jailer = Rand(table.getn( Table_jail ) ) + 1
						if Table_jail[Chose_jailer] ~= nil and CheckID(Table_jail[Chose_jailer] ) == true then
							JK_chose = Chose_jailer
							
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_17]" , 1 )---唉....又玩壞了一個....
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_14]" , 1 )----美夢的時刻總是容易消逝！
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_15]" , 1 )----不如，就讓韓絲翠再為各位編織一段吧！！
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_12]" , 1 )----你！就決定是你了！來成為我們這幾位訪客的美夢吧！！
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_13]" , 1 )----一股詭異的魔力從牢房內瀰漫了出來
							sleep(35)
							
							local DK = star_CreateObj( Table_jail[JK_chose] , All_Dreamking[DK_chose] , 0 , 0 , 0 , roomid1 , 0) ---在目標囚犯的位置生出夢境Boss 
							dreamking_counter = dreamking_counter + 1
							WriteRoleValue( DK, EM_RoleValue_Register1, OwnerID()) -----把Boss的GID存入Register1
							table.insert( DK_all , DK ) ----將夢境王存入table中
							WriteRoleValue(Table_jail[JK_chose], EM_RoleValue_Livetime,5)----將被選中的犯人，5秒後，則會殺死自己
							DK_all_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)-----累計生出夢境Boss的數量  
							WriteRoleValue( OwnerID(), EM_RoleValue_Register6, DK_all_1+1)
							
							table.remove ( Table_jail , JK_chose)
							table.remove ( All_Dreamking , DK_chose)
							break
						end
					end
					
				elseif counter_p1_2 == 120 and dreamking_counter <= 2 then ---時間到，則再生一隻出場，原本120秒
					if dreamking_counter >= 3 then
						--WriteRoleValue( OwnerID(), EM_RoleValue_Register6, 1) ----對Boss做出一個判斷開始進入戰鬥的Buff
						Addbuff(OwnerID(),505140,0,60)
						Step_5 = 1
						break
					end
					
					for i = 1 , table.getn(All_Dreamking), 1 do ---此迴圈是用來從七個夢境Boss中選一個出來使用
						local Chose_DreamKing = Rand(table.getn( All_Dreamking ) ) + 1
						if All_Dreamking[Chose_DreamKing] ~= nil then
							DK_chose = Chose_DreamKing
							break
						end
					end
					
					for i = 1 , table.getn(Table_jail), 1 do ---此迴圈是用來從八個囚犯中找一個來變成上一個迴圈的夢境Boss
						local Chose_jailer = Rand(table.getn( Table_jail ) ) + 1
						if Table_jail[Chose_jailer] ~= nil and CheckID(Table_jail[Chose_jailer] ) == true then
							JK_chose = Chose_jailer
							
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_17]" , 1 )---唉....又玩壞了一個....
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_14]" , 1 )----美夢的時刻總是容易消逝！
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_15]" , 1 )----不如，就讓韓絲翠再為各位編織一段吧！！
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_12]" , 1 )----你！就決定是你了！來成為我們這幾位訪客的美夢吧！！
							sleep(25)
							ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_13]" , 1 )----一股詭異的魔力從牢房內瀰漫了出來
							sleep(35)
							
							local DK = star_CreateObj( Table_jail[JK_chose] , All_Dreamking[DK_chose] , 0 , 0 , 0 , roomid1 , 0) ---在目標囚犯的位置生出夢境Boss 
							
							dreamking_counter = dreamking_counter + 1
							WriteRoleValue( DK, EM_RoleValue_Register1, OwnerID()) -----把Boss的GID存入Register1
							table.insert( DK_all , DK ) ----將夢境王存入table中
							WriteRoleValue(Table_jail[JK_chose], EM_RoleValue_Livetime,5)----將被選中的犯人，5秒後，則會殺死自己
							DK_all_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)-----累計生出夢境Boss的數量  
							WriteRoleValue( OwnerID(), EM_RoleValue_Register6, DK_all_1+1)
							
							table.remove ( Table_jail , JK_chose)
							table.remove ( All_Dreamking , DK_chose)
							break
						end
					end
				elseif counter_p1_3 == 180 then ---時間到，此夢境迴圈結束，原本180秒
					Addbuff(OwnerID(),505140,0,60)
					Step_5 = 1
					break
				end
			end
		end
		
		if Step_5 == 1 or CheckBuff(OwnerID(),505140) == true then
			Step_4 = 0
			Step_5 = 0
			CancelBuff(OwnerID(),505140)
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_4]" , 1 ) ----看了看各位的外貌！這世上應該也只有『米杜莎』可以和各位相提並論！！
			sleep(25)
			local Boss_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
			Delobj(Boss_1)
			
			local Boss_2 = CreateObjByFlag( 102683 , Flag_King , 3 , 1 ) ---Fight 用 Boss
			SetModeEx( Boss_2 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Boss_2 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Boss_2 , EM_SetModeType_Searchenemy, true)  ---索敵
			SetModeEx( Boss_2 , EM_SetModeType_Strikback, true) ---反擊
			SetModeEx( Boss_2 , EM_SetModeType_Move, true) ---移動	
			SetModeEx( Boss_2 , EM_SetModeType_Fight, true) ---可砍殺
			SetModeEx( Boss_2   , EM_SetModeType_Obstruct, false )--阻擋
			AddToPartition( Boss_2,roomid1 )
			Show(Boss_2,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register7, Boss_2)
			WriteRoleValue( Boss_2, EM_RoleValue_Register9, OwnerID())
			BeginPlot(Boss_2,"Lua_apon_102683_fight",30)
			for i = 1 , table.getn(Table_jail), 1 do ----將所有的囚犯再次 Show 出來
				if Table_jail[i] ~= nil and CheckID(Table_jail[i] ) == true then
					Show( Table_jail[i],roomid1 )
					WriteRoleValue( Table_jail[i], EM_RoleValue_PID, Boss_2)
				end	
			end
			
			for i = 1 , table.getn(Table_Dream_show), 1 do ----刪除所有的特效球
				if Table_Dream_show[i] ~= nil and CheckID(Table_Dream_show[i] ) == true then
					Delobj(Table_Dream_show[i])
				end	
			end
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_5]" , 1 )---如此醜陋的生物！居然敢踏入韓絲翠的領域！！
			sleep(25)
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_6]" , 1 ) ---『沙利德』那沒用的東西！居然讓如此醜陋的生物溜了進來！
			sleep(25)
			ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_7]" , 1 ) ---既然進來了！那就成為我那些囚犯的糧食吧！！
			sleep(25)
			local Mob_timer = CreateObjByFlag( 102809 , Flag_timer , 1 , 1 )----生出一個計時器
			WriteRoleValue( OwnerID() , EM_RoleValue_Register4, Mob_timer )
			WriteRoleValue( Mob_timer, EM_RoleValue_PID, Boss_2 )
			SetModeEx( Mob_timer , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_timer , EM_SetModeType_Mark, false) ----標記
			SetModeEx( Mob_timer , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_timer , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_timer , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_timer , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
			SetModeEx( Mob_timer , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
			SetModeEx( Mob_timer , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
			SetModeEx( Mob_timer , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_timer,roomid1 )
			Show(Mob_timer,roomid1)
		end
	end
end