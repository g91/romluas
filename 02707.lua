function CL_JOB1_2_LV60_CalmDown()	---戰鬥專注擊中給予SP效果
	AddBuff( OwnerID() , 622988 , 0 , 1 )	
end
function CL_JOB1_2_LV60_CheckBuff() ---戰鬥專注禁制CD效果
	if CheckBuff ( OwnerID() , 622989 ) == true or
		CheckBuff ( OwnerID() , 620365 ) == true then
		return false
	else
		return true
	end
end
function Cl_JOB1_4_LV60_FireAndWin_WP() --炙雷武器
	local OwnerID = OwnerID()
	local Fire_powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+38 )
	local Win_powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+37 )
	Addbuff ( OwnerID , 622959 , Fire_powerLV , -1 )	--熔岩武器buff
	Addbuff ( OwnerID , 620350 , Fire_powerLV , -1 )	--熔岩武器爆擊效果
	Addbuff ( OwnerID , 622958 , Win_powerLV , -1 )	--電氣衝擊buff
	Addbuff ( OwnerID , 620349 , Win_powerLV , -1 )	--電器衝擊物理命中效果
end
function Cl_JOB1_4_LV60_CancelBuff() --炙雷武器取消
	local OwnerID = OwnerID()	
	CancelBuff_NoEvent( OwnerID , 622996 )	--刪除炙雷武器buff
	CancelBuff_NoEvent( OwnerID , 622959 )	--刪除熔岩武器隱藏buff效果
	CancelBuff_NoEvent( OwnerID , 620350 )	--刪除熔岩武器的爆擊效果效果
	CancelBuff_NoEvent( OwnerID , 622958 )	--刪除電氣衝擊隱藏buff效果
	CancelBuff_NoEvent( OwnerID , 620349 )	--刪除電氣衝擊的物理命中效果
end
function Cl_Job_WM_45_FireAndWin_WP()
	local OwnerID = OwnerID()
	if CheckBuff ( OwnerID , 622996 ) == true then
		ScriptMessage( OwnerID , OwnerID , 1 , "[SC_LV60_SKILL_WM_WP]" , 1 )
		return false
	else
		return true
	end
end
function Cl_JOB1_5_BloodRoaring()  --血性戰嚎
	local OwnerID = OwnerID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+101 )
	Addbuff ( OwnerID , 622956 , powerLV , 15 )
end
function Cl_JOB1_8_Heal_Decapitate()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SubJob+0 )
	--say ( OwnerID , "powerLV="..powerLV)
	sysCastSpelllv ( OwnerID , OwnerID , 499883 , powerLV )  ----自己對自己施放一個法術(表演用)
end
function Cl_JOB1_8_Check_HealBuff()
	if CheckBuff ( OwnerID() , 623340 ) ~= true and
		CheckBuff ( OwnerID() , 503797 ) ~= true then
		--say ( OwnerID() , "true")
		return true
	else
		--say ( OwnerID() , "false")
		return false
	end
end
function Cl_JOB1_10_LV70_CheckBuff()
	if CheckBuff ( OwnerID() , 623014 ) ~= true then
	   --say ( OwnerID() , "true")
		return true
	else
		--say ( OwnerID() , "false")
		return false
	end
end
function Cl_JOB_SW_LV60_Springshot()
	if Cl_ReadRoleNowHp( TargetID() ) <= 30 then
		--say ( TargetID() , "true")
		return true
	else
		--say ( TargetID() , "false")
		return false
	end
