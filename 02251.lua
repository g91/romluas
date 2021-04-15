function ic_ha_de_136_01()	---1王死王劇情
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
		lua_star_BossKilledCount(105200)			-----  --死亡刪除後面王BUFF  AND 死亡計數器
		ic_del_buff_136()
	end
end
function ic_ha_de_136_02()	---2王死王劇情						
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
		lua_star_BossKilledCount(105456)			----- 	--死亡刪除後面王BUFF    AND 死亡計數器	
		ic_del_buff_136()
	end
end
function ic_ha_de_136_03()	---3王死王劇情
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
		lua_star_BossKilledCount(104605)			-----	--死亡刪除後面王BUFF     AND 死亡計數器	
		ic_del_buff_136()
	end
end
function ic_ha_de_136_04()	---4王死王劇情
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
		lua_star_BossKilledCount(105204)			-----		--死亡刪除後面王BUFF	  AND 死亡計數器
		ic_del_buff_136()
	end
end
function ic_ha_de_136_05()	---5王死王劇情
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
		lua_star_BossKilledCount(105099)			-----		--死亡刪除後面王BUFF	  AND 死亡計數器
		ic_del_buff_136()
	end
end
function ic_ha_de_136_06()	---6王死王劇情
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
		lua_star_BossKilledCount(104592)			-----		--死亡刪除後面王BUFF	  AND 死亡計數器
		ic_del_buff_136()
	end
end
function ic_ha_de_136_07()	---7王死王劇情						
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
		lua_star_BossKilledCount(104582)			-----		--死亡刪除後面王BUFF	  AND 死亡計數器
	end
end
function ic_del_buff_136() --刪除下個BOSS的防駭客機制的BUFF
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
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
			if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then --專屬NPC
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
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104590			-----2王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 or 
			 ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104591			-----2王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 then 
					CancelBuff(NpcGID , 508071 )-------清除神之buff
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104605			-----3王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 then 
					CancelBuff(NpcGID , 508071 )-------清除神之buff
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105204			-----4王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 then 
					CancelBuff(NpcGID , 508071 )-------清除神之buff
				end
		end	
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 105099			-----5王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 and boss4xx == 1 then 
					CancelBuff(NpcGID , 508071 )-------清除神之buff
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104592			-----6王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 and boss4xx == 1 and boss5xx == 1 then 
					CancelBuff(NpcGID , 508071 )-------清除神之buff
				end
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104582			-----7王(號碼)
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
				if boss1xx == 1 and boss2xx == 1 and boss3xx == 1 and boss4xx == 1 and boss5xx == 1 and boss6xx == 1 then 
					CancelBuff(NpcGID , 508071 )-------清除神之buff
				end
		end
	end
end
function ic_nohi_19_136_02()						---放防駭客機制的BUFF--放在BOSS的物件產生劇情
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---2王
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			--boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			--boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
			--boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
			--boss5xx= ReadRoleValue( NpcGID,EM_RoleValue_Register5)
			--boss6xx= ReadRoleValue( NpcGID,EM_RoleValue_Register6)	
			if boss1xx==0 then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end
function ic_nohi_19_136_03()					---放防駭客機制的BUFF--放在BOSS的物件產生劇情
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---3王
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			--boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
			--boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
			--boss5xx= ReadRoleValue( NpcGID,EM_RoleValue_Register5)
			--boss6xx= ReadRoleValue( NpcGID,EM_RoleValue_Register6)
			if boss1xx == 0 or boss2xx == 0  then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end
function ic_nohi_19_136_04()					---放防駭客機制的BUFF--放在BOSS的物件產生劇情
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---4王
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
			--boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
			--boss5xx= ReadRoleValue( NpcGID,EM_RoleValue_Register5)
			--boss6xx= ReadRoleValue( NpcGID,EM_RoleValue_Register6)
			if  boss1xx == 0 or boss2xx == 0  or boss3xx == 0  then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end
end
function ic_nohi_19_136_05()				---放防駭客機制的BUFF--放在BOSS的物件產生劇情
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---5王
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
			boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
			--boss5xx= ReadRoleValue( NpcGID,EM_RoleValue_Register5)
			--boss6xx= ReadRoleValue( NpcGID,EM_RoleValue_Register6)
			if  boss1xx == 0 or boss2xx == 0  or boss3xx == 0 or boss4xx == 0   then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end	
function ic_nohi_19_136_06()				---放防駭客機制的BUFF--放在BOSS的物件產生劇情
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---6王
			boss1xx= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			boss2xx= ReadRoleValue( NpcGID,EM_RoleValue_Register2)
			boss3xx= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
			boss4xx= ReadRoleValue( NpcGID,EM_RoleValue_Register4)
			boss5xx= ReadRoleValue( NpcGID,EM_RoleValue_Register5)
			--boss6xx= ReadRoleValue( NpcGID,EM_RoleValue_Register6)
			if boss1xx == 0 or boss2xx == 0  or boss3xx == 0 or boss4xx == 0  or boss5xx == 0 then
				AddBuff( OwnerID() , 508071 , 0, -1 )
			end
		end
	end	
end	
function ic_nohi_19_136_07()				---放防駭客機制的BUFF--放在BOSS的物件產生劇情
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103120	then ---7王
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