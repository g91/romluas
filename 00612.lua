-- 安多利爾的力量
function AI_Andoreir_Power()
	SetPlot( OwnerID() , "dead" , "Lua_100166_deadlog_1" , 0 );
	local MonsterID = { 100231 , 100232 , 100641 , 100232 , 100641  }	-- 悲慟結晶 , 憎恨結晶 , 驚懼結晶 , 憎恨結晶 , 驚懼結晶
	local MonsterNumber = 2
	local Monster = {}

	local FTM = "NoCall"	-- 戰鬥狀態
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- 一秒檢查一次

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			--Say( OwnerID(), "Fighting!")

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			if ( HPPercent <= 0.5 ) and ( FTM == "NoCall" ) then
				Say( OwnerID() , GetString("MT_ANDOREIR1") )
				for i = 1, MonsterNumber do	-- 血低於一半時隨機叫伍種結晶中的三種
					local RND =  Rand( 5 ) + 1	-- 產生 1~5 的亂數
					--Say( OwnerID(), "RND = "..RND )

					local X = { 30 , -30 , -30 , 30 , -40  }
					local Z = { -30 , 30 , -30 , 30 , -40  }
					Monster[i] = CreateMonsterByBOSSBatch( MonsterID[RND], OwnerID() , X[RND] , Z[RND] )
					FTM = "Called"			-- 作記號，讓怪只出現一次
					local MonsterAttack = SetMonsterAttack( Monster , AttackTarget )
				end
			end
		else
			--Say( OwnerID(), "NoFight" )

			FTM = "NoCall"		-- 非戰鬥，歸零記號

			-- 離開戰鬥時，刪除血低於一半時叫出來的結晶
			for i = 1, table.getn( Monster ) do
				if ( ( Monster[i] ~= nil ) and ( CheckID( Monster[i] ) == true ) ) then	DelObj( Monster[i] )	end
			end

			if ( Monster ~= nil ) then	Monster = {}	end

		end

	Sleep( CheckTime )
	end
end

-- 安多利爾的影子
function AI_Andoreir_Shadow()
	SetPlot( OwnerID() , "dead" , "Lua_100233_deadlog_1" , 0 );
	local MonsterID = 100618	-- 安多利爾的影子
	local MonsterNumber1 = 1
	local MonsterNumber2 = 1
	local MonsterNumber3 = 2

	local Monster1 = {}
	local Monster2 = {}
	local Monster3 = {}

	local FTM = "NoCall"	-- 戰鬥狀態
	local F2M = "NoCall"	-- 戰鬥狀態
	local F4M = "NoCall"	-- 戰鬥狀態

	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )

	local CheckTime = 10	-- 一秒檢查一次

	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥

			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP

			if ( FTM == "NoCall" ) then	-- 戰鬥開始叫怪
				local RND =  Rand( 3 ) + 1	-- 產生 1~3 的亂數
				--Say( OwnerID(), "RND = "..RND )
				FTM = "Called"
				if ( RND == 3 ) then	FTM, Monster1 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber1 , GetString("MT_ANDOREIR2") )	end
			end
			-- 血 1/2 叫怪
			if ( HPPercent <= 0.5 ) and (F2M == "NoCall" ) then	F2M, Monster2 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber2 , GetString("MT_ANDOREIR2") )	end
			-- 血 1/4 叫怪
			if ( HPPercent <= 0.25 ) and (F4M == "NoCall" ) then	F4M, Monster3 = CallMonsterAtFightStart( OwnerID() , AttackTarget , MonsterID , MonsterNumber3 , GetString("MT_ANDOREIR2") )	end
		else
			FTM = "NoCall"		-- 非戰鬥，歸零記號
			F2M = "NoCall"		-- 非戰鬥，歸零記號
			F4M = "NoCall"		-- 非戰鬥，歸零記號

			for i = 1, table.getn( Monster1 ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的影子
				if ( ( Monster1[i] ~= nil ) and ( CheckID( Monster1[i] ) == true ) ) then		DelObj( Monster1[i] )	end
			end
			for i = 1, table.getn( Monster2 ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的影子
				if ( ( Monster2[i] ~= nil ) and ( CheckID( Monster2[i] ) == true ) ) then		DelObj( Monster2[i] )	end
			end

			for i = 1, table.getn( Monster3 ) do	-- 離開戰鬥時，刪除進入戰鬥時叫出來的影子
				if ( ( Monster3[i] ~= nil ) and ( CheckID( Monster3[i] ) == true ) ) then		DelObj( Monster3[i] )	end
			end

			if ( Monster1 ~= nil ) then	Monster1 = {}	end
			if ( Monster2 ~= nil ) then	Monster2 = {}	end
			if ( Monster3 ~= nil ) then	Monster3 = {}	end
		end

	Sleep( CheckTime )
	end
end

