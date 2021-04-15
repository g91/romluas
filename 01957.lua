--門口：/GM ? zone 133 0 -571 343 1709
--控制器：/GM ? zone 133 0 -181.8 414.4 2060.7
--牆上：-422.1 , 640.5 , 2233.4 , 106.2
--佩謝+花苞透明球：1
--小怪：2~21
--前門：22
--後門：23：-343.1 371.9 2409.8-106.7
--Boss , EM_RoleValue_register1	---階段
--Boss , EM_RoleValue_register2	---是否還有人可以打
--Boss , EM_RoleValue_register7 ---前門
--Boss , EM_RoleValue_register8 ---後門
--Boss , EM_RoleValue_register9	---counter
--Boss , EM_RoleValue_register10 ---Boss是否進入過戰鬥

function lua_sasa_104168_Counter()			--模式計時器
	local counter1 = 0			-------階段1計時
	local counter2 = 0
	local BerserkCounter = 0	----狂暴計時
	local IsBerserk = 0			-------狂暴開關
	local Mode = 0				-------判斷模式用
	local ModeTime1 = 56		-------模式1時間間隔
	local Mode2Buff = 507358	-------模式2的BUFF	
	local skill2 = 495985		-------發散孢子
	local skill3 = 495986		-------花苞守護(純特效)
	local skill5 = 495992		-------落地塵埃(花下來的特效)
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----讀在哪一層
	local SearchPlayer = {}
	local SearchCounter = 0
	local AnotherTarget = 0
	local Boss = 0
	local SecondBoss = 0
	local Entrance = 0
	
	local Flower = CreateObj ( 104173 , -422.1 , 640.5 , 2233.4 , 106.2 , 1)		---Y軸調高度，DIR=面向
	--local Flower = CreateObj ( 104173 , -1205.5 , -50.5 , -1225.4 , 342.5 , 1)		--測試區
	SetModeEx( Flower , EM_SetModeType_Move , false )			------不移動
	SetModeEx( Flower , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( Flower , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( Flower , EM_SetModeType_Searchenemy , false )	------不索敵
	SetModeEx( Flower , EM_SetModeType_Mark , false )			------不可點選
	SetModeEx( Flower , EM_SetModeType_NotShowHPMP , false )	------不show血條
	SetModeEx( Flower , EM_SetModeType_Gravity , false )		------沒有重力
	AddToPartition( Flower , Room )
	
	local FlowerBall = CreateObjByFlag( 104175 , 780702 , 1 , 1 ) 	---花的透明球
	SetModeEx( FlowerBall , EM_SetModeType_Move , false )			------不移動
	SetModeEx( FlowerBall , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( FlowerBall , EM_SetModeType_Mark , false )			------不可點選
	SetModeEx( FlowerBall , EM_SetModeType_NotShowHPMP , false )	------不show血條
	AddToPartition( FlowerBall , Room )
	
	local Exit = CreateObjByFlag( 104172 , 780702 , 23 , 1 )	-----阻擋門(出口)
	SetModeEx( Exit , EM_SetModeType_Move , false )			------不移動
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( Exit , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	------不索敵
	SetModeEx( Exit , EM_SetModeType_Mark , false )			------不可點選
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	------不show血條
	SetModeEX( Exit , EM_SetModeType_Obstruct , true )		------阻擋
	AddToPartition( Exit , Room )
	
	while 1 do
		sleep(10)
		local FlowerTarget = ReadRoleValue( FlowerBall , EM_RoleValue_AttackTargetID )	----讀花透明球攻擊目標 
		--Say(FlowerBall , FlowerTarget)
		if ( FlowerTarget ~= 0 ) and ( CheckID( FlowerBall ) == true) then
			ScriptMessage( Flower , -1 , 2 , "[SC_104143_01]" , 1 )				---無禮的入侵者！是誰允許你們進入這神聖之殿？
			DelObj(Flower)
			Sleep(20)
			CastSpellLv( FlowerBall , FlowerBall , skill5 , 0 )
			Boss = CreateObjByFlag( 104143 , 780702 , 1 , 1 )				----在旗標生物件
			AddToPartition( Boss , Room )										----把物件加到某層
			sleep(20)									-----為了不讓透明球在還沒放出特效法術前就被刪掉了
			DelObj(FlowerBall)
			BeginPlot( Boss , "lua_sasa_104143_Boss" , 0 )						----叫物件執行"內容",始動秒數
			Setplot( Boss , "dead" , "lua_sasa_104143_Bossdead" , 30)
			WriteRoleValue( Boss , EM_RoleValue_register9 , OwnerID() )
			--Yell(Boss , "9 is"..ReadRoleValue( Boss , EM_RoleValue_register9) , 5 )
			WriteRoleValue( Boss , EM_RoleValue_register8 , Exit )
			local EnterFight = 0												----進入戰鬥開關
			
			while 1 do
				sleep(10)				
				local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )	----讀攻擊目標
				if SearchCounter >= 10 or SearchCounter == 0 then	
					SearchPlayer = {}
					local countplayer = SetSearchAllPlayer(Room)
					for k=1 , countplayer do
						local tempplayer = GetSearchResult()
						if ReadRoleValue(tempplayer , EM_RoleValue_Voc) ~= 0 then				--GM排除
						 --and ReadRoleValue(tempplayer , EM_RoleValue_IsDead ) == 0 then 	--死人排除
							SearchPlayer[table.getn(SearchPlayer)+1] = tempplayer
						end
					end
					SearchCounter = 0	
				end		
				SearchCounter = SearchCounter + 1
				AnotherTarget = 0
				for	l=1 , table.getn(SearchPlayer) do					
					if GetDistance( Boss , SearchPlayer[l] ) <= 300 				-----距離Boss 300以內 
					 and CheckRelation( Boss, SearchPlayer[l] , EM_CheckRelationType_Attackable ) == true then		-----並且是可攻擊狀態
						AnotherTarget = AnotherTarget + 1
						--Say(Boss , "Player ="..GetName(SearchPlayer[l]))
						WriteRoleValue( Boss , EM_RoleValue_register2 , 1 )	-----為了讓控制器知道Boss還有其他人可以打
						break	
					end	
				end	
				if AnotherTarget == 0 then
					WriteRoleValue( Boss , EM_RoleValue_register2 , 0 )
				end
				if BossTarget ~= 0 or AnotherTarget ~= 0 then											-----王還有沒有其他可以打的目標
					counter1 = counter1 + 1											----每秒+1
					BerserkCounter = BerserkCounter + 1
					--counter2 = counter2 + 1
					if EnterFight == 0 then											----0=開,1=關
						Mode = 1
						WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )	----暫存區(通知王執行哪個模式,數字是模式)
						
						Entrance = CreateObjByFlag( 104171 , 780702 , 22 , 1 )	-----阻擋門(入口)
						SetModeEx( Entrance , EM_SetModeType_Move , false )			------不移動
						SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------不反擊
						SetModeEx( Entrance , EM_SetModeType_Fight , false )		------不可砍殺
						SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------不索敵
						SetModeEx( Entrance , EM_SetModeType_Mark , false )			------不可點選
						SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------不show血條
						SetModeEX( Entrance , EM_SetModeType_Obstruct , true )		------阻擋
						AddToPartition( Entrance , Room )
						WriteRoleValue( Boss , EM_RoleValue_register7 , Entrance ) 
						EnterFight = 1
					end	
					if Mode == 1 then												----假設模式=1
						if BerserkCounter >= 480 then									--狂暴
							ScriptMessage( Boss , -1 , 2 , "[SC_104143_05]" , 1 )				----踐踏叢林的劣者，是時候讓你們知道惹怒我的下場了！
							if IsBerserk == 0 then
								AddBuff( Boss , 507364 , 0 , -1 ) 
								--Say(Boss , "Time ="..BerserkCounter)
								IsBerserk = 1
							end	
							BerserkCounter = 0
						end
						if counter1 >= ModeTime1 then								----計時的變數大於設定的秒數
							--WriteRoleValue( Boss , EM_RoleValue_AttackDelay , 100 )			------延遲普攻10秒
							while ReadRoleValue(Boss , EM_RoleValue_SpellMagicID ) ~= 0 do
								sleep(5)
							end	
							CastSpellLv(Boss , Boss , skill2 , 0 )
							--sleep(40)
							while ReadRoleValue(Boss , EM_RoleValue_SpellMagicID ) ~= 0 do
								sleep(10)
							end
							ScriptMessage( Boss , -1 , 2 , "[SC_104143_03]" , 1 )				----真是苦惱呀，這次又該讓誰來成為我的養分呢…
							SetModeEx( Boss , EM_SetModeType_Move, false)				--移動		
							AddBuff( Boss, Mode2Buff, 69 , -1 )						-----上Boss盾
							--sleep(50)	
							CastSpellLv(Boss, Boss , skill3 , 0 )																
							Mode = 2
							WriteRoleValue( Boss , EM_RoleValue_register1 , 2 )
							counter1 = 0											----要歸0,不然會超時
							sleep(10)		
						end							
					elseif Mode == 2 then											----破盾回第一階段
						if CheckBuff( Boss , Mode2Buff ) == false then
							Mode = 1
							if ReadRoleValue(Boss , EM_RoleValue_SpellMagicID ) == 495986 then		------Boss還在施放花苞守護
								SecondBoss = star_CreateObj_NoAdd( Boss , 104143 , 0 , 0 , 0 , Room , 0) 
								SetModeEx( SecondBoss , EM_SetModeType_Move, false)		-----不可移動
								AddToPartition( SecondBoss , Room )
								WriteRoleValue( SecondBoss , EM_RoleValue_register1 , 1 )
								WriteRoleValue( SecondBoss , EM_RoleValue_register7 , ReadRoleValue( Boss , EM_RoleValue_register7 ) )
								WriteRoleValue( SecondBoss , EM_RoleValue_register8 , ReadRoleValue( Boss , EM_RoleValue_register8 ) )
								WriteRoleValue( SecondBoss , EM_RoleValue_register9 , ReadRoleValue( Boss , EM_RoleValue_register9 ) )
								WriteRoleValue( SecondBoss , EM_RoleValue_register10 , ReadRoleValue( Boss , EM_RoleValue_register10 ) )
								local NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )	
								WriteRoleValue( SecondBoss , EM_RoleValue_HP ,  NowHP)
								DelObj(Boss)																									
								BeginPlot( SecondBoss , "lua_sasa_104143_Boss" , 0 )
								Setplot( SecondBoss , "dead" , "lua_sasa_104143_Bossdead" , 30)
								--Say(SecondBoss , "Boss ="..Boss)
								sleep(10)
								SetModeEx( SecondBoss , EM_SetModeType_Move, true)
								Boss = SecondBoss																	
								--Say(SecondBoss , "AfterBoss ="..Boss)
								--Say(SecondBoss , "SecondBoss ="..SecondBoss)
							else
								SetModeEx( Boss , EM_SetModeType_Move, true)				--Boss可移動
								WriteRoleValue( Boss , EM_RoleValue_register1 , 1 )
							end	
							counter1 = 0	
						end
					end					
				else																----重置
					if EnterFight == 1 then
						local BossIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
						--Say(Boss , BossIsDead )
						if BossIsDead ~= 1 then											---Boss沒死才重生
							if CheckID(Boss) == true then
								DelObj(Boss)
							end
							if CheckID(Entrance) == true then
								DelObj( Entrance )
							end	
							for n=1 , table.getn(SearchPlayer) do
								Setplot( SearchPlayer[n] , "dead" , "" , 30)		--死亡劇情清掉
								sleep(1)
							end
							sleep(50)
							Boss = CreateObjByFlag( 104143 , 780702 , 1 , 1 )
							AddToPartition( Boss , Room )
							BeginPlot( Boss , "lua_sasa_104143_Boss" , 0 )
							Setplot( Boss , "dead" , "lua_sasa_104143_Bossdead" , 30)
							WriteRoleValue( Boss , EM_RoleValue_register9 , OwnerID() )
							WriteRoleValue( Boss , EM_RoleValue_register8 , Exit )
						elseif BossIsDead == 1 then										---Boss死了不重生		
							return	
							--break
						end
						EnterFight = 0													----再開一次
						counter1 = 0													----歸0
						--counter2 = 0
						Mode = 1
						BerserkCounter = 0	----狂暴計時
						IsBerserk = 0
					end		
				end
			end		
		end	
	end	
end

function lua_sasa_104143_Skill_1()		-----Boss技能施放
	local Skill = { 495982 , 495983 }		-----潰傷 	--地刺藤襲
	local SkillLv = { 0 , 3 }
	--local SkillString = { "[]" , "[]" }
	local Luck = Rand(100)													----取亂數放技能
	local PlayerInHate = star_HateListSort(OwnerID())						----取出仇恨表內的玩家
	local BossTarget 														----存BOSS要打的目標
	local SkillIndex 														----取TABLE內的位置

	if (Luck >= 0 and Luck < 50) then										----從0~ 取一個數
		SkillIndex = 1
		local RandTarget1 = Rand(table.getn(PlayerInHate))+1				---隨機抓仇恨表內的玩家
		BossTarget = PlayerInHate[RandTarget1]
	elseif (Luck >= 50 and Luck < 100) then
		SkillIndex = 2
		local RandTarget2 = Rand(table.getn(PlayerInHate))+1
		BossTarget = PlayerInHate[RandTarget2]								---自身範圍,PlayerInHate[1]=第一個
	end
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )		--喊話(誰講,-1=全區玩家,2=黃色警告(不會被洗掉)
	--Yell( OwnerID() , SkillString[SkillIndex] , 5),另一種喊話,可以設範圍
	if 	( BossTarget ~= nil) 
	 and ( ReadRoleValue(BossTarget , EM_RoleValue_IsDead ) == 0 ) then
		CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )	--技能等級(SysCastSpellLV=系統放)
		Sleep(10)
	end
