function Lua_apon_102745_timer() ---計時器怪物專用
	while 1 do 
		sleep(10)
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--將PID中的Boss的GID讀出來
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local counter4 = 0
		while 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1
			counter3 = counter3 + 1
			counter4 = counter4 + 1
			--Say(OwnerID() , "Counter_1 ="..counter1)
			--Say(OwnerID() , "Counter_2 ="..counter2)
			--Say(OwnerID() , "Counter_3 ="..counter3)
			if counter1 == 1 then -----進入 P-1 模式
				WriteRoleValue( Boss , EM_RoleValue_PID , 1 )
				--Say(OwnerID() , "P_1 Start !!")
			elseif counter2 == 20 then -----進入 P-2 模式
				WriteRoleValue( Boss , EM_RoleValue_PID , 2 )
				--Say(OwnerID() , "P_2 Start !!")
			elseif counter3 == 45 then -----進入 P-3 模式--回收能量用
				WriteRoleValue( Boss , EM_RoleValue_PID , 3 )
				WriteRoleValue( Boss , EM_RoleValue_Register8 , 1 )---判斷生石柱用
				--Say(OwnerID() , "P_3 Start !!")
			elseif counter4 >= 50 then  ----計時器重置
				WriteRoleValue( Boss , EM_RoleValue_PID , 1 )
				--Say(OwnerID() , "P_P Return !!")
				counter1 = 0
				counter2 = 0
				counter3 = 0
				counter4 = 0
			end
		end
	end
end




