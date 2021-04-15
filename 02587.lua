--門口：
--781069--Flag1：Gula
--781069--Flag2：前門
--781069--Flag3：後門
--Gula--EM_RoleValue_register1--控制器
--Gula--EM_RoleValue_register2--吃人
--Gula--EM_RoleValue_register9--Entrance
--Gula--EM_RoleValue_register10--Exit

--count--EM_RoleValue_register3--1--古拉死亡

--※ 控制器 ※--

function sasa_106572_Counter()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local Gula = CreateObjByFlag( 106572 , 781069 , 1 , 1 )
	AddToPartition( Gula , Room )
	BeginPlot( Gula , "sasa_106572_AI" , 0 )
	Setplot( Gula , "dead" , "sasa_106572_Dead" , 30 )
	WriteRoleValue( Gula , EM_RoleValue_register1 , Count )
	
	local Entrance = 0
	local Exit = CreateObjByFlag( 106239 , 781069 , 3 , 1 )	--後門出口
	SetModeEx( Exit , EM_SetModeType_Move , false )			--不移動
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	--不反擊
	SetModeEx( Exit , EM_SetModeType_Fight , false )		--不可砍
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	--不索敵
	SetModeEx( Exit , EM_SetModeType_Mark , false )			--不可點
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	--不show血條
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )		--阻擋
	AddToPartition( Exit , Room )               
	WriteRoleValue( Gula , EM_RoleValue_register10 , Exit )
	
	local EnterFight = 0
	local HPTemp = 0    --記分身次數
	local GuOne = 0
	local GuTwo = 0
	local BerserkCounter = 0	-------狂暴計時
	local IsBerserk = 0			-------狂暴開關
	
	while 1 do
		Sleep(10)
		local BossTarget = ReadRoleValue( Gula , EM_RoleValue_AttackTargetID )
		local MaxHP = ReadRoleValue( Gula , EM_RoleValue_MaxHP )					--總血量
		local NowHP = ReadRoleValue( Gula , EM_RoleValue_HP )						--當前血量
		local HPPercent = ( NowHP / MaxHP )*100										--血量百分比
		
		if ( BossTarget ~= 0 ) and ( CheckID( Gula ) ) == true then
			BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				Cl_ACWB_BossIsDeadFlag(1)	--進入戰鬥
				ScriptMessage( Gula , -1 , 2 , "[SC_106572_01]" , 1 )
				--咕嚕…遠道而來的…讓我嘗嘗你們的味道如何…？
				Entrance = CreateObjByFlag( 106239 , 781069 , 2 , 1 )		--前門入口
				SetModeEx( Entrance , EM_SetModeType_Move , false )			--不移動
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	--不反擊
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		--不可砍
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	--不索敵
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			--不可點
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	--不show血條
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )		--阻擋
				AddToPartition( Entrance , Room )
				WriteRolevalue( Gula , EM_RoleValue_register9 , Entrance )
				EnterFight = 1
			end
--※ 好怒 ※--
			if BerserkCounter >= 480 then								--狂暴
				ScriptMessage( Boss , -1 , 2 , "[SC_106572_06]" , 1 )
				--哦…時間快不夠啦…需要更多的餐點…
				if IsBerserk == 0 then
					AddBuff( Boss , 622092 , 0 , -1 ) 
					--Say(Boss , "Time ="..BerserkCounter)
					IsBerserk = 1
				end	
				BerserkCounter = 0
			end
--※ 影分身 ※--
			if EnterFight == 1 then
				if ReadRoleValue( Count , EM_RoleValue_register3 ) ~= 1 then
					if HPPercent < 80 - (20 * HPTemp) and HPTemp < 5 then
						HPTemp = HPTemp + 1
						AddBuff( Gula , 508243 , 0 , -1 )
						ScriptMessage( Gula , -1 , 2 , "[SC_106572_03]" , 1 )
						--更多，就能品嘗更多…
						Sleep(30)
						GuOne = star_CreateObj_NoAdd( Gula , 106711 , 0 , 0 , 0 , Room , 0 )
						AddToPartition( GuOne , Room )
						--BeginPlot( GuOne , "sasa_106710_GuOne" , 0 )
						--Setplot( GuOne , "dead" , "sasa_106710_GuOneDead" , 30 )
						GuTwo = star_CreateObj_NoAdd( Gula , 106710 , 0 , 0 , 0 , Room , 0 )
						AddToPartition( GuTwo , Room )
						--BeginPlot( GuTwo , "sasa_106711_GuTwo" , 0 )
						--Setplot( GuTwo , "dead" , "sasa_106711_GuTwoDead" , 30 )
					end
				end
			end
		else
