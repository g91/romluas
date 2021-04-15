function Lua_apon_Boss_102969_fight()
	local Flag_Door = 780389 ----門
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---中央控制器
	sleep(10)
	local Corpse_1 = ReadRoleValue(Boss_AI,EM_RoleValue_Register1) ---手術刀 1
	local Corpse_2 = ReadRoleValue(Boss_AI,EM_RoleValue_Register2) ---手術刀 2
	local Corpse_3 = ReadRoleValue(Boss_AI,EM_RoleValue_Register3) ---手術刀 3
	local Corpse_4 = ReadRoleValue(Boss_AI,EM_RoleValue_Register4) ---手術刀 4
	sleep(10)
	local Corpse_mob_1 = ReadRoleValue(Corpse_1,EM_RoleValue_Register1) --女侍屍體 1
	local Corpse_mob_2 = ReadRoleValue(Corpse_2,EM_RoleValue_Register1) --女侍屍體 2
	local Corpse_mob_3 = ReadRoleValue(Corpse_3,EM_RoleValue_Register1) --女侍屍體 3
	local Corpse_mob_4 = ReadRoleValue(Corpse_4,EM_RoleValue_Register1) --女侍屍體 4
	sleep(10)
	local Corpse_mob_1_Check = ReadRoleValue(Corpse_mob_1,EM_RoleValue_Register2) -----女侍屍體判斷狀態用 1
	local Corpse_mob_2_Check = ReadRoleValue(Corpse_mob_2,EM_RoleValue_Register2) -----0 : 不是寵物
	local Corpse_mob_3_Check = ReadRoleValue(Corpse_mob_3,EM_RoleValue_Register2) -----1 : 女侍變成寵物
	local Corpse_mob_4_Check = ReadRoleValue(Corpse_mob_4,EM_RoleValue_Register2)
	local BossMaxHP = ReadRoleValue(OwnerID() , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP)
	local HP_check = 0
	local Table_corpse = {}
	local Chose_mob
	local Corpse_Blade
	table.insert( Table_corpse , Corpse_mob_1 ) ----將屍體存入 table 中
	table.insert( Table_corpse , Corpse_mob_2 ) ----將屍體存入 table 中
	table.insert( Table_corpse , Corpse_mob_3 ) ----將屍體存入 table 中
	table.insert( Table_corpse , Corpse_mob_4 ) ----將屍體存入 table 中
	
	local Crazy_mod = 1 ---狂暴機制
	local Counter_Crazy = 0  ----狂暴機制
	local Counter_1_1 = 0 
	local Counter_1_2 = 0 
	local Counter_1_3 = 0 
	local Counter_1_4 = 0 
	local Counter_2_1 = 0 
	local Counter_2_2 = 0 
	
	local Door_1 = CreateObjByFlag( 103044 , Flag_Door , 1 , 1 ) ---種下前門，活動門
	SetModeEx( Door_1 , EM_SetModeType_Show, true) ----秀出
	SetModeEx( Door_1 , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Door_1 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( Door_1 , EM_SetModeType_Move, false) ---移動	
	SetModeEx( Door_1 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( Door_1 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
	SetModeEx( Door_1 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Door_1 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Door_1 , EM_SetModeType_Searchenemy, false)  ---索敵
	SetModeEx( Door_1   , EM_SetModeType_Obstruct, true )--阻擋
	AddToPartition( Door_1,roomid1 )
	Show(Door_1,roomid1)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register7, Door_1)
	local Door_1_2 = CreateObjByFlag( 103044 , Flag_Door , 2 , 1 ) ---種下前門，活動門
	SetModeEx( Door_1_2 , EM_SetModeType_Show, true) ----秀出
	SetModeEx( Door_1_2 , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Door_1_2 , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( Door_1_2 , EM_SetModeType_Move, false) ---移動	
	SetModeEx( Door_1_2 , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( Door_1_2 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
	SetModeEx( Door_1_2 , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Door_1_2 , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Door_1_2 , EM_SetModeType_Searchenemy, false)  ---索敵
	SetModeEx( Door_1_2   , EM_SetModeType_Obstruct, true )--阻擋
	AddToPartition( Door_1_2,roomid1 )
	Show(Door_1_2,roomid1)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register8, Door_1_2)
	SetPlot(OwnerID(),"dead","Lua_apon_zone122_boos2_say_2",10 )	
	local Start_war = 0 ----開始戰鬥開關
	local BossPet = 1 ----避免重復觸發叫女侍用
	
	local STEP = 0
	
	while 1 do
		sleep(10)
		if HateListCount( OwnerID() ) ~= 0 then
			Counter_Crazy = Counter_Crazy + 1
			if Counter_Crazy >= 480 and Crazy_mod == 1 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_11]" , 1 )---死亡與復生！汝輩已選擇了死亡！！
				sleep(10)
				AddBuff (OwnerID() , 505224 , 0 , 600)
				Crazy_mod = 0
			end
					
			if Start_war == 0 then
				local Flag_Door = 780389 ----門
				local Door_2 = CreateObjByFlag( 103055 , Flag_Door , 3 , 1 ) ---種下前門，活動門
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
				WriteRoleValue( OwnerID(), EM_RoleValue_Register9, Door_2)
				Start_war = 1
				BeginPlot( OwnerID(), "Lua_apon_Zone122_keyitem_give", 5)
				STEP = 1
			end
		
			if STEP == 1 then
				Counter_1_1 = Counter_1_1 + 1
				Counter_1_2 = Counter_1_2 + 1
				Counter_1_3 = Counter_1_3 + 1----完全重置用
				
				--say(OwnerID()," Counter_1_3 =="..Counter_1_3)
				--if Counter_1_4 >= 34 then
					
				
				if Counter_1_1 >= 6 and  Counter_1_3 <= 23 then ----基本的兩招，出招方式
					Lua_apon_102969_BossSkill_1()
					Counter_1_1 = 0
					
				elseif Counter_1_2 >= 23 and BossPet == 1 then ------點名女侍階段，但是要多一個防多次觸發的機制
					
					Corpse_1 = ReadRoleValue(Boss_AI,EM_RoleValue_Register1) ---手術刀 1
					Corpse_2 = ReadRoleValue(Boss_AI,EM_RoleValue_Register2) ---手術刀 2
					Corpse_3 = ReadRoleValue(Boss_AI,EM_RoleValue_Register3) ---手術刀 3
					Corpse_4 = ReadRoleValue(Boss_AI,EM_RoleValue_Register4) ---手術刀 4
					sleep(10)
					Corpse_mob_1 = ReadRoleValue(Corpse_1,EM_RoleValue_Register1) --女侍屍體 1
					Corpse_mob_2 = ReadRoleValue(Corpse_2,EM_RoleValue_Register1) --女侍屍體 2
					Corpse_mob_3 = ReadRoleValue(Corpse_3,EM_RoleValue_Register1) --女侍屍體 3
					Corpse_mob_4 = ReadRoleValue(Corpse_4,EM_RoleValue_Register1) --女侍屍體 4
					Table_corpse = {}
					table.insert( Table_corpse , Corpse_mob_1 ) ----將屍體存入 table 中
					table.insert( Table_corpse , Corpse_mob_2 ) ----將屍體存入 table 中
					table.insert( Table_corpse , Corpse_mob_3 ) ----將屍體存入 table 中
					table.insert( Table_corpse , Corpse_mob_4 ) ----將屍體存入 table 中
				
					BossMaxHP = ReadRoleValue(OwnerID() , EM_RoleValue_MaxHP)
					BossNowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP)
					HP_check = (BossNowHP/BossMaxHP)*100
					
					--say(OwnerID()," HP_check =="..HP_check)
					
					BossPet = 0 
					
					SetFightMode ( OwnerID(),1, 0, 0,1 )
					CastSpellLV( OwnerID() , OwnerID() , 494908 , 1 ) ----表演開始喚醒女侍用 
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_08]" , 1 ) ----死亡不代表終結！而是一切的開端！
					sleep(20)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_09]" , 1 ) ----甦醒吧！ 吾之僕人！
					sleep(20)
					SetFightMode ( OwnerID(),1, 1, 1,1 )
					if HP_check >= 75 then
						---------------Boss 點名女侍的階段，可以按照需求去更改點名人數多寡-----------------------------------------------------------	
						--say(OwnerID()," HP_check_1 ")
						local Table_corpse_2 = {}
						local Table_corpse_3 = {}	
						Table_corpse_2 = Table_corpse ----新的 table 等於 原先的table 內容
						for i = 1, 1, 1 do ----根據血量的多寡，可以調整 i 的最大值是多少
							--say(OwnerID(),"Table_corpse_2 all ="..table.getn(Table_corpse_2))
							for i = 1 , table.getn(Table_corpse_2), 1 do
								local Chose_corpse = Rand(table.getn( Table_corpse_2 ) ) + 1
								if Table_corpse_2[Chose_corpse] ~= nil then
									Chose_mob = Chose_corpse ----最終選到的屍體
									break
								end
							end
							table.insert( Table_corpse_3 , Table_corpse[Chose_mob] ) ----把被選到的女侍，存到 Table_corpse_3 中
							table.remove ( Table_corpse_2 , Chose_mob) ---將已選到的從 table 中移除
						end
						--say(OwnerID(),"Table_corpse_3 all ="..table.getn(Table_corpse_3))
						BeginPlot( OwnerID(), "Lua_apon_corpse_Timer", 5) ---女侍重置 計時器
						Counter_check = 1
						
						for i = 1 , table.getn(Table_corpse_3), 1 do ---把選到的屍體的手術刀的 Register2 都改成1
							--say(Table_corpse_3[i],"Table_corpse_3")
							--say(OwnerID(),"Table_corpse_3 ="..Table_corpse_3[i])
							Corpse_Blade = ReadRoleValue(Table_corpse_3[i],EM_RoleValue_PID)
							WriteRoleValue( Corpse_Blade, EM_RoleValue_Register2, 1)
							AddBuff (Table_corpse_3[i] , 505668 , 0 , 12)
						end
						
						for i = 1 , 13 , 1 do ---倒數秒數階段，此階段，Boss 可以放一些 AE 的技能
							sleep(10)
							if i == 13 then ---時間到
								if i == 3 then
									Lua_apon_102969_BossSkill_1()
								elseif i == 11 then
									Lua_apon_102969_BossSkill_2()
								end
								
								for i = 1 , table.getn(Table_corpse_3), 1 do
									Corpse_mob_1_Check = ReadRoleValue(Table_corpse_3[i],EM_RoleValue_Register2)
									--say(OwnerID(),"Corpse_mob_1_Check=="..Corpse_mob_1_Check)
									if Corpse_mob_1_Check == 0 then
										--say(Table_corpse_3[i],"YES")
										WriteRoleValue( Table_corpse_3[i], EM_RoleValue_Register3, 1)
									end
								end
							end
						end
						
					elseif HP_check <= 74 and HP_check >= 50 then
						---------------Boss 點名女侍的階段，可以按照需求去更改點名人數多寡-----------------------------------------------------------			
						local Table_corpse_2 = {}
						local Table_corpse_3 = {}	
						Table_corpse_2 = Table_corpse ----新的 table 等於 原先的table 內容
						for i = 1, 2, 1 do ----根據血量的多寡，可以調整 i 的最大值是多少
							--say(OwnerID(),"table_2 all ="..table.getn(Table_corpse_2))
							for i = 1 , table.getn(Table_corpse_2), 1 do
								local Chose_corpse = Rand(table.getn( Table_corpse_2 ) ) + 1
								if Table_corpse_2[Chose_corpse] ~= nil then
									Chose_mob = Chose_corpse ----最終選到的屍體
									break
								end
							end
							table.insert( Table_corpse_3 , Table_corpse[Chose_mob] ) ----把被選到的女侍，存到 Table_corpse_3 中
							table.remove ( Table_corpse_2 , Chose_mob) ---將已選到的從 table 中移除
						end
						--say(OwnerID(),"table_3 all ="..table.getn(Table_corpse_3))
						BeginPlot( OwnerID(), "Lua_apon_corpse_Timer", 5) ---女侍重置 計時器
						Counter_check = 1
						
						for i = 1 , table.getn(Table_corpse_3), 1 do ---把選到的屍體的手術刀的 Register2 都改成1
							--say(Table_corpse_3[i],"Table_corpse_3")
							--say(OwnerID(),"Table_corpse_3 ="..Table_corpse_3[i])
							Corpse_Blade = ReadRoleValue(Table_corpse_3[i],EM_RoleValue_PID)
							WriteRoleValue( Corpse_Blade, EM_RoleValue_Register2, 1)
							AddBuff (Table_corpse_3[i] , 505668 , 0 , 12)
						end
						
						for i = 1 , 13 , 1 do ---倒數秒數階段，此階段，Boss 可以放一些 AE 的技能
							sleep(10)
							if i == 13 then ---時間到
								if i == 3 then
									Lua_apon_102969_BossSkill_1()
								elseif i == 11 then
									Lua_apon_102969_BossSkill_2()
								end
								
								for i = 1 , table.getn(Table_corpse_3), 1 do
									Corpse_mob_1_Check = ReadRoleValue(Table_corpse_3[i],EM_RoleValue_Register2)
									--say(OwnerID(),"Corpse_mob_1_Check=="..Corpse_mob_1_Check)
									if Corpse_mob_1_Check == 0 then
										--say(Table_corpse_3[i],"YES")
										WriteRoleValue( Table_corpse_3[i], EM_RoleValue_Register3, 1)
									end
								end
							end
						end
						
					elseif HP_check <= 49 and HP_check >= 25 then
						---------------Boss 點名女侍的階段，可以按照需求去更改點名人數多寡-----------------------------------------------------------			
						local Table_corpse_2 = {}
						local Table_corpse_3 = {}	
						Table_corpse_2 = Table_corpse ----新的 table 等於 原先的table 內容
						for i = 1, 3, 1 do ----根據血量的多寡，可以調整 i 的最大值是多少
							--say(OwnerID(),"table_2 all ="..table.getn(Table_corpse_2))
							for i = 1 , table.getn(Table_corpse_2), 1 do
								local Chose_corpse = Rand(table.getn( Table_corpse_2 ) ) + 1
								if Table_corpse_2[Chose_corpse] ~= nil then
									Chose_mob = Chose_corpse ----最終選到的屍體
									break
								end
							end
							table.insert( Table_corpse_3 , Table_corpse[Chose_mob] ) ----把被選到的女侍，存到 Table_corpse_3 中
							table.remove ( Table_corpse_2 , Chose_mob) ---將已選到的從 table 中移除
						end
						--say(OwnerID(),"table_3 all ="..table.getn(Table_corpse_3))
						BeginPlot( OwnerID(), "Lua_apon_corpse_Timer", 5) ---女侍重置 計時器
						Counter_check = 1
						
						for i = 1 , table.getn(Table_corpse_3), 1 do ---把選到的屍體的手術刀的 Register2 都改成1
							--say(Table_corpse_3[i],"Table_corpse_3")
							--say(OwnerID(),"Table_corpse_3 ="..Table_corpse_3[i])
							Corpse_Blade = ReadRoleValue(Table_corpse_3[i],EM_RoleValue_PID)
							WriteRoleValue( Corpse_Blade, EM_RoleValue_Register2, 1)
							AddBuff (Table_corpse_3[i] , 505668 , 0 , 12)
						end
						
						for i = 1 , 13 , 1 do ---倒數秒數階段，此階段，Boss 可以放一些 AE 的技能
							sleep(10)
							if i == 3 then
								Lua_apon_102969_BossSkill_1()
							elseif i == 11 then
								Lua_apon_102969_BossSkill_2()
							end
							
							if i == 13 then ---時間到
								for i = 1 , table.getn(Table_corpse_3), 1 do
									Corpse_mob_1_Check = ReadRoleValue(Table_corpse_3[i],EM_RoleValue_Register2)
									--say(OwnerID(),"Corpse_mob_1_Check=="..Corpse_mob_1_Check)
									if Corpse_mob_1_Check == 0 then
										--say(Table_corpse_3[i],"YES")
										WriteRoleValue( Table_corpse_3[i], EM_RoleValue_Register3, 1)
									end
								end
							end
						end
						
					elseif HP_check <= 24 then
						---------------Boss 點名女侍的階段，可以按照需求去更改點名人數多寡-----------------------------------------------------------			
						local Table_corpse_2 = {}
						local Table_corpse_3 = {}	
						Table_corpse_2 = Table_corpse ----新的 table 等於 原先的table 內容
						for i = 1, 4, 1 do ----根據血量的多寡，可以調整 i 的最大值是多少
							--say(OwnerID(),"table_2 all ="..table.getn(Table_corpse_2))
							for i = 1 , table.getn(Table_corpse_2), 1 do
								local Chose_corpse = Rand(table.getn( Table_corpse_2 ) ) + 1
								if Table_corpse_2[Chose_corpse] ~= nil then
									Chose_mob = Chose_corpse ----最終選到的屍體
									break
								end
							end
							table.insert( Table_corpse_3 , Table_corpse[Chose_mob] ) ----把被選到的女侍，存到 Table_corpse_3 中
							table.remove ( Table_corpse_2 , Chose_mob) ---將已選到的從 table 中移除
						end
						--say(OwnerID(),"table_3 all ="..table.getn(Table_corpse_3))
						BeginPlot( OwnerID(), "Lua_apon_corpse_Timer", 5) ---女侍重置 計時器
						Counter_check = 1
						
						for i = 1 , table.getn(Table_corpse_3), 1 do ---把選到的屍體的手術刀的 Register2 都改成1
							--say(Table_corpse_3[i],"Table_corpse_3")
							--say(OwnerID(),"Table_corpse_3 ="..Table_corpse_3[i])
							Corpse_Blade = ReadRoleValue(Table_corpse_3[i],EM_RoleValue_PID)
							WriteRoleValue( Corpse_Blade, EM_RoleValue_Register2, 1)
							AddBuff (Table_corpse_3[i] , 505668 , 0 , 12)
						end
						
						for i = 1 , 13 , 1 do ---倒數秒數階段，此階段，Boss 可以放一些 AE 的技能
							sleep(10)
							if i == 3 then
								Lua_apon_102969_BossSkill_1()
							elseif i == 11 then
								Lua_apon_102969_BossSkill_2()
							end
							
							if i == 13 then ---時間到
								for i = 1 , table.getn(Table_corpse_3), 1 do
									Corpse_mob_1_Check = ReadRoleValue(Table_corpse_3[i],EM_RoleValue_Register2)
									--say(OwnerID(),"Corpse_mob_1_Check=="..Corpse_mob_1_Check)
									if Corpse_mob_1_Check == 0 then
										--say(Table_corpse_3[i],"YES")
										WriteRoleValue( Table_corpse_3[i], EM_RoleValue_Register3, 1)
									end
								end
							end
						end
					end
					
					Counter_1_1 = 0 
					Counter_1_2 = 0 
					Counter_1_3 = 0 
					STEP = 2
				end
				
			elseif STEP == 2 then
				Counter_2_1 = Counter_2_1 + 1
				Counter_2_2 = Counter_2_2 + 1
				--say(OwnerID(),"Counter_2_2 ="..Counter_2_2)
				BossPet = 1
				
				if Counter_2_1 >= 7 and Counter_2_2 <= 33 then	
					Lua_apon_102969_BossSkill_2()
					Counter_2_1 = 0
				elseif Counter_2_2 >= 33 then
					STEP = 1
					Counter_2_1 = 0
					Counter_2_2 = 0
				end
			end
		else
			if Start_war == 1 then
				--say(OwnerID(),"Fight over !!")
				BeginPlot( OwnerID(), "Lua_apon_Zone122_keyitem_buff", 5) ----將所有玩家身上的 Pet keyitem 刪掉
				AddBuff (Boss_AI , 505632 , 0 , 10)--addbuff  到Boss_AI 身上，完整重置用
				
				local Door_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
				local Door_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
				local Door_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
				Delobj(Door_1)
				Delobj(Door_2)
				Delobj(Door_3)
				sleep(10)
				Delobj(OwnerID())
			end
		end
	end
