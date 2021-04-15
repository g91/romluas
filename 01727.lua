function lua_star_BossAI_102558_easy()
	while 1 do
		sleep(10)
		local Mode = 0
		local Skill = { 493932 }	
		----------------------------- 1.  空中階段				
		local SkillLv = {0}
		--local SkillString = { "[SC_102349_1]" , "[SC_102349_2]" , "[SC_102349_3]" }
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		
		local LuckyPlayer = {} 		--------存放變身機器人玩家
		local Lucky1 = 0
		local Lucky2 = 0
		local Lucky1Temp = 0
		local Lucky2Temp = 0
		local RobotBuff = 504343	--------變身Buff
		local RootBuff = 504374		--------遍身前先把玩家定住
		local BeginMode = 0			--------判斷處於哪個模式的開始
		local FlyFlag = 780422		-------玩家傳到空中的旗標
		local Satellite = {}		-------存放空戰小怪
		local GroundBot = {}		-------存放地面小怪
		local GroundBotTemp = {}	-------暫存
		local Eliminated = 0		-----每波地面小怪死亡計數
		local EnterFight = 0		-----判斷是否有進入過戰鬥
		local counter1 = 0			-----技能計時
		
		while 1 do 
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			--LuckyPlayer = star_HateListSort(OwnerID())					--------抓出Boss仇恨表排序
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then				
				Mode = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
				EnterFight = 1
				if Mode == 1 then														--------處於模式1
					--Say( OwnerID() , "Now in Mode1")
					Eliminated = 0
					if BeginMode == 0 then	
						--PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CAST_LOOP , ruFUSION_ACTORSTATE_CAST_END )
						SetModeEx( OwnerID() , EM_SetModeType_Fight , true )		------可砍殺						
						SetModeEx( OwnerID() , EM_SetModeType_Mark , true )			------可點選
						if Lucky1Temp ~= 0 and Lucky2Temp ~= 0 then
							SetPosByFlag( Lucky1Temp , FlyFlag , 10 )				------送玩家回到地面
							SetPosByFlag( Lucky2Temp , FlyFlag , 10 )				------送玩家回到地面
							CancelBuff( Lucky1Temp , RobotBuff )
							CancelBuff( Lucky2Temp , RobotBuff )
							WriteRoleValue( OwnerID() , EM_RoleValue_register3 , 0 )		-----沒有玩家在空中(Boss死後判斷用)
							WriteRoleValue( OwnerID() , EM_RoleValue_register4 , 0 )
						end	
						for i = 1 , table.getn( Satellite ) do
							if CheckID( Satellite[i] ) == true and Satellite[i] ~= nil then
								DelObj( Satellite[i] )
							end
						end
					end	
					counter1 = counter1 + 1
					if counter1 >= 7 then
						star_102558_BossSkill_easy()										------施放招式
						counter1 = 0
					end	
					BeginMode = 1
				elseif Mode == 2 then													--------處於模式2		
					--Say( OwnerID() , "Now in Mode2")		
					if BeginMode == 1 then											--------空戰遊戲開始
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_102558_7]" , 1 )
						Yell( OwnerID() , "[SC_102558_7]" , 5)
						sleep(50)	
						CastSpellLV( OwnerID() , OwnerID() , Skill[1] , SkillLv[1] )	----------空中階段
							
						--PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN , ruFUSION_ACTORSTATE_CAST_LOOP )	
						--WriteRoleValue( OwnerID() , EM_RoleValue_AttackDelay , 300 )			------延遲普攻30秒
						SetModeEx( OwnerID() , EM_SetModeType_Fight , false )		------不可砍殺						
						SetModeEx( OwnerID() , EM_SetModeType_Mark , false )		------不可點選
						
						LuckyPlayer = star_HateListSort(OwnerID())					--------抓出Boss仇恨表排序
						if table.getn(LuckyPlayer) > 2 then							--------仇恨表有兩個人以上才傳人到空中
							while 1 do 												--------隨機選兩個玩家	
								local Temp = Rand(table.getn(LuckyPlayer))+1								
								if CheckID(LuckyPlayer[Temp]) == true and 
									ReadRoleValue( LuckyPlayer[Temp] , EM_RoleValue_IsDead ) == 0  then	
									if LuckyPlayer[Temp] == AttackTarget then	
										table.remove(LuckyPlayer , Temp )
									elseif Lucky1 == 0 then
										Lucky1 = LuckyPlayer[Temp]																					
										table.remove(LuckyPlayer , Temp )
									elseif Lucky2 == 0	then
										Lucky2 = LuckyPlayer[Temp]
										--table.remove(LuckyPlayer , Temp )									
									elseif Lucky1 ~= 0 and Lucky2 ~= 0 then										 
										break
									end										
								else	
									table.remove(LuckyPlayer , Temp )
								end																		
							end							
							Lucky1Temp = Lucky1
							Lucky2Temp = Lucky2	
							WriteRoleValue( OwnerID() , EM_RoleValue_register3 , Lucky1Temp )		-----為了在王死後若玩家還是在空中，要把他傳回來
							WriteRoleValue( OwnerID() , EM_RoleValue_register4 , Lucky2Temp )
							AddBuff( Lucky1 , RootBuff , 0 , 2)
							AddBuff( Lucky2 , RootBuff , 0 , 2)	
							sleep(5)	
							AddBuff( Lucky1 , RobotBuff , 0 , 50)
							AddBuff( Lucky2 , RobotBuff , 0 , 50)
							sleep(10)	
							SetPosByFlag( Lucky1 , FlyFlag , 2 )
							SetPosByFlag( Lucky2 , FlyFlag , 3 )
							Lucky1 = 0
							Lucky2 = 0
						end
						Satellite = star_102558_Satellite_easy(OwnerID() , Room)					-------生出衛星小怪
						sleep(30)
						GroundBotTemp = star_102558_GroundWar_easy(OwnerID() , Room)				-------生出地面小怪
						for ii=1 , table.getn(GroundBotTemp) do
							GroundBot[table.getn(GroundBot)+1] = GroundBotTemp[ii]
							--SetAttack( GroundBotTemp[ii] , AttackTarget )								-----讓地面小怪找人打
						end	
						BeginMode = 0
					end	
					
					if table.getn(GroundBotTemp) > 0 then								-----判斷此波地面小怪被殺了幾隻
						for k=1 , table.getn(GroundBotTemp) do
							if GroundBotTemp[k] ~= -1 then
								if CheckID(GroundBotTemp[k]) == false then				-----小怪死亡會有兩種情形，( 1 )死了馬上消失 ( 2) 死了屍體還在
									Eliminated = Eliminated + 1
									GroundBotTemp[k] = -1								-----標記已經被殺的小怪(不用刪除table的值，是因為在跑for迴圈會因為index改變而多判斷一次)				
								else	
									if ReadRoleValue( GroundBotTemp[k] , EM_RoleValue_IsDead ) == 1 then
										Eliminated = Eliminated + 1
										GroundBotTemp[k] = -1
									end
								end	
							end	
						end
					end	
														
					if Eliminated == 6 then
						sleep(20)
						GroundBotTemp = star_102558_GroundWar_easy(OwnerID() , Room)				-------生出地面小怪
						for jj=1 , table.getn(GroundBotTemp) do
							GroundBot[table.getn(GroundBot)+1] = GroundBotTemp[jj]
						end
						Eliminated = 0
					end	
				end
			else
				if EnterFight == 1 then 
					for i = 1 , table.getn( Satellite ) do										-----離開戰鬥清除空中小怪
						if CheckID( Satellite[i] ) == true and Satellite[i] ~= nil then
							DelObj( Satellite[i] )
						end
					end 
					for j = 1 , table.getn( GroundBot ) do										-----離開戰鬥清除地面小怪		
						if CheckID( GroundBot[j] ) == true and GroundBot[j] ~= nil then
							DelObj( GroundBot[j] )
						end
					end
					if Lucky1Temp ~= 0 and Lucky2Temp ~= 0 then
							SetPosByFlag( Lucky1Temp , FlyFlag , 10 )				------送玩家回到地面
							SetPosByFlag( Lucky2Temp , FlyFlag , 10 )				------送玩家回到地面
							CancelBuff( Lucky1Temp , RobotBuff )
							CancelBuff( Lucky2Temp , RobotBuff )
							WriteRoleValue( OwnerID() , EM_RoleValue_register3 , 0 )		-----沒有玩家在空中(Boss死後判斷用)
							WriteRoleValue( OwnerID() , EM_RoleValue_register4 , 0 )
					end	
					local BossCounter = ReadRoleValue( OwnerID() , EM_RoleValue_register8 )
					WriteRoleValue( BossCounter , EM_RoleValue_register2 , 1 )					------通知Counter，Boss要重置了
					DelObj(OwnerID())						
					break
				end	
			end
		end
	end	
