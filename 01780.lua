function Lua_Hao_DandD_Menu_02() -- �I��2��

	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DANDD_BUFF_01]" , C_SYSTEM  )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DANDD_BUFF_01]" , C_SYSTEM  )

	-- [SC_DANDD_BUFF_01]	�A��ߪ��o�{�@�ѯ�������q�b�A���W�y«�A�o�ѯ�q�γ\��A�������U�C
	-- [SC_DANDD_BUFF_02]	�A���եh�B�γo�ѯ�q�A���Mı�o�����R���F�O�q�C
	-- [SC_DANDD_BUFF_03]	�Aı�o�b�o�ѤO�q���@���U�A���F�D�ԧx�Ҫ��i��C
	-- [SC_DANDD_BUFF_04]	�κɥ��O�h�B�γo�ѤO�q����A�Aı�o�A�]�S������x���i�H���˧A�C

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local BuffNumber = 1

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
--		Say(OwnerID() , Zone )
--		Say(OwnerID() , ZoneRange[i] )
		--	BuffNumber = 1 -- �i�I��2��	
			AddBuff( OwnerID() , 506478 , 0 , -1 ) -- HP�W��
			AddBuff( OwnerID() , 506479 , 0 , -1 ) -- MP�W��
			AddBuff( OwnerID() , 506480 , 0 , -1 ) -- �����W��
			AddBuff( OwnerID() , 506481 , 0 , -1 ) -- ���m�W��
			AddBuff( OwnerID() , 506484 , BuffNumber , -1 ) -- �i�I������
			return	-- 2012.10.25 �s�W
		end
	end
	-- 2012.10.25 �s�W�A���t�ӻݨD�X�R
	DebugMsg( OwnerID() , 0 , "Setup" )
	AddBuff( OwnerID() , 506478 , 0 , -1 ) -- HP�W��
	AddBuff( OwnerID() , 506480 , 0 , -1 ) -- �����W��
	AddBuff( OwnerID() , 506481 , 0 , -1 ) -- ���m�W��
	AddBuff( OwnerID() , 506484 , BuffNumber , -1 ) -- �i�I������
	--
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Menu_03() -- �I��3��

	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DANDD_BUFF_01]" , C_SYSTEM  )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DANDD_BUFF_01]" , C_SYSTEM  )

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local BuffNumber = 2

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
--		Say(OwnerID() , Zone )
--		Say(OwnerID() , ZoneRange[i] )
		--	BuffNumber = 2 -- �i�I��3��
			AddBuff( OwnerID() , 506478 , 0 , -1 ) -- HP�W��
			AddBuff( OwnerID() , 506479 , 0 , -1 ) -- MP�W��
			AddBuff( OwnerID() , 506480 , 0 , -1 ) -- �����W��
			AddBuff( OwnerID() , 506481 , 0 , -1 ) -- ���m�W��
			AddBuff( OwnerID() , 506484 , BuffNumber , -1 ) -- �i�I������
			return	-- 2012.10.25 �s�W
		end
	end
	-- 2012.10.25 �s�W�A���t�ӻݨD�X�R
	DebugMsg( OwnerID() , 0 , "Setup" )
	AddBuff( OwnerID() , 506478 , 0 , -1 ) -- HP�W��
	AddBuff( OwnerID() , 506480 , 0 , -1 ) -- �����W��
	AddBuff( OwnerID() , 506481 , 0 , -1 ) -- ���m�W��
	AddBuff( OwnerID() , 506484 , BuffNumber , -1 ) -- �i�I������
	--	
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Cancel_Menu() -- �M�����

	CancelBuff( OwnerID() , 506478 ) -- HP�W��
	CancelBuff( OwnerID() , 506479 ) -- MP�W��
	CancelBuff( OwnerID() , 506480 ) -- �����W��
	CancelBuff( OwnerID() , 506481 ) -- ���m�W��
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_HP() -- �M����@���

	CancelBuff( OwnerID() , 506478 ) -- HP�W��
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_MP() -- �M����@���

	CancelBuff( OwnerID() , 506479 ) -- MP�W��
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_ATK_MATK() -- �M����@���

	CancelBuff( OwnerID() , 506480 ) -- �����W��
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_DEF_MDEF() -- �M����@���

	CancelBuff( OwnerID() , 506481 ) -- ���m�W��
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Cancel_Buff() -- �M���ƥ�Buff