end



	
	
	






-------女侍被觸發之後的計時器-----30秒後，回傳給Boss_AI，讓Boss_AI 去執行手術刀重置的動作。-------
function Lua_apon_corpse_Timer()
	local Timer = 0 ---計時器
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---中央控制器
	while 1 do
		sleep(10)
		Timer = Timer + 1
		if Timer >= 47 then
			AddBuff (Boss_AI , 505631 , 0 , 5)
			break ---結束這個計時器
		end
	end
end


--------寵物技能重要物品的給予和刪除-----------------------------------

function Lua_apon_Zone122_keyitem_buff()
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do 
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  
			and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 then
			CancelBuff(ID,505360)
		end
	end
end

function Lua_apon_Zone122_keyitem_del()
	SetFlag( OwnerID()  , 543584 , 0 )
	SetFlag( OwnerID()  , 543585 , 0 )
	SetFlag( OwnerID()  , 543586 , 0 )
	SetFlag( OwnerID()  , 543587 , 0 )
	SetFlag( OwnerID()  , 543588 , 0 )
end

function Lua_apon_Zone122_keyitem_give()
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(roomid1 )
	for i = 1 , PPL , 1 do 
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  
			and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 then
			AddBuff (ID , 505360 , 0 , -1)
			SetFlag( ID  , 543584 , 1 )
			SetFlag( ID  , 543585 , 1 )
			SetFlag( ID  , 543586 , 1 )
			SetFlag( ID  , 543587 , 1 )
			SetFlag( ID  , 543588 , 1 )
			--SetPlot(ID,"dead","Lua_apon_zone122_boos2_say_1",10 ) ----在每一名玩家身上塞一個死亡劇情
			AddBuff (ID , 505352 , 0 , -1)
				
			
		end
	end
