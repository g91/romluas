------------------------------------------------------------------------------------------------zone 120索雷區

function star_zone120_initial(RoomID)				
	--SetRoomValue( RoomID , 0 , 1)		------讀取場景type1
	local Count = SetSearchAllNPC(RoomID)
	local Boss1 = {}
	local NpcGID  

	for i=1 , Count do
		NpcGID = GetSearchResult()		
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 113721 then
			Boss1[0] = NpcGID
			break
		end
	end
	--BeginPlot( Boss1[0] , "star_zone120_load" , 50 )			
end

function star_zone120_load()
	sleep(60)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Save = ReadInstanceArg( RoomID , 0 )
	local Count = SetSearchAllNPC(RoomID)
	local Boss1 = {}
	local Boss2 = {}
	local Boss3 = {}
	local Boss4 = {}
	
	local NpcGID  

	Boss1 , Boss2 , Boss3 , Boss4 = star_zone120_SearchBoss(0 , RoomID)
	local Boss = { Boss1 , Boss2 , Boss3 , Boss4 }
	
	for x=4 , 1 , -1 do 
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

function star_zone120_SearchBoss(IsBossDeadCheck , RoomID)
	local Count = SetSearchAllNPC(RoomID)
	local Boss1 = {}
	local Boss2 = {}
	local Boss3 = {}
	local Boss4 = {}

	local NpcGID  
	local Save = 0

	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 113721 then		-----門口NPC(用來searchnpc)
			Boss1[0] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102938			-----代言者
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102960 then
			Boss4[table.getn(Boss4)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102704			-----霸拿羅茲     
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104164 			-----控制器
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102925 then
			Boss3[table.getn(Boss3)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102683			-----韓絲翠
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102891
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102929
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102930
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102808 then
			Boss2[table.getn(Boss2)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102706			-----剎瓦尤娜
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102914
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103579 then
			Boss1[table.getn(Boss1)+1] = NpcGID	
		end
	end
	if IsBossDeadCheck == 0 then
		return Boss1 , Boss2 , Boss3 , Boss4 
	end
end