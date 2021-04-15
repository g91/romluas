-----------------------------------------------------------------------------------------------------------------------------------------------麻醉飛刃檢查
function lua_star_Check_SleepDagger()
	local race = ReadRoleValue( TargetID() , EM_RoleValue_Race ) 
	local GetCheck = true
    if Race == 0 or Race == 1 or Race == 2 or Race == 3 then          -----人(及其他玩家種族)
		GetCheck = lua_star_PoisonBuffCheck( OwnerID() )
		return GetCheck
	elseif Race == 4  then	              -----生物
		GetCheck = lua_star_PoisonBuffCheck( OwnerID() )
		return GetCheck
	elseif Race == 6  then	              ----亞人
		GetCheck = lua_star_PoisonBuffCheck( OwnerID() )
		return GetCheck	
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_1]" , 1 )         --------------無法對此種種族使用!
		return false
	end	
end
------------------------------------------------------------------------------------------------------------------------------------------------毒藥Check(自己)
function lua_star_PoisonBuffCheck(GID)	
	if CheckBuff( GID , 500715 ) == true then		
		return true
	elseif CheckBuff( GID , 503179 ) == true then
		return true
	elseif CheckBuff( GID , 503175 ) == true then
		return true	
	elseif CheckBuff( GID , 620320 ) == true then
		return true
	elseif CheckBuff( GID , 621570 ) == true then
		return true
	else	
		ScriptMessage( GID , GID , 1 , "[SC_MAGICSTRING_2]" , 1 )         --------------你身上沒有任何毒藥狀態!
		return false
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------技能開關
function lua_star_SkillSwitch( BuffID )
	if CheckBuff( OwnerID() , BuffID ) == true then 
		CancelBuff( OwnerID() , BuffID )
		return false
	else
		return true
	end	
end
--------------------------------------------------------------------------------------------------------------------------------------------武器大師開關
function lua_star_WeaponMaster()
	return lua_star_SkillSwitch( 501921 )	
end
--------------------------------------------------------------------------------------------------------------------------------------------狂亂之力開關
function lua_star_FrenzyPower()
	return lua_star_SkillSwitch( 501796 )	
end
-----------------------------------------------------------------------------------------------------------------------------------------------神聖枷鎖檢查目標種族
function lua_star_RaceCheck_HolyChain()
	local race = ReadRoleValue( TargetID() , EM_RoleValue_Race ) 
   	 if Race == 5  then                    -----不死
		return true
	elseif Race == 12  then	              -----惡魔
		return true	
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_1]" , 1 )         --------------無法對此種種族使用!
		return false
	end	
end
-------------------------------------------------------------------------------------------------------------------------------------------------神聖枷鎖
function lua_star_HolyChain()
	lua_star_controlcheck( 502058 )
	return true
end
-------------------------------------------------------------------------------------------------------------------------------------------------生命鎖鏈
function lua_star_LifeChain()
	if TargetID() ~= OwnerID() then
		AddBuff( OwnerID() , 502032 , 0 , 3 )
		return true
	elseif TargetID() == OwnerID() then		
		return true		
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------冰凍住入PVP保護
function lua_star_FrozenArrow1()
	local IsMob = lua_star_Skill_ForMob()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then 
		return false
	else
		return IsMob
	end
end
function lua_star_FrozenArrow2()
	local IsPlayer = lua_star_Skill_ForPlayer()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then 
		return IsPlayer
	else
		return false
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------戰騎『英勇突擊』
function lua_star_HeroicCharge()
	CastSpell( OwnerID() , OwnerID() , 491655 )
end
------------------------------------------------------------------------------------------------------------------------------------------------漣漪護甲禁制
function lua_star_WaterShield()
	AddBuff( TargetID() , 500479 , 0 , 20 )
	return true
end
------------------------------------------------------------------------------------------------------------------------------------------------蛇女的誘惑
function lua_star_Medusa()
	AddBuff( TargetID() , 502906 , 0 , 5 )	
