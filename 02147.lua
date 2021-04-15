function ADS_Boss104825_SkillCcast()
	
	CancelBuff(TargetID(),508153)
end

function ADS_Boss104825_SkillD()
	local Boss = OwnerID()
	local TimesCount = 0
	local ADS_HARD = 0

	if CheckBuff(Boss,508010) == TRUE then
		ADS_HARD = FN_CountBuffLevel(Boss,508010)
	end
	
	while true do
		if TimesCount == 15 then
			return
		else
			local TempID = KS_CreateObjMode(115690,Boss,nil,175,1,1)
			SetModeEx( TempID  , EM_SetModeType_HideName, false )--名稱
			SetModeEX( TempID  , EM_SetModeType_Gravity , false )--重力
			SetModeEx( TempID  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			SetModeEx( TempID  , EM_SetModeType_Mark, false )--標記
			SetModeEx( TempID  , EM_SetModeType_Move, false )--移動
			SetModeEx( TempID  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( TempID  , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( TempID  , EM_SetModeType_Strikback, false )--反擊	
			AddBuff(TempID,508011,ADS_HARD,-1)
			--
			BeginPlot(TempID,"ADS_Boss104825_SkillD_Cast",0)
			--
			Sleep(3)
			TimesCount = TimesCount + 1
		end
	end
end

function ADS_Boss104825_SkillD_Cast()
	local TempID
	local HideCaster = 105043
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)

	TempID = Lua_DW_CreateObj( "obj" , HideCaster , OwnerID() , 0 , 1)
	Sleep(30)
	SetModeEx( TempID  , EM_SetModeType_HideName, false )--名稱
	SetModeEX( TempID  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( TempID  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( TempID  , EM_SetModeType_Mark, false )--標記
	SetModeEx( TempID  , EM_SetModeType_Move, false )--移動
	SetModeEx( TempID  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( TempID  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( TempID  , EM_SetModeType_Strikback, false )--反擊
	AddToPartition( TempID , RoomID )
	--
	SysCastSpellLv(TempID,TempID,496464,0)
	ChangeObjID(OwnerID(),115692) --變換能量炸彈的外型成為能量裂隙 
	--
	CastSpell( TempID , TempID , 496463) --創造隱藏施法者施展AE傷害
	--
	FN_SetLifeTime(OwnerID(),65)
	FN_SetLifeTime(TempID,65)
end

function ADS_Boss104825()
	local Boss = OwnerID()
	local TempPlayer = {}
	local TempID
	local Timer = 0

	--local SkillA
	local SkillAString
	--local SkillB --沒有SkillB
	local SkillC = 508154
	
	--local TimerSkillA--掛在模板
	local TimerSkillC = 508154

	if CheckBuff(Boss,508010) == TRUE then
		ADS_HARD = FN_CountBuffLevel(Boss,508010)
	end

	while TRUE do
		if KS_InCombat(Boss) == TRUE then  	-- 檢查是否離開戰鬥
--			TimerSkillB=Timer%12
			TimerSkillC=Timer%25
			TimerSkillD=Timer%21
--			if TimerSkillB == 0 then
--				TempPlayer = Lua_RandomPlayerFromHateList(Boss,1)
--				CastSpell(Boss,TempPlayer[1],SkillB)
--			end
			--
			if TimerSkillC == 0 then
				TempPlayer = Lua_RandomPlayerFromHateList(Boss,1) 
				AddBuff(TempPlayer[1],SkillC,0,-1)
			end
			--
			if TimerSkillD == 0 then --能量炸彈
				BeginPlot(Boss,"ADS_Boss104825_SkillD",0)
			end
		else
			Timer = 0
		end
		--
		Sleep(10)
		Timer = Timer + 1
	end
end