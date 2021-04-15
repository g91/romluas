Function LuaI_206538(Option) --黃金修理鎚驚喜蛋
	local PlayerID = OwnerID()
	local PackageID = 206538
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local probability = {	3,		-- 
				6,  	       	-- 
				6,
			              10,
			              12,
			              12,
			              12,
			              12,
			              12,
			              15}       		-- 
	local RAND = rand(100)


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then

		GiveBodyItem( PlayerID , 202506 , 3 )
		
		elseif RAND > (100 - probability[1] - probability[2]) then

		GiveBodyItem( PlayerID , 202506 , 1 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then

		GiveBodyItem( PlayerID , 201141 , 1 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then

		GiveBodyItem( PlayerID , 201448 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then

		GiveBodyItem( PlayerID , 201449 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6]) then

		GiveBodyItem( PlayerID , 203041 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7]) then

		GiveBodyItem( PlayerID , 202435 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8]) then

		GiveBodyItem( PlayerID , 202902 , 5 )

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8] - probability[9]) then

		GiveBodyItem( PlayerID , 204073 , 1 )

		else

		GiveBodyItem( PlayerID , 202903 , 5 )

		end
	end

end

Function LuaI_206539(Option) --每日任務重置券驚喜蛋
	local PlayerID = OwnerID()
	local PackageID = 206539
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local probability = {	3,		-- 
				6,  	       	-- 
				6,
			              10,
			              12,
			              12,
			              12,
			              12,
			              12,
			              15}       		-- 
	local RAND = rand(100)


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
		GiveBodyItem( PlayerID , 202434 , 3 )
		elseif RAND > (100 - probability[1] - probability[2]) then
		GiveBodyItem( PlayerID , 202434 , 1 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then
		GiveBodyItem( PlayerID , 201141 , 1 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
		GiveBodyItem( PlayerID , 201448 , 5 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then
		GiveBodyItem( PlayerID , 201449 , 5 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6]) then
		GiveBodyItem( PlayerID , 203041 , 5 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7]) then
		GiveBodyItem( PlayerID , 202435 , 5 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8]) then
		GiveBodyItem( PlayerID , 202902 , 5 )
		elseif RAND > (100 -  probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8] - probability[9]) then
		GiveBodyItem( PlayerID , 204073 , 1 )
		else
		GiveBodyItem( PlayerID , 202903 , 5 )
		end
	end
end

Function LuaI_206540(Option) --無瑕驚喜蛋
	local PlayerID = OwnerID()
	local PackageID = 206540
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local probability = {	3,		-- 
				6,  	       	-- 
				6,
			              10,
			              12,
			              12,
			              12,
			              12,
			              12,
			              15}       		-- 
	local RAND = rand(100)


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
		GiveBodyItem( PlayerID , 202881 , 1 )
		GiveBodyItem( PlayerID , 202881 , 1 )
		GiveBodyItem( PlayerID , 202881 , 1 )
		elseif RAND > (100 - probability[1] - probability[2]) then
		GiveBodyItem( PlayerID , 202881 , 1 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then
		GiveBodyItem( PlayerID , 201141 , 1 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
		GiveBodyItem( PlayerID , 201448 , 5 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then
		GiveBodyItem( PlayerID , 201449 , 5 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6]) then
		GiveBodyItem( PlayerID , 203041 , 5 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7]) then
		GiveBodyItem( PlayerID , 202435 , 5 )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8]) then
		GiveBodyItem( PlayerID , 202902 , 5 )
		elseif RAND > (100 -  probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8] - probability[9]) then
		GiveBodyItem( PlayerID , 204073 , 1 )
		else
		GiveBodyItem( PlayerID , 202903 , 5 )
		end
	end
end

