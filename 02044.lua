function bk_hacker_17_130_01()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	local godlv=0
	local x=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466				-----選擇難度的部分
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
		end
	end 
	if x==1 then 
		AddBuff( OwnerID() , 507717 , 0 , -1 )
		AddBuff( OwnerID() , 507718 , 0 , -1 )
	elseif x==2 then 
		AddBuff( OwnerID() , 507717 , 1 , -1 )
		AddBuff( OwnerID() , 507718 , 1 , -1 )
	elseif x==3 then 
		AddBuff( OwnerID() , 507717 , 2 , -1 )
		AddBuff( OwnerID() , 507718 , 2 , -1 )
	elseif x==4 then 
		AddBuff( OwnerID() , 507717 , 3 , -1 )
		AddBuff( OwnerID() , 507718 , 3 , -1 )
	elseif x==5 then
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	elseif x==0 then 
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	end	
end
function bk_hacker_17_130_02()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	local godlv=0
	local x=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466	then 			-----選擇難度的部分then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			godlv= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
		end
	end 
	if godlv == 0 then 
		AddBuff( OwnerID() , 507719 , 0, -1 )
		AddBuff( OwnerID() , 507720 , 0, -1 )
	elseif godlv == 1 then 

	end
	if x==1 then 
		AddBuff( OwnerID() , 507717 , 0 , -1 )
		AddBuff( OwnerID() , 507718 , 0 , -1 )
	elseif x==2 then 
		AddBuff( OwnerID() , 507717 , 1 , -1 )
		AddBuff( OwnerID() , 507718 , 1 , -1 )
	elseif x==3 then 
		AddBuff( OwnerID() , 507717 , 2 , -1 )
		AddBuff( OwnerID() , 507718 , 2 , -1 )
	elseif x==4 then 
		AddBuff( OwnerID() , 507717 , 3 , -1 )
		AddBuff( OwnerID() , 507718 , 3 , -1 )
	elseif x==5 then
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	elseif x==0 then 
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	end	
end
function bk_hacker_17_130_03()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	local godlv=0
	local x=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466	then 			-----選擇難度的部分then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			godlv= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
		end
	end 
	if godlv == 0 then 
		AddBuff( OwnerID() , 507719 , 1, -1 )
		AddBuff( OwnerID() , 507720 , 1, -1 )
	elseif godlv == 1 then 
		AddBuff( OwnerID() , 507719 , 0, -1 )
		AddBuff( OwnerID() , 507720 , 0, -1 )
	elseif godlv == 2 then 
		
	end
	if x==1 then 
		AddBuff( OwnerID() , 507717 , 0 , -1 )
		AddBuff( OwnerID() , 507718 , 0 , -1 )
	elseif x==2 then 
		AddBuff( OwnerID() , 507717 , 1 , -1 )
		AddBuff( OwnerID() , 507718 , 1 , -1 )
	elseif x==3 then 
		AddBuff( OwnerID() , 507717 , 2 , -1 )
		AddBuff( OwnerID() , 507718 , 2 , -1 )
	elseif x==4 then 
		AddBuff( OwnerID() , 507717 , 3 , -1 )
		AddBuff( OwnerID() , 507718 , 3 , -1 )
	elseif x==5 then
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	elseif x==0 then 
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	end	
end
function bk_hacker_17_130_04()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	local godlv=0
	local x=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466	then 			-----選擇難度的部分then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			godlv= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
		end
	end 
		if godlv == 0 then 
		AddBuff( OwnerID() , 507719 , 2, -1 )
		AddBuff( OwnerID() , 507720 , 2, -1 )
	elseif godlv == 1 then 
		AddBuff( OwnerID() , 507719 , 1, -1 )
		AddBuff( OwnerID() , 507720 , 1, -1 )
	elseif godlv == 2 then 
		AddBuff( OwnerID() , 507719 , 0, -1 )
		AddBuff( OwnerID() , 507720 , 0, -1 )
	elseif godlv == 3 then 
		
	end
	if x==1 then 
		AddBuff( OwnerID() , 507717 , 0 , -1 )
		AddBuff( OwnerID() , 507718 , 0 , -1 )
	elseif x==2 then 
		AddBuff( OwnerID() , 507717 , 1 , -1 )
		AddBuff( OwnerID() , 507718 , 1 , -1 )
	elseif x==3 then 
		AddBuff( OwnerID() , 507717 , 2 , -1 )
		AddBuff( OwnerID() , 507718 , 2 , -1 )
	elseif x==4 then 
		AddBuff( OwnerID() , 507717 , 3 , -1 )
		AddBuff( OwnerID() , 507718 , 3 , -1 )
	elseif x==5 then
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	elseif x==0 then 
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	end		
end
function bk_hacker_17_130_05()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	local godlv=0
	local x=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466	then 			-----選擇難度的部分then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			godlv= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
		end
	end 
	if godlv == 0 then 
		AddBuff( OwnerID() , 507719 , 3, -1 )
		AddBuff( OwnerID() , 507720 , 3, -1 )
	elseif godlv == 1 then 
		AddBuff( OwnerID() , 507719 , 2, -1 )
		AddBuff( OwnerID() , 507720 , 2, -1 )
	elseif godlv == 2 then 
		AddBuff( OwnerID() , 507719 , 1, -1 )
		AddBuff( OwnerID() , 507720 , 1, -1 )
	elseif godlv == 3 then 
		AddBuff( OwnerID() , 507719 , 0, -1 )
		AddBuff( OwnerID() , 507720 , 0, -1 )
	elseif godlv == 4 then 
		
	end
