function ADS_Boss104822_SkillA()
	Sleep(450)
	DelObj(OwnerID())
end

function ADS_Boss104822_SkillB(Boss,SkillBGroup,SkillBID)
	local TempID
	local TempPlayer

	TempID = Lua_DW_CreateObj( "obj" , SkillBID , Boss , 1 , 1)
	table.insert (SkillBGroup,TempID)
	TempPlayer = Lua_RandomPlayerFromHateList(Boss,1) 
	SysCastSpellLv ( TempPlayer[1],TempID, 496266 , 0 )
	SetModeEx( TempID  , EM_SetModeType_Fight , false )--可砍殺攻擊
	return SkillBGroup
end

function ADS_Boss104822_Die()
	local NPCGroup= SearchRangeNPC ( OwnerID() , 600 )
	for i=0,table.getn(NPCGroup) do
		if ReadRoleValue( NPCGroup[i], EM_RoleValue_OrgID  ) == 105042 or ReadRoleValue( NPCGroup[i], EM_RoleValue_OrgID  ) == 104923 then
			DelObj(NPCGroup[i])
		end
	end
end

function ADS_Boss104822()
	local Boss = OwnerID()
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID)
	local TempPlayer = {}
	local TempGroup = {}
	local TempID
	local Timer = 0
	local MonsterGroup = {}

	local SkillA = 508019
	local SkillAID = 105042
	local SkillBID = 104923
	local SkillBGroup = {}
	local SkillBMAXHP = ReadRoleValue(  Boss , EM_RoleValue_MaxHP ) 
	local SkillBNOWHP = ReadRoleValue(  Boss , EM_RoleValue_HP )
	local SkillBHP80 = SkillBMAXHP*0.8
	local SkillBHP50 = SkillBMAXHP*0.5
	local SkillBHP20 = SkillBMAXHP*0.2
	local SkillBHPtable = {SkillBHP20,SkillBHP50,SkillBHP80}
	local ADS_HARD = -1
	
	local TimerSkillA
	local TimerSkillB
--	local TimerSkillC -- 第三個技能掛在模板

	SetPlot( OwnerID() , "dead" , "ADS_Boss104822_Die" , 0 )

	if CheckBuff(Boss,508010) == TRUE then
		ADS_HARD = FN_CountBuffLevel(Boss,508010)
		ADS_HARD = ADS_HARD+1
	else
		ADS_HARD = -1
	end

	while TRUE do
		if KS_InCombat(Boss)  == TRUE then  	-- 檢查是否離開戰鬥
			if ADS_HARD >= 0 then
				SkillBMAXHP = ReadRoleValue(  Boss , EM_RoleValue_MaxHP ) 
			end
			SkillBHP80 = SkillBMAXHP*0.8
			SkillBHP50 = SkillBMAXHP*0.5
			SkillBHP20 = SkillBMAXHP*0.2
			SkillBHPtable = {SkillBHP20,SkillBHP50,SkillBHP80}

			TimerSkillA=Timer%9
			TimerSkillB=Timer%25
			if TimerSkillA == 0 then
				--創造
				TempPlayer = Lua_RandomPlayerFromHateList(Boss,1) 
				TempID = Lua_DW_CreateObj( "obj" , SkillAID , TempPlayer[1] , 0 , 1)
				SetModeEx( TempID  , EM_SetModeType_HideName, false )--名稱
				SetModeEX( TempID  , EM_SetModeType_Gravity , false )--重力
				SetModeEx( TempID  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
				SetModeEx( TempID  , EM_SetModeType_Mark, false )--標記
				SetModeEx( TempID  , EM_SetModeType_Move, false )--移動
				SetModeEx( TempID  , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx( TempID  , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( TempID  , EM_SetModeType_Strikback, false )--反擊	
				table.insert (MonsterGroup,TempID)
				AddToPartition( TempID , RoomID )
				--動作
				AddBuff(TempID,SkillA,0,-1)
				BeginPlot( TempID, "ADS_Boss104822_SkillA", 0 )
			end
			--
			SkillBNOWHP = ReadRoleValue(  Boss , EM_RoleValue_HP ) 
			for i=1,3 do
				if SkillBNOWHP < SkillBHPtable[i] then
					if table.getn(SkillBGroup) < (2*(4-i)) then
						SkillBGroup = ADS_Boss104822_SkillB(Boss,SkillBGroup,SkillBID)
					end
					break
				end
			end
			--
			if TimerSkillB == 0 then
				for i=1,table.getn(SkillBGroup) do
					TempPlayer = Lua_RandomPlayerFromHateList(Boss,1) 
					SysCastSpellLv ( TempPlayer[1],SkillBGroup[i], 496266 , 0 )
				end
			end
		else
			Timer = 0
			for i=1,table.getn(MonsterGroup) do
				DelObj(MonsterGroup[i])
				table.remove(MonsterGroup,i)
			end
			for j=1,table.getn(SkillBGroup) do
				DelObj(SkillBGroup[j])
				table.remove(SkillBGroup,j)
			end
		end
		--
		Sleep(10)
		Timer = Timer + 1
	end
end