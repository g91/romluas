function ic_ha_de_22_01()											---1�������@��
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
		lua_star_BossKilledCount(105931)							---���`�R���᭱��BUFF AND ���`�p�ƾ�(1�����X)
		ic_del_buff_22()											---�R���U���������bBUFF
	end
end
function ic_ha_de_22_02()											---2�������@��						
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
		lua_star_BossKilledCount(105933)						 	---���`�R���᭱��BUFF  AND ���`�p�ƾ�(2�����X)
		lua_star_BossKilledCount(105934)							---���`�R���᭱��BUFF  AND ���`�p�ƾ�(2�����X)
		ic_del_buff_22()											---�R���U���������bBUFF
	end
end
function ic_ha_de_22_03()											---3�������@��
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
		lua_star_BossKilledCount(105935)							---���`�R���᭱��BUFF  AND ���`�p�ƾ�(3�����X)	
		ic_del_buff_22()											---�R���U���������bBUFF
	end
end
function ic_ha_de_22_04()											---4�������@��
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
		lua_star_BossKilledCount(105964)							---���`�R���᭱��BUFF AND ���`�p�ƾ�(4�����X)
		ic_del_buff_22()											---�R���U���������bBUFF
	end
end
function ic_ha_de_22_05()											---5�������@��
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
		lua_star_BossKilledCount(105976)							---���`�R���᭱��BUFF AND ���`�p�ƾ�(5�����X)
		ic_del_buff_22()											---�R���U���������bBUFF
	end
end
function ic_del_buff_22() 											---�R���U��BOSS�����b�Ⱦ��BUFF
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
				godfu= 1 
			end
		end
	end
	local boma = SetSearchAllNPC(RoomID)
	for  j=1 , boma do
		local NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105933			---2��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 
		or	ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105934			---2��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0	then 
				if boss1xx == 1 then 									
					CancelBuff(NpcGID , 508071 )						---�R�����bBUFF
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105935			---3��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1  then 					
					CancelBuff(NpcGID , 508071 )						---�R�����bBUFF
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105964			---4��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1  then 	
					CancelBuff(NpcGID , 508071 )						---�R�����bBUFF
				end
		end	
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105976			---5��(���X)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 and boss4xx == 1 then 	
					CancelBuff(NpcGID , 508071 )						---�R�����bBUFF
				end
		end
	end
end
function ic_nohi_22_02()											---2�����b�Ⱦ��BUFF--��bBOSS�����󲣥ͼ@��
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
function ic_nohi_22_03()											---3�����b�Ⱦ��BUFF--��bBOSS�����󲣥ͼ@��
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 	
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			if boss1xx == 0  then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end
function ic_nohi_22_04()											---4�����b�Ⱦ��BUFF--��bBOSS�����󲣥ͼ@��
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   	
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 	
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
			if  boss1xx == 0   then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end
end
--ic_nohi_All_05				---5�����ͼ@��