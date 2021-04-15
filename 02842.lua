----------------------------------------------------------------------------
--���p�Z��	5.0.9�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB1_4_LV60_FireAndWinWP()
	local OwnID = OwnerID()
	local Fire_powerLV = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 38 )
	local Win_powerLV = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 37 )
	Addbuff ( OwnID , 500160 , Fire_powerLV , -1 )	
	Addbuff ( OwnID , 620350 , Fire_powerLV , -1 )	--�����Z���z���ĪG
	Addbuff ( OwnID , 500161 , Win_powerLV , -1 )
	Addbuff ( OwnID , 620349 , Win_powerLV , -1 )	--�q������R���ĪG
end
----------------------------------------------------------------------------
--���p�Z������	5.0.9�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB1_4_LV60_CancelBuff()
	local OwnID = OwnerID()
	CancelBuff_NoEvent( OwnID , 500160 )
	CancelBuff_NoEvent( OwnID , 500161 )
	CancelBuff_NoEvent( OwnID , 500162 )
	CancelBuff_NoEvent( OwnID , 620350 )	--�R�������Z�����z���ĪG�ĪG
	CancelBuff_NoEvent( OwnID , 620349 )	--�R���q����������z�R���ĪG
end
----------------------------------------------------------------------------
--���p�Z���B�����Z���B�q�����������Buff�����ץ�
----------------------------------------------------------------------------
function lua_bico_JOB1_4_FireThunderFix()	--����506225�P620350�P�ɦs�b
	if CheckBuff( OwnerID() , 620350 ) == true then	--�p�G�ڨ��W�w�g�����p�Z�����z���ĪG�A�������Z�����z���ĪG���|�P�ɦs�b
		return false
	else
		return true
	end	
end
function lua_bico_JOB1_4_WindThunderFix()	--����506226�P620349�P�ɦs�b
	if CheckBuff( OwnerID() , 620349 ) == true then	--�p�G�ڨ��W�w�g�����p�Z�����R���ĪG�A���q��������R���ĪG���|�P�ɦs�b
		return false
	else
		return true
	end	
end
----------------------------------------------------------------------------
--��� �k�N���X�P�_ 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_Punish()
	local OwnID = OwnerID()
	local TarID = TargetID()
	if CheckBuff( TarID , 500140) == true or
	 CheckBuff( TarID , 500146) == true or
	 CheckBuff( TarID , 500168) == true or
	 CheckBuff( TarID , 500169) == true then
		return true
	else
		ScriptMessage( OwnID , OwnID , 1 , "[SC_MAGICSTRING_17]" , 1 )		------�ؼШ��W�S�����L�A�L�k�ϥΦ��ޯ�!
		return false
	end	
end
----------------------------------------------------------------------------
--�t�ƨ�� ����k�N���X�P�_ 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_1_LV70_Punish()
	local OwnID = OwnerID()
	local TarID = TargetID()
	local StrengthenBuff = 500284 --�M�� �j�ƨ��Buff
	local DivinePunishBuff = 502052 --�M�� �t�ƨ��Buff
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 64 ) --�I��̥ثe���t�ƨ���ޯ൥��
	
	if CheckBuff( TarID , 500140) == true or
	 CheckBuff( TarID , 500146) == true or
	 CheckBuff( TarID , 500168) == true or
	 CheckBuff( TarID , 500169) == true then
		Addbuff ( OwnID , StrengthenBuff , PowerLv , -1 )
		Addbuff ( TarID , DivinePunishBuff , PowerLv , 10 )
		return true
	else
		ScriptMessage( OwnID , OwnID , 1 , "[SC_MAGICSTRING_17]" , 1 )		------�ؼШ��W�S�����L�A�L�k�ϥΦ��ޯ�!
		return false
	end	
