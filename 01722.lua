function Apon_102475_timer_Easy() ---計時器怪物專用
	while 1 do 
		sleep(10)
		local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--將PID中的Boss的GID讀出來
		local counter1 = 0
		local counter2 = 0
		local Check_Boss = 0 ---狂暴機制的防止
		while 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1
			if counter1 == 1 then
				AddBuff(Boss,504215,0,-1) ---Mod_1
				--say (OwnerID(),"Mod_1")
			elseif counter1 == 40 then
				AddBuff(Boss,504216,0,-1) ---Mod_2
				--say (OwnerID(),"Mod_2")
			elseif counter1 == 70 then  --重置
				counter1 = 0
			end
		end
	end
end


function Apon_102475_Die_Easy()---Boss死亡劇情
	local Clear_7 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
	local Boss_Door_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	PlayMotionEX( Boss_Door_2 ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	SetModeEX( Boss_Door_2 , EM_SetModeType_Obstruct , false )
	Hide( Boss_Door_2 )
	Show( Boss_Door_2 , RoomID )
	Delobj(Clear_7)
end



function Apon_102475_AI_Easy()---Boss本體AI
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_Door_2 = CreateObjByFlag( 103801 , 780389 , 4 , 1 )
	SetModeEx( Boss_Door_2   , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Boss_Door_2   , EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( Boss_Door_2   , EM_SetModeType_Mark, false )--標記
	Hide(Boss_Door_2)
	Show(Boss_Door_2,roomid1)
	AddToPartition( Boss_Door_2,roomid1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register8   , Boss_Door_2 )
	local Check_pet = 0  ---判斷寵物進入戰鬥用
	while 1 do 
		sleep(10)
		local Mode1 = 504215
		local Mode2 = 504216
		--local Mode3 = 504260 ---簡易副本不需要狂暴機制
		local jail_flag = 780418 ----牢房內旗標
		local king_flag = 780387 ----王的重生旗標，第二隻
		local CombatBegin = 0	-------------戰鬥開始旗標
		local Skill = { 493715, 493714 , 493718 , 493717 , 493716 , 493861 , 493860}--Boss技能表，1. 電磁斬、2. 持鎚隨機高傷、3. 持鎚隨機AE暈、4. 武器合體SP、5. 表演抓玩家入牢房、6. Boss 狂暴技、7.丟斧
		local SkillLv = {0 , 2 , 0 , 0 , 0 , 0 , 0}  ---技能等級
		local SkillString = { "[SC_102475_01]" , "[SC_102475_02]" , "[SC_102475_03]" , "[SC_102475_04]" , "[SC_102475_05]" , "[SC_102475_06]" , "[SC_102475_07]" }  ----出招string
----------------1. 懦弱的族類！不配受到女神的祝福！  2. 弱小的種族！螻蟻是你新的名字！ 3. 制裁者的周圍突然發出強大的能量 
------------------4. 見過地獄嗎？ 格拉默將達成螻蟻們的願望！  5.懺悔吧！悔恨吧！ 螻蟻！ 6. 無知的族類！你已無任何的機會了！再多的懺悔也無法阻止這一切的發生！   7. 螻蟻！用脆弱的肉體來體會真正的毀滅吧！！
		local jail_Rand = {} 
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
		local PPL = SetSearchAllPlayer(roomid1 )
		local counter_p1_1 = 0   
		local counter_p1_2 = 0   
		local counter_p1_3 = 0     
		local counter_p1_4 = 0 
		local counter_p1_5 = 0
		local counter_p1_6 = 0
		local counter_p2_1 = 0
		local counter_p2_2 = 0
		local counter_p2_3 = 0
		local counter_p2_4 = 0
		local counter_p2_5 = 0
		local counter_p2_6 = 0
		local counter_p3_1 = 0 
		local counter_p3_2 = 0 
		local HateTable_Now = {}
		local jail_buff = {504265,504266,504267}
		local RD_time = 0
		local SW_Mob = 0 ---控制追人小怪
		local SW_Axe = 1 ----控制丟斧
		local SW_Mod_2_1 = 0 ---放小怪
		local SW_Mod_2_2 = 1 ----殺小怪
		local Luck ----隨機出招用
		local king_rebon = 0
		
		while 1 do	
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
				
				if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---如果是非玩家進入戰鬥
					local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
					SetPosByFlag( Pet_owner , 780444, 1 )
					Check_pet = 1
				end
					
				local Luck = Rand( 100 )		--------- 出招亂數
				local BossTarget = AttackTarget
				local SkillIndex = 1
				if CombatBegin == 0 then ---戰鬥啟動時發動
					king_rebon = 1
					SetPlot( OwnerID(),"dead","Apon_102475_Die_Easy",50 )  --死亡劇情，開門用
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102475_08]" , 1 )---這神聖的殿堂，只有神才能踏入！
					--Yell( OwnerID() , "[SC_102475_08]" , 5)
					sleep(10)
					
					local Boss_Door_1 = CreateObjByFlag( 103248 , 780389 , 3 , 1 )---封住入口門
					SetModeEx( Boss_Door_1   , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
					SetModeEx( Boss_Door_1   , EM_SetModeType_Obstruct, true )--阻擋
					SetModeEx( Boss_Door_1   , EM_SetModeType_Mark, false )--標記
					Hide(Boss_Door_1)
					Show(Boss_Door_1,roomid1)
					AddToPartition( Boss_Door_1,roomid1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register7   , Boss_Door_1 )
					
					CastSpellLV( OwnerID() , BossTarget , 493715 , 0 ) --開場小菜
					sleep(10)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102475_09]" , 1 )---卑賤的族類！不配！
					--Yell( OwnerID() , "[SC_102475_09]" , 5)
					sleep(15)
					CastSpellLV( OwnerID() , BossTarget , 493714 , 2 ) --開場小菜
					sleep(10)
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_102475_14]" , 1 )---就在此長眠吧！
					--Yell( OwnerID() , "[SC_102475_14]" , 5)
					sleep(20)
					
					local Timer = CreateObjByFlag( 103240 , 780385 , 1 , 1 )---種出時間記數器
					WriteRoleValue( Timer , EM_RoleValue_PID , OwnerID() ) ---將Boss的GID寫入計數器的PID中
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1   , Timer ) ---將計時器GID寫入Boss的 Register1 中   
					SetModeEx( Timer   , EM_SetModeType_Show, true )
					SetModeEx( Timer  , EM_SetModeType_Mark, false )
					AddToPartition( Timer,roomid1 )
					Show(Timer,roomid1)
					local Mob_killer = CreateObjByFlag( 103245 , 780387 , 1 , 1 )----生出一個殺小機器人用的怪物 Vistoar
					WriteRoleValue( OwnerID() , EM_RoleValue_Register3   , Mob_killer )
					AddToPartition( Mob_killer,roomid1 )
					Show(Mob_killer,roomid1)
					CombatBegin = 1
					sleep(20)
				end
				
				if CheckBuff(OwnerID() , Mode1) == true then ---出怪&丟斧頭打死怪的階段
					counter_p1_1 = counter_p1_1 + 1 ---出怪時間
					counter_p1_2 = counter_p1_2 + 1 ----丟斧頭時間
					counter_p1_3 = counter_p1_3 + 1 ----普通招式
					counter_p1_4 = counter_p1_4 + 1 ----普通招式時間控制用
					counter_p1_5 = counter_p1_5 + 1 
					counter_p1_6 = counter_p1_6 + 1 ----Mod_1 所有counter 歸零用
					
					Luck = Rand( 100 )--雖機出招用
					
					if counter_p1_1 >= 1 then ---三隻怪清除階段
						SW_Mod_2_1 = 0
						SW_Mod_2_2 = 0
						local Mob_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
						local Mob_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
						local Mob_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
						local OP_1 = ReadRoleValue(Mob_1,EM_RoleValue_PID) 
						local OP_2 = ReadRoleValue(Mob_2,EM_RoleValue_PID) 
						local OP_3 = ReadRoleValue(Mob_3,EM_RoleValue_PID) 
						sleep(10)
						Delobj(Mob_1)
						Delobj(Mob_2)
						Delobj(Mob_3)
						CancelBuff(OP_1,504265)
						CancelBuff(OP_2,504266)
						CancelBuff(OP_3,504267)
					end
					
					if counter_p1_6 >= 36 then
						counter_p1_1 = 0
						counter_p1_2 = 0
						counter_p1_3 = 0
						counter_p1_4 = 0
						counter_p1_5 = 0
						counter_p1_6 = 0
						SW_Mob = 0 ---控制追人小怪--將這兩個重置
						SW_Axe = 1 ----控制丟斧
					end	
					
					if counter_p1_1 >= 2 and SW_Mob == 0 then ---出追人小怪，只出一隻
						SW_Axe = 0
						SW_Mob = 1
						local Mob_killer = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)---將殺機器人的小怪的Gid讀出來
						local MobTarget = 0
						CastSpellLV( OwnerID() , OwnerID() , 493866 , 0 )---叫小怪出場時用
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102475_10]" , 1 )---遠處發出了巨響，有一股能量正在接近
						Yell( OwnerID() , "[SC_102475_10]" , 5)
						
						sleep(20)---此法術要唱2秒
						for i = 1 , 100 , 1 do
							MobTarget = HateTargetID()
							if ReadRoleValue( MobTarget , EM_RoleValue_IsDead ) ~= 1 then  ----將隨機的一人設定成目標
								local Mob_X = ReadRoleValue (MobTarget , EM_RoleValue_X) --讀出該座標	
								local Mob_Y = ReadRoleValue (MobTarget , EM_RoleValue_Y) --讀出該座標	
								local Mob_Z = ReadRoleValue (MobTarget , EM_RoleValue_Z) --讀出該座標	
								local Mob_Dir = ReadRoleValue (MobTarget , EM_RoleValue_Dir) --讀出該座標	
								local Mob = CreateObj( 103243 , Mob_X+80 , Mob_Y , Mob_Z ,Mob_Dir , 1 ) 
								AddToPartition( Mob,roomid1 )
								sysCastSpellLV( Mob , Mob  , 493900 , 1 )---機器人出來前的特效
								WriteRoleValue( Mob , EM_RoleValue_PID , MobTarget )----將玩家的GID存入到追人怪的PID中
								Hide(Mob)
								Show(Mob,roomid1)
								WriteRoleValue( Mob , EM_RoleValue_PID , Mob_killer )
								SetAttack( Mob ,MobTarget  ) ----隨機找一個目標
								sysCastSpellLV( MobTarget , Mob  , 493865 , 999 )---系統讓玩家出招『玩家對怪物挑釁』
								
								BeginPlot(Mob,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
								counter_p1_1 = 0
								break ---如果條件達成則跳出這個for迴圈
							end
						end
					
					RD_time = Rand(5)
					
					elseif counter_p1_2 >=(9+RD_time) and SW_Axe == 0 then
						local Mobtarget_1 = 0
						SkillIndex = 7 
						for i = 1 , PPL , 1 do 
							Mobtarget_1 = HateTargetID()
							if ReadRoleValue( Mobtarget_1 , EM_RoleValue_IsDead ) ~= 1 then  ----將隨機的一人設定成目標
								local MessageString
								local PlayerName = GetName( Mobtarget_1 )
								MessageString = "[SC_102475_07][$SETVAR1="..PlayerName.."]" ----在string中可以秀出玩家的名字
								ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
								Yell( OwnerID() , MessageString , 5)
								
								sleep(20)
								CastSpellLV( OwnerID(), Mobtarget_1, 493860 , 1) ---對此目標做出丟斧的動作
								sleep(30)
								local Axe_X = ReadRoleValue (Mobtarget_1 , EM_RoleValue_X) --讀出該座標	
								local Axe_Y = ReadRoleValue (Mobtarget_1 , EM_RoleValue_Y) --讀出該座標	
								local Axe_Z = ReadRoleValue (Mobtarget_1 , EM_RoleValue_Z) --讀出該座標	
								local Axe_Dir = ReadRoleValue (Mobtarget_1 , EM_RoleValue_Dir) --讀出該座標	
								local Axe = CreateObj( 103244 , Axe_X , Axe_Y , Axe_Z ,Axe_Dir , 1 ) ---將斧頭生在該目標的點上
								WriteRoleValue( Axe , EM_RoleValue_PID , OwnerID() )
								WriteRoleValue( OwnerID() , EM_RoleValue_Register2   , Axe )----將斧頭的GID存入Boss之二
								--SetModeEx( Axe   , EM_SetModeType_Move, false )--移動
								SetModeEx( Axe   , EM_SetModeType_ShowRoleHead, false )--頭像框
								SetFightMode ( Axe,0,0,0,0)---關掉所有功能
								AddToPartition( Axe,roomid1 )
								Hide(Axe)
								Show(Axe,roomid1)
								SetAttack( Axe ,Mobtarget_1  ) ----找一個目標
								CastSpellLV( Axe , Axe , 493862 , 0 )---斧頭落下的傷害
								sysCastSpellLV( Axe , Axe  , 493863 , 1) --- 斧頭發出殺小怪用
								sleep(20)
								Delobj(Axe)---斧頭落下後則消滅
								SW_Axe = 1
								SW_Mob = 0
								counter_p1_2 = 0
								break
							end
						end
					
					elseif counter_p1_3 >= 6 and counter_p1_4 <= 28 then ---一般的技能
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							BossTarget = AttackTarget
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
								SkillIndex = 2
								BossTarget = HateTargetID()									
						end		
							ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
							--Yell( OwnerID() , SkillString[SkillIndex] , 5)
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
							sleep(10)
							counter_p1_3 = 0
					
					elseif counter_p1_5 >= 10 and counter_p1_4 <= 22 then ---隨機，AE暈
						if (Luck >= 0 and Luck < 25) or (Luck >= 70 and Luck < 100) then
							SkillIndex = 3
							BossTarget = OwnerID()
							ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
							--Yell( OwnerID() , SkillString[SkillIndex] , 5)
							sleep(10)
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
						end
						counter_p1_5 = 0
					end
					
				elseif CheckBuff(OwnerID() , Mode2) == true then ---三個魯小怪追三人階段
					
					Luck = Rand( 100 )--隨機出招用
					jail_Rand = {}
					HateTable_Now = {}---需要再將HateTable_Now中清空
					counter_p2_1 = counter_p2_1 + 1 ----選三個人階段
					counter_p2_2 = counter_p2_2 + 1  -----三隻怪清除階段
					counter_p2_3 = counter_p2_3 + 1   ----普通招式階段
					counter_p2_4 = counter_p2_4 + 1    ----限制時間用
					counter_p2_5 = counter_p2_5 + 1     ----隨機招式用
					counter_p2_6 = counter_p2_6 + 1      ----Mod_2 所有counter 歸零用
					
					if counter_p2_6 >= 28 then
						counter_p2_1 = 0
						counter_p2_2 = 0
						counter_p2_3 = 0
						counter_p2_4 = 0
						counter_p2_5 = 0
						counter_p2_6 = 0
					end
					
					if counter_p2_1 >= 2 and SW_Mod_2_1 == 0 and counter_p2_4 <= 27 then ---選三個人階段
					
						counter_p2_1 = 0
						SW_Mod_2_1 = 1
						SW_Mod_2_2 = 1
						local Rand_Chose = 0
						SkillIndex = 5
						ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
						Yell( OwnerID() , SkillString[SkillIndex] , 5)
						CastSpellLV( OwnerID() , OwnerID()  , Skill[SkillIndex] , SkillLv[SkillIndex] ) 
						sleep(10)
						jail_Rand = DW_HateRemain(1) ---這個table中沒有仇恨最高者
						
						for i = 1, table.getn(jail_Rand) do
							if ReadRoleValue( jail_Rand[i] , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( jail_Rand[i] , EM_RoleValue_VOC ) ~= 0 then  
								table.insert( HateTable_Now , jail_Rand[i] ) ---將正確的值，放入HateTable中
							end
						end
						
						for i = 1 , 3 , 1 do ---取三個玩家
							Rand_Chose = DW_Rand( table.getn (HateTable_Now))
							
							if HateTable_Now[Rand_Chose] ~= nil then 
							
								if i == 1 then ---103250---不在固定點生出，以在目標玩家附近生出
									local Mob_X_1 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_X) --讀出該座標	
									local Mob_Y_1 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Y) --讀出該座標	
									local Mob_Z_1 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Z) --讀出該座標	
									local Mob_Dir_1 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Dir) --讀出該座標	
									local Mob_1 = CreateObj( 103250 , Mob_X_1+80 , Mob_Y_1 , Mob_Z_1 ,Mob_Dir_1 , 1 ) 
									--SetModeEx( Mob_1   , EM_SetModeType_ShowRoleHead, false )--頭像框
									--SetModeEx( Mob_1   , EM_SetModeType_Fight, false )--不可砍殺
									WriteRoleValue( OwnerID() , EM_RoleValue_Register4   , Mob_1 )
									WriteRoleValue( Mob_1 , EM_RoleValue_PID , HateTable_Now[Rand_Chose] )---將被挑中的玩家存入怪物的PID中
									AddToPartition( Mob_1,roomid1 )
									Hide(Mob_1)
									Show(Mob_1,roomid1)
									SetAttack( Mob_1 ,HateTable_Now[Rand_Chose]) ----隨機找一個目標
									AddBuff(HateTable_Now[Rand_Chose],504265,0,-1)---怪物1號Buff
									sysCastSpellLV( HateTable_Now[Rand_Chose] , Mob_1  , 493865 , 999 )---系統讓玩家出招『玩家對怪物挑釁』
									BeginPlot(Mob_1,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
									
								elseif i == 2 then ---103242
									local Mob_X_2 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_X) --讀出該座標	
									local Mob_Y_2 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Y) --讀出該座標	
									local Mob_Z_2 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Z) --讀出該座標	
									local Mob_Dir_2 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Dir) --讀出該座標	
									local Mob_2 = CreateObj( 103242 , Mob_X_2+80 , Mob_Y_2 , Mob_Z_2 ,Mob_Dir_2 , 1 ) 
									--SetModeEx( Mob_2   , EM_SetModeType_ShowRoleHead, false )--頭像框
									--SetModeEx( Mob_2   , EM_SetModeType_Fight, false )--不可砍殺
									WriteRoleValue( OwnerID() , EM_RoleValue_Register5   , Mob_2 )
									WriteRoleValue( Mob_2, EM_RoleValue_PID , HateTable_Now[Rand_Chose] )---將被挑中的玩家存入怪物的PID中
									AddToPartition( Mob_2,roomid1 )
									Hide(Mob_2)
									Show(Mob_2,roomid1)
									SetAttack( Mob_2 ,HateTable_Now[Rand_Chose]  ) ----隨機找一個目標
									AddBuff(HateTable_Now[Rand_Chose],504266,0,-1)---怪物2號Buff
									BeginPlot(Mob_2,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
									sysCastSpellLV( HateTable_Now[Rand_Chose] , Mob_2  , 493865 , 1 )---系統讓玩家出招『玩家對怪物挑釁』
									
								elseif i == 3 then  ----103247
									local Mob_X_3 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_X) --讀出該座標	
									local Mob_Y_3 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Y) --讀出該座標	
									local Mob_Z_3 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Z) --讀出該座標	
									local Mob_Dir_3 = ReadRoleValue (HateTable_Now[Rand_Chose] , EM_RoleValue_Dir) --讀出該座標	
									local Mob_3 = CreateObj( 103247 , Mob_X_3+80 , Mob_Y_3 , Mob_Z_3 ,Mob_Dir_3 , 1 ) 
									--SetModeEx( Mob_3   , EM_SetModeType_ShowRoleHead, false )--頭像框
									--SetModeEx( Mob_3   , EM_SetModeType_Fight, false )--不可砍殺
									WriteRoleValue( OwnerID() , EM_RoleValue_Register6   , Mob_3 )
									WriteRoleValue( Mob_3 , EM_RoleValue_PID , HateTable_Now[Rand_Chose] )---將被挑中的玩家存入怪物的PID中
									AddToPartition( Mob_3,roomid1 )
									Hide(Mob_3)
									Show(Mob_3,roomid1)
									SetAttack( Mob_3 ,HateTable_Now[Rand_Chose]  ) ----隨機找一個目標
									AddBuff(HateTable_Now[Rand_Chose],504267,0,-1)---怪物3號Buff
									BeginPlot(Mob_3,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
									sysCastSpellLV( HateTable_Now[Rand_Chose] , Mob_3  , 493865 , 1 )---系統讓玩家出招『玩家對怪物挑釁』
								end
							else
								break
							end
							table.remove ( HateTable_Now , Rand_Chose) ---將選到人從table中移除
						end
					
					elseif counter_p2_3 >= 5 and counter_p2_4 <= 27 then ---一般的技能
						
						if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then
							SkillIndex = 1
							BossTarget = AttackTarget
						elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then	
								SkillIndex = 2
								BossTarget = HateTargetID()									
						end		
							ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
							CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
							sleep(10)
							counter_p2_3 = 0
					
					elseif counter_p2_5 >= 10 and counter_p2_4 <= 22 then ---隨機，SP技
						if (Luck >= 0 and Luck < 30) or (Luck >= 70 and Luck < 100) then
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102475_13]" , 1 )
							Yell( OwnerID() , "[SC_102475_13]" , 5)
							sleep(10)
							CastSpellLV( OwnerID(), OwnerID(), 493868 , 0) ---Boss前方的扇形傷害
							sleep(30)
						end
						sleep(10)
						counter_p2_5 = 0
					end
				end
			else
				SetPosByFlag( OwnerID(), king_flag , 2 )
				local Clear_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
				local Clear_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				local Clear_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
				local Clear_4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
				local Clear_5 = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
				local Clear_6 = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
				local Clear_7 = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)
				Delobj(Clear_1)
				Delobj(Clear_2)
				Delobj(Clear_3)
				Delobj(Clear_4)
				Delobj(Clear_5)
				Delobj(Clear_6)
				Delobj(Clear_7)
				if king_rebon == 1 then
					local Clear_8 = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)
					Delobj(Clear_8)
					local king = Lua_DW_CreateObj( "flag" ,103241, king_flag , 2,1,1)---將Boss生一隻新的
					Delobj(OwnerID())
				end
			end
		end
	end
end

				

function Apon_103241_mob_dead_Easy() ---Mod_1 機器人專用
	local OP = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while 1 do 
		sleep(10)
		if CheckBuff( OwnerID() , 504219) == true then ---如果被斧頭擊中
			AddBuff(OwnerID(),504262,1,-1) --短路的Buff
			--Say(OwnerID() , "Error")---機器人表演出短路	
			SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--移動
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--不可砍殺攻擊
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )--反擊
			Say( OwnerID() , "[SC_102475_11]")---危險～危險！目前機體完全失控！
			sleep(10)
			Say( OwnerID() , "[SC_102475_12]")---啟動自我毀滅裝置！
			sleep(10)
			CastSpellLV( OwnerID(), OwnerID(), 493867 , 50)---範圍AE，定值3000
			SetFightMode ( OwnerID(),0, 0, 0,0 )
			Delobj (OwnerID())
		end
	end
end				
						
					

				
					