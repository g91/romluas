
--※ BOSS RAND 7S. SKILL ※--
function sasa_104582_AnaSkill()
	local Skill = { 496255 , 496256 , 496257 }					--邪靈喚醒、撥弄之語、黑夜
	local SkillLv = { 54 , 13 , 29 }
	local SkillString = { "[SC_104582_08]" , "[SC_104582_09]" , "[SC_104582_10]" }
	--乖乖的成為我的玩物吧…
	--你們就只有這點能耐？
	--別讓我感到太無趣…我的心情可不是一直都這麼好…
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())					--取出仇恨表內的玩家
	local BossTarget 											--存BOSS要打的目標
	local SkillIndex 											--取TABLE內的位置
		
	if (Luck >= 0 and Luck < 15) or (Luck >= 45 and Luck < 60) then
		SkillIndex = 1
		BossTarget = PlayerInHate[1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif (Luck >= 15 and Luck < 30) or (Luck >= 60 and Luck < 75) then
		SkillIndex = 2
		CastSpellLV( OwnerID(), OwnerID() , 496190 , 0 )				--空動作
		for i=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[i]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM排除
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--死人排除
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--找到的玩家放進TABLE
			end
		end
		--Say( OwnerID() , "4pp ="..table.getn(LuckyPlayer) )
		if table.getn(LuckyPlayer) >= 4 then							--大於4人就rand 4個
			for j=1 , 4 do
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1			--RAND到的數字	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say( OwnerID() , "yes ="..table.getn(LuckyPlayer) )
			end
		else													-------4人以下就全中
			for k=1 , table.getn(LuckyPlayer) do
				if ( LuckyPlayer[k] ~= nil ) and ( ReadRoleValue( LuckyPlayer[k] , EM_RoleValue_IsDead ) == 0 ) then
					--Say( OwnerID() , "pp ="..table.getn(LuckyPlayer) )
					SysCastSpellLv( OwnerID() , LuckyPlayer[k] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	elseif (Luck >= 30 and Luck < 45) or (Luck >= 75 and Luck < 100) then
		SkillIndex = 3
		BossTarget = OwnerID()
		CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
	end	
	ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , "0xff6fb7ff" )
end

--※ BOSS RAND 7S. SKILL_2 ※--
function sasa_104582_AnaSkill_2()
	local Skill = { 496255 , 496256 }					--邪靈喚醒、撥弄之語
	local SkillLv = { 54 , 13 }
	local SkillString = { "[SC_104582_08]" , "[SC_104582_09]" }
	--乖乖的成為我的玩物吧…
	--你們就只有這點能耐？
	local Luck = Rand(100)
	local LuckyPlayer = {}
	local PlayerInHate = {}
	PlayerInHate = star_HateListSort(OwnerID())					--取出仇恨表內的玩家
	local BossTarget 											--存BOSS要打的目標
	local SkillIndex 											--取TABLE內的位置
		
	if (Luck >= 0 and Luck < 50) then
		SkillIndex = 1
		BossTarget = PlayerInHate[1]
		if ( BossTarget ~= nil ) and ( ReadRoleValue( BossTarget , EM_RoleValue_IsDead ) == 0 ) then
			CastSpellLv( OwnerID() , BossTarget , Skill[SkillIndex] , SkillLv[SkillIndex] )
			Sleep(10)
		end
	elseif (Luck >= 50 and Luck < 100) then
		SkillIndex = 2
		CastSpellLV( OwnerID(), OwnerID() , 496190 , 0 )				--空動作
		for i=1 , table.getn(PlayerInHate) do
			local temp = PlayerInHate[i]
			if ReadRoleValue( temp , EM_RoleValue_Voc ) ~= 0 			--GM排除
			 and ReadRoleValue( temp , EM_RoleValue_IsDead ) == 0 then 	--死人排除
				LuckyPlayer[table.getn(LuckyPlayer)+1] = temp 			--找到的玩家放進TABLE
			end
		end
		--Say( OwnerID() , "4pp ="..table.getn(LuckyPlayer) )
		if table.getn(LuckyPlayer) >= 4 then							--大於4人就rand 4個
			for j=1 , 4 do
				local Lucky2 = Rand(table.getn(LuckyPlayer))+1			--RAND到的數字	
				if ( LuckyPlayer[Lucky2] ~= nil ) and ( ReadRoleValue( LuckyPlayer[Lucky2] , EM_RoleValue_IsDead ) == 0 ) then
					SysCastSpellLv( OwnerID() , LuckyPlayer[Lucky2] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				table.remove( LuckyPlayer , Lucky2 )
				sleep(1)
				--Say( OwnerID() , "yes ="..table.getn(LuckyPlayer) )
			end
		else													-------4人以下就全中
			for k=1 , table.getn(LuckyPlayer) do
				if ( LuckyPlayer[k] ~= nil ) and ( ReadRoleValue( LuckyPlayer[k] , EM_RoleValue_IsDead ) == 0 ) then
					--Say( OwnerID() , "pp ="..table.getn(LuckyPlayer) )
					SysCastSpellLv( OwnerID() , LuckyPlayer[k] , Skill[SkillIndex] , SkillLv[SkillIndex] )
				end
				sleep(1)
			end
		end
	end	
	ScriptMessage( OwnerID() , -1 , 2 , SkillString[SkillIndex] , "0xff6fb7ff" )
end

--※ 小熊爆炸A ※--
function sasa_104585_BombBear1()
	local BallF = star_CreateObj_NoAdd( OwnerID() , 105454 , 0 , 0 , 0 , Room , 0 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetModeEx( BallF , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( BallF , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( BallF , EM_SetModeType_HideMinimap , true )		---物件是否在小地圖上顯示
	SetModeEx( BallF , EM_SetModeType_Searchenemy , false )   	--索敵
	SetModeEx( BallF , EM_SetModeType_Mark , false )			--標記
	SetModeEx( BallF , EM_SetModeType_Fight , false ) 			--砍殺
	SetModeEx( BallF , EM_SetModeType_Move , false )			--移動
	SetModeEx( BallF , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( BallF , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( BallF , EM_SetModeType_Show , true )				--秀出
	AddToPartition( BallF , Room )
	WriteRoleValue( BallF , EM_RoleValue_Livetime, 10 )			--存在秒數
	CastSpellLv( BallF , BallF , 496260 , 7 )					--自爆裝置+殘餘波
	--Say( BallF , "Bomb 1" )
end

--※ 小熊爆炸B ※--
function sasa_104586_BombBear2()
	local BallG = star_CreateObj_NoAdd( OwnerID() , 105455 , 0 , 0 , 0 , Room , 0 )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetModeEx( BallG , EM_SetModeType_SearchenemyIgnore , true )---物件不會被搜尋
	SetModeEx( BallG , EM_SetModeType_HideName , true )  		---物件頭上是否顯示名稱
	SetModeEx( BallG , EM_SetModeType_HideMinimap , true )		---物件是否在小地圖上顯示
	SetModeEx( BallG , EM_SetModeType_Searchenemy , false )   	--索敵
	SetModeEx( BallG , EM_SetModeType_Mark , false )			--標記
	SetModeEx( BallG , EM_SetModeType_Fight , false ) 			--砍殺
	SetModeEx( BallG , EM_SetModeType_Move , false )			--移動
	SetModeEx( BallG , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( BallG , EM_SetModeType_Strikback , false )		--反擊
	SetModeEx( BallG , EM_SetModeType_Show , true )				--秀出
	AddToPartition( BallG , Room )
	WriteRoleValue( BallG , EM_RoleValue_Livetime, 10 )			--存在秒數
	CastSpellLv( BallG , BallG , 496261 , 7 )					--自爆裝置+殘餘波
	--Say( BallG , "Bomb 2 stop" )
end

--※ 小熊爆炸死 ※--
function sasa_104585_killID()
	local counter = 0
	while 1 do
		sleep(10)
		counter = counter + 1
		if counter == 8 then
			--Say( OwnerID() , "kill" )
			killID( OwnerID() , OwnerID() )
		end	
	end	
end

--※ 艾娜莉亞死亡 ※--
function sasa_104582_Dead()
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_104582_11]" , "0xff6fb7ff" )
	--呃…我的身體…………父…親……
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local counter = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )		---讀出控制器GID
	WriteRoleValue( counter , EM_RoleValue_register7 , 1 )					---告訴計時器Boss死了
	local Entrance = ReadRoleValue( OwnerID() , EM_RoleValue_register9 )
	local BigBear1 = ReadRoleValue( OwnerID() , EM_RoleValue_register2 )
	local BigBear2 = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
	local BigBear3 = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	DelObj( Entrance )
	DelObj( BigBear1 )
	DelObj( BigBear2 )
	DelObj( BigBear3 )
end

--※ 赫爾夫死亡 ※--
function sasa_104587_HerfDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ana = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )		--讀出Boss GID
	AddRoleValue( Ana , EM_RoleValue_register8 , 1 )					--改變其值=1
	local Black = star_CreateObj_NoAdd( OwnerID() , 104587 , 0 , 0 , 0 , Room , 0)
	SetModeEx( Black , EM_SetModeType_Move , false )					--不移動
	SetModeEx( Black , EM_SetModeType_Strikback , false )				--不反擊
	SetModeEx( Black , EM_SetModeType_Fight , false )					--不可砍殺
	SetModeEx( Black , EM_SetModeType_Searchenemy , false )				--不索敵
	SetModeEx( Black , EM_SetModeType_Mark , false )					--不可點選
	SetModeEx( Black , EM_SetModeType_NotShowHPMP , false )				--不show血條
	AddToPartition( Black , Room )
	PlayMotion( Black , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetDefIdleMotion( Black , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	WriteRoleValue( Ana , EM_RoleValue_register4 , Black )				---告訴Ana Herf死了換Black
	DelObj(OwnerID())
end

--※ 拉法德死亡 ※--
function sasa_104588_RafadDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ana = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )		---讀出Boss GID
	AddRoleValue( Ana , EM_RoleValue_register8 , 2 )					---改變其值=2
	local Yellow = star_CreateObj_NoAdd( OwnerID() , 104588 , 0 , 0 , 0 , Room , 0)
	SetModeEx( Yellow , EM_SetModeType_Move , false )					--不移動
	SetModeEx( Yellow , EM_SetModeType_Strikback , false )				--不反擊
	SetModeEx( Yellow , EM_SetModeType_Fight , false )					--不可砍殺
	SetModeEx( Yellow , EM_SetModeType_Searchenemy , false )			--不索敵
	SetModeEx( Yellow , EM_SetModeType_Mark , false )					--不可點選
	SetModeEx( Yellow , EM_SetModeType_NotShowHPMP , false )			--不show血條
	AddToPartition( Yellow , Room )
	PlayMotion( Yellow , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetDefIdleMotion( Yellow , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	WriteRoleValue( Ana , EM_RoleValue_register5 , Yellow )					---告訴Ana Rafad死了換Yellow
	DelObj(OwnerID())
end

--※ 領主死亡 ※--
function sasa_104670_FatherDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ana = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )		---讀出Boss GID
	WriteRoleValue( Ana , EM_RoleValue_register6 , 4 )					---告訴Ana Father死了
end

--※ 物理熊死亡 ※--
function sasa_104589_PhyDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	local EGG01
	local EGGLight = 509474										--光體附著
	CancelBuff( player , 509007 )
	EGG01 = star_CreateObj_NoAdd( OwnerID() , 118155 , 0 , 0 , 0 , Room , 0) 	--死掉生結晶
	SetModeEx( EGG01 , EM_SetModeType_SearchenemyIgnore, true )	---物件不會被搜尋
	SetModeEx( EGG01 , EM_SetModeType_HideMinimap, true )		---物件是否在小地圖上顯示
	SetModeEx( EGG01 , EM_SetModeType_Searchenemy, false )   	--索敵
	SetModeEx( EGG01 , EM_SetModeType_Fight, false ) 			--砍殺
	SetModeEx( EGG01 , EM_SetModeType_Move, false )				--移動
	SetModeEx( EGG01 , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( EGG01 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	SetModeEx( EGG01 , EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( EGG01 , EM_SetModeType_Show, true )				--秀出
	AddToPartition( EGG01 , Room )
	AddBuff( EGG01 , EGGLight , 0 , -1 )						--光體附著
	Setplot( EGG01 , "touch" , "sasa_118155_AI" , 30 )
	WriteRoleValue( EGG01 , EM_RoleValue_Livetime , 30 )		--存在秒數
end

--※ 魔法熊死亡 ※--
function sasa_104584_MagDead()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local player = ReadRoleValue( OwnerID() , EM_RoleValue_register7 )
	local EGG02
	local EGGLight = 509474										--光體附著
	CancelBuff( player , 509007 )
	EGG02 = star_CreateObj_NoAdd( OwnerID() , 118155 , 0 , 0 , 0 , Room , 0) 	--死掉生結晶
	SetModeEx( EGG02 , EM_SetModeType_SearchenemyIgnore, true )	---物件不會被搜尋
	SetModeEx( EGG02 , EM_SetModeType_HideMinimap, true )		---物件是否在小地圖上顯示
	SetModeEx( EGG02 , EM_SetModeType_Searchenemy, false )   	--索敵
	SetModeEx( EGG02 , EM_SetModeType_Fight, false ) 			--砍殺
	SetModeEx( EGG02 , EM_SetModeType_Move, false )				--移動
	SetModeEx( EGG02 , EM_SetModeType_ShowRoleHead, true )
	SetModeEx( EGG02 , EM_SetModeType_NotShowHPMP , false )		--不show血條
	SetModeEx( EGG02 , EM_SetModeType_Strikback, false )			--反擊
	SetModeEx( EGG02 , EM_SetModeType_Show, true )				--秀出
	AddToPartition( EGG02 , Room )
	AddBuff( EGG02 , EGGLight , 0 , -1 )						--光體附著
	Setplot( EGG02 , "touch" , "sasa_118155_AI" , 30 )
	WriteRoleValue( EGG02 , EM_RoleValue_Livetime , 30 )		--存在秒數
end

--※ 點結晶 ※--
function sasa_118155_AI()
	BeginPlot( TargetID() , "sasa_118155_AI2" , 0)
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1 , OwnerID() )
end

--※ 刪結晶 ※--
function sasa_118155_AI2()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local GetPlayer = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local StoneBuff = 509475				--結晶剝落
	if ReadRoleValue( GetPlayer , EM_RoleValue_IsDead ) == 0 then
		AddBuff( GetPlayer , StoneBuff , 0 , 22 )
	end
	Sleep(20)
	delobj ( OwnerID() )
end

--※ 清BUFF ※--
function sasa_104582_CancelBuff()											--刪除BUFF用
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local YesPlayer = SetSearchAllPlayer(RoomID)								--找區域所有玩家
	local BuffPlayer = {}
	for gg=1 , YesPlayer do
		BuffPlayer[gg] = GetSearchResult() 										--接暫存值
		if CheckID( BuffPlayer[gg] ) == true	 								--檢查玩家是不是還在；檢查是否死亡
		 and ReadRoleValue( BuffPlayer[gg] , EM_RoleValue_IsDead ) == 0			--EM_RoleValue_IsDead   =1  =死亡
		 and ReadRoleValue( BuffPlayer[gg] , EM_RoleValue_IsPlayer ) == 1 then	--EM_RoleValue_IsPlayer =1  =玩家
			if CheckBuff( BuffPlayer[gg] , 509041 ) == true	then			--咒骨之術
			 --or CheckBuff( BuffPlayer[gg] , 509075 ) == true then
				CancelBuff(BuffPlayer[gg], 509041)						--要刪除的BUFF
				--CancelBuff(BuffPlayer[gg], 509076)
			end
		end					
	end
end

--※ 測距離 ※--
function sasa_104582_check()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Counter = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register3 )
	local howfar = GetDistance( OwnerID(), boss )
	while 1 do
		howfar = GetDistance( OwnerID(), boss )
		sleep (10)
		--Yell( OwnerID() , "howfar="..howfar , 7 )		
		WriteRoleValue ( Counter , EM_RoleValue_Register1 , howfar )		
	end
end