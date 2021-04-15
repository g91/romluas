function LuaI_113183()	-- 被阻斷的水源
	SetPlot( OwnerID() , "range" , "LuaS_113183_Range" , 150 )
end

function LuaS_113183_Range()
	if CheckAcceptQuest( OwnerID() , 422438 ) == true and CheckFlag( OwnerID() , 542883 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422438_01]" , C_SYSTEM )	-- 你發現[ZONE_LAKE HERON]的水似乎被這個水壩給攔住了！！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422438_01]" , 0 )
		SetFlag( OwnerID() , 542883 , 1 )
	end
end

function LuaI_422439_Check()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 102203

	if ( CheckAcceptQuest( OwnerID() , 422439 ) == false ) or ( CheckCompleteQuest( OwnerID() , 422439 ) == true ) then
		-- No Quest
		return false
	elseif ( CountBodyItem( OwnerID() , 205254 ) >= 10 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422439_01]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422439_01]" , 0 )	--你已經捕捉到 10 隻[102203]了！
		return false
	elseif ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422439_02]" , 0 )	--你所捕捉對象不是[102203]！
		return false
	else
		return true
	end

end

function LuaS_422439_Effect()

	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( TargetID() , EM_RoleValue_HP )
	local HPPercent = NowHP / MaxHP
	local RND = (5)
	if ( HPPercent <= ( ( 50 + RND )/100 ) ) then
		BeginPlot( TargetID() , "LuaI_422439_Reset" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422439_03]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422439_03]" , 0 )	--你成功的捕捉到一隻[102203]！
		--DelBodyItem( OwnerID() , 201652 , 1 )
		GiveBodyItem( OwnerID() , 205254 , 1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422439_04]" , 0 )	--[102203]十分靈活的閃過你的套索！
	end

end

function LuaI_422439_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end

function LuaI_422440_Check()

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 102205

	if ( CheckAcceptQuest( OwnerID() , 422440 ) == false ) or ( CheckCompleteQuest( OwnerID() , 422440 ) == true ) then
		-- No Quest
		return false
	elseif ( CountBodyItem( OwnerID() , 205254 ) >= 1 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422440_01]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422440_01]" , 0 )	--你已經捕捉到[102205]了！
		return false
	elseif ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422440_02]" , 0 )	--你所捕捉對象不是[102205]！
		return false
	else
		return true
	end

end

function LuaS_422440_Effect()

	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( TargetID() , EM_RoleValue_HP )
	local HPPercent = NowHP / MaxHP
	local RND = (5)
	if ( HPPercent <= ( ( 10 + RND )/100 ) ) then
		BeginPlot( TargetID() , "LuaI_422440_Reset" , 0 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422440_03]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422440_03]" , 0 )	--你成功的捕捉到[102205]！
		--DelBodyItem( OwnerID() , 201652 , 1 )
		GiveBodyItem( OwnerID() , 205255 , 1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422440_04]" , 0 )	--[102205]體力十足的擋住你的套索！
	end

end

function LuaI_422440_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end

function LuaI_102261()
	SetPlot( OwnerID() , "dead" , "LuaS_102261_Dead" , 50 )
end

function LuaS_102261_Dead()
	if CheckAcceptQuest( TargetID() , 422441 ) == true and CheckFlag( TargetID() , 542884 ) == false then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422441_01]" , C_SYSTEM )	-- 控制海貍王的力量逐漸從[102261]身上散去！！
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422441_01]" , 0 )
		SetFlag( TargetID() , 542884 , 1 )
	end
end

function LuaS_422426_CHECK()
	local FOOD = ReadRoleValue( TargetID() , EM_RoleValue_Register )

	if ( CheckAcceptQuest( OwnerID() , 422426 ) == false ) or ( CheckCompleteQuest( OwnerID() , 422426 ) == true ) then
		-- No Quest
		return false
	elseif FOOD == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422426_01]" , C_DEFAULT )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422426_01]" , 0 )	-- 這份存糧已經加過[205241]！
		return false
	elseif ( CountBodyItem( OwnerID() , 205241 ) < 1 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422426_02]" , C_DEFAULT )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422426_02]" , 0 )	-- 你身上沒有[205241]！
		return false
	else
		return true
	end
end

function LuaS_422426_DO()
	if DelBodyItem( OwnerID() , 205241 , 1 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422426_03]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422426_03]" , 0 )	-- 你將[205241]添加到蛇人的存糧裡！
		GiveBodyItem( OwnerID() , 205242 , 1 )
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
		BeginPlot( TargetID() , "LuaS_422426_Reset" , 0 )
	end
	return true
end

function LuaS_422426_Reset()
	Sleep( 300 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	--LuaFunc_ResetObj( OwnerID() )	
end

function LuaS_422427_CHECK()
	local FOOD = ReadRoleValue( TargetID() , EM_RoleValue_Register )

	if ( CheckAcceptQuest( OwnerID() , 422427 ) == false ) or ( CheckCompleteQuest( OwnerID() , 422427 ) == true ) then
		-- No Quest
		return false
	elseif ( CountBodyItem( OwnerID() , 205243 ) < 1 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422427_01]" , C_DEFAULT )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422427_01]" , 0 )	-- 你身上沒有[205243]！
		return false
	else
		return true
	end
