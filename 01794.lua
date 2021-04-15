-----------------------------------------------------------------------------------------------zone 123遺民殿堂

function bk_zone133_initial(RoomID)				-------記得改用Beginplot來達到等到副本層建好後在執行
	
	local Count = SetSearchAllNPC(RoomID)
	local Boss1 = {}
	local NpcGID  

	for i=1 , Count do
		NpcGID = GetSearchResult()		
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 113376 then   ---------------------控制器的位置
			Boss1[0] = NpcGID
			break
		end
	end
	BeginPlot( Boss1[0] , "bk_zone133_load" , 50 )			-----測試過後一定要延遲才行(秒數要5秒以上才夠)
end

function bk_zone133_load()
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
	--local Boss = {}	

	Boss1 , Boss2 , Boss3 , Boss4 , Boss5 , Boss6 , Boss7 = bk_zone133_SearchBoss(0 , RoomID)
	
	if Save >= 1000000 then
		for i7= 1 , table.getn(Boss7) do
			DelObj(Boss7[i7])
		end
		Save = Save - 1000000
	end	
	if Save >= 100000 then
		for i6= 1 , table.getn(Boss6) do
			DelObj(Boss6[i6])
		end
		Save = Save - 100000
	end	
	if Save >= 10000 then
		for i5= 1 , table.getn(Boss5) do
			DelObj(Boss5[i5])
		end
		Save = Save - 10000
	end	
	if Save >= 1000 then
		for i4= 1 , table.getn(Boss4) do
			DelObj(Boss4[i4])
		end
		Save = Save - 1000
	end	
	if Save >= 100 then
		for i3= 1 , table.getn(Boss3) do
			DelObj(Boss3[i3])
		end
		Save = Save - 100
	end	
	if Save >= 10 then
		for i2= 1 , table.getn(Boss2) do
			DelObj(Boss2[i2])
		end
		Save = Save - 10
	end	
	if Save >= 1 then
		for i1= 1 , table.getn(Boss1) do
			DelObj(Boss1[i1])
		end		
	end
end

function bk_zone133_SearchBoss(IsBossDeadCheck , RoomID)
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
	

	for i=1 , Count do
		NpcGID = GetSearchResult()
		if ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 115911 then		-----門口NPC(用來searchnpc)
			Boss1[0] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103212			-----泰德  
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 103220 then
			Boss7[table.getn(Boss7)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104144			-----奈洛達斯104144 104193 104226
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104193
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104226 then
			Boss6[table.getn(Boss6)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104143		-----佩謝		
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104168
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104172
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104173
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104175 then
			Boss5[table.getn(Boss5)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104142		-----利金旺達
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104176 
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104196
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104197 then			
			Boss4[table.getn(Boss4)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104141			-----帕伊察    
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104179 
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104205
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104206 then
			Boss3[table.getn(Boss3)+1] = NpcGID	
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104140			-----夏高多洽
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104201
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104202 then
			Boss2[table.getn(Boss2)+1] = NpcGID
		elseif ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104108			-----雅瓦卡
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104198
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104199
		 or ReadRoleValue(NpcGID , EM_RoleValue_OrgID) == 104139 then
			Boss1[table.getn(Boss1)+1] = NpcGID	
		end
	end
	if IsBossDeadCheck == 0 then
		return Boss1 , Boss2 , Boss3 , Boss4 , Boss5 , Boss6 , Boss7
	elseif IsBossDeadCheck == 1 then
		local BossIsAlive = 0
		for j1=1 , table.getn(Boss1) do
			if ReadRoleValue(Boss1[j1] , EM_RoleValue_OrgID) == 104108     --------- 雅瓦卡
			 and ReadRoleValue( Boss1[j1] , EM_RoleValue_IsDead ) == 0 
			 and Boss1[j1] ~= OwnerID() then
				BossIsAlive = 1
			end
		end
		if BossIsAlive == 0 then
			Save = Save + 1			
		end
		BossIsAlive = 0
		for j2=1 , table.getn(Boss2) do
			if ReadRoleValue( Boss2[j2] , EM_RoleValue_OrgID) == 104140   ----------夏高多洽
			 and ReadRoleValue( Boss2[j2] , EM_RoleValue_IsDead ) == 0 
			 and Boss2[j2] ~= OwnerID() then
				BossIsAlive = 1
			end
		end
		if BossIsAlive == 0 then
			Save = Save + 10			
		end
		BossIsAlive = 0
		for j3=1 , table.getn(Boss3) do
			if ReadRoleValue( Boss3[j3] , EM_RoleValue_OrgID) == 104141   ---------帕伊察
			 and ReadRoleValue( Boss3[j3] , EM_RoleValue_IsDead ) == 0 
			 and Boss3[j3] ~= OwnerID() then
				BossIsAlive = 1
			end
		end
		if BossIsAlive == 0 then
			Save = Save + 100			
		end
		BossIsAlive = 0
		for j4=1 , table.getn(Boss4) do
			if ReadRoleValue( Boss4[j4] , EM_RoleValue_OrgID) == 104142   -------------利金旺達
			 and ReadRoleValue( Boss4[j4] , EM_RoleValue_IsDead ) == 0 
			 and Boss4[j4] ~= OwnerID() then
				BossIsAlive = 1
			end
		end
		if BossIsAlive == 0 then
			Save = Save + 1000
		end
		BossIsAlive = 0
		for j5=1 , table.getn(Boss5) do
			if ReadRoleValue( Boss5[j5] , EM_RoleValue_OrgID) == 104143  -------------佩謝
			 and ReadRoleValue( Boss5[j5] , EM_RoleValue_IsDead ) == 0 
			 and Boss5[j5] ~= OwnerID() then
				BossIsAlive = 1
			end
		end
		if BossIsAlive == 0 then
			Save = Save + 10000			
		end
		BossIsAlive = 0
		for j6=1 , table.getn(Boss6) do
			if ReadRoleValue( Boss6[j6] , EM_RoleValue_OrgID) == 104144  -----------奈洛達斯
			 and ReadRoleValue( Boss6[j6] , EM_RoleValue_IsDead ) == 0 
			 and Boss6[j6] ~= OwnerID() then
				if ReadRoleValue( Boss6[j6] , EM_RoleValue_IsDead ) == 0 then
					BossIsAlive = 1
				end	
			end
		end
		if BossIsAlive == 0 then
			Save = Save + 100000		
		end
		BossIsAlive = 0
		for j7=1 , table.getn(Boss7) do
			if ReadRoleValue( Boss7[j7] , EM_RoleValue_OrgID) == 104090 -----------泰德 
			 and ReadRoleValue( Boss7[j7] , EM_RoleValue_IsDead ) == 0 
			 and Boss7[j7] ~= OwnerID() then
				BossIsAlive = 1
			end
		end
		if BossIsAlive == 0 then
			Save = Save + 1000000			
		end
		BossIsAlive = 0			
		return Save
	end
end