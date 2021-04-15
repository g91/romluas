function Lua_apon_HolytreeAI()
	while 1 do	
		sleep(10)
		local Check_pet = 0  ---判斷寵物進入戰鬥用
		local Mode1 = 503909
		local Mode2 = 503910
		local Mode3 = 503911
		local ModeCheck = 503938  ----連續產生法術做出Check階段
		local CombatBegin = 0	-------------戰鬥開始旗標
		local counter_p1_1 = 0   ----小樹無雙
		local counter_p1_2 = 0    ---p1 法術_1
		local counter_p1_3 = 0     ---p1 法術_2
		local counter_p1_4 = 0      -----p1法術制止用
		local counter_p1_0 = 0 
		local switch = 0  ---- 開關
		local counter_p3_1 = 0  ----將殘存的黑暗樹長老喚醒  
		local counter_p3_2 = 0    ----P3 法術_1
		local counter_p3_3 = 0      ----P3 法術_2
		local counter_p3_4 = 0        ----P3 法術_3
		local counter_p2_1 = 0
		local counter_p2_2 = 0
		local free_tree = {}
		
		local Count = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local PPL = SetSearchAllPlayer(roomid1 )
		SetPlot( OwnerID(),"dead","Lua_apon_Holytree_dead_1",50 )  --樹王的死亡劇情
		while 1 do	
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
					
				if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---如果是非玩家進入戰鬥
					local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
					SetPosByFlag( Pet_owner , 780444 , 1 )
					Check_pet = 1
				end
				
				if switch == 0 then	
					--AddBuff( OwnerID() , ModeCheck , 0 , -1 )
					AddBuff( OwnerID() , Mode1 , 0 , -1 )
					switch = 1
					local Flag = 1
					for i = 1 , PPL , 1 do ---把玩家抓入房間用 
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and GetDistance( ID , OwnerID() ) > 250 and GetDistance( ID , OwnerID() ) < 1000 
							and ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and ReadRoleValue( ID , EM_RoleValue_RoomID  ) == roomid1 then
							SetPosByFlag( ID , 780418 , Flag ) 
							Flag = Flag + 1
							if Flag > GetMoveFlagCount(780418) -1 then
								Flag = 1
							end
						end
					end

					local Timer = Lua_DW_CreateObj( "flag" ,102493, 780418 ,7 )  ---種出時間記數器
					WriteRoleValue( Timer , EM_RoleValue_PID , OwnerID() ) ---將Boss的GID寫入計數器的PID中
					WriteRoleValue( OwnerID() , EM_RoleValue_Register6   , Timer ) ---將計時器GID寫入Boss的 Register6 中   
					SetModeEx( Timer   , EM_SetModeType_Show, false )
					SetModeEx( Timer  , EM_SetModeType_Mark, false )
				end
				
				
				
				
				if CheckBuff (OwnerID() , Mode1) == true then
					counter_p1_0 = counter_p1_0 + 1
					counter_p1_1 = counter_p1_1 + 1
					counter_p1_2 = counter_p1_2 + 1
					counter_p1_3 = counter_p1_3 + 1
					counter_p1_4 = counter_p1_4 + 1
					--Say (OwnerID() , "counter_p1_1="..counter_p1_1)
					--Say (OwnerID() , "counter_p1_2="..counter_p1_2)
					--Say (OwnerID() , "counter_p1_3="..counter_p1_3)
					--Say (OwnerID() , "counter_p1_4="..counter_p1_4)

					if counter_p1_0 == 1 then  -----此迴圈是為了阻擋用，王不直接生門
						--for i = 1 , 50 do
							--free_tree[i] = Lua_DW_CreateObj( "flag" ,102392, 780408 ,i )   
							--free_tree = CreateObjByFlag( 102392, 780408 ,i , 1)
							--AddToPartition( free_tree[i] )
							--SetModeEx( free_tree[i]   , EM_SetModeType_Show, false )
							--SetModeEx( free_tree[i]   , EM_SetModeType_Mark, false )
							--SetModeEx( free_tree[i]   , EM_SetModeType_NotShowHPMP, false )
						--end

						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_05]", 1 )---蟲子...不准...你們...前來...褻瀆...聖地... 
						sleep(10)
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_15]", 1 )---聖樹法里諾身上擴散出強大的魔法能量，這股能量彷彿包圍了整座殿堂 
						sleep(15)
						
						local Tree_1 = Lua_DW_CreateObj( "flag" ,102303, 780385 ,1)   ---objid , flagid , flagnum , 數量
						WriteRoleValue( OwnerID() , EM_RoleValue_Register7   , Tree_1 )  
						local Tree_2 = Lua_DW_CreateObj( "flag" ,102304, 780386 , 1)  ---objid , flagid , flagnum , 數量
						WriteRoleValue( OwnerID() , EM_RoleValue_Register8   , Tree_2 )  
						local Tree_3 = Lua_DW_CreateObj( "flag" ,102305, 780387 , 1)  ---objid , flagid , flagnum , 數量
						WriteRoleValue( OwnerID() , EM_RoleValue_Register9   , Tree_3 )  
						local Tree_4 = Lua_DW_CreateObj( "flag" ,102306, 780388 , 1)  ---objid , flagid , flagnum , 數量，以上四列為將四個 Visitor的樹長老種出來
						WriteRoleValue( OwnerID() , EM_RoleValue_Register10   , Tree_4 )  
						WriteRoleValue( Tree_4 , EM_RoleValue_PID , OwnerID() )   --將Boss的ID 寫入第四隻長老的PID中
						sleep(10)
					end
					
					if counter_p1_1 == 30 and counter_p1_4 <= 100 then     -------每隔15秒就叫出『小樹無雙』
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_06]", 1 ) ---卑賤...的...臭蟲...嘗嘗...樹人...的...力量 ！！
						sleep(10)
						--BeginPlot(TargetID() , "Lua_apon_attacktree" , 10)
						CastSpellLV( OwnerID(), AttackTarget, 493582 , 0)   ----對目標丟出招喚小樹人的法術。
						--sleep(20)
						counter_p1_1 = 0
					end
							
					if counter_p1_2 == 5 and counter_p1_4 <= 108 then     --------每隔 5 秒，對目標放一個法術
						CastSpellLV( OwnerID(), AttackTarget, 493649 , 4)   ----對目標施放一個傷害的法術。
						sleep(10)
						counter_p1_2 = 0
					end
						
					if counter_p1_3 == 8 and counter_p1_4 <= 102 then     ------每隔 10 秒，對全體放一個法術
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_07]", 1 ) ---可悲...的...臭蟲...你們...太...高估...自己...的...生命...了!！
						sleep(15)
						CastSpellLV( OwnerID(), OwnerID(), 493650 , 0)   ----對全體施放一個Dot的法術。
						sleep(10)
						counter_p1_3 = 0
					end
					
				elseif 	CheckBuff (OwnerID() , Mode2) == true then
					sleep(10)
					counter_p2_1 = counter_p2_1 + 1
					counter_p2_2 = counter_p2_2 + 1
					--Say (OwnerID() , "counter_p2_1="..counter_p2_1)
					--Say (OwnerID() , "counter_p2_2="..counter_p2_2)
					
					if counter_p2_1 == 1 then    -----啟動第二階段用，所以不加上『計算階段時間』的判斷。此counter 不歸零。
						local del_tree1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
						DelObj ( del_tree1  ) 
						local Tree_11 = Lua_DW_CreateObj( "flag" , 102313 , 780385 , 1 )
						WriteRoleValue( Tree_11 , EM_RoleValue_PID , OwnerID() )
						WriteRoleValue( OwnerID() , EM_RoleValue_Register1   , Tree_11 )   -----將樹長老的ID寫入樹王的Register內
						SetModeEx( Tree_11   , EM_SetModeType_Move, false )--移動      ---- 目的為了不讓黑暗樹長老移動，但是可以索敵
						SetModeEx( Tree_11   , EM_SetModeType_Fight , false )--不可砍殺攻擊
						SetModeEx( Tree_11   , EM_SetModeType_Strikback, true )--反擊
						SetModeEx( Tree_11   , EM_SetModeType_SearchenemyIgnore, true )--被搜尋
						SetModeEx( Tree_11   , EM_SetModeType_Mark, true )--標記
						SetAttack( Tree_11 , AttackTarget )
						sleep(10)
						local del_tree2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
						DelObj ( del_tree2  ) 
						local Tree_22 = Lua_DW_CreateObj( "flag" , 102314 , 780386 , 1 )   ----生出四個黑暗樹長老，在原先長老的位置
						WriteRoleValue( Tree_22 , EM_RoleValue_PID , OwnerID() )
						WriteRoleValue( OwnerID() , EM_RoleValue_Register2   , Tree_22 )
						SetModeEx( Tree_22   , EM_SetModeType_Move, false )--移動
						SetModeEx( Tree_22   , EM_SetModeType_Fight , false )--不可砍殺攻擊
						SetModeEx( Tree_22   , EM_SetModeType_Strikback, true )--反擊
						SetModeEx( Tree_22   , EM_SetModeType_SearchenemyIgnore, true )--被搜尋
						SetModeEx( Tree_22   , EM_SetModeType_Mark, true )--標記
						SetAttack( Tree_22 , AttackTarget )
						sleep(10)
						local del_tree3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
						DelObj ( del_tree3  )
						local Tree_33 = Lua_DW_CreateObj( "flag" , 102315 , 780387 , 1 )
						WriteRoleValue( Tree_33 , EM_RoleValue_PID , OwnerID() )                   -----並且將樹王的 ID 都記入每個樹長老的PID中，因為樹長老死掉後，會讓樹王扣血。
						WriteRoleValue( OwnerID() , EM_RoleValue_Register3   , Tree_33 )
						SetModeEx( Tree_33   , EM_SetModeType_Move, false )--移動
						SetModeEx( Tree_33   , EM_SetModeType_Fight , false )--不可砍殺攻擊
						SetModeEx( Tree_33   , EM_SetModeType_Strikback, true )--反擊
						SetModeEx( Tree_33   , EM_SetModeType_SearchenemyIgnore, true )--被搜尋
						SetModeEx( Tree_33   , EM_SetModeType_Mark, true )--標記
						SetAttack( Tree_33 , AttackTarget )
						sleep(10)
						local del_tree4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
						DelObj ( del_tree4  ) 
						local Tree_44 = Lua_DW_CreateObj( "flag" , 102336 , 780388 , 1 )
						WriteRoleValue( Tree_44 , EM_RoleValue_PID , OwnerID() )
						WriteRoleValue( OwnerID() , EM_RoleValue_Register4   , Tree_44 )
						SetModeEx( Tree_44   , EM_SetModeType_Move, false )--移動
						SetModeEx( Tree_44   , EM_SetModeType_Fight , false )--不可砍殺攻擊
						SetModeEx( Tree_44   , EM_SetModeType_Strikback, true )--反擊
						SetModeEx( Tree_44   , EM_SetModeType_SearchenemyIgnore, true )--被搜尋
						SetModeEx( Tree_44   , EM_SetModeType_Mark, true )--標記
						SetAttack( Tree_44 , AttackTarget )
						sleep(10)
						BeginPlot(Tree_11,"LuaS_Discowood_CheckPeace",0)     -------------以下四行為，如果四個樹長老在 8.5 秒內
						BeginPlot(Tree_22,"LuaS_Discowood_CheckPeace",0)
						BeginPlot(Tree_33,"LuaS_Discowood_CheckPeace",0)
						BeginPlot(Tree_44,"LuaS_Discowood_CheckPeace",0)
						SetPlot( Tree_11,"dead","Lua_apon_TreeLeader_dead_HP",50 )  --死亡劇情
						SetPlot( Tree_22,"dead","Lua_apon_TreeLeader_dead_HP",50 )  --死亡劇情
						SetPlot( Tree_33,"dead","Lua_apon_TreeLeader_dead_HP",50 )  --死亡劇情
						SetPlot( Tree_44,"dead","Lua_apon_TreeLeader_dead_HP",50 )  --死亡劇情
					end	
					
					if counter_p2_2 == 6 then     -----從這一行起開始第二階段，四個黑暗長老的車輪戰，黑暗長老的存在時間和叫出時間由下方的for迴圈控制
						local T1 = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)   ----將樹王的 Register 讀出來 
						local T2 = ReadRoleValue(OwnerID() , EM_RoleValue_Register2)
						local T3 = ReadRoleValue(OwnerID() , EM_RoleValue_Register3)
						local T4 = ReadRoleValue(OwnerID() , EM_RoleValue_Register4)
						local Boss_chose = { T1 , T2 , T3 , T4 }  ----做出一個可以選擇的陣列
						SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--移動
						SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--不可砍殺攻擊
						SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )----不可反擊
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_08]", 1 ) ---臭蟲們...就...讓...你們...瞧瞧...長老們...真正的...力量吧！！
						sleep(15)
						CastSpell( OwnerID(), OwnerID(), 493584 )  ----傳送術的特效
						AddBuff (OwnerID() , 503888 , 0 , 90)    ----樹王對自己上一個不會普攻的Buff
						sleep(15)
						SetPosByFlag( OwnerID(), 780389 , 1 )
						CancelBuff ( OwnerID() , 503888)
						sleep(30)
						local Tree_leader = 0
						for i = 1 , table.getn ( Boss_chose) , 1 do     -----相當於是 for i = 1 , 4 , 1 do ， 反正此迴圈也只跑四次，在陣列中，有多少東西，就跑幾次
							local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
							if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
								Tree_leader = DW_Rand( table.getn ( Boss_chose))   ----去Rand在 Boss_chose 陣列中的四個值
			
								if Boss_chose[Tree_leader] == T1 then
									CastSpell( OwnerID(), Boss_chose[Tree_leader] , 493589 )   -----樹王對 Rand 到的樹長老施放一個法術
								end
			
								if Boss_chose[Tree_leader] == T2 then
									CastSpell( OwnerID(), Boss_chose[Tree_leader] , 493589 )   -----樹王對 Rand 到的樹長老施放一個法術
								end
			
								if Boss_chose[Tree_leader] == T3 then
									CastSpell( OwnerID(), Boss_chose[Tree_leader] , 493589 )   -----樹王對 Rand 到的樹長老施放一個法術
								end
			
								if Boss_chose[Tree_leader] == T4 then
									CastSpell( OwnerID(), Boss_chose[Tree_leader] , 493589 )   -----樹王對 Rand 到的樹長老施放一個法術
								end
							else
								break
							end	
								
							table.remove ( Boss_chose , Tree_leader)  -----將 Rand 出來的值 從 原來陣列中刪除  ----已經可以正確的選擇到
							table.getn ( Boss_chose)    -------在上行中，已將陣列中的一個值刪除，所以陣列的長度，要重新讀過。
							sleep(300)   -----加上黑暗樹長老說話和技能的時間，所以，一個迴圈sleep 40 秒 
						end
						
					end
							
				elseif 	CheckBuff (OwnerID() , Mode3) == true then
					--Say( OwnerID() , "Mode3 !!" )
					sleep(10)
					counter_p3_1 = counter_p3_1 + 1
					counter_p3_2 = counter_p3_2 + 1
					counter_p3_3 = counter_p3_3 + 1
					counter_p3_4 = counter_p3_4 + 1       -----這是不斷堆疊的Debuff
					--Say (OwnerID() , "counter_p3_1="..counter_p3_1)
					--Say (OwnerID() , "counter_p3_2="..counter_p3_2)
					--Say (OwnerID() , "counter_p3_3="..counter_p3_3)
					--Say (OwnerID() , "counter_p3_4="..counter_p3_4)
				
					if counter_p3_1 == 1 then
						--say(OwnerID() , "P_3 Start")
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_09]", 1 ) ---是...時候了....我的...朋友...
						sleep(10)
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_10]", 1 ) ---讓...這些...該死的...蟲子...知道...樹族的...實力....吧！！
						sleep(15)
						CastSpell (OwnerID() , OwnerID() , 493592 )---將此 Buff 貼在四個長老身上，讓樹長老在第三階段時也可以做出招式。
						SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--移動
						SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--不可砍殺攻擊
						SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )----不可反擊
						Hide(OwnerID() )
						Show(OwnerID(),roomid1 )
						sleep(10)
					end
					
					if counter_p3_2 == 4 then
						CastSpellLV( OwnerID(), AttackTarget, 493590 , 4 )----單體傷害技
						counter_p3_2 = 0
						sleep(10)
					end
					
					if counter_p3_3 == 6 then
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_11]", 1 ) ---卑賤的...臭蟲...嘗嘗...這招！！
						sleep(15)
						CastSpellLV( OwnerID(), OwnerID(), 493652 , 0 )---AE技 
						counter_p3_3 = 0
						sleep(10)
					end
					
					if counter_p3_4 == 7 then
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_12]", 1 ) ---無知...的...蟲子！！
						sleep(10)
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_13]", 1 ) ---就...讓...你們...了解...樹人...偉大的....知識...吧！！
						sleep(15)
						CastSpellLV( OwnerID(), OwnerID(), 493651 , 0 )----會堆疊的Debuff
						counter_p3_4 = 0
						sleep(10)
					end
				end
			else
				CancelBuff ( OwnerID() , 503888)
				--Say(OwnerID(),"1")
				SetPosByFlag( OwnerID(), 780389 , 1 )
				--Say(OwnerID(),"2")
				SetFightMode ( OwnerID(),1, 1, 1,1 )
				--Say(OwnerID(),"3")
				SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--移動
				SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--不可砍殺攻擊
				SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )--反擊
				sleep(10)
				--if switch == 1 then
					--for i = 1 , 50 , 1 do
						--if free_tree[i] ~= nil then 
							--if ( CheckID( free_tree[i] ) ) == true then	
								--DelObj ( free_tree[i]  )
							--end	
						--else
							--break
						--end
					--end
				--end
				--free_tree = 0
				--local D1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
				--local D2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
				--local D3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
				--local D4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
				--local D5 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				--local D6 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				--local D7 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
				--local D8 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
				--local D9 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
				--DelObj ( D1  ) 
				--DelObj ( D2  ) 
				--DelObj ( D3  ) 
				--DelObj ( D4  )
				--DelObj ( D5  )
				--DelObj ( D6  )
				--DelObj ( D7  )
				--DelObj ( D8  )
				--Delobj ( D9 )
				--CastSpell( OwnerID(), OwnerID(), 493588 )  ------如果玩家在第一階段就滅團，放此技能，則可以讓四個光明樹長老自殺
				sleep(10)
				break
			end
		end
	end
