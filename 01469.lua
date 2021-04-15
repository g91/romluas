function lua_star_BossAI_102349()
	while 1 do 
		sleep(10)
		local counter1 = 0												-------------蟲蟲危機發動計時器	
		local counter2 = 0												-------------一般技能出招計時器
		local counter3 = 0												-------------恐懼計時器
		local ModeCheck = 503981										-------------模式檢查用				
		local Mode1 = 503983											-------------模式1		
		local Mode2 = 503984											-------------模式2	
		local CombatBegin = 0											-------------戰鬥開始旗標
		local Skill = { 493663 , 493664 , 493665 , 493787 , 493788 }	--------------- 1.尖角穿刺   	2.裂地	3.王蟲震攝		4.塵土飛揚		5.現身(未使用)		
		local SkillLv = {0 , 0 , 0 , 0 , 0}
		local SkillString = { "[SC_102349_1]" , "[SC_102349_2]" , "[SC_102349_3]" }
		
		local LittleWormID = 102351		----------自爆小蟲
		local LittleWorm = {}			----------自爆小蟲GID存放用
		local FakeBossID = 102350		----------Boss分身
		local WormHoleFlag = 780396		----------蟲洞旗子( 潛入地下)
		local Earthquake = 1			----------是否表演鑽入土中
		local ControlSpell = 493666			---------靈魂連結	
		local NowHP = 0
			
		while 1 do	
			sleep(10)	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
				if CombatBegin == 0 then							---------------只有開場放一次
					AddBuff( OwnerID() , ModeCheck , 0 , -1 )		----------------------------上Boss模式檢查Buff
					AddBuff( OwnerID() , Mode1 , 0 , -1 )		----------------------------Boss模式1  
					CombatBegin = 1
				end	
				counter1 = counter1 + 1							----------蟲蟲危機開始計時
				counter2 = counter2 + 1							----------一般技能技能
				counter3 = counter3 + 1							---------恐懼計時
				local partymember = LuaFunc_PartyData(AttackTarget)				
				local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
				local Luck = Rand( 100 )		--------- 出招亂數
				local SkillIndex = 1
				local BossTarget = AttackTarget

				if CheckBuff(OwnerID() , Mode1) == true then							-----------------處於模式1
					Earthquake = 1					
				elseif CheckBuff(OwnerID() , Mode2) == true then							-----------------處於模式2
					if Earthquake == 1 then
						local BeControlled = 0
						WriteRoleValue( OwnerID() , EM_RoleValue_AttackDelay , 20 )			------延遲普攻2秒( 要確定功能都ok )
						SetModeEx( OwnerID() , EM_SetModeType_Move , false )			------乖乖站著播特效
						CastSpellLV( OwnerID() , AttackTarget , ControlSpell , 0 )			-------靈魂連結綁人
						sleep(30)
						while 1 do
							BeControlled = Rand(table.getn(partymember))+1
							if ReadRoleValue( partymember[BeControlled] , EM_RoleValue_IsDead ) == 0  then								
								AddBuff( partymember[BeControlled] , 504033 , 0 , -1 )								
								break
							else
								table.remove( partymember , partymember[BeControlled] )
							end	
						end	
						WriteRoleValue( OwnerID() , EM_RoleValue_register1 , partymember[BeControlled] )						
						CastSpellLV( OwnerID() , OwnerID() , Skill[4] , SkillLv[4] )		-------------------表演潛入土中
						sleep(15)
						SetModeEx( OwnerID() , EM_SetModeType_Move , true )	
						local Hole = {1 , 2 , 3 , 4 , 5 , 6}
						local HoleNumber = Rand(6)+1
						table.remove( Hole , HoleNumber )
						local HoleNumber1 = Rand(table.getn( Hole ) ) + 1												
						SetPosByFlag( OwnerID(), WormHoleFlag , HoleNumber )						
						NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )	-------紀錄王當前血量
						local FakeBoss = CreateObjByFlag( FakeBossID , WormHoleFlag , Hole[HoleNumber1] , 1 )		---------------分身出現
						AddToPartition( FakeBoss , Room )
						SetAttack( FakeBoss , AttackTarget )
						AddBuff( FakeBoss , 504034 , 0 , -1 )
						WriteRoleValue( FakeBoss , EM_RoleValue_register1 , AttackTarget )
						WriteRoleValue( FakeBoss , EM_RoleValue_register3 , NowHP )
						CallPlot( FakeBoss , "lua_star_BossAI_FakeBoss" , OwnerID() )
						Earthquake = 2
					end	
				end					
				if counter2 >= 7 then					-----------Boss一般技能施放
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
					counter2 = 0
				elseif counter3 >= 15 and CheckBuff(OwnerID() , Mode2) == false then		-------Boss施放恐懼
					SkillIndex = 3
					BossTarget = OwnerID()
					
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					--Yell( OwnerID() , SkillString[SkillIndex] , 5)
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
					sleep(20)
					counter3 = 0					
				end									
				
				if counter1 == 20 then							--------蟲蟲危機發動
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) == 0  then 						
							local LittleWormTemp = lua_star_CreateNPC( partymember[i] , 0 , LittleWormID , 200 , Room )	--------生出自爆蟲
							LittleWorm[table.getn( LittleWorm )+1] = LittleWormTemp									--------並將GID存入table	
							Setplot( LittleWormTemp , "range" , "lua_star_BossAI_BigWorm_2" , 40)
							--Setplot( LittleWormTemp , "dead" , "lua_star_BossAI_LittleDead" , 30)					-----為了刪掉小蟲屍體
							SetAttack( LittleWormTemp , partymember[i] )
						end
					end
					counter1 = 0
				end	
			else
				for i = 1 , table.getn( LittleWorm ) do
					if CheckID( LittleWorm[i] ) == true and LittleWorm[i] ~= nil then
						DelObj( LittleWorm[i] )
					end
				end
				break		------------------------離開戰鬥跳出當前迴圈，重置所有變數
			end	
		end		
	end