end
function lua_star_Medusa_ForMob()
	local IsMob = lua_star_Skill_ForMob()
	AddBuff( TargetID() , 502906 , 0 , 5 )	
	return IsMob
end
function lua_star_Medusa_ForPlayer()
	local IsPlayer = lua_star_Skill_ForPlayer()
	AddBuff( TargetID() , 503865 , 0 , 5 )	
end
------------------------------------------------------------------------------------------------------------------------------------------------格擋專家
function lua_star_ParryState()
	if ReadRoleValue( OwnerID() , EM_RoleValue_ParryState ) == 1 then
		--WriteRoleValue( OwnerID() , EM_RoleValue_ParryState , 0 )
		--Say(OwnerID() , ReadRoleValue( OwnerID() , EM_RoleValue_ParryState ) )
		if CheckBuff( OwnerID() , 503192 ) == true then
			AddBuff( OwnerID() , 503200 , 0 , 20 )
		else
			CancelBuff( OwnerID() , 503200 )
		end	
	end
end	
------------------------------------------------------------------------------------------------------------------------------------------------毒藥Check	
function lua_star_PoisonCheck(BuffID)	
	if CheckBuff( TargetID() , BuffID ) == true then		
		return false
	else
		return true
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------獵豹反應
function lua_star_DodgeState()
	--Say(OwnerID() , ReadRoleValue( OwnerID() , EM_RoleValue_DodgeState ) )
	if ReadRoleValue( OwnerID() , EM_RoleValue_DodgeState ) == 1 then		
		if CheckBuff( OwnerID() , 503202 ) == true then
			AddBuff( OwnerID() , 503203 , 0 , 20 )
		else
			CancelBuff( OwnerID() , 503203 )
		end	
	end
end	
------------------------------------------------------------------------------------------------------------------------------------------------內建CD Check(自己)
function lua_star_Self_Check(BuffID)	
	if CheckBuff( OwnerID() , BuffID ) == true then		
		return false
	else
		return true
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------內建CD Check(目標)
function lua_star_Target_Check(BuffID)	
	if CheckBuff( TargetID() , BuffID ) == true then		
		return false
	else
		return true
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------內建CD Check(寵物)
function lua_Dy_Pet_Check(BuffID)	
local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	if CheckBuff( MyPet , BuffID ) == true then		
	--say(MyPet , "0")
		return false
	else
	--say(MyPet , "1")
		return true
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------內建CD Check(寵物與自己)
function lua_Dy_PetAndMe_Check(BuffID)	
local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	if CheckBuff( MyPet , BuffID ) and CheckBuff( OwnerID() , BuffID ) == true then			
		return false
	else
		return true
	end
end
------------------------------------------------------------------------------------------------------------------------------------通用 發動加上禁制
function lua_Dy_CheckBuff_Self(BuffID,BuffTime)
if CheckBuff( OwnerID() , BuffID ) == true then
	return false
else
	AddBuff( OwnerID()  , BuffID , 0 , BuffTime)
	--say (OwnerID(), "Self")
	return true
	end
end
function lua_Dy_CheckBuff_Target(BuffID,BuffTime)
	AddBuff( TargetID() , BuffID , 0 , BuffTime)
	--say (OwnerID(), "T")
end
------------------------------------------------------------------------------------------------------------------------------------------------有限使用次數Buff
function lua_star_AddCountBuff(BuffID,Count,Time)
	AddBuff(OwnerID() , BuffID , Count , Time)
end		

function lua_star_GroupCountBuff(BuffID,Count,Time)			----------隊伍成員
	local partymember = LuaFunc_PartyData( OwnerID() )
	for i = 1 , partymember[0] , 1 do
		if partymember[i] ~= OwnerID() then
			AddBuff(partymember[i] , BuffID , Count , Time)
		end	
	end	
end