end
function Cl_SW_LV70_CheckSkill(Buff_Num,Value_1,Value_UP1,Value_2,Value_UP2,SkillSP) ---檢查施放法術----讀取BUFF施展者計算強制CD時間
	local OwnerID = OwnerID()
	local BUFF = Lua_BuffPosSearch( OwnerID, Buff_Num )
	local BUFFID = BuffInfo( OwnerID , BUFF , EM_BuffInfoType_OwnerID )---讀取技能等級
	local powerLV = ReadRoleValue( BUFFID , EM_RoleValue_MagicPowerLv_SP+SkillSP )
	local SkillLV = Value_1 + ( Value_1 * Value_UP1 * powerLV )
	local AllSkillLV = Value_2 +( Value_2 * Value_UP2 * powerLV )
	local SkillID = ReadRoleValue ( OwnerID , EM_RoleValue_SpellMagicID )
	local Type  = GameObjInfo_Int( SkillID, "ColdownType" )
	DebugMsg( 0 , 0 , "Type="..Type.."   powerLV="..powerLV )
	DebugMsg( 0 , 0 , "SkillLV="..SkillLV.."   AllSkillLV="..AllSkillLV )
	CallPlot( BUFFID , "Cl_SW_LV70_SetColdown" , OwnerID , Type , SkillLV , AllSkillLV )
end
function Cl_SW_LV70_SetColdown(TargetID,Type,SkillLV,AllSkillLV) --呼叫強制CD
	local OwnerID = OwnerID()
	sleep ( 3 )
	if Type == 0 or Type == nil then
		WriteRoleValue( TargetID, EM_RoleValue_Coldown_All , AllSkillLV )
	else
		local Now = ReadRoleValue( TargetID, EM_RoleValue_Coldown_Job + Type  )
		DebugMsg( 0 , 0 , "Now="..Now.."   Now+SkillLV="..SkillLV + Now )
		WriteRoleValue( TargetID, EM_RoleValue_Coldown_Job + Type , SkillLV + Now ) 
	end
end
function Cl_JOB_SW_LV70_CancelCheckSkill() ---效果結束需清除BUFF
	local OwnerID = OwnerID() 
	CancelBuff_NoEvent( OwnerID , 623046 )
end
function Cl_JObSW_LV70_CheckBuff() ----將同一法術覆蓋過去避免重複觸發
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff ( TargetID , 623046 ) ~= true then
		sysCastSpelllv ( OwnerID , TargetID , 499527 , 0 )  ----自己對自己施放一個法術(表演用)
	else
		CancelBuff_NoEvent( OwnerID , 623046 )
		sysCastSpelllv ( OwnerID , TargetID , 499527 , 0 )  ----自己對自己施放一個法術(表演用)
	end
end
function Cl_SM_Lv60_DriveWin()--馭風之杖
	local OwnerID = OwnerID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+83 )
	sysCastSpelllv ( OwnerID , TargetID() , 499541 , powerLV )  ----自己對自己施放一個法術(表演用)
end
function Cl_SM_Lv70_ForWinHide() ---隨風而逝
	local OwnerID = OwnerID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+84 )
	sysCastSpelllv ( OwnerID , OwnerID , 499551 , powerLV )  ----自己對自己施放一個法術(表演用)
	--Addbuff (  OwnerID , 623070 , powerLV , -1 ) ---便ADD狂暴BUFF給BOSS
end
function Cl_SM_Lv60_Fire_Energy_Shot() --烈火能量射擊
	local OwnerID = OwnerID()
	local TargetID = TargetID()
--	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SubJob+0 )	--吃副職火球術等級
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+32 )		--吃主職烈火能量等級
	sysCastSpelllv ( OwnerID , TargetID , 490204 , powerLV )  ----自己對自己施放一個法術(表演用)
end
function Cl_SP_Lv60_Magic_Reversal() --魔力逆轉
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Tar_X , Tar_Y , Tar_Z = Cl_Read_OwnerXYZ(OwnerID)
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+85 )
	SysCastSpellLv_Pos( OwnerID , Tar_X , Tar_Y , Tar_Z , 499554 , powerLV )
