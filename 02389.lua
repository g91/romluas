function ic_ha_de_All_01(X1,BUFF)											---1�������@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC(RoomID)
	local godfu=0 
	local time1=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 
			WriteRoleValue(NpcGID,EM_RoleValue_Register1,1)
			time1=1
		end
	end
	if time1==1 then
		lua_star_BossKilledCount(X1)							---���`�R���᭱��BUFF AND ���`�p�ƾ�(1�����X)
		BUFF()											---�R���U���������bBUFF
	end
end
function ic_ha_de_All_02(X2,BUFF)											---2�������@��						
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC(RoomID)
	local godfu=0 
	local time1=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 
			WriteRoleValue(NpcGID,EM_RoleValue_Register2,1)
			time1=1
		end
	end
	if time1==1 then
		lua_star_BossKilledCount(X2)						 	---���`�R���᭱��BUFF  AND ���`�p�ƾ�(2�����X)
		BUFF()											---�R���U���������bBUFF
	end
end
function ic_ha_de_All_03(X3,BUFF)											---3�������@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC(RoomID)
	local godfu=0 
	local time1=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 
			WriteRoleValue(NpcGID,EM_RoleValue_Register3,1)
			time1=1
		end
	end
	if time1==1 then
		lua_star_BossKilledCount(X3)							---���`�R���᭱��BUFF  AND ���`�p�ƾ�(3�����X)	
		BUFF()											---�R���U���������bBUFF
	end
end
function ic_ha_de_All_04(X4,BUFF)											---4�������@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC(RoomID)
	local godfu=0 
	local time1=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 
			WriteRoleValue(NpcGID,EM_RoleValue_Register4,1)
			time1=1
		end
	end
	if time1==1 then
		lua_star_BossKilledCount(X4)							---���`�R���᭱��BUFF AND ���`�p�ƾ�(4�����X)
		BUFF()											---�R���U���������bBUFF
	end
end
function ic_ha_de_All_05(X5,BUFF)											---5�������@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC(RoomID)
	local godfu=0 
	local time1=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 
			WriteRoleValue(NpcGID,EM_RoleValue_Register5,1)
			time1=1
		end
	end
	if time1==1 then
		lua_star_BossKilledCount(X5)							---���`�R���᭱��BUFF AND ���`�p�ƾ�(5�����X)
		BUFF()											---�R���U���������bBUFF
	end
end
function ic_ha_de_All_06(X6,BUFF)											---6�������@��
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC(RoomID)
	local godfu=0 
	local time1=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 
			WriteRoleValue(NpcGID,EM_RoleValue_Register6,1)
			time1=1
		end
	end
	if time1==1 then
		lua_star_BossKilledCount(X6)							---���`�R���᭱��BUFF AND ���`�p�ƾ�(6�����X)
		BUFF()											---�R���U���������bBUFF
	end
end
function ic_ha_de_All_07(X7,BUFF)											---7�������@��						
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC(RoomID)
	local godfu=0 
	local time1=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 
			WriteRoleValue(NpcGID,EM_RoleValue_Register7,1)
			time1=1
		end
	end
	if time1==1 then
		lua_star_BossKilledCount(X7)							---���`�R���᭱��BUFF AND ���`�p�ƾ�(7�����X)
	end
end
function ic_del_BUFF_All(X2,X3,X4,X5,X6,X7) 											---�R���U��BOSS�����b�Ⱦ��BUFF
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC(RoomID)
	local boss1xx=0 	 											---( NpcGID,EM_RoleValue_Register1) 1�����S����
	local boss2xx=0  												---( NpcGID,EM_RoleValue_Register2)	2�����S����
	local boss3xx=0  												---( NpcGID,EM_RoleValue_Register3)	3�����S����
	local boss4xx=0  												---( NpcGID,EM_RoleValue_Register4)	4�����S����
	local boss5xx=0 												---( NpcGID,EM_RoleValue_Register5)	5�����S����
	local boss6xx=0  												---( NpcGID,EM_RoleValue_Register6)	6�����S����
	local boss7xx=0  												---( NpcGID,EM_RoleValue_Register7)	7�����S����
	local godfu=0 
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if godfu==0 then 
			if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---�M��NPC
				boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
				boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
				boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
				boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
				boss5xx= ReadRoleValue( NpcGID,EM_RoleValue_Register5)
				boss6xx= ReadRoleValue( NpcGID,EM_RoleValue_Register6)
				boss7xx= ReadRoleValue( NpcGID,EM_RoleValue_Register7)	
				godfu= 1 
			end
		end
	end
	local boma = SetSearchAllNPC(RoomID)
	for  j=1 , boma do
		local NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == X2			---2��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0  then 
				if boss1xx == 1 then 									
					CancelBuff(NpcGID , 508071 )						---�R�����bBUFF
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == X3			---3��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 then 					
					CancelBuff(NpcGID , 508071 )						---�R�����bBUFF
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == X4			---4��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 then 	
					CancelBuff(NpcGID , 508071 )						---�R�����bBUFF
				end
		end	
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == X5			---5��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 and boss4xx == 1 then 	
					CancelBuff(NpcGID , 508071 )						---�R�����bBUFF
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == X6			---6��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 and boss4xx == 1 and boss5xx == 1 then 
					CancelBuff(NpcGID , 508071 )						---�R�����bBUFF
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == X7			---7��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 and boss4xx == 1 and boss5xx == 1 and boss6xx == 1 then 
					CancelBuff(NpcGID , 508071 )						---�R�����bBUFF
				end
		end
	end
end
function ic_nohi_All_02()											---2�����b�Ⱦ��BUFF--��bBOSS�����󲣥ͼ@��
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 	
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)	
			if boss1xx==0 then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end
function ic_nohi_All_03()											---3�����b�Ⱦ��BUFF--��bBOSS�����󲣥ͼ@��
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 	
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			if boss1xx == 0 or boss2xx == 0  then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end
function ic_nohi_All_04()											---4�����b�Ⱦ��BUFF--��bBOSS�����󲣥ͼ@��
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 	
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
			if  boss1xx == 0 or boss2xx == 0  or boss3xx == 0  then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end
end
function ic_nohi_All_05()											---5�����b�Ⱦ��BUFF--��bBOSS�����󲣥ͼ@��
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 	
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
			boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
			if  boss1xx == 0 or boss2xx == 0  or boss3xx == 0 or boss4xx == 0   then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end	
function ic_nohi_All_06()											---6�����b�Ⱦ��BUFF--��bBOSS�����󲣥ͼ@��
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 	
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
			boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
			boss5xx= ReadRoleValue( NpcGID,EM_RoleValue_Register5)
			if boss1xx == 0 or boss2xx == 0  or boss3xx == 0 or boss4xx == 0  or boss5xx == 0 then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end	
function ic_nohi_All_07()											---7�����b�Ⱦ��BUFF--��bBOSS�����󲣥ͼ@��
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 	
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
			boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
			boss5xx= ReadRoleValue( NpcGID,EM_RoleValue_Register5)
			boss6xx= ReadRoleValue( NpcGID,EM_RoleValue_Register6)
			if  boss1xx == 0 or boss2xx == 0  or boss3xx == 0 or boss4xx == 0  or boss5xx == 0 or boss6xx == 0 then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end	