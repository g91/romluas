function ADS_Boss104824_SkillA()
	local Boss = OwnerID()
	local Monster = 104924
	local MonsterGroup = {}
	local SkillA = 502921
	local TempPlayer
	local ADS_HARD = 0
	if CheckBuff(Boss,508010) == TRUE then
		ADS_HARD = FN_CountBuffLevel(Boss,508010)
	end
	--
	AddBuff(Boss,SkillA,0,-1)
	SetModeEx( Boss  , EM_SetModeType_Move, false )--移動
	for i=1,2 do
		MonsterGroup[i] = Lua_DW_CreateObj( "obj" , Monster , Boss , 1 , 1)
		SetPlot(MonsterGroup[i],"dead","ADS_Boss104824_SkillA_Del",0)
		--
		TempPlayer = Lua_RandomPlayerFromHateList(Boss,1) 
		SetAttack(MonsterGroup[i],TempPlayer[1])
		--
		if CheckBuff(Boss,508010) == TRUE then AddBuff(MonsterGroup[i],508011,ADS_HARD,-1) end
	end
	--
	while TRUE do
		if table.getn(MonsterGroup) == 0 then
			WriteRoleValue(Boss,EM_RoleValue_Register1,1)	--寫為1表示離開無敵狀態，戰鬥中
			CancelBuff(Boss,SkillA)
			SetModeEx( Boss  , EM_SetModeType_Move, TRUE )--移動
			return
		end

		for j=1,table.getn(MonsterGroup) do
			if ReadRoleValue(Boss,EM_RoleValue_Register1) == 0 then
				DelObj(MonsterGroup[j])
			end
			if MonsterGroup[j] ~= nil and CheckID(MonsterGroup[j]) == FALSE then
				table.remove (MonsterGroup,j)
			end
		end
		--
		sleep(10)
	end
end

function ADS_Boss104824_SkillA_Del()
	DelObj(OwnerID())
end


function ADS_Boss104824()
	local Boss = OwnerID()
	local TempPlayer = {}
	local TempID
	local Timer = 0
	local BossMaxHP = ReadRoleValue(  Boss , EM_RoleValue_MaxHP )
	local BossNowHP = ReadRoleValue(  Boss , EM_RoleValue_HP )
	local BossHP75 = BossMaxHP*0.75
	local BossHP50 = BossMaxHP*0.5
	local BossHP25 = BossMaxHP*0.25
	local BossHPTable = {BossHP25,BossHP50,BossHP75}
	local ADS_HARD = -1

	--local SkillA
	local SkillAString
	local SkillB = 496458
	local SkillC = 508026
	local SkillC2 = 508027
	
--	local TimerSkillA
	local TimerSkillB
	local TimerSkillC

	if CheckBuff(Boss,508010) == TRUE then
		ADS_HARD = FN_CountBuffLevel(Boss,508010)
		ADS_HARD = ADS_HARD+1
	else
		ADS_HARD = -1
	end





	while TRUE do
		if KS_InCombat(Boss) == TRUE then  	-- 檢查是否離開戰鬥
			if ADS_HARD >= 0 then
				BossMaxHP = ReadRoleValue(  Boss , EM_RoleValue_MaxHP )
			end
			BossHP75 = BossMaxHP*0.75
			BossHP50 = BossMaxHP*0.5
			BossHP25 = BossMaxHP*0.25
			if table.getn(BossHPTable) == 3 then
				BossHPTable = {BossHP25,BossHP50,BossHP75}
			elseif table.getn(BossHPTable) == 2 then
				BossHPTable = {BossHP25,BossHP50}
			elseif table.getn(BossHPTable) == 2 then
				BossHPTable = {BossHP25}
			end

			TimerSkillB=Timer%8
			TimerSkillC=Timer%16
--			TimerSkillD=Timer%14
			BossNowHP = ReadRoleValue(  Boss , EM_RoleValue_HP )
			if Timer == 1 then WriteRoleValue(Boss,EM_RoleValue_Register1,1) end--寫為1表示進入戰鬥中
			if ReadRoleValue(Boss,EM_RoleValue_Register1) == 1 then
				for i=1,table.getn(BossHPTable) do
					if BossNowHP < BossHPTable[i] then
						BeginPlot(Boss,"ADS_Boss104824_SkillA",0)
						WriteRoleValue(Boss,EM_RoleValue_Register1,2)	--寫為2表示進入無敵狀態中
						table.remove(BossHPTable,i)
						break
					end
				end
			end
			--
			if TimerSkillB == 0 then
				local SkillTimes = 0
				local TempPlayerGroup = KS_GetHateListRange( Boss )
				for i=1,table.getn(TempPlayerGroup) do
					SkillTimes = SkillTimes+1
					SysCastSpellLv ( Boss, TempPlayerGroup[i], SkillB , 1 )
					if SkillTimes == 2 then break end
				end
			end
			--
			if TimerSkillC == 0 then
				TempPlayer = Lua_RandomPlayerFromHateList(Boss,3,"TRUE") 
				for i = 1,table.getn(TempPlayer) do
					local TempInt = Rand(2)
					if TempInt == 0 then
						AddBuff(TempPlayer[i],SkillC,0,5)
					else
						AddBuff(TempPlayer[i],SkillC2,0,5)
					end
				end
			end
		else
			WriteRoleValue(Boss,EM_RoleValue_Register1,0) --寫為0表示離開戰鬥
			BossHPTable = {BossHP25,BossHP50,BossHP75}
			Timer = 0
		end
		--
		Sleep(10)
		Timer = Timer + 1
	end
end