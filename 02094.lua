--/GM ? zone 190 0 -7249.6 104.4 -4661.1
--控制器點：/GM ? zone 190 0 -7640.6 100 -3519.4
--EM_RoleValue_register1 = 計時器
--EM_RoleValue_register2 = BOSS (ball)
--EM_RoleValue_register3 = 戰場中控器
--EM_RoleValue_register6 = EnterFight
--EM_RoleValue_register7 = Boss (Counter)

function lua_sasa_WorldBoss_Counter()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag( 104666 , 780012 , 1 , 1 )
	local ball = CreateObjByFlag( 105051 , 780012 , 1 , 1 )
	local over = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
	local howfar
	
	SetModeEx( ball , EM_SetModeType_HideName, true )			--名稱
	SetModeEx( ball , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
	SetModeEx( ball , EM_SetModeType_Mark, false )				--標記
	SetModeEx( ball , EM_SetModeType_Move , false )				--不移動
	SetModeEx( ball , EM_SetModeType_Searchenemy , false )		--不索敵
	SetModeEx( ball , EM_SetModeType_Fight , false )			--可砍殺攻擊
	SetModeEx( ball , EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( ball , EM_SetModeType_NotShowHPMP , false )		--不show血條

	WriteRoleValue( ball , EM_RoleValue_PID , OwnerID() )
	WriteRoleValue( ball , EM_RoleValue_register2 , Boss )
	BeginPlot( ball , "sasa_105051_check" , 0 )
	AddToPartition( Boss , Room )
	AddToPartition( ball , Room )
	BeginPlot( Boss , "lua_sasa_WorldBoss_AI" , 0 )
	Setplot( Boss , "dead" , "lua_sasa_WorldBoss_Dead" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_register7 , Boss )
	
	local EnterFight = 0

	while 1 do
		over = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
		howfar = ReadRoleValue( OwnerID() , EM_RoleValue_register5 )
		if over == 1 then
		
		elseif over == 2 then
			DelObj( Boss )
			DelObj( ball )
		end
		sleep(10)
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if ( BossTarget ~=  0 ) and ( CheckID( Boss ) == true ) and howfar < 500 then			
			EnterFight = 1
			WriteRoleValue( OwnerID() , EM_RoleValue_register6 , 1 )
		else
			local BossIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
			if EnterFight == 1 and BossIsDead ~= 1 then
				--local BossEnterFight = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )				
				if Boss ~= nil then
					DelObj( Boss )
					DelObj( ball )
				end			
				sleep(50)
				Boss = CreateObjByFlag( 104666 , 780012 , 1 , 1 )
				ball = CreateObjByFlag( 105051 , 780012 , 1 , 1 )
				
				SetModeEx( ball , EM_SetModeType_HideName, true )			--名稱
				SetModeEx( ball , EM_SetModeType_ShowRoleHead, false )		--不秀頭像框
				SetModeEx( ball , EM_SetModeType_Mark, false )				--標記
				SetModeEx( ball , EM_SetModeType_Move , false )				--不移動
				SetModeEx( ball , EM_SetModeType_Searchenemy , false )		--不索敵
				SetModeEx( ball , EM_SetModeType_Fight , false )			--可砍殺攻擊
				SetModeEx( ball , EM_SetModeType_Strikback, false )			--反擊
				SetModeEx( ball , EM_SetModeType_NotShowHPMP , false )		--不show血條
				
				AddToPartition( Boss , Room )
				AddToPartition( ball , Room )
				WriteRoleValue( ball , EM_RoleValue_PID , OwnerID() )
				WriteRoleValue( ball , EM_RoleValue_register2 , Boss )
				BeginPlot( Boss , "lua_sasa_WorldBoss_AI" , 0 )
				BeginPlot( ball , "sasa_105051_check" , 0 )
				Setplot( Boss , "dead" , "lua_sasa_WorldBoss_dead" , 30 )
				WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
				WriteRoleValue( OwnerID() , EM_RoleValue_register7 , Boss )
				
			elseif BossIsDead == 1 then	
				WriteRoleValue( OwnerID() , EM_RoleValue_register6 , 3 )
				DelObj( ball )
				return
			end
			EnterFight = 0
			WriteRoleValue( OwnerID() , EM_RoleValue_register6 , 0 )
		end
	end
end

function lua_sasa_WorldBoss_AI()
	while 1 do
		sleep(10)
		local RandCounter = 0					--女力+狂花之戀(心有所屬)
		local FinalCounter = 0					--香水有毒
		local ShareCounter = 0					--花枝招展
		local ALLCounter = 0					--心靈鎮壓
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local EnterFight = 0
		local LuckyFarmer = {}					--播種農夫X5
		local PlayerInHate1 = {}		--玩家GID
		local PlayerInHate2 = {}		--玩家GID
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				--local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )					--總血量
				--local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )						--當前血量
				--local HPPercent = ( NowHP / MaxHP )*100											--血量百分比
				if EnterFight == 0 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_01]" , 1 )
					--嗯哼！？你們這些醜陋又卑劣的殘兵竟能來到這裡？
					EnterFight = 1
				end
				
				ShareCounter = ShareCounter + 1
				FinalCounter = FinalCounter + 1
				RandCounter = RandCounter + 1
				ALLCounter = ALLCounter + 1
				if ALLCounter >= 37 then							--心靈鎮壓
					local ALL = 496336
					SysCastSpellLv( OwnerID(), OwnerID() , ALL , 2 )--(10%/100%)=30%
					ALLCounter = 0
				elseif ShareCounter >= 30 then
					local Share = 496335							--花枝招展
					PlayerInHate2 = {}
					PlayerInHate2 = star_HateListSort( OwnerID() )
					local RandTarget1 = PlayerInHate2[Rand(table.getn(PlayerInHate2))+1]
					while 1 do
						sleep(1)
						if ReadRoleValue( RandTarget1 , EM_RoleValue_Voc ) == 0 then
							for ii=1 , table.getn(PlayerInHate2) do
								if RandTarget1 == PlayerInHate2[ii] then
									table.remove( PlayerInHate2 , ii )	
									break	
								end	
							end
							sleep(5)	
							RandTarget1 = PlayerInHate2[Rand(table.getn(PlayerInHate2))+1]
							--Say(OwnerID() , "HateCount ="..table.getn(PlayerInHate2) )	
						else
							break
						end	
					end	
					local PlayerName = GetName( RandTarget1 )
					local MessageString = "[SC_104666_02][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
					ScriptMessage( OwnerID() , -1 , 2 , MessageString , 1 )
					--[$VAR1]，讓我試試你有多少能耐！
					sleep(30)
					local SharedPlayer = {}
					local TempShare = {}
					SharedPlayer = SearchRangePlayer( RandTarget1 , 80 )
					for m=0 , table.getn(SharedPlayer)-1 do							
						if ReadRoleValue( SharedPlayer[m] , EM_RoleValue_Voc ) ~= 0 				--GM排除
						 and GetDistance( SharedPlayer[m] , OwnerID() ) <= 600
						 and SharedPlayer[m] ~= nil												
						 and ReadRoleValue( SharedPlayer[m] , EM_RoleValue_IsDead ) == 0 then 	--死人排除
							TempShare[table.getn(TempShare)+1] = SharedPlayer[m]
							--table.remove( SharedPlayer , m )
						end
					end	
					local TotalDamage = 50000						--分擔數字
					local PLV = math.floor( TotalDamage/(table.getn(TempShare)*100) )					
					CastSpellLv( OwnerID() , RandTarget1 , Share , PLV )
					for ii=1 , table.getn(TempShare) do
						--Say( OwnerID() , GetName(TempShare[ii]) )
					end
					sleep(40)
					ShareCounter = 0
				elseif FinalCounter >= 18 then
					local Final = 496332							--飄香(空動作)
					PlayerInHate1 = {}
					PlayerInHate1 = star_HateListSort( OwnerID() )
					--sleep(10)
					--Say(OwnerID() , "FinalCounter ="..FinalCounter)
					LuckyFarmer = {}				--播種農夫X5					
					--local Farmer = {}				--農夫們
					for i=1 , table.getn(PlayerInHate1) do
						local temp2 = PlayerInHate1[i]			 
						if ReadRoleValue(temp2 , EM_RoleValue_Voc) ~= 0 				--GM排除
						 and ReadRoleValue(temp2 , EM_RoleValue_IsDead ) == 0       	--死人排除
						 and GetDistance( temp2 , OwnerID() ) <= 600 then				--距離600以內
							LuckyFarmer[table.getn(LuckyFarmer)+1] = temp2 				--找到的玩家放進TABLE
						end	
					end
					--Say(OwnerID() , "FarmerCounter ="..table.getn(LuckyFarmer))
					if table.getn(LuckyFarmer) >= 5 then							------大於5人就rand 5個
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_03]" , 1 )
						--就是你了，親愛的，替[104666]好好地散發魅力激素吧！
						CastSpellLV( OwnerID(), OwnerID() , Final , 0 )		--飄香(空動作)
						sleep(15)
						for j=1 , 5 do						
							local Lucky2 = Rand(table.getn(LuckyFarmer))+1						--RAND到的數字	
							if ( LuckyFarmer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyFarmer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
								--Say( OwnerID() , "LuckyFarmer ="..LuckyFarmer[Lucky2] )
								AddBuff( LuckyFarmer[Lucky2] , 507834 , 0 , 5 )	--香水有毒
								AddBuff( LuckyFarmer[Lucky2] , 507835 , 0 , 7 )	--檢查倒數								
							end
							table.remove(LuckyFarmer , Lucky2)
							sleep(1)														
						end	
					else													-------5人以下就全中
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_03]" , 1 )
						--就是你了，親愛的，替[104666]好好地散發魅力激素吧！
						CastSpellLV( OwnerID(), OwnerID() , Final , 0 )		--飄香(空動作)
						sleep(15)
						for l=1 , table.getn(LuckyFarmer) do	
							--Say(OwnerID() , "LuckyFarmer = "..GetName(LuckyFarmer[l]))
							if ( LuckyFarmer[l] ~= nil ) and ( ReadRoleValue( LuckyFarmer[l] , EM_RoleValue_IsDead ) == 0 ) then
								AddBuff( LuckyFarmer[l] , 507834 , 0 , 5 )	--香水有毒
								AddBuff( LuckyFarmer[l] , 507835 , 0 , 7 )	--檢查倒數									
							end
							sleep(1)
						end
					end
					FinalCounter = 0
				elseif RandCounter >= 7 then								--女力+狂花之戀(心有所屬)
					Lua_sasa_WorldSkill()
					RandCounter = 0
				end
			end
		end
	end
