function GuildFarmForProductEnd()
	ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_FARM3]", C_SYSTEM ) 
	ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_FARM3]", C_SYSTEM ) 
end
-------------------------------------------------------------------------------------------------------
function GuildProductBuildingCheck() --硂琌笰バワれ初芬初ノ
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	if GuildFarmer == nil then --办跑计
		GuildFarmer = {}	
	end
	if GuildLumber == nil then --办跑计
		GuildLumber = {}	
	end
	if GuildFactory == nil then --办跑计
		GuildFactory = {}	
	end

	if GuildLumber[RoomID] == nil then
		GuildFarmer[RoomID] = {}
		GuildFarmer[RoomID][1] = 0 --笰バ 计
		GuildFarmer[RoomID][2] = 0 --笰バ ヘ玡ㄏノ计
	end
	if GuildLumber[RoomID] == nil then
		GuildLumber[RoomID] = {}
		GuildLumber[RoomID][1] = 0 --ワれ初 计
		GuildLumber[RoomID][2] = 0 --ワれ初 ヘ玡ㄏノ计
	end
	if GuildFactory[RoomID] == nil then
		GuildFactory[RoomID] = {}
		GuildFactory[RoomID][1] = 0 --芬初 计
		GuildFactory[RoomID][2] = 0 --芬初 ヘ玡ㄏノ计
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
				GuildFarmer[RoomID][1] = GuildFarmer[RoomID][1] +5 --计
			elseif TempInt == 2 then
				GuildLumber[RoomID][1] = GuildLumber[RoomID][1] +5 --计
			elseif TempInt == 3 then
				GuildFactory[RoomID][1] = GuildFactory[RoomID][1] +5 --计
			end
		end
		--
		GuildFarmer[RoomID][2] = 0
		GuildLumber[RoomID][2] = 0
		GuildFactory[RoomID][2] = 0
		local TempID2 = SetSearchAllPlayer(RoomID)
		for i = 0, TempID2 do
			local searchID = GetSearchResult()
			if CheckBuff ( searchID ,  502308) == true then --笰バBUFF
				GuildFarmer[RoomID][2] = GuildFarmer[RoomID][2] +1 --羆计
			end
			if CheckBuff ( searchID ,  505749) == true then --铃BUFF
				GuildFactory[RoomID][2] = GuildFactory[RoomID][2] +1 --羆计
			end
			if CheckBuff ( searchID ,  505750) == true then --ワれBUFF
				GuildLumber[RoomID][2] = GuildLumber[RoomID][2] +1 --羆计
			end
		end
		sleep(10)
	end
end