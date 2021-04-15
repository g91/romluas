function star_ReadInstanceSave()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Save = ReadInstanceArg( RoomID , 0 )
	Say(OwnerID() , "Save ="..Save) 
end

function star_SearchTest()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Save = star_zone117_SearchBoss( 1 , RoomID)
	Say(OwnerID() , "Search ="..Save)
end

function star_WriteTest()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	WriteInstanceArg( 0  , 0)
	Say(OwnerID() ,  "yes")
end

function star_SelectTest()
	local difficulty = PartyInstanceLv(OwnerID())
	Say(OwnerID() ,  "difficulty="..difficulty)
end
-----------------------------------------------------------------------------------------------zone 117遺民殿堂
function star_zone117_initial(RoomID)				
	
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
	--BeginPlot( Boss1[0] , "star_zone117_load" , 50 )			
end

function star_zone117_load()
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

	Boss1 , Boss2 , Boss3 , Boss4 , Boss5 , Boss6 , Boss7 = star_zone117_SearchBoss(0 , RoomID)
	local Boss = {Boss1 , Boss2 , Boss3 , Boss4 , Boss5 , Boss6 , Boss7 }
	--Say(OwnerID() , "outside" )
	for x=7 , 1 , -1 do 
		--Say(OwnerID() , "inside" )
		if Save >= math.pow( 10 , x-1 ) then
			local BossTemp = {}
			BossTemp = Boss[x]
			--Say(OwnerID() , table.getn(BossTemp) )
			for y=1 , table.getn(BossTemp) do
				DelObj( BossTemp[y] )	
				--Say(OwnerID() , getname(BossTemp[y]))
			end	
			Save = Save - math.pow( 10 , x-1 )			
		end	
	end	
end

function star_zone117_SearchBoss(IsBossDeadCheck , RoomID)
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
	--local OrgID = {102421 , 102475 , 102395 , 102558 , 102425 , 102447 , 102430 , 102452}

	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 113376 then		-----門口NPC(用來searchnpc)
			Boss1[0] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102430			-----安德弗立姆   
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102439 then
			Boss7[table.getn(Boss7)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102447			-----曼特瑞克
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102452
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 113417
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102563 then
			Boss6[table.getn(Boss6)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102425	then	-----血之制裁者		 
			Boss5[table.getn(Boss5)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102558			-----瓦爾哈拉
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102569 
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102636
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102960 then			------控制器
			Boss4[table.getn(Boss4)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102395			-----鋼之制裁者     
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102419 
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103578
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102418 then
			Boss3[table.getn(Boss3)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102475			-----格拉默
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102474
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102583 
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103801 then
			Boss2[table.getn(Boss2)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 102421			-----劍之制裁者
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103577 then
			Boss1[table.getn(Boss1)+1] = NpcGID	
		end
	end
	if IsBossDeadCheck == 0 then
		return Boss1 , Boss2 , Boss3 , Boss4 , Boss5 , Boss6 , Boss7
	end
end