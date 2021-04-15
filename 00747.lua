function YUYULua_101042_0()


	While true do
		local Master = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100998, 200 , 1) 
	sleep(10)
		local AttackStatue = ReadRoleValue( Master[0] , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否

		if AttackStatue == 0 then
			local Master = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100998, 200 , 1) 

			CastSpelllv( Master[0] , ownerID() , 491910, 50)     
			sleep(120)
			CastSpelllv( Master[0] , ownerID() , 491915, 50)     
			sleep(160)
			CastSpelllv( Master[0] , ownerID() , 491910, 50)   
			sleep(120)
			CastSpelllv( Master[0] , ownerID() , 491915, 50)   
			sleep(160)

		end
	end
end