end
----------------------------------------------------------------------------
--�t�ƨ�� �j�ƨ���ˮ`���򥻪k�N���G 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_1_LV70_Punish_2()
	CancelBuff( OwnerID() , 500284 )  --�Ѱ� �j�ƨ�� ��Buff
end
----------------------------------------------------------------------------
--�大��� ����k�N���X�P�_ 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_2_LV70_Punish()
	local OwnID = OwnerID()
	local TarID = TargetID()
	if CheckBuff( TarID , 500140) == true or
	 CheckBuff( TarID , 500146) == true or
	 CheckBuff( TarID , 500168) == true or
	 CheckBuff( TarID , 500169) == true then
	 	if CheckBuff( OwnID , 500871 ) == true then --�p�G���W�� �M�C ��bBuff
			Addbuff ( OwnID , 623168 , 0 , -1 )   --�M�C �大��� �W��Buff
		end
		return true
	else
		ScriptMessage( OwnID , OwnID , 1 , "[SC_MAGICSTRING_17]" , 1 )		------�ؼШ��W�S�����L�A�L�k�ϥΦ��ޯ�!
		return false
	end	
end
----------------------------------------------------------------------------
--���~ ���[�ˮ` 6.0.0�ץ�����
--��J�G�t�L�h��
----------------------------------------------------------------------------
function YOYO_JOB6_Intimidate( Layer )
	local OwnID = OwnerID()
	local TarID = TargetID()
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 7 ) --�I��̥ثe�����~�ޯ൥��
	local AddDamage = { 490156 , 490157 , 490161 , 490162 }
	SysCastSpellLv( OwnID , TarID , AddDamage[Layer] , PowerLv ) --�̷ӿ�J�h�Ƶ����ˮ`
end
----------------------------------------------------------------------------
--�_�� �P�_�Y���t�L�h�L�򥻮ĪG 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_Shock_1()
	local TarID = TargetID()
	if CheckBuff( TarID , 500140) == true or
	 CheckBuff( TarID , 500146) == true or
	 CheckBuff( TarID , 500168) == true or
	 CheckBuff( TarID , 500169) == true then
		return false
	 end
end
----------------------------------------------------------------------------
--�_�� �B�~�ˮ`�ĪG 6.0.0�ץ�����
--��J�G�t�L�h��
----------------------------------------------------------------------------
function YOYO_JOB6_Shock_2( Layer )
	local OwnID = OwnerID()
	local TarID = TargetID()
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 12 ) --�I��̥ثe���_�٧ޯ൥��
	local AddDamage = { 490163 , 490165 , 490166 , 490167 }
	SysCastSpellLv( OwnID , TarID , AddDamage[Layer] , PowerLv ) --�����_�ٷw�t�ĪG
end
----------------------------------------------------------------------------
--�u�z���� �P�_�t�L���A�^�ǵ��ۨ��@�� 6.0.0�ץ�����
--��J�G�t�L�h��
----------------------------------------------------------------------------
function YOYO_JOB6_TruthShield( Layer )
	local OwnID = OwnerID()
	local TarID = TargetID()
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 11 ) --�I��̥ثe���u�z�����ޯ൥��
	local ShieldBuff = { 500196 , 500197 , 500198 , 500199 } --�u�z���� �@��Buff
	local DivineBuff = { 500140 , 500146 , 500168 , 500169 } --�t�LBuff
	AddBuff( OwnID , ShieldBuff[Layer] , PowerLv , 10 ) --�����ۨ��@�ޮĪG
	for i = 1 , #DivineBuff do
		CancelBuff( TarID , DivineBuff[ i ] ) --�M���t�LBuff
	end
end
----------------------------------------------------------------------------
--�u�z�t�� �u�z�����P�_�t�L���A�^�ǵ��ۨ��@�ޡA�������v�����Ӹt�L 6.0.0�ץ�����
--��J�G�t�L�h��
----------------------------------------------------------------------------
function YOYO_JOB6_5TruthWord( Layer )
	local OwnID = OwnerID()
	local TarID = TargetID()
	local RandNum = DW_RAND(100) --���ü�
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 11 ) --�I��̥ثe���u�z�����ޯ൥��
	local ShieldBuff = { 500196 , 500197 , 500198 , 500199 } --�u�z���� �@��Buff
	local DivineBuff = { 500140 , 500146 , 500168 , 500169 } --�t�LBuff
	AddBuff( OwnID , ShieldBuff[Layer] , PowerLv , 10 ) --�����ۨ��@�ޮĪG
	
	if RandNum > 50 then --50%���v���M���t�L
		for i = 1 , #DivineBuff do
			CancelBuff( TarID , DivineBuff[ i ] ) --�M���t�LBuff
		end
	end
end
----------------------------------------------------------------------------
--�i�𤧬� ���\��׮ɴ�ָt�L�ޯ�N�o�ɶ�1�� 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_CourageShield()
	local OwnID = OwnerID()
	Lua_CDtime_set( OwnID , 490149 , -1 ) --��ָt�L�ޯ�N�o�ɶ�1��
end
----------------------------------------------------------------------------
--�ͦs���� ���C��ױM�a���N�o�ɶ�1�� 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_SurvivalInstinct()
	local OwnID = OwnerID()
	Lua_CDtime_set( OwnID , 492935 , -1 ) --��֮�ױM�a�N�o�ɶ�1��
