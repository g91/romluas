function Vip_Member_Check()
	--Debuglog(2 , "Vip_Member_Check.")
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag = ReadRoleValue( OwnerID() , EM_RoleValue_VIP_Flag )
--	DebugMsg( 0 , RoomID ,"Flag = "..Flag )
	local VipList = {}
	for i = 0 , 23 do
		if checkbit( Flag , i ) == true then
			VipList[i] = 1
		else
			VipList[i] = 0
		end
	--	DebugMsg( 0 , RoomID ,"VipList ["..i.."] = "..VipList[i] )
	end
	if VipList[Vip_Member_Flag_design1] == 1 then	-- 2^8	Flag = 8
		if CheckFlag( OwnerID() , 544312 ) == false then
			AddBuff( OwnerID() , 506957 , 0 , -1 )	-- �C��g���ľ�	1�Ѥ��A�W�[�԰��ұo�g���50%�C
			SetFlag( OwnerID() ,  544312 , 1 )
		end
	end
	if VipList[Vip_Member_Flag_design2] == 1 then	-- 2^9	Flag = 9
		if CheckFlag( OwnerID() , 544313 ) == false then
			AddBuff( OwnerID() , 506958 , 0 , -1 )	-- �C��ޯ��ľ�	1�Ѥ��A�W�[�԰��ұo�ޯ��I��50%�C
			SetFlag( OwnerID() ,  544313 , 1 )
		end
	end
	if VipList[Vip_Member_Flag_design3] == 1 then	-- 2^10	Flag = 10
		if CheckFlag( OwnerID() , 544314 ) == false then
			AddBuff( OwnerID() , 506959 , 0 , -1 )	-- �C�驯�B�ľ�	1�Ѥ��A�W�[���~�����v50%�C
			SetFlag( OwnerID() ,  544314 , 1 )
		end
	end
	if VipList[Vip_Member_Flag_design4] == 1 then	-- 2^11	Flag = 11
		if CheckFlag( OwnerID() , 544315 ) == false then
			AddBuff( OwnerID() , 506960 , 0 , -1 )	-- �C��r���ľ�	1�Ѥ��A�W�[���M���ʳt��30%�C 
			SetFlag( OwnerID() ,  544315 , 1 )
		end
	end

	if VipList[Vip_Member_Flag_design5] == 1 then	-- 2^12	Flag = 12
		if CheckFlag( OwnerID() , 544240 ) == false then
			LuaM_TimeLet( 0 , 1440 )			-- �I�]�ĤT���Ŷ����ΤѼƼW�[1��
			-- ( TimeFlagID , Time ) TimeFlagID ���� EX:EM_TimeFlagEffect_BagPage3  Time �ɶ�(��)
			SetFlag( OwnerID() , 544240 , 1 )
		end
	end

	if VipList[Vip_Member_Flag_design6] == 1 then	-- 2^13	Flag = 13
		if CheckFlag( OwnerID() , 544241 ) == false then
			LuaM_TimeLet( 1 , 1440 )			-- �I�]�ĥ|���Ŷ����ΤѼƼW�[1��
			SetFlag( OwnerID() , 544241 , 1 )
		end
	end

	if VipList[Vip_Member_Flag_design7] == 1 then	-- 2^14	Flag = 14
		if CheckFlag( OwnerID() , 544306 ) == false then
			LuaM_TimeLet( 2 , 1440 )			-- �I�]�Ĥ����Ŷ����ΤѼƼW�[1��
			SetFlag( OwnerID() , 544306 , 1 )
		end
	end

	if VipList[Vip_Member_Flag_design8] == 1 then	-- 2^15	Flag = 15
		if CheckFlag( OwnerID() , 544307 ) == false then
			LuaM_TimeLet( 3 , 1440 )			-- �I�]�Ĥ����Ŷ����ΤѼƼW�[1��
			SetFlag( OwnerID() , 544307 , 1 )
		end
	end

	if VipList[Vip_Member_Flag_design9] == 1 then	-- 2^16	Flag = 16
		if CheckFlag( OwnerID() , 544308 ) == false then
			LuaM_TimeLet( 10 , 1440 )		-- �Ȧ�ĤG���Ŷ����ΤѼƼW�[1��
			SetFlag( OwnerID() , 544308 , 1 )
		end
	end

	if VipList[Vip_Member_Flag_design10] == 1 then	-- 2^17	Flag = 17
		if CheckFlag( OwnerID() , 544309 ) == false then
			LuaM_TimeLet( 11 , 1440 )		-- �Ȧ�ĤT���Ŷ����ΤѼƼW�[1��
			SetFlag( OwnerID() , 544309 , 1 )
		end
	end

	if VipList[Vip_Member_Flag_design11] == 1 then	-- 2^18	Flag = 18
		if CheckFlag( OwnerID() , 544310 ) == false then
			LuaM_TimeLet( 12 , 1440 )		-- �Ȧ�ĥ|���Ŷ����ΤѼƼW�[1��
			SetFlag( OwnerID() , 544310 , 1 )
		end
	end

	if VipList[Vip_Member_Flag_design12] == 1 then	-- 2^19	Flag = 19
		if CheckFlag( OwnerID() , 544311 ) == false then
			LuaM_TimeLet( 13 , 1440 )		-- �Ȧ�Ĥ����Ŷ����ΤѼƼW�[1��
			SetFlag( OwnerID() , 544311 , 1 )
		end
	end

	if VipList[Vip_Member_Flag_design13] == 1 then	-- 2^20	Flag = 20
		if CheckFlag( OwnerID() , 544242 ) == false then
			GiveBodyItem( OwnerID() , 202434 , 1 )	-- �C����ȭ��m��
			SetFlag( OwnerID() , 544242 , 1 )
		end
	end
	if VipList[Vip_Member_Flag_design14] == 1 then	-- 2^21	Flag = 21
		if CheckFlag( OwnerID() , 544243 ) == false then
			GiveBodyItem( OwnerID() , 201141 , 1 )	-- �ᥧ�J������ū
			SetFlag( OwnerID() , 544243 , 1 )
		end
	end
	if VipList[Vip_Member_Flag_design15] == 1 then	-- 2^22	Flag = 22
		if CheckFlag( OwnerID() , 544245 ) == false then
			GiveBodyItem( OwnerID() , 205814 , 1 )		-- ���Ը��R���ʭ��m��
			GiveBodyItem( OwnerID() , 206426 , 1 )		-- �j�N���_���լd����
			--GiveBodyItem( OwnerID() , 207470 , 1 ) 		--�C�鬡�ʰƥ�
			SetFlag( OwnerID() , 544245 , 1)
		end
	end
	if VipList[Vip_Member_Flag_design16] == 1 then	-- 2^23	Flag = 23
		if CheckFlag( OwnerID() , 544244 ) == false then
			local Mount = { 203571 , 203572 , 203573 }
			GiveBodyItem( OwnerID() , Mount[rand(3)+1] , 1 )	--�C�駤�M*1
			SetFlag( OwnerID() , 544244 , 1 )
		end
	end
	if CheckBuff( OwnerID() , 507387 ) == false then
		if CheckFlag( OwnerID() , 544316 ) == false then
			AddBuff( OwnerID() , 507387 , 0 , 60 )
			SetFlag( OwnerID() , 544316 , 1 )	--�C��P�_�ѼƳs�򪫫~
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Vip_Keyitem_Zoro()

	SetFlag( OwnerID() , 544240 , 0 ) -- �I�]�ĤT���Ŷ����ΤѼƼW�[1��
	SetFlag( OwnerID() , 544241 , 0 ) -- �I�]�ĥ|���Ŷ����ΤѼƼW�[1��
	SetFlag( OwnerID() , 544242 , 0 ) -- �C����ȭ��m��
	SetFlag( OwnerID() , 544243 , 0 ) -- �ᥧ�J������ū
	SetFlag( OwnerID() , 544244 , 0 ) -- �C�駤�M*1
	SetFlag( OwnerID() , 544245 , 0 ) -- ���Ը��R���ʭ��m��(1��)�B�j�N���_���լd����(1��)
	SetFlag( OwnerID() , 544306 , 0 ) -- �I�]�Ĥ����Ŷ����ΤѼƼW�[1��
	SetFlag( OwnerID() , 544307 , 0 ) -- �I�]�Ĥ����Ŷ����ΤѼƼW�[1��
	SetFlag( OwnerID() , 544308 , 0 ) -- �Ȧ�ĤG���Ŷ����ΤѼƼW�[1��
	SetFlag( OwnerID() , 544309 , 0 ) -- �Ȧ�ĤT���Ŷ����ΤѼƼW�[1��
	SetFlag( OwnerID() , 544310 , 0 ) -- �Ȧ�ĥ|���Ŷ����ΤѼƼW�[1��
	SetFlag( OwnerID() , 544311 , 0 ) -- �Ȧ�Ĥ����Ŷ����ΤѼƼW�[1��
	SetFlag( OwnerID() , 544312 , 0 ) -- �C��g���ľ� 1�Ѥ��A�W�[�԰��ұo�g���50%�C
	SetFlag( OwnerID() , 544313 , 0 ) -- �C��ޯ��ľ� 1�Ѥ��A�W�[�԰��ұo�ޯ��I��50%�C
	SetFlag( OwnerID() , 544314 , 0 ) -- �C�驯�B�ľ� 1�Ѥ��A�W�[���~�����v50%�C
	SetFlag( OwnerID() , 544315 , 0 ) -- �C��r���ľ� 1�Ѥ��A�W�[���M���ʳt��30%�C 
	SetFlag( OwnerID() , 544316 , 0 ) -- �C��P�_�ѼƳs�򪫫~

end