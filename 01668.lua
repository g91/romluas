------希爾洛奧斯追隨者
----------一開始戰鬥，則會對目標唱法三秒後，會閃到玩家身後，連續轟炸
--------------每隔 7 秒，會不斷的連續電麻三名玩家
function Lua_apon_Zone120_102689()
	while 1 do 
		sleep(10)
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local BossTarget 
		local SP = 1 
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do 
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				sleep(10)
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				R_game = 1
				if SP == 1 then
					SP = 0 
					CastSpellLV( OwnerID() , AttackTarget , 494717 , 1000 )--迅冰術
					sleep(75)
				end
				
				if counter1 >= 7 then
					for i = 1 , 3 ,1 do
						BossTarget = HateTargetID()
						CastSpellLV( OwnerID() , BossTarget , 494720 , 2000 ) --電擊術
					end
					counter1 = 0
					
				elseif counter2 >= 12 then
					BossTarget = HateTargetID()
					CastSpellLV( OwnerID() , BossTarget , 494717 , 1000 )--迅冰術
					sleep(75)
					counter2 = 0
				end
			else 
				break
			end
		end	
	end
end
----------索雷爾頓魔獸控制者
-------------1. 發一個飛行法術，並且造成 3000 點傷害。擊中目標後 2 秒，產生一隻魔獸，在目標的前面，並且會攻擊目標。
function Lua_apon_Zone120_102684()
	while 1 do 
		sleep(10)
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local BossTarget 
		local SP = 1
		local Mob_all = {}
		local Mob
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local R_game = 0
		local All_mob = 0
		while 1 do 
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
				sleep(10)
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				R_game = 1
				
				for i = 1 , table.getn(Mob_all), 1 do
					if Mob_all[i] ~= nil and ReadRoleValue( Mob_all[i] , EM_RoleValue_IsDead) == 1 then
						table.remove ( Mob_all , i)
					end	
				end
				
				All_mob = table.getn(Mob_all)
				if SP == 1 and counter1 >= 5 and All_mob <= 2 then -----494716，壞血招喚術
					BossTarget = HateTargetID()
					CastSpellLV( OwnerID() , BossTarget , 494716 , 1 ) --壞血招喚術
					sleep(20)
					local Ball_2 = star_CreateObj( BossTarget , 102702 , 20 , 0 , 0 , roomid1 , 0) ---生出異化的碼卡斯
					SetFightMode ( Ball_2,0,0,0,0 )
					sleep(20)
					SetFightMode ( Ball_2,1,1,1,1 )
					SetAttack( Ball_2 , BossTarget )
					BeginPlot(Ball_2,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					table.insert( Mob_all , Ball_2 )
					SP = 0
					counter1 = 0
				
				elseif counter2 >= 7 then
					BossTarget = AttackTarget
					CastSpellLV( OwnerID() , BossTarget , 494702 , 10 )--猛擊
					sleep(10)
					counter2 = 0
				
				elseif counter3 >= 15 then
					SP = 1 ---可以再招一隻魔獸
					CastSpellLV( OwnerID() , OwnerID() , 494721 , 1 )---魔獸狂爆術
					sleep(30)
					if Checkbuff(OwnerID(),505381) == true then
						CancelBuff( OwnerID(), 505381 )
						for i = 1 , table.getn(Mob_all), 1 do
							if Mob_all[i] ~= nil and ReadRoleValue( Mob_all[i] , EM_RoleValue_IsDead) == 1 then
								table.remove ( Mob_all , i)
							end	
						end
						
						for i = 1 , table.getn(Mob_all), 1 do
							Addbuff(Mob_all[i],505366,0,30)
							--CastSpellLV( OwnerID() , Mob_all[i] , 494721 , 1 )---魔獸狂爆術
						end
					end
					counter3 = 0
				end	
			else 
				break
			end
		end
	end
end

----------蛇皇護衛軍
-----------------1. 兩個技能，一個抓目標，一個抓隨機
function Lua_apon_Zone120_102947()
	while 1 do
		sleep(10)
		local Skill = {494707, 494708} ---技能表，腹蛇爆裂、穿透直擊
		local SkillLv = {0 , 0 }  ---技能等級
		local Luck = 0
		local SkillIndex = 0
		local Skill_lv_Index = 0
		local BossTarget
		local counter1 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				R_game = 1
				if counter1 >= 7 then
					Luck = Rand( 100 )--雖機出招用
					if (Luck >= 0 and Luck < 25) or (Luck >= 50 and Luck < 75) then ---單體傷害
						SkillIndex = 1
						Skill_lv_Index = 1
						BossTarget = HateTargetID()
					elseif (Luck >= 25 and Luck < 50) or (Luck >= 75 and Luck < 100) then ----AE 傷害	
						SkillIndex = 2
						Skill_lv_Index = 1
						BossTarget = AttackTarget	
					end		
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[Skill_lv_Index] )					
					sleep(10)
					counter1 = 0	
				end	
			else
				break
			end
		end
	end
