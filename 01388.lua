function Lua_apon_attackfish_2()
	while 1 do
		local undead = {}
		local counter1 = 0
		local counter2 = 0
		local counter3 = 0
		local amount = 0
		
		local Mob_all = {} ----儲存馬蹄蟹用
		local Mob_Num ----目前table 中怪物的數量
		
		--local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		sleep(10)
		for i = 0 , 12000  do
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			local member = 0
			local Boss = OwnerID()
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				local partymember = LuaFunc_PartyData( AttackTarget )				
				--Say( OwnerID() , "local partymember " )
				local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )							
				--Say( OwnerID() , "local roomid1 " )
				sleep(10)
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				counter3 = counter3 + 1
				
				--say(OwnerID(),table.getn(Mob_all))
				
				if counter3 >= 15 then ---生馬蹄蟹階段
					local random_fish = DW_Rand(10)
					
					-------------------檢查馬蹄蟹數量用----------------------	
					for i = 1 , table.getn(Mob_all), 1 do
						if Mob_all[i] ~= nil and ReadRoleValue( Mob_all[i] , EM_RoleValue_IsDead) == 1 then
							table.remove ( Mob_all , i)
						end	
					end
					
					Mob_Num = table.getn(Mob_all)
					
					if Mob_Num <= 18 then ---如果生了超過18隻馬蹄蟹則不會再生
	
						local fish1 = Lua_DW_CreateObj( "flag" , 102050 , 780362 , random_fish )
						WriteRoleValue( fish1 , EM_RoleValue_PID , Boss )
						--say (fish1 , Boss)
						table.insert( Mob_all , fish1 )
						SetPlot( fish1 ,"dead","LuaS_AP_fishdie_2",50 )	
						local fish2 = Lua_DW_CreateObj( "flag" , 102049 , 780363 , random_fish )
						WriteRoleValue( fish2 , EM_RoleValue_PID , Boss )
						table.insert( Mob_all , fish2 )
						
						SetPlot( fish2 ,"dead","LuaS_AP_fishdie_2",50 )	
						local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
						local ThesePlayer = {}
						for i=1,TempPlayer do    --將全部玩家加入魚的仇恨表中
							ThesePlayer[i] = GetSearchResult() -- 接暫存值
							SetAttack( fish1 , ThesePlayer[i] ) -- 全部送進仇恨
							SetAttack( fish2 , ThesePlayer[i] ) -- 全部送進仇恨
						end
						BeginPlot(fish1,"LuaS_Discowood_CheckPeace",0)  --呼叫血高魚，若是8.5秒內未進入戰鬥狀態就會消失
						BeginPlot(fish2,"LuaS_Discowood_CheckPeace",0)  --呼叫攻高魚，若是8.5秒內未進入戰鬥狀態就會消失
					end
					counter3 = 0
				end
				
				
				if counter1 == 15 then
					local check_1 = 0
					local priest = 0
					for i = 1 , partymember[0] , 1 do						
						member = member + 1	
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then	
							--sleep(10)
							check_1 = 1
							priest = partymember[i]																									
							amount = amount + 1
							undead[amount] = lua_star_CreateNPC( partymember[i] , 0 , 102048 , 10 , roomid1)  --吸mp，針對補師
							--WriteRoleValue( undead[amount] , EM_RoleValue_PID , Boss )       --吸魔水母不用死亡劇情
							SetFightMode ( undead[amount] ,1, 1, 1,0 )
							--SetModeEx( undead[amount]   , EM_SetModeType_Fight , false )--可砍殺攻擊
							--SetModeEx( undead[amount]  ,  EM_SetModeType_Strikback, false )--反擊
							--SetModeEx( undead[amount]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
							--SetModeEx( undead[amount]   , EM_SetModeType_Searchenemy, true) --搜尋敵人
							--SetModeEx( undead[amount]   , EM_SetModeType_Mark, false )--標記
							--SetModeEx( undead[amount]   , EM_SetModeType_ShowRoleHead, false )--頭像框
							--Hide( undead[amount] )
							--AddToPartition( undead[amount] ,    RoomID )	--加進舞台
							SetAttack( undead[amount] , partymember[i] )
							--nopriest = 0
							--break					
						end
					end
					
					if check_1 == 0 then    --如果隊伍中沒有補師的話
						
						local lucky = rand(member-1)+1
						--Say( OwnerID() , lucky ) 
						amount = amount + 1
						undead[amount] = lua_star_CreateNPC( partymember[lucky] , 0 , 102048 , 10 , roomid1)
						SetFightMode ( undead[amount] ,1, 1, 1,0 )
					end		
					sleep(10)
					counter1 = 0				
				end
				
				if counter2 == 20 then
					local check_2 = 0
					local magic = 0
					for i = 1 , partymember[0] , 1 do
						member = member + 1
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 4 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then	
							--Say( OwnerID() , "if 456 " )
							sleep(10)
							check_2 = 1
							magic = partymember[i]
							amount = amount + 1
							undead[amount] = lua_star_CreateNPC( partymember[i] , 0 , 102047 , 10 , roomid1)  --控場，針對法師
							WriteRoleValue( undead[amount] , EM_RoleValue_PID , Boss )   --將Boss的PID 寫入
							--say (undead[amount] , Boss)
							SetAttack( undead[amount] , partymember[i] )
							SetPlot( undead[amount] ,"dead","LuaS_AP_fishdie_2",50 )  --死亡劇情
							--say ( undead[amount] , "999")					
						end
					end
					if check_2 == 0 then  --如果隊伍中沒有法師的話
						
						local lucky_1 = rand(member-1)+1
						--Say( OwnerID() , lucky_1 ) 
						amount = amount + 1
						undead[amount] = lua_star_CreateNPC( partymember[lucky_1] , 0 , 102047 , 10 , roomid1)
						SetPlot( OwnerID(),"dead","LuaS_AP_fishdie_2",10 )  --死亡劇情
						
					end
					sleep(10)
					counter2 = 0				
				end
			
			else
				--Say( OwnerID() , "ok" )
				for i = 1 , table.getn(undead) , 1 do
					--sleep(10)					
					if undead[i] ~= nil and CheckID(undead[i] ) == true  then
						DelObj( undead[i] )	
					end		
				end
				
				Mob_all = 0 ---將儲存馬蹄蟹的table儲存成0
				
				--undead = {}
				break		
			end
		end	
	end
end


--------------------------------  馬和水母的死亡劇情  -----------------------------------------------
function LuaS_AP_fishdie_2()

	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)
	local Check_HP = (BossNowHP/BossMaxHP)*100
	
	if Check_HP >= 4 then
		WriteRoleValue(Boss , EM_RoleValue_HP , BossNowHP-BossMaxHP*0.03)
	else
		KillID(TargetID(),Boss)
	end