end

function Lua_apon_102969_BossSkill_1() -----第一階段的Boss技能，沒有吸血術
	local BossTarget = 0
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Skill = { 494898 , 494899 , 494900 }	
		-------------------------1.單體法傷   2.定點毒霧   3.吸血術			
	local SkillLv = {35 , 5 , 10 }
	---------下列的字串，記得要修改-----------------------
	local SkillString = { "[SC_102558_3]" , "[SC_102558_4]" , "[SC_102558_5]" }
	local Luck = Rand(100)
	local PlayerInHate = star_HateListSort(OwnerID())		--------存放玩家GID
	if (Luck >= 0 and Luck < 30) or (Luck >= 56 and Luck < 85) then
		SkillIndex = 1
		BossTarget = PlayerInHate[1] ----專打坦克
		CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
		
	elseif (Luck >= 31 and Luck < 55) or (Luck >= 86 and Luck < 100) then	
		SkillIndex = 2
		local RandTarget2 = Rand(table.getn(PlayerInHate))+1
		BossTarget = PlayerInHate[RandTarget2]
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_03]" , 1 )---亞沙在場上製造了一陣毒霧！
		--Yell( OwnerID() , SkillString[SkillIndex] , 5)
		
		local X = ReadRoleValue(BossTarget , EM_RoleValue_X )
		local Y = ReadRoleValue(BossTarget , EM_RoleValue_Y )
		local Z = ReadRoleValue(BossTarget , EM_RoleValue_Z )
		local Dir = ReadRoleValue(BossTarget , EM_RoleValue_Dir )
		local Ball = star_CreateObj( BossTarget , 103051 , 0 , 0 , 0 , roomid1 , 0) ---生出一個特效球
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
		WriteRoleValue(Ball, EM_RoleValue_Livetime,15)
		BeginPlot( Ball, "Lua_apon_102969_mobSkill", 5)
	end	
	sleep(10)
