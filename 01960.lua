---------------------------------------------------------------------------�˪L���̾Ԥh LV30 �o�̤W�d����
--function lua_Dy_PetCriAgiup_00() -----�k��H
--	star_skill_PetSpawnBuff(7)
--	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---��D�H�����O
--	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---��D�H�k�N�����O
--	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---��D�H���m�O
--	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---��D�H�k�N���m�O
--	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---��D�H���z�ˮ`
--	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---��D�H�k�N�ˮ`
--	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---��D�H���z�R������
--	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---��D�H�k�N�R������
--	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---��D�H�z������
--	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---��D�H�k�z����
--	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---��D�H��q�W��
--	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---Ū�D�H������
--	--say (OwnerID() , "MASTERALV = "..LV)
--	if Checkbuff (Master , 620682) == true or Checkbuff (Master , 620684) == true then
--		AddBuff( OwnerID() ,620706 ,0, -1 )
--	elseif Checkbuff (Master , 620684) == false then
--		AddBuff( Master ,620682 ,0, -1 )
--		AddBuff( OwnerID() ,620706 ,0, -1 )
--	end
--	if CheckBuff( Master , 620678) == true then --�ˬd�ۤv���L����F�Q��
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
--	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+17 ) ---------���ƪ��ɭ԰O�o��LV��m��W�h
--	if ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 34 then
--		SysCastSpellLv ( OwnerID(), OwnerID(), 493563,  PLevel  )
--		AddBuff( OwnerID() ,504196 ,0, -1 )
--		--say ( Master , "hp34")
--	else
--		AddBuff( OwnerID() ,504196 ,0, -1 )	
--		--say ( Master , "Lvnot34")
--	end
--	--local PLevel_213 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+30 ) --�W�o��
--	--if CheckFlag( Master, 543110 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 1 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 30 then
--		--AddBuff( OwnerID() ,504891 ,PLevel_213, -1 )          ----2.1.3������
--		--SetPlot( OwnerID() ,"dead","star_skill_WW30",500 )
--	--end
--	local PLevel_2 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+36 ) --�˹C���~�v
--	if CheckFlag( Master , 543091 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504514 , PLevel_2, -1 )
--		AddBuff( OwnerID() ,506421 , PLevel_2, -1 )---0327���e�s�W�A�{������
--		--say (OwnerID() , "cri is True")
--	else 
--		--say (OwnerID() , "cri is False")
--	end
--	local PLevel_3 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+52 ) --�˪k����
--	if CheckFlag( Master, 543093 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 4 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504600 , PLevel_3, -1 )
--		--say (OwnerID() , "Def is True")
--	else 
--		--say (OwnerID() , "Def is False")
--	end
--	local PLevel_4 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+61 ) --�˯��ӾU����
--	if CheckFlag( Master, 543104 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 8 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 25 then
--		AddBuff( OwnerID() ,504711 , PLevel_4, -1 )
--		AddBuff( OwnerID() ,506422 , PLevel_4, -1 )---0327���e�s�W�A�{������
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
--function Dy_Pet_00_DEL() --�˪k45���̰k�ͥ�
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
--function Dy_Pet00_DEL_2() --�k��Q�ʧާR���@��
--local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	CancelBuff_NoEvent(Master , 620682) --�����D�H���W��Buff
--end	
--
--------------------------------------------------------------------------------------------�˪��k��H��
--function lua_Dy_PetCriAgiup_01()
--	star_skill_PetSpawnBuff(7)
--	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---��D�H�����O
--	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---��D�H�k�N�����O
--	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---��D�H���m�O
--	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---��D�H�k�N���m�O
--	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---��D�H���z�ˮ`
--	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---��D�H�k�N�ˮ`
--	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---��D�H���z�R������
--	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---��D�H�k�N�R������
--	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---��D�H�z������
--	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---��D�H�k�z����
--	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---��D�H��q�W��
--	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---Ū�D�H������
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
--	AddBuff( OwnerID() ,620679 ,0, -1 )	 --�k��Q���ˬd��
--	AddBuff( Master ,620678 ,0, -1 )	--�k��Q�ʤW�D�H	
--	if CheckBuff( Master , 620682) == true then --�ˬd�ۤv���L����F�Q��
--		CancelBuff_NoEvent( Master, 620682 )
--	end
--	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+17 ) ---------���ƪ��ɭ԰O�o��LV��m��W�h
--	if ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 34 then
--		SysCastSpellLv ( OwnerID(), OwnerID(), 493563,  PLevel  )
--		AddBuff( OwnerID() ,504196 ,0, -1 )
--		--say ( Master , "hp34")
--	else
--		AddBuff( OwnerID() ,504196 ,0, -1 )	
--
--		--say ( Master , "Lvnot34")
--	end
--	local PLevel_2 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+36 ) --�˹C���~�v
--	if CheckFlag( Master , 543091 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504514 , PLevel_2, -1 )
--		AddBuff( OwnerID() ,506421 , PLevel_2, -1 )---0327���e�s�W�A�{������
--		--say (OwnerID() , "cri is True")
--	else 
--		--say (OwnerID() , "cri is False")
--	end
--	local PLevel_3 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+52 ) --�˪k����
--	if CheckFlag( Master, 543093 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 4 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504600 , PLevel_3, -1 )
--		--say (OwnerID() , "Def is True")
--	else 
--		--say (OwnerID() , "Def is False")
--	end
--	local PLevel_4 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+61 ) --�˯��ӾU����
--	if CheckFlag( Master, 543104 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 8 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 25 then
--		AddBuff( OwnerID() ,504711 , PLevel_4, -1 )
--		AddBuff( OwnerID() ,506422 , PLevel_4, -1 )---0327���e�s�W�A�{������
--		--say (OwnerID() , "Agi is True")
--	else 
--		--say (OwnerID() , "Agi is False")
--	end
--end
--function Dy_Pet01_CRI() --�k��Q�ʧ޼@��
--local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
--local Target = ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID)  --��e�ؼ�
--local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+14 ) --��������������
--	if ReadRoleValue( OwnerID(), EM_RoleValue_VOC ) == 7 and  ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB ) == 4 and ReadRoleValue( OwnerID(), EM_RoleValue_LV ) >= 35 then 
--		SysCastSpellLv ( MyPet, Target, 498197,  PLevel+50  ) --�I�񳥸�����
--	else
--		SysCastSpellLv ( MyPet, Target, 498197,  PLevel  ) --�I�񳥸�����
--	end
--end
--function Dy_Pet01_DEL() --�k��Q�ʧާR���@��
--local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	CancelBuff(Master , 620678) --�����D�H���W��Buff
--end	
-----------------------------------------------�H����
--function lua_Dy_PetCriAgiup_02()
--	star_skill_PetSpawnBuff(7)
--	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---��D�H�����O
--	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---��D�H�k�N�����O
--	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---��D�H���m�O
--	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---��D�H�k�N���m�O
--	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---��D�H���z�ˮ`
--	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---��D�H�k�N�ˮ`
--	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---��D�H���z�R������
--	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---��D�H�k�N�R������
--	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---��D�H�z������
--	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---��D�H�k�z����
--	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---��D�H��q�W��
--	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---Ū�D�H������
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
--	if CheckBuff( Master , 620682) == true then --�ˬd�ۤv���L����F�Q��
--		CancelBuff_NoEvent( Master, 620682 )
--	end	
--	if CheckBuff( Master , 620678) == true then --�ˬd�ۤv���L����F�Q��
--		CancelBuff(Master,620678)
--	end
--	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+17 ) ---------���ƪ��ɭ԰O�o��LV��m��W�h
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
--	local PLevel_2 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+36 ) --�˹C���~�v
--	if CheckFlag( Master , 543091 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504514 , PLevel_2, -1 )
--		AddBuff( OwnerID() ,506421 , PLevel_2, -1 )---0327���e�s�W�A�{������
--		--say (OwnerID() , "cri is True")
--	else 
--		--say (OwnerID() , "cri is False")
--	end
--	local PLevel_3 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+39 ) --�˹C�q��
--	if CheckFlag( Master , 543121 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 35 then
--		AddBuff( OwnerID() ,505184 , PLevel_3, -1 )
--		--say (OwnerID() , "atktrue")
--	else 
--		--say (OwnerID() , "atkfalse")
--	end
--end
---------------------------------------------------�s�˹C35�H�����b ���R��&�{�� +�z��BUFF
--function Dy_WS25MISS(Condition)	
--	if Condition == 2 and checkbuff(OwnerID(),620705) == true then
--		CancelBuff(OwnerID(),620705)
--	elseif Condition == 0 or  Condition == 10 then 
--		--local PLevel = ReadRoleValue( OwnerID() , EM_RoleValue_MagicPowerLv_SP+68 )      ----------�H�����b�b�ޯ�C����m
--		SysCastSpellLv ( OwnerID(), OwnerID(), 498218,  0  )
--	end	
--end
--
-----------------------------------------------------------------------------�˪k LV40�����@���W�d����
--function lua_Dy_PetCriAgiup_03()
--	star_skill_PetSpawnBuff(7)
--	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
--	
--	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---��D�H�����O
--	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---��D�H�k�N�����O
--	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---��D�H���m�O
--	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---��D�H�k�N���m�O
--	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---��D�H���z�ˮ`
--	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---��D�H�k�N�ˮ`
--	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---��D�H���z�R������
--	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---��D�H�k�N�R������
--	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---��D�H�z������
--	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---��D�H�k�z����
--	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---��D�H��q�W��
--	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---Ū�D�H������
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
--	if CheckBuff( Master , 620682) == true then --�ˬd�ۤv���L����F�Q��
--		CancelBuff_NoEvent( Master, 620682 )
--	end
--	if CheckBuff( Master , 620678) == true then --�ˬd�ۤv���L����F�Q��
--		CancelBuff(Master,620678)
--	end
--	local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+17 ) ---------���ƪ��ɭ԰O�o��LV��m��W�h
--	if ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 34 then
--		SysCastSpellLv ( OwnerID(), OwnerID(), 493563,  PLevel  )
--		AddBuff( OwnerID() ,504196 ,0, -1 )
--		--say ( Master , "hp34")
--	else
--		AddBuff( OwnerID() ,504196 ,0, -1 )	
--		--say ( Master , "Lvnot34")
--	end
--	local PLevel_2 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+36 ) --�˹C���~�v
--	if CheckFlag( Master , 543091 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504514 , PLevel_2, -1 )
--		AddBuff( OwnerID() ,506421 , PLevel_2, -1 )---0327���e�s�W�A�{������
--		--say (OwnerID() , "cri is True")
--	else 
--		--say (OwnerID() , "cri is False")
--	end
--	local PLevel_3 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+52 ) --�˪k����
--	if CheckFlag( Master, 543093 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 4 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 20 then
--		AddBuff( OwnerID() ,504600 , PLevel_3, -1 )
--		--say (OwnerID() , "Def is True")
--	else 
--		--say (OwnerID() , "Def is False")
--	end
--	local PLevel_4 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+61 ) --�˯��ӾU����
--	if CheckFlag( Master, 543104 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 8 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 25 then
--		AddBuff( OwnerID() ,504711 , PLevel_4, -1 )
--		AddBuff( OwnerID() ,506422 , PLevel_4, -1 )---0327���e�s�W�A�{������
--		--say (OwnerID() , "Agi is True")
--	else 
--		--say (OwnerID() , "Agi is False")
--	end
--	--local PLevel_214 = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+56 ) --�˪k�����@��
--	--if CheckFlag( Master, 543133 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 4 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 40 then
--		--SetPlot( OwnerID() ,"dead","lua_Dy_Protectwm40",500 )
--	--end
--end
---------------------------------------------------------------------------�k�C35 ���F��
function lua_Dy_PetCriAgiup_MS35() -----���F
	star_skill_PetSpawnBuff(4)
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---��D�H�����O
	local MATK = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_ATK) ---��D�H�k�N�����O
	local DEF = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Def) ---��D�H���m�O
	local MDEF = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Def) ---��D�H�k�N���m�O
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---��D�H���z�ˮ`
	local MDMG = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_Dmg) ---��D�H�k�N�ˮ`
	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---��D�H���z�R������
	local MHIT = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_HitLv) ---��D�H�k�N�R������
	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---��D�H�z������
	local MCRI = ReadRoleValue( Master , EM_RoleValue_Fin_Mag_CritRate) ---��D�H�k�z����
	local HP = ReadRoleValue( Master , EM_RoleValue_MaxHP) ---��D�H��q�W��
	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---Ū�D�H������
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
local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+28 ) --�˪k����
	if CheckFlag( Master, 542112 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 4 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and  ReadRoleValue( Master, EM_RoleValue_LV ) >= 50 then
		AddBuff( OwnerID() ,620185 , PLevel, 25 )
		AddBuff( Master ,620185 , PLevel, 25 )
		--say (OwnerID() , "Def is True")
	else 
		--say (OwnerID() , "Def is False")
	end
end
---------------------------------------------------------------------------�v�k �z��������
function lua_Dy_PetCriAgiup_RM15() -----������
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---��D�H�����O
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---��D�H���z�ˮ`
	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---��D�H���z�R������
	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---��D�H�z������
	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---Ū�D�H������
		SetModeEx(OwnerID(),EM_SetModeType_Mark,false)
		SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false)
		SetModeEx(OwnerID(), EM_SetModeType_Move, false)
		SetModeEx(OwnerID(),EM_SetModeType_Fight, false) 
		SetModeEx(OwnerID(),EM_SetModeType_Strikback, false) 
		SetModeEx(OwnerID(),EM_SetModeType_HideName,false)              ---�����Y�W�O�_��ܦW��
		SetModeEx(OwnerID(),EM_SetModeType_HideMinimap,false)           ---����O�_�b�p�a�ϤW���
		SetModeEx(OwnerID(),EM_SetModeType_NotShowHPMP,false)           ---����ܦ��
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