function Warden_main_493395()	--�˪� �W�O��script
	local own = OwnerID()
	local RoomID = ReadRoleValue( own , EM_RoleValue_RoomID)
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local PlayerLV = ReadRoleValue(own, EM_RoleValue_LV)

--Say(own, "[493395]")
	-- ���O�m��
	Warden_main_493401(own, MainClass, PlayerLV)
	-- ��/�� �۵M�u��
	Warden_main_494362(own, MainClass, SubClass)
end

function Warden_main_493392()	--�˪� ���F���Oscript
	local own = OwnerID()
	local RoomID = ReadRoleValue( own , EM_RoleValue_RoomID)
	local MainClass = ReadRoleValue ( own, EM_RoleValue_VOC)
	local SubClass = ReadRoleValue ( own, EM_RoleValue_VOC_SUB)
	local PlayerLV = ReadRoleValue(own, EM_RoleValue_LV)

--Say(own, "[493392]")
	-- ���O�m��
	Warden_main_493401(own, MainClass, PlayerLV)
end

function Warden_main_493401(own, MainClass, PlayerLV)	--�˪� ���O�m��script
	if MainClass == 7 and PlayerLV >= 40 and CheckBuff(own, 620677) == false then
		SysCastSpellLv( own, own, 493414, 1 )
--Say(own, "[493401]".."Heal")
	end
end

function Warden_main_494362(own, MainClass, SubClass)	--��/�� �۵M�u��script
	if MainClass == 7 and SubClass == 8 and CheckFlag(own, 543124) == true and CheckBuff(own, 505205) == false then
		local PosX = ReadRoleValue(own, EM_RoleValue_X)
		local PosY = ReadRoleValue(own, EM_RoleValue_Y)
		local PosZ = ReadRoleValue(own, EM_RoleValue_Z)
		SysCastSpellLv_Pos( own, PosX, PosY, PosZ, 494606, 1 )
--Say(own, "[494362]".."Heal")
	end
end
------------------------------------------------------------------------------------------------------------------------
--					�l���d������
------------------------------------------------------------------------------------------------------------------------
function lua_Dy_PetHelpCheck()
	if CheckBuff (OwnerID() , 620951) == true then --�M�˧ޯ�Q�ʨ�w���� 
			AddBuff( OwnerID() ,504566 ,0 , 3) --��A�q�������ĪG�A��w�������
			ReCalculate(OwnerID() )
	elseif CheckBuff( OwnerID() , 506461) == true then --�M�˧ޯ��d���j�v-50%�I�k�t��
			AddBuff( OwnerID() ,506517 ,0 , 3) ------add �I�k��u����ڮĪG
			ReCalculate(OwnerID() )
	end
	----- ���ˬd���W���L�e�@���d�����Q�ʮĪG

	--[[if CheckBuff( OwnerID() , 620682) == true then --�ˬd�ۤv���L����F�Q��
		CancelBuff_NoEvent( OwnerID(), 620682 )
	elseif CheckBuff( OwnerID() , 620678) == true then --�ˬd�ۤv���L����̳Q��
		CancelBuff(OwnerID(),620678)
	elseif CheckBuff( OwnerID() , 620709) == true then --�ˬd�ۤv���L����̴˪k35�Q��
		CancelBuff(OwnerID(),620709)
	elseif CheckBuff( OwnerID(), 503948 ) == true then --�ˬd�ۤv���L�۵M����Q��
		CancelBuff( OwnerID(), 503948 )
	elseif CheckBuff( OwnerID(), 500499) == true then --�ˬd�ۤv���L�˹C�H�����j�ƳQ��
		CancelBuff(OwnerID(),500499)
	end--]]
	return true