end

function Lua_apon_102969_mobSkill()---毒霧的階段
	for i = 1 , 15 , 1 do
		CastSpellLV( OwnerID() , OwnerID() , 494899 , 10*i )	
		sleep(10)
	end
end

function Lua_apon_102969_BossSkill_2()-----第二階段的Boss技能，有吸血術
	local BossTarget = 0
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Skill = { 494898 , 494899 , 494900 }	
		-------------------------1.單體法傷   2.定點毒霧   3.吸血術			
	local SkillLv = {35 , 5 , 10 }
	---------下列的字串，記得要修改-----------------------
	local SkillString = { "[SC_102558_3]" , "[SC_102558_4]" , "[SC_102558_5]" }
	local Luck = Rand(100)
	local PlayerInHate = star_HateListSort(OwnerID())		--------存放玩家GID
	if (Luck >= 0 and Luck < 15) or (Luck >= 90 and Luck < 100) then
		SkillIndex = 1
		BossTarget = PlayerInHate[1] ----專打坦克
		CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
		
	elseif (Luck >= 16 and Luck < 30) or (Luck >= 80 and Luck < 89) then	
		SkillIndex = 2
		local RandTarget2 = Rand(table.getn(PlayerInHate))+1
		BossTarget = PlayerInHate[RandTarget2]
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_03]" , 1 )---亞沙在場上製造了一陣毒霧！
		--Yell( OwnerID() , SkillString[SkillIndex] , 5)
		
		local X = ReadRoleValue(BossTarget , EM_RoleValue_X )
		local Y = ReadRoleValue(BossTarget , EM_RoleValue_Y )
		local Z = ReadRoleValue(BossTarget , EM_RoleValue_Z )
		local Dir = ReadRoleValue(BossTarget , EM_RoleValue_Dir )
		local Ball = star_CreateObj( BossTarget , 103051 , 0 , 0 , 0 , roomid1 , 0) ---生出一個特效球
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
		WriteRoleValue(Ball, EM_RoleValue_Livetime,15)
		BeginPlot( Ball, "Lua_apon_102969_mobSkill", 5)
		
	elseif (Luck >= 31 and Luck < 79) then	
		SkillIndex = 3
		
		for i = 1 , table.getn(PlayerInHate) , 1 do -----必須要身上沒有吸血Debuff 的人才可以被上這個Debuff
			local RandTarget3 = Rand(table.getn(PlayerInHate))+1
			BossTarget = PlayerInHate[RandTarget3]
			if CheckBuff(BossTarget,505639) == false and CheckBuff(BossTarget,505644) == false  then 
				break
			end
		end
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_04]" , 1 )---鮮血！獻出那滋潤的鮮血！吾將永恆不滅！
		--Yell( OwnerID() , SkillString[SkillIndex] , 5)
		CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )		
	end	
	sleep(10)
