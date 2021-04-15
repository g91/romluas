--/GM ? zone 191 0 1590 1 -1219
--EM_RoleValue_register1--控制器
--EM_RoleValue_register2--BOSS
--EM_RoleValue_register3--BOSSII
--EM_RoleValue_register4--BOSSIII
--EM_RoleValue_register5--模式
--EM_RoleValue_register9--Entrance
--EM_RoleValue_register10--Exit
--flag01：BOSS
--flag02：BOSSII
--flag03：BOSSIII
--flag04：Exit
--flag05：Entrance
--SC_104667_

function lua_sasa_WorldBossII_Counter()
	local Mode = 0				-------判斷模式用
	local Mode1Buff = 508112	-------模式1-神賜BUFF
	local BerserkCounter = 0	-------狂暴計時
	local IsBerserk = 0			-------狂暴開關
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = CreateObjByFlag( 104667 , 780829 , 1 , 1 )
	AddToPartition( Boss , Room )
	BeginPlot( Boss , "lua_sasa_WorldBossII_AI" , 0 )
	Setplot( Boss , "dead" , "lua_sasa_WorldBossII_Dead" , 30 )
	WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
	
	local BossII = CreateObjByFlag( 104669 , 780829 , 2 , 1 )
	AddToPartition( BossII , Room )
	BeginPlot( BossII , "lua_sasa_WorldBossII_AI02" , 0 )
	Setplot( BossII , "dead" , "lua_sasa_WorldBossII_dead02" , 30 )
	WriteRoleValue( BossII , EM_RoleValue_register1 , OwnerID() )
	WriteRoleValue( BossII , EM_RoleValue_register2 , Boss )
	
	local BossIII = CreateObjByFlag( 104669 , 780829 , 3 , 1 )
	AddToPartition( BossIII , Room )
	BeginPlot( BossIII , "lua_sasa_WorldBossII_AI03" , 0 )
	Setplot( BossIII , "dead" , "lua_sasa_WorldBossII_dead03" , 30 )
	WriteRoleValue( BossIII , EM_RoleValue_register1 , OwnerID() )
	WriteRoleValue( BossIII , EM_RoleValue_register2 , Boss )

	local Exit = CreateObjByFlag( 104671 , 780829 , 4 , 1 )		-----阻擋門(出口)
	SetModeEx( Exit , EM_SetModeType_Move , false )				------不移動
	SetModeEx( Exit , EM_SetModeType_Strikback , false )		------不反擊
	SetModeEx( Exit , EM_SetModeType_Fight , false )			------不可砍殺
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )		------不索敵
	SetModeEx( Exit , EM_SetModeType_Mark , false )				------不可點選
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )		------不show血條
	SetModeEX( Exit , EM_SetModeType_Obstruct , true )			------阻擋
	AddToPartition( Exit , Room )
	WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )
	
	WriteRoleValue( Boss , EM_RoleValue_register3 , BossII )
	WriteRoleValue( Boss , EM_RoleValue_register4 , BossIII )
	
	local Broken01
	local Broken02
	
	local Entrance = 0
	local EnterFight = 0
	local BossIIDead = 0
	local BossIIIDead = 0
	
	while 1 do
		sleep(10)
		local BossTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID )
		if  ( BossTarget ~= 0 ) and ( CheckID( Boss ) ) == true then
			BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				ScriptMessage( Boss , -1 , 2 , "[SC_104667_01]" , 1 )
				--擅自闖入的狂妄之徒，死亡正好是你們的出口！
				Mode = 1
				WriteRoleValue( Boss , EM_RoleValue_register5 , 1 )			--1=Mode1
				
				Entrance = CreateObjByFlag( 104671 , 780829 , 5 , 1 )		-----阻擋門(入口)
				SetModeEx( Entrance , EM_SetModeType_Move , false )			------不移動
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	------不反擊
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		------不可砍殺
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	------不索敵
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			------不可點選
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	------不show血條
				SetModeEX( Entrance , EM_SetModeType_Obstruct , true )		------阻擋
				AddToPartition( Entrance , Room )
				WriteRoleValue( Boss , EM_RoleValue_register9 , Entrance )
				EnterFight = 1
			end
			if BerserkCounter >= 480 then								--狂暴
				ScriptMessage( Boss , -1 , 2 , "[SC_104667_07]" , 1 )
				--啊！通通都消失吧！你們浪費我太多時間了！
				if IsBerserk == 0 then
					AddBuff( Boss , 508659 , 0 , -1 ) 
					--Say(Boss , "Time ="..BerserkCounter)
					IsBerserk = 1
				end	
				BerserkCounter = 0
			end
			if Mode == 1 then												----模式=1
				AddBuff( Boss , Mode1Buff , 0 , -1 )
				if ReadRoleValue( Boss , EM_RoleValue_register3 ) == 4
				 and BossIIDead == 0 then
					Broken01 = star_CreateObj_NoAdd( BossII , 117231 , 0 , 0 , 0 , Room , 0) 	----死掉生殘體
					SetModeEx( Broken01 , EM_SetModeType_SearchenemyIgnore, true )	---物件不會被搜尋
					SetModeEx( Broken01 , EM_SetModeType_HideMinimap, true )		---物件是否在小地圖上顯示
					SetModeEx( Broken01 , EM_SetModeType_Searchenemy, false )   	--索敵
					SetModeEx( Broken01 , EM_SetModeType_Fight, false ) 			--砍殺
					SetModeEx( Broken01 , EM_SetModeType_Move, false )				--移動
					SetModeEx( Broken01 , EM_SetModeType_ShowRoleHead, true )
					SetModeEx( Broken01 , EM_SetModeType_NotShowHPMP , false )		--不show血條
					SetModeEx( Broken01 , EM_SetModeType_Strikback, false )			--反擊
					SetModeEx( Broken01 , EM_SetModeType_Show, true )				--秀出
					AddToPartition( Broken01 , Room )
					BeginPlot( Broken01 , "lua_sasa_117231_AI" , 0 )
					--Say ( Broken01 , "start stone AI" )
					BossIIDead = 1
				end
				if ReadRoleValue( Boss , EM_RoleValue_register4 ) == 4 
				 and BossIIIDead == 0 then
					Broken02 = star_CreateObj_NoAdd( BossIII , 117231 , 0 , 0 , 0 , Room , 0) 	----死掉生殘體
					SetModeEx( Broken02 , EM_SetModeType_SearchenemyIgnore, true )	---物件不會被搜尋
					SetModeEx( Broken02 , EM_SetModeType_HideMinimap, true )		---物件是否在小地圖上顯示
					SetModeEx( Broken02 , EM_SetModeType_Searchenemy, false )   	--索敵
					SetModeEx( Broken02 , EM_SetModeType_Fight, false ) 			--砍殺
					SetModeEx( Broken02 , EM_SetModeType_Move, false )				--移動
					SetModeEx( Broken02 , EM_SetModeType_ShowRoleHead, true )
					SetModeEx( Broken02 , EM_SetModeType_NotShowHPMP , false )		--不show血條
					SetModeEx( Broken02 , EM_SetModeType_Strikback, false )			--反擊
					SetModeEx( Broken02 , EM_SetModeType_Show, true )				--秀出
					AddToPartition( Broken02 , Room )
					BeginPlot( Broken02 , "lua_sasa_117231_AI" , 0 )
					--Say ( Broken02 , "start stone AI" )
					BossIIIDead = 1
				end
				if ReadRoleValue( Boss , EM_RoleValue_register3 ) == 4
				 and ReadRoleValue( Boss , EM_RoleValue_register4 ) == 4 then
					ScriptMessage( Boss , -1 , 2 , "[SC_104667_02]" , 1 )
					--不自量力！我要你們通通付出代價！！
					CancelBuff( Boss , Mode1Buff )
					Mode = 2
				end
			--elseif Mode == 2 then											----模式=2	
			end
		else
			if EnterFight == 1 then
				local BossIsDead = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
				if BossIsDead ~= 1 then
					if CheckID(Boss) == true then
						DelObj(Boss)
					end
					if Broken01 ~= nil then
						DelObj(Broken01)
					end
					if Broken02 ~= nil then
						DelObj(Broken02)
					end
					if CheckID(BossII) == true then
						DelObj(BossII)
					end
					if CheckID(BossIII) == true then
						DelObj(BossIII)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end	
					sleep(50)
					Boss = CreateObjByFlag( 104667 , 780829 , 1 , 1 )
					AddToPartition( Boss , Room )
					BeginPlot( Boss , "lua_sasa_WorldBossII_AI" , 0 )
					Setplot( Boss , "dead" , "lua_sasa_WorldBossII_Dead" , 30 )
					WriteRoleValue( Boss , EM_RoleValue_register1 , OwnerID() )
					WriteRoleValue( Boss , EM_RoleValue_register10 , Exit )
					
					BossII = CreateObjByFlag( 104669 , 780829 , 2 , 1 )
					AddToPartition( BossII , Room )
					BeginPlot( BossII , "lua_sasa_WorldBossII_AI02" , 0 )
					Setplot( BossII , "dead" , "lua_sasa_WorldBossII_dead02" , 30 )
					WriteRoleValue( BOSSII , EM_RoleValue_register1 , OwnerID() )
					WriteRoleValue( BossII , EM_RoleValue_register2 , Boss )
					
					BossIII = CreateObjByFlag( 104669 , 780829 , 3 , 1 )
					AddToPartition( BossIII , Room )
					BeginPlot( BossIII , "lua_sasa_WorldBossII_AI03" , 0 )
					Setplot( BossIII , "dead" , "lua_sasa_WorldBossII_dead03" , 30 )
					WriteRoleValue( BossIII , EM_RoleValue_register1 , OwnerID() )
					WriteRoleValue( BossIII , EM_RoleValue_register2 , Boss )
					
					WriteRoleValue( Boss , EM_RoleValue_register3 , BossII )
					WriteRoleValue( Boss , EM_RoleValue_register4 , BossIII )
					BossIIDead = 0
					BossIIIDead = 0
				elseif BossIsDead == 1 then										---Boss死了不重生
					if Broken01 ~= nil then
						DelObj(Broken01)
					end
					if Broken02 ~= nil then
						DelObj(Broken02)
					end
					return
				end
				EnterFight = 0
				BerserkCounter = 0
				IsBerserk = 0
			end
		end
	end
