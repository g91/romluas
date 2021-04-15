function LuaI_Group1_1( Option )
	local PlayerID = OwnerID()
	local PackageID = 203404		-- �e�U�^�m���y
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local probability = {	60,		
			30,  	       	
			10	}       	

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,1  )
				
		elseif RAND > (100 - probability[1] - probability[2]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,2  )
				
		else
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,4  )
					
		end
	end
end

function LuaI_Group1_2( Option )
	local PlayerID = OwnerID()
	local PackageID = 203441		-- �e�U�^�m���y 2
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local item = { 202880,
		      202882,
		      202883,
		      202885,
		      202995,
		      202996,
		      202997,
		      202998	}

	local X = rand(8) + 1
	local probability = {	60,		
			30,  	       	
			10	}       	

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,1  )
			GiveBodyItem( PlayerID , Item[X] , 1 )	
				
		elseif RAND > (100 - probability[1] - probability[2]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,2  )
			GiveBodyItem( PlayerID , Item[X] , 1 )	
				
		else
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,4  )
			GiveBodyItem( PlayerID , Item[X] , 1 )					
		end
	end
end

--

function LuaI_Group2_1( Option )
	local PlayerID = OwnerID()
	local PackageID = 203439		-- �S�O�^�m���y
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local probability = {	60,		
			30,  	       	
			10	}       	

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,3  )
				
		elseif RAND > (100 - probability[1] - probability[2]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,4  )
				
		else
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,6  )
				
		end
	end
end

function LuaI_Group2_2( Option )
	local PlayerID = OwnerID()
	local PackageID = 203442		-- �S�O�^�m���y 2
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local item = { 202880,
		      202882,
		      202883,
		      202885,
		      202995,
		      202996,
		      202997,
		      202998	}

	local X = rand(8) + 1
	local probability = {	60,		
			30,  	       	
			10	}       	

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,3  )
			GiveBodyItem( PlayerID , Item[X] , 1 )	
				
		elseif RAND > (100 - probability[1] - probability[2]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,4  )
			GiveBodyItem( PlayerID , Item[X] , 1 )	
				
		else
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,6  )
			GiveBodyItem( PlayerID , Item[X] , 1 )					
		end
	end
end

--

function LuaI_Group3_1( Option )
	local PlayerID = OwnerID()
	local PackageID = 203440		-- �a�A�^�m���y
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local probability = {	60,		
			30,  	       	
			10	}       	

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,5  )
				
		elseif RAND > (100 - probability[1] - probability[2]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,6  )
				
		else
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,8  )
				
		end
	end
end

function LuaI_Group3_2( Option )
	local PlayerID = OwnerID()
	local PackageID = 203443		-- �a�A�^�m���y 2
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local item = { 202880,
		      202882,
		      202883,
		      202885,
		      202995,
		      202996,
		      202997,
		      202998	}

	local X = rand(8) + 1
	local probability = {	60,		
			30,  	       	
			10	}       	

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,5  )
			GiveBodyItem( PlayerID , Item[X] , 1 )	
				
		elseif RAND > (100 - probability[1] - probability[2]) then
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,6  )
			GiveBodyItem( PlayerID , Item[X] , 1 )	
				
		else
			AddRoleValue( PlayerID ,EM_RoleValue_BonusMoney ,8  )
			GiveBodyItem( PlayerID , Item[X] , 1 )					
		end
	end
end

function Lua_Dan_Guildquestgift(Option)
	local PlayerID = OwnerID()
	local PackageID = 203444		--�����Ũt�C�Ĥ��]
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 724620 , 1 )
	end
end

function Lua_Dan_GuildQuest_01()

	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID  ) 
	if (ZoneID == 402) then

		SetModeEx( OwnerID()   , EM_SetModeType_Mark, false )--�аO
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--�W��
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_Show, false )--���	
	end

end

function Lua_Dan_GuildQuest_02()
	
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
--	Say(OwnerID(),"PlayerGuildID = "..PlayerGuildID)
--	Say(TargetID(),"BuildingGuildID = "..BuildingGuildID)
	if PlayerGuildID ~= BuildingGuildID then
		SetSpeakDetail(OwnerID(),"[GUILD_REMINDER]")
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
	elseif PlayerGuildID == BuildingGuildID then
		LoadQuestOption(OwnerID())	-- ���J�� NPC ������ ( �]�A��ܤΥ��� )
	end
end

function Lua_Dan_CraftingTool_01()
		SetPlot( OwnerID() , "Touch" , "Lua_Dan_CraftingTool_02" , 150 );
end

function Lua_Dan_CraftingTool_02()
--Say(OwnerID(),"1") -- players
--Say(TargetID(),"2") --billiten
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	if PlayerGuildID ~= BuildingGuildID then
--Say(OwnerID(),"3") -- players
--Say(TargetID(),"4") --billiten
		--SetSpeakDetail(TargetID(),"[GUILD_REMINDER]")
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) 
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 
	end
end