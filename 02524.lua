function ic_ha_de_22_01()											---1王死王劇情
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
		lua_star_BossKilledCount(105931)							---死亡刪除後面王BUFF AND 死亡計數器(1王號碼)
		ic_del_buff_22()											---刪除下之王的防駭BUFF
	end
end
function ic_ha_de_22_02()											---2王死王劇情						
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
		lua_star_BossKilledCount(105933)						 	---死亡刪除後面王BUFF  AND 死亡計數器(2王號碼)
		lua_star_BossKilledCount(105934)							---死亡刪除後面王BUFF  AND 死亡計數器(2王號碼)
		ic_del_buff_22()											---刪除下之王的防駭BUFF
	end
end
function ic_ha_de_22_03()											---3王死王劇情
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
		lua_star_BossKilledCount(105935)							---死亡刪除後面王BUFF  AND 死亡計數器(3王號碼)	
		ic_del_buff_22()											---刪除下之王的防駭BUFF
	end
end
function ic_ha_de_22_04()											---4王死王劇情
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
		lua_star_BossKilledCount(105964)							---死亡刪除後面王BUFF AND 死亡計數器(4王號碼)
		ic_del_buff_22()											---刪除下之王的防駭BUFF
	end
end
function ic_ha_de_22_05()											---5王死王劇情
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
		lua_star_BossKilledCount(105976)							---死亡刪除後面王BUFF AND 死亡計數器(5王號碼)
		ic_del_buff_22()											---刪除下之王的防駭BUFF
	end
end
function ic_del_buff_22() 											---刪除下個BOSS的防駭客機制的BUFF
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC(RoomID)
	local boss1xx=0 	 											---( NpcGID,EM_RoleValue_Register1) 1王有沒有死
	local boss2xx=0  												---( NpcGID,EM_RoleValue_Register2)	2王有沒有死
	local boss3xx=0  												---( NpcGID,EM_RoleValue_Register3)	3王有沒有死
	local boss4xx=0  												---( NpcGID,EM_RoleValue_Register4)	4王有沒有死
	local boss5xx=0 												---( NpcGID,EM_RoleValue_Register5)	5王有沒有死
	local boss6xx=0  												---( NpcGID,EM_RoleValue_Register6)	6王有沒有死
	local boss7xx=0  												---( NpcGID,EM_RoleValue_Register7)	7王有沒有死
	local godfu=0 
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if godfu==0 then 
			if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---專屬NPC
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
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105933			---2王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 
		or	ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105934			---2王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0	then 
				if boss1xx == 1 then 									
					CancelBuff(NpcGID , 508071 )						---刪除防駭BUFF
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105935			---3王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1  then 					
					CancelBuff(NpcGID , 508071 )						---刪除防駭BUFF
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105964			---4王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1  then 	
					CancelBuff(NpcGID , 508071 )						---刪除防駭BUFF
				end
		end	
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105976			---5王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 and boss4xx == 1 then 	
					CancelBuff(NpcGID , 508071 )						---刪除防駭BUFF
				end
		end
	end
end
function ic_nohi_22_02()											---2王放防駭客機制的BUFF--放在BOSS的物件產生劇情
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
function ic_nohi_22_03()											---3王放防駭客機制的BUFF--放在BOSS的物件產生劇情
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
function ic_nohi_22_04()											---4王放防駭客機制的BUFF--放在BOSS的物件產生劇情
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
--ic_nohi_All_05				---5王產生劇情