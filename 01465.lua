-----------------------------------------------------------------------------------------------------------------------------------自然之力
function lua_star_Skill_NatureEnergy(Minus , Plus)		------請填有自然之力才會發動的基本法術	(基本法術Script檢查)	1. Minus: 發動此技能要扣的自然之力數量	2.Plus: 發動此技能增加的自然之力數量
	local Nature = 503827	----------------自然之力
	local FreePower = 503817	--------大地融合	
	if Checkbuff( OwnerID() , FreePower ) == false then				------沒開大地融合
		if Checkbuff( OwnerID() , Nature ) == true then			--------身上有自然之力
			local Pos = Lua_BuffPosSearch( OwnerID() , Nature )	
			local PLV = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )	
			local NowCount = PLV+1
			
			if NowCount >= Minus then			-------自然之力數量夠					
				return true
			else								--------自然之力數量不夠				
				return false
			end	
		else							--------身上沒有自然之力				
			return false
		end
	else								--------開了大地融合		
		return true
	end	
end

function lua_star_Skill_NonNature(Count)	-------請填自然之力數量夠就不會發動的基本法術 (基本法術Script檢查) 		1.  Count : 此技能所需的自然之力數量
	local Nature = 503827	----------------自然之力
	local FreePower = 503817	--------大地融合
	if Checkbuff( OwnerID() , FreePower ) == false then
		if Checkbuff( OwnerID() , Nature ) == true then
			local Pos = Lua_BuffPosSearch( OwnerID() , Nature )	
			local NowCount = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )+1
			if NowCount < Count then	
				return true
			end
			return false
		else
			return true
		end	
	else
		return false
	end	
end

function lua_star_Skill_CheckNature(Count)		-------一定要有自然之力才能使用的法術 (法術集合Script檢查)	1.  Count : 此技能所需的自然之力數量
	local Nature = 503827		----------------自然之力
	local FreePower = 503817	--------大地融合
	if Checkbuff( OwnerID() , FreePower ) == false then
		if Checkbuff( OwnerID() , Nature ) == true then
			local Pos = Lua_BuffPosSearch( OwnerID() , Nature )	
			local NowCount = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )+1
			if NowCount < Count then	
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_7]" , 1 )
				return false
			else
				return true
			end					
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_7]" , 1 )
			return false
		end
	else
		return true
	end
end

function lua_star_Skill_AddNature(Plus)
	local Nature = 503827		----------------自然之力
	if Checkbuff( OwnerID() , Nature ) == false then	--------身上沒有自然之力
		AddBuff( OwnerID() , Nature , Plus-1 , -1 )
		return true
	else
		local Pos = Lua_BuffPosSearch( OwnerID() , Nature )
		local PLV = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )
		if PLV+Plus < 10 then
			CancelBuff( OwnerID() , Nature )			
			AddBuff( OwnerID() , Nature , PLV+Plus , -1 )
		end	
		return true
	end	
end
---------------------------------------------------------自然神官 落石術
function lua_Dy_fallingrocks()
	local Pos = Lua_BuffPosSearch( OwnerID() , 503823 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	local PLV = BuffInfo( BuffOwner , Pos , EM_BuffInfoType_Power )			 -------------------------此法術的等級
	local PLevel = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+8 )
	SysCastSpellLv	( BuffOwner, OwnerID(), 493554 , PLevel ) 					 ----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
	CancelBuff(OwnerID() , 503823)
end
function lua_Dy_fallingrocks_2()
	local Pos = Lua_BuffPosSearch( OwnerID() , 503823 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	local PLV = BuffInfo( BuffOwner , Pos , EM_BuffInfoType_Power )			 -------------------------此法術的等級
	local PLevel = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+8 )
	SysCastSpellLv( BuffOwner, OwnerID(), 494065 , PLevel )				 ----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
	--sleep(5)
	--SysCastSpellLv( BuffOwner, OwnerID(), 494065 , PLevel+5) 	
	CancelBuff(OwnerID() , 503823)
end
---落石術65後替換
function Dy_fallingrocks_65()
	local Pos = Lua_BuffPosSearch( OwnerID() , 503823 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	local PLV = BuffInfo( BuffOwner , Pos , EM_BuffInfoType_Power )			 -------------------------此法術的等級
	local PLevel = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+8 )
	SysCastSpellLv	( BuffOwner, OwnerID(), 497819 , PLevel ) 					 ----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
	CancelBuff(OwnerID() , 503823)