end	


---------亞沙用的吸血術------------------------------------------------------------------------------------------
function Lua_apon_Boss_102969_magic_1()
	BeginPlot( TargetID(), "Lua_apon_Boss_102969_magic_2", 5)
end

function Lua_apon_Boss_102969_magic_2()
	local Boss_skill = 494901
	local skill_LV = 0 
	local Now_HP = 0
	local Befor_HP = 0
	local HP_check = 0
	while 1 do
		Luck = Rand(10)
		if CheckBuff(OwnerID(),505639) == true then
			Befor_HP = ReadRoleValue(OwnerID() , EM_RoleValue_HP)
			SysCastSpellLV( TargetID() , OwnerID() , Boss_skill , Luck  )---吸血術傷害
			sleep(10)
			Now_HP = ReadRoleValue(OwnerID() , EM_RoleValue_HP)
			HP_check = Befor_HP - Now_HP
			if HP_check > 0 then
				if HP_check > 30000 then
					SysCastSpellLV( TargetID() , TargetID() , 494902 , 30000  ) ----對Boss回血
				elseif HP_check < 30000 then
					SysCastSpellLV( TargetID() , TargetID() , 494902 , (HP_check - 1 )  ) ----對Boss回血
				end
				
			end
		else
			return
		end
		sleep(30)
	end
