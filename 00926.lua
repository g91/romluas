function lua_star_randomprize(partymember)
	local random_reward = rand(99)
	if CheckBuff( partymember , 502159) == true then              		-----�֦��ӫ�buff���a
			
			random_reward = rand(4)                                        ----�ӫ����~���_���v�]�w��
			--random_reward = 0                                               ----���ն]���O��
			CancelBuff( partymember , 502159 )
	end	
	if random_reward >= 70 and random_reward <= 99 then
		GiveBodyItem( partymember , 202984, 3 )  --�}�H�����Fű��
		GiveBodyItem( partymember , 202986, 6 )  --���۸H��
		GiveBodyItem( partymember , 202989, 6 )  --�Q�d�H��	
	elseif random_reward >= 40 and random_reward < 70 then		
		GiveBodyItem( partymember , 202985, 3 )  --�}�H�����Fű��
		GiveBodyItem( partymember , 202986, 6 )  --���۸H��
		GiveBodyItem( partymember , 202989, 6 )  --�Q�d�H��
	elseif random_reward >= 21 and random_reward < 40 then
		GiveBodyItem( partymember , 202984, 3 )  --�}�H�����Fű��
		GiveBodyItem( partymember , 202988, 3 )  --���V����
		GiveBodyItem( partymember , 202987, 3 )  --��մ���
		GiveBodyItem( partymember , 202986, 3 )  --���۸H��
		GiveBodyItem( partymember , 202989, 3 )  --�Q�d�H��
		GiveBodyItem( partymember , 203014, 3 )  --�������W���_��
	elseif random_reward >= 2 and random_reward < 21 then
		GiveBodyItem( partymember , 202985, 3 )  --�}�H�����Fű��
		GiveBodyItem( partymember , 202988, 3 )  --���V����
		GiveBodyItem( partymember , 202987, 3 )  --��մ���
		GiveBodyItem( partymember , 202986, 3 )  --���۸H��
		GiveBodyItem( partymember , 202989, 3 )  --�Q�d�H��
		GiveBodyItem( partymember , 203013, 3 )  --�w�f���a���H��
	elseif random_reward == 1 then	
		GiveBodyItem( partymember , 202984, 3 )  --�}�H�����Fű��
		GiveBodyItem( partymember , 203014, 3 )  --�������W���_��
		GiveBodyItem( partymember , 203013, 3 )  --�w�f���a���H��			
		GiveBodyItem( partymember , 203017, 3 )  --��������
	elseif random_reward == 0 then	
		local winner = GetName( partymember )
		local string_prize = "[SC_ZONE250PRIZE_0][$SETVAR1="..winner.."]"            ----�����W���o�X�Ť嵲������q
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( partymember , 1 , string_prize )                           ----���j���]���O		
		end
		GiveBodyItem( partymember , 202985, 3 )  --�}�H�����Fű��
		GiveBodyItem( partymember , 203014, 3 )  --�������W���_��
		GiveBodyItem( partymember , 203013, 3 )  --�w�f���a���H��
		GiveBodyItem( partymember , 203017, 3 )  --��������
		GiveBodyItem( partymember , 203018, 1 )  --�Ť嵲��
	end			
end