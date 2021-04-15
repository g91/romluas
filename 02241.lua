function Lua_LifeSkills_LevelLimit( TID, OID, Independent )--�ͬ��ޯ� �}��W��
	--TID = NPC; OID = ���a; Independent = �W�ߨ��o true/false
	local Flag = LifeSkills_LevelLimit--���n���~(�}�C)
	Independent = Independent or false -- �w�]��(�W��)
	TID = TID or TargetID()-- �w�]��(NPC)
	OID = OID or OwnerID()-- �w�]��(���a)
	--//////////////////////////
	--PID �O�զX�Ʀr ��}�ӥi�H�N���P�t�N
	--Type �O�d��M�ʦ�Φ����G��ơA�o�ӤG��Ƶ��PGM���O�����ͬ��ޯ�N��
	--Level �O �ޯඥ�Ū��W�� �Ͳ��ޯ�t�άO�� 20�����ŶZ �]���ݭn���D��NPC�t�d���̰��ŶZ���B(�]�O�ӭȪ��@��)
	--/////////////////////////
	local Skill = ReadRoleValue( TID, EM_RoleValue_PID ) --�ͬ��ޯ�]�w�W��
	local Type = math.floor(Skill/100) --�ͬ��ޯ����O
	local Level = Skill%100 --�T�{�ޯඥ�� �@��O�Ӧ�� 20�I���@�� 
	
	--/////////////////////////
	--
	--(��)LimitNum �O�����F�������ͬ��ޯ�ƶq�A�C�Ӫ��a���u�������������ޯ�ơA�]���n�έp�ƶq�A�קK���a���o�W�L�Q���\���ƶq
	--BaseValue �O�ΰj��ӳv�B�T�{���a�{������ �Y ��Independent�o�ӰѼƼv�T�A BaseValue �N���|�q1�}�l�ˬd
	--/////////////////////////
	local LimitNum = 0
	local BaseValue = 1
	--/////////////////////////
	--�s�����ͬ��ޯ�W���W�h�A���A��Ҧ����ͬ��ޯ���}�Ӻ�A �ӬO�����Ͳ��٦��Ķ�����
	--/////////////////////////
	local limit = {collect=0, make=0 };
	
	local SkillType = { 
		[15] = ReadRoleValue ( OID, EM_RoleValue_Skill_BlackSmith ),	--���K
		[16] = ReadRoleValue ( OID, EM_RoleValue_Skill_Carpenter ),	--��u
		[17] = ReadRoleValue ( OID, EM_RoleValue_Skill_MakeArmor ),	--�s��
		[18] = ReadRoleValue ( OID, EM_RoleValue_Skill_Tailor ),		--���_
		[19] = ReadRoleValue ( OID, EM_RoleValue_Skill_Cook ),		--�i��
		[20] = ReadRoleValue ( OID, EM_RoleValue_Skill_Alchemy ),	--�Ҫ�

		[21] = ReadRoleValue ( OID, EM_RoleValue_Skill_Mining ),	--���q
		[22] = ReadRoleValue ( OID, EM_RoleValue_Skill_Lumbering ),	--���
		[23] = ReadRoleValue ( OID, EM_RoleValue_Skill_Herblism )	--����
	}
	--/////////////////////////	
	--�쥻���ǲߤW���]���Q���� 9 6 3 1 1  �ܦ��Ķ� 3 2 1 1 1 �Ͳ� 6 4 2 1 1  �]���έp�ݭn���P�������}�p��
	--/////////////////////////	
	--�ӫ��D�㪺���J
	local mall={
		[2] = {548066, 548067, 548068};
		[3] = {548069, 548070, 548071, 548072, 548073, 548074};
		[4] = {548075, 548076, 548077, 548078, 548079, 548080, 548081};
		[5] = {548082, 548083, 548084, 548085, 548086, 548087, 548088};
	}
	local SkillNum = {}
	SkillNum.non_division={
		[1]	= 9,--�Ǯ{
		[2]	= 6,--�u�K
		[3]	= 3,--�M��
		[4]	= 2,--�j�v(�s��O2��)
		[5]	= 2--�ǩ_(�s��O2��)
	}
	for lv,flag_table in pairs(mall)do
		for __,flag in pairs(flag_table) do
			if CheckFlag(OID, flag)==true then
				SkillNum.non_division[lv]=SkillNum.non_division[lv]+1;
			end
		end
	end
	--�Ķ��P�_
	SkillNum.collect={
		[1]	= 3,--�Ǯ{
		[2]	= 2,--�u�K
		[3]	= 1,--�M��
		[4]	= 1,--�j�v
		[5]	= 1--�ǩ_
	}
	for lv,flag_table in pairs(mall)do
		for __,flag in pairs(flag_table) do
			if CheckFlag(OID, flag)==true then
				SkillNum.collect[lv]=SkillNum.collect[lv]+1;
			end
		end
	end
	--�Ͳ��P�_
	SkillNum.make={
		[1]	= 6,--�Ǯ{
		[2]	= 4,--�u�K
		[3]	= 2,--�M��
		[4]	= 1,--�j�v
		[5]	= 1--�ǩ_
	}
	for lv,flag_table in pairs(mall)do
		for __,flag in pairs(flag_table) do
			if CheckFlag(OID, flag)==true then
				SkillNum.make[lv]=SkillNum.make[lv]+1;
			end
		end
	end
	
	if Independent == true then--�Y���W�ߧP�_�u���level����
		BaseValue = Level
	end
	
	for i=BaseValue, Level do
		limit = {collect=0, make=0, non_division=0};
		--�Ѧҥ����ܼư}�C�A�ˬd���a�����ǥͲ��ޯ���
		--�Ͳ��t�C
		for j=15, 20 do--�`�ƶq
			if CheckFlag( OID, Flag[j*100+i] ) == true then
				limit.make = limit.make +1
				limit.non_division = limit.non_division +1;
			end
		end
		--�Ķ��t�C
		for j=21, 23 do--�`�ƶq
			if CheckFlag( OID, Flag[j*100+i] ) == true then
				limit.collect = limit.collect +1
				limit.non_division = limit.non_division +1;
			end
		end
		--debugmsg(0,0, "LimitNum = "..LimitNum .."; SkillNum = "..SkillNum[i] )
		if i == Level and CheckFlag( OID, Flag[Type*100+i] ) == true then
			--���������Ͳ��ޯ�(��npc�ҭt�d��)�A���a�w���ɶ����A���ݦA�ǲ�
			return 0
		elseif Type<=23 and Type>=21 then
			--�Ӿɮv�O�Ķ��t
			if limit.collect >= SkillNum.collect[i] then
				--���a�w�g��F��ǲߪ�"�ͬ��ޯ����"�ƪ��W��
				if i == Level or CheckFlag( OID, Flag[Type*100+i] ) ~= true then
					return 2;
				end
			elseif limit.non_division >= SkillNum.non_division[i] then
				return 2;
			end
		elseif Type<=20 and Type>=15 then
			--�Ӿɮv�O�ͨt�t
			if limit.make >= SkillNum.make[i] then
				--���a�w�g��F��ǲߪ�"�ͬ��ޯ����"�ƪ��W��
				if i == Level or CheckFlag( OID, Flag[Type*100+i] ) ~= true then
					return 2;
				end
			elseif limit.non_division >= SkillNum.non_division[i] then
				return 2;
			end
		end
		if SkillType[Type] == (i-1)*20 and CheckFlag( OID, Flag[Type*100+i] ) ~= true then
			--���������Ͳ��ޯ�(��npc�ҭt�d��)�A�w�g�m�쳻�A�ӥB�]�٨S�Ƿ|
			SetFlag( OID, Flag[Type*100+i], 1 )--�}��
			if i == 1 then
				Lua_LifeSkills_GetSkillFirst(Type)--�Ĥ@�����o�ͬ��ޯ�(����)
			end
			return 1--���o		
		elseif SkillType[Type] < (i-1)*20 then
			--���������Ͳ��ޯ�(��npc�ҭt�d��)�٨S�m�쳻
			return 3
		end
	end

