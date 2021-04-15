-------------------------------------------------------------------------------------------------------------------------zone 122 副本儲存使用
function star_zone122_initial(RoomID)				
	SetRoomValue( RoomID , 0 , 1)		------讀取場景type1
	local Count = SetSearchAllNPC(RoomID)
	local Boss1 = {}
	local NpcGID  

	for i=1 , Count do
		NpcGID = GetSearchResult()		
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 114289 then
			Boss1[0] = NpcGID
			break
		end
	end
	--BeginPlot( Boss1[0] , "star_zone122_load" , 50 )			
end

function star_zone122_load()
	sleep(60)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Save = ReadInstanceArg( RoomID , 0 )
	local Count = SetSearchAllNPC(RoomID)
	local Boss1 = {}
	local Boss2 = {}
	local Boss3 = {}
	local Boss4 = {}
	local Boss5 = {}
	local NpcGID  

	Boss1 , Boss2 , Boss3 , Boss4 , Boss5 = star_zone122_SearchBoss(0 , RoomID)
	local Boss = { Boss1 , Boss2 , Boss3 , Boss4 , Boss5 }
	
	for x=5 , 1 , -1 do 
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

function star_zone122_SearchBoss(IsBossDeadCheck , RoomID)
	local Count = SetSearchAllNPC(RoomID)
	local Boss1 = {}
	local Boss2 = {}
	local Boss3 = {}
	local Boss4 = {}
	local Boss5 = {}
	local NpcGID  
	local Save = 0

	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 114289 then		-----門口NPC(用來searchnpc)
			Boss1[0] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102960			-----希爾
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103082 then
			Boss5[table.getn(Boss5)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103134			-----安多立爾
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102707 
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102930
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103086 then
			Boss4[table.getn(Boss4)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102705			-----歐基尼亞
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103133 
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103561 then
			Boss3[table.getn(Boss3)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103056			-----亞沙
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102969
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103055
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103044 then
			Boss2[table.getn(Boss2)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102701			-----拿歐斯
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102925 then
			Boss1[table.getn(Boss1)+1] = NpcGID	
		end
	end
	if IsBossDeadCheck == 0 then
		return Boss1 , Boss2 , Boss3 , Boss4 , Boss5
	end
end