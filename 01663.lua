function Lua_apon_102683_Boss_dead() -----Boss死亡劇情
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
	WriteRoleValue( Boss_AI, EM_RoleValue_Register3, 1)
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ball = star_CreateObj( OwnerID() , 102924 , 0 , 400 , 0 , roomid1 , 0) ---生出一個特效球
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
	WriteRoleValue(Ball, EM_RoleValue_Livetime,3)	
	BeginPlot(Ball,"Lua_apon_102683_Boss_dead_1",0)
end

function Lua_apon_102683_Boss_dead_1()
	sleep(10)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102683_10]" , 1 )---沒想到，我跟『米杜莎』居然是一樣的下場！！
end

function Lua_apon_102683_timer() ---計時器怪物專用
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
			--counter3 = counter3 + 1
			counter4 = counter4 + 1
			--Say(OwnerID() , "Time_1 Boss_other ="..counter1)
			--Say(OwnerID() , "Time_2 Debuff ="..counter2)
			--Say(OwnerID() , "Time_4 Return ="..counter4)
			if counter1 == 1 then -----進入 P-2 模式
				WriteRoleValue( Boss , EM_RoleValue_PID , 1 )
				sleep(10)
				--Say(OwnerID() , "Time_1 Boss_other ")
			elseif counter2 == 35 then -----進入 P-3 模式
				WriteRoleValue( Boss , EM_RoleValue_PID , 2 )
				sleep(10)
				--Say(OwnerID() , "Time_2 Debuff ")
			--elseif counter3 == 420 then -----不由時間來控制狂暴機制
				--WriteRoleValue( Boss , EM_RoleValue_PID , 3 )
			elseif counter4 >= 70 then  ----計時器重置
				counter1 = 0
				counter2 = 0
				counter4 = 0
			end
		end
	end
end


