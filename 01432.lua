function LuaDan_TrainCentre_HitShrew_Spell()
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local hitpoint = 0
	local Obj
	local TargetNPC =  {102143, 
			        102176,
			        102177,
			        102178,
			        102179,
			        102180,
			        102181,
			        102182,
			        102183}

	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}
			
	PlayMotion( OwnerID(), 161)
	local Count = SetSearchAllNPC(RoomID)
			if Count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
						Obj = Role:New( ID )
						if Obj:IsNPC() == true then
							if  ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[1] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot (ID, "LuaDan_TC_ScrewDead", 0)
							 	hitpoint = hitpoint + 1
							elseif (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[2]) or ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[3] or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[4]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[5]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[6]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[7]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[8]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[9]) then
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_19]" , C_SYSTEM )	
								hitpoint = 0
							elseif ReadRoleValue(ID ,EM_RoleValue_OrgID) == KindNPC[1] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" , C_SYSTEM )
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_23]" , C_SYSTEM )	
								hitpoint = -1
							end
					end
				end
			  end
		if hitpoint >= 1 then
--	Say(OwnerID(), "HitShrewScore:" .. HitShrewScore[RoomID])
--	Say(TargetID(), "HitShrewScore:" .. HitShrewScore[RoomID]		
					HitShrewScore[RoomID] = HitShrewScore[RoomID] + 1
					SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计"))
					ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_20]" ..  HitShrewScore[RoomID] , C_SYSTEM )
					local Count = SetSearchAllNPC(RoomID)
--	Say(OwnerID(), "HitShrewScore:" .. HitShrewScore[RoomID])
--	Say(TargetID(), "HitShrewScore:" .. HitShrewScore[RoomID])
					if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