end
function Dy_fallingrocks_65_2()
	local Pos = Lua_BuffPosSearch( OwnerID() , 503823 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	local PLV = BuffInfo( BuffOwner , Pos , EM_BuffInfoType_Power )			 -------------------------此法術的等級
	local PLevel = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+8 )
	SysCastSpellLv( BuffOwner, OwnerID(), 497826 , PLevel )				 ----------------------------施放法術 (放法術的人 , 法術目標 , 法術編號 , 法術等級)
	CancelBuff(OwnerID() , 503823)
end
---------------------------------------------------------------------------------------------------------------------------------------------心靈導正	
function lua_star_Skill_Addict()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 0 then	
		local TargetCamp = ReadRoleValue( TargetID() , EM_RoleValue_CampID )
		WriteRoleValue( TargetID() , EM_RoleValue_Register7 , TargetCamp )	--把NPC原本的陣營紀錄至Register7
		SetRoleCamp( TargetID() , "Good" )		
	end
end

function lua_star_Skill_UnAddict()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 0 then		
		local TargetCamp = ReadRoleValue( TargetID() , EM_RoleValue_Register7 )
		--SetRoleCamp( TargetID() , "Monster" )		
		SetRoleCampID( TargetID() , TargetCamp )
	end
end

function lua_star_Skill_IsHuman()
	local MobDBID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MobSex = GameObjInfo_Int( MobDBID , "Sex" )
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 
		or MobSex >= 3 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_14]" , 1 )
		return false
	else
		return true
	end	
end
-----------------------------------------------------------------------------------------------------------------------------------新版自然之力
function lua_star_Skill_NatureBase(Minus , Plus)		------	1. Minus: 發動此技能要扣的自然之力數量	2.Plus: 發動此技能增加的自然之力數量
	local Nature = 503827	----------------自然之力
	local FreePower = 503817	--------大地融合	
	
	local NatureMaxUp = 0		-------自然之力上限增加數量
	local DS45_Flag = 543146	-------神遊45精英
	
	if CheckFlag(OwnerID() , DS45_Flag) == true then
		if ReadRoleValue(OwnerID() , EM_RoleValue_VOC) == 8 and 
			ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB) == 2 then
			NatureMaxUp = 5
		end	
	end
	if Checkbuff( OwnerID() , FreePower ) == false then				------沒開大地融合
		if Checkbuff( OwnerID() , Nature ) == true then			--------身上有自然之力
			local Pos = Lua_BuffPosSearch( OwnerID() , Nature )	
			local PLV = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )	
			local NowCount = PLV+1
			if Minus > 0 then	-------有扣自然之力
				if NowCount >= Minus then			-------自然之力數量夠					
					if (NowCount-Minus+Plus) < (11+NatureMaxUp) then
						CancelBuff( OwnerID() , Nature )				
						for i=1 , NowCount-Minus+Plus do		
							AddBuff( OwnerID() , Nature , 0 , -1 )
						end
					else
						CancelBuff( OwnerID() , Nature )				
						for i=1 , (10+NatureMaxUp) do		
							AddBuff( OwnerID() , Nature , 0 , -1 )
						end
					end									
				end	
			elseif Minus == 0 then  	---------純加自然之力
				if NowCount+Plus < (11+NatureMaxUp) then
					for i=1 , Plus do
						AddBuff( OwnerID() , Nature , 0 , -1 )
					end
				else				
					CancelBuff( OwnerID() , Nature )
					for i=1 , (10+NatureMaxUp) do
						AddBuff( OwnerID() , Nature , 0 , -1 )
					end	
				end	
			end	
		else							--------身上沒有自然之力
			if Plus ~= 0 then
				for i=1 , Plus do
					AddBuff( OwnerID() , Nature , 0 , -1 )
				end						
			end					
		end
	else								--------開了大地融合
		if Plus ~= 0 then
			if Checkbuff( OwnerID() , Nature ) == true then		
				local Pos = Lua_BuffPosSearch( OwnerID() , Nature )	
				local PLV = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )	
				local NowCount = PLV+1
				
				if NowCount+Plus < (11+NatureMaxUp) then						
					for i=1 , Plus do		
						AddBuff( OwnerID() , Nature , 0 , -1 )	
					end
				else	
					CancelBuff( OwnerID() , Nature )
					for i=1 , (10+NatureMaxUp) do
						AddBuff( OwnerID() , Nature , 0 , -1 )
					end	
				end					
			else					
				for i=1 , Plus do
					AddBuff( OwnerID() , Nature , 0 , -1 )
				end					
			end	
		end
	end	