end

function LuaS_422427_DO()
	if DelBodyItem( OwnerID() , 205243 , 1 ) then

	end
	return true
end

function LuaI_113210()	-- 協助蛇人的傢伙
	SetPlot( OwnerID() , "range" , "LuaS_113210_Range" , 150 )
end

function LuaS_113210_Range()
	if CheckAcceptQuest( OwnerID() , 422436 ) == true and CheckFlag( OwnerID() , 542891 ) == false then
		local Sorelton = CreateObjByFlag( 102326 , 780391 , 1 , 1 )
		AddToPartition( Sorelton , 0 )
		DW_MoveToFlag( Sorelton , 780391 , 2 , 0 )
		Sleep( 5 )
		SetPosByFlag( Sorelton , 780391 , 2 )
		Sleep( 5 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422436_01]" , C_SYSTEM )	-- 你發現[102326]從蛇人將軍的營帳中出來！！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422436_01]" , 0 )
		SetFlag( OwnerID() , 542891 , 1 )
		Say( Sorelton , "[SC_422436_02]" )	-- 侵入者，死吧！死了就不會說出秘密了！
		SetAttack( Sorelton , OwnerID() )
		BeginPlot( Sorelton , "LuaS_113210_LivingTime" , 0 )
	end
end

function LuaS_113210_LivingTime()
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			DelObj( OwnerID() )
			break;
		end
		Sleep( 20 )
	end
end

function LuaS_422418_CHECK()
	if ( CheckAcceptQuest( OwnerID() , 422418 ) == false ) or ( CheckCompleteQuest( OwnerID() , 422418 ) == true ) then
		-- No Quest
		return false
	elseif ( CountBodyItem( OwnerID() , 205248 ) < 1 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422418_01]" , C_DEFAULT )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422418_01]" , 0 )	-- 你身上沒有[205248]！
		return false
	else
		return true
	end
end

function LuaS_422418_DO()
	if DelBodyItem( OwnerID() , 205248 , 1 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422418_02]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422418_02]" , 0 )	-- 你取得[113212]的力量！
	end
	return true
end

function LuaS_422419_CHECK()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	-- 113213 土元素圖騰
	-- 113214 水元素圖騰
	-- 113215 火元素圖騰
	if ( CheckAcceptQuest( OwnerID() , 422419 ) == false ) or ( CheckCompleteQuest( OwnerID() , 422419 ) == true ) then
		-- No Quest
		return false
	elseif ( CountBodyItem( OwnerID() , 205250 ) >= 1 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422419_08]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422419_08]" , 0 )	-- 你已經取得所有元素圖騰的力量！
		return false
	elseif ( CountBodyItem( OwnerID() , 205249 ) < 1 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422419_01]" , C_DEFAULT )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422419_01]" , 0 )	-- 你身上沒有[205249]！
		return false
	elseif ( OrgID == 113213 ) and ( CheckFlag( OwnerID() , 542898 ) == true ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422419_02]" , C_DEFAULT )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422419_02]" , 0 )	-- 你已經取得[113213]的力量！
		return false
	elseif ( OrgID == 113214 ) and ( CheckFlag( OwnerID() , 542899 ) == true ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422419_03]" , C_DEFAULT )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422419_03]" , 0 )	-- 你已經取得[113214]的力量！
		return false
	elseif ( OrgID == 113215 ) and ( CheckFlag( OwnerID() , 542900 ) == true ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422419_04]" , C_DEFAULT )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422419_04]" , 0 )	-- 你已經取得[113215]的力量！
		return false
	else
		return true
	end
end

function LuaS_422419_DO()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )

	if ( OrgID == 113213 ) and ( CheckFlag( OwnerID() , 542898 ) == false ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422419_05]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422419_05]" , 0 )	-- 你取得[113213]的力量！
		SetFlag( OwnerID() , 542898 , 1 )
	elseif ( OrgID == 113214 ) and ( CheckFlag( OwnerID() , 542899 ) == false ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422419_06]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422419_06]" , 0 )	-- 你取得[113214]的力量！
		SetFlag( OwnerID() , 542899 , 1 )
	elseif ( OrgID == 113215 ) and ( CheckFlag( OwnerID() , 542900 ) == false ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422419_07]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422419_07]" , 0 )	-- 你取得[113215]的力量！
		SetFlag( OwnerID() , 542900 , 1 )
	else
		--
	end

	if CheckFlag( OwnerID() , 542898 ) == true and CheckFlag( OwnerID() , 542899 ) == true and CheckFlag( OwnerID() , 542900 ) == true then
		if DelBodyItem( OwnerID() , 205249 , 1 ) then
			GiveBodyItem( OwnerID() , 205250 , 1 )
		end
	end

	return true
