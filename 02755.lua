--門口：/GM ? Zone 147 0 -539.7 1060.1 -478.4
--781125--Flag1：Anton
--781125--Flag2：前門
--781125--Flag3：後門
--781125--Flag4+5：出兵點

--Anton--EM_RoleValue_register1--Count
--Anton--EM_RoleValue_register2--判斷模式用：後接1或2
--Anton--EM_RoleValue_register3--Ant01：被吃
--Anton--EM_RoleValue_register9--Entrance
--Anton--EM_RoleValue_register10--Exit

--Ant03--EM_RoleValue_register4--Anton
--Ant03--EM_RoleValue_register5--LuckyPlayer[Lucky2]

--count--EM_RoleValue_register3--1--死亡

--※ 控制器 ※--

function sasa_107302_Counter()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local Anton = CreateObjByFlag( 107302 , 781125 , 1 , 1 )
	AddToPartition( Anton , Room )
	BeginPlot( Anton , "sasa_107302_AI" , 0 )
	Setplot( Anton , "dead" , "sasa_107302_Dead" , 30 )
	WriteRoleValue( Anton , EM_RoleValue_register1 , Count )
	
	local Entrance = 0
	local Exit = CreateObjByFlag( 106236 , 781125 , 3 , 1 )	--後門出口
	SetModeEx( Exit , EM_SetModeType_Move , false )			--不移動
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	--不反擊
	SetModeEx( Exit , EM_SetModeType_Fight , false )		--不可砍
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	--不索敵
	SetModeEx( Exit , EM_SetModeType_Mark , false )			--不可點
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	--不show血條
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )		--阻擋
	AddToPartition( Exit , Room )               
	WriteRoleValue( Anton , EM_RoleValue_register10 , Exit )
	
	local EnterFight = 0
	local BerserkCounter = 0	-------狂暴計時
	local IsBerserk = 0			-------狂暴開關
	local Mode = 0
	local Ant1 = {}				--生螞蟻的變數
	local Ant2 = {}				--生螞蟻的變數
	local Ant3 = {}				--搬運蟻
	local WakeCounter = 0		--10S.Wake
	local TakeCounter = 0		--23S.Take
	local Wake = 496406			--喚醒
	local TakePlayer = {}
	local PlayerInHate = {}
	
	while 1 do
		Sleep(10)
		local BossTarget = ReadRoleValue( Anton , EM_RoleValue_AttackTargetID )
		--local MaxHP = ReadRoleValue( Anton , EM_RoleValue_MaxHP )					--總血量
		--local NowHP = ReadRoleValue( Anton , EM_RoleValue_HP )						--當前血量
		--local HPPercent = ( NowHP / MaxHP )*100										--血量百分比
		if ( BossTarget ~= 0 ) and ( CheckID( Anton ) ) == true then
			BerserkCounter = BerserkCounter + 1
			WakeCounter = WakeCounter + 1
			TakeCounter = TakeCounter + 1
			if EnterFight == 0 then											--進入戰鬥
				ScriptMessage( Anton , -1 , 2 , "[SC_106382_01]" , 1 )
				--無知又無用的廢物，指的就是你們？
				Mode = 1
				WriteRoleValue( Anton , EM_RoleValue_register2 , 1 )		--1 = Mode1
				Entrance = CreateObjByFlag( 106236 , 781125 , 2 , 1 )		--前門入口
				SetModeEx( Entrance , EM_SetModeType_Move , false )			--不移動
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	--不反擊
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		--不可砍
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	--不索敵
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			--不可點
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	--不show血條
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )		--阻擋
				AddToPartition( Entrance , Room )
				WriteRolevalue( Anton , EM_RoleValue_register9 , Entrance )
				EnterFight = 1
			end
			if EnterFight == 1 then