end
function Cl_SK_Lv60_heal_Shot()
	local OwnerID = OwnerID()
	local PartyNum = GetPartyID( OwnerID , -1 )
	DebugMsg( 0 , 0 , "PartyNum="..PartyNum )
	local High_HP
	local Low_HP
	local Player
	local PlayID
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+48 )
	if PartyNum ~= 0 then
		for i = 1 , PartyNum , 1 do
			Player = GetPartyID( OwnerID , i )
			Low_HP = Cl_ReadRoleNowHp( Player )
			--say ( Player , "Low_HP="..Low_HP )
			if High_HP == nil then
				High_HP = Low_HP
				PlayID = Player
				--say ( PlayID , "Nil_High_HP="..High_HP )
			elseif High_HP ~= nil then
				if Low_HP ~= 0 then	--如果當前隊友已死亡則不判斷
					if High_HP > Low_HP then
						High_HP = Low_HP
						PlayID = Player
						--say ( PlayID , "High_HP="..High_HP )
					end
				end
				--say ( OwnerID , "High_HP < Low_HP" )
			end
		end
		--say ( OwnerID , "PlayID="..GetName( PlayID ) )
		sysCastSpelllv ( OwnerID , PlayID , 499559 , powerLV )  ----自己對自己施放一個法術(表演用)
	else
		sysCastSpelllv ( OwnerID , OwnerID , 499559 , powerLV )  ----自己對自己施放一個法術(表演用)
	end
end
function Cl_SK_Lv60_Magic_Regain()
	local OwnerID = OwnerID()
	Addbuff ( OwnerID , 623098 , 0 , -1 )
	return true
end
function Cl_SK_Lv60_Check_CriHit()
	local OwnerID = OwnerID()
	CancelBuff_NoEvent( OwnerID , 623098 )
end
function Cl_SK_Lv60_Cancel_CriHit()
	local OwnerID = OwnerID()
	CancelBuff_NoEvent( OwnerID , 623099 )
end
function Cl_SK_Lv70_MagicChange_War()
	local TargetID = TargetID()
	local JOB = ReadRoleValue( TargetID , EM_RoleValue_VOC )
	local SUBJOB = ReadRoleValue( TargetID , EM_RoleValue_VOC_SUB )
	if JOB == 1 or JOB == 10 or SUBJOB == 1 or SUBJOB == 10 then
		return true
	else
		return false
	end
end
function Cl_SK_Lv70_MagicChange_Focus()
	local TargetID = TargetID()
	local JOB = ReadRoleValue( TargetID , EM_RoleValue_VOC )
	local SUBJOB = ReadRoleValue( TargetID , EM_RoleValue_VOC_SUB )
	if JOB == 2 or JOB == 9 or SUBJOB == 2 or SUBJOB == 9 then
		return true
	else
		return false
	end
end
function Cl_SK_Lv70_MagicChange_Energy()
	local TargetID = TargetID()
	local JOB = ReadRoleValue( TargetID , EM_RoleValue_VOC )
	local SUBJOB = ReadRoleValue( TargetID , EM_RoleValue_VOC_SUB )
	if JOB == 3 or SUBJOB == 3 then
		return true
	else
		return false
	end
end
function Cl_SWD_Lv70_Sniper()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+90 )
	sysCastSpelllv ( OwnerID , TargetID , 499577 , powerLV )  ----自己對自己施放一個法術(表演用)
end

function Cl_SP_Lv50_Hate_change()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+86 )
	sysCastSpelllv ( OwnerID , OwnerID , 499557 , powerLV )  ----自己對自己施放一個法術(表演用)
	sysCastSpelllv ( TargetID , OwnerID , 499579 , 0 )  ----自己對自己施放一個法術(表演用)
end
function Cl_SP_Lv50_HateShot()
	local OwnerID = OwnerID()
	local BUFF = Lua_BuffPosSearch( OwnerID, 623122 )
	local BUFFID = BuffInfo( OwnerID , BUFF , EM_BuffInfoType_OwnerID )---讀取技能等級
	local MagicTargetID = ReadRoleValue( OwnerID , EM_RoleValue_LastAttackOwnerID )
	if BUFFID == MagicTargetID then
		local Magic_Num = ReadRoleValue( OwnerID , EM_RoleValue_LastAttackDamage )
		CallPlot( BUFFID , "Cl_SP_Lv70_NewHateShot" , BUFFID , Magic_Num , OwnerID  )
	end