end


function Lua_apon_Tree_timer() ---計時器怪物專用
	local switch = 0
	local free_tree = {}
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--將PID中的Boss的GID讀出來
	local Boss_die = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
	while 1 do 
		sleep(10)
		local counter1 = 0
		local counter2 = 0
		local Mode1 = 503909
		local Mode2 = 503910
		local Mode3 = 503911
		while 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1
			--say (Boss,"Counter1="..counter1)
			--say (Boss,"Counter2="..counter2)
			
			if counter1 == 30 then ---原本120
				if CheckBuff(Boss , Mode1)	== true  then
					CancelBuff( Boss , Mode1 )
					AddBuff( Boss , Mode2 , 0 , -1 )
				end
			
			elseif counter2 == 60 then ---原本240
				if CheckBuff(Boss , Mode2) == true then
					CancelBuff( Boss , Mode2 )
					AddBuff( Boss , Mode3 , 0 , -1 )
				end
			end
			
			if Boss_die == 1 then
				for i = 1 , 50 , 1 do
					if free_tree[i] ~= nil then 
						if ( CheckID( free_tree[i] ) ) == true then	
							DelObj ( free_tree[i]  )
						end	
					else
						break
					end
				end
				sleep(20)
				Delobj(OwnerID())
			end
		
			local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID ) --- 如果王進入戰鬥
			if  ( AttackTarget ~= 0 ) and ( CheckID(Boss) ) == true then
				sleep(30)
				if switch == 0 then
					switch = 1
					for i = 1 , 50 do ---將阻擋門生出來
						free_tree[i] = Lua_DW_CreateObj( "flag" ,102392, 780408 ,i )   
						SetModeEx( free_tree[i]   , EM_SetModeType_Show, false )
						SetModeEx( free_tree[i]   , EM_SetModeType_Mark, false )
					end
				end	
			
			else
				if switch == 1 then
					for i = 1 , 50 , 1 do
						if free_tree[i] ~= nil then 
							if ( CheckID( free_tree[i] ) ) == true then	
								DelObj ( free_tree[i]  )
								--Say(OwnerID(),"del door")
							end	
						else
							break
						end
					end
				end
				
				local D1 = ReadRoleValue(Boss,EM_RoleValue_Register7)
				local D2 = ReadRoleValue(Boss,EM_RoleValue_Register8)
				local D3 = ReadRoleValue(Boss,EM_RoleValue_Register9)
				local D4 = ReadRoleValue(Boss,EM_RoleValue_Register10)
				local D5 = ReadRoleValue(Boss,EM_RoleValue_Register1)
				local D6 = ReadRoleValue(Boss,EM_RoleValue_Register2)
				local D7 = ReadRoleValue(Boss,EM_RoleValue_Register3)
				local D8 = ReadRoleValue(Boss,EM_RoleValue_Register4)
				DelObj ( D1  ) 
				DelObj ( D2  ) 
				DelObj ( D3  ) 
				DelObj ( D4  )
				DelObj ( D5  )
				DelObj ( D6  )
				DelObj ( D7  )
				DelObj ( D8  )
				sleep(20)
				Delobj(OwnerID())
			end
		end
	end