--※ 狂爆 ※--
				if BerserkCounter >= 480 then								--8 min.
					ScriptMessage( Anton , -1 , 2 , "[SC_106382_02]" , 1 )
					--我要挑斷你們的筋骨，愚蠢的肉團！
					if IsBerserk == 0 then
						AddBuff( Anton , 508349 , 0 , -1 ) 
						--Say(Anton , "Time ="..BerserkCounter)
						IsBerserk = 1
					end	
					BerserkCounter = 0
				end
--※ 抬走 ※--
				if TakeCounter >= 23 then
					PlayerInHate = star_HateListSort(Anton)						--取出仇恨表內的玩家
					--Say( Anton , "check time =".. TakeCounter )
					for vv = 1 , table.getn(PlayerInHate) do
						local temp = PlayerInHate[vv]
						if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM排除
						 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--死人排除
							TakePlayer[table.getn(TakePlayer)+1] = temp 			--找到的玩家放進TABLE
						end
					end
					if table.getn(TakePlayer) >= 1 then						--大於1人就rand 1個
						for xx = 1 , 1 do
							local Lucky = Rand(table.getn(TakePlayer))+1		--RAND到的數字	
							if ( TakePlayer[Lucky] ~= nil ) and ( ReadRoleValue( TakePlayer[Lucky] , EM_RoleValue_IsDead ) == 0 ) then
								local Ant03 = CreateObjByFlag( 107303 , 781125 , 4 , 1 )
								Ant3[table.getn( Ant3 )+1] = Ant03
								SetModeEx( Ant03 , EM_SetModeType_Strikback , false )		--不反擊
								SetModeEx( Ant03 , EM_SetModeType_Searchenemy , false )		--不索敵
								AddToPartition( Ant03 , Room )
								BeginPlot( Ant03 , "sasa_107303_takeaway" , 0 )
								--Setplot( Ant03 , "collision" , "sasa_106383_takeaway" , 20 )
								Setplot( Ant03 , "dead" , "sasa_107303_Dead" , 30 )
								SetAttack( Ant03 , TakePlayer[Lucky] )
								WriteRoleValue( Ant03 , EM_RoleValue_register4 , Anton )
								WriteRoleValue( Ant03 , EM_RoleValue_Register5 ,  TakePlayer[Lucky] )
								Sleep(10)
							end
							table.remove( TakePlayer , Lucky )
							sleep(1)
							--Say( Anton , "u r"..table.getn(TakePlayer) )
						end
					--[[else														--1人以下就全中
						for yy=1 , table.getn(TakePlayer) do
							if ( TakePlayer[yy] ~= nil ) and ( ReadRoleValue( TakePlayer[yy] , EM_RoleValue_IsDead ) == 0 ) then
								--Say( Anton , "I got "..table.getn(TakePlayer) )
								local Ant03 = CreateObjByFlag( 107303 , 781125 , 4 , 1 )
								Ant3[table.getn( Ant3 )+1] = Ant03
								SetModeEx( Ant03 , EM_SetModeType_Strikback , false )		--不反擊
								SetModeEx( Ant03 , EM_SetModeType_Searchenemy , false )		--不索敵
								AddToPartition( Ant03 , Room )
								BeginPlot( Ant03 , "sasa_107303_takeaway" , 0 )
								--Setplot( Ant03 , "collision" , "sasa_106383_takeaway" , 20 )
								Setplot( Ant03 , "dead" , "sasa_107303_Dead" , 30 )
								SetAttack( Ant03 , TakePlayer[yy] )
								WriteRoleValue( Ant03 , EM_RoleValue_register4 , Anton )
								WriteRoleValue( Ant03 , EM_RoleValue_Register5 ,  TakePlayer[yy] )
								Sleep(10)
							end
						end]]--
					end
					TakeCounter = 0
