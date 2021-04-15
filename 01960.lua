---------------------------------------------------------------------------森林牧者戰士 LV30 牽絆上寵物用
--function lua_Dy_PetCriAgiup_00() -----男樹人
--	star_skill_PetSpawnBuff(7)
--	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---抓主人攻擊力
--	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---抓主人法術攻擊力
--	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---抓主人防禦力
--	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---抓主人法術防禦力
--	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---抓主人物理傷害
--	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---抓主人法術傷害
--	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---抓主人物理命中等級
--	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---抓主人法術命中等級
--	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---抓主人爆擊等級
--	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---抓主人法爆等級
--	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---抓主人血量上限
--	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---讀主人的等級
--	--say (OwnerID() , "MASTERALV = "..LV)
--	if Checkbuff (Master , 620682) == true or Checkbuff (Master , 620684) == true then
--		AddBuff( OwnerID() ,620706 ,0, -1 )
--	elseif Checkbuff (Master , 620684) == false then
--		AddBuff( Master ,620682 ,0, -1 )
--		AddBuff( OwnerID() ,620706 ,0, -1 )
--	end
--	if CheckBuff( Master , 620678) == true then --檢查自己有無橡樹之靈被動
--		CancelBuff(Master,620678)
--	end
--	AddBuff (OwnerID() , 507186 , (ATK*0.08) , -1)
--	--say (OwnerID() , "MASTERATK = "..ATK)
--	--AddBuff (OwnerID() , 507187 , (MATK*0.8) , -1)
--	--say (OwnerID() , "MASTERMATK = "..MATK)
--	AddBuff (OwnerID() , 507188 , (DEF*0.3) , -1)
--	--say (OwnerID() , "MASTERDEF = "..DEF)
--	AddBuff (OwnerID() , 507189 , (MDEF*0.1) , -1)
--	--say (OwnerID() , "MASTERMDEF = "..MDEF)
--	AddBuff (OwnerID() , 507190 , (DMG*0.08) , -1)
--	--say (OwnerID() , "MASTERDMG = "..DMG)
--	--AddBuff (OwnerID() , 507191 , (MDMG*0.8) , -1)
--	--say (OwnerID() , "MASTERMDMG = "..MDMG)
--	AddBuff (OwnerID() , 507192 , (HIT*0.8) , -1)
--	--say (OwnerID() , "MASTERHIT = "..HIT)
--	--AddBuff (OwnerID() , 507193 , (MHIT*0.8) , -1)
--	--say (OwnerID() , "MASTERMHIT = "..MHIT)
--	AddBuff (OwnerID() , 507194 , (CRI*0.3) , -1)
--	--say (OwnerID() , "MASTERCRI = "..CRI)
--	--AddBuff (OwnerID() , 507195 , (MCRI*0.8) , -1)
--	--say (OwnerID() , "MASTERMCRI = "..MCRI)
--	AddBuff (OwnerID() , 507196 , (HP*0.1) , -1)
--	--say (OwnerID() , "MASTERHP = "..HP)
--
--	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+17 ) ---------填資料表的時候記得把LV位置填上去
--	if ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 34 then
--		SysCastSpellLv ( OwnerID(), OwnerID(), 493563,  PLevel  )
--		AddBuff( OwnerID() ,504196 ,0, -1 )
--		--say ( Master , "hp34")
--	else
--		AddBuff( OwnerID() ,504196 ,0, -1 )	
--		--say ( Master , "Lvnot34")
--	end
--	--local PLevel_213 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+30 ) --上牽絆
--	--if CheckFlag( Master, 543110 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 1 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 30 then
--		--AddBuff( OwnerID() ,504891 ,PLevel_213, -1 )          ----2.1.3版本用
--		--SetPlot( OwnerID() ,"dead","star_skill_WW30",500 )
--	--end
--	local PLevel_2 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+36 ) --森遊馴獸師
--	if CheckFlag( Master , 543091 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504514 , PLevel_2, -1 )
--		AddBuff( OwnerID() ,506421 , PLevel_2, -1 )---0327阿龐新增，閃躲等級
--		--say (OwnerID() , "cri is True")
--	else 
--		--say (OwnerID() , "cri is False")
--	end
--	local PLevel_3 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+52 ) --森法橡樹堅韌
--	if CheckFlag( Master, 543093 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 4 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504600 , PLevel_3, -1 )
--		--say (OwnerID() , "Def is True")
--	else 
--		--say (OwnerID() , "Def is False")
--	end
--	local PLevel_4 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+61 ) --森神敏銳反應
--	if CheckFlag( Master, 543104 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 8 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 25 then
--		AddBuff( OwnerID() ,504711 , PLevel_4, -1 )
--		AddBuff( OwnerID() ,506422 , PLevel_4, -1 )---0327阿龐新增，閃躲等級
--		--say (OwnerID() , "Agi is True")
--	else 
--		--say (OwnerID() , "Agi is False")
--	end
--	while 1 do 
--    sleep(100)
--		if Checkbuff (Master , 620682) == true  or Checkbuff (Master , 620684) == true then
--			AddBuff( OwnerID() ,620706 ,0, -1 )
--		elseif Checkbuff (Master , 620684) == false then
--			AddBuff( Master ,620682 ,0, -1 )
--			AddBuff( OwnerID() ,620706 ,0, -1 )
--			
--		end
--	end
--end
--function Dy_Pet_00_DEL() --森法45死裡逃生用
--	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )
--	if CheckID( MyPet ) == true then
--		if CheckFlag( OwnerID(), 543143 ) == true and ReadRoleValue( OwnerID(), EM_RoleValue_VOC ) == 7 and  ReadRoleValue( OwnerID(), EM_RoleValue_VOC_SUB ) == 4 and  ReadRoleValue( OwnerID(), EM_RoleValue_LV ) >= 45 then
--			if Checkbuff (MyPet , 505705) == true then
--				SysCastSpellLv( OwnerID() , OwnerID() , 495059 , 0 )
--			elseif Checkbuff (MyPet , 505705) == false then
--				
--			end
--		end
--		AddBuff( OwnerID() ,620684 ,0, 300)
--		DelObj ( MyPet )
--	elseif CheckID( MyPet ) == false then
--
--	end
--end
--function Dy_Pet00_DEL_2() --男樹被動技刪除劇情
--local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	CancelBuff_NoEvent(Master , 620682) --消除主人身上的Buff
--end	
--
--------------------------------------------------------------------------------------------森牧女樹人用
--function lua_Dy_PetCriAgiup_01()
--	star_skill_PetSpawnBuff(7)
--	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---抓主人攻擊力
--	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---抓主人法術攻擊力
--	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---抓主人防禦力
--	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---抓主人法術防禦力
--	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---抓主人物理傷害
--	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---抓主人法術傷害
--	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---抓主人物理命中等級
--	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---抓主人法術命中等級
--	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---抓主人爆擊等級
--	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---抓主人法爆等級
--	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---抓主人血量上限
--	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---讀主人的等級
--	--say (OwnerID() , "MASTERALV = "..LV)
--	AddBuff (OwnerID() , 507186 , (ATK*0.1) , -1)
--	--say (OwnerID() , "MASTERATK = "..ATK)
--	--AddBuff (OwnerID() , 507187 , (MATK*0.8) , -1)
--	--say (OwnerID() , "MASTERMATK = "..MATK)
--	AddBuff (OwnerID() , 507188 , (DEF*0.03) , -1)
--	--say (OwnerID() , "MASTERDEF = "..DEF)
--	AddBuff (OwnerID() , 507189 , (MDEF*0.03) , -1)
--	--say (OwnerID() , "MASTERMDEF = "..MDEF)
--	AddBuff (OwnerID() , 507190 , (DMG*0.1) , -1)
--	--say (OwnerID() , "MASTERDMG = "..DMG)
--	--AddBuff (OwnerID() , 507191 , (MDMG*0.8) , -1)
--	--say (OwnerID() , "MASTERMDMG = "..MDMG)
--	AddBuff (OwnerID() , 507192 , (HIT*0.8) , -1)
--	--say (OwnerID() , "MASTERHIT = "..HIT)
--	--AddBuff (OwnerID() , 507193 , (MHIT*0.8) , -1)
--	--say (OwnerID() , "MASTERMHIT = "..MHIT)
--	AddBuff (OwnerID() , 507194 , (CRI*0.8) , -1)
--	--say (OwnerID() , "MASTERCRI = "..CRI)
--	--AddBuff (OwnerID() , 507195 , (MCRI*0.8) , -1)
--	--say (OwnerID() , "MASTERMCRI = "..MCRI)
--	AddBuff (OwnerID() , 507196 , (HP*0.08) , -1)
--	--say (OwnerID() , "MASTERHP = "..HP)
--	AddBuff( OwnerID() ,620679 ,0, -1 )	 --女樹被動檢查用
--	AddBuff( Master ,620678 ,0, -1 )	--女樹被動上主人	
--	if CheckBuff( Master , 620682) == true then --檢查自己有無橡樹之靈被動
--		CancelBuff_NoEvent( Master, 620682 )
--	end
--	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+17 ) ---------填資料表的時候記得把LV位置填上去
--	if ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 34 then
--		SysCastSpellLv ( OwnerID(), OwnerID(), 493563,  PLevel  )
--		AddBuff( OwnerID() ,504196 ,0, -1 )
--		--say ( Master , "hp34")
--	else
--		AddBuff( OwnerID() ,504196 ,0, -1 )	
--
--		--say ( Master , "Lvnot34")
--	end
--	local PLevel_2 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+36 ) --森遊馴獸師
--	if CheckFlag( Master , 543091 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504514 , PLevel_2, -1 )
--		AddBuff( OwnerID() ,506421 , PLevel_2, -1 )---0327阿龐新增，閃躲等級
--		--say (OwnerID() , "cri is True")
--	else 
--		--say (OwnerID() , "cri is False")
--	end
--	local PLevel_3 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+52 ) --森法橡樹堅韌
--	if CheckFlag( Master, 543093 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 4 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504600 , PLevel_3, -1 )
--		--say (OwnerID() , "Def is True")
--	else 
--		--say (OwnerID() , "Def is False")
--	end
--	local PLevel_4 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+61 ) --森神敏銳反應
--	if CheckFlag( Master, 543104 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 8 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 25 then
--		AddBuff( OwnerID() ,504711 , PLevel_4, -1 )
--		AddBuff( OwnerID() ,506422 , PLevel_4, -1 )---0327阿龐新增，閃躲等級
--		--say (OwnerID() , "Agi is True")
--	else 
--		--say (OwnerID() , "Agi is False")
--	end
--end
--function Dy_Pet01_CRI() --女樹被動技劇情
--local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------抓寵物ID
--local Target = ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID)  --當前目標
--local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+14 ) --野萼打擊的等級
--	if ReadRoleValue( OwnerID(), EM_RoleValue_VOC ) == 7 and  ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB ) == 4 and ReadRoleValue( OwnerID(), EM_RoleValue_LV ) >= 35 then 
--		SysCastSpellLv ( MyPet, Target, 498197,  PLevel+50  ) --施放野萼打擊
--	else
--		SysCastSpellLv ( MyPet, Target, 498197,  PLevel  ) --施放野萼打擊
--	end
--end
--function Dy_Pet01_DEL() --女樹被動技刪除劇情
--local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	CancelBuff(Master , 620678) --消除主人身上的Buff
--end	
-----------------------------------------------人馬用
--function lua_Dy_PetCriAgiup_02()
--	star_skill_PetSpawnBuff(7)
--	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---抓主人攻擊力
--	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---抓主人法術攻擊力
--	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---抓主人防禦力
--	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---抓主人法術防禦力
--	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---抓主人物理傷害
--	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---抓主人法術傷害
--	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---抓主人物理命中等級
--	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---抓主人法術命中等級
--	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---抓主人爆擊等級
--	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---抓主人法爆等級
--	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---抓主人血量上限
--	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---讀主人的等級
--	--say (OwnerID() , "MASTERALV = "..LV)
--	AddBuff (OwnerID() , 507186 , (ATK*0.15) , -1)
--	--say (OwnerID() , "MASTERATK = "..ATK)
--	--AddBuff (OwnerID() , 507187 , (MATK*0.8) , -1)
--	--say (OwnerID() , "MASTERMATK = "..MATK)
--	AddBuff (OwnerID() , 507188 , (DEF*0.03) , -1)
--	--say (OwnerID() , "MASTERDEF = "..DEF)
--	AddBuff (OwnerID() , 507189 , (MDEF*0.03) , -1)
--	--say (OwnerID() , "MASTERMDEF = "..MDEF)
--	AddBuff (OwnerID() , 507190 , (DMG*0.1) , -1)
--	--say (OwnerID() , "MASTERDMG = "..DMG)
--	--AddBuff (OwnerID() , 507191 , (MDMG*0.8) , -1)
--	--say (OwnerID() , "MASTERMDMG = "..MDMG)
--	AddBuff (OwnerID() , 507192 , (HIT*0.8) , -1)
--	--say (OwnerID() , "MASTERHIT = "..HIT)
--	--AddBuff (OwnerID() , 507193 , (MHIT*0.8) , -1)
--	--say (OwnerID() , "MASTERMHIT = "..MHIT)
--	AddBuff (OwnerID() , 507194 , (CRI*0.3) , -1)
--	--say (OwnerID() , "MASTERCRI = "..CRI)
--	--AddBuff (OwnerID() , 507195 , (MCRI*0.8) , -1)
--	--say (OwnerID() , "MASTERMCRI = "..MCRI)
--	AddBuff (OwnerID() , 507196 , (HP*0.06) , -1)
--	--say (OwnerID() , "MASTERHP = "..HP)
--	
--	if CheckBuff( Master , 620682) == true then --檢查自己有無橡樹之靈被動
--		CancelBuff_NoEvent( Master, 620682 )
--	end	
--	if CheckBuff( Master , 620678) == true then --檢查自己有無橡樹之靈被動
--		CancelBuff(Master,620678)
--	end
--	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+17 ) ---------填資料表的時候記得把LV位置填上去
--	if ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 34 then
--		--SysCastSpellLv ( OwnerID(), OwnerID(), 494353,PLevel )
--		AddBuff( OwnerID() ,504898 ,PLevel, -1 )
--		AddBuff( OwnerID() ,504196 ,0, -1 )
--		--say ( Master , "hp34")
--	else
--		AddBuff( OwnerID() ,504567 ,0, -1 )
--		--SysCastSpellLv ( OwnerID(), OwnerID(), 494348,0 )		
--		--say ( Master , "Lvnot34")
--	end
--	local PLevel_2 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+36 ) --森遊馴獸師
--	if CheckFlag( Master , 543091 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504514 , PLevel_2, -1 )
--		AddBuff( OwnerID() ,506421 , PLevel_2, -1 )---0327阿龐新增，閃躲等級
--		--say (OwnerID() , "cri is True")
--	else 
--		--say (OwnerID() , "cri is False")
--	end
--	local PLevel_3 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+39 ) --森遊默契
--	if CheckFlag( Master , 543121 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 35 then
--		AddBuff( OwnerID() ,505184 , PLevel_3, -1 )
--		--say (OwnerID() , "atktrue")
--	else 
--		--say (OwnerID() , "atkfalse")
--	end
--end
---------------------------------------------------新森遊35人馬之箭 未命中&閃避 +爆擊BUFF
--function Dy_WS25MISS(Condition)	
--	if Condition == 2 and checkbuff(OwnerID(),620705) == true then
--		CancelBuff(OwnerID(),620705)
--	elseif Condition == 0 or  Condition == 10 then 
--		--local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+68 )      ----------人馬之箭在技能列表的位置
--		SysCastSpellLv ( OwnerID(), OwnerID(), 498218,  0  )
--	end	
--end
--
-----------------------------------------------------------------------------森法 LV40結晶護佑上寵物用
--function lua_Dy_PetCriAgiup_03()
--	star_skill_PetSpawnBuff(7)
--	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	
--	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---抓主人攻擊力
--	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---抓主人法術攻擊力
--	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---抓主人防禦力
--	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---抓主人法術防禦力
--	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---抓主人物理傷害
--	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---抓主人法術傷害
--	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---抓主人物理命中等級
--	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---抓主人法術命中等級
--	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---抓主人爆擊等級
--	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---抓主人法爆等級
--	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---抓主人血量上限
--	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---讀主人的等級
--	--say (OwnerID() , "MASTERALV = "..LV)
--	AddBuff (OwnerID() , 507186 , (ATK*0.01) , -1)
--	--say (OwnerID() , "MASTERATK = "..ATK)
--	AddBuff (OwnerID() , 507187 , (MATK*0.1) , -1)
--	--say (OwnerID() , "MASTERMATK = "..MATK)
--	AddBuff (OwnerID() , 507188 , (DEF*0.01) , -1)
--	--say (OwnerID() , "MASTERDEF = "..DEF)
--	AddBuff (OwnerID() , 507189 , (MDEF*0.1) , -1)
--	--say (OwnerID() , "MASTERMDEF = "..MDEF)
--	--AddBuff (OwnerID() , 507190 , (DMG*0.0) , -1)
--	--say (OwnerID() , "MASTERDMG = "..DMG)
--	AddBuff (OwnerID() , 507191 , (MDMG*0.5) , -1)
--	--say (OwnerID() , "MASTERMDMG = "..MDMG)
--	AddBuff (OwnerID() , 507192 , (HIT*0.8) , -1)
--	--say (OwnerID() , "MASTERHIT = "..HIT)
--	AddBuff (OwnerID() , 507193 , (MHIT*0.8) , -1)
--	--say (OwnerID() , "MASTERMHIT = "..MHIT)
--	--AddBuff (OwnerID() , 507194 , (CRI*0.1) , -1)
--	--say (OwnerID() , "MASTERCRI = "..CRI)
--	AddBuff (OwnerID() , 507195 , (MCRI*0.3) , -1)
--	--say (OwnerID() , "MASTERMCRI = "..MCRI)
--	AddBuff (OwnerID() , 507196 , (HP*0.08) , -1)
--	--say (OwnerID() , "MASTERHP = "..HP)
--	AddBuff( OwnerID() ,620685 ,0, -1 )	
--	if CheckBuff( Master , 620682) == true then --檢查自己有無橡樹之靈被動
--		CancelBuff_NoEvent( Master, 620682 )
--	end
--	if CheckBuff( Master , 620678) == true then --檢查自己有無橡樹之靈被動
--		CancelBuff(Master,620678)
--	end
--	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+17 ) ---------填資料表的時候記得把LV位置填上去
--	if ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 34 then
--		SysCastSpellLv ( OwnerID(), OwnerID(), 493563,  PLevel  )
--		AddBuff( OwnerID() ,504196 ,0, -1 )
--		--say ( Master , "hp34")
--	else
--		AddBuff( OwnerID() ,504196 ,0, -1 )	
--		--say ( Master , "Lvnot34")
--	end
--	local PLevel_2 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+36 ) --森遊馴獸師
--	if CheckFlag( Master , 543091 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504514 , PLevel_2, -1 )
--		AddBuff( OwnerID() ,506421 , PLevel_2, -1 )---0327阿龐新增，閃躲等級
--		--say (OwnerID() , "cri is True")
--	else 
--		--say (OwnerID() , "cri is False")
--	end
--	local PLevel_3 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+52 ) --森法橡樹堅韌
--	if CheckFlag( Master, 543093 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 4 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504600 , PLevel_3, -1 )
--		--say (OwnerID() , "Def is True")
--	else 
--		--say (OwnerID() , "Def is False")
--	end
--	local PLevel_4 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+61 ) --森神敏銳反應
--	if CheckFlag( Master, 543104 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 8 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 25 then
--		AddBuff( OwnerID() ,504711 , PLevel_4, -1 )
--		AddBuff( OwnerID() ,506422 , PLevel_4, -1 )---0327阿龐新增，閃躲等級
--		--say (OwnerID() , "Agi is True")
--	else 
--		--say (OwnerID() , "Agi is False")
--	end
--	--local PLevel_214 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+56 ) --森法結晶護佑
--	--if CheckFlag( Master, 543133 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 4 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 40 then
--		--SetPlot( OwnerID() ,"dead","lua_Dy_Protectwm40",500 )
--	--end
--end
---------------------------------------------------------------------------法遊35 炎靈用
function lua_Dy_PetCriAgiup_MS35() -----炎靈
	star_skill_PetSpawnBuff(4)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---抓主人攻擊力
	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---抓主人法術攻擊力
	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---抓主人防禦力
	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---抓主人法術防禦力
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---抓主人物理傷害
	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---抓主人法術傷害
	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---抓主人物理命中等級
	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---抓主人法術命中等級
	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---抓主人爆擊等級
	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---抓主人法爆等級
	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---抓主人血量上限
	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---讀主人的等級
	--say (OwnerID() , "MASTERALV = "..LV)
	AddBuff (OwnerID() , 507186 , (ATK*0.05) , -1)
	--say (OwnerID() , "MASTERATK = "..ATK)
	AddBuff (OwnerID() , 507187 , (MATK*0.5) , -1)
	--say (OwnerID() , "MASTERMATK = "..MATK)
	AddBuff (OwnerID() , 507188 , (DEF*0.1) , -1)
	--say (OwnerID() , "MASTERDEF = "..DEF)
	AddBuff (OwnerID() , 507189 , (MDEF*0.5) , -1)
	--say (OwnerID() , "MASTERMDEF = "..MDEF)
	--AddBuff (OwnerID() , 507190 , (DMG*0.08) , -1)
	--say (OwnerID() , "MASTERDMG = "..DMG)
	AddBuff (OwnerID() , 507191 , (MDMG*0.4) , -1)
	--say (OwnerID() , "MASTERMDMG = "..MDMG)
	--AddBuff (OwnerID() , 507192 , (HIT*0.8) , -1)
	--say (OwnerID() , "MASTERHIT = "..HIT)
	AddBuff (OwnerID() , 507193 , (MHIT*0.8) , -1)
	--say (OwnerID() , "MASTERMHIT = "..MHIT)
	--AddBuff (OwnerID() , 507194 , (CRI*0.3) , -1)
	--say (OwnerID() , "MASTERCRI = "..CRI)
	AddBuff (OwnerID() , 507195 , (MCRI*0.8) , -1)
	--say (OwnerID() , "MASTERMCRI = "..MCRI)
	AddBuff (OwnerID() , 507196 , (HP*0.02) , -1)
	--say (OwnerID() , "MASTERHP = "..HP)
local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+28 ) --森法橡樹堅韌
	if CheckFlag( Master, 542112 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 4 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 50 then
		AddBuff( OwnerID() ,620185 , PLevel, 25 )
		AddBuff( Master ,620185 , PLevel, 25 )
		--say (OwnerID() , "Def is True")
	else 
		--say (OwnerID() , "Def is False")
	end
end
---------------------------------------------------------------------------影法 爆裂陷阱用
function lua_Dy_PetCriAgiup_RM15() -----陷阱用
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---抓主人攻擊力
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---抓主人物理傷害
	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---抓主人物理命中等級
	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---抓主人爆擊等級
	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---讀主人的等級
		SetModeEx(OwnerID(),EM_SetModeType_Mark,false)
		SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false)
		SetModeEx(OwnerID(), EM_SetModeType_Move, false)
		SetModeEx(OwnerID(),EM_SetModeType_Fight, false) 
		SetModeEx(OwnerID(),EM_SetModeType_Strikback, false) 
		SetModeEx(OwnerID(),EM_SetModeType_HideName,false)              ---物件頭上是否顯示名稱
		SetModeEx(OwnerID(),EM_SetModeType_HideMinimap,false)           ---物件是否在小地圖上顯示
		SetModeEx(OwnerID(),EM_SetModeType_NotShowHPMP,false)           ---不顯示血條
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	--say (OwnerID() , "MASTERALV = "..LV)
	AddBuff (OwnerID() , 507186 , (ATK*0.5) , -1)
	--say (OwnerID() , "MASTERATK = "..ATK)
	AddBuff (OwnerID() , 507190 , (DMG*0.1) , -1)
	--say (OwnerID() , "MASTERDMG = "..DMG)
	AddBuff (OwnerID() , 507192 , (HIT*0.8) , -1)
	--say (OwnerID() , "MASTERHIT = "..HIT)
	AddBuff (OwnerID() , 507194 , (CRI*0.5) , -1)
	--say (OwnerID() , "MASTERCRI = "..CRI)

end