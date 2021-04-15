function ADS_Boss104826_SkillC()
	local Boss = OwnerID()
	local PlayerA = ReadRoleValue(Boss,EM_RoleValue_Register8)
	local PlayerB = ReadRoleValue(Boss,EM_RoleValue_Register9)
	local SkillC = 508158

	while TRUE do
		if ReadRoleValue(PlayerA,EM_RoleValue_IsDead) ==0 and ReadRoleValue(PlayerB,EM_RoleValue_IsDead) ==0 then
			if GetDistance (PlayerA,PlayerB) <= 20 then
				CancelBuff(PlayerA,SkillC)
				CancelBuff(PlayerB,SkillC)
				WriteRoleValue(Boss,EM_RoleValue_Register10,0)
				return
			end
		else
			CancelBuff(PlayerA,SkillC)
			CancelBuff(PlayerB,SkillC)
			WriteRoleValue(Boss,EM_RoleValue_Register10,0)
			return
		end
		--
		Sleep(10)
	end
end

function ADS_Boss104826_Die()
	local NPCGroup= SearchRangeNPC ( OwnerID() , 600 )
	for i=0,table.getn(NPCGroup) do
		if ReadRoleValue( NPCGroup[i], EM_RoleValue_OrgID  ) == 104925 then
			DelObj(NPCGroup[i])
		end
	end
end

function ADS_Boss104826()
	local Boss = OwnerID()
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local ADS_HARD = 0
	local TempPlayer = {}
	local TempID
	local Timer = 0

	local SkillA = 496266
	local SkillAID = 104925
	local SkillAUnit
	local SkillB = 508019
	local SkillBID = 105044
	local SkillBGroup = {}
	local SkillC = 508158
	local SkillD = 496266
	local SkillDTarget
	
	local TimerSkillA
	local TimerSkillB
	local TimerSkillC
	local TimerSkillD = 0

	SetPlot( OwnerID() , "dead" , "ADS_Boss104826_Die" , 0 )

	if CheckBuff(Boss,508010) == TRUE then
		ADS_HARD = FN_CountBuffLevel(Boss,508010)
	end

	while TRUE do
		if KS_InCombat(Boss) == TRUE then  	-- 檢查是否離開戰鬥

			if Timer == 1 then
				SkillAUnit = Lua_DW_CreateObj( "obj" , SkillAID , Boss , 1 , 1)
				SetModeEx( SkillAUnit  , EM_SetModeType_Fight , false )--可砍殺攻擊
				WriteRoleValue(SkillAUnit,EM_RoleValue_Register10,Boss)
				AddBuff(SkillAUnit,508159,0,-1)
				--
				if ADS_HARD >= 1 then AddBuff(SkillAUnit,508011,ADS_HARD,-1) end
				--
				TempPlayer = Lua_RandomPlayerFromHateList(Boss,1)
				SysCastSpellLv ( TempPlayer[1], SkillAUnit, SkillA , 1 )
			end

			TimerSkillA=Timer%10
			TimerSkillB=Timer%15
			TimerSkillC=Timer%16
			TimerSkillD=Timer%20

			if TimerSkillA == 0 then	-- 定時改變惡夢精魂的目標
				CancelBuff(SkillAUnit,508172)
				TempPlayer = Lua_RandomPlayerFromHateList(Boss,1)
				SysCastSpellLv ( TempPlayer[1], SkillAUnit, SkillA , 0 )
				SetAttack(SkillAUnit,TempPlayer[1])
			end
			if TimerSkillB == 0 then
				--創造
				TempPlayer = Lua_RandomPlayerFromHateList(Boss,1) 
				TempID = Lua_DW_CreateObj( "obj" , SkillBID , TempPlayer[1] , 0 , 1)
				SetModeEx( TempID  , EM_SetModeType_HideName, false )--名稱
				SetModeEX( TempID  , EM_SetModeType_Gravity , false )--重力
				SetModeEx( TempID  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
				SetModeEx( TempID  , EM_SetModeType_Mark, false )--標記
				SetModeEx( TempID  , EM_SetModeType_Move, false )--移動
				SetModeEx( TempID  , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( TempID  , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( TempID  , EM_SetModeType_Strikback, false )--反擊	
				table.insert (SkillBGroup,TempID)
				AddToPartition( TempID , RoomID )
				--動作
				AddBuff(TempID,SkillB,0,-1)
				FN_SetLifeTime(TempID,450)
			end
			if TimerSkillC == 0 then
				if ReadRoleValue(Boss,EM_RoleValue_Register10) == 0 then
					WriteRoleValue(Boss,EM_RoleValue_Register10,1)
					--
					TempPlayer = Lua_RandomPlayerFromHateList(Boss,2) 
					for l=1,table.getn(TempPlayer) do
						AddBuff(TempPlayer[l],SkillC,ADS_HARD,-1)
						if l == 1 then
							WriteRoleValue(Boss,EM_RoleValue_Register8,TempPlayer[l])
							BeginPlot(Boss,"ADS_Boss104826_SkillC",0)
						elseif l == 2 then
							WriteRoleValue(Boss,EM_RoleValue_Register9,TempPlayer[l])
						end
					end
				end
			end

			if Timer >= 20 then
				if TimerSkillD == 0 then
					SkillDTarget = Lua_RandomPlayerFromHateList(Boss,1)
					--ScriptMessage( Boss, SkillDTarget[1], 1, "u r target!", C_SYSTEM )
					SetModeEx( Boss  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( Boss  , EM_SetModeType_Move, false )--移動
					Sleep(30)
					SetModeEx( Boss  , EM_SetModeType_Strikback, TRUE )--反擊
					SetModeEx( Boss  , EM_SetModeType_Move, TRUE )--移動
				elseif CheckBuff(SkillDTarget[1],508239) == TRUE then
					SkillDTarget = Lua_RandomPlayerFromHateList(Boss,1)
					ScriptMessage( Boss, SkillDTarget[1], 1, "u r target!", C_SYSTEM )
					SetModeEx( Boss  , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( Boss  , EM_SetModeType_Move, false )--移動
					Sleep(30)
					SetModeEx( Boss  , EM_SetModeType_Strikback, TRUE )--反擊
					SetModeEx( Boss  , EM_SetModeType_Move, TRUE )--移動
				end
				CancelBuff(Boss,508172)
				SysCastSpellLv ( SkillDTarget[1], Boss, SkillD , 0 )
				SetAttack(Boss,SkillDTarget[1])
			end


--			if TimerSkillD == 0 then
--				SkillDTarget = Lua_RandomPlayerFromHateList(Boss,1)
--				CancelBuff(Boss,508172)
--				SysCastSpellLv ( SkillDTarget[1], Boss, SkillD , 0 )
--				SetAttack(Boss,SkillDTarget[1])
--				ScriptMessage( Boss, SkillDTarget[1], 1, "u r target!", C_SYSTEM )
--			elseif Timer > 20 then
--				CancelBuff(Boss,508172)
--				SysCastSpellLv ( SkillDTarget[1], Boss, SkillD , 0 )
--			end
		else
			Timer = 0
			DelObj(SkillAUnit)
			for y=1,table.getn(SkillBGroup) do
				DelObj(SkillBGroup[y])
			end
			CancelBuff(Boss,508172)
		end
		--
		Sleep(10)
		Timer = Timer + 1
	end
end