function Lua_apon_102740_AI()
	local Check_pet = 0  ---判斷寵物進入戰鬥用
	while 1 do 
		sleep(10)
		local king_rebon = 0
		local Step = 0 ----判斷模式切換用
		local Step_stone = 0
		local CombatBegin = 0	-------------戰鬥開始旗標
		local Check_HP = 0 --------判斷血量說話
		local Skill = {494412 , 494413 , 494414 , 494419 } ---技能表，順劈斬、弧月斬、碎骨斬、怒吼
		local SkillLv = {0 , 0 , 0 , 0 ,}  ---技能等級
		local SkillString = { } ----字串
		
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
		local PPL = SetSearchAllPlayer(roomid1 )
		local Luck ----隨機出招用
		local Hate = {} ----儲存Boss 仇恨表
		local Hate_Num ---計算出仇恨表中有多少數量
		local Rand_Stone_1
		local Rand_Stone_2
		local Rand_Stone_0
		-----------旗標區↓--------------------------------------------
		local Flag_timer = 780292 ----計時器
		local Flag_checkpet = 780357 -----抓寵物主人
		local Flag_stone_1 = 780362 ---唯一的無敵柱
		local Flag_stone_2 = 780363 ----其它的柱子
		local Flag_King = 780376 ---王的重生旗標
		local Flag_checkhp = 780377 ---判斷Boss血量用的檢示怪
		local Flag_mob = 780378 ----生出精英蛇人怪用 
		----------------------------------------------------------------------
		local Mob_checkhp ---沙利德血量判斷器
		local Check_super = 0 ----用來判斷無敵柱發動用
		
		local counter_p1_1 = 0   
		local counter_p1_2 = 0
		local counter_p1_3 = 0
		local counter_p2_1 = 0   
		local counter_p2_2 = 0
		local counter_p2_3 = 0	
		local counter_p2_4 = 0   
		local counter_p2_5 = 0
		local counter_p2_6 = 0
		
		local Stone_1_other = {} ----無敵柱子，暫存table
		local Stone_2_other = {}  ----一般柱子，暫存table
		
		local Stone_A = 102742
		local Stone_B = 102743
		local Stone_C = 102744
		
		while 1 do
			sleep(10)
			------------柱子旗子區↓---------------------------------------
			local Stone_0 = {Stone_A,Stone_B,Stone_C} ----三個石柱的table
			--local Stone_1 = {1,2,3,4,5,6,7,8,9,10}
			local Stone_2 = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40} ----其餘三種石柱的旗標
			--local Stone_2 = {1,2,3,4,5,6,7,8,9,10} ---無敵石柱用的旗標
			local Stone_1 = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15} ---無敵石柱用的旗標
			
			local BossMaxHP = ReadRoleValue(OwnerID() , EM_RoleValue_MaxHP)
			local BossNowHP = ReadRoleValue(OwnerID() , EM_RoleValue_HP)
			
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
				Step = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ----判斷現在要在哪個模式
				--say(OwnerID(),"Step =="..Step)
				if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---如果是非玩家進入戰鬥
					local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
					SetPosByFlag( Pet_owner , Flag_checkpet , 1 )-----將寵物主人拉進此旗標
					Check_pet = 1
				end
				
				if Check_HP == 0 and BossMaxHP*0.3 >= BossNowHP then
					Check_HP = 1
					Yell( OwnerID() , "[SC_102740_3]" , 5)-----[無恥的入侵者！蛇人的強大睜大眼看清楚吧！！]
					sleep(10)
				end
				
				if CombatBegin == 0 then ---戰鬥啟動時發動
					Yell( OwnerID() , "[SC_102740_4]" , 5)----[骯髒的生物！是誰允許你們進來的 ！！] 
					sleep(10)
					local Mob_timer = CreateObjByFlag( 102745 , Flag_timer , 1 , 1 )----生出一個計時器
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1, Mob_timer )
					WriteRoleValue( Mob_timer, EM_RoleValue_PID, OwnerID() )
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
					Mob_checkhp = CreateObjByFlag( 102750 , Flag_checkhp , 1 , 1 )----生出一個判斷沙利德血量器
					WriteRoleValue( OwnerID() , EM_RoleValue_Register2, Mob_checkhp )
					WriteRoleValue( Mob_checkhp, EM_RoleValue_PID, OwnerID() )
					SetModeEx( Mob_checkhp , EM_SetModeType_Show, true) ----秀出
					SetModeEx( Mob_checkhp , EM_SetModeType_Mark, false) ----標記
					SetModeEx( Mob_checkhp , EM_SetModeType_Strikback, false) ---反擊
					SetModeEx( Mob_checkhp , EM_SetModeType_Move, false) ---移動	
					SetModeEx( Mob_checkhp , EM_SetModeType_Fight, false) ---可砍殺
					SetModeEx( Mob_checkhp , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
					SetModeEx( Mob_checkhp , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
					SetModeEx( Mob_checkhp , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
					SetModeEx( Mob_checkhp , EM_SetModeType_Searchenemy, false)  ---索敵
					AddToPartition( Mob_checkhp,roomid1 )
					Show(Mob_checkhp,roomid1)
					CombatBegin = 1
					king_rebon = 1
					sleep(20)
				end
				if Step == 1 then ----普通招式模式
					counter_p1_1 = counter_p1_1 + 1 ---出招時間
					counter_p1_2 = counter_p1_2 + 1 ----需要唱法的出招
					counter_p1_3 = counter_p1_3 + 1 ----模式切換，控制用
					--Luck = Rand( 100 )--雖機出招用
					if counter_p1_1 >= 7 and counter_p1_3 <= 18 then
						Luck = Rand( 100 )--雖機出招用
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							BossTarget = AttackTarget
							--Say(OwnerID() , "Skill__1")
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
							SkillIndex = 2
							BossTarget = OwnerID()	
							--Say(OwnerID() , "Skill__2")
						end		
						--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
						--Yell( OwnerID() , SkillString[SkillIndex] , 5)
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
						sleep(10)
						counter_p1_1 = 0
					elseif counter_p1_2 >= 9 and counter_p1_3 <= 18 then ---隨機，需要唱秒的兩招
						Luck = Rand( 100 )--雖機出招用
						if (Luck >= 0 and Luck < 25) or (Luck >= 70 and Luck < 99) then
							SkillIndex = 3
							BossTarget = OwnerID()
							--Say(OwnerID() , "Skill__3")
						elseif (Luck >= 21 and Luck < 45) or (Luck >= 49 and Luck < 79) then	
							SkillIndex = 4
							BossTarget = OwnerID()	
							--Say(OwnerID() , "Skill__4")
						end		
						--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
						--Yell( OwnerID() , SkillString[SkillIndex] , 5)
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
						sleep(20)
						counter_p1_2 = 0
					end
					Step_stone = 1
					Check_super = 0
				elseif Step == 2 then
					counter_p2_1 = counter_p2_1 + 1 ----招出石柱用
					counter_p2_2 = counter_p2_2 + 1 ---普通招式
					counter_p2_3 = counter_p2_3 + 1 ----需要唱法招式
					counter_p2_4 = counter_p2_4 + 1 ----Boss回收力量
					counter_p2_5 = counter_p2_5 + 1 ----模式切換控制用
					--Step_stone = ReadRoleValue( OwnerID() , EM_RoleValue_Register8 ) ----判斷現在要在哪個模式
					if Step_stone == 1 then
						Yell( OwnerID() , "[SC_102740_1]" , 5) ----[愚蠢的侵犯！沙利德將砍下你們的頭顱！懸掛在蛇柱之上！]
						sleep(10)
						CastSpellLV( OwnerID() , OwnerID() ,494415,1) ---表演動作
						sleep(20)
						Step_stone = 0
						--WriteRoleValue( OwnerID() , EM_RoleValue_Register8 , 0 )
						--Hate = star_HateListSort() ---將仇恨表存入Hate 的 table 中
						Hate = DW_HateRemain(0) ---將仇恨表存入Hate 的 table 中
						Hate_Num = table.getn (Hate) 
						--say(OwnerID(),"Hate NUM ==="..Hate_Num)
			            -------------------生無敵石柱 ↓ -------------------------------------------------------------------------------------------------	
						for i = 1 , 1 ,1 do
							Rand_Stone_1 = DW_Rand( table.getn (Stone_1))---從隨機旗標中生一隻
							--say(OwnerID(),"Rand_Stone_1 =="..Rand_Stone_1)
							Stone_1_other[i] = CreateObjByFlag( 102741 , Flag_stone_1 , Rand_Stone_1 , 1 )----生出一隻會無敵的石柱
							
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Show, true) ----秀出
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Mark, true) ----標記
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Strikback, false) ---反擊
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Move, false) ---移動	
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Fight, true) ---可砍殺
							SetModeEx( Stone_1_other[i] , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
							SetModeEx( Stone_1_other[i] , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
							SetModeEx( Stone_1_other[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
							SetModeEx( Stone_1_other[i] , EM_SetModeType_Searchenemy, true)  ---索敵
							Addbuff(Stone_1_other[i],504937,0,-1) ----綠柱的Buff
							
							AddToPartition( Stone_1_other[i],roomid1 )
							Show(Stone_1_other[i],roomid1)
							WriteRoleValue( Stone_1_other[i] , EM_RoleValue_PID, OwnerID() )----將Boss的GID寫入石柱的PID中
							--Hide(Stone_1_other[i])
						end
			            -----------------------------------從三個石柱中隨機挑一個在隨機一個旗標點種出來-----------------------------------------
						if Hate_Num <= 1 then
							--say(OwnerID(),"test----1")
							for i = 1 , 1 , 1 do
								Rand_Stone_2 = DW_Rand( table.getn (Stone_2))---從隨機旗標中生一隻
								--say(OwnerID(),"Rand_Stone_2 Flag =="..Rand_Stone_2)
								Rand_Stone_0 = DW_Rand( table.getn (Stone_0))---從三種石柱中選一個
								Stone_2_other[i] = CreateObjByFlag( Stone_0[Rand_Stone_0] , Flag_stone_2 , Stone_2[Rand_Stone_2] , 1 )--三選一、旗標、旗標位置Rand
								
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Show, true) ----秀出
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Mark, true) ----標記
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Strikback, false) ---反擊
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Move, false) ---移動	
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Fight, true) ---可砍殺
								SetModeEx( Stone_2_other[i] , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Searchenemy, true)  ---索敵
								
								if ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102742 then
									Addbuff(Stone_2_other[i],504939,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102743 then
									Addbuff(Stone_2_other[i],504933,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102744 then
									Addbuff(Stone_2_other[i],504938,0,-1)
								end
								
								AddToPartition( Stone_2_other[i],roomid1 )
								Show(Stone_2_other[i],roomid1)
								WriteRoleValue( Stone_2_other[i] , EM_RoleValue_PID, OwnerID() )----將Boss的GID寫入石柱的PID中
								--Hide(Stone_2_other[i])
								table.remove ( Stone_2 , Rand_Stone_2) ----以下兩行是為了不讓石柱在同一旗標位置生出  
								table.getn ( Stone_2)
							end
							
						elseif Hate_Num >= 40 then ----如果野外過多玩家推這隻王，所以，石柱出現的上限最多20隻
							for i = 1 , 20 , 1 do ---只會生出仇恨表一半的柱子。從旗標生出。
								Rand_Stone_2 = DW_Rand( table.getn (Stone_2))---從隨機旗標中生一隻
								Rand_Stone_0 = DW_Rand( table.getn (Stone_0))---從三種石柱中選一個
								Stone_2_other[i] = CreateObjByFlag( Stone_0[Rand_Stone_0] , Flag_stone_2 , Stone_2[Rand_Stone_2] , 1 )--三選一、旗標、旗標位置Rand
								
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Show, true) ----秀出
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Mark, true) ----標記
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Strikback, false) ---反擊
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Move, false) ---移動	
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Fight, true) ---可砍殺
								SetModeEx( Stone_2_other[i] , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Searchenemy, true)  ---索敵
								
								if ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102742 then
									Addbuff(Stone_2_other[i],504939,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102743 then
									Addbuff(Stone_2_other[i],504933,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102744 then
									Addbuff(Stone_2_other[i],504938,0,-1)
								end
								
								AddToPartition( Stone_2_other[i],roomid1 )
								Show(Stone_2_other[i],roomid1)
								WriteRoleValue( Stone_2_other[i] , EM_RoleValue_PID, OwnerID() )----將Boss的GID寫入石柱的PID中
								--Hide(Stone_2_other[i])
								table.remove ( Stone_2 , Rand_Stone_2) ----以下兩行是為了不讓石柱在同一旗標位置生出  
								table.getn ( Stone_2)
							end
							
						elseif Hate_Num >= 2 and  Hate_Num <= 39 then
							for i = 1 , (Hate_Num*0.5) , 1 do ---只會生出仇恨表一半的柱子。從旗標生出。
								Rand_Stone_2 = DW_Rand( table.getn (Stone_2))---從隨機旗標中生一隻
								Rand_Stone_0 = DW_Rand( table.getn (Stone_0))---從三種石柱中選一個
								Stone_2_other[i] = CreateObjByFlag( Stone_0[Rand_Stone_0] , Flag_stone_2 , Stone_2[Rand_Stone_2] , 1 )--三選一、旗標、旗標位置Rand
								
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Show, true) ----秀出
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Mark, true) ----標記
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Strikback, false) ---反擊
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Move, false) ---移動	
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Fight, true) ---可砍殺
								SetModeEx( Stone_2_other[i] , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
								SetModeEx( Stone_2_other[i] , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
								SetModeEx( Stone_2_other[i] , EM_SetModeType_Searchenemy, true)  ---索敵
								
								if ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102742 then
									Addbuff(Stone_2_other[i],504939,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102743 then
									Addbuff(Stone_2_other[i],504933,0,-1)
								elseif
									ReadRoleValue( Stone_2_other[i]  , EM_RoleValue_OrgID) == 102744 then
									Addbuff(Stone_2_other[i],504938,0,-1)
								end
								
								AddToPartition( Stone_2_other[i],roomid1 )
								Show(Stone_2_other[i],roomid1)
								WriteRoleValue( Stone_2_other[i] , EM_RoleValue_PID, OwnerID() )----將Boss的GID寫入石柱的PID中
								--Hide(Stone_2_other[i])
								table.remove ( Stone_2 , Rand_Stone_2) ----以下兩行是為了不讓石柱在同一旗標位置生出  
								table.getn ( Stone_2)
							end
						end
					end
					
					if Check_super == 0 and ReadRoleValue(OwnerID(),EM_RoleValue_Register9) == 1 then
						for i = 1 , table.getn ( Stone_2_other) , 1 do
							AddBuff (Stone_2_other[i] , 504925 , 0 , 20)---把現在場上所有的石柱上一個無敵的Buff<15>秒
						end
						Check_super = 1
						WriteRoleValue( OwnerID() , EM_RoleValue_Register9 , 0 )
					end
					
					if counter_p2_2 >= 1 and counter_p2_5 <= 23 then
						Luck = Rand( 100 )--雖機出招用
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							BossTarget = AttackTarget
							--Say(OwnerID() , "Skill__1")
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
							SkillIndex = 2
							BossTarget = OwnerID()	
							--Say(OwnerID() , "Skill__2")
						end		
						--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
						--Yell( OwnerID() , SkillString[SkillIndex] , 5)
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
						sleep(10)
						counter_p2_2 = 0
						
					elseif counter_p2_3 >= 7 and counter_p2_5 <= 23 then ---隨機，需要唱秒的兩招
						Luck = Rand( 100 )--雖機出招用
						if (Luck >= 0 and Luck < 20) or (Luck >= 70 and Luck < 90) then
							SkillIndex = 3
							BossTarget = OwnerID()
							--Say(OwnerID() , "Skill__3")
						elseif (Luck >= 21 and Luck < 40) or (Luck >= 50 and Luck < 69) then	
							SkillIndex = 4
							BossTarget = OwnerID()	
							--Say(OwnerID() , "Skill__4")
						end		
						--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
						--Yell( OwnerID() , SkillString[SkillIndex] , 5)
						CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
						sleep(20)
						counter_p2_3 = 0
						
					elseif counter_p2_5 >= 23 then
						counter_p2_1 = 0
						counter_p2_2 = 0
						counter_p2_3 = 0
						counter_p2_4 = 0
						counter_p2_5 = 0
					end
				
				elseif Step == 3 then ---回收能量階段
					Yell( OwnerID() , "[SC_102740_2]" , 5)----[卑賤的入侵者！你們的鮮血將遍灑魔都的大門！]
					sleep(10)
					CastSpellLV( OwnerID() , OwnerID() ,494415,1) ---表演動作
					sleep(25)
					
					--say(OwnerID(),"Num 222 =="..table.getn(Stone_1_other))
					--say(OwnerID(),"Power Back")
					for i = 1 , table.getn(Stone_1_other), 1 do
						--say(OwnerID(),"Stone__1")
						if Stone_1_other[i] ~= nil and CheckID(Stone_1_other[i] ) == true then
							AddBuff (Stone_1_other[i] , 504932 , 0 , 15)---對所有的石柱上一個檢查用的Buff
						end
					end	
				
					for i = 1 , table.getn (Stone_2_other) , 1 do
						--say(OwnerID(),"Stone__2")
						if Stone_2_other[i] ~= nil and CheckID(Stone_2_other[i] ) == true then
							AddBuff (Stone_2_other[i] , 504932 , 0 , 15)---對所有的石柱上一個檢查用的Buff
						end
					end
				end	
			else
				--local Timer_die = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				--Delobj(Timer_die)
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
				if king_rebon == 1 then
				----------------將場上所有的石柱清除 ↓ --------------------------------------------------
					--for i = 1 , table.getn(Stone_1_other), 1 do
						--say(OwnerID(),"Stone_1_1_other will Del")
						--if Stone_1_other[i] ~= nil and CheckID(Stone_1_other[i] ) == true then
							--Delobj(Stone_1_other[i])
						--end
					--end
					
					--for i = 1 , table.getn (Stone_2_other) , 1 do
						--if Stone_2_other[i] ~= nil and CheckID(Stone_2_other[i] ) == true then
							--say(OwnerID(),"Stone_2_2_other will Del")
							--Delobj(Stone_2_other[i])
						--end
					--end
					local checkhp_die = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
					WriteRoleValue( checkhp_die , EM_RoleValue_Register1 , 1 ) ----將沙利德血量器的暫存器做出判斷
					Stone_1_other = 0
					Stone_2_other = 0
					Stone_1 = 0
					Stone_2 = 0
					sleep(50) ----讓Boss可以跑回原位後，再做出重置
					break ----重置用
					--Hide(OwnerID()) ---離開戰鬥後，把自己隱身。讓血量器殺了自己
					--local King = CreateObjByFlag( 102740 , Flag_King , 1 , 1 )
					--AddToPartition( King,roomid1 )
					--Show(King,roomid1)
					--Delobj(OwnerID())
				end
			end
		end
	end
end


------------石柱的死亡劇情 ↓ ------------------------------------------------------------------------

function Lua_apon_102741_Die() ----無敵石柱
	local counter_p1_1 = 0
	while 1 do 
		sleep(10)
		counter_p1_1 = counter_p1_1 + 1 ---用時間來刪除自己
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--將Boss的GID讀出來
		SetPlot( OwnerID(),"dead","Lua_apon_102741_Die_1",10 )
		--say(OwnerID(),"Boss_1 =="..Boss)
		
		if counter_p1_1 >= 45 then
			Delobj(OwnerID())
		end
		
		if CheckBuff(OwnerID() , 504932) == true then
			CastSpellLV( OwnerID() ,Boss,494417,1) ---表演動作
			--say(OwnerID(),"Boss !!!")
			sleep(10)
			AddBuff (Boss , 504929 , 0 , 20)
			Delobj(OwnerID())
		end
	end
end

function Lua_apon_102741_Die_1()
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--將Boss的GID讀出來
	WriteRoleValue( Boss , EM_RoleValue_Register9 , 1 )
	Delobj(OwnerID())
end



function Lua_apon_102742_Die() ----降物攻石柱
	local counter_p1_1 = 0
	while 1 do 
		sleep(10)
		counter_p1_1 = counter_p1_1 + 1 ---用時間來刪除自己
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--將PID中的Boss的GID讀出來
		SetPlot( OwnerID(),"dead","Lua_apon_102742_Die_1",10 )
		
		if counter_p1_1 >= 45 then
			Delobj(OwnerID())
		end
		
		if CheckBuff(OwnerID() , 504932) == true then
			CastSpellLV( OwnerID() ,Boss,494417,1) ---表演動作
			sleep(10)
			AddBuff (Boss , 504926 , 0 , 600)
			Delobj(OwnerID())
		end
	end
end

function Lua_apon_102742_Die_1()
	--AddBuff (TargetID() , 504922 , 0 , 300)
	--SysCastSpellLv( OwnerID() ,OwnerID() ,494418,1) ---對自己放一個全體降法攻的法術
	
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102752 , 0 , 0 , 0 ,roomid1,0 )

	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----不顯示血條
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	
	SetFightMode ( Mob_spell,0,0,0,0 )
	Delobj(OwnerID())
end

function Lua_apon_102742_Die_2()
	sleep(5)
	CastSpellLV( OwnerID(),OwnerID() ,494418,1) ---對自己放一個全體降物攻的法術
	--say(OwnerID(),"123")
	sleep(10)
	Delobj(OwnerID())
end

function Lua_apon_102743_Die() ----降法攻石柱
	local counter_p1_1 = 0
	while 1 do 
		sleep(10)
		counter_p1_1 = counter_p1_1 + 1 ---用時間來刪除自己
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--將PID中的Boss的GID讀出來
		SetPlot( OwnerID(),"dead","Lua_apon_102743_Die_1",10 )
		
		if counter_p1_1 >= 45 then
			Delobj(OwnerID())
		end
		
		if CheckBuff(OwnerID() , 504932) == true then
			CastSpellLV( OwnerID() ,Boss,494417,1) ---表演動作
			sleep(10)
			AddBuff (Boss , 504927 , 0 , 600)
			Delobj(OwnerID())
		end
	end
end

function Lua_apon_102743_Die_1()
	--AddBuff (TargetID() , 504923 , 0 , 300)
	
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102773 , 0 , 0 , 0 , roomid1,0 ) 
	
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----不顯示血條
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	
	SetFightMode ( Mob_spell,0,0,0,0 )
	Delobj(OwnerID())
end

function Lua_apon_102743_Die_2()
	sleep(5)
	CastSpellLV( OwnerID(),OwnerID() ,494420,1) ---對自己放一個全體降法攻的法術
	--say(OwnerID(),"123")
	sleep(10)
	Delobj(OwnerID())
end


function Lua_apon_102744_Die() ----降受治療石柱
	local counter_p1_1 = 0
	while 1 do 
		sleep(10)
		counter_p1_1 = counter_p1_1 + 1 ---用時間來刪除自己
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--將PID中的Boss的GID讀出來
		SetPlot( OwnerID(),"dead","Lua_apon_102744_Die_1",10 )
		
		if counter_p1_1 >= 45 then
			Delobj(OwnerID())
		end
		
		if CheckBuff(OwnerID() , 504932) == true then
			CastSpellLV( OwnerID() ,Boss,494417,1) ---表演動作
			sleep(10)
			AddBuff (Boss , 504928 , 0 , 600)
			Delobj(OwnerID())
		end
	end
end

function Lua_apon_102744_Die_1()
	--AddBuff (TargetID() , 504924 , 0 , 300)
	
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local Mob_spell = star_CreateObj( OwnerID() , 102774 , 0 , 0 , 0 , roomid1,0 ) 
	
	SetModeEx( Mob_spell , EM_SetModeType_Mark, false) ----標記
	SetModeEx( Mob_spell , EM_SetModeType_SearchenemyIgnore, false) ---物件不會被搜尋
	SetModeEx( Mob_spell , EM_SetModeType_HideName, false)  ---物件頭上是否顯示名稱
	SetModeEx( Mob_spell , EM_SetModeType_HideMinimap, false)  ---物件是否在小地圖上顯示
	SetModeEx( Mob_spell , EM_SetModeType_NotShowHPMP, true) ----不顯示血條
	SetModeEx( Mob_spell , EM_SetModeType_ShowRoleHead, false) ----不顯示頭像框
	Hide(Mob_spell)
	Show(Mob_spell,roomid1)
	
	SetFightMode ( Mob_spell,0,0,0,0 )
	Delobj(OwnerID())
	
end

function Lua_apon_102744_Die_2()
	sleep(5)
	CastSpellLV( OwnerID(),OwnerID() ,494421,1) ---對自己放一個全體降法攻的法術
	--say(OwnerID(),"123")
	sleep(10)
	Delobj(OwnerID())
end


------------------------------------------------------------------------------------------------------------------------

function Lua_apon_102745_checkhp() ---判斷沙利德血量專用，每 10 秒做一次判斷
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Check_del = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) ---判斷是否將所有親兵刪除
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Mob_table = {} ---存放所有親兵
	local Mob_all = {}
	local Mob_Num
	local Flag_mob = 780378 ----生出沙利德親衛兵用 
	local Mob_id = 102751 ---沙利德親衛兵的ID
	while 1 do
		sleep(10)
		
		--say(OwnerID(),"Mob_Num =="..Mob_Num)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
		local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)
		
		-----------------------將已死亡的怪物從table中移除-----------------------------------
		for i = 1 , table.getn(Mob_all), 1 do
			--say(OwnerID(),"Start Del all Mob !! ")
			--if CheckID(Mob_all[i]) == false then
			if Mob_all[i] ~= nil and ReadRoleValue( Mob_all[i] , EM_RoleValue_IsDead) == 1 then
			--if Mob_all[i] ~= nil and CheckID(Mob_all[i] ) == true then
				--Delobj(Mob_all[i])
				--say(OwnerID(),"Remove mob from table !! ")
				table.remove ( Mob_all , i)
			end	
		end
		-------------------------------------------------------------------------------------------------------
		
		Mob_Num = table.getn(Mob_all)
		--say(OwnerID(),"table Num == "..Mob_Num)
		
		if  ( AttackTarget ~= 0 ) and ( CheckID(Boss)) == true then
			if BossMaxHP*0.3 >= BossNowHP and Mob_Num <= 10 then -----如果血量低於30%和場上親兵數量小於15才會再生出親兵 
				for i = 1 , 5 , 1 do
					Mob_table[i] = CreateObjByFlag( Mob_id , Flag_mob , i , 1 )--親兵、旗標、旗標位置
					AddToPartition( Mob_table[i],roomid1 )
					Show(Mob_table[i],roomid1)
					SetAttack( Mob_table[i] , AttackTarget )
					BeginPlot(Mob_table[i],"LuaS_Discowood_CheckPeace",0) ---離開戰鬥後會自動消失 
					table.insert( Mob_all , Mob_table[i] )---將生出來的親兵，放入Mob_all 的 table 中。 
					--say(OwnerID()," table.getn(Mob_all) ==".. table.getn(Mob_all))
				end
				sleep(50)
			end
		else
			--if Check_del == 1 then
			for i = 1 , table.getn(Mob_all), 1 do
				--say(OwnerID(),"Start Del all Mob !! ")
				if Mob_all[i] ~= nil and CheckID(Mob_all[i] ) == true then
					Delobj(Mob_all[i])
				end	
			end
			local Timer_die = ReadRoleValue(Boss,EM_RoleValue_Register1)
			sleep(10)
			Delobj(Timer_die)
			WriteRoleValue(Boss,EM_RoleValue_PID , 0 )
			sleep(10)
			--killid(OwnerID(),Boss)
			--sleep(10)
			Delobj(OwnerID()) ----做完清場動作後，將自己刪除
			
			--end
		end
	end
end