end

function Lua_LifeSkills_Demote( TID, OID )--�ͬ��ޯ� ����
	TID = TID or TargetID()-- �w�]��(NPC)
	OID = OID or OwnerID()-- �w�]��(���a)
	local Flag = LifeSkills_LevelLimit--���n���~(�}�C)
	local Skill = ReadRoleValue( TID, EM_RoleValue_PID ) --�ͬ��ޯ�]�w�W��
	local Type = math.floor(Skill/100) --�ͬ��ޯ����O

	local SkillType = { 
		[15] = ReadRoleValue ( OID, EM_RoleValue_Skill_BlackSmith ),	--���K
		[16] = ReadRoleValue ( OID, EM_RoleValue_Skill_Carpenter ),	--��u
		[17] = ReadRoleValue ( OID, EM_RoleValue_Skill_MakeArmor ),	--�s��
		[18] = ReadRoleValue ( OID, EM_RoleValue_Skill_Tailor ),	--���_
		[19] = ReadRoleValue ( OID, EM_RoleValue_Skill_Cook ),		--�i��
		[20] = ReadRoleValue ( OID, EM_RoleValue_Skill_Alchemy ),	--�Ҫ�
		[21] = ReadRoleValue ( OID, EM_RoleValue_Skill_Mining ),	--���q
		[22] = ReadRoleValue ( OID, EM_RoleValue_Skill_Lumbering ),	--���
		[23] = ReadRoleValue ( OID, EM_RoleValue_Skill_Herblism )	--����
	}
	