Function LuaI_206541(Option) --皇家馴鹿驚喜蛋
	local PlayerID = OwnerID()
	local PackageID = 206541
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local probability = {	5,		-- 
				3,  	       	-- 
				5,
			                5,
			              10,
			              12,
			              15,
			              15,
			              15,
			              15}       		-- 

	local RAND = rand(100)
	local Name = GetName( OwnerID() ) 
	local Item_Name
	local String
	local Package_String = "[206541]"

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
		GiveBodyItem( PlayerID , 203553 , 1 ) --永久皇家馴鹿坐騎*1
		Item_Name = "[203553]"
		String = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..Name.."][$SETVAR2="..Package_String.."][$SETVAR3="..Item_Name.."]" -- 
		RunningMsg( OwnerID() , 2 , String )
		elseif RAND > (100 - probability[1] - probability[2]) then
		GiveBodyItem( PlayerID , 202929 , 1 ) --魔幻寶盒能量50點*1
		Item_Name = "[202929]"
		String = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..Name.."][$SETVAR2="..Package_String.."][$SETVAR3="..Item_Name.."]" -- 
		RunningMsg( OwnerID() , 2 , String )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then
		GiveBodyItem( PlayerID , 222926 , 1 ) --初級技能護符*1
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
		GiveBodyItem( PlayerID , 222925 , 1 ) --初級經驗護符*1
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then
		GiveBodyItem( PlayerID , 201088 , 1 ) --進階武器打孔器*1
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6]) then
		GiveBodyItem( PlayerID , 203591 , 2 ) --7天小型駕馭藥劑*2
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7]) then
		GiveBodyItem( PlayerID , 201238 , 1 ) --進階防具打孔器*1
		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8]) then
		GiveBodyItem( PlayerID , 203054 , 1 ) --進階首飾打孔器*1
		elseif RAND > (100 -  probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8] - probability[9]) then
		GiveBodyItem( PlayerID , 202903 , 30 ) --傳送者符文*30
		else
		GiveBodyItem( PlayerID , 202435 , 20 ) --家的羈絆*20
		end
	end
end

Function LuaI_206542(Option) --暖冬馴鹿驚喜蛋
	local PlayerID = OwnerID()
	local PackageID = 206542
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local probability = {	5,		-- 
				3,  	       	-- 
				5,
			                5,
			              10,
			              12,
			              15,
			              15,
			              15,
			              15}       		-- 

	local RAND = rand(100)
	local Name = GetName( OwnerID() ) 
	local Item_Name
	local String
	local Package_String = "[206542]"


	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
		GiveBodyItem( PlayerID , 203555 , 1 ) --永久暖冬馴鹿坐騎*1

		Item_Name = "[203555]"
		String = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..Name.."][$SETVAR2="..Package_String.."][$SETVAR3="..Item_Name.."]" -- 
		RunningMsg( OwnerID() , 2 , String )
		elseif RAND > (100 - probability[1] - probability[2]) then
		GiveBodyItem( PlayerID , 202929 , 1 ) --魔幻寶盒能量50點*1

		Item_Name = "[202929]"
		String = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..Name.."][$SETVAR2="..Package_String.."][$SETVAR3="..Item_Name.."]" -- 
		RunningMsg( OwnerID() , 2 , String )
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then
		GiveBodyItem( PlayerID , 222926 , 1 ) --初級技能護符*1

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4]) then
		GiveBodyItem( PlayerID , 222925 , 1 ) --初級經驗護符*1

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5]) then
		GiveBodyItem( PlayerID , 201088 , 1 ) --進階武器打孔器*1

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6]) then
		GiveBodyItem( PlayerID , 203591 , 2 ) --7天小型駕馭藥劑*2

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7]) then
		GiveBodyItem( PlayerID , 201238 , 1 ) --進階防具打孔器*1

		elseif RAND > (100 - probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8]) then
		GiveBodyItem( PlayerID , 203054 , 1 ) --進階首飾打孔器*1

		elseif RAND > (100 -  probability[1] - probability[2] - probability[3] - probability[4] - probability[5] - probability[6] - probability[7] - probability[8] - probability[9]) then
		GiveBodyItem( PlayerID , 202903 , 30 ) --傳送者符文*30

		else
		GiveBodyItem( PlayerID , 202435 , 20 ) --家的羈絆*20

		end
	end
end