end

function star_102558_Satellite_easy(BossGID , Room)		-------產生空中小怪
	local Satellite = {}
	local SatelliteID = 103208 	-------衛星小怪ID
	local Distance = 100		-------圓周半徑
	local Angle = math.pi/8		-------角度
	local BossObj = Role:new(BossGID)
	local PosX = BossObj:X() 
	local PosZ = BossObj:Z()
	local Height = BossObj:Y()+300			-------高度
	for i=1 , 8 do
		local X = PosX + Distance*math.cos(i*2*Angle)
		local Z = PosZ + Distance*math.sin(i*2*Angle)
		Satellite[i] = CreateObj( SatelliteID , X , Height , Z , 0 , 1 )	------Y軸調整高度
		SetModeEx( Satellite[i] , EM_SetModeType_Move , false )			------不移動
		SetModeEx( Satellite[i] , EM_SetModeType_Strikback , false )	------不反擊，0520.2010修正小怪在空中還是可以普攻打人
		SetModeEx( Satellite[i] , EM_SetModeType_Searchenemy , false )	------不索敵，0520.2010修正小怪在空中還是可以普攻打人
		SetModeEx( Satellite[i] , EM_SetModeType_Gravity , false )		------重力
		AddToPartition( Satellite[i] , Room )
		
		AddBuff( Satellite[i] , 505653 , 0 , -1)						------0520.2010修正小怪在空中還是可以普攻打人
		CallPlot( Satellite[i] , "star_102558_SatelliteFire_easy" , BossGID )
		Setplot( Satellite[i] , "dead" , "star_102558_SatelliteDead_easy" , 30)
		WriteRoleValue( Satellite[i] , EM_RoleValue_register1 , BossGID )
		--Say(BossGID , Room)
	end
	return Satellite	