end
function lua_Dy_PetHelpCheck_1() --�۳�t�@���d�����ɭԡA�۳���N���\�~�R���W�q�ĪG

	----- ���ˬd���W���L�e�@���d�����Q�ʮĪG

	if CheckBuff( OwnerID() , 620682) == true then --�ˬd�ۤv���L����F�Q��
		CancelBuff_NoEvent( OwnerID(), 620682 )
	elseif CheckBuff( OwnerID() , 620678) == true then --�ˬd�ۤv���L����̳Q��
		CancelBuff_NoEvent(OwnerID(),620678)
	elseif CheckBuff( OwnerID() , 620709) == true then --�ˬd�ۤv���L����̴˪k35�Q��
		CancelBuff_NoEvent(OwnerID(),620709)
	elseif CheckBuff( OwnerID(), 503948 ) == true then --�ˬd�ۤv���L�۵M����Q��
		CancelBuff_NoEvent( OwnerID(), 503948 )
	elseif CheckBuff( OwnerID(), 500499) == true then --�ˬd�ۤv���L�H�����j�ƳQ��
		CancelBuff_NoEvent(OwnerID(),500499)
	end
	return true
end

function Lua_PetAttribute()
	star_skill_PetSpawnBuff(7)	--�[�W�@���ˬd�D¾�Ϊ�Buff
	local Pet = OwnerID()
	local PetID = ReadRoleValue( Pet, EM_RoleValue_OrgID )
	local Master = ReadRoleValue ( Pet , EM_RoleValue_OwnerGUID )
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


	local AttributeTable = {ATK, MATK, DEF, MDEF, DMG, MDMG, HIT, MHIT, CRI, MCRI, HP}
	local AttributeRatio ={	--�d�����U���ݩʥ[�v�Y��,���ӤW������
				[102297]={0.08, 0, 0.3, 0.1, 0.08, 0.8, 0.8, 0, 0.3, 0, 0.1};		--����F
				[102324]={0.1, 0, 0.03, 0.03, 0.1, 0, 0.8, 0, 0.8, 0, 0.08};		--�����
				[102325]={0.01, 0.1, 0.01, 0.1, 0, 0.5, 0.5, 0.8, 0, 0.3, 0.08};	--�۵M����
				[102803]={0.15, 0, 0.03, 0.03, 0.1, 0, 0.8, 0, 0.3, 0, 0.06};}		--�b�H���Ͷ�

	local AttributeBuff = 507185	--�U����for�j��Ψӷ�@��¦�Ȫ��A��ڤW�O�q507186�}�l
	for i=1,table.getn(AttributeTable) do
		AddBuff (Pet , AttributeBuff+i , (AttributeTable[i]*AttributeRatio[PetID][i]) , -1)
	end

	----- �H�W���O�d�����U���ݩʳ]�w

	AddBuff( Pet ,620706 ,0, -1 )	-- 620706 �O�b�d�����W �������`�R��
	AddBuff( Pet ,504196 ,0, -1 )	-- 504196 �O�b�d�����W �d����

	-----	�˪� �۵M��t
	if ReadRoleValue( Master, EM_RoleValue_LV ) >= 34 then
		local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+17 ) ---------���ƪ��ɭ԰O�o��LV��m��W�h
		if ReadRoleValue(Pet, EM_RoleValue_OrgID ) == 102325 then	--�۵M���骺��O�H���@�� �]�t�L�ĸ�L�k�i��������ĪG
			AddBuff(Pet, 504898, PLevel, -1)
		else
			SysCastSpellLv ( Pet, Pet, 493563,  PLevel  )
		end
	end
	-----	�˪�/�C�L 20 ���~�v
	if CheckFlag( Master , 543091 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 then
		local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+36 )
		AddBuff( Pet ,504514 , PLevel, -1 )	--�z��Buff
		AddBuff( Pet ,506421 , PLevel, -1 )	--�{��Buff
	end
	-----	�˪�/�C�L 35 �q��
	if CheckFlag( Master , 543121 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and ReadRoleValue(Pet, EM_RoleValue_OrgID ) == 102803 then
		local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+39 )
		AddBuff( Pet ,505184 , PLevel, -1 )
	end
	-----	�˪�/�C�L 60 �L����¶
	if CheckFlag( Master, 546825 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 2 and ReadRoleValue(Pet, EM_RoleValue_OrgID ) == 102803 then
		AddBuff( Pet ,623251 , 0, -1 )
	end
	-----	�˪�/�k�v 20 ����
	if CheckFlag( Master, 543093 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 4 then
		local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+52 )
		AddBuff( Pet ,504600 , PLevel, -1 )
	end
	-----	�˪�/���x 25 �ӾU����
	if CheckFlag( Master, 543104 ) == true and ReadRoleValue( Master, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Master, EM_RoleValue_VOC_SUB ) == 8 then
		local PLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+61 )
		AddBuff( Pet ,504711 , PLevel, -1 )
		AddBuff( Pet ,506422 , PLevel, -1 )---0327���e�s�W�A�{������
	end
end

function Lua_PetDie() --�d�����` �R���j�ƮĪG
	local Pet = OwnerID()
	local Master = ReadRoleValue ( Pet , EM_RoleValue_OwnerGUID )
	local PetID = ReadRoleValue( Pet, EM_RoleValue_OrgID )
	local PetBuff = {620682, 620678, 503948, 500499}
	for i=1,table.getn(PetBuff) do
		if CheckBuff( Master, PetBuff[i] ) == true then CancelBuff_NoEvent( Master , PetBuff[i] ) end --�����D�H���W��Buff
	end