end

function lua_sasa_WorldBossII_dead()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_104667_03]" , 1 )
	--呵…沒用的…即使殺了我…你們…也…無法贏過……她…
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )		---讀出控制器GID
	WriteRoleValue( counter , EM_RoleValue_register1 , 1 )					---告訴計時器Boss死了
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )	
	DelObj( Entrance )
	DelObj( Exit )
end

function lua_sasa_WorldBossII_dead02()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )		---讀出Boss GID
	WriteRoleValue( Boss , EM_RoleValue_register3 , 4 )						---告訴Boss BossII死了
end

function lua_sasa_WorldBossII_dead03()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )		---讀出Boss GID
	WriteRoleValue( Boss , EM_RoleValue_register4 , 4 )						---告訴Boss BossIII死了
end

function lua_sasa_WorldBossII_AI()
	while 1 do
		sleep(10)
		local RandCounter = 0					--7S.RAND 2 招
		local ClawCounter = 0					--16S.舞刃爪
		local WindCounter = 0					--26S.風刃逆襲
		local Skill = { 496524 , 496525 }		--舞刃爪 , 風刃逆襲
		local SkillLv = { 24 , 11 }
		local SkillString = { "[SC_104667_04]" , "[SC_104667_05]" }
		--無能的弱者，你們也不過如此而已！
		--風啊…讓這些愚民知道，反抗我會有什麼樣的下場！
		local SkillIndex 						--取TABLE內的位置
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local EnterFight = 0
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				
				WindCounter = WindCounter + 1
				ClawCounter = ClawCounter + 1
				RandCounter = RandCounter + 1
				
				if WindCounter >= 26 then
					SkillIndex = 2
					BossTarget = OwnerID()
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					sleep(1)
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					sleep(40)
					WindCounter = 0
				elseif ClawCounter >= 16 then
					SkillIndex = 1
					BossTarget = OwnerID()
					ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
					CastSpellLV( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
					sleep(10)
					ClawCounter = 0
				elseif RandCounter >= 7 then
					Lua_sasa_WorldIISkill()
					RandCounter = 0
				end
			end
		end
	end
end

function lua_sasa_WorldBossII_AI02()
	while 1 do
		sleep(10)
		local Cross01Counter = 0				--十字斷劍+夢迴
		local Cross01 = 496844					--9S.十字斷劍+夢迴
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local EnterFight = 0
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				Cross01Counter = Cross01Counter + 1
				
				if Cross01Counter >= 9 then
					local Lucky01 = {}
					local PlayerInHate1 = {}
					PlayerInHate1 = star_HateListSort(OwnerID())						----取出仇恨表內的玩家
					for ii=1 , table.getn(PlayerInHate1) do
						local temp01 = PlayerInHate1[ii]			 
						if ReadRoleValue(temp01 , EM_RoleValue_Voc) ~= 0 				--GM排除
						 and ReadRoleValue(temp01 , EM_RoleValue_IsDead ) == 0 then 	--死人排除
							Lucky01[table.getn(Lucky01)+1] = temp01 			--找到的玩家放進TABLE
						end
					end
					--Say( OwnerID() , "I got u, "..table.getn(Lucky01) )
					if table.getn(Lucky01) >= 4 then							------大於4人就rand 4個
						for jj=1 , 4 do						
							local Luckynum = Rand(table.getn(Lucky01))+1						--RAND到的數字	
							if ( Lucky01[Luckynum] ~= nil ) and ( ReadRoleValue( Lucky01[Luckynum] , EM_RoleValue_IsDead ) == 0 ) then
								SysCastSpellLv( OwnerID() , Lucky01[Luckynum] , Cross01 , 9 )
							end
							table.remove( Lucky01 , Luckynum )
							sleep(1)
							--Say( OwnerID() , "just, "..table.getn(Lucky01) )
						end
					else													-------4人以下就全中
						for kk=1 , table.getn(Lucky01) do
							if ( Lucky01[kk] ~= nil ) and ( ReadRoleValue( Lucky01[kk] , EM_RoleValue_IsDead ) == 0 ) then
								--Say( OwnerID() , "just, "..table.getn(Lucky01) )
								SysCastSpellLv( OwnerID() , Lucky01[kk] , Cross01 , 9 )
							end
							sleep(1)
						end
					end
					Cross01Counter = 0
				end
			end
		end
	end
end

function lua_sasa_WorldBossII_AI03()
	while 1 do
		sleep(10)
		local Cross02Counter = 0				--十字斷魂+魄散
		local Cross02 = 496676					--13S.十字斷魂+魄散
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local EnterFight = 0
		while 1 do
			sleep(10)
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
			if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
				Cross02Counter = Cross02Counter + 1
				
				if Cross02Counter >= 13 then
					local Lucky02 = {}
					local PlayerInHate2 = {}
					PlayerInHate2 = star_HateListSort(OwnerID())						----取出仇恨表內的玩家
					for ll=1 , table.getn(PlayerInHate2) do
						local temp02 = PlayerInHate2[ll]			 
						if ReadRoleValue(temp02 , EM_RoleValue_Voc) ~= 0 				--GM排除
						 and ReadRoleValue(temp02 , EM_RoleValue_IsDead ) == 0 then 	--死人排除
							Lucky02[table.getn(Lucky02)+1] = temp02 			--找到的玩家放進TABLE
						end
					end
					--Say( OwnerID() , "run baby, "..table.getn(Lucky02) )
					if table.getn(Lucky02) >= 4 then							------大於4人就rand 4個
						for mm=1 , 4 do						
							local Luckynum02 = Rand(table.getn(Lucky02))+1						--RAND到的數字	
							if ( Lucky02[Luckynum02] ~= nil ) and ( ReadRoleValue( Lucky02[Luckynum02] , EM_RoleValue_IsDead ) == 0 ) then
								SysCastSpellLv( OwnerID() , Lucky02[Luckynum02] , Cross02 , 19 )
							end
							table.remove( Lucky02 , Luckynum02 )
							sleep(1)
							--Say( OwnerID() , "run, "..table.getn(Lucky02) )
						end
					else													-------4人以下就全中
						for nn=1 , table.getn(Lucky02) do
							if ( Lucky02[nn] ~= nil ) and ( ReadRoleValue( Lucky02[nn] , EM_RoleValue_IsDead ) == 0 ) then
								--Say( OwnerID() , "run, "..table.getn(Lucky02) )
								SysCastSpellLv( OwnerID() , Lucky02[nn] , Cross02 , 19 )
							end
							sleep(1)
						end
					end
					Cross02Counter = 0
				end
			end
		end
	end
end

function lua_sasa_117231_AI()
	local LightCounter = 0				--未盡
	local Light = 508524				--未盡
	local StoneSkill = 496675			--殘留的餘威
	while 1 do
		sleep(10)		
		LightCounter = LightCounter +1
		--Say ( OwnerID() , "outside touch AI" )
		if LightCounter == 10 then
			AddBuff( OwnerID() , Light , 0 , -1 )
			Setplot( OwnerID() , "touch" , "sasa_touch_Broken01" , 30 )
			--Say ( OwnerID() , "Set touch AI" )
		elseif LightCounter >= 15 then
			if CheckBuff( OwnerID() , 508487 ) == false then
				CancelBuff( OwnerID() , Light )
				SysCastSpellLv( OwnerID() , OwnerID() , StoneSkill , 9 )
			end
			LightCounter = 0
			Setplot( OwnerID() , "touch" , "" , 30 )
		end
	end
end

function Lua_sasa_WorldIISkill()		-----Boss RAND 
	local Skill = { 496522 , 496523 }		-----十字斷劍(第一仇恨) 	--白斬風
	local SkillLv = { 49 , 16 }
	--local SkillString = { "[]" , "[]" }
	local Luck = Rand(100)													----取亂數放技能
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())						----取出仇恨表內的玩家
	local BossTarget 														----存BOSS要打的目標
	local SkillIndex 														----取TABLE內的位置

	if (Luck >= 0 and Luck < 50) then
		SkillIndex = 1
		BossTarget = PlayerInHate[1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif (Luck >= 50 and Luck < 100) then
		SkillIndex = 2
		for i=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[i]			 
			if ReadRoleValue(temp , EM_RoleValue_Voc) ~= 0 				--GM排除
			 and ReadRoleValue(temp , EM_RoleValue_IsDead ) == 0 then 	--死人排除
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--找到的玩家放進TABLE
			end
		end
		--Say( OwnerID() , "Before ="..table.getn(LuckyPlayer) )
		if table.getn(LuckyPlayer) >= 4 then							------大於4人就rand 4個
			for j=1 , 4 do						
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1						--RAND到的數字	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say( OwnerID() , "After ="..table.getn(LuckyPlayer) )
			end
		else													-------4人以下就全中
			for k=1 , table.getn(LuckyPlayer) do
				if ( LuckyPlayer[k] ~= nil ) and ( ReadRoleValue( LuckyPlayer[k] , EM_RoleValue_IsDead ) == 0 ) then
					--Say( OwnerID() , "all ="..table.getn(LuckyPlayer) )
					SysCastSpellLv( OwnerID() , LuckyPlayer[k] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )		--喊話(誰講,-1=全區玩家,2=黃色警告(不會被洗掉)
	--Yell( OwnerID() , SkillString[SkillIndex] , 5 ),另一種喊話,可以設範圍
end

function sasa_touch_Broken01()
	local StoneBuff = 508113		--噬魂亂舞
	local Check = 508487
	local Light = 508524			--未盡
	
	if CheckBuff( OwnerID() , StoneBuff ) == false then
		BeginPlot( TargetID() , "sasa_touch_Broken02" , 0 )
		AddBuff( TargetID() , Check , 0 , 6 )
		AddBuff( OwnerID() , StoneBuff , 0 , 40 )
		CancelBuff( TargetID() , Light )
		--Say ( OwnerID() , "touch ok" )
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_104667_06]" , "0xFFF00000" )
		--能量干擾無效！
	end	
end

function sasa_touch_Broken02()
	Setplot( OwnerID() , "touch" , "" , 0 )	
end

--function sasa_Broken03()
	--local Stone2Buff = 505797
	--local Check2 = 
	--BeginPlot( TargetID() , "sasa_Broken04" , 0 )
	--AddBuff( TargetID() , Check2 , 0 , 5 )
	--AddBuff( OwnerID() , Stone2Buff , 0 , -1 )
--end

--function sasa_Broken04()
	--Setplot( OwnerID() , "touch" , "" , 0 )	
--end