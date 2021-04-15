function AI_ANKARIA()
	SetPlot( OwnerID() , "dead" , "Lua_100074_deadlog_1" , 0 )			--紀錄安卡莉亞被殺
	local MonsterID = 100072	-- 屍妖
	local MonsterNumber1 = 2
	local MonsterNumber2 = 2
	local MonsterNumber3 = 2
	local HPMonsterNumber = 2
	local HPMonsterID = 100070	-- 傀儡法師
	local FirstMagicID = 490636	-- 群體補抓
	local BuffID = 501014 	-- 群體補抓Buff
	local SecondMagicID = 490471	-- 火球術
	local SecondMagicLV = 120
	local thirdMagicID = 490489		-- 大爆炸
	local thirdMagicLV = 50

	local HPMagicID = 491078	-- 小王專用30%恢復術（血剩50%, 25%時使用）
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- 一秒檢查一次
	local FTM = "NoCall"	-- 戰鬥狀態
	local F2M = "NoCall"	-- 戰鬥狀態
	local F4M = "NoCall"	-- 戰鬥狀態
	local HPM2 = "NoCall"	-- 回血狀態
	local HPM4 = "NoCall"	-- 回血狀態
	local Monster1 = {}
	local Monster2 = {}
	local Monster3 = {}


	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			--Say( OwnerID(), "Fighting! AttackTarget = "..AttackTarget.." n = "..n )

			if ( CheckBuff( AttackTarget , BuffID ) == true ) then
				CastSpellLV( OwnerID(), AttackTarget, SecondMagicID , SecondMagicLV ) 
			else
				local RND =  Rand( 99 ) + 1	-- 產生 1~100 的亂數
				    if ( RND >  0 and RND <= 20 ) then
					CastSpell( OwnerID(), AttackTarget, FirstMagicID )
				elseif ( RND > 20 and RND <= 30 ) then
					if ( CastSpellLV( OwnerID(), AttackTarget, thirdMagicID , thirdMagicLV ) ) then
					--Say( OwnerID(), GetString("MT_ANKARIA4") )
						Say( OwnerID(), GetString("MT_ANKARIA5") )
						Sleep( 100 )
					end
				end
			end

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			-- 戰鬥開始叫怪
			if (FTM == "NoCall" ) then	FTM, Monster1 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber1 , GetString("MT_ANKARIA1") )	end
			-- 血 1/2 叫怪
			if ( HPPercent <= 0.5 ) and (F2M == "NoCall" ) then	F2M, Monster2 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber2 , GetString("MT_ANKARIA1") )	end
			-- 血 1/4 叫怪
			if ( HPPercent <= 0.25 ) and (F4M == "NoCall" ) then	F4M, Monster3 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber3 , GetString("MT_ANKARIA1") )	end

			-- 血 1/2 叫怪補血
			if (HPM2 == "NoCall" ) then	HPM2 = CallMonsterForRecovery( OwnerID() , 0.5 , 100070, 491078 , "Yes" , GetString("MT_ANKARIA2") , HPMonsterNumber , GetString("MT_ANKARIA3") )	end
			-- 血 1/4 叫怪補血
			if (HPM4 == "NoCall" ) then	HPM4 = CallMonsterForRecovery( OwnerID() , 0.25 , 100070, 491078 , "Yes" , GetString("MT_ANKARIA2") , HPMonsterNumber , GetString("MT_ANKARIA3")  )	end

		else
			--Say( OwnerID(), "NoFight n = "..n )

			FTM = "NoCall"		-- 非戰鬥，歸零記號
			F2M = "NoCall"		-- 非戰鬥，歸零記號
			F4M = "NoCall"		-- 非戰鬥，歸零記號
			HPM2 = "NoCall"		-- 非戰鬥，歸零記號
			HPM4 = "NoCall"		-- 非戰鬥，歸零記號


			for i = 1, table.getn( Monster1 ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的屍妖
				if ( ( Monster1[i] ~= nil ) and ( CheckID( Monster1[i] ) == true ) ) then		DelObj( Monster1[i] )	end
			end
			for i = 1, table.getn( Monster2 ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的屍妖
				if ( ( Monster2[i] ~= nil ) and ( CheckID( Monster2[i] ) == true ) ) then		DelObj( Monster2[i] )	end
			end
			for i = 1, table.getn( Monster3 ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的屍妖
				if ( ( Monster3[i] ~= nil ) and ( CheckID( Monster3[i] ) == true ) ) then		DelObj( Monster3[i] )	end
			end

			if ( Monster1 ~= nil ) then	Monster1 = {}	end
			if ( Monster2 ~= nil ) then	Monster2 = {}	end
			if ( Monster3 ~= nil ) then	Monster3 = {}	end

		end

	Sleep( CheckTime )
	end
end