end

			
function Lua_apon_killflag()  ----阻擋門碰撞
	while 1 do
		sleep(10) 
		SetPlot( OwnerID(),"Collision","Lua_apon_leave_check_1",0 ) ---碰撞傳送
	end
end


function Lua_apon_leave_check_1()  ---經過碰撞後，將玩家傳送到一個定點
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_14]", 1 )---想...逃...嗎？你...這...無知...的...臭蟲
	SetPosByFlag( OwnerID(), 780389 , 3 )
end



function Lua_apon_TreeLeader_dead_HP()   -------樹長老的死亡劇情，會扣樹王的血量。

	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)
	local Check_HP = (BossNowHP/BossMaxHP)*100
	
	if Check_HP >= 6 then
		WriteRoleValue(Boss , EM_RoleValue_HP , BossNowHP-BossMaxHP*0.05)
	else
		KillID(TargetID(),Boss)
	end
end

function Lua_apon_Holytree_dead_1()  ----樹王死後先將此替代物生出來
	Hide(OwnerID())
	local Door_leader = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)---讀出計時器
	WriteRoleValue( Door_leader , EM_RoleValue_Register2   , 1 ) ----如果王死了，將計時器的Register2 改成 1 
	local King_1 = Lua_DW_CreateObj( "flag" ,102119, 780389 ,1)
	SetModeEx( King_1   , EM_SetModeType_Show , false )