function Lua_apon_102683_fight()
	local Skill = {494594, 494596,494597 } ---技能表，單體傷害、扇形AE、空中水球術
	local SkillLv = {0 , 0 , 0 , 0 ,}  ---技能等級
	local Luck = 0
	local SkillIndex = 0
	local Skill_lv_Index = 0
	local BossTarget
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
	SetPlot( OwnerID(),"dead","Lua_apon_102683_Boss_dead",10 )
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local DK_chose = 0
	local JK_chose = 0
	local JA = 0
	local RD_boss = 0
	local PPLX = 0
	local counter_p2_2 = 0
	local counter_p2_3 = 0	
	local counter_p2_4 = 0
	local counter_p2_5 = 0
	local counter_p3_1 = 0   
	local counter_p3_2 = 0
	local counter_p3_3 = 0	
	local counter_p3_4 = 0 
	
	while 1 do
		sleep(10)
		if HateListCount( OwnerID() ) ~= 0 then
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			Step = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ----判斷現在要在哪個模式
			Check_life = 1	
			AddBuff(Boss_AI,505228,0,600) ----主要是要讓AI本體那邊，進入一個迴圈中使用
			if Step == 1 then ----把分身變出來的模式
				--counter_p2_1 = counter_p2_1 + 1 ----將分身招喚出來
				counter_p2_2 = counter_p2_2 + 1 ---普通招式_1 and 2
				counter_p2_3 = counter_p2_3 + 1 ----普通招式_3 and 4
				counter_p2_4 = counter_p2_4 + 1 ----控制階段用
				if SP_1 == 0 then
					AddBuff(Boss_AI,504826,0,90)
					SP_1 = 1
				end
				-------------------完整的Boss 基本招式區------------------------------------------------------------------------------					
				if counter_p2_2 >= 7 and counter_p2_4 <= 37 then
					Luck = Rand( 100 )--雖機出招用
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then ---單體傷害
						SkillIndex = 1
						Skill_lv_Index = 1
						BossTarget = AttackTarget
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then ----AE 傷害	
						SkillIndex = 2
						Skill_lv_Index = 1
						BossTarget = OwnerID()	
					end		
					--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
					sleep(10)
					counter_p2_2 = 0
						
				elseif counter_p2_3 >= 9 and counter_p2_4 <= 37 then 
					Luck = Rand( 100 )--雖機出招用
					if (Luck >= 0 and Luck < 25) or (Luck >= 70 and Luck < 99) then
						BossTarget = HateTargetID()
					end		
					--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					
					local Ball = star_CreateObj( BossTarget , 102924 , 0 , 150 , 0 , roomid1 , 0) ---生出一個特效球
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
					------------------------------------------------------------------------------------------------------------------------------------------------
					CastSpellLV( Ball , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
					sleep(10)
					counter_p2_3 = 0
				---------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
				
				elseif counter_p2_4 >= 38 then
					counter_p2_1 = 0   
					counter_p2_2 = 0
					counter_p2_3 = 0	
					counter_p2_4 = 0   
				end
			
			elseif Step == 2 then ----蛇女王全場Debuff 的時刻
				SP_1 = 0 ----啟動下一次的分身
				counter_p3_1 = counter_p3_1 + 1 ----全場 Debuff 階段
				counter_p3_2 = counter_p3_2 + 1 ---普通招式_1 and 2
				counter_p3_3 = counter_p3_3 + 1 ----普通招式_3 and 4
				counter_p3_4 = counter_p3_4 + 1 ----控制階段用
			
				if counter_p3_1 == 1 or counter_p3_1 == 12 or counter_p3_1 == 25 or counter_p3_1 == 36 then
					ScriptMessage(OwnerID() , -1 , 2 , "[SC_102683_9]" , 1 )---可憐的下等生物！就讓韓絲翠來慰藉你那殘破的身軀吧！
					
					sleep(20)
					CastSpellLV( OwnerID() , OwnerID() , 494556 , 1 )					
					sleep(10)
				end
				
				-------------------完整的Boss 基本招式區-----------------------------------------------------------------------------------------------------------------------					
				if counter_p3_2 >= 7 and counter_p3_4 <= 37 then
					Luck = Rand( 100 )--雖機出招用
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then ---單體傷害
						SkillIndex = 1
						Skill_lv_Index = 1
						BossTarget = AttackTarget
						--Say(OwnerID() , "Skill__1")
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then ----AE 傷害	
						SkillIndex = 2
						Skill_lv_Index = 1
						BossTarget = OwnerID()	
						--Say(OwnerID() , "Skill__2")
					end		
					--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
					sleep(10)
					counter_p3_2 = 0
						
				elseif counter_p3_3 >= 9 and counter_p3_4 <= 37 then 
					Luck = Rand( 100 )--雖機出招用
					if (Luck >= 0 and Luck < 25) or (Luck >= 70 and Luck < 99) then
						SkillIndex = 3
						Skill_lv_Index = 1
						BossTarget = HateTargetID()
					end		
					--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					
					local Ball = star_CreateObj( BossTarget , 102924 , 0 , 150 , 0 , roomid1 , 0) ---生出一個特效球
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
					------------------------------------------------------------------------------------------------------------------------------------------------
					CastSpellLV( Ball , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
					sleep(10)
					counter_p3_3 = 0
					---------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
				
				elseif counter_p3_4 >= 38 then
					counter_p3_1 = 0   
					counter_p3_2 = 0
					counter_p3_3 = 0	
					counter_p3_4 = 0
					
				end
			end
			
		elseif HateListCount( OwnerID() ) == 0 then
			Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
			--WriteRoleValue( Boss_AI, EM_RoleValue_PID, 1)
			roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
			local ID = {}
			local ID_2 = {}
			local ID_2_all = 0	
			if Check_life == 1 then
				local PPL = SetSearchAllPlayer(roomid1)
				if PPL==0 then-----------------------------檢查裡面是否 有沒有人
					WriteRoleValue( Boss_AI, EM_RoleValue_PID, 1)
					sleep(30)
				
				elseif PPL ~= 0 then  -----------------------------有人但是可能有gm或者死人
					for i = 1 , PPL , 1 do 
						ID[i] = GetSearchResult()
						if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) == 1 or  ------去檢查裡面的人是否是死人或者gm
							ReadRoleValue( ID[i], EM_RoleValue_VOC) == 0 or
							GetDistance( OwnerID(), ID[i]) >=1300 then 
							PPLX=PPLX+1
						else
							table.insert( ID_2 , ID[i] ) 
						end
						Check_ID = table.getn(ID)	
					end
					
					if PPL<=PPLX then ---------都相等  等於裡面都是死人或者gm  所以重置
						WriteRoleValue( Boss_AI, EM_RoleValue_PID, 1) ----要是相等的話回報主體，進行重置
						sleep(30)
						break
					elseif PPL > PPLX then ----代表場上還有活人，繼續戰鬥
						ID_2_all = table.getn(ID_2)
						for i = 1 , ID_2_all , 1 do
							SetAttack( OwnerID() , ID_2[i] )
							PPLX = 0
							PPL = 0
						end
					end
				end
			end	
		end
	end
end
