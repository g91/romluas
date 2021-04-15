
function Lua_cang_mode_check()	---------------------檢查Boss處於哪個模式
	local Mode1 = 504069	--階段1
	local Mode2 = 504070	--階段2
	if CheckBuff(OwnerID() , Mode1)	== true  then	--如果在階段1
		CancelBuff( OwnerID() , Mode1 )		--刪除1
		AddBuff( OwnerID() , Mode2 , 0 , -1 )	--進入2
	elseif CheckBuff(OwnerID() , Mode2) == true then	--如果在階段2
		CancelBuff( OwnerID() , Mode2 )		--刪除2
		AddBuff( OwnerID() , Mode1 , 0 , -1 )	--進入1	
	end
end

function Lua_cang_BossAi_Sword()

	while true do
		sleep(10)
		local Check_pet = 0  ---判斷寵物進入戰鬥用
		local Mode1 = 504069	--階段1
		local Mode2 = 504070	--階段2
		local ModeCheck = 504067	--模式檢查
		
		local CheckTime = 10
		local SkillDelay = { 2, 2, 2, 2, 2, 2, 2, 2}	-- 技能延遲時間
		--劍舞,毀滅打擊,幻象招換,能量恐懼,電網凝聚,烈焰之劍,玄冰之劍,雷霆之劍
		local SkillID = {493734,493735,493746,493737,493742,493743,493744,493745}	-- 招式ID	
		--1劍舞,2毀滅打擊,3幻象招換,4能量恐懼,5電網凝聚,6烈焰之劍,7玄冰之劍,8雷霆之劍
		local SkillLV = {5, 2, 1, 1, 1, 180 , 170 , 170}	--技能等級
		--劍舞,毀滅打擊,幻象招換,能量恐懼,電網凝聚,烈焰之劍,玄冰之劍,雷霆之劍
		local SkillSay = { "[SC_102421_1]", "[SC_102421_2]", "[SC_102421_3]", "[SC_102421_9]" , "[SC_102421_10]" , "[SC_102421_6]" , "[SC_102421_7]" , "[SC_102421_8]" , "[SC_102421_4]"}	-- 招式說話
		--這裡...將是入侵者的墳場...
		--休想探索神殿的奧秘！
		--感受神的怒火吧...
		--讓入侵者...看看真正的力量吧！
		--憤...怒...你們再也沒有機會離開這...
		--嚐嚐來自地獄的火焰。
		--貪婪是一切罪惡的開端，制裁!
		--神殿由我守護。
		--死亡之路為入侵者而開。
		
		local HP25 = 0	--25%進入狂怒階段
		local HP5 = 0	--5%進入暴怒階段
		local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量

		local SkillA = 0	--技能計時器
		local SkillB = 0	--
		local SkillC = 0	--
		local CombatBegin = 0	--開場記數
		local CombatBegin1 = 0
		local Count1 = 1	--左右產生計數
		local Count2 = 0	--左右刪除計數
		local Count3 = 0	--表演開關
		
		local Temp1, Temp2 --左右手
		local Temp3, Temp4 --表演劇情	
		local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	--取ROOMID
		local PPL
		local Door
		
		--啟動死亡劇情
		SetPlot( OwnerID() , "dead" , "Lua_cang_BossAi_SwordDead" , 1000 )
		
		--建立最後的門
		local Door0 = CreateObjByFlag( 103577 , 780420 , 9 , 1 )
		SetModeEX( Door0  , EM_SetModeType_Gravity , false )--重力
		SetModeEx( Door0  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
		SetModeEx( Door0  , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( Door0  , EM_SetModeType_Mark, false )--標記
		
		AddToPartition( Door0 , RoomID )
		Hide( Door0 )
		Show( Door0 , RoomID )		
		WriteRoleValue( OwnerID() ,EM_RoleValue_Register1, Door0)						
		
		while true do
		sleep(10)
			
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥		
				
				if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---如果是非玩家進入戰鬥
					local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
					SetPosByFlag( Pet_owner , 780430 , 0 )
					Check_pet = 1
				end
				
				--啟動阻擋門
				if CombatBegin1 == 0 then
					ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[9], 1 )	--死亡之路為入侵者而開
					Say( OwnerID() , SkillSay[9] )	--死亡之路
					PPL = SetSearchAllPlayer(RoomID)
					local ID = {}
					for i = 1 , PPL , 1 do ---把玩家抓入房間用 
						ID[i] = GetSearchResult() -- 接暫存值
						if ReadRoleValue( ID[i] , EM_RoleValue_IsDead ) ~= 1 and 
						GetDistance( ID[i] , OwnerID() ) > 250 and 
--						GetDistance( ID[i] , OwnerID() ) < 1000 and 
						ReadRoleValue( ID[i], EM_RoleValue_VOC) ~= 0 and 
						ReadRoleValue( ID[i] , EM_RoleValue_RoomID  ) == RoomID then
							SetPosByFlag( ID[i] , 780430 , 0 ) --拉到旗標位子
						end
					end	
					
					Door = CreateObjByFlag( 102642 , 780420 , 10 , 1 )
					SetModeEx( Door   , EM_SetModeType_Move, false )--移動
					SetModeEx( Door   , EM_SetModeType_Fight , false )--不可砍殺攻擊
					SetModeEx( Door   , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( Door   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( Door   , EM_SetModeType_Mark, false )--標記
					SetModeEx( Door   , EM_SetModeType_Obstruct, true )--阻擋	
					SetModeEx( Door   , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
					SetModeEx( Door   , EM_SetModeType_Searchenemy , false )	------不索敵			
					AddToPartition( Door , RoomID )
					Hide( Door )
					Show( Door , RoomID )
					WriteRoleValue( Door ,EM_RoleValue_PID, OwnerID())						
					WriteRoleValue( OwnerID() ,EM_RoleValue_Register3, Door)						
					BeginPlot(Door , "Lua_cang_BossAi_SwordCraze",0)
					CombatBegin1 = 1
				end	
				local SkillRND =  Rand( 100 )+1	-- 產生亂數
				local SkillShow = 0
				local BossTarget = AttackTarget
				
				local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
				local HPPercent = NowHP / MaxHP	--血量百分比
				SkillA = SkillA + 1
				SkillB = SkillB + 1
				SkillC = SkillC + 1
				
				local TempPlayer = Lua_HateListPos( 2 )	--將仇恨排序 取出前二位
				if table.getn(TempPlayer) >= 2 then	--如果隊伍中超過兩人
					HLI2 = HateListInfo(OwnerID() , TempPlayer[2] , EM_HateListInfoType_GItemID )	--在仇恨表找第二位
					if GetDistance( OwnerID(), HateListInfo(OwnerID(), TempPlayer[2], EM_HateListInfoType_GItemID) ) > 100 then	--第二仇恨距離大於50 打主坦
						HLI2 = AttackTarget
					end
				elseif table.getn(TempPlayer) < 2 then	--如果少於兩個人
					HLI2 = AttackTarget	--打當前對象
				end

				if CombatBegin == 0 then	--開場一次
					AddBuff( OwnerID() , ModeCheck , 0 , -1 )	--上Boss模式檢查Buff
					AddBuff( OwnerID() , Mode1 , 0 , -1 )	--mode1  
					CombatBegin = 1
				end	
								
				if CheckBuff( OwnerID() , Mode2) == false and Count2 == 1 then  --如果不是在第二階段且計數器被啟動
					DelObj(Temp1)
					DelObj(Temp2)
					Count2 = 0
				end
				
				if ( HPPercent <= 0.25 ) then	--第三階段判定優先 25趴血量
					if ( HP25 == 0 ) then
						CancelBuff( OwnerID() , Mode1 )		--刪除1
						CancelBuff( OwnerID() , Mode2 )		--刪除2
						CancelBuff( OwnerID() , ModeCheck )	--刪除模式檢查
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[4], 1 )	--入侵者...看看真正的力量吧！
						Say( OwnerID() , SkillSay[4] )	--入侵者...看看真正的力量吧！
						Addbuff(OwnerID(), 504061, 1, -1 )	--狂怒
						HP25 = 1
						if Count3 == 0 then
							Temp3 = CreateObj( 102412,-399.4, 1700.6, -1334, 90.4 , 1)
							SetModeEx( Temp3 , EM_SetModeType_Gravity, false) 
							SetModeEx( Temp3 , EM_SetModeType_Move, false )		--不會移動
							AddToPartition( Temp3 , RoomID )					--加入舞台
							Sleep(10)
							Temp4 = CreateObj(102413,-87.3, 1488, -1341.5, 90.4, 1)
							SetModeEx( Temp4 , EM_SetModeType_Gravity, false) 
							SetModeEx( Temp4 , EM_SetModeType_Move, false )		--不會移動
							AddToPartition( Temp4 , RoomID )					--加入舞台
							Sleep(10)
							CastSpellLV( OwnerID() , OwnerID() , 493820,1)	--表演吸收
							CastSpellLV( Temp3, OwnerID() , 493819 ,1)		--表演釋放
							CastSpellLV( Temp4, OwnerID() , 493819 ,1)		--表演釋放
							Count3 = 1
							Sleep(80)
							DelObj(Temp3)
							DelObj(Temp4)
						end
					end
					if SkillC >= 10 then					
						if SkillRND <= 100 and SkillRND > 70 then 
							SkillShow = 6	--6烈焰之劍
							BossTarget = HLI2	-- 打第二目標
						elseif SkillRND <= 70 and SkillRND > 35 then
							SkillShow = 7	--7玄冰之劍				
							BossTarget = AttackTarget	-- 打目標	
						elseif SkillRND <= 35 and SkillRND > 0 then 
							SkillShow = 8 	--8雷霆之劍
							BossTarget = HLI2	-- 打第二目標
						end
						SkillC = 0
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[SkillShow], 1 )
						CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
						Sleep( SkillDelay[SkillShow] * CheckTime )	
						SkillShow = 0	
					end

					if ( HPPercent <= 0.05 ) then	--狂怒階段技能
						if ( HP5 == 0 ) then
							ScriptMessage( OwnerID() , -1 , 2 , "[SC_102421_10]", 1 )	--憤....怒....
							Say( OwnerID() , "[SC_102421_10]" )	--憤....怒....
							Addbuff( OwnerID(),	504062, 1, -1)
							HP5 = 1
						end	
					end	
				end
				
				if CheckBuff(OwnerID() , Mode1) == true then	--mode1 劍之階段
					if SkillA >= 7 then
						if SkillRND <= 100 and SkillRND > 75 then 
							SkillShow = 1	--劍舞
							BossTarget = OwnerID()
						elseif SkillRND <= 75 and SkillRND > 50 then 
							SkillShow = 2	--毀滅打擊
							BossTarget = HLI2	--打第二仇恨
						elseif SkillRND <= 50 and SkillRND > 25 then 
							SkillShow = 1	--劍舞
							BossTarget = OwnerID()
						elseif SkillRND <= 25 and SkillRND > 0 then 
							SkillShow = 2	--毀滅打擊
							BossTarget = HLI2	--打第二仇恨
						end
						SkillA = 0	
						ScriptMessage( OwnerID() , -1 , 2 , SkillSay[SkillShow], 10 )	
						CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
						Sleep( SkillDelay[SkillShow] * CheckTime )	
						SkillShow = 0	
					end	
					if SkillC >= 15 then
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[3], 1 )
						Say( OwnerID() , SkillSay[3] )
						if  GetDistance( Door , OwnerID() ) >= 430 then
							BeginPlot(OwnerID(),"Lua_cang_BossAi_SwordSkillA1",0)	--分身
						elseif  GetDistance( Door , OwnerID() ) < 430 then
							BeginPlot(OwnerID(),"Lua_cang_BossAi_SwordSkillA2",0)	--分身
						end	
						SkillC = 0
					end
					Count1 = 0
				end	
				
				if CheckBuff (OwnerID() , Mode2) == true then	--mode2 能量階段
					if Count1 == 0 then
						Temp1 = CreateObj( 102412,-399.4, 1700.6, -1334, 90.4 , 1)
						SetModeEx( Temp1 , EM_SetModeType_Gravity, false) 						
						SetModeEx( Temp1 , EM_SetModeType_Move, false )		--不會移動
						AddToPartition( Temp1 , RoomID )					--加入舞台
						Addbuff( Temp1, 503704, 1 , -1)						--不攻擊
						BeginPlot(Temp1,"Lua_cang_BossAi_Swordleft",0)		--寫入左手AI
						WriteRoleValue( Temp1 ,EM_RoleValue_PID, OwnerID())	--寫入PID						
						sleep(10)

						Temp2 = CreateObj(102413,-87.3, 1488, -1341.5, 90.4, 1)
						SetModeEx( Temp2 , EM_SetModeType_Gravity, false) 
						SetModeEx( Temp2 , EM_SetModeType_Move, false )		--不會移動
						AddToPartition( Temp2 , RoomID )					--加入舞台
						Addbuff( Temp2, 503704, 1 , -1)						--不攻擊
						BeginPlot(Temp2,"Lua_cang_BossAi_Swordright",0)		--寫入右手AI
						WriteRoleValue( Temp2 ,EM_RoleValue_PID, OwnerID())	--寫入PID
						sleep(10)
						Count1 = 1
						Count2 = 1
					end	
					if SkillB >= 7 then
						if SkillRND <= 100 and SkillRND > 75 then 
							SkillShow = 1	--劍舞
							BossTarget = OwnerID()
						elseif SkillRND <= 75 and SkillRND > 50 then 
							SkillShow = 2	--毀滅打擊
							BossTarget = HLI2	--打第二仇恨
						elseif SkillRND <= 50 and SkillRND > 25 then 
							SkillShow = 1	--劍舞
							BossTarget = OwnerID()
						elseif SkillRND <= 25 and SkillRND > 0 then 
							SkillShow = 2	--毀滅打擊
							BossTarget = HLI2	--打第二仇恨
						end
						SkillB = 0	
						ScriptMessage( OwnerID() , -1 , 2 ,  SkillSay[SkillShow], 1 )
						CastSpellLV( OwnerID() , BossTarget , SkillID[SkillShow] , SkillLV[SkillShow] )
						Sleep( SkillDelay[SkillShow] * CheckTime )	
						SkillShow = 0	
					end
				end	
			else
				if CombatBegin1 == 1 then
					SetPosByFlag( OwnerID(), 780420 , 11 )
					Delobj(Door)
					--刪除分身(保險用)
					--local Boss1 = ReadRoleValue( OwnerID() ,EM_RoleValue_Register4)	
					--local Boss2 = ReadRoleValue( OwnerID() ,EM_RoleValue_Register5)
					--local Boss3 = ReadRoleValue( OwnerID() ,EM_RoleValue_Register6)
					--Delobj(Boss1)
					--Delobj(Boss2)
					--Delobj(Boss3)
					Sleep(50)
					--新創BOSS
					local king = Lua_DW_CreateObj( "flag" ,102421, 780420 , 11,1,1)---將Boss生一隻新的
					Sleep(10)					
					DelObj(Door0)
					Delobj(OwnerID())	
				end	
			end	
		end
	end
end




function Lua_cang_BossAi_Swordleft()

	local CheckTime = 10	-- 每秒判斷
	local SkillDelay = { 4, 4, 4}		-- 技能延遲時間
	local SkillID = { 493738, 493739, 493740 }	-- 招式ID	
	--能量火、能量冰、能量電
	local SkillLV = { 7, 7, 7 }	-- 招式LV

	while true do
		Sleep(10)
		local HT = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --金樹GID
		local AttackTarget = ReadRoleValue( HT , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( HT ) == true ) then  -- 檢查是否離開戰鬥
			local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
			local ThesePlayer = {}
			for i=1,TempPlayer do
				ThesePlayer[i] = GetSearchResult() -- 接暫存值
			end

			local SkillRND =  Rand( 100 )+1	-- 產生亂數
			local SkillShow = 1			
			
			if SkillRND <= 100 and SkillRND > 60 then
				SkillShow = 1
			elseif SkillRND <= 60 and SkillRND > 30 then
				SkillShow = 2
			elseif SkillRND <= 30 and SkillRND > 0 then
				SkillShow = 3
			end
						
			local anyone = Rand(table.getn(ThesePlayer))+1				--rand 
			CastSpellLV( OwnerID() , ThesePlayer[anyone] , SkillID[SkillShow] , SkillLV[SkillShow] )
			Sleep( SkillDelay[SkillShow] * CheckTime )
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then
			DelObj(OwnerID())	
		end	
	end
end





function Lua_cang_BossAi_Swordright()

	local SkillID = 493741	-- 招式ID	
	
	local SkillLV = 7 	-- 招式LV
	local SkillA = 0	--計時
	local SkillB = 0
	
	while true do
	Sleep(10)
		local HT = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --金樹GID
		local AttackTarget = ReadRoleValue( HT , EM_RoleValue_AttackTargetID )
		SkillA = SkillA + 1
		SkillB = SkillB + 1
		if (  AttackTarget ~= 0 ) and ( CheckID( HT ) == true ) then  -- 檢查是否離開戰鬥
			if SkillB >= 7 then
				CastSpellLV( OwnerID() , AttackTarget , 493742, 1 )
				Sleep(20)
				SkillB = 0	--歸0
			elseif SkillA >= 10	then	--計時
				CastSpellLV( OwnerID() , OwnerID() , SkillID, SkillLV )
				Sleep(20)
				SkillA = 0	--歸0
			end	
		elseif (  AttackTarget == 0 ) and ( CheckID( OwnerID() ) == true ) then
			DelObj(OwnerID())
		end	
	end
end



function Lua_cang_BossAi_SwordSkillA1()

	local Boss1, Boss2, Boss3, Charge1, Charge2, Charge3
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	local SkillShow = 0				
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	--取ROOMID
	
	Boss1 = CreateObjByFlag( 102414, 780420, 0, 1)	--招換分身
	SetModeEx( Boss1   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Boss1   , EM_SetModeType_Searchenemy, false )--索敵
	AddToPartition( Boss1 , RoomID )				--加入舞台
	SetFightMode ( Boss1 , 0, 1, 0 ,0 )				--戰鬥模式
	
	Boss2 = CreateObjByFlag( 102414, 780420, 1, 1)	--招換分身
	SetModeEx( Boss2   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Boss2   , EM_SetModeType_Searchenemy, false )--索敵
	AddToPartition( Boss2 , RoomID )				--加入舞台
	SetFightMode ( Boss2 , 0, 1, 0 ,0 )				--戰鬥模式
	
	Boss3 = CreateObjByFlag( 102414, 780420, 2, 1)	--招換分身
	SetModeEx( Boss3   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Boss3   , EM_SetModeType_Searchenemy, false )--索敵
	AddToPartition( Boss3 , RoomID )				--加入舞台
	SetFightMode ( Boss3 , 0, 1, 0 ,0 )				--戰鬥模式
	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register4, Boss1)						
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register5, Boss2)						
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register6, Boss3)	
	WriteRoleValue( Boss1 ,EM_RoleValue_Register9, OwnerID())
	WriteRoleValue( Boss2 ,EM_RoleValue_Register9, OwnerID())
	WriteRoleValue( Boss3 ,EM_RoleValue_Register9, OwnerID())

	BeginPlot( Boss1, "Cang_117_SkillDead", 0)
	BeginPlot( Boss2, "Cang_117_SkillDead", 0)
	BeginPlot( Boss3, "Cang_117_SkillDead", 0)
	
	Charge1 = CreateObjByFlag( 102640, 780420, 6, 1)	--招換
	SetModeEx( Charge1   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Charge1   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Charge1   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Charge1   , EM_SetModeType_Move, false )--移動
	SetModeEx( Charge1   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Charge1   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Charge1   , EM_SetModeType_HideName, false )--名稱
	SetModeEx( Charge1   , EM_SetModeType_Show, false )--顯示
	AddToPartition( Charge1 ,    RoomID )	--加進舞台
	
	Charge2 = CreateObjByFlag( 102640, 780420, 7, 1)	--招換
	SetModeEx( Charge2   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Charge2   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Charge2   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Charge2   , EM_SetModeType_Move, false )--移動
	SetModeEx( Charge2   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Charge2   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Charge2   , EM_SetModeType_HideName, false )--名稱	
	SetModeEx( Charge2   , EM_SetModeType_Show, false )--顯示
	AddToPartition( Charge2 ,    RoomID )	--加進舞台

	Charge3 = CreateObjByFlag( 102640, 780420, 8, 1)	--招換
	SetModeEx( Charge3   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Charge3   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Charge3   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Charge3   , EM_SetModeType_Move, false )--移動
	SetModeEx( Charge3   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Charge3   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Charge3   , EM_SetModeType_HideName, false )--名稱	
	SetModeEx( Charge3   , EM_SetModeType_Show, false )--顯示
	AddToPartition( Charge3 ,    RoomID )	--加進舞台
	
	if SkillRND <= 100 and SkillRND > 84 then
		SkillShow = 1
	elseif SkillRND <= 84 and SkillRND > 68 then
		SkillShow = 2		
	elseif SkillRND <= 68 and SkillRND > 52 then
		SkillShow = 3
	elseif SkillRND <= 52 and SkillRND > 36 then
		SkillShow = 1
	elseif SkillRND <= 36 and SkillRND > 20 then
		SkillShow = 2		
	elseif SkillRND <= 20 and SkillRND > 0 then
		SkillShow = 3
	end	
	
	if SkillShow == 1 then --12
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----衝鋒	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----衝鋒	
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----衝鋒			
		Sleep(30)		
		DelObj(Boss3)
		BeginPlot(Boss1, "Lua_cang_BossAi_SwordSkillB",0)
		BeginPlot(Boss2, "Lua_cang_BossAi_SwordSkillC",0)
		Sleep(45)
		DelObj(Boss1)	--刪除
		DelObj(Boss2)	--刪除
		DelObj(Charge1)	--刪除
		DelObj(Charge2)	--刪除		
		DelObj(Charge3)	--刪除
	elseif	SkillShow == 2 then --23
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----衝鋒	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----衝鋒	
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----衝鋒	
		Sleep(30)
		DelObj(Boss1)
		BeginPlot(Boss2, "Lua_cang_BossAi_SwordSkillC",0)
		BeginPlot(Boss3, "Lua_cang_BossAi_SwordSkillD",0)
		Sleep(45)
		DelObj(Boss2)	--刪除
		DelObj(Boss3)	--刪除
		DelObj(Charge1)	--刪除
		DelObj(Charge2)	--刪除		
		DelObj(Charge3)	--刪除

	elseif	SkillShow == 3 then --13
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----衝鋒	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----衝鋒				
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----衝鋒	
		Sleep(30)
		DelObj(Boss2)
		BeginPlot(Boss1, "Lua_cang_BossAi_SwordSkillB",0)
		BeginPlot(Boss3, "Lua_cang_BossAi_SwordSkillD",0)
		Sleep(45)
		DelObj(Boss1)	--刪除
		DelObj(Boss3)	--刪除
		DelObj(Charge1)	--刪除
		DelObj(Charge2)	--刪除		
		DelObj(Charge3)	--刪除
	end