end

function Lua_apon_Holytree_dead_2()  ----將此劇情掛在王的說話者身上
	sleep(50)
	local King = Lua_DW_CreateObj( "flag" ,102338, 780389 ,1)
	AddBuff(King,503888,1,-1) --上一個不能夠普攻的Buff
	local GoodTree_1 = Lua_DW_CreateObj( "flag" ,102337, 780385 ,1)   ---objid , flagid , flagnum , 數量
	local GoodTree_2 = Lua_DW_CreateObj( "flag" ,102389, 780386 , 1)  ---objid , flagid , flagnum , 數量
	local GoodTree_3 = Lua_DW_CreateObj( "flag" ,102390, 780387 , 1)  ---objid , flagid , flagnum , 數量
	local GoodTree_4 = Lua_DW_CreateObj( "flag" ,102391, 780388 , 1)  ---objid , flagid , flagnum , 數量，以上四個為樹王死後生出來的
	sleep(30)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_01]", 1 )  ----我...我...我...是...怎麼...了？
	sleep(20)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_02]", 1 )  ----人類！是...你們...解救...我們...的....嗎？
	sleep(20)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_03]", 1 )  ------人類...我...的...朋友
	sleep(20)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_16]", 1 )----愚昧的...大蟲子
	sleep(20)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_17]", 1 )----你...認為...你還可以...躲藏...多久 ? 
	sleep(20)
	sysCastSpellLV( King , King  , 493900 , 1 )---巨蟲王現身
	sleep(10)
	local Bug_king = Lua_DW_CreateObj( "flag" ,102568, 780393 ,2)---生出巨蟲王
	SetModeEx( Bug_king , EM_SetModeType_Move, false )--移動 不可    
	AddBuff(Bug_king,503888,1,-1) --上一個不能夠普攻的Buff
	sleep(20)
	CancelBuff( King, 503888 )
	SetAttack( King , Bug_king )
	SetAttack( Bug_king , King )
	sleep(50)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_18]", 1 )  ----聖樹法里諾的...存在...不是你...所可以...動搖的
	sleep(10)
	CastSpellLV( King , Bug_king  , 493785 , 1 )---聖樹之怒
	sleep(10)
	Delobj(King)
	local King_1 = Lua_DW_CreateObj( "flag" ,113387, 780389 ,1)---生出任務用NPC
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_102307_04]", 1 )----聖樹法里諾...在此...奉上...我們...的...謝禮
	sleep(10)
	local Box =  Lua_DW_CreateObj( "flag" ,102388, 780393 ,1) ---寶箱的生出點
end