end

function star_102558_SatelliteDead_easy()
	local BossGID = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local MaxHP = ReadRoleValue( BossGID , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( BossGID , EM_RoleValue_HP ) 	
	--WriteRoleValue( BossGID , EM_RoleValue_HP , NowHP-MaxHP*0.02 )
	if NowHP > MaxHP*0.02 then
		AddRoleValue( BossGID , EM_RoleValue_HP , -MaxHP*0.02 )		-------死一隻空中小怪扣王血
	else
		KillID(TargetID() , BossGID)
	end	
end

function star_102558_GroundWar_easy(BossGID , Room)			------產生地面小怪
	local GroundBot = {}
	local GroundBotID = 103209	-----地面小怪ID
	local LuckyBotID = 103210	-----會掉強力子彈小怪ID
	local Spawn = 0				-----是否生出地面小怪	
	local IsLucky = 0			-----判斷是否已出現掉強力子彈小怪
	Eliminated = ReadRoleValue( BossGID , EM_RoleValue_register2 )	
	for i=1 , 6 do
		local LuckyBall = Rand(100)
		if (LuckyBall > 30 and LuckyBall < 61) 
			or (LuckyBall > 70 and LuckyBall < 100)then
			if IsLucky == 0 then
				GroundBot[i] = CreateObjByFlag( LuckyBotID , 780422 , i+3 , 1 )		-----會掉彈藥的小怪
				AddToPartition( GroundBot[i] , Room )	
				IsLucky = 1	
			elseif IsLucky == 1 then
				GroundBot[i] = CreateObjByFlag( GroundBotID , 780422 , i+3 , 1 )		
				AddToPartition( GroundBot[i] , Room )
			end	
			WriteRoleValue( GroundBot[i] , EM_RoleValue_register1 , BossGID )		-----Boss GID寫入小怪身上
			--Setplot( GroundBot[i] , "dead" , "star_102558_GroundDead_easy" , 30)		------死亡劇情暫時不使用	
		elseif LuckyBall >= 0 and LuckyBall <= 30 then	
			GroundBot[i] = CreateObjByFlag( GroundBotID , 780422 , i+3 , 1 )		
			AddToPartition( GroundBot[i] , Room )
			WriteRoleValue( GroundBot[i] , EM_RoleValue_register1 , BossGID )		-----Boss GID寫入小怪身上
			--Setplot( GroundBot[i] , "dead" , "star_102558_GroundDead_easy" , 30)
		elseif LuckyBall > 60 and LuckyBall <= 70 then	
			GroundBot[i] = CreateObjByFlag( GroundBotID , 780422 , i+3 , 1 )		
			AddToPartition( GroundBot[i] , Room )
			WriteRoleValue( GroundBot[i] , EM_RoleValue_register1 , BossGID )		-----Boss GID寫入小怪身上
			--Setplot( GroundBot[i] , "dead" , "star_102558_GroundDead_easy" , 30)
		end		
	end
	return GroundBot
end

function star_102558_GroundDead_easy()					------地面小怪死亡劇情
	local BossGID = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local Eliminated = ReadRoleValue( BossGID , EM_RoleValue_register2 )
	local Mode = ReadRoleValue( BossGID , EM_RoleValue_register1 )
	if Mode == 2 then
		WriteRoleValue( BossGID , EM_RoleValue_register2 , Eliminated+1 )
	elseif Mode == 1 then
		WriteRoleValue( BossGID , EM_RoleValue_register2 , 0 )
	end	
end

function star_102558_SatelliteFire_easy(BossGID)			-------空中小怪招式施放
	local HeavenFire = 493946	
	local counter = 0
	local PlayerInHate = {}
	while 1 do
		sleep(10)
		if CheckID( OwnerID() ) == true and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 then
			counter = counter + 1
			local Ready = Rand(100)
			if counter == 5 then
				if Ready > 30 and Ready < 61 then
					PlayerInHate = star_HateListSort(BossGID)
					if table.getn(PlayerInHate) > 0 then
						local Lucky = Rand(table.getn(PlayerInHate))+1
						CastSpellLV( OwnerID() , PlayerInHate[Lucky] , HeavenFire , 0 )
					end	
				end
				counter = 0
			end
		elseif CheckID( OwnerID() ) == false and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then	
			break
		end
	end		
end

function star_102558_BossSkill_easy()											------Boss施放招式
	local Skill = { 495353 , 493934 , 495354 }	
		-------------------------1.巨掌拍擊	2.符文粒子光束	3.守護者重鎚			
	local SkillLv = {0 , 0 , 0 }
	local SkillString = { "[SC_102558_3]" , "[SC_102558_4]" , "[SC_102558_5]" }
	local Luck = Rand(100)
	local NoTank = 1										--------判斷是否至少有一名玩家在王打得到的範圍
	local PlayerInHate = star_HateListSort(OwnerID())		--------存放玩家GID
	for i=1 , table.getn(PlayerInHate) do
		if GetDistance( OwnerID() , PlayerInHate[i] ) < 275 then
			NoTank = 0
			break
		end	
	end
	if NoTank == 1 then
		local RandTarget3 = Rand(table.getn(PlayerInHate))+1
		BossTarget = PlayerInHate[RandTarget3]	
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_102558_6]" , 1 )
		Yell( OwnerID() , "[SC_102558_6]" , 5)
		CastSpellLV( OwnerID() , BossTarget , Skill[1] , 30 )
		sleep(10)
	elseif NoTank == 0 then
		if (Luck >= 0 and Luck < 15) or (Luck >= 45 and Luck < 60) then
			SkillIndex = 1
			local RandTarget1 = Rand(table.getn(PlayerInHate))+1	
			BossTarget = PlayerInHate[RandTarget1]
		elseif (Luck >= 15 and Luck < 30) or (Luck >= 60 and Luck < 75) then	
			SkillIndex = 2
			local RandTarget2 = Rand(table.getn(PlayerInHate))+1
			BossTarget = PlayerInHate[RandTarget2]	
		elseif (Luck >= 30 and Luck < 45) or (Luck >= 75 and Luck < 100) then	
			SkillIndex = 3
			BossTarget = PlayerInHate[1]
		end	
		ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
		--Yell( OwnerID() , SkillString[SkillIndex] , 5)
		CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
		sleep(10)
	end	
