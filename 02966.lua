function WY_Fish_Attraction()
	--SetPlot(OwnerID(),"range","You_are_now_in_Range", 400)
	local Lua_Contorler = OwnerID()
	local FishTable = {}
	local AttackerTable = {}
	local TargetPlayer = 0
	local BloodBath = 624679
	local TempPlayerTable = {}
	local TempHP_Table = {}
	local TempPlayer = 0
	local Players = 0
	local TempNumber = 0
	local HP = 0
	local maxHP = 0
	local Activeted = true
	local Fish_Search_Range = 0
	while Activeted do
		TempPlayerTable = SearchRangePlayer(Lua_Contorler, 400)
		Players = #TempPlayerTable
		for x = 0, Players-1 do
			TempPlayer = TempPlayerTable[x]
			HP = ReadRoleValue(TempPlayer , EM_RoleValue_HP)
			maxHP = ReadRoleValue(TempPlayer, EM_RoleValue_MaxHP)
			TempNumber = hp/maxHP*100
			TempHP_table[x] = TempNumber
		end
		for y = 0, Players-1 do
			TempPlayer = TempPlayerTable[y]
			if TempHP_Table[y] < 50 then
				CancelBuff(TempPlayer, BloodBath )
				AddBuff(TempPlayer , BloodBath , 1 , -1);
				TempNumber = BuffCount(TempPlayer) ;
				for z = 0 , TempNumber-1 do
					if BuffInfo(TempPlayer, z , EM_BuffInfoType_BuffID) == BloodBath then
						Fish_Search_Range = BuffInfo(TempPlayer, z, EM_BuffInfoType_Power)+1
					end
				end
				FishTable = SearchRangeNPC(TempPlayer, Fish_Search_Range*200)
				for a = 0, #FishTable-1 do
					if ReadRoleValue(FishTable[a], EM_RoleValue_OrgID) == 107874 or ReadRoleValue(FishTable[a], EM_RoleValue_OrgID) == 107882 
					or ReadRoleValue(FishTable[a], EM_RoleValue_OrgID) == 108211  or ReadRoleValue(FishTable[a], EM_RoleValue_OrgID) == 108218 
					or ReadRoleValue(FishTable[a], EM_RoleValue_OrgID) == 108220 or ReadRoleValue(FishTable[a], EM_RoleValue_OrgID) == 108227 then
						table.insert (AttackerTable,FishTable[a])
					end
				end
				for b = 1, #AttackerTable do
--					Say(AttackerTable[b], "Attacking!")
					SetAttack( AttackerTable[b], TempPlayer )
				end
			elseif TempHP_Table[y] < 75 and not CheckBuff(TempPlayer, BloodBath) then
				AddBuff(TempPlayer , BloodBath , 0 , -1);
				TempNumber = BuffCount(TempPlayer) ;
				for z = 0 , TempNumber-1 do
					if BuffInfo(TempPlayer, z , EM_BuffInfoType_BuffID) == BloodBath then
						Fish_Search_Range = BuffInfo(TempPlayer, z, EM_BuffInfoType_Power)+1
					end
				end
				FishTable = SearchRangeNPC(TempPlayer, Fish_Search_Range*160)
				for a = 0, #FishTable-1 do
					if ReadRoleValue(FishTable[a], EM_RoleValue_OrgID) == 107874 or ReadRoleValue(FishTable[a], EM_RoleValue_OrgID) == 107882 then
						table.insert (AttackerTable,FishTable[a])
					end
				end
				for b = 1, #AttackerTable do
					SetAttack( AttackerTable[b], TempPlayer )
				end
			elseif TempHP_Table[y] > 90 then
				CancelBuff(TempPlayer, BloodBath )
			end
		end
		sleep(10)
	end
end

function You_are_now_in_Range()
	local players = {}
	players = SearchRangePlayer(OwnerID(), 60)
	for I, Ply in pairs(players) do
		ScriptMessage(Ply, Ply, 2 , "[WY_FISH_IN_RANGE]",0)
	end
end

function Get_DimGaze_Monster()
end

function Ghost_liech_AI()
	local H_count = 0
	local hate_list = {}
	local heal = 624652
	local Target = 0
	local time = 0
	local t = 0
	local gazed = 0
	local random = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj_table = {}
	local time_table = {}
	local five = 0
	local In_Combat = false
	while ReadRoleValue(OwnerID(), EM_RoleValue_HP) > 0 do
		H_count = HatelistCount(OwnerID())
		if H_count ~= 0 and time == 0 then
			 In_Combat = true
		end
		if In_Combat then time = time+1 end
		for a = 0 , H_count do
			hate_list[a] = HateListInfo(OwnerID(), a, EM_HateListInfoType_GItemID)  
		end
		if Target ~= 0 then
			if CheckBuff(Target , heal) then
				AddBuff(OwnerID(), 624687,0,1)
				CancelBuff(Target , heal)
