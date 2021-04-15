function yuyu_111612_1() 
	local CT = 10	-- 一秒檢查一次
	local MP = 150	-- 簽到點停留時間
	local MARK = { }
	local Leaderboy = OwnerID()
	local Monster01 = { }
	local Monster02 = { }
	local Monster03 = { }

	WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 0 ) --奔跑
	MoveToFlagEnabled( Leaderboy , false )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 47 ,0 )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 46 , 0 )
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 45 , 0 )
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --簽到點到囉！大家稍微休息一下吧！
		Say( Leaderboy, "[SC_YU_HW_111611_3]" )  
		local MARKER = LuaFunc_SearchNPCbyOrgID( Leaderboy , 111597, 100 , 1)       --簽到員5	

	sleep(MP)
		ScriptMessage( Leaderboy, 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --好囉！我們走吧！
		Say(Leaderboy , "[SC_YU_HW_111611_2]" )  
	sleep(CT)
		ScriptMessage( Leaderboy, 0 , 1 , "[SC_YU_HW_111611_1]" , C_SYSTEM ) --有怪
		Say( Leaderboy, "[SC_YU_HW_111611_1]" )  
		WriteRoleValue(Leaderboy,EM_RoleValue_IsWalk , 1 ) --慢行
		Delobj( MARKER[0] )
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy, 780199 , 44 , 0 )

	SetModeEx( Leaderboy , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( Leaderboy , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( Leaderboy  , EM_SetModeType_Strikback, true )--反擊
	WriteRoleValue(  Leaderboy   , EM_RoleValue_Register , 0 ) --防止意外，戰鬥前再次清空導遊
	
	Monster01[1] = CreateObjByFlag( 101281, 780201, 21 , 1 );            --怪
	Monster01[2] = CreateObjByFlag( 101283, 780201, 22 , 1 );            --怪
	Monster01[3] = CreateObjByFlag( 101285, 780201, 23 , 1 );            --怪
	Monster01[4] = CreateObjByFlag( 101281, 780201, 24 , 1 );            --怪
	Monster01[5] = CreateObjByFlag( 101287, 780201, 25 , 1 );            --怪
	Monster01[6] = CreateObjByFlag( 101281, 780201, 26 , 1 );            --怪
	Monster01[7] = CreateObjByFlag( 101286, 780201, 27 , 1 );            --怪
	Monster01[8] = CreateObjByFlag( 101283, 780201, 28 , 1 );            --怪

	for i=1 , table.getn(Monster01) do	
		WriteRoleValue( Monster01[i] , EM_RoleValue_PID , Leaderboy ) --記住導遊
		AddToPartition( Monster01[i] , 0) 
		SetAttack( Monster01[i] , Leaderboy  )
	end
	SetAttack( Leaderboy , Monster01[1]  )
	CallPlot(Leaderboy , "Lua_na_2008_tourist_check2" , 8 )
	Lua_na_2008_tourist_check(8) --檢查此階段擊殺的活動怪物：8隻
	MARK[1] = CreateObjByFlag( 111598, 780201, 20 , 1 );            --簽到員
	AddToPartition( MARK[1] , 0) 
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 43 , 0 )
	LuaFunc_MoveToFlag(Leaderboy , 780199 , 42 , 0 )
	LuaFunc_MoveToFlag(Leaderboy , 780199 , 41 , 0 )
	LuaFunc_MoveToFlag(Leaderboy , 780199 , 40 , 0 )
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --簽到點到囉！大家稍微休息一下吧！
		Say( Leaderboy , "[SC_YU_HW_111611_3]" )  
	sleep(MP)
		ScriptMessage(Leaderboy  , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --好囉！我們走吧！
		Say( Leaderboy , "[SC_YU_HW_111611_2]" )  
	sleep(CT)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_1]" , C_SYSTEM ) --有怪
		Say( Leaderboy , "[SC_YU_HW_111611_1]" )  
		WriteRoleValue(Leaderboy  ,EM_RoleValue_IsWalk , 1 ) --慢行
		Delobj( MARK[1] )
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 39 , 0 )

	SetModeEx( Leaderboy  , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( Leaderboy , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( Leaderboy  , EM_SetModeType_Strikback, true )--反擊
	WriteRoleValue(  Leaderboy   , EM_RoleValue_Register , 0 ) --防止意外，戰鬥前再次清空導遊

	Monster02[1] = CreateObjByFlag( 101281, 780201, 14 , 1 );            --怪
	Monster02[2] = CreateObjByFlag( 101283, 780201, 15 , 1 );            --怪
	Monster02[3] = CreateObjByFlag( 101286, 780201, 16 , 1 );            --怪
	Monster02[4] = CreateObjByFlag( 101281, 780201, 17 , 1 );            --怪
	Monster02[5] = CreateObjByFlag( 101283, 780201, 18 , 1 );            --怪
	Monster02[6] = CreateObjByFlag( 101286, 780201, 19 , 1 );            --怪

	for i=1 , table.getn(Monster02) do	
		WriteRoleValue( Monster02[i] , EM_RoleValue_PID , Leaderboy ) --記住導遊
		AddToPartition( Monster02[i] , 0) 
		SetAttack( Monster02[i] , Leaderboy )
	end
	SetAttack( Leaderboy , Monster02[1]  )
	CallPlot(Leaderboy , "Lua_na_2008_tourist_check2" , 6 )
	Lua_na_2008_tourist_check(6) --檢查此階段擊殺的活動怪物：6隻
	MARK[2] = CreateObjByFlag( 111599, 780201, 13 , 1 );            --簽到員
	AddToPartition( MARK[2] , 0)
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 38 , 0 )
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 37 , 0 )
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 36 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy  , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --簽到點到囉！大家稍微休息一下吧！
		Say( Leaderboy  , "[SC_YU_HW_111611_3]" )  
	sleep(MP)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --好囉！我們走吧！
		Say( Leaderboy , "[SC_YU_HW_111611_2]" )  
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 35 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy  , 0 , 1 , "[SC_YU_HW_111611_1]" , C_SYSTEM ) --有怪
		Say( Leaderboy , "[SC_YU_HW_111611_1]" )  
		WriteRoleValue(Leaderboy ,EM_RoleValue_IsWalk , 1 ) --慢行
		Delobj( MARK[2] )
	sleep(CT)
	LuaFunc_WaitMoveTo( Leaderboy , 2656.5 , -14.2 , 1849.9 )
	SetModeEx( Leaderboy  , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( Leaderboy  , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( Leaderboy  , EM_SetModeType_Strikback, true )--反擊
	WriteRoleValue(  Leaderboy   , EM_RoleValue_Register , 0 ) --防止意外，戰鬥前再次清空導遊
	Monster03[1] = CreateObjByFlag( 101285, 780201, 9 , 1 );            --怪
	Monster03[2] = CreateObjByFlag( 101285, 780201, 10 , 1 );            --怪
	Monster03[3] = CreateObjByFlag( 101281, 780201, 11 , 1 );            --怪
	Monster03[4] = CreateObjByFlag( 101281, 780201, 12 , 1 );            --怪
	
	for i=1 , table.getn(Monster03) do	
		WriteRoleValue( Monster03[i] , EM_RoleValue_PID , Leaderboy ) --記住導遊
		AddToPartition( Monster03[i] , 0) 
		SetAttack( Monster03[i] , Leaderboy )
	end
	SetAttack( Leaderboy , Monster03[1]  )
	CallPlot(Leaderboy , "Lua_na_2008_tourist_check2" ,  4 )
	Lua_na_2008_tourist_check(4) --檢查此階段擊殺的活動怪物：4隻
	MARK[3] = CreateObjByFlag( 111600, 780201, 8 , 1 );            --簽到員
	AddToPartition( MARK[3] , 0) 
	LuaFunc_WaitMoveTo( Leaderboy , 2584.9 , -14.9 , 1683.5 )
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 31 , 0 )
	sleep(CT)
		ScriptMessage( Leaderboy , 0 , 1 , "[SC_YU_HW_111611_3]" , C_SYSTEM ) --簽到點到囉！大家稍微休息一下吧！
		Say( Leaderboy , "[SC_YU_HW_111611_3]" )  
	sleep(MP)
		ScriptMessage(Leaderboy , 0 , 1 , "[SC_YU_HW_111611_2]" , C_SYSTEM ) --好囉！我們走吧！
		Say( Leaderboy , "[SC_YU_HW_111611_2]" )  
		Delobj( MARK[3] )
	sleep(CT)
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 30 , 0 )
	LuaFunc_WaitMoveTo( Leaderboy , 2637.4 , 44.1 , 1000.6 )
	LuaFunc_MoveToFlag( Leaderboy , 780199 , 50 , 0 )

	ScriptMessage( Leaderboy  , 0 , 1 , "[SC_111577_YU_10]" , C_SYSTEM ) --百鬼大遊行，成功！
	Say( Leaderboy , "[SC_111577_YU_10]" )  
	local Leader = LuaFunc_SearchNPCbyOrgID( Leaderboy  , 111604, 100 , 1)       --管理員
	WriteRoleValue( Leader[0]  , EM_RoleValue_PID , 0 )
	WriteRoleValue( Leaderboy  , EM_RoleValue_PID , 0 )
	SetPosByFlag( Leaderboy , 780199 , 50 )
end