end

function star_102558_BossDead_easy()												-------Boss死亡劇情
	local UpperPart = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	local BossCounter = ReadRoleValue( OwnerID() , EM_RoleValue_register8 )
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	local Lucky1 = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
	local Lucky2 = ReadRoleValue( OwnerID() , EM_RoleValue_register4 )
	if CheckID(Lucky1) == true and ReadRoleValue( Lucky1 , EM_RoleValue_IsDead ) == 0 then
		SetPosByFlag( Lucky1 , 780422 , 10 )								------送玩家回到地面
	end
	if CheckID(Lucky2) == true and ReadRoleValue( Lucky2 , EM_RoleValue_IsDead ) == 0 then
		SetPosByFlag( Lucky2 , 780422 , 10 )								------送玩家回到地面
	end	
	WriteRoleValue( BossCounter , EM_RoleValue_register1 , -1 )				------通知計時器Boss陣亡
	SetModeEx( OwnerID() , EM_SetModeType_Fight , true )					------可砍殺						
	SetModeEx( OwnerID() , EM_SetModeType_Mark , true )						------可點選(若Boss在空中階段死亡才可撿寶)
	KillID( OwnerID() , UpperPart )											------拉支架陪葬		
	SetIdleMotion( Entrance , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )			------打開前門
	SetModeEX( Entrance , EM_SetModeType_Obstruct , false )
	SetIdleMotion( Exit , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )				------打開後門
	SetModeEX( Exit , EM_SetModeType_Obstruct , false )