end		

function Lua_cang_BossAi_SwordSkillA2()

	local Boss1, Boss2, Boss3, Charge1, Charge2, Charge3
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	local SkillShow = 0				
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)	--取ROOMID
	
	Boss1 = CreateObjByFlag( 102414, 780420, 3, 1)	--招換分身
	SetModeEx( Boss1   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Boss1   , EM_SetModeType_Searchenemy, false )--索敵
	AddToPartition( Boss1 , RoomID )				--加入舞台
	SetFightMode ( Boss1 , 0, 1, 0 ,0 )				--戰鬥模式
	
	Boss2 = CreateObjByFlag( 102414, 780420, 4, 1)	--招換分身
	SetModeEx( Boss2   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Boss2   , EM_SetModeType_Searchenemy, false )--索敵
	AddToPartition( Boss2 , RoomID )				--加入舞台
	SetFightMode ( Boss2 , 0, 1, 0 ,0 )				--戰鬥模式
	
	Boss3 = CreateObjByFlag( 102414, 780420, 5, 1)	--招換分身
	SetModeEx( Boss3   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Boss3   , EM_SetModeType_Searchenemy, false )--索敵
	AddToPartition( Boss3 , RoomID )				--加入舞台
	SetFightMode ( Boss3 , 0, 1, 0 ,0 )				--戰鬥模式
	
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register4, Boss1)						
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register5, Boss2)						
	WriteRoleValue( OwnerID() ,EM_RoleValue_Register6, Boss3)
	WriteRoleValue( Boss1 ,EM_RoleValue_Register9, OwnerID())
	WriteRoleValue( Boss2 ,EM_RoleValue_Register9, OwnerID())
	WriteRoleValue( Boss3 ,EM_RoleValue_Register9, OwnerID())

	BeginPlot( Boss1, "Cang_117_SkillDead", 0)
	BeginPlot( Boss2, "Cang_117_SkillDead", 0)
	BeginPlot( Boss3, "Cang_117_SkillDead", 0)	
	
	Charge1 = CreateObjByFlag( 102640, 780420, 6, 1)	--招換
	SetModeEx( Charge1   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Charge1   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Charge1   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Charge1   , EM_SetModeType_Move, false )--移動
	SetModeEx( Charge1   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Charge1   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Charge1   , EM_SetModeType_HideName, false )--名稱
	SetModeEx( Charge1   , EM_SetModeType_Show, false )--顯示
	AddToPartition( Charge1 ,    RoomID )	--加進舞台
	
	Charge2 = CreateObjByFlag( 102640, 780420, 7, 1)	--招換
	SetModeEx( Charge2   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Charge2   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Charge2   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Charge2   , EM_SetModeType_Move, false )--移動
	SetModeEx( Charge2   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Charge2   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Charge2   , EM_SetModeType_HideName, false )--名稱	
	SetModeEx( Charge2   , EM_SetModeType_Show, false )--顯示
	AddToPartition( Charge2 ,    RoomID )	--加進舞台

	Charge3 = CreateObjByFlag( 102640, 780420, 8, 1)	--招換
	SetModeEx( Charge3   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Charge3   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Charge3   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Charge3   , EM_SetModeType_Move, false )--移動
	SetModeEx( Charge3   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Charge3   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Charge3   , EM_SetModeType_HideName, false )--名稱	
	SetModeEx( Charge3   , EM_SetModeType_Show, false )--顯示
	AddToPartition( Charge3 ,    RoomID )	--加進舞台

	if SkillRND <= 100 and SkillRND > 84 then
		SkillShow = 1
	elseif SkillRND <= 84 and SkillRND > 68 then
		SkillShow = 2		
	elseif SkillRND <= 68 and SkillRND > 52 then
		SkillShow = 3
	elseif SkillRND <= 52 and SkillRND > 36 then
		SkillShow = 1
	elseif SkillRND <= 36 and SkillRND > 20 then
		SkillShow = 2		
	elseif SkillRND <= 20 and SkillRND > 0 then
		SkillShow = 3
	end	
	
	if SkillShow == 1 then --12
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----衝鋒	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----衝鋒	
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----衝鋒			
		Sleep(30)		
		DelObj(Boss3)
		BeginPlot(Boss1, "Lua_cang_BossAi_SwordSkillB",0)
		BeginPlot(Boss2, "Lua_cang_BossAi_SwordSkillC",0)
		Sleep(45)
		DelObj(Boss1)	--刪除
		DelObj(Boss2)	--刪除
		DelObj(Charge1)	--刪除
		DelObj(Charge2)	--刪除		
		DelObj(Charge3)	--刪除
	elseif	SkillShow == 2 then --23
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----衝鋒	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----衝鋒	
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----衝鋒	
		Sleep(30)
		DelObj(Boss1)
		BeginPlot(Boss2, "Lua_cang_BossAi_SwordSkillC",0)
		BeginPlot(Boss3, "Lua_cang_BossAi_SwordSkillD",0)
		Sleep(45)
		DelObj(Boss2)	--刪除
		DelObj(Boss3)	--刪除
		DelObj(Charge1)	--刪除
		DelObj(Charge2)	--刪除		
		DelObj(Charge3)	--刪除

	elseif	SkillShow == 3 then --13
		CastSpellLV( Boss1, Charge1 , 493982,1 ) 	 ----衝鋒	
		CastSpellLV( Boss2, Charge2 , 493982,1 ) 	 ----衝鋒				
		CastSpellLV( Boss3, Charge3 , 493982,1 ) 	 ----衝鋒	
		Sleep(30)
		DelObj(Boss2)
		BeginPlot(Boss1, "Lua_cang_BossAi_SwordSkillB",0)
		BeginPlot(Boss3, "Lua_cang_BossAi_SwordSkillD",0)
		Sleep(45)
		DelObj(Boss1)	--刪除
		DelObj(Boss3)	--刪除
		DelObj(Charge1)	--刪除
		DelObj(Charge2)	--刪除		
		DelObj(Charge3)	--刪除
	end