--	debugmsg(0,0,"SkillLevel = "..SkillType[Type])
	for i=5, 1, -1 do
		if SkillType[Type] <= i*20 and SkillType[Type] >= (i-1)*20 and  CheckFlag( OID, Flag[Type*100+i] ) == true then
			--debugmsg(0,0,"Down")
			SetFlag( OID, Flag[Type*100+i], 0 )--����
			break
		end
	end
end

function Lua_LifeSkills_GetSkillFirst(Type)--�Ĥ@�����o�ͬ��ޯ�(����)
		local OID = OwnerID()
		local array = {}
		----------------------------���K------------------------------
		array[15] = function()
			SetFlag( OID, 540268, 1 );	-- ����540268���K�Ǯ{
			SetFlag( OID, 540278, 1 );	-- <�������n���~540278-�t��-�^�v���>
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_BLACKSMITH_1"), C_SYSTEM );--�e�������T���G�A�w���o���K�Ǯ{���
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_BLACKSMITH_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o���K�Ǯ{���A���K���ŤW����20�šC
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_BLACKSMITH_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�^�v��ҡv�C		
		end

		----------------------------��u------------------------------
		array[16] = function()
			SetFlag( OID, 540334, 1 );	-- ����540334��u�Ǯ{
			SetFlag( OID,540397, 1 );	-- <�������n���~540397-�t��-�Ӥ�}>
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_WOODWORKER_1"), C_SYSTEM );--�e�������T���G�A�w���o��u�Ǯ{���
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_WOODWORKER_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o��u�Ǯ{���A��u���ŤW����20�šC
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_WOODWORKER_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�Ӥ�}�v�C
		end

		----------------------------�s��------------------------------
		array[17] = function()
			SetFlag( OID, 540335, 1 );	-- ����540335�s�ҾǮ{
			SetFlag( OID,540984, 1 );	-- ����540504�t��-���O�ݥ�
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_ARMOR_1"), C_SYSTEM );--�e�������T���G�A�w���o�s�ҾǮ{���
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_ARMOR_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o�s�ҾǮ{���A�s�ҵ��ŤW����20�šC
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_ARMOR_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-���O�ݥҡv�C
		end

		----------------------------���_------------------------------
		array[18] = function()
			SetFlag( OID, 540336, 1 );	-- ����540336���_�Ǯ{���
			SetFlag( OID, 540526, 1 );	-- ����540526�t��-�ʥ���
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_TAILOR_1"), C_SYSTEM );--�e�������T���G�A�w���o���_�Ǯ{���
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_TAILOR_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o���_�Ǯ{���A���_���ŤW����20�šC
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_TAILOR_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�ʥ��ǡv�C
		end

		----------------------------�i��------------------------------
		array[19] = function()
			SetFlag( OID, 540337, 1 );	-- ����540337�i���Ǯ{
			SetFlag( OID, 540570, 1 );	-- ����540570�t��-�N��
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_COOK_1"), C_SYSTEM );--�e�������T���G�A�w���o�i�����Ǯ{���
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_COOK_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o�i�����Ǯ{���A�i�����ŤW����20�šC
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_COOK_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-�N���v�C
		end

		----------------------------�Ҫ�------------------------------
		array[20] = function()
			SetFlag( OID, 540338, 1 );	-- ����540338�Ҫ��Ǯ{
			SetFlag( OID, 540606, 1 );	-- ����540606�t��-��¦������
			ScriptMessage( OID, OID, 2, GetString("MSG_GET_ALCHEMY_1"), C_SYSTEM );--�e�������T���G�A�w���o�Ҫ��Ǯ{���
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_ALCHEMY_1_D"), "0xFFFF8000");--�T�������T���G�A�w���o�Ҫ��Ǯ{���A�Ҫ����ŤW����20�šC
			ScriptMessage( OID, OID, 0, GetString("MSG_GET_ALCHEMY_FORMULA1"), C_YELLOW);--�T�������T���G�A�w�߱o�u�t��-��¦�����ġv�C
		end
		if array[Type] ~= nil then
			array[Type]()--����
		end
end