function lua_star_BuffCount(Buff1,Buff2,Kind,SkillPos)
	if CheckBuff( OwnerID() , Buff1 ) == true then
		local Pos_Count = Lua_BuffPosSearch( OwnerID() , Buff1 )						-----------顯示Buff(次數)		
		local Pos_Effect = Lua_BuffPosSearch( OwnerID() , Buff2 )						-----------不顯示Buff(效果)
		local PLV_Count = BuffInfo( OwnerID() , Pos_Count , EM_BuffInfoType_Power )
		local PLV_Effect = 0
		if Kind == 0 then																	------為主職技能
			PLV_Effect = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+SkillPos)	------效果技能在技能列表的位置			
		elseif Kind == 1 then																------為一般技能
			PLV_Effect = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_Normal+SkillPos)
		elseif Kind == 2 then																------為副職一般技能
			PLV_Effect = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SubJob+SkillPos)
		end
		local RestTime = BuffInfo( OwnerID() , Pos_Count , EM_BuffInfoType_Time )		
		CancelBuff( OwnerID() , Buff1 )
		if PLV_Count > 0 then			
			AddBuff( OwnerID() , Buff1 , PLV_Count-1 ,RestTime )			
			AddBuff( OwnerID() , Buff2 , PLV_Effect , RestTime )		
		end		
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------戰遊冷靜
function lua_star_CalmDown(Condition)	
	if Condition == 0 or Condition == 10 then
		local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+22 )      ----------冷靜在技能列表的位置
		AddBuff( OwnerID() , 503159 , PLevel , 15)	
	end	
end
function Dy_CalmDown(Condition)	
	if Condition == 0 or Condition == 10 then
		--local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+22 )      ----------冷靜在技能列表的位置
		AddBuff( OwnerID() , 620337 , 0 , 15)	
	end	
end
------------------------------------------------------------------------------------------------------------------------------------------------遊影趁勝追擊	
function lua_star_VictoryShot(Condition)	
	if Condition == 2 then
		local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+28 )
		if CheckBuff( TargetID() , 503453) == false then
			if PLevel >= 51 then ----阿龐新增，鎖技能效果等級上限50級
				AddBuff( TargetID() , 503169 , 50 , 12) 
			else
				AddBuff( TargetID() , 503169 , PLevel , 12)
			end
			
		elseif CheckBuff( TargetID() , 503453) == true then
			AddBuff( TargetID() , 503169 , PLevel , 0)
 
		end	
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------格擋專家2
function lua_Dy_ParryState()
	if ReadRoleValue( OwnerID() , EM_RoleValue_ParryState ) == 1 then
		--WriteRoleValue( OwnerID() , EM_RoleValue_ParryState , 0 )
		--Say(OwnerID() , ReadRoleValue( OwnerID() , EM_RoleValue_ParryState ) )
		if CheckBuff( OwnerID() , 503227 ) == true then
			AddBuff( OwnerID() , 503281 , 0 , 20 )
		else
			CancelBuff( OwnerID() , 503281 )
		end	
	end
end	
------------------------------------------------------------------------------------------------------------------------------------------------影遊『脅迫』	
function lua_star_Threaten()		
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( TargetID() , EM_RoleValue_HP )
	local HPPercent =( NowHP / MaxHP)*100
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+33 )
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Attackable) == true then 				
		if HPPercent < 30 then 
			ReCalculate( OwnerID() ) --------0304 Dy加入重新計算玩家數值
			AddBuff( OwnerID() , 503264, PLevel , 3)			
		end	
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )
		return false
	end	
end	
-----------------------------------------------------------------------------------------祭遊『聖者祝禱』	
function lua_Dy_testquickyheal()		
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( TargetID() , EM_RoleValue_HP )
	local HPPercent =( NowHP / MaxHP)*100
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+32 )
	if CheckRelation( OwnerID() , TargetID() , EM_CheckRelationType_Enemy) == false then 				
		if HPPercent < 30 then 
			AddBuff( OwnerID() , 503283, PLevel , 10)
			AddBuff( OwnerID() , 620406, PLevel , 10)			
		end	
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_3]" , 1 )
		return false
	end	