end
function Cl_SP_Lv70_NewHateShot( OwnerID , Magic_Num , MonsterID )
	local BUFF = Lua_BuffPosSearch( OwnerID, 623121 )
	local BUFFID = BuffInfo( OwnerID , BUFF , EM_BuffInfoType_OwnerID )---讀取技能等級
	local hate = 0
	local hateTargetID , hateID = cl_Sp_Readhatelist( MonsterID , BUFFID )
	if hateTargetID ~= nil then
		hate = hateTargetID - Magic_Num
	else
		hate = 0 - Magic_Num
	end
	SetHateListPoint( MonsterID , hateID , hate )
	SetAttack( MonsterID , BUFFID )  ----避免BOSS離開戰鬥要將當前目標給BOSS
end
function Cl_Sp_Lv70_CheckHateBuff()
	if CheckBuff ( TargetID() , 623122 ) ~= true then
		Addbuff ( OwnerID() , 623139 , 0 , 10 )
		return true
	else
		return false
	end
end
function cl_Sp_Readhatelist( TargetGID , OwnerID ) ---->嘲諷技能讀取仇恨表以及仇恨表位置---
	local hate_table = HateListCount( TargetGID )
	local TempHate = nil
	local hateID = nil
	local TempGID = 0
	for i=0 , hate_table-1 do
		TempGID = HateListInfo( TargetGID , i , EM_HateListInfoType_GItemID )
		if TempGID == OwnerID then
			TempHate = HateListInfo( TargetGID , i , EM_HateListInfoType_HatePoint )
			hateID = i
		end
	end
	if hateID == nil then
		hateID = hate_table
	end
	return TempHate , hateID
end
function Cl_SD_Ancestor_Protect()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_IsPlayer ) ~=  1 then
		CallPlot( TargetID , "Cl_SD_Ancestor_HateBuff" , OwnerID  )
	end
end
function Cl_SD_Ancestor_HateBuff(PlayerID)
	local OwnerID = OwnerID()
	local Hate_Table = Lua_HateListPos( -1 )
	local Hate_Num = table.getn(Hate_Table)
	if Hate_Num > 1 then
		local TargetID = HateListInfo( OwnerID , Hate_Table[2] , EM_HateListInfoType_GItemID )
		if TargetID ~= nil then
			sysCastSpelllv ( PlayerID , TargetID , 499586 , 0 )  ----自己對自己施放一個法術(表演用)
		else
			--say ( OwnerID , "nil")
		end
	end
end
function Cl_SD_Lv60_Eat_Blood_Shot(Lv)
	local OwnerID = OwnerID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+Lv )
--	say ( OwnerID , "powerLV="..powerLV)
	sysCastSpelllv ( OwnerID , OwnerID , 499593 , powerLV )  ----自己對自己施放一個法術(表演用)
end
function Cl_KM_Lv45_ThunderArmor()
	local OwnerID = OwnerID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+48 )
	Addbuff (  OwnerID , 503294 , powerLV , -1 ) ---便ADD狂暴BUFF給BOSS
end
function Cl_DelSkillKeyItem60and70()
	local OwnerID = OwnerID()
	local KeyFlag = 546730
	for i = 1 ,  1000 , 1 do
		if KeyFlag <= 546862 then
			--SetScriptFlag( OwnerID, KeyFlag , 0 )  
			DelBodyItem( OwnerID, KeyFlag , 1 )
			KeyFlag = KeyFlag + 1
		elseif KeyFlag > 546862 then
			return
		end
	end
end
function Cl_JOBSD_LV70_CheckBuff()
	local OwnerID = OwnerID()
	if CheckBuff ( OwnerID , 623172 ) ~= true and
		CheckBuff ( OwnerID , 505718 ) ~= true and
		CheckBuff ( OwnerID , 623174 ) ~= true then
		return true
	else
		return false
	end
end