function lua_kenny_AI_blood2_easy()
		local Check_pet = 0  ---判斷寵物進入戰鬥用
		local SkillID = {493720,493721,495351,494193,493724,495352} 	--血腥漩渦，血魔深淵，血滅破甲，穿透箭，血腥箭雨
		local SkillLV = {1,1,1,1,0,1}			-- 招式LV1
		local CheckTime = 0	--每秒判斷
		
		local SkillSay = { "[SC_102425_1]", "[SC_102425_2]", "[SC_102425_3]", "[SC_102425_4]", "[SC_102425_5]" , "[SC_102425_6]"}	-- 招式說話
		--粉碎在鮮血之中吧！
		--死亡將是最終的平靜。
		--以彼之血，化身為彼之敵。
		--你們將觸怒神之真怒...
		--你們那可笑的治療將不復存在！
		--讓我之血洗淨一切罪惡。
		
		local Mode = 1
		local Smode = 40	--階段改變秒數
		local M1Time = 0
		local M2Time = 0
		local HateList = {}
		local FlagID = 780413	
		local Check_blood = 0
		local Counter = 0	--箭雨計時器
		local SafeBuff = 504307 --血之護盾
		local CzTime = 0
		local Door = {} --阻門
		local Door_Flag = 780414
		local CombatBegin1 = 0
		local Gohome = 780415
		local Spell1 = 0  --血之暈技on off
		local Rancounter = 0
		SetPlot( OwnerID() , "dead" , "Lua_kenny_Opendoor_easy" , 1000 )
	while 1 do
		
		sleep(10) --1秒
		local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --取當前目標數值		
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥	
			--啟動阻擋門

			if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---如果是非玩家進入戰鬥
				local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
				SetPosByFlag( Pet_owner , 780444, 2 )
				Check_pet = 1
			end

			if CombatBegin1 == 0 then
				ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[1], 1 )	--粉碎在鮮血之中吧！(夜倉增加對話)
				Say( OwnerID() , SkillSay[1] )	--粉碎在鮮血之中吧！(夜倉增加對話)
				Door[1] = CreateObjByFlag( 102642 , Door_Flag , 1 , 1 )
				--Door[2] = CreateObjByFlag( 102460 , Door_Flag , 2 , 1 )				
				--for i = 1 , 2 , 1 do					
					SetModeEx( Door[1]   , EM_SetModeType_Move, false )--移動
					SetModeEx( Door[1]   , EM_SetModeType_Fight , false )--不可砍殺攻擊
					SetModeEx( Door[1]   , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( Door[1]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( Door[1]   , EM_SetModeType_Mark, false )--標記
					SetModeEx( Door[1]   , EM_SetModeType_Obstruct, true )--阻擋		
					AddToPartition( Door[1] , RoomID )
					WriteRoleValue( Door[1] , EM_RoleValue_PID , OwnerID() )
				--end
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, door[1])
				--WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, door[2])
				CombatBegin1 = 1				
			end	
			
		local PlayerNum = SetSearchAllPlayer(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID))	--取副本內同層玩家所有資料
		local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)	
		local CzBuff = 504269  ---阿龐將狂暴術替換，原本為504049		
			CheckTime = CheckTime + 1
			--Say(OwnerID(), "CheckTime="..CheckTime)
			CzTime = CzTime + 1
			--Say(OwnerID(), "CzTime="..CzTime)
			Counter = Counter+1
			--Say(OwnerID(), "Counter="..Counter)
			Rancounter = Rancounter +1
			--Say(OwnerID(), "Rancounter="..Rancounter)
			if Counter == 15 then			--15秒用箭雨
				ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[6], 1 )	--讓吾之鮮血洗淨一切罪惡。(夜倉增加對話)
				Say( OwnerID() , SkillSay[6] )	--讓吾之鮮血洗淨一切罪惡。(夜倉增加對話)			
				CastSpellLV( OwnerID() , OwnerID(), SkillID[6], SkillLV[6])
				Rancounter = 0
				Counter = 0
			end			
			--if CzTime == 600 then	--10冷鐘狂爆
			--	ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[4], 1 )	--汝等觸怒神之真怒...(夜倉增加對話)
			--	Say( OwnerID() , SkillSay[4] )	--汝等觸怒神之真怒...(夜倉增加對話)
			--	AddBuff(OwnerID(),CzBuff, 1, -1)
			--	CzTime = 0
			--end		
			if CheckTime >= Smode then	--階段切換				
				if mode == 1 then	--進入第二階段
					local GoShow = 504049
					mode = 2
					M1Time = 0
					Spell1 = 0
					AddBuff( OwnerID(),GoShow ,1 , 1 ) --傳送特效
					SetPosByFlag( OwnerID(), FlagID , 1 )	--飛到旗子
					AddBuff(OwnerID(),SafeBuff, 1, 40)	--放血之護盾
					SetFightMode( OwnerID(), 1, 0, 0, 0)	--會索敵，不移動，不逃跑，不可被攻擊
				else	--進入第一階段
					mode = 1
					M2Time = 0					
					--DeBugMsg(0,0,"mode="..mode)
					CancelBuff_NoEvent( OwnerID() , SafeBuff )	--取消血之護盾
					SetFightMode( OwnerID(), 1, 1, 1, 1)
				end
				CheckTime = 0
			end	
			--***********************************************************************************************************************************************--			
			if mode == 1 then 	--第一階段
				local PoTime = 10	--每10秒放破甲
				local MoTime = 15	--無法治療
				local UoTime = 20	--耖spmp
				local SoTime = 30	--暈
				local HeatListM1 = {}
				local HeatListM2 = {}
				Check_blood = 1
			----------------------------------------------------------------讀入仇恨表(坦克不算入)-------------------------------------------------------------------------------------	
				for i = 1,HateListCount(OwnerID()),1 do
					local obj = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID )
					if obj ~= ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) then
						HateList[i] = obj
					else
						HateList[i] = 0
					end
				end
			------------------------------------------------------------------------------------------------------------------------------------------------------------			
				if Rancounter == 5 then
					local skillRND =  Rand( 100 )+1 
					--Say(OwnerID(), "skillRND="..skillRND)
					if SkillRND <= 100 and SkillRND > 75 then
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[2], 1 )	--死亡將是最終的平靜。(夜倉增加對話)
						--Say( OwnerID() , SkillSay[2] )	--死亡將是最終的平靜。(夜倉增加對話)
						CastSpellLV( OwnerID() , AttackTarget, SkillID[3], SkillLV[1])
						Rancounter = 0
					elseif SkillRND <= 75 and SkillRND > 50 then
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[5], 1 )	--汝等那可笑的治療將不復存在！(夜倉增加對話)
						--Say( OwnerID() , SkillSay[5] )	--汝等那可笑的治療將不復存在！(夜倉增加對話)
						CastSpellLV( OwnerID() , AttackTarget, SkillID[4], SkillLV[1])
						Rancounter = 0
					elseif SkillRND <= 50 and SkillRND > 25 then
						HeatListM2 = DW_HateRemain( 1 )	--仇恨表第一位不抓		
						local HeatList_New1 = {}
						local x = 0					
						for i = 1,3,1 do	--隨機抓3人
							x = rand(table.getn(HeatListM2))+1
							if HeatListM2[x] ~= nil then						
								SysCastSpellLV( OwnerID() , HeatListM2[x], SkillID[2], SkillLV[1])
								Rancounter = 0								
								table.remove(HeatListM2,x)
							end
						end	
					elseif SkillRND <= 25 and SkillRND > 0 then
						if Spell1 == 0 then
							HeatListM1 = DW_HateRemain( 1 )
							local x = 0					
							for i = 1,3,1 do	--隨機抓暈3人
								x = rand(table.getn(HeatListM1))+1
								if HeatListM1[x] ~= nil then						
									SysCastSpellLV( OwnerID() , HeatListM1[x], SkillID[1], SkillLV[1])
									Rancounter = 0
									Spell1 = 1
									table.remove(HeatListM1,x)
								end
							end
						end
					end	
					skillRND = 0	
				end	
			end
		--***********************************************************************************************************************************************--			
			
			if mode == 2 then	--第二階段		
				local BloodBuffID = 504046	--血之噬血箭buff
				local Blood1 = {103231,103235,103232,103233,103234,103236,103237,103238}	--血色大軍-戰士，遊俠，行者，法師，祭司，騎士
				local Blood1_1	
				local Blood_cast = {}
				M2Time = M2Time+1
				if Check_blood == 1 then
				Blood_cast = DW_HateRemain(0) --仇恨表全抓
					for i = 1,5,1 do	--隨機抓3人
						local x = 0
						x = rand(table.getn(Blood_cast))+1
						if Blood_cast[x] ~= nil then
							AddBuff(Blood_cast[x],BloodBuffID, 1, 10)
							table.remove(Blood_cast,x)
						end
					end				
					ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[3], 1 )	--以彼之血，化身為彼之敵。(夜倉增加對話)
					Say( OwnerID() , SkillSay[3] )	--以彼之血，化身為彼之敵。(夜倉增加對話)	
					local PlayerID = {}
					local j = 0
					j = SetSearchAllPlayer(RoomID)--讀玩家所有資料
					for	i=1,j,1	do	
						PlayerID[i] = GetSearchResult()											
						if	CheckBuff(PlayerID[i], BloodBuffID ) == true and PlayerID[i] ~= nil then	--對有buff的人出一隻血字大軍														
							local job = ReadRoleValue( PlayerID[i], EM_RoleValue_VOC )
							if job == 1 then --戰士							
								Blood1_1 = LuaFunc_CreateObjByObj ( Blood1[1] , PlayerID[i] )																
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								--setplot(Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--血色大軍死亡劇情
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--血色大軍死亡刪除
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失 
							end							
							if job == 2 then --遊俠
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[2] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )								
								AddToPartition( Blood1_1,RoomID)
								--setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--血色大軍死亡劇情
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--血色大軍死亡刪除
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 3 then --行者
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[3] , PlayerID[i] )	
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )								
								AddToPartition( Blood1_1,RoomID)
								--setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--血色大軍死亡劇情
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--血色大軍死亡刪除
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 4 then --法師
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[4] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
							--	setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--血色大軍死亡劇情
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--血色大軍死亡刪除
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 5 then --祭司
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[5] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
							--	setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--血色大軍死亡劇情
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--血色大軍死亡刪除
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 6 then --遊俠
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[6] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
							--	setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--血色大軍死亡劇情
								
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--血色大軍死亡刪除
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 7 then --牧者
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[7] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
							--	setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--血色大軍死亡劇情
							
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--血色大軍死亡刪除
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 8 then --神官
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[8] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
							--	setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_04_easy" , 50 )	--血色大軍死亡劇情
							
								setplot(Blood1_1 , "Dead" , "Lua_kenny_delobj_easy" , 50 )	--血色大軍死亡刪除
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
						end 
						
					end	
					Check_blood = 2
				end
			end
		elseif HateListCount(OwnerID()) == 0 then			
			CheckTime = 0
			Counter =0   --離開戰鬥歸0	
			SetFightMode( OwnerID(), 1, 1, 1, 1)
			SetPosByFlag( OwnerID(), Gohome , 1 )
			M1Time = 0
			M2Time = 0
			CzTime = 0
			Check_blood = 0
			Rancounter = 0
			if CombatBegin1 == 1 then
				--for i = 1 , 2 , 1 do					
					DelObj (Door[1])
				--end
				CombatBegin1 = 0
			end	
			
		end		
	end
end


function lua_kenny_Blood_dead_04_easy()	--殺掉血色大軍扣boss的血量
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)	
	WriteRoleValue(Boss , EM_RoleValue_HP , BossNowHP-BossMaxHP*0.1)
end 

function Lua_kenny_Opendoor_easy()
	Door = {}
	Door[1] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)		
		DelObj (Door[1])
	return true
end

function Lua_kenny_delobj_easy()
	sleep(20)
	Delobj(OwnerID())
end