--※ 喚醒小怪 ※--
				elseif WakeCounter >= 10 then
					BossTarget = Anton
					CastSpellLv( Anton , BossTarget , Wake , 0 )
					Sleep(10)
					--Say( Anton , table.getn( Ant1 ) )	
					if table.getn( Ant1 ) < 2 then
						for d = 1 , 1 do
							local Ant01 = CreateObjByFlag( 107305 , 781125 , 4 , 1 )
							Ant1[table.getn( Ant1 )+1] = Ant01
							AddToPartition( Ant01 , Room )
							BeginPlot( Ant01 , "sasa_107305_Eaten" , 0 )
							--Setplot( Ant01 , "dead" , "sasa_106387_Dead" , 30 )
							WriteRoleValue( Anton , EM_RoleValue_register3 , Ant01 )
							Sleep(10)
							local Ant02 = CreateObjByFlag( 107304 , 781125 , 5 , 1 )
							Ant1[table.getn( Ant1 )+1] = Ant02
							AddToPartition( Ant02 , Room )
							BeginPlot( Ant02 , "sasa_107304_poison" , 0 )
							Sleep(10)
						end
					elseif table.getn( Ant1 ) >= 2 then								--超過4隻螞蟻就檢查螞蟻死了沒，把死掉的從Ant1中移除
						for z=1 , table.getn( Ant1 ) do
							if Ant1[z] ~= nil then
								if CheckID(Ant1[z]) == false or 
								 ReadRoleValue( Ant1[z] , EM_RoleValue_IsDead ) == 1 then
									table.remove( Ant1 , z )
									--Say( Anton , table.getn( Ant1 ) )
									sleep(1)
								end
							end	
						end	
					end	
					WakeCounter = 0
				end
			end
--※ 模式一 ※--
			if Mode == 1 then												----模式=1

			--elseif Mode == 2 then											----模式=2
			end
--※ 重置死亡 ※--
		else
			if EnterFight == 1 then
				local BossIsDead = ReadRoleValue( Count , EM_RoleValue_register3 )
				if BossIsDead ~= 1 then
					ScriptMessage( Anton , -1 , 2 , "[SC_106382_03]" , 1 )
					--滾回去或是…哈哈哈…不！我忘了接著你們將會屍骨無存…
					if CheckID(Anton) == true then
						DelObj(Anton)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end
					for e = 1 , table.getn(Ant1) do
						if CheckID(Ant1[e]) == true and Ant1[e] ~= nil then
							DelObj( Ant1[e] )
						end
					end
					--for f = 1 , table.getn(Ant2) do
						--if CheckID(Ant2[f]) == true and Ant2[f] ~= nil then
							--DelObj( Ant2[f] )
						--end
					--end
					for jj = 1 , table.getn(Ant3) do
						if CheckID(Ant3[jj]) == true and Ant3[jj] ~= nil then
							DelObj( Ant3[jj] )
						end
					end
					--BeginPlot( Count , "sasa_106382_CancelBuff" , 0 )	--清除BUFF
					Sleep(20)
					Anton = CreateObjByFlag( 107302 , 781125 , 1 , 1 )
					AddToPartition( Anton , Room )
					BeginPlot( Anton , "sasa_107302_AI" , 0 )
					Setplot( Anton , "dead" , "sasa_107302_Dead" , 30 )
					Sleep(20)
					WriteRoleValue( Anton , EM_RoleValue_register1 , Count )
					WriteRoleValue( Anton , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( Anton , EM_RoleValue_register10 , Exit )
					Ant1 = {}													--螞蟻重置歸零
					Ant2 = {}
					Ant3 = {}
					TakePlayer = {}
				elseif BossIsDead == 1 then
				--BeginPlot( Count , "sasa_106382_CancelBuff" , 0 )	--清除BUFF
					break
				end
				EnterFight = 0
				BerserkCounter = 0
				IsBerserk = 0
				WakeCounter = 0
				TakeCounter = 0
			end
		end
	end
end

--※ 安東尼死了 ※--
function sasa_107302_Dead()
	SetFlag( OwnerID() , 544801 , 1 )			--死亡不出現啪嘰鼠
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_106382_04]" , 1 )
	--女王，賜與我更多的生…命…！
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local count = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--讀出控制器GID
	WriteRoleValue( count , EM_RoleValue_register3 , 1 )				--告訴計時器Boss死了
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	DelObj( Entrance )
	DelObj( Exit )