--				say(OwnerID(),"[WY_GHOST_LIFE_SIPHON]")
				Target = 0
			end
		else
			for  index, player in pairs(hate_list) do
				if CheckBuff(player,624688) then
					Target = player
				end
			end
		end
		if time > 20 then
			random = RandRange( 0 , #hate_list-1 )
			gazed = hate_list[random]
--			say(OwnerID(), "[WY_GHOST_GAZE_CAST]")
			time = 0
			AddBuff( gazed, 624680, 0, 10)
		end
		if gazed ~= 0 then t = t+1 end
		if gazed ~= 0 and t >= 10 and not Obj_table[1] then
			local Obj= 0
			t = 0
			local x = ReadRoleValue( Target, EM_RoleValue_X)
			local y = ReadRoleValue( Target, EM_RoleValue_Y)
			local z = ReadRoleValue( Target, EM_RoleValue_Z)
			if ReadRoleValue(Target, EM_RoleValue_ZoneID) == 157 then
				Obj=CreateObj(107875,x,y,z,0,1);
			elseif ReadRoleValue(Target, EM_RoleValue_ZoneID) == 158 then
				Obj=CreateObj(108212,x,y,z,0,1);
			elseif ReadRoleValue(Target, EM_RoleValue_ZoneID) == 159 then
				Obj=CreateObj(108221,x,y,z,0,1);
			end
			 AddToPartition(Obj, RoomID);
			WriteRoleValue(Obj,EM_RoleValue_LiveTime,20)
			table.insert(Obj_table,Obj)
			table.insert(time_table, GetSystime(0))
		end
		if time ==5 or time == 10 or time == 15 then
		 	five = five+1
		end
		for ii, vv in pairs(hate_list) do
			if CheckBuff(vv, 624654) then
				random = RandRange( 0 , #hate_list-1 )
				Target = hate_list[random]
				CastSpellLV(OwnerID(), Target, 851116,0)
			end
		end
--		for i , v in pairs(time_table) do 
--			if GetSystime( 0 )- v >20 then
--				DelObj(Obj_table[i])
--				table.remove(time_table, i)
--				table.remove(Obj_table, i)
--			end
--		end
		if time ==5 or time == 10 or time == 15 then
		 	five = five+1
		end
		if five > 3 then
			random = RandRange( 0 , #hate_list-1 )
			H_count = HatelistCount(OwnerID())
			for a = 1 , H_count do
				hate_list[a] = HateListInfo(OwnerID(), a, EM_HateListInfoType_GItemID)  
			end
			Target = hate_list[random]
--			say(OwnerID(), "[WY_GHOST_LINKOFPAIN]")
			CastSpellLV(OwnerID(), Target, 851114, 0)
			five = 0
		end
		for ii, vv in pairs(hate_list) do
			if CheckBuff(vv, 624654) then
				random = RandRange( 0 , #hate_list-1 )
				Target = hate_list[random]
				CastSpellLV(OwnerID(), Target, 851116,0)
			end
		end
		if H_count == 0 and time ~= 0 then
			H_count = HatelistCount(OwnerID())
			hate_list = {}
			heal = 624652
			Target = 0
			time = 0
			t = 0
			gazed = 0
			random = 0
			Obj_table = {}
			time_table = {}
			five = 0
			 In_Combat = false
		end
	sleep(10)
	end
	while ReadRoleValue(OwnerID(), EM_RoleValue_HP) <= 0 do
		for i , v in pairs(time_table) do 
			if GetSystime( 0 )- v >2 then
				DelObj(Obj_table[i])
				table.remove(time_table, i)
				table.remove(Obj_table, i)
			end
		end		
	sleep(10)
	end
end

function  WY_GHOST_LIFESIPHON()
--	Say(OwnerID(), "[WY_GHOST_LIFESIPHON_DONE]")
end

function  WY_Octopus()
	local H_count = 0
	local hate_list = {}
	local combohit = 851110
	local Target = 0
	local time = 0
	local hit = 0
	local gazed = 0
	local random = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj_table = {}
	local time_table = {}
	local five = 0
	local In_Combat = false
	while ReadRoleValue(OwnerID(), EM_RoleValue_HP) > 0 do
		H_count = HatelistCount(OwnerID())
		if H_count ~= 0 and time == 0 then
			 In_Combat = true
		end
		if In_Combat then time = time+1 end
		for a = 0 , H_count do
			hate_list[a] = HateListInfo(OwnerID(), a, EM_HateListInfoType_GItemID)
		end
		Six_to_eight = RandRange(6,8)
		random = RandRange( 0 , #hate_list-1 )
		if time > 10 then
			Target = hate_list[random]
			for a = 1,Six_to_eight do
				SysCastSpellLv(OwnerID(),Target,851110,1)
				sleep(3)
				time = -12
			end
		elseif ReadRoleValue(OwnerID(), EM_RoleValue_HP)/ReadRoleValue(OwnerID(), EM_RoleValue_MaxHP)*100 < 20 and time > 0 then
			SysCastSpellLv(OwnerID(),Target,851109,1)
			time = -25
		end
		if HatelistCount(OwnerID()) == 0 and time ~= 0 then
			In_Combat = false
			time = 0
		end
	sleep(10)
	end
end

function MULTI_ATK_CHECK()
	return true
end
function MULTI_ATK_CHECK2()
end