end-----------------------------------------法神25 掌控火炎
function lua_Dy_HoldFire()
	if CheckBuff( OwnerID() , 504869 ) == false then
		AddBuff( OwnerID() ,504563 ,0 ,20 )
		return true
	elseif CheckBuff( OwnerID() , 504869 ) == true then
		AddBuff( OwnerID() ,504563 ,0 ,0 )
		return true
	end
end
---------------------------------------------------------------------------------------------神戰25 十字荊棘打擊
function lua_Dy_CrossHit()
	SysCastSpellLv	( OwnerID(), OwnerID(), 493603 , 0 )
end
-----------------------------------------神森15 強化荊棘盾 
function lua_Dy_Bramble_ManaBackCD(BuffID)
	if CheckBuff( OwnerID() , BuffID ) == true then		
		return false
	else
		AddBuff( OwnerID() ,504870 ,0 ,8 )
		return true
	end
end	
function lua_Dy_RoseCD(BuffID)
	if CheckBuff( TargetID() , BuffID ) == true then		
		return false
	else
		AddBuff( TargetID(),504712 ,0 ,8 )
		return true
	end
end
---------------------------------------------神法Lv30 靈感
function lua_Dy_inspiration()
	ReCalculate(OwnerID() )
	AddBuff( OwnerID() , 504863 , 0 , 10)
	--say (OwnerID(), "submit")
end
--------------------------------------------------法神 LV30 新綠守護
function lua_Dy_GreenProtect()
	local Pos = Lua_BuffPosSearch( OwnerID() , 504899 )                      ---------------------抓出身上的法術代號
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------抓出此法術是誰放的
	local PLevel = ReadRoleValue( BuffOwner , EM_RoleValue_MagicPowerLv_SP+71 )   -------------------------此法術的等級
	if CheckBuff( OwnerID() , 504878) == false then
		if CheckBuff( OwnerID() , 509793) == true then
			CancelBuff(OwnerID() , 509793) --刪除降物理傷害的
		else
		end
	end
	AddBuff( OwnerID() , 504874 ,PLevel ,10)
	AddBuff( OwnerID() , 620188 , 0 ,10)
	CancelBuff(OwnerID() , 504899) --刪除檢查用的Buff
end
--------------------------------------------------法神 LV30 新綠守護
function lua_Dy_GreenProtectCheck()
	AddBuff( TargetID() , 504899 ,0 ,15)
	return true
end
------------------------------------------------------------------------------------------------------------------------------------------------戰神30 過失彌補
function lua_Dy_MissAtk(Condition)	
	--if Condition == 0 or Condition == 10 then
		local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+68 )      
		AddBuff( OwnerID() , 504893 , PLevel , 1)	
	--end	
end
---------------------------------------------神法Lv40 滾燙巨石_地屬性攻擊回魔
function lua_Dy_HotRockBackMana(Condition)
	if Condition == 1 then
		local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+72 ) 
		SysCastSpellLv( OwnerID(),  OwnerID(), 494578 , PLevel ) 
		--say (OwnerID(), "mana")
	end
end
-----------------------------------------------------------------------遊神40級
function star_skill_SD40()
	local MND = ReadRoleValue( OwnerID() ,EM_RoleValue_FinMnd )
	--Say(OwnerID() , MND)
	local AtkBuff = 504908
	if ReadRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse9) ~= MND then
		local Pos = Lua_BuffPosSearch( OwnerID() , AtkBuff )
		local AtkTime = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Time )
		AddBuff( OwnerID() , AtkBuff , math.floor(MND*0.5) , AtkTime )
	end	
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse9 , MND )
end

function star_skill_SD40_1()
	local MND = ReadRoleValue( OwnerID() ,EM_RoleValue_FinMnd )
	local AtkBuff = 504908
	AddBuff( OwnerID() , AtkBuff , math.floor(MND*0.5) , -1 )