end
 
function lua_star_102558_Counter_easy()	-----模式計時器
	local counter1 = 0			-------戰鬥計時
	local counter2 = 0			-------死亡計時
	local BerserkCounter = 0	-------狂暴計時
	local IsBerserk = 0			-------狂暴開關
	local Mode = 0
	local ModeTime1 = 50		-------模式1時間間隔
	local ModeTime2 = 50		-------模式2時間間隔
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag( 103205 , 780422 , 1 , 1 )				-----Boss主體
	SetModeEx( Boss , EM_SetModeType_Move , false )	------不移動
	AddToPartition( Boss , Room )
	BeginPlot( Boss , "lua_star_BossAI_102558_easy" , 0 )
	Setplot( Boss , "dead" , "star_102558_BossDead_easy" , 30)
	WriteRoleValue( Boss , EM_RoleValue_register8 , OwnerID() )
	
	local BossObj = Role:new(Boss)
	local PosX = BossObj:X() 
	local PosY = BossObj:Y()
	local PosZ = BossObj:Z()
	local UpperPart = CreateObj( 103206 , PosX , PosY , PosZ , 0 , 1 ) 		-----Boss支架
	SetModeEx( UpperPart , EM_SetModeType_Move , false )		------不移動
	SetModeEx( UpperPart , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( UpperPart , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( UpperPart , EM_SetModeType_Searchenemy , false )	------不索敵
	SetModeEx( UpperPart , EM_SetModeType_Mark , false )		------不可點選
	SetModeEx( UpperPart , EM_SetModeType_NotShowHPMP , false )	------不show血條
	SetModeEx( UpperPart , EM_SetModeType_Gravity , false )		------沒有重力
	AddToPartition( UpperPart , Room )
	WriteRoleValue( Boss , EM_RoleValue_register7 , UpperPart )
	
	local Exit = CreateObjByFlag( 103211 , 780422 , 11 , 1 )	-----阻擋門(出口)
	SetModeEx( Exit , EM_SetModeType_Move , false )			------不移動
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( Exit , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	------不索敵
	SetModeEx( Exit , EM_SetModeType_Mark , false )			------不可點選
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	------不show血條
	SetModeEX( Exit , EM_SetModeType_Obstruct , true )		------阻擋
	AddToPartition( Exit , Room )
	WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )
	
	local Entrance
	local EnterFight = 0
	while 1 do
		sleep(10)
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if  ( BossTarget ~= 0 ) and ( CheckID( Boss ) ) == true then
			if EnterFight == 0 then  
				Entrance = CreateObjByFlag( 103211 , 780422 , 12 , 1 )		-----阻擋門(入口)
				SetModeEx( Entrance , EM_SetModeType_Move , false )			------不移動
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------不反擊
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		------不可砍殺
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------不索敵
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			------不可點選
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------不show血條
				SetModeEX( Entrance , EM_SetModeType_Obstruct , true )		------阻擋
				AddToPartition( Entrance , Room )
				WriteRoleValue( Boss , EM_RoleValue_register9 , Entrance )
				Mode = 1
				WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )
				EnterFight = 1
			end
			counter1 = counter1 + 1	
			BerserkCounter = BerserkCounter + 1
			--Say(OwnerID() , "counter1="..counter1)	
			if Mode == 1 then
				if counter1 >= ModeTime1 then
					Mode = 2
					WriteRoleValue( Boss , EM_RoleValue_register1 , 2 )
					counter1 = 0	
				end
			elseif Mode == 2 then
				if counter1 >= ModeTime2 then
					Mode = 1
					WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )
					counter1 = 0
				end
			end		
			if BerserkCounter >= 480 then						-------8分鐘狂暴				
				if IsBerserk == 0 then
					--AddBuff( Boss , 504269 , 0 , -1 ) 			-------遺民殿堂boss統一用buff
					IsBerserk = 1
				end	
			end	
		else	
			local BossEnterFight = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
			if EnterFight == 1 or BossEnterFight == 1 then
				if Entrance ~= nil then
					DelObj(Entrance)
				end		
				for i=1 , 10 do
					local BossDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
					sleep(10)
					if CheckID( Boss ) == false and BossDead ~= -1 then
						counter2 = counter2 + 1
						--Say( OwnerID() , counter2 )
						if counter2 == 5 then
							Boss = CreateObjByFlag( 103205 , 780422 , 1 , 1 )				-----Boss主體
							SetModeEx( Boss , EM_SetModeType_Move , false )	------不移動
							AddToPartition( Boss , Room )
							BeginPlot( Boss , "lua_star_BossAI_102558_easy" , 0 )
							Setplot( Boss , "dead" , "star_102558_BossDead_easy" , 30)
							WriteRoleValue( Boss , EM_RoleValue_register7 , UpperPart )
							WriteRoleValue( Boss , EM_RoleValue_register8 , OwnerID() )
							WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )
							counter2 = 0
							break
						end	
					end
				end	
				WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )
				counter1 = 0
				Mode = 1
				EnterFight = 0
				IsBerserk = 0
				BerserkCounter = 0
				WriteRoleValue( OwnerID() , EM_RoleValue_register2 , 0 )
			end	
		end	
	end	
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------非王AI部份(此部份不需更改，參照原來版本，共用普通版function)