--	Yell( OwnerID(),godlv,5)
	if x==1 then 
		AddBuff( OwnerID() , 507717 , 0 , -1 )
		AddBuff( OwnerID() , 507718 , 0 , -1 )
	elseif x==2 then 
		AddBuff( OwnerID() , 507717 , 1 , -1 )
		AddBuff( OwnerID() , 507718 , 1 , -1 )
	elseif x==3 then 
		AddBuff( OwnerID() , 507717 , 2 , -1 )
		AddBuff( OwnerID() , 507718 , 2 , -1 )
	elseif x==4 then 
		AddBuff( OwnerID() , 507717 , 3 , -1 )
		AddBuff( OwnerID() , 507718 , 3 , -1 )
	elseif x==5 then
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	elseif x==0 then 
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	end	
end
function bk_hacker_17_130_06()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	local godlv=0
	local x=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466	then 			-----選擇難度的部分then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			godlv= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
		end
	end 
		if godlv == 0 then 
		AddBuff( OwnerID() , 507719 , 4, -1 )
		AddBuff( OwnerID() , 507720 , 4, -1 )
	elseif godlv == 1 then 
		AddBuff( OwnerID() , 507719 , 3, -1 )
		AddBuff( OwnerID() , 507720 , 3, -1 )
	elseif godlv == 2 then 
		AddBuff( OwnerID() , 507719 , 2, -1 )
		AddBuff( OwnerID() , 507720 , 2, -1 )
	elseif godlv == 3 then 
		AddBuff( OwnerID() , 507719 , 1, -1 )
		AddBuff( OwnerID() , 507720 , 1, -1 )
	elseif godlv == 4 then 
		AddBuff( OwnerID() , 507719 , 0, -1 )
		AddBuff( OwnerID() , 507720 , 0, -1 )
	elseif godlv == 5 then 
	
	end
	if x==1 then 
		AddBuff( OwnerID() , 507717 , 0 , -1 )
		AddBuff( OwnerID() , 507718 , 0 , -1 )
	elseif x==2 then 
		AddBuff( OwnerID() , 507717 , 1 , -1 )
		AddBuff( OwnerID() , 507718 , 1 , -1 )
	elseif x==3 then 
		AddBuff( OwnerID() , 507717 , 2 , -1 )
		AddBuff( OwnerID() , 507718 , 2 , -1 )
	elseif x==4 then 
		AddBuff( OwnerID() , 507717 , 3 , -1 )
		AddBuff( OwnerID() , 507718 , 3 , -1 )
	elseif x==5 then
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	elseif x==0 then 
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	end	
end
function bk_hacker_17_130_07()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	local godlv=0
	local x=0
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466	then 			-----選擇難度的部分then 
			x= ReadRoleValue( NpcGID,EM_RoleValue_Register1)
			godlv= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
		end
	end 
	if godlv == 0 then 
		AddBuff( OwnerID() , 507719 , 5, -1 )
		AddBuff( OwnerID() , 507720 , 5, -1 )
	elseif godlv == 1 then 
		AddBuff( OwnerID() , 507719 , 4, -1 )
		AddBuff( OwnerID() , 507720 , 4, -1 )
	elseif godlv == 2 then 
		AddBuff( OwnerID() , 507719 , 3, -1 )
		AddBuff( OwnerID() , 507720 , 3, -1 )
	elseif godlv == 3 then 
		AddBuff( OwnerID() , 507719 , 2, -1 )
		AddBuff( OwnerID() , 507720 , 2, -1 )
	elseif godlv == 4 then 
		AddBuff( OwnerID() , 507719 , 1, -1 )
		AddBuff( OwnerID() , 507720 , 1, -1 )
	elseif godlv == 5 then 
		AddBuff( OwnerID() , 507719 , 0, -1 )
		AddBuff( OwnerID() , 507720 , 0, -1 )
	elseif godlv == 6 then 
	
	end
	if x==1 then 
		AddBuff( OwnerID() , 507717 , 0 , -1 )
		AddBuff( OwnerID() , 507718 , 0 , -1 )
	elseif x==2 then 
		AddBuff( OwnerID() , 507717 , 1 , -1 )
		AddBuff( OwnerID() , 507718 , 1 , -1 )
	elseif x==3 then 
		AddBuff( OwnerID() , 507717 , 2 , -1 )
		AddBuff( OwnerID() , 507718 , 2 , -1 )
	elseif x==4 then 
		AddBuff( OwnerID() , 507717 , 3 , -1 )
		AddBuff( OwnerID() , 507718 , 3 , -1 )
	elseif x==5 then
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	elseif x==0 then 
		AddBuff( OwnerID() , 507717 , 4 , -1 )
		AddBuff( OwnerID() , 507718 , 4 , -1 )
	end	
