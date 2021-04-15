
--門口：/GM ? zone 134 0 60 685 -715
--控制器：/GM ? zone 134 0
--門：1：/GM ? zone 134 0 -147.6 687.6 -720.9 Dir 180.8
--BOSS：2：/GM ? zone 134 0 -859.8 698.9 -507.0 Dir 21.8
--小怪：3~12(10個棺木)
--寶箱：13~15(3個寶箱)

--EM_RoleValue_register1：門

function lua_sasa_104228_Boss()
	while 1 do 
		sleep(10)
		local counter1 = 0												----------07--雙角尖刺 
		local counter2 = 0												----------13--蟲蟲來襲
		local counter3 = 0												----------18--聖石墬
		local counter4 = 0												----------33--翅毒
		local counter5 = 0												----------45--撼天震地
		local BerserkCounter = 0										----狂暴計時
		local IsBerserk = 0												-------狂暴開關
		
		--local NextMode = 基本											-------------進入下一模式

		local Skill = { 496031 , 496030 , 496028 , 496027 }	---------------雙角尖刺 , 聖石墬 , 翅毒 , 撼天震地
		local SkillLv = { 0 , 6 , 0 , 0 }
		local SkillString = { "[SC_104228_01]" , "[SC_104228_02]" , "[SC_104228_03]" , "[SC_104228_04]" }
		--銳利的尖刺，毫不留情地朝你襲來。
		--巨大的滾石讓你摸不著從何而生！
		--散落出的翅毒正是危險的象徵。
		--重拍撼地，身為盜墓者的你，對蟲王而言簡直殘弱不堪。
		local LittleWorm1 = 103951			----------自爆小蟲
		local LittleWorm2 = 103952			----------營養小蟲
		local LittleWorm1 = {}				----------自爆小蟲GID存放用
		local LittleWorm2 = {}				----------營養小蟲GID存放用
		local WormSkill = 496036			----------蟲弒
		local EnterFight = 0
		local Entrance = 0
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		Setplot( OwnerID() , "dead" , "lua_sasa_104228_BossDead" , 30 )
		while 1 do	
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then				
				local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--讀取血量
				local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )      --讀取目前血量
				local HPPercent = (NowHP / MaxHP)*100     				--血量百分比
				if EnterFight == 0 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104228_07]" , 1 )			----------你擅闖此處已惹怒了墓穴蟲王－[104228]。
					Entrance = CreateObjByFlag( 104455 , 780747 , 1 , 1 )		------阻擋門
					SetModeEx( Entrance , EM_SetModeType_Move , false )			------不移動
					SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------不反擊
					SetModeEx( Entrance , EM_SetModeType_Fight , false )		------不可砍殺
					SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------不索敵
					SetModeEx( Entrance , EM_SetModeType_Mark , false )			------不可點選
					SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------不show血條
					SetModeEX( Entrance , EM_SetModeType_Obstruct , true )		------阻擋
					AddToPartition( Entrance , Room )
					WriteRoleValue( OwnerID() , EM_RoleValue_register1 , Entrance )
					EnterFight = 1
				end	
				counter1 = counter1 + 1												----------07--雙角尖刺
				counter2 = counter2 + 1												----------13--蟲蟲來襲
				counter3 = counter3 + 1												----------18--聖石墬
				counter4 = counter4 + 1												----------33--翅毒
				counter5 = counter5 + 1												----------45--撼天震地
				BerserkCounter = BerserkCounter + 1									---------狂暴計時
				local Luck = Rand( 100 )											---------出招亂數
				local SkillIndex 													---------取TABLE內的位置
				local BossTarget = AttackTarget 									---------存BOSS要打的目標
				if BerserkCounter >= 360 then										---------狂暴
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104228_05]" , 1 )		---------墓穴蟲王的耐性已被磨盡，黑暗之力降臨！
					if IsBerserk == 0 then
						AddBuff( OwnerID() , 507663 , 0 , -1 ) 
						--Say( OwnerID() , "U guys r going to die!!")
						IsBerserk = 1
					end	
					BerserkCounter = 0
				elseif counter5 >= 45 then
					SkillIndex = 4
					BossTarget = OwnerID()
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					--Say( OwnerID() , "45 got it" )
					sleep(30)
					counter5 = 0	
				elseif counter4 >= 33 then
					SkillIndex = 3
					BossTarget = OwnerID()
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					--Say( OwnerID() , "33 ok" )
					sleep(20)
					counter4 = 0
				elseif counter3 >= 18 then
					SkillIndex = 2
					--Bosstarget = AttackTarget
					local LuckyPlayer = {}											------存放被選中的玩家
					local Player = {}												-------隨機玩家
					local countplayer = SetSearchAllPlayer(Room)						---找這層的玩家
					for i=1 , countplayer do
						local temp = GetSearchResult()
						if ReadRoleValue(temp , EM_RoleValue_Voc) ~= 0 				--GM排除
						 and ReadRoleValue(temp , EM_RoleValue_IsDead ) == 0 then 	--死人排除
							Player[table.getn(Player)+1] = temp 					--找到的玩家放進TABLE
						end
					end
					--Say(OwnerID() , "Before ="..table.getn(Player))
					if table.getn(Player) >= 2 then									------大於2人就rand 2個
						CastSpellLV( OwnerID(), OwnerID() , 496034 , 0 )
						for j=1 , 2 do						
							local lucky = Rand(table.getn(Player))+1				--RAND到的數字	
							LuckyPlayer[table.getn(LuckyPlayer)+1] = Player[lucky]
							ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
							SysCastSpellLV( OwnerID(), Player[lucky] , Skill[SkillIndex] , SkillLv[SkillIndex] )
							sleep(1)
							for k=1 , table.getn(Player) do									--開始比對RAND到的數字
								if Player[k] == Player[lucky] then							--比對中
									table.remove(Player , k)
								end
							end
							--Say(OwnerID() , "After ="..table.getn(Player))
						end
					else																-------2人以下就全中
						--Say( OwnerID() , "Only One" )
						for l=1 , table.getn(Player) do
							LuckyPlayer[table.getn(LuckyPlayer)+1] = Player[l]
							ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
							SysCastSpellLv( OwnerID(), Player[l] , Skill[SkillIndex] , SkillLv[SkillIndex] )
							sleep(1)
						end
					end
					counter3 = 0
				elseif counter2 >= 13 then												--------蟲蟲危機發動
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_104228_06]" , 1 )			--------[104228]發出尖銳刺耳的呼叫，周圍似乎有甚麼正在竄動著…
					for m = 1 , 2 do
						local PlayerInHate = {}
						PlayerInHate = star_HateListSort(OwnerID())
						local LuckyGuyNumber = Rand(table.getn(PlayerInHate))+1
						local flagNum1 = Rand(10)+3
						local flagNum2 = Rand(10)+3
						local BugNumber = 1
						if HPPercent <= 50 then
							BugNumber = 2
							--Say( OwnerID() , "HP ="..HPPercent )
						end
						for n = 1 , BugNumber do							
							local LittleWormTemp1 = CreateObjByFlag( 103951 , 780747 , flagNum1 , 1 )
							local LittleWormTemp2 = CreateObjByFlag( 103952 , 780747 , flagNum2 , 1 )
							if ReadRoleValue( PlayerInHate[LuckyGuyNumber] , EM_RoleValue_IsDead ) == 0 then
								LittleWorm1[table.getn( LittleWorm1 )+1] = LittleWormTemp1			--------將GID存入table
								AddToPartition( LittleWorm1[table.getn(LittleWorm1)] , Room )
								WriteRoleValue( LittleWormTemp1 , EM_RoleValue_Livetime , 20 )
								Setplot( LittleWormTemp1 , "range" , "lua_sasa_103951_Bomb_1" , 50 )
								Setplot( LittleWormTemp1 , "dead" , "lua_sasa_103951_dead" , 30 )	
								SetAttack( LittleWormTemp1 , PlayerInHate[LuckyGuyNumber] )
								--Say( OwnerID() , "Here they're coming" )

								LittleWorm2[table.getn( LittleWorm2 )+1] = LittleWormTemp2
								AddToPartition( LittleWorm2[table.getn(littleWorm2)] , Room )
								WriteRoleValue( LittleWormTemp2 , EM_RoleValue_Livetime , 40 )
								Setplot( LittleWormTemp2 , "dead" , "lua_sasa_103952_dead" , 30 )
								CastSpellLV( LittleWormTemp2 , OwnerID() , WormSkill , 0 )
							end	
							sleep(1)
						end		
					end	
					sleep(10)
					counter2 = 0
				elseif counter1 >= 7 then
					SkillIndex = 1
					BossTarget = OwnerID()
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					--Say( OwnerID() , "777777777" )
					sleep(10)
					counter1 = 0
				end
			else	
				if EnterFight == 1 then
					DelObj( Entrance )
					for o = 1 , table.getn(LittleWorm1) do
						if CheckID(LittleWorm1[o]) == true and LittleWorm1[o] ~= nil then
							DelObj( LittleWorm1[o] )
						end
					end
					for p = 1 , table.getn(LittleWorm2) do
						if CheckID(LittleWorm2[p]) == true and LittleWorm2[p] ~= nil then
							DelObj( LittleWorm2[p] )
						end
					end
					
					--BerserkCounter = 0
					--IsBerserk = 0
					BeginPlot(OwnerID() , "ic_nohi_18_134_03" , 0)	
					EnterFight=0
					break		------------------------離開戰鬥跳出當前迴圈，重置所有變數			
				end			
			end	
		end		
	end
