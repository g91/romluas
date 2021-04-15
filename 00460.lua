Function LuaI_207147( Option ) --無暇熔解石(5)包
	local Num = 5
	if Option == "CHECK" then
		if Check_Bag_Space( OwnerID() , Num ) == false then
		return false
		end
	elseif Option == "USE" then
		for i = 1, Num do
			GiveBodyItem( OwnerID(), 202881, 1)
			Sleep( 1 )
		end
	end
end


Function LuaI_207148( Option ) --無暇熔解石(10)包
	local Num = 10
	if Option == "CHECK" then
		if Check_Bag_Space( OwnerID() , Num ) == false then
		return false
		end
	elseif Option == "USE" then
		for i = 1, Num do
			GiveBodyItem( OwnerID(), 202881, 1)
			Sleep( 1 )
		end
	end
end


Function LuaI_207149( Option ) --無暇熔解石(20)包
	local Num = 20
	if Option == "CHECK" then
		if Check_Bag_Space( OwnerID() , Num ) == false then
		return false
		end
	elseif Option == "USE" then
		for i = 1, Num do
			GiveBodyItem( OwnerID(), 202881, 1)
			Sleep( 1 )
		end
	end
end