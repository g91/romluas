function cl_139_Trap_P1()
	local AI = OwnerID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	local Trap_flag_A = {"cl_139_TrapA_1","cl_139_TrapA_2","cl_139_TrapA_3","cl_139_TrapA_4","cl_139_TrapA_5","cl_139_TrapA_6"}
	local rand_function = 0
	local TrapA = CreateObjByFlag( 105653 , 780937 , 0 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( TrapA , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( TrapA , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( TrapA , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( TrapA , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( TrapA , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( TrapA , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( TrapA , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( TrapA , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( TrapA , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( TrapA , EM_RoleValue_PID , AI ) ---
	local TrapB = CreateObjByFlag( 105653 , 780937 , 1 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( TrapB , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( TrapB , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( TrapB , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( TrapB , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( TrapB , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( TrapB , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( TrapB , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( TrapB , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( TrapB , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( TrapB , EM_RoleValue_PID , AI ) ---
	WriteRoleValue ( TrapA , EM_RoleValue_Register1 , TrapB ) ---
	--WriteRoleValue ( TrapB , EM_RoleValue_Register1 , TrapA ) ---
	BeginPlot( TrapB,"cl_139_TrapB", 0 )
	rand_function = DW_Rand(6)  ----->有100個亂數去隨機一個值出來
	BeginPlot( TrapA,Trap_flag_A[rand_function], 0 )
	sleep ( 1 )
	local TrapA_1 = CreateObjByFlag( 105653 , 780937 , 2 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( TrapA_1 , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( TrapA_1 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( TrapA_1 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( TrapA_1 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( TrapA_1 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( TrapA_1 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( TrapA_1 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( TrapA_1 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( TrapA_1 , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( TrapA_1 , EM_RoleValue_PID , AI ) ---
	sleep ( 1 )
	local TrapB_1 = CreateObjByFlag( 105653 , 780937 , 3 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( TrapB_1 , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( TrapB_1 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( TrapB_1 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( TrapB_1 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( TrapB_1 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( TrapB_1 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( TrapB_1 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( TrapB_1 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( TrapB_1 , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( TrapB_1 , EM_RoleValue_PID , AI ) ---
	WriteRoleValue ( TrapA_1 , EM_RoleValue_Register1 , TrapB_1 ) ---
	--WriteRoleValue ( TrapB_1 , EM_RoleValue_Register1 , TrapA_1 ) ---
	BeginPlot( TrapB_1,"cl_139_TrapB", 0 )
	rand_function = DW_Rand(6)  ----->有100個亂數去隨機一個值出來
	BeginPlot( TrapA_1,Trap_flag_A[rand_function], 0 )
	sleep ( 1 )
	local TrapA_2 = CreateObjByFlag( 105653 , 780937 , 4 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( TrapA_2 , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( TrapA_2 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( TrapA_2 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( TrapA_2 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( TrapA_2 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( TrapA_2 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( TrapA_2 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( TrapA_2 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( TrapA_2 , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( TrapA_2 , EM_RoleValue_PID , AI ) ---
	sleep ( 1 )
	local TrapB_2 = CreateObjByFlag( 105653 , 780937 , 5 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( TrapB_2 , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( TrapB_2 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( TrapB_2 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( TrapB_2 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( TrapB_2 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( TrapB_2 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( TrapB_2 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( TrapB_2 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( TrapB_2 , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( TrapB_2 , EM_RoleValue_PID , AI ) ---
	WriteRoleValue ( TrapA_2 , EM_RoleValue_Register1 , TrapB_2 ) ---
	--WriteRoleValue ( TrapB_2 , EM_RoleValue_Register1 , TrapA_2 ) ---
	BeginPlot( TrapB_2,"cl_139_TrapB", 0 )
	rand_function = DW_Rand(6)  ----->有100個亂數去隨機一個值出來
	BeginPlot( TrapA_2,Trap_flag_A[rand_function], 0 )
	sleep ( 1 )
	local TrapA_3 = CreateObjByFlag( 105653 , 780937 , 6 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( TrapA_3 , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( TrapA_3 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( TrapA_3 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( TrapA_3 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( TrapA_3 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( TrapA_3 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( TrapA_3 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( TrapA_3 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( TrapA_3 , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( TrapA_3 , EM_RoleValue_PID , AI ) ---
	sleep ( 1 )
	local TrapB_3 = CreateObjByFlag( 105653 , 780937 , 7 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( TrapB_3 , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( TrapB_3 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( TrapB_3 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( TrapB_3 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( TrapB_3 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( TrapB_3 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( TrapB_3 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( TrapB_3 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( TrapB_3 , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( TrapB_3 , EM_RoleValue_PID , AI ) ---
	WriteRoleValue ( TrapA_3 , EM_RoleValue_Register1 , TrapB_3 ) ---
	--WriteRoleValue ( TrapB_3 , EM_RoleValue_Register1 , TrapA_3 ) ---
	BeginPlot( TrapB_3,"cl_139_TrapB", 0 )
	rand_function = DW_Rand(6)  ----->有100個亂數去隨機一個值出來
	BeginPlot( TrapA_3,Trap_flag_A[rand_function], 0 )
	sleep ( 1 )
	local TrapA_4 = CreateObjByFlag( 105653 , 780937 , 8 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( TrapA_4 , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( TrapA_4 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( TrapA_4 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( TrapA_4 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( TrapA_4 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( TrapA_4 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( TrapA_4 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( TrapA_4 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( TrapA_4 , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( TrapA_4 , EM_RoleValue_PID , AI ) ---
	sleep ( 1 )
	local TrapB_4 = CreateObjByFlag( 105653 , 780937 , 9 , 1 ) ------------誰是boss要在哪裡產生
	SetModeEx ( TrapB_4 , EM_SetModeType_Obstruct, false) 		---阻擋(是) -----這裡要改寫BOSS身上的狀態~一開始有表演所以不讓玩家攻擊
	SetModeEx( TrapB_4 , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( TrapB_4 , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( TrapB_4 , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( TrapB_4 , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( TrapB_4 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( TrapB_4 , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( TrapB_4 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( TrapB_4 , RoomID ) ----物件加入場景,例行公事
	WriteRoleValue ( TrapB_4 , EM_RoleValue_PID , AI ) ---
	WriteRoleValue ( TrapA_4 , EM_RoleValue_Register1 , TrapB_4 ) ---
	--WriteRoleValue ( TrapB_3 , EM_RoleValue_Register1 , TrapA_3 ) ---
	BeginPlot( TrapB_4,"cl_139_TrapB", 0 )
	rand_function = DW_Rand(6)  ----->有100個亂數去隨機一個值出來
	BeginPlot( TrapA_4,Trap_flag_A[rand_function], 0 )
	sleep ( 1 )
end
function cl_139_TrapA_1()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------維持動作
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 2 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 3 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 4 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 8 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapA_2()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------維持動作
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 1 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 2 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 4 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 9 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapA_3()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------維持動作
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 2 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 5 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 6 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 13 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapA_4()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------維持動作
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 1 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 3 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 5 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 11 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapA_5()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------維持動作
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 2 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 5 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 6 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 13 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapA_6()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------維持動作
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 1 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 3 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 4 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 13 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----前方扇形
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----前方扇形
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapB()  ---固定姿勢用
	local TrapB = OwnerID()
	local TrapA = ReadRoleValue ( TrapB , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapB ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------維持動作
end
function cl_ch_497738()
	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) == 105758 then
		local number = ReadRoleValue ( TargetID() , EM_RoleValue_Register1 )
		WriteRoleValue ( TargetID() , EM_RoleValue_Register1, number+1  )
		return true
	elseif ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) ~= 105758 then
		return false
	end
end
function cl_139_105758()
	local Device = OwnerID()
	---local CombatBegin = 0
	SetDefIdleMotion( Device ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------維持動作
	local skill = 0
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 3 then
			CastSpelllv ( Device , Device , 497738 , 0 )----前方扇形
			sleep ( 10 )
			skill = 0
		end
		local number = ReadRoleValue ( Device , EM_RoleValue_Register1 )
		if number >= 6 then
			killid ( Device , Device )
			sleep ( 30 )
			delobj ( Device )
		end
	end
end
function cl_139_118582_1() ---建立NPC時候要執行觸碰劇情
	local white_time = 0
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 6 )
	SetPlot( OwnerID(), "touch","cl_139_118582_touch", 30 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	while 1 do
		sleep ( 10 )
		local white = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if white == 0 then
			white_time = white_time +1
			if white_time >= 30 then
				WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 6 )
				white_time = 0
			end
		end
	end
end
function cl_139_118582_touch() ---觸碰劇情要檢查物件空瓶有的畫執行給予物品，沒有的畫執行字串提示
	local white = ReadRoleValue ( TargetID() , EM_RoleValue_Register1 )
	if white > 0 then
		if CountBodyItem( OwnerID(), 240241 ) ~= 0 then	
			if	BeginCastBarEvent( OwnerID() , TargetID() , "[SC_139_118582_1]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END,0 , "cl_139_118582OK") ~=1	then
				ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
			end
		elseif CountBodyItem( OwnerID(), 240241 ) == 0 then	
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_139_118582_2]", 0 );		--目標忙碌中
		end
	elseif white == 0 then
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_139_118582_3]", 0 );		--目標忙碌中
	end
end
function cl_139_118582OK(Executer,Result) ---檢查目標有沒有木棒~有的畫給予火把
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
		if	Result > 0 then --成功狀態
			EndCastBar(Executer,Result)--清除施法條
			BeginPlot( TargetID() , "cl_139_give207614" , 0)
		else
			EndCastBar(Executer,Result)--清除施法條
		end
	else
		EndCastBar(Executer,Result)--清除施法條
		ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
	end
end
function cl_139_give207614()
	white = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, white-1  )
	DelBodyItem ( TargetID(), 240241, 1 )
	GiveBodyItem ( TargetID(), 207614, 1 )
end
function cl_139_118583()
	addbuff ( OwnerID() , 620015 , 0 , -1 )
	SetPlot( OwnerID(), "touch","cl_139_118583_touch", 30 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
end
function cl_139_118583_touch()
	if	BeginCastBarEvent( OwnerID() , TargetID() , "[SC_139_118583_1]" , 10 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END,0 , "cl_139_118583ok") ~=1	then
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
	end
end
function cl_139_118583ok(Executer,Result) ---檢查目標有沒有木棒~有的畫給予火把
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
		if	Result > 0 then --成功狀態
			EndCastBar(Executer,Result)--清除施法條
			BeginPlot( TargetID() , "cl_139_give204241" , 0)
		else
			EndCastBar(Executer,Result)--清除施法條
		end
	else
		EndCastBar(Executer,Result)--清除施法條
		ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
	end
end
function cl_139_give204241()
	GiveBodyItem ( TargetID(), 240241, 1 )
end
function cl_139_BUFF_dead()
	local SK = Lua_BuffPosSearch( OwnerID(), 620395 )  ---讀取BOSS自己身上有幾層buff
	local SKX=BuffInfo( OwnerID(), SK , EM_BuffInfoType_Power )---讀取技能等級
	if SKX < 10 then
		addbuff ( OwnerID() , 620395 , 0 , 900 )
	end
end
function cl_139_chbuff_620396()
	local SK = Lua_BuffPosSearch( TargetID(), 620395 )  ---讀取BOSS自己身上有幾層buff
	local SKX = 0
	SKX=BuffInfo( TargetID(), SK , EM_BuffInfoType_Power )---讀取技能等級
	if SKX <= 8 then
		return true
	elseif SKX >= 9 then
		return false
	end
end