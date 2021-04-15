function star_102708_counter()
	while 1 do
		local FinalBossFlag = 780516
		local Caster = {}
		local Counter1 = 0	 
		local Mode2Time = 60		-------模式2時間間隔
		local ActiveSpell = 505298			-------啟動檢查buff
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local boss = CreateObjByFlag( 102938 , FinalBossFlag , 1 , 1 )
		local Door = 0
		AddToPartition( boss , Room )
		WriteRoleValue(boss , EM_RoleValue_register1 , OwnerID())
		BeginPlot( boss , "star_102708_BossAI" , 0 )
		Caster = star_102708_CasterSpawn(boss)		
		for j=1 , 8 do	
			AddBuff(Caster[j] , 505345 , 0 , -1)  		-------無敵狀態
		end
		while 1 do 
			sleep(10)
			if ReadRoleValue(OwnerID() , EM_RoleValue_register1) == 1 then
				for i=1 , 8 do
					if CheckID(Caster[i]) == true then
						DelObj(Caster[i])
					end							
				end
				DelObj(Door)
				WriteRoleValue(OwnerID() , EM_RoleValue_register1 , 0)		------階段值歸0
				sleep(50)
				break
			elseif ReadRoleValue(OwnerID() , EM_RoleValue_register1) == 2 then	
				local BossGID = ReadRoleValue(OwnerID() , EM_RoleValue_register2)
				for j=1 , 8 do	
					AddBuff(Caster[j] , ActiveSpell , 0 , -1)  -------施放啟動小怪buff						
					WriteRoleValue(Caster[j] , EM_RoleValue_register1 , BossGID)
				end
				if Door == 0 then
					Door = CreateObjByFlag( 102914 , FinalBossFlag , 10 , 1 )
					SetModeEx( Door , EM_SetModeType_Move , false )			------不移動
					SetModeEx( Door , EM_SetModeType_Strikback , false )	------不反擊
					SetModeEx( Door , EM_SetModeType_Fight , false )		------不可砍殺
					SetModeEx( Door , EM_SetModeType_Searchenemy , false )	------不索敵
					SetModeEx( Door , EM_SetModeType_Mark , false )			------不可點選
					SetModeEx( Door , EM_SetModeType_NotShowHPMP , false )	------不show血條
					SetModeEX( Door , EM_SetModeType_Obstruct , true )		------阻擋
					AddToPartition( Door , Room )
				end	
				WriteRoleValue(OwnerID() , EM_RoleValue_register1 , 0)		------階段值歸0
			elseif ReadRoleValue(OwnerID() , EM_RoleValue_register1) == 3 then	
				for i=1 , 8 do
					if CheckID(Caster[i]) == true then
						CancelBuff(Caster[i] , ActiveSpell)
					end							
				end
				WriteRoleValue(OwnerID() , EM_RoleValue_register1 , 0)		------階段值歸0
			elseif ReadRoleValue(OwnerID() , EM_RoleValue_register1) == 4 then	
				local BossGID = ReadRoleValue(OwnerID() , EM_RoleValue_register2)
				local Chosen = {1 , 3 , 5}
				for k=1 , 3 do	
					AddBuff(Caster[Chosen[k]] , ActiveSpell , 0 , -1)  -------施放啟動小怪buff						
					WriteRoleValue(Caster[Chosen[k]] , EM_RoleValue_register1 , BossGID)
				end
				if Door == 0 then
					Door = CreateObjByFlag( 102914 , FinalBossFlag , 10 , 1 )
					SetModeEx( Door , EM_SetModeType_Move , false )			------不移動
					SetModeEx( Door , EM_SetModeType_Strikback , false )	------不反擊
					SetModeEx( Door , EM_SetModeType_Fight , false )		------不可砍殺
					SetModeEx( Door , EM_SetModeType_Searchenemy , false )	------不索敵
					SetModeEx( Door , EM_SetModeType_Mark , false )			------不可點選
					SetModeEx( Door , EM_SetModeType_NotShowHPMP , false )	------不show血條
					SetModeEX( Door , EM_SetModeType_Obstruct , true )		------阻擋
					AddToPartition( Door , Room )
				end	
				WriteRoleValue(OwnerID() , EM_RoleValue_register1 , 0)		------階段值歸0
			elseif ReadRoleValue(OwnerID() , EM_RoleValue_register1) == 5 then				
				DelObj(Door)
			end									
		end	
	end	
