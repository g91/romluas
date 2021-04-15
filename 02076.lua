
function ADS_Boss104821_SkillA()	--SkillA的怪物
	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	CancelBuff(PlayerID,508013)
end

function ADS_Boss104821_SkillD()	--SkillD的怪物
	local BossID = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )

	while TRUE do
		CastSpell( OwnerID(),BossID, 496451 )
		--
		Sleep(20)
	end
end

function ADS_Boss104821()
	local Boss = OwnerID()
	local ADS_HARD = 0
	local TempPlayer = {}
	local TempID
	local Timer = 0
	local MonsterGroup = {}
	local HealGroup = {}

	local SkillA = 496448
	local SkillA2 = 508013
	local SkillAID = 104921
	local SkillB = 496449
	local SkillB2 = 496450
	local SkillC = 508015
	local SkillD = 496451
	local SkillDID = 104922
	
	local TimerSkillA
	local TimerSkillB
	local TimerSkillC
	local TimerSkillD
	
	if CheckBuff(Boss,508010) == TRUE then
		ADS_HARD = FN_CountBuffLevel(Boss,508010)
	end

	SetPlot( OwnerID() , "dead" , "ADS_Boss104821_Die" , 0 )

	while TRUE do
		if  KS_InCombat(Boss)  == TRUE then  	-- 檢查是否離開戰鬥
			TimerSkillA=Timer%25
			TimerSkillB=Timer%13
			TimerSkillC=Timer%20
			TimerSkillD=Timer%55
			if TimerSkillA == 0 then
				--創造
				TempPlayer = Lua_RandomPlayerFromHateList(Boss,1)
				if CheckBuff(TempPlayer[1],SkillA2) == FALSE then
					AddBuff(TempPlayer[1],SkillA2,0,-1) --先把玩家定住
					--
					TempID = Lua_DW_CreateObj( "obj" , SkillAID , TempPlayer[1] , 1 , 1)
					SetModeEx( TempID , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( TempID , EM_SetModeType_Move, false )--移動
					table.insert (MonsterGroup,TempID)
					--動作
					SysCastSpellLv ( TempPlayer[1], TempID, 496266 , 0 ) --讓碎片鎖定目標
					AddBuff(TempID,502707,0,-1)	--不回血
					WriteRoleValue(TempID,EM_RoleValue_Register1,TempPlayer[1])
					SetPlot( TempID, "dead","ADS_Boss104821_SkillA", 0 )
				end
			end
			--
			if TimerSkillB == 0 then
				TempPlayer = Lua_RandomPlayerFromHateList(Boss,1) 
				CastSpell( Boss ,TempPlayer[1], SkillB )
				SysCastSpellLv ( Boss, TempPlayer[1], SkillB2 , 1 )				
			end
			--
			if TimerSkillC == 0 then
				AddBuff(Boss,SkillC,0,-1)
			end
			--
			if TimerSkillD == 0 then
				for h=1,table.getn(HealGroup) do
					if HealGroup[h]~=nil and CheckID(HealGroup[h]) == FALSE then
						table.remove(HealGroup,h)
					end
				end
				--創造
				if table.getn(HealGroup) <= 20 then
					TempPlayer = Lua_RandomPlayerFromHateList(Boss,1) 
					TempID = Lua_DW_CreateObj( "obj" , SkillDID , TempPlayer[1] , 1 , 1)
					SetModeEx( TempID , EM_SetModeType_Strikback, false )
					SetModeEx( TempID , EM_SetModeType_Move, false )--反擊
					table.insert (HealGroup,TempID)
					if CheckBuff(Boss,508010) == TRUE then
						AddBuff(TempID,508011,ADS_HARD,-1)	--強化小怪Buff
					end
					--動作
					CastSpell( TempID ,Boss  , SkillD )
					AddBuff(TempID,502707,0,-1)	--不回血
					WriteRoleValue(TempID,EM_RoleValue_Register1,Boss)
					BeginPlot( TempID, "ADS_Boss104821_SkillD", 0 )
				end
			end
		else
			Timer = 0
			for i=1,table.getn(MonsterGroup) do
				if MonsterGroup[i] ~= nil then
					DelObj(MonsterGroup[i])
					table.remove(MonsterGroup,i)
				end
			end
			for j=1,table.getn(HealGroup) do
				if MonsterGroup[j] ~= nil then
					DelObj(HealGroup[j])
					table.remove(HealGroup,j)
				end
			end
			CancelBuff(Boss,SkillC)
		end
		--
		Sleep(10)
		Timer = Timer + 1
		if Timer%5 == 0 then
		end
	end
end

function ADS_Boss104821_Die()
	local NPCGroup= SearchRangeNPC ( OwnerID() , 600 )
	for i=0,table.getn(NPCGroup) do
		if ReadRoleValue( NPCGroup[i], EM_RoleValue_OrgID  ) == 104921 or ReadRoleValue( NPCGroup[i], EM_RoleValue_OrgID  ) == 104922 then
			if NPCGroup[i]~=nil then
				DelObj(NPCGroup[i])
			end
		end
	end
end