end
------------------------------------------------------------------------------------------------------------------------------------------------ 奮不顧身
function lua_star_ProtectAlly()
	local LastDamage = ReadRoleValue( OwnerID() , EM_RoleValue_LastDHp )
	local Pos = Lua_BuffPosSearch( OwnerID() , 502056 )
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )
	local PLV = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Power )
	CancelBuff(OwnerID() , 502056)
	local TransDamage = (LastDamage/ (1-(0.40+0.008*PLV)) )*(0.40+0.008*PLV)
	local TD = math.floor(abs(TransDamage))*2		
	SysCastSpellLV(OwnerID() , BuffOwner , 491612 , TD )
		
end

----------------------------------------------------------------------------------------戰遊 最終一搏大於等於30%
function lua_Dy_lastkill30up()		
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( TargetID() , EM_RoleValue_HP )
	local HPPercent =( NowHP / MaxHP)*100
		if HPPercent > 30 or HPPercent == 30 then 
		return true
	else
		return false
	end	
end
----------------------------------------------------------------------------------------戰遊 最終一搏小於等於30%
function lua_Dy_lastkill30dn()		
	local MaxHP = ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )
	local NowHP = ReadRoleValue( TargetID() , EM_RoleValue_HP )
	local HPPercent =( NowHP / MaxHP)*100
		if HPPercent < 30 then 
		return true
	else
		return false
	end	
end
---------------------------------------------------------------------------------------------火之妖精召喚特效
function lua_Dy_fire_pixie()
	star_skill_PetSpawnBuff(5)
	SysCastSpellLv ( OwnerID(), OwnerID(), 493338 , 0 )
end
---------------------------------------------------------------------------------------------水之妖精召喚特效
function lua_Dy_water_pixie()
	star_skill_PetSpawnBuff(5)
	SysCastSpellLv( OwnerID(), OwnerID(), 493339  , 0 )

end
---------------------------------------------------------------------------------------------暗之妖精召喚特效
function lua_Dy_dark_pixie()
	star_skill_PetSpawnBuff(5)
	SysCastSpellLv( OwnerID(), OwnerID(), 493340  , 0 )

end
---------------------------------------------------------------------------------------------風之妖精召喚特效
function lua_Dy_wind_pixie()
	star_skill_PetSpawnBuff(5)
	SysCastSpellLv( OwnerID(), OwnerID(), 493341  , 0 )

end
---------------------------------------------------------------------------------------------光之妖精召喚特效
function lua_Dy_light_pixie()
	star_skill_PetSpawnBuff(5)
	SysCastSpellLv( OwnerID(), OwnerID(), 493342 , 0 )

end
---------------------------------------------------------------------------------------------仇恨轉移系列
function lua_star_sethate()				
	if CheckBuff( OwnerID() , 501911 ) == true or CheckBuff( OwnerID() , 623088 ) then  ---623088為lv70精英技能強化仇恨引導
		lua_star_sethate3(501912)
	elseif CheckBuff( OwnerID() , 501900 ) == true then
		lua_star_sethate3( 501901)			
	end							
end

function lua_star_sethate2()
	local Mob = ReadRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse1)
	local Tank = ReadRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse2)
	local ScoutHate = ReadRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse3)
	local TankHate = ReadRoleValue( OwnerID() ,EM_LuaValueFlag_SkillUse4)
	local CountHateList_Mob = HateListCount(Mob)
	
	local HateValue1 = 0
	local HateValue2 = 0	
	local HatePos_Scout	= -1
	local HatePos_Tank = -1
	
	for j=0 , CountHateList_Mob-1 do
		if HateListInfo( Mob , j , EM_HateListInfoType_GItemID ) == OwnerID() then
			HateValue1 = HateListInfo( Mob , j , EM_HateListInfoType_HatePoint)
			HatePos_Scout = j
		elseif HateListInfo( Mob , j , EM_HateListInfoType_GItemID ) == Tank then
			HateValue2 = HateListInfo( Mob , j , EM_HateListInfoType_HatePoint)
			HatePos_Tank = j			
		end	
	end	
	SetHateListPoint( Mob , HatePos_Scout , ScoutHate )	
	SetHateListPoint( Mob , HatePos_Tank , HateValue2+(HateValue1-ScoutHate))
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse1 , 0 )
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse2 , 0 )
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse3 , 0 )
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse4 , 0 )
end