end

function lua_sasa_104143_Boss()			------Boss本體
	while 1 do
		AddBuff(OwnerID() , 505653 , 0 , -1)	------不讓Boss離開戰鬥回血的buff
		Sleep(10)
		local Counter1 = 0						-------小怪計時
		local Counter2 = 0						-------技能計時
		local Counter3 = 0
		local SearchCounter = 0
		local KillCounter = 0
		local Mode2Buff = 507358				-------模式2的BUFF
		local mode = 0							-------判斷模式用
		local mob1 = {}							-------生小怪的變數
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		
		local skill1 = 495984					-------佩謝之印
		local skill4 = 495987					-------吸血藤
		local KillSkill = 495993						-------殺人法術
		local EnterMode2 = 0
		local LuckyPlayer = {}			------存放被吸血藤綁的玩家
		--local SearchPlayer = {}
		while 1 do
			Sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			--讀攻擊的目標
			if AttackTarget ~= 0 then						--王是否還有目標			
				mode = ReadRoleValue( OwnerID() , EM_RoleValue_register1)							--讀之前寫入的模式
				WriteRoleValue( OwnerID() , EM_RoleValue_register10 , 10 )							--告訴計時器已進入戰鬥
				if ReadRoleValue( OwnerID() , EM_RoleValue_register2 )	== 0 then 					-----是否還有人可以打
					SetModeEx( OwnerID() , EM_SetModeType_Move, true)		-----可移動	
				end
				if mode == 1 then
					EnterMode2 = 0
					KillCounter = 0
					SearchCounter = 0
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					counter3 = counter3 + 1
					
					if counter1 >= 15 then
						for i = 1 , 2 do
							local flagNum = Rand(20)+2
							local mobtemp = CreateObjByFlag( 104169 , 780702 , flagNum , 1 )
							mob1[table.getn(mob1)+1] = mobtemp
							SetModeEx( mobtemp , EM_SetModeType_Move, false)				--移動
							AddToPartition( mob1[table.getn(mob1)] , Room )	
							WriteRoleValue( mobtemp , EM_RoleValue_Livetime , 10 )				--存在秒數
							WriteRoleValue( mobtemp , EM_RoleValue_register1 , OwnerID() )	-----將Boss GID寫進小怪
							Setplot( mobtemp , "dead" , "lua_sasa_104169_dead" , 30)								
						end	
						counter1 = 0
					elseif counter3 >=10 then
						ScriptMessage( OwnerID() , -1 , 2 , "[SC_104143_02]" , 1 )			----感受自己軟弱無能的模樣吧！
						CastSpellLv(OwnerID(), OwnerID() , skill1 , 0 )
						sleep(10)
						--Say( OwnerID() , "On" )
						counter3 = 0
					elseif counter2 >= 6 then
						lua_sasa_104143_Skill_1()					
						counter2 = 0
					end
				elseif mode == 2 then					
					if EnterMode2 == 0 then	
						LuckyPlayer = {}			------存放被吸血藤綁的玩家
						Counter1 = 0						
						Counter2 = 0						
						Counter3 = 0
						local Player = {}						-------隨機玩家
						local countplayer = SetSearchAllPlayer(Room)						---找這層的玩家
						for j=1 , countplayer do
							local temp = GetSearchResult()
							if ReadRoleValue(temp , EM_RoleValue_Voc) ~= 0 				--GM排除
							 and ReadRoleValue(temp , EM_RoleValue_IsDead ) == 0 then 	--死人排除
								Player[table.getn(Player)+1] = temp 				--找到的玩家放進TABLE
							end	
						end
						--Say(OwnerID() , "Before ="..table.getn(Player))
						if table.getn(Player) >= 3 then							------大於3人就rand 3個
							for k=1 , 3 do						
								local lucky = Rand(table.getn(Player))+1						--RAND到的數字	
								LuckyPlayer[table.getn(LuckyPlayer)+1] = Player[lucky]	
								SysCastSpellLv(OwnerID(), Player[lucky] , skill4 , 2 )
								Setplot( Player[lucky] , "dead" , "lua_sasa_104143_Playerdead" , 30)		--死亡劇情開跑
								sleep(1)
								for l=1 , table.getn(Player) do									--開始比對RAND到的數字
									if Player[l] == Player[lucky] then							--比對中
										table.remove(Player , l)
									end
								end
								--Say(OwnerID() , "After ="..table.getn(Player))
							end	
						else													-------3人以下就全中
							for m=1 , table.getn(Player) do
								LuckyPlayer[table.getn(LuckyPlayer)+1] = Player[m]
								SysCastSpellLv(OwnerID(), Player[m] , skill4 , 2 )
								Setplot( Player[m] , "dead" , "lua_sasa_104143_Playerdead" , 30)		--死亡劇情開跑
								sleep(1)
							end
						end	
						EnterMode2 = 1
					end	
					KillCounter = KillCounter + 1
					--Say(OwnerID() , "KillCounter ="..KillCounter )
					if KillCounter >= 17 then								-----花苞時間到
						if CheckBuff( OwnerID() , Mode2Buff ) == true then	-----盾沒破
							--Say(OwnerID() , "Yes" )
							for n=1 , table.getn(LuckyPlayer) do
								--Say(OwnerID() , "Player ="..LuckyPlayer[n]  )	
								if CheckBuff(LuckyPlayer[n] , 507359) == true then
									SysCastSpellLv(OwnerID(), LuckyPlayer[n] , KillSkill , 0 )			-----殺了被綁的玩家
									sleep(1)
								else
									--say ( LuckyPlayer[n] , "Buff Over")
									Setplot( LuckyPlayer[n] , "dead" , "" , 30 )		--死亡劇情清掉
								end	
								--KillID( OwnerID() , LuckyPlayer[n] )
							end
						end
						KillCounter = 0
					else
						if CheckBuff( OwnerID() , Mode2Buff ) == false then
							KillCounter = 0
						end
					end	
				end			
			end
		end
	end