end

function star_102708_BossAI()
	while 1 do
		sleep(10)
		local counter1 = 0
		local ActiveSpell = 505298			-------啟動檢查buff
		local InBattle = 0
		local Caster = {}
		local BossCounter = ReadRoleValue(OwnerID() , EM_RoleValue_register1)
		Setplot( OwnerID() , "dead" , "star_102708_Phase2_1" , 30)
		--Caster = star_102708_CasterSpawn(OwnerID())
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
				if InBattle == 0 then
					WriteRoleValue(BossCounter , EM_RoleValue_register1 , 4) 	--------啟動第1階段小怪
					WriteRoleValue(BossCounter , EM_RoleValue_register2 , OwnerID())	-------通知此階段Boss
					InBattle = 1
				end
				counter1 = counter1 + 1
				if counter1 >= 8 then
					star_102708_BossSkill(OwnerID())
					counter1 = 0					
				end
			else 
				if InBattle == 1 then
					WriteRoleValue(BossCounter , EM_RoleValue_register1 , 1) 
					DelObj(OwnerID())
					break		
				end	
			end
		end
	end
end

function star_102708_Phase2_1()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		
	local Sirloth = star_CreateObj_NoAdd( OwnerID() , 102934 , 20 , 0 , 0 , Room , 0)
	local BossCounter = ReadRoleValue(OwnerID() , EM_RoleValue_register1)	
	SetModeEx( Sirloth , EM_SetModeType_Move , false )			------不移動
	SetModeEx( Sirloth , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( Sirloth , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( Sirloth , EM_SetModeType_Searchenemy , false )	------不索敵
	AddToPartition( Sirloth , Room )	
	BeginPlot( Sirloth , "star_102708_Sirloth_1" , 0 )
	WriteRoleValue(Sirloth , EM_RoleValue_register1 , BossCounter)
	WriteRoleValue(Sirloth , EM_RoleValue_register2 , OwnerID())	
end

function star_102708_Sirloth_1()
	local GetNPC = {}
	local GetPlayer = {}
	local Caster = {}
	local CrazySpell = 494758  						-------指定代言者法術
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local BossCounter = ReadRoleValue(OwnerID() , EM_RoleValue_register1)	
	local Servant = ReadRoleValue(OwnerID() , EM_RoleValue_register2)
	GetNPC = SearchRangeNPC(OwnerID() , 800)
	for i=0 , table.getn(GetNPC) do
		if ReadRoleValue( GetNPC[i] , EM_RoleValue_OrgID ) == 102971 then
			Caster[table.getn(Caster)+1] = GetNPC[i]
			--say(GetNPC[i] , "hi")
		end	
	end
	sleep(5)
	if CheckID(Servant) == true then
		DelObj(Servant)					-------刪掉代言者
	end
	Yell(OwnerID() , "[SC_102708_SIRLOTH1]" , 5)		------真是沒用!就讓我再找另一個玩伴陪你們吧!
	sleep(30)	
	local Lucky = Rand(table.getn(Caster))+1 
	CastSpell(OwnerID() , Caster[Lucky] , CrazySpell)
	sleep(50)
	Yell(Caster[Lucky] , "[SC_102708_SERVANT1]" , 5)	------啊啊~不~這是什麼?	
	sleep(20)
	local Avatar2 = star_CreateObj( Caster[Lucky] , 102708 , 0 , 0 , 0 , Room , 0)
	DelObj(Caster[Lucky])
	AddBuff(Avatar2 , 505396 , 0 , -1)			-------魔王嚴選
	Yell(Avatar2 , "[SC_102708_SERVANT2]" , 5)			-------希爾洛奧斯，我偉大的主人，我將會展示我那永恆的忠誠!
	BeginPlot( Avatar2 , "star_102708_Avatar2" , 0 )
	--GetPlayer = SearchRangePlayer ( OwnerID() , 1000 )
	--SetAttack(Avatar2 , GetPlayer[Rand(table.getn(GetPlayer))])
	WriteRoleValue(Avatar2 , EM_RoleValue_register1 , BossCounter)
	sleep(20)
	Yell(OwnerID() , "[SC_102708_SIRLOTH2]" , 5)		------哈哈哈~好好享受快樂的時光吧!	
	sleep(20)
	DelObj(OwnerID())
end

function star_102708_Avatar2()				-------代言者二號
	while 1 do
		sleep(10)
		local counter1 = 0
		local ActiveSpell = 505298			-------啟動檢查buff
		local InBattle = 0
		local Caster = {}
		local BossCounter = ReadRoleValue(OwnerID() , EM_RoleValue_register1)
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			
			if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
				local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
				local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
				local HPPercent =( NowHP / MaxHP)*100 
				if InBattle == 0 then
					WriteRoleValue(BossCounter , EM_RoleValue_register1 , 2)	-------啟動小怪
					WriteRoleValue(BossCounter , EM_RoleValue_register2 , OwnerID())	-------通知此階段Boss		
					InBattle = 1
				end
				counter1 = counter1 + 1
				if counter1 >= 8 then
					star_102708_BossSkill(OwnerID())
					counter1 = 0					
				end
				if HPPercent <= 20 then
					SetModeEx( OwnerID() , EM_SetModeType_Fight , false )		------不可砍殺
					Yell(OwnerID() , "[SC_102708_SERVANT3]" , 5)		------真沒想到，你們這些平凡的生物有這種力量?就讓我使用這卑賤奴僕的軀體來讓你們見識什麼是真正的力量!
					sleep(10)
					DelObj(OwnerID())
					local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Sirloth = star_CreateObj_NoAdd( OwnerID() , 102934 , 0 , 0 , 0 , Room , 0) 
					SetModeEx( Sirloth , EM_SetModeType_Move , false )			------不移動
					--SetModeEx( Sirloth , EM_SetModeType_Strikback , false )	------不反擊
					--SetModeEx( Sirloth , EM_SetModeType_Fight , false )		------不可砍殺
					--SetModeEx( Sirloth , EM_SetModeType_Searchenemy , false )	------不索敵
					AddToPartition( Sirloth , Room )
					AddBuff(Sirloth , 505438 , 0 , -1)						
					BeginPlot( Sirloth , "star_102708_Sirloth_2" , 0 )
					WriteRoleValue(Sirloth , EM_RoleValue_register1 , BossCounter )
				end
			else 
				if InBattle == 1 then
					WriteRoleValue(BossCounter , EM_RoleValue_register1 , 1)
					DelObj(OwnerID())
					break		
				end	
			end
		end
	end
end

function star_102708_Sirloth_2()
	sleep(30)
	Yell(OwnerID() , "[SC_102708_SIRLOTH3]" , 5)		-------全都毀滅吧，全都消失吧，唯有希爾洛奧斯才是永恆的存在!
	SetModeEx( OwnerID() , EM_SetModeType_Move , true )			

	local BossCounter = ReadRoleValue(OwnerID() , EM_RoleValue_register1)
	local GetNPC = {}
	local Caster = {}
	local BerserkSpell = 494683  					-------符文秘術
	local NoCaster = 0								-------判斷是否還有僕從	
	local CasterCounter = 0							-------判斷是否是第一輪搜尋僕從
	local FinalMode = 0
	WriteRoleValue(BossCounter , EM_RoleValue_register2 , OwnerID())	-------通知此階段Boss
	WriteRoleValue(BossCounter , EM_RoleValue_register1 , 3)			-------階段3
	GetNPC = SearchRangeNPC(OwnerID() , 800)
	for i=0 , table.getn(GetNPC) do
		if ReadRoleValue( GetNPC[i] , EM_RoleValue_OrgID ) == 102971 then
			Caster[table.getn(Caster)+1] = GetNPC[i]
			--say(GetNPC[i] , "hi")
		end	
	end
	while 1 do
		sleep(10)
		local counter1 = 0
		local counter2 = 0
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
				WriteRoleValue(OwnerID() , EM_RoleValue_HP , ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP ))
				counter1 = counter1 + 1
				counter2 = counter2 + 1
				if counter1 >= 6 then
					star_102708_SirlothSkill()
					counter1 = 0					
				end
				if counter2 >= 15 and FinalMode == 0 then
					if table.getn(Caster) > 0 then
						local Lucky = Rand(table.getn(Caster))+1
						if CheckID(Caster[Lucky]) == true then
							SetModeEx( Caster[Lucky] , EM_SetModeType_Fight , true )
							SetModeEx( Caster[Lucky] , EM_SetModeType_Searchenemy , true )
							SetModeEx( Caster[Lucky] , EM_SetModeType_Strikback , true )
							CancelBuff(Caster[Lucky] , 505345)
							CastSpell(Caster[Lucky] , OwnerID() ,  BerserkSpell)
							sleep(30)
							SetModeEx( Caster[Lucky] , EM_SetModeType_Move , true )	 	-----移動打開
						end	
						counter2 = 0
						CasterCounter = CasterCounter+1
						table.remove(Caster , Lucky)
					end	
					if NoCaster == 0 and CasterCounter >= 7 then	
						GetNPC = SearchRangeNPC(OwnerID() , 800)
						Caster = {}						-------每次搜尋前就清空此table
						for i=0 , table.getn(GetNPC) do
							if ReadRoleValue( GetNPC[i] , EM_RoleValue_OrgID ) == 102971 and
								ReadRoleValue( GetNPC[i] , EM_RoleValue_IsDead ) == 0 then
								Caster[table.getn(Caster)+1] = GetNPC[i]								
							end	
						end
						if table.getn(Caster) == 0 then
							NoCaster = 1		-----一個僕從都不剩
							FinalMode = 1
							--Yell(OwnerID() , "NoBody Left!" , 5)
							sleep(20)
							Yell(OwnerID() , "[SC_102708_SIRLOTH4]" , 5)	-------什麼?這個軀體真是太脆弱了，竟然連這麼點程度的力量都承受不了!
							sleep(20)
							Yell(OwnerID() , "[SC_102708_SIRLOTH5]" , 5)	-------沒關係，你們的運氣不錯，不過最終的結果還是不會改變的，希爾洛奧斯即將毀滅一切，哈哈哈!
							sleep(20)
							local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
							local Body = star_CreateObj( OwnerID() , 102708 , 0 , 0 , 0 , Room , 0)
							WriteRoleValue(BossCounter , EM_RoleValue_register1 , 5)		------把門打開
							DelObj(OwnerID())
							KillID(AttackTarget , Body)
						end	
					end	
				end
			else 
				WriteRoleValue(BossCounter , EM_RoleValue_register1 , 1)
				DelObj(OwnerID())
				break
			end
		end
	end
end

function star_102708_CasterSpawn(BossGID)
	local FinalBossFlag = 780516
	local Caster = {}
	local Room = ReadRoleValue( BossGID , EM_RoleValue_RoomID )
	for i = 1 , 8 do 
		Caster[i] = CreateObjByFlag( 102971 , FinalBossFlag , i+1 , 1 )
		SetModeEx( Caster[i] , EM_SetModeType_Move , false )			------不移動
		SetModeEx( Caster[i] , EM_SetModeType_Strikback , false )	------不反擊
		--SetModeEx( Caster[i] , EM_SetModeType_Fight , false )		------不可砍殺
		SetModeEx( Caster[i] , EM_SetModeType_Searchenemy , false )	------不索敵
		AddToPartition( Caster[i] , Room )
		BeginPlot( Caster[i] , "star_102708_EvilCaster" , 0 )
	end
	return Caster
end

function star_102708_BossSkill(Boss)									------Boss施放招式
	local Skill = { 494696 , 494757 }	
		-------------------------1.沈重腳步	2.流星襲擊	  			
	local SkillLv = {0 , 10 , 0 }
	local Skill2 = { 494684 , 494697 , 494757 }	
		-------------------------1.死亡倒數	2.惡魔咆嘯	3.流星襲擊			
	local SkillLv2 = {0 , 0 , 0 }
	
	local SkillString1 = { "[SC_102708_1]" , "[SC_102708_2]" }
	local SkillString2 = { "[SC_102708_3]" , "[SC_102708_4]" , "[SC_102708_2]"}
	local Luck = Rand(100)
	local PlayerInHate = star_HateListSort(OwnerID())		--------存放玩家GID
	if ReadRoleValue(Boss , EM_RoleValue_OrgID ) == 102938 then	
		if (Luck >= 0 and Luck < 15) or (Luck >= 45 and Luck < 60) 
			or (Luck >= 75 and Luck < 100) then
			SkillIndex = 1			
			BossTarget = OwnerID()
		elseif (Luck >= 15 and Luck < 30) or (Luck >= 60 and Luck < 75) 
			or (Luck >= 30 and Luck < 45) then	
			SkillIndex = 2			
			BossTarget = OwnerID()
		end	
		ScriptMessage( OwnerID() , -1 , 2 , SkillString1[SkillIndex] , 1 )		
		CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
		sleep(10)
	elseif ReadRoleValue(Boss , EM_RoleValue_OrgID ) == 102708 then
		if (Luck >= 0 and Luck < 25) or (Luck >= 45 and Luck < 60) then
			SkillIndex = 1			
			BossTarget = OwnerID()
		elseif (Luck >= 25 and Luck < 30) or (Luck >= 60 and Luck < 75) then	
			SkillIndex = 2			
			BossTarget = OwnerID()
		elseif (Luck >= 30 and Luck < 45) or (Luck >= 75 and Luck < 100) then	
			SkillIndex = 3			
			BossTarget = OwnerID()		
		end	
		ScriptMessage( OwnerID() , -1 , 2 , SkillString2[SkillIndex] , 1 )		
		CastSpellLV( OwnerID() , BossTarget , Skill2[SkillIndex] , SkillLv2[SkillIndex] )					
		sleep(10)		
	end		
end

function star_102708_SirlothSkill()							------希爾洛奧斯施放招式
	local Skill = { 494685 , 494759 , 494757 }	
		-------------------------1.秘法轟炸	2.地表爆裂	3.流星襲擊			
	local SkillLv = {0 , 0 , 0 }
	local SkillString = { "[SC_102708_5]" , "[SC_102708_6]" , "[SC_102708_7]" }
	local Luck = Rand(100)
	local PlayerInHate = star_HateListSort(OwnerID())		--------存放玩家GID
		
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
		BossTarget = OwnerID()
	end	
	ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
	--Yell( OwnerID() , SkillString[SkillIndex] , 5)
	CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )					
	sleep(10)
