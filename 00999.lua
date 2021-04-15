function LuaI_helloCool( Option )
	local PlayerID = OwnerID()
	local PackageID = 203238		--南瓜酷裝禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	local KEY =  CountBodyItem( PlayerID , 203178 ) --古老的鑰匙
	local SEX = ReadRoleValue( OwnerID()  ,EM_RoleValue_SEX) 


	local Item = {	724055,		-- 酷面具
			724056,		-- 男南瓜裝
			724057,		-- 男惡魔裝
			724877,		-- 女南瓜裝
			724879	}	-- 女惡魔裝

	local probability = {	40,		-- 
			30,  	       	-- 
			30	}       	-- 

	local RAND = rand(100)

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and ( CountBodyItem( PlayerID , 203178 ) >= 1 ) then
			return true
		else

			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_30]" , 0 ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_30]" , 0 ) 
			return false
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )

				
		elseif RAND > (100 - probability[1] - probability[2]) then

			if SEX == 0 then
			GiveBodyItem( PlayerID , Item[2] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
			else
			GiveBodyItem( PlayerID , Item[4] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )	
			end
				
		else
			if SEX == 0 then
			GiveBodyItem( PlayerID , Item[3] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
			else
			GiveBodyItem( PlayerID , Item[5] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )	
			end	
		end
	end
end