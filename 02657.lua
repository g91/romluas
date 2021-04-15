--門口：
--781129--Flag1：Horson
--781129--Flag2：前門
--781129--Flag3：後門
--781129--Flag4~23：出胞點

--Horson--EM_RoleValue_register1--Count
--Horson--EM_RoleValue_register2--判斷模式用：後接1或2
--Horson--EM_RoleValue_register9--Entrance
--Horson--EM_RoleValue_register10--Exit

--count--EM_RoleValue_register3--1--死亡
--count--EM_RoleValue_register7--1--BOSS死了，膿包停

--※ 控制器 ※--
function sasa_106853_Counter()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( Count , EM_RoleValue_ZoneID )
	local Horson
	if ZoneID == 151 then		--普通
		Horson = CreateObjByFlag( 106853 , 781129 , 1 , 1 )
	elseif ZoneID == 152 then	--困難
		Horson = CreateObjByFlag( 107581 , 781129 , 1 , 1 )
	elseif ZoneID == 153 then	--簡易
		Horson = CreateObjByFlag( 107583 , 781129 , 1 , 1 )
	elseif ZoneID == 940 then	--測試區
		Horson = CreateObjByFlag( 106853 , 781129 , 1 , 1 )
	end
	AddToPartition( Horson , Room )
	BeginPlot( Horson , "sasa_106853_AI" , 0 )
	Setplot( Horson , "dead" , "sasa_106853_Dead" , 30 )
	WriteRoleValue( Horson , EM_RoleValue_register1 , Count )
	local alive
	local EnterFight = 0
	local BerserkCounter = 0			--狂暴計時
	local IsBerserk = 0					--狂暴開關
	local Mode = 0
	local BallCounter = 0				--膿包計時
	local TheFlag = 781129				--膿包旗
	local Entrance = 0
	local Exit = CreateObjByFlag( 106239 , 781129 , 3 , 1 )	--後門出口
	SetModeEx( Exit , EM_SetModeType_Move , false )			--不移動
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	--不反擊
	SetModeEx( Exit , EM_SetModeType_Fight , false )		--不可砍
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	--不索敵
	SetModeEx( Exit , EM_SetModeType_Mark , false )			--不可點
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , true )	--不show血條
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )		--阻擋
	AddToPartition( Exit , Room )               
	WriteRoleValue( Horson , EM_RoleValue_register10 , Exit )

	while 1 do
		Sleep(10)
		alive = ReadRoleValue( Count , EM_RoleValue_register7 )
		BallCounter = BallCounter + 1
--※ 膿包帝國 ※--
		local BombIn = { 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 , 20 , 21 , 22 , 23 }
		if alive ~= 1 then				--控制BOSS死亡不生膿包
			if BallCounter >= 15 then
				for zz = 1 , 15 do
					local TheNum = Rand(table.getn(BombIn))+1
					local ball01 = CreateObjByFlag( 106855 , TheFlag , BombIn[TheNum] , 1 )		--生怪
					BeginPlot( ball01 , "sasa_106855_killID" , 0 )
					Setplot( ball01 , "collision" , "sasa_106855_Bomb" , 50 )
					SetModeEx( ball01 , EM_SetModeType_Move , false )			--不移動
					SetModeEx( ball01 , EM_SetModeType_Strikback , false )		--不反擊
					SetModeEx( ball01 , EM_SetModeType_Fight , false )			--不可砍
					SetModeEx( ball01 , EM_SetModeType_Searchenemy , false )	--不索敵
					SetModeEx( ball01 , EM_SetModeType_Mark , false )			--不可點
					SetModeEx( ball01 , EM_SetModeType_NotShowHPMP , true )		--不show血條
					AddToPartition( ball01 , Room )
					table.remove( BombIn , TheNum )
					Sleep(1)		--避免DELAY
				end
				BallCounter = 0
			end
		end
		local BossTarget = ReadRoleValue( Horson , EM_RoleValue_AttackTargetID )
		local MaxHP = ReadRoleValue( Horson , EM_RoleValue_MaxHP )					--總血量
		local NowHP = ReadRoleValue( Horson , EM_RoleValue_HP )						--當前血量
		local HPPercent = ( NowHP / MaxHP )*100										--血量百分比	
		if ( BossTarget ~= 0 ) and ( CheckID( Horson ) ) == true then
			BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				ScriptMessage( Horson , -1 , 2 , "[SC_106853_01]" , 1 )
				--你們這些螻蟻，滾回去！
				Mode = 1
				WriteRoleValue( Horson , EM_RoleValue_register2 , 1 )		--1 = Mode1
				Entrance = CreateObjByFlag( 106239 , 781129 , 2 , 1 )		--前門入口
				SetModeEx( Entrance , EM_SetModeType_Move , false )			--不移動
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	--不反擊
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		--不可砍
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	--不索敵
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			--不可點
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , true )	--不show血條
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )		--阻擋
				AddToPartition( Entrance , Room )
				WriteRolevalue( Horson , EM_RoleValue_register9 , Entrance )