end

function star_102708_EvilCaster()		-------控制僕從劇情
	local EvilFire = 494685				-------小怪技能
	local ActiveBuff = 505298			-------啟動檢查buff
	local counter = 0
	local PlayerInHate = {}
	while 1 do
		sleep(10)
		if CheckID( OwnerID() ) == true and 
			ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 and 
			CheckBuff(OwnerID() , ActiveBuff) == true then
			local BossGID = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )		------取出當前階段的BossGID
			counter = counter + 1
			local Ready = Rand(100)
			if counter == 10 then
				if CheckBuff(OwnerID() , 505343) == false and				------身上沒有衣服給予的控場技能才施法
					CheckBuff(OwnerID() , 505344) == false then
					if CheckID(BossGID) == true then
						PlayerInHate = star_HateListSort(BossGID)
					end					
					if table.getn(PlayerInHate) > 0 then
						local Lucky = Rand(table.getn(PlayerInHate))+1
						CastSpellLV( OwnerID() , PlayerInHate[Lucky] , EvilFire , 15 )		------施放秘法轟炸
					end	
				end
				counter = 0
			end
		elseif CheckID( OwnerID() ) == false and 
			ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then	
			break
		end
	end		
end

------------------------------------------------------------------------------------------------------------------------衣服技能部份
function star_RobeSkill1()
	if CheckBuff(TargetID() , 505323) == false then
		AddBuff(TargetID() , 505343 , 0 , -1)		
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102708_ROBE1]" , 1 )
	end	
end

function star_RobeSkill2()
	if CheckBuff(TargetID() , 505324) == false then
		AddBuff(TargetID() , 505344 , 0 , -1)
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102708_ROBE2]" , 1 )
	end	
end

function star_DarkCounter()							--------檢查死亡倒數用
	local Pos = Lua_BuffPosSearch( OwnerID() , 505393 )
	local Time = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Time)
	
	if CheckBuff(OwnerID() , 505321) == false and Time > 2 then			
		CancelBuff(OwnerID() , 505393)
	elseif CheckBuff(OwnerID() , 505321) == false and Time <= 2 then		
		KillID(OwnerID() , OwnerID())				
	end	
end