function lua_star_sethate3(BuffID) 
	local HateValue1 = 0
	local HateValue2 = 0
	
	local HatePos_Scout	= -1
	local HatePos_Tank = -1
		
	local Tank
	local ObjCount = SetSearchRangeInfo( OwnerID(),500 )
	local obj
		 
	for i = 1 , ObjCount , 1 do
		Tank = GetSearchResult()
		Obj = Role:New( Tank )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) and CheckBuff( Tank , BuffID ) == true then
			local BuffPos = Lua_BuffPosSearch( Tank , BuffID )			
			if BuffInfo(Tank , BuffPos , EM_BuffInfoType_OwnerID) == OwnerID() then	
				SysCastSpellLv(Tank , OwnerID() , 491511 , 0)	-------坦克對遊俠施展轉移目標	(  用Sys施法是為了不會被本身正在施法的GCD影響)   					
				break 				
			end
		end
	end		

	SetAttack( TargetID() , Tank )
	local CountHateList_Mob = HateListCount( TargetID() )
	--Say(OwnerID() , "List="..CountHateList_Mob )

	for j=0 , CountHateList_Mob-1 do
		if HateListInfo( TargetID() , j , EM_HateListInfoType_GItemID ) == OwnerID() then
			HateValue1 = HateListInfo( TargetID() , j , EM_HateListInfoType_HatePoint)
			HatePos_Scout = j
		elseif HateListInfo( TargetID() , j , EM_HateListInfoType_GItemID ) == Tank then
			HateValue2 = HateListInfo( TargetID() , j , EM_HateListInfoType_HatePoint)
			HatePos_Tank = j			
		end	
	end	
	--Say(OwnerID() , "Hate="..HateValue1)
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse1 , TargetID() )
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse2 , Tank )
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse3 , HateValue1 )
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_SkillUse4 , HateValue2 )			
								
end

---------------------------------------------------Lv50 法遊 
function lua_Dy_manawake()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) 
	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+28 )
	AddBuff( Master , 503744 , PLevel , 7)	
end	
function Dy_manawake_2()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID ) 
	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+28 ) 	
	SysCastSpellLv	( OwnerID() , OwnerID(), 492185, 0 ) 
	SysCastSpellLv	( OwnerID() , OwnerID(), 497853, PLevel ) 
	return true
end
---------------------------------------------------------------------妖精系列
function lua_star_Faerie( Buff1 , Order)
	local Master = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID )
	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+Order )
	local partymember = LuaFunc_PartyData( Master )
	local ObjCount = SetSearchRangeInfo( OwnerID(),200 )
	local obj
	local ManInRange
	for i = 1 , ObjCount , 1 do
		ManInRange = GetSearchResult()
		Obj = Role:New( ManInRange )
		if Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then
			for i = 1 , partymember[0] , 1 do
				if partymember[i] == ManInRange then
					AddBuff( ManInRange , Buff1 , PLevel , 7)
					--Say(OwnerID(), partymember[0] )
				end
			end
		end	
	end	
end	
--------------------------------------------------------------------------------------------------------額外恢復副職SP值 (模板的攻擊法術只能恢復主職的SP)
function lua_star_RecoverSubSP(Order,X,Y)	-------------------1.Order:技能位於技能列表的位置   2. X:	Power Level 0恢復的基本量     3. Y: 每個Power Level 恢復的SP量
	local SP_Sub = ReadRoleValue( OwnerID() , EM_RoleValue_SP_Sub )
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+Order )	
	WriteRoleValue( OwnerID() , EM_RoleValue_SP_Sub , SP_Sub+(X+Y*PLevel))
