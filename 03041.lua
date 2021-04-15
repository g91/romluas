
--門口--/GM ? zone 157 0 -1305.7 929.1 546.5
--Flag--781342
--Count--108143
--旗標--Flag1--Nabu
--旗標--Flag2--前門
--旗標--Flag3--後門
--旗標--Flag4~27--小怪生怪點

--Nabu--EM_RoleValue_register1--Count
--Nabu--EM_RoleValue_register2--
--Nabu--EM_RoleValue_register9--Entrance
--Nabu--EM_RoleValue_register10--Exit

--Blackone--EM_RoleValue_register1--Nabu
--Whiteone--EM_RoleValue_register1--Nabu

--count--EM_RoleValue_register3--1--死亡

--for迴圈使用至--g

--※ 控制器 ※--
function sasa_108143_Counter()
	local Count = OwnerID()
	local Room = ReadRoleValue( Count , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue ( Count , EM_RoleValue_ZoneID )
	local NabuNum = { 108144 , 108157 , 108160 }
	local class
	if ZoneID == 157 or ZoneID == 940 then		--困難--測試區
		class = 1
	elseif ZoneID == 158 then	--普通
		class = 2
	elseif ZoneID == 159 then	--簡易
		class = 3
	end
	local Nabu = CreateObjByFlag( NabuNum[class] , 781342 , 1 , 1 )
	AddToPartition( Nabu , Room )
	BeginPlot( Nabu , "sasa_108144_AI" , 0 )
	Setplot( Nabu , "dead" , "sasa_108144_Dead" , 30 )
	WriteRoleValue( Nabu , EM_RoleValue_register1 , Count )
	
	local Entrance = 0
	local Exit = CreateObjByFlag( 106239 , 781342 , 3 , 1 )	--後門出口
	SetModeEx( Exit , EM_SetModeType_Move , false )			--不移動
	SetModeEx( Exit , EM_SetModeType_Strikback , false )	--不反擊
	SetModeEx( Exit , EM_SetModeType_Fight , false )		--不可砍
	SetModeEx( Exit , EM_SetModeType_Searchenemy , false )	--不索敵
	SetModeEx( Exit , EM_SetModeType_Mark , false )			--不可點
	SetModeEx( Exit , EM_SetModeType_NotShowHPMP , false )	--不show血條
	SetModeEx( Exit , EM_SetModeType_Obstruct , true )		--阻擋
	AddToPartition( Exit , Room )               
	WriteRoleValue( Nabu , EM_RoleValue_register10 , Exit )
	
	local EnterFight = 0
	local Jellyfish01 = {}		--黑水母變數
	local Jellyfish02 = {}		--白水母變數
	local JellyfishB = { 108156 , 108159 , 108162 }
	local JellyfishW = { 108155 , 108158 , 108161 }
	local MCounter = 0			--小怪計時
	local flagNum1=DW_CircleRand(24)	--需為取出數量倍數
	local BerserkCounter = 0	-------狂暴計時
	local IsBerserk = 0			-------狂暴開關
	
	while 1 do
		Sleep(10)
		local NabuTarget = ReadRoleValue( Nabu , EM_RoleValue_AttackTargetID )
		--local MaxHP = ReadRoleValue( Nabu , EM_RoleValue_MaxHP )					--總血量
		--local NowHP = ReadRoleValue( Nabu , EM_RoleValue_HP )						--當前血量
		--local HPPercent = ( NowHP / MaxHP )*100									--血量百分比
		if ( NabuTarget ~= 0 ) and ( CheckID( Nabu ) ) == true then
			MCounter = MCounter + 1
			BerserkCounter = BerserkCounter + 1
			if EnterFight == 0 then
				ScriptMessage( Nabu , -1 , 2 , "[SC_108144_01]" , 1 )
				--久違的客人來訪，[108144]似乎並不感到意外。
				Entrance = CreateObjByFlag( 106239 , 781342 , 2 , 1 )		--前門入口
				SetModeEx( Entrance , EM_SetModeType_Move , false )			--不移動
				SetModeEx( Entrance , EM_SetModeType_Strikback , false )	--不反擊
				SetModeEx( Entrance , EM_SetModeType_Fight , false )		--不可砍
				SetModeEx( Entrance , EM_SetModeType_Searchenemy , false )	--不索敵
				SetModeEx( Entrance , EM_SetModeType_Mark , false )			--不可點
				SetModeEx( Entrance , EM_SetModeType_NotShowHPMP , false )	--不show血條
				SetModeEx( Entrance , EM_SetModeType_Obstruct , true )		--阻擋
				AddToPartition( Entrance , Room )
				WriteRolevalue( Nabu , EM_RoleValue_register9 , Entrance )
				EnterFight = 1
			end
			if EnterFight == 1 then
--※ 小怪 ※--
				if MCounter >= 15 then
					for a = 1 , 4 do
						local Blackone = CreateObjByFlag( JellyfishB[class] , 781342 , flagNum1()+3 , 1 )--從flag4開始種物件，此種RAND不包含flag0，所以+3 是要略過flag1~3
						Jellyfish01[table.getn(Jellyfish01)+1] = Blackone
						SetModeEx( Blackone , EM_SetModeType_Move , false )			--不移動
						AddToPartition( Blackone , Room )
						Setplot( Blackone , "dead" , "sasa_108156_Jelly" , 30 )
						WriteRolevalue( Blackone , EM_RoleValue_register1 , Nabu )
						WriteRoleValue( Blackone , EM_RoleValue_Livetime, 15 )		--存在秒數
						Sleep(1)
						local Whiteone = CreateObjByFlag( JellyfishW[class] , 781342 , flagNum1()+3 , 1 )
						Jellyfish02[table.getn(Jellyfish02)+1] = Whiteone
						SetModeEx( Whiteone , EM_SetModeType_Move , false )			--不移動
						AddToPartition( Whiteone , Room )
						Setplot( Whiteone , "dead" , "sasa_108156_Jelly" , 30 )
						WriteRolevalue( Whiteone , EM_RoleValue_register1 , Nabu )
						WriteRoleValue( Whiteone , EM_RoleValue_Livetime, 15 )		--存在秒數
					end
					MCounter = 0
				end
--※ 狂爆 ※--
				if ( BerserkCounter >= 480 and class == 1 ) 
				 or ( BerserkCounter >= 360 and class == 2 ) then		--8 min. and 6 min.
					ScriptMessage( Nabu , -1 , 2 , "[SC_108144_02]" , 1 )
					--[108144]的身體突然產生變化，因為怒氣而使得他變強大了！
					if IsBerserk == 0 then
						AddBuff( Nabu , 624632 , 0 , -1 )
						--Say( Nabu , "Time ="..BerserkCounter )
						IsBerserk = 1
					end
					BerserkCounter = 0
				end
			end
		else
--※ 重置死亡 ※--
			if EnterFight == 1 then
				local NabuIsDead = ReadRoleValue( Count , EM_RoleValue_register3 )
				if NabuIsDead ~= 1 then
					ScriptMessage( Nabu , -1 , 2 , "[SC_108144_03]" , 1 )
					--[108144]感到不屑，他認為，這次的戰鬥猶如過往般地無趣…
					if CheckID(Nabu) == true then
						DelObj(Nabu)
					end
					if CheckID(Entrance) == true then
						DelObj(Entrance)
					end
					for b = 1 , table.getn(Jellyfish01) do
						if CheckID(Jellyfish01[b]) == true and Jellyfish01[b] ~= nil then
							DelObj(Jellyfish01[b])
						end
					end
					for c = 1 , table.getn(Jellyfish02) do
						if CheckID(Jellyfish02[c]) == true and Jellyfish02[c] ~= nil then
							DelObj(Jellyfish02[c])
						end
					end
					--BeginPlot( Count , "sasa_108144_CancelBuff" , 0 )	--清除BUFF
					Sleep(20)
					Nabu = CreateObjByFlag( NabuNum[class] , 781342 , 1 , 1 )
					AddToPartition( Nabu , Room )
					BeginPlot( Nabu , "sasa_108144_AI" , 0 )
					Setplot( Nabu , "dead" , "sasa_108144_Dead" , 30 )
					Sleep(20)
					WriteRoleValue( Nabu , EM_RoleValue_register1 , Count )
					WriteRoleValue( Nabu , EM_RoleValue_register9 , Entrance )
					WriteRoleValue( Nabu , EM_RoleValue_register10 , Exit )
					Jellyfish01 = {}							--小怪變數重置歸零
					Jellyfish02 = {}							--小怪變數重置歸零
				elseif NabuIsDead == 1 then
				--BeginPlot( Count , "sasa_108144_CancelBuff" , 0 )	--清除BUFF
					break
				end
				EnterFight = 0
				BerserkCounter = 0
				IsBerserk = 0
				MCounter = 0
			end
		end
	end
end

--※ 死了 ※--
function sasa_108144_Dead()
	SetFlag( OwnerID() , 544801 , 1 )			--死亡不出現啪嘰鼠
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_108144_04]" , 1 )
	--最後的痛擊使得[108144]再也無力招架，長年帶在身上的[209464]也因此掉了出來…
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local count = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--讀出控制器GID
	WriteRoleValue( count , EM_RoleValue_register3 , 1 )				--告訴計時器Nabu死了
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local Exit = ReadRoleValue( OwnerID() , EM_RoleValue_register10 )
	DelObj( Entrance )
	DelObj( Exit )
	sasa_ZoneDungeon_title_01(530971)--龍蝦吃到飽