--※ 重置死亡 ※--
			if EnterFight == 1 then
				local GulaIsDead = ReadRoleValue( Count , EM_RoleValue_register3 )
				local GetBall = {}
				GetBall = SearchRangeNPC ( Count , 1000 )
				if GulaIsDead ~= 1 then
					ScriptMessage( Gula , -1 , 2 , "[SC_106572_04]" , 1 )
					--啊…可以了…慢慢的享用吧…噎嘿嘿嘿…				
					Cl_ACWB_BossIsDeadFlag(2)	--戰鬥重置
					if CheckID(Gula) == true then
						DelObj(Gula)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end	
					local BallBox = table.getn(GetBall)
					for g = 0 , BallBox do
						if ReadRoleValue( GetBall[g] , EM_RoleValue_OrgID ) == 103436
						 or ReadRoleValue( GetBall[g] , EM_RoleValue_OrgID ) == 106711
						 or ReadRoleValue( GetBall[g] , EM_RoleValue_OrgID ) == 106710 then
							DelObj(GetBall[g])							
						end
					end
					Sleep(30)
					Gula = CreateObjByFlag( 106572 , 781069 , 1 , 1 )
					AddToPartition( Gula , Room )
					BeginPlot( Gula , "sasa_106572_AI" , 0 )
					Setplot( Gula , "dead" , "sasa_106572_Dead" , 30 )
					Sleep(20)
					WriteRoleValue( Gula , EM_RoleValue_register1 , Count )
					WriteRoleValue( Gula , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( Gula , EM_RoleValue_register10 , Exit )
				elseif GulaIsDead == 1 then									---Boss死了不重生
					Cl_ACWB_BossIsDeadFlag(3)	--BOSS死亡
					break
				end
				EnterFight = 0
				HPTemp = 0
				BerserkCounter = 0
				IsBerserk = 0
			end
		end
	end
end

--※ 古拉死了 ※--
function sasa_106572_Dead()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_106572_05]" , 1 )
	--嘔…怎麼會…嗚噁…好餓…好餓啊－－
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local count = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--讀出控制器GID
	WriteRoleValue( count , EM_RoleValue_register3 , 1 )				--告訴計時器Boss死了
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	DelObj( Entrance )
	DelObj( Exit )
end

--※ 古拉AI ※--
function sasa_106572_AI()
	--AddBuff( OwnerID() , 509476 , 0 , -1 )		------不讓Boss離開戰鬥回血的buff
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local BlackCounter = 0					--26S.黑洞
	local BallCounter = 0					--19S.腐臭黏液球
	local RandCounter = 0					--7S.RAND
	local Ball = 498956						--腐臭黏液球
	local nothing = 498961					--空動作
	local Black = 498960					--黑洞
	local BossTarget
	local food = 0
	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			BallCounter = BallCounter + 1
			RandCounter = RandCounter + 1
			BlackCounter = BlackCounter + 1
			
--※ 吃人 ※--	
			if ReadRoleValue( OwnerID() , EM_RoleValue_register2 ) > 0 and food == 0 then		
				food = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
				CastSpellLV( OwnerID() , food , 498962 , 0 )		--施放一個施法時間1秒的衝鋒
				sleep(30)			--視情況調整
				CastSpellLV( OwnerID() , food , 498957 , 0 )		--吃了他
				sleep(30)
				food = 0
				WriteRoleValue( OwnerID() , EM_RoleValue_register2 , 0 )
--※ 黑洞 ※--
			elseif BlackCounter >= 26 then
				BossTarget = OwnerID()
				sleep(1)
				CastSpellLV( OwnerID() , BossTarget , Black , 4 )
				BlackCounter = 0