end
--------------------------------------------------神法 LV40 急速救援
function lua_Dy_HurryHeal()
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+14)
	if CheckBuff( OwnerID() , 509794) == false then
		if CheckBuff( OwnerID() , 505183) == true then
			CancelBuff(OwnerID() , 505183) --刪除降物理傷害的
		else
		end
	end
	SysCastSpellLv( OwnerID(), OwnerID(), 494580 , PLevel ) 
end
-----------------------------------------------神戰45 
function lua_Dy_WW45()
local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SubJob+0 ) 
	if CheckBuff( OwnerID() , 505733) == true then
		return false
	else	
		AddBuff( OwnerID() , 505732 ,PLevel ,15)
		return true
	end
end
-------------------------------------------戰神45抵禦
function lua_Dy_ProtectSelf()
	AddBuff( OwnerID() , 505714 , 0 ,30)
end
function lua_Dy_ProtectSelfDEL() ------------當反守為攻消失時清除掉抵禦觸發用的空Buff
	CancelBuff( OwnerID() , 505714 )
end
---------------------------------------------------------------------------------------------------------------------神戰50 蘊育
function star_skill_DW50()
	local HealSpell = 494978
	--local NaturePluSpell = 
	local RealBuff = 505704
	local TriggerBuff = 505898
	local RefuseBuff = 505899
	
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
	local HPPercent =( NowHP / MaxHP)*100
	
	local Pos = Lua_BuffPosSearch( OwnerID() , RealBuff )
	local BuffOwner = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_OwnerID)
	if CheckBuff(OwnerID() , RealBuff) == true then
		if HPPercent <= 40 and CheckBuff(OwnerID() , RefuseBuff) == false then
			SysCastSpellLv( BuffOwner , OwnerID() , HealSpell , 0 )	
			AddBuff( OwnerID() , RefuseBuff , 0 , -1 )
			AddBuff( OwnerID() , TriggerBuff , 0 , -1 )
		else
			AddBuff( OwnerID() , TriggerBuff , 0 , -1 )
		end
	end	
end
---------------------------------------------------------------------------------------------------------------------神森45 森靈恩典
function star_skill_DWD45()
	local Nature = 503827	----------------自然之力
	local BonusBuff = 505711
	if CheckBuff(OwnerID() , Nature) == true then
		AddBuff( OwnerID() , BonusBuff , 0 , -1 )
	end
end

--------------------------------------------------------------------------------------------------------------------戰神50 壓制
function star_skill_WD50_1(Condition)
	local SuppressBuff = 505906
	--local TriggerBuff = 505907   ------被攻擊消失
	local FakeBuff = 505957
	if Condition == 1 or Condition == 2 then
		if CheckBuff(TargetID() , SuppressBuff) == false and
		 CheckBuff(TargetID() , FakeBuff) == false then
			AddBuff(TargetID() , SuppressBuff , 9 , -1)	
			AddBuff(TargetID() , FakeBuff , 0 , -1)
		end	
	end	
end

function star_skill_WD50_1_delay()		-----Fake結束觸發
	local TriggerBuff = 505907   ------被攻擊消失
	AddBuff(OwnerID() , TriggerBuff , 0 , -1)
end

function star_skill_WD50_2()	------buff消失觸發
	local SuppressBuff = 505906
	local TriggerBuff = 505907   ------被攻擊消失
	if CheckBuff(OwnerID() , SuppressBuff) == true then
		local Pos = Lua_BuffPosSearch( OwnerID() , SuppressBuff )
		local PLV = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Power)
		local Time = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Time)
		CancelBuff(OwnerID() , SuppressBuff)
		if PLV > 0 then 			
			AddBuff(OwnerID() , SuppressBuff , PLV-1 , Time)	
			AddBuff(OwnerID() , TriggerBuff , 0 , -1)
		end		
	end
end
--------------------------------------------------------------------------------------------------------------------神影50 晦暗之月  
function star_skill_DR50_check()
	if TargetID() ~= OwnerID() then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----技能目標錯誤
		return false
	end
end

function star_skill_DR50()
	local MoonBuff = 505911
	local MoonPowerBuff = 505912
	local Pos = Lua_BuffPosSearch( OwnerID() , MoonBuff )
	local BuffOwner = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_OwnerID)
	if GetDistance( OwnerID() , BuffOwner ) < 500 then
		if ReadRoleValue(OwnerID() , EM_RoleValue_CritialState) == 1 or
			ReadRoleValue(OwnerID() , EM_RoleValue_MagicCritialState) == 1 then
			AddBuff(BuffOwner , MoonPowerBuff , 0 , -1)
		end
	end	