--※ 集體傳傳樂 ※--
				local PPL = SetSearchAllPlayer( Room )
				local Num = 6		--第6號旗子
				local Num_flag = 781129
				for j = 1 , PPL do
					local ID = GetSearchResult()
					if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1
					 and ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0
					 and ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
						SetPosByFlag( ID , Num_flag , Num )		--抓玩家到同一個點
						Num = Num + 1
						if Num > GetMoveFlagCount(Num_flag) -1 then
							Num = 6
						end
						sysCastSpelllv ( ID , Horson , 496773 , 0 )		--玩家做仇恨
					end
				end
				EnterFight = 1
			end
--※ 狂爆 ※--
			if BerserkCounter >= 480 then								--8 min.
				if ZoneID == 151 or ZoneID == 152 or ZoneID == 940 then
					ScriptMessage( Horson , -1 , 2 , "[SC_106853_04]" , 1 )
					--吼喔喔…感覺變得更孔武有力…
					if IsBerserk == 0 then
						AddBuff( Horson , 623851 , 0 , -1 ) 
						--Say( Horson , "Time ="..BerserkCounter )
						IsBerserk = 1
					end
				end
				BerserkCounter = 0
			end
--※ 模式一 ※--
			if Mode == 1 then												----模式=1
				if HPPercent <= 60 and ReadRoleValue( Count , EM_RoleValue_register3 ) ~= 1 then
					Mode = 2
					WriteRoleValue( Horson , EM_RoleValue_register2 , 2 )	--2=Mode2
					sleep(10)				
				end
			elseif Mode == 2 then											----模式=2
			end
		else
--※ 重置死亡 ※--
			if EnterFight == 1 then
				local BossIsDead = ReadRoleValue( Count , EM_RoleValue_register3 )
				local GetBall = {}
				GetBall = SearchRangeNPC ( Count , 1000 )
				Sleep(10)
				if BossIsDead ~= 1 then
					ScriptMessage( Horson , -1 , 2 , "[SC_106853_02]" , 1 )
					--咕魯…差不多了，這場沒有意義的戰鬥…
					if CheckID(Horson) == true then
						DelObj(Horson)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end
					local BallBox = table.getn(GetBall)
					for i = 0 , BallBox do
						if ReadRoleValue( GetBall[i] , EM_RoleValue_OrgID ) == 106855
						 or ReadRoleValue( GetBall[i] , EM_RoleValue_OrgID ) == 106856
						 or ReadRoleValue( GetBall[i] , EM_RoleValue_OrgID ) == 106857
						 or ReadRoleValue( GetBall[i] , EM_RoleValue_OrgID ) == 107582
						 or ReadRoleValue( GetBall[i] , EM_RoleValue_OrgID ) == 107584 then
							DelObj(GetBall[i])							
						end
					end
					--BeginPlot( Count , "sasa_106853_CancelBuff" , 0 )	--清除BUFF
					Sleep(20)
					if ZoneID == 151 then		--普通
						Horson = CreateObjByFlag( 106853 , 781129 , 1 , 1 )
					elseif ZoneID == 152 then	--困難
						Horson = CreateObjByFlag( 107581 , 781129 , 1 , 1 )
					elseif ZoneID == 153 then	--簡易
						Horson = CreateObjByFlag( 107583 , 781129 , 1 , 1 )
					elseif ZoneID == 940 then	--測試區
						Horson = CreateObjByFlag( 106853 , 781129 , 1 , 1 )
					end
					AddToPartition( Horson , Room )
					BeginPlot( Horson , "sasa_106853_AI" , 0 )
					Setplot( Horson , "dead" , "sasa_106853_Dead" , 30 )
					Sleep(20)
					WriteRoleValue( Horson , EM_RoleValue_register1 , Count )
					WriteRoleValue( Horson , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( Horson , EM_RoleValue_register10 , Exit )
				elseif BossIsDead == 1 then
				--BeginPlot( Count , "sasa_106853_CancelBuff" , 0 )	--清除BUFF
					break
				end
				EnterFight = 0
				BerserkCounter = 0
				IsBerserk = 0
				BallCounter = 0
			end
		end
	end
end

--※ 膿包爆了 ※--
function sasa_106853_Dead()
	SetFlag( OwnerID() , 544801 , 1 )			--死亡不出現啪嘰鼠
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_106853_03]" , 1 )
	--不…可能…不能繼續…戰鬥…
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local count = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--讀781129制器GID
	WriteRoleValue( count , EM_RoleValue_register3 , 1 )				--告訴計時器Boss死了
	WriteRoleValue( count , EM_RoleValue_register7 , 1 )				--Boss死了，膿包可以停了
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	DelObj( Entrance )
	DelObj( Exit )
