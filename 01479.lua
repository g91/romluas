function lua_kenny_AI_blood1()
		local SkillID = {493720,493721,493722,493723,493724,493725} 	--血之暈技，血之耖魔，血之破甲，血之治療無效，血之噬血箭
		local SkillLV = {1,1,1,1,1,1}			-- 招式LV1
		local CheckTime = 0	--每秒判斷
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
	while 1 do
		SetPlot( OwnerID() , "dead" , "Lua_kenny_Opendoor" , 1000 )
		sleep(10) --1秒
		local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) --取當前目標數值		
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥	
			--啟動阻擋門
			if CombatBegin1 == 0 then
				Door[1] = CreateObjByFlag( 102460 , Door_Flag , 1 , 1 )
				Door[2] = CreateObjByFlag( 102460 , Door_Flag , 2 , 1 )				
				for i = 1 , 2 , 1 do					
					SetModeEx( Door[i]   , EM_SetModeType_Move, false )--移動
					SetModeEx( Door[i]   , EM_SetModeType_Fight , false )--不可砍殺攻擊
					SetModeEx( Door[i]   , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( Door[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( Door[i]   , EM_SetModeType_Mark, false )--標記
					SetModeEx( Door[i]   , EM_SetModeType_Obstruct, true )--阻擋		
					AddToPartition( Door[i] , RoomID )
					WriteRoleValue( Door[i] , EM_RoleValue_PID , OwnerID() )
				end
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, door[1])
				WriteRoleValue( OwnerID() ,EM_RoleValue_Register2, door[2])
				CombatBegin1 = 1				
			end	
			
		local PlayerNum = SetSearchAllPlayer(ReadRoleValue(OwnerID(), EM_RoleValue_RoomID))	--取副本內同層玩家所有資料
		local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID)	
		local CzBuff = 504049
			CheckTime = CheckTime + 1
			CzTime = CzTime + 1
			Counter = Counter+1
			if Counter == 15 then			--15秒用箭雨	
				CastSpellLV( OwnerID() , OwnerID(), SkillID[6], SkillLV[6])
				Counter = 0
			end			
			if CzTime == 600 then	--10冷鐘狂爆
				AddBuff(OwnerID(),CzBuff, 1, 40)
				CzTime = 0
			end		
			if CheckTime >= Smode then	--階段切換				
				if mode == 1 then	--進入第二階段
					local GoShow = 503693
					mode = 2
					M1Time = 0
					AddBuff( OwnerID(),GoShow ,1 , 1 ) --傳送特效
					sleep(20)
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
				M1Time = M1Time+1
				if M1Time >= 2 and M1Time < 10 then	--使用破甲
					CastSpellLV( OwnerID() , AttackTarget, SkillID[3], SkillLV[1])						
				end		
				
				if M1Time >= 11 and M1Time < 16 then	--無法治療	
					CastSpellLV( OwnerID() , AttackTarget, SkillID[4], SkillLV[1])					
				end		
				
				if M1Time >= 17 and M1Time < 24 then	--使用耖spmp
					HeatListM2 = DW_HateRemain( 1 )	--仇恨表第一位不抓		
					local HeatList_New1 = {}
					local x = 0					
					for i = 1,3,1 do	--隨機抓3人
						x = rand(table.getn(HeatListM2))+1
						if HeatListM2[x] ~= nil then						
							SysCastSpellLV( OwnerID() , HeatListM2[x], SkillID[2], SkillLV[1])							
							table.remove(HeatListM2,HeatListM2[x])
						end
					end														
				end	
				
				if M1Time >= 25 and M1Time < 32 then	--血之暈技
					HeatListM1 = DW_HateRemain( 1 )
					local x = 0					
					for i = 1,3,1 do	--隨機抓暈3人
						x = rand(table.getn(HeatListM1))+1
						if HeatListM1[x] ~= nil then						
							SysCastSpellLV( OwnerID() , HeatListM1[x], SkillID[1], SkillLV[1])							
							table.remove(HeatListM1,HeatListM1[x])
						end
					end
				end	
				if M1Time >= 33 and M1Time < 38 then	--使用破甲
					CastSpellLV( OwnerID() , AttackTarget, SkillID[3], SkillLV[1])	
				end		
			end	
			--***********************************************************************************************************************************************--			
			
			if mode == 2 then	--第二階段		
				local BloodBuffID = 504046	--血之噬血箭buff
				local Blood1 = {102426,102441,102427,102428,102429,102442,102637,102638}	--血色大軍-戰士，遊俠，行者，法師，祭司，騎士
				local Blood1_1	
				local Blood_cast = {}
				M2Time = M2Time+1
				if Check_blood == 1 then
					local PlayerID = {}
					local x = 0
					
					for	i=1,PlayerNum,1	do	
						PlayerID[i] = GetSearchResult()	--讀玩家所有資料						
						Blood_cast = DW_HateRemain(0) --仇恨表全抓
						for i = 1,3,1 do	--隨機抓暈3人
							x = rand(table.getn(Blood_cast))+1
							if Blood_cast[x] ~= nil then
								AddBuff(Blood_cast[x],BloodBuffID, 1, 20)
								table.remove(Blood_cast,Blood_cast[x])
							end
						end										
						if	CheckBuff(PlayerID[i], BloodBuffID ) == true and PlayerID[i] ~= nil then	--對有buff的人出一隻血字大軍														
							local job = ReadRoleValue( PlayerID[i], EM_RoleValue_VOC )
							local BloodShow = 504048
							if job == 1 then --戰士							
								Blood1_1 = LuaFunc_CreateObjByObj ( Blood1[1] , PlayerID[i] )																
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot(Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--血色大軍死亡劇情
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失 
							end							
							if job == 2 then --遊俠
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[2] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )								
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--血色大軍死亡劇情
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 3 then --行者
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[3] , PlayerID[i] )	
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )								
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--血色大軍死亡劇情
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 4 then --法師
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[4] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--血色大軍死亡劇情
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 5 then --祭司
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[5] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--血色大軍死亡劇情
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 6 then --遊俠
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[6] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--血色大軍死亡劇情
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 7 then --牧者
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[7] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_03" , 50 )	--血色大軍死亡劇情
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
							if job == 8 then --神官
								Blood1_1=LuaFunc_CreateObjByObj ( Blood1[8] , PlayerID[i] )							
								WriteRoleValue( Blood1_1 , EM_RoleValue_PID , OwnerID() )
								AddToPartition( Blood1_1,RoomID)
								setplot( Blood1_1 , "Dead" , "lua_kenny_Blood_dead_3" , 50 )	--血色大軍死亡劇情
								BeginPlot(Blood1_1,"LuaS_Discowood_CheckPeace",0)--若是8.5秒內未進入戰鬥狀態就會消失
							end
						end 
						
					end	
					Check_blood = 2
				end
			end
		else 
			CheckTime = 0
			Counter =0   --離開戰鬥歸0	
			SetFightMode( OwnerID(), 1, 1, 1, 1)
			M1Time = 0
			M2Time = 0
			CzTime = 0
			if CombatBegin1 == 1 then
				for i = 1 , 2 , 1 do					
					DelObj (Door[i])
				end
				CombatBegin1 = 0
			end	
			
		end		
	end
end


function lua_kenny_Blood_dead_03()	--殺掉血色大軍扣boss的血量
	local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local BossMaxHP = ReadRoleValue(Boss , EM_RoleValue_MaxHP)
	local BossNowHP = ReadRoleValue(Boss , EM_RoleValue_HP)	
	WriteRoleValue(Boss , EM_RoleValue_HP , BossNowHP-BossMaxHP*0.05)
end 

function Lua_kenny_Opendoor1()
	--刪除門
	Door = {}
	Door[1] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)
	Door[2] = ReadRoleValue( OwnerID() ,EM_RoleValue_Register2)
	for i = 1 , 2 , 1 do					
		DelObj (Door[i])
	end
	return true
end