end


--電流擊擊棒

function Lua_apon_bomb_1()
	SetPlot(OwnerID() , "range" ,"Lua_apon_bomb_2" , 15)
end

function Lua_apon_bomb_2()
	--local ChargeLV = 59 --技能等級
	--CastSpellLV( OwnerID() , Target , 493355 , ChargeLV )    --爆體術
	--CastSpell( OwnerID(), OwnerID(), 493355 )
	CastSpell( TargetID(), OwnerID(), 493355 )
end


--戰鼓靈氣分享

function Lua_apon_addoil()
	while 1 do		
		local counter1 = 0
		for i = 0 , 100  do
			sleep(10)
			counter1 = counter1 + 1
				if counter1 == 3 then
					CastSpell( OwnerID(), OwnerID(), 493357 )  --戰鼓靈氣
					counter1 = 0
				end
		end
	end	
end


--獅魚人打鼓修改版

function LuaS_AP_HitDrum_1()
	if 	CheckBuff(OwnerID() , 501114)  and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1		then 
		return
	end
	local Tar
	local Search = SearchRangeNPC ( OwnerID() , 20 )
	for i = 0 , table.getn(Search)+1 do
		if Search[i] ~= OwnerID() then
			if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	102064	then
				Tar = Search[i]
				break
			end
			if Search[i] == -1 then
				--SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_NORMAL)
				return
			end
		end
	end
	SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED)
	AddBuff(OwnerID(),501114,499,600)
	--CastSpellLv(OwnerID(),OwnerID(),493206,499)    --施放護盾 5000
	sleep(20)
	--Say(OwnerID(),"1")
	CastSpell(OwnerID() , OwnerID() , 493358 )
	--Say(OwnerID(),"123")
end

function LuaS_AP_HitDrum_2()
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 102064	then
		return true
	end
	return false
end

--叫鼓發出靈氣
function LuaS_AP_HitDrum_3()
	CastSpell(TargetID(),TargetID(),493357)
end

--門神靈氣_1

function Lua_apon_addoil_1()
	while 1 do		
		local counter1 = 0
		for i = 0 , 100  do
			sleep(10)
			counter1 = counter1 + 1
				if counter1 == 30 then
					CastSpell( OwnerID(), OwnerID(), 493359 )  --門神靈氣_1
					counter1 = 0
				end
		end
	end	
end


--門神靈氣_2

function Lua_apon_addoil_2()
	while 1 do		
		local counter1 = 0
		for i = 0 , 100  do
			sleep(10)
			counter1 = counter1 + 1
				if counter1 == 30 then
					CastSpell( OwnerID(), OwnerID(), 493360 )  --門神靈氣_2
					counter1 = 0
				end
		end
	end	
end




