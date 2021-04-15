function LuaI_GoldenBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 203472		--金色暖冬禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	local Item = {	720289,		-- 煙火
			720290,		-- 轉蛋用
			720288		-- 補品(10罐裝)
				}	-- 聖誕裝 分角色性別男女給

	local probability = {	35,		-- 
			30,  	       	-- 
			25,             	-- 
			10	}       	-- 

	local RAND = rand(100)

	if ( Option == "CHECK" ) then
		local KEY =  CountBodyItem( PlayerID , 203178 ) --古老的鑰匙
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) and KEY > 0 then
			return true
		else
			ScriptMessage( PlayerID, PlayerID, 0, GetString("SC_TREASURE_NOKEY"), 0 )		--你沒有古老的鑰匙
			return false
		end
	elseif ( Option == "USE" ) then
		if RAND > (100 - probability[1]) then
			GiveBodyItem( PlayerID , Item[1] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )

				
		elseif RAND > (100 - probability[1] - probability[2]) then
			GiveBodyItem( PlayerID , Item[2] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )
				
		elseif RAND > (100 - probability[1] - probability[2] - probability[3]) then
			GiveBodyItem( PlayerID , Item[3] , 1 )	
			DelBodyItem( PlayerID , 203178 , 1 )	
				
		else
			local SEX = ReadRoleValue(PlayerID , EM_RoleValue_SEX )

			if SEX == 0 then
				GiveBodyItem( PlayerID , 720296 , 1 )	--男裝
				DelBodyItem( PlayerID , 203178 , 1 )	
			elseif SEX == 1 then
				GiveBodyItem( PlayerID , 720297 , 1 )	--女裝
				DelBodyItem( PlayerID , 203178 , 1 )	
			end			
		end
	end
end