end

-----------------------------------------------------------lv50 遊影 毒噬 200563
function lua_Dy_drugshot(Condition)	
	if Condition == 1 then
		DelBodyItem( OwnerID(), 200563, 1 )
	end
end
function lua_Dy_PetBackCheck_ForPixie()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
	if CheckID( MyPet ) == true then
		--say (OwnerID(), "havepet")
		return true
	elseif CheckID( MyPet ) == false then
		--say (OwnerID(), "Nooooooo")
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_12]" , 1 )
		return false
	end
end

-----------------------------------------------------共用 結束後消除隱藏法術
function lua_Dy_DELAnother(BUFFID1 , BUFFID2)
	if CheckBuff( OwnerID() , BUFFID1) == false then
		CancelBuff( OwnerID(), BUFFID2 )
	end
end
function lua_Dy_DEL2(BUFFID1 , BUFFID2) -----
	if CheckBuff( OwnerID() , BUFFID) == false or CheckBuff( OwnerID() , BUFFID) == false then
		CancelBuff( OwnerID(), BUFFID1 )
		CancelBuff( OwnerID(), BUFFID2 )
	end
end
function Dy_DEL3(BUFFID1 , BUFFID2) -----for減傷類使用
	if CheckBuff( OwnerID() , BUFFID1) == false then
		if CheckBuff( OwnerID() , BUFFID2) == true then
			CancelBuff( OwnerID(), BUFFID2 )
		else
		end
	end
end
function Dy_DELBuffID(BUFFID)
	CancelBuff( OwnerID(), BUFFID )
end
-------------------------------------------------------------------祭戰懲戒姿態劇情
function lua_Dy_PW15() ---ADD狀態劇情
local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+18 )
	if PLevel > 50 then
		AddBuff( OwnerID() , 506386 , 50 , 900) --ADD降治療
		AddBuff( OwnerID() , 507324 , 50 , 900) --ADD提高防禦
		AddBuff( OwnerID() , 506388 , PLevel , 900) --ADD提高攻強
	elseif PLevel <= 50 then
		AddBuff( OwnerID() , 506386 , PLevel, 900) --ADD降治療
		AddBuff( OwnerID() , 507324 , PLevel, 900) --ADD提高防禦
		AddBuff( OwnerID() , 506388 , PLevel , 900) --ADD提高攻強
	end
end
function lua_Dy_DELForPW() -----祭戰懲戒姿態消除劇情
	if CheckBuff( OwnerID() , 501977) == false then
		CancelBuff( OwnerID(), 506386 ) --------消隱藏降治療
		CancelBuff( OwnerID(), 506388 ) ---------消隱藏攻強
		CancelBuff( OwnerID(), 507324 ) ---------消隱藏防禦
		CancelBuff( OwnerID(), 502904 ) ---------消蓄力
		CancelBuff( OwnerID(), 503280 ) ---------(消戰意凝聚
		end
end
--------
-------------------------------------------妖精光環消除用
function lua_Dy_DELSpirit(BUFFID1 , BUFFID2)
local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	if CheckBuff( OwnerID() , BUFFID1) == false then ------------------妖精自己本身的光環Buff不見時
		CancelBuff( Master, BUFFID2 ) ------------------削除主人身上的Buff
	end
end
-----------------------------------騎法15 聖光領域
function Dy_KM15_01()
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+42 )
	SysCastSpellLv	( OwnerID(), OwnerID() , 491607 , PLevel)
end
function Dy_KM40_01()
	local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+42 )
	SysCastSpellLv	( OwnerID(), OwnerID() , 492953 , PLevel)
end
function Un_del621289(buff1,buff2,buff3,buff4)
	--if CheckBuff( OwnerID() , buff1) == false then
	CancelBuff( OwnerID(), buff1 )
		CancelBuff( OwnerID(), buff2 )
		CancelBuff( OwnerID(), buff3 )
		CancelBuff( OwnerID(), buff4 )
	--end
end