end

function lua_sasa_103951_Bomb_1()				-------自爆蟲
	BeginPlot( TargetID(), "lua_sasa_103951_Bomb_2", 1 )
	--Say( OwnerID() , "Bomb1" )
end

function lua_sasa_103951_Bomb_2()				-------自爆蟲
	Setplot( OwnerID() , "range" , "" , 0)		-------避免重複觸發
	local Bomb = 496035							-------自體衝擊
	local Bomb2 =496164 						-------自體毀滅
	CastSpellLv( OwnerID() , OwnerID() , Bomb , 0 )
	sleep(10)
	SysCastSpellLv( OwnerID() , OwnerID() , Bomb2 , 0 )
	--Say( OwnerID() , "Bomb2" )
end

function lua_sasa_103951_dead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )			----讀在哪一層
	local poisonball = star_CreateObj_NoAdd( OwnerID() , 104573 , 0 , 0 , 0 , Room , 0 ) 			----小怪死掉生球
	local poison = 496029					----聖靈之穢
	--Say( poisonball , "poison!!!" )
	SetModeEx( poisonball , EM_SetModeType_SearchenemyIgnore, true)		---物件不會被搜尋
	SetModeEx( poisonball , EM_SetModeType_HideName, true)  			---物件頭上是否顯示名稱
	SetModeEx( poisonball , EM_SetModeType_HideMinimap, true)			---物件是否在小地圖上顯示
	SetModeEx( poisonball , EM_SetModeType_Searchenemy, false)   		--索敵
	SetModeEx( poisonball , EM_SetModeType_Mark, false)					--標記
	SetModeEx( poisonball , EM_SetModeType_Fight, false) 				--砍殺
	SetModeEx( poisonball , EM_SetModeType_Move, false)					--移動
	SetModeEx( poisonball , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( poisonball , EM_SetModeType_Strikback, false)			--反擊
	SetModeEx( poisonball , EM_SetModeType_Show, true)					--秀出
	
	AddToPartition( poisonball , Room )
	WriteRoleValue( poisonball, EM_RoleValue_Livetime, 10 )				--存在秒數
	CastSpellLv( poisonball , poisonball , poison , 5 )
end

function lua_sasa_103952_dead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )			----讀在哪一層
	local poisonball2 = star_CreateObj_NoAdd( OwnerID() , 104537 , 0 , 0 , 0 , Room , 0 ) 			----小怪死掉生球
	local poison2 = 496029					----聖靈之穢
	--Say( poisonball2 , "poison!!!" )
	SetModeEx( poisonball2 , EM_SetModeType_SearchenemyIgnore, true)		---物件不會被搜尋
	SetModeEx( poisonball2 , EM_SetModeType_HideName, true)  			---物件頭上是否顯示名稱
	SetModeEx( poisonball2 , EM_SetModeType_HideMinimap, true)			---物件是否在小地圖上顯示
	SetModeEx( poisonball2 , EM_SetModeType_Searchenemy, false)   		--索敵
	SetModeEx( poisonball2 , EM_SetModeType_Mark, false)					--標記
	SetModeEx( poisonball2 , EM_SetModeType_Fight, false) 				--砍殺
	SetModeEx( poisonball2 , EM_SetModeType_Move, false)					--移動
	SetModeEx( poisonball2 , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( poisonball2 , EM_SetModeType_Strikback, false)			--反擊
	SetModeEx( poisonball2 , EM_SetModeType_Show, true)					--秀出
	
	AddToPartition( poisonball2 , Room )
	WriteRoleValue( poisonball2 , EM_RoleValue_Livetime, 10 )				--存在秒數
	CastSpellLv( poisonball2 , poisonball2 , poison2 , 5 )
end

function lua_sasa_104228_BossDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local LuckyFlag = {13 , 14 , 15}
	local LuckyNumber1 = Rand(3)+1
	--Say(TargetID() , "LuckyNumber1 ="..LuckyNumber1)
	local treasure1 = CreateObjByFlag( 104534 , 780747 , LuckyFlag[LuckyNumber1] , 1 )			----主掉落，古墓神秘寶箱
	SetModeEx( treasure1 , EM_SetModeType_Searchenemy, false)   		--索敵
	SetModeEx( treasure1 , EM_SetModeType_Fight, false) 				--砍殺
	SetModeEx( treasure1 , EM_SetModeType_Move, false)					--移動
	SetModeEx( treasure1 , EM_SetModeType_Strikback, false)				--反擊
	AddToPartition(treasure1 , Room)
	BeginPlot( treasure1 , "lua_sasa_104534_treasure1", 0 )
	table.remove(LuckyFlag , LuckyNumber1)
	local treasure2 = CreateObjByFlag( 104535 , 780747 , LuckyFlag[1] , 1 )			----分身用，古墓守護寶箱
	SetModeEx( treasure2 , EM_SetModeType_Searchenemy, false)   		--索敵
	SetModeEx( treasure2 , EM_SetModeType_Fight, false) 				--砍殺
	SetModeEx( treasure2 , EM_SetModeType_Move, false)					--移動
	SetModeEx( treasure2 , EM_SetModeType_Strikback, false)				--反擊
	AddToPartition(treasure2 , Room)
	BeginPlot( treasure2 , "lua_sasa_104534_treasure2", 0 )
	local treasure3 = CreateObjByFlag( 104536 , 780747 , LuckyFlag[2] , 1 )			----掉髒用，古墓守護寶箱
	SetModeEx( treasure3 , EM_SetModeType_Searchenemy, false)   		--索敵
	SetModeEx( treasure3 , EM_SetModeType_Fight, false) 				--砍殺
	SetModeEx( treasure3 , EM_SetModeType_Move, false)					--移動
	SetModeEx( treasure3 , EM_SetModeType_Strikback, false)				--反擊
	AddToPartition(treasure3 , Room)
	BeginPlot( treasure3 , "lua_sasa_104534_treasure3", 0 )

	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	DelObj( Entrance )
end

function lua_sasa_104534_treasure1()		-----主寶箱
	SetPlot( OwnerID() ,"touch", "sasa_104534_treasure1_open" ,40 )
end

function sasa_104534_treasure1_open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	KillID( OwnerID() , TargetID() )
end

function lua_sasa_104534_treasure2()		-----分身寶箱
	SetPlot( OwnerID() ,"touch", "sasa_104534_treasure2_open" ,40 )
end

function sasa_104534_treasure2_open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	KillID( OwnerID() , TargetID() )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local FakeBoss = star_CreateObj( OwnerID() , 104456 , 0 , 0 , 0 , Room , 0 )
end

function lua_sasa_104534_treasure3()		-----掉髒寶箱
	SetPlot( OwnerID() ,"touch", "sasa_104534_treasure3_open" ,40 )
end

function sasa_104534_treasure3_open()
	SetPlot( TargetID() ,"touch", "" ,0 )
	KillID( OwnerID() , TargetID() )
end