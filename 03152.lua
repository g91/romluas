function Lua_na_851816() --檢查目標是否為NPC屍體
	local Owner = OwnerID()
	local NPC = SearchRangeNPC( Owner , 200)
	local Dead = { }
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID)
	for i = 0 , #NPC do
		local OrgID = ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)
		if ReadRoleValue( NPC[i] , EM_RoleValue_IsDead) == 1 then
			if OrgID == 108827 or OrgID == 108828 or OrgID == 108829 then
				local x,y,z,dir = DW_Location( NPC[i] )
				local Monster
				Monster = CreateObj( OrgID , x , y , z, dir , 1 )
				AddToPartition( Monster, Room )
				DelObj( NPC[i])
				break
			end
		end
	end
end