end		

function Lua_cang_BossAi_SwordSkillB()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = CreateObjByFlag( 102585, 780421, 0, 1)	--招換
	SetModeEx( Temp   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp ,    RoomID )	--加進舞台
	AddBuff( Temp ,504167,1 ,-1 )
	BeginPlot(Temp,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp1 = CreateObjByFlag( 102585, 780421, 1, 1)	--招換
	SetModeEx( Temp1  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp1  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp1  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp1  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp1  , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp1  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp1  , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp1  , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp1 ,    RoomID )	--加進舞台
	AddBuff( Temp1 ,504167,1 ,-1 )
	BeginPlot(Temp1,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp2 = CreateObjByFlag( 102585, 780421, 2, 1)	--招換
	SetModeEx( Temp2   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp2   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp2   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp2   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp2   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp2   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp2   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp2   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp2 ,    RoomID )	--加進舞台
	AddBuff( Temp2 ,504167,1 ,-1 )
	BeginPlot(Temp2,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp3 = CreateObjByFlag( 102585, 780421, 3, 1)	--招換
	SetModeEx( Temp3   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp3   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp3   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp3   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp3   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp3   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp3   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp3   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp3 ,    RoomID )	--加進舞台
	AddBuff( Temp3 ,504167,1 ,-1 )
	BeginPlot(Temp3,"Lua_cang_BossAi_SwordSkillB1",0)
	Sleep(10)
	local Temp4 = CreateObjByFlag( 102585, 780421, 4, 1)	--招換
	SetModeEx( Temp4   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp4   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp4   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp4   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp4   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp4   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp4   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp4   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp4 ,    RoomID )	--加進舞台
	AddBuff( Temp4 ,504167,1 ,-1 )
	BeginPlot(Temp4,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp5 = CreateObjByFlag( 102585, 780421, 5, 1)	--招換
	SetModeEx( Temp5   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp5   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp5   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp5   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp5   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp5   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp5   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp5   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp5 ,    RoomID )	--加進舞台
	AddBuff( Temp5 ,504167,1 ,-1 )
	BeginPlot(Temp5,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp6 = CreateObjByFlag( 102585, 780421, 6, 1)	--招換
	SetModeEx( Temp6   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp6   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp6   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp6   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp6   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp6   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp6   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp6   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp6 ,    RoomID )	--加進舞台
	AddBuff( Temp6 ,504167,1 ,-1 )
	BeginPlot(Temp6,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp7 = CreateObjByFlag( 102585, 780421, 7, 1)	--招換
	SetModeEx( Temp7   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp7   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp7   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp7   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp7   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp7   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp7   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp7   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp7 ,    RoomID )	--加進舞台
	AddBuff( Temp7 ,504167,1 ,-1 )
	BeginPlot(Temp7,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp8 = CreateObjByFlag( 102585, 780421, 8, 1)	--招換
	SetModeEx( Temp8   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp8   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp8   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp8   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp8   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp8  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp8   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp8   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp8 ,    RoomID )	--加進舞台
	AddBuff( Temp8 ,504167,1 ,-1 )
	BeginPlot(Temp8,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp9 = CreateObjByFlag( 102585, 780421, 9, 1)	--招換
	SetModeEx( Temp9   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp9   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp9   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp9   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp9   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp9   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp9   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp9   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp9 ,    RoomID )	--加進舞台
	AddBuff( Temp9 ,504167,1 ,-1 )
	BeginPlot(Temp9,"Lua_cang_BossAi_SwordSkillB1",0)
	return true
end

function Lua_cang_BossAi_SwordSkillB1()
	sleep(100)
	Delobj(OwnerID())
end

function Lua_cang_BossAi_SwordSkillC()

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = CreateObjByFlag( 102585, 780421, 10, 1)	--招換
	SetModeEx( Temp   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp ,    RoomID )	--加進舞台
	AddBuff( Temp ,504167,1 ,-1 )
	BeginPlot(Temp,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp1 = CreateObjByFlag( 102585, 780421, 11, 1)	--招換
	SetModeEx( Temp1  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp1  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp1  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp1  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp1  , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp1  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp1  , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp1  , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp1 ,    RoomID )	--加進舞台
	AddBuff( Temp1 ,504167,1 ,-1 )
	BeginPlot(Temp1,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp2 = CreateObjByFlag( 102585, 780421, 12, 1)	--招換分身
	SetModeEx( Temp2   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp2   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp2   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp2   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp2   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp2   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp2   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp2   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp2 ,    RoomID )	--加進舞台
	AddBuff( Temp2 ,504167,1 ,-1 )
	BeginPlot(Temp2,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp3 = CreateObjByFlag( 102585, 780421, 13, 1)	--招換
	SetModeEx( Temp3   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp3   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp3   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp3   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp3   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp3   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp3   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp3   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp3 ,    RoomID )	--加進舞台
	AddBuff( Temp3 ,504167,1 ,-1 )
	BeginPlot(Temp3,"Lua_cang_BossAi_SwordSkillB1",0)
	Sleep(10)
	local Temp4 = CreateObjByFlag( 102585, 780421, 14, 1)	--招換
	SetModeEx( Temp4   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp4   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp4   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp4   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp4   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp4   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp4   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp4   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp4 ,    RoomID )	--加進舞台
	AddBuff( Temp4 ,504167,1 ,-1 )
	BeginPlot(Temp4,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp5 = CreateObjByFlag( 102585, 780421, 15, 1)	--招換
	SetModeEx( Temp5   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp5   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp5   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp5   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp5   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp5   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp5   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp5   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp5 ,    RoomID )	--加進舞台
	AddBuff( Temp5 ,504167,1 ,-1 )
	BeginPlot(Temp5,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp6 = CreateObjByFlag( 102585, 780421, 16, 1)	--招換
	SetModeEx( Temp6   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp6   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp6   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp6   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp6   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp6   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp6   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp6   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp6 ,    RoomID )	--加進舞台
	AddBuff( Temp6 ,504167,1 ,-1 )
	BeginPlot(Temp6,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp7 = CreateObjByFlag( 102585, 780421, 17, 1)	--招換
	SetModeEx( Temp7   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp7   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp7   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp7   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp7   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp7   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp7   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp7   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp7 ,    RoomID )	--加進舞台
	AddBuff( Temp7 ,504167,1 ,-1 )
	BeginPlot(Temp7,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp8 = CreateObjByFlag( 102585, 780421, 18, 1)	--招換
	SetModeEx( Temp8   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp8   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp8   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp8   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp8   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp8  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp8   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp8   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp8 ,    RoomID )	--加進舞台
	AddBuff( Temp8 ,504167,1 ,-1 )
	BeginPlot(Temp8,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp9 = CreateObjByFlag( 102585, 780421, 19, 1)	--招換
	SetModeEx( Temp9   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp9   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp9   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp9   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp9   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp9   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp9   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp9   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp9 ,    RoomID )	--加進舞台
	AddBuff( Temp9 ,504167,1 ,-1 )
	BeginPlot(Temp9 ,"Lua_cang_BossAi_SwordSkillB1",0)	
	return true
end

function Lua_cang_BossAi_SwordSkillD()

	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Temp = CreateObjByFlag( 102585, 780421, 20, 1)	--招換
	SetModeEx( Temp   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp ,    RoomID )	--加進舞台
	AddBuff( Temp ,504167,1 ,-1 )
	BeginPlot(Temp,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp1 = CreateObjByFlag( 102585, 780421, 21, 1)	--招換
	SetModeEx( Temp1  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp1  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp1  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp1  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp1  , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp1  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp1  , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp1  , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp1 ,    RoomID )	--加進舞台
	AddBuff( Temp1 ,504167,1 ,-1 )
	BeginPlot(Temp1,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp2 = CreateObjByFlag( 102585, 780421, 22, 1)	--招換分身
	SetModeEx( Temp2   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp2   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp2   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp2   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp2   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp2   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp2   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp2   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp2 ,    RoomID )	--加進舞台
	AddBuff( Temp2 ,504167,1 ,-1 )
	BeginPlot(Temp2,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp3 = CreateObjByFlag( 102585, 780421, 23, 1)	--招換
	SetModeEx( Temp3   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp3   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp3   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp3   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp3   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp3   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp3   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp3   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp3 ,    RoomID )	--加進舞台
	AddBuff( Temp3 ,504167,1 ,-1 )
	BeginPlot(Temp3,"Lua_cang_BossAi_SwordSkillB1",0)
	Sleep(10)
	local Temp4 = CreateObjByFlag( 102585, 780421, 24, 1)	--招換
	SetModeEx( Temp4   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp4   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp4   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp4   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp4   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp4   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp4   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp4   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp4 ,    RoomID )	--加進舞台
	AddBuff( Temp4 ,504167,1 ,-1 )
	BeginPlot(Temp4,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp5 = CreateObjByFlag( 102585, 780421, 25, 1)	--招換
	SetModeEx( Temp5   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp5   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp5   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp5   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp5   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp5   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp5   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp5   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp5 ,    RoomID )	--加進舞台
	AddBuff( Temp5 ,504167,1 ,-1 )
	BeginPlot(Temp5,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp6 = CreateObjByFlag( 102585, 780421, 26, 1)	--招換
	SetModeEx( Temp6   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp6   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp6   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp6   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp6   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp6   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp6   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp6   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp6 ,    RoomID )	--加進舞台
	AddBuff( Temp6 ,504167,1 ,-1 )
	BeginPlot(Temp6,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp7 = CreateObjByFlag( 102585, 780421, 27, 1)	--招換
	SetModeEx( Temp7   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp7   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp7   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp7   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp7   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp7   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp7   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp7   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp7 ,    RoomID )	--加進舞台
	AddBuff( Temp7 ,504167,1 ,-1 )
	BeginPlot(Temp7,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp8 = CreateObjByFlag( 102585, 780421, 28, 1)	--招換
	SetModeEx( Temp8   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp8   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp8   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp8   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp8   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp8  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp8   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp8   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp8 ,    RoomID )	--加進舞台
	AddBuff( Temp8 ,504167,1 ,-1 )
	BeginPlot(Temp8,"Lua_cang_BossAi_SwordSkillB1",0)
	local Temp9 = CreateObjByFlag( 102585, 780421, 29, 1)	--招換
	SetModeEx( Temp9   , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Temp9   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Temp9   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( Temp9   , EM_SetModeType_Mark, false )--標記
	SetModeEx( Temp9   , EM_SetModeType_Move, false )--移動
	SetModeEx( Temp9   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Temp9   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( Temp9   , EM_SetModeType_HideName, false )--名稱
	AddToPartition( Temp9 ,    RoomID )	--加進舞台
	AddBuff( Temp9 ,504167,1 ,-1 )
	BeginPlot(Temp9 ,"Lua_cang_BossAi_SwordSkillB1",0)	
	return true
end


------------------------------------------------------------------------
		
		
function Lua_cang_BossAi_SwordDead()
	---死亡紀錄
	--local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	--local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	--DesignLog( OwnerID() , 102421 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )

	--開啟最後的門
	local Door = ReadRoleValue( OwnerID() ,EM_RoleValue_Register1)
	PlayMotionEX( Door ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	SetModeEX( Door , EM_SetModeType_Obstruct , false )

	--刪除橋頭阻擋門
	local Door1 = ReadRoleValue( OwnerID() ,EM_RoleValue_Register3)
	DelObj(Door1)
	return true
end
		
	
function Lua_cang_BossAi_SwordCraze()

	local Craze = 0
	local SkillA = 0
	
	while true do
	Sleep(10)
		local HT = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --GID
		local AttackTarget = ReadRoleValue( HT , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( HT ) == true ) then  -- 檢查是否離開戰鬥
			Craze = Craze + 1	
			
			if SkillA == 0 then
				if Craze >= 600 then --狂暴機制
					ScriptMessage( HT , -1 , 2 , "[SC_102421_10]", 10 )	--憤....怒....
					Say( HT , "[SC_102421_10]")	--憤....怒....
					Addbuff(HT, 504269, 1, -1)	--狂怒
					BeginPlot(OwnerID(), "Lua_cang_BossAi_SwordSkillB",0)
					BeginPlot(OwnerID(), "Lua_cang_BossAi_SwordSkillC",0)
					BeginPlot(OwnerID(), "Lua_cang_BossAi_SwordSkillD",0)
					Craze = 0
					SkillA = 1
				end	
			end
		end
	end		
end

function Cang_117_SkillDead()
	
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register9 )	
	while true do 
		sleep(10)
		local AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if (  AttackTarget == 0 ) and ( CheckID( Boss ) == true ) then  -- 檢查是否離開戰鬥	
			DelObj( OwnerID() )
		elseif ( CheckID( Boss ) == false ) or ReadRoleValue( Boss ,EM_RoleValue_IsDead ) == 1 then
			DelObj( OwnerID() )
		end
	end
end	