end

--※ 膿包AI ※--
function sasa_106853_AI()
	--AddBuff( OwnerID() , 509476 , 0 , -1 )		------不讓Boss離開戰鬥回血的buff
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local TMode = 0						--判斷模式
	local RandCounter = 0				--6S.RAND
	local AECounter = 0					--20S.AE
	local BuffCounter = 0				--5S.代謝
	local Buff = 850225					--代謝膿包
	local AE = 850219					--巨響衝擊波
	local BossTarget
	local bombFlag = 781129				--膿包生影子旗
	AddBuff( OwnerID() , 620427 , 0 , -1 )	--膿包代謝1
	AddBuff( OwnerID() , 620426 , 0 , -1 )	--膿包代謝2
	AddBuff( OwnerID() , 620425 , 0 , -1 )	--膿包代謝3
	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			TMode = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
--※ 全模式 ※--
			RandCounter = RandCounter + 1
			AECounter = AECounter + 1
			BuffCounter = BuffCounter + 1
--※ 巨響 ※--
			if AECounter >= 19 then
				--ScriptMessage( OwnerID() , -1 , 2 , "[SC_106382_05]" , 1 )
				--
				BossTarget = OwnerID()
				if ZoneID == 151 then		--普通
					CastSpellLv( OwnerID() , BossTarget , AE , 19 )--40
				elseif ZoneID == 152 then	--困難
					CastSpellLv( OwnerID() , BossTarget , AE , 29 )--60
				elseif ZoneID == 153 then	--簡易
					CastSpellLv( OwnerID() , BossTarget , AE , 14 )--30
				elseif ZoneID == 940 then	--測試
					CastSpellLv( OwnerID() , BossTarget , AE , 0 )
				end
				Sleep(10)
				AECounter = 0
				local allball = {}
				allball = SearchRangeNPC ( OwnerID() , 1000 )
				local ballBox = table.getn(allball)
				for x = 1 , ballBox do
					if ReadRoleValue( allball[x] , EM_RoleValue_OrgID ) == 106855 then
						--Say( OwnerID() , "GO~~~" )
						local Skillball
						Skillball = star_CreateObj_NoAdd( allball[x] , 106388 , 0 , 0 , 0 , Room , 0 ) 	--炸膿包技能
						SetModeEx( Skillball , EM_SetModeType_SearchenemyIgnore, true )	---物件不會被搜尋
						SetModeEx( Skillball , EM_SetModeType_HideMinimap, true )		---物件是否在小地圖上顯示
						SetModeEx( Skillball , EM_SetModeType_Searchenemy, false )   	--索敵
						SetModeEx( Skillball , EM_SetModeType_Fight, false ) 			--砍殺
						SetModeEx( Skillball , EM_SetModeType_Move, false )				--移動
						SetModeEx( Skillball , EM_SetModeType_ShowRoleHead, true )
						SetModeEx( Skillball , EM_SetModeType_NotShowHPMP , true )		--不show血條
						SetModeEx( Skillball , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
						SetModeEx( Skillball , EM_SetModeType_Strikback, false )		--反擊
						SetModeEx( Skillball , EM_SetModeType_Show, true )				--秀出
						AddToPartition( Skillball , Room )
						WriteRoleValue( Skillball , EM_RoleValue_Livetime , 5 )			--存在秒數
						if ZoneID == 151 then		--普通
							CastSpellLV( Skillball , Skillball , 850222 , 7 )--6000			--膿包炸裂(小)
						elseif ZoneID == 152 then	--困難
							CastSpellLV( Skillball , Skillball , 850222 , 14 )--11250
						elseif ZoneID == 153 then	--簡易
							CastSpellLV( Skillball , Skillball , 850222 , 4 )--3750
						elseif ZoneID == 940 then	--測試
							CastSpellLV( Skillball , Skillball , 850222 , 0 )
						end
						--say( Skillball , "here" )
						sleep(1)
						delobj ( allball[x] )
					elseif ReadRoleValue( allball[x] , EM_RoleValue_OrgID ) == 106856 then
						local Skillball2
						Skillball2 = star_CreateObj_NoAdd( allball[x] , 106389 , 0 , 0 , 0 , Room , 0 ) 	--炸膿包技能
						SetModeEx( Skillball2 , EM_SetModeType_SearchenemyIgnore, true )---物件不會被搜尋
						SetModeEx( Skillball2 , EM_SetModeType_HideMinimap, true )		---物件是否在小地圖上顯示
						SetModeEx( Skillball2 , EM_SetModeType_Searchenemy, false )   	--索敵
						SetModeEx( Skillball2 , EM_SetModeType_Fight, false ) 			--砍殺
						SetModeEx( Skillball2 , EM_SetModeType_Move, false )			--移動
						SetModeEx( Skillball2 , EM_SetModeType_ShowRoleHead, true )
						SetModeEx( Skillball2 , EM_SetModeType_NotShowHPMP , true )	--不show血條
						SetModeEx( Skillball2 , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
						SetModeEx( Skillball2 , EM_SetModeType_Strikback, false )		--反擊
						SetModeEx( Skillball2 , EM_SetModeType_Show, true )				--秀出
						AddToPartition( Skillball2 , Room )
						WriteRoleValue( Skillball2 , EM_RoleValue_Livetime , 5 )		--存在秒數
						if ZoneID == 151 then		--普通
							CastSpellLV( Skillball2 , Skillball2 , 850223 , 9 )--7500			--膿包炸裂(大)
						elseif ZoneID == 152 then	--困難
							CastSpellLV( Skillball2 , Skillball2 , 850223 , 19 )--15000
						elseif ZoneID == 153 then	--簡易
							CastSpellLV( Skillball2 , Skillball2 , 850223 , 6 )--5250
						elseif ZoneID == 940 then	--測試
							CastSpellLV( Skillball2 , Skillball2 , 850223 , 0 )
						end
						sleep(1)
						delobj ( allball[x] )						
					end
				end
--※ 模式二 ※--
				if TMode == 2 then
					Sleep(20)
					local flagIn = { 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 , 20 , 21 , 22 , 23 }
					local BombNum = Rand(20)+4
					table.remove( flagIn , BombNum )
					local BombNum1 = Rand(table.getn( flagIn ) ) + 1
					local BombNum2 = Rand(table.getn( flagIn ) ) + 1
					local Big01
					local Big02
					if ZoneID == 151 then		--普通
						Big01 = CreateObjByFlag( 106857 , bombFlag , flagIn[BombNum1] , 1 )		--生怪
						AddToPartition( Big01 , Room )
						BeginPlot( Big01 , "sasa_106857_AI" , 0 )
					elseif ZoneID == 152 then	--困難
						Big01 = CreateObjByFlag( 107582 , bombFlag , flagIn[BombNum1] , 1 )
						AddToPartition( Big01 , Room )
						BeginPlot( Big01 , "sasa_106857_AI" , 0 )
						Big02 = CreateObjByFlag( 107582 , bombFlag , flagIn[BombNum2] , 1 )
						AddToPartition( Big02 , Room )
						BeginPlot( Big02 , "sasa_106857_AI" , 0 )
					elseif ZoneID == 153 then	--簡易
						Big01 = CreateObjByFlag( 107584 , bombFlag , flagIn[BombNum1] , 1 )
						AddToPartition( Big01 , Room )
						BeginPlot( Big01 , "sasa_106857_AI" , 0 )
					elseif ZoneID == 940 then	--測試
						Big01 = CreateObjByFlag( 106857 , bombFlag , flagIn[BombNum1] , 1 )
						AddToPartition( Big01 , Room )
						BeginPlot( Big01 , "sasa_106857_AI" , 0 )
						Big02 = CreateObjByFlag( 106857 , bombFlag , flagIn[BombNum2] , 1 )
						AddToPartition( Big02 , Room )
						BeginPlot( Big02 , "sasa_106857_AI" , 0 )
					end
					BossTarget = OwnerID()
					Sleep(20)
					CastSpellLv( OwnerID() , BossTarget , 850224 , 0 )				--膿液強化
					Sleep(30)
					CastSpellLv( OwnerID() , BossTarget , 850220 , 0 )				--強化過度
				end
--※ RAND ※--
			elseif RandCounter >= 6 then
				sasa_106853_HorsonSkill()
				RandCounter = 0
--※ 膿包代謝 ※--
			elseif BuffCounter >= 5 then
				BossTarget = OwnerID()
				CastSpellLv( OwnerID() , BossTarget , Buff , 0 )
				CancelBuff( OwnerID() , 620427 )	--膿包代謝1
				CancelBuff( OwnerID() , 620426 )	--膿包代謝2
				CancelBuff( OwnerID() , 620425 )	--膿包代謝3
				local Bigball
				Bigball = star_CreateObj_NoAdd( OwnerID() , 106856 , 0 , 0 , 0 , Room , 0 ) 	--炸膿包技能
				Setplot( Bigball , "collision" , "sasa_106856_Bomb" , 50 )
				SetModeEx( Bigball , EM_SetModeType_Move , false )			--不移動
				SetModeEx( Bigball , EM_SetModeType_Strikback , false )		--不反擊
				SetModeEx( Bigball , EM_SetModeType_Fight , false )			--不可砍
				SetModeEx( Bigball , EM_SetModeType_Searchenemy , false )	--不索敵
				SetModeEx( Bigball , EM_SetModeType_Mark , false )			--不可點
				SetModeEx( Bigball , EM_SetModeType_NotShowHPMP , true )	--不show血條
				AddToPartition( Bigball , Room )
				Sleep(30)						--膿包長回去
				AddBuff( OwnerID() , 620427 , 0 , -1 )	--膿包代謝1
				AddBuff( OwnerID() , 620426 , 0 , -1 )	--膿包代謝2
				AddBuff( OwnerID() , 620425 , 0 , -1 )	--膿包代謝3
				BuffCounter = 0
			end
		end
	end
end

--※ RAND 7S. SKILL ※--
function sasa_106853_HorsonSkill()
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local Skill = { 850216 , 850217 }			--大慟擊、噴射膿液球
	local SkillLv = {}
	if ZoneID == 151 then		--普通
		SkillLv = { 9 , 9 }--25000,22500
	elseif ZoneID == 152 then	--困難
		SkillLv = { 39 , 39 }--100000,90000
	elseif ZoneID == 153 then	--簡易
		SkillLv = { 4 , 2 }--12500,6750
	elseif ZoneID == 940 then	--測試
		SkillLv = { 0 , 0 }
	end
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
		BossTarget = PlayerInHate[1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif ( Luck >= 50 and Luck < 100 ) then
		SkillIndex = 2
		BossTarget = OwnerID()
		CastSpellLV( OwnerID() , BossTarget , 850218 , 0 )				--空動作
		for a=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[a]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM排除
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--死人排除
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--找到的玩家放進TABLE
			end
		end
		--Say( OwnerID() , "6p is = "..table.getn(LuckyPlayer) )
		if ZoneID == 151 or ZoneID == 153 or ZoneID == 940 then		--普通+簡易+測試
			if table.getn(LuckyPlayer) >= 2 then						--大於2人就rand 2個
				for b=1 , 2 do
					local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND到的數字	
					if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
						SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					table.remove( LuckyPlayer , Lucky2 )
					sleep(1)
					--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
				end
			else														--2人以下就全中
				for c=1 , table.getn(LuckyPlayer) do
					if ( LuckyPlayer[c] ~= nil ) and ( ReadRoleValue( LuckyPlayer[c] , EM_RoleValue_IsDead ) == 0 ) then
						--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
						SysCastSpellLv( OwnerID() , LuckyPlayer[c] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					sleep(1)
				end
			end
		elseif ZoneID == 152 then	--困難
			if table.getn(LuckyPlayer) >= 4 then						--大於4人就rand 4個
				for b=1 , 4 do
					local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND到的數字	
					if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
						SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					table.remove( LuckyPlayer , Lucky2 )
					sleep(1)
					--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
				end
			else														--4人以下就全中
				for c=1 , table.getn(LuckyPlayer) do
					if ( LuckyPlayer[c] ~= nil ) and ( ReadRoleValue( LuckyPlayer[c] , EM_RoleValue_IsDead ) == 0 ) then
						--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
						SysCastSpellLv( OwnerID() , LuckyPlayer[c] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					sleep(1)
				end
			end
		end
	end	
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
end

--※ 膿包15秒換 ※--
function sasa_106855_killID()
	local counter = 0
	while 1 do
		sleep(10)
		counter = counter + 1
		if counter == 14 then
			--Say( OwnerID() , "kill" )
			delobj ( OwnerID() )
			--killID( OwnerID() , OwnerID() )
		end
	end
end

--※ 炸小龍包 ※--
function sasa_106855_Bomb()
	--say( OwnerID() , "YOOO" )
	local Room = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( TargetID() , EM_RoleValue_ZoneID )
	local Skillball
	Skillball = star_CreateObj_NoAdd( TargetID() , 106388 , 0 , 0 , 0 , Room , 0 ) 	--炸膿包技能
	SetModeEx( Skillball , EM_SetModeType_SearchenemyIgnore, true )	---物件不會被搜尋
	SetModeEx( Skillball , EM_SetModeType_HideMinimap, true )		---物件是否在小地圖上顯示
	SetModeEx( Skillball , EM_SetModeType_Searchenemy, false )   	--索敵
	SetModeEx( Skillball , EM_SetModeType_Fight, false ) 			--砍殺
	SetModeEx( Skillball , EM_SetModeType_Move, false )				--移動
	SetModeEx( Skillball , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( Skillball , EM_SetModeType_NotShowHPMP , true )		--不show血條
	SetModeEx( Skillball , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Skillball , EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( Skillball , EM_SetModeType_Show, true )				--秀出
	AddToPartition( Skillball , Room )
	WriteRoleValue( Skillball , EM_RoleValue_Livetime , 5 )			--存在秒數
	if ZoneID == 151 then		--普通
		CastSpellLV( Skillball , Skillball , 850222 , 14 )			--膿包炸裂(小)
	elseif ZoneID == 152 then	--困難
		CastSpellLV( Skillball , Skillball , 850222 , 39 )--*2300
	elseif ZoneID == 153 then	--簡易
		CastSpellLV( Skillball , Skillball , 850222 , 9 )
	elseif ZoneID == 940 then	--測試
		CastSpellLV( Skillball , Skillball , 850222 , 0 )
	end
	--say( Skillball , "here" )
	sleep(1)
	delobj ( TargetID() )
end

--※ 炸大龍包 ※--
function sasa_106856_Bomb()
	local Room = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( TargetID() , EM_RoleValue_ZoneID )
	local Skillball
	Skillball = star_CreateObj_NoAdd( TargetID() , 106389 , 0 , 0 , 0 , Room , 0 ) 	--炸膿包技能
	SetModeEx( Skillball , EM_SetModeType_SearchenemyIgnore, true )	---物件不會被搜尋
	SetModeEx( Skillball , EM_SetModeType_HideMinimap, true )		---物件是否在小地圖上顯示
	SetModeEx( Skillball , EM_SetModeType_Searchenemy, false )   	--索敵
	SetModeEx( Skillball , EM_SetModeType_Fight, false ) 			--砍殺
	SetModeEx( Skillball , EM_SetModeType_Move, false )				--移動
	SetModeEx( Skillball , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( Skillball , EM_SetModeType_NotShowHPMP , true )		--不show血條
	SetModeEx( Skillball , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( Skillball , EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( Skillball , EM_SetModeType_Show, true )				--秀出
	AddToPartition( Skillball , Room )
	WriteRoleValue( Skillball , EM_RoleValue_Livetime , 5 )			--存在秒數
	if ZoneID == 151 then		--普通
		CastSpellLV( Skillball , Skillball , 850223 , 17 )			--膿包炸裂(大)
	elseif ZoneID == 152 then	--困難
		CastSpellLV( Skillball , Skillball , 850223 , 49 )--*2300
	elseif ZoneID == 153 then	--簡易
		CastSpellLV( Skillball , Skillball , 850223 , 11 )
	elseif ZoneID == 940 then	--測試
		CastSpellLV( Skillball , Skillball , 850223 , 0 )
	end
	--say( Skillball , "here" )
	sleep(1)
	delobj ( TargetID() )
end

--※ 巨影AI ※--
function sasa_106857_AI()
	local NSCounter = 0				--3S.腐蝕酸
	local NS = 850221				--腐蝕酸
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )		--攻擊目標
		if AttackTarget ~= 0 and ( CheckID( OwnerID() ) ) == true then
			NSCounter = NSCounter + 1
			if NSCounter >= 3 then
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
				if table.getn(Lucky02) >= 3 then							------大於3人就rand 3個
					for mm=1 , 3 do						
						local Luckynum02 = Rand(table.getn(Lucky02))+1						--RAND到的數字	
						if ( Lucky02[Luckynum02] ~= nil ) and ( ReadRoleValue( Lucky02[Luckynum02] , EM_RoleValue_IsDead ) == 0 ) then
							if ZoneID == 151 then		--普通
								SysCastSpellLv( OwnerID() , Lucky02[Luckynum02] , NS , 9 )--20
							elseif ZoneID == 152 then	--困難
								SysCastSpellLv( OwnerID() , Lucky02[Luckynum02] , NS , 14 )--30
							elseif ZoneID == 153 then	--簡易
								SysCastSpellLv( OwnerID() , Lucky02[Luckynum02] , NS , 9 )--20
							elseif ZoneID == 940 then	--測試
								SysCastSpellLv( OwnerID() , Lucky02[Luckynum02] , NS , 0 )
							end
						end
						table.remove( Lucky02 , Luckynum02 )
						sleep(1)
						--Say( OwnerID() , "run, "..table.getn(Lucky02) )
					end
				else													-------3人以下就全中
					for nn=1 , table.getn(Lucky02) do
						if ( Lucky02[nn] ~= nil ) and ( ReadRoleValue( Lucky02[nn] , EM_RoleValue_IsDead ) == 0 ) then
							--Say( OwnerID() , "run, "..table.getn(Lucky02) )
							if ZoneID == 151 then		--普通
								SysCastSpellLv( OwnerID() , Lucky02[nn] , NS , 9 )
							elseif ZoneID == 152 then	--困難
								SysCastSpellLv( OwnerID() , Lucky02[nn] , NS , 14 )
							elseif ZoneID == 153 then	--簡易
								SysCastSpellLv( OwnerID() , Lucky02[nn] , NS , 9 )
							elseif ZoneID == 940 then	--測試
								SysCastSpellLv( OwnerID() , Lucky02[nn] , NS , 0 )
							end
						end
						sleep(1)
					end
					NSCounter = 0
				end			
			end
		end
	end
end