end


function Lua_sasa_WorldSkill()		---RAND
	local Skill = { 496330 , 496331 }		---女力，狂花之戀(心有所屬)
	local SkillLv = { 4 , 12 }				---(500+500*4)*0.78=1950 , (500/40%)=2900 , DOT(100/80%)=1060
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())
	local BossTarget
	local SkillIndex
	---local TargetTable = {}
	
	if ( Luck >= 0 and Luck < 50 ) then
		SkillIndex = 1
		local RandTarget1 = Rand(table.getn(PlayerInHate))+1	--隨機抓仇恨表內的玩家
		BossTarget = PlayerInHate[RandTarget1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2		
		for m=1 , table.getn(PlayerInHate) do
			local temp2 = PlayerInHate[m]			 
			if ReadRoleValue(temp2 , EM_RoleValue_Voc) ~= 0 				--GM排除
			 and ReadRoleValue(temp2 , EM_RoleValue_IsDead ) == 0 then 	--死人排除
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp2 				--找到的玩家放進TABLE
			end	
		end
		--Say(OwnerID() , "Before ="..table.getn(LuckyPlayer))
		if table.getn(LuckyPlayer) >= 5 then							------大於5人就rand 5個
			for n=1 , 5 do						
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1						--RAND到的數字	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say(OwnerID() , "After ="..table.getn(LuckyPlayer))
			end	
		else													-------5人以下就全中
			for p=1 , table.getn(LuckyPlayer) do				
				if ( LuckyPlayer[p] ~= nil ) and ( ReadRoleValue( LuckyPlayer[p] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[p] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end
	--Say( OwnerID() , "Nice Good job!!" )	
end

function sasa_FinalCounter()								--------香水有毒檢查倒數
	local Pos = Lua_BuffPosSearch( OwnerID() , 507835 )		--檢查
	local Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time )
	
	if CheckBuff( OwnerID() , 507834 ) == false and Time > 2 then			--連續產生
		CancelBuff( OwnerID() , 507835 )
	elseif CheckBuff( OwnerID() , 507834 ) == false and Time <= 2 then		
		SysCastSpellLv( OwnerID() , OwnerID() , 496334 , 10 )	--倒數確認，施放飄香(10%/20%)=30% , DOT(100/50%)=600
		CancelBuff( OwnerID() , 507835 )
	end	
end

function lua_sasa_WorldBoss_dead()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_104666_04]" , 1 )
	--美麗的…花朵…，終將…凋…謝…
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )		---讀出計時器GID
	WriteRoleValue( counter , EM_RoleValue_register1 , 1 )				---告訴計時器Boss死了
	WriteRoleValue( counter , EM_RoleValue_register3 , 1 )
end

function sasa_105051_check()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register2 )
	local howfar = GetDistance( OwnerID(), boss )
	while 1 do
		howfar = GetDistance( OwnerID(), boss )
		sleep (10)
		--Yell( OwnerID() , "howfar="..howfar , 7 )		
		WriteRoleValue ( Counter , EM_RoleValue_Register5 , howfar )		
	end
end