end

--※ 安東尼AI ※--
function sasa_107302_AI()
	--AddBuff( OwnerID() , 509476 , 0 , -1 )		------不讓Boss離開戰鬥回血的buff
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local TMode = 0						--判斷模式
	local RandCounter = 0				--7S.RAND
	local WindCounter = 0				--16S.Wind
	local Wind = 496405					--鐮風懸影
	local Swind = 496409				--鐮風
	local BossTarget
	local food = 0						--螞蟻
	local back = 506508					--元素回饋

	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			TMode = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
--※ 模式一 ※--
			if TMode == 1 then
				RandCounter = RandCounter + 1
				WindCounter = WindCounter + 1
--※ 吃吃螞蟻 ※--	
				if ReadRoleValue( OwnerID() , EM_RoleValue_register3 ) > 0 and food == 0 then		
					food = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
					CastSpellLV( OwnerID() , food , Swind , 0 )		--施放一個施法時間1秒的衝鋒
					sleep(30)			--視情況調整
					DelObj( EM_RoleValue_register3 )				--吃了他
					sleep(30)
					AddBuff( OwnerID() , back , 0 , 10 )
					food = 0
					WriteRoleValue( OwnerID() , EM_RoleValue_register3 , 0 )
--※ AE ※--
				elseif WindCounter >= 16 then
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_106382_05]" , 1 )
					--慢慢來，別急！
					BossTarget = OwnerID()
					CastSpellLv( OwnerID() , BossTarget , Wind , 11 )		--鐮風懸影
					Sleep(10)
					WindCounter = 0
--※ RAND ※--
				elseif RandCounter >= 7 then
					sasa_107302_AntonSkill()
					RandCounter = 0
				end
			end
		end
	end
end

--※ RAND 7S. SKILL ※--
function sasa_107302_AntonSkill()
	local Skill = { 496328 , 496404 }			--鐮岩斬殺、弒魂液
	local SkillLv = { 12 , 15 }
	--local SkillString = "[SC_106572_03]"
	--
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
		BossTarget = OwnerID()
		CastSpellLV( OwnerID() , BossTarget , 496519 , 0 )				--空動作
		for a=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[a]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM排除
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--死人排除
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--找到的玩家放進TABLE
			end
		end
		--Say( OwnerID() , "6p is = "..table.getn(LuckyPlayer) )
		if table.getn(LuckyPlayer) >= 3 then						--大於3人就rand 3個
			for b=1 , 3 do
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND到的數字	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
			end
		else														--3人以下就全中
			for c=1 , table.getn(LuckyPlayer) do
				if ( LuckyPlayer[c] ~= nil ) and ( ReadRoleValue( LuckyPlayer[c] , EM_RoleValue_IsDead ) == 0 ) then
					--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
					SysCastSpellLv( OwnerID() , LuckyPlayer[c] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end	
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
end

--※ 毒螞蟻 ※--
function sasa_107304_poison()
	sleep(10)
	local PoisonCount = 0
	local AntTarget
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		sleep(10)	
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--攻擊目標
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			PoisonCount = PoisonCount + 1
			if PoisonCount >= 6 then
				AntTarget = OwnerID()
				if 	( AntTarget ~= nil) 
				 and ( ReadRoleValue( AntTarget , EM_RoleValue_IsDead ) == 0 ) then
					CastSpellLV( OwnerID() , AntTarget , 496407 , 7 )				--腐蝕黏液
					Sleep(10)
				end
				PoisonCount = 0
			end
		end
	end
end

--※ 強強滾螞蟻 ※--
function sasa_107305_Eaten()
	sleep(10)
	local EatenCount = 0
	local AntTarget
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		sleep(10)	
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )	--攻擊目標
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			EatenCount = EatenCount + 1
			if EatenCount >= 10 then
				AntTarget = OwnerID()
				if 	( AntTarget ~= nil) 
				 and ( ReadRoleValue( AntTarget , EM_RoleValue_IsDead ) == 0 ) then
					AddBuff( AntTarget , 506507 , 0 , -1 )							--成長元素
					Sleep(10)
				end
				EatenCount = 0
			end
		end
	end