--	CancelBuff( OwnerID() , 506474 ) -- HP�W���I��
--	CancelBuff( OwnerID() , 506475 ) -- MP�W���I��
--	CancelBuff( OwnerID() , 506476 ) -- �����W���I��
--	CancelBuff( OwnerID() , 506477 ) -- ���m�W���I��
--	CancelBuff( OwnerID() , 506597 ) -- HP�W��%��
--	CancelBuff( OwnerID() , 506598 ) -- MP�W��%��
--	CancelBuff( OwnerID() , 506599 ) -- �����W��%��
--	CancelBuff( OwnerID() , 506600 ) -- ���m�W��%��
	-- 2012.10.25 �s�W�A���t�ӻݨD�X�R
	local Player = OwnerID()
	local BuffID = {	506474 , 506475 , 506476 , 506477 ,
			506597 , 506598 , 506599 , 506600 ,
			623689 , 623690 , 623691		}
			
	for i = 1 , #BuffID , 1 do
		CancelBuff( Player , BuffID[i] )
	end
	--
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_CheckBuff() -- �w��5�� �ޯ�Level 

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local BuffLv , BuffNumber , CheckOK -- �ޯ൥�šB�i�I�����ơB�P�w�R��
	local Count = BuffCount ( OwnerID())

	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 506484 then -- �i�I������
			BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
			BuffNumber = BuffLv
		end
	end

	if BuffNumber >= 1 then
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 506484 then -- �H�ޯ�A�P�_Buff����
				BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				CheckOK = 1
--				Say( OwnerID() , "Remain :"..BuffLv )
			end
		end
	elseif BuffNumber == 0 then
		for i = 0 , Count do
			local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 506484 then -- �H�ޯ�A�P�_Buff����
				local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
				CheckOK = 2
--				Say( OwnerID() , "Remain :"..BuffLv )
			end
		end
	end