end

function star_skill_DR50_2()	-----避免連續觸發用的CD
	local RefuseBuff = 505956
	AddBuff(OwnerID() , RefuseBuff , 0 , -1)
end
--------------------------------------------------------------------------------------------------------------------神法50 盛夏饗宴  
function star_skill_DM50_check()
	if TargetID() ~= OwnerID() then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )	-----技能目標錯誤
		return false
	end
end

function star_skill_DM50()
	local SummerBuff = 505909
	local SummerPowerBuff = 505910
	local Pos = Lua_BuffPosSearch( OwnerID() , SummerBuff )
	local BuffOwner = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_OwnerID)
	if GetDistance( OwnerID() , BuffOwner ) < 500 then
		if ReadRoleValue(OwnerID() , EM_RoleValue_ParryState) == 1 then
			AddBuff(BuffOwner , SummerPowerBuff , 0 , -1)
		end
	end	
end
--------------------------------------------------------------------------------------------------------------------法神50 精靈秘法
function star_skill_MD50()
	local TriggerBuff = 505913
	local EnergyBuff = 505914
	local ChargeBuff = 505915
	local BurstSpellBuff = 505916
	if CheckBuff(OwnerID() , EnergyBuff) == true then
		AddBuff(OwnerID() , TriggerBuff , 0 , -1)
		local Pos = Lua_BuffPosSearch( OwnerID() , ChargeBuff )
		local PLV = BuffInfo(OwnerID() , Pos , EM_BuffInfoType_Power)
		--Say(OwnerID() , PLV)	
		if PLV < 4 then	
			AddBuff(OwnerID() , ChargeBuff , 0 , -1)
		elseif	PLV == 4 then
			AddBuff(OwnerID() , BurstSpellBuff , 0 , -1)
			CancelBuff(OwnerID() , ChargeBuff)
		end	
	end
end
function star_skill_MD50_2()
	CancelBuff(OwnerID() , 505916)
	return true
end
---------------------------------------------------------------------------------------------------------------------影神50 迅光護身
function star_skill_RD50()
	local TeamateNumber = GetPartyID( OwnerID(), -1 )	
	local LowestHp = 0
	local LowestHpPlayer = 0
	local HealSpell = 495073
	if TeamateNumber == 0 then
		LowestHpPlayer = OwnerID()			 -------表示自己沒有隊伍
	elseif TeamateNumber ~= 0 then	
		local NearbyPlayer = SearchRangePlayer ( OwnerID() , 60 )
		for i=0 , table.getn(NearbyPlayer)-1 do					
			local IsInParty = 0
			for j=1 , TeamateNumber do
				--Say(OwnerID() , "Party="..GetName(GetPartyID( OwnerID(), j )))
				if NearbyPlayer[i] == GetPartyID( OwnerID(), j ) then 					
					IsInParty = 1
				end
			end
			if IsInParty == 1 then
				local MaxHP = ReadRoleValue( NearbyPlayer[i] , EM_RoleValue_MaxHP )
				local NowHP = ReadRoleValue( NearbyPlayer[i] , EM_RoleValue_HP )
				local HPPercent =( NowHP / MaxHP)*100
				if LowestHp == 0 then
					LowestHp = HPPercent
					LowestHpPlayer = NearbyPlayer[i]
				elseif LowestHp ~= 0 then
					if HPPercent < LowestHp then
						LowestHp = HPPercent
						LowestHpPlayer = NearbyPlayer[i]
					end
				end			
			end	
			--Say(OwnerID() , "LowestHpPlayer="..GetName(LowestHpPlayer))
			--Say(OwnerID() , "TeamateNumber="..TeamateNumber )
		end
	end	
	if LowestHpPlayer ~= 0 then
		SysCastSpellLv( OwnerID() , LowestHpPlayer , HealSpell , 0 )	
	end	