end

------------亞沙的女侍寵物的吸血術-----------------------------------------------------------------------------------------------------
function Lua_apon_Boss_Pet_102969_magic_1()
	BeginPlot( TargetID(), "Lua_apon_Boss_Pet_102969_magic_2", 5)
end

function Lua_apon_Boss_Pet_102969_magic_2()
	local Pet_owner = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss_skill = 494903
	local skill_LV = 0 
	local Now_HP = 0
	local Befor_HP = 0
	local HP_check = 0
	while 1 do
		Luck = Rand(10)
		if CheckBuff(OwnerID(),505644) == true then
			Befor_HP = ReadRoleValue(OwnerID() , EM_RoleValue_HP)
			SysCastSpellLV( TargetID() , OwnerID() , Boss_skill , Luck  )---吸血術傷害
			sleep(10)
			Now_HP = ReadRoleValue(OwnerID() , EM_RoleValue_HP)
			HP_check = Befor_HP - Now_HP
			if HP_check > 0 then
				if HP_check > 30000 then
					SysCastSpellLV( TargetID() , Pet_owner , 494902 , 30000  ) ----對Boss回血
				elseif HP_check < 30000 then
					SysCastSpellLV( TargetID() , Pet_owner , 494902 , (HP_check - 1 )  ) ----對Boss回血
				end
			end
		else
			return
		end
		sleep(30)
	end