end	

function Lua_MasterDie() --�D�H���` �R���d��
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )
	if CheckID( MyPet ) == true then
		DelObj ( MyPet )
	end
end

------------------------------------------------------------------------------------------------------------------------
--					�d���ޯ����
------------------------------------------------------------------------------------------------------------------------

function Dy_Pet01_CRI() --����� �D�H�z��Ĳ�o�B�~��������
	local Player = OwnerID()
	local MyPet = ReadRoleValue ( Player , EM_RoleValue_PetID ) ------���d��ID
	local Target = ReadRoleValue( Player, EM_RoleValue_AttackTargetID)  --��e�ؼ�
	local PLevel = ReadRoleValue( Player , EM_RoleValue_MagicPowerLv_SP+14 ) --��������������
	if CheckFlag( Player, 543123 ) == true and ReadRoleValue( Player, EM_RoleValue_VOC ) == 7 and  ReadRoleValue( Player, EM_RoleValue_VOC_SUB ) == 4 then
		SysCastSpellLv ( MyPet, Target, 498233,  PLevel  ) --��/�k 35 �F��^�X �j�ƹL����������
	else	
		SysCastSpellLv ( MyPet, Target, 493385,  PLevel  ) --�I�񳥸�����
	end
end

function Dy_WS25MISS(Condition) --�b�H���Ͷ� �H�����bĲ�o
	local Pet = OwnerID()
	local Master = ReadRoleValue ( Pet , EM_RoleValue_OwnerGUID )
	local SkillLevel = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+67 ) --�H�����b������
	
	if Condition == 0 or  Condition == 10 then	--���R��
		SysCastSpellLv ( Pet, Pet, 498218,  SkillLevel  )
		return
	elseif Condition == 2 and checkbuff(Pet,620705) == true then	--�z��
		CancelBuff(Pet,620705)
	end
	if CheckFlag(Master, 546826) == true then
		AddBuff(Master, 623252, 0, 8)
	end

--	if Condition == 2 and checkbuff(Pet,620705) == true then
--		CancelBuff(Pet,620705)
--	elseif Condition == 0 or  Condition == 10 then 
--		SysCastSpellLv ( Pet, Pet, 498218,  0  )
--	end	
end
------------------------------------------------------------------------------------------------------------------------
--			��^�ޯ� - �˪� / �C�L
------------------------------------------------------------------------------------------------------------------------
--�묹 - �ϥΫe�P�_
function YoYo_WS50_CheckPet() 	
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )	--���d��ID
	if CheckID( MyPet ) == true then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MAGICSTRING_5]" , 1 )
		return false
	end
end
--�묹 - ���d����z���A
function lua_Dy_PetByeWS50()
	local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID )	--���d��ID
	if CheckID( MyPet ) == true then
		AddBuff ( MyPet, 503639, 0, 30 )
		return true
	else
		return false
	end
end