end
---------------------------------------------------------------------------------------------------------------------神森50 生命之靈
function star_skill_DWD50()
	local SpiritID = 103160
	local Order = 63			------此技能在主職技能列表的位置
	local SpiritEffectBuff = 505938		------生命之靈特效
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Spirit = star_CreateObj_NoAdd( OwnerID() , SpiritID , 0 , 0 , 0 , Room , 0)
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+Order )
	SetModeEx( Spirit , EM_SetModeType_Move , false )			------不移動
	SetModeEx( Spirit , EM_SetModeType_Strikback , false )	------不反擊
	SetModeEx( Spirit , EM_SetModeType_Fight , false )		------不可砍殺
	SetModeEx( Spirit , EM_SetModeType_Searchenemy , false )	------不索敵		
	SetModeEx( Spirit , EM_SetModeType_Mark , false )			------不可點選	(只要關這個就可以不跑出血條)
	SetModeEx( Spirit , EM_SetModeType_NotShowHPMP , false )	------不show血條
	--SetModeEx( Spirit , EM_SetModeType_HideName , false ) 		-------不顯示名稱
	AddToPartition( Spirit , Room )
	AddBuff(Spirit , SpiritEffectBuff , 0 , -1)
	WriteRoleValue( Spirit , EM_RoleValue_Livetime , 40)
	WriteRoleValue( Spirit , EM_RoleValue_register1 , PLevel)
	BeginPlot( Spirit , "star_skill_DWD50_2" , 0 )
	--Setplot( Spirit , "range" , "star_skill_DWD50_2" , 80)	
end

function star_skill_DWD50_2()
	local PLV = ReadRoleValue( OwnerID() , EM_RoleValue_register1)
	local Counter = 0
	while 1 do
		sleep(10)
		Counter = Counter+1
		if Counter == 4 then	
			CastSpellLV( OwnerID() , OwnerID() , 495064 , PLV )
			Counter = 0
		end	
		--Setplot( OwnerID() , "range" , "star_skill_DWD50_2" , 80)
	end	
end	
--------------------------神森 生命之靈修正版 2012.04.26
function Dy_skill_DWD50_2()
	local OwnerID = OwnerID()
	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+63 )
	local Counter = 0
	sysCastSpelllv ( OwnerID , OwnerID , 494067 , 0 )  ----自己對自己施放一個法術(表演用)
	while 1 do
		sleep(10)
		Counter = Counter+1
		if Counter == 4 then	
			SysCastSpellLv_Pos( Master , Obj_X , Obj_Y , Obj_Z , 495064 , powerLV )
			Counter = 0
		end	
	end	
end
-------------------------------------------戰神15 玫瑰藤蔓
function lua_Dy_RoseLine()	
local PLevel = ReadRoleValue( OwnerID(),  EM_RoleValue_MagicPowerLv_SP+65 )   -------------------------此法術的等級
	SysCastSpellLv( OwnerID(), TargetID(), 494069 , PLevel ) 
end	
---------------------------------------------清除法術用
function  un_skillcheck_cancel()     --清除buff技能用的，新增的法術填再下面兩個table
			--物理buff
	local skilltable1 = {501802,--戰法   危機意識
						503802, --大地屏障
						503826, --大地屏障
						503813, --岩石防護
						501901} --遊祭   仇恨引導
			--魔法buff					
	local skilltable2 = {509772,
						509795,
						509796,
						509797,
						509801} 
	local own = OwnerID()
	for i=1 , table.getn(skilltable1) do
		if checkbuff(Own,skilltable1[i])== false then
			if checkbuff(Own,skilltable2[i]) ==true then
				CancelBuff_NoEvent( Own, skilltable2[i] ) 
			end
		else 
			if checkbuff(Own,skilltable2[i]) ==false then
				CancelBuff_NoEvent( Own, skilltable1[i] ) 
			end
		end
	end
end	

----------------------------------------------------射手祝佑
function lua_un_skilldel()
	local own = OwnerID()
	if checkbuff(Own,509805) ==true then
		CancelBuff_NoEvent( Own, 509805 )
	end
	if checkbuff(Own,509806) ==true then
		CancelBuff_NoEvent( Own, 509806 )
	end
	if checkbuff(Own,505683) ==true then
		CancelBuff( Own, 505683 )
	end
end
function lua_Dy_MD50Check2()	
	if CheckBuff( OwnerID() , 505683 ) == true or 
	CheckBuff( TargetID() , 505683 ) == true or
	CheckBuff( OwnerID() , 505718 ) == true then		
		return false
	else
		if CheckBuff( OwnerID() , 505683 ) == false or
			CheckBuff( OwnerID() , 509805 ) == false then
			return true
		end
	end
end
			