end
function bk_ha_de_130_01()
	--lua_star_BossKilledCount(104461)			-----雅瓦卡  
	bk_ha_de_130()
	bk_130_he_104461()
end
function bk_ha_de_130_02()
	--lua_star_BossKilledCount(103946)			-----夏高多洽
	bk_ha_de_130()
	bk_130_he_103946()
end
function bk_ha_de_130_03()
	--lua_star_BossKilledCount(103947)			-----帕伊察
	bk_ha_de_130()
	bk_130_he_103947()
end
function bk_ha_de_130_04()
	--lua_star_BossKilledCount(103948)			-----利金旺達
	bk_ha_de_130()
	bk_130_he_103948()
end
function bk_ha_de_130_05()
	--lua_star_BossKilledCount(103949)			-----佩謝
	bk_ha_de_130()
	bk_130_he_103949()
end
function bk_ha_de_130_06()
--	lua_star_BossKilledCount(104465)			-----奈洛達斯
	bk_ha_de_130()
	bk_130_he_104465()
end
function bk_ha_de_130_07()
	--lua_star_BossKilledCount(104096)			-----泰德
	---bk_ha_de_130()
	bk_130_he_fi()
end

function bk_ha_de_130()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------讀出現在的room 
	local Count = SetSearchAllNPC(RoomID)
	local bs1=0  ---
	local bs2=0
	local bp1=0
	local bp2=0
	local godlv=0
	local godfu=0 
	for i=1 , Count do
		NpcGID = GetSearchResult()
		if godfu==0 then 
			if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 116466	then 
				godlv= ReadRoleValue( NpcGID,EM_RoleValue_Register3)
				godlv=godlv+1
				WriteRoleValue(NpcGID,EM_RoleValue_Register3,godlv)---- 寫入一個難度選擇鎖
				godfu= 1 
			end

		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104461			-----雅瓦卡
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			bs1=Lua_BuffPosSearch( NpcGID , 507719 )
			bs2=Lua_BuffPosSearch( NpcGID , 507720 )
			if bs1>= 0 then 
				bp1=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp1=bp1-1
				if bp1 == 0 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
				elseif bp1 > 0 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
					AddBuff( NpcGID , 507719 , bp1-1, -1 )
				end
			end
			if bs2>= 0 then 
				bp2=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp2=bp2-1
				if bp2 == 0 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
				elseif bp2 > 0 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
					AddBuff( NpcGID , 507720 , bp2-1, -1 )
				end
			end	
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103946   ----------夏高多洽
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			bs1=Lua_BuffPosSearch( NpcGID , 507719 )
			bs2=Lua_BuffPosSearch( NpcGID , 507720 )
			if bs1 >= 0 then 
				bp1=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp1=bp1-1
				if bp1 == -1 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
				elseif bp1 >= 0 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
					AddBuff( NpcGID , 507719 , bp1, -1 )
				end
			end
			if bs2 >= 0 then 
				bp2=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp2=bp2-1
				if bp2 == -1 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
				elseif bp2 >= 0 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
					AddBuff( NpcGID , 507720 , bp2, -1 )
				end
			end	
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103947   ---------帕伊察
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			bs1=Lua_BuffPosSearch( NpcGID , 507719 )
			bs2=Lua_BuffPosSearch( NpcGID , 507720 )
			if bs1 >= 0 then 
				bp1=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp1=bp1-1
				if bp1 == -1 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
				elseif bp1 >= 0 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
					AddBuff( NpcGID , 507719 , bp1, -1 )
				end
			end
			if bs2 >= 0 then 
				bp2=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp2=bp2-1
				if bp2 == -1 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
				elseif bp2 >= 0 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
					AddBuff( NpcGID , 507720 , bp2, -1 )
				end
			end	
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103948   -------------利金旺達
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			bs1=Lua_BuffPosSearch( NpcGID , 507719 )
			bs2=Lua_BuffPosSearch( NpcGID , 507720 )
			if bs1 >= 0 then 
				bp1=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp1=bp1-1
				if bp1 == -1 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
				elseif bp1 >= 0 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
					AddBuff( NpcGID , 507719 , bp1, -1 )
				end
			end
			if bs2 >= 0 then 
				bp2=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp2=bp2-1
				if bp2 == -1 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
				elseif bp2 >= 0 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
					AddBuff( NpcGID , 507720 , bp2, -1 )
				end
			end	
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103949  -------------佩謝
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			bs1=Lua_BuffPosSearch( NpcGID , 507719 )
			bs2=Lua_BuffPosSearch( NpcGID , 507720 )
			if bs1 >= 0 then 
				bp1=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp1=bp1-1
				if bp1 == -1 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
				elseif bp1 >= 0 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
					AddBuff( NpcGID , 507719 , bp1, -1 )
				end
			end
			if bs2 >= 0 then 
				bp2=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp2=bp2-1
				if bp2 == -1 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
				elseif bp2 >= 0 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
					AddBuff( NpcGID , 507720 , bp2, -1 )
				end
			end	
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104173  -------------佩謝花苞
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			bs1=Lua_BuffPosSearch( NpcGID , 507719 )
			bs2=Lua_BuffPosSearch( NpcGID , 507720 )
			if bs1 >= 0 then 
				bp1=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp1=bp1-1
				if bp1 == -1 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
				elseif bp1 >= 0 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
					AddBuff( NpcGID , 507719 , bp1, -1 )
				end
			end
			if bs2 >= 0 then 
				bp2=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp2=bp2-1
				if bp2 == -1 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
				elseif bp2 >= 0 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
					AddBuff( NpcGID , 507720 , bp2, -1 )
				end
			end	
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104465  -----------奈洛達斯
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			bs1=Lua_BuffPosSearch( NpcGID , 507719 )
			bs2=Lua_BuffPosSearch( NpcGID , 507720 )
			if bs1 >= 0 then 
				bp1=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp1=bp1-1
				if bp1 == -1 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
				elseif bp1 >= 0 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
					AddBuff( NpcGID , 507719 , bp1, -1 )
				end
			end
			if bs2 >= 0 then 
				bp2=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp2=bp2-1
				if bp2 == -1 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
				elseif bp2 >= 0 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
					AddBuff( NpcGID , 507720 , bp2, -1 )
				end
			end	
		end
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104096  -----------泰德
			and ReadRoleValue( NpcGID , EM_RoleValue_IsDead ) == 0 then 
			bs1=Lua_BuffPosSearch( NpcGID , 507719 )
			bs2=Lua_BuffPosSearch( NpcGID , 507720 )
			if bs1 >= 0 then 
				bp1=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp1=bp1-1
				if bp1 == -1 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
				elseif bp1 >= 0 then 
					CancelBuff(NpcGID , 507719 )-------清除神之buff
					AddBuff( NpcGID , 507719 , bp1, -1 )
				end
			end
			if bs2 >= 0 then 
				bp2=BuffInfo( NpcGID , bs1 , EM_BuffInfoType_Power )
				bp2=bp2-1
				if bp2 == -1 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
				elseif bp2 >= 0 then 
					CancelBuff(NpcGID , 507720 )-------清除神之buff
					AddBuff( NpcGID , 507720 , bp2, -1 )
				end
			end	
		end
	end 
end