end
----------索雷爾頓研究員-----波多版
-----------------1. 先生出一隻波多在籠子裡，進入戰鬥後，則會招出魔化版波多
function Lua_apon_Zone120_102928_1()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---波多
		local Mob_id_2 = 102693 ----魔化波多
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_id , Flag_mob , 1 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----魔物招喚
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--反擊
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--索敵
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   魔性注入
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --火焰直擊
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_2()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---波多
		local Mob_1_id = 102692 ----獅魚人
		local Mob_id_2 = 102693 ----魔化波多
		local Mob_1_id_2 = 102694 ---魔化獅魚人 
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_1_id , Flag_mob , 2 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----魔物招喚
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_1_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--反擊
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--索敵
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   魔性注入
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --火焰直擊
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_3()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---波多
		local Mob_id_2 = 102693 ----魔化波多
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_id , Flag_mob , 3 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----魔物招喚
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--反擊
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--索敵
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   魔性注入
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --火焰直擊
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_4()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---波多
		local Mob_1_id = 102692 ----獅魚人
		local Mob_id_2 = 102693 ----魔化波多
		local Mob_1_id_2 = 102694 ---魔化獅魚人 
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_1_id , Flag_mob , 4 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----魔物招喚
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_1_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--反擊
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--索敵
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   魔性注入
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --火焰直擊
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_5()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---波多
		local Mob_id_2 = 102693 ----魔化波多
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_id , Flag_mob , 5 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----魔物招喚
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--反擊
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--索敵
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   魔性注入
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --火焰直擊
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_6()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---波多
		local Mob_id_2 = 102693 ----魔化波多
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_id , Flag_mob , 6 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----魔物招喚
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--反擊
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--索敵
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   魔性注入
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --火焰直擊
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_7()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---波多
		local Mob_1_id = 102692 ----獅魚人
		local Mob_id_2 = 102693 ----魔化波多
		local Mob_1_id_2 = 102694 ---魔化獅魚人 
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_1_id , Flag_mob , 7 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----魔物招喚
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_1_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--反擊
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--索敵
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   魔性注入
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --火焰直擊
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_8()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---波多
		local Mob_1_id = 102692 ----獅魚人
		local Mob_id_2 = 102693 ----魔化波多
		local Mob_1_id_2 = 102694 ---魔化獅魚人 
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_1_id , Flag_mob , 8 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----魔物招喚
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_1_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--反擊
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--索敵
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   魔性注入
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --火焰直擊
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_9()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---波多
		local Mob_id_2 = 102693 ----魔化波多
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_id , Flag_mob , 9 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----魔物招喚
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--反擊
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--索敵
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   魔性注入
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --火焰直擊
					sleep(30)
					counter2 = 0	
				
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end
function Lua_apon_Zone120_102928_10()
	local SP_mob = 1
	local SP_check = 1
	while 1 do 
		sleep(10)
		local Flag_mob = 780362
		local Mob_id = 102690 ---波多
		local Mob_1_id = 102692 ----獅魚人
		local Mob_id_2 = 102693 ----魔化波多
		local Mob_1_id_2 = 102694 ---魔化獅魚人 
		local BossTarget
		local SP = 1
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local R_game = 0
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if SP_mob == 1 and SP_check == 1 then
			local Mob_1 = CreateObjByFlag( Mob_1_id , Flag_mob , 10 , 1 ) 
			SetModeEx( Mob_1 , EM_SetModeType_Show, true) ----秀出
			SetModeEx( Mob_1 , EM_SetModeType_Mark, true) ----標記
			SetModeEx( Mob_1 , EM_SetModeType_Strikback, false) ---反擊
			SetModeEx( Mob_1 , EM_SetModeType_Move, false) ---移動	
			SetModeEx( Mob_1 , EM_SetModeType_Fight, false) ---可砍殺
			SetModeEx( Mob_1 , EM_SetModeType_Searchenemy, false)  ---索敵
			AddToPartition( Mob_1,roomid1 )
			Show(Mob_1,roomid1)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Mob_1)
			SP_mob = 0
			SP_check = 0
		end
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then		
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				SP_check = 1
				R_game = 1
				if SP ==1 then
					roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Mob_down = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
					SP = 0
					CastSpellLV( OwnerID() , OwnerID() , 494699 , 1 )----魔物招喚
					WriteRoleValue(Mob_down, EM_RoleValue_Livetime,5)
					sleep(10)
					Hide(Mob_down)
					local Ball = star_CreateObj( OwnerID() , Mob_1_id_2 , 15 , 0 , 0 , roomid1 , 0) 
					SetModeEx(Ball , EM_SetModeType_Strikback , true )--反擊
					SetModeEx(Ball , EM_SetModeType_Searchenemy , true )--索敵
					SetModeEx( Ball , EM_SetModeType_Fight, true) ----可砍殺攻擊
					BeginPlot(Ball,"LuaS_Discowood_CheckPeace",0) ---沒有進入戰鬥則會消失
					WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Ball)
					sleep(10)
				end
				
				local Mob_up = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
				if counter1 >= 7 and ( CheckID( Mob_up ) ) == true then -----494725   魔性注入
					CastSpellLV( OwnerID() , Mob_up , 494725 , 1 ) 
					sleep(10)
					counter1 = 0
					
				elseif counter2 >= 7 then
					CastSpellLV( OwnerID() , AttackTarget , 494710 , 2500 ) --火焰直擊
					sleep(30)
					counter2 = 0	
				end	
			else
				SP_mob = 1
				break
			end
		end
	end
end