end

function LuaI_113173()
	local Soldier = {}
	local Soldier_ID = 113216
	local Flag_Start = 8
	for i = 1 , 4 do
		Soldier[i] = Lua_DW_CreateObj( "flag" , Soldier_ID , 780392 , i+Flag_Start )
		SetModeEx( Soldier[i] , EM_SetModeType_Strikback , true )--反擊
		SetModeEx( Soldier[i] , EM_SetModeType_Searchenemy , true )--索敵
		SetModeEx( Soldier[i] , EM_SetModeType_ShowRoleHead , true )--頭像框
		SetModeEx( Soldier[i] , EM_SetModeType_Fight , true )--可砍殺攻擊
		--Say( OwnerID() , "Soldier[i] = "..Soldier[i] )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+i , Soldier[i] )
	end
	SetPlot( OwnerID() , "dead" , "LuaS_113173_Dead" , 0 )
end

function 	LuaS_113173_Dead()
	local Soldier = {}
	for i = 1 , 4 do
		Soldier[i] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+i )
		--Say( Soldier[i] , i )	-- 測試訊息
		if CheckID( Soldier[i] ) == true then DelObj( Soldier[i] ) end
	end
	return true
end

function LuaS_422431_War()

	local Snake = {}
	local Soldier = {}
	local Snake_S_ID = 102206	-- 妖蛇衛兵
	local Snake_L_ID = 102207	-- 蛇人衛士
	local Snake_G_ID = 102346	-- 蛇人營長
	local Snake_Num = 6		-- 三隻小兵 + 三隻小兵

	CloseSpeak( OwnerID() )
	MoveToFlagEnabled( OwnerID() , false )	-- 關閉巡邏劇情
	DisableQuest( OwnerID() , true )		-- 開關NPC頭上的任務提示以及對話劇情
	--ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422419_07]" , 0 )	-- 你取得[113215]的力量！
	Sleep( 5 )
	SetRoleCamp( OwnerID() , "SNPC" )
	for i = 1 , 4 do
		Soldier[i] = ReadRoleValue( OwnerID() , EM_RoleValue_Register+i )
		SetRoleCamp( Soldier[i] , "SNPC" )
		--Say( Soldier[i] , i )	-- 測試訊息
	end

	Snake[1] = Lua_DW_CreateObj( "flag" , Snake_G_ID , 780392 , 1 )
	SetPlot( Snake[1] , "dead" , "LuaS_422431_Snake_Dead" , 0 )
	BeginPlot( Snake[1] , "LuaS_Discowood_CheckPeace" , 0 )
	for i = 2 , Snake_Num , 2 do
		Snake[i] = Lua_DW_CreateObj( "flag" , Snake_S_ID , 780392 , i )
		BeginPlot( Snake[i] , "LuaS_Discowood_CheckPeace" , 0 )
		Snake[i+1] = Lua_DW_CreateObj( "flag" , Snake_L_ID  , 780392 , i+1 )
		BeginPlot( Snake[i+1] , "LuaS_Discowood_CheckPeace" , 0 )
	end

	for i = 1 , 7 do
		SetAttack( Snake[i] , OwnerID() )	-- 打贏就打副隊長
		Sleep( 1 )
	end
	for j = 1 , 4 do
		SetAttack( Soldier[j] , Snake[1] )	-- 打贏就打蛇人營長
		Sleep( 1 )
	end

	SetAttack( Snake[1] , TargetID() )	-- 讓玩家進入隊長的仇恨表

	SetAttack( Snake[1] , Soldier[3] )
	SetAttack( Snake[1] , Soldier[4] )
	SetAttack( Snake[2] , Soldier[1] )
	SetAttack( Snake[3] , Soldier[2] )
	SetAttack( Snake[4] , Soldier[3] )
	SetAttack( Snake[5] , Soldier[4] )
	SetAttack( Snake[6] , Soldier[1] )
	SetAttack( Snake[7] , Soldier[2] )

	SetAttack( OwnerID() , Snake[2] )
	SetAttack( Soldier[1] , Snake[2] )
	SetAttack( Soldier[2] , Snake[3] )
	SetAttack( Soldier[3] , Snake[4] )
	SetAttack( Soldier[4] , Snake[5] )


	while ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode) == 1 do
		Sleep( 10 )
	end
	
	for i = 1 , 4 do
		if CheckID( Soldier[i] ) == true then DelObj( Soldier[i] ) end
	end
	MoveToFlagEnabled( OwnerID() , true )	-- 打開巡邏劇情
	DisableQuest( OwnerID() , false )	-- 打開NPC頭上的任務提示以及對話劇情
	LuaFunc_ResetObj( OwnerID() )
	return true

end

function LuaS_422431_Snake_Dead()
	local Player 
	for i = 0 , HateListCount( OwnerID() ) - 1 do
		Player = HateListInfo( OwnerID() , i , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( Player , 422431 ) then
			SetFlag( Player , 542892 , 1 )
		end	
	end	
	return true
end