end
----------------------------------------------------------------------------
--�_������ ����i�B�~�����t�L���@�� 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_3_RevengeInstinct()
	local TarID = TargetID()
	local DivineBuff = { 500140 , 500146 , 500168 , 500169 } --�t�LBuff
	local RandNum = DW_RAND(100) --���ü�
	if CheckBuff( TarID , DivineBuff[4] ) == true then
		return
	elseif CheckBuff( TarID , DivineBuff[3] ) == true then
		AddBuff( TarID , DivineBuff[4] , 0 , 10 ) --�����t�L4�ĪG
	elseif CheckBuff( TarID , DivineBuff[2] ) == true then
		if RandNum > 50 then --50%���v�h���@�h
			AddBuff( TarID , DivineBuff[4] , 0 , 10 ) --�����t�L4�ĪG
		else
			AddBuff( TarID , DivineBuff[3] , 0 , 10 ) --�����t�L3�ĪG
		end
	elseif CheckBuff( TarID , DivineBuff[1] ) == true then
		if RandNum > 50 then --50%���v�h���@�h
			AddBuff( TarID , DivineBuff[3] , 0 , 10 ) --�����t�L3�ĪG
		else
			AddBuff( TarID , DivineBuff[2] , 0 , 10 ) --�����t�L2�ĪG
		end
	else
		if RandNum > 50 then --50%���v�h���@�h
			AddBuff( TarID , DivineBuff[2] , 0 , 10 ) --�����t�L2�ĪG
		else
			AddBuff( TarID , DivineBuff[1] , 0 , 10 ) --�����t�L1�ĪG
		end
	end
end
----------------------------------------------------------------------------
--�b�o���w �����t�L4�P���m����N�o�ɶ� 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_4_RepentRule()
	local OwnID = OwnerID()
	local TarID = TargetID()
	AddBuff( TarID , 500169 , 0 , 10 ) --�����t�L4�ĪG
	Lua_CDtime_set( OwnID , 490151 , 0 ) --���m����N�o�ɶ�
end
----------------------------------------------------------------------------
--��o�� ���~ �P �_�� �B�~�������ʥ[�tBuff 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_4_Evil()
	local OwnID = OwnerID()
	AddBuff( OwnID , 502101 , 0 , 3 ) --������o�̮ĪG
end
----------------------------------------------------------------------------
--���Ԭ�� �����t�L���@�� 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_4_ExpeditionBlessing()
	local OwnID = OwnerID()
	local DivineBuff = { 500140 , 500146 , 500168 , 500169 } --�t�LBuff
	if CheckBuff( OwnID , DivineBuff[4] ) == true then
		return
	elseif CheckBuff( OwnID , DivineBuff[3] ) == true then
		AddBuff( OwnID , DivineBuff[4] , 0 , 10 ) --�����t�L4�ĪG
	elseif CheckBuff( OwnID , DivineBuff[2] ) == true then
		AddBuff( OwnID , DivineBuff[3] , 0 , 10 ) --�����t�L3�ĪG
	elseif CheckBuff( OwnID , DivineBuff[1] ) == true then
		AddBuff( OwnID , DivineBuff[2] , 0 , 10 ) --�����t�L2�ĪG
	else
		AddBuff( OwnID , DivineBuff[1] , 0 , 10 ) --�����t�L1�ĪG
	end
end
----------------------------------------------------------------------------
--���t���� �P�_�t�L�^�Ǫv���ĪG���@�� 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_5_DivineRaid()
	local OwnID = OwnerID()
	local TarID = TargetID()
	local DivineBuff = { 500140 , 500146 , 500168 , 500169 } --�t�LBuff
	local DivineHeal = { 490366 , 490367 , 490368 , 490369 } --���t�v��
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 51 ) --�I��̥ثe�����t�����ޯ൥��
	for i = 1 , #DivineBuff do
		if CheckBuff( TarID , DivineBuff[ i ] ) == true then
			SysCastSpellLv( OwnID , OwnID , DivineHeal[ i ] , PowerLv ) --��ۨ��I�i���t�v��
			CancelBuff( TarID , DivineBuff[ i ] ) --�M���t�LBuff
			return
		end
	end
end
----------------------------------------------------------------------------
--���ߧ��� Ĳ�o�d��k�N���@�� 6.0.0�ץ�����
----------------------------------------------------------------------------
function YOYO_JOB6_5_Ambition()
	local OwnID = OwnerID()
	SysCastSpellLv( OwnID , OwnID , 490038 , 0 ) --��ۨ��I�i���t�v��
end