end


function lua_sasa_104169_dead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )			----讀在哪一層
	--local ball = LuaFunc_CreateObjByObj ( 104170, 104169 )				----小怪死掉生球
	local ball = star_CreateObj_NoAdd( OwnerID() , 104170 , 0 , 0 , 0 , Room , 0) 			----小怪死掉生球
	local CureSpell = 495989												------解毒法術
	--Say( ball , "Someone_kill_me" )
	SetModeEx( ball , EM_SetModeType_SearchenemyIgnore, true)	---物件不會被搜尋
	SetModeEx( ball , EM_SetModeType_HideName, true)  			---物件頭上是否顯示名稱
	SetModeEx( ball , EM_SetModeType_HideMinimap, true)			---物件是否在小地圖上顯示
	SetModeEx( ball , EM_SetModeType_Searchenemy, false)   		--索敵
	SetModeEx( ball , EM_SetModeType_Mark, false)				--標記
	SetModeEx( ball , EM_SetModeType_Fight, false) 				--砍殺
	SetModeEx( ball , EM_SetModeType_Move, false)				--移動
	SetModeEx( ball , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( ball , EM_SetModeType_Strikback, false)			--反擊
	SetModeEx( ball , EM_SetModeType_Show, true)				--秀出
	
	AddToPartition( ball , Room )
	WriteRoleValue( ball, EM_RoleValue_Livetime,3 )				--存在秒數
	CastSpellLv( ball , ball , CureSpell , 0 )
	--BeginPlot( OwnerID() , "lua_sasa_104169_ball" , 0 )
end

--function lua_sasa_104169_ball()
	--local CureSpell = 495989			------解毒法術
	--CastSpellLv( OwnerID(), OwnerID() , CureSpell , 0 )
--end

function lua_sasa_104143_Playerdead()
	local HealBoss = 495988			-----治療boss
	local BloodBuff = 507359		-----吸血藤
	local pos = Lua_BuffPosSearch( OwnerID() , BloodBuff )	
	local Boss = BuffInfo( OwnerID() , pos , EM_BuffInfoType_OwnerID )
	local MaxHP = ReadRoleValue( Boss , EM_RoleValue_MaxHP )	--讀取血量
	local NowHP = ReadRoleValue( Boss , EM_RoleValue_HP )      --讀取目前血量
	local HPPercent = NowHP / MaxHP	                                --血量百分比
	local PlayerName = GetName( OwnerID() )	
	local MessageString = "[SC_104143_04][$SETVAR1="..PlayerName.."]" 		----在string中可以秀出玩家的名字
	ScriptMessage( Boss , -1 , 2 , MessageString , 1 )				----[$VAR1]，你比我想像中還來得滋養呀，呵呵…
	if 	( CheckID( Boss ) == true) 
	 and ( ReadRoleValue(Boss , EM_RoleValue_IsDead ) == 0 ) then
		CastSpellLv( Boss, Boss , HealBoss , 0 )
		if HPPercent >= 90 then
			WriteRoleValue( Boss , EM_RoleValue_HP , MaxHP)			--90%以上補滿
		else	
			AddRoleValue( Boss , EM_RoleValue_HP , MaxHP*0.1 )		--90%以下補10%
		end
	end	
	--Say(OwnerID() , "Wrong")
end

function lua_sasa_104143_Bossdead()				-----Boss死亡
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_104143_06]" , 1 )				----不…我不允許…我可是佩謝…崇高的叢林之神啊…
	--ScriptMessage( OwnerID() , -1 , 2 , "Test" , 1 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local countplayer = SetSearchAllPlayer(Room)						---找這層的玩家	
	local counter = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )	---讀出計時器GID
	WriteRoleValue( counter , EM_RoleValue_register1 , 1 )				---告訴計時器Boss死了
	--Yell(OwnerID() , "Counter is "..counter , 5)
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register7)
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register8)	
	DelObj( Entrance )
	DelObj( Exit )
	for j=1 , countplayer do
		local tempplayer = GetSearchResult()
		if ReadRoleValue(tempplayer , EM_RoleValue_Voc) ~= 0 				--GM排除
		 or ReadRoleValue(tempplayer , EM_RoleValue_IsDead ) == 0 then 	--死人排除
			Setplot( tempplayer , "dead" , "" , 30)		--死亡劇情清掉						
		end	
	end		
end

--吸血藤結束--(共用)

function lua_sasa_507359_buffover()								--吸血藤結束觸發
	BeginPlot( OwnerID(), "lua_sasa_507359_buffover_2", 15 )										
end

function lua_sasa_507359_buffover_2()
	--say (OwnerID() , "Good")
	Setplot( OwnerID() , "dead" , "" , 30 )		--死亡劇情清掉
end

--門口提示專區--(共用)

function lua_sasa_104317_NearBoss()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Setplot( OwnerID() , "range" , "lua_sasa_104317_cue_1" , 50 )
end

function lua_sasa_104317_cue_1()
	BeginPlot( TargetID() , "lua_sasa_104317_cue_2", 0 )
end

function lua_sasa_104317_cue_2()
	Setplot( OwnerID() , "range" , "" , 50 )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_104143_07]" , 1 )				---你覺得遠方的石壁上，似乎有甚麼正攀附著…
end