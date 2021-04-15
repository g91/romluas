-----------------------------------------------------------------------------------------------zone 123遺民殿堂

function star_zone123_initial(RoomID)				
	
	local Count = SetSearchAllNPC(RoomID)
	local Boss1 = {}
	local NpcGID  

	for i=1 , Count do
		NpcGID = GetSearchResult()		
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 113376 then
			Boss1[0] = NpcGID
			break
		end
	end
	--BeginPlot( Boss1[0] , "star_zone123_load" , 50 )			
end

function star_zone123_load()
	sleep(60)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Save = ReadInstanceArg( RoomID , 0 )
	local Count = SetSearchAllNPC(RoomID)
	local Boss1 = {}
	local Boss2 = {}
	local Boss3 = {}
	local Boss4 = {}
	local Boss5 = {}
	local Boss6 = {}
	local Boss7 = {}
	local NpcGID 

	Boss1 , Boss2 , Boss3 , Boss4 , Boss5 , Boss6 , Boss7 = star_zone123_SearchBoss(0 , RoomID)
	local Boss = {Boss1 , Boss2 , Boss3 , Boss4 , Boss5 , Boss6 , Boss7 }

	for x=7 , 1 , -1 do 
		if Save >= math.pow( 10 , x-1 ) then
			local BossTemp = {}
			BossTemp = Boss[x]
			for y=1 , table.getn(BossTemp) do
				DelObj( BossTemp[y] )	
			end	
			Save = Save - math.pow( 10 , x-1 )			
		end	
	end	
end

function star_zone123_SearchBoss(IsBossDeadCheck , RoomID)
	local Count = SetSearchAllNPC(RoomID)
	local Boss1 = {}
	local Boss2 = {}
	local Boss3 = {}
	local Boss4 = {}
	local Boss5 = {}
	local Boss6 = {}
	local Boss7 = {}
	local NpcGID  
	local Save = 0
	--local Boss = {}
	--local OrgID = {103263 , 103241 , 103266 , 103205 , 103230 , 103199 , 103212 , 103200}

	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 113376 then		-----門口NPC(用來searchnpc)
			Boss1[0] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103212			-----安德弗立姆   
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103220 then
			Boss7[table.getn(Boss7)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103199			-----曼特瑞克
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103200
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 113417
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103204 then
			Boss6[table.getn(Boss6)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103230	then	-----血之制裁者		 
			Boss5[table.getn(Boss5)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103205			-----瓦爾哈拉
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103206 
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103211
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102960 then			-----控制器
			Boss4[table.getn(Boss4)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103266			-----鋼之制裁者     
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103273 
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103578
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103272 then
			Boss3[table.getn(Boss3)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103241			-----格拉默
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103240
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103248 
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103801 then
			Boss2[table.getn(Boss2)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103263			-----劍之制裁者
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103577 then
			Boss1[table.getn(Boss1)+1] = NpcGID	
		end
	end
	if IsBossDeadCheck == 0 then
		return Boss1 , Boss2 , Boss3 , Boss4 , Boss5 , Boss6 , Boss7
	end
end