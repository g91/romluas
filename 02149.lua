function ADS_Creep104827()
	AddBuff(OwnerID(),508161,0,-1)
	SetPlot( OwnerID() , "Dead" , "ADS_Creep104827_dead" , 0 )
end

function ADS_Creep104827_dead()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	for i=1,table.getn(ADSPartyMember[RoomID]) do
		if GetDistance (ADSPartyMember[RoomID][i],OwnerID()) <= 60 then
			AddBuff(ADSPartyMember[RoomID][i],508163,0,5)
		end
	end
	return TRUE
end

--======--
function ADS_Creep104828()
	local Creep = OwnerID()
	local TempPlayer
	local timer = 0
	while TRUE do
		if KS_InCombat(Creep) == TRUE then 
			if timer%16 == 0 then
				TempPlayer = Lua_RandomPlayerFromHateList(Creep,1)
				SysCastSpellLv(TempPlayer[1],Creep,496612,1)
			end
		else
			timer = 0	
		end
		--
		Sleep(10)
		timer = timer +1
	end	
end
--======--
function ADS_Creep104829()
	local Creep = OwnerID()
	local timer = 0
	while TRUE do
		if KS_InCombat(Creep) == TRUE then 
			if timer%10 == 0 then
				AddBuff(Creep,508015,0,-1)
			end
			if timer%20 == 0 then
				AddBuff(Creep,508165,0,5)
			end
		else
			timer = 0	
		end
		--
		Sleep(10)
		timer = timer +1
	end	
end
--======--
function ADS_Creep104833()
	SetPlot( OwnerID() , "Dead" , "ADS_Creep104833_dead" , 0 )
end

function ADS_Creep104833_dead()
	local CP = SearchRangeNPC ( OwnerID() , 100 )
	for i = 0,table.getn(CP) do
		if ReadRoleValue( CP[i] , EM_RoleValue_IsDead ) == 0 and ReadRoleValue(CP[i],EM_RoleValue_OwnerGUID) ==-1 then
			AddBuff(CP[i],508226,0,-1)
		end
	end
	return TRUE
end
--======--
function ADS_Creep104841()
	SetPlot( OwnerID() , "Dead" , "ADS_Creep104841_dead" , 0 )
end

function ADS_Creep104841_dead()
	local CP = SearchRangeNPC ( OwnerID() , 100 )
	for i = 1,table.getn(CP) do
		AddBuff(CP[i],508235,0,-1)	
	end
	return TRUE
end