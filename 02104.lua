function ic_ha_de_134_01()
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
		lua_star_BossKilledCount(104458)			-----�j�ĩԫ��  --���`�R���᭱��BUFF  AND ���`�p�ƾ�
		ic_del_buff_134()
	end
end
function ic_ha_de_134_02()
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
		lua_star_BossKilledCount(104225)			-----���򴵯S 	--���`�R���᭱��BUFF    AND ���`�p�ƾ�	
		ic_del_buff_134()
	end
end
function ic_ha_de_134_03()
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
		lua_star_BossKilledCount(104228)			-----���դ��	--���`�R���᭱��BUFF     AND ���`�p�ƾ�	
	end
end
function ic_ha_de_134_04()
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
		lua_star_BossKilledCount(104227)			-----�L��		--���`�R���᭱��BUFF	  AND ���`�p�ƾ�
		ic_del_buff_134()
	end
end
function ic_ha_de_134_05()
	lua_star_BossKilledCount(104224)			-----���V��	--���`�R���᭱��BUFF     AND ���`�p�ƾ�
end
function ic_del_buff_134() --�R���U��BOSS�����b�Ⱦ��BUFF
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	local boss1xx=0  --( NpcGID,EM_RoleValue_Register1)
	local boss2xx=0  --( NpcGID,EM_RoleValue_Register2)
	local boss3xx=0  --( NpcGID,EM_RoleValue_Register3)
	local boss4xx=0  --( NpcGID,EM_RoleValue_Register4)
	local boss5xx=0  --( NpcGID,EM_RoleValue_Register5)
	local boss6xx=0  --( NpcGID,EM_RoleValue_Register6)
	local boss7xx=0  --( NpcGID,EM_RoleValue_Register7)	
	local godfu=0 
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if godfu==0 then 
			if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then 
				boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
				boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
				boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
				boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
				boss5xx= ReadRoleValue( NpcGID,EM_RoleValue_Register5)
				boss6xx= ReadRoleValue( NpcGID,EM_RoleValue_Register6)
				boss7xx= ReadRoleValue( NpcGID,EM_RoleValue_Register7)	
				godfu= 1 
				--say(OwnerID(),"boss1xx="..boss1xx)
				--say(OwnerID(),"boss2xx="..boss2xx)
				--say(OwnerID(),"boss3xx="..boss3xx)
				--say(OwnerID(),"boss4xx="..boss4xx)
				--say(OwnerID(),"boss5xx="..boss5xx)
				--say(OwnerID(),"boss6xx="..boss6xx)
				--say(OwnerID(),"boss7xx="..boss7xx)
			end
		end
	end
	local boma = SetSearchAllNPC(RoomID)
	for  j=1 , boma do
		local NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104225			-----2��
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				--say(OwnerID(),"ffff=")
				if boss1xx == 1 then 
					--say(OwnerID(),"zzzzzzzzzzzzzzzzzzzzz="..boss1xx)
					CancelBuff(NpcGID , 508071 )-------�M������buff
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104228			-----3��
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 then 
					CancelBuff(NpcGID , 508071 )-------�M������buff
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104227			-----4��(�S�Ҥ���3��)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1  then 
					CancelBuff(NpcGID , 508071 )-------�M������buff
				end
		end	
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104224			-----5��
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1  and boss4xx == 1 then 
					CancelBuff(NpcGID , 508071 )-------�M������buff
				end
		end
		--if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104458			-----6��
			--and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			--	if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 and boss4xx == 1 and boss5xx == 1 then 
				--	CancelBuff(NpcGID , 508071 )-------�M������buff
				--end
		--end
		--if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104458			-----7��
			--and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			--	if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 and boss4xx == 1 and boss5xx == 1 and boss6xx == 1 then 
			--		CancelBuff(NpcGID , 508071 )-------�M������buff
			--	end
		--end
	end
end
function ic_nohi_18_134_02()						---���b�Ⱦ��BUFF
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---2��
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)	
			if boss1xx==0 then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end
function ic_nohi_18_134_03()					---���b�Ⱦ��BUFF
	sleep(20)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---3��
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			if boss1xx == 0 or boss2xx == 0  then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
	BeginPlot(OwnerID() , "lua_sasa_104228_Boss" , 0)----���b�Ⱦ���---�S�g��������|�R���ۤv��
end
function ic_nohi_18_134_04()					---���b�Ⱦ��BUFF
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---4��
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			if boss1xx == 0 or boss2xx == 0   then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end
end
function ic_nohi_18_134_05()				---���b�Ⱦ��BUFF
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---5��
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
			--say(OwnerID(),"boss1xx="..boss1xx)
			--say(OwnerID(),"boss2xx="..boss2xx)
			--say(OwnerID(),"boss4xx="..boss4xx)
			if boss1xx == 0 or boss2xx == 0  or boss4xx == 0 then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end	