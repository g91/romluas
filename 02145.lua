function ADS_Boss104823_SkillA()
	local Boss = OwnerID()
	local BossMaxHP = ReadRoleValue(  Boss , EM_RoleValue_MaxHP )
	local BossAddHP = BossMaxHP*0.01
	local BossNowHP = ReadRoleValue(  Boss , EM_RoleValue_HP )
	local Distance
	local SkillA = 508023
	local SkillATarget = ReadRoleValue(Boss,EM_RoleValue_Register1)
	Sleep(25)
	while TRUE do
		BossNowHP = ReadRoleValue(  Boss , EM_RoleValue_HP )
		Distance = GetDistance( Boss, SkillATarget )
		if Distance <= 150 then
			if CheckBuff(SkillATarget,SkillA) == TRUE then
				BossNowHP = BossNowHP + BossAddHP
				WriteRoleValue(Boss,EM_RoleValue_HP,BossNowHP)
			else
				return
			end
		else
			CancelBuff(SkillATarget,SkillA)
			return
		end
		--
		Sleep(10)
	end
end

function ADS_Boss104823()
	local Boss = OwnerID()
	local ADS_HARD = 0
	local TempPlayer = {}
	local TempID
	local Timer = 0
	local MonsterGroup = {}
	local HateTable = {}

	local SkillA = 508023
	local SkillATarget = {}
	local SkillAString
	local SkillB = 508020
	
	local TimerSkillA
--	local TimerSkillB -- 第二個技能掛在模板
--	local TimerSkillC -- 第三個技能掛在模板

	if CheckBuff(Boss,508010) == TRUE then
		ADS_HARD = FN_CountBuffLevel(Boss,508010)
	end

	while TRUE do
		if KS_InCombat(Boss) == TRUE then  	-- 檢查是否離開戰鬥
			local Hate = KS_GetHateList( Boss, 1 )
			TimerSkillA=Timer%13
			if TimerSkillA == 0 then
				if SkillATarget[1] ~= nil then
					if CheckBuff(SkillATarget[1],SkillA) == TRUE then
						local HP = ReadRoleValue(SkillATarget[1],EM_RoleValue_HP)
						CancelBuff(SkillATarget[1],SkillA)
						if ReadRoleValue(SkillATarget[1],EM_RoleValue_HP) > HP*0.05 then
							WriteRoleValue(SkillATarget[1],EM_RoleValue_HP,HP*0.05)
						end
						SkillATarget[1] = nil
						Sleep(10)
					end
				end
				--
				SkillATarget = Lua_RandomPlayerFromHateList(Boss,1,"TRUE") 
				ks_RandRangeSetPos( SkillATarget[1], Hate[1], nil , 1 )
				AddBuff(SkillATarget[1],SkillA,ADS_HARD,-1)	--不良狀態給予
				WriteRoleValue(Boss,EM_RoleValue_Register1,SkillATarget[1])	--記錄玩家到Boss身上
				BeginPlot(Boss, "ADS_Boss104823_SkillA", 0 )
			end
		else
			Timer = 0
			CancelBuff(Boss,SkillB)
		end
		--
		Sleep(10)
		Timer = Timer + 1
	end
end