--	Say( OwnerID() , "CheckOK :"..CheckOK )

	if CheckOK == 1 then -- Buff���Ŭ�1�H�W��
			CancelBuff( OwnerID() , 506484 )
			AddBuff( OwnerID() , 506484 , BuffNumber-1 , -1 ) -- �i�I������

			for i = 0 , Count do
				local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
				if BuffID == 506484 then -- �i�I������
					BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )
					BuffNumber = BuffLv
				end
			end
			if BuffLv == 1 then
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DANDD_BUFF_02]" , C_SYSTEM )
			--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DANDD_BUFF_02]" , C_SYSTEM )
				PlayMotion( OwnerID() , 103 )
			elseif BuffLv == 0 then
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DANDD_BUFF_03]" , C_SYSTEM )
			--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DANDD_BUFF_03]" , C_SYSTEM )
				PlayMotion( OwnerID() , 115 )
			end

	elseif CheckOK == 2 then -- Buff���Ŭ�0��

		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DANDD_BUFF_04]" , C_SYSTEM )
	--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DANDD_BUFF_04]" , C_SYSTEM )

		PlayMotion( OwnerID() , 101 )
		CancelBuff( OwnerID() , 506484 )
		Beginplot( OwnerID() , "Lua_Hao_DandD_Cancel_Menu" , 0 )
	end
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Skill_Lv_HP()

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local Buff

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	if Zone == 110 then -- ���H���] 8 - 15
		Buff = 0 -- PowerLv = 1
	elseif Zone == 251 then -- �Ĵ��_�S�a�U�K�� 14 - 16
		Buff = 2
	elseif Zone == 250 or Zone == 201 then -- �����K�� 17 - 22�B��{�j�Y18-23
		Buff = 4
	elseif Zone == 102 then -- �o��׹D�| 20 - 25
		Buff = 9
--	elseif Zone == 205 then -- ���i�ԥj���31 - 39
--		Buff = 11
	elseif Zone == 103 then -- �褧�ӫ� 35 - 38
		Buff = 14
	elseif Zone == 113 then -- �B���G�H���� 35 - 40
		Buff = 17
	elseif Zone == 104 then -- �K�k���� 40 - 42
		Buff = 19
	elseif Zone == 105 then -- �ƦZ�_�� 45 - 47
		Buff = 22
	elseif Zone == 106 or Zone == 107 then -- �f���ش� 45 -48�B�ب������� 48 - 50
		Buff = 24
	elseif Zone == 108 then -- ���_���] 48 - 50
		Buff = 29
	elseif Zone == 252 or Zone == 114  then -- �W���_��50�B�B���G�H����50
		Buff = 31
	elseif Zone == 126 then -- ��������²���� 52 - 55
		Buff = 34
	elseif Zone == 115 or Zone == 208 then -- �������� 52 - 55�B�ר��h������ 52 - 55 
		Buff = 37
	elseif Zone == 116 or  Zone == 118 then -- �Ӫ줧�� 53 - 55�B���s�}�] 53 - 55
		Buff = 39
	elseif Zone == 123 then  -- �������²���� 55
		Buff = 54
	elseif Zone == 117 or Zone == 119 then -- �������55�B�]�s���_55
		Buff = 59
	elseif Zone == 124 or Zone == 125 then -- ���p���y��²����55 �B�]�H��²����55
		Buff = 64
	elseif Zone == 120 or Zone == 122 then -- �D�H�]�����p���y55�B�D�H�]�� - �]�H��55
		Buff = 69
	elseif Zone == 127 then -- �ԥ����a�U�ʺ���� 56 - 57
		Buff = 44
	end

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
			AddBuff( OwnerID() , 506474 , Buff , -1 ) -- HP�W���I��
			AddBuff( OwnerID() , 506597 , 0 , -1 ) -- HP�W��%��
			return	-- 2012.10.25 �s�W
		end
	end
	
	-- 2012.10.25 �s�W�A���t�ӻݨD�X�R
	AddBuff( OwnerID() , 623689 , 0 , -1 )	-- HP�W���I�ƥ[���T�w10%
	--
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Skill_Lv_MP()

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local Buff 

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	if Zone == 110 then -- ���H���] 8 - 15
		Buff = 0 -- PowerLv = 1
	elseif Zone == 251 or Zone == 250 then -- �Ĵ��_�S�a�U�K�� 14 - 16�B�����K�� 17 - 22
		Buff = 2
	elseif Zone == 201 or Zone == 102 then -- ��{�j�Y18-23�B�o��׹D�| 20 - 25
		Buff = 3
	elseif Zone == 103 or Zone == 113 then -- �褧�ӫ� 35 - 38�B�B���G�H���� 35 - 40
		Buff = 5
	elseif Zone == 104 or Zone == 105 or Zone == 106 then -- �K�k���� 40 - 42�B�ƦZ�_�� 45 - 47�B�f���ش� 45 -48
		Buff = 7
	elseif Zone == 107 or Zone == 108 then -- �ب������� 48 - 50�B���_���] 48 - 50
		Buff = 9
	elseif Zone == 252 or Zone == 114  then -- �W���_��50�B�B���G�H����50
		Buff = 14
	elseif Zone == 126 or Zone == 115  then -- ��������²���� 52 - 55�B�������� 52 - 55
		Buff = 19
	elseif Zone == 208 or Zone == 116 or Zone == 118 then -- �ר��h������ 52 - 55 �B�Ӫ줧�� 53 - 55�B���s�}�] 53 - 55
		Buff = 24
	elseif Zone == 123 or Zone == 117 or Zone == 119 then  -- �������²���� 55�B�������55�B�]�s���_55
		Buff = 29
	elseif Zone == 124 or Zone == 125 then -- ���p���y��²����55 �B�]�H��²����55
		Buff = 34
	elseif Zone == 120 or Zone == 122 then -- �D�H�]�����p���y55�B�D�H�]�� - �]�H��55
		Buff = 39
	elseif Zone == 127 then -- �ԥ����a�U�ʺ���� 56 - 57
		Buff = 29
	end

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
			AddBuff( OwnerID() , 506475 , Buff , -1 ) -- MP�W���I��
			AddBuff( OwnerID() , 506598 , 0 , -1 ) -- MP�W��%��
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Skill_Lv_AT_MAT()

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local Buff 

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	if Zone == 110 then -- ���H���] 8 - 15
		Buff = 0 -- PowerLv = 1
	elseif Zone == 251 then -- �Ĵ��_�S�a�U�K�� 14 - 16
		Buff = 2
	elseif Zone == 250 then -- �����K�� 17 - 22
		Buff = 3
	elseif Zone == 201 or Zone == 102 then -- ��{�j�Y18 - 23�B�o��׹D�| 20 - 25
		Buff = 5
	elseif Zone == 103 or Zone == 113 then -- �褧�ӫ� 35 - 38�B�B���G�H���� 35 - 40
		Buff = 9
	elseif Zone == 104 or Zone == 105 or Zone == 106 then -- �K�k���� 40 - 42�B�ƦZ�_�� 45 - 47�B�f���ش� 45 -48
		Buff = 14
	elseif Zone == 107 or Zone == 108 then -- �ب������� 48 - 50�B���_���] 48 - 50
		Buff = 19
	elseif Zone == 252 or Zone == 114  then -- �W���_��50�B�B���G�H����50
		Buff = 24
	elseif Zone == 126 or Zone == 115  then -- ��������²���� 52 - 55�B�������� 52 - 55
		Buff = 29
	elseif Zone == 208 or Zone == 116 or Zone == 118 then -- �ר��h������ 52 - 55�B�Ӫ줧�� 53 - 55�B���s�}�] 53 - 55
		Buff = 34
	elseif Zone == 123 or Zone == 117 or Zone == 119 then  -- �������²���� 55�B�������55�B�]�s���_55
		Buff = 39
	elseif Zone == 124 or Zone == 125 then -- ���p���y��²����55 �B�]�H��²����55
		Buff = 44
	elseif Zone == 120 or Zone == 122 then -- �D�H�]�����p���y55�B�D�H�]�� - �]�H��55
		Buff = 49
	elseif Zone == 127 then -- �ԥ����a�U�ʺ���� 56 - 57
		Buff = 39
	end

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
			AddBuff( OwnerID() , 506476 , Buff , -1 ) -- �����[���I��
			AddBuff( OwnerID() , 506599 , 0 , -1 ) -- �����[��%��
			return	-- 2012.10.25 �s�W
		end
	end
	
	-- 2012.10.25 �s�W�A���t�ӻݨD�X�R
	AddBuff( OwnerID() , 623690 , 0 , -1 )	-- �����[���T�w10%
	--
end
-------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_DandD_Skill_Lv_DEF_MDEF() -- �w��5�� �ޯ�Level 

	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local Buff

	local ZoneRange = { 	110 , 251 , 250 , 201 , 102 , 205 , 103 , 113 , 104 , 105 , 106 , 107 , 108 , 252 ,
				114 , 126 , 115 , 208 , 116 , 118 , 123 , 117 , 119 , 124 , 125 , 120 , 122 , 127	}

	if Zone == 110 then -- ���H���] 8 - 15
		Buff = 0 -- PowerLv = 1
	elseif Zone == 251 then -- �Ĵ��_�S�a�U�K�� 14 - 16
		Buff = 2
	elseif Zone == 250 or Zone == 201 then -- �����K�� 17 - 22�B��{�j�Y18-23
		Buff = 4
	elseif Zone == 102 then -- �o��׹D�| 20 - 25
		Buff = 9
--	elseif Zone == 205 then -- ���i�ԥj���31 - 39
--		Buff = 11
	elseif Zone == 103 then -- �褧�ӫ� 35 - 38
		Buff = 14
	elseif Zone == 113 then -- �B���G�H���� 35 - 40
		Buff = 17
	elseif Zone == 104 then -- �K�k���� 40 - 42
		Buff = 19
	elseif Zone == 105 then -- �ƦZ�_�� 45 - 47
		Buff = 22
	elseif Zone == 106 or Zone == 107 then -- �f���ش� 45 -48�B�ب������� 48 - 50
		Buff = 24
	elseif Zone == 108 then -- ���_���] 48 - 50
		Buff = 27
	elseif Zone == 252 or Zone == 114  then -- �W���_��50�B�B���G�H����50
		Buff = 29
	elseif Zone == 126 then -- ��������²���� 52 - 55
		Buff = 31
	elseif Zone == 115 or Zone == 208 then -- �������� 52 - 55�B�ר��h������ 52 - 55 
		Buff = 34
	elseif Zone == 116 or  Zone == 118 then -- �Ӫ줧�� 53 - 55�B���s�}�] 53 - 55
		Buff = 37
	elseif Zone == 123 then  -- �������²���� 55
		Buff = 44
	elseif Zone == 117 or Zone == 119 then -- �������55�B�]�s���_55
		Buff = 49
	elseif Zone == 124 or Zone == 125 then -- ���p���y��²����55 �B�]�H��²����55
		Buff = 54
	elseif Zone == 120 or Zone == 122 then -- �D�H�]�����p���y55�B�D�H�]�� - �]�H��55
		Buff = 59
	elseif Zone == 127 then -- �ԥ����a�U�ʺ���� 56 - 57
		Buff = 39
	end

	for i = 1 , table.getn(ZoneRange) , 1 do
		if Zone ==  ZoneRange[i] then
			AddBuff( OwnerID() , 506477 , Buff , -1 ) -- ���m�[���I��
			AddBuff( OwnerID() , 506600 , 0 , -1 ) -- ���m�[��%��
			return	-- 2012.10.25 �s�W
		end
	end
	-- 2012.10.25 �s�W�A���t�ӻݨD�X�R
	AddBuff( OwnerID() , 623691 , 0 , -1 )	-- ���m�[���T�w10%
	--
end
-------------------------------------------------------------------------------------------------------------------------