end

----------------解除吸血術-------------------
function Lua_apon_Boss_102969_magic_over()
	Cancelbuff(TargetID(),505639)
	Cancelbuff(TargetID(),505644)
end

function Lua_apon_Boss_Pet_1() ---第 1、2隻Boss_pet 用
	local BossTarget = 0
	local Skill = { 494890 , 494904 , 494903 }	
		-------------------------1.冰擊術   2.冰封術    3.吸血術			
	local SkillLv = {40 , 0 , 20 }
	local Counter_1 = 0
	local Counter_2 = 0
	local Start = 0
	while 1 do 
		sleep(10)
		Counter_1 = Counter_1 + 1
		Counter_2 = Counter_2 + 1
		local Luck = 0
		if HateListCount( OwnerID() ) ~= 0 then
			Luck = Rand(100)
			
			if Start == 0 then
				Start = 1
				SetFightMode ( OwnerID(),0,0,0,0)
				Yell( OwnerID() , "[SC_102969_05]" , 5)---感謝我主[102969]！永恆復生！
				sleep(10)
				SetFightMode ( OwnerID(),1, 1, 1,1 )
			end
			
			if Counter_1 >= 7 then
				local PlayerInHate = star_HateListSort(OwnerID())		--------存放玩家GID
				if (Luck >= 0 and Luck < 40) or (Luck >= 61 and Luck < 85) then
					SkillIndex = 1
					BossTarget = PlayerInHate[1] ----專打坦克
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
					
				elseif (Luck >= 41 and Luck < 60) or (Luck >= 86 and Luck < 100) then	
					SkillIndex = 2
					local RandTarget2 = Rand(table.getn(PlayerInHate))+1
					BossTarget = PlayerInHate[RandTarget2]
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
				end
			
			elseif Counter_2 >= 15 then 
				Yell( OwnerID() , "[SC_102969_07]" , 5)---無禮的傢伙！還不乖乖的奉上鮮血！
				sleep(10)
				local PlayerInHate = star_HateListSort(OwnerID())
				SkillIndex = 3
				for i = 1 , table.getn(PlayerInHate) , 1 do -----必須要身上沒有吸血Debuff 的人才可以被上這個Debuff
					local RandTarget3 = Rand(table.getn(PlayerInHate))+1
					BossTarget = PlayerInHate[RandTarget3]
					if CheckBuff(BossTarget,505639) == false and CheckBuff(BossTarget,505644) == false  then 
						break
					end
				end
				CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			end
		end
	end
