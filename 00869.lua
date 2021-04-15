function YUYULua_101040_0()


	While true do
	sleep(10)
		local AttackStatue = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )           --判斷是否進入戰鬥 1= 是 0= 否

		if AttackStatue == 0 then
			local EYE = LuaFunc_SearchNPCbyOrgID(OwnerID(), 101046, 100 , 1) 

			CastSpelllv( ownerID() , EYE[0]  , 491910, 50)     
			sleep(120)
			CastSpelllv( ownerID() , EYE[0]  , 491912, 50)     
			sleep(50)
			CastSpelllv( ownerID() , EYE[0]  , 491910, 50)   
			sleep(120)
			CastSpelllv( ownerID() , EYE[0]  , 491912, 50)   
			sleep(50)

		end
	end
end