end

--※ 小怪死掉 ※--
function sasa_108156_Jelly()
	local GID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )		--檢查施法目標的ID
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local range = 400
	local Player = SearchRangePlayer( OwnerID() , range )		--搜尋周圍玩家
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )	--讀出控制器GID
	local Buff = { 624835 , 624836 }		--黑光--白彩
	local element = { 624744 , 624745 }		--保存元素--汙染元素
	
	if CheckBuff( Boss , Buff[1] ) == true and CheckBuff( Boss , Buff[2] ) == false
	 and ( GID == 108155 or GID == 108158 or GID == 108161 ) then	--黑光白水母
		AddBuff( Boss , element[1] , 0 , -1 )
		for g = 0 , table.getn(Player)-1 do
			AddBuff( Player[g] , element[2] , 0 , -1 )
		end
	elseif CheckBuff( Boss , Buff[1] )	== false and CheckBuff( Boss , Buff[2] ) == true
	 and ( GID == 108156 or GID == 108159 or GID == 108162 ) then	--白彩黑水母
		AddBuff( Boss , element[1] , 0 , -1 )
		for g = 0 , table.getn(Player)-1 do
			AddBuff( Player[g] , element[2] , 0 , -1 )
		end	
	end
end

--※ 龍蝦 AI ※--
function sasa_108144_AI()
	local Owner = OwnerID()
	--AddBuff( Owner , 509476 , 0 , -1 )		------不讓Boss離開戰鬥回血的buff
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Count = ReadRoleValue( Owner , EM_RoleValue_register1 )
	local IconCounter = 0		--黑光或白彩狀態
	local RandCounter = 0		--5S.RAND
	local SnowCounter = 0		--海雪硝化
	local WaterCounter = 0		--水汙染
	local Luck
	local Buff = { 624835 , 624836 }		--黑光--白彩
	local SW = { 851150 , 851151 }			--海雪硝化--水汙染
	local BossTarget
	
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( Owner , EM_RoleValue_AttackTargetID )		--攻擊目標
		if AttackTarget ~= 0 and ( CheckID( Owner ) ) == true then
