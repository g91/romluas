function GuildFarmForProductEnd()
	ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_FARM3]", C_SYSTEM ) 
	ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_FARM3]", C_SYSTEM ) 
end
-------------------------------------------------------------------------------------------------------
function GuildProductBuildingCheck() --�o�ӬO�A�СB�����B�M�ҳ��@��
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	if GuildFarmer == nil then --�ŧi�����ܼ�
		GuildFarmer = {}	
	end
	if GuildLumber == nil then --�ŧi�����ܼ�
		GuildLumber = {}	
	end
	if GuildFactory == nil then --�ŧi�����ܼ�
		GuildFactory = {}	
	end

	if GuildLumber[RoomID] == nil then
		GuildFarmer[RoomID] = {}
		GuildFarmer[RoomID][1] = 0 --�A�� �W���H��
		GuildFarmer[RoomID][2] = 0 --�A�� �ثe�ϥΤH��
	end
	if GuildLumber[RoomID] == nil then
		GuildLumber[RoomID] = {}
		GuildLumber[RoomID][1] = 0 --���� �W���H��
		GuildLumber[RoomID][2] = 0 --���� �ثe�ϥΤH��
	end
	if GuildFactory[RoomID] == nil then
		GuildFactory[RoomID] = {}
		GuildFactory[RoomID][1] = 0 --�M�ҳ� �W���H��
		GuildFactory[RoomID][2] = 0 --�M�ҳ� �ثe�ϥΤH��
	end

	while true do
		GuildFarmer[RoomID][1] = 0
		GuildLumber[RoomID][1] = 0
		GuildFactory[RoomID][1] = 0
		local TempID1 = SetSearchAllNPC(RoomID)
		for i = 1, TempID1 do
			local searchID = GetSearchResult()
			local TempInt = ReadRoleValue( searchID , EM_RoleValue_Register10)
			TempInt = math.floor(TempInt/10)
			if TempInt == 1 then
				GuildFarmer[RoomID][1] = GuildFarmer[RoomID][1] +5 --�W���H��
			elseif TempInt == 2 then
				GuildLumber[RoomID][1] = GuildLumber[RoomID][1] +5 --�W���H��
			elseif TempInt == 3 then
				GuildFactory[RoomID][1] = GuildFactory[RoomID][1] +5 --�W���H��
			end
		end
		--
		GuildFarmer[RoomID][2] = 0
		GuildLumber[RoomID][2] = 0
		GuildFactory[RoomID][2] = 0
		local TempID2 = SetSearchAllPlayer(RoomID)
		for i = 0, TempID2 do
			local searchID = GetSearchResult()
			if CheckBuff ( searchID ,  502308) == true then --�A�Фu�@BUFF
				GuildFarmer[RoomID][2] = GuildFarmer[RoomID][2] +1 --�`�H��
			end
			if CheckBuff ( searchID ,  505749) == true then --�M��u�@BUFF
				GuildFactory[RoomID][2] = GuildFactory[RoomID][2] +1 --�`�H��
			end
			if CheckBuff ( searchID ,  505750) == true then --���u�@BUFF
				GuildLumber[RoomID][2] = GuildLumber[RoomID][2] +1 --�`�H��
			end
		end
		sleep(10)
	end
end