end

function lua_star_BossAI_BigWorm_2()		------------自爆蟲劇情
	BeginPlot( TargetID(), "lua_star_BossAI_BigWorm_3", 1 )	
end

function lua_star_BossAI_BigWorm_3()		------------自爆蟲劇情
	Setplot( OwnerID() , "range" , "" , 0)		-------避免重複觸發
	local BombSpell = 493667		--------爆炸
	CastSpell( OwnerID() , OwnerID() , BombSpell)		
end

function lua_star_BossModeCheck()	---------------------檢查Boss處於哪個模式
	local Mode1 = 503983
	local Mode2 = 503984
	if CheckBuff(OwnerID() , Mode1)	== true and CheckBuff(OwnerID() , Mode2) == false then
		CancelBuff( OwnerID() , Mode1 )
		AddBuff( OwnerID() , Mode2 , 0 , -1 )	
	elseif CheckBuff(OwnerID() , Mode1)	== false and CheckBuff(OwnerID() , Mode2) == true then
		CancelBuff( OwnerID() , Mode2 )
		AddBuff( OwnerID() , Mode1 , 0 , -1 )		
	end
end

function lua_star_BossAI_FakeBoss(Boss)		------Boss分身劇情
	local HP = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )	
	--WriteRoleValue( OwnerID() , EM_RoleValue_HP , HP )	---------7/21紀錄Boss血量暫時先拿掉
	WriteRoleValue( OwnerID() , EM_RoleValue_register2 , Boss )
	--local player = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	--local partymember = LuaFunc_PartyData( player )
	local BeControlled = ReadRoleValue( Boss , EM_RoleValue_register1 )
	local counter = 0
	 
	WriteRoleValue( OwnerID() , EM_RoleValue_register1 , BeControlled )
	Setplot( OwnerID() , "dead" , "lua_star_BossAI_FakeDead" , 30)
	for i=1 , 50 do
		if CheckID(OwnerID()) == true then
			counter = counter + 1
			sleep(10)
			if counter == 40 then
				DelObj(OwnerID())
				break
			end
		else
			break	
		end	
	end	
end

function lua_star_BossAI_FakeDead()			-------分身死亡劇情
	local ControllBuff = 504033
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
	local BeControlled = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	CancelBuff( BeControlled , ControllBuff )
end

function lua_star_102349_TransferDM()	--------因為觸發法術的被攻擊觸發只有物理攻擊才能觸發，所以改用每秒產生法術來做( 504034連續產生用 )
	local ControllBuff = 504033
	local LastDamage = ReadRoleValue( OwnerID() , EM_RoleValue_LastDHp )	-------最後一次被傷害值( 這個值並不會自己清空 )
	local LastTemp = 0														-------暫存前一次的最後被傷害值
	if ReadRoleValue( OwnerID() , EM_RoleValue_register5 ) == 0 then  		-------register5用來判斷是當次的被傷害值還是前一次的
		WriteRoleValue( OwnerID() , EM_RoleValue_register5 , 1 )
		WriteRoleValue( OwnerID() , EM_RoleValue_register6 , LastDamage )	-------register6存放當次被傷害值
		LastTemp = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_register5 ) == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_register5 , 0 )
		WriteRoleValue( OwnerID() , EM_RoleValue_register7 , LastDamage )	-------register7存放前一次被傷害值
		LastTemp = ReadRoleValue( OwnerID() , EM_RoleValue_register6 )
	end		 
	local TransDamage = LastDamage*0.5										--------轉移玩家攻擊分身傷害比例
	local TD = math.floor(abs(TransDamage))	
	local BeControlled = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	if LastDamage ~= LastTemp then
		SysCastSpellLV(OwnerID() , BeControlled , 493696 , TD )
	end	
end