end

--※ 搬家工螞蟻 ※--
function sasa_107303_takeaway()
	sleep(10)
	local Ant = OwnerID()
	local RoomID = ReadRoleValue( Ant , EM_RoleValue_RoomID )
	local Boss = ReadRoleValue( Ant , EM_RoleValue_register4 )
	local takeplayer =  ReadRoleValue( Ant , EM_RoleValue_register5 )
	local Flag = 781125
	local LuckyPlayer = {}
	local PlayerInHate = {}
	WriteRoleValue( Ant , EM_RoleValue_Livetime, 18 )			--存在秒數
	while 1 do
		sleep(10)
		--Say( OwnerID() , "3p is = "..table.getn(LuckyPlayer) )
		if GetDistance( Ant , takeplayer ) <= 20 then
			if ( takeplayer ~= nil ) and ( ReadRoleValue( takeplayer , EM_RoleValue_IsDead ) == 0 ) then
				sleep(5)
				Addbuff ( Ant , 622091 , 0 , -1 )					--螞蟻搬食
				Addbuff ( takeplayer , 507954 , 14 , 11 )	--萃毒
				PlayMotionex ( Ant , ruFUSION_MIME_CARRY_BEGIN , ruFUSION_MIME_CARRY_LOOP )
				sleep(5)
				local Obj = Role:new( takeplayer ) 
				local BaseX = Obj :X()
				local BaseY = Obj :Y()
				local BaseZ = Obj :Z()
				local BaseDir = Obj:Dir()
				--AttachObj( takeplayer , Ant, 1 , "p_hit_point01" , "p_top" ) 
				SetDefIdleMotion( Ant , ruFUSION_MIME_CARRY_LOOP )
				SetPos( takeplayer , BaseX , BaseY +22 , BaseZ , BaseDir )
				PlayMotion( takeplayer , ruFUSION_MIME_KNOCKDOWN_BEGIN )
				PlayMotion( takeplayer , ruFUSION_MIME_KNOCKDOWN_LOOP )
				--SetDefIdleMotion( takeplayer , ruFUSION_MIME_KNOCKDOWN_LOOP )
				--LuaFunc_MoveToFlag( Ant, Flag , 1 , 10 )
				sleep(100)									--抬起來的時間
				PlayMotion( Ant , ruFUSION_ACTORSTATE_CARRY_END )
				sleep(5)
				CancelBuff( Ant , 622091 )							--螞蟻搬食
				sleep(10)
				PlayMotion( takeplayer , ruFUSION_MIME_KNOCKDOWN_END )
				--SetDefIdleMotion( takeplayer , ruFUSION_MIME_IDLE_STAND )
				SetPos( takeplayer , BaseX , BaseY , BaseZ , BaseDir )
				CancelBuff( takeplayer , 507954 )			--萃毒
				--DetachObj(takeplayer)
				SetDefIdleMotion( Ant , ruFUSION_MIME_IDLE_STAND )
				killID( Ant , takeplayer )
				sleep(1)
				killID( Ant , Ant )
				--SysCastSpellLv( OwnerID() , takeplayer , Skill[SkillIndex] , SkillLv[SkillIndex] )
			end
		end	
		sleep(1)
		--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
	end
end

function sasa_107303_Dead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local GoDie = ReadRoleValue( OwnerID() , EM_RoleValue_register5 )	--讀出玩家
	local Obj = Role:new( OwnerID() ) 
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	if CheckBuff( GoDie , 507954 ) == true then
		SetPos( GoDie , BaseX , BaseY , BaseZ , BaseDir )
		CancelBuff( GoDie , 507954 )			--萃毒
	end
end