--※ 全模式 ※--
			IconCounter = IconCounter + 1
			RandCounter = RandCounter + 1
			SnowCounter = SnowCounter + 1
			WaterCounter = WaterCounter + 1
--※ 每17秒 ※--
			if WaterCounter >= 17 then
				BossTarget = Owner
				CastSpellLv( Owner , BossTarget , SW[2] , 0 )
				Sleep(5)
				WaterCounter = 0
--※ 每11秒 ※--
			elseif SnowCounter >= 11 then
				BossTarget = Owner
				CastSpellLv( Owner , BossTarget , SW[1] , 0 )
				Sleep(5)
				SnowCounter = 0
--※ 每10秒換狀態 ※--
			elseif IconCounter >= 10 then
				Luck = Rand(100)
				if ( Luck >= 0 and Luck < 50 ) then
					AddBuff( Owner , Buff[1] , 0 , -1 )
				elseif ( Luck >= 50 and Luck < 100 ) then
					AddBuff( Owner , Buff[2] , 0 , -1 )
				end
				IconCounter = 0
--※ RAND ※--
			elseif RandCounter >= 5 then
				sasa_108144_Skill()
				RandCounter = 0
			end
		end
	end
end

--※ RAND SKILL ※--
function sasa_108144_Skill()
	local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
	local class
	if ZoneID == 157 or ZoneID == 940 then		--困難--測試區
		class = 1
	elseif ZoneID == 158 then	--普通
		class = 2
	elseif ZoneID == 159 then	--簡易
		class = 3
	end
	local Skill = { 851020 , 851034 }			--溶解、海潮噴吐
	local SkillLv = { 0 , 0 }
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
		CastSpellLV( OwnerID() , BossTarget , 851154 , 0 )				--空動作
		for d = 1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[d]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM排除
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--死人排除
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--找到的玩家放進TABLE
			end
		end
		--Say( OwnerID() , "6p is = "..table.getn(LuckyPlayer) )
		if class == 2 or class == 3 then		--普通+簡易
			if table.getn(LuckyPlayer) >= 4 then						--大於4人就rand 4個
				for e = 1 , 4 do
					local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND到的數字	
					if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
						SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					table.remove( LuckyPlayer , Lucky2 )
					sleep(1)
					--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
				end
			else														--4人以下就全中
				for f = 1 , table.getn(LuckyPlayer) do
					if ( LuckyPlayer[f] ~= nil ) and ( ReadRoleValue( LuckyPlayer[f] , EM_RoleValue_IsDead ) == 0 ) then
						--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
						SysCastSpellLv( OwnerID() , LuckyPlayer[f] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					sleep(1)
				end
			end
		elseif class == 1 then	--困難+測試
			if table.getn(LuckyPlayer) >= 6 then						--大於6人就rand 6個
				for e = 1 , 6 do
					local Lucky2 = Rand(table.getn(LuckyPlayer))+1		--RAND到的數字	
					if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
						SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					table.remove( LuckyPlayer , Lucky2 )
					sleep(1)
					--Say( OwnerID() , "u r"..table.getn(LuckyPlayer) )
				end
			else														--6人以下就全中
				for f = 1 , table.getn(LuckyPlayer) do
					if ( LuckyPlayer[f] ~= nil ) and ( ReadRoleValue( LuckyPlayer[f] , EM_RoleValue_IsDead ) == 0 ) then
						--Say( OwnerID() , "I got "..table.getn(LuckyPlayer) )
						SysCastSpellLv( OwnerID() , LuckyPlayer[f] , Skill[SkillIndex] , SkillLv[SkillIndex] )
					end
					sleep(1)
				end
			end
		end
	end	
	--ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , 1 )
end