end	

function Lua_apon_Boss_Pet_2() ---第 3、4隻Boss_pet 用
	local BossTarget = 0
	local Skill = { 494892 , 494906 , 494903 }	
		-------------------------1.闇擊術   2.傷害加劇    3.吸血術			
	local SkillLv = {40 , 0 , 20 }
	local Counter_1 = 0
	local Counter_2 = 0 
	local Start = 0
	while 1 do 
		sleep(10)
		Counter_1 = Counter_1 + 1
		Counter_2 = Counter_2 + 1
		local Luck = 0
		if HateListCount( OwnerID() ) ~= 0 then
			Luck = Rand(100)
			
			if Start == 0 then
				Start = 1
				SetFightMode ( OwnerID(),0,0,0,0)
				Yell( OwnerID() , "[SC_102969_05]" , 5)---感謝我主[102969]！永恆復生！
				sleep(10)
				SetFightMode ( OwnerID(),1, 1, 1,1 )
			end
			
			if Counter_1 >= 7 then
				local PlayerInHate = star_HateListSort(OwnerID())		--------存放玩家GID
				if (Luck >= 0 and Luck < 40) or (Luck >= 61 and Luck < 85) then
					SkillIndex = 1
					BossTarget = PlayerInHate[1] ----專打坦克
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
					
				elseif (Luck >= 41 and Luck < 60) or (Luck >= 86 and Luck < 100) then	
					SkillIndex = 2
					local RandTarget2 = Rand(table.getn(PlayerInHate))+1
					BossTarget = PlayerInHate[RandTarget2]
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	
				end
			
			elseif Counter_2 >= 15 then 
				Yell( OwnerID() , "[SC_102969_07]" , 5)---無禮的傢伙！還不乖乖的奉上鮮血！
				sleep(10)
				local PlayerInHate = star_HateListSort(OwnerID())
				SkillIndex = 3
				for i = 1 , table.getn(PlayerInHate) , 1 do -----必須要身上沒有吸血Debuff 的人才可以被上這個Debuff
					local RandTarget3 = Rand(table.getn(PlayerInHate))+1
					BossTarget = PlayerInHate[RandTarget3]
					if CheckBuff(BossTarget,505639) == false and CheckBuff(BossTarget,505644) == false  then 
						break
					end
				end
				CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			end
		end
	end
end	

-----------------以下為，當玩家死亡時，則Boss會說出一段話，的劇情----------------------------------
function Lua_apon_zone122_boos2_say_1()
	if Checkbuff(OwnerID(),505352) == true then
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_01]" , 1 ) ----死亡只不過是復生的開端！吾輩毋需驚恐！
	else
		CancelBuff( OwnerID(), 505352 )
		SetPlot(OwnerID(),"dead","",0 )
	end
end

function Lua_apon_zone122_boos2_say_2()
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
	WriteRoleValue(Ball, EM_RoleValue_Livetime,10)
	WriteRoleValue( Ball, EM_RoleValue_Register1, OwnerID())
	BeginPlot(Ball,"Lua_apon_zone122_boos2_say_3",10)
end

function Lua_apon_zone122_boos2_say_3()	
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local PPL = SetSearchAllPlayer(roomid1 )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102969_02]" , 1 ) ----不～吾是不滅的！吾將會再復生於世人面前的！
	local Door_1 = ReadRoleValue(Boss,EM_RoleValue_Register7)
	local Door_2 = ReadRoleValue(Boss,EM_RoleValue_Register8)
	local Door_3 = ReadRoleValue(Boss,EM_RoleValue_Register9)
	Delobj(Door_1)
	Delobj(Door_2)
	Delobj(Door_3)
	for i = 1 , PPL , 1 do 
		local ID = GetSearchResult()
		if ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0 and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 then
			SetFlag( ID,543620, 1)
		end
	end
	sleep(10)
	Lua_bk_122_boss_530426()
end
	


	