--	Say(OwnerID(), "HitShrewScore:" .. HitShrewScore[RoomID])
--	Say(TargetID(), "HitShrewScore:" .. HitShrewScore[RoomID])
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end
		elseif 	hitpoint == 0 then
					HitShrewScore[RoomID] = HitShrewScore[RoomID] - 5
					if  HitShrewScore[RoomID] < 0 then
						HitShrewScore[RoomID] = 0 
					end
					SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
					ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_21]" .. HitShrewScore[RoomID] , C_SYSTEM )
					local Count = SetSearchAllNPC(RoomID)
					if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end
		elseif  hitpoint == -1 then
					HitShrewScore[RoomID] = HitShrewScore[RoomID] - 10
					if  HitShrewScore[RoomID] < 0 then
						HitShrewScore[RoomID] = 0 
					end
					SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
					ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" .. HitShrewScore[RoomID] , C_SYSTEM )  --Ι10だ
					local Count = SetSearchAllNPC(RoomID)
					if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end
		end	
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_Spell2()
	local hitpoint = 0
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	--local NPC = SearchRangeNPC ( OwnerID() , 500 )
	local Obj
	local TargetNPC =  {102143, 
			        102176,
			        102177,
			        102178,
			        102179,
			        102180,
			        102181,
			        102182,
			        102183}

	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}

			        
	PlayMotion( OwnerID(), 161)
	local Count = SetSearchAllNPC(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
					Obj = Role:New( ID )
						if Obj:IsNPC() == true then
							if  ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[2] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
							 	hitpoint = hitpoint + 1
							elseif (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[1]) or ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[3] or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[4]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[5]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[6]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[7]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[8]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[9]) then
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_19]" , C_SYSTEM )	
								hitpoint = 0
							elseif ReadRoleValue(ID ,EM_RoleValue_OrgID) == KindNPC[2] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot (ID, "LuaDan_TC_ScrewDead", 0)
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" , C_SYSTEM )
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_23]" , C_SYSTEM )	
								hitpoint = -1
							end
						end
			end
		end

	if hitpoint >= 1 then		
				HitShrewScore[RoomID] = HitShrewScore[RoomID] + 1
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计"))
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_20]" ..  HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
					if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end
	elseif 	hitpoint == 0 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 5
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_21]" .. HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
					if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end
	elseif  hitpoint == -1 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 10
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" .. HitShrewScore[RoomID] , C_SYSTEM )  --Ι10だ
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_Spell3()
	local hitpoint = 0
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	--local NPC = SearchRangeNPC ( OwnerID() , 500 )
	local Obj
	local TargetNPC =  {102143, 
			        102176,
			        102177,
			        102178,
			        102179,
			        102180,
			        102181,
			        102182,
			        102183}

	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}

	PlayMotion( OwnerID(), 161)
		local Count = SetSearchAllNPC(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
					Obj = Role:New( ID )
						if Obj:IsNPC() == true then
							if  ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[3] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
							 	hitpoint = hitpoint + 1
							elseif (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[1]) or ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[2] or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[4]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[5]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[6]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[7]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[8]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[9]) then
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_19]" , C_SYSTEM )	
								hitpoint = 0
							elseif ReadRoleValue(ID ,EM_RoleValue_OrgID) == KindNPC[3] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" , C_SYSTEM )
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_23]" , C_SYSTEM )	
								hitpoint = -1
							end
						end
			end
		end

	if hitpoint >= 1 then		
				HitShrewScore[RoomID] = HitShrewScore[RoomID] + 1
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_20]" ..  HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end
	elseif 	hitpoint == 0 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 5
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计"))
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_21]" .. HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end
	elseif  hitpoint == -1 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 10
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" .. HitShrewScore[RoomID] , C_SYSTEM )  --Ι10だ
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_Spell4()
	local hitpoint = 0
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	--local NPC = SearchRangeNPC ( OwnerID() , 500 )
	local Obj
	local TargetNPC =  {102143, 
			        102176,
			        102177,
			        102178,
			        102179,
			        102180,
			        102181,
			        102182,
			        102183}

	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}


	PlayMotion( OwnerID(), 161)
	local Count = SetSearchAllNPC(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
					Obj = Role:New( ID )
						if Obj:IsNPC() == true then
							if  ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[4] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
							 	hitpoint = hitpoint + 1
							elseif (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[1]) or ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[2] or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[3]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[5]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[6]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[7]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[8]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[9]) then
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_19]" , C_SYSTEM )	
								hitpoint = 0
							elseif ReadRoleValue(ID ,EM_RoleValue_OrgID) == KindNPC[4] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" , C_SYSTEM )
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_23]" , C_SYSTEM )	
								hitpoint = -1

							end
						end
			end

		end

	if hitpoint >= 1 then		
				HitShrewScore[RoomID] = HitShrewScore[RoomID] + 1
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_20]" ..  HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif 	hitpoint == 0 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 5
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_21]" .. HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif  hitpoint == -1 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 10
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" .. HitShrewScore[RoomID] , C_SYSTEM )  --Ι10だ
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_Spell5()
	local hitpoint = 0
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	--local NPC = SearchRangeNPC ( OwnerID() , 500 )
	local Obj
	local TargetNPC =  {102143, 
			        102176,
			        102177,
			        102178,
			        102179,
			        102180,
			        102181,
			        102182,
			        102183}

	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}


	PlayMotion( OwnerID(), 161)
	local Count = SetSearchAllNPC(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
					Obj = Role:New( ID )
						if Obj:IsNPC() == true then		
							if  ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[5] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
							 	hitpoint = hitpoint + 1
							elseif (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[1]) or ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[2] or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[3]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[4]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[6]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[7]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[8]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[9]) then
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_19]" , C_SYSTEM )	
								hitpoint = 0
							elseif ReadRoleValue(ID ,EM_RoleValue_OrgID) == KindNPC[5] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" , C_SYSTEM )
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_23]" , C_SYSTEM )	
								hitpoint = -1
							end
						end
			end
		end

	if hitpoint >= 1 then		
				HitShrewScore[RoomID] = HitShrewScore[RoomID] + 1
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_20]" ..  HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif 	hitpoint == 0 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 5
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_21]" .. HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif  hitpoint == -1 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 10
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" .. HitShrewScore[RoomID] , C_SYSTEM )  --Ι10だ
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end					
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_Spell6()
	local hitpoint = 0
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--	local NPC = SearchRangeNPC ( OwnerID() , 500 )
	local Obj
	local TargetNPC =  {102143, 
			        102176,
			        102177,
			        102178,
			        102179,
			        102180,
			        102181,
			        102182,
			        102183}

	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}


	PlayMotion( OwnerID(), 161)
		local Count = SetSearchAllNPC(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
					Obj = Role:New( ID )
						if Obj:IsNPC() == true then		
							if  ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[6] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
							 	hitpoint = hitpoint + 1
							elseif (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[1]) or ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[2] or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[3]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[4]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[5]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[7]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[8]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[9]) then
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_19]" , C_SYSTEM )	
								hitpoint = 0
							elseif ReadRoleValue(ID ,EM_RoleValue_OrgID) == KindNPC[6] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" , C_SYSTEM )
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_23]" , C_SYSTEM )	
								hitpoint = -1
							end
						end
			end
		end

	if hitpoint >= 1 then		
				HitShrewScore[RoomID] = HitShrewScore[RoomID] + 1
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_20]" ..  HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif 	hitpoint == 0 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 5
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_21]" .. HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif  hitpoint == -1 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 10
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" .. HitShrewScore[RoomID] , C_SYSTEM )  --Ι10だ
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_Spell7()
	local hitpoint = 0
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	--local NPC = SearchRangeNPC ( OwnerID() , 500 )
	local Obj
	local TargetNPC =  {102143, 
			        102176,
			        102177,
			        102178,
			        102179,
			        102180,
			        102181,
			        102182,
			        102183}

	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}

	PlayMotion( OwnerID(), 161)
		local Count = SetSearchAllNPC(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
					Obj = Role:New( ID )
						if Obj:IsNPC() == true then
							if  ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[7] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
							 	hitpoint = hitpoint + 1
							elseif (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[1]) or ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[2] or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[3]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[4]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[5]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[6]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[8]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[9]) then
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_19]" , C_SYSTEM )	
								hitpoint = 0
							elseif ReadRoleValue(ID ,EM_RoleValue_OrgID) == KindNPC[7] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" , C_SYSTEM )
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_23]" , C_SYSTEM )	
								hitpoint = -1
							end
						end
			end
		end

	if hitpoint >= 1 then		
				HitShrewScore[RoomID] = HitShrewScore[RoomID] + 1
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_20]" ..  HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif 	hitpoint == 0 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 5
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_21]" .. HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif  hitpoint == -1 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 10
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" .. HitShrewScore[RoomID] , C_SYSTEM )  --Ι10だ
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

					
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_Spell8()
	local hitpoint = 0
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	--local NPC = SearchRangeNPC ( OwnerID() , 500 )
	local Obj
	local TargetNPC =  {102143, 
			        102176,
			        102177,
			        102178,
			        102179,
			        102180,
			        102181,
			        102182,
			        102183}

	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}

	PlayMotion( OwnerID(), 161)
		local Count = SetSearchAllNPC(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
					Obj = Role:New( ID )
						if Obj:IsNPC() == true then	
							if  ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[8] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
							 	hitpoint = hitpoint + 1
							elseif (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[1]) or ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[2] or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[3]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[4]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[5]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[6]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[7]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[9]) then
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_19]" , C_SYSTEM )	
								hitpoint = 0
							elseif ReadRoleValue(ID ,EM_RoleValue_OrgID) == KindNPC[8] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" , C_SYSTEM )
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_23]" , C_SYSTEM )	
								hitpoint = -1
							end
						end
			end
		end

	if hitpoint >= 1 then		
				HitShrewScore[RoomID] = HitShrewScore[RoomID] + 1
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_20]" ..  HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif 	hitpoint == 0 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 5
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_21]" .. HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif  hitpoint == -1 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 10
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" .. HitShrewScore[RoomID] , C_SYSTEM )  --Ι10だ
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TrainCentre_HitShrew_Spell9()
	local hitpoint = 0
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	--local NPC = SearchRangeNPC ( OwnerID() , 500 )
	local Obj
	local TargetNPC =  {102143, 
			        102176,
			        102177,
			        102178,
			        102179,
			        102180,
			        102181,
			        102182,
			        102183}

	local KindNPC =  {   102184, 
			        101278,
			        101279,
			        101545,
			        101546,
			        101547,
			        101548,
			        101549,
			        101550}

	PlayMotion( OwnerID(), 161)
		local Count = SetSearchAllNPC(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
					Obj = Role:New( ID )
						if Obj:IsNPC() == true then
							if  ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[9] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
							 	hitpoint = hitpoint + 1
							elseif (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[1]) or ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[2] or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[3]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[4]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[5]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[6]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[7]) or (ReadRoleValue(ID ,EM_RoleValue_OrgID) == TargetNPC[8]) then
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_19]" , C_SYSTEM )	
								hitpoint = 0
							elseif ReadRoleValue(ID ,EM_RoleValue_OrgID) == KindNPC[9] then
								AddBuff( ID,  503793, 1, 5)
								BeginPlot ( ID, "LuaDan_TC_ScrewDead", 0)
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" , C_SYSTEM )
								ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_23]" , C_SYSTEM )	
								hitpoint = -1
							end
						end
			end
		end

	if hitpoint >= 1 then		
				HitShrewScore[RoomID] = HitShrewScore[RoomID] + 1
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_20]" ..  HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif 	hitpoint == 0 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 5
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_21]" .. HitShrewScore[RoomID] , C_SYSTEM )
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end

	elseif  hitpoint == -1 then
				HitShrewScore[RoomID] = HitShrewScore[RoomID] - 10
				if  HitShrewScore[RoomID] < 0 then
					HitShrewScore[RoomID] = 0 
				end
				SetSmallGameMenuStr( OwnerID(), 1 , 2 , HitShrewScore[RoomID] ) --Change grade (++String计")) 
				ScriptMessage( OwnerID() , 0 , 1 , "[GUILD_TC_HITPLATYPUS_22]" .. HitShrewScore[RoomID] , C_SYSTEM )  --Ι10だ
				local Count = SetSearchAllNPC(RoomID)
				if Count ~= 0 then
						for i = 1 , Count , 1 do
							local RecardGrade = GetSearchResult()
								Obj = Role:New( RecardGrade )
							if Obj:IsNPC() == true then
									--if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 100044 then
								if  ReadRoleValue(RecardGrade ,EM_RoleValue_OrgID) == 113043 then
									WriteRoleValue( RecardGrade , EM_RoleValue_PID, HitShrewScore[RoomID])
								end
							end
						end
					end
	
	end

end
---------------------------------------------------------------------------------------------------------------------------------------------
function LuaDan_TC_ScrewDead()
	
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	--sleep(10)
	DelObj(OwnerID())
end