--※ 臭臭球 ※--
			elseif BallCounter >= 19 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_106572_02]" , 1 )
				--就是你們好了！美味又可口的模樣！
				BossTarget = OwnerID()
				CastSpellLv( OwnerID() , BossTarget , nothing , 0 )					--空動作
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
				--Say( OwnerID() , "ball man = "..table.getn(Lucky01) )
				if table.getn(Lucky01) >= 4 then							------大於4人就rand 4個
					for jj=1 , 4 do						
						local Luckynum = Rand(table.getn(Lucky01))+1						--RAND到的數字	
						if ( Lucky01[Luckynum] ~= nil ) and ( ReadRoleValue( Lucky01[Luckynum] , EM_RoleValue_IsDead ) == 0 ) then
							SysCastSpellLv( OwnerID() , Lucky01[Luckynum] , Ball , 11 )
							local randtemp = rand(8)+8
							--Say( OwnerID() , "randtemp ="..randtemp )
							AddBuff( Lucky01[Luckynum] , 621790 , 0 , randtemp )
							if CheckBuff( Lucky01[Luckynum] , 621789 ) == false then
								AddBuff( Lucky01[Luckynum] , 621789, 0 , -1 )
								local crystalball = star_CreateObj_NoAdd( Lucky01[Luckynum] , 103436 , 0 , 0 , 0 , Room , 0 )
								SetModeEx( crystalball , EM_SetModeType_Move , false )			--不移動
								SetModeEx( crystalball , EM_SetModeType_Strikback , false )		--不反擊
								SetModeEx( crystalball , EM_SetModeType_Searchenemy , false )	--不索敵
								AddToPartition( crystalball , Room )
								AddBuff( crystalball , 508241 , 0 , -1 )						--黏液,法術
								BeginPlot( crystalball , "sasa_106572_eatme" , 0 )
								Setplot( crystalball , "dead" , "sasa_106572_CancelBuff" , 30 )
								WriteRoleValue( crystalball , EM_RoleValue_register1 , Lucky01[Luckynum] )
								WriteRoleValue( crystalball , EM_RoleValue_register2 , OwnerID() )
							end
						end
						table.remove( Lucky01 , Luckynum )
						sleep(1)
						--Say( OwnerID() , "just, "..table.getn(Lucky01) )
					end
				else													-------4人以下就全中
					for kk=1 , table.getn(Lucky01) do
						if ( Lucky01[kk] ~= nil ) and ( ReadRoleValue( Lucky01[kk] , EM_RoleValue_IsDead ) == 0 ) then
							--Say( OwnerID() , "just, "..table.getn(Lucky01) )
							SysCastSpellLv( OwnerID() , Lucky01[kk] , Ball , 11 )
							local randtemp = rand(8)+8
							AddBuff( Lucky01[kk] , 621790 , 0 , randtemp )
							if CheckBuff( Lucky01[kk] , 621789 ) == false then
								AddBuff( Lucky01[kk] , 621789 , 0 , -1 )
								local crystalball = star_CreateObj_NoAdd( Lucky01[kk] , 103436 , 0 , 0 , 0 , Room , 0 )
								SetModeEx( crystalball , EM_SetModeType_Move , false )			--不移動
								SetModeEx( crystalball , EM_SetModeType_Strikback , false )		--不反擊
								SetModeEx( crystalball , EM_SetModeType_Searchenemy , false )	--不索敵
								AddToPartition( crystalball , Room )
								AddBuff( crystalball , 508241 , 0 , -1 )						--黏液,法術
								BeginPlot( crystalball , "sasa_106572_eatme" , 0 )
								Setplot( crystalball , "dead" , "sasa_106572_CancelBuff" , 30 )
								WriteRoleValue( crystalball , EM_RoleValue_register1 , Lucky01[kk] )
								WriteRoleValue( crystalball , EM_RoleValue_register2 , OwnerID() )
							end
						end
						sleep(1)
					end
				end
				BallCounter = 0
--※ RAND囉 ※--
			elseif RandCounter >= 7 then
				sasa_106572_GulaSkill()
				RandCounter = 0
			end
		end
	end
end

--※ RAND 7S. SKILL ※--
function sasa_106572_GulaSkill()
	local Skill = { 498954 , 498955 }			--惡血、濃烈惡種
	local SkillLv = { 17 , 14 }
	--local SkillString = "[SC_106572_03]"
	--更多，就能品嘗更多…
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())					--取出仇恨表內的玩家
	local BossTarget 											--存BOSS要打的目標
	local SkillIndex 											--取TABLE內的位置
		
	if ( Luck >= 0 and Luck < 50 ) then
		SkillIndex = 1
		BossTarget = OwnerID()
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2
		CastSpellLV( OwnerID() , OwnerID() , 496190 , 0 )				--空動作
		for i=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[i]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM排除
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--死人排除
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--找到的玩家放進TABLE
			end
		end
		--Say( OwnerID() , "6p is = "..table.getn(LuckyPlayer) )
		if table.getn(LuckyPlayer) >= 6 then						--大於6人就rand 6個
			for j=1 , 6 do
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND到的數字	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
			end
		else														--6人以下就全中
			for k=1 , table.getn(LuckyPlayer) do
				if ( LuckyPlayer[k] ~= nil ) and ( ReadRoleValue( LuckyPlayer[k] , EM_RoleValue_IsDead ) == 0 ) then
					--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
					SysCastSpellLv( OwnerID() , LuckyPlayer[k] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end	
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
end

--※ 分身 ※--

--※ 吃我 ※--
function sasa_106572_eatme()
	local playerID = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local bossID = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
	while true do  
		sleep(10)
		SysCastSpellLv( OwnerID() , OwnerID() , 498958 , 14 )			----黏液沾染
		if CheckBuff( playerID , 621791 ) == true then
			SetModeEx( OwnerID() , EM_SetModeType_Fight , false )		------不可砍殺						
			SetModeEx( OwnerID() , EM_SetModeType_Mark , false )		------不可點選
			SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , false )	--不show血條
			WriteRoleValue( bossID , EM_RoleValue_register2 , playerID )
		elseif ReadRoleValue( playerID , EM_RoleValue_IsDead ) == 1 then
			delobj( OwnerID() )
		end
	end
end

--※ 清BUFF ※--
function sasa_106572_CancelBuff()												--刪除BUFF用
	local playerID = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	CancelBuff( playerID , 621789 )
	CancelBuff( playerID , 621790 )
end

--[[function lua_sasa_AC_gift01()
	GiveBodyItem( OwnerID() , 726036 , 1 )
end]]--